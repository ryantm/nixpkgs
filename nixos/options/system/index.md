# system {#sec-options-system}

## `system.activatable` {#opt-system.activatable}

Whether to add the activation script to the system profile.

The default, to have the script available all the time, is what we normally
do, but for image based systems, this may not be needed or not be desirable.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/activation/activatable-system.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/activatable-system.nix)

## `system.activationScripts` {#opt-system.activationScripts}

A set of shell script fragments that are executed when a NixOS
system configuration is activated.  Examples are updating
/etc, creating accounts, and so on.  Since these are executed
every time you boot the system or run
`nixos-rebuild`, it's important that they are
idempotent and fast.

*Type:* attribute set of (string or (submodule))

*Default:* `{ }`

*Example:*

``` nix
{
  stdio = {
    # Run after /dev has been mounted
    deps = [ "specialfs" ];
    text =
      ''
        # Needed by some programs.
        ln -sfn /proc/self/fd /dev/fd
        ln -sfn /proc/self/fd/0 /dev/stdin
        ln -sfn /proc/self/fd/1 /dev/stdout
        ln -sfn /proc/self/fd/2 /dev/stderr
      '';
  };
}
```

*Declared by:* [`nixos/modules/system/activation/activation-script.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/activation-script.nix)

## `system.autoUpgrade.allowReboot` {#opt-system.autoUpgrade.allowReboot}

Reboot the system into the new generation instead of a switch
if the new generation uses a different kernel, kernel modules
or initrd than the booted system.
See `rebootWindow` for configuring the times at which a reboot is allowed.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/auto-upgrade.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/auto-upgrade.nix)

## `system.autoUpgrade.channel` {#opt-system.autoUpgrade.channel}

The URI of the NixOS channel to use for automatic
upgrades. By default, this is the channel set using
`nix-channel` (run `nix-channel --list`
to see the current value).

*Type:* null or string

*Default:* `null`

*Example:* `"https://channels.nixos.org/nixos-14.12-small"`

*Declared by:* [`nixos/modules/tasks/auto-upgrade.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/auto-upgrade.nix)

## `system.autoUpgrade.dates` {#opt-system.autoUpgrade.dates}

How often or when upgrade occurs. For most desktop and server systems
a sufficient upgrade frequency is once a day.

The format is described in
`systemd.time(7)`.

*Type:* string

*Default:* `"04:40"`

*Example:* `"daily"`

