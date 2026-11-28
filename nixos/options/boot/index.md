# boot {#sec-options-boot}

## `boot.bcache.enable` {#opt-boot.bcache.enable}

Whether to enable bcache mount support.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/tasks/bcache.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/bcache.nix)

## `boot.bcachefs.package` {#opt-boot.bcachefs.package}

The bcachefs-tools package to use. This package should also provide a passthru 'kernelModule'
attribute to build the out-of-tree kernel module.

*Type:* package

*Default:* `pkgs.bcachefs-tools`

*Declared by:* [`nixos/modules/tasks/filesystems/bcachefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/bcachefs.nix)

## `boot.binfmt.addEmulatedSystemsToNixSandbox` {#opt-boot.binfmt.addEmulatedSystemsToNixSandbox}

Whether to add the [`boot.binfmt.emulatedSystems`](#opt-boot.binfmt.emulatedSystems) to `nix.settings.extra-platforms`.
Disable this to use remote builders for those platforms, while allowing testing binaries locally.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/system/boot/binfmt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/binfmt.nix)

## `boot.binfmt.emulatedSystems` {#opt-boot.binfmt.emulatedSystems}

List of systems to emulate. Will also configure Nix to
support your new systems.
Warning: the builder can execute all emulated systems within the same build, which introduces impurities in the case of cross compilation.

*Type:* list of (one of "aarch64-linux", "aarch64\_be-linux", "alpha-linux", "armv6l-linux", "armv7l-linux", "i386-linux", "i486-linux", "i586-linux", "i686-linux", "i686-windows", "loongarch64-linux", "mips-linux", "mips64-linux", "mips64-linuxabin32", "mips64el-linux", "mips64el-linuxabin32", "mipsel-linux", "powerpc-linux", "powerpc64-linux", "powerpc64le-linux", "riscv32-linux", "riscv64-linux", "s390x-linux", "sparc-linux", "sparc64-linux", "wasm32-wasip1", "wasm64-wasip1", "x86\_64-linux", "x86\_64-windows")

*Default:* `[ ]`

*Example:*

``` nix
[
  "wasm32-wasip1"
  "x86_64-windows"
  "aarch64-linux"
]
```

*Declared by:* [`nixos/modules/system/boot/binfmt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/binfmt.nix)

## `boot.binfmt.preferStaticEmulators` {#opt-boot.binfmt.preferStaticEmulators}

Whether to use static emulators when available.

This enables the kernel to preload the emulator binaries when
the binfmt registrations are added, obviating the need to make
the emulator binaries available inside chroots and chroot-like
sandboxes.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/binfmt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/binfmt.nix)

## `boot.binfmt.registrations` {#opt-boot.binfmt.registrations}

Extra binary formats to register with the kernel.
See [https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.html](https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.html) for more details.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/binfmt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/binfmt.nix)

## `boot.binfmt.registrations.<name>.fixBinary` {#opt-boot.binfmt.registrations._name_.fixBinary}

Whether to open the interpreter file as soon as the
registration is loaded, rather than waiting for a
relevant file to be invoked.

See the description of the 'F' flag in the kernel docs
for more details.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/binfmt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/binfmt.nix)

## `boot.binfmt.registrations.<name>.interpreter` {#opt-boot.binfmt.registrations._name_.interpreter}

The interpreter to invoke to run the program.

Note that the actual registration will point to
/run/binfmt/${name}, so the kernel interpreter length
limit doesn't apply.

*Type:* absolute path

*Declared by:* [`nixos/modules/system/boot/binfmt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/binfmt.nix)

## `boot.binfmt.registrations.<name>.magicOrExtension` {#opt-boot.binfmt.registrations._name_.magicOrExtension}

The magic number or extension to match on.

*Type:* string

*Declared by:* [`nixos/modules/system/boot/binfmt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/binfmt.nix)

## `boot.binfmt.registrations.<name>.mask` {#opt-boot.binfmt.registrations._name_.mask}

A mask to be ANDed with the byte sequence of the file before matching

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/binfmt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/binfmt.nix)

## `boot.binfmt.registrations.<name>.matchCredentials` {#opt-boot.binfmt.registrations._name_.matchCredentials}

Whether to launch with the credentials and security
token of the binary, not the interpreter (e.g. setuid
bit).

See the description of the 'C' flag in the kernel docs
for more details.

Implies/requires openBinary = true.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/binfmt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/binfmt.nix)

## `boot.binfmt.registrations.<name>.offset` {#opt-boot.binfmt.registrations._name_.offset}

The byte offset of the magic number used for recognition.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/binfmt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/binfmt.nix)

## `boot.binfmt.registrations.<name>.openBinary` {#opt-boot.binfmt.registrations._name_.openBinary}

Whether to pass the binary to the interpreter as an open
file descriptor, instead of a path.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/binfmt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/binfmt.nix)

## `boot.binfmt.registrations.<name>.preserveArgvZero` {#opt-boot.binfmt.registrations._name_.preserveArgvZero}

Whether to pass the original argv\[0\] to the interpreter.

See the description of the 'P' flag in the kernel docs
for more details;

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/binfmt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/binfmt.nix)

## `boot.binfmt.registrations.<name>.recognitionType` {#opt-boot.binfmt.registrations._name_.recognitionType}

Whether to recognize executables by magic number or extension.

*Type:* one of "magic", "extension"

*Default:* `"magic"`

*Declared by:* [`nixos/modules/system/boot/binfmt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/binfmt.nix)

## `boot.binfmt.registrations.<name>.wrapInterpreterInShell` {#opt-boot.binfmt.registrations._name_.wrapInterpreterInShell}

Whether to wrap the interpreter in a shell script.

This allows a shell command to be set as the interpreter.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/binfmt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/binfmt.nix)

## `boot.blacklistedKernelModules` {#opt-boot.blacklistedKernelModules}

Set of names of kernel modules that should not be loaded
automatically by the hardware probing code. This can either be
a list of modules or an attrset. In an attrset, names that are
set to `true` represent modules that will be blacklisted.

*Type:* (attribute set of boolean) or (list of string) convertible to it

*Default:* `{ }`

*Example:*

``` nix
[
  "cirrusfb"
  "i2c_piix4"
]
```

*Declared by:* [`nixos/modules/system/boot/modprobe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/modprobe.nix)

## `boot.bootspec.enableValidation` {#opt-boot.bootspec.enableValidation}

Whether to enable the validation of bootspec documents for each build.
This will introduce Go in the build-time closure as we are relying on [Cuelang](https://cuelang.org/) for schema validation.
Enable this option if you want to ascertain that your documents are correct
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/activation/bootspec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/bootspec.nix)

## `boot.bootspec.extensions` {#opt-boot.bootspec.extensions}

User-defined data that extends the bootspec document.

To reduce incompatibility and prevent names from clashing
between applications, it is **highly recommended** to use a
unique namespace for your extensions.

*Type:* attribute set of anything

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/activation/bootspec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/bootspec.nix)

## `boot.bootspec.package` {#opt-boot.bootspec.package}

The bootspec package to use.

*Type:* package

*Default:* `pkgs.bootspec`

*Declared by:* [`nixos/modules/system/activation/bootspec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/bootspec.nix)

## `boot.consoleLogLevel` {#opt-boot.consoleLogLevel}

The kernel console `loglevel`. All Kernel Messages with a log level smaller
than this setting will be printed to the console.

*Type:* signed integer

*Default:* `4`

*Declared by:* [`nixos/modules/system/boot/kernel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/kernel.nix)

## `boot.crashDump.enable` {#opt-boot.crashDump.enable}

If enabled, NixOS will set up a kernel that will
boot on crash, and leave the user in systemd rescue
to be able to save the crashed kernel dump at
/proc/vmcore.
It also activates the NMI watchdog.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/misc/crashdump.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/crashdump.nix)

## `boot.crashDump.kernelParams` {#opt-boot.crashDump.kernelParams}

Parameters that will be passed to the kernel kexec-ed on crash.

*Type:* list of string

*Default:*

``` nix
[
  "1"
  "boot.shell_on_fail"
]
```

*Declared by:* [`nixos/modules/misc/crashdump.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/crashdump.nix)

## `boot.crashDump.reservedMemory` {#opt-boot.crashDump.reservedMemory}

The amount of memory reserved for the crashdump kernel.
If you choose a too high value, dmesg will mention
"crashkernel reservation failed".

*Type:* string

*Default:* `"128M"`

*Declared by:* [`nixos/modules/misc/crashdump.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/crashdump.nix)

## `boot.devShmSize` {#opt-boot.devShmSize}

Size limit for the /dev/shm tmpfs. Look at `mount(8)`, tmpfs size option,
for the accepted syntax.

*Type:* string

*Default:* `"50%"`

*Example:* `"256m"`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `boot.devSize` {#opt-boot.devSize}

Size limit for the /dev tmpfs. Look at `mount(8)`, tmpfs size option,
for the accepted syntax.

*Type:* string

*Default:* `"5%"`

*Example:* `"32m"`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `boot.enableContainers` {#opt-boot.enableContainers}

Whether to enable support for NixOS containers.

*Type:* boolean

*Default:* `config.containers != { }`

*Declared by:* [`nixos/modules/virtualisation/nixos-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/nixos-containers.nix)

## `boot.extraModprobeConfig` {#opt-boot.extraModprobeConfig}

Any additional configuration to be appended to the generated
`modprobe.conf`.  This is typically used to
specify module options.  See
`modprobe.d(5)` for details.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  options parport_pc io=0x378 irq=7 dma=1
''
```

*Declared by:* [`nixos/modules/system/boot/modprobe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/modprobe.nix)

## `boot.extraModulePackages` {#opt-boot.extraModulePackages}

A list of additional packages supplying kernel modules.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ config.boot.kernelPackages.nvidia_x11 ]`

*Declared by:* [`nixos/modules/system/boot/kernel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/kernel.nix)

## `boot.extraSystemdUnitPaths` {#opt-boot.extraSystemdUnitPaths}

Additional paths that get appended to the SYSTEMD\_UNIT\_PATH environment variable
that can contain mutable unit files.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/stage-2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/stage-2.nix)

## `boot.growPartition` {#opt-boot.growPartition}

Whether to enable growing the root partition on boot.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/grow-partition.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/grow-partition.nix)

## `boot.hardwareScan` {#opt-boot.hardwareScan}

Whether to try to load kernel modules for all detected hardware.
Usually this does a good job of providing you with the modules
you need, but sometimes it can crash the system or cause other
nasty effects.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/hardware/udev.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/udev.nix)

## `boot.initrd.allowMissingModules` {#opt-boot.initrd.allowMissingModules}

Whether the initrd can be built even though modules listed in
[`boot.initrd.kernelModules`](#opt-boot.initrd.kernelModules) or
[`boot.initrd.availableKernelModules`](#opt-boot.initrd.availableKernelModules) are missing from
the kernel. This is useful when combining configurations that
include a lot of modules, such as
[`hardware.enableAllHardware`](../../options/hardware/index.md#opt-hardware.enableAllHardware), with kernels that don't
provide as many modules as typical NixOS kernels.

Note that enabling this is discouraged. Instead, try disabling
individual modules by setting e.g.
`boot.initrd.availableKernelModules.foo = lib.mkForce false;`

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/kernel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/kernel.nix)

## `boot.initrd.availableKernelModules` {#opt-boot.initrd.availableKernelModules}

The set of kernel modules in the initial ramdisk used during the
boot process.  This set must include all modules necessary for
mounting the root device.  That is, it should include modules
for the physical device (e.g., SCSI drivers) and for the file
system (e.g., ext3).  The set specified here is automatically
closed under the module dependency relation, i.e., all
dependencies of the modules list here are included
automatically.  The modules listed here are available in the
initrd, but are only loaded on demand (e.g., the ext3 module is
loaded automatically when an ext3 filesystem is mounted, and
modules for PCI devices are loaded when they match the PCI ID
of a device in your system).  To force a module to be loaded,
include it in [`boot.initrd.kernelModules`](#opt-boot.initrd.kernelModules).

This can either be a list of modules, or an attrset. In an
attrset, names that are set to `true` represent modules that will
be included. Note that setting these names to `false` does not
prevent the module from being loaded. For that, use
[`boot.blacklistedKernelModules`](#opt-boot.blacklistedKernelModules).

*Type:* (attribute set of boolean) or (list of string) convertible to it

*Default:* `{ }`

*Example:*

``` nix
[
  "sata_nv"
  "ext3"
]
```

*Declared by:* [`nixos/modules/system/boot/kernel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/kernel.nix)

## `boot.initrd.checkJournalingFS` {#opt-boot.initrd.checkJournalingFS}

Whether to run `fsck` on journaling filesystems such as ext3.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/stage-1.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/stage-1.nix)

## `boot.initrd.clevis.devices` {#opt-boot.initrd.clevis.devices}

Encrypted devices that need to be unlocked at boot using Clevis

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/clevis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/clevis.nix)

## `boot.initrd.clevis.devices.<name>.secretFile` {#opt-boot.initrd.clevis.devices._name_.secretFile}

Clevis JWE file used to decrypt the device at boot, in concert with the chosen pin (one of TPM2, Tang server, or SSS).

*Type:* absolute path

*Declared by:* [`nixos/modules/system/boot/clevis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/clevis.nix)

## `boot.initrd.clevis.enable` {#opt-boot.initrd.clevis.enable}

Whether to enable Clevis in initrd.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/clevis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/clevis.nix)

## `boot.initrd.clevis.package` {#opt-boot.initrd.clevis.package}

The clevis package to use.

*Type:* package

*Default:* `pkgs.clevis`

*Declared by:* [`nixos/modules/system/boot/clevis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/clevis.nix)

## `boot.initrd.clevis.useTang` {#opt-boot.initrd.clevis.useTang}

Whether the Clevis JWE file used to decrypt the devices uses a Tang server as a pin.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/clevis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/clevis.nix)

## `boot.initrd.clevisLuksAskpass.enable` {#opt-boot.initrd.clevisLuksAskpass.enable}

Whether to enable clevis-luks-askpass in initrd.

Watches for systemd password requests during boot and answers them
using clevis tokens bound to LUKS headers. Runs in parallel with
the interactive password prompt. If clevis cannot unlock a device
(tang unreachable, no binding, etc.) the user can still type the
passphrase.

Prerequisites:

- Bind clevis to each LUKS device:
  clevis luks bind -d /dev/xxx tang '{"url":"..."}'
- Configure networking in the initrd so tang servers are reachable
  .

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/clevis-luks-askpass.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/clevis-luks-askpass.nix)

## `boot.initrd.clevisLuksAskpass.package` {#opt-boot.initrd.clevisLuksAskpass.package}

The clevis package to use.

*Type:* package

*Default:* `pkgs.clevis`

*Declared by:* [`nixos/modules/system/boot/clevis-luks-askpass.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/clevis-luks-askpass.nix)

## `boot.initrd.clevisLuksAskpass.useTang` {#opt-boot.initrd.clevisLuksAskpass.useTang}

Whether the Clevis headers used to decrypt the devices uses a Tang server as a pin.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/clevis-luks-askpass.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/clevis-luks-askpass.nix)

## `boot.initrd.compressor` {#opt-boot.initrd.compressor}

The compressor to use on the initrd image. May be any of:

- The name of one of the predefined compressors, see `pkgs/build-support/kernel/initrd-compressor-meta.nix` for the definitions.
- A function which, given the nixpkgs package set, returns the path to a compressor tool, e.g. `pkgs: "${pkgs.pigz}/bin/pigz"`
- (not recommended, because it does not work when cross-compiling) the full path to a compressor tool, e.g. `"${pkgs.pigz}/bin/pigz"`

The given program should read data from stdin and write it to stdout compressed.

*Type:* string or function that evaluates to a(n) string

*Default:* `zstd` if the kernel supports it (5.9+), `gzip` if not

*Example:* `"xz"`

*Declared by:* [`nixos/modules/system/boot/stage-1.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/stage-1.nix)

## `boot.initrd.compressorArgs` {#opt-boot.initrd.compressorArgs}

Arguments to pass to the compressor for the initrd image, or null to use the compressor's defaults.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/stage-1.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/stage-1.nix)

## `boot.initrd.enable` {#opt-boot.initrd.enable}

Whether to enable the NixOS initial RAM disk (initrd). This may be
needed to perform some initialisation tasks (like mounting
network/encrypted file systems) before continuing the boot process.

*Type:* boolean

*Default:* `!config.boot.isContainer`

