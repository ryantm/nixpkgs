# fonts {#sec-options-fonts}

## `fonts.enableDefaultPackages` {#opt-fonts.enableDefaultPackages}

Enable a basic set of fonts providing several styles
and families and reasonable coverage of Unicode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/fonts/packages.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/packages.nix)

## `fonts.enableGhostscriptFonts` {#opt-fonts.enableGhostscriptFonts}

Whether to add the fonts provided by Ghostscript (such as
various URW fonts and the “Base-14” Postscript fonts) to the
list of system fonts, making them available to X11
applications.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/fonts/ghostscript.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/ghostscript.nix)

## `fonts.fontDir.decompressFonts` {#opt-fonts.fontDir.decompressFonts}

Whether to decompress fonts in
`/run/current-system/sw/share/X11/fonts`.

*Type:* boolean

*Default:* `config.programs.xwayland.enable`

*Declared by:* [`nixos/modules/config/fonts/fontdir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontdir.nix)

## `fonts.fontDir.enable` {#opt-fonts.fontDir.enable}

Whether to create a directory with links to all fonts in
`/run/current-system/sw/share/X11/fonts`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/fonts/fontdir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontdir.nix)

## `fonts.fontconfig.aliases` {#opt-fonts.fontconfig.aliases}

Font aliases that can substitute preferential fonts,
or specify custom fallback fonts.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
    # use FreeSans for Greek symbols missing in Helvetica
    "Helvetica" = {
        default = [ "FreeSans" ];
    };
};
```

*Declared by:* [`nixos/modules/config/fonts/fontconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontconfig.nix)

## `fonts.fontconfig.aliases.<name>.accept` {#opt-fonts.fontconfig.aliases._name_.accept}

Fonts that are chosen if none of the preferred
fonts, nor the alias family could provide the
desired glyph.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/config/fonts/fontconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontconfig.nix)

## `fonts.fontconfig.aliases.<name>.binding` {#opt-fonts.fontconfig.aliases._name_.binding}

Binding precedence for this font family. See
fontconfig "Font Matching" section for details.

*Type:* one of "same", "weak", "strong"

*Default:* `"same"`

*Declared by:* [`nixos/modules/config/fonts/fontconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontconfig.nix)

## `fonts.fontconfig.aliases.<name>.default` {#opt-fonts.fontconfig.aliases._name_.default}

Last chance fallback fonts which are chosen by
default if none of the other options could
provide the desired glyph.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/config/fonts/fontconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontconfig.nix)

## `fonts.fontconfig.aliases.<name>.prefer` {#opt-fonts.fontconfig.aliases._name_.prefer}

Fonts whose glyphs are chosen preferentially prior
to fonts which match the alias family.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/config/fonts/fontconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontconfig.nix)

## `fonts.fontconfig.allowBitmaps` {#opt-fonts.fontconfig.allowBitmaps}

Allow bitmap fonts. Set to `false` to ban all
bitmap fonts.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/fonts/fontconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontconfig.nix)

## `fonts.fontconfig.allowType1` {#opt-fonts.fontconfig.allowType1}

Allow Type-1 fonts. Default is `false` because of
poor rendering.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/fonts/fontconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontconfig.nix)

## `fonts.fontconfig.antialias` {#opt-fonts.fontconfig.antialias}

Enable font antialiasing. At high resolution (\> 200 DPI),
antialiasing has no visible effect; users of such displays may want
to disable this option.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/fonts/fontconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontconfig.nix)

## `fonts.fontconfig.cache32Bit` {#opt-fonts.fontconfig.cache32Bit}

Generate system fonts cache for 32-bit applications.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/fonts/fontconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontconfig.nix)

## `fonts.fontconfig.defaultFonts.emoji` {#opt-fonts.fontconfig.defaultFonts.emoji}

System-wide default emoji font(s). Multiple fonts may be listed
in case a font does not support all emoji.

Note that fontconfig matches color emoji fonts preferentially,
so if you want to use a black and white font while having
a color font installed (eg. Noto Color Emoji installed alongside
Noto Emoji), fontconfig will still choose the color font even
when it is later in the list.

*Type:* list of string

*Default:*

``` nix
[
  "Noto Color Emoji"
]
```

*Declared by:* [`nixos/modules/config/fonts/fontconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontconfig.nix)

## `fonts.fontconfig.defaultFonts.monospace` {#opt-fonts.fontconfig.defaultFonts.monospace}

System-wide default monospace font(s). Multiple fonts may be
listed in case multiple languages must be supported.

*Type:* list of string

*Default:*

``` nix
[
  "DejaVu Sans Mono"
]
```

*Declared by:* [`nixos/modules/config/fonts/fontconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontconfig.nix)