*Declared by:* [`nixos/modules/tasks/auto-upgrade.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/auto-upgrade.nix)

## `system.autoUpgrade.enable` {#opt-system.autoUpgrade.enable}

Whether to periodically upgrade NixOS to the latest
version. If enabled, a systemd timer will run
`nixos-rebuild switch --upgrade` once a
day.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/auto-upgrade.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/auto-upgrade.nix)

## `system.autoUpgrade.fixedRandomDelay` {#opt-system.autoUpgrade.fixedRandomDelay}

Make the randomized delay consistent between runs.
This reduces the jitter between automatic upgrades.
See `randomizedDelaySec` for configuring the randomized delay.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/tasks/auto-upgrade.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/auto-upgrade.nix)

## `system.autoUpgrade.flags` {#opt-system.autoUpgrade.flags}

Any additional flags passed to `nixos-rebuild`.

If you are using flakes and use a local repo you can add
`[ "--update-input" "nixpkgs" "--commit-lock-file" ]`
to update nixpkgs.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-I"
  "stuff=/home/alice/nixos-stuff"
  "--option"
  "extra-binary-caches"
  "http://my-cache.example.org/"
]
```

*Declared by:* [`nixos/modules/tasks/auto-upgrade.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/auto-upgrade.nix)

## `system.autoUpgrade.flake` {#opt-system.autoUpgrade.flake}

The Flake URI of the NixOS configuration to build.
Disables the option [`system.autoUpgrade.channel`](#opt-system.autoUpgrade.channel).

*Type:* null or string

*Default:* `null`

*Example:* `"github:kloenk/nix"`

*Declared by:* [`nixos/modules/tasks/auto-upgrade.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/auto-upgrade.nix)

## `system.autoUpgrade.operation` {#opt-system.autoUpgrade.operation}

Whether to run
`nixos-rebuild switch --upgrade` or run
`nixos-rebuild boot --upgrade`

*Type:* one of "switch", "boot"

*Default:* `"switch"`

*Example:* `"boot"`

*Declared by:* [`nixos/modules/tasks/auto-upgrade.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/auto-upgrade.nix)

## `system.autoUpgrade.persistent` {#opt-system.autoUpgrade.persistent}

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

*Declared by:* [`nixos/modules/tasks/auto-upgrade.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/auto-upgrade.nix)

## `system.autoUpgrade.randomizedDelaySec` {#opt-system.autoUpgrade.randomizedDelaySec}

Add a randomized delay before each automatic upgrade.
The delay will be chosen between zero and this value.
This value must be a time span in the format specified by
`systemd.time(7)`

*Type:* string

*Default:* `"0"`

*Example:* `"45min"`

*Declared by:* [`nixos/modules/tasks/auto-upgrade.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/auto-upgrade.nix)

## `system.autoUpgrade.rebootWindow` {#opt-system.autoUpgrade.rebootWindow}

Define a lower and upper time value (in HH:MM format) which
constitute a time window during which reboots are allowed
immediately after the upgrade finishes.

This option only has an effect when `allowReboot` is enabled.
The default value of `null` means that reboots are allowed at any time.

If the system should be rebooted but the time window is missed,
no reboot will be scheduled, and no switch will be performed.
The reboot will be reattempted after the next upgrade operation,
even when no further system upgrades are available,
as long as the time window is then met.
Therefore `dates` (with and without `randomizedDelaySec`)
should be enclosed by the time window.

*Type:* null or (submodule)

*Default:* `null`

*Example:*

``` nix
{
  lower = "01:00";
  upper = "05:00";
}
```

*Declared by:* [`nixos/modules/tasks/auto-upgrade.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/auto-upgrade.nix)

## `system.autoUpgrade.rebootWindow.lower` {#opt-system.autoUpgrade.rebootWindow.lower}

Lower limit of the reboot window

*Type:* string matching the pattern \[\[:digit:\]\]{2}:\[\[:digit:\]\]{2}

*Example:* `"01:00"`

*Declared by:* [`nixos/modules/tasks/auto-upgrade.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/auto-upgrade.nix)

## `system.autoUpgrade.rebootWindow.upper` {#opt-system.autoUpgrade.rebootWindow.upper}

Upper limit of the reboot window

*Type:* string matching the pattern \[\[:digit:\]\]{2}:\[\[:digit:\]\]{2}

*Example:* `"05:00"`

*Declared by:* [`nixos/modules/tasks/auto-upgrade.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/auto-upgrade.nix)

## `system.autoUpgrade.runGarbageCollection` {#opt-system.autoUpgrade.runGarbageCollection}

Whether to automatically run `nix-gc.service` after a successful
system upgrade.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/auto-upgrade.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/auto-upgrade.nix)

## `system.autoUpgrade.upgrade` {#opt-system.autoUpgrade.upgrade}

Disable adding the `--upgrade` parameter when `channel`
is not set, such as when upgrading to the latest version
of a flake honouring its lockfile.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/tasks/auto-upgrade.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/auto-upgrade.nix)

## `system.boot.extraInitrd.paths` {#opt-system.boot.extraInitrd.paths}

List of paths relative to the ESP that are combined with the NixOS
main initrd before being passed to the kernel.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/extra-initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/extra-initrd.nix)

## `system.build` {#opt-system.build}

Attribute set of derivations used to set up the system.

*Type:* open submodule of lazy attribute set of unspecified value

