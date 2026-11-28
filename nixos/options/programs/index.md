# programs {#sec-options-programs}

## `programs._1password-gui.enable` {#opt-programs._1password-gui.enable}

Whether to enable the 1Password GUI application.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/_1password-gui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/_1password-gui.nix)

## `programs._1password-gui.package` {#opt-programs._1password-gui.package}

The 1Password GUI package to use.

*Type:* package

*Default:* `pkgs._1password-gui`

*Declared by:* [`nixos/modules/programs/_1password-gui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/_1password-gui.nix)

## `programs._1password-gui.polkitPolicyOwners` {#opt-programs._1password-gui.polkitPolicyOwners}

A list of users who should be able to integrate 1Password with polkit-based authentication mechanisms.

*Type:* list of string

*Default:* `[ ]`

*Example:* `["user1" "user2" "user3"]`

*Declared by:* [`nixos/modules/programs/_1password-gui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/_1password-gui.nix)

## `programs._1password.enable` {#opt-programs._1password.enable}

Whether to enable the 1Password CLI tool.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/_1password.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/_1password.nix)

## `programs._1password.package` {#opt-programs._1password.package}

The 1Password CLI package to use.

*Type:* package

*Default:* `pkgs._1password-cli`

*Declared by:* [`nixos/modules/programs/_1password.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/_1password.nix)

## `programs.alvr.enable` {#opt-programs.alvr.enable}

Whether to enable ALVR, the VR desktop streamer.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/alvr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/alvr.nix)

## `programs.alvr.openFirewall` {#opt-programs.alvr.openFirewall}

Whether to open the default ports in the firewall for the ALVR server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/alvr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/alvr.nix)

## `programs.alvr.package` {#opt-programs.alvr.package}

The alvr package to use.

*Type:* package

*Default:* `pkgs.alvr`

*Declared by:* [`nixos/modules/programs/alvr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/alvr.nix)

## `programs.amnezia-vpn.enable` {#opt-programs.amnezia-vpn.enable}

Whether to enable The AmneziaVPN client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/amnezia-vpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/amnezia-vpn.nix)

## `programs.amnezia-vpn.package` {#opt-programs.amnezia-vpn.package}

The amnezia-vpn package to use.

*Type:* package

*Default:* `pkgs.amnezia-vpn`

*Declared by:* [`nixos/modules/programs/amnezia-vpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/amnezia-vpn.nix)

## `programs.appgate-sdp.enable` {#opt-programs.appgate-sdp.enable}

Whether to enable the AppGate SDP VPN client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/appgate-sdp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/appgate-sdp.nix)

## `programs.appimage.binfmt` {#opt-programs.appimage.binfmt}

Whether to enable binfmt registration to run appimages via appimage-run seamlessly.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/appimage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/appimage.nix)

## `programs.appimage.enable` {#opt-programs.appimage.enable}

Whether to enable appimage-run wrapper script for executing appimages on NixOS.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/appimage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/appimage.nix)

## `programs.appimage.package` {#opt-programs.appimage.package}

The appimage-run package to use.

*Type:* package

*Default:* `pkgs.appimage-run`

*Example:*

``` nix
pkgs.appimage-run.override {
  extraPkgs = pkgs: [ pkgs.ffmpeg pkgs.imagemagick ];
}
```

*Declared by:* [`nixos/modules/programs/appimage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/appimage.nix)

## `programs.arp-scan.enable` {#opt-programs.arp-scan.enable}

Whether to configure a setcap wrapper for arp-scan.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/arp-scan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/arp-scan.nix)

## `programs.atop.atopRotateTimer.enable` {#opt-programs.atop.atopRotateTimer.enable}

Whether to enable the atop-rotate timer, which restarts the atop service
daily to make sure the data files are rotate.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/atop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/atop.nix)

## `programs.atop.atopService.enable` {#opt-programs.atop.atopService.enable}

Whether to enable the atop service responsible for storing statistics for
long-term analysis.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/atop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/atop.nix)

## `programs.atop.atopacctService.enable` {#opt-programs.atop.atopacctService.enable}

Whether to enable the atopacct service which manages process accounting.
This allows Atop to gather data about processes that disappeared in between
two refresh intervals.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/atop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/atop.nix)

## `programs.atop.atopgpu.enable` {#opt-programs.atop.atopgpu.enable}

Whether to install and enable the atopgpud daemon to get information about
NVIDIA gpus.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/atop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/atop.nix)

## `programs.atop.enable` {#opt-programs.atop.enable}

Whether to enable Atop, a tool for monitoring system resources.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/atop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/atop.nix)

## `programs.atop.netatop.enable` {#opt-programs.atop.netatop.enable}

Whether to install and enable the netatop kernel module.
Note: this sets the kernel taint flag "O" for loading out-of-tree modules.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/atop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/atop.nix)

## `programs.atop.netatop.package` {#opt-programs.atop.netatop.package}

Which package to use for netatop.

*Type:* package

*Default:* `config.boot.kernelPackages.netatop`

*Declared by:* [`nixos/modules/programs/atop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/atop.nix)

## `programs.atop.package` {#opt-programs.atop.package}

The atop package to use.

*Type:* package

*Default:* `pkgs.atop`

*Declared by:* [`nixos/modules/programs/atop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/atop.nix)

## `programs.atop.settings` {#opt-programs.atop.settings}

Parameters to be written to `/etc/atoprc`.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  flags = "a1f";
  interval = 5;
}
```

*Declared by:* [`nixos/modules/programs/atop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/atop.nix)

## `programs.atop.setuidWrapper.enable` {#opt-programs.atop.setuidWrapper.enable}

Whether to install a setuid wrapper for Atop. This is required to use some of
the features as non-root user (e.g.: ipc information, netatop, atopgpu).
Atop tries to drop the root privileges shortly after starting.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/atop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/atop.nix)

## `programs.atuin.daemon.enable` {#opt-programs.atuin.daemon.enable}

Whether to enable the Atuin daemon.

*Type:* boolean

*Default:* `pkgs.stdenv.hostPlatform.isLinux`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/atuin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/atuin.nix)

## `programs.atuin.daemon.logLevel` {#opt-programs.atuin.daemon.logLevel}

Log level for the Atuin daemon.

*Type:* one of "trace", "debug", "info", "warn", "error"

*Default:* `"info"`

*Declared by:* [`nixos/modules/programs/atuin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/atuin.nix)

## `programs.atuin.enable` {#opt-programs.atuin.enable}

Whether to enable atuin.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/atuin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/atuin.nix)

## `programs.atuin.enableBashIntegration` {#opt-programs.atuin.enableBashIntegration}

Whether to enable Bash integration.

*Type:* boolean

*Default:* `config.programs.bash.enable`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/atuin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/atuin.nix)

## `programs.atuin.enableFishIntegration` {#opt-programs.atuin.enableFishIntegration}

Whether to enable Fish integration.

*Type:* boolean

*Default:* `config.programs.fish.enable`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/atuin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/atuin.nix)

## `programs.atuin.enableZshIntegration` {#opt-programs.atuin.enableZshIntegration}

Whether to enable Zsh integration.

*Type:* boolean

*Default:* `config.programs.zsh.enable`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/atuin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/atuin.nix)

## `programs.atuin.flags` {#opt-programs.atuin.flags}

Flags to append to the shell hook.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--disable-up-arrow"
  "--disable-ctrl-r"
]
```

*Declared by:* [`nixos/modules/programs/atuin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/atuin.nix)

## `programs.atuin.package` {#opt-programs.atuin.package}

The atuin package to use.

*Type:* package

*Default:* `pkgs.atuin`

*Declared by:* [`nixos/modules/programs/atuin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/atuin.nix)

## `programs.atuin.settings` {#opt-programs.atuin.settings}

Configuration written to `/etc/atuin/config.toml`.

See [https://docs.atuin.sh/latest/configuration/config/](https://docs.atuin.sh/latest/configuration/config/) for the full list
of options.

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  auto_sync = true;
  sync_frequency = "5m";
  sync_address = "https://api.atuin.sh";
  search_mode = "prefix";
}
```

*Declared by:* [`nixos/modules/programs/atuin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/atuin.nix)

## `programs.atuin.themes` {#opt-programs.atuin.themes}

Each theme is written to
`/etc/atuin/themes/theme-name.toml`
where the name of each attribute is the theme-name

See [https://docs.atuin.sh/latest/guide/theming/](https://docs.atuin.sh/latest/guide/theming/) for the full list
of options.

*Type:* attribute set of (TOML value or absolute path or strings concatenated with "\\n")

*Default:* `{ }`

*Example:*

``` nix
{
  "my-theme" = {
    theme.name = "My Theme";
    colors = {
      Base = "#000000";
      Title = "#FFFFFF";
    };
  };
}
```

*Declared by:* [`nixos/modules/programs/atuin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/atuin.nix)

## `programs.ausweisapp.enable` {#opt-programs.ausweisapp.enable}

Whether to enable AusweisApp.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/ausweisapp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ausweisapp.nix)

## `programs.ausweisapp.openFirewall` {#opt-programs.ausweisapp.openFirewall}

Whether to open the required firewall ports for the Smartphone as Card Reader (SaC) functionality of AusweisApp.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/ausweisapp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ausweisapp.nix)

## `programs.autoenv.enable` {#opt-programs.autoenv.enable}

Whether to enable autoenv.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/autoenv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/autoenv.nix)

## `programs.autoenv.package` {#opt-programs.autoenv.package}

The autoenv package to use.

*Type:* package

*Default:* `pkgs.autoenv`

*Declared by:* [`nixos/modules/programs/autoenv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/autoenv.nix)

## `programs.autojump.enable` {#opt-programs.autojump.enable}

Whether to enable autojump.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/autojump.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/autojump.nix)

## `programs.bandwhich.enable` {#opt-programs.bandwhich.enable}

Whether to add bandwhich to the global environment and configure a
setcap wrapper for it.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/bandwhich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bandwhich.nix)

## `programs.bash-my-aws.enable` {#opt-programs.bash-my-aws.enable}

Whether to enable bash-my-aws.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/bash-my-aws.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bash-my-aws.nix)

## `programs.bash.blesh.enable` {#opt-programs.bash.blesh.enable}

Whether to enable blesh, a full-featured line editor written in pure Bash.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/bash/blesh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bash/blesh.nix)

## `programs.bash.completion.enable` {#opt-programs.bash.completion.enable}

Whether to enable Bash completion for all interactive bash shells.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/bash/bash-completion.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bash/bash-completion.nix)

## `programs.bash.completion.package` {#opt-programs.bash.completion.package}

The bash-completion package to use.

*Type:* package

*Default:* `pkgs.bash-completion`

*Declared by:* [`nixos/modules/programs/bash/bash-completion.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bash/bash-completion.nix)

## `programs.bash.enable` {#opt-programs.bash.enable}

Whenever to configure Bash as an interactive shell.
Note that this tries to make Bash the default
[`users.defaultUserShell`](../../options/users/index.md#opt-users.defaultUserShell),
which in turn means that you might need to explicitly
set this variable if you have another shell configured
with NixOS.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/bash/bash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bash/bash.nix)

## `programs.bash.enableLsColors` {#opt-programs.bash.enableLsColors}

Whether to enable extra colors in directory listings.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/bash/ls-colors.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bash/ls-colors.nix)

## `programs.bash.interactiveShellInit` {#opt-programs.bash.interactiveShellInit}

Shell script code called during interactive bash shell initialisation.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/programs/bash/bash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bash/bash.nix)

## `programs.bash.loginShellInit` {#opt-programs.bash.loginShellInit}

Shell script code called during login bash shell initialisation.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/programs/bash/bash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bash/bash.nix)

## `programs.bash.logout` {#opt-programs.bash.logout}

Shell script code called during login bash shell logout.

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  printf '\e]0;\a'
''
```

*Declared by:* [`nixos/modules/programs/bash/bash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bash/bash.nix)

## `programs.bash.lsColorsFile` {#opt-programs.bash.lsColorsFile}

Alternative colorscheme for ls colors

*Type:* null or absolute path

*Default:* `null`

*Example:* `${pkgs.dircolors-solarized}/ansi-dark`

*Declared by:* [`nixos/modules/programs/bash/ls-colors.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bash/ls-colors.nix)

## `programs.bash.promptInit` {#opt-programs.bash.promptInit}

Shell script code used to initialise the bash prompt.

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  # Provide a nice prompt if the terminal supports it.
  if [ "$TERM" != "dumb" ] || [ -n "$INSIDE_EMACS" ]; then
    PROMPT_COLOR="1;31m"
    ((UID)) && PROMPT_COLOR="1;32m"
    if [ -n "$INSIDE_EMACS" ]; then
      # Emacs term mode doesn't support xterm title escape sequence (\e]0;)
      PS1="\n\[\033[$PROMPT_COLOR\][\u@\h:\w]\\$\[\033[0m\] "
    else
      PS1="\n\[\033[$PROMPT_COLOR\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\\$\[\033[0m\] "
    fi
    if test "$TERM" = "xterm"; then
      PS1="\[\033]2;\h:\u:\w\007\]$PS1"
    fi
  fi
''
```

*Declared by:* [`nixos/modules/programs/bash/bash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bash/bash.nix)

## `programs.bash.shellAliases` {#opt-programs.bash.shellAliases}

Set of aliases for bash shell, which overrides [`environment.shellAliases`](../../options/environment/index.md#opt-environment.shellAliases).
See [`environment.shellAliases`](../../options/environment/index.md#opt-environment.shellAliases) for an option format description.

*Type:* attribute set of (null or string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/bash/bash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bash/bash.nix)

## `programs.bash.shellInit` {#opt-programs.bash.shellInit}

Shell script code called during bash shell initialisation.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/programs/bash/bash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bash/bash.nix)

## `programs.bash.undistractMe.enable` {#opt-programs.bash.undistractMe.enable}

Whether to enable notifications when long-running terminal commands complete.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/bash/undistract-me.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bash/undistract-me.nix)

## `programs.bash.undistractMe.playSound` {#opt-programs.bash.undistractMe.playSound}

Whether to enable notification sounds when long-running terminal commands complete.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/bash/undistract-me.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bash/undistract-me.nix)

## `programs.bash.undistractMe.timeout` {#opt-programs.bash.undistractMe.timeout}

Number of seconds it would take for a command to be considered long-running.

*Type:* signed integer

*Default:* `10`

*Declared by:* [`nixos/modules/programs/bash/undistract-me.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bash/undistract-me.nix)

## `programs.bash.vteIntegration` {#opt-programs.bash.vteIntegration}

Whether to enable Bash integration for VTE terminals.
This allows it to preserve the current directory of the shell
across terminals.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/vte.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/vte.nix)

## `programs.bat.enable` {#opt-programs.bat.enable}

Whether to enable `bat`, a `cat(1)` clone with wings.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/bat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bat.nix)

## `programs.bat.extraPackages` {#opt-programs.bat.extraPackages}

Extra `bat` scripts to be added to the system configuration.

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
with pkgs.bat-extras; [
  batdiff
  batman
  prettybat
];
```

*Declared by:* [`nixos/modules/programs/bat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bat.nix)

## `programs.bat.package` {#opt-programs.bat.package}

The bat package to use.

*Type:* package

*Default:* `pkgs.bat`

*Declared by:* [`nixos/modules/programs/bat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bat.nix)

## `programs.bat.settings` {#opt-programs.bat.settings}

Parameters to be written to the system-wide `bat` configuration file.

*Type:* attribute set of (atom (null, bool, int, float or string) or a list of them for duplicate keys)

*Default:* `{ }`

*Example:*

``` nix
{
  italic-text = "always";
  map-syntax = [
    "*.ino:C++"
    ".ignore:Git Ignore"
  ];
  pager = "less --RAW-CONTROL-CHARS --quit-if-one-screen --mouse";
  paging = "never";
  theme = "TwoDark";
}
```

*Declared by:* [`nixos/modules/programs/bat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bat.nix)

## `programs.bazecor.enable` {#opt-programs.bazecor.enable}

Whether to enable Bazecor, the graphical configurator for Dygma Products.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/bazecor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bazecor.nix)

## `programs.bazecor.package` {#opt-programs.bazecor.package}

The bazecor package to use.

*Type:* package

*Default:* `pkgs.bazecor`

*Declared by:* [`nixos/modules/programs/bazecor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bazecor.nix)

## `programs.bcc.enable` {#opt-programs.bcc.enable}

Whether to enable bcc, tools for BPF-based Linux IO analysis, networking, monitoring, and more.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/bcc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/bcc.nix)

## `programs.benchexec.enable` {#opt-programs.benchexec.enable}

Whether to enable BenchExec.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/benchexec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/benchexec.nix)

## `programs.benchexec.package` {#opt-programs.benchexec.package}

The benchexec package to use.

*Type:* package

*Default:* `pkgs.benchexec`

*Declared by:* [`nixos/modules/programs/benchexec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/benchexec.nix)

## `programs.benchexec.users` {#opt-programs.benchexec.users}

Users that intend to use BenchExec.
Provide usernames of users that are configured via [`users.users`](../../options/users/index.md#opt-users.users) as string,
and UIDs of "mutable users" as integers.
Control group delegation will be configured via systemd.
For more information, see [https://github.com/sosy-lab/benchexec/blob/3.18/doc/INSTALL.md#setting-up-cgroups](https://github.com/sosy-lab/benchexec/blob/3.18/doc/INSTALL.md#setting-up-cgroups).

*Type:* list of (string or signed integer)

*Default:* `[ ]`

*Example:*

``` nix
[
  "alice" # username of a user configured via users.users
  1007    # UID of a mutable user
]
```

*Declared by:* [`nixos/modules/programs/benchexec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/benchexec.nix)

## `programs.brave.enable` {#opt-programs.brave.enable}

Whether to enable the Brave web browser.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/brave.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/brave.nix)

## `programs.brave.extensions` {#opt-programs.brave.extensions}

List of Brave (Chromium-style) extensions to force-install.
These work the same way as Chromium extensions: a Chrome Web Store ID,
optionally followed by `;url-to-update-manifest.xml`.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/programs/brave.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/brave.nix)

## `programs.brave.package` {#opt-programs.brave.package}

The brave package to use.

*Type:* package

*Default:* `pkgs.brave`

*Declared by:* [`nixos/modules/programs/brave.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/brave.nix)

## `programs.brave.policies` {#opt-programs.brave.policies}

Additional Brave Enterprise policy settings.
These follow the same format as Chromium policies:
[https://support.brave.app/hc/en-us/articles/360039248271-Group-Policy](https://support.brave.app/hc/en-us/articles/360039248271-Group-Policy)

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  BraveRewardsDisabled = false;
  MetricsReportingEnabled = false;
  SyncDisabled = true;
}
```

*Declared by:* [`nixos/modules/programs/brave.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/brave.nix)

## `programs.browserpass.enable` {#opt-programs.browserpass.enable}

Whether to enable Browserpass native messaging host.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/browserpass.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/browserpass.nix)

## `programs.btrfs-heatmap.enable` {#opt-programs.btrfs-heatmap.enable}

Whether to enable btrfs-heatmap + setcap wrapper.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/btrfs-heatmap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/btrfs-heatmap.nix)

## `programs.btrfs-heatmap.package` {#opt-programs.btrfs-heatmap.package}

The btrfs-heatmap package to use.

*Type:* package

*Default:* `pkgs.btrfs-heatmap`

*Declared by:* [`nixos/modules/programs/btrfs-heatmap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/btrfs-heatmap.nix)

## `programs.calls.enable` {#opt-programs.calls.enable}

Whether to enable GNOME calls: a phone dialer and call handler
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/calls.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/calls.nix)

## `programs.captive-browser.bindInterface` {#opt-programs.captive-browser.bindInterface}

Binds `captive-browser` to the network interface declared in
`cfg.interface`. This can be used to avoid collisions
with private subnets.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/captive-browser.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/captive-browser.nix)

## `programs.captive-browser.browser` {#opt-programs.captive-browser.browser}

The shell (/bin/sh) command executed once the proxy starts.
When browser exits, the proxy exits. An extra env var PROXY is available.

Here, we use a separate Chrome instance in Incognito mode, so that
it can run (and be waited for) alongside the default one, and that
it maintains no state across runs. To configure this browser open a
normal window in it, settings will be preserved.

@volth: chromium is to open a plain HTTP (not HTTPS nor redirect to HTTPS!) website.
upstream uses http://example.com but I have seen captive portals whose DNS server resolves "example.com" to 127.0.0.1

*Type:* string

*Default:* `env XDG_CONFIG_HOME="$PREV_CONFIG_HOME" ${pkgs.chromium}/bin/chromium --user-data-dir=${XDG_DATA_HOME:-$HOME/.local/share}/chromium-captive --proxy-server="socks5://$PROXY" --proxy-bypass-list="<-loopback>" --no-first-run --new-window --incognito -no-default-browser-check --no-crash-upload --disable-extensions --disable-sync --disable-background-networking --disable-client-side-phishing-detection --disable-component-update --disable-translate --disable-web-resources --safebrowsing-disable-auto-update http://cache.nixos.org/`

*Declared by:* [`nixos/modules/programs/captive-browser.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/captive-browser.nix)

## `programs.captive-browser.dhcp-dns` {#opt-programs.captive-browser.dhcp-dns}

The shell (/bin/sh) command executed to obtain the DHCP
DNS server address. The first match of an IPv4 regex is used.
IPv4 only, because let's be real, it's a captive portal.

*Type:* string

*Declared by:* [`nixos/modules/programs/captive-browser.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/captive-browser.nix)

## `programs.captive-browser.enable` {#opt-programs.captive-browser.enable}

Whether to enable captive browser, a dedicated Chrome instance to log into captive portals without messing with DNS settings.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/captive-browser.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/captive-browser.nix)

## `programs.captive-browser.interface` {#opt-programs.captive-browser.interface}

your public network interface (wlp3s0, wlan0, eth0, ...)

*Type:* string

*Declared by:* [`nixos/modules/programs/captive-browser.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/captive-browser.nix)

## `programs.captive-browser.package` {#opt-programs.captive-browser.package}

The captive-browser package to use.

*Type:* package

*Default:* `pkgs.captive-browser`

*Declared by:* [`nixos/modules/programs/captive-browser.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/captive-browser.nix)

## `programs.captive-browser.socks5-addr` {#opt-programs.captive-browser.socks5-addr}

the listen address for the SOCKS5 proxy server

*Type:* string

*Default:* `"localhost:1666"`

*Declared by:* [`nixos/modules/programs/captive-browser.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/captive-browser.nix)

## `programs.ccache.cacheDir` {#opt-programs.ccache.cacheDir}

CCache directory

*Type:* absolute path

*Default:* `"/var/cache/ccache"`

*Declared by:* [`nixos/modules/programs/ccache.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ccache.nix)

## `programs.ccache.enable` {#opt-programs.ccache.enable}

Whether to enable CCache, a compiler cache for fast recompilation of C/C++ code.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/ccache.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ccache.nix)

## `programs.ccache.group` {#opt-programs.ccache.group}

Group owner of CCache directory

*Type:* string

*Default:* `"nixbld"`

*Declared by:* [`nixos/modules/programs/ccache.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ccache.nix)

## `programs.ccache.owner` {#opt-programs.ccache.owner}

Owner of CCache directory

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/programs/ccache.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ccache.nix)

## `programs.ccache.packageNames` {#opt-programs.ccache.packageNames}

Nix top-level packages to be compiled using CCache

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "wxwidgets_3_2"
  "ffmpeg"
  "libav_all"
]
```

*Declared by:* [`nixos/modules/programs/ccache.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ccache.nix)

## `programs.ccache.trace` {#opt-programs.ccache.trace}

Trace ccache usage to see which derivations use ccache

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/ccache.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ccache.nix)

## `programs.cdemu.enable` {#opt-programs.cdemu.enable}

`cdemu` for members of
[`programs.cdemu.group`](#opt-programs.cdemu.group).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/cdemu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/cdemu.nix)

## `programs.cdemu.group` {#opt-programs.cdemu.group}

Group that users must be in to use `cdemu`.

*Type:* string

*Default:* `"cdrom"`

*Declared by:* [`nixos/modules/programs/cdemu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/cdemu.nix)

## `programs.cdemu.gui` {#opt-programs.cdemu.gui}

Whether to install the `cdemu` GUI (gCDEmu).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/cdemu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/cdemu.nix)

## `programs.cdemu.image-analyzer` {#opt-programs.cdemu.image-analyzer}

Whether to install the image analyzer.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/cdemu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/cdemu.nix)

## `programs.cfs-zen-tweaks.enable` {#opt-programs.cfs-zen-tweaks.enable}

Whether to enable CFS Zen Tweaks.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/cfs-zen-tweaks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/cfs-zen-tweaks.nix)

## `programs.chromium.defaultSearchProviderEnabled` {#opt-programs.chromium.defaultSearchProviderEnabled}

Enable the default search provider.

*Type:* null or boolean

*Default:* `null`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/chromium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/chromium.nix)

## `programs.chromium.defaultSearchProviderSearchURL` {#opt-programs.chromium.defaultSearchProviderSearchURL}

Chromium default search provider url.

*Type:* null or string

*Default:* `null`

*Example:* `"https://encrypted.google.com/search?q={searchTerms}&{google:RLZ}{google:originalQueryForSuggestion}{google:assistedQueryStats}{google:searchFieldtrialParameter}{google:searchClient}{google:sourceId}{google:instantExtendedEnabledParameter}ie={inputEncoding}"`

*Declared by:* [`nixos/modules/programs/chromium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/chromium.nix)

## `programs.chromium.defaultSearchProviderSuggestURL` {#opt-programs.chromium.defaultSearchProviderSuggestURL}

Chromium default search provider url for suggestions.

*Type:* null or string

*Default:* `null`

*Example:* `"https://encrypted.google.com/complete/search?output=chrome&q={searchTerms}"`

*Declared by:* [`nixos/modules/programs/chromium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/chromium.nix)

## `programs.chromium.enable` {#opt-programs.chromium.enable}

Whether to enable policies for chromium based browsers like Chromium, Google Chrome or Brave.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/chromium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/chromium.nix)

## `programs.chromium.enablePlasmaBrowserIntegration` {#opt-programs.chromium.enablePlasmaBrowserIntegration}

Whether to enable Native Messaging Host for Plasma Browser Integration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/chromium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/chromium.nix)

## `programs.chromium.extensions` {#opt-programs.chromium.extensions}

List of chromium extensions to install.
For list of plugins ids see id in url of extensions on
[chrome web store](https://chrome.google.com/webstore/category/extensions)
page. To install a chromium extension not included in the chrome web
store, append to the extension id a semicolon ";" followed by a URL
pointing to an Update Manifest XML file. See
[ExtensionInstallForcelist](https://cloud.google.com/docs/chrome-enterprise/policies/?policy=ExtensionInstallForcelist)
for additional details.

*Type:* null or (list of string)

*Default:* `null`

*Example:*

``` nix
[
  "chlffgpmiacpedhhbkiomidkjlcfhogd" # pushbullet
  "mbniclmhobmnbdlbpiphghaielnnpgdp" # lightshot
  "gcbommkclmclpchllfjekcdonpmejbdp" # https everywhere
  "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
]
```

*Declared by:* [`nixos/modules/programs/chromium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/chromium.nix)

## `programs.chromium.extraOpts` {#opt-programs.chromium.extraOpts}

Extra chromium policy options. These settings are locked and the user cannot change them in the browser later.
A list of available policies
can be found in the Chrome Enterprise documentation:
[https://cloud.google.com/docs/chrome-enterprise/policies/](https://cloud.google.com/docs/chrome-enterprise/policies/)
Make sure the selected policy is supported on Linux and your browser version.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  "BrowserSignin" = 0;
  "SyncDisabled" = true;
  "PasswordManagerEnabled" = false;
  "SpellcheckEnabled" = true;
  "SpellcheckLanguage" = [
    "de"
    "en-US"
  ];
}
```

*Declared by:* [`nixos/modules/programs/chromium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/chromium.nix)

## `programs.chromium.extraOptsRecommended` {#opt-programs.chromium.extraOptsRecommended}

Extra chromium policy options in recommended. These are default settings. The user can change them in the browser later if they want to.
A list of available policies
can be found in the Chrome Enterprise documentation:
[https://cloud.google.com/docs/chrome-enterprise/policies/](https://cloud.google.com/docs/chrome-enterprise/policies/)
Make sure the selected policy is supported on Linux and your browser version.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  "BrowserSignin" = 0;
  "SyncDisabled" = true;
  "PasswordManagerEnabled" = false;
  "SpellcheckEnabled" = true;
  "SpellcheckLanguage" = [
    "de"
    "en-US"
  ];
}
```

*Declared by:* [`nixos/modules/programs/chromium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/chromium.nix)

## `programs.chromium.homepageLocation` {#opt-programs.chromium.homepageLocation}

Chromium default homepage

*Type:* null or string

*Default:* `null`

*Example:* `"https://nixos.org"`

*Declared by:* [`nixos/modules/programs/chromium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/chromium.nix)

## `programs.chromium.initialPrefs` {#opt-programs.chromium.initialPrefs}

Initial preferences are used to configure the browser for the first run.
Unlike [`programs.chromium.extraOpts`](#opt-programs.chromium.extraOpts), initialPrefs can be changed by users in the browser settings.
More information can be found in the Chromium documentation:
[https://www.chromium.org/administrators/configuring-other-preferences/](https://www.chromium.org/administrators/configuring-other-preferences/)

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  "first_run_tabs" = [
    "https://nixos.org/"
  ];
}
```

*Declared by:* [`nixos/modules/programs/chromium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/chromium.nix)

## `programs.chromium.plasmaBrowserIntegrationPackage` {#opt-programs.chromium.plasmaBrowserIntegrationPackage}

The plasma-browser-integration package to use.

*Type:* package

*Default:* `pkgs.kdePackages.plasma-browser-integration`

*Declared by:* [`nixos/modules/programs/chromium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/chromium.nix)

## `programs.chrysalis.enable` {#opt-programs.chrysalis.enable}

Whether to enable Chrysalis.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/chrysalis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/chrysalis.nix)

## `programs.chrysalis.package` {#opt-programs.chrysalis.package}

The Chrysalis package to use.

*Type:* package

*Default:* `pkgs.chrysalis`

*Declared by:* [`nixos/modules/programs/chrysalis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/chrysalis.nix)

## `programs.clash-verge.autoStart` {#opt-programs.clash-verge.autoStart}

Whether to enable Clash Verge auto launch.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/clash-verge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/clash-verge.nix)

## `programs.clash-verge.enable` {#opt-programs.clash-verge.enable}

Whether to enable Clash Verge.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/clash-verge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/clash-verge.nix)

## `programs.clash-verge.group` {#opt-programs.clash-verge.group}

The group to grant access to clash-verge-rev's service socket.

For better security, you should set a group that only contains
users who need to access clash-verge-rev's service socket.

*Type:* string

*Default:* `"users"`

*Example:* `"wheel"`

*Declared by:* [`nixos/modules/programs/clash-verge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/clash-verge.nix)

## `programs.clash-verge.package` {#opt-programs.clash-verge.package}

The clash-verge package to use. Available options are
clash-verge-rev and clash-nyanpasu, both are forks of
the original clash-verge project.

*Type:* package

*Default:* `pkgs.clash-verge-rev`

*Declared by:* [`nixos/modules/programs/clash-verge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/clash-verge.nix)

## `programs.clash-verge.serviceMode` {#opt-programs.clash-verge.serviceMode}

Whether to enable Service Mode.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/clash-verge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/clash-verge.nix)

## `programs.clash-verge.tunMode` {#opt-programs.clash-verge.tunMode}

Whether to set the capabilities required for TUN mode.

Without these capabilities, Clash Verge's DNS settings will not work in TUN mode.

When enabled, reverse path filtering will be set to loose instead of strict.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/clash-verge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/clash-verge.nix)

## `programs.cnping.enable` {#opt-programs.cnping.enable}

Whether to enable a setcap wrapper for cnping.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/cnping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/cnping.nix)

## `programs.comma.enable` {#opt-programs.comma.enable}

Whether to enable comma.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/comma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/comma.nix)

## `programs.comma.enableBashIntegration` {#opt-programs.comma.enableBashIntegration}

Whether to enable comma command-not-found handler for bash.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/comma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/comma.nix)

