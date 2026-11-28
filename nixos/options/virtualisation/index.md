# virtualisation {#sec-options-virtualisation}

## `virtualisation.additionalPaths` {#opt-virtualisation.additionalPaths}

A list of paths whose closure should be made available to
the VM.

When the Nix store is mounted from the host, the closure is registered
in the Nix database in the VM. All other paths in the host Nix store
appear in the guest Nix store as well, but are considered garbage
(because they are not registered in the Nix database of the guest).

When [`virtualisation.useNixStoreImage`](#opt-virtualisation.useNixStoreImage) is
set, the closure is copied to the Nix store image.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.appvm.enable` {#opt-virtualisation.appvm.enable}

This enables AppVMs and related virtualisation settings.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/appvm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/appvm.nix)

## `virtualisation.appvm.user` {#opt-virtualisation.appvm.user}

AppVM user login. Currently only AppVMs are supported for a single user only.

*Type:* string

*Declared by:* [`nixos/modules/virtualisation/appvm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/appvm.nix)

## `virtualisation.bios` {#opt-virtualisation.bios}

An alternate BIOS (such as `qboot`) with which to start the VM.
Should contain a file named `bios.bin`.
If `null`, QEMU's builtin SeaBIOS will be used.

*Type:* null or package

*Default:* `null`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.bootLoaderDevice` {#opt-virtualisation.bootLoaderDevice}

The path (inside th VM) to the device to boot from when legacy booting.

*Type:* absolute path

*Default:* `/dev/disk/by-id/virtio-root`

*Example:* `"/dev/disk/by-id/virtio-boot-loader-device"`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.bootPartition` {#opt-virtualisation.bootPartition}

The path (inside the VM) to the device containing the EFI System Partition (ESP).

If you are *not* booting from a UEFI firmware, this value is, by
default, `null`. The ESP is mounted to `boot.loader.efi.efiSysMountpoint`.

*Type:* null or absolute path

*Default:*

``` nix
if cfg.useEFIBoot then "/dev/disk/by-label/ESP"
else if cfg.useBIOSBoot then "/dev/disk/by-label/BOOT"
else null
```

*Example:* `"/dev/disk/by-label/esp"`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.containerd.args` {#opt-virtualisation.containerd.args}

extra args to append to the containerd cmdline

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/containerd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/containerd.nix)

## `virtualisation.containerd.configFile` {#opt-virtualisation.containerd.configFile}

Path to containerd config file.
Setting this option will override any configuration applied by the settings option.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/virtualisation/containerd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/containerd.nix)

## `virtualisation.containerd.enable` {#opt-virtualisation.containerd.enable}

Whether to enable containerd container runtime.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/containerd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/containerd.nix)

## `virtualisation.containerd.settings` {#opt-virtualisation.containerd.settings}

Verbatim lines to add to containerd.toml

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/containerd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/containerd.nix)

## `virtualisation.containers.containersConf.rootful.settings` {#opt-virtualisation.containers.containersConf.rootful.settings}

rootful containers.conf configuration

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/containers.nix)

## `virtualisation.containers.containersConf.rootless.settings` {#opt-virtualisation.containers.containersConf.rootless.settings}

rootless containers.conf configuration

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/containers.nix)

## `virtualisation.containers.containersConf.settings` {#opt-virtualisation.containers.containersConf.settings}

base containers.conf configuration

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/containers.nix)

## `virtualisation.containers.enable` {#opt-virtualisation.containers.enable}

This option enables the common /etc/containers configuration module.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/containers.nix)

## `virtualisation.containers.ociSeccompBpfHook.enable` {#opt-virtualisation.containers.ociSeccompBpfHook.enable}

Enable the OCI seccomp BPF hook

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/containers.nix)

## `virtualisation.containers.policy` {#opt-virtualisation.containers.policy}

Signature verification policy file.
If this option is empty the default policy file from
`skopeo` will be used.

*Type:* JSON value

*Default:* `{ }`

*Example:*

``` nix
{
  default = [ { type = "insecureAcceptAnything"; } ];
  transports = {
    docker-daemon = {
      "" = [ { type = "insecureAcceptAnything"; } ];
    };
  };
}
```

*Declared by:* [`nixos/modules/virtualisation/containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/containers.nix)

## `virtualisation.containers.registries.settings` {#opt-virtualisation.containers.registries.settings}

registries.conf configuration.

Examine [containers-registries.conf(5)](https://github.com/containers/image/blob/main/docs/containers-registries.conf.5.md) for more information about the format.

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/containers.nix)

## `virtualisation.containers.shortnames.enable` {#opt-virtualisation.containers.shortnames.enable}

Enable the usage of a collection of common aliases for fully qualified images.
See https://github.com/containers/shortnames.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/virtualisation/containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/containers.nix)

## `virtualisation.containers.storage.rootful.settings` {#opt-virtualisation.containers.storage.rootful.settings}

rootful storage.conf configuration

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/containers.nix)

## `virtualisation.containers.storage.rootless.settings` {#opt-virtualisation.containers.storage.rootless.settings}

rootless storage.conf configuration

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/containers.nix)

## `virtualisation.containers.storage.settings` {#opt-virtualisation.containers.storage.settings}

base storage.conf configuration

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/containers.nix)

## `virtualisation.cores` {#opt-virtualisation.cores}

Specify the number of cores the guest is permitted to use.
The number can be higher than the available cores on the
host system.

*Type:* positive integer, meaning \>0

*Default:* `1`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.credentials` {#opt-virtualisation.credentials}

Credentials to pass to the VM or container using systemd's credential system.

See `systemd.exec(5)`, `systemd-creds(1)` and https://systemd.io/CREDENTIALS/ for more
information about systemd credentials.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  database-password = {
    text = "my-secret-password";
  };
  ssl-cert = {
    source = "./cert.pem";
  };
  binary-key = {
    source = "./private.der";
  };
}
```

*Declared by:*

- [`nixos/modules/virtualisation/credentials-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/credentials-options.nix)
- [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.credentials.<name>.mechanism` {#opt-virtualisation.credentials._name_.mechanism}

The mechanism used to pass the credential to the VM.

*Type:* one of "fw\_cfg", "smbios"

*Default:* `if pkgs.stdenv.hostPlatform.isx86 then "smbios" else "fw_cfg"`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.credentials.<name>.source` {#opt-virtualisation.credentials._name_.source}

Source file on the host containing the credential data.

*Type:* null or path

*Default:* `null`

*Declared by:* [`nixos/modules/virtualisation/credentials-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/credentials-options.nix)

## `virtualisation.credentials.<name>.text` {#opt-virtualisation.credentials._name_.text}

Text content of the credential.

For binary data or when the credential content should come from
an existing file, use `source` instead.

::: warning
The text here is stored in the host's nix store as a file.
:::

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/virtualisation/credentials-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/credentials-options.nix)

## `virtualisation.cri-o.enable` {#opt-virtualisation.cri-o.enable}

Whether to enable Container Runtime Interface for OCI (CRI-O).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/cri-o.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/cri-o.nix)

## `virtualisation.cri-o.extraPackages` {#opt-virtualisation.cri-o.extraPackages}

Extra packages to be installed in the CRI-O wrapper.

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
[
  pkgs.gvisor
]
```

*Declared by:* [`nixos/modules/virtualisation/cri-o.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/cri-o.nix)

## `virtualisation.cri-o.logLevel` {#opt-virtualisation.cri-o.logLevel}

Log level to be used

*Type:* one of "trace", "debug", "info", "warn", "error", "fatal"

*Default:* `"info"`

*Declared by:* [`nixos/modules/virtualisation/cri-o.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/cri-o.nix)

## `virtualisation.cri-o.pauseCommand` {#opt-virtualisation.cri-o.pauseCommand}

Override the default pause command

*Type:* null or string

*Default:* `null`

*Example:* `"/pause"`

*Declared by:* [`nixos/modules/virtualisation/cri-o.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/cri-o.nix)

## `virtualisation.cri-o.pauseImage` {#opt-virtualisation.cri-o.pauseImage}

Override the default pause image for pod sandboxes

*Type:* null or string

*Default:* `null`

*Example:* `"registry.k8s.io/pause:3.10"`

*Declared by:* [`nixos/modules/virtualisation/cri-o.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/cri-o.nix)

## `virtualisation.cri-o.runtime` {#opt-virtualisation.cri-o.runtime}

Override the default runtime

*Type:* null or string

*Default:* `null`

*Example:* `"crun"`

*Declared by:* [`nixos/modules/virtualisation/cri-o.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/cri-o.nix)

## `virtualisation.cri-o.settings` {#opt-virtualisation.cri-o.settings}

Configuration for cri-o, see
[https://github.com/cri-o/cri-o/blob/master/docs/crio.conf.5.md](https://github.com/cri-o/cri-o/blob/master/docs/crio.conf.5.md).

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/cri-o.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/cri-o.nix)

## `virtualisation.cri-o.storageDriver` {#opt-virtualisation.cri-o.storageDriver}

Storage driver to be used

*Type:* one of "btrfs", "devmapper", "overlay", "vfs", "zfs"

*Default:* `"overlay"`

