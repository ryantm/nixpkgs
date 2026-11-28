# services (X) {#sec-options-services-x}

## `services.x2goserver.enable` {#opt-services.x2goserver.enable}

Enables the x2goserver module.
NOTE: This will create a good amount of symlinks in `/usr/local/bin`

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/x2goserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/x2goserver.nix)

## `services.x2goserver.nxagentDefaultOptions` {#opt-services.x2goserver.nxagentDefaultOptions}

List of default nx agent options.

*Type:* list of string

*Default:*

``` nix
[
  "-extension GLX"
  "-nolisten tcp"
]
```

*Declared by:* [`nixos/modules/services/networking/x2goserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/x2goserver.nix)

## `services.x2goserver.package` {#opt-services.x2goserver.package}

The x2goserver package to use.

*Type:* package

*Default:* `pkgs.x2goserver`

*Declared by:* [`nixos/modules/services/networking/x2goserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/x2goserver.nix)

## `services.x2goserver.settings` {#opt-services.x2goserver.settings}

x2goserver.conf ini configuration as nix attributes. See
`x2goserver.conf(5)` for details

*Type:* attribute set of (attribute set)

*Default:* `{ }`

*Example:*

``` nix
{
  superenicer = {
    "enable" = "yes";
    "idle-nice-level" = 19;
  };
  telekinesis = { "enable" = "no"; };
}
```

*Declared by:* [`nixos/modules/services/networking/x2goserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/x2goserver.nix)

## `services.x2goserver.superenicer.enable` {#opt-services.x2goserver.superenicer.enable}

Enables the SupeReNicer code in x2gocleansessions, this will renice
suspended sessions to nice level 19 and renice them to level 0 if the
session becomes marked as running again

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/x2goserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/x2goserver.nix)

## `services.xandikos.address` {#opt-services.xandikos.address}

The IP address on which Xandikos will listen.
By default listens on localhost.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/networking/xandikos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xandikos.nix)

## `services.xandikos.enable` {#opt-services.xandikos.enable}

Whether to enable Xandikos CalDAV and CardDAV server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/xandikos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xandikos.nix)

## `services.xandikos.extraOptions` {#opt-services.xandikos.extraOptions}

Extra command line arguments to pass to xandikos.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[ "--autocreate"
  "--defaults"
  "--current-user-principal user"
  "--dump-dav-xml"
]
```

*Declared by:* [`nixos/modules/services/networking/xandikos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xandikos.nix)

## `services.xandikos.nginx` {#opt-services.xandikos.nginx}

Configuration for nginx reverse proxy.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/xandikos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xandikos.nix)

## `services.xandikos.nginx.enable` {#opt-services.xandikos.nginx.enable}

Configure the nginx reverse proxy settings.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/xandikos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xandikos.nix)

## `services.xandikos.nginx.hostName` {#opt-services.xandikos.nginx.hostName}

The hostname use to setup the virtualhost configuration

*Type:* string

*Declared by:* [`nixos/modules/services/networking/xandikos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xandikos.nix)

## `services.xandikos.package` {#opt-services.xandikos.package}

The xandikos package to use.

*Type:* package

*Default:* `pkgs.xandikos`

*Declared by:* [`nixos/modules/services/networking/xandikos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xandikos.nix)

## `services.xandikos.port` {#opt-services.xandikos.port}

The port of the Xandikos web application

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/networking/xandikos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xandikos.nix)

## `services.xandikos.routePrefix` {#opt-services.xandikos.routePrefix}

Path to Xandikos.
Useful when Xandikos is behind a reverse proxy.

*Type:* string

*Default:* `"/"`

*Declared by:* [`nixos/modules/services/networking/xandikos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xandikos.nix)

## `services.xbanish.arguments` {#opt-services.xbanish.arguments}

Arguments to pass to xbanish command

*Type:* string

*Default:* `""`

*Example:* `"-d -i shift"`

*Declared by:* [`nixos/modules/services/x11/xbanish.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xbanish.nix)

## `services.xbanish.enable` {#opt-services.xbanish.enable}

Whether to enable xbanish.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/xbanish.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xbanish.nix)

## `services.xe-guest-utilities.enable` {#opt-services.xe-guest-utilities.enable}

Whether to enable the XenServer guest utilities daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/xe-guest-utilities.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/xe-guest-utilities.nix)

## `services.xfs.enable` {#opt-services.xfs.enable}

Whether to enable the X Font Server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/xfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xfs.nix)

## `services.xinetd.enable` {#opt-services.xinetd.enable}

Whether to enable the xinetd super-server daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/xinetd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xinetd.nix)

## `services.xinetd.extraDefaults` {#opt-services.xinetd.extraDefaults}

Additional configuration lines added to the default section of xinetd's configuration.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/xinetd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xinetd.nix)

## `services.xinetd.services` {#opt-services.xinetd.services}

A list of services provided by xinetd.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/xinetd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xinetd.nix)

## `services.xinetd.services.*.extraConfig` {#opt-services.xinetd.services._.extraConfig}

Extra configuration-lines added to the section of the service.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/xinetd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xinetd.nix)

## `services.xinetd.services.*.flags` {#opt-services.xinetd.services._.flags}

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/xinetd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xinetd.nix)

## `services.xinetd.services.*.name` {#opt-services.xinetd.services._.name}

Name of the service.

*Type:* string

*Example:* `"login"`

*Declared by:* [`nixos/modules/services/networking/xinetd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xinetd.nix)

## `services.xinetd.services.*.port` {#opt-services.xinetd.services._.port}

Port number of the service.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `0`

*Example:* `123`

*Declared by:* [`nixos/modules/services/networking/xinetd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xinetd.nix)

## `services.xinetd.services.*.protocol` {#opt-services.xinetd.services._.protocol}

Protocol of the service.  Usually `tcp` or `udp`.

*Type:* string

*Default:* `"tcp"`

*Declared by:* [`nixos/modules/services/networking/xinetd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xinetd.nix)

## `services.xinetd.services.*.server` {#opt-services.xinetd.services._.server}

Path of the program that implements the service.

*Type:* string

*Example:* `"/foo/bin/ftpd"`

*Declared by:* [`nixos/modules/services/networking/xinetd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xinetd.nix)

## `services.xinetd.services.*.serverArgs` {#opt-services.xinetd.services._.serverArgs}

Command-line arguments for the server program.

*Type:* strings concatenated with " "

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/xinetd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xinetd.nix)

## `services.xinetd.services.*.unlisted` {#opt-services.xinetd.services._.unlisted}

Whether this server is listed in
`/etc/services`.  If so, the port
number can be omitted.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/xinetd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xinetd.nix)

## `services.xinetd.services.*.user` {#opt-services.xinetd.services._.user}

User account for the service

*Type:* string

*Default:* `"nobody"`

*Declared by:* [`nixos/modules/services/networking/xinetd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xinetd.nix)

## `services.xl2tpd.clientIpRange` {#opt-services.xl2tpd.clientIpRange}

The range from which client IPs are drawn.

*Type:* string

*Default:* `"10.125.125.2-11"`

*Declared by:* [`nixos/modules/services/networking/xl2tpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xl2tpd.nix)

## `services.xl2tpd.enable` {#opt-services.xl2tpd.enable}

Whether to enable xl2tpd, the Layer 2 Tunnelling Protocol Daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/xl2tpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xl2tpd.nix)

## `services.xl2tpd.extraPppdOptions` {#opt-services.xl2tpd.extraPppdOptions}

Adds extra lines to the pppd options file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  ms-dns 8.8.8.8
  ms-dns 8.8.4.4
''
```

*Declared by:* [`nixos/modules/services/networking/xl2tpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xl2tpd.nix)

## `services.xl2tpd.extraXl2tpOptions` {#opt-services.xl2tpd.extraXl2tpOptions}

Adds extra lines to the xl2tpd configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/xl2tpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xl2tpd.nix)

## `services.xl2tpd.serverIp` {#opt-services.xl2tpd.serverIp}

The server-side IP address.

*Type:* string

*Default:* `"10.125.125.1"`

*Declared by:* [`nixos/modules/services/networking/xl2tpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xl2tpd.nix)

## `services.xmrig.enable` {#opt-services.xmrig.enable}

Whether to enable XMRig Mining Software.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/xmrig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/xmrig.nix)

## `services.xmrig.package` {#opt-services.xmrig.package}

The xmrig package to use.

*Type:* package

*Default:* `pkgs.xmrig`

*Example:* `xmrig-mo`

*Declared by:* [`nixos/modules/services/misc/xmrig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/xmrig.nix)

## `services.xmrig.settings` {#opt-services.xmrig.settings}

XMRig configuration. Refer to
[https://xmrig.com/docs/miner/config](https://xmrig.com/docs/miner/config)
for details on supported values.

*Type:* JSON value

*Default:* `{ }`

*Example:*

``` nix
{
  autosave = true;
  cpu = true;
  opencl = false;
  cuda = false;
  pools = [
    {
      url = "pool.supportxmr.com:443";
      user = "your-wallet";
      keepalive = true;
      tls = true;
    }
  ]
}
```

*Declared by:* [`nixos/modules/services/misc/xmrig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/xmrig.nix)

## `services.xonotic.appendConfig` {#opt-services.xonotic.appendConfig}

Literal text to insert at the end of `server.cfg`.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/services/games/xonotic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/xonotic.nix)

## `services.xonotic.dataDir` {#opt-services.xonotic.dataDir}

Data directory.

*Type:* absolute path

*Default:* `"/var/lib/xonotic"`

*Read only*

*Declared by:* [`nixos/modules/services/games/xonotic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/xonotic.nix)

## `services.xonotic.enable` {#opt-services.xonotic.enable}

Whether to enable Xonotic dedicated server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/games/xonotic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/xonotic.nix)

## `services.xonotic.openFirewall` {#opt-services.xonotic.openFirewall}

Open the firewall for TCP and UDP on the specified port.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/xonotic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/xonotic.nix)

## `services.xonotic.package` {#opt-services.xonotic.package}

The xonotic-dedicated package to use.

*Type:* package

*Default:* `pkgs.xonotic-dedicated`

*Declared by:* [`nixos/modules/services/games/xonotic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/xonotic.nix)

## `services.xonotic.prependConfig` {#opt-services.xonotic.prependConfig}

Literal text to insert at the start of `server.cfg`.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/services/games/xonotic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/xonotic.nix)

## `services.xonotic.settings` {#opt-services.xonotic.settings}

Generates the `server.cfg` file. Refer to [upstream's example](https://gitlab.com/xonotic/xonotic/-/blob/master/server/server.cfg) for
details.

*Type:* open submodule of attribute set of ((optionally newline-terminated) single-line string or signed integer or floating point number or non-empty (list of ((optionally newline-terminated) single-line string or signed integer or floating point number)))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/games/xonotic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/xonotic.nix)

## `services.xonotic.settings.hostname` {#opt-services.xonotic.settings.hostname}

The name that will appear in the server list. `$g_xonoticversion`
gets replaced with the current version.

*Type:* (optionally newline-terminated) single-line string

*Default:* `"Xonotic $g_xonoticversion Server"`

*Declared by:* [`nixos/modules/services/games/xonotic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/xonotic.nix)

## `services.xonotic.settings.maxplayers` {#opt-services.xonotic.settings.maxplayers}

Number of player slots on the server, including spectators.

*Type:* signed integer

*Default:* `16`

*Declared by:* [`nixos/modules/services/games/xonotic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/xonotic.nix)

## `services.xonotic.settings.net_address` {#opt-services.xonotic.settings.net_address}

The address Xonotic will listen on.

*Type:* (optionally newline-terminated) single-line string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/games/xonotic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/xonotic.nix)

## `services.xonotic.settings.port` {#opt-services.xonotic.settings.port}

The port Xonotic will listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `26000`

*Declared by:* [`nixos/modules/services/games/xonotic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/xonotic.nix)

## `services.xonotic.settings.sv_motd` {#opt-services.xonotic.settings.sv_motd}

Text displayed when players join the server.

*Type:* (optionally newline-terminated) single-line string

*Default:* `""`

*Declared by:* [`nixos/modules/services/games/xonotic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/xonotic.nix)

## `services.xonotic.settings.sv_public` {#opt-services.xonotic.settings.sv_public}

Controls whether the server will be publicly listed.

*Type:* signed integer

*Default:* `0`

*Example:*

``` nix
[
  -1
  1
]
```

*Declared by:* [`nixos/modules/services/games/xonotic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/xonotic.nix)

## `services.xonotic.settings.sv_termsofservice_url` {#opt-services.xonotic.settings.sv_termsofservice_url}

URL for the Terms of Service for playing on your server.

*Type:* (optionally newline-terminated) single-line string

*Default:* `""`

*Declared by:* [`nixos/modules/services/games/xonotic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/xonotic.nix)

