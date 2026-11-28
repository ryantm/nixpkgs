# services (Y) {#sec-options-services-y}

## `services.yandex-disk.directory` {#opt-services.yandex-disk.directory}

The directory to use for Yandex.Disk storage

*Type:* absolute path

*Default:* `"/home/Yandex.Disk"`

*Declared by:* [`nixos/modules/services/network-filesystems/yandex-disk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/yandex-disk.nix)

## `services.yandex-disk.enable` {#opt-services.yandex-disk.enable}

Whether to enable Yandex-disk client. See [https://disk.yandex.ru/](https://disk.yandex.ru/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/yandex-disk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/yandex-disk.nix)

## `services.yandex-disk.excludes` {#opt-services.yandex-disk.excludes}

Comma-separated list of directories which are excluded from synchronization.

*Type:* strings concatenated with ","

*Default:* `""`

*Example:* `"data,backup"`

*Declared by:* [`nixos/modules/services/network-filesystems/yandex-disk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/yandex-disk.nix)

## `services.yandex-disk.password` {#opt-services.yandex-disk.password}

Your yandex.com password. Warning: it will be world-readable in /nix/store.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/network-filesystems/yandex-disk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/yandex-disk.nix)

## `services.yandex-disk.user` {#opt-services.yandex-disk.user}

The user the yandex-disk daemon should run as.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/network-filesystems/yandex-disk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/yandex-disk.nix)

## `services.yandex-disk.username` {#opt-services.yandex-disk.username}

Your yandex.com login name.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/network-filesystems/yandex-disk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/yandex-disk.nix)

## `services.yarr.address` {#opt-services.yarr.address}

Address to run server on.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/misc/yarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/yarr.nix)

## `services.yarr.authFilePath` {#opt-services.yarr.authFilePath}

Path to a file containing username:password. `null` means no authentication required to use the service.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/yarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/yarr.nix)

## `services.yarr.baseUrl` {#opt-services.yarr.baseUrl}

Base path of the service url.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/yarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/yarr.nix)

## `services.yarr.enable` {#opt-services.yarr.enable}

Whether to enable Yet another rss reader.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/yarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/yarr.nix)

## `services.yarr.environmentFile` {#opt-services.yarr.environmentFile}

Environment file for specifying additional settings such as secrets.

See `yarr -help` for all available options.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/yarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/yarr.nix)

## `services.yarr.package` {#opt-services.yarr.package}

The yarr package to use.

*Type:* package

*Default:* `pkgs.yarr`

*Declared by:* [`nixos/modules/services/misc/yarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/yarr.nix)

## `services.yarr.port` {#opt-services.yarr.port}

Port to run server on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `7070`

*Declared by:* [`nixos/modules/services/misc/yarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/yarr.nix)

## `services.yggdrasil-jumper.appendListenAddresses` {#opt-services.yggdrasil-jumper.appendListenAddresses}

Append Yggdrasil router configuration with listeners on loopback
addresses (`127.0.0.1`) and preselected ports to support peering
using client-server protocols like `quic` and `tls`.

See `Listen` option in Yggdrasil router configuration.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/yggdrasil-jumper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/yggdrasil-jumper.nix)

## `services.yggdrasil-jumper.detectWireguard` {#opt-services.yggdrasil-jumper.detectWireguard}

Control whether `settings.wireguard = true` should automatically
provide CAP\_NET\_ADMIN capability and make the necessary packages
available to Yggdrasil Jumper service.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/yggdrasil-jumper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/yggdrasil-jumper.nix)

## `services.yggdrasil-jumper.enable` {#opt-services.yggdrasil-jumper.enable}

Whether to enable the Yggdrasil Jumper system service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/yggdrasil-jumper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/yggdrasil-jumper.nix)

## `services.yggdrasil-jumper.extraArgs` {#opt-services.yggdrasil-jumper.extraArgs}

Extra command line arguments for Yggdrasil Jumper.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/yggdrasil-jumper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/yggdrasil-jumper.nix)

## `services.yggdrasil-jumper.extraConfig` {#opt-services.yggdrasil-jumper.extraConfig}

Configuration for Yggdrasil Jumper in plaintext.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  listen_port = 9999;
  whitelist = [
    "<IPv6 address of a remote node>"
  ];
''
```

*Declared by:* [`nixos/modules/services/networking/yggdrasil-jumper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/yggdrasil-jumper.nix)

