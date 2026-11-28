# `lib.trivial`: miscellaneous functions {#sec-functions-library-trivial}

## `lib.trivial."or"` {#function-library-lib.trivial."or"}

boolean “or”

### Inputs

`x`
: 1. Function argument

`y`
: 2. Function argument

### Type

```
or :: Bool -> Bool -> Bool
```

## `lib.trivial.and` {#function-library-lib.trivial.and}

boolean “and”

### Inputs

`x`
: 1. Function argument

`y`
: 2. Function argument

### Type

```
and :: Bool -> Bool -> Bool
```

## `lib.trivial.bitNot` {#function-library-lib.trivial.bitNot}

bitwise “not”

### Type

```
bitNot :: Number -> Number
```

## `lib.trivial.boolToString` {#function-library-lib.trivial.boolToString}

Convert a boolean to a string.

This function uses the strings "true" and "false" to represent
boolean values. Calling `toString` on a bool instead returns "1"
and "" (sic!).

### Inputs

`b`
: 1. Function argument

### Type

```
boolToString :: Bool -> String
```

## `lib.trivial.boolToYesNo` {#function-library-lib.trivial.boolToYesNo}

Converts a boolean to a string.

This function uses the strings "yes" and "no" to represent
boolean values.

### Inputs

`b`
: The boolean to convert

### Type

```
boolToYesNo :: Bool -> String
```

## `lib.trivial.checkListOfEnum` {#function-library-lib.trivial.checkListOfEnum}

Check if the elements in a list are valid values from a enum, returning the identity function, or throwing an error message otherwise.

### Inputs

`msg`
: 1. Function argument

`valid`
: 2. Function argument

`given`
: 3. Function argument

### Type

```
checkListOfEnum :: String -> [a] -> [a] -> ((b -> b) | Never)
```

### Examples

::: example
#### `lib.trivial.checkListOfEnum` usage example

``` nix
let colorVariants = ["bright" "dark" "black"]
in checkListOfEnum "color variants" [ "standard" "light" "dark" ] colorVariants;
=>
error: color variants: bright, black unexpected; valid ones: standard, light, dark
```
:::

## `lib.trivial.codeName` {#function-library-lib.trivial.codeName}

Returns the current nixpkgs release code name.

On each release the first letter is bumped and a new animal is chosen
starting with that new letter.

## `lib.trivial.compare` {#function-library-lib.trivial.compare}

C-style comparisons

a \< b,  compare a b =\> -1
a == b, compare a b =\> 0
a \> b,  compare a b =\> 1

### Inputs

`a`
: 1. Function argument

`b`
: 2. Function argument

### Type

```
compare :: a -> a -> Int
```

## `lib.trivial.concat` {#function-library-lib.trivial.concat}

Concatenate two lists

### Inputs

`x`
: 1. Function argument

`y`
: 2. Function argument

### Type

```
concat :: [a] -> [a] -> [a]
```

### Examples

::: example
#### `lib.trivial.concat` usage example

``` nix
concat [ 1 2 ] [ 3 4 ]
=> [ 1 2 3 4 ]
```
:::

## `lib.trivial.const` {#function-library-lib.trivial.const}

The constant function

Ignores the second argument. If called with only one argument,
constructs a function that always returns a static value.

### Inputs

`x`
: Value to return

`y`
: Value to ignore

### Type

```
const :: a -> b -> a
```

### Examples

::: example
#### `lib.trivial.const` usage example

``` nix
let f = const 5; in f 10
=> 5
```
:::

## `lib.trivial.defaultTo` {#function-library-lib.trivial.defaultTo}

Returns `maybeValue` if not null, otherwise return `default`.

### Inputs

`default`
: 1. Function argument

`maybeValue`
: 2. Function argument

### Type

```
defaultTo :: a -> (b | Null) -> (b | a)
```

### Examples

::: example
#### `lib.trivial.defaultTo` usage example

