# documentation {#sec-options-documentation}

## `documentation.dev.enable` {#opt-documentation.dev.enable}

Whether to install documentation targeted at developers.

- This includes man pages targeted at developers if [`documentation.man.enable`](#opt-documentation.man.enable) is
  set (this also includes "devman" outputs).
- This includes info pages targeted at developers if [`documentation.info.enable`](#opt-documentation.info.enable)
  is set (this also includes "devinfo" outputs).
- This includes other pages targeted at developers if [`documentation.doc.enable`](#opt-documentation.doc.enable)
  is set (this also includes "devdoc" outputs).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/misc/documentation.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/documentation.nix)

## `documentation.doc.enable` {#opt-documentation.doc.enable}

Whether to install documentation distributed in packages' `/share/doc`.
Usually plain text and/or HTML.
This also includes "doc" outputs.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/misc/documentation.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/documentation.nix)

## `documentation.enable` {#opt-documentation.enable}

Whether to install documentation of packages from
[`environment.systemPackages`](../../options/environment/index.md#opt-environment.systemPackages) into the generated system path.

See "Multiple-output packages" chapter in the nixpkgs manual for more info.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/misc/documentation.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/documentation.nix)

## `documentation.info.enable` {#opt-documentation.info.enable}

Whether to install info pages and the `info` command.
This also includes "info" outputs.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/misc/documentation.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/documentation.nix)

## `documentation.man.cache.enable` {#opt-documentation.man.cache.enable}

Whether to generate the manual page index caches.
This allows searching for a page or
keyword using utilities like `apropos(1)`
and the `-k` option of
`man(1)`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/misc/documentation.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/documentation.nix)

## `documentation.man.cache.generateAtRuntime` {#opt-documentation.man.cache.generateAtRuntime}

Whether to generate the manual page index caches at runtime using
a systemd service.

::: note
This is currently only supported by the man-db module.
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/misc/documentation.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/documentation.nix)

## `documentation.man.enable` {#opt-documentation.man.enable}

Whether to install manual pages.
This also includes `man` outputs.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/misc/documentation.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/documentation.nix)

## `documentation.man.man-db.enable` {#opt-documentation.man.man-db.enable}

Whether to enable man-db as the default man page viewer.

*Type:* boolean

*Default:* `config.documentation.man.enable`

*Example:* `false`

*Declared by:* [`nixos/modules/misc/man-db.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/man-db.nix)

## `documentation.man.man-db.manualPages` {#opt-documentation.man.man-db.manualPages}

The manual pages to generate caches for if [`documentation.man.cache.enable`](#opt-documentation.man.cache.enable)
is enabled. Must be a path to a directory with man pages under
`/share/man`; see the source for an example.
Advanced users can make this a content-addressed derivation to save a few rebuilds.

*Type:* absolute path

*Default:* all man pages in `config.environment.systemPackages`

*Declared by:* [`nixos/modules/misc/man-db.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/man-db.nix)

## `documentation.man.man-db.package` {#opt-documentation.man.man-db.package}

The `man-db` derivation to use. Useful to override
configuration options used for the package.

*Type:* package

*Default:* `pkgs.man-db`

*Declared by:* [`nixos/modules/misc/man-db.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/man-db.nix)

## `documentation.man.mandoc.cachePath` {#opt-documentation.man.mandoc.cachePath}

Change the paths where mandoc `makewhatis(8)`generates the
manual page index caches. [`documentation.man.cache.enable`](#opt-documentation.man.cache.enable)
should be enabled to allow cache generation. This list should only
include the paths to manpages installed in the system configuration,
i. e. /run/current-system/sw/share/man. `makewhatis(8)`
creates a database in each directory using the files
`mansection/[arch/]title.section` and `catsection/[arch/]title.0`
in it. If a directory contains no manual pages, no database is
created in that directory.
This option only needs to be set manually if extra paths should be
indexed or `documentation.man.manPath` contains paths that
can't be indexed.

*Type:* list of string

*Default:* `config.documentation.man.mandoc.manPath`

*Example:* `[ "share/man" "share/man/fr" ]`

*Declared by:* [`nixos/modules/misc/mandoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/mandoc.nix)