## `programs.comma.enableFishIntegration` {#opt-programs.comma.enableFishIntegration}

Whether to enable comma command-not-found handler for fish.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/comma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/comma.nix)

## `programs.comma.enableZshIntegration` {#opt-programs.comma.enableZshIntegration}

Whether to enable comma command-not-found handler for zsh.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/comma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/comma.nix)

## `programs.comma.package` {#opt-programs.comma.package}

The comma package to use.

*Type:* package

*Default:* `pkgs.comma`

*Declared by:* [`nixos/modules/programs/comma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/comma.nix)

## `programs.command-not-found.dbPath` {#opt-programs.command-not-found.dbPath}

Absolute path to `programs.sqlite`, which contains mappings from binary names to package names.

If a nixpkgs tarball from https://channels.nixos.org is used as the source of nixpkgs, this file will be provided and this option be set by default.

To use the stateful `programs.sqlite` database, set this option to
`/nix/var/nix/profiles/per-user/root/channels/nixos/programs.sqlite`.
If you do so, you can update it with `sudo nix-channels --update`.

*Type:* absolute path

*Default:*

``` nix
pkgs.path + "/programs.sqlite"
```

*Declared by:* [`nixos/modules/programs/command-not-found/command-not-found.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/command-not-found/command-not-found.nix)

## `programs.command-not-found.enable` {#opt-programs.command-not-found.enable}

Whether interactive shells should show which Nix package (if
any) provides a missing command.

See also nix-index and nix-index-database as an alternative for flakes-based systems.

Additionally, having the env var NIX\_AUTO\_RUN set will automatically run the matching package, and with NIX\_AUTO\_RUN\_INTERACTIVE it will confirm the package before running.

*Type:* boolean

*Default:*

``` nix
builtins.pathExists config.programs.command-not-found.dbPath
```

*Declared by:* [`nixos/modules/programs/command-not-found/command-not-found.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/command-not-found/command-not-found.nix)

## `programs.compsize.enable` {#opt-programs.compsize.enable}

Whether to enable compsize + setcap wrapper.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/compsize.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/compsize.nix)

## `programs.compsize.package` {#opt-programs.compsize.package}

The compsize package to use.

*Type:* package

*Default:* `pkgs.compsize`

*Declared by:* [`nixos/modules/programs/compsize.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/compsize.nix)

## `programs.coolercontrol.enable` {#opt-programs.coolercontrol.enable}

Whether to enable CoolerControl GUI & its background services.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/coolercontrol.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/coolercontrol.nix)

## `programs.coolercontrol.plugins.enable` {#opt-programs.coolercontrol.plugins.enable}

Whether to enable support for CoolerControl service plugins.

Declares the `cc-plugin-user` system user and group that unprivileged plugins run
as.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/coolercontrol.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/coolercontrol.nix)

## `programs.corectrl.enable` {#opt-programs.corectrl.enable}

Whether to enable CoreCtrl, a tool to overclock amd graphics cards and processors.
Add your user to the corectrl group to run corectrl without needing to enter your password
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/corectrl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/corectrl.nix)

## `programs.corectrl.package` {#opt-programs.corectrl.package}

The corectrl package to use. Useful for overriding the configuration options used for the package.

*Type:* package

*Default:* `pkgs.corectrl`

*Declared by:* [`nixos/modules/hardware/corectrl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/corectrl.nix)

## `programs.corefreq.enable` {#opt-programs.corefreq.enable}

Whether to enable the corefreq daemon and kernel module.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/corefreq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/corefreq.nix)

## `programs.corefreq.package` {#opt-programs.corefreq.package}

The corefreq package to use.

*Type:* package

*Default:* `config.boot.kernelPackages.corefreq`

*Declared by:* [`nixos/modules/programs/corefreq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/corefreq.nix)

## `programs.cpu-energy-meter.enable` {#opt-programs.cpu-energy-meter.enable}

Whether to enable CPU Energy Meter.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/cpu-energy-meter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/cpu-energy-meter.nix)

## `programs.cpu-energy-meter.package` {#opt-programs.cpu-energy-meter.package}

The cpu-energy-meter package to use.

*Type:* package

*Default:* `pkgs.cpu-energy-meter`

*Declared by:* [`nixos/modules/programs/cpu-energy-meter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/cpu-energy-meter.nix)

## `programs.criu.enable` {#opt-programs.criu.enable}

Install `criu` along with necessary kernel options.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/criu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/criu.nix)

## `programs.dconf.enable` {#opt-programs.dconf.enable}

Whether to enable dconf.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/dconf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/dconf.nix)

## `programs.dconf.packages` {#opt-programs.dconf.packages}

A list of packages which provide dconf profiles and databases in `/etc/dconf`.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/programs/dconf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/dconf.nix)

## `programs.dconf.profiles` {#opt-programs.dconf.profiles}

Attrset of dconf profiles. By default the `user` profile is used which
ends up in `/etc/dconf/profile/user`.

*Type:* attribute set of (absolute path or package or (submodule))

*Default:* `{ }`

*Example:*

``` nix
{
  # A "user" profile with a database
  user.databases = [
    {
      settings = { };
    }
  ];
  # A "bar" profile from a package
  bar = pkgs.bar-dconf-profile;
  # A "foo" profile from a path
  foo = ${./foo}
};
```

*Declared by:* [`nixos/modules/programs/dconf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/dconf.nix)

## `programs.devenv.enable` {#opt-programs.devenv.enable}

Whether to enable devenv, fast, declarative, reproducible and composable developer environments.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/devenv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/devenv.nix)

## `programs.devenv.enableBashIntegration` {#opt-programs.devenv.enableBashIntegration}

Whether to enable auto-activation of devenv environments in Bash.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/devenv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/devenv.nix)

## `programs.devenv.enableFishIntegration` {#opt-programs.devenv.enableFishIntegration}

Whether to enable auto-activation of devenv environments in Fish.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/devenv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/devenv.nix)

## `programs.devenv.enableNushellIntegration` {#opt-programs.devenv.enableNushellIntegration}

Whether to enable auto-activation of devenv environments in Nushell.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/devenv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/devenv.nix)

## `programs.devenv.enableZshIntegration` {#opt-programs.devenv.enableZshIntegration}

Whether to enable auto-activation of devenv environments in Zsh.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/devenv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/devenv.nix)

## `programs.devenv.package` {#opt-programs.devenv.package}

The devenv package to use.

*Type:* package

*Default:* `pkgs.devenv`

*Declared by:* [`nixos/modules/programs/devenv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/devenv.nix)

## `programs.digitalbitbox.enable` {#opt-programs.digitalbitbox.enable}

Installs the Digital Bitbox application and enables the complementary hardware module.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/digitalbitbox/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/digitalbitbox/default.nix)

## `programs.digitalbitbox.package` {#opt-programs.digitalbitbox.package}

The digitalbitbox package to use. This can be used to install a package with udev rules that differ from the defaults.

*Type:* package

*Default:* `pkgs.digitalbitbox`

*Declared by:* [`nixos/modules/programs/digitalbitbox/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/digitalbitbox/default.nix)

## `programs.direnv.angrr.autoUse` {#opt-programs.direnv.angrr.autoUse}

Whether to automatically use angrr before loading .envrc.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `programs.direnv.angrr.enable` {#opt-programs.direnv.angrr.enable}

Whether to enable angrr direnv integration.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `programs.direnv.direnvrcExtra` {#opt-programs.direnv.direnvrcExtra}

Extra lines to append to the sourced direnvrc

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  export FOO="foo"
  echo "loaded direnv!"
''
```

*Declared by:* [`nixos/modules/programs/direnv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/direnv.nix)

## `programs.direnv.enable` {#opt-programs.direnv.enable}

Whether to enable direnv integration. Takes care of both installation and
setting up the sourcing of the shell. Additionally enables nix-direnv
integration. Note that you need to logout and login for this change to apply
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/direnv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/direnv.nix)

## `programs.direnv.enableBashIntegration` {#opt-programs.direnv.enableBashIntegration}

Whether to enable Bash integration
.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/programs/direnv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/direnv.nix)

## `programs.direnv.enableFishIntegration` {#opt-programs.direnv.enableFishIntegration}

Whether to enable Fish integration
.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/programs/direnv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/direnv.nix)

## `programs.direnv.enableNushellIntegration` {#opt-programs.direnv.enableNushellIntegration}

Whether to enable Nushell integration
.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/programs/direnv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/direnv.nix)

## `programs.direnv.enableXonshIntegration` {#opt-programs.direnv.enableXonshIntegration}

Whether to enable Xonsh integration
.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/programs/direnv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/direnv.nix)

## `programs.direnv.enableZshIntegration` {#opt-programs.direnv.enableZshIntegration}

Whether to enable Zsh integration
.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/programs/direnv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/direnv.nix)

## `programs.direnv.loadInNixShell` {#opt-programs.direnv.loadInNixShell}

Whether to enable loading direnv in `nix-shell` `nix shell` or `nix develop`
.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/programs/direnv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/direnv.nix)

## `programs.direnv.nix-direnv.enable` {#opt-programs.direnv.nix-direnv.enable}

Whether to enable a faster, persistent implementation of use\_nix and use\_flake, to replace the builtin one
.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/programs/direnv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/direnv.nix)

## `programs.direnv.nix-direnv.package` {#opt-programs.direnv.nix-direnv.package}

The nix-direnv package to use

*Type:* package

*Default:* `"pkgs.nix-direnv"`

*Declared by:* [`nixos/modules/programs/direnv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/direnv.nix)

## `programs.direnv.package` {#opt-programs.direnv.package}

The direnv package to use.

*Type:* package

*Default:* `pkgs.direnv`

*Declared by:* [`nixos/modules/programs/direnv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/direnv.nix)

## `programs.direnv.settings` {#opt-programs.direnv.settings}

Direnv configuration. Refer to `direnv.toml(1)`.

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  global = {
    log_format = "-";
    log_filter = "^$";
  };
}
```

*Declared by:* [`nixos/modules/programs/direnv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/direnv.nix)

## `programs.direnv.silent` {#opt-programs.direnv.silent}

Whether to enable the hiding of direnv logging
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/direnv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/direnv.nix)

## `programs.dmrconfig.enable` {#opt-programs.dmrconfig.enable}

Whether to configure system to enable use of dmrconfig. This
enables the required udev rules and installs the program.

*Type:* boolean

*Default:* `false`

*Related packages:*

- [`pkgs.dmrconfig`](https://search.nixos.org/packages?show=dmrconfig&sort=relevance&query=dmrconfig)

*Declared by:* [`nixos/modules/programs/dmrconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/dmrconfig.nix)

## `programs.dmrconfig.package` {#opt-programs.dmrconfig.package}

The dmrconfig package to use.

*Type:* package

*Default:* `pkgs.dmrconfig`

*Declared by:* [`nixos/modules/programs/dmrconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/dmrconfig.nix)

## `programs.droidcam.enable` {#opt-programs.droidcam.enable}

Whether to enable DroidCam client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/droidcam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/droidcam.nix)

## `programs.dublin-traceroute.enable` {#opt-programs.dublin-traceroute.enable}

Whether to enable dublin-traceroute (including setcap wrapper).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/dublin-traceroute.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/dublin-traceroute.nix)

## `programs.dublin-traceroute.package` {#opt-programs.dublin-traceroute.package}

The dublin-traceroute package to use.

*Type:* package

*Default:* `pkgs.dublin-traceroute`

*Declared by:* [`nixos/modules/programs/dublin-traceroute.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/dublin-traceroute.nix)

## `programs.dux-calendar.enable` {#opt-programs.dux-calendar.enable}

Whether to enable Dux Calendar, a standalone calendar application.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/dux-calendar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/dux-calendar.nix)

## `programs.dux-calendar.package` {#opt-programs.dux-calendar.package}

The dux-calendar package to use.

*Type:* package

*Default:* `pkgs.dux-calendar`

*Declared by:* [`nixos/modules/programs/dux-calendar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/dux-calendar.nix)

## `programs.dux-calendar.quickshell.package` {#opt-programs.dux-calendar.quickshell.package}

The quickshell package to use. The Quickshell package used to run the calendar interface.

*Type:* package

*Default:* `pkgs.quickshell`

*Declared by:* [`nixos/modules/programs/dux-calendar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/dux-calendar.nix)

## `programs.dux-calendar.systemd.enable` {#opt-programs.dux-calendar.systemd.enable}

Whether to enable starting Dux Calendar with the graphical session.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/dux-calendar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/dux-calendar.nix)

## `programs.dux-calendar.systemd.restartIfChanged` {#opt-programs.dux-calendar.systemd.restartIfChanged}

Whether to restart the Dux Calendar user service when its package or configuration changes.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/dux-calendar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/dux-calendar.nix)

## `programs.dux-calendar.systemd.target` {#opt-programs.dux-calendar.systemd.target}

The systemd user target that starts Dux Calendar.

*Type:* string

*Default:* `"graphical-session.target"`

*Example:* `"wayland-session.target"`

*Declared by:* [`nixos/modules/programs/dux-calendar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/dux-calendar.nix)

## `programs.dux-files.enable` {#opt-programs.dux-files.enable}

Whether to enable Dux Files, a standalone file manager for Wayland.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/dux-files.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/dux-files.nix)

## `programs.dux-files.package` {#opt-programs.dux-files.package}

The dux-files package to use.

*Type:* package

*Default:* `pkgs.dux-files`

*Declared by:* [`nixos/modules/programs/dux-files.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/dux-files.nix)

## `programs.dux-files.portal.enable` {#opt-programs.dux-files.portal.enable}

Whether to enable XDG desktop portals and register the Dux Files
file-chooser backend.

Select Dux Files for open and save dialogs with:

``` nix
xdg.portal.config.common."org.freedesktop.impl.portal.FileChooser" = [ "dfiles" ];
```

Use the configuration for your desktop instead of `common` if your
desktop provides its own portal configuration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/dux-files.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/dux-files.nix)

## `programs.dux-files.systemd.enable` {#opt-programs.dux-files.systemd.enable}

Whether to enable starting Dux Files with the graphical session.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/dux-files.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/dux-files.nix)

## `programs.dux-files.systemd.restartIfChanged` {#opt-programs.dux-files.systemd.restartIfChanged}

Whether to restart the Dux Files user service when its package or configuration changes.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/dux-files.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/dux-files.nix)

## `programs.dux-files.systemd.target` {#opt-programs.dux-files.systemd.target}

The systemd user target that starts Dux Files.

*Type:* string

*Default:* `"graphical-session.target"`

*Example:* `"wayland-session.target"`

*Declared by:* [`nixos/modules/programs/dux-files.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/dux-files.nix)

## `programs.dux-search.enable` {#opt-programs.dux-search.enable}

Whether to enable Dux Search, a fast filesystem search service with fuzzy matching.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/dux-search.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/dux-search.nix)

## `programs.dux-search.package` {#opt-programs.dux-search.package}

The dux-search package to use.

*Type:* package

*Default:* `pkgs.dux-search`

*Declared by:* [`nixos/modules/programs/dux-search.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/dux-search.nix)

## `programs.dux-search.systemd.enable` {#opt-programs.dux-search.systemd.enable}

Whether to enable systemd user service for Dux Search.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/dux-search.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/dux-search.nix)

## `programs.dux-search.systemd.target` {#opt-programs.dux-search.systemd.target}

The systemd target that will automatically start the Dux Search service.

By default, Dux Search starts with the user session (`default.target`).
You can change this to `graphical-session.target` if you only want
it to run in graphical sessions.

*Type:* string

*Default:* `"default.target"`

*Declared by:* [`nixos/modules/programs/dux-search.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/dux-search.nix)

## `programs.dux-shell.enable` {#opt-programs.dux-shell.enable}

Whether to enable Dux Shell, a complete desktop shell for Wayland compositors.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/dux-shell.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/dux-shell.nix)

## `programs.dux-shell.excludePackages` {#opt-programs.dux-shell.excludePackages}

Which packages Dux Shell should exclude from its default environment.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/programs/wayland/dux-shell.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/dux-shell.nix)

## `programs.dux-shell.package` {#opt-programs.dux-shell.package}

The dux-shell package to use.

*Type:* package

*Default:* `pkgs.dux-shell`

*Declared by:* [`nixos/modules/programs/wayland/dux-shell.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/dux-shell.nix)

## `programs.dux-shell.plugins` {#opt-programs.dux-shell.plugins}

Dux Shell plugins to install and enable

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  DockerManager = {
    src = pkgs.fetchFromGitHub {
      owner = "LuckShiba";
      repo = "DmsDockerManager";
      rev = "v1.2.0";
      sha256 = "sha256-VoJCaygWnKpv0s0pqTOmzZnPM922qPDMHk4EPcgVnaU=";
    };
  };
  AnotherPlugin = {
    enable = true;
    src = pkgs.another-plugin;
  };
}
```

*Declared by:* [`nixos/modules/programs/wayland/dux-shell.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/dux-shell.nix)

## `programs.dux-shell.plugins.<name>.enable` {#opt-programs.dux-shell.plugins._name_.enable}

Whether to enable this plugin

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/wayland/dux-shell.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/dux-shell.nix)

## `programs.dux-shell.plugins.<name>.src` {#opt-programs.dux-shell.plugins._name_.src}

Source of the plugin package or path

*Type:* package or absolute path

*Declared by:* [`nixos/modules/programs/wayland/dux-shell.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/dux-shell.nix)

## `programs.dux-shell.quickshell.package` {#opt-programs.dux-shell.quickshell.package}

The quickshell package to use.

*Type:* package

*Default:* `pkgs.quickshell`

*Declared by:* [`nixos/modules/programs/wayland/dux-shell.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/dux-shell.nix)

## `programs.dux-shell.systemd.enable` {#opt-programs.dux-shell.systemd.enable}

Whether to enable the Dux Shell systemd startup service.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/wayland/dux-shell.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/dux-shell.nix)

## `programs.dux-shell.systemd.restartIfChanged` {#opt-programs.dux-shell.systemd.restartIfChanged}

Whether to restart the dms.service when the Dux Shell package or
configuration changes. This ensures the latest version is always running
after a system rebuild.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/wayland/dux-shell.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/dux-shell.nix)

## `programs.dux-shell.systemd.target` {#opt-programs.dux-shell.systemd.target}

The systemd target that will automatically start the Dux Shell service.

Common targets include:

- `graphical-session.target` for most desktop environments
- `wayland-session.target` for Wayland-specific sessions

*Type:* string

*Default:* `"graphical-session.target"`

*Declared by:* [`nixos/modules/programs/wayland/dux-shell.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/dux-shell.nix)

## `programs.dwl.enable` {#opt-programs.dwl.enable}

Whether to enable Dwl is a compact, hackable compositor for Wayland based on wlroots.
You can manually launch Dwl by executing "exec dwl" on a TTY.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/dwl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/dwl.nix)

## `programs.dwl.extraSessionCommands` {#opt-programs.dwl.extraSessionCommands}

Shell commands executed just before dwl is started.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/programs/wayland/dwl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/dwl.nix)

## `programs.dwl.package` {#opt-programs.dwl.package}

The dwl package to use.

*Type:* package

*Default:* `pkgs.dwl`

*Example:*

``` nix
# Lets apply bar patch from:
# https://codeberg.org/dwl/dwl-patches/src/branch/main/patches/bar
(pkgs.dwl.override {
  configH = ./dwl-config.h;
}).overrideAttrs (oldAttrs: {
  buildInputs =
    oldAttrs.buildInputs or []
    ++ [
      pkgs.libdrm
      pkgs.fcft
    ];
  patches = oldAttrs.patches or [] ++ [
    ./bar-0.7.patch
  ];
});
```

*Declared by:* [`nixos/modules/programs/wayland/dwl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/dwl.nix)

## `programs.ente-auth.enable` {#opt-programs.ente-auth.enable}

Whether to enable Ente Auth.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/ente-auth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ente-auth.nix)

## `programs.ente-auth.package` {#opt-programs.ente-auth.package}

The ente-auth package to use.

*Type:* package

*Default:* `pkgs.ente-auth`

*Declared by:* [`nixos/modules/programs/ente-auth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ente-auth.nix)

## `programs.entropy.enable` {#opt-programs.entropy.enable}

Enables the Entropy keyboard configurator and sets up necessary
udev rules for Vial-QMK/RMK compatible devices.
This allows configuring programmable keyboards without root privileges.
Ensure your user is a member of the 'plugdev' group after enabling.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/ergohaven-entropy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ergohaven-entropy.nix)

## `programs.evince.enable` {#opt-programs.evince.enable}

Whether to enable Evince, the GNOME document viewer.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/evince.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/evince.nix)

## `programs.evince.package` {#opt-programs.evince.package}

The evince package to use.

*Type:* package

*Default:* `pkgs.evince`

*Declared by:* [`nixos/modules/programs/evince.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/evince.nix)

## `programs.evolution.enable` {#opt-programs.evolution.enable}

Whether to enable Evolution, a Personal information management application that provides integrated mail, calendaring and address book functionality.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/gnome/evolution-data-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/gnome/evolution-data-server.nix)

## `programs.evolution.plugins` {#opt-programs.evolution.plugins}

Plugins for Evolution.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.evolution-ews ]`

*Declared by:* [`nixos/modules/services/desktops/gnome/evolution-data-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/gnome/evolution-data-server.nix)

## `programs.extra-container.enable` {#opt-programs.extra-container.enable}

Whether to enable extra-container, a tool for running declarative NixOS containers
without host system rebuilds
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/extra-container.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/extra-container.nix)

## `programs.extra-container.package` {#opt-programs.extra-container.package}

The extra-container package to use.

*Type:* package

*Default:* `pkgs.extra-container`

*Declared by:* [`nixos/modules/programs/extra-container.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/extra-container.nix)

## `programs.fcast-receiver.enable` {#opt-programs.fcast-receiver.enable}

Whether to enable FCast Receiver.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/fcast-receiver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fcast-receiver.nix)

## `programs.fcast-receiver.openFirewall` {#opt-programs.fcast-receiver.openFirewall}

Open ports needed for the functionality of the program.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/fcast-receiver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fcast-receiver.nix)

## `programs.fcast-receiver.package` {#opt-programs.fcast-receiver.package}

The fcast-receiver package to use.

*Type:* package

*Default:* `pkgs.fcast-receiver`

*Declared by:* [`nixos/modules/programs/fcast-receiver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fcast-receiver.nix)

## `programs.feedbackd.enable` {#opt-programs.feedbackd.enable}

Whether to enable the feedbackd D-BUS service and udev rules.

Your user needs to be in the `feedbackd` group to trigger effects
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/feedbackd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/feedbackd.nix)

## `programs.feedbackd.package` {#opt-programs.feedbackd.package}

The feedbackd package to use.

*Type:* package

*Default:* `pkgs.feedbackd`

*Declared by:* [`nixos/modules/programs/feedbackd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/feedbackd.nix)

## `programs.feedbackd.theme-package` {#opt-programs.feedbackd.theme-package}

The feedbackd-device-themes package to use.

*Type:* null or package

*Default:* `pkgs.feedbackd-device-themes`

*Declared by:* [`nixos/modules/programs/feedbackd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/feedbackd.nix)

## `programs.firefox.autoConfig` {#opt-programs.firefox.autoConfig}

AutoConfig files can be used to set and lock preferences that are not covered
by the policies.json for Mac and Linux. This method can be used to automatically
change user preferences or prevent the end user from modifying specific
preferences by locking them. More info can be found in [https://support.mozilla.org/en-US/kb/customizing-firefox-using-autoconfig](https://support.mozilla.org/en-US/kb/customizing-firefox-using-autoconfig).

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/programs/firefox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/firefox.nix)

## `programs.firefox.autoConfigFiles` {#opt-programs.firefox.autoConfigFiles}

AutoConfig files can be used to set and lock preferences that are not covered
by the policies.json for Mac and Linux. This method can be used to automatically
change user preferences or prevent the end user from modifying specific
preferences by locking them. More info can be found in [https://support.mozilla.org/en-US/kb/customizing-firefox-using-autoconfig](https://support.mozilla.org/en-US/kb/customizing-firefox-using-autoconfig).

Files are concatenated and autoConfig is appended.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/programs/firefox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/firefox.nix)

## `programs.firefox.enable` {#opt-programs.firefox.enable}

Whether to enable the Firefox web browser.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/firefox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/firefox.nix)

## `programs.firefox.languagePacks` {#opt-programs.firefox.languagePacks}

The language packs to install.

*Type:* list of (one of "ach", "af", "an", "ar", "ast", "az", "be", "bg", "bn", "br", "bs", "ca-valencia", "ca", "cak", "cs", "cy", "da", "de", "dsb", "el", "en-CA", "en-GB", "en-US", "eo", "es-AR", "es-CL", "es-ES", "es-MX", "et", "eu", "fa", "ff", "fi", "fr", "fur", "fy-NL", "ga-IE", "gd", "gl", "gn", "gu-IN", "he", "hi-IN", "hr", "hsb", "hu", "hy-AM", "ia", "id", "is", "it", "ja", "ka", "kab", "kk", "km", "kn", "ko", "lij", "lt", "lv", "mk", "mr", "ms", "my", "nb-NO", "ne-NP", "nl", "nn-NO", "oc", "pa-IN", "pl", "pt-BR", "pt-PT", "rm", "ro", "ru", "sat", "sc", "sco", "si", "sk", "skr", "sl", "son", "sq", "sr", "sv-SE", "szl", "ta", "te", "tg", "th", "tl", "tr", "trs", "uk", "ur", "uz", "vi", "xh", "zh-CN", "zh-TW")

*Default:* `[ ]`

*Declared by:* [`nixos/modules/programs/firefox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/firefox.nix)

## `programs.firefox.nativeMessagingHosts.packages` {#opt-programs.firefox.nativeMessagingHosts.packages}

Additional packages containing native messaging hosts that should be made available to Firefox extensions.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/programs/firefox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/firefox.nix)

## `programs.firefox.package` {#opt-programs.firefox.package}

Firefox package to use.

*Type:* package

*Default:* `pkgs.firefox`

*Related packages:*

- [`pkgs.firefox`](https://search.nixos.org/packages?show=firefox&sort=relevance&query=firefox)
- [`pkgs.firefox-bin`](https://search.nixos.org/packages?show=firefox-bin&sort=relevance&query=firefox-bin)
- [`pkgs.firefox-esr`](https://search.nixos.org/packages?show=firefox-esr&sort=relevance&query=firefox-esr)

*Declared by:* [`nixos/modules/programs/firefox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/firefox.nix)

## `programs.firefox.policies` {#opt-programs.firefox.policies}

Group policies to install.

See [Mozilla's documentation](https://firefox-admin-docs.mozilla.org/reference/policies/)
for a list of available options.

This can be used to install extensions declaratively! Check out the
documentation of the `ExtensionSettings` policy for details.

When this option is in use, Firefox will inform you that "your browser
is managed by your organisation". That message appears because NixOS
installs what you have declared here such that it cannot be overridden
through the user interface. It does not mean that someone else has been
given control of your browser, unless of course they also control your
NixOS configuration.

*Type:* JSON value

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/firefox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/firefox.nix)

## `programs.firefox.preferences` {#opt-programs.firefox.preferences}

Preferences to set from `about:config`.

Some of these might be able to be configured more ergonomically
using policies.

See [here](https://mozilla.github.io/policy-templates/#preferences) for allowed preferences.

When this option is in use, Firefox will inform you that "your browser
is managed by your organisation". That message appears because NixOS
installs what you have declared here such that it cannot be overridden
through the user interface. It does not mean that someone else has been
given control of your browser, unless of course they also control your
NixOS configuration.

*Type:* attribute set of (boolean or signed integer or string)

*Default:* `{ }`

*Example:*

``` nix
{
  "browser.tabs.tabmanager.enabled" = false;
}
```

*Declared by:* [`nixos/modules/programs/firefox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/firefox.nix)

## `programs.firefox.preferencesStatus` {#opt-programs.firefox.preferencesStatus}

The status of `firefox.preferences`.

`status` can assume the following values:

- `"default"`: Preferences appear as default.
- `"locked"`: Preferences appear as default and can't be changed.
- `"user"`: Preferences appear as changed.
- `"clear"`: Value has no effect. Resets to factory defaults on each startup.

*Type:* one of "default", "locked", "user", "clear"

*Default:* `"locked"`

*Declared by:* [`nixos/modules/programs/firefox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/firefox.nix)

## `programs.firefox.wrapperConfig` {#opt-programs.firefox.wrapperConfig}

Arguments to pass to Firefox wrapper

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/firefox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/firefox.nix)

## `programs.firejail.enable` {#opt-programs.firejail.enable}

Whether to enable firejail, a sandboxing tool for Linux.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/firejail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/firejail.nix)

## `programs.firejail.wrappedBinaries` {#opt-programs.firejail.wrappedBinaries}

Wrap the binaries in firejail and place them in the global path.

*Type:* attribute set of (absolute path or (submodule))

*Default:* `{ }`

*Example:*

``` nix
{
  firefox = {
    executable = "${lib.getBin pkgs.firefox}/bin/firefox";
    profile = "${pkgs.firejail}/etc/firejail/firefox.profile";
  };
  mpv = {
    executable = "${lib.getBin pkgs.mpv}/bin/mpv";
    profile = "${pkgs.firejail}/etc/firejail/mpv.profile";
  };
}
```

*Declared by:* [`nixos/modules/programs/firejail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/firejail.nix)

## `programs.fish.enable` {#opt-programs.fish.enable}

Whether to configure fish as an interactive shell.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/fish.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fish.nix)

## `programs.fish.extraCompletionPackages` {#opt-programs.fish.extraCompletionPackages}

Additional packages to generate completions from, if [`programs.fish.generateCompletions`](#opt-programs.fish.generateCompletions) is enabled.

*Type:* list of package

*Default:* `[ ]`

*Example:* `config.users.users.alice.packages`

*Declared by:* [`nixos/modules/programs/fish.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fish.nix)

## `programs.fish.generateCompletions` {#opt-programs.fish.generateCompletions}

Whether to enable generating completion files from man pages.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/programs/fish.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fish.nix)

## `programs.fish.interactiveShellInit` {#opt-programs.fish.interactiveShellInit}

Shell script code called during interactive fish shell initialisation.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/programs/fish.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fish.nix)

## `programs.fish.loginShellInit` {#opt-programs.fish.loginShellInit}

Shell script code called during fish login shell initialisation.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/programs/fish.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fish.nix)

## `programs.fish.package` {#opt-programs.fish.package}

The fish package to use.

*Type:* package

*Default:* `pkgs.fish`

*Declared by:* [`nixos/modules/programs/fish.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fish.nix)

## `programs.fish.promptInit` {#opt-programs.fish.promptInit}

Shell script code used to initialise fish prompt.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/programs/fish.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fish.nix)

## `programs.fish.shellAbbrs` {#opt-programs.fish.shellAbbrs}

Set of fish abbreviations.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  gco = "git checkout";
  npu = "nix-prefetch-url";
}
```

*Declared by:* [`nixos/modules/programs/fish.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fish.nix)

## `programs.fish.shellAliases` {#opt-programs.fish.shellAliases}