``` nix
defaultTo "default" null
=> "default"
defaultTo "default" "foo"
=> "foo"
defaultTo "default" false
=> false
```
:::

## `lib.trivial.flip` {#function-library-lib.trivial.flip}

Flip the order of the arguments of a binary function.

### Inputs

`f`
: 1. Function argument

`a`
: 2. Function argument

`b`
: 3. Function argument

### Type

```
flip :: (a -> b -> c) -> (b -> a -> c)
```

### Examples

::: example
#### `lib.trivial.flip` usage example

``` nix
flip concat [1] [2]
=> [ 2 1 ]
```
:::

## `lib.trivial.fromHexString` {#function-library-lib.trivial.fromHexString}

Convert a hexadecimal string to it's integer representation.

### Type

```
fromHexString :: String -> Int
```

### Examples

::: example
#### `lib.trivial.fromHexString` usage examples

``` nix
fromHexString "FF"
=> 255

fromHexString "0x7fffffffffffffff"
=> 9223372036854775807
```
:::

## `lib.trivial.functionArgs` {#function-library-lib.trivial.functionArgs}

Extract the expected function arguments from a function.
This works both with nix-native `{ a, b ? foo, ... }:` style
functions and functions with args set with `setFunctionArgs`. It
has the same return type and semantics as `builtins.functionArgs`.

### Inputs

`f`
: 1. Function argument

### Type

```
functionArgs : (a -> b) -> { [String] :: Bool }
```

## `lib.trivial.id` {#function-library-lib.trivial.id}

The identity function
For when you need a function that does “nothing”.

### Inputs

`x`
: The value to return

### Type

```
id :: a -> a
```

## `lib.trivial.importJSON` {#function-library-lib.trivial.importJSON}

Reads a JSON file.

### Examples

::: example
#### `lib.trivial.importJSON` usage example

example.json

``` json
{
  "title": "Example JSON",
  "hello": {
    "world": "foo",
    "bar": {
      "foobar": true
    }
  }
}
```

``` nix
importJSON ./example.json
=> {
  title = "Example JSON";
  hello = {
    world = "foo";
    bar = {
      foobar = true;
    };
  };
}
```
:::

### Inputs

`path`
: 1. Function argument

### Type

```
importJSON :: Path -> Any
```

## `lib.trivial.importTOML` {#function-library-lib.trivial.importTOML}

Reads a TOML file.

### Examples

::: example
#### `lib.trivial.importTOML` usage example

example.toml

``` toml
title = "TOML Example"

[hello]
world = "foo"

[hello.bar]
foobar = true
```

``` nix
importTOML ./example.toml
=> {
  title = "TOML Example";
  hello = {
    world = "foo";
    bar = {
      foobar = true;
    };
  };
}
```
:::

### Inputs

`path`
: 1. Function argument

### Type

```
importTOML :: Path -> Any
```

## `lib.trivial.inNixShell` {#function-library-lib.trivial.inNixShell}

Determine whether the function is being called from inside a Nix
shell.

### Type

```
inNixShell :: Bool
```

## `lib.trivial.inPureEvalMode` {#function-library-lib.trivial.inPureEvalMode}

Determine whether the function is being called from inside pure-eval mode
by seeing whether `builtins` contains `currentSystem`. If not, we must be in
pure-eval mode.

### Type

```
inPureEvalMode :: Bool
```

## `lib.trivial.isFunction` {#function-library-lib.trivial.isFunction}

Check whether something is a function or something
annotated with function args.

### Inputs

`f`
: 1. Function argument

### Type

```
isFunction : Any -> Bool
```

## `lib.trivial.isInOldestRelease` {#function-library-lib.trivial.isInOldestRelease}

Whether a feature is supported in all supported releases (at the time of
release branch-off, if applicable). See `oldestSupportedRelease`.

### Inputs

`release`
: Release number of feature introduction as an integer, e.g. 2111 for 21.11.
Set it to the upcoming release, matching the nixpkgs/.version file.

## `lib.trivial.mapNullable` {#function-library-lib.trivial.mapNullable}

