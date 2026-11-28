# nix {#sec-options-nix}

## `nix.buildLogRetention` {#opt-nix.buildLogRetention}

How long to keep the build logs in `/nix/var/log/nix/drvs`,
as a systemd time span. `systemd-tmpfiles-clean` deletes older logs
daily, judged by modification time only, so reading a log does not
keep it. `null` keeps them forever.

*Type:* null or string

*Default:* `null`

*Example:* `"30d"`

*Declared by:* [`nixos/modules/services/system/nix-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nix-daemon.nix)

## `nix.buildMachines` {#opt-nix.buildMachines}

This option lists the machines to be used if distributed builds are
enabled (see [`nix.distributedBuilds`](#opt-nix.distributedBuilds)).
Nix will perform derivations on those machines via SSH by copying the
inputs to the Nix store on the remote machine, starting the build,
then copying the output back to the local Nix store.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/config/nix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix-remote-build.nix)

## `nix.buildMachines.*.hostName` {#opt-nix.buildMachines._.hostName}

The hostname of the build machine.

*Type:* string

*Example:* `"nixbuilder.example.org"`

*Declared by:* [`nixos/modules/config/nix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix-remote-build.nix)

## `nix.buildMachines.*.mandatoryFeatures` {#opt-nix.buildMachines._.mandatoryFeatures}

A list of features mandatory for this builder. The builder will
be ignored for derivations that don't require all features in
this list. All mandatory features are automatically included in
`supportedFeatures`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "big-parallel"
]
```

*Declared by:* [`nixos/modules/config/nix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix-remote-build.nix)

## `nix.buildMachines.*.maxJobs` {#opt-nix.buildMachines._.maxJobs}

The number of concurrent jobs the build machine supports. The
build machine will enforce its own limits, but this allows hydra
to schedule better since there is no work-stealing between build
machines.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/config/nix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix-remote-build.nix)

## `nix.buildMachines.*.protocol` {#opt-nix.buildMachines._.protocol}

The protocol used for communicating with the build machine.
Use `ssh-ng` if your remote builder and your
local Nix version support that improved protocol.

Use `null` when trying to change the special localhost builder
without a protocol which is for example used by hydra.

*Type:* one of <null>, "ssh", "ssh-ng"

*Default:* `"ssh"`

*Example:* `"ssh-ng"`

*Declared by:* [`nixos/modules/config/nix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix-remote-build.nix)

## `nix.buildMachines.*.publicHostKey` {#opt-nix.buildMachines._.publicHostKey}

The (base64-encoded) public host key of this builder. The field
is calculated via `base64 -w0 /etc/ssh/ssh_host_type_key.pub`.
If null, SSH will use its regular known-hosts file when connecting.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/config/nix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix-remote-build.nix)

## `nix.buildMachines.*.speedFactor` {#opt-nix.buildMachines._.speedFactor}

The relative speed of this builder. This is an arbitrary
positive number that indicates the speed of this builder,
relative to other builders. Higher is faster.

*Type:* nonnegative integer or floating point number, meaning \>=0

*Default:* `1`

*Declared by:* [`nixos/modules/config/nix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix-remote-build.nix)

## `nix.buildMachines.*.sshKey` {#opt-nix.buildMachines._.sshKey}

The path to the SSH private key with which to authenticate on
the build machine. The private key must not have a passphrase.
If null, the building user (root on NixOS machines) must have an
appropriate ssh configuration to log in non-interactively.

Note that for security reasons, this path must point to a file
in the local filesystem, *not* to the nix store.

*Type:* null or string

*Default:* `null`

*Example:* `"/root/.ssh/id_buildhost_builduser"`

*Declared by:* [`nixos/modules/config/nix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix-remote-build.nix)

## `nix.buildMachines.*.sshUser` {#opt-nix.buildMachines._.sshUser}

The username to log in as on the remote host. This user must be
able to log in and run nix commands non-interactively. It must
also be privileged to build derivations, so must be included in
[`nix.settings.trusted-users`](#opt-nix.settings.trusted-users).

*Type:* null or string

*Default:* `null`

*Example:* `"builder"`

*Declared by:* [`nixos/modules/config/nix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix-remote-build.nix)