Set of aliases for fish shell, which overrides [`environment.shellAliases`](../../options/environment/index.md#opt-environment.shellAliases).
See [`environment.shellAliases`](../../options/environment/index.md#opt-environment.shellAliases) for an option format description.

*Type:* attribute set of (null or string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/fish.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fish.nix)

## `programs.fish.shellFunctions` {#opt-programs.fish.shellFunctions}

A set of fish functions, with the attribute name being the function name. Function names cannot be reserved
words or have spaces. These are elements of fish syntax or builtin commands which are essential for the
operations of the shell.

See the documentation for [fish functions](https://fishshell.com/docs/current/cmds/function.html) for further information.

*Type:* attribute set of (submodule)

*Example:*

``` nix
{
  ll = {
    body = "ls -l $argv";
  };
  mcd = {
    body = ''
      command mkdir $argv
      if test $status = 0
        switch $argv[(count $argv)]
          case '-*'
      
          case '*'
            cd $argv[(count $argv)]
            return
        end
      end
    '';
    modifiers = {
      description = "Create a directory and set CWD";
    };
  };
}
```

*Declared by:* [`nixos/modules/programs/fish.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fish.nix)

## `programs.fish.shellFunctions.<name>.body` {#opt-programs.fish.shellFunctions._name_.body}

The function body. You may provide a path or a string containing the fish function body.

*Type:* string

*Declared by:* [`nixos/modules/programs/fish.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fish.nix)

## `programs.fish.shellFunctions.<name>.modifiers` {#opt-programs.fish.shellFunctions._name_.modifiers}

Modifiers to be applied to the function. This is a string, concatenated with a space after the function nane

*Type:* attribute set of anything

*Default:* `"input for 'lib.cli.toCommandLine'"`

*Declared by:* [`nixos/modules/programs/fish.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fish.nix)

## `programs.fish.shellInit` {#opt-programs.fish.shellInit}

Shell script code called during fish shell initialisation.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/programs/fish.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fish.nix)

## `programs.fish.useBabelfish` {#opt-programs.fish.useBabelfish}

If enabled, the configured environment will be translated to native fish using [babelfish](https://github.com/bouk/babelfish).
Otherwise, [foreign-env](https://github.com/oh-my-fish/plugin-foreign-env) will be used.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/fish.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fish.nix)

## `programs.fish.vendor.completions.enable` {#opt-programs.fish.vendor.completions.enable}

Whether fish should use completion files provided by other packages.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/fish.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fish.nix)

## `programs.fish.vendor.config.enable` {#opt-programs.fish.vendor.config.enable}

Whether fish should source configuration snippets provided by other packages.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/fish.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fish.nix)

## `programs.fish.vendor.functions.enable` {#opt-programs.fish.vendor.functions.enable}

Whether fish should autoload fish functions provided by other packages.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/fish.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fish.nix)

## `programs.flashprog.enable` {#opt-programs.flashprog.enable}

Whether to enable configuring flashprog udev rules and
installing flashprog as system package
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/flashprog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/flashprog.nix)

## `programs.flashprog.package` {#opt-programs.flashprog.package}

The flashprog package to use.

*Type:* package

*Default:* `pkgs.flashprog`

*Declared by:* [`nixos/modules/programs/flashprog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/flashprog.nix)

## `programs.flashrom.enable` {#opt-programs.flashrom.enable}

Installs flashrom and configures udev rules for programmers
used by flashrom. Grants access to users in the "flashrom"
group.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/flashrom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/flashrom.nix)

## `programs.flashrom.package` {#opt-programs.flashrom.package}

The flashrom package to use.

*Type:* package

*Default:* `pkgs.flashrom`

*Declared by:* [`nixos/modules/programs/flashrom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/flashrom.nix)

## `programs.flexoptix-app.enable` {#opt-programs.flexoptix-app.enable}

Whether to enable FLEXOPTIX app + udev rules.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/flexoptix-app.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/flexoptix-app.nix)

## `programs.flexoptix-app.package` {#opt-programs.flexoptix-app.package}

The flexoptix-app package to use.

*Type:* package

*Default:* `pkgs.flexoptix-app`

*Declared by:* [`nixos/modules/programs/flexoptix-app.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/flexoptix-app.nix)

## `programs.foot.enable` {#opt-programs.foot.enable}

Whether to enable foot terminal emulator.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/foot`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/foot)

## `programs.foot.enableBashIntegration` {#opt-programs.foot.enableBashIntegration}

Whether to enable foot bash integration.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/foot`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/foot)

## `programs.foot.enableFishIntegration` {#opt-programs.foot.enableFishIntegration}

Whether to enable foot fish integration.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/foot`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/foot)

## `programs.foot.enableZshIntegration` {#opt-programs.foot.enableZshIntegration}

Whether to enable foot zsh integration.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/foot`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/foot)

## `programs.foot.package` {#opt-programs.foot.package}

The foot package to use.

*Type:* package

*Default:* `pkgs.foot`

*Declared by:* [`nixos/modules/programs/foot`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/foot)

## `programs.foot.settings` {#opt-programs.foot.settings}

Configuration for foot terminal emulator. Further information can be found in `man 5 foot.ini`.

Global configuration has to be written under the \[main\] section.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string) or a list of them for duplicate keys)

*Default:* `{ }`

*Example:*

``` nix
{
  main = {
    font = "FreeMono:size=12";
  };
  scrollback = {
    lines = 100000;
  };
}
```

*Declared by:* [`nixos/modules/programs/foot`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/foot)

## `programs.foot.theme` {#opt-programs.foot.theme}

Theme name. Check [https://codeberg.org/dnkl/foot/src/branch/master/themes](https://codeberg.org/dnkl/foot/src/branch/master/themes) for available themes.

*Type:* null or string

*Default:* `null`

*Example:* `"aeroroot"`

*Declared by:* [`nixos/modules/programs/foot`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/foot)

## `programs.foot.xdg.serverAutostart` {#opt-programs.foot.xdg.serverAutostart}

Whether to enable starting the foot server via xdg-autostart.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/foot`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/foot)

## `programs.framework-settings.enable` {#opt-programs.framework-settings.enable}

Whether to enable framework-settings.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/framework-settings.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/framework-settings.nix)

## `programs.framework-settings.package` {#opt-programs.framework-settings.package}

The framework-settings package to use.

*Type:* package

*Default:* `pkgs.framework-settings`

*Declared by:* [`nixos/modules/programs/framework-settings.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/framework-settings.nix)

## `programs.fuse.enable` {#opt-programs.fuse.enable}

Whether to enable fuse.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/fuse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fuse.nix)

## `programs.fuse.mountMax` {#opt-programs.fuse.mountMax}

Set the maximum number of FUSE mounts allowed to non-root users.

*Type:* integer between 0 and 32767 (both inclusive)

*Default:* `1000`

*Declared by:* [`nixos/modules/programs/fuse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fuse.nix)

## `programs.fuse.userAllowOther` {#opt-programs.fuse.userAllowOther}

Allow non-root users to specify the allow\_other or allow\_root mount
options, see mount.fuse3(8).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/fuse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fuse.nix)

## `programs.fzf.fuzzyCompletion` {#opt-programs.fzf.fuzzyCompletion}

Whether to enable fuzzy completion with fzf.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/fzf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fzf.nix)

## `programs.fzf.keybindings` {#opt-programs.fzf.keybindings}

Whether to enable fzf keybindings.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/fzf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/fzf.nix)

## `programs.gamemode.enable` {#opt-programs.gamemode.enable}

Whether to enable GameMode to optimise system performance on demand.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/gamemode.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gamemode.nix)

## `programs.gamemode.enableRenice` {#opt-programs.gamemode.enableRenice}

Whether to enable CAP\_SYS\_NICE on gamemoded to support lowering process niceness.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/gamemode.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gamemode.nix)

## `programs.gamemode.package` {#opt-programs.gamemode.package}

The gamemode package to use.

*Type:* package

*Default:* `pkgs.gamemode`

*Declared by:* [`nixos/modules/programs/gamemode.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gamemode.nix)

## `programs.gamemode.settings` {#opt-programs.gamemode.settings}

System-wide configuration for GameMode (/etc/gamemode.ini).
See `gamemoded(8)` man page for available settings.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string) or a list of them for duplicate keys)

*Default:* `{ }`

*Example:*

``` nix
{
  general = {
    renice = 10;
  };

  # Warning: GPU optimisations have the potential to damage hardware
  gpu = {
    apply_gpu_optimisations = "accept-responsibility";
    gpu_device = 0;
    amd_performance_level = "high";
  };

  custom = {
    start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
    end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
  };
}
```

*Declared by:* [`nixos/modules/programs/gamemode.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gamemode.nix)

## `programs.gamescope.args` {#opt-programs.gamescope.args}

Arguments passed to GameScope on startup.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--rt"
  "--prefer-vk-device 8086:9bc4"
]
```

*Declared by:* [`nixos/modules/programs/gamescope.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gamescope.nix)

## `programs.gamescope.capSysNice` {#opt-programs.gamescope.capSysNice}

Whether to enable the cap\_sys\_nice capability on the GameScope binary so that it may renice itself.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/gamescope.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gamescope.nix)

## `programs.gamescope.enable` {#opt-programs.gamescope.enable}

Whether to enable gamescope, the SteamOS session compositing window manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/gamescope.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gamescope.nix)

## `programs.gamescope.enableWsi` {#opt-programs.gamescope.enableWsi}

Whether to enable gamescope-wsi, the Vulkan WSI layer, alongside gamescope.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/gamescope.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gamescope.nix)

## `programs.gamescope.env` {#opt-programs.gamescope.env}

Default environment variables available to the GameScope process, overridable at runtime.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
# for Prime render offload on Nvidia laptops.
# Also requires `hardware.nvidia.prime.offload.enable`.
{
  __NV_PRIME_RENDER_OFFLOAD = "1";
  __VK_LAYER_NV_optimus = "NVIDIA_only";
  __GLX_VENDOR_LIBRARY_NAME = "nvidia";
}
```

*Declared by:* [`nixos/modules/programs/gamescope.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gamescope.nix)

## `programs.gamescope.package` {#opt-programs.gamescope.package}

The gamescope package to use.

*Type:* package

*Default:* `pkgs.gamescope`

*Declared by:* [`nixos/modules/programs/gamescope.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gamescope.nix)

## `programs.gdk-pixbuf.modulePackages` {#opt-programs.gdk-pixbuf.modulePackages}

Packages providing GDK-Pixbuf modules, for cache generation.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/programs/gdk-pixbuf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gdk-pixbuf.nix)

## `programs.geary.enable` {#opt-programs.geary.enable}

Whether to enable Geary, a Mail client for GNOME.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/geary.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/geary.nix)

## `programs.ghidra.enable` {#opt-programs.ghidra.enable}

Whether to enable Ghidra, a software reverse engineering (SRE) suite of tools.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/ghidra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ghidra.nix)

## `programs.ghidra.gdb` {#opt-programs.ghidra.gdb}

Whether to add to gdbinit the python modules required to make Ghidra's debugger work.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/ghidra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ghidra.nix)

## `programs.ghidra.package` {#opt-programs.ghidra.package}

The ghidra package to use.

*Type:* package

*Default:* `pkgs.ghidra`

*Example:* `ghidra-bin`

*Declared by:* [`nixos/modules/programs/ghidra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ghidra.nix)

## `programs.git-worktree-switcher.enable` {#opt-programs.git-worktree-switcher.enable}

Whether to enable git-worktree-switcher, switch between git worktrees with speed..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/git-worktree-switcher.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/git-worktree-switcher.nix)

## `programs.git-worktree-switcher.package` {#opt-programs.git-worktree-switcher.package}

The git-worktree-switcher package to use.

*Type:* package

*Default:* `pkgs.git-worktree-switcher`

*Declared by:* [`nixos/modules/programs/git-worktree-switcher.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/git-worktree-switcher.nix)

## `programs.git.attributes` {#opt-programs.git.attributes}

Assign git attributes to files (one pattern per line):

    PATTERN1 ATTR1 ATTR2 ...

Blank lines and lines beginning with # are ignored. See
`gitattributes(5)` for more information.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"*.pdf diff=pdf"`

*Declared by:* [`nixos/modules/programs/git.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/git.nix)

## `programs.git.config` {#opt-programs.git.config}

Configuration to write to /etc/gitconfig. A list can also be
specified to keep the configuration in order. For example, setting
`config` to `[ { foo.x = 42; } { bar.y = 42; }]` will put the `foo`
section before the `bar` section unlike the default alphabetical
order, which can be helpful for sections such as `include` and
`includeIf`. See the CONFIGURATION FILE section of `git-config(1)` for
more information.

*Type:* (attribute set of attribute set of anything) or list of attribute set of attribute set of anything

*Default:* `[ ]`

*Example:*

``` nix
{
  init = {
    defaultBranch = "main";
  };
  url = {
    "https://github.com/" = {
      insteadOf = [
        "gh:"
        "github:"
      ];
    };
  };
}
```

*Declared by:* [`nixos/modules/programs/git.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/git.nix)

## `programs.git.enable` {#opt-programs.git.enable}

Whether to enable git, a distributed version control system.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/git.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/git.nix)

## `programs.git.lfs.enable` {#opt-programs.git.lfs.enable}

Whether to enable git-lfs (Large File Storage).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/git.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/git.nix)

## `programs.git.lfs.enablePureSSHTransfer` {#opt-programs.git.lfs.enablePureSSHTransfer}

Whether to enable Enable pure SSH transfer in server side by adding git-lfs-transfer to environment.systemPackages.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/git.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/git.nix)

## `programs.git.lfs.package` {#opt-programs.git.lfs.package}

The git-lfs package to use.

*Type:* package

*Default:* `pkgs.git-lfs`

*Declared by:* [`nixos/modules/programs/git.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/git.nix)

## `programs.git.package` {#opt-programs.git.package}

The git package to use.

*Type:* package

*Default:* `pkgs.git`

*Example:* `gitFull`

*Declared by:* [`nixos/modules/programs/git.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/git.nix)

## `programs.git.prompt.enable` {#opt-programs.git.prompt.enable}

Whether to enable automatically sourcing git-prompt.sh. This does not change $PS1; it simply provides relevant utility functions.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/git.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/git.nix)

## `programs.gnome-disks.enable` {#opt-programs.gnome-disks.enable}

Whether to enable GNOME Disks daemon, a program designed to
be a UDisks2 graphical front-end.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/gnome-disks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gnome-disks.nix)

## `programs.gnome-terminal.enable` {#opt-programs.gnome-terminal.enable}

Whether to enable GNOME Terminal.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/gnome-terminal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gnome-terminal.nix)

## `programs.gnupg.agent.enable` {#opt-programs.gnupg.agent.enable}

Enables GnuPG agent with socket-activation for every user session.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/gnupg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gnupg.nix)

## `programs.gnupg.agent.enableBrowserSocket` {#opt-programs.gnupg.agent.enableBrowserSocket}

Enable browser socket for GnuPG agent.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/gnupg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gnupg.nix)

## `programs.gnupg.agent.enableExtraSocket` {#opt-programs.gnupg.agent.enableExtraSocket}

Enable extra socket for GnuPG agent.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/gnupg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gnupg.nix)

## `programs.gnupg.agent.enableSSHSupport` {#opt-programs.gnupg.agent.enableSSHSupport}

Enable SSH agent support in GnuPG agent. Also sets SSH\_AUTH\_SOCK
environment variable correctly. This will disable socket-activation
and thus always start a GnuPG agent per user session.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/gnupg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gnupg.nix)

## `programs.gnupg.agent.pinentryPackage` {#opt-programs.gnupg.agent.pinentryPackage}

Which pinentry package to use. The path to the mainProgram as defined in
the package's meta attributes will be set in /etc/gnupg/gpg-agent.conf.
If not set by the user, it'll pick an appropriate flavor depending on the
system configuration (qt flavor for lxqt and plasma, gtk2 for xfce,
gnome3 on all other systems with X enabled, curses otherwise).

*Type:* null or package

*Default:* matching the configured desktop environment or `pkgs.pinentry-curses`

*Example:* pkgs.pinentry-gnome3

*Declared by:* [`nixos/modules/programs/gnupg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gnupg.nix)

## `programs.gnupg.agent.settings` {#opt-programs.gnupg.agent.settings}

Configuration for /etc/gnupg/gpg-agent.conf.
See `gpg-agent(1)` for supported options.

*Type:* attribute set of (atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  default-cache-ttl = 600;
}
```

*Declared by:* [`nixos/modules/programs/gnupg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gnupg.nix)

## `programs.gnupg.dirmngr.enable` {#opt-programs.gnupg.dirmngr.enable}

Enables GnuPG network certificate management daemon with socket-activation for every user session.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/gnupg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gnupg.nix)

## `programs.gnupg.package` {#opt-programs.gnupg.package}

The gnupg package to use.

*Type:* package

*Default:* `pkgs.gnupg`

*Declared by:* [`nixos/modules/programs/gnupg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gnupg.nix)

## `programs.google-chrome.commandLineArgs` {#opt-programs.google-chrome.commandLineArgs}

Extra command line arguments passed to Google Chrome.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--disable-gpu"
  "--enable-features=VaapiVideoDecoder"
]
```

*Declared by:* [`nixos/modules/programs/google-chrome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/google-chrome.nix)

## `programs.google-chrome.enable` {#opt-programs.google-chrome.enable}

Whether to enable Google Chrome browser.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/google-chrome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/google-chrome.nix)

## `programs.google-chrome.extensions` {#opt-programs.google-chrome.extensions}

List of Chrome extension IDs to force install.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "cjpalhdlnbpafiamejdnhcphjbkeiagm"
  "nngceckbapebfimnlniiiahkandclblb"
]
```

*Declared by:* [`nixos/modules/programs/google-chrome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/google-chrome.nix)

## `programs.google-chrome.package` {#opt-programs.google-chrome.package}

The google-chrome package to use.

*Type:* package

*Default:* `pkgs.google-chrome`

*Declared by:* [`nixos/modules/programs/google-chrome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/google-chrome.nix)

## `programs.google-chrome.policies` {#opt-programs.google-chrome.policies}

Chrome enterprise policies written to managed policies JSON.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  HomepageLocation = "https://nixos.org";
  PasswordManagerEnabled = false;
}
```

*Declared by:* [`nixos/modules/programs/google-chrome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/google-chrome.nix)

## `programs.gpaste.enable` {#opt-programs.gpaste.enable}

Whether to enable GPaste, a clipboard manager.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/gpaste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gpaste.nix)

## `programs.gphoto2.enable` {#opt-programs.gphoto2.enable}

Whether to configure system to use gphoto2.
To grant digital camera access to a user, the user must
be part of the camera group:
`users.users.alice.extraGroups = ["camera"];`

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/gphoto2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gphoto2.nix)

## `programs.gpu-screen-recorder.enable` {#opt-programs.gpu-screen-recorder.enable}

Whether to enable gpu-screen-recorder and setcap wrappers for promptless recording.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/gpu-screen-recorder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gpu-screen-recorder.nix)

## `programs.gpu-screen-recorder.gtk.enable` {#opt-programs.gpu-screen-recorder.gtk.enable}

Whether to enable the GPU Screen Recorder GTK frontend.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/gpu-screen-recorder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gpu-screen-recorder.nix)

## `programs.gpu-screen-recorder.gtk.package` {#opt-programs.gpu-screen-recorder.gtk.package}

The gpu-screen-recorder-gtk package to use.

*Type:* package

*Default:* `pkgs.gpu-screen-recorder-gtk`

*Declared by:* [`nixos/modules/programs/gpu-screen-recorder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gpu-screen-recorder.nix)

## `programs.gpu-screen-recorder.package` {#opt-programs.gpu-screen-recorder.package}

The gpu-screen-recorder package to use.

*Type:* package

*Default:* `pkgs.gpu-screen-recorder`

*Declared by:* [`nixos/modules/programs/gpu-screen-recorder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gpu-screen-recorder.nix)

## `programs.gpu-screen-recorder.ui.enable` {#opt-programs.gpu-screen-recorder.ui.enable}

Whether to enable the GPU Screen Recorder overlay UI.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/gpu-screen-recorder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gpu-screen-recorder.nix)

## `programs.gpu-screen-recorder.ui.notifPackage` {#opt-programs.gpu-screen-recorder.ui.notifPackage}

The gpu-screen-recorder-notification package to use.

*Type:* package

*Default:* `pkgs.gpu-screen-recorder-notification`

*Declared by:* [`nixos/modules/programs/gpu-screen-recorder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gpu-screen-recorder.nix)

## `programs.gpu-screen-recorder.ui.package` {#opt-programs.gpu-screen-recorder.ui.package}

The gpu-screen-recorder-ui package to use.

*Type:* package

*Default:* `pkgs.gpu-screen-recorder-ui`

*Declared by:* [`nixos/modules/programs/gpu-screen-recorder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/gpu-screen-recorder.nix)

## `programs.gtklock.config` {#opt-programs.gtklock.config}

Configuration for gtklock.
See [`gtklock(1)`](https://github.com/jovanlanik/gtklock/blob/master/man/gtklock.1.scd) man page for details.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string) or a non-empty list of them)

*Default:* `{ }`

*Example:*

``` nix
{
  main = {
    idle-hide = true;
    idle-timeout = 10;
  };
}
```

*Declared by:* [`nixos/modules/programs/wayland/gtklock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/gtklock.nix)

## `programs.gtklock.enable` {#opt-programs.gtklock.enable}

Whether to enable gtklock, a GTK-based lockscreen for Wayland.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/gtklock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/gtklock.nix)

## `programs.gtklock.modules` {#opt-programs.gtklock.modules}

gtklock modules to load.

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
with pkgs; [
  gtklock-playerctl-module
  gtklock-powerbar-module
  gtklock-userinfo-module
]
```

*Declared by:* [`nixos/modules/programs/wayland/gtklock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/gtklock.nix)

## `programs.gtklock.package` {#opt-programs.gtklock.package}

The gtklock package to use.

*Type:* package

*Default:* `pkgs.gtklock`

*Declared by:* [`nixos/modules/programs/wayland/gtklock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/gtklock.nix)

## `programs.gtklock.style` {#opt-programs.gtklock.style}

CSS Stylesheet for gtklock.
See [gtklock's wiki](https://github.com/jovanlanik/gtklock/wiki#Styling) for details.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/programs/wayland/gtklock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/gtklock.nix)

## `programs.haguichi.enable` {#opt-programs.haguichi.enable}

Whether to enable Haguichi, a Linux GUI frontend to the proprietary LogMeIn Hamachi.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/haguichi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/haguichi.nix)

## `programs.hamster.enable` {#opt-programs.hamster.enable}

Whether to enable hamster, a time tracking program.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/hamster.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/hamster.nix)

## `programs.htop.enable` {#opt-programs.htop.enable}

Whether to enable htop process monitor.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/htop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/htop.nix)

## `programs.htop.package` {#opt-programs.htop.package}

The htop package to use.

*Type:* package

*Default:* `pkgs.htop`

*Declared by:* [`nixos/modules/programs/htop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/htop.nix)

## `programs.htop.settings` {#opt-programs.htop.settings}

Extra global default configuration for htop
which is read on first startup only.
Htop subsequently uses ~/.config/htop/htoprc
as configuration source.

*Type:* attribute set of (string or signed integer or boolean or list of (string or signed integer or boolean))

*Default:* `{ }`

*Example:*

``` nix
{
  hide_kernel_threads = true;
  hide_userland_threads = true;
}
```

*Declared by:* [`nixos/modules/programs/htop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/htop.nix)

## `programs.hyprland.enable` {#opt-programs.hyprland.enable}

Whether to enable Hyprland, the dynamic tiling Wayland compositor that doesn't sacrifice on its looks.
You can manually launch Hyprland by executing `start-hyprland` on a TTY.
A configuration file will be generated in `~/.config/hypr/hyprland.conf`.
See [https://wiki.hyprland.org](https://wiki.hyprland.org) for more information.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/hyprland.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/hyprland.nix)

## `programs.hyprland.package` {#opt-programs.hyprland.package}

The hyprland package to use. If the package is not overridable with `enableXWayland`, then the module option
`xwayland` will have no effect.

*Type:* package

*Default:* `pkgs.hyprland`

*Declared by:* [`nixos/modules/programs/wayland/hyprland.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/hyprland.nix)

## `programs.hyprland.portalPackage` {#opt-programs.hyprland.portalPackage}

The xdg-desktop-portal-hyprland package to use.

*Type:* package

*Default:* `pkgs.xdg-desktop-portal-hyprland`

*Declared by:* [`nixos/modules/programs/wayland/hyprland.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/hyprland.nix)

## `programs.hyprland.systemd.setPath.enable` {#opt-programs.hyprland.systemd.setPath.enable}

Set environment path of systemd to include the current system's bin directory.
This is needed in Hyprland setups, where opening links in applications do not work.
Enabled by default for Hyprland versions older than 0.41.2.

*Type:* boolean

*Default:* `lib.versionOlder cfg.package.version "0.41.2"`

*Example:* `false`

*Declared by:* [`nixos/modules/programs/wayland/hyprland.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/hyprland.nix)

## `programs.hyprland.withUWSM` {#opt-programs.hyprland.withUWSM}

Launch Hyprland with the UWSM (Universal Wayland Session Manager) session manager.
This has improved systemd support and is recommended for most users.
This automatically starts appropriate targets like `graphical-session.target`,
and `wayland-session@Hyprland.target`.

::: note
Some changes may need to be made to Hyprland configs depending on your setup, see
[Hyprland wiki](https://wiki.hyprland.org/Useful-Utilities/Systemd-start/#uwsm).
:::

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/hyprland.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/hyprland.nix)

## `programs.hyprland.xwayland.enable` {#opt-programs.hyprland.xwayland.enable}

Whether to enable XWayland.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/hyprland.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/hyprland.nix)

## `programs.hyprlock.enable` {#opt-programs.hyprlock.enable}

Whether to enable hyprlock, Hyprland's GPU-accelerated screen locking utility.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/hyprlock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/hyprlock.nix)

## `programs.hyprlock.package` {#opt-programs.hyprlock.package}

The hyprlock package to use.

*Type:* package

*Default:* `pkgs.hyprlock`

*Declared by:* [`nixos/modules/programs/wayland/hyprlock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/hyprlock.nix)

## `programs.i3lock.enable` {#opt-programs.i3lock.enable}

Whether to enable i3lock.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/i3lock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/i3lock.nix)

## `programs.i3lock.package` {#opt-programs.i3lock.package}

The i3lock package to use. ::: {.note}
The i3lock package must include a i3lock file or link in its out directory in order for the u2fSupport option to work correctly.
:::

*Type:* package

*Default:* `pkgs.i3lock`

*Example:* `i3lock-color`

*Declared by:* [`nixos/modules/programs/i3lock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/i3lock.nix)

## `programs.i3lock.u2fSupport` {#opt-programs.i3lock.u2fSupport}

Whether to enable U2F support in the i3lock program.
U2F enables authentication using a hardware device, such as a security key.
When U2F support is enabled, the i3lock program will set the setuid bit on the i3lock binary and enable the pam u2f service,

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/i3lock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/i3lock.nix)

## `programs.iay.enable` {#opt-programs.iay.enable}

Whether to enable iay, a minimalistic shell prompt.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/iay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/iay.nix)

## `programs.iay.minimalPrompt` {#opt-programs.iay.minimalPrompt}

Use minimal one-liner prompt.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/iay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/iay.nix)

## `programs.iay.package` {#opt-programs.iay.package}

The iay package to use.

*Type:* package

*Default:* `pkgs.iay`

*Declared by:* [`nixos/modules/programs/iay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/iay.nix)

## `programs.idescriptor.enable` {#opt-programs.idescriptor.enable}

Whether to enable iDescriptor, a cross-platform iDevice management tool.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/idescriptor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/idescriptor.nix)

## `programs.idescriptor.package` {#opt-programs.idescriptor.package}

The idescriptor package to use.

*Type:* package

*Default:* `pkgs.idescriptor`

*Declared by:* [`nixos/modules/programs/idescriptor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/idescriptor.nix)

## `programs.idescriptor.users` {#opt-programs.idescriptor.users}

Users to be added to the idevice group.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/programs/idescriptor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/idescriptor.nix)

## `programs.iftop.enable` {#opt-programs.iftop.enable}

Whether to enable iftop and setcap wrapper for it.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/iftop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/iftop.nix)

## `programs.iio-hyprland.enable` {#opt-programs.iio-hyprland.enable}

Whether to enable iio-hyprland and iio-sensor-proxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/iio-hyprland.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/iio-hyprland.nix)

## `programs.iio-hyprland.package` {#opt-programs.iio-hyprland.package}

The iio-hyprland package to use.

*Type:* package

*Default:* `pkgs.iio-hyprland`

*Declared by:* [`nixos/modules/programs/iio-hyprland.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/iio-hyprland.nix)

## `programs.immersed.enable` {#opt-programs.immersed.enable}

Whether to enable immersed.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/immersed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/immersed.nix)

## `programs.immersed.openFirewall` {#opt-programs.immersed.openFirewall}

Whether to open firewall ports for Immersed

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/immersed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/immersed.nix)

## `programs.immersed.package` {#opt-programs.immersed.package}

The immersed package to use.

*Type:* package

*Default:* `pkgs.immersed`

*Declared by:* [`nixos/modules/programs/immersed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/immersed.nix)

## `programs.ioquake3.baseq3` {#opt-programs.ioquake3.baseq3}

Path to the directory containing the baseq3 files (pak\*.pk3).

Defaults to the freely redistributable demo data (pak0) merged
with the 1.32 point release files (pak1-pak8), so the game runs
out of the box without owning a retail copy.

This value is passed directly as fs\_basepath, so pak files are
searched for in `${baseq3}/baseq3/`, e.g. a value of
`/var/lib/quake3` expects `/var/lib/quake3/baseq3/pak0.pk3` and
so on. To use a full retail install instead, point this at the
directory containing its `baseq3` folder.

*Type:* package or absolute path

*Default:* ``"Freely redistributable Quake 3 demo data (`pak0`) plus the 1.32 point release files (`pak1`-`pak8`), merged together."``

*Example:* `"/var/lib/quake3"`

*Declared by:* [`nixos/modules/programs/ioquake3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ioquake3.nix)

## `programs.ioquake3.enable` {#opt-programs.ioquake3.enable}

Whether to enable ioquake3, an enhanced, cross-platform, open source engine for id Software's Quake 3.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/ioquake3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ioquake3.nix)

## `programs.ioquake3.package` {#opt-programs.ioquake3.package}

The ioquake3 package to use.

*Type:* package

*Default:* `pkgs.ioquake3`

*Declared by:* [`nixos/modules/programs/ioquake3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ioquake3.nix)

## `programs.ioquake3.settings` {#opt-programs.ioquake3.settings}

ioquake3 configuration, written out as a cfg file that is loaded on
startup via `+exec`. Keys are cvar names, values are the cvar
values.

See [https://ioquake3.org/help/players-guide/](https://ioquake3.org/help/players-guide/) for some available
configuration options.

*Type:* attribute set of (string or signed integer or floating point number or boolean)

*Default:* `{ }`

*Example:*

``` nix
{
  name = "Player";
  sensitivity = 5;
  r_fullscreen = true;
  cl_maxfps = 125;
}
```

*Declared by:* [`nixos/modules/programs/ioquake3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ioquake3.nix)

## `programs.iotop.enable` {#opt-programs.iotop.enable}

Whether to enable iotop + setcap wrapper.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/iotop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/iotop.nix)

## `programs.iotop.enableDelayacct` {#opt-programs.iotop.enableDelayacct}

Whether to enable the task\_delayacct kernel task delay accounting in order to show all
statistics.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/iotop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/iotop.nix)

## `programs.iotop.package` {#opt-programs.iotop.package}

The iotop package to use.

*Type:* package

*Default:* `pkgs.iotop`

*Example:* `iotop-c`

*Declared by:* [`nixos/modules/programs/iotop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/iotop.nix)

## `programs.ironbar.enable` {#opt-programs.ironbar.enable}

Whether to enable ironbar, a customizable gtk-layer-shell wlroots/sway bar written in Rust.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/ironbar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/ironbar.nix)

## `programs.ironbar.package` {#opt-programs.ironbar.package}

The ironbar package to use.

*Type:* package

*Default:* `pkgs.ironbar`

*Declared by:* [`nixos/modules/programs/wayland/ironbar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/ironbar.nix)

## `programs.ironbar.systemd.target` {#opt-programs.ironbar.systemd.target}

The systemd target that will automatically start the Ironbar service.

*Type:* string

*Default:* `"graphical-session.target"`

*Declared by:* [`nixos/modules/programs/wayland/ironbar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/ironbar.nix)

## `programs.jai-jail.enable` {#opt-programs.jai-jail.enable}

Whether to enable jai, a sandbox for AI agents.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/jai-jail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/jai-jail.nix)

## `programs.jai-jail.package` {#opt-programs.jai-jail.package}

The jai package to use.

*Type:* package

*Default:* `pkgs.jai-jail`

*Declared by:* [`nixos/modules/programs/jai-jail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/jai-jail.nix)

## `programs.java.binfmt` {#opt-programs.java.binfmt}

Whether to enable binfmt to execute java jar's and classes.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/java.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/java.nix)

## `programs.java.enable` {#opt-programs.java.enable}

Install and setup the Java development kit.