Apply function if the supplied argument is non-null.

### Inputs

`f`
: Function to call

`a`
: Argument to check for null before passing it to `f`

### Type

```
mapNullable :: (a -> b) -> (a | Null) -> (b | Null)
```

### Examples

::: example
#### `lib.trivial.mapNullable` usage example

``` nix
mapNullable (x: x+1) null
=> null
mapNullable (x: x+1) 22
=> 23
```
:::

## `lib.trivial.max` {#function-library-lib.trivial.max}

Returns maximum of two numbers.

### Inputs

`x`
: 1. Function argument

`y`
: 2. Function argument

### Type

```
max :: Number -> Number -> Number
```

## `lib.trivial.mergeAttrs` {#function-library-lib.trivial.mergeAttrs}

Merge two attribute sets shallowly, right side trumps left

### Inputs

`x`
: Left attribute set

`y`
: Right attribute set (higher precedence for equal keys)

### Type

```
mergeAttrs :: AttrSet -> AttrSet -> AttrSet
```

### Examples

::: example
#### `lib.trivial.mergeAttrs` usage example

``` nix
mergeAttrs { a = 1; b = 2; } { b = 3; c = 4; }
=> { a = 1; b = 3; c = 4; }
```
:::

## `lib.trivial.min` {#function-library-lib.trivial.min}

Returns minimum of two numbers.

### Inputs

`x`
: 1. Function argument

`y`
: 2. Function argument

### Type

```
min :: Number -> Number -> Number
```

## `lib.trivial.mirrorFunctionArgs` {#function-library-lib.trivial.mirrorFunctionArgs}

`mirrorFunctionArgs f g` creates a new function `g'` with the same behavior as `g` (`g' x == g x`)
but its function arguments mirroring `f` (`lib.functionArgs g' == lib.functionArgs f`).

### Inputs

`f`
: Function to provide the argument metadata

`g`
: Function to set the argument metadata to

### Type

```
mirrorFunctionArgs :: (a -> b) -> (a -> c) -> (a -> c)
```

### Examples

::: example
#### `lib.trivial.mirrorFunctionArgs` usage example

``` nix
addab = {a, b}: a + b
addab { a = 2; b = 4; }
=> 6
lib.functionArgs addab
=> { a = false; b = false; }
addab1 = attrs: addab attrs + 1
addab1 { a = 2; b = 4; }
=> 7
lib.functionArgs addab1
=> { }
addab1' = lib.mirrorFunctionArgs addab addab1
addab1' { a = 2; b = 4; }
=> 7
lib.functionArgs addab1'
=> { a = false; b = false; }
```
:::

## `lib.trivial.mod` {#function-library-lib.trivial.mod}

Integer modulus

### Inputs

`base`
: 1. Function argument

`int`
: 2. Function argument

### Type

```
mod :: Int -> Int -> Int
```

### Examples

::: example
#### `lib.trivial.mod` usage example

``` nix
mod 11 10
=> 1
mod 1 10
=> 1
```
:::

## `lib.trivial.oldestSupportedRelease` {#function-library-lib.trivial.oldestSupportedRelease}

The latest release that is supported, at the time of release branch-off,
if applicable.

Ideally, out-of-tree modules should be able to evaluate cleanly with all
supported Nixpkgs versions (master, release and old release until EOL).
So if possible, deprecation warnings should take effect only when all
out-of-tree expressions/libs/modules can upgrade to the new way without
losing support for supported Nixpkgs versions.

This release number allows deprecation warnings to be implemented such that
they take effect as soon as the oldest release reaches end of life.

## `lib.trivial.oldestSupportedReleaseIsAtLeast` {#function-library-lib.trivial.oldestSupportedReleaseIsAtLeast}

Alias for `isInOldestRelease` introduced in 24.11.
Use `isInOldestRelease` in expressions outside of Nixpkgs for greater compatibility.

## `lib.trivial.pipe` {#function-library-lib.trivial.pipe}