## `nix.buildMachines.*.supportedFeatures` {#opt-nix.buildMachines._.supportedFeatures}

A list of features supported by this builder. The builder will
be ignored for derivations that require features not in this
list.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "kvm"
  "big-parallel"
]
```

*Declared by:* [`nixos/modules/config/nix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix-remote-build.nix)

## `nix.buildMachines.*.system` {#opt-nix.buildMachines._.system}

The system type the build machine can execute derivations on.
Either this attribute or `systems` must be
present, where `system` takes precedence if
both are set.

*Type:* null or string

*Default:* `null`

*Example:* `"x86_64-linux"`

*Declared by:* [`nixos/modules/config/nix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix-remote-build.nix)

## `nix.buildMachines.*.systems` {#opt-nix.buildMachines._.systems}

The system types the build machine can execute derivations on.
Either this attribute or `system` must be
present, where `system` takes precedence if
both are set.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "x86_64-linux"
  "aarch64-linux"
]
```

*Declared by:* [`nixos/modules/config/nix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix-remote-build.nix)

## `nix.channel.enable` {#opt-nix.channel.enable}

Whether the `nix-channel` command and state files are made available on the machine.

The following files are initialized when enabled:

- `/nix/var/nix/profiles/per-user/root/channels`
- `/root/.nix-channels`
- `$HOME/.nix-defexpr/channels` (on login)

Disabling this option will not remove the state files from the system.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/nix-channel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix-channel.nix)

## `nix.checkAllErrors` {#opt-nix.checkAllErrors}

If enabled, checks the nix.conf parsing for any kind of error. When disabled, checks only for unknown settings.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/nix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix.nix)

## `nix.checkConfig` {#opt-nix.checkConfig}

If enabled, checks that Nix can parse the generated nix.conf.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/nix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix.nix)

## `nix.daemon.enable` {#opt-nix.daemon.enable}

Whether to enable the Nix Daemon.

*Type:* boolean

*Default:* `config.nix.enable`

*Declared by:* [`nixos/modules/services/system/nix-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nix-daemon.nix)

## `nix.daemonCPUSchedPolicy` {#opt-nix.daemonCPUSchedPolicy}

Nix daemon process CPU scheduling policy. This policy propagates to
build processes. `other` is the default scheduling
policy for regular tasks. The `batch` policy is
similar to `other`, but optimised for
non-interactive tasks. `idle` is for extremely
low-priority tasks that should only be run when no other task
requires CPU time.

Please note that while using the `idle` policy may
greatly improve responsiveness of a system performing expensive
builds, it may also slow down and potentially starve crucial
configuration updates during load.

`idle` may therefore be a sensible policy for
systems that experience only intermittent phases of high CPU load,
such as desktop or portable computers used interactively. Other
systems should use the `other` or
`batch` policy instead.

For more fine-grained resource control, please refer to
`systemd.resource-control(5)` and adjust
`systemd.services.nix-daemon` directly.

*Type:* one of "other", "batch", "idle"

*Default:* `"other"`

*Example:* `"batch"`

*Declared by:* [`nixos/modules/services/system/nix-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nix-daemon.nix)

## `nix.daemonGroup` {#opt-nix.daemonGroup}

Group to use to run the Nix daemon.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/system/nix-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nix-daemon.nix)

## `nix.daemonIOSchedClass` {#opt-nix.daemonIOSchedClass}

Nix daemon process I/O scheduling class. This class propagates to
build processes. `best-effort` is the default
class for regular tasks. The `idle` class is for
extremely low-priority tasks that should only perform I/O when no
other task does.

Please note that while using the `idle` scheduling
class can improve responsiveness of a system performing expensive
builds, it might also slow down or starve crucial configuration
updates during load.

`idle` may therefore be a sensible class for
systems that experience only intermittent phases of high I/O load,
such as desktop or portable computers used interactively. Other
systems should use the `best-effort` class.

*Type:* one of "best-effort", "idle"

*Default:* `"best-effort"`

*Example:* `"idle"`

*Declared by:* [`nixos/modules/services/system/nix-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nix-daemon.nix)

## `nix.daemonIOSchedPriority` {#opt-nix.daemonIOSchedPriority}

Nix daemon process I/O scheduling priority. This priority propagates
to build processes. The supported priorities depend on the
scheduling policy: With idle, priorities are not used in scheduling
decisions. best-effort supports values in the range 0 (high) to 7
(low).

*Type:* signed integer

*Default:* `4`

*Example:* `1`

*Declared by:* [`nixos/modules/services/system/nix-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nix-daemon.nix)

## `nix.daemonUser` {#opt-nix.daemonUser}

User to use to run the Nix daemon.
If this is not "root" then the Nix daemon will set several settings to preserve functionality.
When setting this option, you must also set `nix.daemonGroup`.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/system/nix-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nix-daemon.nix)

## `nix.distributedBuilds` {#opt-nix.distributedBuilds}

Whether to distribute builds to the machines listed in
[`nix.buildMachines`](#opt-nix.buildMachines).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/nix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix-remote-build.nix)

## `nix.enable` {#opt-nix.enable}

Whether to enable Nix.
Disabling Nix makes the system hard to modify and the Nix programs and configuration will not be made available by NixOS itself.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/nix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix.nix)

## `nix.extraOptions` {#opt-nix.extraOptions}

Additional text appended to `nix.conf`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  keep-outputs = true
  keep-derivations = true
''
```

*Declared by:* [`nixos/modules/config/nix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix.nix)

## `nix.firewall.allowLoopback` {#opt-nix.firewall.allowLoopback}

Whether to allow traffic on the loopback interface. Traffic is still subject to protocol/port rules

*Type:* unspecified value

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/system/nix-daemon-firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nix-daemon-firewall.nix)

## `nix.firewall.allowNonTCPUDP` {#opt-nix.firewall.allowNonTCPUDP}

Whether to allow traffic that is neither TCP nor UDP

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/system/nix-daemon-firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nix-daemon-firewall.nix)

## `nix.firewall.allowPrivateNetworks` {#opt-nix.firewall.allowPrivateNetworks}

Whether to allow traffic to local networks. Traffic is still subject to protocol/port rules. Note that this option may break DNS resolution when the DNS resolver is in a local network

*Type:* unspecified value

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/system/nix-daemon-firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nix-daemon-firewall.nix)

## `nix.firewall.allowedTCPPorts` {#opt-nix.firewall.allowedTCPPorts}

TCP ports to which traffic is allowed. Specifying no ports will allow all TCP traffic

*Type:* list of ((optionally newline-terminated) single-line string or 16 bit unsigned integer; between 0 and 65535 (both inclusive))

*Default:* `[ ]`

*Example:*

``` nix
[
  "http"
  443
  "30000-31000"
]
```

*Declared by:* [`nixos/modules/services/system/nix-daemon-firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nix-daemon-firewall.nix)

## `nix.firewall.allowedUDPPorts` {#opt-nix.firewall.allowedUDPPorts}

UDP ports to which traffic is allowed. Specifying no ports will allow all UDP traffic

*Type:* list of ((optionally newline-terminated) single-line string or 16 bit unsigned integer; between 0 and 65535 (both inclusive))

*Default:* `[ ]`

*Example:*

``` nix
[
  53
]
```

*Declared by:* [`nixos/modules/services/system/nix-daemon-firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nix-daemon-firewall.nix)

## `nix.firewall.enable` {#opt-nix.firewall.enable}

Whether to enable firewalling for outgoing traffic of the nix daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/system/nix-daemon-firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nix-daemon-firewall.nix)

## `nix.firewall.extraNftablesRules` {#opt-nix.firewall.extraNftablesRules}

Extra nftables rules to prepend to the generated ones

*Type:* list of (optionally newline-terminated) single-line string

*Default:* `[ ]`

*Example:*

``` nix
[
  "ip daddr 1.1.1.1 udp dport accept"
]
```

*Declared by:* [`nixos/modules/services/system/nix-daemon-firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nix-daemon-firewall.nix)

## `nix.gc.automatic` {#opt-nix.gc.automatic}

Automatically run the garbage collector at a specific time.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/nix-gc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nix-gc.nix)

## `nix.gc.dates` {#opt-nix.gc.dates}

How often or when garbage collection is performed. For most desktop and server systems
a sufficient garbage collection is once a week.

This value must be a calendar event in the format specified by
`systemd.time(7)`.

*Type:* (optionally newline-terminated) single-line string or list of string

*Default:*

``` nix
[
  "03:15"
]
```

*Example:* `"weekly"`

*Declared by:* [`nixos/modules/services/misc/nix-gc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nix-gc.nix)

## `nix.gc.options` {#opt-nix.gc.options}

Options given to [`nix-collect-garbage`](https://nixos.org/manual/nix/stable/command-ref/nix-collect-garbage) when the garbage collector is run automatically.

*Type:* (optionally newline-terminated) single-line string

*Default:* `""`

*Example:* `"--max-freed $((64 * 1024**3))"`

*Declared by:* [`nixos/modules/services/misc/nix-gc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nix-gc.nix)

## `nix.gc.persistent` {#opt-nix.gc.persistent}

Takes a boolean argument. If true, the time when the service
unit was last triggered is stored on disk. When the timer is
activated, the service unit is triggered immediately if it
would have been triggered at least once during the time when
the timer was inactive. Such triggering is nonetheless
subject to the delay imposed by RandomizedDelaySec=. This is
useful to catch up on missed runs of the service when the
system was powered down.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/misc/nix-gc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nix-gc.nix)

