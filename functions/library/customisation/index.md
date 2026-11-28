# `lib.customisation`: Functions to customise (derivation-related) functions, derivations, or attribute sets {#sec-functions-library-customisation}

## `lib.customisation.callPackageWith` {#function-library-lib.customisation.callPackageWith}

Call the package function in the file `fn` with the required
arguments automatically.  The function is called with the
arguments `args`, but any missing arguments are obtained from
`autoArgs`.  This function is intended to be partially
parameterised, e.g.,

``` nix
callPackage = callPackageWith pkgs;
pkgs = {
  libfoo = callPackage ./foo.nix { };
  libbar = callPackage ./bar.nix { };
};
```

If the `libbar` function expects an argument named `libfoo`, it is
automatically passed as an argument.  Overrides or missing
arguments can be supplied in `args`, e.g.

``` nix
libbar = callPackage ./bar.nix {
  libfoo = null;
  enableX11 = true;
};
```

<!-- TODO: Apply "Example:" tag to the examples above -->

### Inputs

`autoArgs`
: 1. Function argument

`fn`
: 2. Function argument

`args`
: 3. Function argument

### Type

```
callPackageWith :: AttrSet -> ((AttrSet -> a) | Path) -> AttrSet -> a
```

## `lib.customisation.callPackagesWith` {#function-library-lib.customisation.callPackagesWith}

Like `callPackage`, but for a function that returns an attribute
set of derivations. The override function is added to the
individual attributes.

### Inputs

`autoArgs`
: 1. Function argument

`fn`
: 2. Function argument

`args`
: 3. Function argument

### Type

```
callPackagesWith :: AttrSet -> ((AttrSet -> AttrSet) | Path) -> AttrSet -> AttrSet
```

## `lib.customisation.extendDerivation` {#function-library-lib.customisation.extendDerivation}

Add attributes to each output of a derivation without changing
the derivation itself and check a given condition when evaluating.

### Inputs

`condition`
: 1. Function argument

`passthru`
: 2. Function argument

`drv`
: 3. Function argument

### Type

```
extendDerivation :: Bool -> Any -> Derivation -> Derivation
```

## `lib.customisation.extendMkDerivation` {#function-library-lib.customisation.extendMkDerivation}

Define a `mkDerivation`-like function based on another `mkDerivation`-like function.