*Declared by:* [`nixos/modules/virtualisation/cri-o.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/cri-o.nix)

## `virtualisation.directBoot.enable` {#opt-virtualisation.directBoot.enable}

If enabled, the virtual machine will boot directly into the kernel instead of through a bootloader.
Read more about this feature in the [QEMU documentation on Direct Linux Boot](https://qemu-project.gitlab.io/qemu/system/linuxboot.html)

This is enabled by default.
If you want to test netboot, consider disabling this option.
Enable a bootloader with [`virtualisation.useBootLoader`](#opt-virtualisation.useBootLoader) if you need.

Relevant parameters such as those set in `boot.initrd` and `boot.kernelParams` are also passed to QEMU.
Additional parameters can be supplied on invocation through the environment variable `$QEMU_KERNEL_PARAMS`.
They are added to the `-append` option, see [QEMU User Documentation](https://www.qemu.org/docs/master/system/qemu-manpage) for details
For example, to let QEMU use the parent terminal as the serial console, set `QEMU_KERNEL_PARAMS="console=ttyS0"`.

This will not (re-)boot correctly into a system that has switched to a different configuration on disk.

*Type:* boolean

*Default:* `"!cfg.useBootLoader"`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.directBoot.initrd` {#opt-virtualisation.directBoot.initrd}

In direct boot situations, you may want to influence the initrd to load
to use your own customized payload.

This is useful if you want to test the netboot image without
testing the firmware or the loading part.

*Type:* string

*Default:* `"\${config.system.build.initialRamdisk}/\${config.system.boot.loader.initrdFile}"`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.diskImage` {#opt-virtualisation.diskImage}

Path to the disk image containing the root filesystem.
The image will be created on startup if it does not
exist.

If null, a tmpfs will be used as the root filesystem and
the VM's state will not be persistent.

*Type:* null or string

*Default:* `"./${config.system.name}.qcow2"`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.diskSize` {#opt-virtualisation.diskSize}

The disk size in MiB (1024×1024 bytes) of the virtual machine.

*Type:* value "auto" (singular enum) or (positive integer, meaning \>0)

*Default:* `if virtualisation.diskSizeAutoSupported then "auto" else 1024`

*Declared by:* [`nixos/modules/virtualisation/disk-size-option.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/disk-size-option.nix)

## `virtualisation.docker.autoPrune.allVolumes.enable` {#opt-virtualisation.docker.autoPrune.allVolumes.enable}

Whether to periodically prune all Docker volumes when auto pruning other docker resources
by running `docker volume prune --force --all`

To prune only anonymous volumes, instead pass `--volumes` to `autoPrune.flags`

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/docker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker.nix)

## `virtualisation.docker.autoPrune.allVolumes.flags` {#opt-virtualisation.docker.autoPrune.allVolumes.flags}

Any additional flags passed to `docker volume prune --force --all`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--filter=label=<label>"
]
```

*Declared by:* [`nixos/modules/virtualisation/docker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker.nix)

## `virtualisation.docker.autoPrune.dates` {#opt-virtualisation.docker.autoPrune.dates}

Specification (in the format described by
`systemd.time(7)`) of the time at
which the prune will occur.

*Type:* string

*Default:* `"weekly"`

*Declared by:* [`nixos/modules/virtualisation/docker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker.nix)

## `virtualisation.docker.autoPrune.enable` {#opt-virtualisation.docker.autoPrune.enable}

Whether to periodically prune Docker resources. If enabled, a
systemd timer will run `docker system prune -f`
as specified by the `dates` option.

NOTE: by default this does not prune volumes. Anonymous volumes
can be pruned by passing "--volumes" to [autoPrune.flags](#opt-virtualisation.docker.autoPrune.flags).

To prune all volumes (not just anonymous ones) [`autoPrune.allVolumes.enable`](#opt-virtualisation.docker.autoPrune.allVolumes.enable)
must be used.

See [upstream documentation](https://docs.docker.com/reference/cli/docker/system/prune/#description) for further information.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/docker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker.nix)

## `virtualisation.docker.autoPrune.flags` {#opt-virtualisation.docker.autoPrune.flags}

Any additional flags passed to `docker system prune`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--all"
]
```

*Declared by:* [`nixos/modules/virtualisation/docker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker.nix)

## `virtualisation.docker.autoPrune.persistent` {#opt-virtualisation.docker.autoPrune.persistent}

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

*Declared by:* [`nixos/modules/virtualisation/docker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker.nix)

## `virtualisation.docker.autoPrune.randomizedDelaySec` {#opt-virtualisation.docker.autoPrune.randomizedDelaySec}

Add a randomized delay before each auto prune.
The delay will be chosen between zero and this value.
This value must be a time span in the format specified by
`systemd.time(7)`

*Type:* (optionally newline-terminated) single-line string

*Default:* `"0"`

*Example:* `"45min"`

*Declared by:* [`nixos/modules/virtualisation/docker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker.nix)

## `virtualisation.docker.daemon.settings` {#opt-virtualisation.docker.daemon.settings}

Configuration for docker daemon. The attributes are serialized to JSON used as daemon.conf.
See [https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-configuration-file](https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-configuration-file)

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Example:*

``` nix
{
  fixed-cidr-v6 = "fd00::/80";
  ipv6 = true;
  live-restore = true;
}
```

*Declared by:* [`nixos/modules/virtualisation/docker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker.nix)

## `virtualisation.docker.daemon.settings.live-restore` {#opt-virtualisation.docker.daemon.settings.live-restore}

Allow dockerd to be restarted without affecting running container.
This option is incompatible with docker swarm.

*Type:* boolean

*Default:* `lib.versionOlder config.system.stateVersion "24.11"`

*Declared by:* [`nixos/modules/virtualisation/docker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker.nix)

## `virtualisation.docker.enable` {#opt-virtualisation.docker.enable}

This option enables docker, a daemon that manages
linux containers. Users in the "docker" group can interact with
the daemon (e.g. to start or stop containers) using the
`docker` command line tool.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/docker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker.nix)

## `virtualisation.docker.enableNvidia` {#opt-virtualisation.docker.enableNvidia}

**Deprecated**, please use [`hardware.nvidia-container-toolkit.enable`](../../options/hardware/index.md#opt-hardware.nvidia-container-toolkit.enable) instead.

Enable Nvidia GPU support inside docker containers.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/docker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker.nix)

## `virtualisation.docker.enableOnBoot` {#opt-virtualisation.docker.enableOnBoot}

When enabled dockerd is started on boot. This is required for
containers which are created with the
`--restart=always` flag to work. If this option is
disabled, docker might be started on demand by socket activation.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/virtualisation/docker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker.nix)

## `virtualisation.docker.extraOptions` {#opt-virtualisation.docker.extraOptions}

The extra command-line options to pass to
`docker` daemon.

*Type:* strings concatenated with " "

*Default:* `""`

*Declared by:* [`nixos/modules/virtualisation/docker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker.nix)

## `virtualisation.docker.extraPackages` {#opt-virtualisation.docker.extraPackages}

Extra packages to add to PATH for the docker daemon process.

*Type:* list of package

*Default:* `[ ]`

*Example:* `with pkgs; [ criu ]`

*Declared by:* [`nixos/modules/virtualisation/docker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker.nix)

## `virtualisation.docker.listenOptions` {#opt-virtualisation.docker.listenOptions}

A list of unix and tcp docker should listen to. The format follows
ListenStream as described in `systemd.socket(5)`.

*Type:* list of string

*Default:*

``` nix
[
  "/run/docker.sock"
]
```

*Declared by:* [`nixos/modules/virtualisation/docker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker.nix)

## `virtualisation.docker.liveRestore` {#opt-virtualisation.docker.liveRestore}

Alias of [`virtualisation.docker.daemon.settings.live-restore`](#opt-virtualisation.docker.daemon.settings.live-restore).

*Type:* submodule

*Declared by:* [`nixos/modules/virtualisation/docker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker.nix)

## `virtualisation.docker.logDriver` {#opt-virtualisation.docker.logDriver}

This option determines which Docker log driver to use.

*Type:* one of "none", "json-file", "syslog", "journald", "gelf", "fluentd", "awslogs", "splunk", "etwlogs", "gcplogs", "local"

*Default:* `"journald"`

*Declared by:* [`nixos/modules/virtualisation/docker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker.nix)

## `virtualisation.docker.package` {#opt-virtualisation.docker.package}

The docker package to use.

*Type:* package

*Default:* `pkgs.docker`

*Declared by:* [`nixos/modules/virtualisation/docker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker.nix)

## `virtualisation.docker.rootless.daemon.settings` {#opt-virtualisation.docker.rootless.daemon.settings}

Configuration for docker daemon. The attributes are serialized to JSON used as daemon.conf.
See [https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-configuration-file](https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-configuration-file)

*Type:* JSON value

*Default:* `{ }`

*Example:*

``` nix
{
  fixed-cidr-v6 = "fd00::/80";
  ipv6 = true;
}
```

*Declared by:* [`nixos/modules/virtualisation/docker-rootless.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker-rootless.nix)

## `virtualisation.docker.rootless.enable` {#opt-virtualisation.docker.rootless.enable}

This option enables docker in a rootless mode, a daemon that manages
linux containers. To interact with the daemon, one needs to set
`DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/docker-rootless.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker-rootless.nix)

## `virtualisation.docker.rootless.extraPackages` {#opt-virtualisation.docker.rootless.extraPackages}

Extra packages to add to PATH for the docker daemon process.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/virtualisation/docker-rootless.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker-rootless.nix)

## `virtualisation.docker.rootless.package` {#opt-virtualisation.docker.rootless.package}

The docker package to use.

*Type:* package

*Default:* `pkgs.docker`

*Declared by:* [`nixos/modules/virtualisation/docker-rootless.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker-rootless.nix)

## `virtualisation.docker.rootless.setSocketVariable` {#opt-virtualisation.docker.rootless.setSocketVariable}

Point `DOCKER_HOST` to rootless Docker instance for
normal users by default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/docker-rootless.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker-rootless.nix)

## `virtualisation.docker.storageDriver` {#opt-virtualisation.docker.storageDriver}

This option determines which Docker
[storage driver](https://docs.docker.com/storage/storagedriver/select-storage-driver/)
to use.
By default it lets docker automatically choose the preferred storage
driver.
However, it is recommended to specify a storage driver explicitly, as
docker's default varies over versions.

::: warning
Changing the storage driver will cause any existing containers
and images to become inaccessible.
:::

*Type:* null or one of "aufs", "btrfs", "devicemapper", "overlay", "overlay2", "zfs"

*Default:* `null`

*Declared by:* [`nixos/modules/virtualisation/docker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/docker.nix)

## `virtualisation.efi.OVMF` {#opt-virtualisation.efi.OVMF}

The OVMFFull package to use.

*Type:* package

*Default:* `pkgs.OVMFFull`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.efi.firmware` {#opt-virtualisation.efi.firmware}

Firmware binary for EFI implementation, defaults to OVMF.

*Type:* absolute path

*Default:* `cfg.efi.OVMF.firmware`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.efi.keepVariables` {#opt-virtualisation.efi.keepVariables}

Whether to keep EFI variable values from the generated system image

*Type:* boolean

*Default:* `cfg.useBootLoader`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.efi.variables` {#opt-virtualisation.efi.variables}

Platform-specific flash binary for EFI variables, implementation-dependent to the EFI firmware.
Defaults to OVMF.

*Type:* absolute path

*Default:* `cfg.efi.OVMF.variables`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.emptyDiskImages` {#opt-virtualisation.emptyDiskImages}

Additional disk images to provide to the VM. The value is
a list of size in MiB (1024×1024 bytes) of each disk. These disks are
writeable by the VM.

*Type:* list of ((submodule) or (positive integer, meaning \>0) convertible to it)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.emptyDiskImages.*.driveConfig` {#opt-virtualisation.emptyDiskImages._.driveConfig}

Drive configuration to pass to [`virtualisation.qemu.drives`](#opt-virtualisation.qemu.drives)

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.emptyDiskImages.*.driveConfig.deviceExtraOpts` {#opt-virtualisation.emptyDiskImages._.driveConfig.deviceExtraOpts}

Extra options passed to device flag.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.emptyDiskImages.*.driveConfig.driveExtraOpts` {#opt-virtualisation.emptyDiskImages._.driveConfig.driveExtraOpts}

Extra options passed to drive flag.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.emptyDiskImages.*.driveConfig.name` {#opt-virtualisation.emptyDiskImages._.driveConfig.name}

A name for the drive. Must be unique in the drives list. Not passed to qemu.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.emptyDiskImages.*.size` {#opt-virtualisation.emptyDiskImages._.size}

The size of the disk in MiB

*Type:* positive integer, meaning \>0

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.fileSystems` {#opt-virtualisation.fileSystems}

The file systems to be mounted.  It must include an entry for
the root directory (`mountPoint = "/"`).  Each
entry in the list is an attribute set with the following fields:
`mountPoint`, `device`,
`fsType` (a file system type recognised by
`mount`), and `options`
(the mount options passed to `mount` using the
`-o` flag; defaults to `[ "defaults" ]`).

Instead of specifying `device`, you can also
specify a volume label (`label`) for file
systems that support it, such as ext2/ext3 (see `mke2fs -L`).

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "/".device = "/dev/hda1";
  "/data" = {
    device = "/dev/hda2";
    fsType = "ext3";
    options = [ "data=journal" ];
  };
  "/bigdisk".label = "bigdisk";
}
```

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.fileSystems.<name>.autoFormat` {#opt-virtualisation.fileSystems._name_.autoFormat}

If the device does not currently contain a filesystem (as
determined by `blkid`), then automatically
format it with the filesystem type specified in
`fsType`.  Use with caution.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `virtualisation.fileSystems.<name>.autoResize` {#opt-virtualisation.fileSystems._name_.autoResize}

If set, the filesystem is grown to its maximum size before
being mounted. (This is typically the size of the containing
partition.) This is currently only supported for ext2/3/4
filesystems that are mounted during early boot.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `virtualisation.fileSystems.<name>.depends` {#opt-virtualisation.fileSystems._name_.depends}

List of paths that should be mounted before this one. This filesystem's
`device` and `mountPoint` are always
checked and do not need to be included explicitly. If a path is added
to this list, any other filesystem whose mount point is a parent of
the path will be mounted before this filesystem. The paths do not need
to actually be the `mountPoint` of some other filesystem.

This is useful for mounts which require keys and/or configuration files residing on another filesystem.

*Type:* list of string (with check: non-empty without trailing slash)

*Default:* `[ ]`

*Example:*

``` nix
[
  "/persist"
]
```

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `virtualisation.fileSystems.<name>.device` {#opt-virtualisation.fileSystems._name_.device}

The device as passed to `mount`.

This can be any of:

- a filename of a block special device such as `/dev/sdc3`
- a tag such as `UUID=fdd68895-c307-4549-8c9c-90e44c71f5b7`
- (for bind mounts only) the source path
- something else depending on the `fsType`. For example, `nfs` device may look like `knuth.cwi.nl:/dir`

This is called `device` in `mount(8)` and `fs_spec` in `fstab(5)`.

*Type:* null or string (with check: non-empty)

*Default:* `null`

*Example:* `"/dev/sda"`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `virtualisation.fileSystems.<name>.enable` {#opt-virtualisation.fileSystems._name_.enable}

Whether to enable the filesystem mount.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `virtualisation.fileSystems.<name>.encrypted.blkDev` {#opt-virtualisation.fileSystems._name_.encrypted.blkDev}

Location of the backing encrypted device.

*Type:* null or string

*Default:* `null`

*Example:* `"/dev/sda1"`

*Declared by:* [`nixos/modules/tasks/encrypted-devices.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/encrypted-devices.nix)

## `virtualisation.fileSystems.<name>.encrypted.enable` {#opt-virtualisation.fileSystems._name_.encrypted.enable}

The block device is backed by an encrypted one, adds this device as a initrd luks entry.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/encrypted-devices.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/encrypted-devices.nix)

## `virtualisation.fileSystems.<name>.encrypted.keyFile` {#opt-virtualisation.fileSystems._name_.encrypted.keyFile}

Path to a keyfile used to unlock the backing encrypted
device. When systemd stage 1 is not enabled, at the time
this keyfile is accessed, the `neededForBoot` filesystems
(see `utils.fsNeededForBoot`) will have been mounted under
`/mnt-root`, so the keyfile path should usually start with
"/mnt-root/". When systemd stage 1 is enabled,
`fsNeededForBoot` file systems will be mounted as needed
under `/sysroot`, and the keyfile will not be accessed until
its requisite mounts are done.

*Type:* null or string

*Default:* `null`

*Example:* `"/mnt-root/root/.swapkey"`

*Declared by:* [`nixos/modules/tasks/encrypted-devices.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/encrypted-devices.nix)

## `virtualisation.fileSystems.<name>.encrypted.label` {#opt-virtualisation.fileSystems._name_.encrypted.label}

Label of the unlocked encrypted device. Set `fileSystems.<name?>.device` to `/dev/mapper/<label>` to mount the unlocked device.

*Type:* null or string

*Default:* `null`

*Example:* `"rootfs"`

*Declared by:* [`nixos/modules/tasks/encrypted-devices.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/encrypted-devices.nix)

## `virtualisation.fileSystems.<name>.fsType` {#opt-virtualisation.fileSystems._name_.fsType}

Type of the file system.

This is the `fstype` passed to `-t` in the `mount(8)` command, and is called `fs_vfstype` in `fstab(5)`.

*Type:* string (with check: non-empty)

*Example:* `"ext3"`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `virtualisation.fileSystems.<name>.label` {#opt-virtualisation.fileSystems._name_.label}

Label of the device. This simply sets `device` to
`/dev/disk/by-label/${label}`. Note that devices will not
have a label unless they contain a filesystem which
supports labels, such as ext4 or fat32.

*Type:* null or string (with check: non-empty)

*Default:* `null`

*Example:* `"root-partition"`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `virtualisation.fileSystems.<name>.mountPoint` {#opt-virtualisation.fileSystems._name_.mountPoint}

Location where the file system will be mounted.

This is called `mountpoint` in `mount(8)` and `fs_file` in `fstab(5)`

*Type:* string (with check: non-empty without trailing slash)

*Default:* `"‹name›"`

*Example:* `"/mnt/usb"`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `virtualisation.fileSystems.<name>.neededForBoot` {#opt-virtualisation.fileSystems._name_.neededForBoot}

If set, this file system will be mounted in the initial ramdisk.
Note that the file system will always be mounted in the initial
ramdisk if its mount point is one of the following:
`/`, `/nix`, `/nix/store`, `/var`, `/var/log`, `/var/lib`, `/var/lib/nixos`, `/etc`, `/usr`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/stage-1.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/stage-1.nix)

## `virtualisation.fileSystems.<name>.noCheck` {#opt-virtualisation.fileSystems._name_.noCheck}

Disable running fsck on this filesystem.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `virtualisation.fileSystems.<name>.options` {#opt-virtualisation.fileSystems._name_.options}

Options used to mount the file system.

This is called `options` in `mount(8)` and `fs_mntops` in `fstab(5)`

Some options that can be used for all mounts are documented in `mount(8)` under `FILESYSTEM-INDEPENDENT MOUNT OPTIONS`.

Options that systemd understands are documented in `systemd.mount(5)` under `FSTAB`.

Each filesystem supports additional options, see the docs for that filesystem.

*Type:* non-empty (list of string (with check: non-empty))

*Default:*

``` nix
[
  "defaults"
]
```

*Example:*

``` nix
[
  "data=journal"
]
```

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `virtualisation.fileSystems.<name>.overlay.lowerdir` {#opt-virtualisation.fileSystems._name_.overlay.lowerdir}

The list of path(s) to the lowerdir(s).

To create a writable overlay, you MUST provide an `upperdir` and a
`workdir`.

You can create a read-only overlay when you provide multiple (at
least 2!) lowerdirs and neither an `upperdir` nor a `workdir`.

*Type:* null or (non-empty (list of (string or path in the Nix store)))

*Default:* `null`

*Declared by:* [`nixos/modules/tasks/filesystems/overlayfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/overlayfs.nix)

## `virtualisation.fileSystems.<name>.overlay.upperdir` {#opt-virtualisation.fileSystems._name_.overlay.upperdir}

The path to the upperdir.

If this is null, a read-only overlay is created using the lowerdir.

If the filesystem is `neededForBoot`, this will be prefixed with `/sysroot`,
unless `useStage1BaseDirectories` is set to `true`.

If you set this to some value you MUST also set `workdir`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/tasks/filesystems/overlayfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/overlayfs.nix)

## `virtualisation.fileSystems.<name>.overlay.useStage1BaseDirectories` {#opt-virtualisation.fileSystems._name_.overlay.useStage1BaseDirectories}

If enabled, `lowerdir`, `upperdir` and `workdir` will be prefixed with `/sysroot`.

Disabling this can be useful to create an overlay over directories which aren't on the real root.

Disabling this does not work with the scripted (i.e. non-systemd) initrd.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/tasks/filesystems/overlayfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/overlayfs.nix)

## `virtualisation.fileSystems.<name>.overlay.workdir` {#opt-virtualisation.fileSystems._name_.overlay.workdir}

The path to the workdir.

If the filesystem is `neededForBoot`, this will be prefixed with `/sysroot`,
unless `useStage1BaseDirectories` is set to `true`.

This MUST be set if you set `upperdir`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/tasks/filesystems/overlayfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/overlayfs.nix)

## `virtualisation.fileSystems.<name>.stratis.poolUuid` {#opt-virtualisation.fileSystems._name_.stratis.poolUuid}

UUID of the stratis pool that the fs is located in

This is only relevant if you are using [stratis](https://stratis-storage.github.io/).

*Type:* null or string

*Default:* `null`

*Example:* `"04c68063-90a5-4235-b9dd-6180098a20d9"`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `virtualisation.forwardPorts` {#opt-virtualisation.forwardPorts}

When using the SLiRP user networking (default), this option allows to
forward ports to/from the host/guest.

::: warning
If the NixOS firewall on the virtual machine is enabled, you also
have to open the guest ports to enable the traffic between host and
guest.
:::

::: note
Currently QEMU supports only IPv4 forwarding.
:::

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[ # forward local port 2222 -> 22, to ssh into the VM
  { from = "host"; host.port = 2222; guest.port = 22; }

  # forward local port 80 -> 10.0.2.10:80 in the VLAN
  { from = "guest";
    guest.address = "10.0.2.10"; guest.port = 80;
    host.address = "127.0.0.1"; host.port = 80;
  }
]
```

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.forwardPorts.*.from` {#opt-virtualisation.forwardPorts._.from}

Controls the direction in which the ports are mapped:

- `"host"` means traffic from the host ports
  is forwarded to the given guest port.
- `"guest"` means traffic from the guest ports
  is forwarded to the given host port.

*Type:* one of "host", "guest"

*Default:* `"host"`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.forwardPorts.*.guest.address` {#opt-virtualisation.forwardPorts._.guest.address}

The IPv4 address on the guest VLAN.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.forwardPorts.*.guest.port` {#opt-virtualisation.forwardPorts._.guest.port}

The guest port to be mapped.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.forwardPorts.*.host.address` {#opt-virtualisation.forwardPorts._.host.address}

The IPv4 address of the host.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.forwardPorts.*.host.port` {#opt-virtualisation.forwardPorts._.host.port}

The host port to be mapped.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.forwardPorts.*.proto` {#opt-virtualisation.forwardPorts._.proto}

The protocol to forward.

*Type:* one of "tcp", "udp"

*Default:* `"tcp"`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.graphics` {#opt-virtualisation.graphics}

Whether to run QEMU with a graphics window, or in nographic mode.
Serial console will be enabled on both settings, but this will
change the preferred console.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.host.pkgs` {#opt-virtualisation.host.pkgs}

Package set to use for the host-specific packages of the VM runner.
Changing this to e.g. a Darwin package set allows running NixOS VMs on Darwin.

*Type:* An evaluation of Nixpkgs; the top level attribute set of packages

*Default:* `pkgs`

*Example:*

``` nix
import pkgs.path { system = "aarch64-darwin"; }
```

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.hypervGuest.enable` {#opt-virtualisation.hypervGuest.enable}

Whether to enable Hyper-V Guest Support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/hyperv-guest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/hyperv-guest.nix)

## `virtualisation.incus.agent.enable` {#opt-virtualisation.incus.agent.enable}

Whether to enable Incus agent.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/incus-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/incus-agent.nix)

## `virtualisation.incus.clientPackage` {#opt-virtualisation.incus.clientPackage}

The incus client package to use. This package is added to PATH.

*Type:* package

*Default:* `config.virtualisation.incus.package.client`

*Declared by:* [`nixos/modules/virtualisation/incus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/incus.nix)

## `virtualisation.incus.enable` {#opt-virtualisation.incus.enable}

Whether to enable incusd, a daemon that manages containers and virtual machines.

Users in the "incus-admin" group can interact with
the daemon (e.g. to start or stop containers) using the
`incus` command line tool, among others.
Users in the "incus" group can also interact with
the daemon, but with lower permissions
(i.e. administrative operations are forbidden).
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/incus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/incus.nix)

## `virtualisation.incus.lxcPackage` {#opt-virtualisation.incus.lxcPackage}

The lxc package to use.

*Type:* package

*Default:* `config.virtualisation.lxc.package`

*Declared by:* [`nixos/modules/virtualisation/incus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/incus.nix)

## `virtualisation.incus.package` {#opt-virtualisation.incus.package}

The incus-lts package to use.

*Type:* package

*Default:* `pkgs.incus-lts`

*Declared by:* [`nixos/modules/virtualisation/incus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/incus.nix)

## `virtualisation.incus.preseed` {#opt-virtualisation.incus.preseed}

Configuration for Incus preseed, see
[https://linuxcontainers.org/incus/docs/main/howto/initialize/#non-interactive-configuration](https://linuxcontainers.org/incus/docs/main/howto/initialize/#non-interactive-configuration)
for supported values.

Changes to this will be re-applied to Incus which will overwrite existing entities or create missing ones,
but entities will *not* be removed by preseed.

*Type:* null or (open submodule of (YAML 1.1 value))

*Default:* `null`

*Example:*

``` nix
{
  networks = [
    {
      config = {
        "ipv4.address" = "10.0.100.1/24";
        "ipv4.nat" = "true";
      };
      name = "incusbr0";
      type = "bridge";
    }
  ];
  profiles = [
    {
      devices = {
        eth0 = {
          name = "eth0";
          network = "incusbr0";
          type = "nic";
        };
        root = {
          path = "/";
          pool = "default";
          size = "35GiB";
          type = "disk";
        };
      };
      name = "default";
    }
  ];
  storage_pools = [
    {
      config = {
        source = "/var/lib/incus/storage-pools/default";
      };
      driver = "dir";
      name = "default";
    }
  ];
}
```

*Declared by:* [`nixos/modules/virtualisation/incus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/incus.nix)

## `virtualisation.incus.socketActivation` {#opt-virtualisation.incus.socketActivation}

Whether to enable socket-activation for starting incus.service. Enabling this option
will stop incus.service from starting automatically on boot.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/incus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/incus.nix)

## `virtualisation.incus.softDaemonRestart` {#opt-virtualisation.incus.softDaemonRestart}

Allow for incus.service to be stopped without affecting running instances.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/virtualisation/incus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/incus.nix)

## `virtualisation.incus.startTimeout` {#opt-virtualisation.incus.startTimeout}

Time to wait (in seconds) for incusd to become ready to process requests.
If incusd does not reply within the configured time, `incus.service` will be
considered failed and systemd will attempt to restart it.

*Type:* unsigned integer, meaning \>=0

*Default:* `600`

*Declared by:* [`nixos/modules/virtualisation/incus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/incus.nix)

## `virtualisation.incus.storage.truenas.enable` {#opt-virtualisation.incus.storage.truenas.enable}

Whether to enable TrueNAS storage driver support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/incus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/incus.nix)

## `virtualisation.incus.ui.enable` {#opt-virtualisation.incus.ui.enable}

Whether to enable Incus Web UI.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/incus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/incus.nix)

## `virtualisation.incus.ui.package` {#opt-virtualisation.incus.ui.package}

The incus-ui-canonical package to use.

*Type:* package

*Default:* `pkgs.incus-ui-canonical`

*Declared by:* [`nixos/modules/virtualisation/incus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/incus.nix)

## `virtualisation.incus.useACMEHost` {#opt-virtualisation.incus.useACMEHost}

Host of an existing Let's Encrypt certificate to use for TLS.
*Note that this option does not create any certificates and it
doesn't add subdomains to existing ones – you will need to create
them manually using [`security.acme.certs`](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Example:* `"incus.example.com"`

*Declared by:* [`nixos/modules/virtualisation/incus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/incus.nix)

## `virtualisation.installBootLoader` {#opt-virtualisation.installBootLoader}

Install boot loader to target image.

This is best-effort and may break with unconventional partition setups.
Use `virtualisation.useDefaultFilesystems` for a known-working configuration.

*Type:* boolean

*Default:* `"cfg.useBootLoader && cfg.useDefaultFilesystems"`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.kvmgt.device` {#opt-virtualisation.kvmgt.device}

PCI ID of graphics card. You can figure it with `ls /sys/class/mdev_bus`.

*Type:* string

*Default:* `"0000:00:02.0"`

*Declared by:* [`nixos/modules/virtualisation/kvmgt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/kvmgt.nix)

## `virtualisation.kvmgt.enable` {#opt-virtualisation.kvmgt.enable}

Whether to enable KVMGT (iGVT-g) VGPU support.
When enabled on a host, allows Qemu/KVM guests to share host's Intel integrated graphics card.
Currently only one graphical device can be shared.
To allow host users to access the device without root add them to the kvm group: `users.extraUsers.<yourusername>.extraGroups = [ "kvm" ];`
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/kvmgt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/kvmgt.nix)

## `virtualisation.kvmgt.vgpus` {#opt-virtualisation.kvmgt.vgpus}

Virtual GPUs of the host to be used in Qemu.
You can find devices via `ls /sys/bus/pci/devices/*/mdev_supported_types` and find info about device via `cat /sys/bus/pci/devices/*/mdev_supported_types/i915-GVTg_V5_4/description`

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  i915-GVTg_V5_8 = {
    uuid = [
      "a297db4a-f4c2-11e6-90f6-d3b88d6c9525"
    ];
  };
}
```

*Declared by:* [`nixos/modules/virtualisation/kvmgt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/kvmgt.nix)

## `virtualisation.kvmgt.vgpus.<name>.uuid` {#opt-virtualisation.kvmgt.vgpus._name_.uuid}

UUID(s) of VGPU device. You can generate one with `libossp_uuid`.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/virtualisation/kvmgt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/kvmgt.nix)

## `virtualisation.libvirtd.allowedBridges` {#opt-virtualisation.libvirtd.allowedBridges}

List of bridge devices that can be used by qemu:///session

*Type:* list of string

*Default:*

``` nix
[
  "virbr0"
]
```

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.dbus.enable` {#opt-virtualisation.libvirtd.dbus.enable}

Whether to enable exposing libvirtd APIs over D-Bus.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.dbus.package` {#opt-virtualisation.libvirtd.dbus.package}

The libvirt-dbus package to use.

*Type:* package

*Default:* `pkgs.libvirt-dbus`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.enable` {#opt-virtualisation.libvirtd.enable}

This option enables libvirtd, a daemon that manages
virtual machines. Users in the "libvirtd" group can interact with
the daemon (e.g. to start or stop VMs) using the
`virsh` command line tool, among others.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.extraConfig` {#opt-virtualisation.libvirtd.extraConfig}

Extra contents appended to the libvirtd configuration file,
libvirtd.conf.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.extraOptions` {#opt-virtualisation.libvirtd.extraOptions}

Extra command line arguments passed to libvirtd on startup.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--verbose"
]
```

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.firewallBackend` {#opt-virtualisation.libvirtd.firewallBackend}

The backend used to setup virtual network firewall rules.

*Type:* one of "iptables", "nftables"

*Default:* `if config.networking.nftables.enable then "nftables" else "iptables"`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.hooks` {#opt-virtualisation.libvirtd.hooks}

Hooks related options.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.hooks.daemon` {#opt-virtualisation.libvirtd.hooks.daemon}

Hooks that will be placed under /var/lib/libvirt/hooks/daemon.d/
and called for daemon start/shutdown/SIGHUP events.
Please see [https://libvirt.org/hooks.html](https://libvirt.org/hooks.html) for documentation.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.hooks.libxl` {#opt-virtualisation.libvirtd.hooks.libxl}

Hooks that will be placed under /var/lib/libvirt/hooks/libxl.d/
and called for libxl-handled xen domains begin/end events.
Please see [https://libvirt.org/hooks.html](https://libvirt.org/hooks.html) for documentation.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.hooks.lxc` {#opt-virtualisation.libvirtd.hooks.lxc}

Hooks that will be placed under /var/lib/libvirt/hooks/lxc.d/
and called for lxc domains begin/end events.
Please see [https://libvirt.org/hooks.html](https://libvirt.org/hooks.html) for documentation.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.hooks.network` {#opt-virtualisation.libvirtd.hooks.network}

Hooks that will be placed under /var/lib/libvirt/hooks/network.d/
and called for networks begin/end events.
Please see [https://libvirt.org/hooks.html](https://libvirt.org/hooks.html) for documentation.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.hooks.qemu` {#opt-virtualisation.libvirtd.hooks.qemu}

Hooks that will be placed under /var/lib/libvirt/hooks/qemu.d/
and called for qemu domains begin/end/migrate events.
Please see [https://libvirt.org/hooks.html](https://libvirt.org/hooks.html) for documentation.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.nss` {#opt-virtualisation.libvirtd.nss}

libvirt NSS module options.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.nss.enable` {#opt-virtualisation.libvirtd.nss.enable}

This option enables the older libvirt NSS module. This method uses
DHCP server records, therefore is dependent on the hostname provided
by the guest.
Please see [https://libvirt.org/nss.html](https://libvirt.org/nss.html) for more information.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.nss.enableGuest` {#opt-virtualisation.libvirtd.nss.enableGuest}

This option enables the newer libvirt\_guest NSS module. This module
uses the libvirt guest name instead of the hostname of the guest.
Please see [https://libvirt.org/nss.html](https://libvirt.org/nss.html) for more information.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.onBoot` {#opt-virtualisation.libvirtd.onBoot}

Specifies the action to be done to / on the guests when the host boots.
The "start" option starts all guests that were running prior to shutdown
regardless of their autostart settings. The "ignore" option will not
start the formerly running guest on boot. However, any guest marked as
autostart will still be automatically started by libvirtd.

*Type:* one of "start", "ignore"

*Default:* `"start"`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.onShutdown` {#opt-virtualisation.libvirtd.onShutdown}

When shutting down / restarting the host what method should
be used to gracefully halt the guests. Setting to "shutdown"
will cause an ACPI shutdown of each guest. "suspend" will
attempt to save the state of the guests ready to restore on boot.

*Type:* one of "shutdown", "suspend"

*Default:* `"suspend"`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.package` {#opt-virtualisation.libvirtd.package}

The libvirt package to use.

*Type:* package

*Default:* `pkgs.libvirt`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.parallelShutdown` {#opt-virtualisation.libvirtd.parallelShutdown}

Number of guests that will be shutdown concurrently, taking effect when onShutdown
is set to "shutdown". If set to 0, guests will be shutdown one after another.
Number of guests on shutdown at any time will not exceed number set in this
variable.

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.qemu` {#opt-virtualisation.libvirtd.qemu}

QEMU related options.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.qemu.package` {#opt-virtualisation.libvirtd.qemu.package}

The qemu package to use. `pkgs.qemu` can emulate alien architectures (e.g. aarch64 on x86)
`pkgs.qemu_kvm` saves disk space allowing to emulate only host architectures.

*Type:* package

*Default:* `pkgs.qemu`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.qemu.runAsRoot` {#opt-virtualisation.libvirtd.qemu.runAsRoot}

If true,  libvirtd runs qemu as root.
If false, libvirtd runs qemu as unprivileged user qemu-libvirtd.
Changing this option to false may cause file permission issues
for existing guests. To fix these, manually change ownership
of affected files in /var/lib/libvirt/qemu to qemu-libvirtd.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.qemu.swtpm` {#opt-virtualisation.libvirtd.qemu.swtpm}

QEMU's swtpm options.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.qemu.swtpm.enable` {#opt-virtualisation.libvirtd.qemu.swtpm.enable}

Allows libvirtd to use swtpm to create an emulated TPM.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.qemu.swtpm.package` {#opt-virtualisation.libvirtd.qemu.swtpm.package}

The swtpm package to use.

*Type:* package

*Default:* `pkgs.swtpm`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.qemu.verbatimConfig` {#opt-virtualisation.libvirtd.qemu.verbatimConfig}

Contents written to the qemu configuration file, qemu.conf.
Make sure to include a proper namespace configuration when
supplying custom configuration.

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  namespaces = []
''
```

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.qemu.vhostUserPackages` {#opt-virtualisation.libvirtd.qemu.vhostUserPackages}

Packages containing out-of-tree vhost-user drivers.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.virtiofsd ]`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.shutdownTimeout` {#opt-virtualisation.libvirtd.shutdownTimeout}

Number of seconds we're willing to wait for a guest to shut down.
If parallel shutdown is enabled, this timeout applies as a timeout
for shutting down all guests on a single URI defined in the variable URIS.
If this is 0, then there is no time out (use with caution, as guests might not
respond to a shutdown request).

*Type:* unsigned integer, meaning \>=0

*Default:* `300`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.sshProxy` {#opt-virtualisation.libvirtd.sshProxy}

Whether to configure OpenSSH to use the [SSH Proxy](https://libvirt.org/ssh-proxy.html).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.libvirtd.startDelay` {#opt-virtualisation.libvirtd.startDelay}

Number of seconds to wait between each guest start.
If set to 0, all guests will start up in parallel.

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Declared by:* [`nixos/modules/virtualisation/libvirtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/libvirtd.nix)

## `virtualisation.lxc.bridgeConfig` {#opt-virtualisation.lxc.bridgeConfig}

This is the config file for override lxc-net bridge default settings.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/virtualisation/lxc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/lxc.nix)

## `virtualisation.lxc.defaultConfig` {#opt-virtualisation.lxc.defaultConfig}

Default config (default.conf) for new containers, i.e. for
network config. See `lxc.container.conf(5)`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/virtualisation/lxc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/lxc.nix)

## `virtualisation.lxc.enable` {#opt-virtualisation.lxc.enable}

This enables Linux Containers (LXC), which provides tools
for creating and managing system or application containers
on Linux.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/lxc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/lxc.nix)

## `virtualisation.lxc.lxcfs.enable` {#opt-virtualisation.lxc.lxcfs.enable}

This enables LXCFS, a FUSE filesystem for LXC.
To use lxcfs in include the following configuration in your
container configuration:

```
virtualisation.lxc.defaultConfig = "lxc.include = ${pkgs.lxcfs}/share/lxc/config/common.conf.d/00-lxcfs.conf";
```

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/lxcfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/lxcfs.nix)

## `virtualisation.lxc.package` {#opt-virtualisation.lxc.package}

The lxc package to use.

*Type:* package

*Default:* `pkgs.lxc`

*Declared by:* [`nixos/modules/virtualisation/lxc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/lxc.nix)

## `virtualisation.lxc.systemConfig` {#opt-virtualisation.lxc.systemConfig}

This is the system-wide LXC config. See
`lxc.system.conf(5)`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/virtualisation/lxc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/lxc.nix)

## `virtualisation.lxc.unprivilegedContainers` {#opt-virtualisation.lxc.unprivilegedContainers}

Whether to enable support for unprivileged users to launch containers.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/lxc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/lxc.nix)

## `virtualisation.lxc.usernetConfig` {#opt-virtualisation.lxc.usernetConfig}

This is the config file for managing unprivileged user network
administration access in LXC. See `lxc-usernet(5)`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/virtualisation/lxc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/lxc.nix)

## `virtualisation.memorySize` {#opt-virtualisation.memorySize}

The memory size of the virtual machine in MiB (1024×1024 bytes).

*Type:* positive integer, meaning \>0

*Default:* `1024`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.mountHostNixStore` {#opt-virtualisation.mountHostNixStore}

Mount the host Nix store via a virtual filesystem.

*Type:* boolean

*Default:* `!cfg.useNixStoreImage && !cfg.useBootLoader`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.oci-containers.backend` {#opt-virtualisation.oci-containers.backend}

The underlying Docker implementation to use.

*Type:* one of "podman", "docker"

*Default:* `"podman"`

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers` {#opt-virtualisation.oci-containers.containers}

OCI (Docker) containers to run as systemd services.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.autoRemoveOnStop` {#opt-virtualisation.oci-containers.containers._name_.autoRemoveOnStop}

Automatically remove the container when it is stopped or killed

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.autoStart` {#opt-virtualisation.oci-containers.containers._name_.autoStart}

When enabled, the container is automatically started on boot.
If this option is set to false, the container has to be started on-demand via its service.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.capabilities` {#opt-virtualisation.oci-containers.containers._name_.capabilities}

Capabilities to configure for the container.
When set to true, capability is added to the container.
When set to false, capability is dropped from the container.
When null, default runtime settings apply.

*Type:* lazy attribute set of (null or boolean)

*Default:* `{ }`

*Example:*

``` nix
{
  SYS_ADMIN = true;
  SYS_WRITE = false;
}
```

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.cmd` {#opt-virtualisation.oci-containers.containers._name_.cmd}

Commandline arguments to pass to the image's entrypoint.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--port=9000"
]
```

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.dependsOn` {#opt-virtualisation.oci-containers.containers._name_.dependsOn}

Define which other containers this one depends on. They will be added to both After and Requires for the unit.

Use the same name as the attribute under `virtualisation.oci-containers.containers`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
virtualisation.oci-containers.containers = {
  node1 = {};
  node2.dependsOn = [ "node1" ];
};
```

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.devices` {#opt-virtualisation.oci-containers.containers._name_.devices}

List of devices to attach to this container.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/dev/dri:/dev/dri"
]
```

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.entrypoint` {#opt-virtualisation.oci-containers.containers._name_.entrypoint}

Override the default entrypoint of the image.

*Type:* null or string

*Default:* `null`

*Example:* `"/bin/my-app"`

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.environment` {#opt-virtualisation.oci-containers.containers._name_.environment}

Environment variables to set for this container.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  DATABASE_HOST = "db.example.com";
  DATABASE_PORT = "3306";
}
```

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.environmentFiles` {#opt-virtualisation.oci-containers.containers._name_.environmentFiles}

Environment files for this container.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/path/to/.env"
  "/path/to/.env.secret"
]
```

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.extraOptions` {#opt-virtualisation.oci-containers.containers._name_.extraOptions}

Extra options for `podman run`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--network=host"
]
```

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.hostname` {#opt-virtualisation.oci-containers.containers._name_.hostname}

The hostname of the container.

*Type:* null or string

*Default:* `null`

*Example:* `"hello-world"`

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.image` {#opt-virtualisation.oci-containers.containers._name_.image}

OCI image to run.

*Type:* string

*Example:* `"library/hello-world"`

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.imageFile` {#opt-virtualisation.oci-containers.containers._name_.imageFile}

Path to an image file to load before running the image. This can
be used to bypass pulling the image from the registry.

The `image` attribute must match the name and
tag of the image contained in this file, as they will be used to
run the container with that image. If they do not match, the
image will be pulled from the registry as usual.

*Type:* null or path in the Nix store

*Default:* `null`

*Example:* `pkgs.dockerTools.buildImage {...};`

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.imageStream` {#opt-virtualisation.oci-containers.containers._name_.imageStream}

Path to a script that streams the desired image on standard output.

This option is mainly intended for use with
`pkgs.dockerTools.streamLayeredImage` so that the intermediate
image archive does not need to be stored in the Nix store.  For
larger images this optimization can significantly reduce Nix store
churn compared to using the `imageFile` option, because you don't
have to store a new copy of the image archive in the Nix store
every time you change the image.  Instead, if you stream the image
then you only need to build and store the layers that differ from
the previous image.

*Type:* null or package

*Default:* `null`

*Example:* `pkgs.dockerTools.streamLayeredImage {...};`

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.labels` {#opt-virtualisation.oci-containers.containers._name_.labels}

Labels to attach to the container at runtime.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  "traefik.https.routers.example.rule" = "Host(`example.container`)";
}
```

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.log-driver` {#opt-virtualisation.oci-containers.containers._name_.log-driver}

Logging driver for the container.  The default of
`"journald"` means that the container's logs will be
handled as part of the systemd unit.

For more details and a full list of logging drivers, refer to respective backends documentation.

For Docker:
[Docker engine documentation](https://docs.docker.com/engine/logging/configure/)

For Podman:
Refer to the `docker-run(1)` man page.

*Type:* string

*Default:* `"journald"`

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.login.passwordFile` {#opt-virtualisation.oci-containers.containers._name_.login.passwordFile}

Path to file containing password.

*Type:* null or string

*Default:* `null`

*Example:* `"/etc/nixos/dockerhub-password.txt"`

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.login.registry` {#opt-virtualisation.oci-containers.containers._name_.login.registry}

Registry where to login to.

*Type:* null or string

*Default:* `null`

*Example:* `"https://docker.pkg.github.com"`

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.login.username` {#opt-virtualisation.oci-containers.containers._name_.login.username}

Username for login.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.networks` {#opt-virtualisation.oci-containers.containers._name_.networks}

Networks to attach the container to

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.podman` {#opt-virtualisation.oci-containers.containers._name_.podman}

Podman-specific settings in OCI containers. These must be null when using
the `docker` backend.

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.podman.sdnotify` {#opt-virtualisation.oci-containers.containers._name_.podman.sdnotify}

Determines how `podman` should notify systemd that the unit is ready. There are
[three options](https://docs.podman.io/en/latest/markdown/podman-run.1.html#sdnotify-container-conmon-healthy-ignore):

- `conmon`: marks the unit as ready when the container has started.
- `healthy`: marks the unit as ready when the [container's healthcheck](https://docs.podman.io/en/stable/markdown/podman-healthcheck-run.1.html) passes.
- `container`: `NOTIFY_SOCKET` is passed into the container and the process inside the container needs to indicate on its own that it's ready.

*Type:* one of "conmon", "healthy", "container"

*Default:* `"conmon"`

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.podman.user` {#opt-virtualisation.oci-containers.containers._name_.podman.user}

The user under which the container should run.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.ports` {#opt-virtualisation.oci-containers.containers._name_.ports}

Network ports to publish from the container to the outer host.

Valid formats:

- `<ip>:<hostPort>:<containerPort>`
- `<ip>::<containerPort>`
- `<hostPort>:<containerPort>`
- `<containerPort>`

Both `hostPort` and `containerPort` can be specified as a range of
ports.  When specifying ranges for both, the number of container
ports in the range must match the number of host ports in the
range.  Example: `1234-1236:1234-1236/tcp`

When specifying a range for `hostPort` only, the `containerPort`
must *not* be a range.  In this case, the container port is published
somewhere within the specified `hostPort` range.
Example: `1234-1236:1234/tcp`

Publishing a port bypasses the NixOS firewall. If the port is not
supposed to be shared on the network, make sure to publish the
port to localhost.
Example: `127.0.0.1:1234:1234`

Refer to the
[Docker engine documentation](https://docs.docker.com/engine/network/#published-ports) for full details.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "127.0.0.1:8080:9000"
]
```

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.preRunExtraOptions` {#opt-virtualisation.oci-containers.containers._name_.preRunExtraOptions}

Extra options for `podman` that go before the `run` argument.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--runtime"
  "runsc"
]
```

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.privileged` {#opt-virtualisation.oci-containers.containers._name_.privileged}

Give extended privileges to the container

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.pull` {#opt-virtualisation.oci-containers.containers._name_.pull}

Image pull policy for the container. Must be one of: always, missing, never, newer

*Type:* one of "always", "missing", "never", "newer"

*Default:* `"missing"`

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.serviceName` {#opt-virtualisation.oci-containers.containers._name_.serviceName}

Systemd service name that manages the container

*Type:* string

*Default:* `"<backend>-<name>"`

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.tmpFs` {#opt-virtualisation.oci-containers.containers._name_.tmpFs}

Attribute set of container paths to mount into a tmpfs.

Mount options for tmpfs may be passed in as a list for each path.
For the full list of options, refer to the
[Docker engine documentation](https://docs.docker.com/engine/storage/tmpfs/).

*Type:* attribute set of list of string

*Default:* `{ }`

*Example:*

``` nix
{
  "/data" = [
    "noexec"
    "size=1024"
    "mode=1777"
  ];
  "/defaultData" = [ ];
}
```

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.user` {#opt-virtualisation.oci-containers.containers._name_.user}

Override the username or UID (and optionally groupname or GID) used
in the container.

*Type:* null or string

*Default:* `null`

*Example:* `"alice:users"`

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.volumes` {#opt-virtualisation.oci-containers.containers._name_.volumes}

List of volumes to attach to this container.

Note that this is a list of `"src:dst"` strings to
allow for `src` to refer to `/nix/store` paths, which
would be difficult with an attribute set.  There are
also a variety of mount options available as a third
field; please refer to the
[docker engine documentation](https://docs.docker.com/engine/storage/volumes/) for details.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "volume_name:/path/inside/container"
  "/path/on/host:/path/inside/container"
]
```

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.oci-containers.containers.<name>.workdir` {#opt-virtualisation.oci-containers.containers._name_.workdir}

Override the default working directory for the container.

*Type:* null or string

*Default:* `null`

*Example:* `"/var/lib/hello_world"`

*Declared by:* [`nixos/modules/virtualisation/oci-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/oci-containers.nix)

## `virtualisation.podman.autoPrune.dates` {#opt-virtualisation.podman.autoPrune.dates}

Specification (in the format described by
`systemd.time(7)`) of the time at
which the prune will occur.

*Type:* string

*Default:* `"weekly"`

*Declared by:* [`nixos/modules/virtualisation/podman/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/podman/default.nix)

## `virtualisation.podman.autoPrune.enable` {#opt-virtualisation.podman.autoPrune.enable}

Whether to periodically prune Podman resources. If enabled, a
systemd timer will run `podman system prune -f`
as specified by the `dates` option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/podman/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/podman/default.nix)

## `virtualisation.podman.autoPrune.flags` {#opt-virtualisation.podman.autoPrune.flags}

Any additional flags passed to `podman system prune`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--all"
]
```

*Declared by:* [`nixos/modules/virtualisation/podman/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/podman/default.nix)

## `virtualisation.podman.defaultNetwork.settings` {#opt-virtualisation.podman.defaultNetwork.settings}

Settings for podman's default network.

*Type:* JSON value

*Default:* `{ }`

*Example:* `{ dns_enabled = true; }`

*Declared by:* [`nixos/modules/virtualisation/podman/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/podman/default.nix)

## `virtualisation.podman.dns.interfaces` {#opt-virtualisation.podman.dns.interfaces}

List of network interfaces which should have DNS (port 53) traffic allowed.
Auto-named interfaces (`podman0`, `podman1`, ...) are allowed by default.
Add custom podman networks with an explicitly set interface name here.

*Type:* list of non-empty string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/virtualisation/podman/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/podman/default.nix)

## `virtualisation.podman.dns.openFirewall` {#opt-virtualisation.podman.dns.openFirewall}

Whether to allow DNS (port 53) from all network interfaces configured in [`virtualisation.podman.dns.interfaces`](#opt-virtualisation.podman.dns.interfaces) to aardvark-dns.

*Type:* boolean

*Default:*

``` nix
config.networking.firewall.backend != "firewalld"
```

*Declared by:* [`nixos/modules/virtualisation/podman/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/podman/default.nix)

## `virtualisation.podman.dockerCompat` {#opt-virtualisation.podman.dockerCompat}

Create an alias mapping `docker` to `podman`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/podman/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/podman/default.nix)

## `virtualisation.podman.dockerSocket.enable` {#opt-virtualisation.podman.dockerSocket.enable}

Make the Podman socket available in place of the Docker socket, so
Docker tools can find the Podman socket.

Podman implements the Docker API.

Users must be in the `podman` group in order to connect. As
with Docker, members of this group can gain root access.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/podman/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/podman/default.nix)

## `virtualisation.podman.enable` {#opt-virtualisation.podman.enable}

This option enables Podman, a daemonless container engine for
developing, managing, and running OCI Containers on your Linux System.

It is a drop-in replacement for the `docker` command.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/podman/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/podman/default.nix)

## `virtualisation.podman.enableNvidia` {#opt-virtualisation.podman.enableNvidia}

**Deprecated**, please use [`hardware.nvidia-container-toolkit.enable`](../../options/hardware/index.md#opt-hardware.nvidia-container-toolkit.enable) instead.

Enable use of Nvidia GPUs from within podman containers.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/podman/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/podman/default.nix)

## `virtualisation.podman.extraPackages` {#opt-virtualisation.podman.extraPackages}

Extra dependencies for podman to be placed on $PATH in the wrapper.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/virtualisation/podman/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/podman/default.nix)

## `virtualisation.podman.extraRuntimes` {#opt-virtualisation.podman.extraRuntimes}

Extra runtime packages to be installed in the Podman wrapper.
Those are then placed in libexec/podman, i.e. are seen as podman internal commands.

*Type:* list of package

*Default:* `lib.optionals pkgs.stdenv.hostPlatform.isLinux [ pkgs.runc ]`

*Example:*

``` nix
[
  pkgs.gvisor
]
```

*Declared by:* [`nixos/modules/virtualisation/podman/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/podman/default.nix)

## `virtualisation.podman.networkSocket.enable` {#opt-virtualisation.podman.networkSocket.enable}

Make the Podman and Docker compatibility API available over the network
with TLS client certificate authentication.

This allows Docker clients to connect with the equivalents of the Docker
CLI `-H` and `--tls*` family of options.

For certificate setup, see [https://docs.docker.com/engine/security/protect-access/](https://docs.docker.com/engine/security/protect-access/)

This option is independent of [virtualisation](#opt-virtualisation.podman.dockerSocket.enable).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/podman/network-socket.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/podman/network-socket.nix)

## `virtualisation.podman.networkSocket.listenAddress` {#opt-virtualisation.podman.networkSocket.listenAddress}

Interface address for receiving TLS connections.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/virtualisation/podman/network-socket.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/podman/network-socket.nix)

## `virtualisation.podman.networkSocket.openFirewall` {#opt-virtualisation.podman.networkSocket.openFirewall}

Whether to open the port in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/podman/network-socket.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/podman/network-socket.nix)

## `virtualisation.podman.networkSocket.port` {#opt-virtualisation.podman.networkSocket.port}

TCP port number for receiving TLS connections.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `2376`

*Declared by:* [`nixos/modules/virtualisation/podman/network-socket.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/podman/network-socket.nix)

## `virtualisation.podman.networkSocket.server` {#opt-virtualisation.podman.networkSocket.server}

Choice of TLS proxy server.

*Type:* value "ghostunnel" (singular enum)

*Example:* `"ghostunnel"`

*Declared by:*

- [`nixos/modules/virtualisation/podman/network-socket-ghostunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/podman/network-socket-ghostunnel.nix)
- [`nixos/modules/virtualisation/podman/network-socket.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/podman/network-socket.nix)

## `virtualisation.podman.networkSocket.tls.cacert` {#opt-virtualisation.podman.networkSocket.tls.cacert}

Path to CA certificate to use for client authentication.

*Type:* absolute path

*Declared by:* [`nixos/modules/virtualisation/podman/network-socket.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/podman/network-socket.nix)

## `virtualisation.podman.networkSocket.tls.cert` {#opt-virtualisation.podman.networkSocket.tls.cert}

Path to certificate describing the server.

*Type:* absolute path

*Declared by:* [`nixos/modules/virtualisation/podman/network-socket.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/podman/network-socket.nix)

## `virtualisation.podman.networkSocket.tls.key` {#opt-virtualisation.podman.networkSocket.tls.key}

Path to the private key corresponding to the server certificate.

Use a string for this setting. Otherwise it will be copied to the Nix
store first, where it is readable by any system process.

*Type:* absolute path

*Declared by:* [`nixos/modules/virtualisation/podman/network-socket.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/podman/network-socket.nix)

## `virtualisation.podman.package` {#opt-virtualisation.podman.package}

The podman package to use. This package will automatically include extra packages and runtimes.

*Type:* package

*Default:* `pkgs.podman`

*Declared by:* [`nixos/modules/virtualisation/podman/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/podman/default.nix)

## `virtualisation.qemu.consoles` {#opt-virtualisation.qemu.consoles}

The output console devices to pass to the kernel command line via the
`console` parameter, the primary console is the last
item of this list.

By default it enables both serial console and
`tty0`. The preferred console (last one) is based on
the value of [`virtualisation.graphics`](#opt-virtualisation.graphics).

*Type:* list of string

*Default:*

``` nix
[
  "ttyS0,115200n8"
  "tty0"
]
```

*Example:*

``` nix
[
  "tty1"
]
```

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.qemu.diskInterface` {#opt-virtualisation.qemu.diskInterface}

The interface used for the virtual hard disks.

*Type:* one of "virtio", "scsi", "ide"

*Default:* `"virtio"`

*Example:* `"scsi"`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.qemu.drives` {#opt-virtualisation.qemu.drives}

Drives passed to qemu.

*Type:* list of (submodule)

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.qemu.drives.*.deviceExtraOpts` {#opt-virtualisation.qemu.drives._.deviceExtraOpts}

Extra options passed to device flag.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.qemu.drives.*.driveExtraOpts` {#opt-virtualisation.qemu.drives._.driveExtraOpts}

Extra options passed to drive flag.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.qemu.drives.*.file` {#opt-virtualisation.qemu.drives._.file}

The file image used for this drive.

*Type:* string

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.qemu.drives.*.name` {#opt-virtualisation.qemu.drives._.name}

A name for the drive. Must be unique in the drives list. Not passed to qemu.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.qemu.enableSharedMemory` {#opt-virtualisation.qemu.enableSharedMemory}

Enable shared memory

*Type:* boolean

*Default:* `hostPkgs.stdenv.hostPlatform.isLinux`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.qemu.firmware.enable` {#opt-virtualisation.qemu.firmware.enable}

Whether to enable QEMU firmware descriptors in `/etc/qemu/firmware`.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/qemu-firmware.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-firmware.nix)

## `virtualisation.qemu.firmware.packages` {#opt-virtualisation.qemu.firmware.packages}

Packages providing QEMU firmware descriptors under
`share/qemu/firmware`, following the QEMU firmware interop
convention (see `docs/interop/firmware.json` in the QEMU
source tree). The descriptors are merged and linked to
`/etc/qemu/firmware`, where tools like
`systemd-vmspawn` discover the firmware available for
running virtual machines.

The default exposes the descriptors of the firmware images
bundled with QEMU. Note that setting this option replaces the
default, so include `pkgs.qemu` when adding further firmware.

*Type:* list of package

*Default:* `[ pkgs.qemu ]`

*Example:* `[ pkgs.qemu pkgs.OVMF-amdsev.fd ]`

*Declared by:* [`nixos/modules/virtualisation/qemu-firmware.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-firmware.nix)

## `virtualisation.qemu.forceAccel` {#opt-virtualisation.qemu.forceAccel}

Whether to force the use of hardware-accelerated virtualisation.
When enabled, QEMU will not fall back to the slower software
emulation (TCG) and will instead error out if the accelerator is not
available.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.qemu.guestAgent.enable` {#opt-virtualisation.qemu.guestAgent.enable}

Enable the Qemu guest agent.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.qemu.networkingOptions` {#opt-virtualisation.qemu.networkingOptions}

Networking-related command-line options that should be passed to qemu.
The default is to use userspace networking (SLiRP).
See the [QEMU Wiki on Networking](https://wiki.qemu.org/Documentation/Networking) for details.

If you override this option, be advised to keep
`${QEMU_NET_OPTS:+,$QEMU_NET_OPTS}` (as seen in the example)
to keep the default runtime behaviour.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-net nic,netdev=user.0,model=virtio"
  "-netdev user,id=user.0,\${QEMU_NET_OPTS:+,$QEMU_NET_OPTS}"
]
```

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.qemu.options` {#opt-virtualisation.qemu.options}

Options passed to QEMU.
See [QEMU User Documentation](https://www.qemu.org/docs/master/system/qemu-manpage) for a complete list.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-vga std"
]
```

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.qemu.package` {#opt-virtualisation.qemu.package}

QEMU package to use.

*Type:* package

*Default:* `if hostPkgs.stdenv.hostPlatform.qemuArch == pkgs.stdenv.hostPlatform.qemuArch then config.virtualisation.host.pkgs.qemu_kvm else config.virtualisation.host.pkgs.qemu`

*Example:* `pkgs.qemu_test`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.qemu.virtioKeyboard` {#opt-virtualisation.qemu.virtioKeyboard}

Enable the virtio-keyboard device.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.resolution` {#opt-virtualisation.resolution}

The resolution of the virtual machine display (relevant only if virtualised machine uses grub bootloader).

*Type:* attribute set

*Default:*

``` nix
{
  x = 1024;
  y = 768;
}
```

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.restrictNetwork` {#opt-virtualisation.restrictNetwork}

If this option is enabled, the guest will be isolated, i.e. it will
not be able to contact the host and no guest IP packets will be
routed over the host to the outside. This option does not affect
any explicitly set forwarding rules.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.rootDevice` {#opt-virtualisation.rootDevice}

The path (inside the VM) to the device containing the root filesystem.

*Type:* null or absolute path

*Default:* `/dev/disk/by-label/nixos`

*Example:* `"/dev/disk/by-label/nixos"`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.rosetta.enable` {#opt-virtualisation.rosetta.enable}

Whether to enable [Rosetta](https://developer.apple.com/documentation/apple-silicon/about-the-rosetta-translation-environment) support.

This feature requires the system to be a virtualised guest on an Apple silicon host.

The default settings are suitable for the [UTM](https://docs.getutm.app/) virtualisation [package](https://search.nixos.org/packages?channel=unstable&show=utm&from=0&size=1&sort=relevance&type=packages&query=utm).
Make sure to select 'Apple Virtualization' as the virtualisation engine and then tick the 'Enable Rosetta' option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/rosetta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/rosetta.nix)

## `virtualisation.rosetta.mountTag` {#opt-virtualisation.rosetta.mountTag}

The VirtioFS mount tag for the Rosetta runtime, exposed by the host's virtualisation software.

If supported, your virtualisation software should provide instructions on how register the Rosetta runtime inside Linux guests.
These instructions should mention the name of the mount tag used for the VirtioFS directory share that contains the Rosetta runtime.

*Type:* string

*Default:* `"rosetta"`

*Declared by:* [`nixos/modules/virtualisation/rosetta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/rosetta.nix)

## `virtualisation.sharedDirectories` {#opt-virtualisation.sharedDirectories}

An attributes set of directories that will be shared with the
virtual machine using virtiofs on Linux hosts and VirtFS (9P filesystem
over VirtIO) on other hosts. The attribute name will be used as the
mount tag.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  my-share = {
    source = "/path/to/be/shared";
    target = "/mnt/shared";
  };
}
```

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.sharedDirectories.<name>.cache` {#opt-virtualisation.sharedDirectories._name_.cache}

Cache policy for the virtiofs daemon.

For details refer to the [virtiofsd documentation](https://virtio-fs.gitlab.io/virtiofsd/doc/virtiofsd/passthrough/enum.CachePolicy.html).

Effective on Linux hosts only.
Ignored when using VirtFS (9P) (the default on non-Linux hosts).

*Type:* one of "auto", "always", "metadata", "never"

*Default:* `"auto"`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.sharedDirectories.<name>.source` {#opt-virtualisation.sharedDirectories._name_.source}

The path of the directory to share, can be a shell variable

*Type:* string

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.sharedDirectories.<name>.target` {#opt-virtualisation.sharedDirectories._name_.target}

The mount point of the directory inside the virtual machine

*Type:* absolute path

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.sharedDirectories.<name>.writable` {#opt-virtualisation.sharedDirectories._name_.writable}

Whether the directory is writable on the host and guest.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.spiceUSBRedirection.enable` {#opt-virtualisation.spiceUSBRedirection.enable}

Install the SPICE USB redirection helper with setuid
privileges. This allows unprivileged users to pass USB devices
connected to this machine to libvirt VMs, both local and
remote. Note that this allows users arbitrary access to USB
devices.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/spice-usb-redirection.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/spice-usb-redirection.nix)

## `virtualisation.tpm.deviceModel` {#opt-virtualisation.tpm.deviceModel}

QEMU device model for the TPM, uses the appropriate default based on th guest platform system and the package passed.

*Type:* string

*Default:*

``` nix
''
  Based on the guest platform Linux system:
  
  - `tpm-tis` for (i686, x86_64)
  - `tpm-spapr` for ppc64
  - `tpm-tis-device` for (armv7, aarch64)
''
```

*Example:* `"tpm-tis-device"`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.tpm.enable` {#opt-virtualisation.tpm.enable}

Whether to enable a TPM device in the virtual machine with a driver, using swtpm.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.tpm.package` {#opt-virtualisation.tpm.package}

The swtpm package to use.

*Type:* package

*Default:* `pkgs.swtpm`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.tpm.provisioning` {#opt-virtualisation.tpm.provisioning}

Script to provision the TPM before control is handed off to the VM.

`TPM2TOOLS_TCTI` will be provided to configure tpm2-tools to use the
swtpm instance transparently.
`TCTI` is also provided as a generic value, consumer is expected to
re-export it however it may need (`TPM2OPENSSL_TCTI`, `TPM2_PKCS11_TCTI`,
...).

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
tpm2_nvdefine 0xcafecafe \
  -C o \
  -a "ownerread|policyread|policywrite|ownerwrite|authread|authwrite"
echo "foobar" | tpm2_nvwrite 0xcafecafe -C o
```

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.useBIOSBoot` {#opt-virtualisation.useBIOSBoot}

If enabled for legacy MBR VMs, the VM image will have a separate boot
partition mounted at /boot.
useBIOSBoot is ignored if useEFIBoot == true.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.useBootLoader` {#opt-virtualisation.useBootLoader}

Use a boot loader to boot the system.
This allows, among other things, testing the boot loader.

If disabled, the kernel and initrd are directly booted,
forgoing any bootloader.

Check the documentation on [`virtualisation.directBoot.enable`](#opt-virtualisation.directBoot.enable) for details.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.useDefaultFilesystems` {#opt-virtualisation.useDefaultFilesystems}

If enabled, the boot disk of the virtual machine will be
formatted and mounted with the default filesystems for
testing. Swap devices and LUKS will be disabled.

If disabled, a root filesystem has to be specified and
formatted (for example in the initial ramdisk).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.useEFIBoot` {#opt-virtualisation.useEFIBoot}

If enabled, the virtual machine will provide a EFI boot
manager.
useEFIBoot is ignored if useBootLoader == false.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.useHostCerts` {#opt-virtualisation.useHostCerts}

If enabled, when `NIX_SSL_CERT_FILE` is set on the host,
pass the CA certificates from the host to the VM.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.useNixStoreImage` {#opt-virtualisation.useNixStoreImage}

Build and use a disk image for the Nix store, instead of
accessing the host's one.

For applications which do a lot of reads from the store,
this can drastically improve performance, but at the cost of
disk space and image build time.

The Nix store image is built just-in-time right before the VM is
started. Because it does not produce another derivation, the image is
not cached between invocations and never lands in the store or binary
cache.

If you want a full disk image with a partition table and a root
filesystem instead of only a store image, enable
[`virtualisation.useBootLoader`](#opt-virtualisation.useBootLoader) instead.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.virtualbox.guest.clipboard` {#opt-virtualisation.virtualbox.guest.clipboard}

Whether to enable clipboard support.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/virtualisation/virtualbox-guest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/virtualbox-guest.nix)

## `virtualisation.virtualbox.guest.dragAndDrop` {#opt-virtualisation.virtualbox.guest.dragAndDrop}

Whether to enable drag and drop support.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/virtualisation/virtualbox-guest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/virtualbox-guest.nix)

## `virtualisation.virtualbox.guest.enable` {#opt-virtualisation.virtualbox.guest.enable}

Whether to enable the VirtualBox service and other guest additions.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/virtualbox-guest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/virtualbox-guest.nix)

## `virtualisation.virtualbox.guest.package` {#opt-virtualisation.virtualbox.guest.package}

The virtualboxGuestAdditions package to use.

*Type:* package

*Default:* `config.boot.kernelPackages.virtualboxGuestAdditions`

*Declared by:* [`nixos/modules/virtualisation/virtualbox-guest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/virtualbox-guest.nix)

## `virtualisation.virtualbox.guest.seamless` {#opt-virtualisation.virtualbox.guest.seamless}

Whether to enable seamless mode. When activated windows from the guest appear next to the windows of the host.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/virtualisation/virtualbox-guest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/virtualbox-guest.nix)

## `virtualisation.virtualbox.guest.use3rdPartyModules` {#opt-virtualisation.virtualbox.guest.use3rdPartyModules}

Whether to use the kernel modules provided by VirtualBox instead of the ones from the upstream kernel.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/virtualisation/virtualbox-guest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/virtualbox-guest.nix)

## `virtualisation.virtualbox.guest.vboxsf` {#opt-virtualisation.virtualbox.guest.vboxsf}

Whether to load vboxsf

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/virtualisation/virtualbox-guest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/virtualbox-guest.nix)

## `virtualisation.virtualbox.guest.verbose` {#opt-virtualisation.virtualbox.guest.verbose}

Whether to verbose logging for guest services.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/virtualbox-guest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/virtualbox-guest.nix)

## `virtualisation.virtualbox.host.addNetworkInterface` {#opt-virtualisation.virtualbox.host.addNetworkInterface}

Automatically set up a vboxnet0 host-only network interface.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/virtualisation/virtualbox-host.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/virtualbox-host.nix)

## `virtualisation.virtualbox.host.enable` {#opt-virtualisation.virtualbox.host.enable}

Whether to enable VirtualBox.

::: note
In order to pass USB devices from the host to the guests, the user
needs to be in the `vboxusers` group.
:::

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/virtualbox-host.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/virtualbox-host.nix)

## `virtualisation.virtualbox.host.enableExtensionPack` {#opt-virtualisation.virtualbox.host.enableExtensionPack}

Whether to install the Oracle Extension Pack for VirtualBox.

::: important
You must set `nixpkgs.config.allowUnfree = true` in
order to use this.  This requires you accept the VirtualBox PUEL.
:::

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/virtualbox-host.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/virtualbox-host.nix)

## `virtualisation.virtualbox.host.enableHardening` {#opt-virtualisation.virtualbox.host.enableHardening}

Enable hardened VirtualBox, which ensures that only the binaries in the
system path get access to the devices exposed by the kernel modules
instead of all users in the vboxusers group.

::: important
Disabling this can put your system's security at risk, as local users
in the vboxusers group can tamper with the VirtualBox device files.
:::

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/virtualisation/virtualbox-host.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/virtualbox-host.nix)

## `virtualisation.virtualbox.host.enableKvm` {#opt-virtualisation.virtualbox.host.enableKvm}

Enable KVM support for VirtualBox. This increases compatibility with Linux kernel versions, because the VirtualBox kernel modules
are not required.

This option is incompatible with `addNetworkInterface`.

Note: This is experimental. Please check [https://github.com/cyberus-technology/virtualbox-kvm/issues](https://github.com/cyberus-technology/virtualbox-kvm/issues).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/virtualbox-host.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/virtualbox-host.nix)

## `virtualisation.virtualbox.host.enableWebService` {#opt-virtualisation.virtualbox.host.enableWebService}

Build VirtualBox web service tool (vboxwebsrv) to allow managing VMs via other webpage frontend tools. Useful for headless servers.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/virtualbox-host.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/virtualbox-host.nix)

## `virtualisation.virtualbox.host.headless` {#opt-virtualisation.virtualbox.host.headless}

Use VirtualBox installation without GUI and Qt dependency. Useful to enable on servers
and when virtual machines are controlled only via SSH.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/virtualbox-host.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/virtualbox-host.nix)

## `virtualisation.virtualbox.host.package` {#opt-virtualisation.virtualbox.host.package}

The virtualbox package to use.

*Type:* package

*Default:* `pkgs.virtualbox`

*Declared by:* [`nixos/modules/virtualisation/virtualbox-host.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/virtualbox-host.nix)

## `virtualisation.vmVariant` {#opt-virtualisation.vmVariant}

Machine configuration to be added for the vm script produced by `nixos-rebuild build-vm`.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/build-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/build-vm.nix)

## `virtualisation.vmVariantWithBootLoader` {#opt-virtualisation.vmVariantWithBootLoader}

Machine configuration to be added for the vm script produced by `nixos-rebuild build-vm-with-bootloader`.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/build-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/build-vm.nix)

## `virtualisation.vmware.guest.enable` {#opt-virtualisation.vmware.guest.enable}

Whether to enable VMWare Guest Support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/vmware-guest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/vmware-guest.nix)

## `virtualisation.vmware.guest.headless` {#opt-virtualisation.vmware.guest.headless}

Whether to disable X11-related features.

*Type:* boolean

*Default:* `!config.services.xserver.enable`

*Declared by:* [`nixos/modules/virtualisation/vmware-guest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/vmware-guest.nix)

## `virtualisation.vmware.guest.package` {#opt-virtualisation.vmware.guest.package}

Package providing open-vm-tools.

*Type:* package

*Default:* `if config.virtualisation.vmware.headless then pkgs.open-vm-tools-headless else pkgs.open-vm-tools;`

*Example:* `pkgs.open-vm-tools`

*Declared by:* [`nixos/modules/virtualisation/vmware-guest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/vmware-guest.nix)

## `virtualisation.vmware.host.enable` {#opt-virtualisation.vmware.host.enable}

This enables VMware host virtualisation for running VMs.

::: important
`vmware-vmx` will cause kcompactd0 due to
`Transparent Hugepages` feature in kernel.
Apply `[ "transparent_hugepage=never" ]` in
option [`boot.kernelParams`](../../options/boot/index.md#opt-boot.kernelParams) to disable them.
:::

::: note
If that didn't work disable `TRANSPARENT_HUGEPAGE`,
`COMPACTION` configs and recompile kernel.
:::

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/vmware-host.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/vmware-host.nix)

## `virtualisation.vmware.host.extraConfig` {#opt-virtualisation.vmware.host.extraConfig}

Add extra config to /etc/vmware/config

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  # Allow unsupported device's OpenGL and Vulkan acceleration for guest vGPU
  mks.gl.allowUnsupportedDrivers = "TRUE"
  mks.vk.allowUnsupportedDevices = "TRUE"
''
```

*Declared by:* [`nixos/modules/virtualisation/vmware-host.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/vmware-host.nix)

## `virtualisation.vmware.host.extraPackages` {#opt-virtualisation.vmware.host.extraPackages}

Extra packages to be used with VMware host.

*Type:* list of package

*Default:* `[ ]`

*Example:* `"with pkgs; [ ntfs3g ]"`

*Declared by:* [`nixos/modules/virtualisation/vmware-host.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/vmware-host.nix)

## `virtualisation.vmware.host.package` {#opt-virtualisation.vmware.host.package}

The vmware-workstation package to use.

*Type:* package

*Default:* `pkgs.vmware-workstation`

*Declared by:* [`nixos/modules/virtualisation/vmware-host.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/vmware-host.nix)

## `virtualisation.vswitch.enable` {#opt-virtualisation.vswitch.enable}

Whether to enable Open vSwitch. A configuration daemon (ovs-server)
will be started.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/openvswitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/openvswitch.nix)

## `virtualisation.vswitch.package` {#opt-virtualisation.vswitch.package}

The openvswitch package to use.

*Type:* package

*Default:* `pkgs.openvswitch`

*Declared by:* [`nixos/modules/virtualisation/openvswitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/openvswitch.nix)

## `virtualisation.vswitch.resetOnStart` {#opt-virtualisation.vswitch.resetOnStart}

Whether to reset the Open vSwitch configuration database to a default
configuration on every start of the systemd `ovsdb.service`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/openvswitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/openvswitch.nix)

## `virtualisation.waydroid.enable` {#opt-virtualisation.waydroid.enable}

Whether to enable Waydroid.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/waydroid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/waydroid.nix)

## `virtualisation.waydroid.package` {#opt-virtualisation.waydroid.package}

The waydroid package to use.

*Type:* package

*Default:* `if config.networking.nftables.enable then pkgs.waydroid-nftables else pkgs.waydroid`

*Declared by:* [`nixos/modules/virtualisation/waydroid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/waydroid.nix)

## `virtualisation.writableStore` {#opt-virtualisation.writableStore}

If enabled, the Nix store in the VM is made writable by
layering an overlay filesystem on top of the host's Nix
store.

By default, this is enabled if you mount a host Nix store.

*Type:* boolean

*Default:* `cfg.mountHostNixStore`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.writableStoreUseTmpfs` {#opt-virtualisation.writableStoreUseTmpfs}

Use a tmpfs for the writable store instead of writing to the VM's
own filesystem.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/virtualisation/qemu-vm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix)

## `virtualisation.xen.boot.bios.path` {#opt-virtualisation.xen.boot.bios.path}

Path to the Xen `multiboot` binary used for BIOS booting.
Unless you're building your own Xen derivation, you should leave this
option as the default value.

*Type:* absolute path

*Default:* `${config.virtualisation.xen.package.boot}/${config.virtualisation.xen.package.multiboot}`

*Example:* `${config.virtualisation.xen.package}/boot/xen-${config.virtualisation.xen.package.upstreamVersion}`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.boot.builderVerbosity` {#opt-virtualisation.xen.boot.builderVerbosity}

The boot entry builder script should be called with exactly one of the following arguments in order to specify its verbosity:

- `quiet` supresses all messages.

- `default` adds a simple "Installing Xen Project Hypervisor boot entries...done." message to the script.

- `info` is the same as `default`, but it also prints a diff with information on which generations were altered.

  - This option adds two extra dependencies to the script: `diffutils` and `bat`.

- `debug` prints information messages for every single step of the script.

This option does not alter the actual functionality of the script, just the number of messages printed when rebuilding the system.

*Type:* one of "default", "info", "debug", "quiet"

*Default:* `"default"`

*Example:* `"info"`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.boot.efi.path` {#opt-virtualisation.xen.boot.efi.path}

Path to xen.efi. `pkgs.xen` is patched to install the xen.efi file
on `$boot/boot/xen.efi`, but an unpatched Xen build may install it
somewhere else, such as `$out/boot/efi/efi/nixos/xen.efi`. Unless
you're building your own Xen derivation, you should leave this
option as the default value.

*Type:* absolute path

*Default:* `${config.virtualisation.xen.package.boot}/${config.virtualisation.xen.package.efi}`

*Example:* `${config.virtualisation.xen.package}/boot/efi/efi/nixos/xen-${config.virtualisation.xen.package.upstreamVersion}.efi`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.boot.params` {#opt-virtualisation.xen.boot.params}

Xen Command Line parameters passed to Domain 0 at boot time.

::: note
Note: these are different from [`boot.kernelParams`](../../options/boot/index.md#opt-boot.kernelParams). See
the [Xen documentation](https://xenbits.xenproject.org/docs/unstable/misc/xen-command-line.html) for more information.
:::

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "iommu=force:true,qinval:true,debug:true"
  "noreboot=true"
  "vga=ask"
]
```

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.debug` {#opt-virtualisation.xen.debug}

Whether to enable Xen debug features for Domain 0. This option enables some hidden debugging tests and features, and should not be used in production.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.dom0Resources.maxMemory` {#opt-virtualisation.xen.dom0Resources.maxMemory}

Maximum amount of memory (in MiB) that Domain 0 can
dynamically allocate to itself. Does nothing if set
to the same amount as virtualisation.xen.memory, or
if that option is set to 0.

*Type:* unsigned integer, meaning \>=0

*Default:* `config.virtualisation.xen.dom0Resources.memory`

*Example:* `1024`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.dom0Resources.maxVCPUs` {#opt-virtualisation.xen.dom0Resources.maxVCPUs}

Amount of virtual CPU cores allocated to Domain 0 on boot.
If set to 0, all cores are assigned to Domain 0, and
unprivileged domains will compete with Domain 0 for CPU time.

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Example:* `4`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.dom0Resources.memory` {#opt-virtualisation.xen.dom0Resources.memory}

Amount of memory (in MiB) allocated to Domain 0 on boot.
If set to 0, all memory is assigned to Domain 0, and
unprivileged domains will compete with Domain 0 for free RAM.

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Example:* `512`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.domains.extraConfig` {#opt-virtualisation.xen.domains.extraConfig}

Options defined here will override the defaults for xendomains.
The default options can be seen in the file included from
/etc/default/xendomains.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
XENDOMAINS_SAVE=/persist/xen/save
XENDOMAINS_RESTORE=false
XENDOMAINS_CREATE_USLEEP=10000000
```

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.enable` {#opt-virtualisation.xen.enable}

Whether to enable the Xen Project Hypervisor, a virtualisation technology defined as a *type-1 hypervisor*, which allows multiple virtual machines, known as *domains*, to run concurrently on the physical machine. NixOS runs as the privileged *Domain 0*. This option requires a reboot into a Xen kernel to take effect.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.package` {#opt-virtualisation.xen.package}

The Xen Hypervisor package to use.

*Type:* package

*Default:* `pkgs.xen`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.qemu.package` {#opt-virtualisation.xen.qemu.package}

The QEMU (with Xen Hypervisor support) package to use.

*Type:* package

*Default:* `pkgs.qemu_xen`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.qemu.pidFile` {#opt-virtualisation.xen.qemu.pidFile}

Path to the QEMU PID file.

*Type:* absolute path

*Default:* `"/run/xen/qemu-dom0.pid"`

*Example:* `"/var/run/xen/qemu-dom0.pid"`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.package` {#opt-virtualisation.xen.store.package}

The oxenstored package to use. This is only used if the Xen Store Daemon being used is the newer OCaml-based store.
The legacy C-based store is always included.

*Type:* package

*Default:* `pkgs.ocamlPackages.oxenstored`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.path` {#opt-virtualisation.xen.store.path}

Path to the Xen Store Daemon. This option is useful to
switch between the legacy C-based Xen Store Daemon, and
the newer OCaml-based Xen Store Daemon, `oxenstored`.

*Type:* absolute path

*Default:* `${config.virtualisation.xen.store.package}/bin/oxenstored`

*Example:* `${config.virtualisation.xen.package}/bin/xenstored`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.settings` {#opt-virtualisation.xen.store.settings}

The OCaml-based Xen Store Daemon configuration. This
option does nothing with the C-based `xenstored`.

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
{
  conflict = {
    burstLimit = 15.0;
    maxHistorySeconds = 0.12;
  };
  enableMerge = false;
  quota = {
    enable = true;
    maxWatchEvents = 2048;
  };
  xenstored = {
    log = {
      file = "/dev/null";
      level = "info";
    };
  };
}
```

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.settings.conflict.burstLimit` {#opt-virtualisation.xen.store.settings.conflict.burstLimit}

Limits applied to domains whose writes cause other domains' transaction
commits to fail. Must include decimal point.

The burst limit is the number of conflicts a domain can cause to
fail in a short period; this value is used for both the initial and
the maximum value of each domain's conflict-credit, which falls by
one point for each conflict caused, and when it reaches zero the
domain's requests are ignored.

*Type:* nonnegative floating point number, meaning \>=0

*Default:* `5.0`

*Example:* `15.0`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.settings.conflict.maxHistorySeconds` {#opt-virtualisation.xen.store.settings.conflict.maxHistorySeconds}

Limits applied to domains whose writes cause other domains' transaction
commits to fail. Must include decimal point.

The conflict-credit is replenished over time:
one point is issued after each conflict.maxHistorySeconds, so this
is the minimum pause-time during which a domain will be ignored.

*Type:* nonnegative floating point number, meaning \>=0

*Default:* `0.05`

*Example:* `1.0`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.settings.conflict.rateLimitIsAggregate` {#opt-virtualisation.xen.store.settings.conflict.rateLimitIsAggregate}

If the conflict.rateLimitIsAggregate option is `true`, then after each
tick one point of conflict-credit is given to just one domain: the
one at the front of the queue. If `false`, then after each tick each
domain gets a point of conflict-credit.

In environments where it is known that every transaction will
involve a set of nodes that is writable by at most one other domain,
then it is safe to set this aggregate limit flag to `false` for better
performance. (This can be determined by considering the layout of
the xenstore tree and permissions, together with the content of the
transactions that require protection.)

A transaction which involves a set of nodes which can be modified by
multiple other domains can suffer conflicts caused by any of those
domains, so the flag must be set to `true`.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.settings.enableMerge` {#opt-virtualisation.xen.store.settings.enableMerge}

Whether to enable transaction merge support.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.settings.perms.enable` {#opt-virtualisation.xen.store.settings.perms.enable}

Whether to enable the node permission system.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.settings.perms.enableWatch` {#opt-virtualisation.xen.store.settings.perms.enableWatch}

Whether to enable the watch permission system.

When this is set to `true`, unprivileged guests can only get watch events
for xenstore entries that they would've been able to read.

When this is set to `false`, unprivileged guests may get watch events
for xenstore entries that they cannot read. The watch event contains
only the entry name, not the value.
This restores behaviour prior to [XSA-115](https://xenbits.xenproject.org/xsa/advisory-115.html).

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.settings.persistent` {#opt-virtualisation.xen.store.settings.persistent}

Whether to activate the filed base backend.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.settings.pidFile` {#opt-virtualisation.xen.store.settings.pidFile}

Path to the Xen Store Daemon PID file.

*Type:* absolute path

*Default:* `"/run/xen/xenstored.pid"`

*Example:* `"/var/run/xen/xenstored.pid"`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.settings.quota.enable` {#opt-virtualisation.xen.store.settings.quota.enable}

Whether to enable the quota system.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.settings.quota.maxEntity` {#opt-virtualisation.xen.store.settings.quota.maxEntity}

Entity limit for transactions.

*Type:* positive integer, meaning \>0

*Default:* `1000`

*Example:* `1024`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.settings.quota.maxOutstanding` {#opt-virtualisation.xen.store.settings.quota.maxOutstanding}

Maximum outstanding requests, i.e. in-flight requests / domain.

*Type:* positive integer, meaning \>0

*Default:* `1024`

*Example:* `1024`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.settings.quota.maxPath` {#opt-virtualisation.xen.store.settings.quota.maxPath}

Path limit for the quota system.

*Type:* positive integer, meaning \>0

*Default:* `1024`

*Example:* `1024`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.settings.quota.maxRequests` {#opt-virtualisation.xen.store.settings.quota.maxRequests}

Maximum number of requests per transaction.

*Type:* positive integer, meaning \>0

*Default:* `1024`

*Example:* `1024`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.settings.quota.maxSize` {#opt-virtualisation.xen.store.settings.quota.maxSize}

Size limit for transactions.

*Type:* positive integer, meaning \>0

*Default:* `2048`

*Example:* `4096`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.settings.quota.maxWatch` {#opt-virtualisation.xen.store.settings.quota.maxWatch}

Maximum number of watches by the Xenstore Watchdog.

*Type:* positive integer, meaning \>0

*Default:* `100`

*Example:* `256`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.settings.quota.maxWatchEvents` {#opt-virtualisation.xen.store.settings.quota.maxWatchEvents}

Maximum number of outstanding watch events per watch.

*Type:* positive integer, meaning \>0

*Default:* `1024`

*Example:* `2048`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.settings.quota.transaction` {#opt-virtualisation.xen.store.settings.quota.transaction}

Maximum number of transactions.

*Type:* positive integer, meaning \>0

*Default:* `10`

*Example:* `50`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.settings.ringScanInterval` {#opt-virtualisation.xen.store.settings.ringScanInterval}

Perodic scanning for all the rings as a safenet for lazy clients.
Define the interval in seconds; set to a negative integer to disable.

*Type:* nonzero signed integer, meaning !=0

*Default:* `20`

*Example:* `30`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.settings.xenstored.accessLog.file` {#opt-virtualisation.xen.store.settings.xenstored.accessLog.file}

Path to the Xen Store access log file.

*Type:* absolute path

*Default:* `"/var/log/xen/xenstored-access.log"`

*Example:* `"/var/log/security/xenstored-access.log"`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.settings.xenstored.log.file` {#opt-virtualisation.xen.store.settings.xenstored.log.file}

Path to the Xen Store log file.

*Type:* absolute path

*Default:* `"/var/log/xen/xenstored.log"`

*Example:* `"/dev/null"`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.store.settings.xenstored.log.level` {#opt-virtualisation.xen.store.settings.xenstored.log.level}

Logging level for the Xen Store.

*Type:* null or one of "debug", "info", "warn", "error"

*Default:* `if (config.virtualisation.xen.trace == true) then "debug" else null`

*Example:* `"error"`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)

## `virtualisation.xen.trace` {#opt-virtualisation.xen.trace}

Whether to enable Xen debug tracing and logging for Domain 0.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/xen-dom0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xen-dom0.nix)