## `services.yggdrasil-jumper.logLevel` {#opt-services.yggdrasil-jumper.logLevel}

Set logging verbosity for Yggdrasil Jumper.

*Type:* one of "off", "error", "warn", "info", "debug", "trace"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/networking/yggdrasil-jumper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/yggdrasil-jumper.nix)

## `services.yggdrasil-jumper.package` {#opt-services.yggdrasil-jumper.package}

The yggdrasil-jumper package to use.

*Type:* package

*Default:* `pkgs.yggdrasil-jumper`

*Declared by:* [`nixos/modules/services/networking/yggdrasil-jumper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/yggdrasil-jumper.nix)

## `services.yggdrasil-jumper.retrieveListenAddresses` {#opt-services.yggdrasil-jumper.retrieveListenAddresses}

Automatically retrieve listen addresses from the Yggdrasil router configuration.

See `yggdrasil_listen` option in Yggdrasil Jumper configuration.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/yggdrasil-jumper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/yggdrasil-jumper.nix)

## `services.yggdrasil-jumper.settings` {#opt-services.yggdrasil-jumper.settings}

Configuration for Yggdrasil Jumper as a Nix attribute set.

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  listen_port = 9999;
  whitelist = [
    "<IPv6 address of a remote node>"
  ];
  wireguard = true;
}
```

*Declared by:* [`nixos/modules/services/networking/yggdrasil-jumper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/yggdrasil-jumper.nix)

## `services.yggdrasil.denyDhcpcdInterfaces` {#opt-services.yggdrasil.denyDhcpcdInterfaces}

Disable the DHCP client for any interface whose name matches
any of the shell glob patterns in this list.  Use this
option to prevent the DHCP client from broadcasting requests
on the yggdrasil network.  It is only necessary to do so
when yggdrasil is running in TAP mode, because TUN
interfaces do not support broadcasting.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "tap*"
]
```

*Declared by:* [`nixos/modules/services/networking/yggdrasil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/yggdrasil.nix)

## `services.yggdrasil.enable` {#opt-services.yggdrasil.enable}

Whether to enable the yggdrasil system service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/yggdrasil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/yggdrasil.nix)

## `services.yggdrasil.extraArgs` {#opt-services.yggdrasil.extraArgs}

Extra command line arguments.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-loglevel"
  "info"
]
```

*Declared by:* [`nixos/modules/services/networking/yggdrasil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/yggdrasil.nix)

## `services.yggdrasil.group` {#opt-services.yggdrasil.group}

Group to grant access to the Yggdrasil control socket. If `null`, only root can access the socket.

*Type:* null or string

*Default:* `null`

*Example:* `"wheel"`

*Declared by:* [`nixos/modules/services/networking/yggdrasil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/yggdrasil.nix)

## `services.yggdrasil.openMulticastPort` {#opt-services.yggdrasil.openMulticastPort}

Whether to open the UDP port used for multicast peer discovery. The
NixOS firewall blocks link-local communication, so in order to make
incoming local peering work you will also need to configure
`MulticastInterfaces` in your Yggdrasil configuration
(`settings`). You will then have to
add the ports that you configure there to your firewall configuration
([`networking.firewall.allowedTCPPorts`](../../options/networking/index.md#opt-networking.firewall.allowedTCPPorts) or
[`networking.firewall.interfaces.<name>.allowedTCPPorts`](../../options/networking/index.md#opt-networking.firewall.interfaces._name_.allowedTCPPorts)).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/yggdrasil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/yggdrasil.nix)

## `services.yggdrasil.package` {#opt-services.yggdrasil.package}

The yggdrasil package to use.

*Type:* package

*Default:* `pkgs.yggdrasil`

*Declared by:* [`nixos/modules/services/networking/yggdrasil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/yggdrasil.nix)

## `services.yggdrasil.persistentKeys` {#opt-services.yggdrasil.persistentKeys}

Whether to enable automatic generation and persistence of keys.
If enabled, a private key will be generated on first startup and stored
at /var/lib/yggdrasil/private.pem. This ensures the Yggdrasil node retains the same
IPv6 address across reboots.

If you have existing keys from a previous installation (in the old
keys.json format at /var/lib/yggdrasil/keys.json), they will be automatically
migrated to the new PEM format on first startup.

Note: This option is mutually exclusive with `settings.PrivateKeyPath`.
If you want to use externally managed keys, use `settings.PrivateKeyPath`
instead
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/yggdrasil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/yggdrasil.nix)

## `services.yggdrasil.settings` {#opt-services.yggdrasil.settings}

Configuration for yggdrasil, as a structured Nix attribute set.

If you specify settings here, they will be used as persistent
configuration and Yggdrasil will retain the same configuration
(including IPv6 address if keys are provided) across restarts.

If no settings are specified, ephemeral keys are generated
and the Yggdrasil interface will have a random IPv6 address
each time the service is started.

Use `settings.PrivateKeyPath` to securely load private
keys from files owned by root via systemd credentials.

The most important options have dedicated NixOS options above.
You can also specify any other yggdrasil configuration option directly.

For a complete list of available options, see:
https://yggdrasil-network.github.io/configurationref.html

You can use the command `nix-shell -p yggdrasil --run "yggdrasil -genconf"`
to generate default configuration values with documentation.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Example:*

``` nix
{
  IfMTU = 65535;
  IfName = "ygg0";
  Listen = [
    "tcp://0.0.0.0:xxxxx"
  ];
  Peers = [
    "tcp://aa.bb.cc.dd:eeeee"
    "tcp://[aaaa:bbbb:cccc:dddd::eeee]:fffff"
  ];
  PrivateKeyPath = "/run/secrets/yggdrasil-key";
}
```

*Declared by:* [`nixos/modules/services/networking/yggdrasil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/yggdrasil.nix)

## `services.yggdrasil.settings.AllowedPublicKeys` {#opt-services.yggdrasil.settings.AllowedPublicKeys}

List of peer public keys to allow incoming peering connections from.
If left empty, all connections are allowed by default.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/yggdrasil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/yggdrasil.nix)

## `services.yggdrasil.settings.Listen` {#opt-services.yggdrasil.settings.Listen}

Listen addresses for incoming connections.
You need listeners to accept incoming peerings from non-local nodes.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "tcp://0.0.0.0:xxxxx"
  "tls://[::]:yyyyy"
]
```

*Declared by:* [`nixos/modules/services/networking/yggdrasil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/yggdrasil.nix)

## `services.yggdrasil.settings.Peers` {#opt-services.yggdrasil.settings.Peers}

List of outbound peer connection strings.
Connection strings can contain options, see the yggdrasil documentation.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "tcp://aa.bb.cc.dd:eeeee"
  "tcp://[aaaa:bbbb:cccc:dddd::eeee]:fffff"
]
```

*Declared by:* [`nixos/modules/services/networking/yggdrasil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/yggdrasil.nix)

## `services.yggdrasil.settings.PrivateKeyPath` {#opt-services.yggdrasil.settings.PrivateKeyPath}

Path to the private key file on the host system.
When specified, the key will be loaded via systemd credentials
for secure access by the yggdrasil service.

Warning: Do not put private keys directly in the Nix store
as they would be world-readable!

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/yggdrasil-private-key"`

*Declared by:* [`nixos/modules/services/networking/yggdrasil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/yggdrasil.nix)

## `services.ympd.enable` {#opt-services.ympd.enable}

Whether to enable ympd, the MPD Web GUI.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/ympd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/ympd.nix)

## `services.ympd.mpd.host` {#opt-services.ympd.mpd.host}

The host where MPD is listening.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/audio/ympd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/ympd.nix)

## `services.ympd.mpd.port` {#opt-services.ympd.mpd.port}

The port where MPD is listening.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `config.services.mpd.settings.port`

*Example:* `6600`

*Declared by:* [`nixos/modules/services/audio/ympd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/ympd.nix)

## `services.ympd.webPort` {#opt-services.ympd.webPort}

The port where ympd's web interface will be available.

*Type:* string or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `"8080"`

*Example:* `"ssl://8080:/path/to/ssl-private-key.pem"`

*Declared by:* [`nixos/modules/services/audio/ympd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/ympd.nix)

## `services.yopass.enable` {#opt-services.yopass.enable}

Whether to enable Yopass, a secure way to share secrets and files.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/yopass.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/yopass.nix)

## `services.yopass.environmentFile` {#opt-services.yopass.environmentFile}

Path to a file in systemd `EnvironmentFile` format, for
settings that shouldn't land in the Nix store: `API_TOKEN`,
`WEBHOOK_SECRET`, `LICENSE_KEY`, `OIDC_CLIENT_SECRET`,
`OIDC_SESSION_KEY`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/yopass"`

*Declared by:* [`nixos/modules/services/web-apps/yopass.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/yopass.nix)

## `services.yopass.package` {#opt-services.yopass.package}

The yopass package to use.

*Type:* package

*Default:* `pkgs.yopass`

*Declared by:* [`nixos/modules/services/web-apps/yopass.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/yopass.nix)

## `services.yopass.settings` {#opt-services.yopass.settings}

yopass-server settings, passed as environment variables. Every
flag in [the upstream documentation](https://github.com/jhaals/yopass/blob/master/docs/server-options.md)
has an environment variable form (`--oidc-issuer` is
`OIDC_ISSUER`); use that name as the attribute. Booleans become
`true`/`false`, numbers are stringified and lists are joined
with commas. Anything left unset keeps yopass-server's own
default, except that the module binds `ADDRESS` to `127.0.0.1`
(expecting a reverse proxy in front) and points
`FILE_STORE_PATH` at `/var/lib/yopass/files` so uploads survive
restarts; both can be overridden here.

A `FILE_STORE_PATH` outside `/var/lib/yopass` is allow-listed
for writing automatically, but it must already exist and be
writable by the service, which runs as a dynamic user.

The module doesn't own the storage backend. With `DATABASE = "redis"` pointing at a local `services.redis.servers.<name>`,
add `systemd.services.yopass.after = [ "redis-<name>.service" ];`
yourself to avoid a startup race; the memcached unit name is
fixed, so that ordering is handled for you.

Secrets belong in [`services.yopass.environmentFile`](#opt-services.yopass.environmentFile)
rather than here, since this ends up in the Nix store.

*Type:* attribute set of (boolean or signed integer or string or list of string)

*Default:* `{ }`

*Example:*

``` nix
{
  DATABASE = "redis";
  MAX_FILE_SIZE = "10MB";
  PORT = 8080;
  REDIS = "redis://127.0.0.1:6379/0";
  TRUSTED_PROXIES = [
    "192.168.1.0/24"
    "10.0.0.0/8"
  ];
}
```

*Declared by:* [`nixos/modules/services/web-apps/yopass.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/yopass.nix)

## `services.your_spotify.clientPackage` {#opt-services.your_spotify.clientPackage}

Client package to use.

*Type:* package

*Declared by:* [`nixos/modules/services/web-apps/your_spotify.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/your_spotify.nix)

## `services.your_spotify.enable` {#opt-services.your_spotify.enable}

Whether to enable your\_spotify.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/your_spotify.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/your_spotify.nix)

## `services.your_spotify.enableLocalDB` {#opt-services.your_spotify.enableLocalDB}

Whether to enable a local mongodb instance.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/your_spotify.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/your_spotify.nix)

## `services.your_spotify.nginxVirtualHost` {#opt-services.your_spotify.nginxVirtualHost}

If set creates an nginx virtual host for the client.
In most cases this should be the CLIENT\_ENDPOINT without
protocol prefix.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/your_spotify.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/your_spotify.nix)

## `services.your_spotify.package` {#opt-services.your_spotify.package}

The your\_spotify package to use.

*Type:* package

*Default:* `pkgs.your_spotify`

*Declared by:* [`nixos/modules/services/web-apps/your_spotify.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/your_spotify.nix)

## `services.your_spotify.settings` {#opt-services.your_spotify.settings}

Your Spotify Configuration. Refer to [Your Spotify](https://github.com/Yooooomi/your_spotify) for definitions and values.

*Type:* open submodule of attribute set of string

*Example:*

``` nix
{
  CLIENT_ENDPOINT = "https://example.com";
  API_ENDPOINT = "https://api.example.com";
  SPOTIFY_PUBLIC = "spotify_client_id";
}
```

*Declared by:* [`nixos/modules/services/web-apps/your_spotify.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/your_spotify.nix)

## `services.your_spotify.settings.API_ENDPOINT` {#opt-services.your_spotify.settings.API_ENDPOINT}

The endpoint of your server
This api has to be reachable from the device you use the website from not from the server.
This means that for example you may need two nginx virtual hosts if you want to expose this on the
internet.
Has to include a protocol Prefix (e.g. `http://`)

*Type:* string

*Example:* `"https://localhost:3000"`

*Declared by:* [`nixos/modules/services/web-apps/your_spotify.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/your_spotify.nix)

## `services.your_spotify.settings.CLIENT_ENDPOINT` {#opt-services.your_spotify.settings.CLIENT_ENDPOINT}

The endpoint of your web application.
Has to include a protocol Prefix (e.g. `http://`)

*Type:* string

*Example:* `"https://your_spotify.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/your_spotify.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/your_spotify.nix)

## `services.your_spotify.settings.MONGO_ENDPOINT` {#opt-services.your_spotify.settings.MONGO_ENDPOINT}

The endpoint of the Mongo database.

*Type:* string

*Default:* `"mongodb://localhost:27017/your_spotify"`

*Declared by:* [`nixos/modules/services/web-apps/your_spotify.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/your_spotify.nix)

## `services.your_spotify.settings.PORT` {#opt-services.your_spotify.settings.PORT}

The port of the api server

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/web-apps/your_spotify.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/your_spotify.nix)