## `services.xray.enable` {#opt-services.xray.enable}

Whether to run xray server.

Either `settingsFile` or `settings` must be specified.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/xray.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xray.nix)

## `services.xray.package` {#opt-services.xray.package}

The xray package to use.

*Type:* package

*Default:* `pkgs.xray`

*Declared by:* [`nixos/modules/services/networking/xray.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xray.nix)

## `services.xray.settings` {#opt-services.xray.settings}

The configuration object.

Either `settingsFile` or `settings` must be specified.

See [https://xtls.github.io/en/config/](https://xtls.github.io/en/config/).

*Type:* null or (attribute set of unspecified value)

*Default:* `null`

*Example:*

``` nix
{
  inbounds = [
    {
      listen = "127.0.0.1";
      port = 1080;
      protocol = "http";
    }
  ];
  outbounds = [
    {
      protocol = "freedom";
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/networking/xray.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xray.nix)

## `services.xray.settingsFile` {#opt-services.xray.settingsFile}

The absolute path to the configuration file.

xray selects the parser from the file extension, so files ending in
`.json`, `.yaml`, `.yml` or `.toml` are read as JSON, YAML or TOML
respectively. The fallback is JSON. When the file comes from a
secret manager, make sure the secret's path keeps the extension.

Either `settingsFile` or `settings` must be specified.

See [https://xtls.github.io/en/config/](https://xtls.github.io/en/config/).

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/etc/xray/config.json"`

*Declared by:* [`nixos/modules/services/networking/xray.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xray.nix)

## `services.xrdp.audio.enable` {#opt-services.xrdp.audio.enable}

Whether to enable audio support for xrdp sessions. So far it only works with PulseAudio sessions on the server side. No PipeWire support yet.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/xrdp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xrdp.nix)

## `services.xrdp.audio.package` {#opt-services.xrdp.audio.package}

The pulseaudio-module-xrdp package to use.

*Type:* package

*Default:* `pkgs.pulseaudio-module-xrdp`

*Declared by:* [`nixos/modules/services/networking/xrdp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xrdp.nix)

## `services.xrdp.defaultWindowManager` {#opt-services.xrdp.defaultWindowManager}

The script to run when user log in, usually a window manager, e.g. "icewm", "xfce4-session"
This is per-user overridable, if file ~/startwm.sh exists it will be used instead.

*Type:* string

*Default:* `"xterm"`

*Example:* `"xfce4-session"`

*Declared by:* [`nixos/modules/services/networking/xrdp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xrdp.nix)

## `services.xrdp.enable` {#opt-services.xrdp.enable}

Whether to enable xrdp, the Remote Desktop Protocol server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/xrdp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xrdp.nix)

## `services.xrdp.extraConfDirCommands` {#opt-services.xrdp.extraConfDirCommands}

Extra commands to run on the default confDir derivation.

*Type:* string

*Default:* `""`

*Example:*

``` nix
''
  substituteInPlace $out/sesman.ini \
    --replace-fail LogLevel=INFO LogLevel=DEBUG \
    --replace-fail LogFile=/dev/null LogFile=/var/log/xrdp.log
''
```

*Declared by:* [`nixos/modules/services/networking/xrdp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xrdp.nix)

## `services.xrdp.openFirewall` {#opt-services.xrdp.openFirewall}

Whether to open the firewall for the specified RDP port.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/xrdp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xrdp.nix)

## `services.xrdp.package` {#opt-services.xrdp.package}

The xrdp package to use.

*Type:* package

*Default:* `pkgs.xrdp`

*Declared by:* [`nixos/modules/services/networking/xrdp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xrdp.nix)

## `services.xrdp.port` {#opt-services.xrdp.port}

Specifies on which port the xrdp daemon listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3389`

*Declared by:* [`nixos/modules/services/networking/xrdp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xrdp.nix)

## `services.xrdp.sslCert` {#opt-services.xrdp.sslCert}

ssl certificate path
A self-signed certificate will be generated if file not exists.

*Type:* string

*Default:* `"/etc/xrdp/cert.pem"`

*Example:* `"/path/to/your/cert.pem"`

*Declared by:* [`nixos/modules/services/networking/xrdp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xrdp.nix)

## `services.xrdp.sslKey` {#opt-services.xrdp.sslKey}

ssl private key path
A self-signed certificate will be generated if file not exists.

*Type:* string

*Default:* `"/etc/xrdp/key.pem"`

*Example:* `"/path/to/your/key.pem"`

*Declared by:* [`nixos/modules/services/networking/xrdp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/xrdp.nix)

## `services.xscreensaver.enable` {#opt-services.xscreensaver.enable}

Whether to enable xscreensaver user service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/xscreensaver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xscreensaver.nix)

## `services.xscreensaver.hooks` {#opt-services.xscreensaver.hooks}

An attrset of events and commands to run upon each event.
Refer to [https://www.jwz.org/xscreensaver/man3.html](https://www.jwz.org/xscreensaver/man3.html) for supported events.

*Type:* attribute set of strings concatenated with "\\n"

*Default:* `{ }`

*Example:*

``` nix
# Reconfigure autorandr on screen wake up
{
  "RUN" = "${lib.getExe pkgs.autorandr} --change --ignore-lid";
};
```

*Declared by:* [`nixos/modules/services/x11/xscreensaver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xscreensaver.nix)

## `services.xscreensaver.package` {#opt-services.xscreensaver.package}

The xscreensaver package to use.

*Type:* package

*Default:* `pkgs.xscreensaver`

*Declared by:* [`nixos/modules/services/x11/xscreensaver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xscreensaver.nix)

## `services.xserver.autoRepeatDelay` {#opt-services.xserver.autoRepeatDelay}

Sets the autorepeat delay (length of time in milliseconds that a key must be depressed before autorepeat starts).

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.autoRepeatInterval` {#opt-services.xserver.autoRepeatInterval}

Sets the autorepeat interval (length of time in milliseconds that should elapse between autorepeat-generated keystrokes).

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.autorun` {#opt-services.xserver.autorun}

Whether to start the X server automatically.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.config` {#opt-services.xserver.config}

The contents of the configuration file of the X server
(`xorg.conf`).

This option is set by multiple modules, and the configs are
concatenated together.

In Xorg configs the last config entries take precedence,
so you may want to use `lib.mkAfter` on this option
to override NixOS's defaults.

*Type:* strings concatenated with "\\n"

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.defaultDepth` {#opt-services.xserver.defaultDepth}

Default colour depth.

*Type:* signed integer

*Default:* `0`

*Example:* `8`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.desktopManager.cde.enable` {#opt-services.xserver.desktopManager.cde.enable}

Whether to enable Common Desktop Environment.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/cde.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/cde.nix)

## `services.xserver.desktopManager.cde.extraPackages` {#opt-services.xserver.desktopManager.cde.extraPackages}

Extra packages to be installed system wide.

*Type:* list of package

*Default:*

``` nix
with pkgs; [
  xclock bitmap xlsfonts xfd xrefresh xload xwininfo xdpyinfo xwd xwud
]
```

*Declared by:* [`nixos/modules/services/x11/desktop-managers/cde.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/cde.nix)

## `services.xserver.desktopManager.cinnamon.enable` {#opt-services.xserver.desktopManager.cinnamon.enable}

Whether to enable the cinnamon desktop manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/cinnamon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/cinnamon.nix)

## `services.xserver.desktopManager.cinnamon.extraGSettingsOverridePackages` {#opt-services.xserver.desktopManager.cinnamon.extraGSettingsOverridePackages}

List of packages for which gsettings are overridden.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/cinnamon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/cinnamon.nix)

## `services.xserver.desktopManager.cinnamon.extraGSettingsOverrides` {#opt-services.xserver.desktopManager.cinnamon.extraGSettingsOverrides}

Additional gsettings overrides.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/cinnamon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/cinnamon.nix)

## `services.xserver.desktopManager.cinnamon.sessionPath` {#opt-services.xserver.desktopManager.cinnamon.sessionPath}

Additional list of packages to be added to the session search path.
Useful for GSettings-conditional autostart.

Note that this should be a last resort; patching the package is preferred (see GPaste).

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.gpaste ]`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/cinnamon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/cinnamon.nix)

## `services.xserver.desktopManager.enlightenment.enable` {#opt-services.xserver.desktopManager.enlightenment.enable}

Enable the Enlightenment desktop environment.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/enlightenment.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/enlightenment.nix)

## `services.xserver.desktopManager.kodi.enable` {#opt-services.xserver.desktopManager.kodi.enable}

Enable the kodi multimedia center.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/kodi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/kodi.nix)

## `services.xserver.desktopManager.kodi.package` {#opt-services.xserver.desktopManager.kodi.package}

The kodi package to use.

*Type:* package

*Default:* `pkgs.kodi`

*Example:* `kodi.withPackages (p: with p; [ jellyfin pvr-iptvsimple vfs-sftp ])`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/kodi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/kodi.nix)

## `services.xserver.desktopManager.lumina.enable` {#opt-services.xserver.desktopManager.lumina.enable}

Enable the Lumina desktop manager

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/lumina.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/lumina.nix)

## `services.xserver.desktopManager.lxqt.enable` {#opt-services.xserver.desktopManager.lxqt.enable}

Whether to enable the LXQt desktop manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/lxqt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/lxqt.nix)

## `services.xserver.desktopManager.lxqt.extraPackages` {#opt-services.xserver.desktopManager.lxqt.extraPackages}

Extra packages to be installed system wide.

*Type:* list of package

*Default:* `[ ]`

*Example:* `with pkgs; [ xscreensaver ]`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/lxqt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/lxqt.nix)

## `services.xserver.desktopManager.lxqt.iconThemePackage` {#opt-services.xserver.desktopManager.lxqt.iconThemePackage}

The package that provides a default icon theme.

*Type:* package

*Default:* `pkgs.kdePackages.breeze-icons`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/lxqt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/lxqt.nix)

## `services.xserver.desktopManager.mate.debug` {#opt-services.xserver.desktopManager.mate.debug}

Whether to enable mate-session debug messages.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/mate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/mate.nix)

## `services.xserver.desktopManager.mate.enable` {#opt-services.xserver.desktopManager.mate.enable}

Enable the MATE desktop environment

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/mate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/mate.nix)

## `services.xserver.desktopManager.mate.enableWaylandSession` {#opt-services.xserver.desktopManager.mate.enableWaylandSession}

Whether to enable MATE Wayland session.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/mate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/mate.nix)

## `services.xserver.desktopManager.mate.extraCajaExtensions` {#opt-services.xserver.desktopManager.mate.extraCajaExtensions}

Extra extensions to add to caja.

*Type:* list of package

*Default:* `[ ]`

*Example:* `with pkgs; [ caja-extensions ]`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/mate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/mate.nix)

## `services.xserver.desktopManager.mate.extraPanelApplets` {#opt-services.xserver.desktopManager.mate.extraPanelApplets}

Extra applets to add to mate-panel.

*Type:* list of package

*Default:* `[ ]`

*Example:* `with pkgs; [ mate-applets ]`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/mate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/mate.nix)

## `services.xserver.desktopManager.retroarch.enable` {#opt-services.xserver.desktopManager.retroarch.enable}

Whether to enable RetroArch.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/retroarch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/retroarch.nix)

## `services.xserver.desktopManager.retroarch.extraArgs` {#opt-services.xserver.desktopManager.retroarch.extraArgs}

Extra arguments to pass to RetroArch.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--verbose"
  "--host"
]
```

*Declared by:* [`nixos/modules/services/x11/desktop-managers/retroarch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/retroarch.nix)

## `services.xserver.desktopManager.retroarch.package` {#opt-services.xserver.desktopManager.retroarch.package}

The retroarch package to use.

*Type:* package

*Default:* `pkgs.retroarch`

*Example:* `retroarch-full`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/retroarch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/retroarch.nix)

## `services.xserver.desktopManager.runXdgAutostartIfNone` {#opt-services.xserver.desktopManager.runXdgAutostartIfNone}

Whether to run XDG autostart files for sessions without a desktop manager
(with only a window manager), these sessions usually don't handle XDG
autostart files by default.

Some services like `i18n.inputMethod` and
`service.earlyoom` use XDG autostart files to start.
If this option is not set to `true` and you are using
a window manager without a desktop manager, you need to manually start
them or running `dex` somewhere.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/none.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/none.nix)

## `services.xserver.desktopManager.surf-display.defaultWwwUri` {#opt-services.xserver.desktopManager.surf-display.defaultWwwUri}

Default URI to display.

*Type:* string

*Default:* `"${pkgs.surf-display}/share/surf-display/empty-page.html"`

*Example:* `"https://www.example.com/"`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/surf-display.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/surf-display.nix)

## `services.xserver.desktopManager.surf-display.enable` {#opt-services.xserver.desktopManager.surf-display.enable}