*Default:* `{ }`

*Declared by:*

- [`nixos/modules/system/build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/build.nix)
- [`nixos/modules/hardware/facter/debug.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/debug.nix)
- [`nixos/modules/system/activation/top-level.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/top-level.nix)
- [`nixos/modules/system/activation/activation-script.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/activation-script.nix)
- [`nixos/modules/system/activation/activatable-system.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/activatable-system.nix)
- [`nixos/modules/services/monitoring/opentelemetry-collector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/opentelemetry-collector.nix)
- [`nixos/modules/image/images.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/images.nix)

## `system.build.images` {#opt-system.build.images}

Different target images generated for this NixOS configuration.

*Type:* lazy attribute set of raw value

*Default:* `{ }`

*Read only*

*Declared by:* [`nixos/modules/image/images.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/images.nix)

## `system.build.noFacter` {#opt-system.build.noFacter}

A version of the system closure with facter disabled

*Type:* unspecified value

*Declared by:* [`nixos/modules/hardware/facter/debug.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/debug.nix)

## `system.build.separateActivationScript` {#opt-system.build.separateActivationScript}

A separate activation script package that's not part of the system profile.

This is useful for configurations where `system.activatable` is `false`.
Otherwise, you can just use `system.build.toplevel`.

*Type:* package

*Declared by:* [`nixos/modules/system/activation/activatable-system.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/activatable-system.nix)

## `system.build.toplevel` {#opt-system.build.toplevel}

This option contains the store path that typically represents a NixOS system.

You can read this path in a custom deployment tool for example.

*Type:* package

*Read only*

