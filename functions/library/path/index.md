# `lib.path`: path functions {#sec-functions-library-path}

## `lib.path.append` {#function-library-lib.path.append}

Append a subpath string to a path.

Like `path + ("/" + string)` but safer, because it errors instead of returning potentially surprising results.
More specifically, it checks that the first argument is a [path value type](https://nixos.org/manual/nix/stable/language/values.html#type-path"),
and that the second argument is a [valid subpath string](#function-library-lib.path.subpath.isValid).

Laws:

- Not influenced by subpath [normalisation](#function-library-lib.path.subpath.normalise):

      append p s == append p (subpath.normalise s)

### Inputs

`path`
: The absolute path to append to

`subpath`
: The subpath string to append

### Type

```
append :: Path -> String -> Path
```

### Examples

::: example
#### `append` usage example

``` nix
append /foo "bar/baz"
=> /foo/bar/baz

# subpaths don't need to be normalised
append /foo "./bar//baz/./"
=> /foo/bar/baz

# can append to root directory
append /. "foo/bar"
=> /foo/bar

# first argument needs to be a path value type
append "/foo" "bar"
=> <error>

# second argument needs to be a valid subpath string
append /foo /bar
=> <error>
append /foo ""
=> <error>
append /foo "/bar"
=> <error>
append /foo "../bar"
=> <error>
```
:::

## `lib.path.hasPrefix` {#function-library-lib.path.hasPrefix}

Whether the first path is a component-wise prefix of the second path.

Laws:

- `hasPrefix p q` is only true if [`q == append p s`](#function-library-lib.path.append) for some [subpath](#function-library-lib.path.subpath.isValid) `s`.

- `hasPrefix` is a [non-strict partial order](https://en.wikipedia.org/wiki/Partially_ordered_set#Non-strict_partial_order) over the set of all path values.

### Inputs

`path1`
: 1. Function argument

### Type

```
hasPrefix :: Path -> Path -> Bool
```

### Examples

::: example
#### `hasPrefix` usage example

``` nix
hasPrefix /foo /foo/bar
=> true
hasPrefix /foo /foo
=> true
hasPrefix /foo/bar /foo
=> false
hasPrefix /. /foo
=> true
```
:::

## `lib.path.hasStorePathPrefix` {#function-library-lib.path.hasStorePathPrefix}

Whether a [path](https://nixos.org/manual/nix/stable/language/values.html#type-path)
has a [store path](https://nixos.org/manual/nix/stable/store/store-path.html#store-path)
as a prefix.

::: note
As with all functions of this `lib.path` library, it does not work on paths in strings,
which is how you'd typically get store paths.

Instead, this function only handles path values themselves,
which occur when Nix files in the store use relative path expressions.
:::

### Inputs

`path`
: 1. Function argument

### Type

```
hasStorePathPrefix :: Path -> Bool
```

### Examples

::: example
#### `hasStorePathPrefix` usage example

``` nix
# Subpaths of derivation outputs have a store path as a prefix
hasStorePathPrefix /nix/store/nvl9ic0pj1fpyln3zaqrf4cclbqdfn1j-foo/bar/baz
=> true

# The store directory itself is not a store path
hasStorePathPrefix /nix/store
=> false

# Derivation outputs are store paths themselves
hasStorePathPrefix /nix/store/nvl9ic0pj1fpyln3zaqrf4cclbqdfn1j-foo
=> true

# Paths outside the Nix store don't have a store path prefix
hasStorePathPrefix /home/user
=> false

# Not all paths under the Nix store are store paths
hasStorePathPrefix /nix/store/.links/10gg8k3rmbw8p7gszarbk7qyd9jwxhcfq9i6s5i0qikx8alkk4hq
=> false

# Store derivations are also store paths themselves
hasStorePathPrefix /nix/store/nvl9ic0pj1fpyln3zaqrf4cclbqdfn1j-foo.drv
=> true
```
:::

## `lib.path.removePrefix` {#function-library-lib.path.removePrefix}

Remove the first path as a component-wise prefix from the second path.
The result is a [normalised subpath string](#function-library-lib.path.subpath.normalise).

Laws:

- Inverts [`append`](#function-library-lib.path.append) for [normalised subpath string](#function-library-lib.path.subpath.normalise):

      removePrefix p (append p s) == subpath.normalise s

### Inputs

`path1`
: 1. Function argument

### Type

```
removePrefix :: Path -> Path -> String
```

### Examples

::: example
#### `removePrefix` usage example

``` nix
removePrefix /foo /foo/bar/baz
=> "./bar/baz"
removePrefix /foo /foo
=> "./."
removePrefix /foo/bar /foo
=> <error>
removePrefix /. /foo
=> "./foo"
```
:::

## `lib.path.splitRoot` {#function-library-lib.path.splitRoot}

Split the filesystem root from a [path](https://nixos.org/manual/nix/stable/language/values.html#type-path).
The result is an attribute set with these attributes:

- `root`: The filesystem root of the path, meaning that this directory has no parent directory.
- `subpath`: The [normalised subpath string](#function-library-lib.path.subpath.normalise) that when [appended](#function-library-lib.path.append) to `root` returns the original path.

Laws:

- [Appending](#function-library-lib.path.append) the `root` and `subpath` gives the original path:

      p ==
        append
          (splitRoot p).root
          (splitRoot p).subpath

- Trying to get the parent directory of `root` using [`dirOf`](https://nixos.org/manual/nix/stable/language/builtins.html#builtins-dirOf) returns `root` itself:

      dirOf (splitRoot p).root == (splitRoot p).root

### Inputs

`path`
: The path to split the root off of

### Type

```
splitRoot :: Path -> { root :: Path; subpath :: String; }
```

### Examples

::: example
#### `splitRoot` usage example

``` nix
splitRoot /foo/bar
=> { root = /.; subpath = "./foo/bar"; }

splitRoot /.
=> { root = /.; subpath = "./."; }

# Nix neutralises `..` path components for all path values automatically
splitRoot /foo/../bar
=> { root = /.; subpath = "./bar"; }

splitRoot "/foo/bar"
=> <error>
```
:::

## `lib.path.subpath.components` {#function-library-lib.path.subpath.components}

Split [a subpath](#function-library-lib.path.subpath.isValid) into its path component strings.
Throw an error if the subpath isn't valid.
Note that the returned path components are also [valid subpath strings](#function-library-lib.path.subpath.isValid), though they are intentionally not [normalised](#function-library-lib.path.subpath.normalise).

Laws:

- Splitting a subpath into components and [joining](#function-library-lib.path.subpath.join) the components gives the same subpath but [normalised](#function-library-lib.path.subpath.normalise):

      subpath.join (subpath.components s) == subpath.normalise s

### Inputs

`subpath`
: The subpath string to split into components

### Type

```
subpath.components :: String -> [String]
```

### Examples

::: example
#### `subpath.components` usage example

``` nix
subpath.components "."
=> [ ]

subpath.components "./foo//bar/./baz/"
=> [ "foo" "bar" "baz" ]

subpath.components "/foo"
=> <error>
```
:::

## `lib.path.subpath.isValid` {#function-library-lib.path.subpath.isValid}

Whether a value is a valid subpath string.

A subpath string points to a specific file or directory within an absolute base directory.
It is a stricter form of a relative path that excludes `..` components, since those could escape the base directory.

- The value is a string.

- The string is not empty.

- The string doesn't start with a `/`.

- The string doesn't contain any `..` path components.

### Inputs

`value`
: The value to check

### Type

```
subpath.isValid :: String -> Bool
```

### Examples

::: example
#### `subpath.isValid` usage example

``` nix
# Not a string
subpath.isValid null
=> false

# Empty string
subpath.isValid ""
=> false

# Absolute path
subpath.isValid "/foo"
=> false

# Contains a `..` path component
subpath.isValid "../foo"
=> false

# Valid subpath
subpath.isValid "foo/bar"
=> true

# Doesn't need to be normalised
subpath.isValid "./foo//bar/"
=> true
```
:::

## `lib.path.subpath.join` {#function-library-lib.path.subpath.join}

Join subpath strings together using `/`, returning a normalised subpath string.

Like `concatStringsSep "/"` but safer, specifically:

- All elements must be [valid subpath strings](#function-library-lib.path.subpath.isValid).

- The result gets [normalised](#function-library-lib.path.subpath.normalise).

- The edge case of an empty list gets properly handled by returning the neutral subpath `"./."`.

Laws:

- Associativity:

      subpath.join [ x (subpath.join [ y z ]) ] == subpath.join [ (subpath.join [ x y ]) z ]

- Identity - `"./."` is the neutral element for normalised paths:

      subpath.join [ ] == "./."
      subpath.join [ (subpath.normalise p) "./." ] == subpath.normalise p
      subpath.join [ "./." (subpath.normalise p) ] == subpath.normalise p

- Normalisation - the result is [normalised](#function-library-lib.path.subpath.normalise):

      subpath.join ps == subpath.normalise (subpath.join ps)

- For non-empty lists, the implementation is equivalent to [normalising](#function-library-lib.path.subpath.normalise) the result of `concatStringsSep "/"`.
  Note that the above laws can be derived from this one:

      ps != [] -> subpath.join ps == subpath.normalise (concatStringsSep "/" ps)

### Inputs

`subpaths`
: The list of subpaths to join together

### Type

```
subpath.join :: [String] -> String
```

### Examples

::: example
#### `subpath.join` usage example

``` nix
subpath.join [ "foo" "bar/baz" ]
=> "./foo/bar/baz"

# normalise the result
subpath.join [ "./foo" "." "bar//./baz/" ]
=> "./foo/bar/baz"

# passing an empty list results in the current directory
subpath.join [ ]
=> "./."

# elements must be valid subpath strings
subpath.join [ /foo ]
=> <error>
subpath.join [ "" ]
=> <error>
subpath.join [ "/foo" ]
=> <error>
subpath.join [ "../foo" ]
=> <error>
```
:::

## `lib.path.subpath.normalise` {#function-library-lib.path.subpath.normalise}

Normalise a subpath. Throw an error if the subpath isn't [valid](#function-library-lib.path.subpath.isValid).

- Limit repeating `/` to a single one.

- Remove redundant `.` components.

- Remove trailing `/` and `/.`.

- Add leading `./`.

Laws:

- Idempotency - normalising multiple times gives the same result:

      subpath.normalise (subpath.normalise p) == subpath.normalise p

- Uniqueness - there's only a single normalisation for the paths that lead to the same file system node:

      subpath.normalise p != subpath.normalise q -> $(realpath ${p}) != $(realpath ${q})

- Don't change the result when [appended](#function-library-lib.path.append) to a Nix path value:

      append base p == append base (subpath.normalise p)

- Don't change the path according to `realpath`:

      $(realpath ${p}) == $(realpath ${subpath.normalise p})

- Only error on [invalid subpaths](#function-library-lib.path.subpath.isValid):

      builtins.tryEval (subpath.normalise p)).success == subpath.isValid p

### Inputs

`subpath`
: The subpath string to normalise

### Type

```
subpath.normalise :: String -> String
```

### Examples

::: example
#### `subpath.normalise` usage example

``` nix
# limit repeating `/` to a single one
subpath.normalise "foo//bar"
=> "./foo/bar"

# remove redundant `.` components
subpath.normalise "foo/./bar"
=> "./foo/bar"

# add leading `./`
subpath.normalise "foo/bar"
=> "./foo/bar"

# remove trailing `/`
subpath.normalise "foo/bar/"
=> "./foo/bar"

# remove trailing `/.`
subpath.normalise "foo/bar/."
=> "./foo/bar"

# Return the current directory as `./.`
subpath.normalise "."
=> "./."

# error on `..` path components
subpath.normalise "foo/../bar"
=> <error>

# error on empty string
subpath.normalise ""
=> <error>

# error on absolute path
subpath.normalise "/foo"
=> <error>
```
:::
