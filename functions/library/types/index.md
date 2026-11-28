# `lib.types`: Option types are a way to put constraints on the values a module option

can take. Types are also responsible of how values are merged in case of
multiple value definitions. {#sec-functions-library-types}

## `lib.types.addCheck` {#function-library-lib.types.addCheck}

Augment the given type with an additional type check function.

::: warning
This function has some broken behavior see: [#396021](https://github.com/NixOS/nixpkgs/issues/396021)
Fixing is not trivial, we appreciate any help!
:::

::: example
### Adding a type check

``` nix
{
  byte = mkOption {
    description = "An integer between 0 and 255.";
    type = types.addCheck types.int (x: x >= 0 && x <= 255);
  };
}
```
:::

## `lib.types.anything` {#function-library-lib.types.anything}

A type that accepts any value and recursively merges attribute sets
together. This type is recommended when the option type is unknown.

::: example
### `types.anything`

Two definitions of this type like

``` nix
{
  str = lib.mkDefault "foo";
  pkg.hello = pkgs.hello;
  fun.fun = x: x + 1;
}
```

``` nix
{
  str = lib.mkIf true "bar";
  pkg.gcc = pkgs.gcc;
  fun.fun = lib.mkForce (x: x + 2);
}
```

will get merged to

``` nix
{
  str = "bar";
  pkg.gcc = pkgs.gcc;
  pkg.hello = pkgs.hello;
  fun.fun = x: x + 2;
}
```
:::

## `lib.types.attrListOf` {#function-library-lib.types.attrListOf}

`types.attrListOf` *`t`*

An ordered list of single-attribute attribute sets, where each value is of *`t`* type.
The output is always `[ { name1 = value1; } { name2 = value2; } ... ]`.

Definitions can be provided in two formats, which may be mixed via `lib.mkMerge`, `imports`, etc:

- **List format**: `[ { a = 1; } { b = 2; } ]` — each element must be a single-attribute attribute set.
  Elements may be wrapped in `lib.mkOrder` (or `lib.mkBefore`/`lib.mkAfter`) to control ordering;
  unwrapped elements use the default order priority.

- **Attribute set format**: `{ a = lib.mkOrder 100 1; b = 2; }` — each name-value pair becomes a single-attribute attribute set in the output.
  Values may be wrapped in `lib.mkOrder` (or `lib.mkBefore`/`lib.mkAfter`) to control ordering.
  Values without `lib.mkOrder` use the default priority.

Multiple definitions of the same option are concatenated and then sorted by priority.
Entries at the same priority level preserve their definition order.

## `lib.types.attrListWith` {#function-library-lib.types.attrListWith}

`types.attrListWith` { *`elemType`*, *`asAttrs`* ? false, *`mergeAttrValues`* ? \_name: values: values }

An ordered list of single-attribute attribute sets, where each value is of *`elemType`* type.

**Parameters**

`elemType` (Required)
: Specifies the type of each value in the attribute list.

`asAttrs`
: When `true`, the option value is an attribute set instead of a list.
Duplicate keys are merged using `mergeAttrValues`.
The ordered list is always available via `valueMeta.attrListValue`.

`mergeAttrValues`
: A function `name: values: mergedValue` that controls how duplicate keys
are combined when `asAttrs = true`. This is passed as the callback to
`lib.zipAttrsWith`. The `values` list is in order of priority.
By default, all values are collected into a list.

**Behavior**

- `attrListWith { elemType = t; }` is equivalent to `attrListOf t`

## `lib.types.attrTag` {#function-library-lib.types.attrTag}

`types.attrTag` *`{ attr1 = option1; attr2 = option2; ... }`*

An attribute set containing one attribute, whose name must be picked from
the attribute set (`attr1`, etc) and whose value consists of definitions that are valid for the corresponding option (`option1`, etc).

This type appears in the documentation as *attribute-tagged union*.

Example:

``` nix
{ lib, ... }:
let inherit (lib) type mkOption;
in {
  options.toyRouter.rules = mkOption {
    description = ''
      Rules for a fictional packet routing service.
    '';
    type = types.attrsOf (
      types.attrTag {
        bounce = mkOption {
          description = "Send back a packet explaining why it wasn't forwarded.";
          type = types.submodule {
            options.errorMessage = mkOption { … };
          };
        };
        forward = mkOption {
          description = "Forward the packet.";
          type = types.submodule {
            options.destination = mkOption { … };
          };
        };
        drop = types.mkOption {
          description = "Drop the packet without sending anything back.";
          type = types.submodule {};
        };
      });
  };
  config.toyRouter.rules = {
    http = {
      bounce = {
        errorMessage = "Unencrypted HTTP is banned. You must always use https://.";
      };
    };
    ssh = { drop = {}; };
  };
}
```

## `lib.types.attrs` {#function-library-lib.types.attrs}

A free-form attribute set.

::: warning
This type will be deprecated in the future because it doesn't
recurse into attribute sets, silently drops earlier attribute
definitions, and doesn't discharge `lib.mkDefault`, `lib.mkIf`
and co. For allowing arbitrary attribute sets, prefer
`types.attrsOf types.anything` instead which doesn't have these
problems.
:::

## `lib.types.attrsOf` {#function-library-lib.types.attrsOf}

`types.attrsOf` *`t`*

*Shorthand for `types.attrsWith { lazy = false; elemType = t; }`.*

An attribute set where all the values are of *`t`* type.

This type is *strict* in its values, which in turn means attributes cannot depend on other attributes.
See [`lazy` in `attrsWith`](#sec-option-types-composed-attrsWith-lazy).

## `lib.types.attrsWith` {#function-library-lib.types.attrsWith}

`types.attrsWith` { *`elemType`*, *`lazy`* ? false, *`placeholder`* ? "name" }

An attribute set where all the values are of *`elemType`* type.

Multiple definitions will be merged in the resulting attribute set.

**Parameters**

`elemType` (Required)
: Specifies the type of the values contained in the attribute set.

[`lazy`]{#sec-option-types-composed-attrsWith-lazy}
: Determines whether the set of attribute names is evaluated before or after evaluating any attribute values.

`lazy = true` is a preferable choice in principle, but requires extra effort if the option value is used as a whole (e.g. `attrNames` or `toJSON`).

When `lazy` is `true`, the attribute names are determined by looking at the definitions without evaluating them.

::: warning
With `lazy = true`, an attribute whose definitions are all `mkIf false` still counts as present, so `foo ? attr` is `true`.
Accessing `foo.attr` then throws an error, unless the element type defines `emptyValue` (e.g. `nullOr`), in which case that value is returned.
:::

When `lazy` is `false`, the attribute names are determined by evaluating the definitions to see if they are `mkIf` false, but this also causes the evaluation of regular non-`mkIf` definitions.
Evaluating too much causes multiple problems:
- infinite recursion if an attribute definition depends on a sibling attribute
- irrelevant errors are triggered, despite an attribute not really being used
- performance is worse, if any of the values are expensive to evaluate

Maintainers of this code recommend:

- If the attribute set is used *in aggregate* (e.g. `attrNames`, `toJSON`), use the default `lazy = false;`, so that `mkIf` conditions are evaluated *before* the attribute names are returned.
- If attributes are accessed *in isolation* (e.g. `config.foo`), use `lazy = true;` so that `mkIf` conditions are evaluated *after* the attribute names are returned.
  This will be more robust and efficient, as the attribute values are not computed until they are needed.

It is possible to combine both behaviors using `submodule` with `freeformType = attrsWith { lazy = false; ... }` instead of `attrsWith`, in which case the declared options are allowed to refer to each other, but *only* through the submodule's module arguments. See the following example.

::: {.example #ex-freeform-attrsWith-recursive}
## Free-form submodule with recursion

This module demonstrates use of a free-form submodule with recursion:

``` nix
{ lib, ... }:
let
  inherit (lib) mkOption types;
in
{
  options.foo.settings = mkOption {
    type = types.submodule ({ config, ... }: {
      freeformType = types.attrsWith {
        lazy = false;
        elemType = types.str;
      };
      options = {
        name = mkOption { type = types.str; };
        displayName = mkOption { type = types.str; };
      };
    });
  };
  config.foo.settings = { config, ... }: {
    name = "foo";
    displayName = config.name;
    extra = "bar";
    ghost = lib.mkIf false "this disappears";
  };
}
```

It evaluates to the following configuration:

``` nix
{
  foo.settings = {
    name = "foo";
    displayName = "foo";
    extra = "bar";
  };
}
```
:::

`placeholder` (`String`, default: `name` )
: Placeholder string in documentation for the attribute names.
The default value `name` results in the placeholder `<name>`

**Behavior**

- `attrsWith { elemType = t; }` is equivalent to `attrsOf t`

- `attrsWith { lazy = true; elemType = t; }` is equivalent to `lazyAttrsOf t`

- `attrsWith { placeholder = "id"; elemType = t; }`

  Displays the option as `foo.<id>` in the manual.

## `lib.types.bool` {#function-library-lib.types.bool}

A boolean, its values can be `true` or `false`.
All definitions must have the same value, after priorities. An error is thrown in case of a conflict.

## `lib.types.boolByOr` {#function-library-lib.types.boolByOr}

A boolean, its values can be `true` or `false`.
The result is `true` if *any* of multiple definitions is `true`.
In other words, definitions are merged with the logical *OR* operator.

## `lib.types.coercedTo` {#function-library-lib.types.coercedTo}

`types.coercedTo` *`from f to`*

Type *`to`* or type *`from`* which will be coerced to type *`to`* using
function *`f`* which takes an argument of type *`from`* and return a
value of type *`to`*. Can be used to preserve backwards compatibility
of an option if its type was changed.

## `lib.types.commas` {#function-library-lib.types.commas}

A string. Multiple definitions are concatenated with a comma `","`.

## `lib.types.deferredModule` {#function-library-lib.types.deferredModule}

Whereas `submodule` represents an option tree, `deferredModule` represents
a module value, such as a module file or a configuration.

It can be set multiple times.

Module authors can use its value in `imports`, in `submoduleWith`'s `modules`
or in `evalModules`' `modules` parameter, among other places.

Note that `imports` must be evaluated before the module fixpoint. Because
of this, deferred modules can only be imported into "other" fixpoints, such
as submodules.

One use case for this type is the type of a "default" module that allow the
user to affect all submodules in an `attrsOf submodule` at once. This is
more convenient and discoverable than expecting the module user to
type-merge with the `attrsOf submodule` option.

## `lib.types.either` {#function-library-lib.types.either}

<!-- SYNC WITH oneOf BELOW -->

`types.either` *`t1 t2`*

Type *`t1`* or type *`t2`*, e.g. `with types; either int str`.
Multiple definitions cannot be merged.

::: warning
`either` and `oneOf` eagerly decide the active type based on the passed types' shallow check method. For composite types like `attrsOf` and `submodule`, which both match all attribute set definitions, the first type argument will be chosen for the returned option value, and this therefore also decides how nested values are checked and merged. For example, `either (attrsOf int) (submodule {...})` will always use `attrsOf int` for any attribute set value, even if it was intended as a submodule. This behavior is a trade-off that keeps the implementation simple and the evaluation order predictable, avoiding unexpected strictness problems such as infinite recursions. When proper type discrimination is needed, consider using a [sum type](#function-library-lib.types.attrTag) like `attrTag` instead.
:::

## `lib.types.enum` {#function-library-lib.types.enum}

`types.enum` *`l`*

One element of the list *`l`*, e.g. `types.enum [ "left" "right" ]`.
Multiple definitions cannot be merged.

If you want to pair these values with more information, possibly of
distinct types, consider using a [sum type](#function-library-lib.types.attrTag).

## `lib.types.envVar` {#function-library-lib.types.envVar}

A string. Multiple definitions are concatenated with a colon `":"`.

## `lib.types.externalPath` {#function-library-lib.types.externalPath}

A path that is not contained in the Nix store. Typical use cases are:
secrets, password or any other external file.

::: warning
This type only validates that the path is not *currently* in the Nix store.
It does NOT prevent the value from being copied to the store later when:

- Referenced in a derivation
- Used in certain path operations (e.g., `${path}` interpolation)
- Passed to functions that copy to the store

Users must still be careful about how they reference these paths.
:::

## `lib.types.float` {#function-library-lib.types.float}

A floating point number.

::: warning
Converting a floating point number to a string with `toString` or `toJSON`
may result in [precision loss](https://github.com/NixOS/nix/issues/5733).
:::

## `lib.types.int` {#function-library-lib.types.int}

A signed integer.

## `lib.types.ints` {#function-library-lib.types.ints}

`types.ints.{s8, s16, s32}`
: Signed integers with a fixed length (8, 16 or 32 bits). They go from
−2^n/2 to
2^n/2−1 respectively (e.g. `−128` to
`127` for 8 bits).

`types.ints.unsigned`
: An unsigned integer (that is \>= 0).

`types.ints.{u8, u16, u32}`
: Unsigned integers with a fixed length (8, 16 or 32 bits). They go
from 0 to 2^n−1 respectively (e.g. `0`
to `255` for 8 bits).

`types.ints.between` *`lowest highest`*
: An integer between *`lowest`* and *`highest`* (both inclusive).

::: example
# `lib.types.ints.between` usage example

``` nix
(ints.between 0 100).check (-1)
=> false
(ints.between 0 100).check (101)
=> false
(ints.between 0 0).check 0
=> true
```
:::

`types.ints.positive`
: A positive integer (that is \> 0).

## `lib.types.json` {#function-library-lib.types.json}

A type representing JSON-compatible values. This includes `null`, booleans,
integers, floats, strings, paths, attribute sets, and lists.
Attribute sets and lists can be arbitrarily nested and contain any JSON-compatible
values.

## `lib.types.lazyAttrsOf` {#function-library-lib.types.lazyAttrsOf}

`types.lazyAttrsOf` *`t`*

*Shorthand for `types.attrsWith { lazy = true; elemType = t; }`.*

An attribute set where all the values are of *`t`* type.

This is the lazy version of `types.attrsOf`, allowing attributes to depend on each other, at the cost of potentially containing more attributes than desirable.
See [`lazy` in `attrsWith`](#sec-option-types-composed-attrsWith-lazy).

## `lib.types.lines` {#function-library-lib.types.lines}

A string. Multiple definitions are concatenated with a new line
`"\n"`.

## `lib.types.listOf` {#function-library-lib.types.listOf}

`types.listOf` *`t`*

A list of *`t`* type, e.g. `types.listOf int`. Multiple definitions are merged with list concatenation.

## `lib.types.luaInline` {#function-library-lib.types.luaInline}

A string wrapped using `lib.mkLuaInline`. Allows embedding lua expressions
inline within generated lua. Multiple definitions cannot be merged.

## `lib.types.mergeTypes` {#function-library-lib.types.mergeTypes}

Merges two option types together.

::: note
Uses the type merge function of the first type, to merge it with the second type.

Usually types can only be merged if they are of the same type
:::

### Inputs

: `a` (option type): The first option type.
: `b` (option type): The second option type.

### Returns

- The merged option type.
- `{ _type = "merge-error"; error = "Cannot merge types"; }` if the types can't be merged.

### Examples

::: example
#### `lib.types.mergeTypes` usage example

``` nix
let
  enumAB = lib.types.enum ["A" "B"];
  enumXY = lib.types.enum ["X" "Y"];
  # This operation could be notated as: [ A ] | [ B ] -> [ A B ]
  merged = lib.types.mergeTypes enumAB enumXY; # -> enum [ "A" "B" "X" "Y" ]
in
  assert merged.check "A"; # true
  assert merged.check "B"; # true
  assert merged.check "X"; # true
  assert merged.check "Y"; # true
  merged.check "C" # false
```
:::

## `lib.types.mkOptionType` {#function-library-lib.types.mkOptionType}

Custom types can be created with the `mkOptionType` function. As type
creation includes some more complex topics such as submodule handling,
it is recommended to get familiar with `types.nix` code before creating
a new type.

The only required parameter is `name`.

`name`
: A string representation of the type function name.

`description`
: Description of the type used in documentation. Give information of
the type and any of its arguments.

`check`
: A function to type check the definition value. Takes the definition
value as a parameter and returns a boolean indicating the type check
result, `true` for success and `false` for failure.

`merge`
: A function to merge multiple definitions values. Takes two
parameters:

*`loc`*
: The option path as a list of strings, e.g. `["boot" "loader "grub" "enable"]`.

*`defs`*
: The list of sets of defined `value` and `file` where the value
was defined, e.g. `[ { file = "/foo.nix"; value = 1; } { file = "/bar.nix"; value = 2 } ]`. The `merge` function should return the merged value
or throw an error in case the values are impossible or not meant
to be merged.

`getSubOptions`
: For composed types that can take a submodule as type parameter, this
function generate sub-options documentation. It takes the current
option prefix as a list and return the set of sub-options. Usually
defined in a recursive manner by adding a term to the prefix, e.g.
`prefix: elemType.getSubOptions (prefix ++ ["prefix"])` where *`"prefix"`* is the newly added prefix.

`getSubModules`
: For composed types that can take a submodule as type parameter, this
function should return the type parameters submodules. If the type
parameter is called `elemType`, the function should just recursively
look into submodules by returning `elemType.getSubModules;`.

`substSubModules`
: For composed types that can take a submodule as type parameter, this
function can be used to substitute the parameter of a submodule
type. It takes a module as parameter and return the type with the
submodule options substituted. It is usually defined as a type
function call with a recursive call to `substSubModules`, e.g for a
type `composedType` that take an `elemtype` type parameter, this
function should be defined as `m: composedType (elemType.substSubModules m)`.

`typeMerge`
: A function to merge multiple type declarations. Takes the type to
merge `functor` as parameter. A `null` return value means that type
cannot be merged.

*`f`*
: The type to merge `functor`.

Note: There is a generic `defaultTypeMerge` that work with most of
value and composed types.

`functor`
: An attribute set representing the type. It is used for type
operations and has the following keys:

`type`
: The type function.

`wrapped`
: Holds the type parameter for composed types.

`payload`
: Holds the value parameter for value types. The types that have a
`payload` are the `enum`, `separatedString` and `submodule`
types.

`binOp`
: A binary operation that can merge the payloads of two same
types. Defined as a function that take two payloads as
parameters and return the payloads merged.

## `lib.types.nullOr` {#function-library-lib.types.nullOr}

`types.nullOr` *`t`*

`null` or type *`t`*. Multiple definitions are merged according to
type *`t`*.

This is mostly equivalent to `either (enum [ null ]) t`, but `nullOr` provides a `null` fallback for attribute values with `mkIf false` definitions in `lazyAttrsOf (nullOr t)`, whereas `either` would throw an error when the attribute is accessed.

## `lib.types.number` {#function-library-lib.types.number}

Either a signed integer or a floating point number. No implicit conversion
is done between the two types, and multiple equal definitions will only be
merged if they have the same type.

## `lib.types.numbers` {#function-library-lib.types.numbers}

`types.numbers.between` *`lowest highest`*
: An integer or floating point number between *`lowest`* and *`highest`* (both inclusive).

`types.numbers.nonnegative`
: A nonnegative integer or floating point number (that is \>= 0).

`types.numbers.positive`
: A positive integer or floating point number (that is \> 0).

## `lib.types.oneOf` {#function-library-lib.types.oneOf}

<!-- SYNC WITH either ABOVE -->

`types.oneOf` \[ *`t1 t2`* ... \]

Type *`t1`* or type *`t2`* and so forth, e.g.
`with types; oneOf [ int str bool ]`. Multiple definitions cannot be
merged.

::: warning
`either` and `oneOf` eagerly decide the active type based on the passed types' shallow check method. For composite types like `attrsOf` and `submodule`, which both match all attribute set definitions, the first matching type in the list will be chosen for the returned option value, and this therefore also decides how nested values are checked and merged. For example, `oneOf [ (attrsOf int) (submodule {...}) ]` will always use `attrsOf int` for any attribute set value, even if it was intended as a submodule. This behavior is a trade-off that keeps the implementation simple and the evaluation order predictable, avoiding unexpected strictness problems such as infinite recursions. When proper type discrimination is needed, consider using a [sum type](#function-library-lib.types.attrTag) like `attrTag` instead.
:::

## `lib.types.optionDeclaration` {#function-library-lib.types.optionDeclaration}

The type of a module system option declaration, as created by `lib.mkOption`.
This allows an option to hold another option declaration as its value, which
can then be spliced into a module's `options` attrset. Note that this only
accepts option declarations, not evaluated options (i.e. options that have
been processed by `evalModules` and have a `value` field).

::: warning
Use of this type is a form of metaprogramming that makes modules harder
to reason about, since options and their types become dynamic values
rather than statically declared structure. Prefer conventional module
patterns where possible, and only reach for `types.optionDeclaration` when the
added complexity is justified.
:::

## `lib.types.optionType` {#function-library-lib.types.optionType}

The type of an option's type. Its merging operation ensures that nested
options have the correct file location annotated, and that if possible,
multiple option definitions are correctly merged together. The main use
case is as the type of the `_module.freeformType` option.

## `lib.types.package` {#function-library-lib.types.package}

A top-level store path. This can be an attribute set pointing
to a store path, like a derivation or a flake input.

## `lib.types.path` {#function-library-lib.types.path}

A filesystem path that starts with a slash. Even if derivations can be
considered as paths, the more specific `types.package` should be preferred.

## `lib.types.pathInStore` {#function-library-lib.types.pathInStore}

A path that is contained in the Nix store. This can be a top-level store
path like `pkgs.hello` or a descendant like `"${pkgs.hello}/bin/hello"`,
(or, more simply, `lib.getExe pkgs.hello`).

## `lib.types.pathWith` {#function-library-lib.types.pathWith}

`types.pathWith` { *`inStore`* ? `null`, *`absolute`* ? `null` }

A filesystem path. Either a string or something that can be coerced
to a string.

**Parameters**

`inStore` (`Boolean` or `null`, default `null`)
: Whether the path must be in the store (`true`), must not be in the store
(`false`), or it doesn't matter (`null`)

`absolute` (`Boolean` or `null`, default `null`)
: Whether the path must be absolute (`true`), must not be absolute
(`false`), or it doesn't matter (`null`)

**Behavior**

- `pathWith { inStore = true; }` is equivalent to `pathInStore`
- `pathWith { absolute = true; }` is equivalent to `path`
- `pathWith { inStore = false; absolute = true; }` requires an absolute
  path that is not in the store. Useful for password files that shouldn't be
  leaked into the store.

## `lib.types.pkgs` {#function-library-lib.types.pkgs}

A type for the top level Nixpkgs package set.

## `lib.types.port` {#function-library-lib.types.port}

A port number. This type is an alias to
`types.ints.u16`.

## `lib.types.raw` {#function-library-lib.types.raw}

A type which doesn't do any checking, merging or nested evaluation. It
accepts a single arbitrary value that is not recursed into, making it
useful for values coming from outside the module system, such as package
sets or arbitrary data. Options of this type are still evaluated according
to priorities and conditionals, so `mkForce`, `mkIf` and co. still work on
the option value itself, but not for any value nested within it. This type
should only be used when checking, merging and nested evaluation are not
desirable.

## `lib.types.separatedString` {#function-library-lib.types.separatedString}

`types.separatedString` *`sep`*

A string. Multiple definitions are concatenated with *`sep`*, e.g.
`types.separatedString "|"`.

## `lib.types.serializableValueWith` {#function-library-lib.types.serializableValueWith}

Creates a value type suitable for serialization formats.

Parameters:

- typeName: String describing the format (e.g. "JSON", "YAML", "XML")
- nullable: Whether the structured value type allows `null` values.

Returns a type suitable for structured data formats that supports:

- Basic types: boolean, integer, float, string, path
- Complex types: attribute sets and lists

## `lib.types.str` {#function-library-lib.types.str}

A string. Multiple definitions cannot be merged.

## `lib.types.strMatching` {#function-library-lib.types.strMatching}

A string matching a specific regular expression. Multiple
definitions cannot be merged. The regular expression is processed
using `builtins.match`.

## `lib.types.submodule` {#function-library-lib.types.submodule}

`types.submodule` *`o`*

A set of sub options *`o`*. *`o`* can be an attribute set, a function
returning an attribute set, or a path to a file containing such a
value. Submodules are used in composed types to create modular
options. This is equivalent to
`types.submoduleWith { modules = toList o; shorthandOnlyDefinesConfig = true; }`.

`submodule` is a very powerful type that defines a set of sub-options
that are handled like a separate module.

It takes a parameter *`o`*, that should be a set, or a function returning
a set with an `options` key defining the sub-options. Submodule option
definitions are type-checked accordingly to the `options` declarations.
Of course, you can nest submodule option definitions for even higher
modularity.

The option set can be defined directly
([Example: Directly defined submodule](#ex-submodule-direct)) or as reference
([Example: Submodule defined as a reference](#ex-submodule-reference)).

Note that even if your submodule’s options all have a default value,
you will still need to provide a default value (e.g. an empty attribute set)
if you want to allow users to leave it undefined.

::: {.example #ex-submodule-direct}
### Directly defined submodule

``` nix
{
  options.mod = mkOption {
    description = "submodule example";
    type =
      with types;
      submodule {
        options = {
          foo = mkOption { type = int; };
          bar = mkOption { type = str; };
        };
      };
  };
}
```
:::

::: {.example #ex-submodule-reference}
### Submodule defined as a reference

``` nix
let
  modOptions = {
    options = {
      foo = mkOption { type = int; };
      bar = mkOption { type = int; };
    };
  };
in
{
  options.mod = mkOption {
    description = "submodule example";
    type = with types; submodule modOptions;
  };
}
```
:::

The `submodule` type is especially interesting when used with composed
types like `attrsOf` or `listOf`. When composed with `listOf`
([Example: Declaration of a list of submodules](#ex-submodule-listof-declaration)), `submodule` allows
multiple definitions of the submodule option set
([Example: Definition of a list of submodules](#ex-submodule-listof-definition)).

::: {.example #ex-submodule-listof-declaration}
### Declaration of a list of submodules

``` nix
{
  options.mod = mkOption {
    description = "submodule example";
    type =
      with types;
      listOf (submodule {
        options = {
          foo = mkOption { type = int; };
          bar = mkOption { type = str; };
        };
      });
  };
}
```
:::

::: {.example #ex-submodule-listof-definition}
### Definition of a list of submodules

``` nix
{
  config.mod = [
    {
      foo = 1;
      bar = "one";
    }
    {
      foo = 2;
      bar = "two";
    }
  ];
}
```
:::

When composed with `attrsOf`
([Example: Declaration of attribute sets of submodules](#ex-submodule-attrsof-declaration)), `submodule` allows
multiple named definitions of the submodule option set
([Example: Definition of attribute sets of submodules](#ex-submodule-attrsof-definition)).

::: {.example #ex-submodule-attrsof-declaration}
### Declaration of attribute sets of submodules

``` nix
{
  options.mod = mkOption {
    description = "submodule example";
    type =
      with types;
      attrsOf (submodule {
        options = {
          foo = mkOption { type = int; };
          bar = mkOption { type = str; };
        };
      });
  };
}
```
:::

::: {.example #ex-submodule-attrsof-definition}
### Definition of attribute sets of submodules

``` nix
{
  config.mod.one = {
    foo = 1;
    bar = "one";
  };
  config.mod.two = {
    foo = 2;
    bar = "two";
  };
}
```
:::

## `lib.types.submoduleWith` {#function-library-lib.types.submoduleWith}

`types.submoduleWith` { *`modules`*, *`specialArgs`* ? {}, *`shorthandOnlyDefinesConfig`* ? false }

Like `types.submodule`, but more flexible and with better defaults.
It has parameters

- *`modules`* A list of modules to use by default for this
  submodule type. This gets combined with all option definitions
  to build the final list of modules that will be included.

  ::: note
  Only options defined with this argument are included in rendered
  documentation.
  :::

- *`specialArgs`* An attribute set of extra arguments to be passed
  to the module functions. The option `_module.args` should be
  used instead for most arguments since it allows overriding.
  *`specialArgs`* should only be used for arguments that can't go
  through the module fixed-point, because of infinite recursion or
  other problems. An example is overriding the `lib` argument,
  because `lib` itself is used to define `_module.args`, which
  makes using `_module.args` to define it impossible.

- *`shorthandOnlyDefinesConfig`* Whether definitions of this type
  should default to the `config` section of a module (see
  [Example: Structure of NixOS Modules](https://nixos.org/manual/nixos/unstable/#ex-module-syntax))
  if it is an attribute set. Enabling this only has a benefit
  when the submodule defines an option named `config` or `options`.
  In such a case it would allow the option to be set with
  `the-submodule.config = "value"` instead of requiring
  `the-submodule.config.config = "value"`. This is because
  only when modules *don't* set the `config` or `options`
  keys, all keys are interpreted as option definitions in the
  `config` section. Enabling this option implicitly puts all
  attributes in the `config` section.

  With this option enabled, defining a non-`config` section
  requires using a function:
  `the-submodule = { ... }: { options = { ... }; }`.

## `lib.types.toml` {#function-library-lib.types.toml}

A type representing TOML-compatible values. This includes booleans,
integers, floats, strings, paths, attribute sets, and lists.
Attribute sets and lists can be arbitrarily nested and contain any TOML-compatible
values.

## `lib.types.uniq` {#function-library-lib.types.uniq}

`types.uniq` *`t`*

Ensures that type *`t`* cannot be merged. It is used to ensure option
definitions are provided only once.

## `lib.types.unique` {#function-library-lib.types.unique}

`types.unique` `{ message = m }` *`t`*

Ensures that type *`t`* cannot be merged. Prints the message *`m`*, after
the line `The option <option path> is defined multiple times.` and before
a list of definition locations.
