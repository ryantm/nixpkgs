# `lib.derivations`: miscellaneous derivation-specific functions {#sec-functions-library-derivations}

## `lib.derivations.lazyDerivation` {#function-library-lib.derivations.lazyDerivation}

Restrict a derivation to a predictable set of attribute names, so
that the returned attrset is not strict in the actual derivation,
saving a lot of computation when the derivation is non-trivial.

This is useful in situations where a derivation might only be used for its
passthru attributes, improving evaluation performance.

The returned attribute set is lazy in `derivation`. Specifically, this
means that the derivation will not be evaluated in at least the
situations below.

For illustration and/or testing, we define derivation such that its
evaluation is very noticeable.

    let derivation = throw "This won't be evaluated.";

In the following expressions, `derivation` will *not* be evaluated:

    (lazyDerivation { inherit derivation; }).type

    attrNames (lazyDerivation { inherit derivation; })

    (lazyDerivation { inherit derivation; } // { foo = true; }).foo

    (lazyDerivation { inherit derivation; meta.foo = true; }).meta

In these expressions, `derivation` *will* be evaluated:

    "${lazyDerivation { inherit derivation }}"

    (lazyDerivation { inherit derivation }).outPath

    (lazyDerivation { inherit derivation }).meta

And the following expressions are not valid, because the refer to
implementation details and/or attributes that may not be present on
some derivations:

    (lazyDerivation { inherit derivation }).buildInputs

    (lazyDerivation { inherit derivation }).passthru

    (lazyDerivation { inherit derivation }).pythonPath

### Inputs

Takes an attribute set with the following attributes

`derivation`
: The derivation to be wrapped.

`meta`
: Optional meta attribute.

While this function is primarily about derivations, it can improve
the `meta` package attribute, which is usually specified through
`mkDerivation`.

`passthru`
: Optional extra values to add to the returned attrset.

This can be used for adding package attributes, such as `tests`.

`outputs`
: Optional list of assumed outputs. Default: `[ "out" ]`

This must match the set of outputs that the returned derivation has.
You must use this when the derivation has multiple outputs.

## `lib.derivations.optionalDrvAttr` {#function-library-lib.derivations.optionalDrvAttr}

Conditionally set a derivation attribute.

Because `mkDerivation` sets `__ignoreNulls = true`, a derivation
attribute set to `null` will not impact the derivation output hash.
Thus, this function passes through its `value` argument if the `cond`
is `true`, but returns `null` if not.

### Inputs

`cond`
: Condition

`value`
: Attribute value

### Type

```
optionalDrvAttr :: Bool -> a -> (a | Null)
```

### Examples

::: example
#### `lib.derivations.optionalDrvAttr` usage example

``` nix
(stdenv.mkDerivation {
  name = "foo";
  x = optionalDrvAttr true 1;
  y = optionalDrvAttr false 1;
}).drvPath == (stdenv.mkDerivation {
  name = "foo";
  x = 1;
}).drvPath
=> true
```
:::

## `lib.derivations.warnOnInstantiate` {#function-library-lib.derivations.warnOnInstantiate}

Wrap a derivation such that instantiating it produces a warning.

All attributes will be wrapped with `lib.warn` except from `.meta`, `.name`,
and `.type` which are used by `nix search`, and `.outputName` which avoids
double warnings with `nix-instantiate` and `nix-build`.

### Inputs

`msg`
: The warning message to emit (via `lib.warn`).

`drv`
: The derivation to wrap.

### Type

```
warnOnInstantiate :: String -> Derivation -> Derivation
```

### Examples

::: example
#### `lib.derivations.warnOnInstantiate` usage example

``` nix
{
  myPackage = warnOnInstantiate "myPackage has been renamed to my-package" my-package;
}
```
:::
