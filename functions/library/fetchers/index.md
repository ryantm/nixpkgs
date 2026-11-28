# `lib.fetchers`: functions which can be reused across fetchers {#sec-functions-library-fetchers}

## `lib.fetchers.normalizeHash` {#function-library-lib.fetchers.normalizeHash}

Converts an attrset containing one of `hash`, `sha256` or `sha512`,
into one containing `outputHash{,Algo}` as accepted by `mkDerivation`.

An appropriate “fake hash” is substituted when the hash value is `""`,
as is the [convention for fetchers](../../../build-helpers/fetchers/index.md#sec-pkgs-fetchers-updating-source-hashes-fakehash-method).

All other attributes in the set remain as-is.

### Type

```
normalizeHash :: { hashTypes :: [String]; required :: Bool; } -> AttrSet -> AttrSet
```

### Arguments

hashTypes
: the set of attribute names accepted as hash inputs, in addition to `hash`

required
: whether to throw if no hash was present in the input; otherwise returns the original input, unmodified

### Example

::: example
#### `lib.fetchers.normalizeHash` usage example

``` nix
normalizeHash { } { hash = ""; foo = "bar"; }
=>
{
  outputHash = lib.fakeHash;
  outputHashAlgo = null;
  foo = "bar";
}
```

``` nix
normalizeHash { } { sha256 = lib.fakeSha256; }
=>
{
  outputHash = lib.fakeSha256;
  outputHashAlgo = "sha256";
}
```

``` nix
normalizeHash { } { sha512 = lib.fakeSha512; }
=>
{
  outputHash = lib.fakeSha512;
  outputHashAlgo = "sha512";
}
```
:::

## `lib.fetchers.withNormalizedHash` {#function-library-lib.fetchers.withNormalizedHash}

Wraps a function which accepts `outputHash{,Algo}` into one which accepts `hash` or `sha{256,512}`

### Example

``` nix
withNormalizedHash { hashTypes = [ "sha256" "sha512" ]; } (
  { outputHash, outputHashAlgo, ... }:
  ...
)
```

is a function which accepts one of `hash`, `sha256`, or `sha512` (or the original's `outputHash` and `outputHashAlgo`).

Its `functionArgs` metadata only lists `hash` as a parameter, optional iff. `outputHash` was an optional parameter of
the original function.  `sha256`, `sha512`, `outputHash`, or `outputHashAlgo` are not mentioned in the `functionArgs`
metadata.

### Type

```
withNormalizedHash :: { hashTypes :: [String]; } -> (AttrSet -> a) -> (AttrSet -> a)
```

### Arguments

hashTypes
: the set of attribute names accepted as hash inputs, in addition to `hash`

: they must correspond to a valid value for `outputHashAlgo`, currently one of: `md5`, `sha1`, `sha256`, or `sha512`.

f
: the function to be wrapped

::: note
In nixpkgs, `mkDerivation` rejects MD5 `outputHash`es, and SHA-1 is being deprecated.

As such, there is no reason to add `md5` to `hashTypes`, and
`sha1` should only ever be included for backwards compatibility.
:::

### Output

`withNormalizedHash { inherit hashTypes; } f` is functionally equivalent to

``` nix
args: f (normalizeHash {
  inherit hashTypes;
  required = !(lib.functionArgs f).outputHash;
} args)
```

However, `withNormalizedHash` preserves `functionArgs` metadata insofar as possible,
and is implemented somewhat more efficiently.