*Declared by:* [`nixos/modules/system/boot/stage-1.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/stage-1.nix)

## `boot.initrd.extraFirmwarePaths` {#opt-boot.initrd.extraFirmwarePaths}

Other firmware files (relative to `"${config.hardware.firmware}/lib/firmware"`) to include in the final initrd we are building.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/stage-1.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/stage-1.nix)

## `boot.initrd.includeDefaultModules` {#opt-boot.initrd.includeDefaultModules}

This option, if set, adds a collection of default kernel modules
to [`boot.initrd.availableKernelModules`](#opt-boot.initrd.availableKernelModules) and
[`boot.initrd.kernelModules`](#opt-boot.initrd.kernelModules).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/kernel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/kernel.nix)

## `boot.initrd.kernelModules` {#opt-boot.initrd.kernelModules}

Set of modules that are always loaded by the initrd.

This can either be a list of modules, or an attrset. In an
attrset, names that are set to `true` represent modules that will
be included. Note that setting these names to `false` does not
prevent the module from being loaded. For that, use
[`boot.blacklistedKernelModules`](#opt-boot.blacklistedKernelModules).

*Type:* (attribute set of boolean) or (list of string) convertible to it

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/kernel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/kernel.nix)

## `boot.initrd.luks.cryptoModules` {#opt-boot.initrd.luks.cryptoModules}

A list of cryptographic kernel modules needed to decrypt the root device(s).
The default includes all common modules.

*Type:* list of string

*Default:*

``` nix
[
  "aes"
  "blowfish"
  "twofish"
  "serpent"
  "cbc"
  "xts"
  "lrw"
  "sha1"
  "sha256"
  "sha512"
  "af_alg"
  "algif_skcipher"
  "cryptd"
  "input_leds"
]
```

*Declared by:* [`nixos/modules/system/boot/luksroot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/luksroot.nix)

## `boot.initrd.luks.devices` {#opt-boot.initrd.luks.devices}

The encrypted disk that should be opened before the root
filesystem is mounted. Both LVM-over-LUKS and LUKS-over-LVM
setups are supported. The unencrypted devices can be accessed as
`/dev/mapper/«name»`.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  luksroot = {
    device = "/dev/disk/by-uuid/430e9eff-d852-4f68-aa3b-2fa3599ebe08";
  };
}
```

*Declared by:* [`nixos/modules/system/boot/luksroot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/luksroot.nix)

## `boot.initrd.luks.devices.<name>.allowDiscards` {#opt-boot.initrd.luks.devices._name_.allowDiscards}

Whether to allow TRIM requests to the underlying device. This option
has security implications; please read the LUKS documentation before
activating it.
This option is incompatible with authenticated encryption (dm-crypt
stacked over dm-integrity).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/luksroot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/luksroot.nix)

## `boot.initrd.luks.devices.<name>.bypassWorkqueues` {#opt-boot.initrd.luks.devices._name_.bypassWorkqueues}

Whether to bypass dm-crypt's internal read and write workqueues.
Enabling this should improve performance on SSDs; see
[here](<https://wiki.archlinux.org/index.php/Dm-crypt/Specialties#Disable_workqueue_for_increased_solid_state_drive_(SSD)_performance>)
for more information. Needs Linux 5.9 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/luksroot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/luksroot.nix)

## `boot.initrd.luks.devices.<name>.crypttabExtraOpts` {#opt-boot.initrd.luks.devices._name_.crypttabExtraOpts}

Extra options to append to the last column of the generated crypttab file.

*Type:* list of (optionally newline-terminated) single-line string

*Default:* `[ ]`

*Example:*

``` nix
[
  "_netdev"
]
```

*Declared by:* [`nixos/modules/system/boot/luksroot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/luksroot.nix)

## `boot.initrd.luks.devices.<name>.device` {#opt-boot.initrd.luks.devices._name_.device}

Path of the underlying encrypted block device.

*Type:* string

*Example:* `"/dev/disk/by-uuid/430e9eff-d852-4f68-aa3b-2fa3599ebe08"`

*Declared by:* [`nixos/modules/system/boot/luksroot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/luksroot.nix)

## `boot.initrd.luks.devices.<name>.header` {#opt-boot.initrd.luks.devices._name_.header}

The name of the file or block device that
should be used as header for the encrypted device.

*Type:* null or string

*Default:* `null`

*Example:* `"/root/header.img"`

*Declared by:* [`nixos/modules/system/boot/luksroot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/luksroot.nix)

## `boot.initrd.luks.devices.<name>.keyFile` {#opt-boot.initrd.luks.devices._name_.keyFile}

The name of the file (can be a raw device or a partition) that
should be used as the decryption key for the encrypted device. If
not specified, you will be prompted for a passphrase instead.

*Type:* null or string

*Default:* `null`

*Example:* `"/dev/sdb1"`

*Declared by:* [`nixos/modules/system/boot/luksroot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/luksroot.nix)

## `boot.initrd.luks.devices.<name>.keyFileOffset` {#opt-boot.initrd.luks.devices._name_.keyFileOffset}

The offset of the key file. Use this in combination with
`keyFileSize` to use part of a file as key file
(often the case if a raw device or partition is used as a key file).
If not specified, the key begins at the first byte of
`keyFile`.

*Type:* null or signed integer

*Default:* `null`

*Example:* `4096`

*Declared by:* [`nixos/modules/system/boot/luksroot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/luksroot.nix)

## `boot.initrd.luks.devices.<name>.keyFileSize` {#opt-boot.initrd.luks.devices._name_.keyFileSize}

The size of the key file. Use this if only the beginning of the
key file should be used as a key (often the case if a raw device
or partition is used as key file). If not specified, the whole
`keyFile` will be used decryption, instead of just
the first `keyFileSize` bytes.

*Type:* null or signed integer

*Default:* `null`

*Example:* `4096`

*Declared by:* [`nixos/modules/system/boot/luksroot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/luksroot.nix)

## `boot.initrd.luks.devices.<name>.keyFileTimeout` {#opt-boot.initrd.luks.devices._name_.keyFileTimeout}

The amount of time in seconds for a keyFile to appear before
timing out and trying passwords.

*Type:* null or signed integer

*Default:* `null`

*Example:* `5`

*Declared by:* [`nixos/modules/system/boot/luksroot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/luksroot.nix)

## `boot.initrd.luks.devices.<name>.timeout` {#opt-boot.initrd.luks.devices._name_.timeout}

The amount of time in seconds to wait on the passphrase prompt.
If the timeout is reached, the system will power off.

*Type:* null or (positive integer, meaning \>0)

*Default:* ``"{option}`boot.initrd.luks.timeout`"``

*Declared by:* [`nixos/modules/system/boot/luksroot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/luksroot.nix)

## `boot.initrd.luks.devices.<name>.tryEmptyPassphrase` {#opt-boot.initrd.luks.devices._name_.tryEmptyPassphrase}

If keyFile fails then try an empty passphrase first before
prompting for password.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/luksroot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/luksroot.nix)

## `boot.initrd.luks.mitigateDMAAttacks` {#opt-boot.initrd.luks.mitigateDMAAttacks}

Unless enabled, encryption keys can be easily recovered by an attacker with physical
access to any machine with PCMCIA, ExpressCard, ThunderBolt or FireWire port.
More information is available at [https://en.wikipedia.org/wiki/DMA\_attack](https://en.wikipedia.org/wiki/DMA_attack).

This option blacklists FireWire drivers, but doesn't remove them. You can manually
load the drivers if you need to use a FireWire device, but don't forget to unload them!

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/luksroot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/luksroot.nix)

## `boot.initrd.luks.timeout` {#opt-boot.initrd.luks.timeout}

The amount of time in seconds to wait on the passphrase prompt.
If the timeout is reached, the system will power off.

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/luksroot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/luksroot.nix)

## `boot.initrd.network.enable` {#opt-boot.initrd.network.enable}

Add network connectivity support to initrd. The network may be
configured using the `ip` kernel parameter,
as described in [the kernel documentation](https://www.kernel.org/doc/Documentation/filesystems/nfs/nfsroot.txt).
Otherwise, if
[`networking.useDHCP`](../../options/networking/index.md#opt-networking.useDHCP) is enabled, an IP address
is acquired using DHCP.

You should add the module(s) required for your network card to
boot.initrd.availableKernelModules.
`lspci -v | grep -iA8 'network\|ethernet'`
will tell you which.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/initrd-network.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/initrd-network.nix)

## `boot.initrd.network.flushBeforeStage2` {#opt-boot.initrd.network.flushBeforeStage2}

Whether to clear the configuration of the interfaces that were set up in
the initrd right before stage 2 takes over. Stage 2 will do the regular network
configuration based on the NixOS networking options.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/initrd-network.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/initrd-network.nix)

## `boot.initrd.network.ifstate.allowIfstateToDrasticlyIncreaseInitrdSize` {#opt-boot.initrd.network.ifstate.allowIfstateToDrasticlyIncreaseInitrdSize}

IfState in initrd drastically increases the size of initrd, your boot partition may be too small and/or you may have significantly fewer generations. By setting this option, you acknowledge this fact and keep it in mind when reporting issues.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ifstate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ifstate.nix)

## `boot.initrd.network.ifstate.cleanupSettings` {#opt-boot.initrd.network.ifstate.cleanupSettings}

Content of IfState's initrd cleanup configuration file. See [https://ifstate.net/2.0/schema/](https://ifstate.net/2.0/schema/) for details. This configuration gets applied before systemd switches to stage two. The goal is to deconfigurate the whole network in order to prevent access to services, before the firewall is configured. The stage two IfState configuration will start after the firewall is configured.

*Type:* YAML 1.1 value

*Default:*

``` nix
{
  interfaces = { };
}
```

*Declared by:* [`nixos/modules/services/networking/ifstate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ifstate.nix)

## `boot.initrd.network.ifstate.enable` {#opt-boot.initrd.network.ifstate.enable}

Whether to enable initrd networking using IfState.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ifstate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ifstate.nix)

## `boot.initrd.network.ifstate.package` {#opt-boot.initrd.network.ifstate.package}

The initrd IfState package to use.

*Type:* package

*Default:* `pkgs.ifstate.override { withConfigValidation = false; }`

*Declared by:* [`nixos/modules/services/networking/ifstate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ifstate.nix)

## `boot.initrd.network.ifstate.settings` {#opt-boot.initrd.network.ifstate.settings}

Content of IfState's initrd configuration file. See [https://ifstate.net/2.2/schema/](https://ifstate.net/2.2/schema/) for details.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/ifstate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ifstate.nix)

## `boot.initrd.network.openvpn.configuration` {#opt-boot.initrd.network.openvpn.configuration}

The configuration file for OpenVPN.

::: warning
Unless your bootloader supports initrd secrets, this configuration
is stored insecurely in the global Nix store.
:::

*Type:* absolute path

*Example:* `./configuration.ovpn`

*Declared by:* [`nixos/modules/system/boot/initrd-openvpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/initrd-openvpn.nix)

## `boot.initrd.network.openvpn.enable` {#opt-boot.initrd.network.openvpn.enable}

Starts an OpenVPN client during initrd boot. It can be used to e.g.
remotely accessing the SSH service controlled by
`boot.initrd.network.ssh` or other network services
included. Service is killed when stage-1 boot is finished.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/initrd-openvpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/initrd-openvpn.nix)

## `boot.initrd.network.ssh.authorizedKeyFiles` {#opt-boot.initrd.network.ssh.authorizedKeyFiles}

Authorized keys taken from files for the root user on initrd.
You can combine the `authorizedKeyFiles` and `authorizedKeys` options.

*Type:* list of absolute path

*Default:* `config.users.users.root.openssh.authorizedKeys.keyFiles`

*Declared by:* [`nixos/modules/system/boot/initrd-ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/initrd-ssh.nix)

## `boot.initrd.network.ssh.authorizedKeys` {#opt-boot.initrd.network.ssh.authorizedKeys}

Authorized keys for the root user on initrd.
You can combine the `authorizedKeys` and `authorizedKeyFiles` options.

*Type:* list of string

*Default:* `config.users.users.root.openssh.authorizedKeys.keys`

*Example:*

``` nix
[
  "ssh-rsa AAAAB3NzaC1yc2etc/etc/etcjwrsh8e596z6J0l7 example@host"
  "ssh-ed25519 AAAAC3NzaCetcetera/etceteraJZMfk3QPfQ foo@bar"
]
```

*Declared by:* [`nixos/modules/system/boot/initrd-ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/initrd-ssh.nix)

## `boot.initrd.network.ssh.enable` {#opt-boot.initrd.network.ssh.enable}

Start SSH service during initrd boot. It can be used to debug failing
boot on a remote server, enter pasphrase for an encrypted partition etc.
Service is killed when stage-1 boot is finished.

The sshd configuration is largely inherited from
`services.openssh`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/initrd-ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/initrd-ssh.nix)

## `boot.initrd.network.ssh.extraConfig` {#opt-boot.initrd.network.ssh.extraConfig}

Verbatim contents of `sshd_config`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/initrd-ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/initrd-ssh.nix)

## `boot.initrd.network.ssh.hostKeys` {#opt-boot.initrd.network.ssh.hostKeys}

Specify SSH host keys to import into the initrd.

To generate keys, use
`ssh-keygen(1)`
as root:

```
ssh-keygen -t rsa -N "" -f /etc/secrets/initrd/ssh_host_rsa_key
ssh-keygen -t ed25519 -N "" -f /etc/secrets/initrd/ssh_host_ed25519_key
```

::: warning
Unless your bootloader supports initrd secrets, these keys
are stored insecurely in the global Nix store. Do NOT use
your regular SSH host private keys for this purpose or
you'll expose them to regular users!

Additionally, even if your initrd supports secrets, if
you're using initrd SSH to unlock an encrypted disk then
using your regular host keys exposes the private keys on
your unencrypted boot partition.
:::

*Type:* list of (string or absolute path)

*Default:* `[ ]`

*Example:*

``` nix
[
  "/etc/secrets/initrd/ssh_host_rsa_key"
  "/etc/secrets/initrd/ssh_host_ed25519_key"
]
```

*Declared by:* [`nixos/modules/system/boot/initrd-ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/initrd-ssh.nix)

## `boot.initrd.network.ssh.ignoreEmptyHostKeys` {#opt-boot.initrd.network.ssh.ignoreEmptyHostKeys}

Allow leaving `config.boot.initrd.network.ssh.hostKeys` empty,
to deploy ssh host keys out of band.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/initrd-ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/initrd-ssh.nix)

## `boot.initrd.network.ssh.port` {#opt-boot.initrd.network.ssh.port}

Port on which SSH initrd service should listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `22`

*Declared by:* [`nixos/modules/system/boot/initrd-ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/initrd-ssh.nix)

## `boot.initrd.network.ssh.shell` {#opt-boot.initrd.network.ssh.shell}

Login shell of the remote user. Can be used to limit actions user can do.

*Type:* null or string

*Default:* `"\"/bin/ash\""`

*Declared by:* [`nixos/modules/system/boot/initrd-ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/initrd-ssh.nix)

## `boot.initrd.nix-store-veritysetup.enable` {#opt-boot.initrd.nix-store-veritysetup.enable}

Whether to enable nix-store-veritysetup.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/nix-store-veritysetup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/nix-store-veritysetup.nix)

## `boot.initrd.prepend` {#opt-boot.initrd.prepend}

Other initrd files to prepend to the final initrd we are building.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/stage-1.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/stage-1.nix)

## `boot.initrd.secrets` {#opt-boot.initrd.secrets}

Secrets to append to the initrd. The attribute name is the
path the secret should have inside the initrd, the value
is the path it should be copied from (or null for the same
path inside and out).

Note that `nixos-rebuild switch` will generate the initrd
also for past generations, so if secrets are moved or deleted
you will also have to garbage collect the generations that
use those secrets.

*Type:* attribute set of (null or absolute path)

*Default:* `{ }`

*Example:*

``` nix
{ "/etc/dropbear/dropbear_rsa_host_key" =
    ./secret-dropbear-key;
}
```

*Declared by:* [`nixos/modules/system/boot/stage-1.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/stage-1.nix)

## `boot.initrd.services.bcache.enable` {#opt-boot.initrd.services.bcache.enable}

Whether to enable bcache support in the initrd.

*Type:* boolean

*Default:* `config.boot.bcache.enable`

*Example:* `true`

*Declared by:* [`nixos/modules/tasks/bcache.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/bcache.nix)

## `boot.initrd.services.lvm.enable` {#opt-boot.initrd.services.lvm.enable}

Whether to enable booting from LVM2 in the initrd.

*Type:* boolean