*Declared by:* [`nixos/modules/system/activation/top-level.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/top-level.nix)

## `system.checks` {#opt-system.checks}

Packages that are added as dependencies of the system's build, usually
for the purpose of validating some part of the configuration.

Unlike `system.extraDependencies`, these store paths do not
become part of the built system configuration.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/activation/top-level.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/top-level.nix)

## `system.configurationRevision` {#opt-system.configurationRevision}

The Git revision of the top-level flake from which this configuration was built.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/misc/version.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/version.nix)

## `system.copySystemConfiguration` {#opt-system.copySystemConfiguration}

If enabled, copies the NixOS configuration file
(usually `/etc/nixos/configuration.nix`)
and symlinks it from the resulting system
(getting to `/run/current-system/configuration.nix`).
Note that only this single file is copied, even if it imports others.
Warning: This feature cannot be used when the system is configured by a flake

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/activation/top-level.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/top-level.nix)

## `system.etc.overlay.enable` {#opt-system.etc.overlay.enable}

Mount `/etc` as an overlayfs instead of generating it via a perl script.

Note: This is currently experimental. Only enable this option if you're
confident that you can recover your system if it breaks.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/etc/etc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/etc/etc.nix)

## `system.etc.overlay.mutable` {#opt-system.etc.overlay.mutable}

Whether to mount `/etc` mutably (i.e. read-write) or immutably (i.e. read-only).

If this is false, only the immutable lowerdir is mounted. If it is
true, a writable upperdir is mounted on top.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/etc/etc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/etc/etc.nix)

## `system.extraDependencies` {#opt-system.extraDependencies}

A list of paths that should be included in the system
closure but generally not visible to users.

This option has also been used for build-time checks, but the
`system.checks` option is more appropriate for that purpose as checks
should not leave a trace in the built system configuration.

*Type:* list of path in the Nix store

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/activation/top-level.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/top-level.nix)

## `system.forbiddenDependenciesRegexes` {#opt-system.forbiddenDependenciesRegexes}

POSIX Extended Regular Expressions that match store paths that
should not appear in the system closure, with the exception of [`system.extraDependencies`](#opt-system.extraDependencies), which is not checked.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-dev$"
]
```

*Declared by:* [`nixos/modules/system/activation/top-level.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/top-level.nix)

## `system.image.id` {#opt-system.image.id}

Image identifier.

This corresponds to the `IMAGE_ID` field in `os-release(5)`. See the
upstream docs for more details on valid characters for this field:
[https://www.freedesktop.org/software/systemd/man/latest/os-release.html#IMAGE\_ID=](https://www.freedesktop.org/software/systemd/man/latest/os-release.html#IMAGE_ID=)

You would only want to set this option if you're build NixOS appliance images.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/misc/version.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/version.nix)

## `system.image.version` {#opt-system.image.version}

Image version.

This corresponds to the `IMAGE_VERSION` field in `os-release(5)`. See the
upstream docs for more details on valid characters for this field:
[https://www.freedesktop.org/software/systemd/man/latest/os-release.html#IMAGE\_VERSION=](https://www.freedesktop.org/software/systemd/man/latest/os-release.html#IMAGE_VERSION=)

You would only want to set this option if you're build NixOS appliance images.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/misc/version.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/version.nix)

## `system.includeBuildDependencies` {#opt-system.includeBuildDependencies}

Whether to include the build closure of the whole system in
its runtime closure.  This can be useful for making changes
fully offline, as it includes all sources, patches, and
intermediate outputs required to build all the derivations
that the system depends on.

Note that this includes *all* the derivations, down from the
included applications to their sources, the compilers used to
build them, and even the bootstrap compiler used to compile
the compilers. This increases the size of the system and the
time needed to download its dependencies drastically: a
minimal configuration with no extra services enabled grows
from ~670MiB in size to 13.5GiB, and takes proportionally
longer to download.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/activation/top-level.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/top-level.nix)

## `system.name` {#opt-system.name}

The name of the system used in the [`system.build.toplevel`](#opt-system.build.toplevel) derivation.

That derivation has the following name:
`"nixos-system-${config.system.name}-${config.system.nixos.label}"`

*Type:* string

*Default:*

``` nix
if config.networking.hostName == ""
then "unnamed"
else config.networking.hostName;
```

*Declared by:* [`nixos/modules/system/activation/top-level.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/top-level.nix)

## `system.nixos-init.enable` {#opt-system.nixos-init.enable}

Whether to enable nixos-init, a system for bashless initialization.

This doesn't use any `activationScripts`. Anything set in these options is
a no-op here.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/activation/nixos-init.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/nixos-init.nix)

## `system.nixos-init.package` {#opt-system.nixos-init.package}

The nixos-init package to use.

*Type:* package

*Default:* `pkgs.nixos-init`

*Declared by:* [`nixos/modules/system/activation/nixos-init.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/nixos-init.nix)

## `system.nixos.codeName` {#opt-system.nixos.codeName}

The NixOS release code name (e.g. `Emu`).

*Type:* string

*Default:* `"Axolotl"`

*Read only*

*Declared by:* [`nixos/modules/misc/version.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/version.nix)

## `system.nixos.label` {#opt-system.nixos.label}

NixOS version name to be used in the names of generated
outputs and boot labels.

If you ever wanted to influence the labels in your GRUB menu,
this is the option for you.

It can only contain letters, numbers and the following symbols:
`:`, `_`, `.` and `-`.