::: note
This adds JAVA\_HOME to the global environment, by sourcing the
jdk's setup-hook on shell init. It is equivalent to starting a shell
through 'nix-shell -p jdk', or roughly the following system-wide
configuration:

    environment.variables.JAVA_HOME = ${pkgs.jdk.home}/lib/openjdk;
    environment.systemPackages = [ pkgs.jdk ];
:::

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/java.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/java.nix)

## `programs.java.package` {#opt-programs.java.package}

The jdk package to use.

*Type:* package

*Default:* `pkgs.jdk`

*Example:* `jre`

*Declared by:* [`nixos/modules/programs/java.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/java.nix)

## `programs.joycond-cemuhook.enable` {#opt-programs.joycond-cemuhook.enable}

Whether to enable joycond-cemuhook, a program to enable support for cemuhook's UDP protocol for joycond devices.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/joycond-cemuhook.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/joycond-cemuhook.nix)

## `programs.k3b.enable` {#opt-programs.k3b.enable}

Whether to enable k3b, the KDE disk burning application.

Additionally to installing `k3b` enabling this will
add `setuid` wrappers in `/run/wrappers/bin`
for both `cdrdao` and `cdrecord`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/k3b.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/k3b.nix)

## `programs.k40-whisperer.enable` {#opt-programs.k40-whisperer.enable}

Whether to enable K40-Whisperer.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/k40-whisperer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/k40-whisperer.nix)

## `programs.k40-whisperer.group` {#opt-programs.k40-whisperer.group}

Group assigned to the device when connected.

*Type:* string

*Default:* `"k40"`

*Declared by:* [`nixos/modules/programs/k40-whisperer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/k40-whisperer.nix)

## `programs.k40-whisperer.package` {#opt-programs.k40-whisperer.package}

The k40-whisperer package to use.

*Type:* package

*Default:* `pkgs.k40-whisperer`

*Declared by:* [`nixos/modules/programs/k40-whisperer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/k40-whisperer.nix)

## `programs.kbdlight.enable` {#opt-programs.kbdlight.enable}

Whether to enable kbdlight.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/kbdlight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/kbdlight.nix)

## `programs.kclock.enable` {#opt-programs.kclock.enable}

Whether to enable KClock.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/kclock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/kclock.nix)

## `programs.kde-pim.enable` {#opt-programs.kde-pim.enable}

Whether to enable KDE PIM base packages.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/kde-pim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/kde-pim.nix)

## `programs.kde-pim.kmail` {#opt-programs.kde-pim.kmail}

Whether to enable KMail.

*Type:* boolean

*Default:* `"config.programs.kde-pim.enable"`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/kde-pim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/kde-pim.nix)

## `programs.kde-pim.kontact` {#opt-programs.kde-pim.kontact}

Whether to enable Kontact.

*Type:* boolean

*Default:* `"config.programs.kde-pim.enable"`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/kde-pim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/kde-pim.nix)

## `programs.kde-pim.merkuro` {#opt-programs.kde-pim.merkuro}

Whether to enable Merkuro.

*Type:* boolean

*Default:* `"config.programs.kde-pim.enable"`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/kde-pim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/kde-pim.nix)

## `programs.kdeconnect.enable` {#opt-programs.kdeconnect.enable}

Whether to enable kdeconnect.

Note that by default it will open the TCP and UDP ports from
1714 to 1764 as they are needed for it to function properly.
See `openFirewall` to control this behavior.
You can use the `package` to use
`gnomeExtensions.gsconnect` as an alternative
implementation if you use Gnome
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/kdeconnect.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/kdeconnect.nix)

## `programs.kdeconnect.openFirewall` {#opt-programs.kdeconnect.openFirewall}

Whether to open the required TCP and UDP ports (1714-1764) needed by KDE Connect.

*Type:* boolean

*Default:* `config.programs.kdeconnect.enable`

*Declared by:* [`nixos/modules/programs/kdeconnect.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/kdeconnect.nix)

## `programs.kdeconnect.package` {#opt-programs.kdeconnect.package}

The kdeconnect-kde package to use.

*Type:* null or package

*Default:* `pkgs.kdePackages.kdeconnect-kde`

*Example:* `gnomeExtensions.gsconnect`

*Declared by:* [`nixos/modules/programs/kdeconnect.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/kdeconnect.nix)

## `programs.kubeswitch.commandName` {#opt-programs.kubeswitch.commandName}

The name of the command to use

*Type:* string

*Default:* `"kswitch"`

*Declared by:* [`nixos/modules/programs/kubeswitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/kubeswitch.nix)

## `programs.kubeswitch.enable` {#opt-programs.kubeswitch.enable}

Whether to enable kubeswitch.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/kubeswitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/kubeswitch.nix)

## `programs.kubeswitch.package` {#opt-programs.kubeswitch.package}

The kubeswitch package to use.

*Type:* package

*Default:* `pkgs.kubeswitch`

*Declared by:* [`nixos/modules/programs/kubeswitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/kubeswitch.nix)

## `programs.labwc.enable` {#opt-programs.labwc.enable}

Whether to enable labwc.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/labwc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/labwc.nix)

## `programs.labwc.package` {#opt-programs.labwc.package}

The labwc package to use.

*Type:* package

*Default:* `pkgs.labwc`

*Declared by:* [`nixos/modules/programs/wayland/labwc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/labwc.nix)

## `programs.ladybird.enable` {#opt-programs.ladybird.enable}

Whether to enable the Ladybird web browser.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/ladybird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ladybird.nix)

## `programs.lazygit.enable` {#opt-programs.lazygit.enable}

Whether to enable lazygit, a simple terminal UI for git commands.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/lazygit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/lazygit.nix)

## `programs.lazygit.package` {#opt-programs.lazygit.package}

The lazygit package to use.

*Type:* package

*Default:* `pkgs.lazygit`

*Declared by:* [`nixos/modules/programs/lazygit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/lazygit.nix)

## `programs.lazygit.settings` {#opt-programs.lazygit.settings}

Lazygit configuration.

See [https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md](https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md) for documentation.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/lazygit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/lazygit.nix)

## `programs.less.clearDefaultCommands` {#opt-programs.less.clearDefaultCommands}

Clear all default commands.
You should remember to set the quit key.
Otherwise you will not be able to leave less without killing it.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/less.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/less.nix)

## `programs.less.commands` {#opt-programs.less.commands}

Defines new command keys.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  h = "noaction 5\\e(";
  l = "noaction 5\\e)";
}
```

*Declared by:* [`nixos/modules/programs/less.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/less.nix)

## `programs.less.configFile` {#opt-programs.less.configFile}

Path to lesskey configuration file.

`configFile` takes precedence over `commands`,
`clearDefaultCommands`, `lineEditingKeys`, and
`envVariables`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.my-configs}/lesskey"`

*Declared by:* [`nixos/modules/programs/less.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/less.nix)

## `programs.less.defaultPager` {#opt-programs.less.defaultPager}

Whether to enable less as the default pager.

*Type:* boolean

*Default:* `config.programs.less.enable`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/less.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/less.nix)

## `programs.less.enable` {#opt-programs.less.enable}

Whether to enable less, a file pager.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/less.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/less.nix)

## `programs.less.envVariables` {#opt-programs.less.envVariables}

Defines environment variables.

*Type:* attribute set of string

*Default:*

``` nix
{
  LESS = "-R";
}
```

*Example:*

``` nix
{
  LESS = "--quit-if-one-screen";
}
```

*Declared by:* [`nixos/modules/programs/less.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/less.nix)

## `programs.less.lessclose` {#opt-programs.less.lessclose}

When less closes a file opened in such a way, it will call another program, called the input postprocessor,
which may perform any desired clean-up action (such as deleting the replacement file created by LESSOPEN).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/programs/less.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/less.nix)

## `programs.less.lessopen` {#opt-programs.less.lessopen}

Before less opens a file, it first gives your input preprocessor a chance to modify the way the contents of the file are displayed.

*Type:* null or string

*Default:* `null`

*Example:* `"|${pkgs.lesspipe}/bin/lesspipe.sh %s"`

*Declared by:* [`nixos/modules/programs/less.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/less.nix)

## `programs.less.lineEditingKeys` {#opt-programs.less.lineEditingKeys}

Defines new line-editing keys.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  e = "abort";
}
```

*Declared by:* [`nixos/modules/programs/less.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/less.nix)

## `programs.less.package` {#opt-programs.less.package}

The less package to use.

*Type:* package

*Default:* `pkgs.less`

*Declared by:* [`nixos/modules/programs/less.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/less.nix)

## `programs.liboping.enable` {#opt-programs.liboping.enable}

Whether to enable liboping.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/liboping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/liboping.nix)

## `programs.librepods.enable` {#opt-programs.librepods.enable}

Whether to configure system to enable librepods.
To grant access to a user, it must be part of librepods group:
`users.users.alice.extraGroups = ["librepods"];`

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/librepods.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/librepods.nix)

## `programs.localsend.enable` {#opt-programs.localsend.enable}

Whether to enable localsend, an open source cross-platform alternative to AirDrop.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/localsend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/localsend.nix)

## `programs.localsend.openFirewall` {#opt-programs.localsend.openFirewall}

Whether to enable opening the firewall port 53317 for receiving files.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/localsend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/localsend.nix)

## `programs.localsend.package` {#opt-programs.localsend.package}

The localsend package to use.

*Type:* package

*Default:* `pkgs.localsend`

*Declared by:* [`nixos/modules/programs/localsend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/localsend.nix)

## `programs.mango.enable` {#opt-programs.mango.enable}

Whether to enable Mango, a Wayland compositor based on dwl and scenefx.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/mango.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/mango.nix)

## `programs.mango.package` {#opt-programs.mango.package}

The mango package to use.

*Type:* package

*Default:* `pkgs.mango`

*Example:* `pkgs.mango.override { enableXWayland = false; }`

*Declared by:* [`nixos/modules/programs/wayland/mango.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/mango.nix)

## `programs.mdevctl.enable` {#opt-programs.mdevctl.enable}

Whether to enable Mediated Device Management.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/mdevctl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/mdevctl.nix)

## `programs.mepo.enable` {#opt-programs.mepo.enable}

Whether to enable Mepo, a fast, simple and hackable OSM map viewer.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/mepo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/mepo.nix)

## `programs.mepo.locationBackends.geoclue` {#opt-programs.mepo.locationBackends.geoclue}

Whether to enable location detection via geoclue

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/mepo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/mepo.nix)

## `programs.mepo.locationBackends.gpsd` {#opt-programs.mepo.locationBackends.gpsd}

Whether to enable location detection via gpsd.
This may require additional configuration of gpsd, see [here](../../options/services-g/index.md#opt-services.gpsd.enable)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/mepo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/mepo.nix)

## `programs.mininet.enable` {#opt-programs.mininet.enable}

Whether to enable Mininet, an emulator for rapid prototyping of Software Defined Networks.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/mininet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/mininet.nix)

## `programs.minipro.enable` {#opt-programs.minipro.enable}

Whether to enable minipro and its udev rules.
Users of the `plugdev` group can interact with connected MiniPRO chip programmers.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/minipro.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/minipro.nix)

## `programs.minipro.package` {#opt-programs.minipro.package}

The minipro package to use.

*Type:* package

*Default:* `pkgs.minipro`

*Declared by:* [`nixos/modules/programs/minipro.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/minipro.nix)

## `programs.miriway.config` {#opt-programs.miriway.config}

Contents of system-wide miriway-shell.config. See Miriway's configuration documentation for details.

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  x11-window-title=Miriway (Mir-on-X)
  idle-timeout=600
''
```

*Example:*

``` nix
''
  idle-timeout=300
  add-wayland-extensions=all
  
  shell-component=waybar
  shell-component=wbg Pictures/wallpaper
''
```

*Declared by:* [`nixos/modules/programs/miriway.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/miriway.nix)

## `programs.miriway.enable` {#opt-programs.miriway.enable}

Whether to enable Miriway, a Mir based Wayland compositor. You can manually launch Miriway by
executing "exec miriway" on a TTY, or launch it from a display manager. Copy
/etc/xdg/xdg-miriway/miriway-shell.config to ~/.config/miriway-shell.config
and /etc/xdg/xdg-miriway/miriway-shell.settings to ~/.config/miriway-shell.settings
to modify the system-wide configuration on a per-user basis. See [https://github.com/Miriway/Miriway](https://github.com/Miriway/Miriway),
and "miriway --help" for more information.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/miriway.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/miriway.nix)

## `programs.miriway.settings` {#opt-programs.miriway.settings}

Contents of system-wide miriway-shell.settings. See Miriway's configuration documentation for details.

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  command_ctrl_alt=t:miriway-terminal # Default "terminal emulator finder"
  
  command_meta=Left:@dock-left
  command_meta=Right:@dock-right
  command_meta=Space:@toggle-maximized
  command_meta=Home:@workspace-begin
  command_meta=End:@workspace-end
  command_meta=Page_Up:@workspace-up
  command_meta=Page_Down:@workspace-down
  command_ctrl_alt=BackSpace:@exit
''
```

*Example:*

``` nix
''
  command_ctrl_alt=t:weston-terminal
  command_shell_meta=a:synapse
  
  command_meta=Left:@dock-left
  command_meta=Right:@dock-right
  command_meta=Space:@toggle-maximized
  command_meta=Home:@workspace-begin
  command_meta=End:@workspace-end
  command_meta=Page_Up:@workspace-up
  command_meta=Page_Down:@workspace-down
  command_ctrl_alt=BackSpace:@exit
''
```

*Declared by:* [`nixos/modules/programs/miriway.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/miriway.nix)

## `programs.moonlight-qt.capSysNice` {#opt-programs.moonlight-qt.capSysNice}

Add the CAP\_SYS\_NICE capability to Moonlight Qt so that it may raise
its scheduling priority.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/moonlight-qt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/moonlight-qt.nix)

## `programs.moonlight-qt.enable` {#opt-programs.moonlight-qt.enable}

Whether to enable Moonlight Qt, a client for playing your PC games on almost any device.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/moonlight-qt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/moonlight-qt.nix)

## `programs.moonlight-qt.package` {#opt-programs.moonlight-qt.package}

The moonlight-qt package to use.

*Type:* package

*Default:* `pkgs.moonlight-qt`

*Declared by:* [`nixos/modules/programs/moonlight-qt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/moonlight-qt.nix)

## `programs.mosh.enable` {#opt-programs.mosh.enable}

Whether to enable mosh.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/mosh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/mosh.nix)

## `programs.mosh.openFirewall` {#opt-programs.mosh.openFirewall}

Whether to automatically open the necessary ports in the firewall.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/mosh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/mosh.nix)

## `programs.mosh.package` {#opt-programs.mosh.package}

The mosh package to use.

*Type:* package

*Default:* `pkgs.mosh`

*Declared by:* [`nixos/modules/programs/mosh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/mosh.nix)

## `programs.mosh.withUtempter` {#opt-programs.mosh.withUtempter}

Whether to enable libutempter for mosh.

This is required so that mosh can write to /var/run/utmp (which can be queried with `who` to display currently connected user sessions).
Note, this will add a guid wrapper for the group utmp!

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/mosh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/mosh.nix)

## `programs.mouse-actions.autorun` {#opt-programs.mouse-actions.autorun}

Whether to start a user service to run mouse-actions on startup.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/mouse-actions.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/mouse-actions.nix)

## `programs.mouse-actions.enable` {#opt-programs.mouse-actions.enable}

Whether to install and set up mouse-actions and it's udev rules.

Note that only users in the "uinput" group will be able to use the package

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/mouse-actions.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/mouse-actions.nix)

## `programs.mouse-actions.package` {#opt-programs.mouse-actions.package}

The mouse-actions package to use.

*Type:* package

*Default:* `pkgs.mouse-actions`

*Declared by:* [`nixos/modules/programs/mouse-actions.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/mouse-actions.nix)

## `programs.msmtp.accounts` {#opt-programs.msmtp.accounts}

Named accounts and their respective configurations.
The special name "default" allows a default account to be defined.
See `msmtp(1)` for the available options.

Use `programs.msmtp.extraConfig` instead of this attribute set-based
option if ordered account inheritance is needed.

It is advised to use the `passwordeval` setting to read the password
from a secret file to avoid having it written in the world-readable
nix store. The password file must end with a newline (`\n`).

*Type:* attribute set of (attribute set)

*Default:* `{ }`

*Example:*

``` nix
{
  default = {
    auth = true;
    host = "smtp.example";
    passwordeval = "cat /secrets/password.txt";
    user = "someone";
  };
}
```

*Declared by:* [`nixos/modules/programs/msmtp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/msmtp.nix)

## `programs.msmtp.defaults` {#opt-programs.msmtp.defaults}

Default values applied to all accounts.
See `msmtp(1)` for the available options.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  aliases = "/etc/aliases";
  port = 587;
  tls = true;
}
```

*Declared by:* [`nixos/modules/programs/msmtp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/msmtp.nix)

## `programs.msmtp.enable` {#opt-programs.msmtp.enable}

Whether to enable msmtp - an SMTP client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/msmtp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/msmtp.nix)

## `programs.msmtp.extraConfig` {#opt-programs.msmtp.extraConfig}

Extra lines to add to the msmtp configuration verbatim.
See `msmtp(1)` for the syntax and available options.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/programs/msmtp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/msmtp.nix)

## `programs.msmtp.package` {#opt-programs.msmtp.package}

The msmtp package to use.

*Type:* package

*Default:* `pkgs.msmtp`

*Declared by:* [`nixos/modules/programs/msmtp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/msmtp.nix)

## `programs.msmtp.setSendmail` {#opt-programs.msmtp.setSendmail}

Whether to set the system sendmail to msmtp's.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/msmtp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/msmtp.nix)

## `programs.mtr.enable` {#opt-programs.mtr.enable}

Whether to add mtr to the global environment and configure a
setcap wrapper for it.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/mtr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/mtr.nix)

## `programs.mtr.package` {#opt-programs.mtr.package}

The mtr package to use.

*Type:* package

*Default:* `pkgs.mtr`

*Declared by:* [`nixos/modules/programs/mtr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/mtr.nix)

## `programs.nano.defaultEditor` {#opt-programs.nano.defaultEditor}

Whether to enable nano as the default editor.

*Type:* boolean

*Default:* `config.programs.nano.enable`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/nano.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nano.nix)

## `programs.nano.enable` {#opt-programs.nano.enable}

Whether to enable nano, a small user-friendly console text editor.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/nano.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nano.nix)

## `programs.nano.nanorc` {#opt-programs.nano.nanorc}

The system-wide nano configuration.
See `nanorc(5)`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  set nowrap
  set tabstospaces
  set tabsize 2
''
```

*Declared by:* [`nixos/modules/programs/nano.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nano.nix)

## `programs.nano.package` {#opt-programs.nano.package}

The nano package to use.

*Type:* package

*Default:* `pkgs.nano`

*Declared by:* [`nixos/modules/programs/nano.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nano.nix)

## `programs.nano.syntaxHighlight` {#opt-programs.nano.syntaxHighlight}

Whether to enable syntax highlight for various languages.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/nano.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nano.nix)

## `programs.nautilus-open-any-terminal.enable` {#opt-programs.nautilus-open-any-terminal.enable}

Whether to enable nautilus-open-any-terminal.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/nautilus-open-any-terminal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nautilus-open-any-terminal.nix)

## `programs.nautilus-open-any-terminal.terminal` {#opt-programs.nautilus-open-any-terminal.terminal}

The terminal emulator to add to context-entry of nautilus. Supported terminal
emulators are listed in [https://github.com/Stunkymonkey/nautilus-open-any-terminal#supported-terminal-emulators](https://github.com/Stunkymonkey/nautilus-open-any-terminal#supported-terminal-emulators).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/programs/nautilus-open-any-terminal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nautilus-open-any-terminal.nix)

## `programs.nbd.enable` {#opt-programs.nbd.enable}

Whether to enable Network Block Device (nbd) support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/nbd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nbd.nix)

## `programs.neovim.configure` {#opt-programs.neovim.configure}

Generate your init file from your list of plugins and custom commands.
Neovim will then be wrapped to load `nvim -u /nix/store/«hash»-vimrc`

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  customRC = ''
    " here your custom VimScript configuration goes!
  '';
  customLuaRC = ''
    -- here your custom Lua configuration goes!
  '';
  packages.myVimPackage = with pkgs.vimPlugins; {
    # loaded on launch
    start = [ fugitive ];
    # manually loadable by calling `:packadd $plugin-name`
    opt = [ ];
  };
}
```

*Declared by:* [`nixos/modules/programs/neovim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/neovim.nix)

## `programs.neovim.defaultEditor` {#opt-programs.neovim.defaultEditor}

When enabled, installs neovim and configures neovim to be the default editor
using the EDITOR environment variable.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/neovim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/neovim.nix)

## `programs.neovim.enable` {#opt-programs.neovim.enable}

Whether to enable Neovim.

When enabled through this option, Neovim is wrapped to use a
configuration managed by this module. The configuration file in the
user's home directory at `~/.config/nvim/init.vim` is no longer
loaded by default.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/neovim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/neovim.nix)

## `programs.neovim.package` {#opt-programs.neovim.package}

The neovim-unwrapped package to use.

*Type:* package

*Default:* `pkgs.neovim-unwrapped`

*Declared by:* [`nixos/modules/programs/neovim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/neovim.nix)

## `programs.neovim.runtime` {#opt-programs.neovim.runtime}

Set of files that have to be linked in `runtime`.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{ "ftplugin/c.vim".text = "setlocal omnifunc=v:lua.vim.lsp.omnifunc"; }
```

*Declared by:* [`nixos/modules/programs/neovim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/neovim.nix)

## `programs.neovim.runtime.<name>.enable` {#opt-programs.neovim.runtime._name_.enable}

Whether this runtime directory should be generated.  This
option allows specific runtime files to be disabled.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/neovim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/neovim.nix)

## `programs.neovim.runtime.<name>.source` {#opt-programs.neovim.runtime._name_.source}

Path of the source file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/programs/neovim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/neovim.nix)

## `programs.neovim.runtime.<name>.target` {#opt-programs.neovim.runtime._name_.target}

Name of symlink.  Defaults to the attribute
name.

*Type:* string

*Declared by:* [`nixos/modules/programs/neovim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/neovim.nix)

## `programs.neovim.runtime.<name>.text` {#opt-programs.neovim.runtime._name_.text}

Text of the file.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/programs/neovim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/neovim.nix)

## `programs.neovim.viAlias` {#opt-programs.neovim.viAlias}

Symlink `vi` to `nvim` binary.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/neovim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/neovim.nix)

## `programs.neovim.vimAlias` {#opt-programs.neovim.vimAlias}

Symlink `vim` to `nvim` binary.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/neovim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/neovim.nix)

## `programs.neovim.withNodeJs` {#opt-programs.neovim.withNodeJs}

Enable Node provider.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/neovim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/neovim.nix)

## `programs.neovim.withPython3` {#opt-programs.neovim.withPython3}

Enable Python 3 provider.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/neovim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/neovim.nix)

## `programs.neovim.withRuby` {#opt-programs.neovim.withRuby}

Enable Ruby provider.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/neovim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/neovim.nix)

## `programs.nethoscope.enable` {#opt-programs.nethoscope.enable}

Whether to add nethoscope to the global environment and configure a
setcap wrapper for it.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/nethoscope.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nethoscope.nix)

## `programs.nexttrace.enable` {#opt-programs.nexttrace.enable}

Whether to enable Nexttrace to the global environment and configure a setcap wrapper for it.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/nexttrace.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nexttrace.nix)

## `programs.nexttrace.package` {#opt-programs.nexttrace.package}

The nexttrace package to use.

*Type:* package

*Default:* `pkgs.nexttrace`

*Declared by:* [`nixos/modules/programs/nexttrace.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nexttrace.nix)

## `programs.nh.clean.dates` {#opt-programs.nh.clean.dates}

How often cleanup is performed. Passed to systemd.time

The format is described in
`systemd.time(7)`.

*Type:* (optionally newline-terminated) single-line string

*Default:* `"weekly"`

*Declared by:* [`nixos/modules/programs/nh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nh.nix)

## `programs.nh.clean.enable` {#opt-programs.nh.clean.enable}

Whether to enable periodic garbage collection with nh clean all.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/nh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nh.nix)

## `programs.nh.clean.extraArgs` {#opt-programs.nh.clean.extraArgs}

Options given to nh clean when the service is run automatically.

See `nh clean all --help` for more information.

*Type:* (optionally newline-terminated) single-line string

*Default:* `""`

*Example:* `"--keep 5 --keep-since 3d"`

*Declared by:* [`nixos/modules/programs/nh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nh.nix)

## `programs.nh.enable` {#opt-programs.nh.enable}

Whether to enable nh, yet another Nix CLI helper.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/nh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nh.nix)

## `programs.nh.flake` {#opt-programs.nh.flake}

The string that will be used for the `NH_FLAKE` environment variable.

`NH_FLAKE` is used by nh as the default flake for performing actions, such as
`nh os switch`. This behaviour can be overriden per-command with environment
variables that will take priority.

- `NH_OS_FLAKE`: will take priority for `nh os` commands.
- `NH_HOME_FLAKE`: will take priority for `nh home` commands.
- `NH_DARWIN_FLAKE`: will take priority for `nh darwin` commands.

The formerly valid `FLAKE` is now deprecated by nh, and will cause hard errors
in future releases if `NH_FLAKE` is not set.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/programs/nh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nh.nix)

## `programs.nh.package` {#opt-programs.nh.package}

The nh package to use.

*Type:* package

*Default:* `pkgs.nh`

*Declared by:* [`nixos/modules/programs/nh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nh.nix)

## `programs.niri.enable` {#opt-programs.niri.enable}

Whether to enable Niri, a scrollable-tiling Wayland compositor.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/niri.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/niri.nix)

## `programs.niri.package` {#opt-programs.niri.package}

The niri package to use.

*Type:* package

*Default:* `pkgs.niri`

*Declared by:* [`nixos/modules/programs/wayland/niri.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/niri.nix)

## `programs.niri.useNautilus` {#opt-programs.niri.useNautilus}

Whether to enable Nautilus as file-chooser for xdg-desktop-portal-gnome.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/niri.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/niri.nix)

## `programs.nix-index.enable` {#opt-programs.nix-index.enable}

Whether to enable nix-index, a file database for nixpkgs.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/nix-index.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nix-index.nix)

## `programs.nix-index.enableBashIntegration` {#opt-programs.nix-index.enableBashIntegration}

Whether to enable Bash integration.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/nix-index.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nix-index.nix)

## `programs.nix-index.enableFishIntegration` {#opt-programs.nix-index.enableFishIntegration}

Whether to enable Fish integration.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/nix-index.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nix-index.nix)

## `programs.nix-index.enableZshIntegration` {#opt-programs.nix-index.enableZshIntegration}

Whether to enable Zsh integration.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/nix-index.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nix-index.nix)

## `programs.nix-index.package` {#opt-programs.nix-index.package}

The nix-index package to use.

*Type:* package

*Default:* `pkgs.nix-index`

*Declared by:* [`nixos/modules/programs/nix-index.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nix-index.nix)

## `programs.nix-ld.enable` {#opt-programs.nix-ld.enable}

Whether to enable nix-ld, Documentation: [https://github.com/nix-community/nix-ld](https://github.com/nix-community/nix-ld).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/nix-ld.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nix-ld.nix)

## `programs.nix-ld.libraries` {#opt-programs.nix-ld.libraries}

Libraries that automatically become available to all programs. The default set includes common libraries.

*Type:* list of package

*Default:* `baseLibraries derived from systemd and nix dependencies.`

*Declared by:* [`nixos/modules/programs/nix-ld.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nix-ld.nix)

## `programs.nix-ld.package` {#opt-programs.nix-ld.package}

The nix-ld package to use.

*Type:* package

*Default:* `pkgs.nix-ld`

*Declared by:* [`nixos/modules/programs/nix-ld.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nix-ld.nix)

## `programs.nix-required-mounts.allowedPatterns` {#opt-programs.nix-required-mounts.allowedPatterns}

The hook config, describing which paths to mount for which system features

*Type:* attribute set of (submodule)

*Default:*

``` nix
{
  opengl.paths = config.hardware.graphics.extraPackages ++ [
    config.graphics.opengl.package
    pkgs.addDriverRunpath.driverLink
    "/dev/dri"
  ];
}
```

*Example:*

``` nix
{
  require-ipfs = {
    onFeatures = [
      "ipfs"
    ];
    paths = [
      "/ipfs"
    ];
  };
}
```

*Declared by:* [`nixos/modules/programs/nix-required-mounts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nix-required-mounts.nix)

## `programs.nix-required-mounts.allowedPatterns.<name>.onFeatures` {#opt-programs.nix-required-mounts.allowedPatterns._name_.onFeatures}

Which requiredSystemFeatures should trigger relaxation of the sandbox

*Type:* list of string

*Default:*

``` nix
[
  "‹name›"
]
```

*Declared by:* [`nixos/modules/programs/nix-required-mounts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nix-required-mounts.nix)

## `programs.nix-required-mounts.allowedPatterns.<name>.paths` {#opt-programs.nix-required-mounts.allowedPatterns._name_.paths}

A list of glob patterns, indicating which paths to expose to the sandbox

*Type:* list of (absolute path or (submodule))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/programs/nix-required-mounts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nix-required-mounts.nix)

## `programs.nix-required-mounts.allowedPatterns.<name>.safePrefixes` {#opt-programs.nix-required-mounts.allowedPatterns._name_.safePrefixes}

A list of path prefixes that do not need and shall not be searched recursively for further symlink targets. Everything in the nix store does not need to be searched as the derivation already calculcated the full closure of all nix store paths for the drivers package.

*Type:* list of absolute path

*Default:*

``` nix
[
  "/build/store"
]
```

*Declared by:* [`nixos/modules/programs/nix-required-mounts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nix-required-mounts.nix)

## `programs.nix-required-mounts.allowedPatterns.<name>.unsafeFollowSymlinks` {#opt-programs.nix-required-mounts.allowedPatterns._name_.unsafeFollowSymlinks}

Whether to enable Instructs the hook to mount the symlink targets as well, when any of
the `paths` contain symlinks. This may not work correctly with glob
patterns.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/nix-required-mounts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nix-required-mounts.nix)

## `programs.nix-required-mounts.enable` {#opt-programs.nix-required-mounts.enable}

Whether to enable Expose extra paths to the sandbox depending on derivations' requiredSystemFeatures.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/nix-required-mounts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nix-required-mounts.nix)

## `programs.nix-required-mounts.extraWrapperArgs` {#opt-programs.nix-required-mounts.extraWrapperArgs}

List of extra arguments (such as `--add-flags -v`) to pass to the hook's wrapper

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/programs/nix-required-mounts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nix-required-mounts.nix)

## `programs.nix-required-mounts.presets.nvidia-gpu.enable` {#opt-programs.nix-required-mounts.presets.nvidia-gpu.enable}

Whether to enable Declare the support for derivations that require an Nvidia GPU to be
available, e.g. derivations with `requiredSystemFeatures = [ "cuda" ]`.
This mounts the corresponding userspace drivers and device nodes in the
sandbox, but only for derivations that request these special features.

You may extend or override the exposed paths via the
`programs.nix-required-mounts.allowedPatterns.nvidia-gpu.paths` option.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/nix-required-mounts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nix-required-mounts.nix)

## `programs.nix-required-mounts.presets.zluda.enable` {#opt-programs.nix-required-mounts.presets.zluda.enable}

Whether to enable Same as `programs.nix-required-mounts.presets.nvidia-gpu` but adds paths
to the sandbox that are needed for running CUDA applications on top of
the ZLUDA translation layer combined with AMD GPUs.

You may extend or override the exposed paths via the
`programs.nix-required-mounts.allowedPatterns.zluda.paths` option.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/nix-required-mounts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nix-required-mounts.nix)

## `programs.nixbit.enable` {#opt-programs.nixbit.enable}

Whether to enable Nixbit configuration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/nixbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nixbit.nix)

## `programs.nixbit.forceAutostart` {#opt-programs.nixbit.forceAutostart}

Force creation of autostart desktop entry when application starts

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/nixbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nixbit.nix)

## `programs.nixbit.package` {#opt-programs.nixbit.package}

The nixbit package to use.

*Type:* package

*Default:* `pkgs.nixbit`

*Declared by:* [`nixos/modules/programs/nixbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nixbit.nix)

