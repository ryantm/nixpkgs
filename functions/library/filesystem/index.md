# `lib.filesystem`: filesystem functions {#sec-functions-library-filesystem}

## `lib.filesystem.haskellPathsInDir` {#function-library-lib.filesystem.haskellPathsInDir}

A map of all haskell packages defined in the given path,
identified by having a cabal file with the same name as the
directory itself.

### Inputs

`root`
: The directory within to search

### Type

```
haskellPathsInDir :: Path -> { [String] :: Path }
```

## `lib.filesystem.listFilesRecursive` {#function-library-lib.filesystem.listFilesRecursive}

Given a directory, return a flattened list of all files within it recursively.

### Inputs

`dir`
: The path to recursively list

### Type

```
listFilesRecursive :: Path -> [Path]
```

## `lib.filesystem.locateDominatingFile` {#function-library-lib.filesystem.locateDominatingFile}

Find the first directory containing a file matching `pattern`
upward from a given `file`.
Returns `null` if no directories contain a file matching `pattern`.

### Inputs

`pattern`
: The pattern to search for

`file`
: The file to start searching upward from

### Type

```
locateDominatingFile :: RegExp -> Path -> ({ path :: Path; matches :: [MatchResults]; } | Null)
```

## `lib.filesystem.packagesFromDirectoryRecursive` {#function-library-lib.filesystem.packagesFromDirectoryRecursive}

Transform a directory tree containing package files suitable for
`callPackage` into a matching nested attribute set of derivations.

For a directory tree like this:

```
my-packages
├── a.nix
├── b.nix
├── c
│  ├── my-extra-feature.patch
│  ├── package.nix
│  └── support-definitions.nix
└── my-namespace
   ├── d.nix
   ├── e.nix
   └── f
      └── package.nix
```

`packagesFromDirectoryRecursive` will produce an attribute set like this:

``` nix
# packagesFromDirectoryRecursive {
#   callPackage = pkgs.callPackage;
#   directory = ./my-packages;
# }
{
  a = pkgs.callPackage ./my-packages/a.nix { };
  b = pkgs.callPackage ./my-packages/b.nix { };
  c = pkgs.callPackage ./my-packages/c/package.nix { };
  my-namespace = {
    d = pkgs.callPackage ./my-packages/my-namespace/d.nix { };
    e = pkgs.callPackage ./my-packages/my-namespace/e.nix { };
    f = pkgs.callPackage ./my-packages/my-namespace/f/package.nix { };
  };
}
```

In particular:

- If the input directory contains a `package.nix` file, then
  `callPackage <directory>/package.nix { }` is returned.
- Otherwise, the input directory's contents are listed and transformed into
  an attribute set.
  - If a regular file's name has the `.nix` extension, it is turned into attribute
    where:

    - The attribute name is the file name without the `.nix` extension
    - The attribute value is `callPackage <file path> { }`

  - Directories are turned into an attribute where:

    - The attribute name is the name of the directory
    - The attribute value is the result of calling
      `packagesFromDirectoryRecursive { ... }` on the directory.

    As a result, directories with no `.nix` files (including empty
    directories) will be transformed into empty attribute sets.

  - Other files are ignored, including symbolic links to directories and to regular `.nix`
    files; this is because nixlang code cannot distinguish the type of a link's target.

### Inputs

`callPackage`
: The function used to convert a Nix file's path into a leaf of the attribute set.
It is typically the `callPackage` function, taken from either `pkgs` or a new scope corresponding to the `directory`.

`newScope`
: If present, this function is used when recursing into a directory, to generate a new scope.
The arguments are updated with the scope's `callPackage` and `newScope` functions, so packages can require
anything in their scope, or in an ancestor of their scope.

`directory`
: The directory to read package files from.

### Type

```
packagesFromDirectoryRecursive :: {
  callPackage :: Path -> AttrSet -> Any;
  newScope? :: AttrSet -> Scope;
  directory :: Path;
} -> AttrSet
```

### Examples

::: example
#### Basic use of `lib.packagesFromDirectoryRecursive`

``` nix
packagesFromDirectoryRecursive {
  inherit (pkgs) callPackage;
  directory = ./my-packages;
}
=> { ... }
```

In this case, `callPackage` will only search `pkgs` for a file's input parameters.
In other words, a file cannot refer to another file in the directory in its input parameters.
:::

::: example
#### Create a scope for the nix files found in a directory

``` nix
packagesFromDirectoryRecursive {
  inherit (pkgs) callPackage newScope;
  directory = ./my-packages;
}
=> { ... }
```

For example, take the following directory structure:

```
my-packages
├── a.nix    → { b }: assert b ? b1; ...
└── b
   ├── b1.nix  → { a }: ...
   └── b2.nix
```

Here, `b1.nix` can specify `{ a }` as a parameter, which `callPackage` will resolve as expected.
Likewise, `a.nix` receive an attrset corresponding to the contents of the `b` directory.

::: note
`a.nix` cannot directly take as inputs packages defined in a child directory, such as `b1`.
:::
:::

## `lib.filesystem.pathIsDirectory` {#function-library-lib.filesystem.pathIsDirectory}

Whether a path exists and is a directory.

### Inputs

`path`
: 1. Function argument

### Type

```
pathIsDirectory :: Path -> Bool
```

### Examples

::: example
#### `lib.filesystem.pathIsDirectory` usage example

``` nix
pathIsDirectory /.
=> true

pathIsDirectory /this/does/not/exist
=> false

pathIsDirectory /some/file.nix
=> false
```
:::

## `lib.filesystem.pathIsRegularFile` {#function-library-lib.filesystem.pathIsRegularFile}

Whether a path exists and is a regular file, meaning not a symlink or any other special file type.

### Inputs

`path`
: 1. Function argument

### Type

```
pathIsRegularFile :: Path -> Bool
```

### Examples

::: example
#### `lib.filesystem.pathIsRegularFile` usage example

``` nix
pathIsRegularFile /.
=> false

pathIsRegularFile /this/does/not/exist
=> false

pathIsRegularFile /some/file.nix
=> true
```
:::

## `lib.filesystem.pathType` {#function-library-lib.filesystem.pathType}

The type of a path. The path needs to exist and be accessible.
The result is either `"directory"` for a directory, `"regular"` for a
regular file, `"symlink"` for a symlink, or `"unknown"` for anything else.

### Inputs

path
: The path to query

### Type

```
pathType :: Path -> String
```

### Examples

::: example
#### `lib.filesystem.pathType` usage example

``` nix
pathType /.
=> "directory"

pathType /some/file.nix
=> "regular"
```
:::

## `lib.filesystem.resolveDefaultNix` {#function-library-lib.filesystem.resolveDefaultNix}

Append `/default.nix` if the passed path is a directory.

### Inputs

A single argument which can be a [path](https://nix.dev/manual/nix/stable/language/types#type-path) value or a string containing an absolute path.

### Output

If the input refers to a directory that exists, the output is that same path with `/default.nix` appended.
Furthermore, if the input is a string that ends with `/`, `default.nix` is appended to it.
Otherwise, the input is returned unchanged.

### Type

```
resolveDefaultNix :: (Path | String) -> (Path | String)
```

### Examples

:::{.example}

#### `lib.filesystem.resolveDefaultNix` usage example

This expression checks whether `a` and `b` refer to the same locally available Nix file path.

``` nix
resolveDefaultNix a == resolveDefaultNix b
```

For instance, if `a` is `/some/dir` and `b` is `/some/dir/default.nix`, and `/some/dir/` exists, the expression evaluates to `true`, despite `a` and `b` being different references to the same Nix file.