The default is [`system.nixos.tags`](#opt-system.nixos.tags) separated by
"-" + "-" + `NIXOS_LABEL_VERSION` environment
variable (defaults to the value of
`system.nixos.version`).

Can be overridden by setting `NIXOS_LABEL`.

Useful for not loosing track of configurations built from different
nixos branches/revisions, e.g.:

```
#!/bin/sh
today=`date +%Y%m%d`
branch=`(cd nixpkgs ; git branch 2>/dev/null | sed -n '/^\* / { s|^\* ||; p; }')`
revision=`(cd nixpkgs ; git rev-parse HEAD)`
export NIXOS_LABEL_VERSION="$today.$branch-${revision:0:7}"
nixos-rebuild switch
```

*Type:* string matching the pattern \[a-zA-Z0-9:\_.-\]\*

*Declared by:* [`nixos/modules/misc/label.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/label.nix)

## `system.nixos.release` {#opt-system.nixos.release}

The NixOS release (e.g. `16.03`).

*Type:* string

*Default:* `"27.05"`

*Read only*

*Declared by:* [`nixos/modules/misc/version.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/version.nix)

## `system.nixos.tags` {#opt-system.nixos.tags}

Strings to prefix to the default
[`system.nixos.label`](#opt-system.nixos.label).

Useful for not losing track of configurations built with
different options, e.g.:

```
{
  system.nixos.tags = [ "with-xen" ];
  virtualisation.xen.enable = true;
}
```

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "with-xen"
]
```

*Declared by:* [`nixos/modules/misc/label.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/label.nix)

## `system.nixos.variantName` {#opt-system.nixos.variantName}

A string identifying a specific variant or edition of the operating system suitable for presentation to the user

*Type:* null or string

*Default:* `null`

*Example:* `"NixOS Installer Image"`

*Declared by:* [`nixos/modules/misc/version.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/version.nix)

## `system.nixos.variant_id` {#opt-system.nixos.variant_id}

A lower-case string identifying a specific variant or edition of the operating system

*Type:* null or string matching the pattern ^\[a-z0-9.\_-\]+$

*Default:* `null`

*Example:* `"installer"`

*Declared by:* [`nixos/modules/misc/version.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/version.nix)

## `system.nssDatabases.group` {#opt-system.nssDatabases.group}

List of group entries to configure in `/etc/nsswitch.conf`.

Note that "files" is always prepended while "systemd" is appended if nscd is enabled.

This option only takes effect if nscd is enabled.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/config/nsswitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nsswitch.nix)

## `system.nssDatabases.hosts` {#opt-system.nssDatabases.hosts}

List of hosts entries to configure in `/etc/nsswitch.conf`.

Note that "files" is always prepended, and "dns" and "myhostname" are always appended.

This option only takes effect if nscd is enabled.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/config/nsswitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nsswitch.nix)

## `system.nssDatabases.passwd` {#opt-system.nssDatabases.passwd}

List of passwd entries to configure in `/etc/nsswitch.conf`.

Note that "files" is always prepended while "systemd" is appended if nscd is enabled.

This option only takes effect if nscd is enabled.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/config/nsswitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nsswitch.nix)

## `system.nssDatabases.services` {#opt-system.nssDatabases.services}

List of services entries to configure in `/etc/nsswitch.conf`.

Note that "files" is always prepended.

This option only takes effect if nscd is enabled.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/config/nsswitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nsswitch.nix)

## `system.nssDatabases.shadow` {#opt-system.nssDatabases.shadow}

List of shadow entries to configure in `/etc/nsswitch.conf`.

Note that "files" is always prepended.

This option only takes effect if nscd is enabled.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/config/nsswitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nsswitch.nix)

## `system.nssDatabases.subgid` {#opt-system.nssDatabases.subgid}

List of subgid entries to configure in `/etc/nsswitch.conf`.

Note that "files" is always prepended.

This option only takes effect if nscd is enabled.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/config/nsswitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nsswitch.nix)

## `system.nssDatabases.subuid` {#opt-system.nssDatabases.subuid}

List of subuid entries to configure in `/etc/nsswitch.conf`.

Note that "files" is always prepended.

This option only takes effect if nscd is enabled.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/config/nsswitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nsswitch.nix)

## `system.nssDatabases.sudoers` {#opt-system.nssDatabases.sudoers}

List of sudoers entries to configure in `/etc/nsswitch.conf`.

Note that "files" is always prepended.

This option only takes effect if nscd is enabled.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/config/nsswitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/nsswitch.nix)

## `system.preSwitchChecks` {#opt-system.preSwitchChecks}