*Default:* `config.services.lvm.enable`

*Example:* `true`

*Declared by:* [`nixos/modules/tasks/lvm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/lvm.nix)

## `boot.initrd.services.resolved.enable` {#opt-boot.initrd.services.resolved.enable}

Whether to enable resolved for stage 1 networking.
Uses the toplevel 'services.resolved' options for 'resolved.conf'

*Type:* unspecified value

*Default:* `"config.boot.initrd.systemd.network.enable"`

*Declared by:* [`nixos/modules/system/boot/resolved.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/resolved.nix)

## `boot.initrd.services.udev.binPackages` {#opt-boot.initrd.services.udev.binPackages}

*This will only be used when systemd is used in stage 1.*

Packages to search for binaries that are referenced by the udev rules in stage 1.
This list always contains /bin of the initrd.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/hardware/udev.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/udev.nix)

## `boot.initrd.services.udev.packages` {#opt-boot.initrd.services.udev.packages}

*This will only be used when systemd is used in stage 1.*

List of packages containing `udev` rules that will be copied to stage 1.
All files found in
`«pkg»/etc/udev/rules.d` and
`«pkg»/lib/udev/rules.d`
will be included.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/hardware/udev.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/udev.nix)

## `boot.initrd.services.udev.rules` {#opt-boot.initrd.services.udev.rules}

`udev` rules to include in the initrd
*only*. They'll be written into file
`99-local.rules`. Thus they are read and applied
after the essential initrd rules.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="00:1D:60:B9:6D:4F", KERNEL=="eth*", NAME="my_fast_network_card"
''
```

*Declared by:* [`nixos/modules/services/hardware/udev.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/udev.nix)

## `boot.initrd.supportedFilesystems` {#opt-boot.initrd.supportedFilesystems}

Names of supported filesystem types, or an attribute set of file system types
and their state. The set form may be used together with `lib.mkForce` to
explicitly disable support for specific filesystems, e.g. to disable ZFS
with an unsupported kernel.

*Type:* (attribute set of boolean) or (list of string) convertible to it

*Default:* `{ }`

*Example:*

``` nix
{
  btrfs = true;
  zfs = lib.mkForce false;
}
```

