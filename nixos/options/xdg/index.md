# xdg {#sec-options-xdg}

## `xdg.autostart.enable` {#opt-xdg.autostart.enable}

Whether to enable auto-starting of desktop applications according to the [XDG Autostart specification](https://specifications.freedesktop.org/autostart-spec/latest)..

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/config/xdg/autostart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/autostart.nix)

## `xdg.autostart.install` {#opt-xdg.autostart.install}

Whether to enable install desktop files following the [XDG Autostart specification](https://specifications.freedesktop.org/autostart-spec/latest) into `/etc/xdg/autostart/`.

These are handled by your desktop environment or [`systemd-xdg-autostart-generator`](https://www.freedesktop.org/software/systemd/man/latest/systemd-xdg-autostart-generator.html).
.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/config/xdg/autostart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/autostart.nix)

## `xdg.directories.cache-home` {#opt-xdg.directories.cache-home}

Value of `$XDG_CACHE_HOME` environment variable

*Type:* string

*Default:* `"$HOME/.cache/"`

*Declared by:* [`nixos/modules/config/xdg/directories.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/directories.nix)

## `xdg.directories.config-home` {#opt-xdg.directories.config-home}

Value of `$XDG_CONFIG_HOME` environment variable

*Type:* string

*Default:* `"$HOME/.config/"`

*Declared by:* [`nixos/modules/config/xdg/directories.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/directories.nix)

## `xdg.directories.data-home` {#opt-xdg.directories.data-home}

Value of `$XDG_DATA_HOME` environment variable

*Type:* string

*Default:* `"$HOME/.local/share/"`

*Declared by:* [`nixos/modules/config/xdg/directories.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/directories.nix)

## `xdg.directories.enable` {#opt-xdg.directories.enable}

Whether to define environment variables for some directories from
[XDG Base Directory specification](https://specifications.freedesktop.org/basedir-spec/latest/).
Namely:

- `$XDG_CACHE_HOME`
- `$XDG_CONFIG_HOME`
- `$XDG_DATA_HOME`
- `$XDG_STATE_HOME`

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/xdg/directories.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/directories.nix)

## `xdg.directories.state-home` {#opt-xdg.directories.state-home}

Value of `$XDG_STATE_HOME` environment variable

*Type:* string

*Default:* `"$HOME/.local/state/"`

*Declared by:* [`nixos/modules/config/xdg/directories.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/directories.nix)

## `xdg.icons.enable` {#opt-xdg.icons.enable}

Whether to install files to support the
[XDG Icon Theme specification](https://specifications.freedesktop.org/icon-theme-spec/latest).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/xdg/icons.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/icons.nix)

## `xdg.icons.fallbackCursorThemes` {#opt-xdg.icons.fallbackCursorThemes}

Names of the fallback cursor themes, in order of preference, to be used when no other icon source can be found.
Set to `[]` to disable the fallback entirely.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/config/xdg/icons.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/icons.nix)

## `xdg.menus.enable` {#opt-xdg.menus.enable}

Whether to install files to support the
[XDG Desktop Menu specification](https://specifications.freedesktop.org/menu-spec/latest).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/xdg/menus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/menus.nix)

## `xdg.mime.addedAssociations` {#opt-xdg.mime.addedAssociations}

Adds associations between mimetypes and applications. See the
[specifications](https://specifications.freedesktop.org/mime-apps-spec/latest/associations) for more information.
Globs in all variations are supported.

*Type:* attribute set of (string or ((list of string) or string) convertible to it)

*Default:* `{ }`

*Example:*

``` nix
{
  "application/pdf" = "firefox.desktop";
  "text/*" = [
    "nvim.desktop"
    "codium.desktop"
  ];
}
```

*Declared by:* [`nixos/modules/config/xdg/mime.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/mime.nix)

## `xdg.mime.defaultApplications` {#opt-xdg.mime.defaultApplications}

Sets the default applications for given mimetypes. See the
[specifications](https://specifications.freedesktop.org/mime-apps-spec/latest/default) for more information.
Globs in all variations are supported.

*Type:* attribute set of (string or ((list of string) or string) convertible to it)

*Default:* `{ }`

*Example:*

``` nix
{
  "application/pdf" = "firefox.desktop";
  "image/*" = [
    "sxiv.desktop"
    "gimp.desktop"
  ];
}
```

*Declared by:* [`nixos/modules/config/xdg/mime.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/mime.nix)

## `xdg.mime.enable` {#opt-xdg.mime.enable}

Whether to install files to support the
[XDG Shared MIME-info specification](https://specifications.freedesktop.org/shared-mime-info-spec/latest) and the
[XDG MIME Applications specification](https://specifications.freedesktop.org/mime-apps-spec/latest).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/xdg/mime.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/mime.nix)

## `xdg.mime.removedAssociations` {#opt-xdg.mime.removedAssociations}

Removes associations between mimetypes and applications. See the
[specifications](https://specifications.freedesktop.org/mime-apps-spec/latest/associations) for more information.
Globs in all variations are supported.

*Type:* attribute set of (string or ((list of string) or string) convertible to it)

*Default:* `{ }`

*Example:*

``` nix
{
  "audio/*" = [
    "mpv.desktop"
    "umpv.desktop"
  ];
  "inode/directory" = "codium.desktop";
}
```

*Declared by:* [`nixos/modules/config/xdg/mime.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/mime.nix)

## `xdg.portal.config` {#opt-xdg.portal.config}

Sets which portal backend should be used to provide the implementation
for the requested interface. For details check `portals.conf(5)`.

Configs will be linked to `/etc/xdg/xdg-desktop-portal/` with the name `$desktop-portals.conf`
for `xdg.portal.config.$desktop` and `portals.conf` for `xdg.portal.config.common`
as an exception.

*Type:* attribute set of attribute set of (string or ((list of string) or string) convertible to it)

*Default:* `{ }`

*Example:*

``` nix
{
  common = {
    default = [
      "gtk"
    ];
  };
  pantheon = {
    default = [
      "pantheon"
      "gtk"
    ];
    "org.freedesktop.impl.portal.Secret" = [
      "gnome-keyring"
    ];
  };
  x-cinnamon = {
    default = [
      "xapp"
      "gtk"
    ];
  };
}
```

*Declared by:* [`nixos/modules/config/xdg/portal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/portal.nix)

## `xdg.portal.configPackages` {#opt-xdg.portal.configPackages}

List of packages that provide XDG desktop portal configuration, usually in
the form of `share/xdg-desktop-portal/$desktop-portals.conf`.

Note that configs in `xdg.portal.config` will be preferred if set.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.gnome-session ]`

*Declared by:* [`nixos/modules/config/xdg/portal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/portal.nix)

## `xdg.portal.enable` {#opt-xdg.portal.enable}

Whether to enable [xdg desktop integration](https://github.com/flatpak/xdg-desktop-portal).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/config/xdg/portal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/portal.nix)

## `xdg.portal.extraPortals` {#opt-xdg.portal.extraPortals}

List of additional portals to add to path. Portals allow interaction
with system, like choosing files or taking screenshots. At minimum,
a desktop portal implementation should be listed. GNOME and KDE already
adds `xdg-desktop-portal-gtk`; and
`xdg-desktop-portal-kde` respectively. On other desktop
environments you probably want to add them yourself.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/config/xdg/portal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/portal.nix)

## `xdg.portal.lxqt.enable` {#opt-xdg.portal.lxqt.enable}

Whether to enable the desktop portal for the LXQt desktop environment.

This will add the `lxqt.xdg-desktop-portal-lxqt`
package (with the extra Qt styles) into the
[`xdg.portal.extraPortals`](#opt-xdg.portal.extraPortals) option
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/config/xdg/portals/lxqt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/portals/lxqt.nix)

## `xdg.portal.lxqt.styles` {#opt-xdg.portal.lxqt.styles}

Extra Qt styles that will be available to the
`lxqt.xdg-desktop-portal-lxqt`.

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
[
  pkgs.libsForQt5.qtstyleplugin-kvantum
  pkgs.breeze-qt5
];
```

*Declared by:* [`nixos/modules/config/xdg/portals/lxqt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/portals/lxqt.nix)

## `xdg.portal.wlr.enable` {#opt-xdg.portal.wlr.enable}

Whether to enable desktop portal for wlroots-based desktops.

This will add the `xdg-desktop-portal-wlr` package into
the [`xdg.portal.extraPortals`](#opt-xdg.portal.extraPortals) option, and provide the
configuration file
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/config/xdg/portals/wlr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/portals/wlr.nix)

## `xdg.portal.wlr.settings` {#opt-xdg.portal.wlr.settings}

Configuration for `xdg-desktop-portal-wlr`.

See `xdg-desktop-portal-wlr(5)` for supported
values.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  screencast = {
    output_name = "HDMI-A-1";
    max_fps = 30;
    exec_before = "disable_notifications.sh";
    exec_after = "enable_notifications.sh";
    chooser_type = "simple";
    chooser_cmd = "${pkgs.slurp}/bin/slurp -f 'Monitor: %o' -or";
  };
}
```

*Declared by:* [`nixos/modules/config/xdg/portals/wlr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/portals/wlr.nix)

## `xdg.portal.xdgOpenUsePortal` {#opt-xdg.portal.xdgOpenUsePortal}

Sets environment variable `NIXOS_XDG_OPEN_USE_PORTAL` to `1`
This will make `xdg-open` use the portal to open programs, which resolves bugs involving
programs opening inside FHS envs or with unexpected env vars set from wrappers.
See [#160923](https://github.com/NixOS/nixpkgs/issues/160923) for more info.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/xdg/portal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/portal.nix)

## `xdg.sounds.enable` {#opt-xdg.sounds.enable}

Whether to install files to support the
[XDG Sound Theme specification](https://www.freedesktop.org/wiki/Specifications/sound-theme-spec/).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/xdg/sounds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/sounds.nix)

## `xdg.terminal-exec.enable` {#opt-xdg.terminal-exec.enable}

Whether to enable xdg-terminal-exec, the [proposed](https://gitlab.freedesktop.org/xdg/xdg-specs/-/merge_requests/46) Default Terminal Execution Specification.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/config/xdg/terminal-exec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/terminal-exec.nix)

## `xdg.terminal-exec.package` {#opt-xdg.terminal-exec.package}

The xdg-terminal-exec package to use.

*Type:* package

*Default:* `pkgs.xdg-terminal-exec`

*Declared by:* [`nixos/modules/config/xdg/terminal-exec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/terminal-exec.nix)

## `xdg.terminal-exec.settings` {#opt-xdg.terminal-exec.settings}

Configuration options for the Default Terminal Execution Specification.

The keys are the desktop environments that are matched (case-insensitively) against `$XDG_CURRENT_DESKTOP`,
or `default` which is used when the current desktop environment is not found in the configuration.
The values are a list of terminals' [desktop file IDs](https://specifications.freedesktop.org/desktop-entry-spec/latest/ar01s02.html#desktop-file-id) to try in order of decreasing priority.

*Type:* attribute set of list of string

*Default:* `{ }`

*Example:*

``` nix
{
  GNOME = [
    "com.raggesilver.BlackBox.desktop"
    "org.gnome.Terminal.desktop"
  ];
  default = [
    "kitty.desktop"
  ];
}
```

*Declared by:* [`nixos/modules/config/xdg/terminal-exec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/xdg/terminal-exec.nix)