A set of shell script fragments that are executed before the switch to a
new NixOS system configuration. A failure in any of these fragments will
cause the switch to fail and exit early.
The scripts receive the new configuration path and the action verb passed
to switch-to-configuration, as the first and second positional arguments
(meaning that you can access them using `$1` and `$2`, respectively).

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{ failsEveryTime =
  ''
    false
  '';
}
```

*Declared by:* [`nixos/modules/system/activation/pre-switch-check.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/pre-switch-check.nix)

## `system.replaceDependencies.cutoffPackages` {#opt-system.replaceDependencies.cutoffPackages}

Packages to which no replacements should be applied.
The initrd is matched by default, because its structure renders the replacement process ineffective and prone to breakage.

*Type:* list of package

*Default:* `lib.optionals config.boot.initrd.enable [ config.system.build.initialRamdisk ]`

*Declared by:* [`nixos/modules/system/activation/top-level.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/top-level.nix)

## `system.replaceDependencies.replacements` {#opt-system.replaceDependencies.replacements}

List of packages to override without doing a full rebuild.
The original derivation and replacement derivation must have the same
name length, and ideally should have close-to-identical directory layout.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:* `[ ({ oldDependency = pkgs.openssl; newDependency = pkgs.callPackage /path/to/openssl { }; }) ]`

*Declared by:* [`nixos/modules/system/activation/top-level.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/top-level.nix)

## `system.replaceDependencies.replacements.*.newDependency` {#opt-system.replaceDependencies.replacements._.newDependency}

The replacement package.

*Type:* package

*Declared by:* [`nixos/modules/system/activation/top-level.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/top-level.nix)

## `system.replaceDependencies.replacements.*.oldDependency` {#opt-system.replaceDependencies.replacements._.oldDependency}

The original package to override.

*Type:* package

*Declared by:* [`nixos/modules/system/activation/top-level.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/top-level.nix)

## `system.services` {#opt-system.services}