## `nix.gc.randomizedDelaySec` {#opt-nix.gc.randomizedDelaySec}

Add a randomized delay before each garbage collection.
The delay will be chosen between zero and this value.
This value must be a time span in the format specified by
`systemd.time(7)`

*Type:* (optionally newline-terminated) single-line string

*Default:* `"0"`

*Example:* `"45min"`

*Declared by:* [`nixos/modules/services/misc/nix-gc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nix-gc.nix)

## `nix.nixPath` {#opt-nix.nixPath}

The default Nix expression search path, used by the Nix
evaluator to look up paths enclosed in angle brackets
(e.g. `<nixpkgs>`).

*Type:* list of string

*Default:*

``` nix
''
  if nix.channel.enable
  then [
    "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
    "nixos-config=/etc/nixos/configuration.nix"
    "/nix/var/nix/profiles/per-user/root/channels"
  ]
  else [];
''
```

*Declared by:* [`nixos/modules/config/nix-channel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix-channel.nix)

## `nix.nrBuildUsers` {#opt-nix.nrBuildUsers}

Number of `nixbld` user accounts created to
perform secure concurrent builds.  If you receive an error
message saying that “all build users are currently in use”,
you should increase this value.

*Type:* signed integer

*Declared by:* [`nixos/modules/config/nix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix.nix)

## `nix.optimise.automatic` {#opt-nix.optimise.automatic}

Automatically run the nix store optimiser at a specific time.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/nix-optimise.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nix-optimise.nix)

## `nix.optimise.dates` {#opt-nix.optimise.dates}

Specification (in the format described by
`systemd.time(7)`) of the time at
which the optimiser will run.

*Type:* (optionally newline-terminated) single-line string or list of string

*Default:*

``` nix
[
  "03:45"
]
```

*Declared by:* [`nixos/modules/services/misc/nix-optimise.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nix-optimise.nix)