## `documentation.man.mandoc.enable` {#opt-documentation.man.mandoc.enable}

Whether to enable mandoc as the default man page viewer.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/misc/mandoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/mandoc.nix)

## `documentation.man.mandoc.extraConfig` {#opt-documentation.man.mandoc.extraConfig}

Extra configuration to write to `man.conf(5)`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/misc/mandoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/mandoc.nix)

## `documentation.man.mandoc.manPath` {#opt-documentation.man.mandoc.manPath}

Change the paths included in the MANPATH environment variable,
i. e. the directories where `man(1)`
looks for section-specific directories of man pages.
You only need to change this setting if you want extra man pages
(e. g. in non-english languages). All values must be strings that
are a valid path from the target prefix (without including it).
The first value given takes priority. Note that this will not
add manpath directives to `man.conf(5)`.

*Type:* list of string

*Default:*

``` nix
[
  "share/man"
]
```

*Example:* `[ "share/man" "share/man/fr" ]`

*Declared by:* [`nixos/modules/misc/mandoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/mandoc.nix)

## `documentation.man.mandoc.package` {#opt-documentation.man.mandoc.package}

The `mandoc` derivation to use. Useful to override
configuration options used for the package.

*Type:* package

*Default:* `pkgs.mandoc`

*Declared by:* [`nixos/modules/misc/mandoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/mandoc.nix)

## `documentation.man.mandoc.settings` {#opt-documentation.man.mandoc.settings}

Configuration for `man.conf(5)`

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/misc/mandoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/mandoc.nix)

## `documentation.man.mandoc.settings.manpath` {#opt-documentation.man.mandoc.settings.manpath}

Override the default search path for `man(1)`,
`apropos(1)`, and `makewhatis(8)`. It can be
used multiple times to specify multiple paths, with the order
determining the manual page search order.
This is not recommended in favor of
[`documentation.man.mandoc.manPath`](#opt-documentation.man.mandoc.manPath), but if it's needed to
specify the manpath in this way, set
[`documentation.man.mandoc.manPath`](#opt-documentation.man.mandoc.manPath) to an empty list (`[]`).

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "/run/current-system/sw/share/man" ]`

*Declared by:* [`nixos/modules/misc/mandoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/mandoc.nix)

## `documentation.man.mandoc.settings.output.fragment` {#opt-documentation.man.mandoc.settings.output.fragment}

Whether to omit the \<!DOCTYPE\> declaration and the <html>, <head>, and <body>
elements and only emit the subtree below the <body> element in HTML
output of `mandoc(1)`. The style argument will be ignored.
This is useful when embedding manual content within existing documents.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/misc/mandoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/mandoc.nix)

## `documentation.man.mandoc.settings.output.includes` {#opt-documentation.man.mandoc.settings.output.includes}

A string of relative path used as a template for the output path of
linked header files (usually via the In macro) in HTML output.
Instances of `%I` are replaced with the include filename. The
default is not to present a hyperlink.

*Type:* null or string

*Default:* `null`

*Example:* `../src/%I.html`

*Declared by:* [`nixos/modules/misc/mandoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/mandoc.nix)

## `documentation.man.mandoc.settings.output.indent` {#opt-documentation.man.mandoc.settings.output.indent}

Number of blank characters at the left margin for normal text,
default of `5` for `mdoc(7)` and `7` for
`man(7)`. Increasing this is not recommended; it may
result in degraded formatting, for example overfull lines or ugly
line breaks. When output is to a pager on a terminal that is less
than 66 columns wide, the default is reduced to three columns.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/misc/mandoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/mandoc.nix)

## `documentation.man.mandoc.settings.output.man` {#opt-documentation.man.mandoc.settings.output.man}

A template for linked manuals (usually via the Xr macro) in HTML
output. Instances of ‘%N’ and ‘%S’ are replaced with the linked
manual's name and section, respectively. If no section is included,
section 1 is assumed. The default is not to present a hyperlink.
If two formats are given and a file %N.%S exists in the current
directory, the first format is used; otherwise, the second format is used.

*Type:* null or string

*Default:* `null`

*Example:* `../html%S/%N.%S.html`

*Declared by:* [`nixos/modules/misc/mandoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/mandoc.nix)

