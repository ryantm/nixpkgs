# `lib.sources`: source filtering functions {#sec-functions-library-sources}

## `lib.sources.cleanSource` {#function-library-lib.sources.cleanSource}

Filters a source tree removing version control files and directories using `cleanSourceFilter`.

### Inputs

`src`
: 1. Function argument

### Examples

::: example
#### `cleanSource` usage example

``` nix
cleanSource ./.
```
:::

## `lib.sources.cleanSourceFilter` {#function-library-lib.sources.cleanSourceFilter}

A basic filter for `cleanSourceWith` that removes
directories of version control system, backup files (`*~`)
and some generated files.

### Inputs

`name`
: 1. Function argument

`type`
: 2. Function argument

## `lib.sources.cleanSourceWith` {#function-library-lib.sources.cleanSourceWith}

Like `builtins.filterSource`, except it will compose with itself,
allowing you to chain multiple calls together without any
intermediate copies being put in the nix store.

### Examples

::: example
#### `cleanSourceWith` usage example

``` nix
lib.cleanSourceWith {
  filter = f;
  src = lib.cleanSourceWith {
    filter = g;
    src = ./.;
  };
}
# Succeeds!

builtins.filterSource f (builtins.filterSource g ./.)
# Fails!
```
:::

## `lib.sources.commitIdFromGitRepo` {#function-library-lib.sources.commitIdFromGitRepo}

Get the commit id of a git repo.

### Inputs

`path`
: 1. Function argument

### Examples

::: example
#### `commitIdFromGitRepo` usage example

``` nix
commitIdFromGitRepo <nixpkgs/.git>
```
:::

## `lib.sources.sourceByGlobs` {#function-library-lib.sources.sourceByGlobs}

Filter a source tree by a list of doublestar-style glob patterns,
returning a source that only contains paths matching at least one
pattern. `*` matches a single path component, and `**` matches any
number of components.

### Inputs

`src`
: The source tree to filter.

`patterns`
: List of glob patterns to include, e.g. `[ "*.py" "src/**" ]`.
A leading `**` (e.g. `**\/*.py` for all `.py` files at any depth)
is also supported; the `\` here is just a Nix string escape used
to avoid closing this comment.

### Examples

::: example
#### `sourceByGlobs` usage example

- Include everything under a subdirectory

``` nix
src = sourceByGlobs ./. [ "src/**" "tests/**" ]
```

- Include all .py files in root directory only

``` nix
src = sourceByGlobs ./. [ "*.py" ]
```
:::

## `lib.sources.sourceByRegex` {#function-library-lib.sources.sourceByRegex}

Filter sources by a list of regular expressions.

### Inputs

`src`
: 1. Function argument

`regexes`
: 2. Function argument

### Examples

::: example
#### `sourceByRegex` usage example

``` nix
src = sourceByRegex ./my-subproject [".*\\.py$" "^database\\.sql$"]
```
:::

## `lib.sources.sourceFilesBySuffices` {#function-library-lib.sources.sourceFilesBySuffices}

Get all files ending with the specified suffices from the given
source directory or its descendants, omitting files that do not match
any suffix. The result of the example below will include files like
`./dir/module.c` and `./dir/subdir/doc.xml` if present.

### Inputs

`src`
: Path or source containing the files to be returned

`exts`
: A list of file suffix strings

### Type

```
sourceFilesBySuffices :: SourceLike -> [String] -> Source
```

### Examples

::: example
#### `sourceFilesBySuffices` usage example

``` nix
sourceFilesBySuffices ./. [ ".xml" ".c" ]
```
:::

## `lib.sources.trace` {#function-library-lib.sources.trace}

Add logging to a source, for troubleshooting the filtering behavior.

### Inputs

`src`
: Source to debug. The returned source will behave like this source, but also log its filter invocations.

### Type

```
sources.trace :: SourceLike -> Source
```