## `nix.optimise.persistent` {#opt-nix.optimise.persistent}

Takes a boolean argument. If true, the time when the service
unit was last triggered is stored on disk. When the timer is
activated, the service unit is triggered immediately if it
would have been triggered at least once during the time when
the timer was inactive. Such triggering is nonetheless
subject to the delay imposed by RandomizedDelaySec=. This is
useful to catch up on missed runs of the service when the
system was powered down.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/misc/nix-optimise.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nix-optimise.nix)

## `nix.optimise.randomizedDelaySec` {#opt-nix.optimise.randomizedDelaySec}

Add a randomized delay before the optimizer will run.
The delay will be chosen between zero and this value.
This value must be a time span in the format specified by
`systemd.time(7)`

*Type:* (optionally newline-terminated) single-line string

*Default:* `"1800"`

*Example:* `"45min"`

*Declared by:* [`nixos/modules/services/misc/nix-optimise.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nix-optimise.nix)

## `nix.package` {#opt-nix.package}

This option specifies the Nix package to use throughout the system.
It can be used to set a specific version or alternative implementation.

*Type:* package

*Default:* `pkgs.nix`

*Example:*

``` nix
[
  "pkgs.nixVersions.git"
  "pkgs.nixVersions.latest"
  "pkgs.nixStatic"
  "pkgs.lixPackageSets.git.lix"
]
```

*Declared by:* [`nixos/modules/config/nix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix.nix)