Whether to enable surf-display as a kiosk browser session.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/surf-display.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/surf-display.nix)

## `services.xserver.desktopManager.surf-display.extraConfig` {#opt-services.xserver.desktopManager.surf-display.extraConfig}

Extra configuration options to append to `/etc/default/surf-display`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  # Enforce fixed resolution for all displays (default: not set):
  DEFAULT_RESOLUTION="1920x1080"
  
  # HTTP proxy URL, if needed (default: not set).
  HTTP_PROXY_URL="http://webcache:3128"
  
  # Configure individual display screens with host specific parameters:
  DISPLAYS['display-host-0']="www_uri=https://www.displayserver.comany.net/display-1/index.html"
  DISPLAYS['display-host-1']="www_uri=https://www.displayserver.comany.net/display-2/index.html"
  DISPLAYS['display-host-2']="www_uri=https://www.displayserver.comany.net/display-3/index.html|res=1920x1280"
  DISPLAYS['display-host-3']="www_uri=https://www.displayserver.comany.net/display-4/index.html"|res=1280x1024"
  DISPLAYS['display-host-local-file']="www_uri=file:///usr/share/doc/surf-display/empty-page.html"
''
```

*Declared by:* [`nixos/modules/services/x11/desktop-managers/surf-display.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/surf-display.nix)

## `services.xserver.desktopManager.surf-display.hideIdlePointer` {#opt-services.xserver.desktopManager.surf-display.hideIdlePointer}

Hide idle mouse pointer.

*Type:* string

*Default:* `"yes"`

*Example:* `"no"`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/surf-display.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/surf-display.nix)

## `services.xserver.desktopManager.surf-display.inactivityInterval` {#opt-services.xserver.desktopManager.surf-display.inactivityInterval}

Setting for internal inactivity timer to restart surf-display if the
user goes inactive/idle to get a fresh session for the next user of
the kiosk.

If this value is set to zero, the whole feature of restarting due to
inactivity is disabled.

*Type:* signed integer

*Default:* `300`

*Example:* `0`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/surf-display.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/surf-display.nix)

## `services.xserver.desktopManager.surf-display.pointerButtonMap` {#opt-services.xserver.desktopManager.surf-display.pointerButtonMap}

Disable right and middle pointer device click in browser sessions
while keeping scrolling wheels' functionality intact. See pointer
subcommand on `man xmodmap` for details.

*Type:* string

*Default:* `"1 0 0 4 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0"`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/surf-display.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/surf-display.nix)

## `services.xserver.desktopManager.surf-display.screensaverSettings` {#opt-services.xserver.desktopManager.surf-display.screensaverSettings}

Screensaver settings, see `man 1 xset` for possible options.

*Type:* strings concatenated with " "

*Default:* `""`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/surf-display.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/surf-display.nix)

## `services.xserver.desktopManager.wallpaper.combineScreens` {#opt-services.xserver.desktopManager.wallpaper.combineScreens}

When set to `true` the wallpaper will stretch across all screens.
When set to `false` the wallpaper is duplicated to all screens.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/default.nix)

## `services.xserver.desktopManager.wallpaper.enable` {#opt-services.xserver.desktopManager.wallpaper.enable}

The file `~/.background-image` is used as a background image.
The `mode` option specifies the placement of this image onto your desktop.
To disable this, set this option to `false`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/default.nix)

## `services.xserver.desktopManager.wallpaper.mode` {#opt-services.xserver.desktopManager.wallpaper.mode}

Possible values:
`center`: Center the image on the background. If it is too small, it will be surrounded by a black border.
`fill`: Like `scale`, but preserves aspect ratio by zooming the image until it fits. Either a horizontal or a vertical part of the image will be cut off.
`max`: Like `fill`, but scale the image to the maximum size that fits the screen with black borders on one side.
`scale`: Fit the file into the background without repeating it, cutting off stuff or using borders. But the aspect ratio is not preserved either.
`tile`: Tile (repeat) the image in case it is too small for the screen.

*Type:* one of "center", "fill", "max", "scale", "tile"

*Default:* `"scale"`

*Example:* `"fill"`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/default.nix)

## `services.xserver.desktopManager.xfce.enable` {#opt-services.xserver.desktopManager.xfce.enable}

Enable the Xfce desktop environment.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/xfce.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/xfce.nix)

## `services.xserver.desktopManager.xfce.enableScreensaver` {#opt-services.xserver.desktopManager.xfce.enableScreensaver}

Enable the XFCE screensaver.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/xfce.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/xfce.nix)

## `services.xserver.desktopManager.xfce.enableWaylandSession` {#opt-services.xserver.desktopManager.xfce.enableWaylandSession}

Whether to enable the experimental Xfce Wayland session.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/xfce.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/xfce.nix)

## `services.xserver.desktopManager.xfce.enableXfwm` {#opt-services.xserver.desktopManager.xfce.enableXfwm}

Enable the XFWM (default) window manager.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/xfce.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/xfce.nix)

## `services.xserver.desktopManager.xfce.noDesktop` {#opt-services.xserver.desktopManager.xfce.noDesktop}

Don't install XFCE desktop components (xfdesktop and panel).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/xfce.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/xfce.nix)

## `services.xserver.desktopManager.xfce.waylandSessionCompositor` {#opt-services.xserver.desktopManager.xfce.waylandSessionCompositor}

Command line to run a Wayland compositor, defaults to `labwc --startup`
if not specified. Note that `xfce4-session` will be passed to it as an
argument, see `startxfce4 --help` for details.

Some compositors do not have an option equivalent to labwc's `--startup`
and you might have to add xfce4-session somewhere in their configurations.

*Type:* string

*Default:* `""`

*Example:* `"wayfire"`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/xfce.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/xfce.nix)

## `services.xserver.desktopManager.xterm.enable` {#opt-services.xserver.desktopManager.xterm.enable}

Enable a xterm terminal as a desktop manager.

*Type:* boolean

*Default:* `versionOlder config.system.stateVersion "19.09" && config.services.xserver.enable;`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/xterm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/xterm.nix)

## `services.xserver.deviceSection` {#opt-services.xserver.deviceSection}

Contents of the first Device section of the X server configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"VideoRAM 131072"`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.digimend.enable` {#opt-services.xserver.digimend.enable}

Whether to enable the digimend drivers for Huion/XP-Pen/etc. tablets.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/hardware/digimend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/hardware/digimend.nix)

## `services.xserver.display` {#opt-services.xserver.display}

Display number for the X server.

*Type:* null or signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.displayManager.lightdm.autoLogin.timeout` {#opt-services.xserver.displayManager.lightdm.autoLogin.timeout}

Show the greeter for this many seconds before automatic login occurs.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm.nix)

## `services.xserver.displayManager.lightdm.background` {#opt-services.xserver.displayManager.lightdm.background}

The background image or color to use.

*Type:* absolute path or string matching the pattern ^#\[0-9A-Fa-f\]{6}$

*Default:* `pkgs.nixos-artwork.wallpapers.simple-dark-gray-bottom.gnomeFilePath`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm.nix)

## `services.xserver.displayManager.lightdm.enable` {#opt-services.xserver.displayManager.lightdm.enable}

Whether to enable lightdm as the display manager.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm.nix)

## `services.xserver.displayManager.lightdm.extraConfig` {#opt-services.xserver.displayManager.lightdm.extraConfig}

Extra lines to append to LightDM section.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  user-authority-in-system-dir = true
''
```

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm.nix)

## `services.xserver.displayManager.lightdm.extraSeatDefaults` {#opt-services.xserver.displayManager.lightdm.extraSeatDefaults}