## `programs.nixbit.repository` {#opt-programs.nixbit.repository}

Git repository URL for Nixbit

*Type:* string

*Declared by:* [`nixos/modules/programs/nixbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nixbit.nix)

## `programs.nm-applet.enable` {#opt-programs.nm-applet.enable}

Whether to enable nm-applet, a NetworkManager control applet for GNOME.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/nm-applet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nm-applet.nix)

## `programs.nm-applet.indicator` {#opt-programs.nm-applet.indicator}

Whether to use indicator instead of status icon.
It is needed for Appindicator environments, like Enlightenment.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/nm-applet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nm-applet.nix)

## `programs.nm-applet.package` {#opt-programs.nm-applet.package}

The networkmanagerapplet package to use.

*Type:* package

*Default:* `pkgs.networkmanagerapplet`

*Declared by:* [`nixos/modules/programs/nm-applet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nm-applet.nix)

## `programs.nncp.enable` {#opt-programs.nncp.enable}

Whether to enable NNCP (Node to Node copy) utilities and configuration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/nncp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nncp.nix)

## `programs.nncp.group` {#opt-programs.nncp.group}

The group under which NNCP files shall be owned.
Any member of this group may access the secret keys
of this NNCP node.

*Type:* string

*Default:* `"uucp"`

*Declared by:* [`nixos/modules/programs/nncp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nncp.nix)

## `programs.nncp.package` {#opt-programs.nncp.package}

The nncp package to use.

*Type:* package

*Default:* `pkgs.nncp`

*Declared by:* [`nixos/modules/programs/nncp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nncp.nix)

## `programs.nncp.secrets` {#opt-programs.nncp.secrets}

A list of paths to NNCP configuration files that should not be
in the Nix store. These files are layered on top of the values at
[programs](#opt-programs.nncp.settings).

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/run/keys/nncp.hjson"
]
```

*Declared by:* [`nixos/modules/programs/nncp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nncp.nix)

## `programs.nncp.settings` {#opt-programs.nncp.settings}

NNCP configuration, see
[http://www.nncpgo.org/Configuration.html](http://www.nncpgo.org/Configuration.html).
At runtime these settings will be overlayed by the contents of
[programs](#opt-programs.nncp.secrets) into the file
`/run/nncp.hjson`. Node keypairs go in
`secrets`, do not specify them in
`settings` as they will be leaked into
`/nix/store`!

*Type:* JSON value

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/nncp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nncp.nix)

## `programs.noctalia.enable` {#opt-programs.noctalia.enable}

Whether to enable noctalia, a sleek and customizable desktop shell for Wayland.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/noctalia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/noctalia.nix)

## `programs.noctalia.package` {#opt-programs.noctalia.package}

The noctalia package to use.

*Type:* package

*Default:* `pkgs.noctalia`

*Declared by:* [`nixos/modules/programs/wayland/noctalia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/noctalia.nix)

## `programs.noctalia.recommendedServices.enable` {#opt-programs.noctalia.recommendedServices.enable}

Whether to enable the services used by noctalia's integrations, namely NetworkManager, bluetooth, UPower and a power profile daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/noctalia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/noctalia.nix)

## `programs.noctalia.systemd.enable` {#opt-programs.noctalia.systemd.enable}

Whether to enable a systemd user service for noctalia.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/noctalia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/noctalia.nix)

## `programs.noctalia.systemd.target` {#opt-programs.noctalia.systemd.target}

The systemd user target that will automatically start the noctalia service.

*Type:* string

*Default:* `"graphical-session.target"`

*Example:* `"hyprland-session.target"`

*Declared by:* [`nixos/modules/programs/wayland/noctalia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/noctalia.nix)

## `programs.noisetorch.enable` {#opt-programs.noisetorch.enable}

Whether to enable noisetorch (+ setcap wrapper), a virtual microphone device with noise suppression.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/noisetorch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/noisetorch.nix)

## `programs.noisetorch.package` {#opt-programs.noisetorch.package}

The noisetorch package to use.

*Type:* package

*Default:* `pkgs.noisetorch`

*Declared by:* [`nixos/modules/programs/noisetorch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/noisetorch.nix)

## `programs.npm.enable` {#opt-programs.npm.enable}

Whether to enable `npm` global config.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/npm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/npm.nix)

## `programs.npm.npmrc` {#opt-programs.npm.npmrc}

The system-wide npm configuration.
See [https://docs.npmjs.com/misc/config](https://docs.npmjs.com/misc/config).

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  prefix = ''${HOME}/.npm
''
```

*Example:*

``` nix
''
  prefix = ''${HOME}/.npm
  https-proxy=proxy.example.com
  init-license=MIT
  init-author-url=https://www.npmjs.com/
  color=true
''
```

*Declared by:* [`nixos/modules/programs/npm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/npm.nix)

## `programs.npm.package` {#opt-programs.npm.package}

The nodejs package to use.

*Type:* package

*Default:* `pkgs.nodejs`

*Declared by:* [`nixos/modules/programs/npm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/npm.nix)

## `programs.ns-usbloader.enable` {#opt-programs.ns-usbloader.enable}

Whether to enable ns-usbloader application with udev rules applied.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/ns-usbloader.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ns-usbloader.nix)

## `programs.nushell.autoloads` {#opt-programs.nushell.autoloads}

Vendor autoload scripts to install. The default location is
`share/nushell/vendor/autoload/<name>.nu`.

By default, when `programs.nushell.plugins` is non-empty, a
script that registers the listed plugins via `plugin add` is
generated here.

Set this to override the generated script(s).

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/programs/nushell.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nushell.nix)

## `programs.nushell.enable` {#opt-programs.nushell.enable}

Whether to enable nushell.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/nushell.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nushell.nix)

## `programs.nushell.interactiveShellInit` {#opt-programs.nushell.interactiveShellInit}

Shell script code called during interactive nushell initialisation.

It is installed as a vendor autoload script, so it runs after the
user's `config.nu` and before their own autoload directories.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/programs/nushell.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nushell.nix)

## `programs.nushell.package` {#opt-programs.nushell.package}

The nushell package to use.

*Type:* package

*Default:* `pkgs.nushell`

*Declared by:* [`nixos/modules/programs/nushell.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nushell.nix)

## `programs.nushell.plugins` {#opt-programs.nushell.plugins}

List of nushell plugins to install to `lib/nushell/plugins/`.

Plugins are registered via nushell's vendor autoload on the first
interactive launch of each user. After registration, plugins persist
in the user's `plugin.msgpackz` and can be managed at runtime with
`plugin rm` and `plugin add`.

See https://www.nushell.sh/book/plugins.html.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.nushellPlugins.formats ]`

*Declared by:* [`nixos/modules/programs/nushell.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nushell.nix)

## `programs.nvrs.enable` {#opt-programs.nvrs.enable}

Whether to enable nvrs.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/nvrs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nvrs.nix)

## `programs.nvrs.package` {#opt-programs.nvrs.package}

The nvrs package to use.

*Type:* package

*Default:* `pkgs.nvrs`

*Declared by:* [`nixos/modules/programs/nvrs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nvrs.nix)

## `programs.nvrs.settings` {#opt-programs.nvrs.settings}

Configuration written to `$XDG_CONFIG_HOME/nvrs/config.toml`

See [https://nvrs.adamperkowski.dev/configuration.html](https://nvrs.adamperkowski.dev/configuration.html) for details.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/nvrs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nvrs.nix)

## `programs.nxdumpclient.enable` {#opt-programs.nxdumpclient.enable}

Whether to enable NX Dump Client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/nxdumpclient.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/nxdumpclient.nix)

## `programs.obs-studio.enable` {#opt-programs.obs-studio.enable}

Whether to enable Free and open source software for video recording and live streaming.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/obs-studio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/obs-studio.nix)

## `programs.obs-studio.enableVirtualCamera` {#opt-programs.obs-studio.enableVirtualCamera}

Installs and sets up the v4l2loopback kernel module, necessary for OBS
to start a virtual camera.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/obs-studio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/obs-studio.nix)

## `programs.obs-studio.package` {#opt-programs.obs-studio.package}

The obs-studio package to use.

*Type:* null or package

*Default:* `pkgs.obs-studio`

*Example:* `obs-studio`

*Declared by:* [`nixos/modules/programs/obs-studio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/obs-studio.nix)

## `programs.obs-studio.plugins` {#opt-programs.obs-studio.plugins}

Optional OBS plugins.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.obs-studio-plugins.wlrobs ]`

*Declared by:* [`nixos/modules/programs/obs-studio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/obs-studio.nix)

## `programs.oddjobd.enable` {#opt-programs.oddjobd.enable}

Whether to enable oddjob, a D-Bus service which runs odd jobs on behalf of client applications.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/oddjobd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/oddjobd.nix)

## `programs.oddjobd.package` {#opt-programs.oddjobd.package}

The oddjob package to use.

*Type:* package

*Default:* `pkgs.oddjob`

*Declared by:* [`nixos/modules/programs/oddjobd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/oddjobd.nix)

## `programs.onlyoffice.enable` {#opt-programs.onlyoffice.enable}

Whether to enable ONLYOFFICE Desktop Editors, an open-source office suite.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/onlyoffice.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/onlyoffice.nix)

## `programs.onlyoffice.extraFontPackages` {#opt-programs.onlyoffice.extraFontPackages}

Additional fonts to include with onlyoffice.

*Type:* list of package

*Default:* `config.fonts.packages`

*Example:* `config.fonts.packages ++ [ pkgs.nanum pkgs.liberation_ttf ]`

*Declared by:* [`nixos/modules/programs/onlyoffice.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/onlyoffice.nix)

## `programs.onlyoffice.package` {#opt-programs.onlyoffice.package}

The onlyoffice-desktopeditors package to use.

*Type:* package

*Default:* `pkgs.onlyoffice-desktopeditors`

*Declared by:* [`nixos/modules/programs/onlyoffice.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/onlyoffice.nix)

## `programs.opengamepadui.args` {#opt-programs.opengamepadui.args}

Arguments to be passed to OpenGamepadUI

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/programs/opengamepadui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/opengamepadui.nix)

## `programs.opengamepadui.enable` {#opt-programs.opengamepadui.enable}

Whether to enable opengamepadui.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/opengamepadui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/opengamepadui.nix)

## `programs.opengamepadui.extraPackages` {#opt-programs.opengamepadui.extraPackages}

Additional packages to add to the OpenGamepadUI environment.

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
with pkgs; [
  gamescope
]
```

*Declared by:* [`nixos/modules/programs/opengamepadui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/opengamepadui.nix)

## `programs.opengamepadui.fontPackages` {#opt-programs.opengamepadui.fontPackages}

Font packages to use in OpenGamepadUI.

Defaults to system fonts, but could be overridden to use other fonts — useful for users who would like to customize CJK fonts used in opengamepadui. According to the [upstream issue](https://github.com/ValveSoftware/opengamepadui-for-linux/issues/10422#issuecomment-1944396010), opengamepadui only follows the per-user fontconfig configuration.

*Type:* list of package

*Default:* `builtins.filter lib.types.package.check config.fonts.packages`

*Example:* `with pkgs; [ source-han-sans ]`

*Declared by:* [`nixos/modules/programs/opengamepadui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/opengamepadui.nix)

## `programs.opengamepadui.gamescopeSession` {#opt-programs.opengamepadui.gamescopeSession}

Run a GameScope driven OpenGamepadUI session from your display-manager

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/opengamepadui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/opengamepadui.nix)

## `programs.opengamepadui.gamescopeSession.args` {#opt-programs.opengamepadui.gamescopeSession.args}

Arguments to be passed to GameScope for the session.

*Type:* list of string

*Default:*

``` nix
[
  "--prefer-output"
  "*,eDP-1"
  "--xwayland-count"
  "2"
  "--default-touch-mode"
  "4"
  "--hide-cursor-delay"
  "3000"
  "--fade-out-duration"
  "200"
  "--steam"
]
```

*Declared by:* [`nixos/modules/programs/opengamepadui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/opengamepadui.nix)

## `programs.opengamepadui.gamescopeSession.enable` {#opt-programs.opengamepadui.gamescopeSession.enable}

Whether to enable GameScope Session.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/opengamepadui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/opengamepadui.nix)

## `programs.opengamepadui.gamescopeSession.env` {#opt-programs.opengamepadui.gamescopeSession.env}

Environmental variables to be passed to GameScope for the session.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/opengamepadui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/opengamepadui.nix)

## `programs.opengamepadui.inputplumber.enable` {#opt-programs.opengamepadui.inputplumber.enable}

Whether to enable Run InputPlumber service for input management and gamepad configuration.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/opengamepadui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/opengamepadui.nix)

## `programs.opengamepadui.package` {#opt-programs.opengamepadui.package}

The OpenGamepadUI package to use.

*Type:* package

*Default:* `pkgs.opengamepadui`

*Declared by:* [`nixos/modules/programs/opengamepadui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/opengamepadui.nix)

## `programs.opengamepadui.powerstation.enable` {#opt-programs.opengamepadui.powerstation.enable}

Whether to enable Run PowerStation service for TDP control and performance settings.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/opengamepadui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/opengamepadui.nix)

## `programs.openlogi.enable` {#opt-programs.openlogi.enable}

Whether to enable OpenLogi, a local-first companion for Logitech HID++ peripherals.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/openlogi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/openlogi.nix)

## `programs.openlogi.package` {#opt-programs.openlogi.package}

The openlogi package to use.

*Type:* package

*Default:* `pkgs.openlogi`

*Declared by:* [`nixos/modules/programs/openlogi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/openlogi.nix)

## `programs.openvpn3.enable` {#opt-programs.openvpn3.enable}

Whether to enable the openvpn3 client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/openvpn3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/openvpn3.nix)

## `programs.openvpn3.log-service` {#opt-programs.openvpn3.log-service}

Log service configuration

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/openvpn3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/openvpn3.nix)

## `programs.openvpn3.log-service.settings` {#opt-programs.openvpn3.log-service.settings}

Options stored in `/etc/openvpn3/log-service.json` configuration file

*Type:* open submodule of attribute set of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/openvpn3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/openvpn3.nix)

## `programs.openvpn3.log-service.settings.journald` {#opt-programs.openvpn3.log-service.settings.journald}

Use systemd-journald

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/programs/openvpn3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/openvpn3.nix)

## `programs.openvpn3.log-service.settings.log_dbus_details` {#opt-programs.openvpn3.log-service.settings.log_dbus_details}

Add D-Bus details in log file/syslog

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/programs/openvpn3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/openvpn3.nix)

## `programs.openvpn3.log-service.settings.log_level` {#opt-programs.openvpn3.log-service.settings.log_level}

How verbose should the logging be

*Type:* integer between 0 and 7 (both inclusive)

*Default:* `3`

*Example:* `6`

*Declared by:* [`nixos/modules/programs/openvpn3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/openvpn3.nix)

## `programs.openvpn3.log-service.settings.timestamp` {#opt-programs.openvpn3.log-service.settings.timestamp}

Add timestamp log file

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/openvpn3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/openvpn3.nix)

## `programs.openvpn3.netcfg` {#opt-programs.openvpn3.netcfg}

Network configuration

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/openvpn3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/openvpn3.nix)

## `programs.openvpn3.netcfg.settings` {#opt-programs.openvpn3.netcfg.settings}

Options stored in `/etc/openvpn3/netcfg.json` configuration file

*Type:* open submodule of attribute set of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/openvpn3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/openvpn3.nix)

## `programs.openvpn3.netcfg.settings.systemd_resolved` {#opt-programs.openvpn3.netcfg.settings.systemd_resolved}

Whether to use systemd-resolved integration

*Type:* boolean

*Default:* `config.services.resolved.enable`

*Example:* `false`

*Declared by:* [`nixos/modules/programs/openvpn3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/openvpn3.nix)

## `programs.openvpn3.package` {#opt-programs.openvpn3.package}

The openvpn3 package to use.

*Type:* package

*Default:* `pkgs.openvpn3`

*Declared by:* [`nixos/modules/programs/openvpn3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/openvpn3.nix)

## `programs.partition-manager.enable` {#opt-programs.partition-manager.enable}

Whether to enable KDE Partition Manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/partition-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/partition-manager.nix)

## `programs.partition-manager.package` {#opt-programs.partition-manager.package}

The partitionmanager package to use.

*Type:* package

*Default:* `pkgs.kdePackages.partitionmanager`

*Declared by:* [`nixos/modules/programs/partition-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/partition-manager.nix)

## `programs.passless.enable` {#opt-programs.passless.enable}

Whether to enable passless.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/passless.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/passless.nix)

## `programs.passless.package` {#opt-programs.passless.package}

The passless package to use.

*Type:* package

*Default:* `pkgs.passless`

*Declared by:* [`nixos/modules/programs/passless.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/passless.nix)

## `programs.passless.settings` {#opt-programs.passless.settings}

Configuration included in `config.toml`.

See [https://github.com/pando85/passless#configuration-1](https://github.com/pando85/passless#configuration-1) for documentation or run `passless config print` to see default configuration.

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  pass = {
    store-path = "/home/alice/.local/share/password-store";
  };
}
```

*Declared by:* [`nixos/modules/programs/passless.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/passless.nix)

## `programs.passless.users` {#opt-programs.passless.users}

Users that intend to use passless and should be added to the fido group.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "alice"
]
```

*Declared by:* [`nixos/modules/programs/passless.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/passless.nix)

## `programs.pay-respects.aiIntegration` {#opt-programs.pay-respects.aiIntegration}

Whether to enable `pay-respects`' LLM integration. When there is no rule for a given error, `pay-respects` can query an OpenAI-compatible API endpoint for command corrections.

- If this is set to `false`, all LLM-related features are disabled.
- If this is set to `true`, the default OpenAI endpoint will be used, using upstream's API key. This default API key may be rate-limited.
- You can also set a custom API endpoint, large language model and locale for command corrections. Simply access the `aiIntegration.url`, `aiIntegration.model` and `aiIntegration.locale` options, as described in the example.
  - Take a look at the [services.ollama](../../options/services-o/index.md#opt-services.ollama.enable) NixOS module if you wish to host a local large language model for `pay-respects`.

For all of these methods, you can set a custom secret API key by using the `_PR_AI_API_KEY` environment variable.

*Type:* boolean or (submodule)

*Default:* `false`

*Example:*

``` nix
{
  locale = "nl-be";
  model = "llama3";
  url = "http://127.0.0.1:11434/v1/chat/completions";
}
```

*Declared by:* [`nixos/modules/programs/pay-respects.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/pay-respects.nix)

## `programs.pay-respects.alias` {#opt-programs.pay-respects.alias}

`pay-respects` needs an alias to be configured.
The default value is `f`, but you can use anything else as well.

*Type:* string

*Default:* `"f"`

*Declared by:* [`nixos/modules/programs/pay-respects.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/pay-respects.nix)

## `programs.pay-respects.enable` {#opt-programs.pay-respects.enable}

Whether to enable pay-respects, an app which corrects your previous console command.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/pay-respects.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/pay-respects.nix)

## `programs.pay-respects.package` {#opt-programs.pay-respects.package}

The pay-respects package to use.

*Type:* package

*Default:* `pkgs.pay-respects`

*Declared by:* [`nixos/modules/programs/pay-respects.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/pay-respects.nix)

## `programs.pay-respects.runtimeRules` {#opt-programs.pay-respects.runtimeRules}

List of rules to be added to `/etc/xdg/pay-respects/rules`.
`pay-respects` will read the contents of these generated rules to recommend command corrections.
Each rule module should start with the `command` attribute that specifies the command name. See the [upstream documentation](https://codeberg.org/iff/pay-respects/src/branch/main/rules.md) for more information.

*Type:* list of (TOML value)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    command = "xl";
    match_err = [
      {
        pattern = [
          "Permission denied"
        ];
        suggest = [
          ''
            #[executable(sudo), !cmd_contains(sudo), err_contains(libxl: error:)]
            sudo {{command}}
          ''
        ];
      }
    ];
  }
];
```

*Declared by:* [`nixos/modules/programs/pay-respects.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/pay-respects.nix)

## `programs.pinnacle.enable` {#opt-programs.pinnacle.enable}

Whether to enable pinnacle.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/pinnacle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/pinnacle.nix)

## `programs.pinnacle.package` {#opt-programs.pinnacle.package}

The pinnacle package to use. package containing the pinnacle server binary

*Type:* package

*Default:* `pkgs.pinnacle`

*Example:* `pkgs.pinnacle`

*Declared by:* [`nixos/modules/programs/wayland/pinnacle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/pinnacle.nix)

## `programs.pinnacle.withUWSM` {#opt-programs.pinnacle.withUWSM}

Whether to enable manage the pinnacle session with [UWSM](https://github.com/Vladimir-csp/uwsm) instead
of independent systemd services and targets.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/pinnacle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/pinnacle.nix)

## `programs.pinnacle.xdg-portals.enable` {#opt-programs.pinnacle.xdg-portals.enable}

Whether to enable enable xdg-portals for pinnacle.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/pinnacle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/pinnacle.nix)

## `programs.plotinus.enable` {#opt-programs.plotinus.enable}

Whether to enable the Plotinus GTK 3 plugin. Plotinus provides a
popup (triggered by Ctrl-Shift-P) to search the menus of a
compatible application.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/plotinus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/plotinus.nix)

## `programs.pmount.enable` {#opt-programs.pmount.enable}

Whether to enable pmount, a tool that allows normal users to mount removable devices
without requiring root privileges
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/pmount.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/pmount.nix)

## `programs.pmount.package` {#opt-programs.pmount.package}

The pmount package to use.

*Type:* package

*Default:* `pkgs.pmount`

*Declared by:* [`nixos/modules/programs/pmount.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/pmount.nix)

## `programs.projecteur.enable` {#opt-programs.projecteur.enable}

Whether to enable projecteur, an application for the Logitech Spotlight device (and similar).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/projecteur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/projecteur.nix)

## `programs.projecteur.package` {#opt-programs.projecteur.package}

The projecteur package to use.

*Type:* package

*Default:* `pkgs.projecteur`

*Declared by:* [`nixos/modules/programs/projecteur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/projecteur.nix)

## `programs.proxychains.chain.length` {#opt-programs.proxychains.chain.length}

Chain length for random chain.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/programs/proxychains.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/proxychains.nix)

## `programs.proxychains.chain.type` {#opt-programs.proxychains.chain.type}

`dynamic` - Each connection will be done via chained proxies
all proxies chained in the order as they appear in the list
at least one proxy must be online to play in chain
(dead proxies are skipped)
otherwise `EINTR` is returned to the app.

`strict` - Each connection will be done via chained proxies
all proxies chained in the order as they appear in the list
all proxies must be online to play in chain
otherwise `EINTR` is returned to the app.

`random` - Each connection will be done via random proxy
(or proxy chain, see [`programs.proxychains.chain.length`](#opt-programs.proxychains.chain.length)) from the list.

*Type:* one of "dynamic", "strict", "random"

*Default:* `"strict"`

*Declared by:* [`nixos/modules/programs/proxychains.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/proxychains.nix)

## `programs.proxychains.enable` {#opt-programs.proxychains.enable}

Whether to enable proxychains configuration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/proxychains.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/proxychains.nix)

## `programs.proxychains.localnet` {#opt-programs.proxychains.localnet}

By default enable localnet for loopback address ranges.

*Type:* string

*Default:* `"127.0.0.0/255.0.0.0"`

*Declared by:* [`nixos/modules/programs/proxychains.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/proxychains.nix)

## `programs.proxychains.package` {#opt-programs.proxychains.package}

The proxychains package to use.

*Type:* package

*Default:* `pkgs.proxychains`

*Example:* `proxychains-ng`

*Declared by:* [`nixos/modules/programs/proxychains.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/proxychains.nix)

## `programs.proxychains.proxies` {#opt-programs.proxychains.proxies}

Proxies to be used by proxychains.

*Type:* attribute set of (submodule)

*Example:*

``` nix
{ myproxy =
  { type = "socks4";
    host = "127.0.0.1";
    port = 1337;
  };
}
```

*Declared by:* [`nixos/modules/programs/proxychains.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/proxychains.nix)

## `programs.proxychains.proxies.<name>.enable` {#opt-programs.proxychains.proxies._name_.enable}

Whether to enable this proxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/proxychains.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/proxychains.nix)

## `programs.proxychains.proxies.<name>.host` {#opt-programs.proxychains.proxies._name_.host}

Proxy host or IP address.

*Type:* string

*Declared by:* [`nixos/modules/programs/proxychains.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/proxychains.nix)

## `programs.proxychains.proxies.<name>.port` {#opt-programs.proxychains.proxies._name_.port}

Proxy port

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/programs/proxychains.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/proxychains.nix)

## `programs.proxychains.proxies.<name>.type` {#opt-programs.proxychains.proxies._name_.type}

Proxy type.

*Type:* one of "http", "socks4", "socks5"

*Declared by:* [`nixos/modules/programs/proxychains.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/proxychains.nix)

## `programs.proxychains.proxyDNS` {#opt-programs.proxychains.proxyDNS}

Proxy DNS requests - no leak for DNS data.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/proxychains.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/proxychains.nix)

## `programs.proxychains.quietMode` {#opt-programs.proxychains.quietMode}

Whether to enable Quiet mode (no output from the library).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/proxychains.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/proxychains.nix)

## `programs.proxychains.remoteDNSSubnet` {#opt-programs.proxychains.remoteDNSSubnet}

Set the class A subnet number to use for the internal remote DNS mapping, uses the reserved 224.x.x.x range by default.

*Type:* one of 10, 127, 224

*Default:* `224`

*Declared by:* [`nixos/modules/programs/proxychains.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/proxychains.nix)

## `programs.proxychains.tcpConnectTimeOut` {#opt-programs.proxychains.tcpConnectTimeOut}

Connection time-out in milliseconds.

*Type:* signed integer

*Default:* `8000`

*Declared by:* [`nixos/modules/programs/proxychains.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/proxychains.nix)

## `programs.proxychains.tcpReadTimeOut` {#opt-programs.proxychains.tcpReadTimeOut}

Connection read time-out in milliseconds.

*Type:* signed integer

*Default:* `15000`

*Declared by:* [`nixos/modules/programs/proxychains.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/proxychains.nix)

## `programs.pulseview.enable` {#opt-programs.pulseview.enable}

Whether to enable pulseview, a sigrok GUI.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/pulseview.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/pulseview.nix)

## `programs.qdmr.enable` {#opt-programs.qdmr.enable}

Whether to enable QDMR - a GUI application and command line tool for programming DMR radios.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/qdmr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/qdmr.nix)

## `programs.qdmr.package` {#opt-programs.qdmr.package}

The qdmr package to use.

*Type:* package

*Default:* `pkgs.qdmr`

*Declared by:* [`nixos/modules/programs/qdmr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/qdmr.nix)

## `programs.qgroundcontrol.blacklistModemManagerFromTTYUSB` {#opt-programs.qgroundcontrol.blacklistModemManagerFromTTYUSB}

Disallow ModemManager from interfering with serial connections that QGroundControl might use.

Note that if you use a modem that's connected via USB, you might want to disable this option.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/qgroundcontrol.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/qgroundcontrol.nix)

## `programs.qgroundcontrol.enable` {#opt-programs.qgroundcontrol.enable}

Whether to enable qgroundcontrol.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/qgroundcontrol.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/qgroundcontrol.nix)

## `programs.qgroundcontrol.package` {#opt-programs.qgroundcontrol.package}

The qgroundcontrol package to use.

*Type:* package

*Default:* `pkgs.qgroundcontrol`

*Declared by:* [`nixos/modules/programs/qgroundcontrol.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/qgroundcontrol.nix)

## `programs.quark-goldleaf.enable` {#opt-programs.quark-goldleaf.enable}

Whether to enable quark-goldleaf with udev rules applied.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/quark-goldleaf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/quark-goldleaf.nix)

## `programs.renderdoc.enable` {#opt-programs.renderdoc.enable}

Whether to enable RenderDoc a frame-capture based graphics debugger.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/renderdoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/renderdoc.nix)

## `programs.renderdoc.installVulkanLayer` {#opt-programs.renderdoc.installVulkanLayer}

Installs the Vulkan layer for RenderDoc,
which is required for Vulkan applications to be captured.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/renderdoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/renderdoc.nix)

## `programs.renderdoc.package` {#opt-programs.renderdoc.package}

The renderdoc package to use.

*Type:* package

*Default:* `pkgs.renderdoc`

*Example:* `renderdoc`

*Declared by:* [`nixos/modules/programs/renderdoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/renderdoc.nix)

## `programs.river-classic.enable` {#opt-programs.river-classic.enable}

Whether to enable river-classic, a dynamic tiling Wayland compositor.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/river.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/river.nix)

## `programs.river-classic.extraPackages` {#opt-programs.river-classic.extraPackages}

Extra packages to be installed system wide. See
[Common X11 apps used on i3 with Wayland alternatives](https://github.com/swaywm/sway/wiki/i3-Migration-Guide#common-x11-apps-used-on-i3-with-wayland-alternatives)
for a list of useful software.

*Type:* list of package

*Default:*

``` nix
with pkgs; [ swaylock foot dmenu ];
```

*Example:*

``` nix
with pkgs; [ alacritty rofi light ]
```

*Declared by:* [`nixos/modules/programs/wayland/river.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/river.nix)

## `programs.river-classic.package` {#opt-programs.river-classic.package}

The river-classic package to use. If the package is not overridable with `xwaylandSupport`, then the module option
`xwayland` will have no effect.

Set to `null` to not add any River package to your path.
This should be done if you want to use the Home Manager River module to install River.

*Type:* null or package

*Default:* `pkgs.river-classic`

*Declared by:* [`nixos/modules/programs/wayland/river.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/river.nix)

## `programs.river-classic.xwayland.enable` {#opt-programs.river-classic.xwayland.enable}

Whether to enable XWayland.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/river.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/river.nix)

## `programs.rog-control-center.autoStart` {#opt-programs.rog-control-center.autoStart}

Whether rog-control-center should be started automatically.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/rog-control-center.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/rog-control-center.nix)

## `programs.rog-control-center.enable` {#opt-programs.rog-control-center.enable}

Whether to enable the rog-control-center application.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/rog-control-center.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/rog-control-center.nix)

## `programs.rush.enable` {#opt-programs.rush.enable}

Whether to enable Restricted User Shell..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/rush.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/rush.nix)

## `programs.rush.global` {#opt-programs.rush.global}

The `global` statement defines global settings.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/programs/rush.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/rush.nix)

## `programs.rush.package` {#opt-programs.rush.package}

The rush package to use.

*Type:* package

*Default:* `pkgs.rush`

*Declared by:* [`nixos/modules/programs/rush.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/rush.nix)

## `programs.rush.rules` {#opt-programs.rush.rules}

The rule statement configures a GNU Rush rule. This is a block statement, which means that all
statements located between it and the next rule statement (or end of file, whichever occurs first)
modify the definition of that rule.

*Type:* attribute set of strings concatenated with "\\n"

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/rush.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/rush.nix)

## `programs.rush.shell` {#opt-programs.rush.shell}

The resolved shell path that users can inherit to set `rush` as their login shell.
This is a convenience option for use in user definitions. Example:
`users.users.alice = { inherit (config.programs.rush) shell; ... };`

*Type:* package or absolute path

*Read only*

*Declared by:* [`nixos/modules/programs/rush.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/rush.nix)

## `programs.rush.wrap` {#opt-programs.rush.wrap}

Whether to wrap the `rush` binary with a SUID-enabled wrapper.
This is required if [`security.enableWrappers`](../../options/security/index.md#opt-security.enableWrappers) is enabled in your configuration.

*Type:* boolean

*Default:* `config.security.enableWrappers`

*Declared by:* [`nixos/modules/programs/rush.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/rush.nix)

## `programs.rust-motd.enable` {#opt-programs.rust-motd.enable}

Whether to enable rust-motd, a Message Of The Day (MOTD) generator.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/rust-motd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/rust-motd.nix)

## `programs.rust-motd.enableMotdInSSHD` {#opt-programs.rust-motd.enableMotdInSSHD}

