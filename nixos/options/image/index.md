# image {#sec-options-image}

## `image.baseName` {#opt-image.baseName}

Basename of the image filename without any extension (e.g. `image_1`).

*Type:* string

*Default:* `nixos-image-${config.system.nixos.label}-${pkgs.stdenv.hostPlatform.system}`

*Declared by:* [`nixos/modules/image/file-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/file-options.nix)

## `image.extension` {#opt-image.extension}

Extension of the image filename (e.g. `raw`).

*Type:* string

*Declared by:* [`nixos/modules/image/file-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/file-options.nix)

## `image.fileName` {#opt-image.fileName}

Filename of the image including all extensions (e.g `image_1.raw` or
`image_1.raw.zst`).

*Type:* string

*Default:* `${config.image.baseName}.${config.image.extension}`

*Declared by:* [`nixos/modules/image/file-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/file-options.nix)

## `image.filePath` {#opt-image.filePath}

Path of the image, relative to `$out` in `system.build.image`.
While it defaults to `config.image.fileName`, it can be different for builders where
the image is in sub directory, such as `iso`, `sd-card` or `kexec` images.

*Type:* string

*Default:* `config.image.fileName`

*Declared by:* [`nixos/modules/image/file-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/file-options.nix)

## `image.modules` {#opt-image.modules}

image-specific NixOS Modules used for `system.build.images`.

*Type:* attribute set of module

*Declared by:* [`nixos/modules/image/images.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/images.nix)

## `image.repart.compression.algorithm` {#opt-image.repart.compression.algorithm}

Compression algorithm

*Type:* one of "zstd", "xz", "zstd-seekable"

*Default:* `"zstd"`

*Declared by:* [`nixos/modules/image/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart.nix)

## `image.repart.compression.enable` {#opt-image.repart.compression.enable}

Whether to enable Image compression.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/image/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart.nix)

## `image.repart.compression.level` {#opt-image.repart.compression.level}

Compression level. The available range depends on the used algorithm.

*Type:* signed integer

*Declared by:* [`nixos/modules/image/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart.nix)

## `image.repart.enable` {#opt-image.repart.enable}

Whether to enable systemd-repart boot image.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/image/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart.nix)

## `image.repart.imageSize` {#opt-image.repart.imageSize}

Size of the produced image in bytes with optional K, M, G, T suffix,
or 'auto' to determine the minimal size automatically

*Type:* string matching the pattern ^(\[0-9\]+\[KMGTP\]?|auto)$

*Default:* `"auto"`

*Example:* `"512G"`

*Declared by:* [`nixos/modules/image/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart.nix)

## `image.repart.mkfsOptions` {#opt-image.repart.mkfsOptions}

Specify extra options for created file systems. The specified options
are converted to individual environment variables of the format
`SYSTEMD_REPART_MKFS_OPTIONS_<FSTYPE>`.