*Declared by:* [`nixos/modules/system/boot/stage-1.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/stage-1.nix)

## `boot.initrd.systemd.additionalUpstreamUnits` {#opt-boot.initrd.systemd.additionalUpstreamUnits}

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

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.automounts` {#opt-boot.initrd.systemd.automounts}

Definition of systemd automount units.
This is a list instead of an attrSet, because systemd mandates the names to be derived from
the 'where' attribute.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.contents` {#opt-boot.initrd.systemd.contents}

Set of files that have to be linked into the initrd

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "/etc/machine-id".source = /etc/machine-id;
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.contents.<name>.dlopen.features` {#opt-boot.initrd.systemd.contents._name_.dlopen.features}

Features to enable via dlopen ELF notes. These will be in
addition to anything included via 'usePriority',
regardless of their priority.

*Type:* list of (optionally newline-terminated) single-line string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.contents.<name>.dlopen.usePriority` {#opt-boot.initrd.systemd.contents._name_.dlopen.usePriority}

Priority of dlopen ELF notes to include. "required" is
minimal, "recommended" includes "required", and
"suggested" includes "recommended".

See: [https://systemd.io/ELF\_DLOPEN\_METADATA/](https://systemd.io/ELF_DLOPEN_METADATA/)

*Type:* one of "required", "recommended", "suggested"

*Default:* `"recommended"`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.contents.<name>.enable` {#opt-boot.initrd.systemd.contents._name_.enable}

Whether to enable copying of this file and symlinking it.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.contents.<name>.source` {#opt-boot.initrd.systemd.contents._name_.source}

Path of the source file.

*Type:* absolute path

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.contents.<name>.target` {#opt-boot.initrd.systemd.contents._name_.target}

Path of the symlink.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.contents.<name>.text` {#opt-boot.initrd.systemd.contents._name_.text}

Text of the file.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.dbus.enable` {#opt-boot.initrd.systemd.dbus.enable}

Whether to enable dbus in stage 1.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/system/dbus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/dbus.nix)

## `boot.initrd.systemd.dmVerity.enable` {#opt-boot.initrd.systemd.dmVerity.enable}

Mount verity-protected block devices in the initrd.

Enabling this option allows to use `systemd-veritysetup` and
`systemd-veritysetup-generator` in the initrd.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/dm-verity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/dm-verity.nix)

## `boot.initrd.systemd.emergencyAccess` {#opt-boot.initrd.systemd.emergencyAccess}

Set to true for unauthenticated emergency access, and false or
null for no emergency access.

Can also be set to a hashed super user password to allow
authenticated access to the emergency mode.

For emergency access after initrd, use `systemd.enableEmergencyMode` instead.

*Type:* boolean or null or (string, not containing newlines or colons)

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.extraBin` {#opt-boot.initrd.systemd.extraBin}

Tools to add to /bin

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
{
  umount = "${pkgs.util-linux}/bin/umount";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.fido2.enable` {#opt-boot.initrd.systemd.fido2.enable}

Whether to enable systemd FIDO2 support.

*Type:* boolean

*Default:* `config.boot.initrd.systemd.package.withFido2`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/fido2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/fido2.nix)

## `boot.initrd.systemd.groups` {#opt-boot.initrd.systemd.groups}

Groups to include in initrd.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `boot.initrd.systemd.groups.<name>.gid` {#opt-boot.initrd.systemd.groups._name_.gid}

ID of the group in initrd.

*Type:* signed integer

*Default:* `config.users.groups.${name}.gid`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `boot.initrd.systemd.initrdBin` {#opt-boot.initrd.systemd.initrdBin}

Packages to include in /bin for the stage 1 emergency shell.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.managerEnvironment` {#opt-boot.initrd.systemd.managerEnvironment}

Environment variables of PID 1. These variables are
*not* passed to started units.

*Type:* attribute set of (null or string or absolute path or package)

*Default:*

``` nix
''
  {
    PATH = "/bin:/sbin";
  }
''
```

*Example:*

``` nix
{
  SYSTEMD_LOG_LEVEL = "debug";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.mounts` {#opt-boot.initrd.systemd.mounts}

Definition of systemd mount units.
This is a list instead of an attrSet, because systemd mandates the names to be derived from
the 'where' attribute.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.network.config` {#opt-boot.initrd.systemd.network.config}

Definition of global systemd network config.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `boot.initrd.systemd.network.enable` {#opt-boot.initrd.systemd.network.enable}

Whether to enable networkd or not.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `boot.initrd.systemd.network.links` {#opt-boot.initrd.systemd.network.links}

Definition of systemd network links.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `boot.initrd.systemd.network.netdevs` {#opt-boot.initrd.systemd.network.netdevs}

Definition of systemd network devices.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `boot.initrd.systemd.network.networks` {#opt-boot.initrd.systemd.network.networks}

Definition of systemd networks.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:*

- [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)
- [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `boot.initrd.systemd.network.wait-online.anyInterface` {#opt-boot.initrd.systemd.network.wait-online.anyInterface}

Whether to consider the network online when any interface is online, as opposed to all of them.
This is useful on portable machines with a wired and a wireless interface, for example.

This is on by default if [`networking.useDHCP`](../../options/networking/index.md#opt-networking.useDHCP) is enabled.

*Type:* boolean

*Default:* `"config.networking.useDHCP"`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `boot.initrd.systemd.network.wait-online.enable` {#opt-boot.initrd.systemd.network.wait-online.enable}

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

## `boot.initrd.systemd.network.wait-online.extraArgs` {#opt-boot.initrd.systemd.network.wait-online.extraArgs}

Extra command-line arguments to pass to systemd-networkd-wait-online.
These also affect per-interface `systemd-network-wait-online@` services.

See `systemd-networkd-wait-online.service(8)` for all available options.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `boot.initrd.systemd.network.wait-online.ignoredInterfaces` {#opt-boot.initrd.systemd.network.wait-online.ignoredInterfaces}

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

## `boot.initrd.systemd.network.wait-online.timeout` {#opt-boot.initrd.systemd.network.wait-online.timeout}

Time to wait for the network to come online, in seconds. Set to 0 to disable.

*Type:* unsigned integer, meaning \>=0

*Default:* `120`

*Example:* `0`

*Declared by:* [`nixos/modules/system/boot/networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/networkd.nix)

## `boot.initrd.systemd.package` {#opt-boot.initrd.systemd.package}

The systemd package to use.

*Type:* package

*Default:* `config.systemd.package`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.packages` {#opt-boot.initrd.systemd.packages}

Packages providing systemd units and hooks.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.systemd-cryptsetup-generator ]`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.paths` {#opt-boot.initrd.systemd.paths}

Definition of systemd path units.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.repart.device` {#opt-boot.initrd.systemd.repart.device}

The device to operate on.

If `device == null`, systemd-repart will operate on the device
backing the root partition. So in order to dynamically *create* the
root partition in the initrd you need to set a device.

*Type:* null or string

*Default:* `null`

*Example:* `"/dev/vda"`

*Declared by:* [`nixos/modules/system/boot/systemd/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/repart.nix)

## `boot.initrd.systemd.repart.discard` {#opt-boot.initrd.systemd.repart.discard}

Controls whether to issue the BLKDISCARD I/O control command on the
space taken up by any added partitions or on the space in between them.
Usually, it's a good idea to issue this request since it tells the underlying
hardware that the covered blocks shall be considered empty, improving performance.

See `systemd-repart(8)` for details.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/repart.nix)

## `boot.initrd.systemd.repart.empty` {#opt-boot.initrd.systemd.repart.empty}

Controls how to operate on empty devices that contain no partition table yet.
See `systemd-repart(8)` for details.

*Type:* one of "refuse", "allow", "require", "force", "create"

*Default:* `"refuse"`

*Example:* `"require"`

*Declared by:* [`nixos/modules/system/boot/systemd/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/repart.nix)

## `boot.initrd.systemd.repart.enable` {#opt-boot.initrd.systemd.repart.enable}

Grow and add partitions to a partition table at boot time in the initrd.
systemd-repart only works with GPT partition tables.

To run systemd-repart after the initrd, see
`options.systemd.repart.enable`.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/repart.nix)

## `boot.initrd.systemd.repart.extraArgs` {#opt-boot.initrd.systemd.repart.extraArgs}

Extra command-line arguments to pass to systemd-repart.

See `systemd-repart(8)` for all available options.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/repart.nix)

## `boot.initrd.systemd.root` {#opt-boot.initrd.systemd.root}

Controls how systemd will interpret the root FS in initrd. See
the description of the `root=` argument in `kernel-command-line(7)`.

When set to "gpt-auto", `systemd-gpt-auto-generator(8)`
automatically discovers and mounts the root, EFI System (ESP),
swap, and various other partitions based on their partition
type, allowing them to be effectively omitted from
`fileSystems.<name>`.
Note however that [`boot.initrd.supportedFilesystems`](#opt-boot.initrd.supportedFilesystems)
will not be inferred for partitions without an explicit
[`fileSystems.<name>.fsType`](../../options/other/index.md#opt-fileSystems._name_.fsType), therefore the filesystem
names of all partitions mounted through "gpt-auto" must be
manually appended to `supportedFilesystems`.

If root shall be omitted, set this option to `null`.

*Type:* null or one of "fstab", "gpt-auto"

*Default:* `"fstab"`

*Example:* `"gpt-auto"`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.services` {#opt-boot.initrd.systemd.services}

Definition of systemd service units.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.settings.Manager` {#opt-boot.initrd.systemd.settings.Manager}

Options for the global systemd service manager used in initrd. See `systemd-system.conf(5)`
for available options.

*Type:* open submodule of attribute set of (systemd option)

*Default:*

``` nix
{
  DefaultEnvironment = "PATH=/bin:/sbin";
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

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.slices` {#opt-boot.initrd.systemd.slices}

Definition of slice configurations.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.sockets` {#opt-boot.initrd.systemd.sockets}

Definition of systemd socket units.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.storePaths` {#opt-boot.initrd.systemd.storePaths}

Store paths to copy into the initrd as well.

*Type:* list of ((submodule) or ((optionally newline-terminated) single-line string or package) convertible to it)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.storePaths.*.dlopen.features` {#opt-boot.initrd.systemd.storePaths._.dlopen.features}

Features to enable via dlopen ELF notes. These will be in
addition to anything included via 'usePriority',
regardless of their priority.

*Type:* list of (optionally newline-terminated) single-line string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.storePaths.*.dlopen.usePriority` {#opt-boot.initrd.systemd.storePaths._.dlopen.usePriority}

Priority of dlopen ELF notes to include. "required" is
minimal, "recommended" includes "required", and
"suggested" includes "recommended".

See: [https://systemd.io/ELF\_DLOPEN\_METADATA/](https://systemd.io/ELF_DLOPEN_METADATA/)

*Type:* one of "required", "recommended", "suggested"

*Default:* `"recommended"`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.storePaths.*.enable` {#opt-boot.initrd.systemd.storePaths._.enable}

Whether to enable copying of this file and symlinking it.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.storePaths.*.source` {#opt-boot.initrd.systemd.storePaths._.source}

Path of the source file.

*Type:* absolute path

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.storePaths.*.target` {#opt-boot.initrd.systemd.storePaths._.target}

Path of the symlink.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.suppressedStorePaths` {#opt-boot.initrd.systemd.suppressedStorePaths}

Store paths specified in the storePaths option that
should not be copied.

*Type:* list of (optionally newline-terminated) single-line string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.suppressedUnits` {#opt-boot.initrd.systemd.suppressedUnits}

A list of units to skip when generating system systemd configuration directory. This has
priority over upstream units, [`boot.initrd.systemd.units`](#opt-boot.initrd.systemd.units), and
[`boot.initrd.systemd.additionalUpstreamUnits`](#opt-boot.initrd.systemd.additionalUpstreamUnits). The main purpose of this is to
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

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.targets` {#opt-boot.initrd.systemd.targets}

Definition of systemd target units.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.timers` {#opt-boot.initrd.systemd.timers}

Definition of systemd timer units.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.tmpfiles.settings` {#opt-boot.initrd.systemd.tmpfiles.settings}

Similar to [`systemd.tmpfiles.settings`](../../options/systemd/index.md#opt-systemd.tmpfiles.settings) but the rules are
only applied by systemd-tmpfiles before `initrd-switch-root.target`.

See `bootup(7)`.

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

## `boot.initrd.systemd.tmpfiles.settings.<config-name>.<path>.<tmpfiles-type>.age` {#opt-boot.initrd.systemd.tmpfiles.settings._config-name_._path_._tmpfiles-type_.age}

Delete a file when it reaches a certain age.

If a file or directory is older than the current time minus the age
field, it is deleted.

If set to `"-"` no automatic clean-up is done.

*Type:* string

*Default:* `"-"`

*Example:* `"10d"`

*Declared by:* [`nixos/modules/system/boot/systemd/tmpfiles.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/tmpfiles.nix)

## `boot.initrd.systemd.tmpfiles.settings.<config-name>.<path>.<tmpfiles-type>.argument` {#opt-boot.initrd.systemd.tmpfiles.settings._config-name_._path_._tmpfiles-type_.argument}

An argument whose meaning depends on the type of operation.

Please see the upstream documentation for the meaning of this
parameter in different situations:
`tmpfiles.d(5)`

*Type:* string

*Default:* `""`

*Example:* `""`

*Declared by:* [`nixos/modules/system/boot/systemd/tmpfiles.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/tmpfiles.nix)

## `boot.initrd.systemd.tmpfiles.settings.<config-name>.<path>.<tmpfiles-type>.group` {#opt-boot.initrd.systemd.tmpfiles.settings._config-name_._path_._tmpfiles-type_.group}

The group of the file.

This may either be a numeric ID or a user/group name.

If omitted or when set to `"-"`, the user and group of the user who
invokes systemd-tmpfiles is used.

*Type:* string

*Default:* `"-"`

*Example:* `"root"`

*Declared by:* [`nixos/modules/system/boot/systemd/tmpfiles.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/tmpfiles.nix)

## `boot.initrd.systemd.tmpfiles.settings.<config-name>.<path>.<tmpfiles-type>.mode` {#opt-boot.initrd.systemd.tmpfiles.settings._config-name_._path_._tmpfiles-type_.mode}

The file access mode to use when creating this file or directory.

*Type:* string

*Default:* `"-"`

*Example:* `"0755"`

*Declared by:* [`nixos/modules/system/boot/systemd/tmpfiles.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/tmpfiles.nix)

## `boot.initrd.systemd.tmpfiles.settings.<config-name>.<path>.<tmpfiles-type>.type` {#opt-boot.initrd.systemd.tmpfiles.settings._config-name_._path_._tmpfiles-type_.type}

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

## `boot.initrd.systemd.tmpfiles.settings.<config-name>.<path>.<tmpfiles-type>.user` {#opt-boot.initrd.systemd.tmpfiles.settings._config-name_._path_._tmpfiles-type_.user}

The user of the file.

This may either be a numeric ID or a user/group name.

If omitted or when set to `"-"`, the user and group of the user who
invokes systemd-tmpfiles is used.

*Type:* string

*Default:* `"-"`

*Example:* `"root"`

*Declared by:* [`nixos/modules/system/boot/systemd/tmpfiles.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/tmpfiles.nix)

## `boot.initrd.systemd.tpm2.enable` {#opt-boot.initrd.systemd.tpm2.enable}

Whether to enable systemd initrd TPM2 support.

*Type:* boolean

*Default:* `"boot.initrd.systemd.package.withTpm2Units"`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/tpm2.nix)

## `boot.initrd.systemd.tpm2.pcrosseparator.enable` {#opt-boot.initrd.systemd.tpm2.pcrosseparator.enable}

Whether to enable systemd initrd boot phase OS userspace separator.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/tpm2.nix)

## `boot.initrd.systemd.tpm2.pcrphases.enable` {#opt-boot.initrd.systemd.tpm2.pcrphases.enable}

Whether to enable systemd initrd boot phase measurements.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/tpm2.nix)

## `boot.initrd.systemd.units` {#opt-boot.initrd.systemd.units}

Definition of systemd units.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/initrd.nix)

## `boot.initrd.systemd.users` {#opt-boot.initrd.systemd.users}

Users to include in initrd.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `boot.initrd.systemd.users.<name>.group` {#opt-boot.initrd.systemd.users._name_.group}

Group the user belongs to in initrd.

*Type:* (optionally newline-terminated) single-line string

*Default:* `config.users.users.${name}.group`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `boot.initrd.systemd.users.<name>.shell` {#opt-boot.initrd.systemd.users._name_.shell}

The path to the user's shell in initrd.

*Type:* absolute path, not containing newlines or colons

*Default:* `${pkgs.shadow}/bin/nologin`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `boot.initrd.systemd.users.<name>.uid` {#opt-boot.initrd.systemd.users._name_.uid}

ID of the user in initrd.

*Type:* signed integer

*Default:* `config.users.users.${name}.uid`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `boot.initrd.unl0kr.allowVendorDrivers` {#opt-boot.initrd.unl0kr.allowVendorDrivers}

Whether to load additional drivers for certain vendors (I.E: Wacom, Intel, etc.)

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/unl0kr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/unl0kr.nix)

## `boot.initrd.unl0kr.enable` {#opt-boot.initrd.unl0kr.enable}

Whether to enable the unl0kr on-screen keyboard in initrd to unlock LUKS.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/unl0kr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/unl0kr.nix)

## `boot.initrd.unl0kr.package` {#opt-boot.initrd.unl0kr.package}

The buffybox package to use.

*Type:* package

*Default:* `pkgs.buffybox`

*Declared by:* [`nixos/modules/system/boot/unl0kr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/unl0kr.nix)

## `boot.initrd.unl0kr.settings` {#opt-boot.initrd.unl0kr.settings}

Configuration for `unl0kr`.

See `unl0kr.conf(5)` for supported values.

Alternatively, visit `https://gitlab.nura.eco/nura/buffybox/-/blob/3.2.0/unl0kr/unl0kr.conf`

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  general.animations = true;
  general.backend = "drm";
  theme = {
    default = "pmos-dark";
    alternate = "pmos-light";
  };
}
```

*Declared by:* [`nixos/modules/system/boot/unl0kr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/unl0kr.nix)

## `boot.isContainer` {#opt-boot.isContainer}

Whether this NixOS machine is a lightweight container running
in another NixOS system.

*Type:* boolean

*Default:* `"config.boot.isNspawnContainer"`

*Declared by:* [`nixos/modules/virtualisation/nixos-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/nixos-containers.nix)

## `boot.isNspawnContainer` {#opt-boot.isNspawnContainer}

Whether the machine is running in an nspawn container. This
option is added because [boot](#opt-boot.isContainer) is heavily used
for non-nspawn environments as well, hence nspawn-specific settings
are guarded by this option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/nixos-containers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/nixos-containers.nix)

## `boot.kernel.enable` {#opt-boot.kernel.enable}

Whether to enable the Linux kernel. This is useful for systemd-like containers which do not require a kernel.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/kernel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/kernel.nix)

## `boot.kernel.randstructSeed` {#opt-boot.kernel.randstructSeed}

Provides a custom seed for the `RANDSTRUCT` security
option of the Linux kernel. Note that `RANDSTRUCT` is
only enabled in NixOS hardened kernels. Using a custom seed requires
building the kernel and dependent packages locally, since this
customization happens at build time.

*Type:* string

*Default:* `""`

*Example:* `"my secret seed"`

*Declared by:* [`nixos/modules/system/boot/kernel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/kernel.nix)

## `boot.kernel.sysctl` {#opt-boot.kernel.sysctl}

Runtime parameters of the Linux kernel, as set by
`sysctl(8)`.  Note that sysctl
parameters names must be enclosed in quotes
(e.g. `"vm.swappiness"` instead of
`vm.swappiness`).  The value of each
parameter may be a string, integer, boolean, or null
(signifying the option will not appear at all).

*Type:* open submodule of attribute set of (sysctl option value)

*Default:* `{ }`

*Example:*

``` nix
{ "net.ipv4.tcp_syncookies" = false; "vm.swappiness" = 60; }
```

*Declared by:* [`nixos/modules/config/sysctl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/sysctl.nix)

## `boot.kernel.sysctl."net.core.rmem_max"` {#opt-boot.kernel.sysctl._net.core.rmem_max_}

The maximum receive socket buffer size in bytes. In case of conflicting values, the highest will be used.

*Type:* null or (unsigned integer, meaning \>=0)

*Default:* `null`

*Declared by:* [`nixos/modules/config/sysctl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/sysctl.nix)

## `boot.kernel.sysctl."net.core.wmem_max"` {#opt-boot.kernel.sysctl._net.core.wmem_max_}

The maximum send socket buffer size in bytes. In case of conflicting values, the highest will be used.

*Type:* null or (unsigned integer, meaning \>=0)

*Default:* `null`

*Declared by:* [`nixos/modules/config/sysctl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/sysctl.nix)

## `boot.kernel.sysfs` {#opt-boot.kernel.sysfs}

sysfs attributes to be set as soon as they become available.

Attribute names represent path components in the sysfs filesystem and
cannot be `.` or `..` nor contain any slash character (`/`).

Names may contain shell‐style glob patterns (`*`, `?` and `[…]`)
matching a single path component, these should however be used with
caution, as they may produce unexpected results if attribute paths
overlap.

Values will be converted to strings, with list elements concatenated
with commata and booleans converted to numeric values (`0` or `1`).

`null` values are ignored, allowing removal of values defined in other
modules, as are empty attribute sets.

List values defined in different modules will *not* be concatenated.

This option may only be used for attributes which can be set
idempotently, as the configured values might be written more than once.

*Type:* open submodule of nested attribute set of null or sysfs attribute values

*Default:* `{ }`

*Example:*

``` nix
{
  # enable transparent hugepages with deferred defragmentaion
  kernel.mm.transparent_hugepage = {
    enabled = "always";
    defrag = "defer";
    shmem_enabled = "within_size";
  };

  devices.system.cpu = {
    # configure powesave frequency governor for all CPUs
    # the [0-9]* glob pattern ensures that other paths
    # like cpufreq or cpuidle are not matched
    "cpu[0-9]*" = {
      scaling_governor = "powersave";
      energy_performance_preference = 8;
    };

    # disable frequency boost
    intel_pstate.no_turbo = true;
  };
}
```

*Declared by:* [`nixos/modules/config/sysfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/sysfs.nix)

## `boot.kernelModules` {#opt-boot.kernelModules}

The set of kernel modules to be loaded in the second stage of
the boot process.  Note that modules that are needed to
mount the root file system should be added to
[`boot.initrd.availableKernelModules`](#opt-boot.initrd.availableKernelModules) or
[`boot.initrd.kernelModules`](#opt-boot.initrd.kernelModules).

This can either be a list of modules, or an attrset. In an
attrset, names that are set to `true` represent modules that will
be included. Note that setting these names to `false` does not
prevent the module from being loaded. For that, use
[`boot.blacklistedKernelModules`](#opt-boot.blacklistedKernelModules).

*Type:* (attribute set of boolean) or (list of string) convertible to it

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/kernel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/kernel.nix)

## `boot.kernelPackages` {#opt-boot.kernelPackages}

This option allows you to override the Linux kernel used by
NixOS.  Since things like external kernel module packages are
tied to the kernel you're using, it also overrides those.
This option is a function that takes Nixpkgs as an argument
(as a convenience), and returns an attribute set containing at
the very least an attribute `kernel`.
Additional attributes may be needed depending on your
configuration.  For instance, if you use the NVIDIA X driver,
then it also needs to contain an attribute
`nvidia_x11`.

Please note that we strictly support kernel versions that are
maintained by the Linux developers only. More information on the
availability of kernel versions is documented
[in the Linux section of the manual](https://nixos.org/manual/nixos/unstable/index.html#sec-kernel-config).

*Type:* raw value

*Default:* `pkgs.linuxPackages`

*Example:* `pkgs.linuxKernel.packages.linux_6_18`

*Declared by:* [`nixos/modules/system/boot/kernel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/kernel.nix)

## `boot.kernelParams` {#opt-boot.kernelParams}

Parameters added to the kernel command line.

*Type:* list of string, with spaces inside double quotes

*Default:* `[ ]`

*Declared by:* [`nixos/modules/system/boot/kernel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/kernel.nix)

## `boot.kernelPatches` {#opt-boot.kernelPatches}

A list of additional patches to apply to the kernel.

Every item should be an attribute set with the following attributes:

``` nix
{
  name = "foo";                 # descriptive name, required

  patch = ./foo.patch;          # path or derivation that contains the patch source
                                # (required, but can be null if only config changes
                                # are needed)

  structuredExtraConfig = {     # attrset of extra configuration parameters without the CONFIG_ prefix
    FOO = lib.kernel.yes;       # (optional)
  };                            # values should generally be lib.kernel.yes,
                                # lib.kernel.no or lib.kernel.module

  features = {                  # attrset of extra "features" the kernel is considered to have
    foo = true;                 # (may be checked by other NixOS modules, optional)
  };

  extraConfig = "FOO y";        # extra configuration options in string form without the CONFIG_ prefix
                                # (optional, multiple lines allowed to specify multiple options)
                                # (deprecated, use structuredExtraConfig instead)
}
```

There's a small set of existing kernel patches in Nixpkgs, available as `pkgs.kernelPatches`,
that follow this format and can be used directly.

*Type:* list of (attribute set)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    name = "foo";
    patch = ./foo.patch;
    structuredExtraConfig.FOO = lib.kernel.yes;
    features.foo = true;
  }
  {
    name = "foo-ml-mbox";
    patch = (fetchurl {
      url = "https://lore.kernel.org/lkml/19700205182810.58382-1-email@domain/t.mbox.gz";
      hash = "sha256-...";
    });
  }
]
```

*Declared by:* [`nixos/modules/system/boot/kernel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/kernel.nix)

## `boot.kexec.enable` {#opt-boot.kexec.enable}

Whether to enable kexec.

*Type:* boolean

*Default:* `lib.meta.availableOn pkgs.stdenv.hostPlatform pkgs.kexec-tools`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/kexec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/kexec.nix)

## `boot.loader.efi.canTouchEfiVariables` {#opt-boot.loader.efi.canTouchEfiVariables}

Whether the installation process is allowed to modify EFI boot variables.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/loader/efi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/efi.nix)

## `boot.loader.efi.efiSysMountPoint` {#opt-boot.loader.efi.efiSysMountPoint}

Where the EFI System Partition is mounted.

*Type:* string

*Default:* `"/boot"`

*Declared by:* [`nixos/modules/system/boot/loader/efi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/efi.nix)

## `boot.loader.external.enable` {#opt-boot.loader.external.enable}

Whether to enable using an external tool to install your bootloader.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/loader/external/external.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/external/external.nix)

## `boot.loader.external.installHook` {#opt-boot.loader.external.installHook}

The full path to a program of your choosing which performs the bootloader installation process.

The program will be called with an argument pointing to the output of the system's toplevel.

*Type:* absolute path

*Declared by:* [`nixos/modules/system/boot/loader/external/external.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/external/external.nix)

## `boot.loader.generationsDir.copyKernels` {#opt-boot.loader.generationsDir.copyKernels}

Whether to copy the necessary boot files into /boot, so
/nix/store is not needed by the boot loader.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/loader/generations-dir/generations-dir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/generations-dir/generations-dir.nix)

## `boot.loader.generationsDir.enable` {#opt-boot.loader.generationsDir.enable}

Whether to create symlinks to the system generations under
`/boot`.  When enabled,
`/boot/default/kernel`,
`/boot/default/initrd`, etc., are updated to
point to the current generation's kernel image, initial RAM
disk, and other bootstrap files.

This optional is not necessary with boot loaders such as GNU GRUB
for which the menu is updated to point to the latest bootstrap
files.  However, it is needed for U-Boot on platforms where the
boot command line is stored in flash memory rather than in a
menu file.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/loader/generations-dir/generations-dir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/generations-dir/generations-dir.nix)

## `boot.loader.generic-extlinux-compatible.configurationLimit` {#opt-boot.loader.generic-extlinux-compatible.configurationLimit}

Maximum number of configurations in the boot menu.

*Type:* signed integer

*Default:* `20`

*Example:* `10`

*Declared by:* [`nixos/modules/system/boot/loader/generic-extlinux-compatible`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/generic-extlinux-compatible)

## `boot.loader.generic-extlinux-compatible.enable` {#opt-boot.loader.generic-extlinux-compatible.enable}

Whether to generate an extlinux-compatible configuration file
under `/boot/extlinux.conf`.  For instance,
U-Boot's generic distro boot support uses this file format.

See [U-boot's documentation](https://u-boot.readthedocs.io/en/latest/develop/distro.html)
for more information.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/loader/generic-extlinux-compatible`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/generic-extlinux-compatible)

## `boot.loader.generic-extlinux-compatible.mirroredBoots` {#opt-boot.loader.generic-extlinux-compatible.mirroredBoots}

Mirror the boot configuration to multiple paths.

*Type:* list of (submodule)

*Default:*

``` nix
[
  {
    path = "/boot";
  }
]
```

*Example:*

``` nix
[
  {
    path = "/boot1";
  }
  {
    path = "/boot2";
  }
]
```

*Declared by:* [`nixos/modules/system/boot/loader/generic-extlinux-compatible`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/generic-extlinux-compatible)

## `boot.loader.generic-extlinux-compatible.mirroredBoots.*.path` {#opt-boot.loader.generic-extlinux-compatible.mirroredBoots._.path}

The path to the boot directory where the extlinux-compatible
configuration files will be written.

*Type:* string

*Example:* `"/boot1"`

*Declared by:* [`nixos/modules/system/boot/loader/generic-extlinux-compatible`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/generic-extlinux-compatible)

## `boot.loader.generic-extlinux-compatible.populateCmd` {#opt-boot.loader.generic-extlinux-compatible.populateCmd}

Contains the builder command used to populate an image,
honoring all options except the `-c <path-to-default-configuration>`
argument.
Useful to have for sdImage.populateRootCommands

*Type:* string

*Read only*

*Declared by:* [`nixos/modules/system/boot/loader/generic-extlinux-compatible`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/generic-extlinux-compatible)

## `boot.loader.generic-extlinux-compatible.useGenerationDeviceTree` {#opt-boot.loader.generic-extlinux-compatible.useGenerationDeviceTree}

Whether to generate Device Tree-related directives in the
extlinux configuration.

When enabled, the bootloader will attempt to load the device
tree binaries from the generation's kernel.

Note that this affects all generations, regardless of the
setting value used in their configurations.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/loader/generic-extlinux-compatible`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/generic-extlinux-compatible)

## `boot.loader.grub.backgroundColor` {#opt-boot.loader.grub.backgroundColor}

Background color to be used for GRUB to fill the areas the image isn't filling.

*Type:* null or string

*Default:* `null`

*Example:* `"#7EBAE4"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.configurationLimit` {#opt-boot.loader.grub.configurationLimit}

Maximum of configurations in boot menu. GRUB has problems when
there are too many entries.

*Type:* signed integer

*Default:* `100`

*Example:* `120`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.configurationName` {#opt-boot.loader.grub.configurationName}

GRUB entry name instead of default.

*Type:* string

*Default:* `""`

*Example:* `"Stable 2.6.21"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.copyKernels` {#opt-boot.loader.grub.copyKernels}

Whether the GRUB menu builder should copy kernels and initial
ramdisks to /boot.  This is done automatically if /boot is
on a different partition than /.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.default` {#opt-boot.loader.grub.default}

Index of the default menu item to be booted.
Can also be set to "saved", which will make GRUB select
the menu item that was used at the last boot.

*Type:* signed integer or string

*Default:* `"0"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.device` {#opt-boot.loader.grub.device}

The device on which the GRUB boot loader will be installed.
The special value `nodev` means that a GRUB
boot menu will be generated, but GRUB itself will not
actually be installed.  To install GRUB on multiple devices,
use `boot.loader.grub.devices`.

*Type:* string

*Default:* `""`

*Example:* `"/dev/disk/by-id/wwn-0x500001234567890a"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.devices` {#opt-boot.loader.grub.devices}

The devices on which the boot loader, GRUB, will be
installed. Can be used instead of `device` to
install GRUB onto multiple devices.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/dev/disk/by-id/wwn-0x500001234567890a"
]
```

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.efiInstallAsRemovable` {#opt-boot.loader.grub.efiInstallAsRemovable}

Whether to invoke `grub-install` with
`--removable`.

Unless you turn this on, GRUB will install itself somewhere in
`boot.loader.efi.efiSysMountPoint` (exactly where
depends on other config variables). If you've set
`boot.loader.efi.canTouchEfiVariables` *AND* you
are currently booted in UEFI mode, then GRUB will use
`efibootmgr` to modify the boot order in the
EFI variables of your firmware to include this location. If you are
*not* booted in UEFI mode at the time GRUB is being installed, the
NVRAM will not be modified, and your system will not find GRUB at
boot time. However, GRUB will still return success so you may miss
the warning that gets printed ("`efibootmgr: EFI variables are not supported on this system.`").

If you turn this feature on, GRUB will install itself in a
special location within `efiSysMountPoint` (namely
`EFI/boot/boot$arch.efi`) which the firmwares
are hardcoded to try first, regardless of NVRAM EFI variables.

To summarize, turn this on if:

- You are installing NixOS and want it to boot in UEFI mode,
  but you are currently booted in legacy mode
- You want to make a drive that will boot regardless of
  the NVRAM state of the computer (like a USB "removable" drive)
- You simply dislike the idea of depending on NVRAM
  state to make your drive bootable

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.efiSupport` {#opt-boot.loader.grub.efiSupport}

Whether GRUB should be built with EFI support.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.enable` {#opt-boot.loader.grub.enable}

Whether to enable the GNU GRUB boot loader.

*Type:* boolean

*Default:* `!config.boot.isContainer`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.enableCryptodisk` {#opt-boot.loader.grub.enableCryptodisk}

Enable support for encrypted partitions. GRUB should automatically
unlock the correct encrypted partition and look for filesystems.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.entryOptions` {#opt-boot.loader.grub.entryOptions}

Options applied to the primary NixOS menu entry.

*Type:* null or string

*Default:* `"--class nixos --unrestricted"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.extraConfig` {#opt-boot.loader.grub.extraConfig}

Additional GRUB commands inserted in the configuration file
just before the menu entries.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1
  terminal_input --append serial
  terminal_output --append serial
''
```

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.extraEntries` {#opt-boot.loader.grub.extraEntries}

Any additional entries you want added to the GRUB boot menu.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  # GRUB 2 example
  menuentry "Windows 7" {
    chainloader (hd0,4)+1
  }
  
  # GRUB 2 with UEFI example, chainloading another distro
  menuentry "Fedora" {
    set root=(hd1,1)
    chainloader /efi/fedora/grubx64.efi
  }
''
```

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.extraEntriesBeforeNixOS` {#opt-boot.loader.grub.extraEntriesBeforeNixOS}

Whether extraEntries are included before the default option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.extraFiles` {#opt-boot.loader.grub.extraFiles}

A set of files to be copied to `/boot`.
Each attribute name denotes the destination file name in
`/boot`, while the corresponding
attribute value specifies the source file.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
{ "memtest.bin" = pkgs.memtest86plus.efi; }
```

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.extraGrubInstallArgs` {#opt-boot.loader.grub.extraGrubInstallArgs}

Additional arguments passed to `grub-install`.

A use case for this is to build specific GRUB2 modules
directly into the GRUB2 kernel image, so that they are available
and activated even in the `grub rescue` shell.

They are also necessary when the BIOS/UEFI is bugged and cannot
correctly read large disks (e.g. above 2 TB), so GRUB2's own
`nativedisk` and related modules can be used
to use its own disk drivers. The example shows one such case.
This is also useful for booting from USB.
See the
[
GRUB source code
](https://git.savannah.gnu.org/cgit/grub.git/tree/grub-core/commands/nativedisk.c?h=grub-2.04#n326)
for which disk modules are available.

The list elements are passed directly as `argv`
arguments to the `grub-install` program, in order.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--modules=nativedisk ahci pata part_gpt part_msdos diskfilter mdraid1x lvm ext2"
]
```

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.extraInstallCommands` {#opt-boot.loader.grub.extraInstallCommands}

Additional shell commands inserted in the bootloader installer
script after generating menu entries.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  # the example below generates detached signatures that GRUB can verify
  # https://www.gnu.org/software/grub/manual/grub/grub.html#Using-digital-signatures
  ''${pkgs.findutils}/bin/find /boot -not -path "/boot/efi/*" -type f -name '*.sig' -delete
  old_gpg_home=$GNUPGHOME
  export GNUPGHOME="$(mktemp -d)"
  ''${pkgs.gnupg}/bin/gpg --import ''${priv_key} > /dev/null 2>&1
  ''${pkgs.findutils}/bin/find /boot -not -path "/boot/efi/*" -type f -exec ''${pkgs.gnupg}/bin/gpg --detach-sign "{}" \; > /dev/null 2>&1
  rm -rf $GNUPGHOME
  export GNUPGHOME=$old_gpg_home
''
```

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.extraPerEntryConfig` {#opt-boot.loader.grub.extraPerEntryConfig}

Additional GRUB commands inserted in the configuration file
at the start of each NixOS menu entry.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"root (hd0)"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.extraPrepareConfig` {#opt-boot.loader.grub.extraPrepareConfig}

Additional bash commands to be run at the script that
prepares the GRUB menu entries.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.font` {#opt-boot.loader.grub.font}

Path to a TrueType, OpenType, or pf2 font to be used by Grub.

*Type:* null or absolute path

*Default:* `"${pkgs.grub2}/share/grub/unicode.pf2"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.fontSize` {#opt-boot.loader.grub.fontSize}

Font size for the grub menu. Ignored unless `font`
is set to a ttf or otf font.

*Type:* null or signed integer

*Default:* `null`

*Example:* `16`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.forceInstall` {#opt-boot.loader.grub.forceInstall}

Whether to try and forcibly install GRUB even if problems are
detected. It is not recommended to enable this unless you know what
you are doing.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.forcei686` {#opt-boot.loader.grub.forcei686}

Whether to force the use of a ia32 boot loader on x64 systems. Required
to install and run NixOS on 64bit x86 systems with 32bit (U)EFI.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.fsIdentifier` {#opt-boot.loader.grub.fsIdentifier}

Determines how GRUB will identify devices when generating the
configuration file. A value of uuid / label signifies that grub
will always resolve the uuid or label of the device before using
it in the configuration. A value of provided means that GRUB will
use the device name as show in `df` or
`mount`. Note, zfs zpools / datasets are ignored
and will always be mounted using their labels.

*Type:* one of "uuid", "label", "provided"

*Default:* `"uuid"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.gfxmodeBios` {#opt-boot.loader.grub.gfxmodeBios}

The gfxmode to pass to GRUB when loading a graphical boot interface under BIOS.

*Type:* string

*Default:* `"1024x768"`

*Example:* `"auto"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.gfxmodeEfi` {#opt-boot.loader.grub.gfxmodeEfi}

The gfxmode to pass to GRUB when loading a graphical boot interface under EFI.

*Type:* string

*Default:* `"auto"`

*Example:* `"1024x768"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.gfxpayloadBios` {#opt-boot.loader.grub.gfxpayloadBios}

The gfxpayload to pass to GRUB when loading a graphical boot interface under BIOS.

*Type:* string

*Default:* `"text"`

*Example:* `"keep"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.gfxpayloadEfi` {#opt-boot.loader.grub.gfxpayloadEfi}

The gfxpayload to pass to GRUB when loading a graphical boot interface under EFI.

*Type:* string

*Default:* `"keep"`

*Example:* `"text"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.ipxe` {#opt-boot.loader.grub.ipxe}

Set of iPXE scripts available for
booting from the GRUB boot menu.

*Type:* attribute set of (absolute path or string)

*Default:* `{ }`

*Example:*

``` nix
{ demo = ''
    #!ipxe
    dhcp
    chain http://boot.ipxe.org/demo/boot.php
  '';
}
```

*Declared by:* [`nixos/modules/system/boot/loader/grub/ipxe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/ipxe.nix)

## `boot.loader.grub.memtest86.enable` {#opt-boot.loader.grub.memtest86.enable}

Make Memtest86+, a memory testing program, available from the GRUB
boot menu.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/loader/grub/memtest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/memtest.nix)

## `boot.loader.grub.memtest86.params` {#opt-boot.loader.grub.memtest86.params}

Parameters added to the Memtest86+ command line. As of memtest86+ 5.01
the following list of (apparently undocumented) parameters are
accepted:

- `console=...`, set up a serial console.
  Examples:
  `console=ttyS0`,
  `console=ttyS0,9600` or
  `console=ttyS0,115200n8`.

- `btrace`, enable boot trace.

- `maxcpus=N`, limit number of CPUs.

- `onepass`, run one pass and exit if there
  are no errors.

- `tstlist=...`, list of tests to run.
  Example: `0,1,2`.

- `cpumask=...`, set a CPU mask, to select CPUs
  to use for testing.

This list of command line options was obtained by reading the
Memtest86+ source code.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "console=ttyS0,115200"
]
```

*Declared by:* [`nixos/modules/system/boot/loader/grub/memtest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/memtest.nix)

## `boot.loader.grub.mirroredBoots` {#opt-boot.loader.grub.mirroredBoots}

Mirror the boot configuration to multiple partitions and install grub
to the respective devices corresponding to those partitions.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    devices = [
      "/dev/disk/by-id/wwn-0x500001234567890a"
    ];
    path = "/boot1";
  }
  {
    devices = [
      "/dev/disk/by-id/wwn-0x500009876543210a"
    ];
    path = "/boot2";
  }
]
```

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.mirroredBoots.*.devices` {#opt-boot.loader.grub.mirroredBoots._.devices}

The path to the devices which will have the GRUB MBR written.
Note these are typically device paths and not paths to partitions.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/dev/disk/by-id/wwn-0x500001234567890a"
  "/dev/disk/by-id/wwn-0x500009876543210a"
]
```

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.mirroredBoots.*.efiBootloaderId` {#opt-boot.loader.grub.mirroredBoots._.efiBootloaderId}

The id of the bootloader to store in efi nvram.
The default is to name it NixOS and append the path or efiSysMountPoint.
This is only used if `boot.loader.efi.canTouchEfiVariables` is true.

*Type:* null or string

*Default:* `null`

*Example:* `"NixOS-fsid"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.mirroredBoots.*.efiSysMountPoint` {#opt-boot.loader.grub.mirroredBoots._.efiSysMountPoint}

The path to the efi system mount point. Usually this is the same
partition as the above path and can be left as null.

*Type:* null or string

*Default:* `null`

*Example:* `"/boot1/efi"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.mirroredBoots.*.path` {#opt-boot.loader.grub.mirroredBoots._.path}

The path to the boot directory where GRUB will be written. Generally
this boot path should double as an EFI path.

*Type:* string

*Example:* `"/boot1"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.splashImage` {#opt-boot.loader.grub.splashImage}

Background image used for GRUB.
Set to `null` to run GRUB in text mode.

::: note
File must be one of .png, .tga, .jpg, or .jpeg. JPEG images must
not be progressive.
The image will be scaled if necessary to fit the screen.
:::

*Type:* null or absolute path

*Default:* `null`

*Example:* `./my-background.png`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.splashMode` {#opt-boot.loader.grub.splashMode}

Whether to stretch the image or show the image in the top-left corner unstretched.

*Type:* one of "normal", "stretch"

*Default:* `"stretch"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.storePath` {#opt-boot.loader.grub.storePath}

Path to the Nix store when looking for kernels at boot.
Only makes sense when copyKernels is false.

*Type:* string

*Default:* `"/nix/store"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.subEntryOptions` {#opt-boot.loader.grub.subEntryOptions}

Options applied to the secondary NixOS submenu entry.

*Type:* null or string

*Default:* `"--class nixos"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.theme` {#opt-boot.loader.grub.theme}

Path to the grub theme to be used.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.kdePackages.breeze-grub}/grub/themes/breeze"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.timeoutStyle` {#opt-boot.loader.grub.timeoutStyle}

- `menu` shows the menu.
- `countdown` uses a text-mode countdown.
- `hidden` hides GRUB entirely.

When using a theme, the default value (`menu`) is appropriate for the graphical countdown.

When attempting to do flicker-free boot, `hidden` should be used.

See the [GRUB documentation section about `timeout_style`](https://www.gnu.org/software/grub/manual/grub/html_node/timeout.html).

::: note
If this option is set to ‘countdown’ or ‘hidden’ \[...\] and ESC or F4 are pressed, or SHIFT is held down during that time, it will display the menu and wait for input.
:::

From: [Simple configuration handling page, under GRUB\_TIMEOUT\_STYLE](https://www.gnu.org/software/grub/manual/grub/html_node/Simple-configuration.html).

*Type:* one of "menu", "countdown", "hidden"

*Default:* `"menu"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.useOSProber` {#opt-boot.loader.grub.useOSProber}

If set to true, append entries for other OSs detected by os-prober.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.users` {#opt-boot.loader.grub.users}

User accounts for GRUB. When specified, the GRUB command line and
all boot options except the default are password-protected.
All passwords and hashes provided will be stored in /boot/grub/grub.cfg,
and will be visible to any local user who can read this file. Additionally,
any passwords and hashes provided directly in a Nix configuration
(as opposed to external files) will be copied into the Nix store, and
will be visible to all local users.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  root = {
    hashedPasswordFile = "/path/to/file";
  };
}
```

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.users.<name>.hashedPassword` {#opt-boot.loader.grub.users._name_.hashedPassword}

Specifies the password hash for the account,
generated with grub-mkpasswd-pbkdf2.
This hash will be copied to the Nix store, and will be visible to all local users.

*Type:* null or string

*Default:* `null`

*Example:* `"grub.pbkdf2.sha512.10000.674DFFDEF76E13EA...2CC972B102CF4355"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.users.<name>.hashedPasswordFile` {#opt-boot.loader.grub.users._name_.hashedPasswordFile}

Specifies the path to a file containing the password hash
for the account, generated with grub-mkpasswd-pbkdf2.
This hash will be stored in /boot/grub/grub.cfg, and will
be visible to any local user who can read this file.

*Type:* null or string

*Default:* `null`

*Example:* `"/path/to/file"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.users.<name>.password` {#opt-boot.loader.grub.users._name_.password}

Specifies the clear text password for the account.
This password will be copied to the Nix store, and will be visible to all local users.

*Type:* null or string

*Default:* `null`

*Example:* `"Pa$$w0rd!"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.users.<name>.passwordFile` {#opt-boot.loader.grub.users._name_.passwordFile}

Specifies the path to a file containing the
clear text password for the account.
This password will be stored in /boot/grub/grub.cfg, and will
be visible to any local user who can read this file.

*Type:* null or string

*Default:* `null`

*Example:* `"/path/to/file"`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.grub.zfsSupport` {#opt-boot.loader.grub.zfsSupport}

Whether GRUB should be built against libzfs.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/loader/grub/grub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix)

## `boot.loader.initScript.enable` {#opt-boot.loader.initScript.enable}

Some systems require a /sbin/init script which is started.
Or having it makes starting NixOS easier.
This applies to some kind of hosting services and user mode linux.

Additionally this script will create
/boot/init-other-configurations-contents.txt containing
contents of remaining configurations. You can copy paste them into
/sbin/init manually running a rescue system or such.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/loader/init-script/init-script.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/init-script/init-script.nix)

## `boot.loader.limine.additionalFiles` {#opt-boot.loader.limine.additionalFiles}

A set of files to be copied to `/boot`. Each attribute name denotes the
destination file name in `/boot`, while the corresponding attribute value
specifies the source file.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
{ "efi/memtest86/memtest86.efi" = "${pkgs.memtest86-efi}/BOOTX64.efi"; }
```

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.biosDevice` {#opt-boot.loader.limine.biosDevice}

Device to install the BIOS version of limine on.

*Type:* string

*Default:* `"nodev"`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.biosSupport` {#opt-boot.loader.limine.biosSupport}

Whether or not to install limine for BIOS.

*Type:* boolean

*Default:* `!config.boot.loader.limine.efiSupport && pkgs.stdenv.hostPlatform.isx86`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.efiInstallAsRemovable` {#opt-boot.loader.limine.efiInstallAsRemovable}

Whether or not to install the limine EFI files as removable.

See [`boot.loader.grub.efiInstallAsRemovable`](#opt-boot.loader.grub.efiInstallAsRemovable)

*Type:* boolean

*Default:* `!config.boot.loader.efi.canTouchEfiVariables`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.efiSupport` {#opt-boot.loader.limine.efiSupport}

Whether or not to install the limine EFI files.

*Type:* boolean

*Default:* `pkgs.stdenv.hostPlatform.isEfi`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.enable` {#opt-boot.loader.limine.enable}

Whether to enable the Limine Bootloader.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.enableEditor` {#opt-boot.loader.limine.enableEditor}

Whether to allow editing the boot entries before booting them.
It is recommended to set this to false, as it allows gaining root
access by passing `init=/bin/sh` as a kernel parameter.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.enrollConfig` {#opt-boot.loader.limine.enrollConfig}

Whether or not to enroll the config.
Only works on EFI!

*Type:* boolean

*Default:* `boot.loader.limine.panicOnChecksumMismatch`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.extraConfig` {#opt-boot.loader.limine.extraConfig}

A string which is prepended to limine.conf. The config format can be found [here](https://github.com/limine-bootloader/limine/blob/trunk/CONFIG.md).

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
serial: yes
```

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.extraEntries` {#opt-boot.loader.limine.extraEntries}

A string which is appended to the end of limine.conf. The config format can be found [here](https://github.com/limine-bootloader/limine/blob/trunk/CONFIG.md).

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
/memtest86
  protocol: chainload
  path: boot():///efi/memtest86/memtest86.efi
```

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.extraInstallCommands` {#opt-boot.loader.limine.extraInstallCommands}

Additional shell commands inserted in the bootloader installer
script after generating menu entries. It can be used to expand
on extra boot entries that cannot incorporate certain pieces of
information (such as the resulting `init=` kernel parameter).

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.force` {#opt-boot.loader.limine.force}

Force installation even if the safety checks fail, use absolutely only if necessary!

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.maxGenerations` {#opt-boot.loader.limine.maxGenerations}

Maximum number of latest generations in the boot menu.
Useful to prevent boot partition of running out of disk space.
`null` means no limit i.e. all generations that were not
garbage collected yet.

*Type:* null or signed integer

*Default:* `null`

*Example:* `50`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.package` {#opt-boot.loader.limine.package}

The limine package to use.

*Type:* package

*Default:* `pkgs.limine`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.panicOnChecksumMismatch` {#opt-boot.loader.limine.panicOnChecksumMismatch}

Whether or not checksum validation failure should be a fatal
error at boot time.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.partitionIndex` {#opt-boot.loader.limine.partitionIndex}

The 1-based index of the dedicated partition for limine's second stage.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.resolution` {#opt-boot.loader.limine.resolution}

The framebuffer resolution to set when booting Linux entries.
This controls the GOP mode that Limine sets before handing off to the kernel,
which affects early boot graphics (e.g., simpledrm, efifb).

Format: `<width>x<height>` or `<width>x<height>x<bpp>`.
If bpp is omitted, defaults to 32.

Note: Refresh rate is not supported because the UEFI GOP protocol only
defines framebuffer dimensions and pixel format, not display timing.
Refresh rate is determined later by the GPU driver based on EDID.

This is distinct from [`boot.loader.limine.style.interface.resolution`](#opt-boot.loader.limine.style.interface.resolution)
which only affects the Limine bootloader's own menu interface.

*Type:* null or string

*Default:* `null`

*Example:* `"1920x1080x32"`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.secureBoot.autoEnrollKeys.enable` {#opt-boot.loader.limine.secureBoot.autoEnrollKeys.enable}

Enroll automatically generated keys

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.secureBoot.autoEnrollKeys.extraArgs` {#opt-boot.loader.limine.secureBoot.autoEnrollKeys.extraArgs}

Extra arguments passed to sbctl

*Type:* list of string

*Default:*

``` nix
[
  "--microsoft"
  "--firmware-builtin"
]
```

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.secureBoot.autoGenerateKeys` {#opt-boot.loader.limine.secureBoot.autoGenerateKeys}

Generate keys automatically when none exists during bootloader installation

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.secureBoot.enable` {#opt-boot.loader.limine.secureBoot.enable}

Whether to use sign the limine binary with sbctl.

::: note
This requires you to already have generated the keys and enrolled them with `sbctl`.

To create keys use `sbctl create-keys`.

To enroll them first reset secure boot to "Setup Mode". This is device specific.
Then enroll them using `sbctl enroll-keys -m -f`.

You can now rebuild your system with this option enabled.

Afterwards turn setup mode off and enable secure boot.
:::

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.secureBoot.sbctl` {#opt-boot.loader.limine.secureBoot.sbctl}

The sbctl package to use.

*Type:* package

*Default:* `pkgs.sbctl`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.secureBoot.signAdditionalFiles.enable` {#opt-boot.loader.limine.secureBoot.signAdditionalFiles.enable}

Whether to sign the files listed in
[`boot.loader.limine.additionalFiles`](#opt-boot.loader.limine.additionalFiles) with
`sbctl` `sign` while installing the bootloader.

Files referenced by [`boot.loader.limine.extraEntries`](#opt-boot.loader.limine.extraEntries) are
executed by Limine itself and therefore have to be signed for
Secure Boot to allow booting them.

Only PE/COFF images can be signed. Files which are not detected as
such, e.g. firmware modules or other data files, are left untouched
automatically and do not need to be listed in
[`boot.loader.limine.secureBoot.signAdditionalFiles.skip`](#opt-boot.loader.limine.secureBoot.signAdditionalFiles.skip).

*Type:* boolean

*Default:* `boot.loader.limine.secureBoot.enable`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.secureBoot.signAdditionalFiles.skip` {#opt-boot.loader.limine.secureBoot.signAdditionalFiles.skip}

Destination paths, relative to `/boot`, of files listed in
[`boot.loader.limine.additionalFiles`](#opt-boot.loader.limine.additionalFiles) which must not be
signed, even if they are signable PE/COFF images. This is meant for
files which are already signed by their vendor and should keep
their original signature.

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "efi/memtest86/memtest86.efi" ]`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.style.backdrop` {#opt-boot.loader.limine.style.backdrop}

Color to fill the rest of the screen with when wallpaper\_style is centered in RRGGBB format.

*Type:* null or string

*Default:* `2F302F` for the default wallpaper, `null` otherwise.

*Example:* `"7EBAE4"`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.style.graphicalTerminal.background` {#opt-boot.loader.limine.style.graphicalTerminal.background}

Text background color (TTRRGGBB). TT is transparency.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.style.graphicalTerminal.brightBackground` {#opt-boot.loader.limine.style.graphicalTerminal.brightBackground}

Text background bright color (RRGGBB).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.style.graphicalTerminal.brightForeground` {#opt-boot.loader.limine.style.graphicalTerminal.brightForeground}

Text foreground bright color (RRGGBB).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.style.graphicalTerminal.brightPalette` {#opt-boot.loader.limine.style.graphicalTerminal.brightPalette}

A semicolon-separated array of 8 colors in the format RRGGBB:
dark gray, bright red, bright green, yellow, bright blue, bright magenta, bright cyan, and white.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.style.graphicalTerminal.enable` {#opt-boot.loader.limine.style.graphicalTerminal.enable}

Whether to enable the graphical terminal. Set it to false to force text mode.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.style.graphicalTerminal.font.scale` {#opt-boot.loader.limine.style.graphicalTerminal.font.scale}

The scale of the font in the format <width>x<height>.

*Type:* null or string

*Default:* `null`

*Example:* `2x2`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.style.graphicalTerminal.font.spacing` {#opt-boot.loader.limine.style.graphicalTerminal.font.spacing}

The horizontal spacing between characters in pixels.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.style.graphicalTerminal.foreground` {#opt-boot.loader.limine.style.graphicalTerminal.foreground}

Text foreground color (RRGGBB).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.style.graphicalTerminal.margin` {#opt-boot.loader.limine.style.graphicalTerminal.margin}

The amount of margin around the terminal.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.style.graphicalTerminal.marginGradient` {#opt-boot.loader.limine.style.graphicalTerminal.marginGradient}

The thickness in pixels for the margin around the terminal.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.style.graphicalTerminal.palette` {#opt-boot.loader.limine.style.graphicalTerminal.palette}

A semicolon-separated array of 8 colors in the format RRGGBB:
black, red, green, brown, blue, magenta, cyan, and gray.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.style.interface.branding` {#opt-boot.loader.limine.style.interface.branding}

The title at the top of the screen.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.style.interface.brandingColor` {#opt-boot.loader.limine.style.interface.brandingColor}

Color of the title at the top of the screen in RRGGBB format (Limine defaults to #00AAAA (cyan)).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.style.interface.helpColor` {#opt-boot.loader.limine.style.interface.helpColor}

Color of the help text displayed beside keybinds in RRGGBB format (Limine defaults to #00AA00 (dark green)).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.style.interface.helpColorBright` {#opt-boot.loader.limine.style.interface.helpColorBright}

Color of the bright help text used for the auto-boot countdown digit in RRGGBB format (Limine defaults to #55FF55 (bright green)).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.style.interface.helpHidden` {#opt-boot.loader.limine.style.interface.helpHidden}

Whether or not to hide the keybinds at the top of the screen.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.style.interface.resolution` {#opt-boot.loader.limine.style.interface.resolution}

The resolution of the interface.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.style.wallpaperStyle` {#opt-boot.loader.limine.style.wallpaperStyle}

How the wallpaper should be fit to the screen.

*Type:* one of "centered", "stretched", "tiled"

*Default:* `"stretched"`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.style.wallpapers` {#opt-boot.loader.limine.style.wallpapers}

A list of wallpapers.
If more than one is specified, a random one will be selected at boot.

*Type:* list of absolute path

*Default:* `[ pkgs.nixos-artwork.wallpapers.simple-dark-gray-bootloader.gnomeFilePath ]`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.limine.validateChecksums` {#opt-boot.loader.limine.validateChecksums}

Whether to validate file checksums before booting.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/loader/limine/limine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/limine/limine.nix)

## `boot.loader.refind.additionalFiles` {#opt-boot.loader.refind.additionalFiles}

A set of files to be copied to `/boot`. Each attribute name denotes the
destination file name in `/boot`, while the corresponding attribute value
specifies the source file.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
{ "efi/memtest86/memtest86.efi" = "${pkgs.memtest86-efi}/BOOTX64.efi"; }
```

*Declared by:* [`nixos/modules/system/boot/loader/refind/refind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/refind/refind.nix)

## `boot.loader.refind.efiInstallAsRemovable` {#opt-boot.loader.refind.efiInstallAsRemovable}

Whether or not to install the rEFInd EFI files as removable.

See [`boot.loader.grub.efiInstallAsRemovable`](#opt-boot.loader.grub.efiInstallAsRemovable)

*Type:* boolean

*Default:* `!config.boot.loader.efi.canTouchEfiVariables`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/loader/refind/refind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/refind/refind.nix)

## `boot.loader.refind.enable` {#opt-boot.loader.refind.enable}

Whether to enable the rEFInd boot loader.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/loader/refind/refind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/refind/refind.nix)

## `boot.loader.refind.extraConfig` {#opt-boot.loader.refind.extraConfig}

A string which is prepended to refind.conf.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/loader/refind/refind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/refind/refind.nix)

## `boot.loader.refind.maxGenerations` {#opt-boot.loader.refind.maxGenerations}

Maximum number of latest generations in the boot menu.
Useful to prevent boot partition of running out of disk space.
`null` means no limit i.e. all generations that were not
garbage collected yet.

*Type:* null or signed integer

*Default:* `null`

*Example:* `50`

*Declared by:* [`nixos/modules/system/boot/loader/refind/refind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/refind/refind.nix)

## `boot.loader.refind.package` {#opt-boot.loader.refind.package}

The refind package to use.

*Type:* package

*Default:* `pkgs.refind`

*Declared by:* [`nixos/modules/system/boot/loader/refind/refind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/refind/refind.nix)

## `boot.loader.systemd-boot.bootCounting.enable` {#opt-boot.loader.systemd-boot.bootCounting.enable}

Whether to enable [Automatic Boot Assessment](https://systemd.io/AUTOMATIC_BOOT_ASSESSMENT/).

New boot entries are written with a boot counter in the file name. On
each boot, systemd-boot decrements the counter; once the booted system
reaches `boot-complete.target`, `systemd-bless-boot.service` removes the
counter and marks the entry as good. An entry whose counter reaches zero
is considered bad and will be skipped in favour of an older generation
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.systemd-boot.bootCounting.tries` {#opt-boot.loader.systemd-boot.bootCounting.tries}

Number of boot attempts a freshly written entry is given before it is
considered bad.

*Type:* positive integer, meaning \>0

*Default:* `3`

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.systemd-boot.configurationLimit` {#opt-boot.loader.systemd-boot.configurationLimit}

Maximum number of latest generations in the boot menu.
Useful to prevent boot partition running out of disk space.

`null` means no limit i.e. all generations
that have not been garbage collected yet.

*Type:* null or signed integer

*Default:* `null`

*Example:* `120`

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.systemd-boot.consoleMode` {#opt-boot.loader.systemd-boot.consoleMode}

The resolution of the console. The following values are valid:

- `"0"`: Standard UEFI 80x25 mode
- `"1"`: 80x50 mode, not supported by all devices
- `"2"`: The first non-standard mode provided by the device firmware, if any
- `"5"`: Applicable for SteamDeck where this mode represent horizontal mode
- `"auto"`: Pick a suitable mode automatically using heuristics
- `"max"`: Pick the highest-numbered available mode
- `"keep"`: Keep the mode selected by firmware (the default)

*Type:* one of "0", "1", "2", "5", "auto", "max", "keep"

*Default:* `"keep"`

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.systemd-boot.editor` {#opt-boot.loader.systemd-boot.editor}

Whether to allow editing the kernel command-line before
boot. It is recommended to set this to false, as it allows
gaining root access by passing init=/bin/sh as a kernel
parameter. However, it is enabled by default for backwards
compatibility.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.systemd-boot.edk2-uefi-shell.enable` {#opt-boot.loader.systemd-boot.edk2-uefi-shell.enable}

Make the EDK2 UEFI Shell available from the systemd-boot menu.
It can be used to manually boot other operating systems or for debugging.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.systemd-boot.edk2-uefi-shell.sortKey` {#opt-boot.loader.systemd-boot.edk2-uefi-shell.sortKey}

`systemd-boot` orders the menu entries by their sort keys,
so if you want something to appear after all the NixOS entries,
it should start with `o` or onwards.

See also [`boot.loader.systemd-boot.sortKey`](#opt-boot.loader.systemd-boot.sortKey)..

*Type:* string

*Default:* `"o_edk2-uefi-shell"`

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.systemd-boot.enable` {#opt-boot.loader.systemd-boot.enable}

Whether to enable the systemd-boot (formerly gummiboot) EFI boot manager.
For more information about systemd-boot:
[https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/](https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.systemd-boot.extraEntries` {#opt-boot.loader.systemd-boot.extraEntries}

Any additional entries you want added to the `systemd-boot` menu.
These entries will be copied to `$BOOT/loader/entries`.
Each attribute name denotes the destination file name,
and the corresponding attribute value is the contents of the entry.

To control the ordering of the entry in the boot menu, use the sort-key
field, see
[https://uapi-group.org/specifications/specs/boot\_loader\_specification/#sorting](https://uapi-group.org/specifications/specs/boot_loader_specification/#sorting)
and [`boot.loader.systemd-boot.sortKey`](#opt-boot.loader.systemd-boot.sortKey).

*Type:* attribute set of strings concatenated with "\\n"

*Default:* `{ }`

*Example:*

``` nix
{ "memtest86.conf" = ''
  title Memtest86+
  efi /efi/memtest86/memtest.efi
  sort-key z_memtest
''; }
```

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.systemd-boot.extraFiles` {#opt-boot.loader.systemd-boot.extraFiles}

A set of files to be copied to `$BOOT`.
Each attribute name denotes the destination file name in
`$BOOT`, while the corresponding
attribute value specifies the source file.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
{ "efi/memtest86/memtest.efi" = pkgs.memtest86plus.efi; }
```

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.systemd-boot.extraInstallCommands` {#opt-boot.loader.systemd-boot.extraInstallCommands}

Additional shell commands inserted in the bootloader installer
script after generating menu entries. It can be used to expand
on extra boot entries that cannot incorporate certain pieces of
information (such as the resulting `init=` kernel parameter).

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  default_cfg=$(cat /boot/loader/loader.conf | grep default | awk '{print $2}')
  init_value=$(cat /boot/loader/entries/$default_cfg | grep init= | awk '{print $2}')
  sed -i "s|@INIT@|$init_value|g" /boot/custom/config_with_placeholder.conf
''
```

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.systemd-boot.graceful` {#opt-boot.loader.systemd-boot.graceful}

Invoke `bootctl install` with the `--graceful` option,
which ignores errors when EFI variables cannot be written or when the EFI System Partition
cannot be found. Currently only applies to random seed operations.

Only enable this option if `systemd-boot` otherwise fails to install, as the
scope or implication of the `--graceful` option may change in the future.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.systemd-boot.installDeviceTree` {#opt-boot.loader.systemd-boot.installDeviceTree}

Install the devicetree blob specified by `config.hardware.deviceTree.name`
to the ESP and instruct systemd-boot to pass this DTB to linux.

*Type:* unspecified value

*Default:* `"with config.hardware.deviceTree; enable && name != null"`

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.systemd-boot.memtest86.enable` {#opt-boot.loader.systemd-boot.memtest86.enable}

Make Memtest86+ available from the systemd-boot menu. Memtest86+ is a
program for testing memory.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.systemd-boot.memtest86.sortKey` {#opt-boot.loader.systemd-boot.memtest86.sortKey}

`systemd-boot` orders the menu entries by their sort keys,
so if you want something to appear after all the NixOS entries,
it should start with `o` or onwards.

See also [`boot.loader.systemd-boot.sortKey`](#opt-boot.loader.systemd-boot.sortKey).

*Type:* string

*Default:* `"o_memtest86"`

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.systemd-boot.netbootxyz.enable` {#opt-boot.loader.systemd-boot.netbootxyz.enable}

Make `netboot.xyz` available from the
`systemd-boot` menu. `netboot.xyz`
is a menu system that allows you to boot OS installers and
utilities over the network.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.systemd-boot.netbootxyz.sortKey` {#opt-boot.loader.systemd-boot.netbootxyz.sortKey}

`systemd-boot` orders the menu entries by their sort keys,
so if you want something to appear after all the NixOS entries,
it should start with `o` or onwards.

See also [`boot.loader.systemd-boot.sortKey`](#opt-boot.loader.systemd-boot.sortKey).

*Type:* string

*Default:* `"o_netbootxyz"`

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.systemd-boot.rebootForBitlocker` {#opt-boot.loader.systemd-boot.rebootForBitlocker}

Enable *EXPERIMENTAL* BitLocker support.

Try to detect BitLocker encrypted drives along with an active
TPM. If both are found and Windows Boot Manager is selected in
the boot menu, set the "BootNext" EFI variable and restart the
system. The firmware will then start Windows Boot Manager
directly, leaving the TPM PCRs in expected states so that
Windows can unseal the encryption key.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.systemd-boot.sortKey` {#opt-boot.loader.systemd-boot.sortKey}

The sort key used for the NixOS bootloader entries.
This key determines sorting relative to non-NixOS entries.
See also [https://uapi-group.org/specifications/specs/boot\_loader\_specification/#sorting](https://uapi-group.org/specifications/specs/boot_loader_specification/#sorting)

This option can also be used to control the sorting of NixOS specialisations.

By default, specialisations inherit the sort key of their parent generation
and will have the same value for both the sort-key and the version (i.e. the generation number),
systemd-boot will therefore sort them based on their file name, meaning that
in your boot menu you will have each main generation directly followed by
its specialisations sorted alphabetically by their names.

If you want a different ordering for a specialisation, you can override
its sort-key which will cause the specialisation to be uncoupled from its
parent generation. It will then be sorted by its new sort-key just like
any other boot entry.

The sort-key is stored in the generation's bootspec, which means that
generations keep their sort-keys even if the original definition of the
generation was removed from the NixOS configuration.
It also means that updating the sort-key will only affect new generations,
while old ones will keep the sort-key that they were originally built with.

*Type:* string

*Default:* `"nixos"`

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.systemd-boot.windows` {#opt-boot.loader.systemd-boot.windows}

Make Windows bootable from systemd-boot. This option is not necessary when Windows and
NixOS use the same EFI System Partition (ESP). In that case, Windows will automatically be
detected by systemd-boot.

However, if Windows is installed on a separate drive or ESP, you can use this option to add
a menu entry for each installation manually.

The attribute name is used for the title of the menu entry and internal file names.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "10".efiDeviceHandle = "HD0c3";
  "11-ame" = {
    title = "Windows 11 Ameliorated Edition";
    efiDeviceHandle = "HD0b1";
  };
  "11-home" = {
    title = "Windows 11 Home";
    efiDeviceHandle = "FS1";
    sortKey = "z_windows";
  };
}
```

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.systemd-boot.windows.<name>.efiDeviceHandle` {#opt-boot.loader.systemd-boot.windows._name_.efiDeviceHandle}

The device handle of the EFI System Partition (ESP) where the Windows bootloader is
located. This is the device handle that the EDK2 UEFI Shell uses to load the
bootloader.

To find this handle, follow these steps:

1. Set [`boot.loader.systemd-boot.edk2-uefi-shell.enable`](#opt-boot.loader.systemd-boot.edk2-uefi-shell.enable) to `true`
2. Run `nixos-rebuild boot`
3. Reboot and select "EDK2 UEFI Shell" from the systemd-boot menu
4. Run `map -c` to list all consistent device handles
5. For each device handle (for example, `HD0c1`), run `ls HD0c1:\EFI`
6. If the output contains the directory `Microsoft`, you might have found the correct device handle
7. Run `HD0c1:\EFI\Microsoft\Boot\Bootmgfw.efi` to check if Windows boots correctly
8. If it does, this device handle is the one you need (in this example, `HD0c1`)

This option is required, there is no useful default.

*Type:* string

*Example:* `"HD1b3"`

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.systemd-boot.windows.<name>.sortKey` {#opt-boot.loader.systemd-boot.windows._name_.sortKey}

`systemd-boot` orders the menu entries by their sort keys,
so if you want something to appear after all the NixOS entries,
it should start with `o` or onwards.

See also [`boot.loader.systemd-boot.sortKey`](#opt-boot.loader.systemd-boot.sortKey)..

*Type:* string

*Default:* `"attribute name of this entry, prefixed with \"o_windows_\""`

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.systemd-boot.windows.<name>.title` {#opt-boot.loader.systemd-boot.windows._name_.title}

The title of the boot menu entry.

*Type:* string

*Default:* `"attribute name of this entry, prefixed with \"Windows \""`

*Example:* `"Michaelsoft Binbows"`

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.systemd-boot.xbootldrMountPoint` {#opt-boot.loader.systemd-boot.xbootldrMountPoint}

Where the XBOOTLDR partition is mounted.

If set, this partition will be used as $BOOT to store boot loader entries and extra files
instead of the EFI partition. As per the bootloader specification, it is recommended that
the EFI and XBOOTLDR partitions be mounted at `/efi` and `/boot`, respectively.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix)

## `boot.loader.timeout` {#opt-boot.loader.timeout}

Timeout (in seconds) until loader boots the default menu item. Use null if the loader menu should be displayed indefinitely.

*Type:* null or signed integer

*Default:* `5`

*Declared by:* [`nixos/modules/system/boot/loader/loader.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/loader.nix)

## `boot.modprobeConfig.enable` {#opt-boot.modprobeConfig.enable}

Whether to enable modprobe config. This is useful for systems like containers which do not require a kernel.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/modprobe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/modprobe.nix)

## `boot.modprobeConfig.useUbuntuModuleBlacklist` {#opt-boot.modprobeConfig.useUbuntuModuleBlacklist}

Whether to enable Ubuntu distro's module blacklist.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/modprobe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/modprobe.nix)

## `boot.nixStoreMountOpts` {#opt-boot.nixStoreMountOpts}

Defines the mount options used on a bind mount for the `/nix/store`.
This affects the whole system except the nix store daemon, which will undo the bind mount.

`ro` enforces immutability of the Nix store.
The store daemon should already not put device mappers or suid binaries in the store,
meaning `nosuid` and `nodev` enforce what should already be the case.

*Type:* list of non-empty string

*Default:*

``` nix
[
  "x-initrd.mount"
  "ro"
  "nodev"
  "nosuid"
]
```

*Declared by:* [`nixos/modules/system/boot/stage-2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/stage-2.nix)

## `boot.plymouth.enable` {#opt-boot.plymouth.enable}

Whether to enable Plymouth boot splash screen.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/plymouth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/plymouth.nix)

## `boot.plymouth.extraConfig` {#opt-boot.plymouth.extraConfig}

Literal string to append to `configFile`
and the config file generated by the plymouth module.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/system/boot/plymouth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/plymouth.nix)

## `boot.plymouth.font` {#opt-boot.plymouth.font}

Font file made available for displaying text on the splash screen.

*Type:* absolute path

*Default:* `"${pkgs.dejavu_fonts.minimal}/share/fonts/truetype/DejaVuSans.ttf"`

*Declared by:* [`nixos/modules/system/boot/plymouth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/plymouth.nix)

## `boot.plymouth.logo` {#opt-boot.plymouth.logo}

Logo which is displayed on the splash screen.
Currently supports PNG file format only.

*Type:* absolute path

*Default:* `"${pkgs.nixos-icons}/share/icons/hicolor/48x48/apps/nix-snowflake-white.png"`

*Example:*

``` nix
pkgs.fetchurl {
  url = "https://nixos.org/logo/nixos-hires.png";
  sha256 = "1ivzgd7iz0i06y36p8m5w48fd8pjqwxhdaavc0pxs7w1g7mcy5si";
}
```

*Declared by:* [`nixos/modules/system/boot/plymouth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/plymouth.nix)

## `boot.plymouth.package` {#opt-boot.plymouth.package}

The plymouth package to use.

*Type:* package

*Default:*

``` nix
pkgs.plymouth.override {
  systemd = config.boot.initrd.systemd.package;
}
```

*Declared by:* [`nixos/modules/system/boot/plymouth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/plymouth.nix)

## `boot.plymouth.showDelay` {#opt-boot.plymouth.showDelay}

Time (in seconds) to delay the splash screen.

*Type:* nonnegative integer or floating point number, meaning \>=0

*Default:* `0`

*Example:* `0.5`

*Declared by:* [`nixos/modules/system/boot/plymouth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/plymouth.nix)

## `boot.plymouth.theme` {#opt-boot.plymouth.theme}

Splash screen theme.

*Type:* string

*Default:* `"bgrt"`

*Declared by:* [`nixos/modules/system/boot/plymouth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/plymouth.nix)

## `boot.plymouth.themePackages` {#opt-boot.plymouth.themePackages}

Extra theme packages for plymouth.

*Type:* list of package

*Default:* A NixOS branded variant of the breeze theme when
`config.boot.plymouth.theme == "breeze"`, otherwise
`[ ]`.

*Declared by:* [`nixos/modules/system/boot/plymouth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/plymouth.nix)

## `boot.plymouth.tpm2-totp.enable` {#opt-boot.plymouth.tpm2-totp.enable}

Whether to display a TOTP during boot using tpm2-totp and Plymouth.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/plymouth-tpm2-totp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/plymouth-tpm2-totp.nix)

## `boot.plymouth.tpm2-totp.package` {#opt-boot.plymouth.tpm2-totp.package}

The tpm2-totp package to use.

*Type:* package

*Default:* `pkgs.tpm2-totp-with-plymouth`

*Declared by:* [`nixos/modules/system/boot/plymouth-tpm2-totp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/plymouth-tpm2-totp.nix)

## `boot.postBootCommands` {#opt-boot.postBootCommands}

Shell commands to be executed just before systemd is started.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"rm -f /var/log/messages"`

*Declared by:* [`nixos/modules/system/boot/stage-2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/stage-2.nix)

## `boot.resumeDevice` {#opt-boot.resumeDevice}

Device for manual resume attempt during boot. This should be used primarily
if you want to resume from file. If left empty, the swap partitions are used.
Specify here the device where the file resides.
You should also use `boot.kernelParams` to specify
`«resume_offset»`.

*Type:* string

*Default:* `""`

*Example:* `"/dev/sda3"`

*Declared by:* [`nixos/modules/system/boot/stage-1.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/stage-1.nix)

## `boot.runSize` {#opt-boot.runSize}

Size limit for the /run tmpfs. Look at `mount(8)`, tmpfs size option,
for the accepted syntax.

*Type:* string

*Default:* `"25%"`

*Example:* `"256m"`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `boot.specialFileSystems.<name>.depends` {#opt-boot.specialFileSystems._name_.depends}

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

## `boot.specialFileSystems.<name>.device` {#opt-boot.specialFileSystems._name_.device}

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

## `boot.specialFileSystems.<name>.enable` {#opt-boot.specialFileSystems._name_.enable}

Whether to enable the filesystem mount.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `boot.specialFileSystems.<name>.fsType` {#opt-boot.specialFileSystems._name_.fsType}

Type of the file system.

This is the `fstype` passed to `-t` in the `mount(8)` command, and is called `fs_vfstype` in `fstab(5)`.

*Type:* string (with check: non-empty)

*Example:* `"ext3"`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `boot.specialFileSystems.<name>.mountPoint` {#opt-boot.specialFileSystems._name_.mountPoint}

Location where the file system will be mounted.

This is called `mountpoint` in `mount(8)` and `fs_file` in `fstab(5)`

*Type:* string (with check: non-empty without trailing slash)

*Default:* `"‹name›"`

*Example:* `"/mnt/usb"`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `boot.specialFileSystems.<name>.options` {#opt-boot.specialFileSystems._name_.options}

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

## `boot.specialFileSystems.<name>.stratis.poolUuid` {#opt-boot.specialFileSystems._name_.stratis.poolUuid}

UUID of the stratis pool that the fs is located in

This is only relevant if you are using [stratis](https://stratis-storage.github.io/).

*Type:* null or string

*Default:* `null`

*Example:* `"04c68063-90a5-4235-b9dd-6180098a20d9"`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `boot.stage2Greeting` {#opt-boot.stage2Greeting}

The greeting message displayed during NixOS stage 2 boot.

*Type:* string

*Default:* `"<<< ${config.system.nixos.distroName} Stage 2 >>>"`

*Declared by:* [`nixos/modules/system/boot/stage-2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/stage-2.nix)

## `boot.supportedFilesystems` {#opt-boot.supportedFilesystems}

Names of supported filesystem types, or an attribute set of file system types
and their state. The set form may be used together with `lib.mkForce` to
explicitly disable support for specific filesystems, e.g. to disable ZFS
with an unsupported kernel.

*Type:* (attribute set of boolean) or (list of string) convertible to it

*Default:* `{ }`

*Example:*

``` nix
{
  btrfs = true;
  zfs = lib.mkForce false;
}
```

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `boot.swraid.enable` {#opt-boot.swraid.enable}

Whether to enable support for Linux MD RAID arrays.

When this is enabled, mdadm will be added to the system path,
and MD RAID arrays will be detected and activated
automatically, both in stage-1 (initramfs) and in stage-2 (the
final NixOS system).

This should be enabled if you want to be able to access and/or
boot from MD RAID arrays. `nixos-generate-config`
should detect it correctly in the standard installation
procedure.

*Type:* boolean

*Default:* ``"`true` if stateVersion is older than 23.11"``

*Example:* `true`

*Declared by:* [`nixos/modules/tasks/swraid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/swraid.nix)

## `boot.swraid.mdadmConf` {#opt-boot.swraid.mdadmConf}

Contents of `/etc/mdadm.conf`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/tasks/swraid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/swraid.nix)

## `boot.systemdExecutable` {#opt-boot.systemdExecutable}

The program to execute to start systemd.

*Type:* string

*Default:* `"/run/current-system/systemd/lib/systemd/systemd"`

*Declared by:* [`nixos/modules/system/boot/stage-2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/stage-2.nix)

## `boot.tmp.cleanOnBoot` {#opt-boot.tmp.cleanOnBoot}

Whether to delete all files in `/tmp` during boot.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/tmp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/tmp.nix)

## `boot.tmp.tmpfsHugeMemoryPages` {#opt-boot.tmp.tmpfsHugeMemoryPages}

- `never`        - Do not allocate huge memory pages. This is the default.
- `always`       - Attempt to allocate huge memory page every time a new page is needed.
- `within_size`  - Only allocate huge memory pages if it will be fully within i\_size. Also respect madvise(2) hints. Recommended.
- `advise`       - Only allocate huge memory pages if requested with madvise(2).

*Type:* one of "never", "always", "within\_size", "advise"

*Default:* `"never"`

*Example:* `"within_size"`

*Declared by:* [`nixos/modules/system/boot/tmp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/tmp.nix)

## `boot.tmp.tmpfsSize` {#opt-boot.tmp.tmpfsSize}

Size of tmpfs in percentage.
Percentage is defined by systemd.

*Type:* string or (positive integer, meaning \>0)

*Default:* `"50%"`

*Declared by:* [`nixos/modules/system/boot/tmp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/tmp.nix)

## `boot.tmp.useTmpfs` {#opt-boot.tmp.useTmpfs}

Whether to mount a tmpfs on `/tmp` during boot.

::: note
Large Nix builds can fail if the mounted tmpfs is not large enough.
In such a case either increase the tmpfsSize or disable this option.
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/tmp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/tmp.nix)

## `boot.tmp.useZram` {#opt-boot.tmp.useZram}

Whether to mount a zram device on `/tmp` during boot.

::: note
Large Nix builds can fail if the mounted zram device is not large enough.
In such a case either increase the zramSettings.zram-size or disable this option.
:::

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/zram-as-tmp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/zram-as-tmp.nix)

## `boot.tmp.zramSettings.compression-algorithm` {#opt-boot.tmp.zramSettings.compression-algorithm}

The compression algorithm to use for the zram device.

See: [https://github.com/systemd/zram-generator/blob/main/zram-generator.conf.example](https://github.com/systemd/zram-generator/blob/main/zram-generator.conf.example)

*Type:* string

*Default:* `"zstd"`

*Example:* `"lzo-rle"`

*Declared by:* [`nixos/modules/system/boot/zram-as-tmp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/zram-as-tmp.nix)

## `boot.tmp.zramSettings.fs-type` {#opt-boot.tmp.zramSettings.fs-type}

The file system to put on the device.

See: [https://github.com/systemd/zram-generator/blob/main/zram-generator.conf.example](https://github.com/systemd/zram-generator/blob/main/zram-generator.conf.example)

*Type:* string

*Default:* `"ext4"`

*Example:* `"ext2"`

*Declared by:* [`nixos/modules/system/boot/zram-as-tmp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/zram-as-tmp.nix)

## `boot.tmp.zramSettings.options` {#opt-boot.tmp.zramSettings.options}

By default, file systems and swap areas are trimmed on-the-go
by setting "discard".
Setting this to the empty string clears the option.

See: [https://github.com/systemd/zram-generator/blob/main/zram-generator.conf.example](https://github.com/systemd/zram-generator/blob/main/zram-generator.conf.example)

*Type:* string

*Default:* `"X-mount.mode=1777,discard"`

*Declared by:* [`nixos/modules/system/boot/zram-as-tmp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/zram-as-tmp.nix)

## `boot.tmp.zramSettings.zram-size` {#opt-boot.tmp.zramSettings.zram-size}

The size of the zram device, as a function of MemTotal, both in MB.
For example, if the machine has 1 GiB, and zram-size=ram/4,
then the zram device will have 256 MiB.
Fractions in the range 0.1–0.5 are recommended

See: [https://github.com/systemd/zram-generator/blob/main/zram-generator.conf.example](https://github.com/systemd/zram-generator/blob/main/zram-generator.conf.example)

*Type:* string

*Default:* `"ram * 0.5"`

*Example:* `"min(ram / 2, 4096)"`

*Declared by:* [`nixos/modules/system/boot/zram-as-tmp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/zram-as-tmp.nix)

## `boot.uki.configFile` {#opt-boot.uki.configFile}

The configuration file passed to `ukify(1)` to create the UKI.

By default this configuration file is created from [`boot.uki.settings`](#opt-boot.uki.settings).

*Type:* absolute path

*Declared by:* [`nixos/modules/system/boot/uki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/uki.nix)

## `boot.uki.name` {#opt-boot.uki.name}

Name of the UKI

*Type:* string

*Declared by:* [`nixos/modules/system/boot/uki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/uki.nix)

## `boot.uki.settings` {#opt-boot.uki.settings}

The configuration settings for ukify. These control what the UKI
contains and how it is built.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/uki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/uki.nix)

## `boot.uki.tries` {#opt-boot.uki.tries}

Number of boot attempts before this UKI is considered bad.

If no tries are specified (the default) automatic boot assessment remains inactive.

See documentation on [Automatic Boot Assessment](https://systemd.io/AUTOMATIC_BOOT_ASSESSMENT/) and
[boot counting](https://uapi-group.org/specifications/specs/boot_loader_specification/#boot-counting)
for more information.

*Type:* null or (unsigned integer, meaning \>=0)

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/uki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/uki.nix)

## `boot.uki.version` {#opt-boot.uki.version}

Version of the image or generation the UKI belongs to

*Type:* null or string

*Default:* `config.system.image.version`

*Declared by:* [`nixos/modules/system/boot/uki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/uki.nix)

## `boot.uvesafb.enable` {#opt-boot.uvesafb.enable}

Whether to enable uvesafb.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/uvesafb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/uvesafb.nix)

## `boot.uvesafb.gfx-mode` {#opt-boot.uvesafb.gfx-mode}

Screen resolution in modedb format. See [uvesafb](https://docs.kernel.org/fb/uvesafb.html) and [modedb](https://docs.kernel.org/fb/modedb.html) documentation for more details. The default value is a sensible default but may be not ideal for all setups.

*Type:* string

*Default:* `"1024x768-32"`

*Declared by:* [`nixos/modules/system/boot/uvesafb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/uvesafb.nix)

## `boot.uvesafb.v86d.package` {#opt-boot.uvesafb.v86d.package}

Which v86d package to use with uvesafb

*Type:* package

*Default:*

``` nix
''
  config.boot.kernelPackages.v86d.overrideAttrs (old: {
            hardeningDisable = [ "all" ];
          })''
```

*Declared by:* [`nixos/modules/system/boot/uvesafb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/uvesafb.nix)

## `boot.zfs.devNodes` {#opt-boot.zfs.devNodes}

Name of directory from which to import ZFS device, this is passed to `zpool import`
as the value of the `-d` option.

For guidance on choosing this value, see
[the ZFS documentation](https://openzfs.github.io/openzfs-docs/Project%20and%20Community/FAQ.html#selecting-dev-names-when-creating-a-pool-linux).

*Type:* absolute path

*Default:* `"/dev/disk/by-id"`

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `boot.zfs.enabled` {#opt-boot.zfs.enabled}

True if ZFS filesystem support is enabled

*Type:* boolean

*Default:* `true` if ZFS filesystem support is enabled

*Read only*

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `boot.zfs.extraPools` {#opt-boot.zfs.extraPools}

Name or GUID of extra ZFS pools that you wish to import during boot.

Usually this is not necessary. Instead, you should set the mountpoint property
of ZFS filesystems to `legacy` and add the ZFS filesystems to
NixOS's [`fileSystems`](../../options/other/index.md#opt-fileSystems) option, which makes NixOS automatically
import the associated pool.

However, in some cases (e.g. if you have many filesystems) it may be preferable
to exclusively use ZFS commands to manage filesystems. If so, since NixOS/systemd
will not be managing those filesystems, you will need to specify the ZFS pool here
so that NixOS automatically imports it on every boot.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "tank"
  "data"
]
```

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `boot.zfs.forceImportAll` {#opt-boot.zfs.forceImportAll}

Forcibly import all ZFS pool(s).

It is highly recommended to keep this option disabled as it bypasses ZFS
safeguard that protect your pools.

See [`boot.zfs.forceImportRoot`](#opt-boot.zfs.forceImportRoot) for details.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `boot.zfs.forceImportRoot` {#opt-boot.zfs.forceImportRoot}

Forcibly import the ZFS root pool(s) during early boot.

ZFS has a feature to protect users from accidentally mounting the same file system
on multiple machines simultaneously (which leads to pool corruption).
This option disables that by passing `-f` to `zpool import` on boot, see
https://openzfs.github.io/openzfs-docs/Basic%20Concepts/Operations/Boot%20Process.html#hostid-and-importing-on-the-wrong-machine

You should only need a force import if the pool was last imported
by another system (e.g. a live ISO, or plugged into a different computer)
without being `zpool export`ed from it.

Thus it is recommended to keep this option disabled, keeping the protection.

If NixOS fails to boot because the root pool cannot be imported
(with this option disabled), you should boot
with the `zfs_force=1` option as a kernel parameter (e.g. by manually
editing the kernel params via your bootloader) to disable
the protection just for that boot. Upon success, the pool will record this
machine's `hostid` (see [`networking.hostId`](../../options/networking/index.md#opt-networking.hostId)),
so subsequent boots work without `zfs_force=1` again.

*Type:* boolean

*Default:* `lib.versionOlder config.system.stateVersion "26.11"`

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `boot.zfs.package` {#opt-boot.zfs.package}

Configured ZFS userland tools package.

*Type:* package

*Default:* `pkgs.zfs`

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `boot.zfs.passwordTimeout` {#opt-boot.zfs.passwordTimeout}

Timeout in seconds to wait for password entry for decrypt at boot.

Defaults to 0, which waits forever.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `boot.zfs.pools` {#opt-boot.zfs.pools}

Configuration for individual pools to override global defaults.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `boot.zfs.pools.<name>.devNodes` {#opt-boot.zfs.pools._name_.devNodes}

Name of directory from which to import ZFS device, this is passed to `zpool import`
as the value of the `-d` option.

For guidance on choosing this value, see
[the ZFS documentation](https://openzfs.github.io/openzfs-docs/Project%20and%20Community/FAQ.html#selecting-dev-names-when-creating-a-pool-linux).

*Type:* absolute path

*Default:* `"config.boot.zfs.devNodes"`

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `boot.zfs.removeLinuxDRM` {#opt-boot.zfs.removeLinuxDRM}

Patch the kernel to change symbols needed by ZFS from
EXPORT\_SYMBOL\_GPL to EXPORT\_SYMBOL.

Currently has no effect, but may again in future if a kernel
update breaks ZFS due to symbols being newly changed to GPL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `boot.zfs.requestEncryptionCredentials` {#opt-boot.zfs.requestEncryptionCredentials}

If true on import encryption keys or passwords for all encrypted datasets
are requested. To only decrypt selected datasets supply a list of dataset
names instead. For root pools the encryption key can be supplied via both
an interactive prompt (keylocation=prompt) and from a file (keylocation=file://).

*Type:* boolean or list of string

*Default:* `true`

*Example:*

``` nix
[
  "tank"
  "data"
]
```

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `boot.zfs.tzpfms.backends` {#opt-boot.zfs.tzpfms.backends}

TPM backends to include in for tzpfms.

*Type:* non-empty (list of (one of "TPM2", "TPM1.X"))

*Default:*

``` nix
[
  "TPM2"
]
```

*Declared by:* [`nixos/modules/system/boot/tzpfms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/tzpfms.nix)

## `boot.zfs.tzpfms.datasets` {#opt-boot.zfs.tzpfms.datasets}

Explicit list of ZFS datasets to unlock with TPM at boot.

*Type:* non-empty (list of string)

*Example:*

``` nix
[
  "tank/root"
  "tank/var"
]
```

*Declared by:* [`nixos/modules/system/boot/tzpfms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/tzpfms.nix)

## `boot.zfs.tzpfms.enable` {#opt-boot.zfs.tzpfms.enable}

Whether to enable TPM-backed ZFS encryption using tzpfms.
Supports both TPM 2.0 & TPM 1.x.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/tzpfms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/tzpfms.nix)

## `boot.zfs.tzpfms.package` {#opt-boot.zfs.tzpfms.package}

The tzpfms package to use.

*Type:* package

*Default:* `pkgs.tzpfms`

*Declared by:* [`nixos/modules/system/boot/tzpfms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/tzpfms.nix)

## `boot.zfs.unsafeAllowHibernation` {#opt-boot.zfs.unsafeAllowHibernation}

Allow hibernation (suspend to disk) support. This is generally considered **UNSAFE**,
is not well supported by openzfs, and could lead to corruption and data loss.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `boot.zfs.useKeyringForCredentials` {#opt-boot.zfs.useKeyringForCredentials}

Whether to enable Uses the kernel keyring for encryption credentials with keyname=zfs-<poolname>.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `boot.zswap.acceptThresholdPercent` {#opt-boot.zswap.acceptThresholdPercent}

Threshold percentage at which zswap starts accepting pages again after the pool becomes full (1-100).

This parameter provides hysteresis to prevent pool oscillation.
When the pool usage drops below this threshold, zswap starts accepting new pages.
Default is 90% as recommended by kernel documentation.

*Type:* integer between 1 and 100 (both inclusive)

*Default:* `90`

*Declared by:* [`nixos/modules/system/boot/zswap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/zswap.nix)

## `boot.zswap.compressor` {#opt-boot.zswap.compressor}

Compression algorithm to use for zswap.

Available options:

- 'zstd': Best compression ratio, excellent for Nix builds (default)
- 'lz4': Fastest compression, lowest latency
- 'lz4hc': High-compression variant of lz4, slower but better ratio
- 'lzo': Good balance of speed and compression (kernel default)
- 'deflate': Higher compression, slower processing
- '842': Hardware-accelerated compression on supported systems

Note: The chosen algorithm must be supported by your kernel configuration.

*Type:* one of "zstd", "lz4", "lzo", "lz4hc", "deflate", "842"

*Default:* `"zstd"`

*Declared by:* [`nixos/modules/system/boot/zswap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/zswap.nix)

## `boot.zswap.enable` {#opt-boot.zswap.enable}

Whether to enable Zswap (Compressed Cache for Swap Pages).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/zswap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/zswap.nix)

## `boot.zswap.maxPoolPercent` {#opt-boot.zswap.maxPoolPercent}

The maximum percentage of system memory that Zswap can occupy (1-100).

Higher values provide more compression cache but increase memory pressure.
Default is 25% (higher than kernel default of 20%) for better Nix build performance.

Recommended ranges:

- Desktop systems: 15-25%
- Low-memory systems: 30-50%
- Server systems: 10-20%

*Type:* integer between 1 and 100 (both inclusive)

*Default:* `25`

*Declared by:* [`nixos/modules/system/boot/zswap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/zswap.nix)

## `boot.zswap.shrinkerEnabled` {#opt-boot.zswap.shrinkerEnabled}

Enable the zswap shrinker to reclaim memory when under pressure.

When enabled, the shrinker will automatically reclaim compressed pages
from the zswap pool when the system is under memory pressure, helping
to prevent out-of-memory situations.

It is recommended to keep this enabled for most workloads, especially
on systems with limited memory.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/boot/zswap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/zswap.nix)

## `boot.zswap.zpool` {#opt-boot.zswap.zpool}

Kernel zpool allocator.
'zsmalloc' is strongly recommended for kernels \>= 6.3 as it offers the best density.
For older kernels, 'zbud' is the fallback.

Note: 'zbud' and 'z3fold' were removed from Linux kernel 6.15 and later.

*Type:* one of "zsmalloc", "zbud", "z3fold"

*Default:* `if kernel >= 6.3 then "zsmalloc" else "zbud"`

*Declared by:* [`nixos/modules/system/boot/zswap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/zswap.nix)
