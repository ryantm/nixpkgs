# `lib.generators`: functions that create file formats from nix data structures {#sec-functions-library-generators}

## `lib.generators.mkDconfKeyValue` {#function-library-lib.generators.mkDconfKeyValue}

`mkKeyValueDefault` wrapper that handles dconf INI quirks.
The main differences of the format is that it requires strings to be quoted.

## `lib.generators.mkKeyValueDefault` {#function-library-lib.generators.mkKeyValueDefault}

Generate a line of key `k` and value `v`, separated by
character `sep`. If `sep` appears in `k`, it is escaped.
Helper for syntaxes with different separators.

`mkValueString` specifies how values should be formatted.

``` nix
mkKeyValueDefault {} ":" "f:oo" "bar"
> "f\:oo:bar"
```

### Inputs

Structured function argument
: mkValueString (optional, default: `mkValueStringDefault {}`)

: Function to convert values to strings

`sep`
: 2. Function argument

`k`
: 3. Function argument

`v`
: 4. Function argument

## `lib.generators.mkLuaInline` {#function-library-lib.generators.mkLuaInline}

Mark string as Lua expression to be inlined when processed by `toLua`.

### Inputs

`expr`
: 1. Function argument

### Type

```
mkLuaInline :: String -> { _type = "lua-inline"; expr :: String; }
```

## `lib.generators.mkValueStringDefault` {#function-library-lib.generators.mkValueStringDefault}

Convert a value to a sensible default string representation.
The builtin `toString` function has some strange defaults,
suitable for bash scripts but not much else.

### Inputs

Options
: Empty set, there may be configuration options in the future

`v`
: 2. Function argument

## `lib.generators.toDconfINI` {#function-library-lib.generators.toDconfINI}