Extra lines to append to SeatDefaults section.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  greeter-show-manual-login=true
''
```

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm.nix)

## `services.xserver.displayManager.lightdm.greeter.enable` {#opt-services.xserver.displayManager.lightdm.greeter.enable}

If set to false, run lightdm in greeterless mode. This only works if autologin
is enabled and autoLogin.timeout is zero.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm.nix)

## `services.xserver.displayManager.lightdm.greeter.name` {#opt-services.xserver.displayManager.lightdm.greeter.name}

The name of a .desktop file in the directory specified
in the 'package' option.

*Type:* string

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm.nix)

## `services.xserver.displayManager.lightdm.greeter.package` {#opt-services.xserver.displayManager.lightdm.greeter.package}

The LightDM greeter to login via. The package should be a directory
containing a .desktop file matching the name in the 'name' option.

*Type:* package

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm.nix)

## `services.xserver.displayManager.lightdm.greeters.gtk.clock-format` {#opt-services.xserver.displayManager.lightdm.greeters.gtk.clock-format}

Clock format string (as expected by strftime, e.g. "%H:%M")
to use with the lightdm gtk greeter panel.

If set to null the default clock format is used.

*Type:* null or string

*Default:* `null`

*Example:* `"%F"`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/gtk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/gtk.nix)

## `services.xserver.displayManager.lightdm.greeters.gtk.cursorTheme.name` {#opt-services.xserver.displayManager.lightdm.greeters.gtk.cursorTheme.name}

Name of the cursor theme to use for the lightdm-gtk-greeter.

*Type:* string

*Default:* `"Adwaita"`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/gtk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/gtk.nix)

## `services.xserver.displayManager.lightdm.greeters.gtk.cursorTheme.package` {#opt-services.xserver.displayManager.lightdm.greeters.gtk.cursorTheme.package}

The adwaita-icon-theme package to use.

*Type:* package

*Default:* `pkgs.adwaita-icon-theme`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/gtk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/gtk.nix)

## `services.xserver.displayManager.lightdm.greeters.gtk.cursorTheme.size` {#opt-services.xserver.displayManager.lightdm.greeters.gtk.cursorTheme.size}

Size of the cursor theme to use for the lightdm-gtk-greeter.

*Type:* signed integer

*Default:* `16`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/gtk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/gtk.nix)

## `services.xserver.displayManager.lightdm.greeters.gtk.enable` {#opt-services.xserver.displayManager.lightdm.greeters.gtk.enable}

Whether to enable lightdm-gtk-greeter as the lightdm greeter.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/gtk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/gtk.nix)

## `services.xserver.displayManager.lightdm.greeters.gtk.extraConfig` {#opt-services.xserver.displayManager.lightdm.greeters.gtk.extraConfig}

Extra configuration that should be put in the lightdm-gtk-greeter.conf
configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/gtk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/gtk.nix)

## `services.xserver.displayManager.lightdm.greeters.gtk.iconTheme.name` {#opt-services.xserver.displayManager.lightdm.greeters.gtk.iconTheme.name}

Name of the icon theme to use for the lightdm-gtk-greeter.

*Type:* string

*Default:* `"Adwaita"`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/gtk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/gtk.nix)

## `services.xserver.displayManager.lightdm.greeters.gtk.iconTheme.package` {#opt-services.xserver.displayManager.lightdm.greeters.gtk.iconTheme.package}

The adwaita-icon-theme package to use.

*Type:* package

*Default:* `pkgs.adwaita-icon-theme`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/gtk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/gtk.nix)

## `services.xserver.displayManager.lightdm.greeters.gtk.indicators` {#opt-services.xserver.displayManager.lightdm.greeters.gtk.indicators}

List of allowed indicator modules to use for the lightdm gtk
greeter panel.

Built-in indicators include "~a11y", "~language", "~session",
"~power", "~clock", "~host", "~spacer". Unity indicators can be
represented by short name (e.g. "sound", "power"), service file name,
or absolute path.

If set to null the default indicators are used.

*Type:* null or (list of string)

*Default:* `null`

*Example:*

``` nix
[
  "~host"
  "~spacer"
  "~clock"
  "~spacer"
  "~session"
  "~language"
  "~a11y"
  "~power"
]
```

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/gtk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/gtk.nix)

## `services.xserver.displayManager.lightdm.greeters.gtk.theme.name` {#opt-services.xserver.displayManager.lightdm.greeters.gtk.theme.name}

Name of the theme to use for the lightdm-gtk-greeter.

*Type:* string

*Default:* `"Adwaita"`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/gtk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/gtk.nix)

## `services.xserver.displayManager.lightdm.greeters.gtk.theme.package` {#opt-services.xserver.displayManager.lightdm.greeters.gtk.theme.package}

The gnome-themes-extra package to use.

*Type:* package

*Default:* `pkgs.gnome-themes-extra`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/gtk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/gtk.nix)

## `services.xserver.displayManager.lightdm.greeters.lomiri.enable` {#opt-services.xserver.displayManager.lightdm.greeters.lomiri.enable}

Whether to enable lomiri's greeter as the lightdm greeter.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/lomiri.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/lomiri.nix)

## `services.xserver.displayManager.lightdm.greeters.mini.enable` {#opt-services.xserver.displayManager.lightdm.greeters.mini.enable}

Whether to enable lightdm-mini-greeter as the lightdm greeter.

Note that this greeter starts only the default X session.
You can configure the default X session using
[services (D)](../../options/services-d/index.md#opt-services.displayManager.defaultSession).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/mini.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/mini.nix)

## `services.xserver.displayManager.lightdm.greeters.mini.extraConfig` {#opt-services.xserver.displayManager.lightdm.greeters.mini.extraConfig}

Extra configuration that should be put in the lightdm-mini-greeter.conf
configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/mini.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/mini.nix)

## `services.xserver.displayManager.lightdm.greeters.mini.user` {#opt-services.xserver.displayManager.lightdm.greeters.mini.user}

The user to login as.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/mini.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/mini.nix)

## `services.xserver.displayManager.lightdm.greeters.mobile.enable` {#opt-services.xserver.displayManager.lightdm.greeters.mobile.enable}

Whether to enable lightdm-mobile-greeter as the lightdm greeter.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/mobile.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/mobile.nix)

## `services.xserver.displayManager.lightdm.greeters.pantheon.enable` {#opt-services.xserver.displayManager.lightdm.greeters.pantheon.enable}

Whether to enable elementary-greeter as the lightdm greeter.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/pantheon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/pantheon.nix)

## `services.xserver.displayManager.lightdm.greeters.slick.cursorTheme.name` {#opt-services.xserver.displayManager.lightdm.greeters.slick.cursorTheme.name}

Name of the cursor theme to use for the lightdm-slick-greeter.

*Type:* string

*Default:* `"Adwaita"`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix)

## `services.xserver.displayManager.lightdm.greeters.slick.cursorTheme.package` {#opt-services.xserver.displayManager.lightdm.greeters.slick.cursorTheme.package}

The adwaita-icon-theme package to use.

*Type:* package

*Default:* `pkgs.adwaita-icon-theme`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix)

## `services.xserver.displayManager.lightdm.greeters.slick.cursorTheme.size` {#opt-services.xserver.displayManager.lightdm.greeters.slick.cursorTheme.size}

Size of the cursor theme to use for the lightdm-slick-greeter.

*Type:* signed integer

*Default:* `24`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix)

## `services.xserver.displayManager.lightdm.greeters.slick.draw-user-backgrounds` {#opt-services.xserver.displayManager.lightdm.greeters.slick.draw-user-backgrounds}

Whether to enable draw user backgrounds.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix)

## `services.xserver.displayManager.lightdm.greeters.slick.enable` {#opt-services.xserver.displayManager.lightdm.greeters.slick.enable}

Whether to enable lightdm-slick-greeter as the lightdm greeter.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix)

## `services.xserver.displayManager.lightdm.greeters.slick.extraConfig` {#opt-services.xserver.displayManager.lightdm.greeters.slick.extraConfig}

Extra configuration that should be put in the lightdm-slick-greeter.conf
configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix)

## `services.xserver.displayManager.lightdm.greeters.slick.font.name` {#opt-services.xserver.displayManager.lightdm.greeters.slick.font.name}

Name of the font to use.

*Type:* string

*Default:* `"Ubuntu 11"`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix)

## `services.xserver.displayManager.lightdm.greeters.slick.font.package` {#opt-services.xserver.displayManager.lightdm.greeters.slick.font.package}

The ubuntu-classic package to use.

*Type:* package

*Default:* `pkgs.ubuntu-classic`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix)

## `services.xserver.displayManager.lightdm.greeters.slick.iconTheme.name` {#opt-services.xserver.displayManager.lightdm.greeters.slick.iconTheme.name}

Name of the icon theme to use for the lightdm-slick-greeter.

*Type:* string

*Default:* `"Adwaita"`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix)

## `services.xserver.displayManager.lightdm.greeters.slick.iconTheme.package` {#opt-services.xserver.displayManager.lightdm.greeters.slick.iconTheme.package}

The adwaita-icon-theme package to use.

*Type:* package

*Default:* `pkgs.adwaita-icon-theme`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix)

## `services.xserver.displayManager.lightdm.greeters.slick.theme.name` {#opt-services.xserver.displayManager.lightdm.greeters.slick.theme.name}

Name of the theme to use for the lightdm-slick-greeter.

*Type:* string

*Default:* `"Adwaita"`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix)

## `services.xserver.displayManager.lightdm.greeters.slick.theme.package` {#opt-services.xserver.displayManager.lightdm.greeters.slick.theme.package}

The gnome-themes-extra package to use.

*Type:* package

*Default:* `pkgs.gnome-themes-extra`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/slick.nix)

## `services.xserver.displayManager.lightdm.greeters.tiny.enable` {#opt-services.xserver.displayManager.lightdm.greeters.tiny.enable}

Whether to enable lightdm-tiny-greeter as the lightdm greeter.

Note that this greeter starts only the default X session.
You can configure the default X session using
[services (D)](../../options/services-d/index.md#opt-services.displayManager.defaultSession).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/tiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/tiny.nix)

## `services.xserver.displayManager.lightdm.greeters.tiny.extraConfig` {#opt-services.xserver.displayManager.lightdm.greeters.tiny.extraConfig}

Section to describe style and ui.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/tiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/tiny.nix)

## `services.xserver.displayManager.lightdm.greeters.tiny.label.pass` {#opt-services.xserver.displayManager.lightdm.greeters.tiny.label.pass}

The string to represent the pass\_text label.

*Type:* string

*Default:* `"Password"`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/tiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/tiny.nix)

## `services.xserver.displayManager.lightdm.greeters.tiny.label.user` {#opt-services.xserver.displayManager.lightdm.greeters.tiny.label.user}

The string to represent the user\_text label.

*Type:* string

*Default:* `"Username"`

*Declared by:* [`nixos/modules/services/x11/display-managers/lightdm-greeters/tiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/lightdm-greeters/tiny.nix)

## `services.xserver.displayManager.session` {#opt-services.xserver.displayManager.session}

List of sessions supported with the command used to start each
session.  Each session script can set the
`waitPID` shell variable to make this script
wait until the end of the user session.  Each script is used
to define either a window manager or a desktop manager.  These
can be differentiated by setting the attribute
`manage` either to `"window"`
or `"desktop"`.

The list of desktop manager and window manager should appear
inside the display manager with the desktop manager name
followed by the window manager name.

*Type:* list of (attribute set)

*Default:* `[ ]`

*Example:*

``` nix
[ { manage = "desktop";
    name = "xterm";
    start = ''
      ${pkgs.xterm}/bin/xterm -ls &
      waitPID=$!
    '';
  }
]
```