## `nix.registry` {#opt-nix.registry}

A system-wide flake registry.

See `nix3-registry(1)` for more information.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/config/nix-flakes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix-flakes.nix)

## `nix.registry.<name>.exact` {#opt-nix.registry._name_.exact}

Whether the `from` reference needs to match exactly. If set,
a `from` reference like `nixpkgs` does not
match with a reference like `nixpkgs/nixos-20.03`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/nix-flakes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix-flakes.nix)

## `nix.registry.<name>.flake` {#opt-nix.registry._name_.flake}

The flake input `from` is rewritten to.

*Type:* null or (attribute set)

*Default:* `null`

*Example:* `nixpkgs`

*Declared by:* [`nixos/modules/config/nix-flakes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix-flakes.nix)

## `nix.registry.<name>.from` {#opt-nix.registry._name_.from}

The flake reference to be rewritten.

The format of flake references is described in `nix3-flake(1)`.

*Type:* attribute set of (string or signed integer or boolean or absolute path or package)

*Default:* `{ }`

*Example:*

``` nix
{
  id = "nixpkgs";
  type = "indirect";
}
```

*Declared by:* [`nixos/modules/config/nix-flakes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix-flakes.nix)

## `nix.registry.<name>.to` {#opt-nix.registry._name_.to}

The flake reference `from` is rewritten to.

The format of flake references is described in `nix3-flake(1)`.

*Type:* attribute set of (string or signed integer or boolean or absolute path or package)

*Default:* `{ }`

*Example:*

``` nix
{
  owner = "my-org";
  repo = "my-nixpkgs";
  type = "github";
}
```

*Declared by:* [`nixos/modules/config/nix-flakes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix-flakes.nix)

## `nix.settings` {#opt-nix.settings}

Configuration for Nix, see
[https://nixos.org/manual/nix/stable/command-ref/conf-file.html](https://nixos.org/manual/nix/stable/command-ref/conf-file.html) or
`nix.conf(5)` for available options.
The value declared here will be translated directly to the key-value pairs Nix expects.

You can use `nix-instantiate --eval --strict '<nixpkgs/nixos>' -A config.nix.settings`
to view the current value. By default it is empty.

Nix configurations defined under `nix.*` will be translated and applied to this
option. In addition, configuration specified in [`nix.extraOptions`](#opt-nix.extraOptions) will be appended
verbatim to the resulting config file.

*Type:* open submodule of attribute set of (Nix config atom (null, bool, int, float, str, path or package) or list of (Nix config atom (null, bool, int, float, str, path or package)))

*Default:* `{ }`

*Example:*

``` nix
{
  use-sandbox = true;
  show-trace = true;

  sandbox-paths = [ "/bin/sh=${pkgs.busybox-sandbox-shell.out}/bin/busybox" ];
}
```

*Declared by:* [`nixos/modules/config/nix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix.nix)