Pipes a value through a list of functions, left to right.

### Inputs

`value`
: Value to start piping.

`fns`
: List of functions to apply sequentially.

### Type

```
pipe :: a -> [(a -> b) (b -> c) ... (x -> y) (y -> z)] -> z
```

### Examples

::: example
#### `lib.trivial.pipe` usage example

``` nix
pipe 2 [
    (x: x + 2)  # 2 + 2 = 4
    (x: x * 2)  # 4 * 2 = 8
  ]
=> 8

# ideal to do text transformations
pipe [ "a/b" "a/c" ] [

  # create the cp command
  (map (file: ''cp "${src}/${file}" $out\n''))

  # concatenate all commands into one string
  lib.concatStrings

  # make that string into a nix derivation
  (pkgs.runCommand "copy-to-out" {})

]
=> <drv which copies all files to $out>

The output type of each function has to be the input type
of the next function, and the last function returns the
final value.
```
:::

## `lib.trivial.release` {#function-library-lib.trivial.release}

Returns the current nixpkgs release number as string.

## `lib.trivial.revisionWithDefault` {#function-library-lib.trivial.revisionWithDefault}

Attempts to return the the current revision of nixpkgs and
returns the supplied default value otherwise.

### Inputs

`default`
: Default value to return if revision can not be determined

### Type

```
revisionWithDefault :: String -> String
```

## `lib.trivial.setFunctionArgs` {#function-library-lib.trivial.setFunctionArgs}

Add metadata about expected function arguments to a function.
The metadata should match the format given by
builtins.functionArgs, i.e. a set from expected argument to a bool
representing whether that argument has a default or not.

This function is necessary because you can't dynamically create a
function of the `{ a, b ? foo, ... }:` format, but some facilities
like `callPackage` expect to be able to query expected arguments.

### Inputs

`f`
: 1. Function argument

`args`
: 2. Function argument

### Type

```
setFunctionArgs : (a -> b) -> { [String] :: Bool } -> (a -> b)
```

## `lib.trivial.splitByAndCompare` {#function-library-lib.trivial.splitByAndCompare}

Split type into two subtypes by predicate `p`, take all elements
of the first subtype to be less than all the elements of the
second subtype, compare elements of a single subtype with `yes`
and `no` respectively.

### Inputs

`p`
: Predicate

`yes`
: Comparison function if predicate holds for both values

`no`
: Comparison function if predicate holds for neither value

`a`
: First value to compare

`b`
: Second value to compare

### Type

```
splitByAndCompare :: (a -> Bool) -> (a -> a -> Int) -> (a -> a -> Int) -> (a -> a -> Int)
```

### Examples

::: example
#### `lib.trivial.splitByAndCompare` usage example

``` nix
let cmp = splitByAndCompare (hasPrefix "foo") compare compare; in

cmp "a" "z" => -1
cmp "fooa" "fooz" => -1

cmp "f" "a" => 1
cmp "fooa" "a" => -1
# while
compare "fooa" "a" => 1
```
:::

## `lib.trivial.throwIf` {#function-library-lib.trivial.throwIf}

Like `throwIfNot`, but negated (throw if the first argument is `true`).

### Inputs

`cond`
: 1. Function argument

`msg`
: 2. Function argument

### Type

```
throwIf :: Bool -> String -> a -> (a | Never)
```

## `lib.trivial.throwIfNot` {#function-library-lib.trivial.throwIfNot}

Like the `assert b; e` expression, but with a custom error message and
without the semicolon.

If true, return the identity function, `r: r`.

If false, throw the error message.

Calls can be juxtaposed using function application, as `(r: r) a = a`, so
`(r: r) (r: r) a = a`, and so forth.

### Inputs

`cond`
: 1. Function argument

`msg`
: 2. Function argument

### Type

```
throwIfNot :: Bool -> String -> a -> (a | Never)
```

### Examples

::: example
#### `lib.trivial.throwIfNot` usage example