*Declared by:* [`nixos/modules/services/x11/display-managers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/default.nix)

## `services.xserver.displayManager.sessionCommands` {#opt-services.xserver.displayManager.sessionCommands}

Shell commands executed just before the window or desktop manager is
started. These commands are not currently sourced for Wayland sessions.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  xmessage "Hello World!" &
''
```

*Declared by:* [`nixos/modules/services/x11/display-managers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/default.nix)

## `services.xserver.displayManager.setupCommands` {#opt-services.xserver.displayManager.setupCommands}

Shell commands executed just after the X server has started.

This option is only effective for display managers for which this feature
is supported; currently these are LightDM, GDM and SDDM.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/x11/display-managers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/default.nix)

## `services.xserver.displayManager.startx.enable` {#opt-services.xserver.displayManager.startx.enable}

Whether to enable the dummy "startx" pseudo-display manager, which
allows users to start X manually via the `startx` command from a
virtual terminal.

::: note
The X server will run under the current user, not as root.
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/display-managers/startx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/startx.nix)

## `services.xserver.displayManager.startx.extraCommands` {#opt-services.xserver.displayManager.startx.extraCommands}

Shell commands to be added to the system-wide xinitrc script.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/x11/display-managers/startx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/startx.nix)

## `services.xserver.displayManager.startx.generateScript` {#opt-services.xserver.displayManager.startx.generateScript}

Whether to generate the system-wide xinitrc script (/etc/X11/xinit/xinitrc).
This script will take care of setting up the session for systemd user
services, running the window manager and cleaning up on exit.

::: note
This script will only be used by `startx` when both `.xinitrc` does not
exists and the `XINITRC` environment variable is unset.
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/display-managers/startx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/startx.nix)

## `services.xserver.displayManager.sx.addAsSession` {#opt-services.xserver.displayManager.sx.addAsSession}

Whether to add sx as a display manager session. Keep in mind that sx
expects to be run from a TTY, so it may not work in your display
manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/display-managers/sx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/sx.nix)

## `services.xserver.displayManager.sx.enable` {#opt-services.xserver.displayManager.sx.enable}

Whether to enable the "sx" pseudo-display manager, which allows users
to start manually via the "sx" command from a vt shell. The X server
runs under the user's id, not as root. The user must provide a
~/.config/sx/sxrc file containing session startup commands, see
`sx(1)`. This is not automatically generated from the desktopManager
and windowManager settings. sx doesn't have a way to directly set
X server flags, but it can be done by overriding its xorg-server
dependency.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/display-managers/sx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/sx.nix)

## `services.xserver.displayManager.sx.package` {#opt-services.xserver.displayManager.sx.package}

The sx package to use.

*Type:* package

*Default:* `pkgs.sx`

*Declared by:* [`nixos/modules/services/x11/display-managers/sx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/sx.nix)

## `services.xserver.displayManager.xpra.auth` {#opt-services.xserver.displayManager.xpra.auth}

Authentication to use when connecting to xpra

*Type:* string

*Default:* `"pam"`

*Example:* `"password:value=mysecret"`

*Declared by:* [`nixos/modules/services/x11/display-managers/xpra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/xpra.nix)

## `services.xserver.displayManager.xpra.bindTcp` {#opt-services.xserver.displayManager.xpra.bindTcp}

Bind xpra to TCP

*Type:* null or string

*Default:* `"127.0.0.1:10000"`

*Example:* `"0.0.0.0:10000"`

*Declared by:* [`nixos/modules/services/x11/display-managers/xpra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/xpra.nix)

## `services.xserver.displayManager.xpra.desktop` {#opt-services.xserver.displayManager.xpra.desktop}

Start a desktop environment instead of seamless mode

*Type:* null or string

*Default:* `null`

*Example:* `"gnome-shell"`

*Declared by:* [`nixos/modules/services/x11/display-managers/xpra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/xpra.nix)

## `services.xserver.displayManager.xpra.enable` {#opt-services.xserver.displayManager.xpra.enable}

Whether to enable xpra as display manager.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/display-managers/xpra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/xpra.nix)

## `services.xserver.displayManager.xpra.extraOptions` {#opt-services.xserver.displayManager.xpra.extraOptions}

Extra xpra options

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/x11/display-managers/xpra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/xpra.nix)

## `services.xserver.displayManager.xpra.pulseaudio` {#opt-services.xserver.displayManager.xpra.pulseaudio}

Whether to enable pulseaudio audio streaming.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/display-managers/xpra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/xpra.nix)

## `services.xserver.displayManager.xserverArgs` {#opt-services.xserver.displayManager.xserverArgs}

List of arguments for the X server.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-ac"
  "-logverbose"
  "-verbose"
  "-nolisten tcp"
]
```

*Declared by:* [`nixos/modules/services/x11/display-managers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/default.nix)

## `services.xserver.displayManager.xserverBin` {#opt-services.xserver.displayManager.xserverBin}

Path to the X server used by display managers.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/x11/display-managers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/display-managers/default.nix)

## `services.xserver.dpi` {#opt-services.xserver.dpi}

Force global DPI resolution to use for X server. It's recommended to
use this only when DPI is detected incorrectly; also consider using
`Monitor` section in configuration file instead.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.enable` {#opt-services.xserver.enable}

Whether to enable the X server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.enableCtrlAltBackspace` {#opt-services.xserver.enableCtrlAltBackspace}

Whether to enable the DontZap option, which binds Ctrl+Alt+Backspace
to forcefully kill X. This can lead to data loss and is disabled
by default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.enableTCP` {#opt-services.xserver.enableTCP}

Whether to allow the X server to accept TCP connections.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.enableTearFree` {#opt-services.xserver.enableTearFree}

Whether to enable the TearFree option in the first Device section.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.excludePackages` {#opt-services.xserver.excludePackages}

Which X11 packages to exclude from the default environment

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.xterm ]`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.exportConfiguration` {#opt-services.xserver.exportConfiguration}

Whether to symlink the X server configuration under
`/etc/X11/xorg.conf`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.extraConfig` {#opt-services.xserver.extraConfig}

Additional contents (sections) included in the X server configuration file

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.extraDisplaySettings` {#opt-services.xserver.extraDisplaySettings}

Lines to be added to every Display subsection of the Screen section.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"Virtual 2048 2048"`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.filesSection` {#opt-services.xserver.filesSection}

Contents of the first `Files` section of the X server configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"FontPath \"/path/to/my/fonts\""`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.fontPath` {#opt-services.xserver.fontPath}

Set the X server FontPath. Defaults to null, which
means the compiled in defaults will be used. See
man xorg.conf for details.

*Type:* null or string

*Default:* `null`

*Example:* `"unix/:7100"`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.imwheel.enable` {#opt-services.xserver.imwheel.enable}

Whether to enable IMWheel service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/imwheel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/imwheel.nix)

## `services.xserver.imwheel.extraOptions` {#opt-services.xserver.imwheel.extraOptions}

Additional command-line arguments to pass to
`imwheel`.

*Type:* list of string

*Default:*

``` nix
[
  "--buttons=45"
]
```

*Example:*

``` nix
[
  "--debug"
]
```

*Declared by:* [`nixos/modules/services/x11/imwheel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/imwheel.nix)

## `services.xserver.imwheel.rules` {#opt-services.xserver.imwheel.rules}

Window class translation rules.
/etc/X11/imwheelrc is generated based on this config
which means this config is global for all users.
See [official man pages](https://imwheel.sourceforge.net/imwheel.1.html)
for more information.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  ".*" = ''
    None,      Up,   Button4, 8
    None,      Down, Button5, 8
    Shift_L,   Up,   Shift_L|Button4, 4
    Shift_L,   Down, Shift_L|Button5, 4
    Control_L, Up,   Control_L|Button4
    Control_L, Down, Control_L|Button5
  '';
}
```

*Declared by:* [`nixos/modules/services/x11/imwheel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/imwheel.nix)

## `services.xserver.inputClassSections` {#opt-services.xserver.inputClassSections}

Content of additional InputClass sections of the X server configuration file.

*Type:* list of strings concatenated with "\\n"

*Default:* `[ ]`

*Example:*

``` nix
[ ''
    Identifier      "Trackpoint Wheel Emulation"
    MatchProduct    "ThinkPad USB Keyboard with TrackPoint"
    Option          "EmulateWheel"          "true"
    Option          "EmulateWheelButton"    "2"
    Option          "Emulate3Buttons"       "false"
  ''
]
```

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.logFile` {#opt-services.xserver.logFile}

Controls the file Xorg logs to.

The default of `/dev/null` is set so that systemd services (like `displayManagers`) only log to the journal and don't create their own log files.

Setting this to `null` will not pass the `-logfile` argument to Xorg which allows it to log to its default logfile locations instead (see `man Xorg`). You probably only want this behaviour when running Xorg manually (e.g. via `startx`).

*Type:* null or string

*Default:* `"/dev/null"`

*Example:* `"/var/log/Xorg.0.log"`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.moduleSection` {#opt-services.xserver.moduleSection}

Contents of the Module section of the X server configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  SubSection "extmod"
  EndSubsection
''
```

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.modules` {#opt-services.xserver.modules}

Packages to be added to the module search path of the X server.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:* `[ pkgs.xf86-input-wacom ]`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.monitorSection` {#opt-services.xserver.monitorSection}

Contents of the first Monitor section of the X server configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"HorizSync 28-49"`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.resolutions` {#opt-services.xserver.resolutions}

The screen resolutions for the X server.  The first element
is the default resolution.  If this list is empty, the X
server will automatically configure the resolution.

*Type:* list of (attribute set)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    x = 1600;
    y = 1200;
  }
  {
    x = 1024;
    y = 786;
  }
]
```

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.screenSection` {#opt-services.xserver.screenSection}

Contents of the first Screen section of the X server configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  Option "RandRRotation" "on"
''
```

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.serverFlagsSection` {#opt-services.xserver.serverFlagsSection}

Contents of the ServerFlags section of the X server configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  Option "BlankTime" "0"
  Option "StandbyTime" "0"
  Option "SuspendTime" "0"
  Option "OffTime" "0"
''
```

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.serverLayoutSection` {#opt-services.xserver.serverLayoutSection}

Contents of the ServerLayout section of the X server configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  Option "AIGLX" "true"
''
```

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.synaptics.accelFactor` {#opt-services.xserver.synaptics.accelFactor}

Cursor acceleration (how fast speed increases from minSpeed to maxSpeed).

*Type:* null or string

*Default:* `"0.001"`

*Declared by:* [`nixos/modules/services/x11/hardware/synaptics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/hardware/synaptics.nix)

## `services.xserver.synaptics.additionalOptions` {#opt-services.xserver.synaptics.additionalOptions}

Additional options for synaptics touchpad driver.

*Type:* string

*Default:* `""`

*Example:*

``` nix
''
  Option "RTCornerButton" "2"
  Option "RBCornerButton" "3"
''
```

*Declared by:* [`nixos/modules/services/x11/hardware/synaptics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/hardware/synaptics.nix)

## `services.xserver.synaptics.buttonsMap` {#opt-services.xserver.synaptics.buttonsMap}

Remap touchpad buttons.

*Type:* list of signed integer

*Default:*

``` nix
[
  1
  2
  3
]
```

*Example:*

``` nix
[
  1
  3
  2
]
```

*Declared by:* [`nixos/modules/services/x11/hardware/synaptics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/hardware/synaptics.nix)

## `services.xserver.synaptics.dev` {#opt-services.xserver.synaptics.dev}

Path for touchpad device.  Set to null to apply to any
auto-detected touchpad.

*Type:* null or string

*Default:* `null`

*Example:* `"/dev/input/event0"`

*Declared by:* [`nixos/modules/services/x11/hardware/synaptics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/hardware/synaptics.nix)

## `services.xserver.synaptics.enable` {#opt-services.xserver.synaptics.enable}

Whether to enable touchpad support. Deprecated: Consider services.libinput.enable.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/hardware/synaptics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/hardware/synaptics.nix)

## `services.xserver.synaptics.fingersMap` {#opt-services.xserver.synaptics.fingersMap}

Remap several-fingers taps.

*Type:* list of signed integer

*Default:*

``` nix
[
  1
  2
  3
]
```

*Example:*

``` nix
[
  1
  3
  2
]
```

*Declared by:* [`nixos/modules/services/x11/hardware/synaptics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/hardware/synaptics.nix)

## `services.xserver.synaptics.horizEdgeScroll` {#opt-services.xserver.synaptics.horizEdgeScroll}

Whether to enable horizontal edge drag-scrolling.

*Type:* boolean

*Default:* `! config.services.xserver.synaptics.horizTwoFingerScroll`

*Declared by:* [`nixos/modules/services/x11/hardware/synaptics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/hardware/synaptics.nix)

## `services.xserver.synaptics.horizTwoFingerScroll` {#opt-services.xserver.synaptics.horizTwoFingerScroll}

Whether to enable horizontal two-finger drag-scrolling.

*Type:* boolean

*Default:* `config.services.xserver.synaptics.twoFingerScroll`

*Declared by:* [`nixos/modules/services/x11/hardware/synaptics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/hardware/synaptics.nix)

## `services.xserver.synaptics.horizontalScroll` {#opt-services.xserver.synaptics.horizontalScroll}

Whether to enable horizontal scrolling (on touchpad)

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/x11/hardware/synaptics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/hardware/synaptics.nix)

## `services.xserver.synaptics.maxSpeed` {#opt-services.xserver.synaptics.maxSpeed}

Cursor speed factor for highest-speed finger motion.

*Type:* null or string

*Default:* `"1.0"`

*Declared by:* [`nixos/modules/services/x11/hardware/synaptics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/hardware/synaptics.nix)

## `services.xserver.synaptics.minSpeed` {#opt-services.xserver.synaptics.minSpeed}

Cursor speed factor for precision finger motion.

*Type:* null or string

*Default:* `"0.6"`

*Declared by:* [`nixos/modules/services/x11/hardware/synaptics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/hardware/synaptics.nix)

## `services.xserver.synaptics.palmDetect` {#opt-services.xserver.synaptics.palmDetect}

Whether to enable palm detection (hardware support required)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/hardware/synaptics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/hardware/synaptics.nix)

## `services.xserver.synaptics.palmMinWidth` {#opt-services.xserver.synaptics.palmMinWidth}

Minimum finger width at which touch is considered a palm

*Type:* null or signed integer

*Default:* `null`

*Example:* `5`

*Declared by:* [`nixos/modules/services/x11/hardware/synaptics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/hardware/synaptics.nix)

## `services.xserver.synaptics.palmMinZ` {#opt-services.xserver.synaptics.palmMinZ}

Minimum finger pressure at which touch is considered a palm

*Type:* null or signed integer

*Default:* `null`

*Example:* `20`

*Declared by:* [`nixos/modules/services/x11/hardware/synaptics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/hardware/synaptics.nix)

## `services.xserver.synaptics.scrollDelta` {#opt-services.xserver.synaptics.scrollDelta}

Move distance of the finger for a scroll event.

*Type:* null or signed integer

*Default:* `null`

*Example:* `75`

*Declared by:* [`nixos/modules/services/x11/hardware/synaptics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/hardware/synaptics.nix)

## `services.xserver.synaptics.tapButtons` {#opt-services.xserver.synaptics.tapButtons}

Whether to enable tap buttons.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/x11/hardware/synaptics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/hardware/synaptics.nix)

## `services.xserver.synaptics.twoFingerScroll` {#opt-services.xserver.synaptics.twoFingerScroll}

Whether to enable two-finger drag-scrolling. Overridden by horizTwoFingerScroll and vertTwoFingerScroll.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/hardware/synaptics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/hardware/synaptics.nix)

## `services.xserver.synaptics.vertEdgeScroll` {#opt-services.xserver.synaptics.vertEdgeScroll}

Whether to enable vertical edge drag-scrolling.

*Type:* boolean

*Default:* `! config.services.xserver.synaptics.vertTwoFingerScroll`

*Declared by:* [`nixos/modules/services/x11/hardware/synaptics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/hardware/synaptics.nix)

## `services.xserver.synaptics.vertTwoFingerScroll` {#opt-services.xserver.synaptics.vertTwoFingerScroll}

Whether to enable vertical two-finger drag-scrolling.

*Type:* boolean

*Default:* `config.services.xserver.synaptics.twoFingerScroll`

*Declared by:* [`nixos/modules/services/x11/hardware/synaptics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/hardware/synaptics.nix)

## `services.xserver.terminateOnReset` {#opt-services.xserver.terminateOnReset}

Whether to terminate X upon server reset.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.updateDbusEnvironment` {#opt-services.xserver.updateDbusEnvironment}

Whether to update the DBus activation environment after launching the
desktop manager.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.upscaleDefaultCursor` {#opt-services.xserver.upscaleDefaultCursor}

Upscale the default X cursor to be more visible on high-density displays.
Requires `config.services.xserver.dpi` to be set.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.verbose` {#opt-services.xserver.verbose}

Controls verbosity of X logging.

*Type:* null or signed integer

*Default:* `3`

*Example:* `7`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.videoDriver` {#opt-services.xserver.videoDriver}

The name of the video driver for your graphics card.  This
option is obsolete; please set the
[`services.xserver.videoDrivers`](#opt-services.xserver.videoDrivers) instead.

*Type:* null or string

*Default:* `null`

*Example:* `"i810"`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.videoDrivers` {#opt-services.xserver.videoDrivers}

The names of the video drivers the configuration
supports. They will be tried in order until one that
supports your card is found.
Don't combine those with "incompatible" OpenGL implementations,
e.g. free ones (mesa-based) with proprietary ones.

For unfree "nvidia\*", the supported GPU lists are on
https://www.nvidia.com/object/unix.html

*Type:* list of string

*Default:*

``` nix
[
  "modesetting"
  "fbdev"
]
```

*Example:*

``` nix
[
  "nvidia"
  "amdgpu"
]
```

*Related packages:*

- [amdgpu aka `pkgs.xf86-video-amdgpu`](https://search.nixos.org/packages?show=xf86-video-amdgpu&sort=relevance&query=xf86-video-amdgpu)
- [apm aka `pkgs.xf86-video-apm`](https://search.nixos.org/packages?show=xf86-video-apm&sort=relevance&query=xf86-video-apm)
- [ark aka `pkgs.xf86-video-ark`](https://search.nixos.org/packages?show=xf86-video-ark&sort=relevance&query=xf86-video-ark)
- [ast aka `pkgs.xf86-video-ast`](https://search.nixos.org/packages?show=xf86-video-ast&sort=relevance&query=xf86-video-ast)
- [ati aka `pkgs.xf86-video-ati`](https://search.nixos.org/packages?show=xf86-video-ati&sort=relevance&query=xf86-video-ati)
- [chips aka `pkgs.xf86-video-chips`](https://search.nixos.org/packages?show=xf86-video-chips&sort=relevance&query=xf86-video-chips)
- [cirrus aka `pkgs.xf86-video-cirrus`](https://search.nixos.org/packages?show=xf86-video-cirrus&sort=relevance&query=xf86-video-cirrus)
- [dummy aka `pkgs.xf86-video-dummy`](https://search.nixos.org/packages?show=xf86-video-dummy&sort=relevance&query=xf86-video-dummy)
- [fbdev aka `pkgs.xf86-video-fbdev`](https://search.nixos.org/packages?show=xf86-video-fbdev&sort=relevance&query=xf86-video-fbdev)
- [geode aka `pkgs.xf86-video-geode`](https://search.nixos.org/packages?show=xf86-video-geode&sort=relevance&query=xf86-video-geode)
- [i128 aka `pkgs.xf86-video-i128`](https://search.nixos.org/packages?show=xf86-video-i128&sort=relevance&query=xf86-video-i128)
- [i740 aka `pkgs.xf86-video-i740`](https://search.nixos.org/packages?show=xf86-video-i740&sort=relevance&query=xf86-video-i740)
- [intel aka `pkgs.xf86-video-intel`](https://search.nixos.org/packages?show=xf86-video-intel&sort=relevance&query=xf86-video-intel)
- [mga aka `pkgs.xf86-video-mga`](https://search.nixos.org/packages?show=xf86-video-mga&sort=relevance&query=xf86-video-mga)
- [neomagic aka `pkgs.xf86-video-neomagic`](https://search.nixos.org/packages?show=xf86-video-neomagic&sort=relevance&query=xf86-video-neomagic)
- [nested aka `pkgs.xf86-video-nested`](https://search.nixos.org/packages?show=xf86-video-nested&sort=relevance&query=xf86-video-nested)
- [nouveau aka `pkgs.xf86-video-nouveau`](https://search.nixos.org/packages?show=xf86-video-nouveau&sort=relevance&query=xf86-video-nouveau)
- [nv aka `pkgs.xf86-video-nv`](https://search.nixos.org/packages?show=xf86-video-nv&sort=relevance&query=xf86-video-nv)
- [omap aka `pkgs.xf86-video-omap`](https://search.nixos.org/packages?show=xf86-video-omap&sort=relevance&query=xf86-video-omap)
- [openchrome aka `pkgs.xf86-video-openchrome`](https://search.nixos.org/packages?show=xf86-video-openchrome&sort=relevance&query=xf86-video-openchrome)
- [qxl aka `pkgs.xf86-video-qxl`](https://search.nixos.org/packages?show=xf86-video-qxl&sort=relevance&query=xf86-video-qxl)
- [r128 aka `pkgs.xf86-video-r128`](https://search.nixos.org/packages?show=xf86-video-r128&sort=relevance&query=xf86-video-r128)
- [s3virge aka `pkgs.xf86-video-s3virge`](https://search.nixos.org/packages?show=xf86-video-s3virge&sort=relevance&query=xf86-video-s3virge)
- [savage aka `pkgs.xf86-video-savage`](https://search.nixos.org/packages?show=xf86-video-savage&sort=relevance&query=xf86-video-savage)
- [siliconmotion aka `pkgs.xf86-video-siliconmotion`](https://search.nixos.org/packages?show=xf86-video-siliconmotion&sort=relevance&query=xf86-video-siliconmotion)
- [sis aka `pkgs.xf86-video-sis`](https://search.nixos.org/packages?show=xf86-video-sis&sort=relevance&query=xf86-video-sis)
- [sisusb aka `pkgs.xf86-video-sisusb`](https://search.nixos.org/packages?show=xf86-video-sisusb&sort=relevance&query=xf86-video-sisusb)
- [suncg6 aka `pkgs.xf86-video-suncg6`](https://search.nixos.org/packages?show=xf86-video-suncg6&sort=relevance&query=xf86-video-suncg6)
- [sunffb aka `pkgs.xf86-video-sunffb`](https://search.nixos.org/packages?show=xf86-video-sunffb&sort=relevance&query=xf86-video-sunffb)
- [sunleo aka `pkgs.xf86-video-sunleo`](https://search.nixos.org/packages?show=xf86-video-sunleo&sort=relevance&query=xf86-video-sunleo)
- [tdfx aka `pkgs.xf86-video-tdfx`](https://search.nixos.org/packages?show=xf86-video-tdfx&sort=relevance&query=xf86-video-tdfx)
- [trident aka `pkgs.xf86-video-trident`](https://search.nixos.org/packages?show=xf86-video-trident&sort=relevance&query=xf86-video-trident)
- [v4l aka `pkgs.xf86-video-v4l`](https://search.nixos.org/packages?show=xf86-video-v4l&sort=relevance&query=xf86-video-v4l)
- [vbox aka `pkgs.xf86-video-vbox`](https://search.nixos.org/packages?show=xf86-video-vbox&sort=relevance&query=xf86-video-vbox)
- [vesa aka `pkgs.xf86-video-vesa`](https://search.nixos.org/packages?show=xf86-video-vesa&sort=relevance&query=xf86-video-vesa)
- [vmware aka `pkgs.xf86-video-vmware`](https://search.nixos.org/packages?show=xf86-video-vmware&sort=relevance&query=xf86-video-vmware)
- [voodoo aka `pkgs.xf86-video-voodoo`](https://search.nixos.org/packages?show=xf86-video-voodoo&sort=relevance&query=xf86-video-voodoo)

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.virtualScreen` {#opt-services.xserver.virtualScreen}

Virtual screen size for Xrandr.

*Type:* null or (attribute set)

*Default:* `null`

*Example:*

``` nix
{
  x = 2048;
  y = 2048;
}
```

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.wacom.enable` {#opt-services.xserver.wacom.enable}

Whether to enable the Wacom touchscreen/digitizer/tablet.
If you ever have any issues such as, try switching to terminal (ctrl-alt-F1) and back
which will make Xorg reconfigure the device ?

If you're not satisfied by the default behaviour you can override
`environment.etc."X11/xorg.conf.d/70-wacom.conf"` in
configuration.nix easily.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/hardware/wacom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/hardware/wacom.nix)

## `services.xserver.windowManager."2bwm".enable` {#opt-services.xserver.windowManager._2bwm_.enable}

Whether to enable 2bwm.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/2bwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/2bwm.nix)

## `services.xserver.windowManager.awesome.enable` {#opt-services.xserver.windowManager.awesome.enable}

Whether to enable Awesome window manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/awesome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/awesome.nix)

## `services.xserver.windowManager.awesome.luaModules` {#opt-services.xserver.windowManager.awesome.luaModules}

List of lua packages available for being used in the Awesome configuration.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.luaPackages.vicious ]`

*Declared by:* [`nixos/modules/services/x11/window-managers/awesome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/awesome.nix)

## `services.xserver.windowManager.awesome.noArgb` {#opt-services.xserver.windowManager.awesome.noArgb}

Disable client transparency support, which can be greatly detrimental to performance in some setups

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/window-managers/awesome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/awesome.nix)

## `services.xserver.windowManager.awesome.package` {#opt-services.xserver.windowManager.awesome.package}

The awesome package to use.

*Type:* package

*Default:* `pkgs.awesome`

*Declared by:* [`nixos/modules/services/x11/window-managers/awesome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/awesome.nix)

## `services.xserver.windowManager.berry.enable` {#opt-services.xserver.windowManager.berry.enable}

Whether to enable berry.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/berry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/berry.nix)

## `services.xserver.windowManager.bspwm.configFile` {#opt-services.xserver.windowManager.bspwm.configFile}

Path to the bspwm configuration file.
If null, $HOME/.config/bspwm/bspwmrc will be used.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.bspwm}/share/doc/bspwm/examples/bspwmrc"`

*Declared by:* [`nixos/modules/services/x11/window-managers/bspwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/bspwm.nix)

## `services.xserver.windowManager.bspwm.enable` {#opt-services.xserver.windowManager.bspwm.enable}

Whether to enable bspwm.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/bspwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/bspwm.nix)

## `services.xserver.windowManager.bspwm.package` {#opt-services.xserver.windowManager.bspwm.package}

The bspwm package to use.

*Type:* package

*Default:* `pkgs.bspwm`

*Declared by:* [`nixos/modules/services/x11/window-managers/bspwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/bspwm.nix)

## `services.xserver.windowManager.bspwm.sxhkd.configFile` {#opt-services.xserver.windowManager.bspwm.sxhkd.configFile}

Path to the sxhkd configuration file.
If null, $HOME/.config/sxhkd/sxhkdrc will be used.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.bspwm}/share/doc/bspwm/examples/sxhkdrc"`

*Declared by:* [`nixos/modules/services/x11/window-managers/bspwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/bspwm.nix)

## `services.xserver.windowManager.bspwm.sxhkd.package` {#opt-services.xserver.windowManager.bspwm.sxhkd.package}

The sxhkd package to use.

*Type:* package

*Default:* `pkgs.sxhkd`

*Declared by:* [`nixos/modules/services/x11/window-managers/bspwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/bspwm.nix)

## `services.xserver.windowManager.clfswm.enable` {#opt-services.xserver.windowManager.clfswm.enable}

Whether to enable clfswm.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/clfswm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/clfswm.nix)

## `services.xserver.windowManager.clfswm.package` {#opt-services.xserver.windowManager.clfswm.package}

The clfswm package to use.

*Type:* package

*Default:* `pkgs.sbclPackages.clfswm`

*Declared by:* [`nixos/modules/services/x11/window-managers/clfswm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/clfswm.nix)

## `services.xserver.windowManager.cwm.enable` {#opt-services.xserver.windowManager.cwm.enable}

Whether to enable cwm.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/cwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/cwm.nix)

## `services.xserver.windowManager.dk.enable` {#opt-services.xserver.windowManager.dk.enable}

Whether to enable dk.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/dk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/dk.nix)

## `services.xserver.windowManager.dk.package` {#opt-services.xserver.windowManager.dk.package}

The dk package to use.

*Type:* package

*Default:* `pkgs.dk`

*Declared by:* [`nixos/modules/services/x11/window-managers/dk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/dk.nix)

## `services.xserver.windowManager.dwm.enable` {#opt-services.xserver.windowManager.dwm.enable}

Whether to enable dwm.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/dwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/dwm.nix)

## `services.xserver.windowManager.dwm.extraSessionCommands` {#opt-services.xserver.windowManager.dwm.extraSessionCommands}

Shell commands executed just before dwm is started.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/x11/window-managers/dwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/dwm.nix)

## `services.xserver.windowManager.dwm.package` {#opt-services.xserver.windowManager.dwm.package}

The dwm package to use.

*Type:* package

*Default:* `pkgs.dwm`

*Example:*

``` nix
pkgs.dwm.overrideAttrs (oldAttrs: rec {
  patches = [
    (super.fetchpatch {
      url = "https://dwm.suckless.org/patches/steam/dwm-steam-6.2.diff";
      sha256 = "sha256-f3lffBjz7+0Khyn9c9orzReoLTqBb/9gVGshYARGdVc=";
    })
  ];
})
```

*Declared by:* [`nixos/modules/services/x11/window-managers/dwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/dwm.nix)

## `services.xserver.windowManager.e16.enable` {#opt-services.xserver.windowManager.e16.enable}

Whether to enable e16.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/e16.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/e16.nix)

## `services.xserver.windowManager.evilwm.enable` {#opt-services.xserver.windowManager.evilwm.enable}

Whether to enable evilwm.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/evilwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/evilwm.nix)

## `services.xserver.windowManager.exwm.enable` {#opt-services.xserver.windowManager.exwm.enable}

Whether to enable exwm.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/exwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/exwm.nix)

## `services.xserver.windowManager.exwm.extraPackages` {#opt-services.xserver.windowManager.exwm.extraPackages}

Extra packages available to Emacs. The value must be a
function which receives the attrset defined in
`emacs.pkgs` as the sole argument.

*Type:* function that evaluates to a(n) list of package

*Default:* `epkgs: []`

*Example:*

``` nix
epkgs: [
  epkgs.emms
  epkgs.magit
  epkgs.proof-general
]
```

*Declared by:* [`nixos/modules/services/x11/window-managers/exwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/exwm.nix)

## `services.xserver.windowManager.exwm.loadScript` {#opt-services.xserver.windowManager.exwm.loadScript}

Emacs lisp code to be run after loading the user's init
file.

*Type:* strings concatenated with "\\n"

*Default:* `"(require 'exwm)"`

*Example:*

``` nix
''
  (require 'exwm)
  (exwm-enable)
''
```

*Declared by:* [`nixos/modules/services/x11/window-managers/exwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/exwm.nix)

## `services.xserver.windowManager.exwm.package` {#opt-services.xserver.windowManager.exwm.package}

The Emacs package to use.

*Type:* package

*Default:* `pkgs.emacs`

*Example:* `pkgs.emacs-gtk`

*Declared by:* [`nixos/modules/services/x11/window-managers/exwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/exwm.nix)

## `services.xserver.windowManager.fluxbox.enable` {#opt-services.xserver.windowManager.fluxbox.enable}

Whether to enable fluxbox.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/fluxbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/fluxbox.nix)

## `services.xserver.windowManager.fvwm2.enable` {#opt-services.xserver.windowManager.fvwm2.enable}

Whether to enable Fvwm2 window manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/fvwm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/fvwm2.nix)

## `services.xserver.windowManager.fvwm2.gestures` {#opt-services.xserver.windowManager.fvwm2.gestures}

Whether or not to enable libstroke for gesture support

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/window-managers/fvwm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/fvwm2.nix)

## `services.xserver.windowManager.fvwm3.enable` {#opt-services.xserver.windowManager.fvwm3.enable}

Whether to enable Fvwm3 window manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/fvwm3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/fvwm3.nix)

## `services.xserver.windowManager.hackedbox.enable` {#opt-services.xserver.windowManager.hackedbox.enable}

Whether to enable hackedbox.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/hackedbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/hackedbox.nix)

## `services.xserver.windowManager.herbstluftwm.configFile` {#opt-services.xserver.windowManager.herbstluftwm.configFile}

Path to the herbstluftwm configuration file.  If left at the
default value, $XDG\_CONFIG\_HOME/herbstluftwm/autostart will
be used.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/x11/window-managers/herbstluftwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/herbstluftwm.nix)

## `services.xserver.windowManager.herbstluftwm.enable` {#opt-services.xserver.windowManager.herbstluftwm.enable}

Whether to enable herbstluftwm.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/herbstluftwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/herbstluftwm.nix)

## `services.xserver.windowManager.herbstluftwm.package` {#opt-services.xserver.windowManager.herbstluftwm.package}

The herbstluftwm package to use.

*Type:* package

*Default:* `pkgs.herbstluftwm`

*Declared by:* [`nixos/modules/services/x11/window-managers/herbstluftwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/herbstluftwm.nix)

## `services.xserver.windowManager.hypr.enable` {#opt-services.xserver.windowManager.hypr.enable}

Whether to enable hypr.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/hypr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/hypr.nix)

## `services.xserver.windowManager.i3.configFile` {#opt-services.xserver.windowManager.i3.configFile}

Path to the i3 configuration file.
If left at the default value, $HOME/.i3/config will be used.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/x11/window-managers/i3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/i3.nix)

## `services.xserver.windowManager.i3.enable` {#opt-services.xserver.windowManager.i3.enable}

Whether to enable i3 window manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/i3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/i3.nix)

## `services.xserver.windowManager.i3.extraPackages` {#opt-services.xserver.windowManager.i3.extraPackages}

Extra packages to be installed system wide.

*Type:* list of package

*Default:*

``` nix
with pkgs; [
  dmenu
  i3status
]
```

*Declared by:* [`nixos/modules/services/x11/window-managers/i3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/i3.nix)

## `services.xserver.windowManager.i3.extraSessionCommands` {#opt-services.xserver.windowManager.i3.extraSessionCommands}

Shell commands executed just before i3 is started.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/x11/window-managers/i3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/i3.nix)

## `services.xserver.windowManager.i3.package` {#opt-services.xserver.windowManager.i3.package}

The i3 package to use.

*Type:* package

*Default:* `pkgs.i3`

*Declared by:* [`nixos/modules/services/x11/window-managers/i3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/i3.nix)

## `services.xserver.windowManager.i3.updateSessionEnvironment` {#opt-services.xserver.windowManager.i3.updateSessionEnvironment}

Whether to run dbus-update-activation-environment and systemctl import-environment before session start.
Required for xdg portals to function properly.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/i3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/i3.nix)

## `services.xserver.windowManager.icewm.enable` {#opt-services.xserver.windowManager.icewm.enable}

Whether to enable icewm.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/icewm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/icewm.nix)

## `services.xserver.windowManager.jwm.enable` {#opt-services.xserver.windowManager.jwm.enable}

Whether to enable jwm.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/jwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/jwm.nix)

## `services.xserver.windowManager.katriawm.enable` {#opt-services.xserver.windowManager.katriawm.enable}

Whether to enable katriawm.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/katriawm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/katriawm.nix)

## `services.xserver.windowManager.katriawm.package` {#opt-services.xserver.windowManager.katriawm.package}

The katriawm package to use.

*Type:* package

*Default:* `pkgs.katriawm`

*Declared by:* [`nixos/modules/services/x11/window-managers/katriawm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/katriawm.nix)

## `services.xserver.windowManager.leftwm.enable` {#opt-services.xserver.windowManager.leftwm.enable}

Whether to enable leftwm.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/leftwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/leftwm.nix)

## `services.xserver.windowManager.lwm.enable` {#opt-services.xserver.windowManager.lwm.enable}

Whether to enable lwm.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/lwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/lwm.nix)

## `services.xserver.windowManager.metacity.enable` {#opt-services.xserver.windowManager.metacity.enable}

Whether to enable metacity.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/metacity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/metacity.nix)

## `services.xserver.windowManager.mlvwm.configFile` {#opt-services.xserver.windowManager.mlvwm.configFile}

Path to the mlvwm configuration file.
If left at the default value, $HOME/.mlvwmrc will be used.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/x11/window-managers/mlvwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/mlvwm.nix)

## `services.xserver.windowManager.mlvwm.enable` {#opt-services.xserver.windowManager.mlvwm.enable}

Whether to enable Macintosh-like Virtual Window Manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/mlvwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/mlvwm.nix)

## `services.xserver.windowManager.mwm.enable` {#opt-services.xserver.windowManager.mwm.enable}

Whether to enable mwm.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/mwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/mwm.nix)

## `services.xserver.windowManager.nimdow.enable` {#opt-services.xserver.windowManager.nimdow.enable}

Whether to enable nimdow.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/nimdow.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/nimdow.nix)

## `services.xserver.windowManager.nimdow.package` {#opt-services.xserver.windowManager.nimdow.package}

The nimdow package to use.

*Type:* package

*Default:* `pkgs.nimdow`

*Declared by:* [`nixos/modules/services/x11/window-managers/nimdow.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/nimdow.nix)

## `services.xserver.windowManager.notion.enable` {#opt-services.xserver.windowManager.notion.enable}

Whether to enable notion.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/notion.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/notion.nix)

## `services.xserver.windowManager.openbox.enable` {#opt-services.xserver.windowManager.openbox.enable}

Whether to enable openbox.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/openbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/openbox.nix)

## `services.xserver.windowManager.oxwm.enable` {#opt-services.xserver.windowManager.oxwm.enable}

Whether to enable oxwm.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/oxwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/oxwm.nix)

## `services.xserver.windowManager.oxwm.package` {#opt-services.xserver.windowManager.oxwm.package}

The oxwm package to use.

*Type:* package

*Default:* `pkgs.oxwm`

*Declared by:* [`nixos/modules/services/x11/window-managers/oxwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/oxwm.nix)

## `services.xserver.windowManager.pekwm.enable` {#opt-services.xserver.windowManager.pekwm.enable}

Whether to enable pekwm.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/pekwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/pekwm.nix)

## `services.xserver.windowManager.qtile.configFile` {#opt-services.xserver.windowManager.qtile.configFile}

Path to the qtile configuration file.
If null, $XDG\_CONFIG\_HOME/qtile/config.py will be used.

*Type:* null or absolute path

*Default:* `null`

*Example:* `./your_config.py`

*Declared by:* [`nixos/modules/services/x11/window-managers/qtile.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/qtile.nix)

## `services.xserver.windowManager.qtile.enable` {#opt-services.xserver.windowManager.qtile.enable}

Whether to enable qtile.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/qtile.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/qtile.nix)

## `services.xserver.windowManager.qtile.extraPackages` {#opt-services.xserver.windowManager.qtile.extraPackages}

Extra Python packages available to Qtile.
An example would be to include `python3Packages.qtile-extras`
for additional unofficial widgets.

*Type:* function that evaluates to a(n) list of package

*Default:*

``` nix
python3Packages: with python3Packages; [];
```

*Example:*

``` nix
python3Packages: with python3Packages; [
  qtile-extras
];
```

*Declared by:* [`nixos/modules/services/x11/window-managers/qtile.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/qtile.nix)

## `services.xserver.windowManager.qtile.package` {#opt-services.xserver.windowManager.qtile.package}

The qtile package to use.

*Type:* package

*Default:* `pkgs.python3.pkgs.qtile`

*Declared by:* [`nixos/modules/services/x11/window-managers/qtile.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/qtile.nix)

## `services.xserver.windowManager.ratpoison.enable` {#opt-services.xserver.windowManager.ratpoison.enable}

Whether to enable ratpoison.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/ratpoison.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/ratpoison.nix)

## `services.xserver.windowManager.smallwm.enable` {#opt-services.xserver.windowManager.smallwm.enable}

Whether to enable smallwm.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/smallwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/smallwm.nix)

## `services.xserver.windowManager.spectrwm.enable` {#opt-services.xserver.windowManager.spectrwm.enable}

Whether to enable spectrwm.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/spectrwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/spectrwm.nix)

## `services.xserver.windowManager.stumpwm.enable` {#opt-services.xserver.windowManager.stumpwm.enable}

Whether to enable stumpwm.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/stumpwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/stumpwm.nix)

## `services.xserver.windowManager.stumpwm.package` {#opt-services.xserver.windowManager.stumpwm.package}

The stumpwm package to use.

*Type:* package

*Default:* `pkgs.stumpwm`

*Declared by:* [`nixos/modules/services/x11/window-managers/stumpwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/stumpwm.nix)

## `services.xserver.windowManager.tinywm.enable` {#opt-services.xserver.windowManager.tinywm.enable}

Whether to enable tinywm.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/tinywm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/tinywm.nix)

## `services.xserver.windowManager.twm.enable` {#opt-services.xserver.windowManager.twm.enable}

Whether to enable twm.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/twm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/twm.nix)

## `services.xserver.windowManager.vxwm.enable` {#opt-services.xserver.windowManager.vxwm.enable}

Whether to enable vxwm.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/vxwm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/vxwm.nix)

## `services.xserver.windowManager.windowlab.enable` {#opt-services.xserver.windowManager.windowlab.enable}

Whether to enable windowlab.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/windowlab.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/windowlab.nix)

## `services.xserver.windowManager.windowmaker.enable` {#opt-services.xserver.windowManager.windowmaker.enable}

Whether to enable windowmaker.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/windowmaker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/windowmaker.nix)

## `services.xserver.windowManager.wmderland.enable` {#opt-services.xserver.windowManager.wmderland.enable}

Whether to enable wmderland.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/wmderland.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/wmderland.nix)

## `services.xserver.windowManager.wmderland.extraPackages` {#opt-services.xserver.windowManager.wmderland.extraPackages}

Extra packages to be installed system wide.

*Type:* list of package

*Default:*

``` nix
with pkgs; [
  rofi
  dunst
  light
  hsetroot
  feh
  rxvt-unicode
]
```

*Declared by:* [`nixos/modules/services/x11/window-managers/wmderland.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/wmderland.nix)

## `services.xserver.windowManager.wmderland.extraSessionCommands` {#opt-services.xserver.windowManager.wmderland.extraSessionCommands}

Shell commands executed just before wmderland is started.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/x11/window-managers/wmderland.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/wmderland.nix)

## `services.xserver.windowManager.wmii.enable` {#opt-services.xserver.windowManager.wmii.enable}

Whether to enable wmii.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/wmii.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/wmii.nix)

## `services.xserver.windowManager.xmonad.config` {#opt-services.xserver.windowManager.xmonad.config}

Configuration from which XMonad gets compiled. If no value is
specified, a vanilla xmonad binary is put in PATH, which will
attempt to recompile and exec your xmonad config from $HOME/.xmonad.
This setup is then analogous to other (non-NixOS) linux distributions.

If you do set this option, you likely want to use "launch" as your
entry point for xmonad (as in the example), to avoid xmonad's
recompilation logic on startup. Doing so will render the default
"mod+q" restart key binding dysfunctional though, because that attempts
to call your binary with the "--restart" command line option, unless
you implement that yourself. You way mant to bind "mod+q" to
`(restart "xmonad" True)` instead, which will just restart
xmonad from PATH. This allows e.g. switching to the new xmonad binary
after rebuilding your system with nixos-rebuild.
For the same reason, ghc is not added to the environment when this
option is set, unless `enableConfiguredRecompile` is
set to `true`.

If you actually want to run xmonad with a config specified here, but
also be able to recompile and restart it from a copy of that source in
$HOME/.xmonad on the fly, set `enableConfiguredRecompile`
to `true` and implement something like "compileRestart"
from the example.
This should allow you to switch at will between the local xmonad and
the one NixOS puts in your PATH.

*Type:* null or absolute path or string

*Default:* `null`

*Example:*

``` nix
''
  import XMonad
  import XMonad.Util.EZConfig (additionalKeys)
  import Control.Monad (when)
  import Text.Printf (printf)
  import System.Posix.Process (executeFile)
  import System.Info (arch,os)
  import System.Environment (getArgs)
  import System.FilePath ((</>))
  
  compiledConfig = printf "xmonad-%s-%s" arch os
  
  myConfig = defaultConfig
    { modMask = mod4Mask -- Use Super instead of Alt
    , terminal = "urxvt" }
    `additionalKeys`
    [ ( (mod4Mask,xK_r), compileRestart True)
    , ( (mod4Mask,xK_q), restart "xmonad" True ) ]
  
  compileRestart resume = do
    dirs  <- asks directories
    whenX (recompile dirs True) $ do
      when resume writeStateToFile
      catchIO
          ( do
              args <- getArgs
              executeFile (cacheDir dirs </> compiledConfig) False args Nothing
          )
  
  main = getDirectories >>= launch myConfig
  
  --------------------------------------------
  {- For versions before 0.17.0 use this instead -}
  --------------------------------------------
  -- compileRestart resume =
  --   whenX (recompile True) $
  --     when resume writeStateToFile
  --       *> catchIO
  --         ( do
  --             dir <- getXMonadDataDir
  --             args <- getArgs
  --             executeFile (dir </> compiledConfig) False args Nothing
  --         )
  --
  -- main = launch myConfig
  --------------------------------------------
  
''
```

*Declared by:* [`nixos/modules/services/x11/window-managers/xmonad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/xmonad.nix)

## `services.xserver.windowManager.xmonad.enable` {#opt-services.xserver.windowManager.xmonad.enable}

Whether to enable xmonad.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/window-managers/xmonad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/xmonad.nix)

## `services.xserver.windowManager.xmonad.enableConfiguredRecompile` {#opt-services.xserver.windowManager.xmonad.enableConfiguredRecompile}

Enable recompilation even if `config` is set to a
non-null value. This adds the necessary Haskell dependencies (GHC with
packages) to the xmonad binary's environment.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/window-managers/xmonad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/xmonad.nix)

## `services.xserver.windowManager.xmonad.enableContribAndExtras` {#opt-services.xserver.windowManager.xmonad.enableContribAndExtras}

Enable xmonad-{contrib,extras} in Xmonad.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/window-managers/xmonad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/xmonad.nix)

## `services.xserver.windowManager.xmonad.extraPackages` {#opt-services.xserver.windowManager.xmonad.extraPackages}

Extra packages available to ghc when rebuilding Xmonad. The
value must be a function which receives the attrset defined
in `haskellPackages` as the sole argument.

*Type:* function that evaluates to a(n) list of package

*Default:* `self: []`

*Example:*

``` nix
haskellPackages: [
  haskellPackages.xmonad-contrib
  haskellPackages.monad-logger
]
```

*Declared by:* [`nixos/modules/services/x11/window-managers/xmonad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/xmonad.nix)

## `services.xserver.windowManager.xmonad.ghcArgs` {#opt-services.xserver.windowManager.xmonad.ghcArgs}

Command line arguments passed to the compiler (ghc)
invocation when xmonad.config is set.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/x11/window-managers/xmonad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/xmonad.nix)

## `services.xserver.windowManager.xmonad.haskellPackages` {#opt-services.xserver.windowManager.xmonad.haskellPackages}

haskellPackages used to build Xmonad and other packages.
This can be used to change the GHC version used to build
Xmonad and the packages listed in
`extraPackages`.

*Type:* attribute set

*Default:* `pkgs.haskellPackages`

*Example:* `pkgs.haskell.packages.ghc910`

*Declared by:* [`nixos/modules/services/x11/window-managers/xmonad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/xmonad.nix)

## `services.xserver.windowManager.xmonad.xmonadCliArgs` {#opt-services.xserver.windowManager.xmonad.xmonadCliArgs}

Command line arguments passed to the xmonad binary.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/x11/window-managers/xmonad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/window-managers/xmonad.nix)

## `services.xserver.xautolock.enable` {#opt-services.xserver.xautolock.enable}

Whether to enable xautolock.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/xautolock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xautolock.nix)

## `services.xserver.xautolock.enableNotifier` {#opt-services.xserver.xautolock.enableNotifier}

Whether to enable the notifier feature of xautolock.
This publishes a notification before the autolock.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/xautolock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xautolock.nix)

## `services.xserver.xautolock.extraOptions` {#opt-services.xserver.xautolock.extraOptions}

Additional command-line arguments to pass to
`xautolock`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-detectsleep"
]
```

*Declared by:* [`nixos/modules/services/x11/xautolock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xautolock.nix)

## `services.xserver.xautolock.killer` {#opt-services.xserver.xautolock.killer}

The script to use when nothing has happened for as long as `killtime`

*Type:* null or string

*Default:* `null`

*Example:* `"/run/current-system/systemd/bin/systemctl suspend"`

*Declared by:* [`nixos/modules/services/x11/xautolock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xautolock.nix)

## `services.xserver.xautolock.killtime` {#opt-services.xserver.xautolock.killtime}

Minutes xautolock waits until it executes the script specified in `killer`
(Has to be at least 10 minutes)

*Type:* signed integer

*Default:* `20`

*Declared by:* [`nixos/modules/services/x11/xautolock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xautolock.nix)

## `services.xserver.xautolock.locker` {#opt-services.xserver.xautolock.locker}

The script to use when automatically locking the computer.

*Type:* string

*Default:* `"${pkgs.xlockmore}/bin/xlock"`

*Example:* `"${pkgs.i3lock}/bin/i3lock -i /path/to/img"`

*Declared by:* [`nixos/modules/services/x11/xautolock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xautolock.nix)

## `services.xserver.xautolock.notifier` {#opt-services.xserver.xautolock.notifier}

Notification script to be used to warn about the pending autolock.

*Type:* null or string

*Default:* `null`

*Example:* `"${pkgs.libnotify}/bin/notify-send 'Locking in 10 seconds'"`

*Declared by:* [`nixos/modules/services/x11/xautolock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xautolock.nix)

## `services.xserver.xautolock.notify` {#opt-services.xserver.xautolock.notify}

Time (in seconds) before the actual lock when the notification about the pending lock should be published.

*Type:* signed integer

*Default:* `10`

*Declared by:* [`nixos/modules/services/x11/xautolock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xautolock.nix)

## `services.xserver.xautolock.nowlocker` {#opt-services.xserver.xautolock.nowlocker}

The script to use when manually locking the computer with `xautolock -locknow`.

*Type:* null or string

*Default:* `null`

*Example:* `"${pkgs.i3lock}/bin/i3lock -i /path/to/img"`

*Declared by:* [`nixos/modules/services/x11/xautolock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xautolock.nix)

## `services.xserver.xautolock.time` {#opt-services.xserver.xautolock.time}

Idle time (in minutes) to wait until xautolock locks the computer.

*Type:* signed integer

*Default:* `15`

*Declared by:* [`nixos/modules/services/x11/xautolock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xautolock.nix)

## `services.xserver.xkb.dir` {#opt-services.xserver.xkb.dir}

Path used for -xkbdir xserver parameter.

*Type:* absolute path

*Default:* `"${pkgs.xkeyboard_config}/etc/X11/xkb"`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.xkb.extraLayouts` {#opt-services.xserver.xkb.extraLayouts}

Extra custom layouts that will be included in the xkb configuration.
Information on how to create a new layout can be found here:
[https://www.x.org/releases/current/doc/xorg-docs/input/XKB-Enhancing.html#Defining\_New\_Layouts](https://www.x.org/releases/current/doc/xorg-docs/input/XKB-Enhancing.html#Defining_New_Layouts).
For more examples see
[https://wiki.archlinux.org/index.php/X\_KeyBoard\_extension#Basic\_examples](https://wiki.archlinux.org/index.php/X_KeyBoard_extension#Basic_examples)

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  mine = {
    description = "My custom xkb layout.";
    languages = [ "eng" ];
    symbolsFile = /path/to/my/layout;
  };
}
```

*Declared by:* [`nixos/modules/services/x11/extra-layouts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/extra-layouts.nix)

## `services.xserver.xkb.extraLayouts.<name>.compatFile` {#opt-services.xserver.xkb.extraLayouts._name_.compatFile}

The path to the xkb compat file.
This file sets the compatibility state, used to preserve
compatibility with xkb-unaware programs.
It must contain a `xkb_compat "name" { ... }` block.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/x11/extra-layouts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/extra-layouts.nix)

## `services.xserver.xkb.extraLayouts.<name>.description` {#opt-services.xserver.xkb.extraLayouts._name_.description}

A short description of the layout.

*Type:* string

*Declared by:* [`nixos/modules/services/x11/extra-layouts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/extra-layouts.nix)

## `services.xserver.xkb.extraLayouts.<name>.geometryFile` {#opt-services.xserver.xkb.extraLayouts._name_.geometryFile}

The path to the xkb geometry file.
This (completely optional) file describes the physical layout of
keyboard, which maybe be used by programs to depict it.
It must contain a `xkb_geometry "name" { ... }` block.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/x11/extra-layouts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/extra-layouts.nix)

## `services.xserver.xkb.extraLayouts.<name>.keycodesFile` {#opt-services.xserver.xkb.extraLayouts._name_.keycodesFile}

The path to the xkb keycodes file.
This file specifies the range and the interpretation of the raw
keycodes sent by the keyboard.
It must contain a `xkb_keycodes "name" { ... }` block.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/x11/extra-layouts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/extra-layouts.nix)

## `services.xserver.xkb.extraLayouts.<name>.languages` {#opt-services.xserver.xkb.extraLayouts._name_.languages}

A list of languages provided by the layout.
(Use ISO 639-2 codes, for example: "eng" for english)

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/x11/extra-layouts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/extra-layouts.nix)

## `services.xserver.xkb.extraLayouts.<name>.symbolsFile` {#opt-services.xserver.xkb.extraLayouts._name_.symbolsFile}

The path to the xkb symbols file.
This is the most important file: it defines which symbol or action
maps to each key and must contain a
`xkb_symbols "name" { ... }` block.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/x11/extra-layouts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/extra-layouts.nix)

## `services.xserver.xkb.extraLayouts.<name>.typesFile` {#opt-services.xserver.xkb.extraLayouts._name_.typesFile}

The path to the xkb types file.
This file specifies the key types that can be associated with
the various keyboard keys.
It must contain a `xkb_types "name" { ... }` block.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/x11/extra-layouts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/extra-layouts.nix)

## `services.xserver.xkb.layout` {#opt-services.xserver.xkb.layout}

X keyboard layout, or multiple keyboard layouts separated by commas.

*Type:* string

*Default:* `"us"`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.xkb.model` {#opt-services.xserver.xkb.model}

X keyboard model.

*Type:* string

*Default:* `"pc104"`

*Example:* `"presario"`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.xkb.options` {#opt-services.xserver.xkb.options}

X keyboard options; layout switching goes here.

*Type:* strings concatenated with ","

*Default:* `"terminate:ctrl_alt_bksp"`

*Example:* `"grp:caps_toggle,grp_led:scroll"`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.xkb.variant` {#opt-services.xserver.xkb.variant}

X keyboard variant.

*Type:* string

*Default:* `""`

*Example:* `"colemak"`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.xrandrHeads` {#opt-services.xserver.xrandrHeads}

Multiple monitor configuration, just specify a list of XRandR
outputs. The individual elements should be either simple strings or
an attribute set of output options.

If the element is a string, it is denoting the physical output for a
monitor, if it's an attribute set, you must at least provide the
`output` option.

The monitors will be mapped from left to right in the order of the
list.

By default, the first monitor will be set as the primary monitor if
none of the elements contain an option that has set
`primary` to `true`.

::: note
Only one monitor is allowed to be primary.
:::

Be careful using this option with multiple graphic adapters or with
drivers that have poor support for XRandR, unexpected things might
happen with those.

*Type:* list of ((submodule) or string convertible to it)

*Default:* `[ ]`

*Example:*

``` nix
[
  "HDMI-0"
  {
    output = "DVI-0";
    primary = true;
  }
  {
    monitorConfig = "Option \"Rotate\" \"left\"";
    output = "DVI-1";
  }
]
```

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.xrandrHeads.*.monitorConfig` {#opt-services.xserver.xrandrHeads._.monitorConfig}

Extra lines to append to the `Monitor` section
verbatim. Available options are documented in the MONITOR section in
`xorg.conf(5)`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  DisplaySize 408 306
  Option "DPMS" "false"
''
```

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.xrandrHeads.*.output` {#opt-services.xserver.xrandrHeads._.output}

The output name of the monitor, as shown by
`xrandr(1)` invoked without arguments.

*Type:* string

*Example:* `"DVI-0"`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)

## `services.xserver.xrandrHeads.*.primary` {#opt-services.xserver.xrandrHeads._.primary}

Whether this head is treated as the primary monitor,

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/xserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/xserver.nix)