Generates INI in dconf keyfile style. See the [GNOME documentation](https://help.gnome.org/system-admin-guide/dconf-keyfiles.html)
for details.

## `lib.generators.toDhall` {#function-library-lib.generators.toDhall}

Translate a simple Nix expression to Dhall notation.

Note that integers are translated to Integer and never
the Natural type.

### Inputs

Options
: Empty set, there may be configuration options in the future

Value
: The value to be converted to Dhall

## `lib.generators.toGitINI` {#function-library-lib.generators.toGitINI}

Generate a git-config file from an attrset.

It has two major differences from the regular INI format:

1. values are indented with tabs
2. sections can have sub-sections

Further: [git-config examples](https://git-scm.com/docs/git-config#EXAMPLES)

### Examples

::: example
#### `lib.generators.toGitINI` usage example

``` nix
generators.toGitINI {
  url."ssh://git@github.com/".insteadOf = "https://github.com";
  user.name = "edolstra";
}

> [url "ssh://git@github.com/"]
>   insteadOf = "https://github.com"
>
> [user]
>   name = "edolstra"
```
:::

### Inputs

`attrs`
: Key-value pairs to be converted to a git-config file.
See the [git-config documentation](https://git-scm.com/docs/git-config#_variables) for possible values.

## `lib.generators.toINI` {#function-library-lib.generators.toINI}

Generate an INI-style config file from an
attrset of sections to an attrset of key-value pairs.

### Inputs

Structured function argument
: mkSectionName (optional, default: `(name: escape [ "[" "]" ] name)`)

: apply transformations (e.g. escapes) to section names

: mkKeyValue (optional, default: `{} "="`)

: format a setting line from key and value

: listsAsDuplicateKeys (optional, default: `false`)

: allow lists as values for duplicate keys

### Examples

::: example
#### `lib.generators.toINI` usage example

``` nix
generators.toINI {} {
  foo = { hi = "${pkgs.hello}"; ciao = "bar"; };
  baz = { "also, integers" = 42; };
}

> [baz]
> also, integers=42
>
> [foo]
> ciao=bar
> hi=/nix/store/y93qql1p5ggfnaqjjqhxcw0vqw95rlz0-hello-2.10
```

The mk\* configuration attributes can generically change
the way sections and key-value strings are generated.

For more examples see the test cases in ./tests/misc.nix.
:::

## `lib.generators.toINIWithGlobalSection` {#function-library-lib.generators.toINIWithGlobalSection}

Generate an INI-style config file from an attrset
specifying the global section (no header), and an
attrset of sections to an attrset of key-value pairs.

### Inputs

1. Structured function argument
: mkSectionName (optional, default: `(name: escape [ "[" "]" ] name)`)

: apply transformations (e.g. escapes) to section names

: mkKeyValue (optional, default: `{} "="`)

: format a setting line from key and value

: listsAsDuplicateKeys (optional, default: `false`)

: allow lists as values for duplicate keys

2. Structured function argument
: globalSection (required)

: global section key-value pairs

: sections (optional, default: `{}`)

: attrset of sections to key-value pairs

### Examples

::: example
#### `lib.generators.toINIWithGlobalSection` usage example

``` nix
generators.toINIWithGlobalSection {} {
  globalSection = {
    someGlobalKey = "hi";
  };
  sections = {
    foo = { hi = "${pkgs.hello}"; ciao = "bar"; };
    baz = { "also, integers" = 42; };
}

> someGlobalKey=hi
>
> [baz]
> also, integers=42
>
> [foo]
> ciao=bar
> hi=/nix/store/y93qql1p5ggfnaqjjqhxcw0vqw95rlz0-hello-2.10
```

The mk\* configuration attributes can generically change
the way sections and key-value strings are generated.

For more examples see the test cases in ./tests/misc.nix.
:::

If you don’t need a global section, you can also use
`generators.toINI` directly, which only takes
the part in `sections`.

## `lib.generators.toKeyValue` {#function-library-lib.generators.toKeyValue}

Generate a key-value-style config file from an attrset.

### Inputs

Structured function argument
: mkKeyValue (optional, default: `mkKeyValueDefault {} "="`)

: format a setting line from key and value

: listsAsDuplicateKeys (optional, default: `false`)

: allow lists as values for duplicate keys

: indent (optional, default: `""`)

: Initial indentation level

## `lib.generators.toLua` {#function-library-lib.generators.toLua}

Translate a simple Nix expression to Lua representation with occasional
Lua-inlines that can be constructed by `mkLuaInline` function.

Configuration:

- `multiline` - by default is true which results in indented block-like view.
- `indent` - initial indent.
- `asBindings` - by default generate single value, but with this use attrset to set global vars.

::: note
Regardless of multiline parameter there is no trailing newline.
:::

### Inputs

Structured function argument
: multiline (optional, default: `true`)

: If this option is true, the output is indented with newlines for attribute sets and lists

: indent (optional, default: `""`)

: Initial indentation level

: asBindings (optional, default: `false`)

: Interpret as variable bindings

Value
: The value to be converted to Lua

### Type

```
toLua :: { multiline :: Bool; indent :: String; asBindings :: Bool; } -> Any -> String
```

### Examples

::: example
#### `lib.generators.toLua` usage example

``` nix
generators.toLua {}
  {
    cmd = [ "typescript-language-server" "--stdio" ];
    settings.workspace.library = mkLuaInline ''vim.api.nvim_get_runtime_file("", true)'';
  }
->
 {
   ["cmd"] = {
     "typescript-language-server",
     "--stdio"
   },
   ["settings"] = {
     ["workspace"] = {
       ["library"] = (vim.api.nvim_get_runtime_file("", true))
     }
   }
 }
```
:::

## `lib.generators.toPlist` {#function-library-lib.generators.toPlist}

Translate a simple Nix expression to [Plist notation](https://en.wikipedia.org/wiki/Property_list).

### Inputs

Structured function argument
: escape (optional, default: `false`)

: If this option is true, XML special characters are escaped in string values and keys

Value
: The value to be converted to Plist

## `lib.generators.toPretty` {#function-library-lib.generators.toPretty}

Pretty print a value, akin to `builtins.trace`.

Should probably be a builtin as well.

The pretty-printed string should be suitable for rendering default values
in the NixOS manual. In particular, it should be as close to a valid Nix expression
as possible.

### Inputs

Structured function argument
: allowPrettyValues

: If this option is true, attrsets like `{ __pretty = fn; val = …; }`
will use `fn` to convert `val` to a pretty printed representation.
(This means `fn` is type `Val -> String`.)

: multiline

: If this option is true, the output is indented with newlines for attribute sets and lists

: indent

: Initial indentation level

Value
: The value to be pretty printed

## `lib.generators.withRecursion` {#function-library-lib.generators.withRecursion}

Recurses through a `Value` limited to a certain depth. (`depthLimit`)

If the depth is exceeded, an error is thrown, unless `throwOnDepthLimit` is set to `false`.

### Inputs

Structured function argument
: depthLimit (required)

: If this option is not null, the given value will stop evaluating at a certain depth

: throwOnDepthLimit (optional, default: `true`)

: If this option is true, an error will be thrown, if a certain given depth is exceeded

Value
: The value to be evaluated recursively