``` nix
throwIfNot (lib.isList overlays) "The overlays argument to nixpkgs must be a list."
lib.foldr (x: throwIfNot (lib.isFunction x) "All overlays passed to nixpkgs must be functions.") (r: r) overlays
pkgs
```
:::

## `lib.trivial.toBaseDigits` {#function-library-lib.trivial.toBaseDigits}

`toBaseDigits base i` converts the positive integer `i` to a list of its
digits in the given base.

### Inputs

`base`
: 1. Function argument

`i`
: 2. Function argument

### Type

```
toBaseDigits :: Int -> Int -> [Int]
```

### Examples

::: example
#### `lib.trivial.toBaseDigits`

``` nix
toBaseDigits 10 123 => [ 1 2 3 ]

toBaseDigits 2 6 => [ 1 1 0 ]

toBaseDigits 16 250 => [ 15 10 ]
```
:::

## `lib.trivial.toFunction` {#function-library-lib.trivial.toFunction}

Turns any non-callable values into constant functions.
Returns callable values as is.

### Inputs

`v`
: Any value

### Examples

::: example
#### `lib.trivial.toFunction` usage example

``` nix
nix-repl> lib.toFunction 1 2
1

nix-repl> lib.toFunction (x: x + 1) 2
3
```
:::

## `lib.trivial.toHexString` {#function-library-lib.trivial.toHexString}

Convert the given positive integer to a string of its hexadecimal
representation.

### Type

```
toHexString :: Int -> String
```

### Examples

::: example
#### `lib.trivial.toHexString` usage example

``` nix
toHexString 0 => "0"

toHexString 16 => "10"

toHexString 250 => "FA"
```
:::

## `lib.trivial.version` {#function-library-lib.trivial.version}

Returns the current full nixpkgs version number.

## `lib.trivial.versionSuffix` {#function-library-lib.trivial.versionSuffix}

Returns the current nixpkgs version suffix as string.

## `lib.trivial.warn` {#function-library-lib.trivial.warn}

`warn` *`message`* *`value`*

Print a warning before returning the second argument.

See [`builtins.warn`](https://nix.dev/manual/nix/latest/language/builtins.html#builtins-warn) (Nix \>= 2.23).
On older versions, the Nix 2.23 behavior is emulated with [`builtins.trace`](https://nix.dev/manual/nix/latest/language/builtins.html#builtins-warn), including the [`NIX_ABORT_ON_WARN`](https://nix.dev/manual/nix/latest/command-ref/conf-file#conf-abort-on-warn) behavior, but not the `nix.conf` setting or command line option.

### Inputs

*`message`* (String)
: Warning message to print before evaluating *`value`*.

*`value`* (any value)
: Value to return as-is.

### Type

```
warn :: String -> a -> a
```

## `lib.trivial.warnIf` {#function-library-lib.trivial.warnIf}

`warnIf` *`condition`* *`message`* *`value`*

Like `warn`, but only warn when the first argument is `true`.

### Inputs

*`condition`* (Boolean)
: `true` to trigger the warning before continuing with *`value`*.

*`message`* (String)
: Warning message to print before evaluating

*`value`* (any value)
: Value to return as-is.

### Type

```
warnIf :: Bool -> String -> a -> a
```

## `lib.trivial.warnIfNot` {#function-library-lib.trivial.warnIfNot}

`warnIfNot` *`condition`* *`message`* *`value`*

Like `warnIf`, but negated: warn if the first argument is `false`.

### Inputs

*`condition`*
: `false` to trigger the warning before continuing with `val`.

*`message`*
: Warning message to print before evaluating *`value`*.

*`value`*
: Value to return as-is.

### Type

```
warnIfNot :: Bool -> String -> a -> a
```

## `lib.trivial.xor` {#function-library-lib.trivial.xor}

boolean “exclusive or”

### Inputs

`x`
: 1. Function argument

`y`
: 2. Function argument

### Type

```
xor :: bool -> bool -> bool
```
