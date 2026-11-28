# i18n {#sec-options-i18n}

## `i18n.defaultCharset` {#opt-i18n.defaultCharset}

The default locale character set.

*Type:* string

*Default:* `"UTF-8"`

*Example:* `"ISO-8859-8"`

*Declared by:* [`nixos/modules/config/i18n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/i18n.nix)

## `i18n.defaultLocale` {#opt-i18n.defaultLocale}

The default locale. It determines the language for program messages,
the format for dates and times, sort order, and so on. Setting the
default character set is done via [`i18n.defaultCharset`](#opt-i18n.defaultCharset).

*Type:* string

*Default:* `"en_US.UTF-8"`

*Example:* `"nl_NL.UTF-8"`

*Declared by:* [`nixos/modules/config/i18n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/i18n.nix)

## `i18n.extraLocaleSettings` {#opt-i18n.extraLocaleSettings}

A set of additional system-wide locale settings other than `LANG`
which can be configured with [`i18n.defaultLocale`](#opt-i18n.defaultLocale). Note that
the `/UTF-8` suffix used in [`i18n.extraLocales`](#opt-i18n.extraLocales) indicates a
character set, and it must not be added manually here. To use a
non-`UTF-8` character set such as ISO-XXXX-8, the
[`i18n.localeCharsets`](#opt-i18n.localeCharsets) can be used.

Note that if the [`LANGUAGE`
key](https://www.gnu.org/software/gettext/manual/html_node/The-LANGUAGE-variable.html)
is used in this option, it is ignored when computing the locales
required to be installed, because the possible values of this key are
more diverse and flexible then the others.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  LC_MESSAGES = "en_US.UTF-8";
  LC_TIME = "de_DE.UTF-8";
}
```

*Declared by:* [`nixos/modules/config/i18n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/i18n.nix)

## `i18n.extraLocales` {#opt-i18n.extraLocales}

Additional locales that the system should support, besides the ones
configured with [`i18n.defaultLocale`](#opt-i18n.defaultLocale) and
[`i18n.extraLocaleSettings`](#opt-i18n.extraLocaleSettings).
Set this to `"all"` to install all available locales.

*Type:* (list of string) or value "all" (singular enum)

*Default:* `[ ]`

*Example:*

``` nix
[
  "nl_NL.UTF-8/UTF-8"
]
```

*Declared by:* [`nixos/modules/config/i18n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/i18n.nix)

## `i18n.glibcLocales` {#opt-i18n.glibcLocales}

Customized pkg.glibcLocales package.

Changing this option can disable handling of i18n.defaultLocale
and supportedLocale.

*Type:* null or absolute path

*Default:*

``` nix
if pkgs.glibcLocales != null then
  pkgs.glibcLocales.override {
    allLocales = lib.elem "all" config.i18n.supportedLocales;
    locales = config.i18n.supportedLocales;
  }
else
  null
```

*Example:* `pkgs.glibcLocales`

*Declared by:* [`nixos/modules/config/i18n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/i18n.nix)

## `i18n.imperativeLocale` {#opt-i18n.imperativeLocale}

Whether to enable imperative locale and keyboard management via localectl.

When enabled, locale and keyboard settings can be changed at runtime
using `localectl set-locale` and `localectl set-keymap`.
When disabled (the default), these settings are managed declaratively
through [`i18n.defaultLocale`](#opt-i18n.defaultLocale), [`i18n.extraLocaleSettings`](#opt-i18n.extraLocaleSettings),
and [`console.keyMap`](../../options/other/index.md#opt-console.keyMap).
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/config/i18n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/i18n.nix)

## `i18n.inputMethod.enable` {#opt-i18n.inputMethod.enable}

Whether to enable an additional input method type.

*Type:* boolean

*Default:* `true` if the deprecated option `enabled` is set, false otherwise

*Example:* `true`

*Declared by:* [`nixos/modules/i18n/input-method/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/i18n/input-method/default.nix)

## `i18n.inputMethod.enableGtk2` {#opt-i18n.inputMethod.enableGtk2}

Whether to enable Gtk2 support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/i18n/input-method/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/i18n/input-method/default.nix)

## `i18n.inputMethod.enableGtk3` {#opt-i18n.inputMethod.enableGtk3}

Whether to enable Gtk3 support.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/i18n/input-method/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/i18n/input-method/default.nix)

## `i18n.inputMethod.enabled` {#opt-i18n.inputMethod.enabled}

Deprecated - use `type` and `enable = true` instead

*Type:* null or one of "ibus", "fcitx5", "nabi", "uim", "kime"

*Default:* `null`

*Example:* `"fcitx5"`

*Declared by:* [`nixos/modules/i18n/input-method/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/i18n/input-method/default.nix)

## `i18n.inputMethod.fcitx5.addons` {#opt-i18n.inputMethod.fcitx5.addons}

Enabled Fcitx5 addons.

*Type:* list of package

*Default:* `[ ]`

*Example:* `with pkgs; [ fcitx5-rime ]`

*Declared by:* [`nixos/modules/i18n/input-method/fcitx5.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/i18n/input-method/fcitx5.nix)

## `i18n.inputMethod.fcitx5.ignoreUserConfig` {#opt-i18n.inputMethod.fcitx5.ignoreUserConfig}

Ignore the user configures. **Warning**: When this is enabled, the
user config files are totally ignored and the user dict can't be saved
and loaded.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/i18n/input-method/fcitx5.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/i18n/input-method/fcitx5.nix)

## `i18n.inputMethod.fcitx5.quickPhrase` {#opt-i18n.inputMethod.fcitx5.quickPhrase}

Quick phrases.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  smile = "（・∀・）";
  angry = "(￣ー￣)";
}
```

*Declared by:* [`nixos/modules/i18n/input-method/fcitx5.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/i18n/input-method/fcitx5.nix)

## `i18n.inputMethod.fcitx5.quickPhraseFiles` {#opt-i18n.inputMethod.fcitx5.quickPhraseFiles}

Quick phrase files.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
{
  words = ./words.mb;
  numbers = ./numbers.mb;
}
```

*Declared by:* [`nixos/modules/i18n/input-method/fcitx5.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/i18n/input-method/fcitx5.nix)

## `i18n.inputMethod.fcitx5.settings.addons` {#opt-i18n.inputMethod.fcitx5.settings.addons}

The addon configures in `conf` folder in ini format with global sections.
Each item is written to the corresponding file.

*Type:* attribute set of anything

*Default:* `{ }`

*Example:* `{ pinyin.globalSection.EmojiEnabled = "True"; }`

*Declared by:* [`nixos/modules/i18n/input-method/fcitx5.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/i18n/input-method/fcitx5.nix)

## `i18n.inputMethod.fcitx5.settings.globalOptions` {#opt-i18n.inputMethod.fcitx5.settings.globalOptions}

The global options in `config` file in ini format.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/i18n/input-method/fcitx5.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/i18n/input-method/fcitx5.nix)

## `i18n.inputMethod.fcitx5.settings.inputMethod` {#opt-i18n.inputMethod.fcitx5.settings.inputMethod}

The input method configure in `profile` file in ini format.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/i18n/input-method/fcitx5.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/i18n/input-method/fcitx5.nix)

## `i18n.inputMethod.fcitx5.waylandFrontend` {#opt-i18n.inputMethod.fcitx5.waylandFrontend}

Use the Wayland input method frontend.
See [Using Fcitx 5 on Wayland](https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/i18n/input-method/fcitx5.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/i18n/input-method/fcitx5.nix)

## `i18n.inputMethod.ibus.engines` {#opt-i18n.inputMethod.ibus.engines}

Enabled IBus engines. Available engines are: `anthy`, `bamboo`, `cangjie`, `chewing`, `hangul`, `libpinyin`, `libthai`, `m17n`, `mozc`, `mozc-ut`, `pinyin`, `rime`, `table`, `table-chinese`, `table-others`, `typing-booster`, `typing-booster-unwrapped`, `uniemoji`.

*Type:* list of ibus-engine

*Default:* `[ ]`

*Example:* `with pkgs.ibus-engines; [ mozc hangul ]`

*Declared by:* [`nixos/modules/i18n/input-method/ibus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/i18n/input-method/ibus.nix)

## `i18n.inputMethod.ibus.panel` {#opt-i18n.inputMethod.ibus.panel}

Replace the IBus panel with another panel.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.kdePackages.plasma-desktop}/libexec/kimpanel-ibus-panel"`

*Declared by:* [`nixos/modules/i18n/input-method/ibus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/i18n/input-method/ibus.nix)

## `i18n.inputMethod.ibus.waylandFrontend` {#opt-i18n.inputMethod.ibus.waylandFrontend}

Use the Wayland input method frontend.
This doesn't set `QT_IM_MODULE` environment variable.
See [Using Fcitx 5 on Wayland](https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland#GTK_IM_MODULE).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/i18n/input-method/ibus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/i18n/input-method/ibus.nix)

## `i18n.inputMethod.kime.daemonModules` {#opt-i18n.inputMethod.kime.daemonModules}

List of enabled daemon modules

*Type:* list of (one of "Xim", "Wayland", "Indicator")

*Default:*

``` nix
[
  "Xim"
  "Wayland"
  "Indicator"
]
```

*Example:*

``` nix
[
  "Xim"
  "Indicator"
]
```

*Declared by:* [`nixos/modules/i18n/input-method/kime.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/i18n/input-method/kime.nix)

## `i18n.inputMethod.kime.extraConfig` {#opt-i18n.inputMethod.kime.extraConfig}

extra kime configuration. Refer to [https://github.com/Riey/kime/blob/v3.2.0/docs/CONFIGURATION.md](https://github.com/Riey/kime/blob/v3.2.0/docs/CONFIGURATION.md) for details on supported values.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/i18n/input-method/kime.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/i18n/input-method/kime.nix)

## `i18n.inputMethod.kime.iconColor` {#opt-i18n.inputMethod.kime.iconColor}

Color of the indicator icon

*Type:* one of "Black", "White"

*Default:* `"Black"`

*Example:* `"White"`

*Declared by:* [`nixos/modules/i18n/input-method/kime.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/i18n/input-method/kime.nix)

## `i18n.inputMethod.type` {#opt-i18n.inputMethod.type}

Select the enabled input method. Input methods is a software to input symbols that are not available on standard input devices.

Input methods are specially used to input Chinese, Japanese and Korean characters.

Currently the following input methods are available in NixOS:

- ibus: The intelligent input bus, extra input engines can be added using `i18n.inputMethod.ibus.engines`.
- fcitx5: The next generation of fcitx, addons (including engines, dictionaries, skins) can be added using `i18n.inputMethod.fcitx5.addons`.
- nabi: A Korean input method based on XIM. Nabi doesn't support Qt 5.
- uim: The universal input method, is a library with a XIM bridge. uim mainly support Chinese, Japanese and Korean.
- kime: Koream IME.

*Type:* null or one of "ibus", "fcitx5", "nabi", "uim", "kime"

*Default:* The value of the deprecated option `enabled`, defaulting to null

*Example:* `"fcitx5"`

*Declared by:* [`nixos/modules/i18n/input-method/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/i18n/input-method/default.nix)

## `i18n.inputMethod.uim.toolbar` {#opt-i18n.inputMethod.uim.toolbar}

selected UIM toolbar.

*Type:* one of "gtk", "gtk3", "gtk-systray", "gtk3-systray", "qt5"

*Default:* `"gtk"`

*Example:* `"gtk-systray"`

*Declared by:* [`nixos/modules/i18n/input-method/uim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/i18n/input-method/uim.nix)

## `i18n.localeCharsets` {#opt-i18n.localeCharsets}

Per each [`i18n.extraLocaleSettings`](#opt-i18n.extraLocaleSettings), choose the character set
to use for it. Essentially defaults to UTF-8 for all of them.

Note that for a locale category that uses the `C` locale, setting a
character set to it via this setting is ignored.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  LC_MESSAGES = "ISO-8859-15";
  LC_TIME = "ISO-8859-1";
}
```

*Declared by:* [`nixos/modules/config/i18n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/i18n.nix)