## `nix.settings.allowed-users` {#opt-nix.settings.allowed-users}

A list of names of users (separated by whitespace) that are
allowed to connect to the Nix daemon. As with
[`nix.settings.trusted-users`](#opt-nix.settings.trusted-users), you can specify groups by
prefixing them with `@`. Also, you can
allow all users by specifying `*`. The
default is `*`. Note that trusted users are
always allowed to connect.

*Type:* list of string

*Default:*

``` nix
[
  "*"
]
```

*Example:*

``` nix
[
  "@wheel"
  "@builders"
  "alice"
  "bob"
]
```

*Declared by:* [`nixos/modules/config/nix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix.nix)

## `nix.settings.auto-optimise-store` {#opt-nix.settings.auto-optimise-store}

If set to true, Nix automatically detects files in the store that have
identical contents, and replaces them with hard links to a single copy.
This saves disk space. If set to false (the default), you can still run
nix-store --optimise to get rid of duplicate files.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/config/nix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix.nix)

## `nix.settings.cores` {#opt-nix.settings.cores}

This option defines the maximum number of concurrent tasks during
one build. It affects, e.g., -j option for make.
The special value 0 means that the builder should use all
available CPU cores in the system. Some builds may become
non-deterministic with this option; use with care! Packages will
only be affected if enableParallelBuilding is set for them.

*Type:* signed integer

*Default:* `0`

*Example:* `64`

*Declared by:* [`nixos/modules/config/nix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix.nix)

## `nix.settings.experimental-features` {#opt-nix.settings.experimental-features}

List of experimental features to enable in Nix.
See [https://nixos.org/manual/nix/stable/development/experimental-features](https://nixos.org/manual/nix/stable/development/experimental-features) for available features.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "ca-derivations"
]
```

*Declared by:* [`nixos/modules/config/nix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix.nix)

## `nix.settings.extra-sandbox-paths` {#opt-nix.settings.extra-sandbox-paths}

Directories from the host filesystem to be included
in the sandbox.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/dev"
  "/proc"
]
```

*Declared by:* [`nixos/modules/config/nix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix.nix)

## `nix.settings.max-jobs` {#opt-nix.settings.max-jobs}

This option defines the maximum number of jobs that Nix will try to
build in parallel. The default is auto, which means it will use all
available logical cores. It is recommend to set it to the total
number of logical cores in your system (e.g., 16 for two CPUs with 4
cores each and hyper-threading).

*Type:* signed integer or value "auto" (singular enum)

*Default:* `"auto"`

*Example:* `64`

*Declared by:* [`nixos/modules/config/nix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix.nix)

## `nix.settings.require-sigs` {#opt-nix.settings.require-sigs}

If enabled (the default), Nix will only download binaries from binary caches if
they are cryptographically signed with any of the keys listed in
[`nix.settings.trusted-public-keys`](#opt-nix.settings.trusted-public-keys). If disabled, signatures are neither
required nor checked, so it's strongly recommended that you use only
trustworthy caches and https to prevent man-in-the-middle attacks.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/nix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix.nix)

## `nix.settings.sandbox` {#opt-nix.settings.sandbox}

If set, Nix will perform builds in a sandboxed environment that it
will set up automatically for each build. This prevents impurities
in builds by disallowing access to dependencies outside of the Nix
store by using network and mount namespaces in a chroot environment.

This is enabled by default even though it has a possible performance
impact due to the initial setup time of a sandbox for each build. It
doesn't affect derivation hashes, so changing this option will not
trigger a rebuild of packages.

When set to "relaxed", this option permits derivations that set
`__noChroot = true;` to run outside of the sandboxed environment.
Exercise caution when using this mode of operation! It is intended to
be a quick hack when building with packages that are not easily setup
to be built reproducibly.

*Type:* boolean or value "relaxed" (singular enum)

*Default:* `true`

*Declared by:* [`nixos/modules/config/nix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix.nix)