## `fonts.fontconfig.defaultFonts.sansSerif` {#opt-fonts.fontconfig.defaultFonts.sansSerif}

System-wide default sans serif font(s). Multiple fonts may be
listed in case multiple languages must be supported.

*Type:* list of string

*Default:*

``` nix
[
  "DejaVu Sans"
]
```

*Declared by:* [`nixos/modules/config/fonts/fontconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontconfig.nix)

## `fonts.fontconfig.defaultFonts.serif` {#opt-fonts.fontconfig.defaultFonts.serif}

System-wide default serif font(s). Multiple fonts may be listed
in case multiple languages must be supported.

*Type:* list of string

*Default:*

``` nix
[
  "DejaVu Serif"
]
```

*Declared by:* [`nixos/modules/config/fonts/fontconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontconfig.nix)

## `fonts.fontconfig.enable` {#opt-fonts.fontconfig.enable}

If enabled, a Fontconfig configuration file will be built
pointing to a set of default fonts.  If you don't care about
running X11 applications or any other program that uses
Fontconfig, you can turn this option off and prevent a
dependency on all those fonts.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/fonts/fontconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontconfig.nix)

## `fonts.fontconfig.hinting.autohint` {#opt-fonts.fontconfig.hinting.autohint}

Enable the autohinter in place of the default interpreter.
The results are usually lower quality than correctly-hinted
fonts, but better than unhinted fonts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/fonts/fontconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontconfig.nix)

## `fonts.fontconfig.hinting.enable` {#opt-fonts.fontconfig.hinting.enable}

Enable font hinting. Hinting aligns glyphs to pixel boundaries to
improve rendering sharpness at low resolution. At high resolution
(\> 200 dpi) hinting will do nothing (at best); users of such
displays may want to disable this option.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/fonts/fontconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontconfig.nix)

## `fonts.fontconfig.hinting.style` {#opt-fonts.fontconfig.hinting.style}

Hintstyle is the amount of font reshaping done to line up
to the grid.

slight will make the font more fuzzy to line up to the grid but
will be better in retaining font shape, while full will be a
crisp font that aligns well to the pixel grid but will lose a
greater amount of font shape.

*Type:* one of "none", "slight", "medium", "full"

*Default:* `"slight"`

*Declared by:* [`nixos/modules/config/fonts/fontconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontconfig.nix)

## `fonts.fontconfig.includeUserConf` {#opt-fonts.fontconfig.includeUserConf}

Include the user configuration from
`~/.config/fontconfig/fonts.conf` or
`~/.config/fontconfig/conf.d`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/fonts/fontconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontconfig.nix)

## `fonts.fontconfig.localConf` {#opt-fonts.fontconfig.localConf}

System-wide customization file contents, has higher priority than
`defaultFonts` settings.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/config/fonts/fontconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontconfig.nix)

## `fonts.fontconfig.package` {#opt-fonts.fontconfig.package}

The fontconfig package to use.

*Type:* package

*Default:* `pkgs.fontconfig`

*Declared by:* [`nixos/modules/config/fonts/fontconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontconfig.nix)

## `fonts.fontconfig.subpixel.lcdfilter` {#opt-fonts.fontconfig.subpixel.lcdfilter}

FreeType LCD filter. At high resolution (\> 200 DPI), LCD filtering
has no visible effect; users of such displays may want to select
`none`.

*Type:* one of "none", "default", "light", "legacy"

*Default:* `"default"`

*Declared by:* [`nixos/modules/config/fonts/fontconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontconfig.nix)

## `fonts.fontconfig.subpixel.rgba` {#opt-fonts.fontconfig.subpixel.rgba}

Subpixel order. The overwhelming majority of displays are
`rgb` in their normal orientation. Select
`vrgb` for mounting such a display 90 degrees
clockwise from its normal orientation or `vbgr`
for mounting 90 degrees counter-clockwise. Select
`bgr` in the unlikely event of mounting 180
degrees from the normal orientation. Reverse these directions in
the improbable event that the display's native subpixel order is
`bgr`.

*Type:* one of "rgb", "bgr", "vrgb", "vbgr", "none"

*Default:* `"none"`

*Declared by:* [`nixos/modules/config/fonts/fontconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontconfig.nix)

## `fonts.fontconfig.useEmbeddedBitmaps` {#opt-fonts.fontconfig.useEmbeddedBitmaps}

Use embedded bitmaps in fonts like Calibri.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/fonts/fontconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/fontconfig.nix)

## `fonts.packages` {#opt-fonts.packages}

List of primary font packages.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:* `[ pkgs.dejavu_fonts ]`

*Declared by:* [`nixos/modules/config/fonts/packages.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/packages.nix)
