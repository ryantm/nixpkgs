# `lib.meta`: functions for derivation metadata {#sec-functions-library-meta}

## `lib.meta.addMetaAttrs` {#function-library-lib.meta.addMetaAttrs}

Add to or override the meta attributes of the given
derivation.

### Inputs

`newAttrs`
: 1. Function argument

`drv`
: 2. Function argument

### Type

```
addMetaAttrs :: AttrSet -> Derivation -> Derivation
```

### Examples

::: example
#### `lib.meta.addMetaAttrs` usage example

``` nix
addMetaAttrs {description = "Bla blah";} somePkg
```
:::

## `lib.meta.appendToName` {#function-library-lib.meta.appendToName}

Append a suffix to the name of a package (before the version
part).

### Inputs

`suffix`
: 1. Function argument

### Type

```
appendToName :: String -> Derivation -> Derivation
```

## `lib.meta.availableOn` {#function-library-lib.meta.availableOn}

Check if a package is available on a given platform.

A package is available on a platform if both

1. One of `meta.platforms` pattern matches the given
   platform, or `meta.platforms` is not present.

2. None of `meta.badPlatforms` pattern matches the given platform.

### Inputs

`platform`
: 1. Function argument

`pkg`
: 2. Function argument

### Examples

::: example
#### `lib.meta.availableOn` usage example

``` nix
lib.meta.availableOn { system = "aarch64-darwin"; } pkg.zsh
=> true
```
:::

## `lib.meta.cpeFullVersionWithVendor` {#function-library-lib.meta.cpeFullVersionWithVendor}

