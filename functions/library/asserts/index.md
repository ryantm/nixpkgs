# `lib.asserts`: assertion functions {#sec-functions-library-asserts}

## `lib.asserts.assertEachOneOf` {#function-library-lib.asserts.assertEachOneOf}

Specialized `assertMsg` for checking if every one of `vals` is one of the elements
of the list `xs`. Useful for checking lists of supported attributes.

### Inputs

`name`
: The name of the variable the user entered `val` into, for inclusion in the error message

`vals`
: The list of values of what the user provided, to be compared against the values in `xs`

`xs`
: The list of valid values

### Type

```
assertEachOneOf :: String -> [ComparableVal] -> [ComparableVal] -> Bool
```

### Examples

::: example
#### `lib.asserts.assertEachOneOf` usage example

``` nix
let sslLibraries = [ "libressl" "bearssl" ];
in assertEachOneOf "sslLibraries" sslLibraries [ "openssl" "bearssl" ]
stderr> error: each element in sslLibraries must be one of [
stderr>   "openssl"
stderr>   "bearssl"
stderr> ], but is: [
stderr>   "libressl"
stderr>   "bearssl"
stderr> ]
```
:::

## `lib.asserts.assertMsg` {#function-library-lib.asserts.assertMsg}

Throw if `pred` is false, else return `pred`.
Intended to be used to augment asserts with helpful error messages.

### Inputs

`pred`
: Predicate that needs to succeed, otherwise `msg` is thrown

`msg`
: Message to throw in case `pred` fails

### Type

```
assertMsg :: Bool -> String -> Bool
```

### Examples

::: example
#### `lib.asserts.assertMsg` usage example

``` nix
assertMsg false "nope"
stderr> error: nope
assert assertMsg ("foo" == "bar") "foo is not bar, silly"; ""
stderr> error: foo is not bar, silly
```
:::

## `lib.asserts.assertOneOf` {#function-library-lib.asserts.assertOneOf}

Specialized `assertMsg` for checking if `val` is one of the elements
of the list `xs`. Useful for checking enums.

### Inputs

`name`
: The name of the variable the user entered `val` into, for inclusion in the error message

`val`
: The value of what the user provided, to be compared against the values in `xs`

`xs`
: The list of valid values

### Type

```
assertOneOf :: String -> ComparableVal -> [ComparableVal] -> Bool
```

### Examples

::: example
#### `lib.asserts.assertOneOf` usage example

``` nix
let sslLibrary = "libressl";
in assertOneOf "sslLibrary" sslLibrary [ "openssl" "bearssl" ]
stderr> error: sslLibrary must be one of [
stderr>   "openssl"
stderr>   "bearssl"
stderr> ], but is: "libressl"
```
:::

## `lib.asserts.checkAssertWarn` {#function-library-lib.asserts.checkAssertWarn}

Wrap a value with logic that throws an error when assertions
fail and emits any warnings.

### Inputs

`assertions`
: A list of assertions. If any of their `assertion` attrs is `false`, their `message` attrs will be emitted in a `throw`.

`warnings`
: A list of strings to emit as warnings. This function does no filtering on this list.

`val`
: A value to return, wrapped in `warn`, if a `throw` is not necessary.

### Type

```
checkAssertWarn :: [{ assertion :: Bool; message :: String; }] -> [String] -> a -> a
```

### Examples

::: example
#### `lib.asserts.checkAssertWarn` usage example

``` nix
checkAssertWarn
  [ { assertion = false; message = "Will fail"; } ]
  [ ]
  null
stderr>        error:
stderr>        Failed assertions:
stderr>        - Will fail

checkAssertWarn
  [ { assertion = true; message = "Will not fail"; } ]
  [ "Will warn" ]
  null
stderr> evaluation warning: Will warn
null
```
:::