Whether to let `openssh` print the
result when entering a new `ssh`-session.
By default either nothing or a static file defined via
[users](../../options/users/index.md#opt-users.motd) is printed. Because of that,
the latter option is incompatible with this module.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/rust-motd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/rust-motd.nix)

## `programs.rust-motd.order` {#opt-programs.rust-motd.order}

The order of the sections in [programs](#opt-programs.rust-motd.settings).
By default they are ordered alphabetically.

Context: since attribute sets in Nix are always
ordered alphabetically internally this means that

``` nix
{
  uptime = { /* ... */ };
  banner = { /* ... */ };
}
```

will still have `banner` displayed before `uptime`.

To work around that, this option can be used to define the order of all keys,
i.e.

``` nix
{
  order = [
    "uptime"
    "banner"
  ];
}
```

makes sure that `uptime` is placed before `banner` in the motd.

*Type:* list of string

*Default:* `attrNames cfg.settings`

*Declared by:* [`nixos/modules/programs/rust-motd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/rust-motd.nix)

## `programs.rust-motd.refreshInterval` {#opt-programs.rust-motd.refreshInterval}

Interval in which the `motd(5)` file is refreshed.
For possible formats, please refer to `systemd.time(7)`.

*Type:* string

*Default:* `"*:0/5"`

*Declared by:* [`nixos/modules/programs/rust-motd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/rust-motd.nix)

## `programs.rust-motd.settings` {#opt-programs.rust-motd.settings}

Settings on what to generate. Please read the
[upstream documentation](https://github.com/rust-motd/rust-motd/blob/main/README.md#configuration)
for further information.

*Type:* attribute set of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/rust-motd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/rust-motd.nix)

## `programs.ryzen-monitor-ng.enable` {#opt-programs.ryzen-monitor-ng.enable}

Whether to enable ryzen\_monitor\_ng, a userspace application for setting and getting Ryzen SMU (System Management Unit) parameters via the ryzen\_smu kernel driver.

Monitor power information of Ryzen processors via the PM table of the SMU.

SMU Set and Get for many parameters and CO counts.

[https://github.com/mann1x/ryzen\_monitor\_ng](https://github.com/mann1x/ryzen_monitor_ng)

WARNING: Damage cause by use of your AMD processor outside of official AMD specifications or outside of factory settings are not covered under any AMD product warranty and may not be covered by your board or system manufacturer's warranty
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/ryzen-monitor-ng.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ryzen-monitor-ng.nix)

## `programs.ryzen-monitor-ng.package` {#opt-programs.ryzen-monitor-ng.package}

The ryzen-monitor-ng package to use.

*Type:* package

*Default:* `pkgs.ryzen-monitor-ng`

*Declared by:* [`nixos/modules/programs/ryzen-monitor-ng.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ryzen-monitor-ng.nix)

## `programs.schroot.enable` {#opt-programs.schroot.enable}

Whether to enable schroot, a lightweight virtualisation tool.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/schroot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/schroot.nix)

## `programs.schroot.package` {#opt-programs.schroot.package}

The schroot package to use.

*Type:* package

*Default:* `pkgs.schroot`

*Declared by:* [`nixos/modules/programs/schroot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/schroot.nix)

## `programs.schroot.profiles` {#opt-programs.schroot.profiles}

Custom configuration profiles for schroot.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/schroot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/schroot.nix)

## `programs.schroot.profiles.<name>.copyfiles` {#opt-programs.schroot.profiles._name_.copyfiles}

A list of files to copy into the chroot from the host system.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/etc/resolv.conf"
]
```

*Declared by:* [`nixos/modules/programs/schroot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/schroot.nix)

## `programs.schroot.profiles.<name>.fstab` {#opt-programs.schroot.profiles._name_.fstab}

A file in the format described in `fstab(5)`, used to mount filesystems inside the chroot.
The mount location is relative to the root of the chroot.

*Type:* absolute path

*Example:*

``` nix
pkgs.writeText "my-schroot-fstab" ''
  /proc           /proc           none    rw,bind         0       0
  /sys            /sys            none    rw,bind         0       0
  /dev            /dev            none    rw,bind         0       0
  /dev/pts        /dev/pts        none    rw,bind         0       0
  /home           /home           none    rw,rbind        0       0
  /tmp            /tmp            none    rw,bind         0       0
  /dev/shm        /dev/shm        none    rw,bind         0       0
  /nix            /nix            none    ro,bind         0       0
  /run/current-system /run/current-system none rw,bind    0       0
  /run/wrappers   /run/wrappers   none    rw,bind         0       0
''
```

*Declared by:* [`nixos/modules/programs/schroot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/schroot.nix)

## `programs.schroot.profiles.<name>.nssdatabases` {#opt-programs.schroot.profiles._name_.nssdatabases}

System databases (as described in /etc/nsswitch.conf on GNU/Linux systems) to copy into the chroot from the host.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "passwd"
  "shadow"
  "group"
  "gshadow"
  "services"
  "protocols"
  "networks"
  "hosts"
]
```

*Declared by:* [`nixos/modules/programs/schroot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/schroot.nix)

## `programs.schroot.settings` {#opt-programs.schroot.settings}

Schroot configuration settings.
For more details, see `schroot.conf(5)`.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  noble = {
    description = "Ubuntu 24.04 Noble";
    directory = "/srv/chroot/noble";
    personality = "linux";
    preserve-environment = false;
    profile = "my-profile";
    root-users = "my-user";
    shell = "/bin/bash";
    type = "directory";
    users = "my-user";
  };
}
```

*Declared by:* [`nixos/modules/programs/schroot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/schroot.nix)

## `programs.screen.enable` {#opt-programs.screen.enable}

Whether to enable screen, a basic terminal multiplexer.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/screen.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/screen.nix)

## `programs.screen.package` {#opt-programs.screen.package}

The screen package to use.

*Type:* package

*Default:* `pkgs.screen`

*Declared by:* [`nixos/modules/programs/screen.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/screen.nix)

## `programs.screen.screenrc` {#opt-programs.screen.screenrc}

The contents of `/etc/screenrc` file

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  defscrollback 10000
  startup_message off
''
```

*Declared by:* [`nixos/modules/programs/screen.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/screen.nix)

## `programs.seahorse.enable` {#opt-programs.seahorse.enable}

Whether to enable Seahorse, a GNOME application for managing encryption keys and passwords in the GNOME Keyring.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/seahorse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/seahorse.nix)

## `programs.sedutil.enable` {#opt-programs.sedutil.enable}

Whether to enable sedutil, to manage self encrypting drives that conform to the Trusted Computing Group OPAL 2.0 SSC specification.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/sedutil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/sedutil.nix)

## `programs.sharing.enable` {#opt-programs.sharing.enable}

Whether to enable sharing, a CLI tool for sharing files.

Note that it will opens the 7478 port for TCP in the firewall, which is needed for it to function properly
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/sharing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/sharing.nix)

## `programs.singularity.enable` {#opt-programs.singularity.enable}

Whether to install Singularity/Apptainer with system-level overriding such as SUID support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/singularity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/singularity.nix)

## `programs.singularity.enableExternalLocalStateDir` {#opt-programs.singularity.enableExternalLocalStateDir}

Whether to use top-level directories as LOCALSTATEDIR
instead of the store path ones.
This affects the SESSIONDIR of Apptainer/Singularity.
If set to true, the SESSIONDIR will become
`/var/lib/${projectName}/mnt/session`.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/programs/singularity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/singularity.nix)

## `programs.singularity.enableFakeroot` {#opt-programs.singularity.enableFakeroot}

Whether to enable the `--fakeroot` support of Singularity/Apptainer.

This option is deprecated and has no effect.
`--fakeroot` support is enabled automatically,
as `systemBinPaths = [ "/run/wrappers/bin" ]` is always specified.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/singularity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/singularity.nix)

## `programs.singularity.enableSuid` {#opt-programs.singularity.enableSuid}

Whether to enable the SUID support of Singularity/Apptainer.

*Type:* boolean

*Default:* `config.services.singularity.package.projectName != "apptainer"`

*Example:* `false`

*Declared by:* [`nixos/modules/programs/singularity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/singularity.nix)

## `programs.singularity.package` {#opt-programs.singularity.package}

The singularity package to use.

*Type:* package

*Default:* `pkgs.singularity`

*Example:* `apptainer`

*Declared by:* [`nixos/modules/programs/singularity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/singularity.nix)

## `programs.singularity.packageOverriden` {#opt-programs.singularity.packageOverriden}

This option provides access to the overridden result of `programs.singularity.package`.

For example, the following configuration makes all the Nixpkgs packages use the overridden `singularity`:

``` Nix
{ config, lib, pkgs, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      _singularity-orig = prev.singularity;
      singularity = config.programs.singularity.packageOverriden;
    })
  ];
  programs.singularity.enable = true;
  programs.singularity.package = pkgs._singularity-orig;
}
```

Use `lib.mkForce` to forcefully specify the overridden package.

*Type:* null or package

*Default:* `null`

*Declared by:* [`nixos/modules/programs/singularity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/singularity.nix)

## `programs.singularity.systemBinPaths` {#opt-programs.singularity.systemBinPaths}

(Extra) system-wide /\*\*/bin paths
for Apptainer/Singularity to find command-line utilities in.

`"/run/wrappers/bin"` is included by default to make
utilities with SUID bit set available to Apptainer/Singularity.
Use `lib.mkForce` to shadow the default values.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/programs/singularity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/singularity.nix)

## `programs.skim.enable` {#opt-programs.skim.enable}

Whether to enable skim fuzzy finder.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/skim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/skim.nix)

## `programs.skim.keybindings` {#opt-programs.skim.keybindings}

Whether to enable skim keybindings.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/skim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/skim.nix)

## `programs.skim.package` {#opt-programs.skim.package}

The skim package to use.

*Type:* package

*Default:* `pkgs.skim`

*Declared by:* [`nixos/modules/programs/skim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/skim.nix)

## `programs.slock.enable` {#opt-programs.slock.enable}

Whether to install slock screen locker with setuid wrapper.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/slock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/slock.nix)

## `programs.slock.package` {#opt-programs.slock.package}

The slock package to use.

*Type:* package

*Default:* `pkgs.slock`

*Declared by:* [`nixos/modules/programs/slock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/slock.nix)

## `programs.sniffnet.enable` {#opt-programs.sniffnet.enable}

Whether to enable sniffnet, a network traffic monitor application.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/sniffnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/sniffnet.nix)

## `programs.solaar.enable` {#opt-programs.solaar.enable}

Whether to enable Solaar, the open source driver for Logitech devices..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/solaar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/solaar.nix)

## `programs.solaar.package` {#opt-programs.solaar.package}

The solaar package to use.

*Type:* package

*Default:* `pkgs.solaar`

*Declared by:* [`nixos/modules/programs/solaar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/solaar.nix)

## `programs.solaar.userService.batteryIcons` {#opt-programs.solaar.userService.batteryIcons}

Prefer regular battery / symbolic battery / solaar icons.

*Type:* one of "regular", "symbolic", "solaar"

*Default:* `"regular"`

*Declared by:* [`nixos/modules/programs/solaar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/solaar.nix)

## `programs.solaar.userService.enable` {#opt-programs.solaar.userService.enable}

Whether to enable Enable the solaar systemd service for each user..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/solaar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/solaar.nix)

## `programs.solaar.userService.extraArgs` {#opt-programs.solaar.userService.extraArgs}

Extra arguments to pass to Solaar.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--restart-on-wake-up"
]
```

*Declared by:* [`nixos/modules/programs/solaar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/solaar.nix)

## `programs.solaar.userService.window` {#opt-programs.solaar.userService.window}

Start with window showing / hidden / only (no tray icon).

*Type:* one of "show", "hide", "only"

*Default:* `"hide"`

*Declared by:* [`nixos/modules/programs/solaar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/solaar.nix)

## `programs.soundmodem.enable` {#opt-programs.soundmodem.enable}

Whether to add Soundmodem to the global environment and configure a
wrapper for 'soundmodemconfig' for users in the 'soundmodem' group.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/soundmodem.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/soundmodem.nix)

## `programs.soundmodem.package` {#opt-programs.soundmodem.package}

The soundmodem package to use.

*Type:* package

*Default:* `pkgs.soundmodem`

*Declared by:* [`nixos/modules/programs/soundmodem.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/soundmodem.nix)

## `programs.ssh.agentPKCS11Whitelist` {#opt-programs.ssh.agentPKCS11Whitelist}

A pattern-list of acceptable paths for PKCS#11 shared libraries
that may be used with the -s option to ssh-add.

*Type:* null or string

*Default:* `null`

*Example:* `"${pkgs.opensc}/lib/opensc-pkcs11.so"`

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.ssh.agentTimeout` {#opt-programs.ssh.agentTimeout}

How long to keep the private keys in memory. Use null to keep them forever.

*Type:* null or string

*Default:* `null`

*Example:* `"1h"`

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.ssh.askPassword` {#opt-programs.ssh.askPassword}

Program used by SSH to ask for passwords.

*Type:* string

*Default:* `"${pkgs.x11_ssh_askpass}/libexec/x11-ssh-askpass"`

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.ssh.ciphers` {#opt-programs.ssh.ciphers}

Specifies the ciphers allowed and their order of preference.

*Type:* null or (list of string)

*Default:* `null`

*Example:*

``` nix
[
  "chacha20-poly1305@openssh.com"
  "aes256-gcm@openssh.com"
]
```

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.ssh.enableAskPassword` {#opt-programs.ssh.enableAskPassword}

Whether to configure SSH\_ASKPASS in the environment.

*Type:* boolean

*Default:* `config.services.xserver.enable`

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.ssh.extraConfig` {#opt-programs.ssh.extraConfig}

Extra configuration text prepended to `ssh_config`. Other generated
options will be added after a `Host *` pattern.
See `ssh_config(5)`
for help.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.ssh.forwardX11` {#opt-programs.ssh.forwardX11}

Whether to request X11 forwarding on outgoing connections by default.
If set to null, the option is not set at all.
This is useful for running graphical programs on the remote machine and have them display to your local X11 server.
Historically, this value has depended on the value used by the local sshd daemon, but there really isn't a relation between the two.
Note: there are some security risks to forwarding an X11 connection.
NixOS's X server is built with the SECURITY extension, which prevents some obvious attacks.
To enable or disable forwarding on a per-connection basis, see the -X and -x options to ssh.
The -Y option to ssh enables trusted forwarding, which bypasses the SECURITY extension.

*Type:* null or boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.ssh.hostKeyAlgorithms` {#opt-programs.ssh.hostKeyAlgorithms}

Specifies the host key algorithms that the client wants to use in order of preference.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "ssh-ed25519"
  "ssh-rsa"
]
```

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.ssh.hosts` {#opt-programs.ssh.hosts}

Per-host (or host-pattern) client configuration, added as `Host`
blocks to `ssh_config`.

Attribute names are used as the `Host` pattern, as accepted by
`ssh_config(5)`. Several space-separated patterns can be
given to apply one block to all of them, e.g.
`"foo bar *.baz.org"`.

Every attribute of a block besides `order` becomes a
`Key Value` line within that block; boolean values are rendered as
`yes`/`no`.

*Type:* attribute set of (open submodule of attribute set of (boolean or signed integer or string))

*Default:* `{ }`

*Example:*

``` nix
{
  jumphost = {
    order = 100;
    User = "deploy";
    Port = 2222;
    IdentityFile = "/root/.ssh/id_deploy";
    IdentitiesOnly = true;
  };
  "*.example.org" = {
    order = 200;
    ControlMaster = "auto";
    ControlPath = "/root/.ssh/master-%r@%n:%p";
    ControlPersist = "5m";
  };
  # Written last, so that it does not shadow the blocks above.
  "*" = {
    order = 300;
    ServerAliveInterval = 60;
  };
}
```

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.ssh.hosts.<name>.order` {#opt-programs.ssh.hosts._name_.order}

Position of this block in `ssh_config`. Blocks are
written in ascending order of this value, and two blocks
may not share a value.

Since `ssh_config(5)` applies the *first* obtained
value for each keyword, a block with a lower value takes
precedence over the blocks that follow it. In particular, a
catch-all pattern such as `"*"` should have the highest
value, so that it does not shadow the more specific blocks.

To place a block relative to one that another module
declares, derive this value from that block's one instead of
hardcoding it, e.g.
`config.programs.ssh.hosts."*".order - 100`.

*Type:* signed integer

*Example:* `100`

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.ssh.kexAlgorithms` {#opt-programs.ssh.kexAlgorithms}

Specifies the available KEX (Key Exchange) algorithms.

*Type:* null or (list of string)

*Default:* `null`

*Example:*

``` nix
[
  "curve25519-sha256@libssh.org"
  "diffie-hellman-group-exchange-sha256"
]
```

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.ssh.knownHosts` {#opt-programs.ssh.knownHosts}

The set of system-wide known SSH hosts. To make simple setups more
convenient the name of an attribute in this set is used as a host name
for the entry. This behaviour can be disabled by setting
`hostNames` explicitly. You can use
`extraHostNames` to add additional host names without
disabling this default.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  myhost = {
    extraHostNames = [ "myhost.mydomain.com" "10.10.1.4" ];
    publicKeyFile = ./pubkeys/myhost_ssh_host_dsa_key.pub;
  };
  "myhost2.net".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILIRuJ8p1Fi+m6WkHV0KWnRfpM1WxoW8XAS+XvsSKsTK";
  "myhost2.net/dsa" = {
    hostNames = [ "myhost2.net" ];
    publicKeyFile = ./pubkeys/myhost2_ssh_host_dsa_key.pub;
  };
}
```

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.ssh.knownHosts.<name>.certAuthority` {#opt-programs.ssh.knownHosts._name_.certAuthority}

This public key is an SSH certificate authority, rather than an
individual host's key.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.ssh.knownHosts.<name>.extraHostNames` {#opt-programs.ssh.knownHosts._name_.extraHostNames}

A list of additional host names and/or IP numbers used for
accessing the host's ssh service. This list is ignored if
`hostNames` is set explicitly.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.ssh.knownHosts.<name>.hostNames` {#opt-programs.ssh.knownHosts._name_.hostNames}

A list of host names and/or IP numbers used for accessing
the host's ssh service. This list includes the name of the
containing `knownHosts` attribute by default
for convenience. If you wish to configure multiple host keys
for the same host use multiple `knownHosts`
entries with different attribute names and the same
`hostNames` list.

*Type:* list of string

*Default:* `[ ‹name› ] ++ config.programs.ssh.knownHosts.<name>.extraHostNames`

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.ssh.knownHosts.<name>.publicKey` {#opt-programs.ssh.knownHosts._name_.publicKey}

The public key data for the host. You can fetch a public key
from a running SSH server with the `ssh-keyscan`
command. The public key should not include any host names, only
the key type and the key itself.

*Type:* null or string

*Default:* `null`

*Example:* `"ecdsa-sha2-nistp521 AAAAE2VjZHN...UEPg=="`

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.ssh.knownHosts.<name>.publicKeyFile` {#opt-programs.ssh.knownHosts._name_.publicKeyFile}

The path to the public key file for the host. The public
key file is read at build time and saved in the Nix store.
You can fetch a public key file from a running SSH server
with the `ssh-keyscan` command. The content
of the file should follow the same format as described for
the `publicKey` option. Only a single key
is supported. If a host has multiple keys, use
[`programs.ssh.knownHostsFiles`](#opt-programs.ssh.knownHostsFiles) instead.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.ssh.knownHostsFiles` {#opt-programs.ssh.knownHostsFiles}

Files containing SSH host keys to set as global known hosts.
`/etc/ssh/ssh_known_hosts` (which is
generated by [`programs.ssh.knownHosts`](#opt-programs.ssh.knownHosts)) is
always included.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  ./known_hosts
  (writeText "github.keys" ''
    github.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCj7ndNxQowgcQnjshcLrqPEiiphnt+VTTvDP6mHBL9j1aNUkY4Ue1gvwnGLVlOhGeYrnZaMgRK6+PKCUXaDbC7qtbW8gIkhL7aGCsOr/C56SJMy/BCZfxd1nWzAOxSDPgVsmerOBYfNqltV9/hWCqBywINIR+5dIg6JTJ72pcEpEjcYgXkE2YEFXV1JHnsKgbLWNlhScqb2UmyRkQyytRLtL+38TGxkxCflmO+5Z8CSSNY7GidjMIZ7Q4zMjA2n1nGrlTDkzwDCsw+wqFPGQA179cnfGWOWRVruj16z6XyvxvjJwbz0wQZ75XK5tKSb7FNyeIEs4TT4jk+S4dhPeAUC5y+bDYirYgM4GC7uEnztnZyaVWQ7B381AK4Qdrwt51ZqExKbQpTUNn+EjqoTwvqNj4kqx5QUCI0ThS/YkOxJCXmPUWZbhjpCg56i+2aB6CmK2JGhn57K5mj0MNdBXA4/WnwH6XoPWJzK5Nyu2zB3nAZp+S5hpQs+p1vN1/wsjk=
    github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=
    github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl
  '')
]
```

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.ssh.macs` {#opt-programs.ssh.macs}

Specifies the MAC (message authentication code) algorithms in order of preference. The MAC algorithm is used
for data integrity protection.

*Type:* null or (list of string)

*Default:* `null`

*Example:*

``` nix
[
  "hmac-sha2-512-etm@openssh.com"
  "hmac-sha1"
]
```

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.ssh.package` {#opt-programs.ssh.package}

The openssh package to use.

*Type:* package

*Default:* `pkgs.openssh`

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.ssh.pubkeyAcceptedKeyTypes` {#opt-programs.ssh.pubkeyAcceptedKeyTypes}

Specifies the key lib.types that will be used for public key authentication.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "ssh-ed25519"
  "ssh-rsa"
]
```

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.ssh.setXAuthLocation` {#opt-programs.ssh.setXAuthLocation}

Whether to set the path to `xauth` for X11-forwarded connections.
This causes a dependency on X11 packages.

*Type:* boolean

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.ssh.startAgent` {#opt-programs.ssh.startAgent}

Whether to start the OpenSSH agent when you log in.  The OpenSSH agent
remembers private keys for you so that you don't have to type in
passphrases every time you make an SSH connection.  Use
`ssh-add` to add a key to the agent.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.ssh.systemd-ssh-proxy.enable` {#opt-programs.ssh.systemd-ssh-proxy.enable}

Whether to enable systemd's ssh proxy plugin.
See `systemd-ssh-proxy(1)`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `programs.starship.enable` {#opt-programs.starship.enable}

Whether to enable the Starship shell prompt.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/starship.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/starship.nix)

## `programs.starship.enableBashIntegration` {#opt-programs.starship.enableBashIntegration}

Whether to enable Bash integration.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/starship.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/starship.nix)

## `programs.starship.enableFishIntegration` {#opt-programs.starship.enableFishIntegration}

Whether to enable Fish integration.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/starship.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/starship.nix)

## `programs.starship.enableNushellIntegration` {#opt-programs.starship.enableNushellIntegration}

Whether to enable Nushell integration.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/starship.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/starship.nix)

## `programs.starship.enableXonshIntegration` {#opt-programs.starship.enableXonshIntegration}

Whether to enable Xonsh integration.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/starship.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/starship.nix)

## `programs.starship.enableZshIntegration` {#opt-programs.starship.enableZshIntegration}

Whether to enable zsh integration.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/starship.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/starship.nix)

## `programs.starship.interactiveOnly` {#opt-programs.starship.interactiveOnly}

Whether to enable starship only when the shell is interactive.
Some plugins require this to be set to false to function correctly
.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/starship.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/starship.nix)

## `programs.starship.package` {#opt-programs.starship.package}

The starship package to use.

*Type:* package

*Default:* `pkgs.starship`

*Declared by:* [`nixos/modules/programs/starship.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/starship.nix)

## `programs.starship.presets` {#opt-programs.starship.presets}

Presets files to be merged with settings in order.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "nerd-font-symbols"
]
```

*Declared by:* [`nixos/modules/programs/starship.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/starship.nix)

## `programs.starship.settings` {#opt-programs.starship.settings}

Configuration included in `starship.toml`.

See [https://starship.rs/config/#prompt](https://starship.rs/config/#prompt) for documentation.

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/starship.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/starship.nix)

## `programs.starship.transientPrompt.enable` {#opt-programs.starship.transientPrompt.enable}

Whether to enable Starship's [transient prompt](https://starship.rs/advanced-config/#transientprompt-and-transientrightprompt-in-fish)
feature in `fish` shells. After a command has been entered, Starship
replaces the usual prompt with the terminal output of the commands
defined in the `programs.starship.transientPrompt.left`
and `programs.starship.transientPrompt.right` options.

This option only works with `fish`, as `bash` requires a
[custom configuration](https://starship.rs/advanced-config/#transientprompt-and-transientrightprompt-in-bash)
involving [Ble.sh](https://github.com/akinomyoga/ble.sh), which can be
enabled with `programs.bash.blesh.enable`, but not configured using NixOS
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/starship.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/starship.nix)

## `programs.starship.transientPrompt.left` {#opt-programs.starship.transientPrompt.left}

Fish code composing the body of the `starship_transient_prompt_func` function. The output of
this code will become the left side of the transient prompt.

Not setting this option (or setting it to `null`) will prevent
the `starship_transient_prompt_func` function from being generated. By default, the left
prompt is a bold-green '❯' character.

*Type:* null or Fish shell code concatenated with "\\n"

*Default:* `null`

*Example:* `"starship module character"`

*Declared by:* [`nixos/modules/programs/starship.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/starship.nix)

## `programs.starship.transientPrompt.right` {#opt-programs.starship.transientPrompt.right}

Fish code composing the body of the `starship_transient_rprompt_func` function. The output of
this code will become the right side of the transient prompt.

Not setting this option (or setting it to `null`) will prevent
the `starship_transient_rprompt_func` function from being generated. By default, the right
prompt is empty.

*Type:* null or Fish shell code concatenated with "\\n"

*Default:* `null`

*Example:* `"starship module time"`

*Declared by:* [`nixos/modules/programs/starship.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/starship.nix)

## `programs.steam.dedicatedServer.openFirewall` {#opt-programs.steam.dedicatedServer.openFirewall}

Open ports in the firewall for Source Dedicated Server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/steam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/steam.nix)

## `programs.steam.enable` {#opt-programs.steam.enable}

Whether to enable steam.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/steam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/steam.nix)

## `programs.steam.extest.enable` {#opt-programs.steam.extest.enable}

Whether to enable Load the extest library into Steam, to translate X11 input events to
uinput events (e.g. for using Steam Input on Wayland)
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/steam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/steam.nix)

## `programs.steam.extraCompatPackages` {#opt-programs.steam.extraCompatPackages}

Extra packages to be used as compatibility tools for Steam on Linux. Packages will be included
in the `STEAM_EXTRA_COMPAT_TOOLS_PATHS` environmental variable. For more information see
https://github.com/ValveSoftware/steam-for-linux/issues/6310.

These packages must be Steam compatibility tools that have a `steamcompattool` output.

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
with pkgs; [
  proton-ge-bin
]
```

*Declared by:* [`nixos/modules/programs/steam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/steam.nix)

## `programs.steam.extraPackages` {#opt-programs.steam.extraPackages}

Additional packages to add to the Steam environment.

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
with pkgs; [
  gamescope
]
```

*Declared by:* [`nixos/modules/programs/steam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/steam.nix)

## `programs.steam.fontPackages` {#opt-programs.steam.fontPackages}

Font packages to use in Steam.

Defaults to system fonts, but could be overridden to use other fonts — useful for users who would like to customize CJK fonts used in Steam. According to the [upstream issue](https://github.com/ValveSoftware/steam-for-linux/issues/10422#issuecomment-1944396010), Steam only follows the per-user fontconfig configuration.

*Type:* list of package

*Default:* `builtins.filter lib.types.package.check config.fonts.packages`

*Example:* `with pkgs; [ source-han-sans ]`

*Declared by:* [`nixos/modules/programs/steam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/steam.nix)

## `programs.steam.gamescopeSession` {#opt-programs.steam.gamescopeSession}

Run a GameScope driven Steam session from your display-manager

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/steam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/steam.nix)

## `programs.steam.gamescopeSession.args` {#opt-programs.steam.gamescopeSession.args}

Arguments to be passed to GameScope for the session.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/programs/steam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/steam.nix)

## `programs.steam.gamescopeSession.enable` {#opt-programs.steam.gamescopeSession.enable}

Whether to enable GameScope Session.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/steam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/steam.nix)

## `programs.steam.gamescopeSession.env` {#opt-programs.steam.gamescopeSession.env}

Environmental variables to be passed to GameScope for the session.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/steam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/steam.nix)

## `programs.steam.gamescopeSession.steamArgs` {#opt-programs.steam.gamescopeSession.steamArgs}

Arguments to be passed to Steam for the session.

*Type:* list of string

*Default:*

``` nix
[
  "-tenfoot"
  "-pipewire-dmabuf"
]
```

*Declared by:* [`nixos/modules/programs/steam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/steam.nix)

## `programs.steam.localNetworkGameTransfers.openFirewall` {#opt-programs.steam.localNetworkGameTransfers.openFirewall}

Open ports in the firewall for Steam Local Network Game Transfers.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/steam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/steam.nix)

## `programs.steam.package` {#opt-programs.steam.package}

The Steam package to use. Additional libraries are added from the system
configuration to ensure graphics work properly.

Use this option to customise the Steam package rather than adding your
custom Steam to [`environment.systemPackages`](../../options/environment/index.md#opt-environment.systemPackages) yourself.

*Type:* package

*Default:* `pkgs.steam`

*Example:*

``` nix
pkgs.steam.override {
  extraEnv = {
    MANGOHUD = true;
    OBS_VKCAPTURE = true;
    RADV_TEX_ANISO = 16;
  };
  extraLibraries = p: with p; [
    atk
  ];
}
```

*Declared by:* [`nixos/modules/programs/steam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/steam.nix)

## `programs.steam.protontricks.enable` {#opt-programs.steam.protontricks.enable}

Whether to enable protontricks, a simple wrapper for running Winetricks commands for Proton-enabled games.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/steam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/steam.nix)

## `programs.steam.protontricks.package` {#opt-programs.steam.protontricks.package}

The protontricks package to use.

*Type:* package

*Default:* `pkgs.protontricks`

*Declared by:* [`nixos/modules/programs/steam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/steam.nix)

## `programs.steam.remotePlay.openFirewall` {#opt-programs.steam.remotePlay.openFirewall}

Open ports in the firewall for Steam Remote Play.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/steam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/steam.nix)

## `programs.streamcontroller.enable` {#opt-programs.streamcontroller.enable}

Whether to enable StreamController.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/streamcontroller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/streamcontroller.nix)

## `programs.streamcontroller.package` {#opt-programs.streamcontroller.package}

The StreamController package to use

*Type:* package

*Default:* `pkgs.streamcontroller`

*Declared by:* [`nixos/modules/programs/streamcontroller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/streamcontroller.nix)

## `programs.streamdeck-ui.autoStart` {#opt-programs.streamdeck-ui.autoStart}

Whether streamdeck-ui should be started automatically.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/streamdeck-ui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/streamdeck-ui.nix)

## `programs.streamdeck-ui.enable` {#opt-programs.streamdeck-ui.enable}

Whether to enable streamdeck-ui.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/streamdeck-ui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/streamdeck-ui.nix)

## `programs.streamdeck-ui.package` {#opt-programs.streamdeck-ui.package}

The streamdeck-ui package to use.

*Type:* package

*Default:* `pkgs.streamdeck-ui`

*Declared by:* [`nixos/modules/programs/streamdeck-ui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/streamdeck-ui.nix)

## `programs.sway.enable` {#opt-programs.sway.enable}

Whether to enable Sway, the i3-compatible tiling Wayland compositor. You can manually launch
Sway by executing "exec sway" on a TTY. Copy /etc/sway/config to
~/.config/sway/config to modify the default configuration. See
[https://github.com/swaywm/sway/wiki](https://github.com/swaywm/sway/wiki) and
"man 5 sway" for more information.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/sway.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/sway.nix)

## `programs.sway.extraOptions` {#opt-programs.sway.extraOptions}

Command line arguments passed to launch Sway. Please DO NOT report
issues if you use an unsupported GPU (proprietary drivers).

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--verbose"
  "--debug"
  "--unsupported-gpu"
]
```

*Declared by:* [`nixos/modules/programs/wayland/sway.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/sway.nix)

## `programs.sway.extraPackages` {#opt-programs.sway.extraPackages}

Extra packages to be installed system wide. See
[https://github.com/swaywm/sway/wiki/Useful-add-ons-for-sway](https://github.com/swaywm/sway/wiki/Useful-add-ons-for-sway) and
[https://github.com/swaywm/sway/wiki/i3-Migration-Guide#common-x11-apps-used-on-i3-with-wayland-alternatives](https://github.com/swaywm/sway/wiki/i3-Migration-Guide#common-x11-apps-used-on-i3-with-wayland-alternatives)
for a list of useful software.

*Type:* list of package

*Default:*

``` nix
with pkgs; [ brightnessctl foot grim pulseaudio swayidle swaylock wmenu ];
```

*Example:*

``` nix
with pkgs; [ i3status i3status-rust alacritty rofi light ]
```

*Declared by:* [`nixos/modules/programs/wayland/sway.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/sway.nix)

## `programs.sway.extraSessionCommands` {#opt-programs.sway.extraSessionCommands}

Shell commands executed just before Sway is started. See
[https://github.com/swaywm/sway/wiki/Running-programs-natively-under-wayland](https://github.com/swaywm/sway/wiki/Running-programs-natively-under-wayland)
and [https://github.com/swaywm/wlroots/blob/master/docs/env\_vars.md](https://github.com/swaywm/wlroots/blob/master/docs/env_vars.md)
for some useful environment variables.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  # SDL:
  export SDL_VIDEODRIVER=wayland
  # QT (needs qt5.qtwayland in systemPackages):
  export QT_QPA_PLATFORM=wayland-egl
  export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
  # Fix for some Java AWT applications (e.g. Android Studio),
  # use this if they aren't displayed properly:
  export _JAVA_AWT_WM_NONREPARENTING=1
''
```

*Declared by:* [`nixos/modules/programs/wayland/sway.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/sway.nix)

## `programs.sway.package` {#opt-programs.sway.package}

The sway package to use. If the package is not overridable with `extraSessionCommands`, `extraOptions`,
`withBaseWrapper`, `withGtkWrapper`, `enableXWayland` and `isNixOS`,
then the module options `wrapperFeatures`, `extraSessionCommands`,
`extraOptions` and `xwayland` will have no effect.

Set to `null` to not add any Sway package to your path.
This should be done if you want to use the Home Manager Sway module to install Sway.

*Type:* null or package

*Default:* `pkgs.sway`

*Declared by:* [`nixos/modules/programs/wayland/sway.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/sway.nix)

## `programs.sway.wrapperFeatures.base` {#opt-programs.sway.wrapperFeatures.base}

Whether to enable the base wrapper to execute extra session commands and prepend a
dbus-run-session to the sway command.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/sway.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/sway.nix)

## `programs.sway.wrapperFeatures.gtk` {#opt-programs.sway.wrapperFeatures.gtk}

Whether to enable the wrapGAppsHook wrapper to execute sway with required environment
variables for GTK applications.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/sway.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/sway.nix)

## `programs.sway.xwayland.enable` {#opt-programs.sway.xwayland.enable}

Whether to enable XWayland.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/sway.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/sway.nix)

## `programs.sysdig.enable` {#opt-programs.sysdig.enable}

Whether to enable sysdig, a tracing tool.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/sysdig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/sysdig.nix)

## `programs.system-config-printer.enable` {#opt-programs.system-config-printer.enable}

Whether to enable system-config-printer, a Graphical user interface for CUPS administration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/system-config-printer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/system-config-printer.nix)

## `programs.systemtap.enable` {#opt-programs.systemtap.enable}

Install `systemtap` along with necessary kernel options.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/systemtap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/systemtap.nix)

## `programs.tack.enable` {#opt-programs.tack.enable}

Whether to enable tack, flake-like toml nix pins.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/tack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tack.nix)

## `programs.tack.nixConfTokens` {#opt-programs.tack.nixConfTokens}

Whether to enable tack reading access tokens from nix.conf (significantly improves comparison speed).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/tack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tack.nix)

## `programs.tack.package` {#opt-programs.tack.package}

The tack package to use.

*Type:* package

*Default:* `pkgs.tack`

*Declared by:* [`nixos/modules/programs/tack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tack.nix)

## `programs.tcpdump.enable` {#opt-programs.tcpdump.enable}

Whether to configure a setcap wrapper for tcpdump.
To use it, add your user to the `pcap` group.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/tcpdump.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tcpdump.nix)

## `programs.television.enable` {#opt-programs.television.enable}

Whether to enable Blazingly fast general purpose fuzzy finder TUI.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/television.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/television.nix)

## `programs.television.enableBashIntegration` {#opt-programs.television.enableBashIntegration}

Whether to enable Bash integration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/television.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/television.nix)

## `programs.television.enableFishIntegration` {#opt-programs.television.enableFishIntegration}

Whether to enable Fish integration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/television.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/television.nix)

## `programs.television.enableNushellIntegration` {#opt-programs.television.enableNushellIntegration}

Whether to enable Nushell integration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/television.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/television.nix)