See [upstream systemd documentation](https://github.com/systemd/systemd/blob/v255/docs/ENVIRONMENT.md?plain=1#L575-L577)
for information about the usage of these environment variables.

The example would produce the following environment variable:

```
SYSTEMD_REPART_MKFS_OPTIONS_VFAT="-S 512 -c"
```

*Type:* attribute set of list of string

*Default:* `{ }`

*Example:*

``` nix
{
  vfat = [ "-S 512" "-c" ];
}
```

*Declared by:* [`nixos/modules/image/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart.nix)

## `image.repart.name` {#opt-image.repart.name}

Name of the image.

If this option is unset but config.system.image.id is set,
config.system.image.id is used as the default value.

*Type:* string

*Declared by:* [`nixos/modules/image/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart.nix)

## `image.repart.package` {#opt-image.repart.package}

The systemd-repart package to use.

*Type:* package

*Default:* `pkgs.buildPackages.systemd`

*Example:* `pkgs.buildPackages.systemdMinimal.override { withCryptsetup = true; }`

*Declared by:* [`nixos/modules/image/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart.nix)

## `image.repart.partitions` {#opt-image.repart.partitions}

Specify partitions as a set of the names of the partitions with their
configuration as the key.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "10-esp" = {
    contents = {
      "/EFI/BOOT/BOOTX64.EFI".source =
        "${config.systemd.package}/lib/systemd/boot/efi/systemd-bootx64.efi";
    };
    repartConfig = {
      Type = "esp";
      Format = "vfat";
    };
  };
  "20-root" = {
    storePaths = [ config.system.build.toplevel ];
    repartConfig = {
      Type = "root";
      Format = "ext4";
      Minimize = "guess";
    };
  };
};
```

*Declared by:* [`nixos/modules/image/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart.nix)

## `image.repart.partitions.<name>.contents` {#opt-image.repart.partitions._name_.contents}

The contents to end up in the filesystem image.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "/EFI/BOOT/BOOTX64.EFI".source =
    "${config.systemd.package}/lib/systemd/boot/efi/systemd-bootx64.efi";

  "/loader/entries/nixos.conf".source = systemdBootEntry;
}
```

*Declared by:* [`nixos/modules/image/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart.nix)

## `image.repart.partitions.<name>.contents.<name>.source` {#opt-image.repart.partitions._name_.contents._name_.source}

Path of the source file.

*Type:* absolute path

*Declared by:* [`nixos/modules/image/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart.nix)

## `image.repart.partitions.<name>.nixStorePrefix` {#opt-image.repart.partitions._name_.nixStorePrefix}

The prefix to use for store paths. Defaults to `/nix/store`. This is
useful when you want to build a partition that only contains store
paths and is mounted under `/nix/store` or if you want to create the
store paths below a parent path (e.g., `/@nix/nix/store`).

*Type:* absolute path

*Default:* `"/nix/store"`

*Declared by:* [`nixos/modules/image/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart.nix)

## `image.repart.partitions.<name>.repartConfig` {#opt-image.repart.partitions._name_.repartConfig}

Specify the repart options for a partition as a structural setting.
See `repart.d(5)`
for all available options.

*Type:* attribute set of (string or signed integer or boolean or list of string)

*Default:* `{ }`

*Example:*

``` nix
{
  SizeMaxBytes = "2G";
  SizeMinBytes = "512M";
  Type = "home";
}
```

*Declared by:* [`nixos/modules/image/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart.nix)

## `image.repart.partitions.<name>.storePaths` {#opt-image.repart.partitions._name_.storePaths}

The store paths to include in the partition.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/image/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart.nix)

## `image.repart.sectorSize` {#opt-image.repart.sectorSize}

The sector size of the disk image produced by systemd-repart. This
value must be a power of 2 between 512 and 4096.

*Type:* null or signed integer

*Default:* `512`

*Example:* `4096`

*Declared by:* [`nixos/modules/image/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart.nix)

## `image.repart.seed` {#opt-image.repart.seed}

A UUID to use as a seed. You can set this to `random` to explicitly
randomize the partition UUIDs.
See `systemd-repart(8)` for more information.

*Type:* null or string

*Default:* `"0867da16-f251-457d-a9e8-c31f9a3c220b"`

*Declared by:* [`nixos/modules/image/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart.nix)

## `image.repart.split` {#opt-image.repart.split}

Enables generation of split artifacts from partitions. If enabled, for
each partition with SplitName= set, a separate output file containing
just the contents of that partition is generated.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/image/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart.nix)

## `image.repart.verityStore.enable` {#opt-image.repart.verityStore.enable}

Whether to enable building images with a dm-verity protected nix store.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/image/repart-verity-store.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart-verity-store.nix)

## `image.repart.verityStore.partitionIds.esp` {#opt-image.repart.verityStore.partitionIds.esp}

Specify the attribute name of the ESP.

*Type:* string

*Default:* `"00-esp"`

*Declared by:* [`nixos/modules/image/repart-verity-store.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart-verity-store.nix)

## `image.repart.verityStore.partitionIds.store` {#opt-image.repart.verityStore.partitionIds.store}

Specify the attribute name of the store partition.

*Type:* string

*Default:* `"20-store"`

*Declared by:* [`nixos/modules/image/repart-verity-store.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart-verity-store.nix)

## `image.repart.verityStore.partitionIds.store-verity` {#opt-image.repart.verityStore.partitionIds.store-verity}

Specify the attribute name of the store's dm-verity hash partition.

*Type:* string

*Default:* `"10-store-verity"`

*Declared by:* [`nixos/modules/image/repart-verity-store.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart-verity-store.nix)

## `image.repart.verityStore.ukiPath` {#opt-image.repart.verityStore.ukiPath}

Specify the location on the ESP where the UKI is placed.

*Type:* string

*Default:* `"/EFI/Linux/\${config.system.boot.loader.ukiFile}"`

*Declared by:* [`nixos/modules/image/repart-verity-store.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart-verity-store.nix)

## `image.repart.version` {#opt-image.repart.version}

Version of the image

*Type:* null or string

*Default:* `config.system.image.version`

*Declared by:* [`nixos/modules/image/repart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart.nix)