Generate [CPE parts](../../../stdenv/meta/index.md#var-meta-identifiers-cpeParts) from inputs. Copies `vendor` and `version` to the output, and sets `update` to `*`.

### Inputs

`vendor`
: package's vendor

`version`
: package's version

### Type

```
cpeFullVersionWithVendor :: String -> String -> { update :: String; vendor :: String; version :: String; }
```

### Examples

::: example
#### `lib.meta.cpeFullVersionWithVendor` usage example

``` nix
lib.meta.cpeFullVersionWithVendor "gnu" "1.2.3"
=> {
  vendor = "gnu";
  version = "1.2.3";
  update = "*";
}
```
:::

::: example
#### `lib.meta.cpeFullVersionWithVendor` usage in derivations

``` nix
mkDerivation rec {
  version = "1.2.3";
  # ...
  meta = {
    # ...
    identifiers.cpeParts = lib.meta.cpeFullVersionWithVendor "gnu" version;
  };
}
```
:::

## `lib.meta.defaultPriority` {#function-library-lib.meta.defaultPriority}

The default priority of packages in Nix. See `defaultPriority` in [`src/nix/profile.cc`](https://github.com/NixOS/nix/blob/master/src/nix/profile.cc#L47).

## `lib.meta.dontDistribute` {#function-library-lib.meta.dontDistribute}

Disable Hydra builds of given derivation.

### Inputs

`drv`
: 1. Function argument

### Type

```
dontDistribute :: Derivation -> Derivation
```

## `lib.meta.getDarwinApp` {#function-library-lib.meta.getDarwinApp}

Get the path to the main darwin app of a package based on `meta.mainDarwinApp`

### Inputs

`x`
: 1. Function argument

### Type

```
getDarwinApp :: Derivation -> StorePath
```

### Examples

::: example
#### `lib.meta.getDarwinApp` usage example

``` nix
getDarwinApp pkgs.vscodium
=> "/nix/store/0y95mgmlrs8cayv2cnj23xjfljwhlib0-vscodium-1.121.03429/Applications/VSCodium.app"
getDarwinApp pkgs.slack
=> "/nix/store/g52cl8dblki8dr5bkr0vajpkralkmhi0-slack-4.49.89/Applications/Slack.app"
```
:::

## `lib.meta.getDarwinApp'` {#function-library-lib.meta.getDarwinApp-prime}

Get the path of an darwin app for a derivation.

### Inputs

`x`
: 1. Function argument

`y`
: 2. Function argument

### Type

```
getDarwinApp' :: Derivation -> String -> StorePath
```

### Examples

::: example
#### `lib.meta.getDarwinApp'` usage example

``` nix
getDarwinApp' pkgs.linear "Linear.app"
=> "/nix/store/z4vh6ldb2vpspv307q7mk6wazfmh5dic-linear-1.30.2/Applications/Linear.app"
getDarwinApp' pkgs.vscodium "VSCodium.app"
=> "/nix/store/0y95mgmlrs8cayv2cnj23xjfljwhlib0-vscodium-1.121.03429/Applications/VSCodium.app"
```
:::

## `lib.meta.getExe` {#function-library-lib.meta.getExe}

Get the path to the main program of a package based on `meta.mainProgram`

### Inputs

`x`
: 1. Function argument

### Type

```
getExe :: Derivation -> StorePath
```

### Examples

::: example
#### `lib.meta.getExe` usage example

``` nix
getExe pkgs.hello
=> "/nix/store/g124820p9hlv4lj8qplzxw1c44dxaw1k-hello-2.12/bin/hello"
getExe pkgs.mustache-go
=> "/nix/store/am9ml4f4ywvivxnkiaqwr0hyxka1xjsf-mustache-go-1.3.0/bin/mustache"
```
:::

## `lib.meta.getExe'` {#function-library-lib.meta.getExe-prime}

Get the path of a program of a derivation.

### Inputs

`x`
: 1. Function argument

`y`
: 2. Function argument

### Type

```
getExe' :: Derivation -> String -> StorePath
```

### Examples

::: example
#### `lib.meta.getExe'` usage example

``` nix
getExe' pkgs.hello "hello"
=> "/nix/store/g124820p9hlv4lj8qplzxw1c44dxaw1k-hello-2.12/bin/hello"
getExe' pkgs.imagemagick "convert"
=> "/nix/store/5rs48jamq7k6sal98ymj9l4k2bnwq515-imagemagick-7.1.1-15/bin/convert"
```
:::

## `lib.meta.getLicenseFromSpdxId` {#function-library-lib.meta.getLicenseFromSpdxId}

Get the corresponding attribute in lib.licenses from the SPDX ID
or warn and fallback to `{ shortName = <license string>; }`.

For SPDX IDs, see https://spdx.org/licenses.
Note that some SPDX licenses might be missing.

### Type

```
getLicenseFromSpdxId :: String -> {
  deprecated :: Bool;
  free :: Bool;
  fullName :: String;
  redistributable :: Bool;
  shortName :: String;
  spdxId :: String;
  url :: String;
}
```

### Examples

::: example
#### `lib.meta.getLicenseFromSpdxId` usage example

``` nix
lib.getLicenseFromSpdxId "MIT" == lib.licenses.mit
=> true
lib.getLicenseFromSpdxId "mIt" == lib.licenses.mit
=> true
lib.getLicenseFromSpdxId "MY LICENSE"
=> trace: warning: getLicenseFromSpdxId: No license matches the given SPDX ID: MY LICENSE
=> { shortName = "MY LICENSE"; }
```
:::

## `lib.meta.getLicenseFromSpdxIdOr` {#function-library-lib.meta.getLicenseFromSpdxIdOr}

Get the corresponding attribute in lib.licenses from the SPDX ID
or fallback to the given default value.

For SPDX IDs, see https://spdx.org/licenses.
Note that some SPDX licenses might be missing.

### Inputs

`licstr`
: 1. SPDX ID string to find a matching license

`default`
: 2. Fallback value when a match is not found

### Type

```
getLicenseFromSpdxIdOr :: String -> a -> ({
  deprecated :: Bool;
  free :: Bool;
  fullName :: String;
  redistributable :: Bool;
  shortName :: String;
  spdxId :: String;
  url :: String;
} | a)
```

### Examples

::: example
#### `lib.meta.getLicenseFromSpdxIdOr` usage example

``` nix
lib.getLicenseFromSpdxIdOr "MIT" null == lib.licenses.mit
=> true
lib.getLicenseFromSpdxId "mIt" null == lib.licenses.mit
=> true
lib.getLicenseFromSpdxIdOr "MY LICENSE" lib.licenses.free == lib.licenses.free
=> true
lib.getLicenseFromSpdxIdOr "MY LICENSE" null
=> null
lib.getLicenseFromSpdxIdOr "MY LICENSE" (throw "No SPDX ID matches MY LICENSE")
=> error: No SPDX ID matches MY LICENSE
```
:::

## `lib.meta.hiPrio` {#function-library-lib.meta.hiPrio}

Increase the nix-env priority of the package, i.e., this
version/variant of the package will be preferred.

### Inputs

`drv`
: 1. Function argument

### Type

```
hiPrio :: Derivation -> Derivation
```

## `lib.meta.hiPrioSet` {#function-library-lib.meta.hiPrioSet}

Apply `hiPrio` to an attrset with derivations.

### Inputs

`set`
: 1. Function argument

### Type

```
hiPrioSet :: { [String] :: Derivation } -> { [String] :: Derivation }
```

## `lib.meta.licensesSpdx` {#function-library-lib.meta.licensesSpdx}

Mapping of SPDX ID to the attributes in lib.licenses.

For SPDX IDs, see https://spdx.org/licenses.
Note that some SPDX licenses might be missing.

### Examples

::: example
#### `lib.meta.licensesSpdx` usage example

``` nix
lib.licensesSpdx.MIT == lib.licenses.mit
=> true
lib.licensesSpdx."MY LICENSE"
=> error: attribute 'MY LICENSE' missing
```
:::

## `lib.meta.lowPrio` {#function-library-lib.meta.lowPrio}

Decrease the nix-env priority of the package, i.e., other
versions/variants of the package will be preferred.

### Inputs

`drv`
: 1. Function argument

### Type

```
lowPrio :: Derivation -> Derivation
```

## `lib.meta.lowPrioSet` {#function-library-lib.meta.lowPrioSet}

Apply `lowPrio` to an attrset with derivations.

### Inputs

`set`
: 1. Function argument

### Type

```
lowPrioSet :: { [String] :: Derivation } -> { [String] :: Derivation }
```

## `lib.meta.mapDerivationAttrset` {#function-library-lib.meta.mapDerivationAttrset}

Apply a function to each derivation and only to derivations in an attrset.

### Inputs

`f`
: 1. Function argument

`set`
: 2. Function argument

### Type

```
mapDerivationAttrset :: (Derivation -> a) -> AttrSet -> AttrSet
```

## `lib.meta.platformMatch` {#function-library-lib.meta.platformMatch}

Check to see if a platform is matched by the given `meta.platforms`
element.

A `meta.platform` pattern is either

1. (legacy) a system string.

2. (modern) a pattern for the entire platform structure (see `lib.systems.inspect.platformPatterns`).

3. (modern) a pattern for the platform `parsed` field (see `lib.systems.inspect.patterns`).

We can inject these into a pattern for the whole of a structured platform,
and then match that.

### Inputs

`platform`
: 1. Function argument

`elem`
: 2. Function argument

### Examples

::: example
#### `lib.meta.platformMatch` usage example

``` nix
lib.meta.platformMatch { system = "aarch64-darwin"; } "aarch64-darwin"
=> true
```
:::

## `lib.meta.setName` {#function-library-lib.meta.setName}

Change the [symbolic name of a derivation](https://nixos.org/manual/nix/stable/language/derivations.html#attr-name).

::: warning
Dependent derivations will be rebuilt when the symbolic name is changed.
:::

### Inputs

`name`
: 1. Function argument

`drv`
: 2. Function argument

### Type

```
setName :: String -> Derivation -> Derivation
```

## `lib.meta.setPrio` {#function-library-lib.meta.setPrio}

Set the nix-env priority of the package. Note that higher values are lower priority, and vice versa.

### Inputs

`priority`
: 1. The priority to set.

`drv`
: 2. Function argument

### Type

```
setPrio :: Int -> Derivation -> Derivation
```

## `lib.meta.updateName` {#function-library-lib.meta.updateName}

Like `setName`, but takes the previous name as an argument.

### Inputs

`updater`
: 1. Function argument

`drv`
: 2. Function argument

### Type

```
updateName :: (String -> String) -> Derivation -> Derivation
```

### Examples

::: example
#### `lib.meta.updateName` usage example

``` nix
updateName (oldName: oldName + "-experimental") somePkg
```
:::