[`stdenv.mkDerivation`](../../../stdenv/index.md#part-stdenv) gives access to
its final set of derivation attributes when it is passed a function,
or when it is passed an overlay-style function in `overrideAttrs`.

Instead of composing new `stdenv.mkDerivation`-like build helpers
using normal function composition,
`extendMkDerivation` makes sure that the returned build helper
supports such first class recursion like `mkDerivation` does.

`extendMkDerivation` takes an extra attribute set to configure its behaviour.
One can optionally specify
`transformDrv` to specify a function to apply to the result derivation,
or `inheritFunctionArgs` to decide whether to inherit the `__functionArgs`
from the base build helper.

### Inputs

`extendMkDerivation`-specific configurations
: `constructDrv` (required)

: Base build helper, the `mkDerivation`-like build helper to extend.

`excludeDrvArgNames` (default to `[ ]`)
: Argument names not to pass from the input fixed-point arguments to `constructDrv`.
It doesn't apply to the updating arguments returned by `extendDrvArgs`.

`excludeFunctionArgNames` (default to `[ ]`)
: `__functionArgs` attribute names to remove from the result build helper.
`excludeFunctionArgNames` is useful for argument deprecation while avoiding ellipses.

`extendDrvArgs` (required)
: An extension (overlay) of the argument set, like the one taken by [`overrideAttrs`](../../../using/overrides/index.md#sec-pkg-overrideAttrs) but applied before passing to `constructDrv`.

`inheritFunctionArgs` (default to `true`)
: Whether to inherit `__functionArgs` from the base build helper.
Set `inheritFunctionArgs` to `false` when `extendDrvArgs`'s `args` set pattern does not contain an ellipsis.

`transformDrv` (default to `lib.id`)
: Function to apply to the result derivation.

### Type

```
extendMkDerivation ::
  {
    constructDrv :: (FixedPointArgs | AttrSet) -> Derivation;
    excludeDrvArgNames :: [String];
    excludeFunctionArgNames :: [String];
    extendDrvArgs :: AttrSet -> AttrSet -> AttrSet;
    inheritFunctionArgs :: Bool;
    transformDrv :: Derivation -> Derivation;
  }
  -> ((FixedPointArgs | AttrSet) -> Derivation)

FixedPointArgs :: AttrSet -> AttrSet
```

### Examples

::: example
#### `lib.customisation.extendMkDerivation` usage example

``` nix-repl
mkLocalDerivation = lib.extendMkDerivation {
  constructDrv = pkgs.stdenv.mkDerivation;
  excludeDrvArgNames = [ "specialArg" ];
  extendDrvArgs =
    finalAttrs: args@{ preferLocalBuild ? true, allowSubstitute ? false, specialArg ? (_: false), ... }:
    { inherit preferLocalBuild allowSubstitute; passthru = { inherit specialArg; } // args.passthru or { }; };
}

mkLocalDerivation.__functionArgs
=> { allowSubstitute = true; preferLocalBuild = true; specialArg = true; }

mkLocalDerivation { inherit (pkgs.hello) pname version src; specialArg = _: false; }
=> «derivation /nix/store/xirl67m60ahg6jmzicx43a81g635g8z8-hello-2.12.1.drv»

mkLocalDerivation (finalAttrs: { inherit (pkgs.hello) pname version src; specialArg = _: false; })
=> «derivation /nix/store/xirl67m60ahg6jmzicx43a81g635g8z8-hello-2.12.1.drv»

(mkLocalDerivation (finalAttrs: { inherit (pkgs.hello) pname version src; passthru = { foo = "a"; bar = "${finalAttrs.passthru.foo}b"; }; })).bar
=> "ab"
```
:::

::: note
If `transformDrv` is specified,
it should take care of existing attributes that perform overriding
(e.g., [`overrideAttrs`](../../../using/overrides/index.md#sec-pkg-overrideAttrs))
to ensure that the overriding functionality of the result derivation
work as expected.
Modifications that breaks the overriding include
direct [attribute set update](https://nixos.org/manual/nix/stable/language/operators#update)
and [`lib.extendDerivation`](#function-library-lib.customisation.extendDerivation).
:::

## `lib.customisation.hydraJob` {#function-library-lib.customisation.hydraJob}

Strip a derivation of all non-essential attributes, returning
only those needed by hydra-eval-jobs. Also strictly evaluate the
result to ensure that there are no thunks kept alive to prevent
garbage collection.

### Inputs

`drv`
: 1. Function argument

### Type

```
hydraJob :: (Derivation | Null) -> (Derivation | Null)
```

## `lib.customisation.makeOverridable` {#function-library-lib.customisation.makeOverridable}

`makeOverridable` takes a function from attribute set to attribute set and
injects `override` attribute which can be used to override arguments of
the function.

Please refer to  documentation on [`<pkg>.overrideDerivation`](../../../using/overrides/index.md#sec-pkg-overrideDerivation) to learn about `overrideDerivation` and caveats
related to its use.

### Inputs

`f`
: 1. Function argument

### Type

```
makeOverridable :: (AttrSet -> a) -> AttrSet -> a
```

### Examples

::: example
#### `lib.customisation.makeOverridable` usage example

``` nix
nix-repl> x = {a, b}: { result = a + b; }

nix-repl> y = lib.makeOverridable x { a = 1; b = 2; }

nix-repl> y
{ override = «lambda»; overrideDerivation = «lambda»; result = 3; }

nix-repl> y.override { a = 10; }
{ override = «lambda»; overrideDerivation = «lambda»; result = 12; }
```
:::

## `lib.customisation.makeScope` {#function-library-lib.customisation.makeScope}

Make an attribute set (a "scope") from functions that take arguments from that same attribute set.
See [lib.customisation: Functions to customise (derivation-related) functions, derivations, or attribute sets](#ex-makeScope) for how to use it.

### Inputs

1. `newScope` (`AttrSet -> ((AttrSet -> a) | Path) -> AttrSet -> a`)

   A function that takes an attribute set `attrs` and returns what ends up as `callPackage` in the output.

   Typical values are `callPackageWith` or the output attribute `newScope`.

2. `f` (`AttrSet -> AttrSet`)

   A function that takes an attribute set as returned by `makeScope newScope f` (a "scope") and returns any attribute set.

   This function is used to compute the fixpoint of the resulting scope using `callPackage`.
   Its argument is the lazily evaluated reference to the value of that fixpoint, and is typically called `self` or `final`.

   See [lib.customisation: Functions to customise (derivation-related) functions, derivations, or attribute sets](#ex-makeScope) for how to use it.
   See [lib.fixedPoints: explicit recursion functions](../../../functions/library/fixedPoints/index.md#sec-functions-library-fixedPoints) for details on fixpoint computation.

### Output

`makeScope` returns an attribute set of a form called `scope`, which also contains the final attributes produced by `f`:

```
scope :: {
  callPackage :: ((AttrSet -> a) | Path) -> AttrSet -> a
  newScope = AttrSet -> scope
  overrideScope = (scope -> scope -> AttrSet) -> scope
  packages :: AttrSet -> AttrSet
}
```

- `callPackage` (`((AttrSet -> a) | Path) -> AttrSet -> a`)

  A function that

  1. Takes a function `p`, or a path to a Nix file that contains a function `p`, which takes an attribute set and returns value of arbitrary type `a`,
  2. Takes an attribute set `args` with explicit attributes to pass to `p`,
  3. Calls `f` with attributes from the original attribute set `attrs` passed to `newScope` updated with `args`, i.e. `attrs // args`, if they match the attributes in the argument of `p`.

  All such functions `p` will be called with the same value for `attrs`.

  See [lib.customisation: Functions to customise (derivation-related) functions, derivations, or attribute sets](#ex-makeScope-callPackage) for how to use it.

- `newScope` (`AttrSet -> scope`)

  Takes an attribute set `attrs` and returns a scope that extends the original scope.

- `overrideScope` (`(scope -> scope -> AttrSet) -> scope`)

  Takes a function `g` of the form `final: prev: { # attributes }` to act as an overlay on `f`, and returns a new scope with values determined by `extends g f`.
  See [](https://nixos.org/manual/nixpkgs/unstable/#function-library-lib.fixedPoints.extends) for details.

  This allows subsequent modification of the final attribute set in a consistent way, i.e. all functions `p` invoked with `callPackage` will be called with the modified values.

- `packages` (`AttrSet -> AttrSet`)

  The value of the argument `f` to `makeScope`.

- final attributes

  The final values returned by `f`.

### Examples

::: {.example #ex-makeScope}
### Create an interdependent package set on top of `pkgs`

The functions in `foo.nix` and `bar.nix` can depend on each other, in the sense that `foo.nix` can contain a function that expects `bar` as an attribute in its argument.

``` nix
let
  pkgs = import <nixpkgs> { };
in
pkgs.lib.makeScope pkgs.newScope (self: {
  foo = self.callPackage ./foo.nix { };
  bar = self.callPackage ./bar.nix { };
})
```

evaluates to

``` nix
{
  callPackage = «lambda»;
  newScope = «lambda»;
  overrideScope = «lambda»;
  packages = «lambda»;
  foo = «derivation»;
  bar = «derivation»;
}
```
:::

::: {.example #ex-makeScope-callPackage}
### Using `callPackage` from a scope

``` nix
let
  pkgs = import <nixpkgs> { };
  inherit (pkgs) lib;
  scope = lib.makeScope lib.callPackageWith (self: { a = 1; b = 2; });
  three = scope.callPackage ({ a, b }: a + b) { };
  four = scope.callPackage ({ a, b }: a + b) { a = 2; };
in
[ three four ]
```

evaluates to

``` nix
[ 3 4 ]
```
:::

### Type

```
makeScope :: (AttrSet -> ((AttrSet -> a) | Path) -> AttrSet -> a) -> (AttrSet -> AttrSet) -> Scope
```

## `lib.customisation.makeScopeWithSplicing` {#function-library-lib.customisation.makeScopeWithSplicing}

backward compatibility with old uncurried form; deprecated

### Inputs

`splicePackages`
: 1. Function argument

`newScope`
: 2. Function argument

`otherSplices`
: 3. Function argument

`keep`
: 4. Function argument

`extra`
: 5. Function argument

`f`
: 6. Function argument

## `lib.customisation.makeScopeWithSplicing'` {#function-library-lib.customisation.makeScopeWithSplicing-prime}

Like `makeScope`, but aims to support cross compilation. It's still ugly, but
hopefully it helps a little bit.

### Type

```
makeScopeWithSplicing' ::
  { splicePackages :: Splice -> AttrSet;
    newScope :: AttrSet -> ((AttrSet -> a) | Path) -> AttrSet -> a;
  }
  -> { otherSplices :: Splice; keep :: AttrSet -> AttrSet; extra :: AttrSet -> AttrSet; }
  -> AttrSet

Splice :: {
  pkgsBuildBuild :: AttrSet;
  pkgsBuildHost :: AttrSet;
  pkgsBuildTarget :: AttrSet;
  pkgsHostHost :: AttrSet;
  pkgsHostTarget :: AttrSet;
  pkgsTargetTarget :: AttrSet;
}
```

## `lib.customisation.mapCrossIndex` {#function-library-lib.customisation.mapCrossIndex}

Takes a function and applies it pointwise to each field of a cross index.

A cross index (short for "Cross Platform Pair Index") is a 6-field structure
organizing values by cross-compilation platform relationships.

### Inputs

`f`
: Function to apply to each cross index value

`crossIndex`
: A cross index to transform

### Type

```
mapCrossIndex :: (a -> b) -> {
  buildBuild :: a;
  buildHost :: a;
  buildTarget :: a;
  hostHost :: a;
  hostTarget :: a;
  targetTarget :: a;
} -> {
  buildBuild :: b;
  buildHost :: b;
  buildTarget :: b;
  hostHost :: b;
  hostTarget :: b;
  targetTarget :: b;
}
```

### Examples

::: example
#### `lib.customisation.mapCrossIndex` usage example

``` nix
mapCrossIndex (x: x * 10) { buildBuild = 1; buildHost = 2; ... }
=> { buildBuild = 10; buildHost = 20; ... }
```

``` nix
# Extract a package from package sets
mapCrossIndex (pkgs: pkgs.hello) crossIndexedPackageSets
```
:::

## `lib.customisation.overrideDerivation` {#function-library-lib.customisation.overrideDerivation}

`overrideDerivation drv f` takes a derivation (i.e., the result
of a call to the builtin function `derivation`) and returns a new
derivation in which the attributes of the original are overridden
according to the function `f`.  The function `f` is called with
the original derivation attributes.

`overrideDerivation` allows certain "ad-hoc" customisation
scenarios (e.g. in ~/.config/nixpkgs/config.nix).  For instance,
if you want to "patch" the derivation returned by a package
function in Nixpkgs to build another version than what the
function itself provides.

For another application, see build-support/vm, where this
function is used to build arbitrary derivations inside a QEMU
virtual machine.

Note that in order to preserve evaluation errors, the new derivation's
outPath depends on the old one's, which means that this function cannot
be used in circular situations when the old derivation also depends on the
new one.

You should in general prefer `drv.overrideAttrs` over this function;
see the nixpkgs manual for more information on overriding.

### Inputs

`drv`
: 1. Function argument

`f`
: 2. Function argument

### Type

```
overrideDerivation :: Derivation -> ( Derivation -> AttrSet ) -> Derivation
```

### Examples

::: example
#### `lib.customisation.overrideDerivation` usage example

``` nix
mySed = overrideDerivation pkgs.gnused (oldAttrs: {
  name = "sed-4.2.2-pre";
  src = fetchurl {
    url = "ftp://alpha.gnu.org/gnu/sed/sed-4.2.2-pre.tar.bz2";
    hash = "sha256-MxBJRcM2rYzQYwJ5XKxhXTQByvSg5jZc5cSHEZoB2IY=";
  };
  patches = [];
});
```
:::

## `lib.customisation.renameCrossIndexFrom` {#function-library-lib.customisation.renameCrossIndexFrom}

Removes a prefix from the attribute names of a cross index.

A cross index (short for "Cross Platform Pair Index") is a 6-field structure
organizing values by cross-compilation platform relationships.

### Inputs

`prefix`
: The prefix to remove from cross index attribute names

`crossIndex`
: A cross index with prefixed names

### Type

```
renameCrossIndexFrom :: String -> AttrSet -> AttrSet
```

### Examples

::: example
#### `lib.customisation.renameCrossIndexFrom` usage example

``` nix
renameCrossIndexFrom "pkgs" { pkgsBuildBuild = ...; pkgsBuildHost = ...; ... }
=> { buildBuild = ...; buildHost = ...; ... }
```
:::

## `lib.customisation.renameCrossIndexTo` {#function-library-lib.customisation.renameCrossIndexTo}

Adds a prefix to the attribute names of a cross index.

A cross index (short for "Cross Platform Pair Index") is a 6-field structure
organizing values by cross-compilation platform relationships.

### Inputs

`prefix`
: The prefix to add to cross index attribute names

`crossIndex`
: A cross index to be prefixed

### Type

```
renameCrossIndexTo :: String -> AttrSet -> AttrSet
```

### Examples

::: example
#### `lib.customisation.renameCrossIndexTo` usage example

``` nix
renameCrossIndexTo "self" { buildBuild = ...; buildHost = ...; ... }
=> { selfBuildBuild = ...; selfBuildHost = ...; ... }
```
:::
