# Functions Reference {#sec-functions-library-treefmt}

## `pkgs.treefmt.evalConfig` {#pkgs.treefmt.evalConfig}

Evaluate a treefmt configuration.

### Type

```
Module -> Configuration
```

### Inputs

`module`
: A treefmt module. See [options reference](../../packages/treefmt/index.md#sec-treefmt-options-reference).

Located at [pkgs/by-name/tr/treefmt/lib.nix:21](https://github.com/NixOS/nixpkgs/blob/4b21f501e3aaf0ee5f513e194a23d27627273458/pkgs/by-name/tr/treefmt/lib.nix#L21) in `<nixpkgs>`.

## `pkgs.treefmt.withConfig` {#pkgs.treefmt.withConfig}

Wrap treefmt, configured using structured settings.

### Check

The resulting package has a `check` attribute of type `Path -> Derivation`.
The derivation returned will only build if the path supplied is already formatted correctly.

```
{ pkgs }:
let
  myTreefmt = pkgs.treefmt.withConfig ./treefmt-config.nix;
  project = ../.;
in
myTreefmt.check project
```

### Type

```
Module -> Derivation
```

### Inputs

`module`
: A treefmt module. See [options reference](../../packages/treefmt/index.md#sec-treefmt-options-reference).

Located at [pkgs/by-name/tr/treefmt/lib.nix:68](https://github.com/NixOS/nixpkgs/blob/4b21f501e3aaf0ee5f513e194a23d27627273458/pkgs/by-name/tr/treefmt/lib.nix#L68) in `<nixpkgs>`.

## `pkgs.treefmt.buildConfig` {#pkgs.treefmt.buildConfig}

Build a treefmt config file from structured settings.

### Type

```
Module -> Derivation
```

### Inputs

`settings`
: A settings module, used to build a treefmt config file.
See [`settings` option reference](#opt-treefmt-settings).

Located at [pkgs/by-name/tr/treefmt/lib.nix:93](https://github.com/NixOS/nixpkgs/blob/4b21f501e3aaf0ee5f513e194a23d27627273458/pkgs/by-name/tr/treefmt/lib.nix#L93) in `<nixpkgs>`.