## `documentation.man.mandoc.settings.output.paper` {#opt-documentation.man.mandoc.settings.output.paper}

This option is for generating PostScript and PDF output. The paper
size name may be one of `a3`, `a4`, `a5`, `legal`, or `letter`.
You may also manually specify dimensions as `NNxNN`, width by
height in millimetres. If an unknown value is encountered, letter
is used. Output pages default to letter sized and are rendered in
the Times font family, 11-point. Margins are calculated as 1/9 the
page length and width. Line-height is 1.4m.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/misc/mandoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/mandoc.nix)

## `documentation.man.mandoc.settings.output.style` {#opt-documentation.man.mandoc.settings.output.style}

Path to the file used for an external style-sheet. This must be a
valid absolute or relative URI.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/misc/mandoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/mandoc.nix)

## `documentation.man.mandoc.settings.output.toc` {#opt-documentation.man.mandoc.settings.output.toc}

Whether to enable printing a table of contents near the beginning of the HTML output
of `mandoc(1)` if an input file contains at least two
non-standard sections
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/misc/mandoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/mandoc.nix)

## `documentation.man.mandoc.settings.output.width` {#opt-documentation.man.mandoc.settings.output.width}

The ASCII and UTF-8 output width, default is `78`. When output is a
pager on a terminal that is less than 79 columns wide, the
default is reduced to one less than the terminal width. In any case,
lines that are output in literal mode are never wrapped and may
exceed the output width.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/misc/mandoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/mandoc.nix)

## `documentation.nixos.checkRedirects` {#opt-documentation.nixos.checkRedirects}

Check redirects for manualHTML.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/misc/documentation.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/documentation.nix)

## `documentation.nixos.enable` {#opt-documentation.nixos.enable}

Whether to install NixOS's own documentation.

- This includes man pages like
  `configuration.nix(5)` if [`documentation.man.enable`](#opt-documentation.man.enable) is
  set.
- This includes the HTML manual and the `nixos-help` command if
  [`documentation.doc.enable`](#opt-documentation.doc.enable) is set.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/misc/documentation.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/documentation.nix)

## `documentation.nixos.extraModuleSources` {#opt-documentation.nixos.extraModuleSources}

Which extra NixOS module paths the generated NixOS's documentation should strip
from options.

*Type:* list of (absolute path or string)

*Default:* `[ ]`

*Example:*

``` nix
# e.g. with options from modules in ${pkgs.customModules}/nix:
[ pkgs.customModules ]
```

*Declared by:* [`nixos/modules/misc/documentation.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/documentation.nix)

## `documentation.nixos.extraModules` {#opt-documentation.nixos.extraModules}

Modules for which to show options even when not imported.

*Type:* list of raw value

*Default:* `[ ]`

*Declared by:* [`nixos/modules/misc/documentation.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/documentation.nix)

## `documentation.nixos.includeAllModules` {#opt-documentation.nixos.includeAllModules}

Whether the generated NixOS's documentation should include documentation for all
the options from all the NixOS modules included in the current
`configuration.nix`. Disabling this will make the manual
generator to ignore options defined outside of `baseModules`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/misc/documentation.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/documentation.nix)

## `documentation.nixos.options.splitBuild` {#opt-documentation.nixos.options.splitBuild}

Whether to split the option docs build into a cacheable and an uncacheable part.
Splitting the build can substantially decrease the amount of time needed to build
the manual, but some user modules may be incompatible with this splitting.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/misc/documentation.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/documentation.nix)

## `documentation.nixos.options.warningsAreErrors` {#opt-documentation.nixos.options.warningsAreErrors}

Treat warning emitted during the option documentation build (eg for missing option
descriptions) as errors.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/misc/documentation.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/documentation.nix)
