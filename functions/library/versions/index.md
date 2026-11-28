# `lib.versions`: version string functions {#sec-functions-library-versions}

## `lib.versions.major` {#function-library-lib.versions.major}

Get the major version string from a string.

### Inputs

`v`
: 1. Function argument

### Type

```
major :: String -> String
```

### Examples

::: example
#### `major` usage example

``` nix
major "1.2.3"
=> "1"
```
:::

## `lib.versions.majorMinor` {#function-library-lib.versions.majorMinor}

Get string of the first two parts (major and minor)
of a version string.

### Inputs

`v`
: 1. Function argument

### Type

```
majorMinor :: String -> String
```

### Examples

::: example
#### `majorMinor` usage example

``` nix
majorMinor "1.2.3"
=> "1.2"
```
:::

## `lib.versions.minor` {#function-library-lib.versions.minor}

Get the minor version string from a string.

### Inputs

`v`
: 1. Function argument

### Type

```
minor :: String -> String
```

### Examples

::: example
#### `minor` usage example

``` nix
minor "1.2.3"
=> "2"
```
:::

## `lib.versions.pad` {#function-library-lib.versions.pad}

Pad a version string with zeros to match the given number of components.

### Inputs

`n`
: 1. Function argument

`version`
: 2. Function argument

### Type

```
pad :: Int -> String -> String
```

### Examples

::: example
#### `pad` usage example

``` nix
pad 3 "1.2"
=> "1.2.0"
pad 3 "1.3-rc1"
=> "1.3.0-rc1"
pad 3 "1.2.3.4"
=> "1.2.3"
```
:::

## `lib.versions.patch` {#function-library-lib.versions.patch}

Get the patch version string from a string.

### Inputs

`v`
: 1. Function argument

### Type

```
patch :: String -> String
```

### Examples

::: example
#### `patch` usage example

``` nix
patch "1.2.3"
=> "3"
```
:::

## `lib.versions.splitVersion` {#function-library-lib.versions.splitVersion}

Break a version string into its component parts.

### Type

```
splitVersion :: String -> [String]
```

### Examples

::: example
#### `splitVersion` usage example

``` nix
splitVersion "1.2.3"
=> ["1" "2" "3"]
```
:::