## `programs.television.enableZshIntegration` {#opt-programs.television.enableZshIntegration}

Whether to enable Zsh integration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/television.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/television.nix)

## `programs.television.package` {#opt-programs.television.package}

The television package to use.

*Type:* package

*Default:* `pkgs.television`

*Declared by:* [`nixos/modules/programs/television.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/television.nix)

## `programs.throne.enable` {#opt-programs.throne.enable}

Whether to enable Throne, a GUI proxy configuration manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/throne.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/throne.nix)

## `programs.throne.package` {#opt-programs.throne.package}

The throne package to use.

*Type:* package

*Default:* `pkgs.throne`

*Declared by:* [`nixos/modules/programs/throne.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/throne.nix)

## `programs.throne.tunMode.enable` {#opt-programs.throne.tunMode.enable}

Whether to enable TUN mode of Throne.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/throne.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/throne.nix)

## `programs.throne.tunMode.setuid` {#opt-programs.throne.tunMode.setuid}

Whether to enable setting suid bit for ThroneCore to run as root, which is less
secure than default setcap method but closer to upstream assumptions.
Enable this if you find the default setcap method configured in
this module doesn't work for you
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/throne.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/throne.nix)

## `programs.thunar.enable` {#opt-programs.thunar.enable}

Whether to enable Thunar, the Xfce file manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/thunar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/thunar.nix)

## `programs.thunar.package` {#opt-programs.thunar.package}

The thunar package to use.

*Type:* package

*Default:* `pkgs.thunar`

*Declared by:* [`nixos/modules/programs/thunar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/thunar.nix)

## `programs.thunar.plugins` {#opt-programs.thunar.plugins}

List of thunar plugins to install.

*Type:* list of package

*Default:* `[ ]`

*Example:* `with pkgs; [ thunar-archive-plugin thunar-volman ]`

*Declared by:* [`nixos/modules/programs/thunar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/thunar.nix)

## `programs.thunderbird.enable` {#opt-programs.thunderbird.enable}

Whether to enable Thunderbird mail client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/thunderbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/thunderbird.nix)

## `programs.thunderbird.languagePacks` {#opt-programs.thunderbird.languagePacks}

The language packs to install.

*Type:* list of (one of "af", "ar", "ast", "be", "bg", "br", "ca", "cak", "cs", "cy", "da", "de", "dsb", "el", "en-CA", "en-GB", "en-US", "es-AR", "es-ES", "es-MX", "et", "eu", "fi", "fr", "fy-NL", "ga-IE", "gd", "gl", "he", "hr", "hsb", "hu", "hy-AM", "id", "is", "it", "ja", "ka", "kab", "kk", "ko", "lt", "lv", "ms", "nb-NO", "nl", "nn-NO", "pa-IN", "pl", "pt-BR", "pt-PT", "rm", "ro", "ru", "sk", "sl", "sq", "sr", "sv-SE", "th", "tr", "uk", "uz", "vi", "zh-CN", "zh-TW")

*Default:* `[ ]`

*Declared by:* [`nixos/modules/programs/thunderbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/thunderbird.nix)

## `programs.thunderbird.package` {#opt-programs.thunderbird.package}

The thunderbird package to use.

*Type:* package

*Default:* `pkgs.thunderbird`

*Declared by:* [`nixos/modules/programs/thunderbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/thunderbird.nix)

## `programs.thunderbird.policies` {#opt-programs.thunderbird.policies}

Group policies to install.

See [Thunderbird's documentation](https://github.com/thunderbird/policy-templates)
for a list of available options.

This can be used to install extensions declaratively! Check out the
documentation of the `ExtensionSettings` policy for details.

*Type:* JSON value

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/thunderbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/thunderbird.nix)

## `programs.thunderbird.preferences` {#opt-programs.thunderbird.preferences}

Preferences to set from `about:config`.

Some of these might be able to be configured more ergonomically
using policies.

*Type:* attribute set of (boolean or signed integer or string)

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/thunderbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/thunderbird.nix)

## `programs.thunderbird.preferencesStatus` {#opt-programs.thunderbird.preferencesStatus}

The status of `thunderbird.preferences`.

`status` can assume the following values:

- `"default"`: Preferences appear as default.
- `"locked"`: Preferences appear as default and can't be changed.
- `"user"`: Preferences appear as changed.
- `"clear"`: Value has no effect. Resets to factory defaults on each startup.

*Type:* one of "default", "locked", "user", "clear"

*Default:* `"locked"`

*Declared by:* [`nixos/modules/programs/thunderbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/thunderbird.nix)

## `programs.tmux.aggressiveResize` {#opt-programs.tmux.aggressiveResize}

Resize the window to the size of the smallest session for which it is the current window.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/tmux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tmux.nix)

## `programs.tmux.baseIndex` {#opt-programs.tmux.baseIndex}

Base index for windows and panes.

*Type:* signed integer

*Default:* `0`

*Example:* `1`

*Declared by:* [`nixos/modules/programs/tmux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tmux.nix)

## `programs.tmux.clock24` {#opt-programs.tmux.clock24}

Use 24 hour clock.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/tmux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tmux.nix)

## `programs.tmux.customPaneNavigationAndResize` {#opt-programs.tmux.customPaneNavigationAndResize}

Override the hjkl and HJKL bindings for pane navigation and resizing in VI mode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/tmux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tmux.nix)

## `programs.tmux.enable` {#opt-programs.tmux.enable}

Whenever to configure `tmux` system-wide.

*Type:* boolean

*Default:* `false`

*Related packages:*

- [`pkgs.tmux`](https://search.nixos.org/packages?show=tmux&sort=relevance&query=tmux)

*Declared by:* [`nixos/modules/programs/tmux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tmux.nix)

## `programs.tmux.escapeTime` {#opt-programs.tmux.escapeTime}

Time in milliseconds for which tmux waits after an escape is input.

*Type:* signed integer

*Default:* `500`

*Example:* `0`

*Declared by:* [`nixos/modules/programs/tmux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tmux.nix)

## `programs.tmux.extraConfig` {#opt-programs.tmux.extraConfig}

Additional contents of /etc/tmux.conf, to be run after sourcing plugins.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/programs/tmux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tmux.nix)

## `programs.tmux.extraConfigBeforePlugins` {#opt-programs.tmux.extraConfigBeforePlugins}

Additional contents of /etc/tmux.conf, to be run before sourcing plugins.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/programs/tmux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tmux.nix)

## `programs.tmux.historyLimit` {#opt-programs.tmux.historyLimit}

Maximum number of lines held in window history.

*Type:* signed integer

*Default:* `2000`

*Example:* `5000`

*Declared by:* [`nixos/modules/programs/tmux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tmux.nix)

## `programs.tmux.keyMode` {#opt-programs.tmux.keyMode}

VI or Emacs style shortcuts.

*Type:* one of "emacs", "vi"

*Default:* `"emacs"`

*Example:* `"vi"`

*Declared by:* [`nixos/modules/programs/tmux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tmux.nix)

## `programs.tmux.newSession` {#opt-programs.tmux.newSession}

Automatically spawn a session if trying to attach and none are running.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/tmux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tmux.nix)

## `programs.tmux.package` {#opt-programs.tmux.package}

The tmux package to use.

*Type:* package

*Default:* `pkgs.tmux`

*Declared by:* [`nixos/modules/programs/tmux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tmux.nix)

## `programs.tmux.plugins` {#opt-programs.tmux.plugins}

List of plugins to install.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.tmuxPlugins.nord ]`

*Declared by:* [`nixos/modules/programs/tmux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tmux.nix)

## `programs.tmux.resizeAmount` {#opt-programs.tmux.resizeAmount}

Number of lines/columns when resizing.

*Type:* signed integer

*Default:* `5`

*Example:* `10`

*Declared by:* [`nixos/modules/programs/tmux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tmux.nix)

## `programs.tmux.reverseSplit` {#opt-programs.tmux.reverseSplit}

Reverse the window split shortcuts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/tmux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tmux.nix)

## `programs.tmux.secureSocket` {#opt-programs.tmux.secureSocket}

Store tmux socket under /run, which is more secure than /tmp, but as a
downside it doesn't survive user logout.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/tmux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tmux.nix)

## `programs.tmux.shortcut` {#opt-programs.tmux.shortcut}

Ctrl following by this key is used as the main shortcut.

*Type:* string

*Default:* `"b"`

*Example:* `"a"`

*Declared by:* [`nixos/modules/programs/tmux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tmux.nix)

## `programs.tmux.terminal` {#opt-programs.tmux.terminal}

Set the $TERM variable. Use tmux-direct if italics or 24bit true color
support is needed.

*Type:* string

*Default:* `"screen"`

*Example:* `"screen-256color"`

*Declared by:* [`nixos/modules/programs/tmux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tmux.nix)

## `programs.tmux.withUtempter` {#opt-programs.tmux.withUtempter}

Whether to enable libutempter for tmux.
This is required so that tmux can write to /var/run/utmp (which can be queried with `who` to display currently connected user sessions).
Note, this will add a guid wrapper for the group utmp!

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/tmux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tmux.nix)

## `programs.traceroute.enable` {#opt-programs.traceroute.enable}

Whether to configure a setcap wrapper for traceroute.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/traceroute.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/traceroute.nix)

## `programs.trippy.enable` {#opt-programs.trippy.enable}

Whether to enable trippy, a network diagnostic tool.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/trippy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/trippy.nix)

## `programs.tsmClient.defaultServername` {#opt-programs.tsmClient.defaultServername}

If multiple server stanzas are declared with
[`programs.tsmClient.servers`](#opt-programs.tsmClient.servers),
this option may be used to name a default
server stanza that IBM TSM uses in the absence of
a user-defined `dsm.opt` file.
This option translates to a
`defaultserver` configuration line.

*Type:* null or string matching the pattern \[^\[:space:\]\]{1,64}

*Default:* `null`

*Example:* `"mainTsmServer"`

*Declared by:* [`nixos/modules/programs/tsm-client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tsm-client.nix)

## `programs.tsmClient.dsmSysText` {#opt-programs.tsmClient.dsmSysText}

This configuration key contains the effective text
of the client system-options file "dsm.sys".
It should not be changed, but may be
used to feed the configuration into other
TSM-depending packages used on the system.

*Type:* strings concatenated with "\\n"

*Read only*

*Declared by:* [`nixos/modules/programs/tsm-client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tsm-client.nix)

## `programs.tsmClient.enable` {#opt-programs.tsmClient.enable}

Whether to enable IBM Storage Protect (Tivoli Storage Manager, TSM)
client command line applications with a
client system-options file "dsm.sys"
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/tsm-client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tsm-client.nix)

## `programs.tsmClient.package` {#opt-programs.tsmClient.package}

The tsm-client package to use. It will be used with `.override`
to add paths to the client system-options file.

*Type:* package

*Default:* `pkgs.tsm-client`

*Example:* `tsm-client-withGui`

*Declared by:* [`nixos/modules/programs/tsm-client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tsm-client.nix)

## `programs.tsmClient.servers` {#opt-programs.tsmClient.servers}

Server definitions ("stanzas")
for the client system-options file.
The name of each entry will be used for
the internal `servername` by default.
Each attribute will be transformed into a line
with a key-value pair within the server's stanza.
Integers as values will be
canonically turned into strings.
The boolean value `true` will be turned
into a line with just the attribute's name.
The value `null` will not generate a line.
A list as values generates an entry for
each value, according to the rules above.

*Type:* attribute set of (open submodule of attribute set of (one of true, <null> or signed integer or absolute path or (optionally newline-terminated) single-line string or list of (one of true, <null> or signed integer or absolute path or (optionally newline-terminated) single-line string)))

*Default:* `{ }`

*Example:*

``` nix
{
  mainTsmServer = {
    compression = "yes";
    nodename = "MY-TSM-NODE";
    tcpserveraddress = "tsmserver.company.com";
  };
}
```

*Declared by:* [`nixos/modules/programs/tsm-client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tsm-client.nix)

## `programs.tsmClient.servers.<name>.genPasswd` {#opt-programs.tsmClient.servers._name_.genPasswd}

Whether to enable automatic client password generation.
This option does *not* cause a line in
`dsm.sys` by itself, but generates a
corresponding `passwordaccess` directive.
The password will be stored in the directory
given by the option `passworddir`.
*Caution*:
If this option is enabled and the server forces
to renew the password (e.g. on first connection),
a random password will be generated and stored
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/tsm-client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tsm-client.nix)

## `programs.tsmClient.servers.<name>.inclexcl` {#opt-programs.tsmClient.servers._name_.inclexcl}

Text lines with `include.*` and `exclude.*` directives
to be used when sending files to the IBM TSM server,
or an absolute path pointing to a file with such lines.

*Type:* (null or absolute path) or strings concatenated with "\\n" convertible to it

*Default:* `null`

*Example:*

``` nix
''
  exclude.dir     /nix/store
  include.encrypt /home/.../*
''
```

*Declared by:* [`nixos/modules/programs/tsm-client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tsm-client.nix)

## `programs.tsmClient.servers.<name>.nodename` {#opt-programs.tsmClient.servers._name_.nodename}

Target node name on the IBM TSM server.

*Type:* non-empty string

*Example:* `"MY-TSM-NODE"`

*Declared by:* [`nixos/modules/programs/tsm-client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tsm-client.nix)

## `programs.tsmClient.servers.<name>.passworddir` {#opt-programs.tsmClient.servers._name_.passworddir}

Directory that holds the TSM
node's password information.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/home/alice/tsm-password"`

*Declared by:* [`nixos/modules/programs/tsm-client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tsm-client.nix)

## `programs.tsmClient.servers.<name>.servername` {#opt-programs.tsmClient.servers._name_.servername}

Local name of the IBM TSM server,
must not contain space or more than 64 chars.

*Type:* string matching the pattern \[^\[:space:\]\]{1,64}

*Default:* `"‹name›"`

*Example:* `"mainTsmServer"`

*Declared by:* [`nixos/modules/programs/tsm-client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tsm-client.nix)

## `programs.tsmClient.servers.<name>.tcpport` {#opt-programs.tsmClient.servers._name_.tcpport}

TCP port of the IBM TSM server.
TSM does not support ports above 32767.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1500`

*Declared by:* [`nixos/modules/programs/tsm-client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tsm-client.nix)

## `programs.tsmClient.servers.<name>.tcpserveraddress` {#opt-programs.tsmClient.servers._name_.tcpserveraddress}

Host/domain name or IP address of the IBM TSM server.

*Type:* non-empty string

*Example:* `"tsmserver.company.com"`

*Declared by:* [`nixos/modules/programs/tsm-client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tsm-client.nix)

## `programs.tsmClient.wrappedPackage` {#opt-programs.tsmClient.wrappedPackage}

The tsm-client package to use. This option is to provide the effective derivation,
wrapped with the path to the
client system-options file "dsm.sys".
It should not be changed, but exists
for other modules that want to call TSM executables.

*Type:* package

*Read only*

*Declared by:* [`nixos/modules/programs/tsm-client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tsm-client.nix)

## `programs.turbovnc.ensureHeadlessSoftwareOpenGL` {#opt-programs.turbovnc.ensureHeadlessSoftwareOpenGL}

Whether to set up NixOS such that TurboVNC's built-in software OpenGL
implementation works.

This will enable [`hardware.graphics.enable`](../../options/hardware/index.md#opt-hardware.graphics.enable) so that OpenGL
programs can find Mesa's llvmpipe drivers.

Setting this option to `false` does not mean that software
OpenGL won't work; it may still work depending on your system
configuration.

This option is also intended to generate warnings if you are using some
configuration that's incompatible with using headless software OpenGL
in TurboVNC.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/turbovnc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/turbovnc.nix)

## `programs.tuxclocker.enable` {#opt-programs.tuxclocker.enable}

Whether to enable TuxClocker, a hardware control and monitoring program
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/tuxclocker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tuxclocker.nix)

## `programs.tuxclocker.enabledNVIDIADevices` {#opt-programs.tuxclocker.enabledNVIDIADevices}

Enable NVIDIA GPU controls for a device by index.
Sets the `Coolbits` Xorg option to enable all TuxClocker controls.

*Type:* list of signed integer

*Default:* `[ ]`

*Example:*

``` nix
[
  0
  1
]
```

*Declared by:* [`nixos/modules/services/misc/tuxclocker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tuxclocker.nix)

## `programs.tuxclocker.useUnfree` {#opt-programs.tuxclocker.useUnfree}

Whether to use components requiring unfree dependencies.
Disabling this allows you to get everything from the binary cache.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/tuxclocker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tuxclocker.nix)

## `programs.udevil.enable` {#opt-programs.udevil.enable}

Whether to enable udevil, to mount filesystems without password.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/udevil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/udevil.nix)

## `programs.umbriel.enable` {#opt-programs.umbriel.enable}

Whether to enable Umbriel, a Wayland compositor built on wlroots and SceneFX.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/umbriel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/umbriel.nix)

## `programs.umbriel.package` {#opt-programs.umbriel.package}

The umbriel package to use.

*Type:* package

*Default:* `pkgs.umbriel`

*Declared by:* [`nixos/modules/programs/wayland/umbriel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/umbriel.nix)

## `programs.umbriel.portalPackage` {#opt-programs.umbriel.portalPackage}

The xdg-desktop-portal-umbriel package to use.

*Type:* package

*Default:* `pkgs.xdg-desktop-portal-umbriel`

*Declared by:* [`nixos/modules/programs/wayland/umbriel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/umbriel.nix)

## `programs.unifi-endpoint.enable` {#opt-programs.unifi-endpoint.enable}

Whether to enable UniFi Endpoint, Ubiquiti's UniFi Identity VPN and WiFi client.

Installing a workspace CA certificate from the app does not work on
NixOS: the app calls `update-ca-certificates` or `update-ca-trust`,
and neither exists here. Add the certificate to the system trust
store through your configuration instead:

``` nix
security.pki.certificateFiles = [ ./workspace-ca.crt ];
```

WiFi and wired 802.1X authentication from the app need
[networking](../../options/networking/index.md#opt-networking.networkmanager.enable).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/unifi-endpoint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/unifi-endpoint.nix)

## `programs.unifi-endpoint.package` {#opt-programs.unifi-endpoint.package}

The unifi-endpoint package to use.

*Type:* package

*Default:* `pkgs.unifi-endpoint`

*Declared by:* [`nixos/modules/programs/unifi-endpoint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/unifi-endpoint.nix)

## `programs.usbtop.enable` {#opt-programs.usbtop.enable}

Whether to enable usbtop and required kernel module, to show estimated USB bandwidth.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/usbtop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/usbtop.nix)

## `programs.uwsm.enable` {#opt-programs.uwsm.enable}

Whether to enable uwsm, which wraps standalone Wayland compositors with a set
of Systemd units on the fly. This essentially
binds the wayland compositor into `graphical-session-pre.target`,
`graphical-session.target`, `xdg-desktop-autostart.target`.

This is useful for Wayland compositors like Hyprland, Sway, Wayfire,
etc. that do not start these targets and services on their own.

::: note
You must configure `waylandCompositors` suboptions as well
so that UWSM knows which compositors to manage.

Additionally, this by default uses `dbus-broker` as the dbus
implementation for better compatibility. If you dislike this behavior
you can set `services.dbus.implementation = lib.mkForce "dbus"`
in your configuration.
:::

If you are having trouble starting a service that depends on
`graphical-session.target`, while using a WM, enabling this option
might help
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/uwsm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/uwsm.nix)

## `programs.uwsm.package` {#opt-programs.uwsm.package}

The uwsm package to use.

*Type:* package

*Default:* `pkgs.uwsm`

*Declared by:* [`nixos/modules/programs/wayland/uwsm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/uwsm.nix)

## `programs.uwsm.waylandCompositors` {#opt-programs.uwsm.waylandCompositors}

Configuration for UWSM-managed Wayland Compositors. This
creates a desktop entry file which will be used by Display
Managers like GDM, to allow starting the UWSM managed session.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
hyprland = {
  prettyName = "Hyprland";
  comment = "Hyprland compositor managed by UWSM";
  binPath = "/run/current-system/sw/bin/Hyprland";
};
sway = {
  prettyName = "Sway";
  comment = "Sway compositor managed by UWSM";
  binPath = "/run/current-system/sw/bin/sway";
};
```

*Declared by:* [`nixos/modules/programs/wayland/uwsm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/uwsm.nix)

## `programs.uwsm.waylandCompositors.<name>.binPath` {#opt-programs.uwsm.waylandCompositors._name_.binPath}

The wayland-compositor binary path that will be called by UWSM.

It is recommended to use the `/run/current-system/sw/bin/` path
instead of `lib.getExe pkgs.<compositor>` to avoid version mismatch
of the compositor used by UWSM and the one installed in the system.

*Type:* absolute path

*Example:* `"/run/current-system/sw/bin/ExampleCompositor"`

*Declared by:* [`nixos/modules/programs/wayland/uwsm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/uwsm.nix)

## `programs.uwsm.waylandCompositors.<name>.comment` {#opt-programs.uwsm.waylandCompositors._name_.comment}

The comment field of the desktop entry file.

*Type:* string

*Default:* `"An intelligent Wayland compositor managed by UWSM."`

*Declared by:* [`nixos/modules/programs/wayland/uwsm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/uwsm.nix)

## `programs.uwsm.waylandCompositors.<name>.extraArgs` {#opt-programs.uwsm.waylandCompositors._name_.extraArgs}

Extra command-line arguments pass to to the compsitor.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/programs/wayland/uwsm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/uwsm.nix)

## `programs.uwsm.waylandCompositors.<name>.prettyName` {#opt-programs.uwsm.waylandCompositors._name_.prettyName}

The full name of the desktop entry file.

*Type:* string

*Example:* `"ExampleWaylandCompositor"`

*Declared by:* [`nixos/modules/programs/wayland/uwsm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/uwsm.nix)

## `programs.vim.defaultEditor` {#opt-programs.vim.defaultEditor}

Whether to enable vim as the default editor.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/vim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/vim.nix)

## `programs.vim.enable` {#opt-programs.vim.enable}

Whether to enable Vi IMproved, an advanced text editor.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/vim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/vim.nix)

## `programs.vim.package` {#opt-programs.vim.package}

The vim package to use.

*Type:* package

*Default:* `pkgs.vim`

*Example:* `pkgs.vim-full`

*Declared by:* [`nixos/modules/programs/vim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/vim.nix)

## `programs.virt-manager.enable` {#opt-programs.virt-manager.enable}

Whether to enable virt-manager, an UI for managing virtual machines in libvirt.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/virt-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/virt-manager.nix)

## `programs.virt-manager.package` {#opt-programs.virt-manager.package}

The virt-manager package to use.

*Type:* package

*Default:* `pkgs.virt-manager`

*Declared by:* [`nixos/modules/programs/virt-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/virt-manager.nix)

## `programs.vivid.enable` {#opt-programs.vivid.enable}

Whether to configure LS\_COLORS with vivid.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/vivid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/vivid.nix)

## `programs.vivid.package` {#opt-programs.vivid.package}

The vivid package to use.

*Type:* package

*Default:* `pkgs.vivid`

*Example:* `vivid`

*Declared by:* [`nixos/modules/programs/vivid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/vivid.nix)

## `programs.vivid.theme` {#opt-programs.vivid.theme}

Theme to be used (see `vivid themes`)

*Type:* string

*Default:* `"gruvbox-dark-soft"`

*Example:* `"solarized-dark"`

*Declared by:* [`nixos/modules/programs/vivid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/vivid.nix)

## `programs.vlc.chromecast.openFirewall` {#opt-programs.vlc.chromecast.openFirewall}

Open the default port (8010) in the firewall for Chromecast to work.

Make sure to use the `vlc` package with
`chromecastSupport = true`, which is the default.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/vlc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/vlc.nix)

## `programs.vlc.enable` {#opt-programs.vlc.enable}

Whether to enable VideoLAN's VLC media player.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/vlc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/vlc.nix)

## `programs.vlc.package` {#opt-programs.vlc.package}

The vlc package to use.

*Type:* package

*Default:* `pkgs.vlc`

*Declared by:* [`nixos/modules/programs/vlc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/vlc.nix)

## `programs.vlc.plugins` {#opt-programs.vlc.plugins}

List of VLC plugins to use.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.vlc-bittorrent ]`

*Declared by:* [`nixos/modules/programs/vlc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/vlc.nix)

## `programs.vscode.defaultEditor` {#opt-programs.vscode.defaultEditor}

When enabled, configures VSCode to be the default editor
using the EDITOR environment variable.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/vscode.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/vscode.nix)

## `programs.vscode.enable` {#opt-programs.vscode.enable}

Whether to enable VSCode editor.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/vscode.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/vscode.nix)

## `programs.vscode.enterprisePolicies` {#opt-programs.vscode.enterprisePolicies}

System-wide policies for VSCode in `/etc/vscode/policy.json`.
See [https://code.visualstudio.com/docs/setup/enterprise#\_centrally-manage-vs-code-settings](https://code.visualstudio.com/docs/setup/enterprise#_centrally-manage-vs-code-settings) for more information.

*Type:* JSON value

*Default:* `{ }`

*Example:*

``` nix
{
  "UpdateMode" = "none";
  "TelemetryLevel" = "off";
}
```

*Declared by:* [`nixos/modules/programs/vscode.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/vscode.nix)

## `programs.vscode.extensions` {#opt-programs.vscode.extensions}

List of extensions to install.

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
with pkgs.vscode-extensions; [
  bbenoist.nix
  golang.go
  twxs.cmake
]
```

*Declared by:* [`nixos/modules/programs/vscode.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/vscode.nix)

## `programs.vscode.package` {#opt-programs.vscode.package}

The vscode package to use. The final package will be customized with extensions from [`programs.vscode.extensions`](#opt-programs.vscode.extensions)

*Type:* package

*Default:* `pkgs.vscode`

*Declared by:* [`nixos/modules/programs/vscode.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/vscode.nix)

## `programs.wavemon.enable` {#opt-programs.wavemon.enable}

Whether to add wavemon to the global environment and configure a
setcap wrapper for it.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/wavemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wavemon.nix)

## `programs.waybar.enable` {#opt-programs.waybar.enable}

Whether to enable waybar, a highly customizable Wayland bar for Sway and Wlroots based compositors.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/waybar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/waybar.nix)

## `programs.waybar.package` {#opt-programs.waybar.package}

The waybar package to use.

*Type:* package

*Default:* `pkgs.waybar`

*Declared by:* [`nixos/modules/programs/wayland/waybar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/waybar.nix)

## `programs.waybar.systemd.target` {#opt-programs.waybar.systemd.target}

The systemd target that will automatically start the Waybar service.

*Type:* string

*Default:* `"graphical-session.target"`

*Declared by:* [`nixos/modules/programs/wayland/waybar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/waybar.nix)

## `programs.wayfire.enable` {#opt-programs.wayfire.enable}

Whether to enable Wayfire, a wayland compositor based on wlroots.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/wayfire.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/wayfire.nix)

## `programs.wayfire.package` {#opt-programs.wayfire.package}

The wayfire package to use.

*Type:* package

*Default:* `pkgs.wayfire`

*Declared by:* [`nixos/modules/programs/wayland/wayfire.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/wayfire.nix)

## `programs.wayfire.plugins` {#opt-programs.wayfire.plugins}

Additional plugins to use with the wayfire window manager.

*Type:* list of package

*Default:* `with pkgs.wayfirePlugins; [ wcm wf-shell ]`

*Example:*

``` nix
with pkgs.wayfirePlugins; [
  wcm
  wf-shell
  wayfire-plugins-extra
];
```

*Declared by:* [`nixos/modules/programs/wayland/wayfire.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/wayfire.nix)

## `programs.wayfire.xwayland.enable` {#opt-programs.wayfire.xwayland.enable}

Whether to enable XWayland.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/wayfire.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/wayfire.nix)

## `programs.wayland.miracle-wm.enable` {#opt-programs.wayland.miracle-wm.enable}

Whether to enable miracle-wm, a tiling Mir based Wayland compositor. You can manually launch miracle-wm by
executing "exec miracle-wm" on a TTY, or launch it from a display manager.
Consult the USERGUIDE.md at [https://github.com/mattkae/miracle-wm](https://github.com/mattkae/miracle-wm) for information on
how to use & configure it
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/miracle-wm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/miracle-wm.nix)

## `programs.wayvnc.enable` {#opt-programs.wayvnc.enable}

Whether to enable wayvnc, VNC server for wlroots based Wayland compositors.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/wayvnc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/wayvnc.nix)

## `programs.wayvnc.package` {#opt-programs.wayvnc.package}

The wayvnc package to use.

*Type:* package

*Default:* `pkgs.wayvnc`

*Declared by:* [`nixos/modules/programs/wayland/wayvnc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/wayvnc.nix)

## `programs.weylus.enable` {#opt-programs.weylus.enable}

Whether to enable weylus, which turns your smart phone into a graphic tablet/touch screen for your computer.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/weylus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/weylus.nix)