## `services.your_spotify.settings.SPOTIFY_PUBLIC` {#opt-services.your_spotify.settings.SPOTIFY_PUBLIC}

The public client ID of your Spotify application.
Refer to: [Creating the Spotify Application](https://github.com/Yooooomi/your_spotify#creating-the-spotify-application)

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/your_spotify.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/your_spotify.nix)

## `services.your_spotify.spotifySecretFile` {#opt-services.your_spotify.spotifySecretFile}

A file containing the secret key of your Spotify application.
Refer to: [Creating the Spotify Application](https://github.com/Yooooomi/your_spotify#creating-the-spotify-application).

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-apps/your_spotify.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/your_spotify.nix)

## `services.youtrack.address` {#opt-services.youtrack.address}

The interface youtrack will listen on.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/youtrack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/youtrack.nix)

## `services.youtrack.autoUpgrade` {#opt-services.youtrack.autoUpgrade}

Whether YouTrack should auto upgrade it without showing the upgrade dialog.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/youtrack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/youtrack.nix)

## `services.youtrack.enable` {#opt-services.youtrack.enable}

Whether to enable YouTrack service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/youtrack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/youtrack.nix)

## `services.youtrack.environmentalParameters` {#opt-services.youtrack.environmentalParameters}

Environmental configuration parameters, set imperatively. The values doesn't get removed, when removed in Nix.
See [https://www.jetbrains.com/help/youtrack/server/2023.3/youtrack-java-start-parameters.html#environmental-parameters](https://www.jetbrains.com/help/youtrack/server/2023.3/youtrack-java-start-parameters.html#environmental-parameters)
for more information.

*Type:* open submodule of attribute set of (signed integer or string or 16 bit unsigned integer; between 0 and 65535 (both inclusive))

*Default:* `{ }`

*Example:*

``` nix
{
  secure-mode = "tls";
}
```

*Declared by:* [`nixos/modules/services/web-apps/youtrack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/youtrack.nix)

## `services.youtrack.environmentalParameters.listen-address` {#opt-services.youtrack.environmentalParameters.listen-address}

The interface YouTrack will listen on.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/web-apps/youtrack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/youtrack.nix)

## `services.youtrack.environmentalParameters.listen-port` {#opt-services.youtrack.environmentalParameters.listen-port}

The port YouTrack will listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/web-apps/youtrack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/youtrack.nix)

## `services.youtrack.generalParameters` {#opt-services.youtrack.generalParameters}

General configuration parameters and other JVM options.
See [https://www.jetbrains.com/help/youtrack/server/2023.3/youtrack-java-start-parameters.html#general-parameters](https://www.jetbrains.com/help/youtrack/server/2023.3/youtrack-java-start-parameters.html#general-parameters)
for more information.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-Djetbrains.youtrack.admin.restore=true"
  "-Xmx1024m"
];
```

*Declared by:* [`nixos/modules/services/web-apps/youtrack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/youtrack.nix)

## `services.youtrack.package` {#opt-services.youtrack.package}

The youtrack package to use.

*Type:* package

*Default:* `pkgs.youtrack`

*Declared by:* [`nixos/modules/services/web-apps/youtrack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/youtrack.nix)

## `services.youtrack.statePath` {#opt-services.youtrack.statePath}

Path were the YouTrack state is stored.
To this path the base version (e.g. 2023\_1) of the used package will be appended.

*Type:* absolute path

*Default:* `"/var/lib/youtrack"`

*Declared by:* [`nixos/modules/services/web-apps/youtrack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/youtrack.nix)

## `services.youtrack.virtualHost` {#opt-services.youtrack.virtualHost}

Name of the nginx virtual host to use and setup.
If null, do not setup anything.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/youtrack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/youtrack.nix)

## `services.ytdl-sub.group` {#opt-services.ytdl-sub.group}

Group under which ytdl-sub runs.

*Type:* string

*Default:* `"ytdl-sub"`

*Declared by:* [`nixos/modules/services/misc/ytdl-sub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ytdl-sub.nix)

## `services.ytdl-sub.instances` {#opt-services.ytdl-sub.instances}

Configuration for ytdl-sub instances.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/ytdl-sub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ytdl-sub.nix)

## `services.ytdl-sub.instances.<name>.config` {#opt-services.ytdl-sub.instances._name_.config}

Configuration for ytdl-sub. See [https://ytdl-sub.readthedocs.io/en/latest/config\_reference/config\_yaml.html](https://ytdl-sub.readthedocs.io/en/latest/config_reference/config_yaml.html) for more information.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  presets = {
    "YouTube Playlist" = {
      download = "{subscription_value}";
      output_options = {
        file_name = "{channel}/{playlist_title}/{playlist_index_padded}_{title}.{ext}";
        maintain_download_archive = true;
        output_directory = "YouTube";
      };
    };
  };
}
```

*Declared by:* [`nixos/modules/services/misc/ytdl-sub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ytdl-sub.nix)