## `nix.settings.substituters` {#opt-nix.settings.substituters}

List of binary cache URLs used to obtain pre-built binaries
of Nix packages.

By default https://cache.nixos.org/ is added.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/config/nix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix.nix)

## `nix.settings.system-features` {#opt-nix.settings.system-features}

The set of features supported by the machine. Derivations
can express dependencies on system features through the
`requiredSystemFeatures` attribute.

*Type:* list of string

*Default:* `[ "nixos-test" "benchmark" "big-parallel" "kvm" "gccarch-<arch>" ]`

*Declared by:* [`nixos/modules/config/nix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix.nix)

## `nix.settings.trusted-public-keys` {#opt-nix.settings.trusted-public-keys}

List of public keys used to sign binary caches. If
[`nix.settings.require-sigs`](#opt-nix.settings.require-sigs) is enabled,
then Nix will use a binary from a binary cache if and only
if it is signed by *any* of the keys
listed here. By default, only the key for
`cache.nixos.org` is included.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "hydra.nixos.org-1:CNHJZBh9K4tP3EKF6FkkgeVYsS3ohTl+oS0Qa8bezVs="
]
```

*Declared by:* [`nixos/modules/config/nix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix.nix)

## `nix.settings.trusted-substituters` {#opt-nix.settings.trusted-substituters}

List of binary cache URLs that non-root users can use (in
addition to those specified using
[`nix.settings.substituters`](#opt-nix.settings.substituters)) by passing
`--option binary-caches` to Nix commands.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "https://hydra.nixos.org/"
]
```

*Declared by:* [`nixos/modules/config/nix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix.nix)

## `nix.settings.trusted-users` {#opt-nix.settings.trusted-users}

A list of names of users that have additional rights when
connecting to the Nix daemon, such as the ability to specify
additional binary caches, or to import unsigned NARs. You
can also specify groups by prefixing them with
`@`; for instance,
`@wheel` means all users in the wheel group.
`root` is included as a regular definition, so you do not have to repeat it.
Furthermore, `root` normally bypasses the daemon.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "alice"
  "@wheel"
]
```

*Declared by:* [`nixos/modules/config/nix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nix.nix)

## `nix.sshServe.enable` {#opt-nix.sshServe.enable}

Whether to enable serving the Nix store as a remote store via SSH.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/nix-ssh-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nix-ssh-serve.nix)

## `nix.sshServe.keys` {#opt-nix.sshServe.keys}

A list of SSH public keys allowed to access the binary cache via SSH.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "ssh-dss AAAAB3NzaC1k... alice@example.org"
]
```

*Declared by:* [`nixos/modules/services/misc/nix-ssh-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nix-ssh-serve.nix)

## `nix.sshServe.protocol` {#opt-nix.sshServe.protocol}

The specific Nix-over-SSH protocol to use.

*Type:* one of "ssh", "ssh-ng"

*Default:* `"ssh"`

*Declared by:* [`nixos/modules/services/misc/nix-ssh-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nix-ssh-serve.nix)

## `nix.sshServe.trusted` {#opt-nix.sshServe.trusted}

Whether to add nix-ssh to the nix.settings.trusted-users

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/nix-ssh-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nix-ssh-serve.nix)

## `nix.sshServe.write` {#opt-nix.sshServe.write}

Whether to enable writing to the Nix store as a remote store via SSH. Note: by default, the sshServe user is named nix-ssh and is not a trusted-user. nix-ssh should be added to the [`nix.sshServe.trusted`](#opt-nix.sshServe.trusted) option in most use cases, such as allowing remote building of derivations to anonymous people based on ssh key

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/nix-ssh-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nix-ssh-serve.nix)