## `programs.weylus.openFirewall` {#opt-programs.weylus.openFirewall}

Open ports needed for the functionality of the program.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/weylus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/weylus.nix)

## `programs.weylus.package` {#opt-programs.weylus.package}

The weylus package to use.

*Type:* package

*Default:* `pkgs.weylus`

*Declared by:* [`nixos/modules/programs/weylus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/weylus.nix)

## `programs.weylus.users` {#opt-programs.weylus.users}

To enable stylus and multi-touch support, the user you're going to use must be added to this list.
These users can synthesize input events system-wide, even when another user is logged in - untrusted users should not be added.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/programs/weylus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/weylus.nix)

## `programs.whois.enable` {#opt-programs.whois.enable}

Whether to enable whois, an intelligent WHOIS client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/whois.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/whois.nix)

## `programs.whois.package` {#opt-programs.whois.package}

The whois package to use.

*Type:* package

*Default:* `pkgs.whois`

*Declared by:* [`nixos/modules/programs/whois.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/whois.nix)

## `programs.whois.settings` {#opt-programs.whois.settings}

WHOIS configuration entries written to `/etc/whois.conf`.

Entries are written in the declared order, which matters when multiple
patterns may match the same query.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    pattern = "\\.dn42$";
    server = "whois.dn42";
  }
  {
    pattern = "\\-DN42$";
    server = "whois.dn42";
  }
  {
    pattern = "^as424242[0-9]{4}$";
    server = "whois.dn42";
  }
  {
    pattern = "^172\\.2[0-3]\\.[0-9]{1,3}\\.[0-9]{1,3}(/(1[56789]|2[0-9]|3[012]))?$";
    server = "whois.dn42";
  }
]
```

*Declared by:* [`nixos/modules/programs/whois.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/whois.nix)

## `programs.whois.settings.*.pattern` {#opt-programs.whois.settings._.pattern}

Case-insensitive extended regular expression used to match the
WHOIS object identifier.

*Type:* string

*Example:* `"\\.dn42$"`

*Declared by:* [`nixos/modules/programs/whois.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/whois.nix)

## `programs.whois.settings.*.server` {#opt-programs.whois.settings._.server}

WHOIS server to use when `pattern` matches.

*Type:* string

*Example:* `"whois.dn42"`

*Declared by:* [`nixos/modules/programs/whois.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/whois.nix)

## `programs.winbox.enable` {#opt-programs.winbox.enable}

Whether to enable MikroTik Winbox.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/winbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/winbox.nix)

## `programs.winbox.openFirewall` {#opt-programs.winbox.openFirewall}

Whether to open ports for the MikroTik Neighbor Discovery protocol. Required for Winbox neighbor discovery.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/winbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/winbox.nix)

## `programs.winbox.package` {#opt-programs.winbox.package}

The winbox package to use.

*Type:* package

*Default:* `pkgs.winbox`

*Declared by:* [`nixos/modules/programs/winbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/winbox.nix)

## `programs.wireshark.dumpcap.enable` {#opt-programs.wireshark.dumpcap.enable}

Whether to allow users in the 'wireshark' group to capture network traffic. This
configures a setcap wrapper for 'dumpcap' for users in the 'wireshark' group.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/wireshark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wireshark.nix)

## `programs.wireshark.enable` {#opt-programs.wireshark.enable}

Whether to add Wireshark to the global environment and create a 'wireshark'
group. To configure what users can capture, set the `dumpcap.enable` and
`usbmon.enable` options. By default, users in the 'wireshark' group are
allowed to capture network traffic but not USB traffic.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/wireshark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wireshark.nix)

## `programs.wireshark.package` {#opt-programs.wireshark.package}

The wireshark-cli package to use.

*Type:* package

*Default:* `pkgs.wireshark-cli`

*Example:* `wireshark`

*Declared by:* [`nixos/modules/programs/wireshark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wireshark.nix)

## `programs.wireshark.usbmon.enable` {#opt-programs.wireshark.usbmon.enable}

Whether to allow users in the 'wireshark' group to capture USB traffic. This adds
udev rules to give users in the 'wireshark' group read permissions to all devices
in the usbmon subsystem.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/wireshark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wireshark.nix)

## `programs.wshowkeys.enable` {#opt-programs.wshowkeys.enable}

Whether to enable wshowkeys (displays keypresses on screen on supported Wayland
compositors). It requires root permissions to read input events, but
these permissions are dropped after startup.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wshowkeys.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wshowkeys.nix)

## `programs.wshowkeys.package` {#opt-programs.wshowkeys.package}

The wshowkeys package to use.

*Type:* package

*Default:* `pkgs.wshowkeys`

*Declared by:* [`nixos/modules/programs/wshowkeys.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wshowkeys.nix)

## `programs.xastir.enable` {#opt-programs.xastir.enable}

Whether to enable Xastir Graphical APRS client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/xastir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xastir.nix)

## `programs.xfconf.enable` {#opt-programs.xfconf.enable}

Whether to enable Xfconf, the Xfce configuration storage system.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/xfconf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xfconf.nix)

## `programs.xfs_quota.projects` {#opt-programs.xfs_quota.projects}

Setup of xfs\_quota projects. Make sure the filesystem is mounted with the pquota option.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  projname = {
    id = 50;
    path = "/xfsprojects/projname";
    sizeHardLimit = "50g";
  };
}
```

*Declared by:* [`nixos/modules/programs/xfs_quota.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xfs_quota.nix)

## `programs.xfs_quota.projects.<name>.fileSystem` {#opt-programs.xfs_quota.projects._name_.fileSystem}

XFS filesystem hosting the xfs\_quota project.

*Type:* string

*Default:* `"/"`

*Declared by:* [`nixos/modules/programs/xfs_quota.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xfs_quota.nix)

## `programs.xfs_quota.projects.<name>.id` {#opt-programs.xfs_quota.projects._name_.id}

Project ID.

*Type:* signed integer

*Declared by:* [`nixos/modules/programs/xfs_quota.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xfs_quota.nix)

## `programs.xfs_quota.projects.<name>.path` {#opt-programs.xfs_quota.projects._name_.path}

Project directory.

*Type:* string

*Declared by:* [`nixos/modules/programs/xfs_quota.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xfs_quota.nix)

## `programs.xfs_quota.projects.<name>.sizeHardLimit` {#opt-programs.xfs_quota.projects._name_.sizeHardLimit}

Hard limit of the project size.

*Type:* null or string

*Default:* `null`

*Example:* `"50g"`

*Declared by:* [`nixos/modules/programs/xfs_quota.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xfs_quota.nix)

## `programs.xfs_quota.projects.<name>.sizeSoftLimit` {#opt-programs.xfs_quota.projects._name_.sizeSoftLimit}

Soft limit of the project size

*Type:* null or string

*Default:* `null`

*Example:* `"30g"`

*Declared by:* [`nixos/modules/programs/xfs_quota.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xfs_quota.nix)

## `programs.xonsh.bashCompletion.enable` {#opt-programs.xonsh.bashCompletion.enable}

Whether to enable bash completions for xonsh.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/xonsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xonsh.nix)

## `programs.xonsh.bashCompletion.package` {#opt-programs.xonsh.bashCompletion.package}

The bash-completion package to use.

*Type:* package

*Default:* `pkgs.bash-completion`

*Declared by:* [`nixos/modules/programs/xonsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xonsh.nix)

## `programs.xonsh.config` {#opt-programs.xonsh.config}

Extra text added to the end of `/etc/xonsh/xonshrc`,
the system-wide control file for xonsh.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/programs/xonsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xonsh.nix)

## `programs.xonsh.enable` {#opt-programs.xonsh.enable}

Whether to configure xonsh as an interactive shell.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/xonsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xonsh.nix)

## `programs.xonsh.extraPackages` {#opt-programs.xonsh.extraPackages}

Xontribs and extra Python packages to be available in xonsh.

*Type:* (function that evaluates to a(n) list of package) or (list of package) convertible to it

*Default:* `ps: [ ]`

*Example:*

``` nix
ps: with ps; [ numpy xonsh.xontribs.xontrib-vox ]
```

*Declared by:* [`nixos/modules/programs/xonsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xonsh.nix)

## `programs.xonsh.package` {#opt-programs.xonsh.package}

The xonsh package to use. The argument `extraPackages` of this package will be overridden by
the option `programs.xonsh.extraPackages`.

*Type:* package

*Default:* `pkgs.xonsh`

*Declared by:* [`nixos/modules/programs/xonsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xonsh.nix)

## `programs.xppen.enable` {#opt-programs.xppen.enable}

Whether to enable XPPen PenTablet application.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/xppen.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xppen.nix)

## `programs.xppen.package` {#opt-programs.xppen.package}

The xppen\_4 package to use. Use xppen\_4 for newer and xppen\_3 for older tablets.
To check which version of the driver you need, go to
https://www.xp-pen.com/download/ then select your tablet
and look for the major version in the available files for Linux.

*Type:* package

*Default:* `pkgs.xppen_4`

*Example:* `pkgs.xppen_3`

*Declared by:* [`nixos/modules/programs/xppen.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xppen.nix)

## `programs.xscreensaver.enable` {#opt-programs.xscreensaver.enable}

Whether to enable all of the xscreensaver programs.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/xscreensaver/xscreensaver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xscreensaver/xscreensaver.nix)

## `programs.xscreensaver.package` {#opt-programs.xscreensaver.package}

The xscreensaver package to use.

*Type:* package

*Default:* `pkgs.xscreensaver`

*Declared by:* [`nixos/modules/programs/xscreensaver/xscreensaver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xscreensaver/xscreensaver.nix)

## `programs.xscreensaver.sonar.enable` {#opt-programs.xscreensaver.sonar.enable}

Whether to enable xscreensaver.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/xscreensaver/sonar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xscreensaver/sonar.nix)

## `programs.xss-lock.enable` {#opt-programs.xss-lock.enable}

Whether to enable xss-lock.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/xss-lock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xss-lock.nix)

## `programs.xss-lock.extraOptions` {#opt-programs.xss-lock.extraOptions}

Additional command-line arguments to pass to
`xss-lock`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--ignore-sleep"
]
```

*Declared by:* [`nixos/modules/programs/xss-lock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xss-lock.nix)

## `programs.xss-lock.lockerCommand` {#opt-programs.xss-lock.lockerCommand}

Locker to be used with xsslock

*Type:* strings concatenated with " "

*Default:* `"${pkgs.i3lock}/bin/i3lock"`

*Example:* `"${pkgs.i3lock-fancy}/bin/i3lock-fancy"`

*Declared by:* [`nixos/modules/programs/xss-lock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xss-lock.nix)

## `programs.xtool.enable` {#opt-programs.xtool.enable}

Whether to enable xtool, with usbmuxd for access to iOS devices.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/xtool.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xtool.nix)

## `programs.xtool.package` {#opt-programs.xtool.package}

The xtool package to use.

*Type:* package

*Default:* `pkgs.xtool`

*Declared by:* [`nixos/modules/programs/xtool.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xtool.nix)

## `programs.xtool.sdk.enable` {#opt-programs.xtool.sdk.enable}

Whether to enable the Darwin SDK built from Xcode, linked into each user's `~/.swiftpm`.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/xtool.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xtool.nix)

## `programs.xtool.sdk.package` {#opt-programs.xtool.sdk.package}

The Darwin SDK to link, built by the same xtool as [`programs.xtool.package`](#opt-programs.xtool.package).
Xcode must be added to the Nix store manually.

*Type:* package

*Default:* `config.programs.xtool.package.sdk`

*Declared by:* [`nixos/modules/programs/xtool.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xtool.nix)

## `programs.xwayland.defaultFontPath` {#opt-programs.xwayland.defaultFontPath}

Default font path. Setting this option causes Xwayland to be rebuilt.

*Type:* string

*Default:*

``` nix
optionalString config.fonts.fontDir.enable "/run/current-system/sw/share/X11/fonts"
```

*Declared by:* [`nixos/modules/programs/xwayland.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xwayland.nix)

## `programs.xwayland.enable` {#opt-programs.xwayland.enable}

Whether to enable Xwayland (an X server for interfacing X11 apps with the Wayland protocol).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/xwayland.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xwayland.nix)

## `programs.xwayland.package` {#opt-programs.xwayland.package}

The Xwayland package to use.

*Type:* absolute path

*Default:*

``` nix
pkgs.xwayland.override (oldArgs: {
  inherit (config.programs.xwayland) defaultFontPath;
})
```

*Declared by:* [`nixos/modules/programs/xwayland.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/xwayland.nix)

## `programs.yazi.enable` {#opt-programs.yazi.enable}

Whether to enable yazi terminal file manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/yazi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/yazi.nix)

## `programs.yazi.flavors` {#opt-programs.yazi.flavors}

Pre-made themes.

See [https://yazi-rs.github.io/docs/flavors/overview/](https://yazi-rs.github.io/docs/flavors/overview/) for documentation.

*Type:* attribute set of (absolute path or package)

*Default:* `{ }`

*Example:*

``` nix
{
  foo = ./foo;
  inherit (pkgs.yaziPlugins) bar;
}
```

*Declared by:* [`nixos/modules/programs/yazi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/yazi.nix)

## `programs.yazi.initLua` {#opt-programs.yazi.initLua}

The init.lua for Yazi itself.

*Type:* null or absolute path

*Default:* `null`

*Example:* `./init.lua`

*Declared by:* [`nixos/modules/programs/yazi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/yazi.nix)

## `programs.yazi.package` {#opt-programs.yazi.package}

The yazi package to use.

*Type:* package

*Default:* `pkgs.yazi`

*Declared by:* [`nixos/modules/programs/yazi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/yazi.nix)

## `programs.yazi.plugins` {#opt-programs.yazi.plugins}

Lua plugins.

See [https://yazi-rs.github.io/docs/plugins/overview/](https://yazi-rs.github.io/docs/plugins/overview/) for documentation.

*Type:* attribute set of (absolute path or package)

*Default:* `{ }`

*Example:*

``` nix
{
  foo = ./foo;
  inherit (pkgs.yaziPlugins) bar;
}
```

*Declared by:* [`nixos/modules/programs/yazi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/yazi.nix)

## `programs.yazi.settings` {#opt-programs.yazi.settings}

Configuration included in `$YAZI_CONFIG_HOME`.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/yazi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/yazi.nix)

## `programs.yazi.settings.keymap` {#opt-programs.yazi.settings.keymap}

Configuration included in `keymap.toml`.

See [https://yazi-rs.github.io/docs/configuration/keymap/](https://yazi-rs.github.io/docs/configuration/keymap/) for documentation.

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/yazi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/yazi.nix)

## `programs.yazi.settings.theme` {#opt-programs.yazi.settings.theme}

Configuration included in `theme.toml`.

See [https://yazi-rs.github.io/docs/configuration/theme/](https://yazi-rs.github.io/docs/configuration/theme/) for documentation.

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/yazi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/yazi.nix)

## `programs.yazi.settings.vfs` {#opt-programs.yazi.settings.vfs}

Configuration included in `vfs.toml`.

See [https://yazi-rs.github.io/docs/configuration/vfs/](https://yazi-rs.github.io/docs/configuration/vfs/) for documentation.

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/yazi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/yazi.nix)

## `programs.yazi.settings.yazi` {#opt-programs.yazi.settings.yazi}

Configuration included in `yazi.toml`.

See [https://yazi-rs.github.io/docs/configuration/yazi/](https://yazi-rs.github.io/docs/configuration/yazi/) for documentation.

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/yazi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/yazi.nix)

## `programs.ydotool.enable` {#opt-programs.ydotool.enable}

Whether to enable ydotoold system service and `ydotool` for members of
[`programs.ydotool.group`](#opt-programs.ydotool.group).
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/ydotool.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ydotool.nix)

## `programs.ydotool.group` {#opt-programs.ydotool.group}

Group which users must be in to use `ydotool`.

*Type:* string

*Default:* `"ydotool"`

*Declared by:* [`nixos/modules/programs/ydotool.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ydotool.nix)

## `programs.yubikey-manager.enable` {#opt-programs.yubikey-manager.enable}

Whether to enable yubikey-manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/yubikey-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/yubikey-manager.nix)

## `programs.yubikey-manager.package` {#opt-programs.yubikey-manager.package}

The yubikey-manager package to use.

*Type:* package

*Default:* `pkgs.yubikey-manager`

*Declared by:* [`nixos/modules/programs/yubikey-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/yubikey-manager.nix)

## `programs.yubikey-touch-detector.enable` {#opt-programs.yubikey-touch-detector.enable}

Whether to enable yubikey-touch-detector.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/yubikey-touch-detector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/yubikey-touch-detector.nix)

## `programs.yubikey-touch-detector.libnotify` {#opt-programs.yubikey-touch-detector.libnotify}

If set to true, yubikey-touch-detctor will send notifications using libnotify

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/yubikey-touch-detector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/yubikey-touch-detector.nix)

## `programs.yubikey-touch-detector.unixSocket` {#opt-programs.yubikey-touch-detector.unixSocket}

If set to true, yubikey-touch-detector will send notifications to a unix socket

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/yubikey-touch-detector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/yubikey-touch-detector.nix)

## `programs.yubikey-touch-detector.verbose` {#opt-programs.yubikey-touch-detector.verbose}

Enables verbose logging

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/yubikey-touch-detector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/yubikey-touch-detector.nix)

## `programs.zmap.enable` {#opt-programs.zmap.enable}

Whether to enable ZMap, a network scanner designed for Internet-wide network surveys.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/zmap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zmap.nix)

## `programs.zoom-us.enable` {#opt-programs.zoom-us.enable}

Whether to enable zoom.us video conferencing application.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/zoom-us.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zoom-us.nix)

## `programs.zoom-us.package` {#opt-programs.zoom-us.package}

The zoom-us package to use.

*Type:* package

*Default:* `pkgs.zoom-us`

*Declared by:* [`nixos/modules/programs/zoom-us.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zoom-us.nix)

## `programs.zoxide.enable` {#opt-programs.zoxide.enable}

Whether to enable zoxide, a smarter cd command that learns your habits.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/zoxide.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zoxide.nix)

## `programs.zoxide.enableBashIntegration` {#opt-programs.zoxide.enableBashIntegration}

Whether to enable Bash integration.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/zoxide.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zoxide.nix)

## `programs.zoxide.enableFishIntegration` {#opt-programs.zoxide.enableFishIntegration}

Whether to enable Fish integration.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/zoxide.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zoxide.nix)

## `programs.zoxide.enableXonshIntegration` {#opt-programs.zoxide.enableXonshIntegration}

Whether to enable Xonsh integration.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/zoxide.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zoxide.nix)

## `programs.zoxide.enableZshIntegration` {#opt-programs.zoxide.enableZshIntegration}

Whether to enable Zsh integration.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/zoxide.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zoxide.nix)

## `programs.zoxide.flags` {#opt-programs.zoxide.flags}

List of flags for zoxide init

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--no-cmd"
  "--cmd j"
]
```

*Declared by:* [`nixos/modules/programs/zoxide.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zoxide.nix)

## `programs.zoxide.package` {#opt-programs.zoxide.package}

The zoxide package to use.

*Type:* package

*Default:* `pkgs.zoxide`

*Declared by:* [`nixos/modules/programs/zoxide.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zoxide.nix)

## `programs.zsh.autosuggestions.async` {#opt-programs.zsh.autosuggestions.async}

Whether to fetch suggestions asynchronously

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/programs/zsh/zsh-autosuggestions.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh-autosuggestions.nix)

## `programs.zsh.autosuggestions.enable` {#opt-programs.zsh.autosuggestions.enable}

Whether to enable zsh-autosuggestions.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/zsh/zsh-autosuggestions.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh-autosuggestions.nix)

## `programs.zsh.autosuggestions.extraConfig` {#opt-programs.zsh.autosuggestions.extraConfig}

Attribute set with additional configuration values

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  "ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE" = "20";
}
```

*Declared by:* [`nixos/modules/programs/zsh/zsh-autosuggestions.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh-autosuggestions.nix)

## `programs.zsh.autosuggestions.highlightStyle` {#opt-programs.zsh.autosuggestions.highlightStyle}

Highlight style for suggestions ({fore,back}ground color)

*Type:* string

*Default:* `"fg=8"`

*Example:* `"fg=cyan"`

*Declared by:* [`nixos/modules/programs/zsh/zsh-autosuggestions.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh-autosuggestions.nix)

## `programs.zsh.autosuggestions.strategy` {#opt-programs.zsh.autosuggestions.strategy}

`ZSH_AUTOSUGGEST_STRATEGY` is an array that specifies how suggestions should be generated.
The strategies in the array are tried successively until a suggestion is found.
There are currently three built-in strategies to choose from:

- `history`: Chooses the most recent match from history.
- `completion`: Chooses a suggestion based on what tab-completion would suggest. (requires `zpty` module)
- `match_prev_cmd`: Like `history`, but chooses the most recent match whose preceding history item matches
  the most recently executed command. Note that this strategy won't work as expected with ZSH options that
  don't preserve the history order such as `HIST_IGNORE_ALL_DUPS` or `HIST_EXPIRE_DUPS_FIRST`.

*Type:* list of (one of "history", "completion", "match\_prev\_cmd")

*Default:*

``` nix
[
  "history"
]
```

*Declared by:* [`nixos/modules/programs/zsh/zsh-autosuggestions.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh-autosuggestions.nix)

## `programs.zsh.compInitDumpFile` {#opt-programs.zsh.compInitDumpFile}

Path passed to `compinit` with the
`-d` option to set the completion dump file location.
If unset, `compinit` uses its default dump file.

*Type:* null or string

*Default:* `null`

*Example:* `"$XDG_CACHE_HOME/zsh/zcompdump"`

*Declared by:* [`nixos/modules/programs/zsh/zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh.nix)

## `programs.zsh.disableCompInitDumpFile` {#opt-programs.zsh.disableCompInitDumpFile}

Disable reading and writing the completion dump file
by passing the `-D` option to `compinit`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/zsh/zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh.nix)

## `programs.zsh.enable` {#opt-programs.zsh.enable}

Whether to configure zsh as an interactive shell. To enable zsh for
a particular user, use the `users.users.<name?>.shell`
option for that user. To enable zsh system-wide use the
[`users.defaultUserShell`](../../options/users/index.md#opt-users.defaultUserShell) option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/zsh/zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh.nix)

## `programs.zsh.enableBashCompletion` {#opt-programs.zsh.enableBashCompletion}

Enable compatibility with bash's programmable completion system.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/zsh/zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh.nix)

## `programs.zsh.enableCompletion` {#opt-programs.zsh.enableCompletion}

Enable zsh completion for all interactive zsh shells.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/zsh/zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh.nix)

## `programs.zsh.enableGlobalCompInit` {#opt-programs.zsh.enableGlobalCompInit}

Enable execution of compinit call for all interactive zsh shells.

This option can be disabled if the user wants to extend its
`fpath` and a custom `compinit`
call in the local config is required.

*Type:* boolean

*Default:* `config.programs.zsh.enableCompletion`

*Declared by:* [`nixos/modules/programs/zsh/zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh.nix)

## `programs.zsh.enableLsColors` {#opt-programs.zsh.enableLsColors}

Enable extra colors in directory listings (used by `ls` and `tree`).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/programs/zsh/zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh.nix)

## `programs.zsh.histFile` {#opt-programs.zsh.histFile}

Change history file.

*Type:* string

*Default:* `"$HOME/.zsh_history"`

*Declared by:* [`nixos/modules/programs/zsh/zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh.nix)

## `programs.zsh.histSize` {#opt-programs.zsh.histSize}

Change history size.

*Type:* signed integer

*Default:* `2000`

*Declared by:* [`nixos/modules/programs/zsh/zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh.nix)

## `programs.zsh.interactiveShellInit` {#opt-programs.zsh.interactiveShellInit}

Shell script code called during interactive zsh shell initialisation.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/programs/zsh/zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh.nix)

## `programs.zsh.loginShellInit` {#opt-programs.zsh.loginShellInit}

Shell script code called during zsh login shell initialisation.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/programs/zsh/zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh.nix)

## `programs.zsh.ohMyZsh.cacheDir` {#opt-programs.zsh.ohMyZsh.cacheDir}

Cache directory to be used by `oh-my-zsh`.
Without this option it would default to the read-only nix store.

*Type:* string

*Default:* `"$HOME/.cache/oh-my-zsh"`

*Declared by:* [`nixos/modules/programs/zsh/oh-my-zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/oh-my-zsh.nix)

## `programs.zsh.ohMyZsh.custom` {#opt-programs.zsh.ohMyZsh.custom}

Path to a custom oh-my-zsh package to override config of oh-my-zsh.
(Can't be used along with `customPkgs`).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/programs/zsh/oh-my-zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/oh-my-zsh.nix)

## `programs.zsh.ohMyZsh.customPkgs` {#opt-programs.zsh.ohMyZsh.customPkgs}

List of custom packages that should be loaded into `oh-my-zsh`.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/programs/zsh/oh-my-zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/oh-my-zsh.nix)

## `programs.zsh.ohMyZsh.enable` {#opt-programs.zsh.ohMyZsh.enable}

Enable oh-my-zsh.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/zsh/oh-my-zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/oh-my-zsh.nix)

## `programs.zsh.ohMyZsh.package` {#opt-programs.zsh.ohMyZsh.package}

The oh-my-zsh package to use.

*Type:* package

*Default:* `pkgs.oh-my-zsh`

*Declared by:* [`nixos/modules/programs/zsh/oh-my-zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/oh-my-zsh.nix)

## `programs.zsh.ohMyZsh.plugins` {#opt-programs.zsh.ohMyZsh.plugins}

List of oh-my-zsh plugins

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/programs/zsh/oh-my-zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/oh-my-zsh.nix)

## `programs.zsh.ohMyZsh.preLoaded` {#opt-programs.zsh.ohMyZsh.preLoaded}

Shell commands executed before the `oh-my-zsh` is loaded.
For example, to disable async git prompt write `zstyle ':omz:alpha:lib:git' async-prompt no` (more information [https://github.com/ohmyzsh/ohmyzsh?tab=readme-ov-file#async-git-prompt](https://github.com/ohmyzsh/ohmyzsh?tab=readme-ov-file#async-git-prompt))

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/programs/zsh/oh-my-zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/oh-my-zsh.nix)

## `programs.zsh.ohMyZsh.theme` {#opt-programs.zsh.ohMyZsh.theme}

Name of the theme to be used by oh-my-zsh.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/programs/zsh/oh-my-zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/oh-my-zsh.nix)

## `programs.zsh.package` {#opt-programs.zsh.package}

The zsh package to use.

*Type:* package

*Default:* `pkgs.zsh`

*Declared by:* [`nixos/modules/programs/zsh/zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh.nix)

## `programs.zsh.promptInit` {#opt-programs.zsh.promptInit}

Shell script code used to initialise the zsh prompt.

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  # Note that to manually override this in ~/.zshrc you should run `prompt off`
  # before setting your PS1 and etc. Otherwise this will likely to interact with
  # your ~/.zshrc configuration in unexpected ways as the default prompt sets
  # a lot of different prompt variables.
  autoload -U promptinit && promptinit && prompt suse && setopt prompt_sp
''
```

*Declared by:* [`nixos/modules/programs/zsh/zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh.nix)

## `programs.zsh.setOptions` {#opt-programs.zsh.setOptions}

Configure zsh options. See
`zshoptions(1)`.

*Type:* list of string

*Default:*

``` nix
[
  "HIST_IGNORE_DUPS"
  "SHARE_HISTORY"
  "HIST_FCNTL_LOCK"
]
```

*Example:*

``` nix
[
  "EXTENDED_HISTORY"
  "RM_STAR_WAIT"
]
```

*Declared by:* [`nixos/modules/programs/zsh/zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh.nix)

## `programs.zsh.shellAliases` {#opt-programs.zsh.shellAliases}

Set of aliases for zsh shell, which overrides [`environment.shellAliases`](../../options/environment/index.md#opt-environment.shellAliases).
See [`environment.shellAliases`](../../options/environment/index.md#opt-environment.shellAliases) for an option format description.

*Type:* attribute set of (null or string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/zsh/zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh.nix)

## `programs.zsh.shellInit` {#opt-programs.zsh.shellInit}

Shell script code called during zsh shell initialisation.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/programs/zsh/zsh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh.nix)

## `programs.zsh.syntaxHighlighting.enable` {#opt-programs.zsh.syntaxHighlighting.enable}

Whether to enable zsh-syntax-highlighting.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/zsh/zsh-syntax-highlighting.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh-syntax-highlighting.nix)

## `programs.zsh.syntaxHighlighting.highlighters` {#opt-programs.zsh.syntaxHighlighting.highlighters}

Specifies the highlighters to be used by zsh-syntax-highlighting.

The following defined options can be found here:
https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md

*Type:* list of (one of "main", "brackets", "pattern", "cursor", "regexp", "root", "line")

*Default:*

``` nix
[
  "main"
]
```

*Declared by:* [`nixos/modules/programs/zsh/zsh-syntax-highlighting.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh-syntax-highlighting.nix)

## `programs.zsh.syntaxHighlighting.patterns` {#opt-programs.zsh.syntaxHighlighting.patterns}

Specifies custom patterns to be highlighted by zsh-syntax-highlighting.

Please refer to the docs for more information about the usage:
https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/pattern.md

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  "rm -rf *" = "fg=white,bold,bg=red";
}
```

*Declared by:* [`nixos/modules/programs/zsh/zsh-syntax-highlighting.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh-syntax-highlighting.nix)

## `programs.zsh.syntaxHighlighting.styles` {#opt-programs.zsh.syntaxHighlighting.styles}

Specifies custom styles to be highlighted by zsh-syntax-highlighting.

Please refer to the docs for more information about the usage:
https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  "alias" = "fg=magenta,bold";
}
```

*Declared by:* [`nixos/modules/programs/zsh/zsh-syntax-highlighting.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh-syntax-highlighting.nix)

## `programs.zsh.vteIntegration` {#opt-programs.zsh.vteIntegration}

Whether to enable Zsh integration for VTE terminals.
This allows it to preserve the current directory of the shell
across terminals.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/vte.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/vte.nix)

## `programs.zsh.zsh-autoenv.enable` {#opt-programs.zsh.zsh-autoenv.enable}

Whether to enable zsh-autoenv.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/zsh/zsh-autoenv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh-autoenv.nix)

## `programs.zsh.zsh-autoenv.package` {#opt-programs.zsh.zsh-autoenv.package}

The zsh-autoenv package to use.

*Type:* package

*Default:* `pkgs.zsh-autoenv`

*Declared by:* [`nixos/modules/programs/zsh/zsh-autoenv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/zsh/zsh-autoenv.nix)