A collection of NixOS [modular services](https://nixos.org/manual/nixos/unstable/#modular-services) that are configured as systemd services.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/service/systemd/system.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/service/systemd/system.nix)

## `system.stateVersion` {#opt-system.stateVersion}

This option defines the first version of NixOS you have installed on this particular machine,
and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.

For example, if NixOS version XX.YY ships with AwesomeDB version N by default, and is then
upgraded to version XX.YY+1, which ships AwesomeDB version N+1, the existing databases
may no longer be compatible, causing applications to fail, or even leading to data loss.

The `stateVersion` mechanism avoids this situation by making the default version of such packages
conditional on the first version of NixOS you've installed (encoded in `stateVersion`), instead of
simply always using the latest one.

Note that this generally only affects applications that can't upgrade their data automatically -
applications and services supporting automatic migrations will remain on latest versions when
you upgrade.

Most users should **never** change this value after the initial install, for any reason,
even if you've upgraded your system to a new NixOS release.

This value does **not** affect the Nixpkgs version your packages and OS are pulled from,
so changing it will **not** upgrade your system.

This value being lower than the current NixOS release does **not** mean your system is
out of date, out of support, or vulnerable.

Do **not** change this value unless you have manually inspected all the changes it would
make to your configuration, and migrated your data accordingly.

*Type:* string

*Default:* `config.system.nixos.release`

*Declared by:* [`nixos/modules/misc/version.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/version.nix)

## `system.switch.enable` {#opt-system.switch.enable}

Whether to include the capability to switch configurations.

Disabling this makes the system unable to be reconfigured via `nixos-rebuild`.

This is good for image based appliances where updates are handled
outside the image. Reducing features makes the image lighter and
slightly more secure.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/activation/switchable-system.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/switchable-system.nix)

## `system.switch.inhibitors` {#opt-system.switch.inhibitors}

Attribute set of strings that will prevent switching into a configuration when
they change.
The switch can be manually forced on the command line if required.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/activation/switchable-system.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/switchable-system.nix)

## `system.tools.nixos-build-vms.enable` {#opt-system.tools.nixos-build-vms.enable}

Whether to enable nixos-build-vms script.

*Type:* boolean

*Default:* `config.nix.enable && !config.system.disableInstallerTools`

*Example:* `true`

*Declared by:* [`nixos/modules/installer/tools/tools.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/installer/tools/tools.nix)

## `system.tools.nixos-enter.enable` {#opt-system.tools.nixos-enter.enable}

Whether to enable nixos-enter script.

*Type:* boolean

*Default:* `config.nix.enable && !config.system.disableInstallerTools`

*Example:* `true`

*Declared by:* [`nixos/modules/installer/tools/tools.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/installer/tools/tools.nix)

## `system.tools.nixos-generate-config.enable` {#opt-system.tools.nixos-generate-config.enable}

Whether to enable nixos-generate-config script.

*Type:* boolean

*Default:* `config.nix.enable && !config.system.disableInstallerTools`

*Example:* `true`

*Declared by:* [`nixos/modules/installer/tools/tools.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/installer/tools/tools.nix)

## `system.tools.nixos-install.enable` {#opt-system.tools.nixos-install.enable}

Whether to enable nixos-install script.

*Type:* boolean

*Default:* `config.nix.enable && !config.system.disableInstallerTools`

*Example:* `true`

*Declared by:* [`nixos/modules/installer/tools/tools.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/installer/tools/tools.nix)

## `system.tools.nixos-option.enable` {#opt-system.tools.nixos-option.enable}

Whether to enable nixos-option script.

*Type:* boolean

*Default:* `config.nix.enable && !config.system.disableInstallerTools`

*Example:* `true`

*Declared by:* [`nixos/modules/installer/tools/tools.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/installer/tools/tools.nix)

## `system.tools.nixos-rebuild.enable` {#opt-system.tools.nixos-rebuild.enable}

Whether to enable nixos-rebuild script.

*Type:* boolean

*Default:* `config.nix.enable && !config.system.disableInstallerTools`

*Example:* `true`

*Declared by:* [`nixos/modules/installer/tools/tools.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/installer/tools/tools.nix)

## `system.tools.nixos-rebuild.enableRun0Elevation` {#opt-system.tools.nixos-rebuild.enableRun0Elevation}

Whether to enable support for being targeted by `nixos-rebuild --elevate=run0 --ask-elevate-password`.

This enables polkit and adds `polkit-stdin-agent` to
[`environment.systemPackages`](../../options/environment/index.md#opt-environment.systemPackages) so that a deploying host
can find a target-architecture agent at
`<toplevel>/sw/bin/polkit-stdin-agent` after copying the
closure (which is required for cross-architecture deploys and
mismatched nixpkgs revisions to work).
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/installer/tools/tools.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/installer/tools/tools.nix)

## `system.tools.nixos-version.enable` {#opt-system.tools.nixos-version.enable}

Whether to enable nixos-version script.

*Type:* boolean

*Default:* `config.nix.enable && !config.system.disableInstallerTools`

*Example:* `true`

*Declared by:* [`nixos/modules/installer/tools/tools.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/installer/tools/tools.nix)

## `system.userActivationScripts` {#opt-system.userActivationScripts}

A set of shell script fragments that are executed by a systemd user
service when a NixOS system configuration is activated. Examples are
rebuilding the .desktop file cache for showing applications in the menu.
Since these are executed every time you run
`nixos-rebuild`, it's important that they are
idempotent and fast.

*Type:* attribute set of (string or (submodule))

*Default:* `{ }`

*Example:*

``` nix
{ plasmaSetup = {
    text = ''
      ${pkgs.libsForQt5.kservice}/bin/kbuildsycoca5"
    '';
    deps = [];
  };
}
```

*Declared by:* [`nixos/modules/system/activation/activation-script.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/activation-script.nix)
