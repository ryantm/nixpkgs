# Writing Tests {#sec-writing-nixos-tests}

A NixOS test is a module that has the following structure:

``` nix
{
  # QEMU virtual machines:
  nodes = {
    vm1 =
      { config, pkgs, ... }:
      {
        # ...
      };
    vm2 =
      { config, pkgs, ... }:
      {
        # ...
      };
    # …
  };

  # systemd-nspawn containers:
  containers = {
    container1 =
      { config, pkgs, ... }:
      {
        # ...
      };
    container2 =
      { config, pkgs, ... }:
      {
        # ...
      };
  };

  testScript = ''
    Python code…
  '';
}
```

We refer to the whole test above as a test module, whereas the values
in [`nodes.<name>`](#test-opt-nodes) and [`containers.<name>`](#test-opt-containers)
are NixOS modules themselves.

The option [`testScript`](#test-opt-testScript) is a piece of Python code that executes the
test (described [below](#ssec-test-script)). During the test, it will start one or more
virtual machines and/or `systemd-nspawn` containers, the configuration of which is described by
the options [`nodes`](#test-opt-nodes) and [`containers`](#test-opt-containers), respectively.

An example of a single-node test is
[`login.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/tests/login.nix).
It only needs a single machine to test whether users can log in
on the virtual console, whether device ownership is correctly maintained
when switching between consoles, and so on. An interesting multi-node test is
[`nfs/simple.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/tests/nfs/simple.nix).
It uses two client nodes to test correct locking across server crashes.

A test can contain both virtual machines and containers.
If configured to share a common VLAN,
they can reach each other over the network.
See [](https://github.com/applicative-systems/nixpkgs/blob/78100f9077ab50604ab9c9514e442bbc7ac7ca5b/nixos/tests/nixos-test-driver/containers.nix)
for an example of this and [Running Tests](../../development/running-nixos-tests/index.md#sec-running-nixos-tests-requirements) for the system requirements for this scenario.

## Calling a test {#sec-calling-nixos-tests}

Tests are invoked differently depending on whether the test is part of NixOS or lives in a different project.

### Testing within NixOS {#sec-call-nixos-test-in-nixos}

Tests that are part of NixOS are added to [`nixos/tests/all-tests.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/tests/all-tests.nix).

``` nix
{ hostname = runTest ./hostname.nix; }
```

Overrides can be added by defining an anonymous module in `all-tests.nix`.

``` nix
{
  hostname = runTest {
    imports = [ ./hostname.nix ];
    defaults.networking.firewall.enable = false;
  };
}
```

You can run a test with attribute name `hostname` in `nixos/tests/all-tests.nix` by invoking:

``` shell
cd /my/git/clone/of/nixpkgs
nix-build -A nixosTests.hostname
```

In-tree tests run with a few changes to defaults, notably

- The `pkgs.*` are read only by default. You can opt out with `node.pkgsReadOnly = false;` at the test level.
- `nix.enable` defaults to `false` to reduce build closure size; in particular the reverse build closure of `nix` and its dependencies.

### Testing outside the NixOS project {#sec-call-nixos-test-outside-nixos}

Outside the `nixpkgs` repository, you can use the `runNixOSTest` function from
`pkgs.testers`:

``` nix
let
  pkgs = import <nixpkgs> { };

in
pkgs.testers.runNixOSTest {
  name = "test";
  imports = [ ./test.nix ];
  defaults.services.foo.package = mypkg;
}
```

`runNixOSTest` returns a derivation that runs the test.

Out-of-tree tests evaluate with a set of defaults that balances the principle of least surprise in the general case, but has a few differences from in-tree NixOS tests. See [Testing within NixOS](#sec-call-nixos-test-in-nixos).

## Test machines {#ssec-nixos-test-machines}

A NixOS test usually consists of one or more test machines. Each machine is either a
QEMU virtual machine or a `systemd-nspawn` container.

QEMU virtual machines are defined in the
[`nodes`](#test-opt-nodes) attribute set, whereas `systemd-nspawn` containers are defined in the
[`containers`](#test-opt-containers) attribute set.

To set NixOS options for all machines in the test, use the attribute
[`defaults`](#test-opt-defaults). These options are applied to both virtual machines
and containers. You can set separate defaults for virtual machines and containers
using the attributes [`nodeDefaults`](#test-opt-nodeDefaults) and
[`containerDefaults`](#test-opt-containerDefaults), respectively.

### Virtual machines vs. containers {#sec-nixos-test-vms-vs-containers}

QEMU virtual machines and `systemd-nspawn` containers offer different
trade-offs which make them suitable for different use cases.

Some advantages of containers over virtual machines are:

- Containers share the kernel of the host system; they are
  significantly faster to start up than virtual machines.
- Containers are more lightweight in terms of resource usage, which
  allows running more of them in parallel on a single host.
- Containers can easily be run in virtualised environments, e.g., CI systems.
- Containers allow direct bind-mounting of host device nodes, which enables
  testing of GPU code (CUDA), for example.

Some advantages of virtual machines over containers are:

- Virtual machines run a separate kernel, which allows testing kernel features
  (kernel modules, etc.).
- Virtual machines allow testing NixOS modules that use systemd's namespacing options (such as `ProtectSystem=` or `MountAPIVFS=`).
- Virtual machines allow testing [`specialisation`](../../options/other/index.md#opt-specialisation).
  (Switching to a specialisation requires the creation of SUID/SGID wrappers, which is disallowed in `systemd-nspawn` within the Nix sandbox.)
- Virtual machines allow the execution of `setuid` binaries.

Both backends support testing graphical applications on X11. Virtual machines
provide emulated display hardware, while containers use a headless X server.
See [running tests interactively](../../development/running-nixos-tests-interactively/index.md#sec-nixos-test-interactive-graphical) for how
to view container displays during debugging.

Refer to the sections on [QEMU virtual machines](#ssec-nixos-test-qemu-vms)
and [systemd-nspawn containers](#ssec-nixos-test-nspawn-containers) below
for more details on configuring each type of machine.

### Configuring test machines {#sec-nixos-test-machines-config}

The following special NixOS option can be used to configure
machines in a NixOS test, whether they are virtual machines or containers:

`virtualisation.vlans`
: The virtual networks to which the VM is connected. See
[`nat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/tests/nat.nix)
for an example.

#### Configuring `systemd-nspawn` containers {#ssec-nixos-test-nspawn-containers}

Some options are specific to `systemd-nspawn` containers:

`virtualisation.systemd-nspawn.options`
: A list of additional command-line options to pass to
`systemd-nspawn` when starting the container. For example, to
bind mount a directory from the host into the container, you could
use: `[ "--bind=/host/dir:/container/dir" ]`.

For more options, see the module
[`nspawn-container`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/nspawn-container/default.nix).

Note that the paths used in `--bind` or `--bind-ro` options have to be accessible from within the Nix sandbox.
Use the Nix option
[`sandbox-paths`](https://nix.dev/manual/nix/stable/command-ref/conf-file#conf-sandbox-paths)
and/or the module [`programs.nix-required-mounts`](../../options/programs/index.md#opt-programs.nix-required-mounts.enable) on the host
to add additional paths to the sandbox.

#### Configuring QEMU virtual machines {#ssec-nixos-test-qemu-vms}

Some options are specific to QEMU virtual machines:

`virtualisation.memorySize`
: The memory of the VM in MiB (1024×1024 bytes).

`virtualisation.writableStore`
: By default, the Nix store in the VM is not writable. If you enable
this option, a writable union file system is mounted on top of the
Nix store to make it appear writable. This is necessary for tests
that run Nix operations that modify the store.

For more options, see the module
[`qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix).

## Writing the test script {#ssec-test-script}

The test script is a sequence of Python statements that perform various
actions, such as starting machines, executing commands in them, and so on. For
example, if you specified a virtual machine in `nodes.machine`, there will be
a Python variable `machine` available in the test script that represents that
virtual machine. The following example would start the machine, wait until it
has finished booting, and then execute a command and check that the output is
more-or-less correct:

``` py
machine.start()
machine.wait_for_unit("default.target")
t.assertIn("Linux", machine.succeed("uname"), "Wrong OS")
```

The first line is technically unnecessary; machines are implicitly started
when you first execute an action on them (such as `wait_for_unit` or
`succeed`). If you have multiple machines, you can speed up the test by
starting them in parallel:

``` py
start_all()
```

Under the variable `t`, all assertions from [`unittest.TestCase`](https://docs.python.org/3/library/unittest.html) are available.

If the hostname of a machine contains characters that can't be used in a
Python variable name, those characters will be replaced with
underscores in the variable name, so `nodes.machine-a` will be exposed
to Python as `machine_a`.

### Methods available on machine objects {#ssec-machine-objects}

The following methods are available on machine objects (like `machine` in
the examples above):

#### Generic machine objects {#ssec-all-machine-objects}

copy\_from\_host(source, target)
: Copies a file from host to machine, e.g.,
`copy_from_host("myfile", "/etc/my/important/file")`.

The first argument is the file on the host. Note that the "host" refers
to the environment in which the test driver runs, which is typically the
Nix build sandbox.

The second argument is the location of the file on the machine that will
be written to.

The file is copied via the `shared_dir` directory which is shared among
all the machines (using a temporary directory).
The access rights bits will mimic the ones from the host file and
user:group will be root:root.

copy\_from\_host\_via\_shell(source, target)
: Copy a file from the host into the guest by piping it over the
shell into the destination file. Works without host-guest shared folder.
Prefer copy\_from\_host for whenever possible.

copy\_from\_machine(source, target\_dir)
: Copy a file from the machine (specified by an in-machine source path) to a path
relative to `$out`. The file is copied via the `shared_dir` shared among
all the machines.

execute(command, check\_return, check\_output, timeout)
: Execute a shell command, returning a list `(status, stdout)`.

Commands are run with `set -euo pipefail` set:

- If several commands are separated by `;` and one fails, the
  command as a whole will fail.

- For pipelines, the last non-zero exit status will be returned
  (if there is one; otherwise zero will be returned).

- Dereferencing unset variables fails the command.

- It will wait for stdout to be closed.

If the command detaches, it must close stdout, as `execute` will wait
for this to consume all output reliably. This can be achieved by
redirecting stdout to stderr `>&2`, to `/dev/console`, `/dev/null` or
a file. Examples of detaching commands are `sleep 365d &`, where the
shell forks a new process that can write to stdout and `xclip -i`, where
the `xclip` command itself forks without closing stdout.

Takes an optional parameter `check_return` that defaults to `True`.
Setting this parameter to `False` will not check for the return code
and return -1 instead. This can be used for commands that shut down
the machine and would therefore break the pipe that would be used for
retrieving the return code.

Has a default timeout of 15 minutes which can be modified.
Example:
\`\`\`py
import datetime as dt

    execute(cmd, timeout=dt.timedelta(seconds=10))
    execute(cmd, timeout=None)
    ```

A bare number is still accepted and interpreted as a number of seconds.

fail()
: Like `succeed`, but raising an exception if the command returns a zero
status.

get\_screen\_text()
: Return a textual representation of what is currently visible on the
machine's screen using optical character recognition.

::: note
This requires [`enableOCR`](#test-opt-enableOCR) to be set to `true`.
:::

get\_screen\_text\_variants()
: Return a list of different interpretations of what is currently
visible on the machine's screen using optical character
recognition. The number and order of the interpretations is not
specified and is subject to change, but if no exception is raised at
least one will be returned.

::: note
This requires [`enableOCR`](#test-opt-enableOCR) to be set to `true`.
:::

get\_unit\_info(unit, user)
: Get a dictionary of systemd unit properties, as obtained via `systemctl show`.

get\_unit\_property(unit, property, user)
: Get the string value of a single systemd unit property

log(msg)
: Log a message to console.

nested(msg, attrs)
: Get nested logger, optionally with extra attributes.

require\_unit\_state(unit, require\_state)
: Assert that the current state of a unit has a specific value. The default state is "active".

screenshot(filename)
: Take a picture of the display of the machine, in PNG format.
The screenshot will be available in the derivation output.

send\_chars(chars, delay)
: Simulate typing a sequence of characters on the virtual keyboard,
e.g., `send_chars("foobar\n")` will type the string `foobar`
followed by the Enter key.

send\_key(key, delay, log)
: Simulate pressing a key or key chord, e.g.,
`send_key("ctrl-alt-delete")`.

Key names follow QEMU's sendkey vocabulary: `ret` means Enter and
`spc` means Space. Named keys and modifiers are case-sensitive;
use lowercase names, e.g. `f1` or `ctrl-alt-f1`. Literal characters
preserve case: `F` types uppercase F, while `f` types lowercase f.
See https://www.qemu.org/docs/master/interop/qemu-qmp-ref.html#enum-QKeyCode.

Portable key names include printable ASCII characters, function keys,
`tab`, `ret`, `esc`, `spc`, `backspace`, `delete`, `left`, `right`,
`up`, `down`, and `kp_enter`. Chords may use the `ctrl`, `alt`,
`shift`, `meta_l`, and `meta_r` modifiers. Machine backends may accept
additional key names.

shutdown()
: Shutdown the machine gracefully, waiting for it to exit.

start()
: Start the machine. This method is asynchronous --- it does
not wait for the machine to finish booting.

start\_job(jobname, user)
: Start systemd service.

stop\_job(jobname, user)
: Stop systemd service.

succeed()
: Execute a shell command, raising an exception if the exit status is
not zero, otherwise returning the standard output. Similar to `execute`,
except that the timeout is `None` by default. See `execute` for details on
command execution.

systemctl(q, user)
: Runs `systemctl` commands with optional support for
`systemctl --user`

``` py
# run `systemctl list-jobs --no-pager`
machine.systemctl("list-jobs --no-pager")

# spawn a shell for `any-user` and run
# `systemctl --user list-jobs --no-pager`
machine.systemctl("list-jobs --no-pager", "any-user")
```

wait\_for\_closed\_port(port, addr, timeout)
: Wait until nobody is listening on the given TCP port and IP address
(default `localhost`).

wait\_for\_file(filename, timeout)
: Waits until the file exists in the machine's file system.

wait\_for\_open\_port(port, addr, timeout)
: Wait until a process is listening on the given TCP port and IP address
(default `localhost`).

wait\_for\_open\_unix\_socket(addr, is\_datagram, timeout)
: Wait until a process is listening on the given UNIX-domain socket
(default to a UNIX-domain stream socket).

wait\_for\_shutdown(timeout)
: Wait for the machine to power off. This does *not* initiate a shutdown;
that's usually done via `shutdown()`.

wait\_for\_text(regex, timeout)
: Wait until the supplied regular expressions matches the textual
contents of the screen by using optical character recognition (see
`get_screen_text` and `get_screen_text_variants`).

::: note
This requires [`enableOCR`](#test-opt-enableOCR) to be set to `true`.
:::

wait\_for\_unit(unit, user, timeout)
: Wait for a systemd unit to get into "active" state.
Throws exceptions on "failed" and "inactive" states as well as after
timing out.

wait\_for\_window(regexp, timeout)
: Wait until an X11 window has appeared whose name matches the given
regular expression, e.g., `wait_for_window("Terminal")`.

wait\_until\_fails(command, timeout)
: Like `wait_until_succeeds`, but repeating the command until it fails.

wait\_until\_succeeds(command, timeout)
: Repeat a shell command on 1-second intervals until it succeeds.
Has a default timeout of 15 minutes which can be modified.
Example:
\`\`\`py
import datetime as dt

    wait_until_succeeds(cmd, timeout=dt.timedelta(seconds=10))
    ```

A bare number is still accepted and interpreted as a number of seconds.
See `execute` for details on command execution.
Throws an exception on timeout.

#### QEMU VM objects {#ssec-qemu-machine-objects}

block()
: Simulate unplugging the Ethernet cable that connects the machine to
the other machines.
This happens by shutting down eth1 (the multicast interface used to talk
to the other VMs). eth0 is kept online to still enable the test driver
to communicate with the machine.

connect()
: Wait for a connection to the guest root shell

console\_interact()
: Allows you to directly interact with QEMU's stdin, by forwarding
terminal input to the QEMU process.
This is for use with the interactive test driver, not for production
tests, which run unattended.
Output from QEMU is only read line-wise. `Ctrl-c` kills QEMU and
`Ctrl-d` closes console and returns to the test runner.

crash()
: Simulate a sudden power failure, by telling the VM to exit immediately.

dump\_tty\_contents(tty)
: Debugging: Dump the contents of the TTY<n>

forward\_port(host\_port, guest\_port)
: Forward a TCP port on the host to a TCP port on the guest.
Useful during interactive testing.

get\_console\_log()
: Get the full console output from the machine since boot.
Returns all serial console output as a single string.

get\_tty\_text(tty)
: Get the output printed to a given TTY.

reboot()
: Press Ctrl+Alt+Delete in the guest.

Prepares the machine to be reconnected which is useful if the
machine was started with `allow_reboot = True`

send\_console(chars)
: Send keys to the kernel console. This allows interaction with the systemd
emergency mode, for example. Takes a string that is sent, e.g.,
`send_console("\n\nsystemctl default\n")`.

send\_monitor\_command(command)
: Send a command to the QEMU monitor. This allows attaching
virtual USB disks to a running machine, among other things.

shell\_interact(address)
: Allows you to directly interact with the guest shell. This should
only be used during test development, not in production tests.
Killing the interactive session with `Ctrl-d` or `Ctrl-c` also ends
the guest session.

switch\_root()
: Transition from stage 1 to stage 2. This requires the
machine to be configured with `testing.initrdBackdoor = true`.

unblock()
: Undo the effect of `block`.

wait\_for\_console\_text(regex, timeout)
: Wait until the supplied regular expressions match a line of the
serial console output.
This method is useful when OCR is not possible or inaccurate.

When this method returns, the console output that includes the match has already become part of get\_console\_log().

wait\_for\_qmp\_event(event\_filter, timeout)
: Wait for a QMP event which you can filter with the `event_filter` function.
The function takes as an input a dictionary of the event and if it returns True, we return that event,
if it does not, we wait for the next event and retry.

It will skip all events received in the meantime, if you want to keep them,
you have to do the bookkeeping yourself and store them somewhere.

By default, it will wait up to 10 minutes.

wait\_for\_x(timeout)
: Wait until it is possible to connect to the X server.

wait\_until\_tty\_matches(tty, regexp, timeout)
: Wait until the visible output on the chosen TTY matches regular
expression. Throws an exception on timeout.

#### `systemd-nspawn` container objects {#ssec-nspawn-machine-objects}

get\_systemd\_process()
: Block until startup is complete and return the PID of the container's systemd process.

Readiness and the leader PID are reported over NOTIFY\_SOCKET, which is
drained by `_drain_notify_socket` (started in `start()`); we just wait
for that thread to record both.

wait\_for\_x(timeout)
: Wait until it is possible to connect to the X server.

### Testing user units {#ssec-testing-user-units}

To test user units declared by `systemd.user.services` the optional
`user` argument can be used:

``` py
machine.start()
machine.wait_for_x()
machine.wait_for_unit("xautolock.service", "x-session-user")
```

This applies to `systemctl`, `get_unit_info`, `wait_for_unit`,
`start_job` and `stop_job`.

### Failing tests early {#ssec-failing-tests-early}

To fail tests early when certain invariants are no longer met (instead of waiting for the build to time out), the decorator `polling_condition` is provided. For example, if we are testing a program `foo` that should not quit after being started, we might write the following:

``` py
@polling_condition
def foo_running():
    machine.succeed("pgrep -x foo")


machine.succeed("foo --start")
machine.wait_until_succeeds("pgrep -x foo")

with foo_running:
    ...  # Put `foo` through its paces
```

`polling_condition` takes the following (optional) arguments:

`interval`
: specifies how often the condition should be polled, as a `datetime.timedelta`:

``` py
import datetime as dt


@polling_condition(interval=dt.timedelta(seconds=10))
def foo_running():
    machine.succeed("pgrep -x foo")
```

`description`
: is used in the log when the condition is checked. If this is not provided, the description is pulled from the docstring of the function. These two are therefore equivalent:

``` py
@polling_condition
def foo_running():
    "check that foo is running"
    machine.succeed("pgrep -x foo")
```

``` py
@polling_condition(description="check that foo is running")
def foo_running():
    machine.succeed("pgrep -x foo")
```

### Adding Python packages to the test script {#ssec-python-packages-in-test-script}

When additional Python libraries are required in the test script, they can be
added using the parameter `extraPythonPackages`. For example, you could add
`numpy` like this:

``` nix
{
  extraPythonPackages = p: [ p.numpy ];

  nodes = { };

  # Type checking on extra packages doesn't work yet
  skipTypeCheck = true;

  testScript = ''
    import numpy as np
    assert str(np.zeros(4)) == "[0. 0. 0. 0.]"
  '';
}
```

In that case, `numpy` is chosen from the generic `python3Packages`.

### Linting and type checking test scripts {#ssec-test-script-checks}

Test scripts are automatically linted with
[Pyflakes](https://pypi.org/project/pyflakes/) and type-checked with
[Mypy](https://mypy.readthedocs.io/en/stable/).
If there are any linting or type checking errors, the test will
fail to evaluate.

For faster dev cycles it's also possible to disable the code-linters
(this shouldn't be committed though):

``` nix
{
  skipLint = true;
  nodes.machine =
    { config, pkgs, ... }:
    {
      # configuration…
    };

  testScript = ''
    Python code…
  '';
}
```

This will produce a Nix warning at evaluation time. To fully disable the
linter, wrap the test script in comment directives to disable the Black
linter directly (again, don't commit this within the Nixpkgs
repository):

``` nix
{
  testScript = ''
    # fmt: off
    Python code…
    # fmt: on
  '';
}
```

Similarly, the type checking of test scripts can be disabled in the following
way:

``` nix
{
  skipTypeCheck = true;
  nodes.machine =
    { config, pkgs, ... }:
    {
      # configuration…
    };
}
```

## Overriding a test {#sec-override-nixos-test}

The NixOS test framework returns tests with multiple overriding methods.

`overrideTestDerivation` *function*
: Like applying `overrideAttrs` on the [test](#test-opt-test) derivation.

This is a convenience for `extend` with an override on the [`rawTestDerivationArg`](#test-opt-rawTestDerivationArg) option.

*function*
: An extension function, e.g. `finalAttrs: prevAttrs: { /* … */ }`, the result of which is passed to [`mkDerivation`](https://nixos.org/manual/nixpkgs/stable/#sec-using-stdenv).
Just as with `overrideAttrs`, an abbreviated form can be used, e.g. `prevAttrs: { /* … */ }` or even `{ /* … */ }`.
See [`lib.extends`](https://nixos.org/manual/nixpkgs/stable/#function-library-lib.fixedPoints.extends).

`extendNixOS { module = ` *module* `; specialArgs = ` *specialArgs* `; }`
: Evaluates the test with additional NixOS modules and/or arguments.

`module`
: A NixOS module to add to all the machines in the test. Sets test option [`extraBaseModules`](#test-opt-extraBaseModules).

`specialArgs`
: An attribute set of arguments to pass to all NixOS modules. These override the existing arguments, as well as any `_module.args.<name>` that the modules may define. Sets test option [`node.specialArgs`](#test-opt-node.specialArgs).

This is a convenience function for `extend` that overrides the aforementioned test options.

::: {.example #ex-nixos-test-extendNixOS}
# Using extendNixOS in `passthru.tests` to make `(openssh.tests.overrideAttrs f).tests.nixos` coherent

``` nix
mkDerivation (finalAttrs: {
  # …
  passthru = {
    tests = {
      nixos = nixosTests.openssh.extendNixOS {
        module = {
          services.openssh.package = finalAttrs.finalPackage;
        };
      };
    };
  };
})
```
:::

`extend { modules = ` *modules* `; specialArgs = ` *specialArgs* `; }`
: Adds new `nixosTest` modules and/or module arguments to the test, which are evaluated together with the existing modules and [built-in options](#sec-test-options-reference).

If you're only looking to extend the *NixOS* configurations of the test, and not something else about the test, you may use the `extendNixOS` convenience function instead.

`modules`
: A list of modules to add to the test. These are added to the existing modules and then [evaluated](https://nixos.org/manual/nixpkgs/stable/index.html#module-system-lib-evalModules) together.

`specialArgs`
: An attribute of arguments to pass to the test. These override the existing arguments, as well as any `_module.args.<name>` that the modules may define. See [`evalModules`/`specialArgs`](https://nixos.org/manual/nixpkgs/stable/#module-system-lib-evalModules-param-specialArgs).

## Test Options Reference {#sec-test-options-reference}

The following options can be used when writing tests.

### `containerDefaults` {#test-opt-containerDefaults}

NixOS configuration that is applied to all \[[`containers`](../../options/containers/index.md#opt-containers)\](#test-opt-containers).

*Type:* module

*Default:* `{ }`

*Declared by:* [`nixos/lib/testing/nodes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/nodes.nix)

### `containers` {#test-opt-containers}

An attribute set of NixOS configuration modules representing systemd-nspawn containers that can be started during a test.

The configurations are augmented by the [`defaults`](#test-opt-defaults) option.

They are assigned network addresses according to the `nixos/lib/testing/network.nix` module.

A few special options are available, that aren't in a plain NixOS configuration. See [Configuring containers](#ssec-nixos-test-nspawn-containers)

*Type:* lazy attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/lib/testing/nodes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/nodes.nix)

### `defaults` {#test-opt-defaults}

NixOS configuration that is applied to all [`nodes`](#test-opt-nodes) and \[[`containers`](../../options/containers/index.md#opt-containers)\](#test-opt-containers).

*Type:* module

*Default:* `{ }`

*Declared by:* [`nixos/lib/testing/nodes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/nodes.nix)

### `driver` {#test-opt-driver}

Package containing a script that runs the test.

*Type:* package

*Default:* set by the test framework

*Declared by:* [`nixos/lib/testing/driver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/driver.nix)

### `enableDebugHook` {#test-opt-enableDebugHook}

Halt test execution after any test fail and provide the possibility to
hook into the sandbox to connect with either the test driver via
`socat readline tcp:127.0.0.1:4444` or with the VMs via SSH and vsocks
(see also `sshBackdoor.enable`).

When using this option, consider running tests with build log output
enabled and without remote builders. Otherwise you will not see the
command required to attach to the test controller, and you cannot
connect to the test controller, respectively.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/lib/testing/run.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/run.nix)

### `enableOCR` {#test-opt-enableOCR}

Whether to enable Optical Character Recognition functionality for
testing graphical programs. See [`Machine objects`](#ssec-machine-objects).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/lib/testing/driver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/driver.nix)

### `extraBaseModules` {#test-opt-extraBaseModules}

NixOS configuration that, like [`defaults`](#test-opt-defaults), is applied to all [`nodes`](#test-opt-nodes) and \[[`containers`](../../options/containers/index.md#opt-containers)\](#test-opt-containers) and can not be undone with [`specialisation.<name>.inheritParentConfig`](https://search.nixos.org/options?show=specialisation.%3Cname%3E.inheritParentConfig&from=0&size=50&sort=relevance&type=packages&query=specialisation).

*Type:* module

*Default:* `{ }`

*Declared by:* [`nixos/lib/testing/nodes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/nodes.nix)

### `extraBaseNodeModules` {#test-opt-extraBaseNodeModules}

NixOS configuration that, like [`defaults`](#test-opt-defaults), is applied to all [`nodes`](#test-opt-nodes) and can not be undone with [`specialisation.<name>.inheritParentConfig`](https://search.nixos.org/options?show=specialisation.%3Cname%3E.inheritParentConfig&from=0&size=50&sort=relevance&type=packages&query=specialisation).

*Type:* module

*Default:* `{ }`

*Declared by:* [`nixos/lib/testing/nodes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/nodes.nix)

### `extraDriverArgs` {#test-opt-extraDriverArgs}

Extra arguments to pass to the test driver.

They become part of [`driver`](#test-opt-driver) via `wrapProgram`.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/lib/testing/driver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/driver.nix)

### `extraPythonPackages` {#test-opt-extraPythonPackages}

Python packages to add to the test driver.

The argument is a Python package set, similar to `pkgs.pythonPackages`.

*Type:* function that evaluates to a(n) list of package

*Default:* `<function>`

*Example:*

``` nix
p: [ p.numpy ]
```

*Declared by:* [`nixos/lib/testing/driver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/driver.nix)

### `globalTimeout` {#test-opt-globalTimeout}

A global timeout for the complete test, expressed in seconds.
Beyond that timeout, every resource will be killed and released and the test will fail.

By default, we use a 1 hour timeout.

*Type:* signed integer

*Default:* `3600`

*Example:* `600`

*Declared by:* [`nixos/lib/testing/driver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/driver.nix)

### `hostPkgs` {#test-opt-hostPkgs}

Nixpkgs attrset used outside the nodes.

*Type:* raw value

*Example:*

``` nix
import nixpkgs { inherit system config overlays; }
```

*Declared by:* [`nixos/lib/testing/driver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/driver.nix)

### `interactive` {#test-opt-interactive}

Tests [can be run interactively](../../development/running-nixos-tests-interactively/index.md#sec-running-nixos-tests-interactively)
using the program in the test derivation's `.driverInteractive` attribute.

When they are, the configuration will include anything set in this submodule.

You can set any top-level test option here.

Example test module:

``` nix
{ config, lib, ... }: {

  nodes.rabbitmq = {
    services.rabbitmq.enable = true;
  };

  # When running interactively ...
  interactive.nodes.rabbitmq = {
    # ... enable the web ui.
    services.rabbitmq.managementPlugin.enable = true;
  };
}
```

For details, see the section about [running tests interactively](../../development/running-nixos-tests-interactively/index.md#sec-running-nixos-tests-interactively).

*Type:* submodule

*Declared by:* [`nixos/lib/testing/interactive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/interactive.nix)

### `logLevel` {#test-opt-logLevel}

Log level for the test driver.

*Type:* one of "debug", "info", "warning", "error"

*Default:* `"info"`

*Example:* `"warning"`

*Declared by:* [`nixos/lib/testing/driver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/driver.nix)

### `meta` {#test-opt-meta}

The [`meta`](https://nixos.org/manual/nixpkgs/stable/#chap-meta) attributes that will be set on the returned derivations.

Not all [`meta`](https://nixos.org/manual/nixpkgs/stable/#chap-meta) attributes are supported, but more can be added as desired.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/lib/testing/meta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/meta.nix)

### `meta.broken` {#test-opt-meta.broken}

Sets the [`meta.broken`](https://nixos.org/manual/nixpkgs/stable/#var-meta-broken) attribute on the [`test`](#test-opt-test) derivation.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/lib/testing/meta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/meta.nix)

### `meta.hydraPlatforms` {#test-opt-meta.hydraPlatforms}

Sets the [`meta.hydraPlatforms`](https://nixos.org/manual/nixpkgs/stable/#var-meta-hydraPlatforms) attribute on the [`test`](#test-opt-test) derivation.

*Type:* list of raw value

*Default:* `lib.platforms.linux` only, as the `hydra.nixos.org` build farm does not currently support virtualisation on Darwin.

*Declared by:* [`nixos/lib/testing/meta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/meta.nix)

### `meta.maintainers` {#test-opt-meta.maintainers}

The [list of maintainers](https://nixos.org/manual/nixpkgs/stable/#var-meta-maintainers) for this test.

*Type:* list of raw value

*Default:* `[ ]`

*Declared by:* [`nixos/lib/testing/meta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/meta.nix)

### `meta.platforms` {#test-opt-meta.platforms}

Sets the [`meta.platforms`](https://nixos.org/manual/nixpkgs/stable/#var-meta-platforms) attribute on the [`test`](#test-opt-test) derivation.

*Type:* list of raw value

*Default:* `lib.platforms.linux ++ lib.platforms.darwin` when no containers are configured; otherwise `lib.platforms.linux`.

*Declared by:* [`nixos/lib/testing/meta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/meta.nix)

### `meta.teams` {#test-opt-meta.teams}

The [list of maintainer-teams](https://nixos.org/manual/nixpkgs/stable/#var-meta-teams) for this test.

*Type:* list of raw value

*Default:* `[ ]`

*Declared by:* [`nixos/lib/testing/meta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/meta.nix)

### `meta.timeout` {#test-opt-meta.timeout}

The [`test`](#test-opt-test)'s [`meta.timeout`](https://nixos.org/manual/nixpkgs/stable/#var-meta-timeout) in seconds.

*Type:* null or signed integer

*Default:* `3600`

*Declared by:* [`nixos/lib/testing/meta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/meta.nix)

### `name` {#test-opt-name}

The name of the test.

This is used in the derivation names of the [`driver`](#test-opt-driver) and [`test`](#test-opt-test) runner.

*Type:* string

*Declared by:* [`nixos/lib/testing/name.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/name.nix)

### `node.pkgs` {#test-opt-node.pkgs}

The Nixpkgs to use for the nodes and containers.

Setting this will make the `nixpkgs.*` options read-only, to avoid mistakenly testing with a Nixpkgs configuration that diverges from regular use.

*Type:* null or Nixpkgs package set

*Default:* `null`, so construct `pkgs` according to the `nixpkgs.*` options as usual.

*Declared by:* [`nixos/lib/testing/nodes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/nodes.nix)

### `node.pkgsReadOnly` {#test-opt-node.pkgsReadOnly}

Whether to make the `nixpkgs.*` options read-only. This is only relevant when [`node.pkgs`](#test-opt-node.pkgs) is set.

Set this to `false` when any of the [`nodes`](#test-opt-nodes) or \[[`containers`](../../options/containers/index.md#opt-containers)\](#test-opt-containers) need to configure any of the `nixpkgs.*` options. This will slow down evaluation of your test a bit.

*Type:* boolean

*Default:* `node.pkgs != null`

*Declared by:* [`nixos/lib/testing/nodes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/nodes.nix)

### `node.specialArgs` {#test-opt-node.specialArgs}

An attribute set of arbitrary values that will be made available as module arguments during the resolution of module `imports`.

Note that it is not possible to override these from within the NixOS configurations. If you argument is not relevant to `imports`, consider setting `defaults._module.args.<name>` instead.

*Type:* lazy attribute set of raw value

*Default:* `{ }`

*Declared by:* [`nixos/lib/testing/nodes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/nodes.nix)

### `nodeDefaults` {#test-opt-nodeDefaults}

NixOS configuration that is applied to all [`nodes`](#test-opt-nodes).

*Type:* module

*Default:* `{ }`

*Declared by:* [`nixos/lib/testing/nodes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/nodes.nix)

### `nodes` {#test-opt-nodes}

An attribute set of NixOS configuration modules representing QEMU vms that can be started during a test.

The configurations are augmented by the [`defaults`](#test-opt-defaults) option.

They are assigned network addresses according to the `nixos/lib/testing/network.nix` module.

A few special options are available, that aren't in a plain NixOS configuration. See [Configuring virtual machines](#ssec-nixos-test-qemu-vms)

*Type:* lazy attribute set of module

*Default:* `{ }`

*Declared by:* [`nixos/lib/testing/nodes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/nodes.nix)

### `passthru` {#test-opt-passthru}

Attributes to add to the returned derivations,
which are not necessarily part of the build.

This is a bit like doing `drv // { myAttr = true; }` (which would be lost by `overrideAttrs`).
It does not change the actual derivation, but adds the attribute nonetheless, so that
consumers of what would be `drv` have more information.

*Type:* lazy attribute set of raw value

*Default:* `{ }`

*Declared by:* [`nixos/lib/testing/run.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/run.nix)

### `pythonTestDriverPackage` {#test-opt-pythonTestDriverPackage}

Package containing the python NixOS test driver implementation

*Type:* package

*Default:* `hostPkgs.nixos-test-driver`

*Read only*

*Declared by:* [`nixos/lib/testing/driver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/driver.nix)

### `qemu.forceAccel` {#test-opt-qemu.forceAccel}

Whether to force the use of hardware-accelerated virtualisation.
When enabled, QEMU will not fall back to the slower software emulation
(TCG) and will instead error out if the accelerator is not available.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/lib/testing/driver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/driver.nix)

### `qemu.package` {#test-opt-qemu.package}

Which qemu package to use for the virtualisation of [`nodes`](#test-opt-nodes).

*Type:* package

*Default:* `"hostPkgs.qemu_test"`

*Declared by:* [`nixos/lib/testing/driver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/driver.nix)

### `rawTestDerivationArg` {#test-opt-rawTestDerivationArg}

Argument passed to `mkDerivation` to create the `rawTestDerivation`.

*Type:* function that evaluates to a(n) raw value

*Declared by:* [`nixos/lib/testing/run.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/run.nix)

### `requiredFeatures` {#test-opt-requiredFeatures}

Builder features that are required for running this test.

*Type:* open submodule of attribute set of boolean

*Default:* `{ }`

*Example:*

``` nix
{
  cuda = true;
  devnet = mkForce false;
}
```

*Declared by:* [`nixos/lib/testing/run.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/run.nix)

### `requiredFeatures.apple-virt` {#test-opt-requiredFeatures.apple-virt}

Whether Apple virtualization functionality is required for running this test.

*Type:* boolean

*Default:* `true` if built to run on Darwin.

*Declared by:* [`nixos/lib/testing/run.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/run.nix)

### `requiredFeatures.devnet` {#test-opt-requiredFeatures.devnet}

This heuristic setting that assumes that the majority of tests requires VMs and containers
to communicate over network. To support such tests, adding "/dev/net" to `nix.settings.extra-sandbox-paths` is necessary.

Override this to `false` if the heuristic is wrong in some cases.

*Type:* boolean

*Default:* `true` if both VMs and containers are present.

*Declared by:* [`nixos/lib/testing/run.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/run.nix)

### `requiredFeatures.kvm` {#test-opt-requiredFeatures.kvm}

Whether Linux KVM virtualization is required when running this test. Can be disabled to allow emulated execution.

*Type:* boolean

*Default:* `true` if built to run on Linux and any virtual machines are specified.

*Declared by:* [`nixos/lib/testing/run.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/run.nix)

### `requiredFeatures.nixos-test` {#test-opt-requiredFeatures.nixos-test}

Standard requirement for NixOS integration tests

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/lib/testing/run.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/run.nix)

### `requiredFeatures.uid-range` {#test-opt-requiredFeatures.uid-range}

Containers use systemd-nspawn, which requires pid 0 inside of the sandbox. `uid-range` enables that.

*Type:* boolean

*Default:* `true` if containers are present.

*Declared by:* [`nixos/lib/testing/run.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/run.nix)

### `skipLint` {#test-opt-skipLint}

Do not run the linters. This may speed up your iteration cycle, but it is not something you should commit.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/lib/testing/driver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/driver.nix)

### `skipTypeCheck` {#test-opt-skipTypeCheck}

Disable type checking. This must not be enabled for new NixOS tests.

This may speed up your iteration cycle, unless you're working on the [`testScript`](#test-opt-testScript).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/lib/testing/driver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/driver.nix)

### `sshBackdoor.enable` {#test-opt-sshBackdoor.enable}

Whether to turn on the VSOCK-based access to all VMs. This provides an unauthenticated access intended for debugging.

*Type:* boolean

*Default:* `config.enableDebugHook`

*Declared by:* [`nixos/lib/testing/nodes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/nodes.nix)

### `test` {#test-opt-test}

Derivation that runs the test as its "build" process.

This implies that NixOS tests run isolated from the network, making them
more dependable.

*Type:* package

*Declared by:* [`nixos/lib/testing/run.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/run.nix)

### `testScript` {#test-opt-testScript}

A series of python declarations and statements that you write to perform
the test.

*Type:* (function that evaluates to a(n) strings concatenated with "
") or strings concatenated with "
" convertible to it

*Declared by:* [`nixos/lib/testing/testScript.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/testing/testScript.nix)

## Debugging test machines {#sec-test-sandbox-breakpoint}

You can set the [`enableDebugHook`](#test-opt-enableDebugHook) option to pause
a test on the first failure and have it print instructions on how to enter the
sandbox shell of the test. Suppose you have the following test module:

``` nix
{
  name = "foo";

  nodes.machine = { };

  enableDebugHook = true;
  sshBackdoor.enable = true;

  testScript = ''
    start_all()
    machine.succeed("false") # this will fail
  '';
}
```

The test will fail with an output like this:

```
vm-test-run-foo> !!! Breakpoint reached, run 'sudo /nix/store/eeeee-attach/bin/attach <PID>'
```

You can then enter the sandbox shell:

```
$ sudo /nix/store/eeeee-attach/bin/attach <PID>
bash#
```

There, you can attach to a [`pdb`](https://docs.python.org/3/library/pdb.html) session
to step through the Python test script:

```
bash# socat readline tcp:127.0.0.1:4444
pdb$
```

Note that it is also possible to set breakpoints in the test script using `debug.breakpoint()`.

### SSH access to test VMs {#sec-test-vm-ssh-access}

::: note
For debugging with SSH access into the machines, it's recommended to try using
[the interactive driver](../../development/running-nixos-tests-interactively/index.md#sec-running-nixos-tests-interactively) with its
[SSH backdoor](../../development/running-nixos-tests-interactively/index.md#sec-nixos-test-ssh-access) first.

This feature is mostly intended to debug flaky test failures that aren't
reproducible elsewhere.
:::

If you set the [`sshBackdoor.enable`](#test-opt-sshBackdoor.enable) option,
QEMU virtual machines will open an SSH backdoor based on AF\_VSOCK
(see [Running Tests interactively](../../development/running-nixos-tests-interactively/index.md#sec-nixos-test-ssh-access)).
Once you are in the sandbox shell, you can access the VMs (for example, `machine`)
with SSH over vsock:

```
bash# ssh -F ./ssh_config -o User=root vsock-mux//tmp/.../machine_host.socket
```

The socket paths are printed at the beginning of the test. See
[Running Tests interactively](../../development/running-nixos-tests-interactively/index.md#sec-nixos-test-ssh-access) for more context.

### SSH access to test containers {#sec-test-container-ssh-access}

If you set the [`sshBackdoor.enable`](#test-opt-sshBackdoor.enable) option,
each `systemd-nspawn` container will open an SSH backdoor.
Once the container starts,
it will print instructions on how to log into the container via SSH.
If the test fails,
attach to the sandbox as described above,
and then use the provided SSH command to log into the container.
For example:

```
$ sudo /nix/store/eeeee-attach <PID>
bash# ssh -o User=root -o ProxyCommand="socat - UNIX-CLIENT:/run/systemd/nspawn/unix-export/machine/ssh" bash
[root@machine:~]# hostname
machine
```