## `services.ytdl-sub.instances.<name>.enable` {#opt-services.ytdl-sub.instances._name_.enable}

Whether to enable ytdl-sub instance.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/ytdl-sub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ytdl-sub.nix)

## `services.ytdl-sub.instances.<name>.readWritePaths` {#opt-services.ytdl-sub.instances._name_.readWritePaths}

List of paths that ytdl-sub can write to.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/ytdl-sub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ytdl-sub.nix)

## `services.ytdl-sub.instances.<name>.schedule` {#opt-services.ytdl-sub.instances._name_.schedule}

How often to run ytdl-sub. See `systemd.time(7)` for the format.

*Type:* null or string

*Default:* `null`

*Example:* `"0/6:0"`

*Declared by:* [`nixos/modules/services/misc/ytdl-sub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ytdl-sub.nix)

## `services.ytdl-sub.instances.<name>.subscriptions` {#opt-services.ytdl-sub.instances._name_.subscriptions}

Subscriptions for ytdl-sub. See [https://ytdl-sub.readthedocs.io/en/latest/config\_reference/subscription\_yaml.html](https://ytdl-sub.readthedocs.io/en/latest/config_reference/subscription_yaml.html) for more information.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  "YouTube Playlist" = {
    "Some Playlist" = "https://www.youtube.com/playlist?list=...";
  };
}
```

*Declared by:* [`nixos/modules/services/misc/ytdl-sub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ytdl-sub.nix)

## `services.ytdl-sub.package` {#opt-services.ytdl-sub.package}

The ytdl-sub package to use.

*Type:* package

*Default:* `pkgs.ytdl-sub`

*Declared by:* [`nixos/modules/services/misc/ytdl-sub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ytdl-sub.nix)

## `services.ytdl-sub.user` {#opt-services.ytdl-sub.user}

User account under which ytdl-sub runs.

*Type:* string

*Default:* `"ytdl-sub"`

*Declared by:* [`nixos/modules/services/misc/ytdl-sub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ytdl-sub.nix)

## `services.yubikey-agent.enable` {#opt-services.yubikey-agent.enable}

Whether to start yubikey-agent when you log in.  Also sets
SSH\_AUTH\_SOCK to point at yubikey-agent.

Note that yubikey-agent will use whatever pinentry is
specified in programs.gnupg.agent.pinentryPackage.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/yubikey-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/yubikey-agent.nix)

## `services.yubikey-agent.package` {#opt-services.yubikey-agent.package}

The yubikey-agent package to use.

*Type:* package

*Default:* `pkgs.yubikey-agent`

*Declared by:* [`nixos/modules/services/security/yubikey-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/yubikey-agent.nix)
