# systemd {#sec-options-systemd}

## `systemd.additionalUpstreamSystemUnits` {#opt-systemd.additionalUpstreamSystemUnits}

Additional units shipped with systemd that shall be enabled.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "debug-shell.service"
  "systemd-quotacheck.service"
]
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts` {#opt-systemd.automounts}

Definition of systemd automount units; see `systemd.automount(5)`.

This is a list instead of an attrSet, because systemd mandates
the names to be derived from the `where` attribute.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.after` {#opt-systemd.automounts._.after}

If the specified units are started at the same time as
this unit, delay this unit until they have started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.aliases` {#opt-systemd.automounts._.aliases}

Aliases of that unit.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.automountConfig` {#opt-systemd.automounts._.automountConfig}

Each attribute in this set specifies an option in the
`[Automount]` section of the unit.  See
`systemd.automount(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  DirectoryMode = "0775";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.before` {#opt-systemd.automounts._.before}

If the specified units are started at the same time as
this unit, delay them until this unit has started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.bindsTo` {#opt-systemd.automounts._.bindsTo}

Like ‘requires’, but in addition, if the specified units
unexpectedly disappear, this unit will be stopped as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.conflicts` {#opt-systemd.automounts._.conflicts}

If the specified units are started, then this unit is stopped
and vice versa.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.description` {#opt-systemd.automounts._.description}

Description of this unit used in systemd messages and progress indicators.

*Type:* (optionally newline-terminated) single-line string

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.documentation` {#opt-systemd.automounts._.documentation}

A list of URIs referencing documentation for this unit or its configuration.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.enable` {#opt-systemd.automounts._.enable}

If set to false, this unit will be a symlink to
/dev/null. This is primarily useful to prevent specific
template instances
(e.g. `serial-getty@ttyS0`) from being
started. Note that `enable=true` does not
make a unit start by default at boot; if you want that, see
`wantedBy`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.name` {#opt-systemd.automounts._.name}

The name of this systemd unit, including its extension.
This can be used to refer to this unit from other systemd units.

*Type:* string

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.onFailure` {#opt-systemd.automounts._.onFailure}

A list of one or more units that are activated when
this unit enters the "failed" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.onSuccess` {#opt-systemd.automounts._.onSuccess}

A list of one or more units that are activated when
this unit enters the "inactive" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.overrideStrategy` {#opt-systemd.automounts._.overrideStrategy}

Defines how unit configuration is provided for systemd:

`asDropinIfExists` creates a unit file when no unit file is provided by the package
otherwise it creates a drop-in file named `overrides.conf`.

`asDropin` creates a drop-in file named `overrides.conf`.
Mainly needed to define instances for systemd template units (e.g. `systemd-nspawn@mycontainer.service`).

See also `systemd.unit(5)`.

*Type:* one of "asDropinIfExists", "asDropin"

*Default:* `"asDropinIfExists"`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.partOf` {#opt-systemd.automounts._.partOf}

If the specified units are stopped or restarted, then this
unit is stopped or restarted as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.reloadTriggers` {#opt-systemd.automounts._.reloadTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be reloaded.  If anything but a reload trigger changes in the
unit file, the unit will be restarted instead.

*Type:* list of (systemd option)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.requiredBy` {#opt-systemd.automounts._.requiredBy}

Units that require (i.e. depend on and need to go down with) this unit.
As discussed in the `wantedBy` option description this also creates
`.requires` symlinks automatically.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.requires` {#opt-systemd.automounts._.requires}

Start the specified units when this unit is started, and stop
this unit when the specified units are stopped or fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.requisite` {#opt-systemd.automounts._.requisite}

Similar to requires. However if the units listed are not started,
they will not be started and the transaction will fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.restartTriggers` {#opt-systemd.automounts._.restartTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be restarted.

*Type:* list of unspecified value

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.startLimitBurst` {#opt-systemd.automounts._.startLimitBurst}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.startLimitIntervalSec` {#opt-systemd.automounts._.startLimitIntervalSec}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.unitConfig` {#opt-systemd.automounts._.unitConfig}

Each attribute in this set specifies an option in the
`[Unit]` section of the unit.  See
`systemd.unit(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  RequiresMountsFor = "/data";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.upheldBy` {#opt-systemd.automounts._.upheldBy}

Keep this unit running as long as the listed units are running. This is a continuously
enforced version of wantedBy.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.upholds` {#opt-systemd.automounts._.upholds}

Keeps the specified running while this unit is running. A continuous version of `wants`.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.wantedBy` {#opt-systemd.automounts._.wantedBy}

Units that want (i.e. depend on) this unit. The default method for
starting a unit by default at boot time is to set this option to
`["multi-user.target"]` for system services. Likewise for user units
(`systemd.user.<name>.*`) set it to `["default.target"]` to make a unit
start by default when the user `<name>` logs on.

This option creates a `.wants` symlink in the given target that exists
statelessly without the need for running `systemctl enable`.
The `[Install]` section described in `systemd.unit(5)` however is
not supported because it is a stateful process that does not fit well
into the NixOS design.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.wants` {#opt-systemd.automounts._.wants}

Start the specified units when this unit is started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.automounts.*.where` {#opt-systemd.automounts._.where}

Absolute path of a directory of the mount point.
Will be created if it doesn't exist. (Mandatory)

*Type:* string

*Example:* `"/mnt"`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.coredump.enable` {#opt-systemd.coredump.enable}

Whether core dumps should be processed by
`systemd-coredump`. If disabled, core dumps
appear in the current directory of the crashing process.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/coredump.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/coredump.nix)

## `systemd.coredump.settings.Coredump` {#opt-systemd.coredump.settings.Coredump}

Settings for systemd-coredump. See `coredump.conf(5)` for
available options.

*Type:* open submodule of attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Storage = "journal";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/coredump.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/coredump.nix)

## `systemd.ctrlAltDelUnit` {#opt-systemd.ctrlAltDelUnit}

Target that should be started when Ctrl-Alt-Delete is pressed;
see `systemd.special(7)`.

*Type:* string

*Default:* `"reboot.target"`

*Example:* `"poweroff.target"`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.defaultPath` {#opt-systemd.defaultPath}

Packages appended to the `PATH` environment variable of all
system and user services.

Individual services can opt out by setting `enableDefaultPath = false`.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.defaultUnit` {#opt-systemd.defaultUnit}

Default unit started when the system boots; see `systemd.special(7)`.

*Type:* string

*Default:* `"multi-user.target"`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.enableEmergencyMode` {#opt-systemd.enableEmergencyMode}

Whether to enable emergency mode, which is an
`sulogin` shell started on the console if
mounting a filesystem fails.  Since some machines (like EC2
instances) have no console of any kind, emergency mode doesn't
make sense, and it's better to continue with the boot insofar
as possible.

For initrd emergency access, use boot.initrd.systemd.emergencyAccess instead.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/emergency-mode.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/emergency-mode.nix)

## `systemd.enableStrictShellChecks` {#opt-systemd.enableStrictShellChecks}

Whether to run `shellcheck` on the generated scripts for systemd
units.

When enabled, all systemd scripts generated by NixOS will be checked
with `shellcheck` and any errors or warnings will cause the build to
fail.

This affects all scripts that have been created through the `script`,
`reload`, `preStart`, `postStart`, `preStop` and `postStop` options for
systemd services. This does not affect command lines passed directly
to `ExecStart`, `ExecReload`, `ExecStartPre`, `ExecStartPost`,
`ExecStop` or `ExecStopPost`.

It therefore also does not affect systemd units that are coming from
packages and that are not defined through the NixOS config. This option
is disabled by default, and although some services have already been
fixed, it is still likely that you will encounter build failures when
enabling this.

We encourage people to enable this option when they are willing and
able to submit fixes for potential build failures to Nixpkgs. The
option can also be enabled or disabled for individual services using
the `enableStrictShellChecks` option on the service itself, which will
take precedence over the global setting.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.generatorEnvironment` {#opt-systemd.generatorEnvironment}

Environment variables for systemd generators.

The `PATH` environment variable is populated via `systemd.generatorPath`.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  MY_VAR = "my-value";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.generatorPath` {#opt-systemd.generatorPath}

Packages added to the `PATH` environment variable of all systemd generators.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.hello ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.generators` {#opt-systemd.generators}

Definition of systemd generators; see `systemd.generator(5)`.

For each `NAME = VALUE` pair of the attrSet, a link is generated from
`/etc/systemd/system-generators/NAME` to `VALUE`.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
{
  systemd-gpt-auto-generator = "/dev/null";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.globalEnvironment` {#opt-systemd.globalEnvironment}

Environment variables passed to *all* systemd units.

*Type:* attribute set of (null or string or absolute path or package)

*Default:* `{ }`

*Example:*

``` nix
{
  TZ = "CET";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.managerEnvironment` {#opt-systemd.managerEnvironment}

Environment variables of PID 1. These variables are
*not* passed to started units.

*Type:* attribute set of (null or string or absolute path or package)

*Default:* `{ }`

*Example:*

``` nix
{
  SYSTEMD_LOG_LEVEL = "debug";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts` {#opt-systemd.mounts}

Definition of systemd mount units; see `systemd.mount(5)`.

This is a list instead of an attrSet, because systemd mandates
the names to be derived from the `where` attribute.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.after` {#opt-systemd.mounts._.after}

If the specified units are started at the same time as
this unit, delay this unit until they have started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.aliases` {#opt-systemd.mounts._.aliases}

Aliases of that unit.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.before` {#opt-systemd.mounts._.before}

If the specified units are started at the same time as
this unit, delay them until this unit has started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.bindsTo` {#opt-systemd.mounts._.bindsTo}

Like ‘requires’, but in addition, if the specified units
unexpectedly disappear, this unit will be stopped as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.conflicts` {#opt-systemd.mounts._.conflicts}

If the specified units are started, then this unit is stopped
and vice versa.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.description` {#opt-systemd.mounts._.description}

Description of this unit used in systemd messages and progress indicators.

*Type:* (optionally newline-terminated) single-line string

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.documentation` {#opt-systemd.mounts._.documentation}

A list of URIs referencing documentation for this unit or its configuration.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.enable` {#opt-systemd.mounts._.enable}

If set to false, this unit will be a symlink to
/dev/null. This is primarily useful to prevent specific
template instances
(e.g. `serial-getty@ttyS0`) from being
started. Note that `enable=true` does not
make a unit start by default at boot; if you want that, see
`wantedBy`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.mountConfig` {#opt-systemd.mounts._.mountConfig}

Each attribute in this set specifies an option in the
`[Mount]` section of the unit.  See
`systemd.mount(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  DirectoryMode = "0775";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.name` {#opt-systemd.mounts._.name}

The name of this systemd unit, including its extension.
This can be used to refer to this unit from other systemd units.

*Type:* string

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.onFailure` {#opt-systemd.mounts._.onFailure}

A list of one or more units that are activated when
this unit enters the "failed" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.onSuccess` {#opt-systemd.mounts._.onSuccess}

A list of one or more units that are activated when
this unit enters the "inactive" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.options` {#opt-systemd.mounts._.options}

Options used to mount the file system.

*Type:* strings concatenated with ","

*Default:* `""`

*Example:* `"noatime"`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.overrideStrategy` {#opt-systemd.mounts._.overrideStrategy}

Defines how unit configuration is provided for systemd:

`asDropinIfExists` creates a unit file when no unit file is provided by the package
otherwise it creates a drop-in file named `overrides.conf`.

`asDropin` creates a drop-in file named `overrides.conf`.
Mainly needed to define instances for systemd template units (e.g. `systemd-nspawn@mycontainer.service`).

See also `systemd.unit(5)`.

*Type:* one of "asDropinIfExists", "asDropin"

*Default:* `"asDropinIfExists"`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.partOf` {#opt-systemd.mounts._.partOf}

If the specified units are stopped or restarted, then this
unit is stopped or restarted as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.reloadTriggers` {#opt-systemd.mounts._.reloadTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be reloaded.  If anything but a reload trigger changes in the
unit file, the unit will be restarted instead.

*Type:* list of (systemd option)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.requiredBy` {#opt-systemd.mounts._.requiredBy}

Units that require (i.e. depend on and need to go down with) this unit.
As discussed in the `wantedBy` option description this also creates
`.requires` symlinks automatically.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.requires` {#opt-systemd.mounts._.requires}

Start the specified units when this unit is started, and stop
this unit when the specified units are stopped or fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.requisite` {#opt-systemd.mounts._.requisite}

Similar to requires. However if the units listed are not started,
they will not be started and the transaction will fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.restartTriggers` {#opt-systemd.mounts._.restartTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be restarted.

*Type:* list of unspecified value

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.startLimitBurst` {#opt-systemd.mounts._.startLimitBurst}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.startLimitIntervalSec` {#opt-systemd.mounts._.startLimitIntervalSec}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.type` {#opt-systemd.mounts._.type}

File system type.

*Type:* string

*Default:* `""`

*Example:* `"ext4"`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.unitConfig` {#opt-systemd.mounts._.unitConfig}

Each attribute in this set specifies an option in the
`[Unit]` section of the unit.  See
`systemd.unit(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  RequiresMountsFor = "/data";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.upheldBy` {#opt-systemd.mounts._.upheldBy}

Keep this unit running as long as the listed units are running. This is a continuously
enforced version of wantedBy.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.upholds` {#opt-systemd.mounts._.upholds}

Keeps the specified running while this unit is running. A continuous version of `wants`.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.wantedBy` {#opt-systemd.mounts._.wantedBy}

Units that want (i.e. depend on) this unit. The default method for
starting a unit by default at boot time is to set this option to
`["multi-user.target"]` for system services. Likewise for user units
(`systemd.user.<name>.*`) set it to `["default.target"]` to make a unit
start by default when the user `<name>` logs on.

This option creates a `.wants` symlink in the given target that exists
statelessly without the need for running `systemctl enable`.
The `[Install]` section described in `systemd.unit(5)` however is
not supported because it is a stateful process that does not fit well
into the NixOS design.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.wants` {#opt-systemd.mounts._.wants}

Start the specified units when this unit is started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.what` {#opt-systemd.mounts._.what}

Absolute path of device node, file or other resource. (Mandatory)

*Type:* string

*Example:* `"/dev/sda1"`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.mounts.*.where` {#opt-systemd.mounts._.where}

Absolute path of a directory of the mount point.
Will be created if it doesn't exist. (Mandatory)

*Type:* string

*Example:* `"/mnt"`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.network.config` {#opt-systemd.network.config}

Definition of global systemd network config.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.config.addRouteTablesToIPRoute2` {#opt-systemd.network.config.addRouteTablesToIPRoute2}

If true and routeTables are set, then the specified route tables
will also be installed into /etc/iproute2/rt\_tables.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.config.dhcpV4Config` {#opt-systemd.network.config.dhcpV4Config}

Each attribute in this set specifies an option in the
`[DHCPv4]` section of the networkd config.
See `networkd.conf(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  DUIDType = "vendor";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.config.dhcpV6Config` {#opt-systemd.network.config.dhcpV6Config}

Each attribute in this set specifies an option in the
`[DHCPv6]` section of the networkd config.
See `networkd.conf(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  DUIDType = "vendor";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.config.networkConfig` {#opt-systemd.network.config.networkConfig}

Each attribute in this set specifies an option in the
`[Network]` section of the networkd config.
See `networkd.conf(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  ManageForeignRoutingPolicyRules = false;
  SpeedMeter = true;
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.config.routeTables` {#opt-systemd.network.config.routeTables}

Defines route table names as an attrset of name to number.
See `networkd.conf(5)` for details.

*Type:* attribute set of signed integer

*Default:* `{ }`

*Example:*

``` nix
{
  foo = 27;
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.enable` {#opt-systemd.network.enable}

Whether to enable networkd or not.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.links` {#opt-systemd.network.links}

Definition of systemd network links.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.links.<name>.enable` {#opt-systemd.network.links._name_.enable}

Whether to enable this .link unit. It's handled by udev no matter if `systemd-networkd` is enabled or not

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.links.<name>.extraConfig` {#opt-systemd.network.links._name_.extraConfig}

Extra configuration append to unit

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.links.<name>.linkConfig` {#opt-systemd.network.links._name_.linkConfig}

Each attribute in this set specifies an option in the
`[Link]` section of the unit.  See
`systemd.link(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  MACAddress = "00:ff:ee:aa:cc:dd";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.links.<name>.matchConfig` {#opt-systemd.network.links._name_.matchConfig}

Each attribute in this set specifies an option in the
`[Match]` section of the unit.  See
`systemd.link(5)`
`systemd.netdev(5)`
`systemd.network(5)`
for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Name = "eth0";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs` {#opt-systemd.network.netdevs}

Definition of systemd network devices.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.bareUDPConfig` {#opt-systemd.network.netdevs._name_.bareUDPConfig}

Each attribute in this set specifies an option in the
`[BareUDP]` section of the unit.  See
`systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  DestinationPort = 1234;
  EtherType = "ipv4";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.batmanAdvancedConfig` {#opt-systemd.network.netdevs._name_.batmanAdvancedConfig}

Each attribute in this set specifies an option in the
`[BatmanAdvanced]` section of the unit. See
`systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  GatewayMode = "server";
  RoutingAlgorithm = "batman-v";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.bondConfig` {#opt-systemd.network.netdevs._name_.bondConfig}

Each attribute in this set specifies an option in the
`[Bond]` section of the unit.  See
`systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Mode = "802.3ad";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.bridgeConfig` {#opt-systemd.network.netdevs._name_.bridgeConfig}

Each attribute in this set specifies an option in the
`[Bridge]` section of the unit.  See
`systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  STP = true;
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.enable` {#opt-systemd.network.netdevs._name_.enable}

Whether to manage network configuration using `systemd-network`.

This also enables [`systemd.network.enable`](#opt-systemd.network.enable).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.extraConfig` {#opt-systemd.network.netdevs._name_.extraConfig}

Extra configuration append to unit

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.fooOverUDPConfig` {#opt-systemd.network.netdevs._name_.fooOverUDPConfig}

Each attribute in this set specifies an option in the
`[FooOverUDP]` section of the unit.  See
`systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Port = 9001;
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.geneveConfig` {#opt-systemd.network.netdevs._name_.geneveConfig}

Each attribute in this set specifies an option in the
`[GENEVE]` section of the unit.  See
`systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Id = 1;
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.hsrConfig` {#opt-systemd.network.netdevs._name_.hsrConfig}

Each attribute in this set specifies an option in the
`[HSR]` section of the unit.  See
`systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Ports = [
    "eth1"
    "eth2"
  ];
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.ipoibConfig` {#opt-systemd.network.netdevs._name_.ipoibConfig}

Each attribute in this set specifies an option in the `[IPoIB]` section of the unit.
See `systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  PartitionKey = 1;
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.ipvlanConfig` {#opt-systemd.network.netdevs._name_.ipvlanConfig}

Each attribute in this set specifies an option in the `[IPVLAN]` section of the unit.
See `systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Flags = "private";
  Mode = "L2";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.ipvtapConfig` {#opt-systemd.network.netdevs._name_.ipvtapConfig}

Each attribute in this set specifies an option in the `[IPVTAP]` section of the unit.
See `systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Flags = "vepa";
  Mode = "L3";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.l2tpConfig` {#opt-systemd.network.netdevs._name_.l2tpConfig}

Each attribute in this set specifies an option in the
`[L2TP]` section of the unit. See
`systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  EncapsulationType = "ip";
  Local = "static";
  PeerTunnelId = 12;
  Remote = "192.168.30.101";
  TunnelId = 10;
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.l2tpSessions` {#opt-systemd.network.netdevs._name_.l2tpSessions}

Each item in this array specifies an option in the
`[L2TPSession]` section of the unit. See
`systemd.netdev(5)` for details.

*Type:* list of attribute set of (systemd option)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    Name = "l2tp-sess";
    PeerSessionId = 26;
    SessionId = 25;
  }
]
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.macsecConfig` {#opt-systemd.network.netdevs._name_.macsecConfig}

Each attribute in this set specifies an option in the
`[MACsec]` section of the unit.  See
`systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Port = 1234;
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.macsecReceiveAssociations` {#opt-systemd.network.netdevs._name_.macsecReceiveAssociations}

Each item in this array specifies an option in the
`[MACsecReceiveAssociation]` section of the unit. See
`systemd.netdev(5)` for details.

*Type:* list of attribute set of (systemd option)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    MACAddress = "ab:cd:de:ef:ab:cd";
    Port = 1234;
  }
]
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.macsecReceiveChannels` {#opt-systemd.network.netdevs._name_.macsecReceiveChannels}

Each item in this array specifies an option in the
`[MACsecReceiveChannel]` section of the unit. See
`systemd.netdev(5)` for details.

*Type:* list of attribute set of (systemd option)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    MACAddress = "ab:cd:de:ef:ab:cd";
    Port = 1234;
  }
]
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.macsecTransmitAssociations` {#opt-systemd.network.netdevs._name_.macsecTransmitAssociations}

Each item in this array specifies an option in the
`[MACsecTransmitAssociation]` section of the unit. See
`systemd.netdev(5)` for details.

*Type:* list of attribute set of (systemd option)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    Activate = true;
  }
]
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.macvlanConfig` {#opt-systemd.network.netdevs._name_.macvlanConfig}

Each attribute in this set specifies an option in the
`[MACVLAN]` section of the unit.  See
`systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Mode = "private";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.macvtapConfig` {#opt-systemd.network.netdevs._name_.macvtapConfig}

Each attribute in this set specifies an option in the `[MACVTAP]` section of the unit.
See `systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Mode = "private";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.matchConfig` {#opt-systemd.network.netdevs._name_.matchConfig}

Each attribute in this set specifies an option in the
`[Match]` section of the unit.  See
`systemd.link(5)`
`systemd.netdev(5)`
`systemd.network(5)`
for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Name = "eth0";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.netdevConfig` {#opt-systemd.network.netdevs._name_.netdevConfig}

Each attribute in this set specifies an option in the
`[Netdev]` section of the unit.  See
`systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Kind = "bridge";
  Name = "mybridge";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.peerConfig` {#opt-systemd.network.netdevs._name_.peerConfig}

Each attribute in this set specifies an option in the
`[Peer]` section of the unit.  See
`systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Name = "veth2";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.tapConfig` {#opt-systemd.network.netdevs._name_.tapConfig}

Each attribute in this set specifies an option in the
`[Tap]` section of the unit.  See
`systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  User = "openvpn";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.tunConfig` {#opt-systemd.network.netdevs._name_.tunConfig}

Each attribute in this set specifies an option in the
`[Tun]` section of the unit.  See
`systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  User = "openvpn";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.tunnelConfig` {#opt-systemd.network.netdevs._name_.tunnelConfig}

Each attribute in this set specifies an option in the
`[Tunnel]` section of the unit.  See
`systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Remote = "192.168.1.1";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.vlanConfig` {#opt-systemd.network.netdevs._name_.vlanConfig}

Each attribute in this set specifies an option in the
`[VLAN]` section of the unit.  See
`systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Id = 4;
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.vrfConfig` {#opt-systemd.network.netdevs._name_.vrfConfig}

Each attribute in this set specifies an option in the
`[VRF]` section of the unit. See
`systemd.netdev(5)` for details.
A detailed explanation about how VRFs work can be found in the
[kernel docs](https://www.kernel.org/doc/Documentation/networking/vrf.txt).

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Table = 2342;
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.vxcanConfig` {#opt-systemd.network.netdevs._name_.vxcanConfig}

Each attribute in this set specifies an option in the
`[VXCAN]` section of the unit.  See
`systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Peer = "vxcanpeer";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.vxlanConfig` {#opt-systemd.network.netdevs._name_.vxlanConfig}

Each attribute in this set specifies an option in the
`[VXLAN]` section of the unit.  See
`systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.wireguardConfig` {#opt-systemd.network.netdevs._name_.wireguardConfig}

Each attribute in this set specifies an option in the
`[WireGuard]` section of the unit. See
`systemd.netdev(5)` for details.
Use `PrivateKeyFile` instead of
`PrivateKey`: the nix store is
world-readable.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  FirewallMark = 42;
  ListenPort = 51820;
  PrivateKeyFile = "/etc/wireguard/secret.key";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.wireguardPeers` {#opt-systemd.network.netdevs._name_.wireguardPeers}

Each item in this array specifies an option in the
`[WireGuardPeer]` section of the unit. See
`systemd.netdev(5)` for details.
Use `PresharedKeyFile` instead of
`PresharedKey`: the nix store is
world-readable.

*Type:* list of attribute set of (systemd option)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    AllowedIPs = [
      "10.0.0.1/32"
    ];
    Endpoint = "192.168.1.1:51820";
    PersistentKeepalive = 15;
    PresharedKeyFile = "/etc/wireguard/psk.key";
    PublicKey = "27s0OvaBBdHoJYkH9osZpjpgSOVNw+RaKfboT/Sfq0g=";
  }
]
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.wlanConfig` {#opt-systemd.network.netdevs._name_.wlanConfig}

Each attribute in this set specifies an option in the `[WLAN]` section of the unit.
See `systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  PhysicalDevice = 0;
  Type = "station";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.netdevs.<name>.xfrmConfig` {#opt-systemd.network.netdevs._name_.xfrmConfig}

Each attribute in this set specifies an option in the
`[Xfrm]` section of the unit.  See
`systemd.netdev(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  InterfaceId = 1;
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks` {#opt-systemd.network.networks}

Definition of systemd networks.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.DHCP` {#opt-systemd.network.networks._name_.DHCP}

Whether to enable DHCP on the interfaces matched.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.address` {#opt-systemd.network.networks._name_.address}

A list of addresses to be added to the network section of the
unit.  See `systemd.network(5)` for details.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.addresses` {#opt-systemd.network.networks._name_.addresses}

A list of `[Address]` sections to be added to the unit.  See
`systemd.network(5)` for details.

*Type:* list of attribute set of (systemd option)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    Address = "192.168.0.100/24";
  }
]
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.bandMultiQueueingConfig` {#opt-systemd.network.networks._name_.bandMultiQueueingConfig}

Each attribute in this set specifies an option in the
`[BandMultiQueueing]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Parent = "root";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.bfifoConfig` {#opt-systemd.network.networks._name_.bfifoConfig}

Each attribute in this set specifies an option in the
`[BFIFO]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  LimitBytes = "20K";
  Parent = "ingress";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.bond` {#opt-systemd.network.networks._name_.bond}

A list of bond interfaces to be added to the network section of the
unit.  See `systemd.network(5)` for details.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.bridge` {#opt-systemd.network.networks._name_.bridge}

A list of bridge interfaces to be added to the network section of the
unit.  See `systemd.network(5)` for details.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.bridgeConfig` {#opt-systemd.network.networks._name_.bridgeConfig}

Each attribute in this set specifies an option in the
`[Bridge]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Cost = 20;
  MulticastFlood = false;
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.bridgeFDBs` {#opt-systemd.network.networks._name_.bridgeFDBs}

A list of BridgeFDB sections to be added to the unit.  See
`systemd.network(5)` for details.

*Type:* list of attribute set of (systemd option)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    Destination = "192.168.100.4";
    MACAddress = "90:e2:ba:43:fc:71";
    VNI = 3600;
  }
]
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.bridgeMDBs` {#opt-systemd.network.networks._name_.bridgeMDBs}

A list of BridgeMDB sections to be added to the unit.  See
`systemd.network(5)` for details.

*Type:* list of attribute set of (systemd option)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    MulticastGroupAddress = "ff02::1:2:3:4";
    VLANId = 10;
  }
]
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.bridgeVLANs` {#opt-systemd.network.networks._name_.bridgeVLANs}

A list of BridgeVLAN sections to be added to the unit.  See
`systemd.network(5)` for details.

*Type:* list of attribute set of (systemd option)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    VLAN = "10-20";
  }
]
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.cakeConfig` {#opt-systemd.network.networks._name_.cakeConfig}

Each attribute in this set specifies an option in the
`[CAKE]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Bandwidth = "40M";
  CompensationMode = "ptm";
  OverheadBytes = 8;
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.canConfig` {#opt-systemd.network.networks._name_.canConfig}

Each attribute in this set specifies an option in the
`[CAN]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:* `{ }`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.classfulMultiQueueingConfig` {#opt-systemd.network.networks._name_.classfulMultiQueueingConfig}

Each attribute in this set specifies an option in the
`[ClassfulMultiQueueing]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Parent = "root";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.controlledDelayConfig` {#opt-systemd.network.networks._name_.controlledDelayConfig}

Each attribute in this set specifies an option in the
`[ControlledDelay]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Parent = "ingress";
  TargetSec = "20msec";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.deficitRoundRobinSchedulerClassConfig` {#opt-systemd.network.networks._name_.deficitRoundRobinSchedulerClassConfig}

Each attribute in this set specifies an option in the
`[DeficitRoundRobinSchedulerClass]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Parent = "root";
  QuantumBytes = "300k";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.deficitRoundRobinSchedulerConfig` {#opt-systemd.network.networks._name_.deficitRoundRobinSchedulerConfig}

Each attribute in this set specifies an option in the
`[DeficitRoundRobinScheduler]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Parent = "root";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.dhcpPrefixDelegationConfig` {#opt-systemd.network.networks._name_.dhcpPrefixDelegationConfig}

Each attribute in this set specifies an option in the
`[DHCPPrefixDelegation]` section of the unit. See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Announce = true;
  SubnetId = "auto";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.dhcpServerConfig` {#opt-systemd.network.networks._name_.dhcpServerConfig}

Each attribute in this set specifies an option in the
`[DHCPServer]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  EmitDNS = false;
  PoolOffset = 50;
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.dhcpServerStaticLeases` {#opt-systemd.network.networks._name_.dhcpServerStaticLeases}

A list of DHCPServerStaticLease sections to be added to the unit.  See
`systemd.network(5)` for details.

*Type:* list of attribute set of (systemd option)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    Address = "192.168.1.42";
    MACAddress = "65:43:4a:5b:d8:5f";
  }
]
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.dhcpV4Config` {#opt-systemd.network.networks._name_.dhcpV4Config}

Each attribute in this set specifies an option in the
`[DHCPv4]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  UseDNS = true;
  UseRoutes = true;
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.dhcpV6Config` {#opt-systemd.network.networks._name_.dhcpV6Config}

Each attribute in this set specifies an option in the
`[DHCPv6]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  UseDNS = true;
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.dns` {#opt-systemd.network.networks._name_.dns}

A list of dns servers to be added to the network section of the
unit.  See `systemd.network(5)` for details.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.domains` {#opt-systemd.network.networks._name_.domains}

A list of domains to pass to the network config.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.enable` {#opt-systemd.network.networks._name_.enable}

Whether to manage network configuration using `systemd-network`.

This also enables [`systemd.network.enable`](#opt-systemd.network.enable).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.enhancedTransmissionSelectionConfig` {#opt-systemd.network.networks._name_.enhancedTransmissionSelectionConfig}

Each attribute in this set specifies an option in the
`[EnhancedTransmissionSelection]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Bands = 3;
  Parent = "root";
  PriorityMap = "100 200 300";
  QuantumBytes = "300k";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.extraConfig` {#opt-systemd.network.networks._name_.extraConfig}

Extra configuration append to unit

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.fairQueueingConfig` {#opt-systemd.network.networks._name_.fairQueueingConfig}

Each attribute in this set specifies an option in the
`[FairQueueing]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  FlowLimit = 5;
  Parent = "root";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.fairQueueingControlledDelayConfig` {#opt-systemd.network.networks._name_.fairQueueingControlledDelayConfig}

Each attribute in this set specifies an option in the
`[FairQueueingControlledDelay]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Flows = 5;
  Parent = "root";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.flowQueuePIEConfig` {#opt-systemd.network.networks._name_.flowQueuePIEConfig}

Each attribute in this set specifies an option in the
`[FlowQueuePIE]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  PacketLimit = "3847";
  Parent = "ingress";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.gateway` {#opt-systemd.network.networks._name_.gateway}

A list of gateways to be added to the network section of the
unit.  See `systemd.network(5)` for details.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.genericRandomEarlyDetectionConfig` {#opt-systemd.network.networks._name_.genericRandomEarlyDetectionConfig}

Each attribute in this set specifies an option in the
`[GenericRandomEarlyDetection]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  DefaultVirtualQueue = 3;
  Parent = "root";
  VirtualQueues = 5;
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.heavyHitterFilterConfig` {#opt-systemd.network.networks._name_.heavyHitterFilterConfig}

Each attribute in this set specifies an option in the
`[HeavyHitterFilter]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  PacketLimit = 10000;
  Parent = "root";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.hierarchyTokenBucketClassConfig` {#opt-systemd.network.networks._name_.hierarchyTokenBucketClassConfig}

Each attribute in this set specifies an option in the
`[HierarchyTokenBucketClass]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Parent = "root";
  Rate = "10M";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.hierarchyTokenBucketConfig` {#opt-systemd.network.networks._name_.hierarchyTokenBucketConfig}

Each attribute in this set specifies an option in the
`[HierarchyTokenBucket]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Parent = "root";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.ipoIBConfig` {#opt-systemd.network.networks._name_.ipoIBConfig}

Each attribute in this set specifies an option in the
`[IPoIB]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:* `{ }`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.ipv6AcceptRAConfig` {#opt-systemd.network.networks._name_.ipv6AcceptRAConfig}

Each attribute in this set specifies an option in the
`[IPv6AcceptRA]` section of the unit. See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  DHCPv6Client = "always";
  UseDNS = true;
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.ipv6AddressLabels` {#opt-systemd.network.networks._name_.ipv6AddressLabels}

A list of `[IPv6AddressLabel]` sections to be added to the unit.  See
`systemd.network(5)` for details.

*Type:* list of attribute set of (systemd option)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    Label = 0;
    Prefix = "3fff::/20";
  }
]
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.ipv6PREF64Prefixes` {#opt-systemd.network.networks._name_.ipv6PREF64Prefixes}

A list of IPv6PREF64Prefix sections to be added to the unit. See
`systemd.network(5)` for details.

*Type:* list of attribute set of (systemd option)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    Prefix = "64:ff9b::/96";
  }
]
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.ipv6Prefixes` {#opt-systemd.network.networks._name_.ipv6Prefixes}

A list of ipv6Prefix sections to be added to the unit.  See
`systemd.network(5)` for details.

*Type:* list of attribute set of (systemd option)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    AddressAutoconfiguration = true;
    OnLink = true;
  }
]
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.ipv6RoutePrefixes` {#opt-systemd.network.networks._name_.ipv6RoutePrefixes}

A list of ipv6RoutePrefix sections to be added to the unit.  See
`systemd.network(5)` for details.

*Type:* list of attribute set of (systemd option)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    LifetimeSec = 3600;
    Route = "fd00::/64";
  }
]
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.ipv6SendRAConfig` {#opt-systemd.network.networks._name_.ipv6SendRAConfig}

Each attribute in this set specifies an option in the
`[IPv6SendRA]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  EmitDNS = true;
  Managed = true;
  OtherInformation = true;
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.ipvlan` {#opt-systemd.network.networks._name_.ipvlan}

A list of ipvlan interfaces to be added to the network section of the
unit.  See `systemd.network(5)` for details.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.linkConfig` {#opt-systemd.network.networks._name_.linkConfig}

Each attribute in this set specifies an option in the
`[Link]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Unmanaged = true;
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.lldpConfig` {#opt-systemd.network.networks._name_.lldpConfig}

Each attribute in this set specifies an option in the
`[LLDP]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  MUDURL = "https://things.example.org/product_abc123/v5";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.macvlan` {#opt-systemd.network.networks._name_.macvlan}

A list of macvlan interfaces to be added to the network section of the
unit.  See `systemd.network(5)` for details.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.macvtap` {#opt-systemd.network.networks._name_.macvtap}

A list of macvtap interfaces to be added to the network section of the
unit.  See `systemd.network(5)` for details.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.matchConfig` {#opt-systemd.network.networks._name_.matchConfig}

Each attribute in this set specifies an option in the
`[Match]` section of the unit.  See
`systemd.link(5)`
`systemd.netdev(5)`
`systemd.network(5)`
for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Name = "eth0";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.mobileNetworkConfig` {#opt-systemd.network.networks._name_.mobileNetworkConfig}

Each attribute in this set specifies an option in the
`[MobileNetwork]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  APN = "access-point-name";
  AllowRoaming = false;
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.name` {#opt-systemd.network.networks._name_.name}

The name of the network interface to match against.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.neighbors` {#opt-systemd.network.networks._name_.neighbors}

A list of `[Neighbor]` sections to be added to the unit.  See
`systemd.network(5)` for details.

*Type:* list of attribute set of (systemd option)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    Address = "192.168.0.100/24";
    LinkLayerAddress = "aa:bb:cc:dd:ee:ff";
  }
]
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.networkConfig` {#opt-systemd.network.networks._name_.networkConfig}

Each attribute in this set specifies an option in the
`[Network]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Description = "My Network";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.networkEmulatorConfig` {#opt-systemd.network.networks._name_.networkEmulatorConfig}

Each attribute in this set specifies an option in the
`[NetworkEmulator]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  DelaySec = "20msec";
  Parent = "ingress";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.nextHops` {#opt-systemd.network.networks._name_.nextHops}

A list of NextHop sections to be added to the unit.  See
`systemd.network(5)` for details.

*Type:* list of attribute set of (systemd option)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    Gateway = "192.168.1.1";
    Id = 10;
  }
]
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.ntp` {#opt-systemd.network.networks._name_.ntp}

A list of ntp servers to be added to the network section of the
unit.  See `systemd.network(5)` for details.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.pfifoConfig` {#opt-systemd.network.networks._name_.pfifoConfig}

Each attribute in this set specifies an option in the
`[PFIFO]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  PacketLimit = "300";
  Parent = "ingress";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.pfifoFastConfig` {#opt-systemd.network.networks._name_.pfifoFastConfig}

Each attribute in this set specifies an option in the
`[PFIFOFast]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Parent = "ingress";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.pfifoHeadDropConfig` {#opt-systemd.network.networks._name_.pfifoHeadDropConfig}

Each attribute in this set specifies an option in the
`[PFIFOHeadDrop]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  PacketLimit = "300";
  Parent = "ingress";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.pieConfig` {#opt-systemd.network.networks._name_.pieConfig}

Each attribute in this set specifies an option in the
`[PIE]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  PacketLimit = "3847";
  Parent = "ingress";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.qdiscConfig` {#opt-systemd.network.networks._name_.qdiscConfig}

Each attribute in this set specifies an option in the
`[QDisc]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Parent = "ingress";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.quickFairQueueingConfig` {#opt-systemd.network.networks._name_.quickFairQueueingConfig}

Each attribute in this set specifies an option in the
`[QuickFairQueueing]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Parent = "root";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.quickFairQueueingConfigClass` {#opt-systemd.network.networks._name_.quickFairQueueingConfigClass}

Each attribute in this set specifies an option in the
`[QuickFairQueueingClass]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Parent = "root";
  Weight = 133;
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.routes` {#opt-systemd.network.networks._name_.routes}

A list of route sections to be added to the unit.  See
`systemd.network(5)` for details.

*Type:* list of attribute set of (systemd option)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    Gateway = "192.168.0.1";
  }
]
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.routingPolicyRules` {#opt-systemd.network.networks._name_.routingPolicyRules}

A list of routing policy rules sections to be added to the unit.  See
`systemd.network(5)` for details.

*Type:* list of attribute set of (systemd option)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    Family = "both";
    IncomingInterface = "eth1";
    Table = 10;
  }
]
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.sriovConfig` {#opt-systemd.network.networks._name_.sriovConfig}

Each attribute in this set specifies an option in the
`[SR-IOV]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  VLANId = 1;
  VirtualFunction = 1;
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.stochasticFairBlueConfig` {#opt-systemd.network.networks._name_.stochasticFairBlueConfig}

Each attribute in this set specifies an option in the
`[StochasticFairBlue]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  PacketLimit = "3847";
  Parent = "ingress";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.stochasticFairnessQueueingConfig` {#opt-systemd.network.networks._name_.stochasticFairnessQueueingConfig}

Each attribute in this set specifies an option in the
`[StochasticFairnessQueueing]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Parent = "ingress";
  PerturbPeriodSec = "30";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.tokenBucketFilterConfig` {#opt-systemd.network.networks._name_.tokenBucketFilterConfig}

Each attribute in this set specifies an option in the
`[TokenBucketFilter]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Parent = "ingress";
  Rate = "100k";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.trivialLinkEqualizerConfig` {#opt-systemd.network.networks._name_.trivialLinkEqualizerConfig}

Each attribute in this set specifies an option in the
`[TrivialLinkEqualizer]` section of the unit.  See
`systemd.network(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Id = 0;
  Parent = "root";
}
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.tunnel` {#opt-systemd.network.networks._name_.tunnel}

A list of tunnel interfaces to be added to the network section of the
unit.  See `systemd.network(5)` for details.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.vlan` {#opt-systemd.network.networks._name_.vlan}

A list of vlan interfaces to be added to the network section of the
unit.  See `systemd.network(5)` for details.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.vrf` {#opt-systemd.network.networks._name_.vrf}

A list of vrf interfaces to be added to the network section of the
unit.  See `systemd.network(5)` for details.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.vxlan` {#opt-systemd.network.networks._name_.vxlan}

A list of vxlan interfaces to be added to the network section of the
unit.  See `systemd.network(5)` for details.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.networks.<name>.xfrm` {#opt-systemd.network.networks._name_.xfrm}

A list of xfrm interfaces to be added to the network section of the
unit.  See `systemd.network(5)` for details.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.wait-online.anyInterface` {#opt-systemd.network.wait-online.anyInterface}

Whether to consider the network online when any interface is online, as opposed to all of them.
This is useful on portable machines with a wired and a wireless interface, for example.

This is on by default if [`networking.useDHCP`](../../options/networking/index.md#opt-networking.useDHCP) is enabled.

*Type:* boolean

*Default:* `"config.networking.useDHCP"`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.wait-online.enable` {#opt-systemd.network.wait-online.enable}

Whether to enable the systemd-networkd-wait-online service.

systemd-networkd-wait-online can timeout and fail if there are no network interfaces
available for it to manage. When systemd-networkd is enabled but a different service is
responsible for managing the system's internet connection (for example, NetworkManager or
connman are used to manage WiFi connections), this service is unnecessary and can be
disabled.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.wait-online.extraArgs` {#opt-systemd.network.wait-online.extraArgs}

Extra command-line arguments to pass to systemd-networkd-wait-online.
These also affect per-interface `systemd-network-wait-online@` services.

See `systemd-networkd-wait-online.service(8)` for all available options.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.wait-online.ignoredInterfaces` {#opt-systemd.network.wait-online.ignoredInterfaces}

Network interfaces to be ignored when deciding if the system is online.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "wg0"
]
```

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.network.wait-online.timeout` {#opt-systemd.network.wait-online.timeout}

Time to wait for the network to come online, in seconds. Set to 0 to disable.

*Type:* unsigned integer, meaning \>=0

*Default:* `120`

*Example:* `0`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `systemd.nspawn` {#opt-systemd.nspawn}

Definition of systemd-nspawn configurations.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd/nspawn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/nspawn.nix)

## `systemd.nspawn.<name>.enable` {#opt-systemd.nspawn._name_.enable}

If set to false, this instance's configuration file will not be generated.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/nspawn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/nspawn.nix)

## `systemd.nspawn.<name>.settings` {#opt-systemd.nspawn._name_.settings}

Settings for this nspawn instance, organized by section.
See `systemd.nspawn(5)` for available options.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd/nspawn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/nspawn.nix)

## `systemd.nspawn.<name>.settings.Exec` {#opt-systemd.nspawn._name_.settings.Exec}

Options for the `[Exec]` section.
See `systemd.nspawn(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Parameters = "/bin/sh";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/nspawn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/nspawn.nix)

## `systemd.nspawn.<name>.settings.Files` {#opt-systemd.nspawn._name_.settings.Files}

Options for the `[Files]` section.
See `systemd.nspawn(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Bind = [
    "/home/alice"
  ];
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/nspawn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/nspawn.nix)

## `systemd.nspawn.<name>.settings.Network` {#opt-systemd.nspawn._name_.settings.Network}

Options for the `[Network]` section.
See `systemd.nspawn(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  Private = false;
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/nspawn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/nspawn.nix)

## `systemd.oomd.enable` {#opt-systemd.oomd.enable}

Whether to enable the `systemd-oomd` OOM killer.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/oomd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/oomd.nix)

## `systemd.oomd.enableRootSlice` {#opt-systemd.oomd.enableRootSlice}

Whether to enable oomd on the root slice (`-.slice`).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/oomd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/oomd.nix)

## `systemd.oomd.enableSystemSlice` {#opt-systemd.oomd.enableSystemSlice}

Whether to enable oomd on the system slice (`system.slice`).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/oomd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/oomd.nix)

## `systemd.oomd.enableUserSlices` {#opt-systemd.oomd.enableUserSlices}

Whether to enable oomd on all user slices (`user@.slice`) and all user owned slices.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/oomd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/oomd.nix)

## `systemd.oomd.settings.OOM` {#opt-systemd.oomd.settings.OOM}

Settings option for systemd-oomd.
See `oomd.conf(5)` for available options.

*Type:* open submodule of attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  DefaultMemoryPressureLimit = "60%";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/oomd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/oomd.nix)

## `systemd.package` {#opt-systemd.package}

The systemd package to use.

*Type:* package

*Default:* `pkgs.systemd`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.packages` {#opt-systemd.packages}

Packages providing systemd units and hooks.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.systemd-cryptsetup-generator ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths` {#opt-systemd.paths}

Definition of systemd path units; see `systemd.path(5)`.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.after` {#opt-systemd.paths._name_.after}

If the specified units are started at the same time as
this unit, delay this unit until they have started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.aliases` {#opt-systemd.paths._name_.aliases}

Aliases of that unit.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.before` {#opt-systemd.paths._name_.before}

If the specified units are started at the same time as
this unit, delay them until this unit has started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.bindsTo` {#opt-systemd.paths._name_.bindsTo}

Like ‘requires’, but in addition, if the specified units
unexpectedly disappear, this unit will be stopped as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.conflicts` {#opt-systemd.paths._name_.conflicts}

If the specified units are started, then this unit is stopped
and vice versa.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.description` {#opt-systemd.paths._name_.description}

Description of this unit used in systemd messages and progress indicators.

*Type:* (optionally newline-terminated) single-line string

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.documentation` {#opt-systemd.paths._name_.documentation}

A list of URIs referencing documentation for this unit or its configuration.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.enable` {#opt-systemd.paths._name_.enable}

If set to false, this unit will be a symlink to
/dev/null. This is primarily useful to prevent specific
template instances
(e.g. `serial-getty@ttyS0`) from being
started. Note that `enable=true` does not
make a unit start by default at boot; if you want that, see
`wantedBy`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.name` {#opt-systemd.paths._name_.name}

The name of this systemd unit, including its extension.
This can be used to refer to this unit from other systemd units.

*Type:* string

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.onFailure` {#opt-systemd.paths._name_.onFailure}

A list of one or more units that are activated when
this unit enters the "failed" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.onSuccess` {#opt-systemd.paths._name_.onSuccess}

A list of one or more units that are activated when
this unit enters the "inactive" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.overrideStrategy` {#opt-systemd.paths._name_.overrideStrategy}

Defines how unit configuration is provided for systemd:

`asDropinIfExists` creates a unit file when no unit file is provided by the package
otherwise it creates a drop-in file named `overrides.conf`.

`asDropin` creates a drop-in file named `overrides.conf`.
Mainly needed to define instances for systemd template units (e.g. `systemd-nspawn@mycontainer.service`).

See also `systemd.unit(5)`.

*Type:* one of "asDropinIfExists", "asDropin"

*Default:* `"asDropinIfExists"`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.partOf` {#opt-systemd.paths._name_.partOf}

If the specified units are stopped or restarted, then this
unit is stopped or restarted as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.pathConfig` {#opt-systemd.paths._name_.pathConfig}

Each attribute in this set specifies an option in the
`[Path]` section of the unit.  See
`systemd.path(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  PathChanged = "/some/path";
  Unit = "changedpath.service";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.reloadTriggers` {#opt-systemd.paths._name_.reloadTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be reloaded.  If anything but a reload trigger changes in the
unit file, the unit will be restarted instead.

*Type:* list of (systemd option)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.requiredBy` {#opt-systemd.paths._name_.requiredBy}

Units that require (i.e. depend on and need to go down with) this unit.
As discussed in the `wantedBy` option description this also creates
`.requires` symlinks automatically.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.requires` {#opt-systemd.paths._name_.requires}

Start the specified units when this unit is started, and stop
this unit when the specified units are stopped or fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.requisite` {#opt-systemd.paths._name_.requisite}

Similar to requires. However if the units listed are not started,
they will not be started and the transaction will fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.restartTriggers` {#opt-systemd.paths._name_.restartTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be restarted.

*Type:* list of unspecified value

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.startLimitBurst` {#opt-systemd.paths._name_.startLimitBurst}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.startLimitIntervalSec` {#opt-systemd.paths._name_.startLimitIntervalSec}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.unitConfig` {#opt-systemd.paths._name_.unitConfig}

Each attribute in this set specifies an option in the
`[Unit]` section of the unit.  See
`systemd.unit(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  RequiresMountsFor = "/data";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.upheldBy` {#opt-systemd.paths._name_.upheldBy}

Keep this unit running as long as the listed units are running. This is a continuously
enforced version of wantedBy.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.upholds` {#opt-systemd.paths._name_.upholds}

Keeps the specified running while this unit is running. A continuous version of `wants`.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.wantedBy` {#opt-systemd.paths._name_.wantedBy}

Units that want (i.e. depend on) this unit. The default method for
starting a unit by default at boot time is to set this option to
`["multi-user.target"]` for system services. Likewise for user units
(`systemd.user.<name>.*`) set it to `["default.target"]` to make a unit
start by default when the user `<name>` logs on.

This option creates a `.wants` symlink in the given target that exists
statelessly without the need for running `systemctl enable`.
The `[Install]` section described in `systemd.unit(5)` however is
not supported because it is a stateful process that does not fit well
into the NixOS design.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.paths.<name>.wants` {#opt-systemd.paths._name_.wants}

Start the specified units when this unit is started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.repart.enable` {#opt-systemd.repart.enable}

Grow and add partitions to a partition table.
systemd-repart only works with GPT partition tables.

To run systemd-repart while in the initrd, see
`options.boot.initrd.systemd.repart.enable`.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/repart.nix)

## `systemd.repart.partitions` {#opt-systemd.repart.partitions}

Specify partitions as a set of the names of the definition files as the
key and the partition configuration as its value. The partition
configuration can use all upstream options. See `repart.d(5)`
for all available options.

*Type:* attribute set of attribute set of (string or signed integer or boolean or list of string)

*Default:* `{ }`

*Example:*

``` nix
{
  "10-root" = {
    Type = "root";
  };
  "20-home" = {
    SizeMaxBytes = "2G";
    SizeMinBytes = "512M";
    Type = "home";
  };
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/repart.nix)

## `systemd.services` {#opt-systemd.services}

Definition of systemd service units; see `systemd.service(5)`.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:*

- [`nixos/modules/testing/service-runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/testing/service-runner.nix)
- [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)
- [`nixos/modules/security/systemd-confinement.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/systemd-confinement.nix)

## `systemd.services.<name>.after` {#opt-systemd.services._name_.after}

If the specified units are started at the same time as
this unit, delay this unit until they have started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.aliases` {#opt-systemd.services._name_.aliases}

Aliases of that unit.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.before` {#opt-systemd.services._name_.before}

If the specified units are started at the same time as
this unit, delay them until this unit has started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.bindsTo` {#opt-systemd.services._name_.bindsTo}

Like ‘requires’, but in addition, if the specified units
unexpectedly disappear, this unit will be stopped as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.confinement.binSh` {#opt-systemd.services._name_.confinement.binSh}

The program to make available as `/bin/sh` inside
the chroot. If this is set to `null`, no
`/bin/sh` is provided at all.

This is useful for some applications, which for example use the
`system(3)` library function to execute commands.

*Type:* null or absolute path

*Default:* `config.environment.binsh`

*Example:* `"${pkgs.dash}/bin/dash"`

*Declared by:* [`nixos/modules/security/systemd-confinement.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/systemd-confinement.nix)

## `systemd.services.<name>.confinement.enable` {#opt-systemd.services._name_.confinement.enable}

If set, all the required runtime store paths for this service are
bind-mounted into a `tmpfs`-based
`chroot(2)`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/systemd-confinement.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/systemd-confinement.nix)

## `systemd.services.<name>.confinement.fullUnit` {#opt-systemd.services._name_.confinement.fullUnit}

Whether to include the full closure of the systemd unit file into the
chroot, instead of just the dependencies for the executables.

::: warning
While it may be tempting to just enable this option to
make things work quickly, please be aware that this might add paths
to the closure of the chroot that you didn't anticipate. It's better
to use `confinement.packages` to **explicitly** add additional store paths to the
chroot.
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/systemd-confinement.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/systemd-confinement.nix)

## `systemd.services.<name>.confinement.mode` {#opt-systemd.services._name_.confinement.mode}

The value `full-apivfs` (the default) sets up
private `/dev`, `/proc`,
`/sys`, `/tmp` and `/var/tmp` file systems
in a separate user name space.

If this is set to `chroot-only`, only the file
system name space is set up along with the call to
`chroot(2)`.

In all cases, unless `serviceConfig.PrivateTmp=true` is set,
both `/tmp` and `/var/tmp` paths are added to `InaccessiblePaths=`.
This is to overcome options like `DynamicUser=true`
implying `PrivateTmp=true` without letting it being turned off.
Beware however that giving processes the `CAP_SYS_ADMIN` and `@mount` privileges
can let them undo the effects of `InaccessiblePaths=`.

::: note
This doesn't cover network namespaces and is solely for
file system level isolation.
:::

*Type:* one of "full-apivfs", "chroot-only"

*Default:* `"full-apivfs"`

*Declared by:* [`nixos/modules/security/systemd-confinement.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/systemd-confinement.nix)

## `systemd.services.<name>.confinement.packages` {#opt-systemd.services._name_.confinement.packages}

Additional packages or strings with context to add to the closure of
the chroot. By default, this includes all the packages from the
`serviceConfig.ExecReload`, `serviceConfig.ExecStartPost`, `serviceConfig.ExecStartPre`, `serviceConfig.ExecStop`, `serviceConfig.ExecStopPost` and `serviceConfig.ExecStart` options. If you want to have all the
dependencies of this systemd unit, you can use
`confinement.fullUnit`.

::: note
The store paths listed in `path` are
**not** included in the closure as
well as paths from other options except those listed
above.
:::

*Type:* list of (string or package)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/security/systemd-confinement.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/systemd-confinement.nix)

## `systemd.services.<name>.conflicts` {#opt-systemd.services._name_.conflicts}

If the specified units are started, then this unit is stopped
and vice versa.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.description` {#opt-systemd.services._name_.description}

Description of this unit used in systemd messages and progress indicators.

*Type:* (optionally newline-terminated) single-line string

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.documentation` {#opt-systemd.services._name_.documentation}

A list of URIs referencing documentation for this unit or its configuration.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.enable` {#opt-systemd.services._name_.enable}

If set to false, this unit will be a symlink to
/dev/null. This is primarily useful to prevent specific
template instances
(e.g. `serial-getty@ttyS0`) from being
started. Note that `enable=true` does not
make a unit start by default at boot; if you want that, see
`wantedBy`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.enableDefaultPath` {#opt-systemd.services._name_.enableDefaultPath}

Whether to append [`systemd.defaultPath`](#opt-systemd.defaultPath) to the service's `PATH` environment variable.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.enableStrictShellChecks` {#opt-systemd.services._name_.enableStrictShellChecks}

Enable running `shellcheck` on the generated scripts for this unit.

When enabled, scripts generated by the unit will be checked with
`shellcheck` and any errors or warnings will cause the build to
fail.

This affects all scripts that have been created through the
`script`, `reload`, `preStart`, `postStart`, `preStop` and
`postStop` options for systemd services. This does not affect
command lines passed directly to `ExecStart`, `ExecReload`,
`ExecStartPre`, `ExecStartPost`, `ExecStop` or `ExecStopPost`.

*Type:* boolean

*Default:* `config.systemd.enableStrictShellChecks`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.environment` {#opt-systemd.services._name_.environment}

Environment variables passed to the service's processes.

*Type:* attribute set of (null or string or absolute path or package)

*Default:* `{ }`

*Example:*

``` nix
{
  LANG = "nl_NL.UTF-8";
  PATH = "/foo/bar/bin";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.name` {#opt-systemd.services._name_.name}

The name of this systemd unit, including its extension.
This can be used to refer to this unit from other systemd units.

*Type:* string

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.notSocketActivated` {#opt-systemd.services._name_.notSocketActivated}

If set, a changed unit is never assumed to be
socket-activated on configuration switch, even if
it might have associated socket units. Instead, the unit
will be restarted (or stopped/started) as if it had no
associated sockets.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.onFailure` {#opt-systemd.services._name_.onFailure}

A list of one or more units that are activated when
this unit enters the "failed" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.onSuccess` {#opt-systemd.services._name_.onSuccess}

A list of one or more units that are activated when
this unit enters the "inactive" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.overrideStrategy` {#opt-systemd.services._name_.overrideStrategy}

Defines how unit configuration is provided for systemd:

`asDropinIfExists` creates a unit file when no unit file is provided by the package
otherwise it creates a drop-in file named `overrides.conf`.

`asDropin` creates a drop-in file named `overrides.conf`.
Mainly needed to define instances for systemd template units (e.g. `systemd-nspawn@mycontainer.service`).

See also `systemd.unit(5)`.

*Type:* one of "asDropinIfExists", "asDropin"

*Default:* `"asDropinIfExists"`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.partOf` {#opt-systemd.services._name_.partOf}

If the specified units are stopped or restarted, then this
unit is stopped or restarted as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.path` {#opt-systemd.services._name_.path}

Packages added to the service's `PATH`
environment variable.  Both the `bin`
and `sbin` subdirectories of each
package are added.

*Type:* list of (package or string)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.postStart` {#opt-systemd.services._name_.postStart}

Shell commands executed after the service's main process
is started.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.postStop` {#opt-systemd.services._name_.postStop}

Shell commands executed after the service's main process
has exited.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.preStart` {#opt-systemd.services._name_.preStart}

Shell commands executed before the service's main process
is started.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.preStop` {#opt-systemd.services._name_.preStop}

Shell commands executed to stop the service.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.reload` {#opt-systemd.services._name_.reload}

Shell commands executed when the service's main process
is reloaded.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.reloadIfChanged` {#opt-systemd.services._name_.reloadIfChanged}

Whether the service should be reloaded during a NixOS
configuration switch if its definition has changed.  If
enabled, the value of `restartIfChanged` is
ignored.

This option should not be used anymore in favor of
`reloadTriggers` which allows more granular
control of when a service is reloaded and when a service
is restarted.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.reloadTriggers` {#opt-systemd.services._name_.reloadTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be reloaded.  If anything but a reload trigger changes in the
unit file, the unit will be restarted instead.

*Type:* list of (systemd option)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.requiredBy` {#opt-systemd.services._name_.requiredBy}

Units that require (i.e. depend on and need to go down with) this unit.
As discussed in the `wantedBy` option description this also creates
`.requires` symlinks automatically.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.requires` {#opt-systemd.services._name_.requires}

Start the specified units when this unit is started, and stop
this unit when the specified units are stopped or fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.requisite` {#opt-systemd.services._name_.requisite}

Similar to requires. However if the units listed are not started,
they will not be started and the transaction will fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.restartIfChanged` {#opt-systemd.services._name_.restartIfChanged}

Whether the service should be restarted during a NixOS
configuration switch if its definition has changed.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.restartTriggers` {#opt-systemd.services._name_.restartTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be restarted.

*Type:* list of unspecified value

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.script` {#opt-systemd.services._name_.script}

Shell commands executed as the service's main process.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.scriptArgs` {#opt-systemd.services._name_.scriptArgs}

Arguments passed to the main process script.
Can contain specifiers (`%` placeholders expanded by systemd, see `systemd.unit(5)`).

*Type:* string

*Default:* `""`

*Example:* `"%i"`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.serviceConfig` {#opt-systemd.services._name_.serviceConfig}

Each attribute in this set specifies an option in the
`[Service]` section of the unit.  See
`systemd.service(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  RestartSec = 5;
}
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.startAt` {#opt-systemd.services._name_.startAt}

Automatically start this unit at the given date/time, which
must be in the format described in
`systemd.time(7)`.  This is equivalent
to adding a corresponding timer unit with
`OnCalendar` set to the value given here.

*Type:* string or list of string

*Default:* `[ ]`

*Example:* `"Sun 14:00:00"`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.startLimitBurst` {#opt-systemd.services._name_.startLimitBurst}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.startLimitIntervalSec` {#opt-systemd.services._name_.startLimitIntervalSec}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.stopIfChanged` {#opt-systemd.services._name_.stopIfChanged}

If set, a changed unit is restarted by calling
`systemctl stop` in the old configuration,
then `systemctl start` in the new one.
Otherwise, it is restarted in a single step using
`systemctl restart` in the new configuration.
The latter is less correct because it runs the
`ExecStop` commands from the new
configuration.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.unitConfig` {#opt-systemd.services._name_.unitConfig}

Each attribute in this set specifies an option in the
`[Unit]` section of the unit.  See
`systemd.unit(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  RequiresMountsFor = "/data";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.upheldBy` {#opt-systemd.services._name_.upheldBy}

Keep this unit running as long as the listed units are running. This is a continuously
enforced version of wantedBy.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.upholds` {#opt-systemd.services._name_.upholds}

Keeps the specified running while this unit is running. A continuous version of `wants`.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.wantedBy` {#opt-systemd.services._name_.wantedBy}

Units that want (i.e. depend on) this unit. The default method for
starting a unit by default at boot time is to set this option to
`["multi-user.target"]` for system services. Likewise for user units
(`systemd.user.<name>.*`) set it to `["default.target"]` to make a unit
start by default when the user `<name>` logs on.

This option creates a `.wants` symlink in the given target that exists
statelessly without the need for running `systemctl enable`.
The `[Install]` section described in `systemd.unit(5)` however is
not supported because it is a stateful process that does not fit well
into the NixOS design.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.services.<name>.wants` {#opt-systemd.services._name_.wants}

Start the specified units when this unit is started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.settings.Manager` {#opt-systemd.settings.Manager}

Options for the global systemd service manager. See `systemd-system.conf(5)` man page
for available options.

*Type:* open submodule of attribute set of (systemd option)

*Default:*

``` nix
{
  DefaultIOAccounting = true;
  DefaultIPAccounting = true;
}
```

*Example:*

``` nix
{
  KExecWatchdogSec = "5min";
  RebootWatchdogSec = "10min";
  RuntimeWatchdogSec = "30s";
  WatchdogDevice = "/dev/watchdog";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.shutdown` {#opt-systemd.shutdown}

Definition of systemd shutdown executables.
For each `NAME = VALUE` pair of the attrSet, a link is generated from
`/etc/systemd/system-shutdown/NAME` to `VALUE`.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.shutdownRamfs.contents` {#opt-systemd.shutdownRamfs.contents}

Set of files that have to be linked into the shutdown ramfs

*Type:* attribute set of (submodule)

*Example:*

``` nix
{
  "/lib/systemd/system-shutdown/zpool-sync-shutdown".source = writeShellScript "zpool" "exec ${zfs}/bin/zpool sync"
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/shutdown.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/shutdown.nix)

## `systemd.shutdownRamfs.contents.<name>.dlopen.features` {#opt-systemd.shutdownRamfs.contents._name_.dlopen.features}

Features to enable via dlopen ELF notes. These will be in
addition to anything included via 'usePriority',
regardless of their priority.

*Type:* list of (optionally newline-terminated) single-line string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/shutdown.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/shutdown.nix)

## `systemd.shutdownRamfs.contents.<name>.dlopen.usePriority` {#opt-systemd.shutdownRamfs.contents._name_.dlopen.usePriority}

Priority of dlopen ELF notes to include. "required" is
minimal, "recommended" includes "required", and
"suggested" includes "recommended".

See: [https://systemd.io/ELF\_DLOPEN\_METADATA/](https://systemd.io/ELF_DLOPEN_METADATA/)

*Type:* one of "required", "recommended", "suggested"

*Default:* `"recommended"`

*Declared by:* [`nixos/modules/system/boot/systemd/shutdown.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/shutdown.nix)

## `systemd.shutdownRamfs.contents.<name>.enable` {#opt-systemd.shutdownRamfs.contents._name_.enable}

Whether to enable copying of this file and symlinking it.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/shutdown.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/shutdown.nix)

## `systemd.shutdownRamfs.contents.<name>.source` {#opt-systemd.shutdownRamfs.contents._name_.source}

Path of the source file.

*Type:* absolute path

*Declared by:* [`nixos/modules/system/boot/systemd/shutdown.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/shutdown.nix)

## `systemd.shutdownRamfs.contents.<name>.target` {#opt-systemd.shutdownRamfs.contents._name_.target}

Path of the symlink.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/systemd/shutdown.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/shutdown.nix)

## `systemd.shutdownRamfs.contents.<name>.text` {#opt-systemd.shutdownRamfs.contents._name_.text}

Text of the file.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/systemd/shutdown.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/shutdown.nix)

## `systemd.shutdownRamfs.enable` {#opt-systemd.shutdownRamfs.enable}

Whether to enable pivoting back to an initramfs for shutdown.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/shutdown.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/shutdown.nix)

## `systemd.shutdownRamfs.storePaths` {#opt-systemd.shutdownRamfs.storePaths}

Store paths to copy into the shutdown ramfs as well.

*Type:* list of ((submodule) or ((optionally newline-terminated) single-line string or package) convertible to it)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/shutdown.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/shutdown.nix)

## `systemd.shutdownRamfs.storePaths.*.dlopen.features` {#opt-systemd.shutdownRamfs.storePaths._.dlopen.features}

Features to enable via dlopen ELF notes. These will be in
addition to anything included via 'usePriority',
regardless of their priority.

*Type:* list of (optionally newline-terminated) single-line string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/shutdown.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/shutdown.nix)

## `systemd.shutdownRamfs.storePaths.*.dlopen.usePriority` {#opt-systemd.shutdownRamfs.storePaths._.dlopen.usePriority}

Priority of dlopen ELF notes to include. "required" is
minimal, "recommended" includes "required", and
"suggested" includes "recommended".

See: [https://systemd.io/ELF\_DLOPEN\_METADATA/](https://systemd.io/ELF_DLOPEN_METADATA/)

*Type:* one of "required", "recommended", "suggested"

*Default:* `"recommended"`

*Declared by:* [`nixos/modules/system/boot/systemd/shutdown.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/shutdown.nix)

## `systemd.shutdownRamfs.storePaths.*.enable` {#opt-systemd.shutdownRamfs.storePaths._.enable}

Whether to enable copying of this file and symlinking it.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/shutdown.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/shutdown.nix)

## `systemd.shutdownRamfs.storePaths.*.source` {#opt-systemd.shutdownRamfs.storePaths._.source}

Path of the source file.

*Type:* absolute path

*Declared by:* [`nixos/modules/system/boot/systemd/shutdown.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/shutdown.nix)

## `systemd.shutdownRamfs.storePaths.*.target` {#opt-systemd.shutdownRamfs.storePaths._.target}

Path of the symlink.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/systemd/shutdown.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/shutdown.nix)

## `systemd.sleep.settings.Sleep` {#opt-systemd.sleep.settings.Sleep}

Options for systemd sleep state logic. See `sleep.conf.d(5)` man page
for available options.

*Type:* open submodule of attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  HibernateDelaySec = "1h";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices` {#opt-systemd.slices}

Definition of slice configurations; see `systemd.slice(5)`.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.after` {#opt-systemd.slices._name_.after}

If the specified units are started at the same time as
this unit, delay this unit until they have started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.aliases` {#opt-systemd.slices._name_.aliases}

Aliases of that unit.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.before` {#opt-systemd.slices._name_.before}

If the specified units are started at the same time as
this unit, delay them until this unit has started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.bindsTo` {#opt-systemd.slices._name_.bindsTo}

Like ‘requires’, but in addition, if the specified units
unexpectedly disappear, this unit will be stopped as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.conflicts` {#opt-systemd.slices._name_.conflicts}

If the specified units are started, then this unit is stopped
and vice versa.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.description` {#opt-systemd.slices._name_.description}

Description of this unit used in systemd messages and progress indicators.

*Type:* (optionally newline-terminated) single-line string

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.documentation` {#opt-systemd.slices._name_.documentation}

A list of URIs referencing documentation for this unit or its configuration.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.enable` {#opt-systemd.slices._name_.enable}

If set to false, this unit will be a symlink to
/dev/null. This is primarily useful to prevent specific
template instances
(e.g. `serial-getty@ttyS0`) from being
started. Note that `enable=true` does not
make a unit start by default at boot; if you want that, see
`wantedBy`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.name` {#opt-systemd.slices._name_.name}

The name of this systemd unit, including its extension.
This can be used to refer to this unit from other systemd units.

*Type:* string

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.onFailure` {#opt-systemd.slices._name_.onFailure}

A list of one or more units that are activated when
this unit enters the "failed" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.onSuccess` {#opt-systemd.slices._name_.onSuccess}

A list of one or more units that are activated when
this unit enters the "inactive" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.overrideStrategy` {#opt-systemd.slices._name_.overrideStrategy}

Defines how unit configuration is provided for systemd:

`asDropinIfExists` creates a unit file when no unit file is provided by the package
otherwise it creates a drop-in file named `overrides.conf`.

`asDropin` creates a drop-in file named `overrides.conf`.
Mainly needed to define instances for systemd template units (e.g. `systemd-nspawn@mycontainer.service`).

See also `systemd.unit(5)`.

*Type:* one of "asDropinIfExists", "asDropin"

*Default:* `"asDropinIfExists"`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.partOf` {#opt-systemd.slices._name_.partOf}

If the specified units are stopped or restarted, then this
unit is stopped or restarted as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.reloadTriggers` {#opt-systemd.slices._name_.reloadTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be reloaded.  If anything but a reload trigger changes in the
unit file, the unit will be restarted instead.

*Type:* list of (systemd option)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.requiredBy` {#opt-systemd.slices._name_.requiredBy}

Units that require (i.e. depend on and need to go down with) this unit.
As discussed in the `wantedBy` option description this also creates
`.requires` symlinks automatically.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.requires` {#opt-systemd.slices._name_.requires}

Start the specified units when this unit is started, and stop
this unit when the specified units are stopped or fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.requisite` {#opt-systemd.slices._name_.requisite}

Similar to requires. However if the units listed are not started,
they will not be started and the transaction will fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.restartTriggers` {#opt-systemd.slices._name_.restartTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be restarted.

*Type:* list of unspecified value

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.sliceConfig` {#opt-systemd.slices._name_.sliceConfig}

Each attribute in this set specifies an option in the
`[Slice]` section of the unit.  See
`systemd.slice(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  MemoryMax = "2G";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.startLimitBurst` {#opt-systemd.slices._name_.startLimitBurst}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.startLimitIntervalSec` {#opt-systemd.slices._name_.startLimitIntervalSec}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.unitConfig` {#opt-systemd.slices._name_.unitConfig}

Each attribute in this set specifies an option in the
`[Unit]` section of the unit.  See
`systemd.unit(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  RequiresMountsFor = "/data";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.upheldBy` {#opt-systemd.slices._name_.upheldBy}

Keep this unit running as long as the listed units are running. This is a continuously
enforced version of wantedBy.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.upholds` {#opt-systemd.slices._name_.upholds}

Keeps the specified running while this unit is running. A continuous version of `wants`.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.wantedBy` {#opt-systemd.slices._name_.wantedBy}

Units that want (i.e. depend on) this unit. The default method for
starting a unit by default at boot time is to set this option to
`["multi-user.target"]` for system services. Likewise for user units
(`systemd.user.<name>.*`) set it to `["default.target"]` to make a unit
start by default when the user `<name>` logs on.

This option creates a `.wants` symlink in the given target that exists
statelessly without the need for running `systemctl enable`.
The `[Install]` section described in `systemd.unit(5)` however is
not supported because it is a stateful process that does not fit well
into the NixOS design.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.slices.<name>.wants` {#opt-systemd.slices._name_.wants}

Start the specified units when this unit is started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets` {#opt-systemd.sockets}

Definition of systemd socket units; see `systemd.socket(5)`.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.after` {#opt-systemd.sockets._name_.after}

If the specified units are started at the same time as
this unit, delay this unit until they have started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.aliases` {#opt-systemd.sockets._name_.aliases}

Aliases of that unit.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.before` {#opt-systemd.sockets._name_.before}

If the specified units are started at the same time as
this unit, delay them until this unit has started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.bindsTo` {#opt-systemd.sockets._name_.bindsTo}

Like ‘requires’, but in addition, if the specified units
unexpectedly disappear, this unit will be stopped as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.conflicts` {#opt-systemd.sockets._name_.conflicts}

If the specified units are started, then this unit is stopped
and vice versa.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.description` {#opt-systemd.sockets._name_.description}

Description of this unit used in systemd messages and progress indicators.

*Type:* (optionally newline-terminated) single-line string

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.documentation` {#opt-systemd.sockets._name_.documentation}

A list of URIs referencing documentation for this unit or its configuration.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.enable` {#opt-systemd.sockets._name_.enable}

If set to false, this unit will be a symlink to
/dev/null. This is primarily useful to prevent specific
template instances
(e.g. `serial-getty@ttyS0`) from being
started. Note that `enable=true` does not
make a unit start by default at boot; if you want that, see
`wantedBy`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.listenDatagrams` {#opt-systemd.sockets._name_.listenDatagrams}

For each item in this list, a `ListenDatagram`
option in the `[Socket]` section will be created.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "0.0.0.0:993"
  "/run/my-socket"
]
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.listenStreams` {#opt-systemd.sockets._name_.listenStreams}

For each item in this list, a `ListenStream`
option in the `[Socket]` section will be created.

*Type:* list of (string or 16 bit unsigned integer; between 0 and 65535 (both inclusive) convertible to it)

*Default:* `[ ]`

*Example:*

``` nix
[
  "0.0.0.0:993"
  "/run/my-socket"
]
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.name` {#opt-systemd.sockets._name_.name}

The name of this systemd unit, including its extension.
This can be used to refer to this unit from other systemd units.

*Type:* string

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.onFailure` {#opt-systemd.sockets._name_.onFailure}

A list of one or more units that are activated when
this unit enters the "failed" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.onSuccess` {#opt-systemd.sockets._name_.onSuccess}

A list of one or more units that are activated when
this unit enters the "inactive" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.overrideStrategy` {#opt-systemd.sockets._name_.overrideStrategy}

Defines how unit configuration is provided for systemd:

`asDropinIfExists` creates a unit file when no unit file is provided by the package
otherwise it creates a drop-in file named `overrides.conf`.

`asDropin` creates a drop-in file named `overrides.conf`.
Mainly needed to define instances for systemd template units (e.g. `systemd-nspawn@mycontainer.service`).

See also `systemd.unit(5)`.

*Type:* one of "asDropinIfExists", "asDropin"

*Default:* `"asDropinIfExists"`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.partOf` {#opt-systemd.sockets._name_.partOf}

If the specified units are stopped or restarted, then this
unit is stopped or restarted as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.reloadTriggers` {#opt-systemd.sockets._name_.reloadTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be reloaded.  If anything but a reload trigger changes in the
unit file, the unit will be restarted instead.

*Type:* list of (systemd option)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.requiredBy` {#opt-systemd.sockets._name_.requiredBy}

Units that require (i.e. depend on and need to go down with) this unit.
As discussed in the `wantedBy` option description this also creates
`.requires` symlinks automatically.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.requires` {#opt-systemd.sockets._name_.requires}

Start the specified units when this unit is started, and stop
this unit when the specified units are stopped or fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.requisite` {#opt-systemd.sockets._name_.requisite}

Similar to requires. However if the units listed are not started,
they will not be started and the transaction will fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.restartTriggers` {#opt-systemd.sockets._name_.restartTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be restarted.

*Type:* list of unspecified value

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.socketConfig` {#opt-systemd.sockets._name_.socketConfig}

Each attribute in this set specifies an option in the
`[Socket]` section of the unit.  See
`systemd.socket(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  ListenStream = "/run/my-socket";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.startLimitBurst` {#opt-systemd.sockets._name_.startLimitBurst}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.startLimitIntervalSec` {#opt-systemd.sockets._name_.startLimitIntervalSec}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.unitConfig` {#opt-systemd.sockets._name_.unitConfig}

Each attribute in this set specifies an option in the
`[Unit]` section of the unit.  See
`systemd.unit(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  RequiresMountsFor = "/data";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.upheldBy` {#opt-systemd.sockets._name_.upheldBy}

Keep this unit running as long as the listed units are running. This is a continuously
enforced version of wantedBy.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.upholds` {#opt-systemd.sockets._name_.upholds}

Keeps the specified running while this unit is running. A continuous version of `wants`.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.wantedBy` {#opt-systemd.sockets._name_.wantedBy}

Units that want (i.e. depend on) this unit. The default method for
starting a unit by default at boot time is to set this option to
`["multi-user.target"]` for system services. Likewise for user units
(`systemd.user.<name>.*`) set it to `["default.target"]` to make a unit
start by default when the user `<name>` logs on.

This option creates a `.wants` symlink in the given target that exists
statelessly without the need for running `systemctl enable`.
The `[Install]` section described in `systemd.unit(5)` however is
not supported because it is a stateful process that does not fit well
into the NixOS design.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sockets.<name>.wants` {#opt-systemd.sockets._name_.wants}

Start the specified units when this unit is started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.suppressedSystemUnits` {#opt-systemd.suppressedSystemUnits}

A list of units to skip when generating system systemd configuration directory. This has
priority over upstream units, [`systemd.units`](#opt-systemd.units), and
[`systemd.additionalUpstreamSystemUnits`](#opt-systemd.additionalUpstreamSystemUnits). The main purpose of this is to
prevent a upstream systemd unit from being added to the initrd with any modifications made to it
by other NixOS modules.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "systemd-backlight@.service"
]
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.sysupdate.enable` {#opt-systemd.sysupdate.enable}

Atomically update the host OS, container images, portable service
images or other sources.

If enabled, updates are triggered in regular intervals via a
`systemd.timer` unit.

Please see `systemd-sysupdate(8)` for more details.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/sysupdate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/sysupdate.nix)

## `systemd.sysupdate.reboot.enable` {#opt-systemd.sysupdate.reboot.enable}

Whether to automatically reboot after an update.

If set to `true`, the system will automatically reboot via a
`systemd.timer` unit but only after a new version was installed.

This uses a unit completely separate from the one performing the
update because it is typically advisable to download updates
regularly while the system is up, but delay reboots until the
appropriate time (i.e. typically at night).

Set this to `false` if you do not want to reboot after an update. This
is useful when you update a container image or another source where
rebooting is not necessary in order to finalize the update.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/sysupdate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/sysupdate.nix)

## `systemd.sysupdate.reboot.timerConfig` {#opt-systemd.sysupdate.reboot.timerConfig}

The timer configuration for rebooting after an update.

By default, the upstream configuration is used:
[https://github.com/systemd/systemd/blob/main/units/systemd-sysupdate-reboot.timer](https://github.com/systemd/systemd/blob/main/units/systemd-sysupdate-reboot.timer)

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  OnCalendar = "Sun 14:00:00";
  Unit = "foo.service";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/sysupdate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/sysupdate.nix)

## `systemd.sysupdate.timerConfig` {#opt-systemd.sysupdate.timerConfig}

The timer configuration for performing the update.

By default, the upstream configuration is used:
[https://github.com/systemd/systemd/blob/main/units/systemd-sysupdate.timer](https://github.com/systemd/systemd/blob/main/units/systemd-sysupdate.timer)

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  OnCalendar = "Sun 14:00:00";
  Unit = "foo.service";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/sysupdate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/sysupdate.nix)

## `systemd.sysupdate.transfers` {#opt-systemd.sysupdate.transfers}

Specify transfers as a set of the names of the transfer files as the
key and the configuration as its value. The configuration can use all
upstream options. See `sysupdate.d(5)`
for all available options.

*Type:* attribute set of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string) or a non-empty list of them)

*Default:* `{ }`

*Example:*

``` nix
{
  "10-uki" = {
    Source = {
      MatchPattern = [
        "nixos_@v+@l-@d.efi"
        "nixos_@v+@l.efi"
        "nixos_@v.efi"
      ];
      Path = "https://download.example.com/";
      Type = "url-file";
    };
    Target = {
      InstancesMax = 2;
      MatchPattern = ''
        nixos_@v+@l-@d.efi"; \
        nixos_@v+@l.efi \
        nixos_@v.efi
      '';
      Mode = "0444";
      Path = "/EFI/Linux";
      PathRelativeTo = "boot";
      TriesDone = 0;
      TriesLeft = 3;
      Type = "regular-file";
    };
    Transfer = {
      ProtectVersion = "%A";
    };
  };
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/sysupdate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/sysupdate.nix)

## `systemd.sysusers.enable` {#opt-systemd.sysusers.enable}

If enabled, users are created with systemd-sysusers instead of with
the custom `update-users-groups.pl` script.

Note: This is experimental.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/sysusers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/sysusers.nix)

## `systemd.targets` {#opt-systemd.targets}

Definition of systemd target units; see `systemd.target(5)`

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.after` {#opt-systemd.targets._name_.after}

If the specified units are started at the same time as
this unit, delay this unit until they have started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.aliases` {#opt-systemd.targets._name_.aliases}

Aliases of that unit.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.before` {#opt-systemd.targets._name_.before}

If the specified units are started at the same time as
this unit, delay them until this unit has started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.bindsTo` {#opt-systemd.targets._name_.bindsTo}

Like ‘requires’, but in addition, if the specified units
unexpectedly disappear, this unit will be stopped as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.conflicts` {#opt-systemd.targets._name_.conflicts}

If the specified units are started, then this unit is stopped
and vice versa.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.description` {#opt-systemd.targets._name_.description}

Description of this unit used in systemd messages and progress indicators.

*Type:* (optionally newline-terminated) single-line string

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.documentation` {#opt-systemd.targets._name_.documentation}

A list of URIs referencing documentation for this unit or its configuration.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.enable` {#opt-systemd.targets._name_.enable}

If set to false, this unit will be a symlink to
/dev/null. This is primarily useful to prevent specific
template instances
(e.g. `serial-getty@ttyS0`) from being
started. Note that `enable=true` does not
make a unit start by default at boot; if you want that, see
`wantedBy`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.name` {#opt-systemd.targets._name_.name}

The name of this systemd unit, including its extension.
This can be used to refer to this unit from other systemd units.

*Type:* string

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.onFailure` {#opt-systemd.targets._name_.onFailure}

A list of one or more units that are activated when
this unit enters the "failed" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.onSuccess` {#opt-systemd.targets._name_.onSuccess}

A list of one or more units that are activated when
this unit enters the "inactive" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.overrideStrategy` {#opt-systemd.targets._name_.overrideStrategy}

Defines how unit configuration is provided for systemd:

`asDropinIfExists` creates a unit file when no unit file is provided by the package
otherwise it creates a drop-in file named `overrides.conf`.

`asDropin` creates a drop-in file named `overrides.conf`.
Mainly needed to define instances for systemd template units (e.g. `systemd-nspawn@mycontainer.service`).

See also `systemd.unit(5)`.

*Type:* one of "asDropinIfExists", "asDropin"

*Default:* `"asDropinIfExists"`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.partOf` {#opt-systemd.targets._name_.partOf}

If the specified units are stopped or restarted, then this
unit is stopped or restarted as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.reloadTriggers` {#opt-systemd.targets._name_.reloadTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be reloaded.  If anything but a reload trigger changes in the
unit file, the unit will be restarted instead.

*Type:* list of (systemd option)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.requiredBy` {#opt-systemd.targets._name_.requiredBy}

Units that require (i.e. depend on and need to go down with) this unit.
As discussed in the `wantedBy` option description this also creates
`.requires` symlinks automatically.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.requires` {#opt-systemd.targets._name_.requires}

Start the specified units when this unit is started, and stop
this unit when the specified units are stopped or fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.requisite` {#opt-systemd.targets._name_.requisite}

Similar to requires. However if the units listed are not started,
they will not be started and the transaction will fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.restartTriggers` {#opt-systemd.targets._name_.restartTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be restarted.

*Type:* list of unspecified value

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.startLimitBurst` {#opt-systemd.targets._name_.startLimitBurst}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.startLimitIntervalSec` {#opt-systemd.targets._name_.startLimitIntervalSec}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.unitConfig` {#opt-systemd.targets._name_.unitConfig}

Each attribute in this set specifies an option in the
`[Unit]` section of the unit.  See
`systemd.unit(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  RequiresMountsFor = "/data";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.upheldBy` {#opt-systemd.targets._name_.upheldBy}

Keep this unit running as long as the listed units are running. This is a continuously
enforced version of wantedBy.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.upholds` {#opt-systemd.targets._name_.upholds}

Keeps the specified running while this unit is running. A continuous version of `wants`.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.wantedBy` {#opt-systemd.targets._name_.wantedBy}

Units that want (i.e. depend on) this unit. The default method for
starting a unit by default at boot time is to set this option to
`["multi-user.target"]` for system services. Likewise for user units
(`systemd.user.<name>.*`) set it to `["default.target"]` to make a unit
start by default when the user `<name>` logs on.

This option creates a `.wants` symlink in the given target that exists
statelessly without the need for running `systemctl enable`.
The `[Install]` section described in `systemd.unit(5)` however is
not supported because it is a stateful process that does not fit well
into the NixOS design.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.targets.<name>.wants` {#opt-systemd.targets._name_.wants}

Start the specified units when this unit is started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers` {#opt-systemd.timers}

Definition of systemd timer units; see `systemd.timer(5)`.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.after` {#opt-systemd.timers._name_.after}

If the specified units are started at the same time as
this unit, delay this unit until they have started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.aliases` {#opt-systemd.timers._name_.aliases}

Aliases of that unit.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.before` {#opt-systemd.timers._name_.before}

If the specified units are started at the same time as
this unit, delay them until this unit has started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.bindsTo` {#opt-systemd.timers._name_.bindsTo}

Like ‘requires’, but in addition, if the specified units
unexpectedly disappear, this unit will be stopped as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.conflicts` {#opt-systemd.timers._name_.conflicts}

If the specified units are started, then this unit is stopped
and vice versa.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.description` {#opt-systemd.timers._name_.description}

Description of this unit used in systemd messages and progress indicators.

*Type:* (optionally newline-terminated) single-line string

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.documentation` {#opt-systemd.timers._name_.documentation}

A list of URIs referencing documentation for this unit or its configuration.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.enable` {#opt-systemd.timers._name_.enable}

If set to false, this unit will be a symlink to
/dev/null. This is primarily useful to prevent specific
template instances
(e.g. `serial-getty@ttyS0`) from being
started. Note that `enable=true` does not
make a unit start by default at boot; if you want that, see
`wantedBy`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.name` {#opt-systemd.timers._name_.name}

The name of this systemd unit, including its extension.
This can be used to refer to this unit from other systemd units.

*Type:* string

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.onFailure` {#opt-systemd.timers._name_.onFailure}

A list of one or more units that are activated when
this unit enters the "failed" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.onSuccess` {#opt-systemd.timers._name_.onSuccess}

A list of one or more units that are activated when
this unit enters the "inactive" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.overrideStrategy` {#opt-systemd.timers._name_.overrideStrategy}

Defines how unit configuration is provided for systemd:

`asDropinIfExists` creates a unit file when no unit file is provided by the package
otherwise it creates a drop-in file named `overrides.conf`.

`asDropin` creates a drop-in file named `overrides.conf`.
Mainly needed to define instances for systemd template units (e.g. `systemd-nspawn@mycontainer.service`).

See also `systemd.unit(5)`.

*Type:* one of "asDropinIfExists", "asDropin"

*Default:* `"asDropinIfExists"`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.partOf` {#opt-systemd.timers._name_.partOf}

If the specified units are stopped or restarted, then this
unit is stopped or restarted as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.reloadTriggers` {#opt-systemd.timers._name_.reloadTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be reloaded.  If anything but a reload trigger changes in the
unit file, the unit will be restarted instead.

*Type:* list of (systemd option)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.requiredBy` {#opt-systemd.timers._name_.requiredBy}

Units that require (i.e. depend on and need to go down with) this unit.
As discussed in the `wantedBy` option description this also creates
`.requires` symlinks automatically.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.requires` {#opt-systemd.timers._name_.requires}

Start the specified units when this unit is started, and stop
this unit when the specified units are stopped or fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.requisite` {#opt-systemd.timers._name_.requisite}

Similar to requires. However if the units listed are not started,
they will not be started and the transaction will fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.restartTriggers` {#opt-systemd.timers._name_.restartTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be restarted.

*Type:* list of unspecified value

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.startLimitBurst` {#opt-systemd.timers._name_.startLimitBurst}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.startLimitIntervalSec` {#opt-systemd.timers._name_.startLimitIntervalSec}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.timerConfig` {#opt-systemd.timers._name_.timerConfig}

Each attribute in this set specifies an option in the
`[Timer]` section of the unit.  See
`systemd.timer(5)` and
`systemd.time(7)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  OnCalendar = "Sun 14:00:00";
  Unit = "foo.service";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.unitConfig` {#opt-systemd.timers._name_.unitConfig}

Each attribute in this set specifies an option in the
`[Unit]` section of the unit.  See
`systemd.unit(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  RequiresMountsFor = "/data";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.upheldBy` {#opt-systemd.timers._name_.upheldBy}

Keep this unit running as long as the listed units are running. This is a continuously
enforced version of wantedBy.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.upholds` {#opt-systemd.timers._name_.upholds}

Keeps the specified running while this unit is running. A continuous version of `wants`.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.wantedBy` {#opt-systemd.timers._name_.wantedBy}

Units that want (i.e. depend on) this unit. The default method for
starting a unit by default at boot time is to set this option to
`["multi-user.target"]` for system services. Likewise for user units
(`systemd.user.<name>.*`) set it to `["default.target"]` to make a unit
start by default when the user `<name>` logs on.

This option creates a `.wants` symlink in the given target that exists
statelessly without the need for running `systemctl enable`.
The `[Install]` section described in `systemd.unit(5)` however is
not supported because it is a stateful process that does not fit well
into the NixOS design.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.timers.<name>.wants` {#opt-systemd.timers._name_.wants}

Start the specified units when this unit is started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.tmpfiles.packages` {#opt-systemd.tmpfiles.packages}

List of packages containing `systemd-tmpfiles` rules.

All files ending in .conf found in
`«pkg»/lib/tmpfiles.d`
will be included.
If this folder does not exist or does not contain any files an error will be returned instead.

If a `lib` output is available, rules are searched there and only there.
If there is no `lib` output it will fall back to `out`
and if that does not exist either, the default output will be used.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.lvm2 ]`

*Declared by:* [`nixos/modules/system/boot/systemd/tmpfiles.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/tmpfiles.nix)

## `systemd.tmpfiles.rules` {#opt-systemd.tmpfiles.rules}

Rules for creation, deletion and cleaning of volatile and temporary files
automatically. See
`tmpfiles.d(5)`
for the exact format.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "d /tmp 1777 root root 10d"
]
```

*Declared by:* [`nixos/modules/system/boot/systemd/tmpfiles.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/tmpfiles.nix)

## `systemd.tmpfiles.settings` {#opt-systemd.tmpfiles.settings}

Declare systemd-tmpfiles rules to create, delete, and clean up volatile
and temporary files and directories.

Even though the service is called `*tmp*files` you can also create
persistent files.

*Type:* attribute set of attribute set of attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "10-mypackage" = {
    "/var/lib/my-service/statefolder" = {
      d = {
        group = "root";
        mode = "0755";
        user = "root";
      };
    };
  };
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/tmpfiles.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/tmpfiles.nix)

## `systemd.tmpfiles.settings.<config-name>.<path>.<tmpfiles-type>.age` {#opt-systemd.tmpfiles.settings._config-name_._path_._tmpfiles-type_.age}

Delete a file when it reaches a certain age.

If a file or directory is older than the current time minus the age
field, it is deleted.

If set to `"-"` no automatic clean-up is done.

*Type:* string

*Default:* `"-"`

*Example:* `"10d"`

*Declared by:* [`nixos/modules/system/boot/systemd/tmpfiles.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/tmpfiles.nix)

## `systemd.tmpfiles.settings.<config-name>.<path>.<tmpfiles-type>.argument` {#opt-systemd.tmpfiles.settings._config-name_._path_._tmpfiles-type_.argument}

An argument whose meaning depends on the type of operation.

Please see the upstream documentation for the meaning of this
parameter in different situations:
`tmpfiles.d(5)`

*Type:* string

*Default:* `""`

*Example:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd/tmpfiles.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/tmpfiles.nix)

## `systemd.tmpfiles.settings.<config-name>.<path>.<tmpfiles-type>.group` {#opt-systemd.tmpfiles.settings._config-name_._path_._tmpfiles-type_.group}

The group of the file.

This may either be a numeric ID or a user/group name.

If omitted or when set to `"-"`, the user and group of the user who
invokes systemd-tmpfiles is used.

*Type:* string

*Default:* `"-"`

*Example:* `"root"`

*Declared by:* [`nixos/modules/system/boot/systemd/tmpfiles.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/tmpfiles.nix)

## `systemd.tmpfiles.settings.<config-name>.<path>.<tmpfiles-type>.mode` {#opt-systemd.tmpfiles.settings._config-name_._path_._tmpfiles-type_.mode}

The file access mode to use when creating this file or directory.

*Type:* string

*Default:* `"-"`

*Example:* `"0755"`

*Declared by:* [`nixos/modules/system/boot/systemd/tmpfiles.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/tmpfiles.nix)

## `systemd.tmpfiles.settings.<config-name>.<path>.<tmpfiles-type>.type` {#opt-systemd.tmpfiles.settings._config-name_._path_._tmpfiles-type_.type}

The type of operation to perform on the file.

The type consists of a single letter and optionally one or more
modifier characters.

Please see the upstream documentation for the available types and
more details:
`tmpfiles.d(5)`

*Type:* string

*Default:* `"‹tmpfiles-type›"`

*Example:* `"d"`

*Declared by:* [`nixos/modules/system/boot/systemd/tmpfiles.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/tmpfiles.nix)

## `systemd.tmpfiles.settings.<config-name>.<path>.<tmpfiles-type>.user` {#opt-systemd.tmpfiles.settings._config-name_._path_._tmpfiles-type_.user}

The user of the file.

This may either be a numeric ID or a user/group name.

If omitted or when set to `"-"`, the user and group of the user who
invokes systemd-tmpfiles is used.

*Type:* string

*Default:* `"-"`

*Example:* `"root"`

*Declared by:* [`nixos/modules/system/boot/systemd/tmpfiles.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/tmpfiles.nix)

## `systemd.tpm2.enable` {#opt-systemd.tpm2.enable}

Whether to enable systemd TPM2 support.

*Type:* boolean

*Default:* `"systemd.package.withTpm2Units"`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/tpm2.nix)

## `systemd.tpm2.pcrphases.enable` {#opt-systemd.tpm2.pcrphases.enable}

Whether to enable systemd boot phase measurements.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/tpm2.nix)

## `systemd.units` {#opt-systemd.units}

Definition of systemd units; see `systemd.unit(5)`.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.units.<name>.aliases` {#opt-systemd.units._name_.aliases}

Aliases of that unit.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.units.<name>.enable` {#opt-systemd.units._name_.enable}

If set to false, this unit will be a symlink to
/dev/null. This is primarily useful to prevent specific
template instances
(e.g. `serial-getty@ttyS0`) from being
started. Note that `enable=true` does not
make a unit start by default at boot; if you want that, see
`wantedBy`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.units.<name>.name` {#opt-systemd.units._name_.name}

The name of this systemd unit, including its extension.
This can be used to refer to this unit from other systemd units.

*Type:* string

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.units.<name>.overrideStrategy` {#opt-systemd.units._name_.overrideStrategy}

Defines how unit configuration is provided for systemd:

`asDropinIfExists` creates a unit file when no unit file is provided by the package
otherwise it creates a drop-in file named `overrides.conf`.

`asDropin` creates a drop-in file named `overrides.conf`.
Mainly needed to define instances for systemd template units (e.g. `systemd-nspawn@mycontainer.service`).

See also `systemd.unit(5)`.

*Type:* one of "asDropinIfExists", "asDropin"

*Default:* `"asDropinIfExists"`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.units.<name>.requiredBy` {#opt-systemd.units._name_.requiredBy}

Units that require (i.e. depend on and need to go down with) this unit.
As discussed in the `wantedBy` option description this also creates
`.requires` symlinks automatically.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.units.<name>.text` {#opt-systemd.units._name_.text}

Text of this systemd unit.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.units.<name>.upheldBy` {#opt-systemd.units._name_.upheldBy}

Keep this unit running as long as the listed units are running. This is a continuously
enforced version of wantedBy.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.units.<name>.wantedBy` {#opt-systemd.units._name_.wantedBy}

Units that want (i.e. depend on) this unit. The default method for
starting a unit by default at boot time is to set this option to
`["multi-user.target"]` for system services. Likewise for user units
(`systemd.user.<name>.*`) set it to `["default.target"]` to make a unit
start by default when the user `<name>` logs on.

This option creates a `.wants` symlink in the given target that exists
statelessly without the need for running `systemctl enable`.
The `[Install]` section described in `systemd.unit(5)` however is
not supported because it is a stateful process that does not fit well
into the NixOS design.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd.nix)

## `systemd.user.generators` {#opt-systemd.user.generators}

Definition of systemd generators; see `systemd.generator(5)`.

For each `NAME = VALUE` pair of the attrSet, a link is generated from
`/etc/systemd/user-generators/NAME` to `VALUE`.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
{
  systemd-gpt-auto-generator = "/dev/null";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths` {#opt-systemd.user.paths}

Definition of systemd per-user path units.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.after` {#opt-systemd.user.paths._name_.after}

If the specified units are started at the same time as
this unit, delay this unit until they have started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.aliases` {#opt-systemd.user.paths._name_.aliases}

Aliases of that unit.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.before` {#opt-systemd.user.paths._name_.before}

If the specified units are started at the same time as
this unit, delay them until this unit has started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.bindsTo` {#opt-systemd.user.paths._name_.bindsTo}

Like ‘requires’, but in addition, if the specified units
unexpectedly disappear, this unit will be stopped as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.conflicts` {#opt-systemd.user.paths._name_.conflicts}

If the specified units are started, then this unit is stopped
and vice versa.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.description` {#opt-systemd.user.paths._name_.description}

Description of this unit used in systemd messages and progress indicators.

*Type:* (optionally newline-terminated) single-line string

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.documentation` {#opt-systemd.user.paths._name_.documentation}

A list of URIs referencing documentation for this unit or its configuration.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.enable` {#opt-systemd.user.paths._name_.enable}

If set to false, this unit will be a symlink to
/dev/null. This is primarily useful to prevent specific
template instances
(e.g. `serial-getty@ttyS0`) from being
started. Note that `enable=true` does not
make a unit start by default at boot; if you want that, see
`wantedBy`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.name` {#opt-systemd.user.paths._name_.name}

The name of this systemd unit, including its extension.
This can be used to refer to this unit from other systemd units.

*Type:* string

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.onFailure` {#opt-systemd.user.paths._name_.onFailure}

A list of one or more units that are activated when
this unit enters the "failed" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.onSuccess` {#opt-systemd.user.paths._name_.onSuccess}

A list of one or more units that are activated when
this unit enters the "inactive" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.overrideStrategy` {#opt-systemd.user.paths._name_.overrideStrategy}

Defines how unit configuration is provided for systemd:

`asDropinIfExists` creates a unit file when no unit file is provided by the package
otherwise it creates a drop-in file named `overrides.conf`.

`asDropin` creates a drop-in file named `overrides.conf`.
Mainly needed to define instances for systemd template units (e.g. `systemd-nspawn@mycontainer.service`).

See also `systemd.unit(5)`.

*Type:* one of "asDropinIfExists", "asDropin"

*Default:* `"asDropinIfExists"`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.partOf` {#opt-systemd.user.paths._name_.partOf}

If the specified units are stopped or restarted, then this
unit is stopped or restarted as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.pathConfig` {#opt-systemd.user.paths._name_.pathConfig}

Each attribute in this set specifies an option in the
`[Path]` section of the unit.  See
`systemd.path(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  PathChanged = "/some/path";
  Unit = "changedpath.service";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.reloadTriggers` {#opt-systemd.user.paths._name_.reloadTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be reloaded.  If anything but a reload trigger changes in the
unit file, the unit will be restarted instead.

*Type:* list of (systemd option)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.requiredBy` {#opt-systemd.user.paths._name_.requiredBy}

Units that require (i.e. depend on and need to go down with) this unit.
As discussed in the `wantedBy` option description this also creates
`.requires` symlinks automatically.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.requires` {#opt-systemd.user.paths._name_.requires}

Start the specified units when this unit is started, and stop
this unit when the specified units are stopped or fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.requisite` {#opt-systemd.user.paths._name_.requisite}

Similar to requires. However if the units listed are not started,
they will not be started and the transaction will fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.restartTriggers` {#opt-systemd.user.paths._name_.restartTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be restarted.

*Type:* list of unspecified value

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.startLimitBurst` {#opt-systemd.user.paths._name_.startLimitBurst}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.startLimitIntervalSec` {#opt-systemd.user.paths._name_.startLimitIntervalSec}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.unitConfig` {#opt-systemd.user.paths._name_.unitConfig}

Each attribute in this set specifies an option in the
`[Unit]` section of the unit.  See
`systemd.unit(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  RequiresMountsFor = "/data";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.upheldBy` {#opt-systemd.user.paths._name_.upheldBy}

Keep this unit running as long as the listed units are running. This is a continuously
enforced version of wantedBy.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.upholds` {#opt-systemd.user.paths._name_.upholds}

Keeps the specified running while this unit is running. A continuous version of `wants`.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.wantedBy` {#opt-systemd.user.paths._name_.wantedBy}

Units that want (i.e. depend on) this unit. The default method for
starting a unit by default at boot time is to set this option to
`["multi-user.target"]` for system services. Likewise for user units
(`systemd.user.<name>.*`) set it to `["default.target"]` to make a unit
start by default when the user `<name>` logs on.

This option creates a `.wants` symlink in the given target that exists
statelessly without the need for running `systemctl enable`.
The `[Install]` section described in `systemd.unit(5)` however is
not supported because it is a stateful process that does not fit well
into the NixOS design.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.paths.<name>.wants` {#opt-systemd.user.paths._name_.wants}

Start the specified units when this unit is started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services` {#opt-systemd.user.services}

Definition of systemd per-user service units.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.after` {#opt-systemd.user.services._name_.after}

If the specified units are started at the same time as
this unit, delay this unit until they have started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.aliases` {#opt-systemd.user.services._name_.aliases}

Aliases of that unit.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.before` {#opt-systemd.user.services._name_.before}

If the specified units are started at the same time as
this unit, delay them until this unit has started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.bindsTo` {#opt-systemd.user.services._name_.bindsTo}

Like ‘requires’, but in addition, if the specified units
unexpectedly disappear, this unit will be stopped as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.conflicts` {#opt-systemd.user.services._name_.conflicts}

If the specified units are started, then this unit is stopped
and vice versa.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.description` {#opt-systemd.user.services._name_.description}

Description of this unit used in systemd messages and progress indicators.

*Type:* (optionally newline-terminated) single-line string

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.documentation` {#opt-systemd.user.services._name_.documentation}

A list of URIs referencing documentation for this unit or its configuration.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.enable` {#opt-systemd.user.services._name_.enable}

If set to false, this unit will be a symlink to
/dev/null. This is primarily useful to prevent specific
template instances
(e.g. `serial-getty@ttyS0`) from being
started. Note that `enable=true` does not
make a unit start by default at boot; if you want that, see
`wantedBy`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.enableDefaultPath` {#opt-systemd.user.services._name_.enableDefaultPath}

Whether to append [`systemd.defaultPath`](#opt-systemd.defaultPath) to the service's `PATH` environment variable.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.enableStrictShellChecks` {#opt-systemd.user.services._name_.enableStrictShellChecks}

Enable running `shellcheck` on the generated scripts for this unit.

When enabled, scripts generated by the unit will be checked with
`shellcheck` and any errors or warnings will cause the build to
fail.

This affects all scripts that have been created through the
`script`, `reload`, `preStart`, `postStart`, `preStop` and
`postStop` options for systemd services. This does not affect
command lines passed directly to `ExecStart`, `ExecReload`,
`ExecStartPre`, `ExecStartPost`, `ExecStop` or `ExecStopPost`.

*Type:* boolean

*Default:* `config.systemd.enableStrictShellChecks`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.environment` {#opt-systemd.user.services._name_.environment}

Environment variables passed to the service's processes.

*Type:* attribute set of (null or string or absolute path or package)

*Default:* `{ }`

*Example:*

``` nix
{
  LANG = "nl_NL.UTF-8";
  PATH = "/foo/bar/bin";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.name` {#opt-systemd.user.services._name_.name}

The name of this systemd unit, including its extension.
This can be used to refer to this unit from other systemd units.

*Type:* string

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.notSocketActivated` {#opt-systemd.user.services._name_.notSocketActivated}

If set, a changed unit is never assumed to be
socket-activated on configuration switch, even if
it might have associated socket units. Instead, the unit
will be restarted (or stopped/started) as if it had no
associated sockets.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.onFailure` {#opt-systemd.user.services._name_.onFailure}

A list of one or more units that are activated when
this unit enters the "failed" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.onSuccess` {#opt-systemd.user.services._name_.onSuccess}

A list of one or more units that are activated when
this unit enters the "inactive" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.overrideStrategy` {#opt-systemd.user.services._name_.overrideStrategy}

Defines how unit configuration is provided for systemd:

`asDropinIfExists` creates a unit file when no unit file is provided by the package
otherwise it creates a drop-in file named `overrides.conf`.

`asDropin` creates a drop-in file named `overrides.conf`.
Mainly needed to define instances for systemd template units (e.g. `systemd-nspawn@mycontainer.service`).

See also `systemd.unit(5)`.

*Type:* one of "asDropinIfExists", "asDropin"

*Default:* `"asDropinIfExists"`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.partOf` {#opt-systemd.user.services._name_.partOf}

If the specified units are stopped or restarted, then this
unit is stopped or restarted as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.path` {#opt-systemd.user.services._name_.path}

Packages added to the service's `PATH`
environment variable.  Both the `bin`
and `sbin` subdirectories of each
package are added.

*Type:* list of (package or string)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.postStart` {#opt-systemd.user.services._name_.postStart}

Shell commands executed after the service's main process
is started.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.postStop` {#opt-systemd.user.services._name_.postStop}

Shell commands executed after the service's main process
has exited.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.preStart` {#opt-systemd.user.services._name_.preStart}

Shell commands executed before the service's main process
is started.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.preStop` {#opt-systemd.user.services._name_.preStop}

Shell commands executed to stop the service.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.reload` {#opt-systemd.user.services._name_.reload}

Shell commands executed when the service's main process
is reloaded.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.reloadIfChanged` {#opt-systemd.user.services._name_.reloadIfChanged}

Whether the service should be reloaded during a NixOS
configuration switch if its definition has changed.  If
enabled, the value of `restartIfChanged` is
ignored.

This option should not be used anymore in favor of
`reloadTriggers` which allows more granular
control of when a service is reloaded and when a service
is restarted.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.reloadTriggers` {#opt-systemd.user.services._name_.reloadTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be reloaded.  If anything but a reload trigger changes in the
unit file, the unit will be restarted instead.

*Type:* list of (systemd option)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.requiredBy` {#opt-systemd.user.services._name_.requiredBy}

Units that require (i.e. depend on and need to go down with) this unit.
As discussed in the `wantedBy` option description this also creates
`.requires` symlinks automatically.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.requires` {#opt-systemd.user.services._name_.requires}

Start the specified units when this unit is started, and stop
this unit when the specified units are stopped or fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.requisite` {#opt-systemd.user.services._name_.requisite}

Similar to requires. However if the units listed are not started,
they will not be started and the transaction will fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.restartIfChanged` {#opt-systemd.user.services._name_.restartIfChanged}

Whether the service should be restarted during a NixOS
configuration switch if its definition has changed.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.restartTriggers` {#opt-systemd.user.services._name_.restartTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be restarted.

*Type:* list of unspecified value

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.script` {#opt-systemd.user.services._name_.script}

Shell commands executed as the service's main process.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.scriptArgs` {#opt-systemd.user.services._name_.scriptArgs}

Arguments passed to the main process script.
Can contain specifiers (`%` placeholders expanded by systemd, see `systemd.unit(5)`).

*Type:* string

*Default:* `""`

*Example:* `"%i"`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.serviceConfig` {#opt-systemd.user.services._name_.serviceConfig}

Each attribute in this set specifies an option in the
`[Service]` section of the unit.  See
`systemd.service(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  RestartSec = 5;
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.startAt` {#opt-systemd.user.services._name_.startAt}

Automatically start this unit at the given date/time, which
must be in the format described in
`systemd.time(7)`.  This is equivalent
to adding a corresponding timer unit with
`OnCalendar` set to the value given here.

*Type:* string or list of string

*Default:* `[ ]`

*Example:* `"Sun 14:00:00"`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.startLimitBurst` {#opt-systemd.user.services._name_.startLimitBurst}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.startLimitIntervalSec` {#opt-systemd.user.services._name_.startLimitIntervalSec}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.stopIfChanged` {#opt-systemd.user.services._name_.stopIfChanged}

If set, a changed unit is restarted by calling
`systemctl stop` in the old configuration,
then `systemctl start` in the new one.
Otherwise, it is restarted in a single step using
`systemctl restart` in the new configuration.
The latter is less correct because it runs the
`ExecStop` commands from the new
configuration.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.unitConfig` {#opt-systemd.user.services._name_.unitConfig}

Each attribute in this set specifies an option in the
`[Unit]` section of the unit.  See
`systemd.unit(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  RequiresMountsFor = "/data";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.upheldBy` {#opt-systemd.user.services._name_.upheldBy}

Keep this unit running as long as the listed units are running. This is a continuously
enforced version of wantedBy.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.upholds` {#opt-systemd.user.services._name_.upholds}

Keeps the specified running while this unit is running. A continuous version of `wants`.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.wantedBy` {#opt-systemd.user.services._name_.wantedBy}

Units that want (i.e. depend on) this unit. The default method for
starting a unit by default at boot time is to set this option to
`["multi-user.target"]` for system services. Likewise for user units
(`systemd.user.<name>.*`) set it to `["default.target"]` to make a unit
start by default when the user `<name>` logs on.

This option creates a `.wants` symlink in the given target that exists
statelessly without the need for running `systemctl enable`.
The `[Install]` section described in `systemd.unit(5)` however is
not supported because it is a stateful process that does not fit well
into the NixOS design.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.services.<name>.wants` {#opt-systemd.user.services._name_.wants}

Start the specified units when this unit is started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.settings.Manager` {#opt-systemd.user.settings.Manager}

Settings for systemd user instances. See `systemd-user.conf(5)`
for available options.

*Type:* open submodule of attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  DefaultTimeoutStartSec = 60;
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices` {#opt-systemd.user.slices}

Definition of systemd per-user slice units.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.after` {#opt-systemd.user.slices._name_.after}

If the specified units are started at the same time as
this unit, delay this unit until they have started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.aliases` {#opt-systemd.user.slices._name_.aliases}

Aliases of that unit.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.before` {#opt-systemd.user.slices._name_.before}

If the specified units are started at the same time as
this unit, delay them until this unit has started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.bindsTo` {#opt-systemd.user.slices._name_.bindsTo}

Like ‘requires’, but in addition, if the specified units
unexpectedly disappear, this unit will be stopped as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.conflicts` {#opt-systemd.user.slices._name_.conflicts}

If the specified units are started, then this unit is stopped
and vice versa.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.description` {#opt-systemd.user.slices._name_.description}

Description of this unit used in systemd messages and progress indicators.

*Type:* (optionally newline-terminated) single-line string

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.documentation` {#opt-systemd.user.slices._name_.documentation}

A list of URIs referencing documentation for this unit or its configuration.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.enable` {#opt-systemd.user.slices._name_.enable}

If set to false, this unit will be a symlink to
/dev/null. This is primarily useful to prevent specific
template instances
(e.g. `serial-getty@ttyS0`) from being
started. Note that `enable=true` does not
make a unit start by default at boot; if you want that, see
`wantedBy`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.name` {#opt-systemd.user.slices._name_.name}

The name of this systemd unit, including its extension.
This can be used to refer to this unit from other systemd units.

*Type:* string

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.onFailure` {#opt-systemd.user.slices._name_.onFailure}

A list of one or more units that are activated when
this unit enters the "failed" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.onSuccess` {#opt-systemd.user.slices._name_.onSuccess}

A list of one or more units that are activated when
this unit enters the "inactive" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.overrideStrategy` {#opt-systemd.user.slices._name_.overrideStrategy}

Defines how unit configuration is provided for systemd:

`asDropinIfExists` creates a unit file when no unit file is provided by the package
otherwise it creates a drop-in file named `overrides.conf`.

`asDropin` creates a drop-in file named `overrides.conf`.
Mainly needed to define instances for systemd template units (e.g. `systemd-nspawn@mycontainer.service`).

See also `systemd.unit(5)`.

*Type:* one of "asDropinIfExists", "asDropin"

*Default:* `"asDropinIfExists"`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.partOf` {#opt-systemd.user.slices._name_.partOf}

If the specified units are stopped or restarted, then this
unit is stopped or restarted as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.reloadTriggers` {#opt-systemd.user.slices._name_.reloadTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be reloaded.  If anything but a reload trigger changes in the
unit file, the unit will be restarted instead.

*Type:* list of (systemd option)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.requiredBy` {#opt-systemd.user.slices._name_.requiredBy}

Units that require (i.e. depend on and need to go down with) this unit.
As discussed in the `wantedBy` option description this also creates
`.requires` symlinks automatically.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.requires` {#opt-systemd.user.slices._name_.requires}

Start the specified units when this unit is started, and stop
this unit when the specified units are stopped or fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.requisite` {#opt-systemd.user.slices._name_.requisite}

Similar to requires. However if the units listed are not started,
they will not be started and the transaction will fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.restartTriggers` {#opt-systemd.user.slices._name_.restartTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be restarted.

*Type:* list of unspecified value

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.sliceConfig` {#opt-systemd.user.slices._name_.sliceConfig}

Each attribute in this set specifies an option in the
`[Slice]` section of the unit.  See
`systemd.slice(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  MemoryMax = "2G";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.startLimitBurst` {#opt-systemd.user.slices._name_.startLimitBurst}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.startLimitIntervalSec` {#opt-systemd.user.slices._name_.startLimitIntervalSec}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.unitConfig` {#opt-systemd.user.slices._name_.unitConfig}

Each attribute in this set specifies an option in the
`[Unit]` section of the unit.  See
`systemd.unit(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  RequiresMountsFor = "/data";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.upheldBy` {#opt-systemd.user.slices._name_.upheldBy}

Keep this unit running as long as the listed units are running. This is a continuously
enforced version of wantedBy.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.upholds` {#opt-systemd.user.slices._name_.upholds}

Keeps the specified running while this unit is running. A continuous version of `wants`.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.wantedBy` {#opt-systemd.user.slices._name_.wantedBy}

Units that want (i.e. depend on) this unit. The default method for
starting a unit by default at boot time is to set this option to
`["multi-user.target"]` for system services. Likewise for user units
(`systemd.user.<name>.*`) set it to `["default.target"]` to make a unit
start by default when the user `<name>` logs on.

This option creates a `.wants` symlink in the given target that exists
statelessly without the need for running `systemctl enable`.
The `[Install]` section described in `systemd.unit(5)` however is
not supported because it is a stateful process that does not fit well
into the NixOS design.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.slices.<name>.wants` {#opt-systemd.user.slices._name_.wants}

Start the specified units when this unit is started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets` {#opt-systemd.user.sockets}

Definition of systemd per-user socket units.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.after` {#opt-systemd.user.sockets._name_.after}

If the specified units are started at the same time as
this unit, delay this unit until they have started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.aliases` {#opt-systemd.user.sockets._name_.aliases}

Aliases of that unit.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.before` {#opt-systemd.user.sockets._name_.before}

If the specified units are started at the same time as
this unit, delay them until this unit has started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.bindsTo` {#opt-systemd.user.sockets._name_.bindsTo}

Like ‘requires’, but in addition, if the specified units
unexpectedly disappear, this unit will be stopped as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.conflicts` {#opt-systemd.user.sockets._name_.conflicts}

If the specified units are started, then this unit is stopped
and vice versa.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.description` {#opt-systemd.user.sockets._name_.description}

Description of this unit used in systemd messages and progress indicators.

*Type:* (optionally newline-terminated) single-line string

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.documentation` {#opt-systemd.user.sockets._name_.documentation}

A list of URIs referencing documentation for this unit or its configuration.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.enable` {#opt-systemd.user.sockets._name_.enable}

If set to false, this unit will be a symlink to
/dev/null. This is primarily useful to prevent specific
template instances
(e.g. `serial-getty@ttyS0`) from being
started. Note that `enable=true` does not
make a unit start by default at boot; if you want that, see
`wantedBy`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.listenDatagrams` {#opt-systemd.user.sockets._name_.listenDatagrams}

For each item in this list, a `ListenDatagram`
option in the `[Socket]` section will be created.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "0.0.0.0:993"
  "/run/my-socket"
]
```

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.listenStreams` {#opt-systemd.user.sockets._name_.listenStreams}

For each item in this list, a `ListenStream`
option in the `[Socket]` section will be created.

*Type:* list of (string or 16 bit unsigned integer; between 0 and 65535 (both inclusive) convertible to it)

*Default:* `[ ]`

*Example:*

``` nix
[
  "0.0.0.0:993"
  "/run/my-socket"
]
```

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.name` {#opt-systemd.user.sockets._name_.name}

The name of this systemd unit, including its extension.
This can be used to refer to this unit from other systemd units.

*Type:* string

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.onFailure` {#opt-systemd.user.sockets._name_.onFailure}

A list of one or more units that are activated when
this unit enters the "failed" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.onSuccess` {#opt-systemd.user.sockets._name_.onSuccess}

A list of one or more units that are activated when
this unit enters the "inactive" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.overrideStrategy` {#opt-systemd.user.sockets._name_.overrideStrategy}

Defines how unit configuration is provided for systemd:

`asDropinIfExists` creates a unit file when no unit file is provided by the package
otherwise it creates a drop-in file named `overrides.conf`.

`asDropin` creates a drop-in file named `overrides.conf`.
Mainly needed to define instances for systemd template units (e.g. `systemd-nspawn@mycontainer.service`).

See also `systemd.unit(5)`.

*Type:* one of "asDropinIfExists", "asDropin"

*Default:* `"asDropinIfExists"`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.partOf` {#opt-systemd.user.sockets._name_.partOf}

If the specified units are stopped or restarted, then this
unit is stopped or restarted as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.reloadTriggers` {#opt-systemd.user.sockets._name_.reloadTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be reloaded.  If anything but a reload trigger changes in the
unit file, the unit will be restarted instead.

*Type:* list of (systemd option)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.requiredBy` {#opt-systemd.user.sockets._name_.requiredBy}

Units that require (i.e. depend on and need to go down with) this unit.
As discussed in the `wantedBy` option description this also creates
`.requires` symlinks automatically.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.requires` {#opt-systemd.user.sockets._name_.requires}

Start the specified units when this unit is started, and stop
this unit when the specified units are stopped or fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.requisite` {#opt-systemd.user.sockets._name_.requisite}

Similar to requires. However if the units listed are not started,
they will not be started and the transaction will fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.restartTriggers` {#opt-systemd.user.sockets._name_.restartTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be restarted.

*Type:* list of unspecified value

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.socketConfig` {#opt-systemd.user.sockets._name_.socketConfig}

Each attribute in this set specifies an option in the
`[Socket]` section of the unit.  See
`systemd.socket(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  ListenStream = "/run/my-socket";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.startLimitBurst` {#opt-systemd.user.sockets._name_.startLimitBurst}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.startLimitIntervalSec` {#opt-systemd.user.sockets._name_.startLimitIntervalSec}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.unitConfig` {#opt-systemd.user.sockets._name_.unitConfig}

Each attribute in this set specifies an option in the
`[Unit]` section of the unit.  See
`systemd.unit(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  RequiresMountsFor = "/data";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.upheldBy` {#opt-systemd.user.sockets._name_.upheldBy}

Keep this unit running as long as the listed units are running. This is a continuously
enforced version of wantedBy.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.upholds` {#opt-systemd.user.sockets._name_.upholds}

Keeps the specified running while this unit is running. A continuous version of `wants`.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.wantedBy` {#opt-systemd.user.sockets._name_.wantedBy}

Units that want (i.e. depend on) this unit. The default method for
starting a unit by default at boot time is to set this option to
`["multi-user.target"]` for system services. Likewise for user units
(`systemd.user.<name>.*`) set it to `["default.target"]` to make a unit
start by default when the user `<name>` logs on.

This option creates a `.wants` symlink in the given target that exists
statelessly without the need for running `systemctl enable`.
The `[Install]` section described in `systemd.unit(5)` however is
not supported because it is a stateful process that does not fit well
into the NixOS design.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.sockets.<name>.wants` {#opt-systemd.user.sockets._name_.wants}

Start the specified units when this unit is started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets` {#opt-systemd.user.targets}

Definition of systemd per-user target units.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.after` {#opt-systemd.user.targets._name_.after}

If the specified units are started at the same time as
this unit, delay this unit until they have started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.aliases` {#opt-systemd.user.targets._name_.aliases}

Aliases of that unit.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.before` {#opt-systemd.user.targets._name_.before}

If the specified units are started at the same time as
this unit, delay them until this unit has started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.bindsTo` {#opt-systemd.user.targets._name_.bindsTo}

Like ‘requires’, but in addition, if the specified units
unexpectedly disappear, this unit will be stopped as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.conflicts` {#opt-systemd.user.targets._name_.conflicts}

If the specified units are started, then this unit is stopped
and vice versa.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.description` {#opt-systemd.user.targets._name_.description}

Description of this unit used in systemd messages and progress indicators.

*Type:* (optionally newline-terminated) single-line string

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.documentation` {#opt-systemd.user.targets._name_.documentation}

A list of URIs referencing documentation for this unit or its configuration.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.enable` {#opt-systemd.user.targets._name_.enable}

If set to false, this unit will be a symlink to
/dev/null. This is primarily useful to prevent specific
template instances
(e.g. `serial-getty@ttyS0`) from being
started. Note that `enable=true` does not
make a unit start by default at boot; if you want that, see
`wantedBy`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.name` {#opt-systemd.user.targets._name_.name}

The name of this systemd unit, including its extension.
This can be used to refer to this unit from other systemd units.

*Type:* string

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.onFailure` {#opt-systemd.user.targets._name_.onFailure}

A list of one or more units that are activated when
this unit enters the "failed" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.onSuccess` {#opt-systemd.user.targets._name_.onSuccess}

A list of one or more units that are activated when
this unit enters the "inactive" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.overrideStrategy` {#opt-systemd.user.targets._name_.overrideStrategy}

Defines how unit configuration is provided for systemd:

`asDropinIfExists` creates a unit file when no unit file is provided by the package
otherwise it creates a drop-in file named `overrides.conf`.

`asDropin` creates a drop-in file named `overrides.conf`.
Mainly needed to define instances for systemd template units (e.g. `systemd-nspawn@mycontainer.service`).

See also `systemd.unit(5)`.

*Type:* one of "asDropinIfExists", "asDropin"

*Default:* `"asDropinIfExists"`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.partOf` {#opt-systemd.user.targets._name_.partOf}

If the specified units are stopped or restarted, then this
unit is stopped or restarted as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.reloadTriggers` {#opt-systemd.user.targets._name_.reloadTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be reloaded.  If anything but a reload trigger changes in the
unit file, the unit will be restarted instead.

*Type:* list of (systemd option)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.requiredBy` {#opt-systemd.user.targets._name_.requiredBy}

Units that require (i.e. depend on and need to go down with) this unit.
As discussed in the `wantedBy` option description this also creates
`.requires` symlinks automatically.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.requires` {#opt-systemd.user.targets._name_.requires}

Start the specified units when this unit is started, and stop
this unit when the specified units are stopped or fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.requisite` {#opt-systemd.user.targets._name_.requisite}

Similar to requires. However if the units listed are not started,
they will not be started and the transaction will fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.restartTriggers` {#opt-systemd.user.targets._name_.restartTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be restarted.

*Type:* list of unspecified value

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.startLimitBurst` {#opt-systemd.user.targets._name_.startLimitBurst}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.startLimitIntervalSec` {#opt-systemd.user.targets._name_.startLimitIntervalSec}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.unitConfig` {#opt-systemd.user.targets._name_.unitConfig}

Each attribute in this set specifies an option in the
`[Unit]` section of the unit.  See
`systemd.unit(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  RequiresMountsFor = "/data";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.upheldBy` {#opt-systemd.user.targets._name_.upheldBy}

Keep this unit running as long as the listed units are running. This is a continuously
enforced version of wantedBy.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.upholds` {#opt-systemd.user.targets._name_.upholds}

Keeps the specified running while this unit is running. A continuous version of `wants`.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.wantedBy` {#opt-systemd.user.targets._name_.wantedBy}

Units that want (i.e. depend on) this unit. The default method for
starting a unit by default at boot time is to set this option to
`["multi-user.target"]` for system services. Likewise for user units
(`systemd.user.<name>.*`) set it to `["default.target"]` to make a unit
start by default when the user `<name>` logs on.

This option creates a `.wants` symlink in the given target that exists
statelessly without the need for running `systemctl enable`.
The `[Install]` section described in `systemd.unit(5)` however is
not supported because it is a stateful process that does not fit well
into the NixOS design.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.targets.<name>.wants` {#opt-systemd.user.targets._name_.wants}

Start the specified units when this unit is started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers` {#opt-systemd.user.timers}

Definition of systemd per-user timer units.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.after` {#opt-systemd.user.timers._name_.after}

If the specified units are started at the same time as
this unit, delay this unit until they have started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.aliases` {#opt-systemd.user.timers._name_.aliases}

Aliases of that unit.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.before` {#opt-systemd.user.timers._name_.before}

If the specified units are started at the same time as
this unit, delay them until this unit has started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.bindsTo` {#opt-systemd.user.timers._name_.bindsTo}

Like ‘requires’, but in addition, if the specified units
unexpectedly disappear, this unit will be stopped as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.conflicts` {#opt-systemd.user.timers._name_.conflicts}

If the specified units are started, then this unit is stopped
and vice versa.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.description` {#opt-systemd.user.timers._name_.description}

Description of this unit used in systemd messages and progress indicators.

*Type:* (optionally newline-terminated) single-line string

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.documentation` {#opt-systemd.user.timers._name_.documentation}

A list of URIs referencing documentation for this unit or its configuration.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.enable` {#opt-systemd.user.timers._name_.enable}

If set to false, this unit will be a symlink to
/dev/null. This is primarily useful to prevent specific
template instances
(e.g. `serial-getty@ttyS0`) from being
started. Note that `enable=true` does not
make a unit start by default at boot; if you want that, see
`wantedBy`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.name` {#opt-systemd.user.timers._name_.name}

The name of this systemd unit, including its extension.
This can be used to refer to this unit from other systemd units.

*Type:* string

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.onFailure` {#opt-systemd.user.timers._name_.onFailure}

A list of one or more units that are activated when
this unit enters the "failed" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.onSuccess` {#opt-systemd.user.timers._name_.onSuccess}

A list of one or more units that are activated when
this unit enters the "inactive" state.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.overrideStrategy` {#opt-systemd.user.timers._name_.overrideStrategy}

Defines how unit configuration is provided for systemd:

`asDropinIfExists` creates a unit file when no unit file is provided by the package
otherwise it creates a drop-in file named `overrides.conf`.

`asDropin` creates a drop-in file named `overrides.conf`.
Mainly needed to define instances for systemd template units (e.g. `systemd-nspawn@mycontainer.service`).

See also `systemd.unit(5)`.

*Type:* one of "asDropinIfExists", "asDropin"

*Default:* `"asDropinIfExists"`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.partOf` {#opt-systemd.user.timers._name_.partOf}

If the specified units are stopped or restarted, then this
unit is stopped or restarted as well.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.reloadTriggers` {#opt-systemd.user.timers._name_.reloadTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be reloaded.  If anything but a reload trigger changes in the
unit file, the unit will be restarted instead.

*Type:* list of (systemd option)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.requiredBy` {#opt-systemd.user.timers._name_.requiredBy}

Units that require (i.e. depend on and need to go down with) this unit.
As discussed in the `wantedBy` option description this also creates
`.requires` symlinks automatically.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.requires` {#opt-systemd.user.timers._name_.requires}

Start the specified units when this unit is started, and stop
this unit when the specified units are stopped or fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.requisite` {#opt-systemd.user.timers._name_.requisite}

Similar to requires. However if the units listed are not started,
they will not be started and the transaction will fail.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.restartTriggers` {#opt-systemd.user.timers._name_.restartTriggers}

An arbitrary list of items such as derivations.  If any item
in the list changes between reconfigurations, the service will
be restarted.

*Type:* list of unspecified value

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.startLimitBurst` {#opt-systemd.user.timers._name_.startLimitBurst}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.startLimitIntervalSec` {#opt-systemd.user.timers._name_.startLimitIntervalSec}

Configure unit start rate limiting. Units which are started
more than startLimitBurst times within an interval time
interval are not permitted to start any more.

*Type:* signed integer

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.timerConfig` {#opt-systemd.user.timers._name_.timerConfig}

Each attribute in this set specifies an option in the
`[Timer]` section of the unit.  See
`systemd.timer(5)` and
`systemd.time(7)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  OnCalendar = "Sun 14:00:00";
  Unit = "foo.service";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.unitConfig` {#opt-systemd.user.timers._name_.unitConfig}

Each attribute in this set specifies an option in the
`[Unit]` section of the unit.  See
`systemd.unit(5)` for details.

*Type:* attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  RequiresMountsFor = "/data";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.upheldBy` {#opt-systemd.user.timers._name_.upheldBy}

Keep this unit running as long as the listed units are running. This is a continuously
enforced version of wantedBy.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.upholds` {#opt-systemd.user.timers._name_.upholds}

Keeps the specified running while this unit is running. A continuous version of `wants`.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.wantedBy` {#opt-systemd.user.timers._name_.wantedBy}

Units that want (i.e. depend on) this unit. The default method for
starting a unit by default at boot time is to set this option to
`["multi-user.target"]` for system services. Likewise for user units
(`systemd.user.<name>.*`) set it to `["default.target"]` to make a unit
start by default when the user `<name>` logs on.

This option creates a `.wants` symlink in the given target that exists
statelessly without the need for running `systemctl enable`.
The `[Install]` section described in `systemd.unit(5)` however is
not supported because it is a stateful process that does not fit well
into the NixOS design.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.timers.<name>.wants` {#opt-systemd.user.timers._name_.wants}

Start the specified units when this unit is started.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.tmpfiles.enable` {#opt-systemd.user.tmpfiles.enable}

Whether to enable systemd user units systemd-tmpfiles-setup.service and systemd-tmpfiles-clean.timer.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.tmpfiles.rules` {#opt-systemd.user.tmpfiles.rules}

Global user rules for creation, deletion and cleaning of volatile and
temporary files automatically. See
`tmpfiles.d(5)`
for the exact format.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "D %C - - - 7d"
]
```

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.tmpfiles.users` {#opt-systemd.user.tmpfiles.users}

Per-user rules for creation, deletion and cleaning of volatile and
temporary files automatically.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.tmpfiles.users.<name>.rules` {#opt-systemd.user.tmpfiles.users._name_.rules}

Per-user rules for creation, deletion and cleaning of volatile and
temporary files automatically. See
`tmpfiles.d(5)`
for the exact format.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "D %C - - - 7d"
]
```

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.units` {#opt-systemd.user.units}

Definition of systemd per-user units.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.units.<name>.aliases` {#opt-systemd.user.units._name_.aliases}

Aliases of that unit.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.units.<name>.enable` {#opt-systemd.user.units._name_.enable}

If set to false, this unit will be a symlink to
/dev/null. This is primarily useful to prevent specific
template instances
(e.g. `serial-getty@ttyS0`) from being
started. Note that `enable=true` does not
make a unit start by default at boot; if you want that, see
`wantedBy`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.units.<name>.name` {#opt-systemd.user.units._name_.name}

The name of this systemd unit, including its extension.
This can be used to refer to this unit from other systemd units.

*Type:* string

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.units.<name>.overrideStrategy` {#opt-systemd.user.units._name_.overrideStrategy}

Defines how unit configuration is provided for systemd:

`asDropinIfExists` creates a unit file when no unit file is provided by the package
otherwise it creates a drop-in file named `overrides.conf`.

`asDropin` creates a drop-in file named `overrides.conf`.
Mainly needed to define instances for systemd template units (e.g. `systemd-nspawn@mycontainer.service`).

See also `systemd.unit(5)`.

*Type:* one of "asDropinIfExists", "asDropin"

*Default:* `"asDropinIfExists"`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.units.<name>.requiredBy` {#opt-systemd.user.units._name_.requiredBy}

Units that require (i.e. depend on and need to go down with) this unit.
As discussed in the `wantedBy` option description this also creates
`.requires` symlinks automatically.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.units.<name>.text` {#opt-systemd.user.units._name_.text}

Text of this systemd unit.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.units.<name>.upheldBy` {#opt-systemd.user.units._name_.upheldBy}

Keep this unit running as long as the listed units are running. This is a continuously
enforced version of wantedBy.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)

## `systemd.user.units.<name>.wantedBy` {#opt-systemd.user.units._name_.wantedBy}

Units that want (i.e. depend on) this unit. The default method for
starting a unit by default at boot time is to set this option to
`["multi-user.target"]` for system services. Likewise for user units
(`systemd.user.<name>.*`) set it to `["default.target"]` to make a unit
start by default when the user `<name>` logs on.

This option creates a `.wants` symlink in the given target that exists
statelessly without the need for running `systemctl enable`.
The `[Install]` section described in `systemd.unit(5)` however is
not supported because it is a stateful process that does not fit well
into the NixOS design.

*Type:* list of string matching the pattern \[a-zA-Z0-9@%:\_.\\-\]+[.](../../service|socket|device|mount|automount|swap|target|path|timer|scope|slice)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/user.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/user.nix)
