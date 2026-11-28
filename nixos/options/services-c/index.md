# services (C) {#sec-options-services-c}

## `services.c2fmzq-server.bindIP` {#opt-services.c2fmzq-server.bindIP}

The local address to use.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/c2fmzq-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/c2fmzq-server.nix)

## `services.c2fmzq-server.enable` {#opt-services.c2fmzq-server.enable}

Whether to enable c2fmzq-server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/c2fmzq-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/c2fmzq-server.nix)

## `services.c2fmzq-server.package` {#opt-services.c2fmzq-server.package}

The c2fmzq package to use.

*Type:* package

*Default:* `pkgs.c2fmzq`

*Declared by:* [`nixos/modules/services/web-apps/c2fmzq-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/c2fmzq-server.nix)

## `services.c2fmzq-server.passphraseFile` {#opt-services.c2fmzq-server.passphraseFile}

Path to file containing the database passphrase

*Type:* string

*Example:* `"/run/secrets/c2fmzq/pwfile"`

*Declared by:* [`nixos/modules/services/web-apps/c2fmzq-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/c2fmzq-server.nix)

## `services.c2fmzq-server.port` {#opt-services.c2fmzq-server.port}

The local port to use.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/web-apps/c2fmzq-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/c2fmzq-server.nix)

## `services.c2fmzq-server.settings` {#opt-services.c2fmzq-server.settings}

Configuration for c2FmZQ-server passed as CLI arguments.
Run `c2FmZQ-server help` for supported values.

*Type:* open submodule of attribute set of (null or boolean or signed integer or string)

*Example:*

``` nix
{
  allow-new-accounts = true;
  auto-approve-new-accounts = true;
  enable-webapp = true;
  encrypt-metadata = true;
  verbose = 3;
}
```

*Declared by:* [`nixos/modules/services/web-apps/c2fmzq-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/c2fmzq-server.nix)

## `services.c2fmzq-server.settings.database` {#opt-services.c2fmzq-server.settings.database}

Path of the database

*Type:* string

*Default:* `"%S/c2fmzq-server/data"`

*Declared by:* [`nixos/modules/services/web-apps/c2fmzq-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/c2fmzq-server.nix)

## `services.c2fmzq-server.settings.verbose` {#opt-services.c2fmzq-server.settings.verbose}

The level of logging verbosity: 1:Error 2:Info 3:Debug

*Type:* integer between 1 and 3 (both inclusive)

*Default:* `2`

*Declared by:* [`nixos/modules/services/web-apps/c2fmzq-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/c2fmzq-server.nix)

## `services.cachefilesd.cacheDir` {#opt-services.cachefilesd.cacheDir}

Directory to contain filesystem cache.

*Type:* string

*Default:* `"/var/cache/fscache"`

*Declared by:* [`nixos/modules/services/network-filesystems/cachefilesd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/cachefilesd.nix)

## `services.cachefilesd.enable` {#opt-services.cachefilesd.enable}

Whether to enable cachefilesd network filesystems caching daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/cachefilesd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/cachefilesd.nix)

## `services.cachefilesd.extraConfig` {#opt-services.cachefilesd.extraConfig}

Additional configuration file entries. See `cachefilesd.conf(5)` for more information.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"brun 10%"`

*Declared by:* [`nixos/modules/services/network-filesystems/cachefilesd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/cachefilesd.nix)

## `services.cachix-agent.credentialsFile` {#opt-services.cachix-agent.credentialsFile}

Required file that needs to contain CACHIX\_AGENT\_TOKEN=...

*Type:* absolute path

*Default:* `"/etc/cachix-agent.token"`

*Declared by:* [`nixos/modules/services/system/cachix-agent/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cachix-agent/default.nix)

## `services.cachix-agent.enable` {#opt-services.cachix-agent.enable}

Whether to enable Cachix Deploy Agent: [https://docs.cachix.org/deploy/](https://docs.cachix.org/deploy/).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/system/cachix-agent/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cachix-agent/default.nix)

## `services.cachix-agent.host` {#opt-services.cachix-agent.host}

Cachix uri to use.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/system/cachix-agent/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cachix-agent/default.nix)

## `services.cachix-agent.name` {#opt-services.cachix-agent.name}

Agent name, usually same as the hostname

*Type:* string

*Default:* `"config.networking.hostName"`

*Declared by:* [`nixos/modules/services/system/cachix-agent/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cachix-agent/default.nix)

## `services.cachix-agent.package` {#opt-services.cachix-agent.package}

The cachix package to use.

*Type:* package

*Default:* `pkgs.cachix`

*Declared by:* [`nixos/modules/services/system/cachix-agent/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cachix-agent/default.nix)

## `services.cachix-agent.profile` {#opt-services.cachix-agent.profile}

Profile name, defaults to 'system' (NixOS).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/system/cachix-agent/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cachix-agent/default.nix)

## `services.cachix-agent.verbose` {#opt-services.cachix-agent.verbose}

Enable verbose output

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/system/cachix-agent/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cachix-agent/default.nix)

## `services.cachix-watch-store.cacheName` {#opt-services.cachix-watch-store.cacheName}

Cachix binary cache name

*Type:* string

*Declared by:* [`nixos/modules/services/system/cachix-watch-store.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cachix-watch-store.nix)

## `services.cachix-watch-store.cachixTokenFile` {#opt-services.cachix-watch-store.cachixTokenFile}

Required file that needs to contain the cachix auth token.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/system/cachix-watch-store.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cachix-watch-store.nix)

## `services.cachix-watch-store.compressionLevel` {#opt-services.cachix-watch-store.compressionLevel}

The compression level for ZSTD compression (between 0 and 16)

*Type:* null or integer between 0 and 16 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/system/cachix-watch-store.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cachix-watch-store.nix)

## `services.cachix-watch-store.enable` {#opt-services.cachix-watch-store.enable}

Whether to enable Cachix Watch Store: [https://docs.cachix.org](https://docs.cachix.org).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/system/cachix-watch-store.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cachix-watch-store.nix)

## `services.cachix-watch-store.host` {#opt-services.cachix-watch-store.host}

Cachix host to connect to

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/system/cachix-watch-store.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cachix-watch-store.nix)

## `services.cachix-watch-store.jobs` {#opt-services.cachix-watch-store.jobs}

Number of threads used for pushing store paths

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/system/cachix-watch-store.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cachix-watch-store.nix)

## `services.cachix-watch-store.package` {#opt-services.cachix-watch-store.package}

The cachix package to use.

*Type:* package

*Default:* `pkgs.cachix`

*Declared by:* [`nixos/modules/services/system/cachix-watch-store.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cachix-watch-store.nix)

## `services.cachix-watch-store.signingKeyFile` {#opt-services.cachix-watch-store.signingKeyFile}

Optional file containing a self-managed signing key to sign uploaded store paths.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/system/cachix-watch-store.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cachix-watch-store.nix)

## `services.cachix-watch-store.verbose` {#opt-services.cachix-watch-store.verbose}

Enable verbose output

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/system/cachix-watch-store.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cachix-watch-store.nix)

## `services.caddy.acmeCA` {#opt-services.caddy.acmeCA}

::: note
Sets the [`acme_ca` option](https://caddyserver.com/docs/caddyfile/options#acme-ca)
in the global options block of the resulting Caddyfile.
:::

The URL to the ACME CA's directory. It is strongly recommended to set
this to `https://acme-staging-v02.api.letsencrypt.org/directory` for
Let's Encrypt's [staging endpoint](https://letsencrypt.org/docs/staging-environment/)
while testing or in development.

Value `null` should be prefered for production setups,
as it omits the `acme_ca` option to enable
[automatic issuer fallback](https://caddyserver.com/docs/automatic-https#issuer-fallback).

*Type:* null or string

*Default:* `null`

*Example:* `"https://acme-v02.api.letsencrypt.org/directory"`

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.adapter` {#opt-services.caddy.adapter}

Name of the config adapter to use.
See [https://caddyserver.com/docs/config-adapters](https://caddyserver.com/docs/config-adapters)
for the full list.

If `null` is specified, the `--adapter` argument is omitted when
starting or restarting Caddy. Notably, this allows specification of a
configuration file in Caddy's native JSON format, as long as the
filename does not start with `Caddyfile` (in which case the `caddyfile`
adapter is implicitly enabled). See
[https://caddyserver.com/docs/command-line#caddy-run](https://caddyserver.com/docs/command-line#caddy-run) for details.

::: note
Any value other than `null` or `caddyfile` is only valid when providing
your own `configFile`.
:::

*Type:* null or string

*Default:*

``` nix
if ((cfg.configFile != configFile) || (baseNameOf cfg.configFile) == "Caddyfile") then "caddyfile" else null
```

*Example:* `nginx`

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.configFile` {#opt-services.caddy.configFile}

Override the configuration file used by Caddy. By default,
NixOS generates one automatically.

The configuration file is exposed at `/etc/caddy/caddy_config`.

*Type:* absolute path

*Default:* `"A Caddyfile automatically generated by values from services.caddy.*"`

*Example:*

``` nix
pkgs.writeText "Caddyfile" ''
  example.com

  root * /var/www/wordpress
  php_fastcgi unix//run/php/php-version-fpm.sock
  file_server
'';
```

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.dataDir` {#opt-services.caddy.dataDir}

The data directory for caddy.

::: note
If left as the default value this directory will automatically be created
before the Caddy server starts, otherwise you are responsible for ensuring
the directory exists with appropriate ownership and permissions.

Caddy v2 replaced `CADDYPATH` with XDG directories.
See [https://caddyserver.com/docs/conventions#file-locations](https://caddyserver.com/docs/conventions#file-locations).
:::

*Type:* absolute path

*Default:* `"/var/lib/caddy"`

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.email` {#opt-services.caddy.email}

Your email address. Mainly used when creating an ACME account with your
CA, and is highly recommended in case there are problems with your
certificates.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.enable` {#opt-services.caddy.enable}

Whether to enable Caddy web server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.enableReload` {#opt-services.caddy.enableReload}

Reload Caddy instead of restarting it when configuration file changes.

Note that enabling this option requires the [admin API](https://caddyserver.com/docs/caddyfile/options#admin)
to not be turned off.

If you enable this option, consider setting [`grace_period`](https://caddyserver.com/docs/caddyfile/options#grace-period)
to a non-infinite value in [`services.caddy.globalConfig`](#opt-services.caddy.globalConfig)
to prevent Caddy waiting for active connections to finish,
which could delay the reload essentially indefinitely.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.environmentFile` {#opt-services.caddy.environmentFile}

Environment file as defined in `systemd.exec(5)`.

You can use environment variables to pass secrets to the service without adding
them to the world-redable nix store.

```
# in configuration.nix
services.caddy.environmentFile = "/run/secrets/caddy.env";
services.caddy.globalConfig = ''
  {
    acme_ca https://acme.zerossl.com/v2/DV90
    acme_eab {
      key_id {$EAB_KEY_ID}
      mac_key {$EAB_MAC_KEY}
    }
  }
'';
```

```
# in /run/secrets/caddy.env
EAB_KEY_ID=secret
EAB_MAC_KEY=secret
```

Find more examples
[here](https://caddyserver.com/docs/caddyfile/concepts#environment-variables)

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/caddy.env"`

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.extraConfig` {#opt-services.caddy.extraConfig}

Additional lines of configuration appended to the automatically
generated `Caddyfile`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  example.com {
    encode gzip
    log
    root /srv/http
  }
''
```

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.globalConfig` {#opt-services.caddy.globalConfig}

Additional lines of configuration appended to the global config section
of the `Caddyfile`.

Refer to [https://caddyserver.com/docs/caddyfile/options#global-options](https://caddyserver.com/docs/caddyfile/options#global-options)
for details on supported values.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  debug
  servers {
    protocol {
      experimental_http3
    }
  }
''
```

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.group` {#opt-services.caddy.group}

Group under which caddy runs.

::: note
If left as the default value this group will automatically be created
on system activation, otherwise you are responsible for
ensuring the group exists before the Caddy service starts.
:::

*Type:* string

*Default:* `"caddy"`

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.httpPort` {#opt-services.caddy.httpPort}

The default port to listen on for HTTP traffic.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `80`

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.httpsPort` {#opt-services.caddy.httpsPort}

The default port to listen on for HTTPS traffic.
Will also be used for HTTP/3.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `443`

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.logDir` {#opt-services.caddy.logDir}

Directory for storing Caddy access logs.

::: note
If left as the default value this directory will automatically be created
before the Caddy server starts, otherwise the sysadmin is responsible for
ensuring the directory exists with appropriate ownership and permissions.
:::

*Type:* absolute path

*Default:* `"/var/log/caddy"`

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.logFormat` {#opt-services.caddy.logFormat}

Configuration for the default logger. See
[https://caddyserver.com/docs/caddyfile/options#log](https://caddyserver.com/docs/caddyfile/options#log)
for details.

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  level ERROR
''
```

*Example:*

``` nix
mkForce "level INFO";
```

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.openFirewall` {#opt-services.caddy.openFirewall}

Whether to enable opening the specified http(s) ports in the firewall.
Any port set to `null` will not be opened.

::: note
If you use other ports for your virtual hosts, you need to open them manually.
:::

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.package` {#opt-services.caddy.package}

The caddy package to use.

*Type:* package

*Default:* `pkgs.caddy`

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.resume` {#opt-services.caddy.resume}

Use saved config, if any (and prefer over any specified configuration passed with `--config`).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.settings` {#opt-services.caddy.settings}

Structured configuration for Caddy to generate a Caddy JSON configuration file.
See [https://caddyserver.com/docs/json/](https://caddyserver.com/docs/json/) for available options.

::: warning
Using a [Caddyfile](https://caddyserver.com/docs/caddyfile) instead of a JSON config is highly recommended by upstream.
There are only very few exception to this.

Please use a Caddyfile via [`services.caddy.configFile`](#opt-services.caddy.configFile), [`services.caddy.virtualHosts`](#opt-services.caddy.virtualHosts) or
[`services.caddy.extraConfig`](#opt-services.caddy.extraConfig) with [`services.caddy.globalConfig`](#opt-services.caddy.globalConfig) instead.
:::

::: note
Takes presence over most `services.caddy.*` options, such as [`services.caddy.configFile`](#opt-services.caddy.configFile) and [`services.caddy.virtualHosts`](#opt-services.caddy.virtualHosts), if specified.
:::

*Type:* JSON value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.user` {#opt-services.caddy.user}

User account under which caddy runs.

::: note
If left as the default value this user will automatically be created
on system activation, otherwise you are responsible for
ensuring the user exists before the Caddy service starts.
:::

*Type:* string

*Default:* `"caddy"`

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.virtualHosts` {#opt-services.caddy.virtualHosts}

Declarative specification of virtual hosts served by Caddy.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "hydra.example.com" = {
    serverAliases = [ "www.hydra.example.com" ];
    extraConfig = ''
      encode gzip
      root * /srv/http
    '';
  };
};
```

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.virtualHosts.<name>.extraConfig` {#opt-services.caddy.virtualHosts._name_.extraConfig}

Additional lines of configuration appended to this virtual host in the
automatically generated `Caddyfile`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.virtualHosts.<name>.hostName` {#opt-services.caddy.virtualHosts._name_.hostName}

Canonical hostname for the server.

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.virtualHosts.<name>.listenAddresses` {#opt-services.caddy.virtualHosts._name_.listenAddresses}

A list of host interfaces to bind to for this virtual host.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "127.0.0.1"
  "::1"
]
```

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.virtualHosts.<name>.logFormat` {#opt-services.caddy.virtualHosts._name_.logFormat}

Configuration for HTTP request logging (also known as access logs). See
[https://caddyserver.com/docs/caddyfile/directives/log#log](https://caddyserver.com/docs/caddyfile/directives/log#log)
for details.

*Type:* null or strings concatenated with "\\n"

*Default:*

``` nix
''
  output file ''${config.services.caddy.logDir}/access-''${hostName}.log
''
```

*Example:*

``` nix
mkForce ''
  output discard
'';
```

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.virtualHosts.<name>.serverAliases` {#opt-services.caddy.virtualHosts._name_.serverAliases}

Additional names of virtual hosts served by this virtual host configuration.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "www.example.org"
  "example.org"
]
```

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.caddy.virtualHosts.<name>.useACMEHost` {#opt-services.caddy.virtualHosts._name_.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is mostly useful if you use DNS challenges but Caddy does not
currently support your provider.

*Note that this option does not create any certificates, nor
does it add subdomains to existing ones – you will need to create them
manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/caddy/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/default.nix)

## `services.cadvisor.enable` {#opt-services.cadvisor.enable}

Whether to enable Cadvisor service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/cadvisor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/cadvisor.nix)

## `services.cadvisor.extraOptions` {#opt-services.cadvisor.extraOptions}

Additional cadvisor options.

See [https://github.com/google/cadvisor/blob/master/docs/runtime\_options.md](https://github.com/google/cadvisor/blob/master/docs/runtime_options.md) for available options.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/cadvisor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/cadvisor.nix)

## `services.cadvisor.listenAddress` {#opt-services.cadvisor.listenAddress}

Cadvisor listening host

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/monitoring/cadvisor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/cadvisor.nix)

## `services.cadvisor.port` {#opt-services.cadvisor.port}

Cadvisor listening port

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/monitoring/cadvisor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/cadvisor.nix)

## `services.cadvisor.storageDriver` {#opt-services.cadvisor.storageDriver}

Cadvisor storage driver.

*Type:* null or string

*Default:* `null`

*Example:* `"influxdb"`

*Declared by:* [`nixos/modules/services/monitoring/cadvisor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/cadvisor.nix)

## `services.cadvisor.storageDriverDb` {#opt-services.cadvisor.storageDriverDb}

Cadvisord storage driver database name.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/monitoring/cadvisor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/cadvisor.nix)

## `services.cadvisor.storageDriverHost` {#opt-services.cadvisor.storageDriverHost}

Cadvisor storage driver host.

*Type:* string

*Default:* `"localhost:8086"`

*Declared by:* [`nixos/modules/services/monitoring/cadvisor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/cadvisor.nix)

## `services.cadvisor.storageDriverPassword` {#opt-services.cadvisor.storageDriverPassword}

Cadvisor storage driver password.

Warning: this password is stored in the world-readable Nix store. It's
recommended to use the `storageDriverPasswordFile` option
since that gives you control over the security of the password.
`storageDriverPasswordFile` also takes precedence over `storageDriverPassword`.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/monitoring/cadvisor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/cadvisor.nix)

## `services.cadvisor.storageDriverPasswordFile` {#opt-services.cadvisor.storageDriverPasswordFile}

File that contains the cadvisor storage driver password.

`storageDriverPasswordFile` takes precedence over `storageDriverPassword`

Warning: when `storageDriverPassword` is non-empty this defaults to a file in the
world-readable Nix store that contains the value of `storageDriverPassword`.

It's recommended to override this with a path not in the Nix store.
Tip: use [nixops key management](https://nixos.org/nixops/manual/#idm140737318306400)

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/cadvisor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/cadvisor.nix)

## `services.cadvisor.storageDriverSecure` {#opt-services.cadvisor.storageDriverSecure}

Cadvisor storage driver, enable secure communication.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/cadvisor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/cadvisor.nix)

## `services.cadvisor.storageDriverUser` {#opt-services.cadvisor.storageDriverUser}

Cadvisor storage driver username.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/monitoring/cadvisor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/cadvisor.nix)

## `services.cage.enable` {#opt-services.cage.enable}

Whether to enable cage kiosk service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/wayland/cage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/wayland/cage.nix)

## `services.cage.environment` {#opt-services.cage.environment}

Additional environment variables to pass to Cage.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  WLR_LIBINPUT_NO_DEVICES = "1";
}
```

*Declared by:* [`nixos/modules/services/wayland/cage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/wayland/cage.nix)

## `services.cage.extraArguments` {#opt-services.cage.extraArguments}

Additional command line arguments to pass to Cage.

*Type:* list of string

*Default:* `[]`

*Example:*

``` nix
[
  "-d"
]
```

*Declared by:* [`nixos/modules/services/wayland/cage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/wayland/cage.nix)

## `services.cage.package` {#opt-services.cage.package}

The cage package to use.

*Type:* package

*Default:* `pkgs.cage`

*Declared by:* [`nixos/modules/services/wayland/cage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/wayland/cage.nix)

## `services.cage.program` {#opt-services.cage.program}

Program to run in cage.

*Type:* absolute path

*Default:* `"${pkgs.xterm}/bin/xterm"`

*Declared by:* [`nixos/modules/services/wayland/cage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/wayland/cage.nix)

## `services.cage.restartIfChanged` {#opt-services.cage.restartIfChanged}

Whether to restart the 'cage-tty1' service when its configuration changes.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/wayland/cage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/wayland/cage.nix)

## `services.cage.user` {#opt-services.cage.user}

User to log-in as.

*Type:* string

*Default:* `"demo"`

*Declared by:* [`nixos/modules/services/wayland/cage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/wayland/cage.nix)

## `services.calibre-server.auth.enable` {#opt-services.calibre-server.auth.enable}

Password based authentication to access the server.
See the [calibre-server documentation](https://manual.calibre-ebook.com/generated/en/calibre-server.html#cmdoption-calibre-server-enable-auth) for details.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/calibre-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/calibre-server.nix)

## `services.calibre-server.auth.mode` {#opt-services.calibre-server.auth.mode}

Choose the type of authentication used.
Set the HTTP authentication mode used by the server.
See the [calibre-server documentation](https://manual.calibre-ebook.com/generated/en/calibre-server.html#cmdoption-calibre-server-auth-mode) for details.

*Type:* one of "auto", "basic", "digest"

*Default:* `"auto"`

*Declared by:* [`nixos/modules/services/misc/calibre-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/calibre-server.nix)

## `services.calibre-server.auth.userDb` {#opt-services.calibre-server.auth.userDb}

Choose users database file to use for authentication.
Make sure users database file is initialized before service startup.
See the [calibre-server documentation](https://manual.calibre-ebook.com/server.html#managing-user-accounts-from-the-command-line-only) for details.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/calibre-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/calibre-server.nix)

## `services.calibre-server.enable` {#opt-services.calibre-server.enable}

Whether to enable calibre-server (e-book software).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/calibre-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/calibre-server.nix)

## `services.calibre-server.extraFlags` {#opt-services.calibre-server.extraFlags}

Extra flags to pass to the calibre-server command.
See the [calibre-server documentation](https://manual.calibre-ebook.com/generated/en/calibre-server.html) for details.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/calibre-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/calibre-server.nix)

## `services.calibre-server.group` {#opt-services.calibre-server.group}

The group under which calibre-server runs.

*Type:* string

*Default:* `"calibre-server"`

*Declared by:* [`nixos/modules/services/misc/calibre-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/calibre-server.nix)

## `services.calibre-server.host` {#opt-services.calibre-server.host}

The interface on which to listen for connections.
See the [calibre-server documentation](https://manual.calibre-ebook.com/generated/en/calibre-server.html#cmdoption-calibre-server-listen-on) for details.

*Type:* string

*Default:* `"0.0.0.0"`

*Example:* `"::1"`

*Declared by:* [`nixos/modules/services/misc/calibre-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/calibre-server.nix)

## `services.calibre-server.libraries` {#opt-services.calibre-server.libraries}

Make sure each library path is initialized before service startup.
The directories of the libraries to serve. They must be readable for the user under which the server runs.
See the [calibredb documentation](https://manual.calibre-ebook.com/generated/en/calibredb.html#add) for details.

*Type:* list of absolute path

*Default:*

``` nix
[
  "/var/lib/calibre-server"
]
```

*Declared by:* [`nixos/modules/services/misc/calibre-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/calibre-server.nix)

## `services.calibre-server.openFirewall` {#opt-services.calibre-server.openFirewall}

Open ports in the firewall for the Calibre Server web interface.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/calibre-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/calibre-server.nix)

## `services.calibre-server.package` {#opt-services.calibre-server.package}

The calibre package to use.

*Type:* package

*Default:* `pkgs.calibre`

*Declared by:* [`nixos/modules/services/misc/calibre-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/calibre-server.nix)

## `services.calibre-server.port` {#opt-services.calibre-server.port}

The port on which to listen for connections.
See the [calibre-server documentation](https://manual.calibre-ebook.com/generated/en/calibre-server.html#cmdoption-calibre-server-port) for details.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/misc/calibre-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/calibre-server.nix)

## `services.calibre-server.user` {#opt-services.calibre-server.user}

The user under which calibre-server runs.

*Type:* string

*Default:* `"calibre-server"`

*Declared by:* [`nixos/modules/services/misc/calibre-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/calibre-server.nix)

## `services.calibre-web.calibrePackage` {#opt-services.calibre-web.calibrePackage}

The calibre package to use.

*Type:* package

*Default:* `pkgs.calibre`

*Declared by:* [`nixos/modules/services/web-apps/calibre-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/calibre-web.nix)

## `services.calibre-web.dataDir` {#opt-services.calibre-web.dataDir}

Where Calibre-Web stores its data.
Either an absolute path, or the directory name below `/var/lib`.

*Type:* string

*Default:* `"calibre-web"`

*Declared by:* [`nixos/modules/services/web-apps/calibre-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/calibre-web.nix)

## `services.calibre-web.enable` {#opt-services.calibre-web.enable}

Whether to enable Calibre-Web.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/calibre-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/calibre-web.nix)

## `services.calibre-web.group` {#opt-services.calibre-web.group}

Group account under which Calibre-Web runs.

*Type:* string

*Default:* `"calibre-web"`

*Declared by:* [`nixos/modules/services/web-apps/calibre-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/calibre-web.nix)

## `services.calibre-web.listen.ip` {#opt-services.calibre-web.listen.ip}

IP address that Calibre-Web should listen on.

*Type:* string

*Default:* `"::1"`

*Declared by:* [`nixos/modules/services/web-apps/calibre-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/calibre-web.nix)

## `services.calibre-web.listen.port` {#opt-services.calibre-web.listen.port}

Listen port for Calibre-Web.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8083`

*Declared by:* [`nixos/modules/services/web-apps/calibre-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/calibre-web.nix)

## `services.calibre-web.openFirewall` {#opt-services.calibre-web.openFirewall}

Open ports in the firewall for the server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/calibre-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/calibre-web.nix)

## `services.calibre-web.options.calibreLibrary` {#opt-services.calibre-web.options.calibreLibrary}

Path to Calibre library.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/calibre-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/calibre-web.nix)

## `services.calibre-web.options.calibreSplitBookDirectory` {#opt-services.calibre-web.options.calibreSplitBookDirectory}

Path to directory to store ebook files.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/calibre-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/calibre-web.nix)

## `services.calibre-web.options.enableBookConversion` {#opt-services.calibre-web.options.enableBookConversion}

Configure path to the Calibre's ebook-convert in the DB.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/calibre-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/calibre-web.nix)

## `services.calibre-web.options.enableBookUploading` {#opt-services.calibre-web.options.enableBookUploading}

Allow books to be uploaded via Calibre-Web UI.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/calibre-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/calibre-web.nix)

## `services.calibre-web.options.enableKepubify` {#opt-services.calibre-web.options.enableKepubify}

Whether to enable kepub conversion support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/calibre-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/calibre-web.nix)

## `services.calibre-web.options.reverseProxyAuth.enable` {#opt-services.calibre-web.options.reverseProxyAuth.enable}

Enable authorization using auth proxy.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/calibre-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/calibre-web.nix)

## `services.calibre-web.options.reverseProxyAuth.header` {#opt-services.calibre-web.options.reverseProxyAuth.header}

Auth proxy header name.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/calibre-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/calibre-web.nix)

## `services.calibre-web.package` {#opt-services.calibre-web.package}

The calibre-web package to use.

*Type:* package

*Default:* `pkgs.calibre-web`

*Declared by:* [`nixos/modules/services/web-apps/calibre-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/calibre-web.nix)

## `services.calibre-web.user` {#opt-services.calibre-web.user}

User account under which Calibre-Web runs.

*Type:* string

*Default:* `"calibre-web"`

*Declared by:* [`nixos/modules/services/web-apps/calibre-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/calibre-web.nix)

## `services.canaille.enable` {#opt-services.canaille.enable}

Whether to enable Canaille.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/canaille.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/canaille.nix)

## `services.canaille.jwtPrivateKeyFile` {#opt-services.canaille.jwtPrivateKeyFile}

File containing the JWT private key. Make sure it has appropriate permissions.

You can generate one using

```
openssl genrsa -out private.pem 4096
openssl rsa -in private.pem -pubout -outform PEM -out public.pem
```

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/canaille.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/canaille.nix)

## `services.canaille.ldapBindPasswordFile` {#opt-services.canaille.ldapBindPasswordFile}

File containing the LDAP bind password.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/canaille.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/canaille.nix)

## `services.canaille.package` {#opt-services.canaille.package}

The canaille package to use.

*Type:* package

*Default:* `pkgs.canaille`

*Declared by:* [`nixos/modules/services/security/canaille.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/canaille.nix)

## `services.canaille.secretKeyFile` {#opt-services.canaille.secretKeyFile}

File containing the Flask secret key. Its content is going to be
provided to Canaille as `SECRET_KEY`. Make sure it has appropriate
permissions. For example, copy the output of this to the specified
file:

```
python3 -c 'import secrets; print(secrets.token_hex())'
```

*Type:* absolute path

*Declared by:* [`nixos/modules/services/security/canaille.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/canaille.nix)

## `services.canaille.settings` {#opt-services.canaille.settings}

Settings for Canaille. See [the documentation](https://canaille.readthedocs.io/en/latest/references/configuration.html) for details.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/canaille.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/canaille.nix)

## `services.canaille.settings.CANAILLE.ACL` {#opt-services.canaille.settings.CANAILLE.ACL}

Access Control Lists.

See also [the documentation](https://canaille.readthedocs.io/en/latest/references/configuration.html#canaille.core.configuration.ACLSettings).

*Type:* null or (open submodule of (TOML value))

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/canaille.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/canaille.nix)

## `services.canaille.settings.CANAILLE.SMTP` {#opt-services.canaille.settings.CANAILLE.SMTP}

SMTP configuration. By default, sending emails is not enabled.

Set to an empty attrs to send emails from localhost without
authentication.

See also [the documentation](https://canaille.readthedocs.io/en/latest/references/configuration.html#canaille.core.configuration.SMTPSettings).

*Type:* null or (open submodule of (TOML value))

*Default:* `null`

*Example:* `{ }`

*Declared by:* [`nixos/modules/services/security/canaille.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/canaille.nix)

## `services.canaille.settings.CANAILLE.SMTP.PASSWORD` {#opt-services.canaille.settings.CANAILLE.SMTP.PASSWORD}

SMTP Password. Can't be set and has to be provided using
`services.canaille.smtpPasswordFile`.

*Type:* null or string

*Default:* `null`

*Read only*

*Declared by:* [`nixos/modules/services/security/canaille.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/canaille.nix)

## `services.canaille.settings.CANAILLE_LDAP` {#opt-services.canaille.settings.CANAILLE_LDAP}

Configuration for the LDAP backend. This storage backend is not
yet supported by the module, so use at your own risk!

*Type:* null or (open submodule of (TOML value))

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/canaille.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/canaille.nix)

## `services.canaille.settings.CANAILLE_LDAP.BIND_PW` {#opt-services.canaille.settings.CANAILLE_LDAP.BIND_PW}

The LDAP bind password. Can't be set and has to be provided using
`services.canaille.ldapBindPasswordFile`.

*Type:* null or string

*Default:* `null`

*Read only*

*Declared by:* [`nixos/modules/services/security/canaille.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/canaille.nix)

## `services.canaille.settings.CANAILLE_OIDC` {#opt-services.canaille.settings.CANAILLE_OIDC}

OpenID Connect settings. See [the documentation](https://canaille.readthedocs.io/en/latest/references/configuration.html#canaille.oidc.configuration.OIDCSettings).

*Type:* null or (open submodule of (TOML value))

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/canaille.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/canaille.nix)

## `services.canaille.settings.CANAILLE_OIDC.JWT.PRIVATE_KEY` {#opt-services.canaille.settings.CANAILLE_OIDC.JWT.PRIVATE_KEY}

JWT private key. Can't be set and has to be provided using
`services.canaille.jwtPrivateKeyFile`.

*Type:* null or string

*Default:* `null`

*Read only*

*Declared by:* [`nixos/modules/services/security/canaille.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/canaille.nix)

## `services.canaille.settings.CANAILLE_SQL.DATABASE_URI` {#opt-services.canaille.settings.CANAILLE_SQL.DATABASE_URI}

The SQL server URI. Will configure a local PostgreSQL db if
left to default. Please note that the NixOS module only really
supports PostgreSQL for now. Change at your own risk!

*Type:* string

*Default:* `"postgresql://localhost/canaille?host=/run/postgresql"`

*Declared by:* [`nixos/modules/services/security/canaille.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/canaille.nix)

## `services.canaille.settings.PREFERRED_URL_SCHEME` {#opt-services.canaille.settings.PREFERRED_URL_SCHEME}

The url scheme by which canaille will be served.

*Type:* one of "http", "https"

*Default:* `"https"`

*Declared by:* [`nixos/modules/services/security/canaille.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/canaille.nix)

## `services.canaille.settings.SECRET_KEY` {#opt-services.canaille.settings.SECRET_KEY}

Flask Secret Key. Can't be set and must be provided through
`services.canaille.settings.secretKeyFile`.

*Type:* null or string

*Default:* `null`

*Read only*

*Declared by:* [`nixos/modules/services/security/canaille.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/canaille.nix)

## `services.canaille.settings.SERVER_NAME` {#opt-services.canaille.settings.SERVER_NAME}

The domain name on which canaille will be served.

*Type:* string

*Example:* `"auth.example.org"`

*Declared by:* [`nixos/modules/services/security/canaille.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/canaille.nix)

## `services.canaille.smtpPasswordFile` {#opt-services.canaille.smtpPasswordFile}

File containing the SMTP password. Make sure it has appropriate permissions.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/canaille.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/canaille.nix)

## `services.canto-daemon.enable` {#opt-services.canto-daemon.enable}

Whether to enable the canto RSS daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/canto-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/canto-daemon.nix)

## `services.cardwired.enable` {#opt-services.cardwired.enable}

Whether to enable Cardwire eBPF-based GPU manager daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/cardwired.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/cardwired.nix)

## `services.cardwired.package` {#opt-services.cardwired.package}

The cardwire package to use.

*Type:* package

*Default:* `pkgs.cardwire`

*Declared by:* [`nixos/modules/services/hardware/cardwired.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/cardwired.nix)

## `services.cardwired.settings` {#opt-services.cardwired.settings}

Configuration for `/etc/cardwire.toml`
See [https://opengamingcollective.github.io/cardwire/getting-started/usage](https://opengamingcollective.github.io/cardwire/getting-started/usage)

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/hardware/cardwired.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/cardwired.nix)

## `services.cardwired.settings.auto_apply_gpu_state` {#opt-services.cardwired.settings.auto_apply_gpu_state}

Automatically restore GPU states on manual mode.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/hardware/cardwired.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/cardwired.nix)

## `services.cardwired.settings.battery_auto_switch` {#opt-services.cardwired.settings.battery_auto_switch}

Automatically switch mode on AC power.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/cardwired.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/cardwired.nix)

## `services.cardwired.settings.battery_auto_switch_mode` {#opt-services.cardwired.settings.battery_auto_switch_mode}

The mode cardwire switches on AC power.

*Type:* one of "integrated", "hybrid", "manual", "smart"

*Default:* `"hybrid"`

*Declared by:* [`nixos/modules/services/hardware/cardwired.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/cardwired.nix)

## `services.cardwired.settings.experimental_nvidia_block` {#opt-services.cardwired.settings.experimental_nvidia_block}

Enable blocking specifics Nvidia files. This setting is experimental
because these files can be shared across multiple Nvidia GPUs.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/cardwired.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/cardwired.nix)

## `services.cardwired.settings.external_display_auto_switch` {#opt-services.cardwired.settings.external_display_auto_switch}

Automatically make GPUs available for displays connected to dGPU-only ports.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/cardwired.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/cardwired.nix)

## `services.cassandra.allowClients` {#opt-services.cassandra.allowClients}

Enables or disables the native transport server (CQL binary protocol).
This server uses the same address as the `rpcAddress`,
but the port it uses is not `rpc_port` but
`native_transport_port`. See the official Cassandra
docs for more information on these variables and set them using
`extraConfig`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.clusterName` {#opt-services.cassandra.clusterName}

The name of the cluster.
This setting prevents nodes in one logical cluster from joining
another. All nodes in a cluster must have the same value.

*Type:* string

*Default:* `"Test Cluster"`

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.enable` {#opt-services.cassandra.enable}

Whether to enable Apache Cassandra – Scalable and highly available database
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.extraConfig` {#opt-services.cassandra.extraConfig}

Extra options to be merged into `cassandra.yaml` as nix attribute set.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  commitlog_sync_batch_window_in_ms = 3;
}
```

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.extraEnvSh` {#opt-services.cassandra.extraEnvSh}

Extra shell lines to be appended onto `cassandra-env.sh`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"CLASSPATH=$CLASSPATH:${extraJar}"`

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.fullRepairInterval` {#opt-services.cassandra.fullRepairInterval}

Set the interval how often full repairs are run, i.e.
`nodetool repair --full` is executed. See
[https://cassandra.apache.org/doc/latest/operating/repair.html](https://cassandra.apache.org/doc/latest/operating/repair.html)
for more information.

Set to `null` to disable full repairs.

*Type:* null or string

*Default:* `"3w"`

*Example:* `null`

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.fullRepairOptions` {#opt-services.cassandra.fullRepairOptions}

Options passed through to the full repair command.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--partitioner-range"
]
```

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.group` {#opt-services.cassandra.group}

Run Apache Cassandra under this group.

*Type:* string

*Default:* `"cassandra"`

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.heapNewSize` {#opt-services.cassandra.heapNewSize}

Must be left blank or set together with `heapNewSize`.
If left blank a sensible value for the available amount of RAM and CPU
cores is calculated.

Override to set the amount of memory to allocate to the JVM at
start-up. For production use you may wish to adjust this for your
environment. `HEAP_NEWSIZE` refers to the size of the young
generation.

The main trade-off for the young generation is that the larger it
is, the longer GC pause times will be. The shorter it is, the more
expensive GC will be (usually).

The example `HEAP_NEWSIZE` assumes a modern 8-core+ machine for decent pause
times. If in doubt, and if you do not particularly want to tweak, go with
100 MB per physical CPU core.

*Type:* null or string

*Default:* `null`

*Example:* `"800M"`

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.homeDir` {#opt-services.cassandra.homeDir}

Home directory for Apache Cassandra.

*Type:* absolute path

*Default:* `"/var/lib/cassandra"`

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.incrementalRepairInterval` {#opt-services.cassandra.incrementalRepairInterval}

Set the interval how often incremental repairs are run, i.e.
`nodetool repair` is executed. See
[https://cassandra.apache.org/doc/latest/operating/repair.html](https://cassandra.apache.org/doc/latest/operating/repair.html)
for more information.

Set to `null` to disable incremental repairs.

*Type:* null or string

*Default:* `"3d"`

*Example:* `null`

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.incrementalRepairOptions` {#opt-services.cassandra.incrementalRepairOptions}

Options passed through to the incremental repair command.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--partitioner-range"
]
```

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.jmxPort` {#opt-services.cassandra.jmxPort}

Specifies the default port over which Cassandra will be available for
JMX connections.
For security reasons, you should not expose this port to the internet.
Firewall it if needed.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `7199`

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.jmxRoles` {#opt-services.cassandra.jmxRoles}

Roles that are allowed to access the JMX (e.g. `nodetool`)
BEWARE: The passwords will be stored world readable in the nix store.
It's recommended to use your own protected file using
`jmxRolesFile`

Doesn't work in versions older than 3.11 because they don't like that
it's world readable.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.jmxRoles.*.password` {#opt-services.cassandra.jmxRoles._.password}

Password for JMX

*Type:* string

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.jmxRoles.*.username` {#opt-services.cassandra.jmxRoles._.username}

Username for JMX

*Type:* string

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.jmxRolesFile` {#opt-services.cassandra.jmxRolesFile}

Specify your own jmx roles file.

*Type:* null or absolute path

*Default:* `"generated configuration file"`

*Example:* `"/var/lib/cassandra/jmx.password"`

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.jvmOpts` {#opt-services.cassandra.jvmOpts}

Populate the `JVM_OPT` environment variable.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.listenAddress` {#opt-services.cassandra.listenAddress}

Address or interface to bind to and tell other Cassandra nodes
to connect to. You *must* change this if you want multiple
nodes to be able to communicate!

Set `listenAddress` OR `listenInterface`, not both.

Leaving it blank leaves it up to
`InetAddress.getLocalHost()`. This will always do the "Right
Thing" *if* the node is properly configured (hostname, name
resolution, etc), and the Right Thing is to use the address
associated with the hostname (it might not be).

Setting `listenAddress` to `0.0.0.0` is always wrong.

*Type:* null or string

*Default:* `"127.0.0.1"`

*Example:* `null`

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.listenInterface` {#opt-services.cassandra.listenInterface}

Set `listenAddress` OR `listenInterface`, not both. Interfaces
must correspond to a single address, IP aliasing is not
supported.

*Type:* null or string

*Default:* `null`

*Example:* `"eth1"`

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.logbackConfig` {#opt-services.cassandra.logbackConfig}

XML logback configuration for cassandra

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  <configuration scan="false">
    <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
      <encoder>
        <pattern>%-5level %date{HH:mm:ss,SSS} %msg%n</pattern>
      </encoder>
    </appender>
  
    <root level="INFO">
      <appender-ref ref="STDOUT" />
    </root>
  
    <logger name="com.thinkaurelius.thrift" level="ERROR"/>
  </configuration>
''
```

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.mallocArenaMax` {#opt-services.cassandra.mallocArenaMax}

Set this to control the amount of arenas per-thread in glibc.

*Type:* null or signed integer

*Default:* `null`

*Example:* `4`

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.maxHeapSize` {#opt-services.cassandra.maxHeapSize}

Must be left blank or set together with `heapNewSize`.
If left blank a sensible value for the available amount of RAM and CPU
cores is calculated.

Override to set the amount of memory to allocate to the JVM at
start-up. For production use you may wish to adjust this for your
environment. `MAX_HEAP_SIZE` is the total amount of memory dedicated
to the Java heap. `HEAP_NEWSIZE` refers to the size of the young
generation.

The main trade-off for the young generation is that the larger it
is, the longer GC pause times will be. The shorter it is, the more
expensive GC will be (usually).

*Type:* null or string

*Default:* `null`

*Example:* `"4G"`

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.package` {#opt-services.cassandra.package}

The cassandra package to use.

*Type:* package

*Default:* `pkgs.cassandra`

*Example:* `cassandra_4`

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.remoteJmx` {#opt-services.cassandra.remoteJmx}

Cassandra ships with JMX accessible *only* from localhost.
To enable remote JMX connections set to true.

Be sure to also enable authentication and/or TLS.
See: [https://wiki.apache.org/cassandra/JmxSecurity](https://wiki.apache.org/cassandra/JmxSecurity)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.rpcAddress` {#opt-services.cassandra.rpcAddress}

The address or interface to bind the native transport server to.

Set `rpcAddress` OR `rpcInterface`, not both.

Leaving `rpcAddress` blank has the same effect as on
`listenAddress` (i.e. it will be based on the configured hostname
of the node).

Note that unlike `listenAddress`, you can specify `"0.0.0.0"`, but you
must also set `extraConfig.broadcast_rpc_address` to a value other
than `"0.0.0.0"`.

For security reasons, you should not expose this port to the
internet. Firewall it if needed.

*Type:* null or string

*Default:* `"127.0.0.1"`

*Example:* `null`

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.rpcInterface` {#opt-services.cassandra.rpcInterface}

Set `rpcAddress` OR `rpcInterface`, not both. Interfaces must
correspond to a single address, IP aliasing is not supported.

*Type:* null or string

*Default:* `null`

*Example:* `"eth1"`

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.seedAddresses` {#opt-services.cassandra.seedAddresses}

The addresses of hosts designated as contact points in the cluster. A
joining node contacts one of the nodes in the seeds list to learn the
topology of the ring.
Set to `[ "127.0.0.1" ]` for a single node cluster.

*Type:* list of string

*Default:*

``` nix
[
  "127.0.0.1"
]
```

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.cassandra.user` {#opt-services.cassandra.user}

Run Apache Cassandra under this user.

*Type:* string

*Default:* `"cassandra"`

*Declared by:* [`nixos/modules/services/databases/cassandra.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cassandra.nix)

## `services.castsponsorskip.config` {#opt-services.castsponsorskip.config}

Configuration for the service. List of options all options [https://github.com/gabe565/CastSponsorSkip/blob/main/docs/envs.md](https://github.com/gabe565/CastSponsorSkip/blob/main/docs/envs.md).

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  CSS_SKIP_SPONSORS = false;
}
```

*Declared by:* [`nixos/modules/services/misc/castsponsorskip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/castsponsorskip.nix)

## `services.castsponsorskip.enable` {#opt-services.castsponsorskip.enable}

Whether to enable castsponsorskip.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/castsponsorskip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/castsponsorskip.nix)

## `services.castsponsorskip.package` {#opt-services.castsponsorskip.package}

The castsponsorskip package to use.

*Type:* package

*Default:* `pkgs.castsponsorskip`

*Declared by:* [`nixos/modules/services/misc/castsponsorskip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/castsponsorskip.nix)

## `services.cato-client.enable` {#opt-services.cato-client.enable}

Whether to enable cato-client service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/cato-client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cato-client.nix)

## `services.cato-client.package` {#opt-services.cato-client.package}

The cato-client package to use.

*Type:* package

*Default:* `pkgs.cato-client`

*Declared by:* [`nixos/modules/services/networking/cato-client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cato-client.nix)

## `services.centrifugo.credentials` {#opt-services.centrifugo.credentials}

Environment variables with absolute paths to credentials files to load
on service startup.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
{
  CENTRIFUGO_UNI_GRPC_TLS_KEY = "/run/keys/centrifugo-uni-grpc-tls.key";
}
```

*Declared by:* [`nixos/modules/services/networking/centrifugo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/centrifugo.nix)

## `services.centrifugo.enable` {#opt-services.centrifugo.enable}

Whether to enable Centrifugo messaging server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/centrifugo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/centrifugo.nix)

## `services.centrifugo.environmentFiles` {#opt-services.centrifugo.environmentFiles}

Files to load environment variables from. Options set via environment
variables take precedence over `settings`.

See the [Centrifugo documentation](https://centrifugal.dev/docs/server/configuration#os-environment-variables) for the environment variable name
format.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/centrifugo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/centrifugo.nix)

## `services.centrifugo.extraGroups` {#opt-services.centrifugo.extraGroups}

Additional groups for the systemd service.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "redis-centrifugo"
]
```

*Declared by:* [`nixos/modules/services/networking/centrifugo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/centrifugo.nix)

## `services.centrifugo.package` {#opt-services.centrifugo.package}

The centrifugo package to use.

*Type:* package

*Default:* `pkgs.centrifugo`

*Declared by:* [`nixos/modules/services/networking/centrifugo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/centrifugo.nix)

## `services.centrifugo.settings` {#opt-services.centrifugo.settings}

Declarative Centrifugo configuration. See the [Centrifugo
documentation](https://centrifugal.dev/docs/server/configuration#os-environment-variables) for a list of options.

*Type:* JSON value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/centrifugo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/centrifugo.nix)

## `services.ceph.client.enable` {#opt-services.ceph.client.enable}

Whether to enable Ceph client configuration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.client.extraConfig` {#opt-services.ceph.client.extraConfig}

Extra configuration to add to the client section. Configuration for rados gateways
would be added here, with their own sections, see example.

*Type:* attribute set of attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  # This would create a section for a radosgw daemon named node0 and related
  # configuration for it
  "client.radosgw.node0" = { "some config option" = "true"; };
};
```

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.enable` {#opt-services.ceph.enable}

Whether to enable Ceph global configuration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.extraConfig` {#opt-services.ceph.extraConfig}

Extra configuration to add to the global section. Use for setting values that are common for all daemons in the cluster.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  "ms bind ipv6" = "true";
}
```

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.global.authClientRequired` {#opt-services.ceph.global.authClientRequired}

Enables requiring the cluster to authenticate itself to the client.

*Type:* one of "cephx", "none"

*Default:* `"cephx"`

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.global.authClusterRequired` {#opt-services.ceph.global.authClusterRequired}

Enables requiring daemons to authenticate with eachother in the cluster.

*Type:* one of "cephx", "none"

*Default:* `"cephx"`

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.global.authServiceRequired` {#opt-services.ceph.global.authServiceRequired}

Enables requiring clients to authenticate with the cluster to access services in the cluster (e.g. radosgw, mds or osd).

*Type:* one of "cephx", "none"

*Default:* `"cephx"`

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.global.clusterName` {#opt-services.ceph.global.clusterName}

Name of cluster

*Type:* string

*Default:* `"ceph"`

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.global.clusterNetwork` {#opt-services.ceph.global.clusterNetwork}

A comma-separated list of subnets that will be used as cluster networks in the cluster.

*Type:* null or strings concatenated with ","

*Default:* `null`

*Example:*

``` nix
''
  10.10.0.0/24, 192.168.0.0/24
''
```

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.global.fsid` {#opt-services.ceph.global.fsid}

Filesystem ID, a generated uuid, its must be generated and set before
attempting to start a cluster

*Type:* string

*Example:*

``` nix
''
  433a2193-4f8a-47a0-95d2-209d7ca2cca5
''
```

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.global.maxOpenFiles` {#opt-services.ceph.global.maxOpenFiles}

Max open files for each OSD daemon.

*Type:* signed integer

*Default:* `131072`

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.global.mgrModulePath` {#opt-services.ceph.global.mgrModulePath}

Path at which to find ceph-mgr modules.

*Type:* absolute path

*Default:* `"${pkgs.ceph.lib}/lib/ceph/mgr"`

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.global.monHost` {#opt-services.ceph.global.monHost}

List of hostname shortnames/IP addresses of the initial monitors.

*Type:* null or strings concatenated with ","

*Default:* `null`

*Example:*

``` nix
''
  10.10.0.1, 10.10.0.2, 10.10.0.3
''
```

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.global.monInitialMembers` {#opt-services.ceph.global.monInitialMembers}

List of hosts that will be used as monitors at startup.

*Type:* null or strings concatenated with ","

*Default:* `null`

*Example:*

``` nix
''
  node0, node1, node2
''
```

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.global.publicNetwork` {#opt-services.ceph.global.publicNetwork}

A comma-separated list of subnets that will be used as public networks in the cluster.

*Type:* null or strings concatenated with ","

*Default:* `null`

*Example:*

``` nix
''
  10.20.0.0/24, 192.168.1.0/24
''
```

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.global.rgwMimeTypesFile` {#opt-services.ceph.global.rgwMimeTypesFile}

Path to mime types used by radosgw.

*Type:* null or absolute path

*Default:* `"${pkgs.mailcap}/etc/mime.types"`

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.mds.daemons` {#opt-services.ceph.mds.daemons}

A list of metadata service daemons that should have a service created. The names correspond
to the id part in ceph i.e. \[ "name1" \] would result in mds.name1

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "name1"
  "name2"
]
```

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.mds.enable` {#opt-services.ceph.mds.enable}

Whether to enable Ceph MDS daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.mds.extraConfig` {#opt-services.ceph.mds.extraConfig}

Extra configuration to add to the MDS section.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.mds.package` {#opt-services.ceph.mds.package}

The ceph package to use.

*Type:* package

*Default:* `pkgs.ceph`

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.mgr.daemons` {#opt-services.ceph.mgr.daemons}

A list of names for manager daemons that should have a service created. The names correspond
to the id part in ceph i.e. \[ "name1" \] would result in mgr.name1

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "name1"
  "name2"
]
```

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.mgr.enable` {#opt-services.ceph.mgr.enable}

Whether to enable Ceph MGR daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.mgr.extraConfig` {#opt-services.ceph.mgr.extraConfig}

Extra configuration to add to the global section for manager daemons.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.mgr.package` {#opt-services.ceph.mgr.package}

The ceph package to use.

*Type:* package

*Default:* `pkgs.ceph`

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.mon.daemons` {#opt-services.ceph.mon.daemons}

A list of monitor daemons that should have a service created. The names correspond
to the id part in ceph i.e. \[ "name1" \] would result in mon.name1

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "name1"
  "name2"
]
```

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.mon.enable` {#opt-services.ceph.mon.enable}

Whether to enable Ceph MON daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.mon.extraConfig` {#opt-services.ceph.mon.extraConfig}

Extra configuration to add to the monitor section.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.mon.package` {#opt-services.ceph.mon.package}

The ceph package to use.

*Type:* package

*Default:* `pkgs.ceph`

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.osd.daemons` {#opt-services.ceph.osd.daemons}

A list of OSD daemons that should have a service created. The names correspond
to the id part in ceph i.e. \[ "name1" \] would result in osd.name1

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "name1"
  "name2"
]
```

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.osd.enable` {#opt-services.ceph.osd.enable}

Whether to enable Ceph OSD daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.osd.extraConfig` {#opt-services.ceph.osd.extraConfig}

Extra configuration to add to the OSD section.

*Type:* attribute set of string

*Default:*

``` nix
{
  "osd crush chooseleaf type" = "1";
  "osd journal size" = "10000";
  "osd pool default min size" = "2";
  "osd pool default pg num" = "200";
  "osd pool default pgp num" = "200";
  "osd pool default size" = "3";
}
```

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.osd.package` {#opt-services.ceph.osd.package}

The ceph package to use.

*Type:* package

*Default:* `pkgs.ceph`

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.rgw.daemons` {#opt-services.ceph.rgw.daemons}

A list of rados gateway daemons that should have a service created. The names correspond
to the id part in ceph i.e. \[ "name1" \] would result in client.name1, radosgw daemons
aren't daemons to cluster in the sense that OSD, MGR or MON daemons are. They are simply
daemons, from ceph, that uses the cluster as a backend.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "name1"
  "name2"
]
```

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.rgw.enable` {#opt-services.ceph.rgw.enable}

Whether to enable Ceph RadosGW daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.ceph.rgw.package` {#opt-services.ceph.rgw.package}

The ceph package to use.

*Type:* package

*Default:* `pkgs.ceph`

*Declared by:* [`nixos/modules/services/network-filesystems/ceph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix)

## `services.certmgr.defaultRemote` {#opt-services.certmgr.defaultRemote}

The default CA host:port to use.

*Type:* string

*Default:* `"127.0.0.1:8888"`

*Declared by:* [`nixos/modules/services/security/certmgr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/certmgr.nix)

## `services.certmgr.enable` {#opt-services.certmgr.enable}

Whether to enable certmgr.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/certmgr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/certmgr.nix)

## `services.certmgr.metricsAddress` {#opt-services.certmgr.metricsAddress}

The address for the Prometheus HTTP endpoint.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/security/certmgr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/certmgr.nix)

## `services.certmgr.metricsPort` {#opt-services.certmgr.metricsPort}

The port for the Prometheus HTTP endpoint.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9488`

*Declared by:* [`nixos/modules/services/security/certmgr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/certmgr.nix)

## `services.certmgr.package` {#opt-services.certmgr.package}

The certmgr package to use.

*Type:* package

*Default:* `pkgs.certmgr`

*Declared by:* [`nixos/modules/services/security/certmgr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/certmgr.nix)

## `services.certmgr.renewInterval` {#opt-services.certmgr.renewInterval}

How often to check certificate expirations and how often to update the cert\_next\_expires metric.

*Type:* string

*Default:* `"30m"`

*Declared by:* [`nixos/modules/services/security/certmgr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/certmgr.nix)

## `services.certmgr.specs` {#opt-services.certmgr.specs}

Certificate specs as described by:
[https://github.com/cloudflare/certmgr#certificate-specs](https://github.com/cloudflare/certmgr#certificate-specs)
These will be added to the Nix store, so they will be world readable.

*Type:* attribute set of (absolute path or (submodule))

*Default:* `{ }`

*Example:*

``` nix
{
  exampleCert =
  let
    domain = "example.com";
    secret = name: "/var/lib/secrets/${name}.pem";
  in {
    service = "nginx";
    action = "reload";
    authority = {
      file.path = secret "ca";
    };
    certificate = {
      path = secret domain;
    };
    private_key = {
      owner = "root";
      group = "root";
      mode = "0600";
      path = secret "${domain}-key";
    };
    request = {
      CN = domain;
      hosts = [ "mail.${domain}" "www.${domain}" ];
      key = {
        algo = "rsa";
        size = 2048;
      };
      names = {
        O = "Example Organization";
        C = "USA";
      };
    };
  };
  otherCert = "/var/certmgr/specs/other-cert.json";
}
```

*Declared by:* [`nixos/modules/services/security/certmgr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/certmgr.nix)

## `services.certmgr.svcManager` {#opt-services.certmgr.svcManager}

This specifies the service manager to use for restarting or reloading services.
See: [https://github.com/cloudflare/certmgr#certmgryaml](https://github.com/cloudflare/certmgr#certmgryaml).
For how to use the "command" service manager in particular,
see: [https://github.com/cloudflare/certmgr#command-svcmgr-and-how-to-use-it](https://github.com/cloudflare/certmgr#command-svcmgr-and-how-to-use-it).

*Type:* one of "circus", "command", "dummy", "openrc", "systemd", "sysv"

*Default:* `"systemd"`

*Declared by:* [`nixos/modules/services/security/certmgr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/certmgr.nix)

## `services.certmgr.validMin` {#opt-services.certmgr.validMin}

The interval before a certificate expires to start attempting to renew it.

*Type:* string

*Default:* `"72h"`

*Declared by:* [`nixos/modules/services/security/certmgr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/certmgr.nix)

## `services.certspotter.emailRecipients` {#opt-services.certspotter.emailRecipients}

A list of email addresses to send certificate updates to.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/certspotter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/certspotter.nix)

## `services.certspotter.enable` {#opt-services.certspotter.enable}

Whether to enable Cert Spotter, a Certificate Transparency log monitor.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/certspotter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/certspotter.nix)

## `services.certspotter.extraFlags` {#opt-services.certspotter.extraFlags}

Extra command-line arguments to pass to Cert Spotter

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-no_save"
]
```

*Declared by:* [`nixos/modules/services/monitoring/certspotter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/certspotter.nix)

## `services.certspotter.hooks` {#opt-services.certspotter.hooks}

Scripts to run upon the detection of a new certificate. See `man 8 certspotter-script` or
[the GitHub page](https://github.com/SSLMate/certspotter/blob/master/man/certspotter-script.md)
for more info.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  (pkgs.writeShellScript "certspotter-hook" ''
    echo "Event summary: $SUMMARY."
  '')
]
```

*Declared by:* [`nixos/modules/services/monitoring/certspotter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/certspotter.nix)

## `services.certspotter.package` {#opt-services.certspotter.package}

The certspotter package to use.

*Type:* package

*Default:* `pkgs.certspotter`

*Declared by:* [`nixos/modules/services/monitoring/certspotter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/certspotter.nix)

## `services.certspotter.sendmailPath` {#opt-services.certspotter.sendmailPath}

Path to the `sendmail` binary. By default, the local sendmail wrapper is used
(see `services.mail.sendmailSetuidWrapper`}).

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.system-sendmail}/bin/sendmail"`

*Declared by:* [`nixos/modules/services/monitoring/certspotter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/certspotter.nix)

## `services.certspotter.startAtEnd` {#opt-services.certspotter.startAtEnd}

Whether to skip certificates issued before the first launch of Cert Spotter.
Setting this to `false` will cause Cert Spotter to download tens of terabytes of data.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/certspotter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/certspotter.nix)

## `services.certspotter.watchlist` {#opt-services.certspotter.watchlist}

Domain names to watch. To monitor a domain with all subdomains, prefix its name with `.` (e.g. `.example.org`).

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  ".example.org"
  "another.example.com"
]
```

*Declared by:* [`nixos/modules/services/monitoring/certspotter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/certspotter.nix)

## `services.cfdyndns.apiTokenFile` {#opt-services.cfdyndns.apiTokenFile}

The path to a file containing the API Token
used to authenticate with CloudFlare.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/cfdyndns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cfdyndns.nix)

## `services.cfdyndns.apikeyFile` {#opt-services.cfdyndns.apikeyFile}

The path to a file containing the API Key
used to authenticate with CloudFlare.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/cfdyndns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cfdyndns.nix)

## `services.cfdyndns.email` {#opt-services.cfdyndns.email}

The email address to use to authenticate to CloudFlare.

*Type:* string

*Declared by:* [`nixos/modules/services/misc/cfdyndns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cfdyndns.nix)

## `services.cfdyndns.enable` {#opt-services.cfdyndns.enable}

Whether to enable Cloudflare Dynamic DNS Client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/cfdyndns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cfdyndns.nix)

## `services.cfdyndns.records` {#opt-services.cfdyndns.records}

The records to update in CloudFlare.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "host.tld"
]
```

*Declared by:* [`nixos/modules/services/misc/cfdyndns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cfdyndns.nix)

## `services.cfssl.address` {#opt-services.cfssl.address}

Address to bind.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cfssl.ca` {#opt-services.cfssl.ca}

CA used to sign the new certificate -- accepts '\[file:\]fname' or 'env:varname'.

*Type:* string

*Default:* `"${cfg.dataDir}/ca.pem"`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cfssl.caBundle` {#opt-services.cfssl.caBundle}

Path to root certificate store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cfssl.caKey` {#opt-services.cfssl.caKey}

CA private key -- accepts '\[file:\]fname' or 'env:varname'.

*Type:* string

*Default:* `"file:${cfg.dataDir}/ca-key.pem"`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cfssl.configFile` {#opt-services.cfssl.configFile}

Path to configuration file. Do not put this in nix-store as it might contain secrets.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cfssl.dataDir` {#opt-services.cfssl.dataDir}

The work directory for CFSSL.

::: note
If left as the default value this directory will automatically be
created before the CFSSL server starts, otherwise you are
responsible for ensuring the directory exists with appropriate
ownership and permissions.
:::

*Type:* absolute path

*Default:* `"/var/lib/cfssl"`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cfssl.dbConfig` {#opt-services.cfssl.dbConfig}

Certificate db configuration file. Path must be writeable.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cfssl.disable` {#opt-services.cfssl.disable}

Endpoints to disable (comma-separated list)

*Type:* null or strings concatenated with ","

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cfssl.enable` {#opt-services.cfssl.enable}

Whether to enable the CFSSL CA api-server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cfssl.intBundle` {#opt-services.cfssl.intBundle}

Path to intermediate certificate store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cfssl.intDir` {#opt-services.cfssl.intDir}

Intermediates directory.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cfssl.logLevel` {#opt-services.cfssl.logLevel}

Log level (0 = DEBUG, 5 = FATAL).

*Type:* integer between 0 and 5 (both inclusive)

*Default:* `1`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cfssl.metadata` {#opt-services.cfssl.metadata}

Metadata file for root certificate presence.
The content of the file is a json dictionary (k,v): each key k is
a SHA-1 digest of a root certificate while value v is a list of key
store filenames.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cfssl.mutualTlsCa` {#opt-services.cfssl.mutualTlsCa}

Mutual TLS - require clients be signed by this CA.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cfssl.mutualTlsClientCert` {#opt-services.cfssl.mutualTlsClientCert}

Mutual TLS - client certificate to call remote instance requiring client certs.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cfssl.mutualTlsClientKey` {#opt-services.cfssl.mutualTlsClientKey}

Mutual TLS - client key to call remote instance requiring client certs. Do not put this in nix-store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cfssl.mutualTlsCn` {#opt-services.cfssl.mutualTlsCn}

Mutual TLS - regex for whitelist of allowed client CNs.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cfssl.port` {#opt-services.cfssl.port}

Port to bind.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8888`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cfssl.remote` {#opt-services.cfssl.remote}

Remote CFSSL server.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cfssl.responder` {#opt-services.cfssl.responder}

Certificate for OCSP responder.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cfssl.responderKey` {#opt-services.cfssl.responderKey}

Private key for OCSP responder certificate. Do not put this in nix-store.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cfssl.tlsCert` {#opt-services.cfssl.tlsCert}

Other endpoint's CA to set up TLS protocol.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cfssl.tlsKey` {#opt-services.cfssl.tlsKey}

Other endpoint's CA private key. Do not put this in nix-store.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cfssl.tlsRemoteCa` {#opt-services.cfssl.tlsRemoteCa}

CAs to trust for remote TLS requests.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/cfssl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/cfssl.nix)

## `services.cgit` {#opt-services.cgit}

Configure cgit instances.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/cgit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cgit.nix)

## `services.cgit.<name>.enable` {#opt-services.cgit._name_.enable}

Whether to enable cgit.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/cgit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cgit.nix)

## `services.cgit.<name>.extraConfig` {#opt-services.cgit._name_.extraConfig}

These lines go to the end of cgitrc verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/cgit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cgit.nix)

## `services.cgit.<name>.gitHttpBackend.checkExportOkFiles` {#opt-services.cgit._name_.gitHttpBackend.checkExportOkFiles}

Whether git-http-backend should only export repositories that contain a `git-daemon-export-ok` file.

When the backend is enabled and the check is disabled all repositories can be cloned
irrespective of cgit's settings (e.g. the `ignore` repository setting).

When enabled you must also configure `strict-export = "git-daemon-export-ok"`
in `settings` to make cgit check for the same files.

*Type:* boolean

*Declared by:* [`nixos/modules/services/networking/cgit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cgit.nix)

## `services.cgit.<name>.gitHttpBackend.enable` {#opt-services.cgit._name_.gitHttpBackend.enable}

Whether to bypass cgit and use git-http-backend for HTTP clones.
While this enables HTTP clones to use the more efficient smart protocol,
it does not support access control via cgit's settings (e.g. the `ignore` repository setting).

If you want to disallow access to some repositories with this backend,
enable `checkExportOkFiles` and set `strict-export = "git-daemon-export-ok"` in `settings`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/cgit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cgit.nix)

## `services.cgit.<name>.group` {#opt-services.cgit._name_.group}

Group to run the cgit service as.

*Type:* string

*Default:* `"cgit"`

*Declared by:* [`nixos/modules/services/networking/cgit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cgit.nix)

## `services.cgit.<name>.nginx.location` {#opt-services.cgit._name_.nginx.location}

Location to serve cgit under.

*Type:* string

*Default:* `"/"`

*Example:* `"/git/"`

*Declared by:* [`nixos/modules/services/networking/cgit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cgit.nix)

## `services.cgit.<name>.nginx.virtualHost` {#opt-services.cgit._name_.nginx.virtualHost}

VirtualHost to serve cgit on, defaults to the attribute name.

*Type:* string

*Default:* `"‹name›"`

*Example:* `"git.example.com"`

*Declared by:* [`nixos/modules/services/networking/cgit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cgit.nix)

## `services.cgit.<name>.package` {#opt-services.cgit._name_.package}

The cgit package to use.

*Type:* package

*Default:* `pkgs.cgit`

*Declared by:* [`nixos/modules/services/networking/cgit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cgit.nix)

## `services.cgit.<name>.repos` {#opt-services.cgit._name_.repos}

cgit repository settings, see `cgitrc(5)`

*Type:* attribute set of attribute set of (boolean or signed integer or string)

*Default:* `{ }`

*Example:*

``` nix
{
  blah = {
    desc = "An example repository";
    path = "/var/lib/git/example";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/cgit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cgit.nix)

## `services.cgit.<name>.scanPath` {#opt-services.cgit._name_.scanPath}

A path which will be scanned for repositories.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/git"`

*Declared by:* [`nixos/modules/services/networking/cgit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cgit.nix)

## `services.cgit.<name>.settings` {#opt-services.cgit._name_.settings}

cgit configuration, see `cgitrc(5)`

*Type:* attribute set of (boolean or signed integer or string or list of (boolean or signed integer or string))

*Default:* `{ }`

*Example:*

``` nix
{
  enable-follow-links = true;
  source-filter = "${pkgs.cgit}/lib/cgit/filters/syntax-highlighting.py";
}
```

*Declared by:* [`nixos/modules/services/networking/cgit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cgit.nix)

## `services.cgit.<name>.user` {#opt-services.cgit._name_.user}

User to run the cgit service as.

*Type:* string

*Default:* `"cgit"`

*Declared by:* [`nixos/modules/services/networking/cgit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cgit.nix)

## `services.cgminer.config` {#opt-services.cgminer.config}

Additional config

*Type:* attribute set of (boolean or signed integer)

*Default:* `{ }`

*Example:*

``` nix
{
  auto-fan = true;
  auto-gpu = true;
  expiry = 120;
  failover-only = true;
  gpu-threads = 2;
  log = 5;
  queue = 1;
  scan-time = 60;
  temp-histeresys = 3;
}
```

*Declared by:* [`nixos/modules/services/misc/cgminer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cgminer.nix)

## `services.cgminer.enable` {#opt-services.cgminer.enable}

Whether to enable cgminer, an ASIC/FPGA/GPU miner for bitcoin and litecoin.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/cgminer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cgminer.nix)

## `services.cgminer.hardware` {#opt-services.cgminer.hardware}

List of config options for every GPU

*Type:* list of attribute set of (string or signed integer)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    gpu-engine = "0-985";
    gpu-fan = "0-85";
    gpu-memclock = 860;
    gpu-powertune = 20;
    intensity = 9;
    temp-cutoff = 95;
    temp-overheat = 85;
    temp-target = 75;
  }
  {
    gpu-engine = "0-950";
    gpu-fan = "0-85";
    gpu-memclock = 825;
    gpu-powertune = 20;
    intensity = 9;
    temp-cutoff = 95;
    temp-overheat = 85;
    temp-target = 75;
  }
]
```

*Declared by:* [`nixos/modules/services/misc/cgminer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cgminer.nix)

## `services.cgminer.package` {#opt-services.cgminer.package}

The cgminer package to use.

*Type:* package

*Default:* `pkgs.cgminer`

*Declared by:* [`nixos/modules/services/misc/cgminer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cgminer.nix)

## `services.cgminer.pools` {#opt-services.cgminer.pools}

List of pools where to mine

*Type:* list of attribute set of string

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    password = "X";
    url = "http://p2pool.org:9332";
    username = "17EUZxTvs9uRmPsjPZSYUU3zCz9iwstudk";
  }
]
```

*Declared by:* [`nixos/modules/services/misc/cgminer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cgminer.nix)

## `services.cgminer.user` {#opt-services.cgminer.user}

User account under which cgminer runs

*Type:* string

*Default:* `"cgminer"`

*Declared by:* [`nixos/modules/services/misc/cgminer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cgminer.nix)

## `services.changedetection-io.baseURL` {#opt-services.changedetection-io.baseURL}

The base url used in notifications and `{base_url}` token.

*Type:* null or string

*Default:* `null`

*Example:* `"https://changedetection-io.example"`

*Declared by:* [`nixos/modules/services/web-apps/changedetection-io.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/changedetection-io.nix)

## `services.changedetection-io.behindProxy` {#opt-services.changedetection-io.behindProxy}

Enable this option when changedetection-io runs behind a reverse proxy, so that it trusts X-\* headers.
It is recommend to run changedetection-io behind a TLS reverse proxy.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/changedetection-io.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/changedetection-io.nix)

## `services.changedetection-io.chromePort` {#opt-services.changedetection-io.chromePort}

A free port on which webDriverSupport or playwrightSupport listen on localhost.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4444`

*Declared by:* [`nixos/modules/services/web-apps/changedetection-io.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/changedetection-io.nix)

## `services.changedetection-io.datastorePath` {#opt-services.changedetection-io.datastorePath}

The directory used to store all data for changedetection-io.

*Type:* string

*Default:* `"/var/lib/changedetection-io"`

*Declared by:* [`nixos/modules/services/web-apps/changedetection-io.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/changedetection-io.nix)

## `services.changedetection-io.enable` {#opt-services.changedetection-io.enable}

Whether to enable changedetection-io.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/changedetection-io.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/changedetection-io.nix)

## `services.changedetection-io.environmentFile` {#opt-services.changedetection-io.environmentFile}

Securely pass environment variables to changedetection-io.

This can be used to set for example a frontend password reproducible via `SALTED_PASS`
which convinetly also deactivates nags about the hosted version.
`SALTED_PASS` should be 64 characters long while the first 32 are the salt and the second the frontend password.
It can easily be retrieved from the settings file when first set via the frontend with the following command:
`jq -r .settings.application.password /var/lib/changedetection-io/url-watches.json`

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/changedetection-io.env"`

*Declared by:* [`nixos/modules/services/web-apps/changedetection-io.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/changedetection-io.nix)

## `services.changedetection-io.group` {#opt-services.changedetection-io.group}

Group account under which changedetection-io runs.

*Type:* string

*Default:* `"changedetection-io"`

*Declared by:* [`nixos/modules/services/web-apps/changedetection-io.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/changedetection-io.nix)

## `services.changedetection-io.listenAddress` {#opt-services.changedetection-io.listenAddress}

Address the server will listen on.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/changedetection-io.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/changedetection-io.nix)

## `services.changedetection-io.package` {#opt-services.changedetection-io.package}

The changedetection-io package to use.

*Type:* package

*Default:* `pkgs.changedetection-io`

*Declared by:* [`nixos/modules/services/web-apps/changedetection-io.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/changedetection-io.nix)

## `services.changedetection-io.playwrightSupport` {#opt-services.changedetection-io.playwrightSupport}

Enable support for fetching web pages using playwright and Chromium.
This starts a headless Chromium controlled by puppeteer in an oci container.

::: note
Playwright can currently leak memory.
See [https://github.com/dgtlmoon/changedetection.io/wiki/Playwright-content-fetcher#playwright-memory-leak](https://github.com/dgtlmoon/changedetection.io/wiki/Playwright-content-fetcher#playwright-memory-leak)
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/changedetection-io.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/changedetection-io.nix)

## `services.changedetection-io.port` {#opt-services.changedetection-io.port}

Port the server will listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5000`

*Declared by:* [`nixos/modules/services/web-apps/changedetection-io.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/changedetection-io.nix)

## `services.changedetection-io.user` {#opt-services.changedetection-io.user}

User account under which changedetection-io runs.

*Type:* string

*Default:* `"changedetection-io"`

*Declared by:* [`nixos/modules/services/web-apps/changedetection-io.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/changedetection-io.nix)

## `services.changedetection-io.webDriverSupport` {#opt-services.changedetection-io.webDriverSupport}

Enable support for fetching web pages using WebDriver and Chromium.
This starts a headless chromium controlled by puppeteer in an oci container.

::: note
Playwright can currently leak memory.
See [https://github.com/dgtlmoon/changedetection.io/wiki/Playwright-content-fetcher#playwright-memory-leak](https://github.com/dgtlmoon/changedetection.io/wiki/Playwright-content-fetcher#playwright-memory-leak)
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/changedetection-io.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/changedetection-io.nix)

## `services.chhoto-url.enable` {#opt-services.chhoto-url.enable}

Whether to enable Chhoto URL.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/chhoto-url.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/chhoto-url.nix)

## `services.chhoto-url.environmentFiles` {#opt-services.chhoto-url.environmentFiles}

Files to load environment variables from in addition to [services (C)](#opt-services.chhoto-url.settings).
This is useful to avoid putting secrets into the nix store.
See [https://github.com/SinTan1729/chhoto-url/blob/main/docs/INSTALLATION.md#configuration-options](https://github.com/SinTan1729/chhoto-url/blob/main/docs/INSTALLATION.md#configuration-options) for a list of options.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/run/secrets/chhoto-url.env"
]
```

*Declared by:* [`nixos/modules/services/web-apps/chhoto-url.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/chhoto-url.nix)

## `services.chhoto-url.package` {#opt-services.chhoto-url.package}

The chhoto-url package to use.

*Type:* package

*Default:* `pkgs.chhoto-url`

*Declared by:* [`nixos/modules/services/web-apps/chhoto-url.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/chhoto-url.nix)

## `services.chhoto-url.settings` {#opt-services.chhoto-url.settings}

Configuration of Chhoto URL.
See [https://github.com/SinTan1729/chhoto-url/blob/main/docs/INSTALLATION.md#configuration-options](https://github.com/SinTan1729/chhoto-url/blob/main/docs/INSTALLATION.md#configuration-options) for a list of options.

*Type:* open submodule of attribute set of (string or signed integer or boolean)

*Example:*

``` nix
{
  port = 4567;
}
```

*Declared by:* [`nixos/modules/services/web-apps/chhoto-url.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/chhoto-url.nix)

## `services.chhoto-url.settings.CHHOTO_HEALTH_PORT` {#opt-services.chhoto-url.settings.CHHOTO_HEALTH_PORT}

The port of the health check endpoint (`/healthz`), which always listens on 127.0.0.1.
The endpoint is mainly intended for container health checks.
Set to `0` to disable it.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `0`

*Example:* `1729`

*Declared by:* [`nixos/modules/services/web-apps/chhoto-url.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/chhoto-url.nix)

## `services.chhoto-url.settings.allow_capital_letters` {#opt-services.chhoto-url.settings.allow_capital_letters}

Whether to allow capital letters in slugs.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/chhoto-url.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/chhoto-url.nix)

## `services.chhoto-url.settings.cache_control_header` {#opt-services.chhoto-url.settings.cache_control_header}

The Cache-Control header to send.

*Type:* null or string

*Default:* `null`

*Example:* `"no-cache, private"`

*Declared by:* [`nixos/modules/services/web-apps/chhoto-url.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/chhoto-url.nix)

## `services.chhoto-url.settings.custom_landing_directory` {#opt-services.chhoto-url.settings.custom_landing_directory}

The path of a directory which contains a custom landing page.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/chhoto-url.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/chhoto-url.nix)

## `services.chhoto-url.settings.db_url` {#opt-services.chhoto-url.settings.db_url}

The path of the sqlite database.

*Type:* absolute path

*Default:* `"/var/lib/chhoto-url/urls.sqlite"`

*Declared by:* [`nixos/modules/services/web-apps/chhoto-url.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/chhoto-url.nix)

## `services.chhoto-url.settings.disable_frontend` {#opt-services.chhoto-url.settings.disable_frontend}

Whether to disable the frontend.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/chhoto-url.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/chhoto-url.nix)

## `services.chhoto-url.settings.hash_algorithm` {#opt-services.chhoto-url.settings.hash_algorithm}

The hash algorithm to use for passwords and API keys.
Set to `null` if you want to provide these secrets as plaintext.

*Type:* null or value "Argon2" (singular enum)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/chhoto-url.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/chhoto-url.nix)

## `services.chhoto-url.settings.port` {#opt-services.chhoto-url.settings.port}

The port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Example:* `4567`

*Declared by:* [`nixos/modules/services/web-apps/chhoto-url.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/chhoto-url.nix)

## `services.chhoto-url.settings.public_mode` {#opt-services.chhoto-url.settings.public_mode}

Whether to enable public mode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/chhoto-url.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/chhoto-url.nix)

## `services.chhoto-url.settings.public_mode_expiry_delay` {#opt-services.chhoto-url.settings.public_mode_expiry_delay}

The maximum expiry delay in seconds to force in public mode.

*Type:* null or (unsigned integer, meaning \>=0)

*Default:* `null`

*Example:* `3600`

*Declared by:* [`nixos/modules/services/web-apps/chhoto-url.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/chhoto-url.nix)

## `services.chhoto-url.settings.redirect_method` {#opt-services.chhoto-url.settings.redirect_method}

The redirect method to use.

*Type:* one of "TEMPORARY", "PERMANENT"

*Default:* `"PERMANENT"`

*Declared by:* [`nixos/modules/services/web-apps/chhoto-url.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/chhoto-url.nix)

## `services.chhoto-url.settings.site_url` {#opt-services.chhoto-url.settings.site_url}

The URL under which Chhoto URL is externally reachable.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/chhoto-url.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/chhoto-url.nix)

## `services.chhoto-url.settings.slug_length` {#opt-services.chhoto-url.settings.slug_length}

The length of auto-generated slugs.

*Type:* signed integer

*Default:* `8`

*Declared by:* [`nixos/modules/services/web-apps/chhoto-url.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/chhoto-url.nix)

## `services.chhoto-url.settings.slug_style` {#opt-services.chhoto-url.settings.slug_style}

The slug style to use for auto-generated URLs.

*Type:* one of "Pair", "UID"

*Default:* `"Pair"`

*Declared by:* [`nixos/modules/services/web-apps/chhoto-url.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/chhoto-url.nix)

## `services.chhoto-url.settings.try_longer_slugs` {#opt-services.chhoto-url.settings.try_longer_slugs}

Whether to try a longer UID upon collision.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/chhoto-url.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/chhoto-url.nix)

## `services.chisel-server.authfile` {#opt-services.chisel-server.authfile}

Path to auth.json file

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/chisel-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/chisel-server.nix)

## `services.chisel-server.backend` {#opt-services.chisel-server.backend}

HTTP server to proxy normal requests to

*Type:* null or string

*Default:* `null`

*Example:* `"http://127.0.0.1:8888"`

*Declared by:* [`nixos/modules/services/networking/chisel-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/chisel-server.nix)

## `services.chisel-server.enable` {#opt-services.chisel-server.enable}

Whether to enable Chisel Tunnel Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/chisel-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/chisel-server.nix)

## `services.chisel-server.host` {#opt-services.chisel-server.host}

Address to listen on, falls back to 0.0.0.0

*Type:* null or string

*Default:* `null`

*Example:* `"[::1]"`

*Declared by:* [`nixos/modules/services/networking/chisel-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/chisel-server.nix)

## `services.chisel-server.keepalive` {#opt-services.chisel-server.keepalive}

Keepalive interval, falls back to 25s

*Type:* null or string

*Default:* `null`

*Example:* `"5s"`

*Declared by:* [`nixos/modules/services/networking/chisel-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/chisel-server.nix)

## `services.chisel-server.port` {#opt-services.chisel-server.port}

Port to listen on, falls back to 8080

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/chisel-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/chisel-server.nix)

## `services.chisel-server.reverse` {#opt-services.chisel-server.reverse}

Allow clients reverse port forwarding

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/chisel-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/chisel-server.nix)

## `services.chisel-server.socks5` {#opt-services.chisel-server.socks5}

Allow clients access to internal SOCKS5 proxy

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/chisel-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/chisel-server.nix)

## `services.chromadb.dbpath` {#opt-services.chromadb.dbpath}

Location where ChromaDB stores its files

*Type:* string

*Default:* `"/var/lib/chromadb"`

*Declared by:* [`nixos/modules/services/databases/chromadb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/chromadb.nix)

## `services.chromadb.enable` {#opt-services.chromadb.enable}

Whether to enable ChromaDB, an open-source AI application database.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/chromadb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/chromadb.nix)

## `services.chromadb.host` {#opt-services.chromadb.host}

Defines the IP address by which ChromaDB will be accessible.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/databases/chromadb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/chromadb.nix)

## `services.chromadb.openFirewall` {#opt-services.chromadb.openFirewall}

Whether to automatically open the specified TCP port in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/chromadb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/chromadb.nix)

## `services.chromadb.package` {#opt-services.chromadb.package}

The chromadb package to use.

*Type:* package

*Default:* `pkgs.python3Packages.chromadb`

*Declared by:* [`nixos/modules/services/databases/chromadb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/chromadb.nix)

## `services.chromadb.port` {#opt-services.chromadb.port}

Defined the port number to listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8000`

*Declared by:* [`nixos/modules/services/databases/chromadb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/chromadb.nix)

## `services.chrony.autotrimThreshold` {#opt-services.chrony.autotrimThreshold}

Maximum estimated error threshold for the `rtcautotrim` command.
When reached, the RTC will be trimmed.
Only used when [services (C)](#opt-services.chrony.enableRTCTrimming) is enabled.

*Type:* positive integer, meaning \>0

*Default:* `30`

*Example:* `10`

*Declared by:* [`nixos/modules/services/networking/ntp/chrony.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/chrony.nix)

## `services.chrony.directory` {#opt-services.chrony.directory}

Directory where chrony state is stored.

*Type:* string

*Default:* `"/var/lib/chrony"`

*Declared by:* [`nixos/modules/services/networking/ntp/chrony.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/chrony.nix)

## `services.chrony.dispatcherScript` {#opt-services.chrony.dispatcherScript}

Whether to install the chrony NetworkManager dispatcher script
to handle connectivity changes.

*Type:* boolean

*Default:* `config.networking.networkmanager.enable`

*Declared by:* [`nixos/modules/services/networking/ntp/chrony.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/chrony.nix)

## `services.chrony.enable` {#opt-services.chrony.enable}

Whether to synchronise your machine's time using chrony.
Make sure you disable NTP if you enable this service.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ntp/chrony.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/chrony.nix)

## `services.chrony.enableMemoryLocking` {#opt-services.chrony.enableMemoryLocking}

Whether to add the `-m` flag to lock memory.

*Type:* boolean

*Default:* `config.environment.memoryAllocator.provider != "graphene-hardened" && config.environment.memoryAllocator.provider != "graphene-hardened-light"`

*Declared by:* [`nixos/modules/services/networking/ntp/chrony.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/chrony.nix)

## `services.chrony.enableNTS` {#opt-services.chrony.enableNTS}

Whether to enable Network Time Security authentication.
Make sure it is supported by your selected NTP server(s).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ntp/chrony.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/chrony.nix)

## `services.chrony.enableRTCTrimming` {#opt-services.chrony.enableRTCTrimming}

Enable tracking of the RTC offset to the system clock and automatic trimming.
See also [services (C)](#opt-services.chrony.autotrimThreshold)

::: note
This is not compatible with the `rtcsync` directive, which naively syncs the RTC time every 11 minutes.

Tracking the RTC drift will allow more precise timekeeping,
especially on intermittently running devices, where the RTC is very relevant.
:::

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/ntp/chrony.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/chrony.nix)

## `services.chrony.extraConfig` {#opt-services.chrony.extraConfig}

Extra configuration directives that should be added to
`chrony.conf`

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/ntp/chrony.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/chrony.nix)

## `services.chrony.extraFlags` {#opt-services.chrony.extraFlags}

Extra flags passed to the chronyd command.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-s"
]
```

*Declared by:* [`nixos/modules/services/networking/ntp/chrony.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/chrony.nix)

## `services.chrony.initstepslew.enabled` {#opt-services.chrony.initstepslew.enabled}

DEPRECATED. Consider using `services.chrony.makestep` instead.
Allow chronyd to make a rapid measurement of the system clock error
at boot time, and to correct the system clock by stepping before
normal operation begins.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ntp/chrony.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/chrony.nix)

## `services.chrony.initstepslew.threshold` {#opt-services.chrony.initstepslew.threshold}

The threshold of system clock error (in seconds) above which the
clock will be stepped. If the correction required is less than the
threshold, a slew is used instead.

*Type:* floating point number or signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/networking/ntp/chrony.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/chrony.nix)

## `services.chrony.makestep.enable` {#opt-services.chrony.makestep.enable}

Allow chronyd to step the system clock if the error is larger than
the specified threshold.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/ntp/chrony.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/chrony.nix)

## `services.chrony.makestep.limit` {#opt-services.chrony.makestep.limit}

The maximum number of times the system clock will be stepped.

*Type:* positive integer, meaning \>0

*Default:* `3`

*Declared by:* [`nixos/modules/services/networking/ntp/chrony.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/chrony.nix)

## `services.chrony.makestep.threshold` {#opt-services.chrony.makestep.threshold}

The threshold of system clock error (in seconds) above which the
clock will be stepped. If the correction required is less than the
threshold, a slew is used instead.

*Type:* floating point number or signed integer

*Default:* `0.1`

*Declared by:* [`nixos/modules/services/networking/ntp/chrony.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/chrony.nix)

## `services.chrony.package` {#opt-services.chrony.package}

The chrony package to use.

*Type:* package

*Default:* `pkgs.chrony`

*Declared by:* [`nixos/modules/services/networking/ntp/chrony.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/chrony.nix)

## `services.chrony.serverOption` {#opt-services.chrony.serverOption}

Set option for server directives.

Use "iburst" to rapidly poll on startup. Recommended if your machine
is consistently online.

Use "offline" to prevent polling on startup. Recommended if your
machine boots offline or is otherwise frequently offline.

*Type:* one of "iburst", "offline"

*Default:* `"iburst"`

*Declared by:* [`nixos/modules/services/networking/ntp/chrony.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/chrony.nix)

## `services.chrony.servers` {#opt-services.chrony.servers}

The set of NTP servers from which to synchronise.

*Type:* list of string

*Default:* `config.networking.timeServers`

*Declared by:* [`nixos/modules/services/networking/ntp/chrony.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/chrony.nix)

## `services.cinnamon.apps.enable` {#opt-services.cinnamon.apps.enable}

Whether to enable Cinnamon default applications.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/cinnamon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/cinnamon.nix)

## `services.cjdns.ETHInterface.beacon` {#opt-services.cjdns.ETHInterface.beacon}

Auto-connect to other cjdns nodes on the same network.
Options:
0: Disabled.
1: Accept beacons, this will cause cjdns to accept incoming
beacon messages and try connecting to the sender.
2: Accept and send beacons, this will cause cjdns to broadcast
messages on the local network which contain a randomly
generated per-session password, other nodes which have this
set to 1 or 2 will hear the beacon messages and connect
automatically.

*Type:* signed integer

*Default:* `2`

*Declared by:* [`nixos/modules/services/networking/cjdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cjdns.nix)

## `services.cjdns.ETHInterface.bind` {#opt-services.cjdns.ETHInterface.bind}

Bind to this device for native ethernet operation.
`all` is a pseudo-name which will try to connect to all devices.

*Type:* string

*Default:* `""`

*Example:* `"eth0"`

*Declared by:* [`nixos/modules/services/networking/cjdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cjdns.nix)

## `services.cjdns.ETHInterface.connectTo` {#opt-services.cjdns.ETHInterface.connectTo}

Credentials for connecting look similar to UDP credientials
except they begin with the mac address.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "01:02:03:04:05:06" = {
    hostname = "homer.hype";
    password = "5kG15EfpdcKNX3f2GSQ0H1HC7yIfxoCoImnO5FHM";
    publicKey = "371zpkgs8ss387tmr81q04mp0hg1skb51hw34vk1cq644mjqhup0.k";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/cjdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cjdns.nix)

## `services.cjdns.ETHInterface.connectTo.<name>.hostname` {#opt-services.cjdns.ETHInterface.connectTo._name_.hostname}

Optional hostname to add to /etc/hosts; prevents reverse lookup failures.

*Type:* string

*Default:* `""`

*Example:* `"foobar.hype"`

*Declared by:* [`nixos/modules/services/networking/cjdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cjdns.nix)

## `services.cjdns.ETHInterface.connectTo.<name>.login` {#opt-services.cjdns.ETHInterface.connectTo._name_.login}

(optional) name your peer has for you

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/cjdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cjdns.nix)

## `services.cjdns.ETHInterface.connectTo.<name>.password` {#opt-services.cjdns.ETHInterface.connectTo._name_.password}

Authorized password to the opposite end of the tunnel.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/cjdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cjdns.nix)

## `services.cjdns.ETHInterface.connectTo.<name>.peerName` {#opt-services.cjdns.ETHInterface.connectTo._name_.peerName}

(optional) human-readable name for peer

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/cjdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cjdns.nix)

## `services.cjdns.ETHInterface.connectTo.<name>.publicKey` {#opt-services.cjdns.ETHInterface.connectTo._name_.publicKey}

Public key at the opposite end of the tunnel.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/cjdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cjdns.nix)

## `services.cjdns.UDPInterface.bind` {#opt-services.cjdns.UDPInterface.bind}

Address and port to bind UDP tunnels to.

*Type:* string

*Default:* `""`

*Example:* `"192.168.1.32:43211"`

*Declared by:* [`nixos/modules/services/networking/cjdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cjdns.nix)

## `services.cjdns.UDPInterface.connectTo` {#opt-services.cjdns.UDPInterface.connectTo}

Credentials for making UDP tunnels.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "192.168.1.1:27313" = {
    hostname = "homer.hype";
    password = "5kG15EfpdcKNX3f2GSQ0H1HC7yIfxoCoImnO5FHM";
    publicKey = "371zpkgs8ss387tmr81q04mp0hg1skb51hw34vk1cq644mjqhup0.k";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/cjdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cjdns.nix)

## `services.cjdns.UDPInterface.connectTo.<name>.hostname` {#opt-services.cjdns.UDPInterface.connectTo._name_.hostname}

Optional hostname to add to /etc/hosts; prevents reverse lookup failures.

*Type:* string

*Default:* `""`

*Example:* `"foobar.hype"`

*Declared by:* [`nixos/modules/services/networking/cjdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cjdns.nix)

## `services.cjdns.UDPInterface.connectTo.<name>.login` {#opt-services.cjdns.UDPInterface.connectTo._name_.login}

(optional) name your peer has for you

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/cjdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cjdns.nix)

## `services.cjdns.UDPInterface.connectTo.<name>.password` {#opt-services.cjdns.UDPInterface.connectTo._name_.password}

Authorized password to the opposite end of the tunnel.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/cjdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cjdns.nix)

## `services.cjdns.UDPInterface.connectTo.<name>.peerName` {#opt-services.cjdns.UDPInterface.connectTo._name_.peerName}

(optional) human-readable name for peer

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/cjdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cjdns.nix)

## `services.cjdns.UDPInterface.connectTo.<name>.publicKey` {#opt-services.cjdns.UDPInterface.connectTo._name_.publicKey}

Public key at the opposite end of the tunnel.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/cjdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cjdns.nix)

## `services.cjdns.addExtraHosts` {#opt-services.cjdns.addExtraHosts}

Whether to add cjdns peers with an associated hostname to
`/etc/hosts`.  Beware that enabling this
incurs heavy eval-time costs.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/cjdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cjdns.nix)

## `services.cjdns.admin.bind` {#opt-services.cjdns.admin.bind}

Bind the administration port to this address and port.

*Type:* string

*Default:* `"127.0.0.1:11234"`

*Declared by:* [`nixos/modules/services/networking/cjdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cjdns.nix)

## `services.cjdns.authorizedPasswords` {#opt-services.cjdns.authorizedPasswords}

Any remote cjdns nodes that offer these passwords on
connection will be allowed to route through this node.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "snyrfgkqsc98qh1y4s5hbu0j57xw5s0"
  "z9md3t4p45mfrjzdjurxn4wuj0d8swv"
  "49275fut6tmzu354pq70sr5b95qq0vj"
]
```

*Declared by:* [`nixos/modules/services/networking/cjdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cjdns.nix)

## `services.cjdns.confFile` {#opt-services.cjdns.confFile}

Ignore all other cjdns options and load configuration from this file.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/etc/cjdroute.conf"`

*Declared by:* [`nixos/modules/services/networking/cjdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cjdns.nix)

## `services.cjdns.enable` {#opt-services.cjdns.enable}

Whether to enable the cjdns network encryption
and routing engine. A file at /etc/cjdns.keys will
be created if it does not exist to contain a random
secret key that your IPv6 address will be derived from.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/cjdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cjdns.nix)

## `services.cjdns.extraConfig` {#opt-services.cjdns.extraConfig}

Extra configuration, given as attrs, that will be merged recursively
with the rest of the JSON generated by this module, at the root node.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  router = {
    interface = {
      tunDevice = "tun10";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/networking/cjdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cjdns.nix)

## `services.clamav.clamonacc.enable` {#opt-services.clamav.clamonacc.enable}

Whether to enable ClamAV on-access scanner.

The settings for ClamAV's on-access scanner is configured in `clamd.conf` via `services.clamav.daemon.settings`.
Refer to [https://docs.clamav.net/manual/OnAccess.html](https://docs.clamav.net/manual/OnAccess.html) on how to configure it.

Example to scan `/home/foo/Downloads` (and block access until scanning is completed) would be:

```
services.clamav = {
  daemon.enable = true;
  clamonacc.enable = true;

  daemon.settings = {
    OnAccessPrevention = true;
    OnAccessIncludePath = "/home/foo/Downloads";
  };
};
```

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/clamav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/clamav.nix)

## `services.clamav.daemon.enable` {#opt-services.clamav.daemon.enable}

Whether to enable ClamAV clamd daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/clamav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/clamav.nix)

## `services.clamav.daemon.settings` {#opt-services.clamav.daemon.settings}

ClamAV configuration. Refer to [https://linux.die.net/man/5/clamd.conf](https://linux.die.net/man/5/clamd.conf),
for details on supported values.

*Type:* attribute set of (boolean or signed integer or string or list of string)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/clamav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/clamav.nix)

## `services.clamav.fangfrisch.enable` {#opt-services.clamav.fangfrisch.enable}

Whether to enable ClamAV fangfrisch updater.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/clamav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/clamav.nix)

## `services.clamav.fangfrisch.interval` {#opt-services.clamav.fangfrisch.interval}

How often fangfrisch is invoked. See `systemd.time(7)` for more
information about the format.

*Type:* string

*Default:* `"hourly"`

*Declared by:* [`nixos/modules/services/security/clamav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/clamav.nix)

## `services.clamav.fangfrisch.sanesecurity.enable` {#opt-services.clamav.fangfrisch.sanesecurity.enable}

Whether to enable the Sanesecurity signature provider.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/clamav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/clamav.nix)

## `services.clamav.fangfrisch.settings` {#opt-services.clamav.fangfrisch.settings}

fangfrisch configuration. Refer to [https://rseichter.github.io/fangfrisch/#\_configuration](https://rseichter.github.io/fangfrisch/#_configuration),
for details on supported values.

The Sanesecurity provider is enabled by default. The URLhaus provider
is enabled when [`services.clamav.fangfrisch.urlhaus.authKeyFile`](#opt-services.clamav.fangfrisch.urlhaus.authKeyFile)
is set. The URLhaus export may exceed fangfrisch's default 10 MiB size
limit, in which case `urlhaus.max_size` has to be raised.

Values set here end up world-readable in the Nix store, so URLhaus
keys belong in [`services.clamav.fangfrisch.urlhaus.authKeyFile`](#opt-services.clamav.fangfrisch.urlhaus.authKeyFile)
rather than in `urlhaus.auth_key`.

*Type:* open submodule of attribute set of attribute set of (string or signed integer or boolean)

*Default:* `{ }`

*Example:*

``` nix
{
  securiteinfo = {
    customer_id = "your customer_id";
    enabled = "yes";
  };
}
```

*Declared by:* [`nixos/modules/services/security/clamav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/clamav.nix)

## `services.clamav.fangfrisch.urlhaus.authKeyFile` {#opt-services.clamav.fangfrisch.urlhaus.authKeyFile}

File containing a personal URLhaus authentication key, obtainable
from [https://urlhaus.abuse.ch/](https://urlhaus.abuse.ch/). fangfrisch requires such a key
since version 1.9.3.

The file is passed to the service with systemd's `LoadCredential=`
and only ever written to a runtime copy of the configuration, never
to the Nix store. Setting this enables
[`services.clamav.fangfrisch.urlhaus.enable`](#opt-services.clamav.fangfrisch.urlhaus.enable).

Note that fangfrisch logs the full request URL when a download
fails, and the key is part of that URL, so an invalid or expired
key ends up in the journal. Keep that in mind when the journal is
shipped off-host.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/urlhaus-auth-key"`

*Declared by:* [`nixos/modules/services/security/clamav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/clamav.nix)

## `services.clamav.fangfrisch.urlhaus.enable` {#opt-services.clamav.fangfrisch.urlhaus.enable}

Whether to enable the URLhaus signature provider. This only
provides the default for
`services.clamav.fangfrisch.settings.urlhaus.enabled`, so an
explicit value there wins; enabling the provider here while
disabling it in the settings is an evaluation error.

*Type:* boolean

*Default:* `config.services.clamav.fangfrisch.urlhaus.authKeyFile != null`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/clamav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/clamav.nix)

## `services.clamav.package` {#opt-services.clamav.package}

The clamav package to use.

*Type:* package

*Default:* `pkgs.clamav`

*Declared by:* [`nixos/modules/services/security/clamav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/clamav.nix)

## `services.clamav.scanner.enable` {#opt-services.clamav.scanner.enable}

Whether to enable ClamAV scanner.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/clamav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/clamav.nix)

## `services.clamav.scanner.interval` {#opt-services.clamav.scanner.interval}

How often clamdscan is invoked. See `systemd.time(7)` for more
information about the format.
By default this runs using 10 cores at most, be sure to run it at a time of low traffic.

*Type:* string

*Default:* `"*-*-* 04:00:00"`

*Declared by:* [`nixos/modules/services/security/clamav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/clamav.nix)

## `services.clamav.scanner.scanDirectories` {#opt-services.clamav.scanner.scanDirectories}

List of directories to scan.
The default includes everything I could think of that is valid for nixos. Feel free to contribute a PR to add to the default if you see something missing.

*Type:* list of string

*Default:*

``` nix
[
  "/home"
  "/var/lib"
  "/tmp"
  "/etc"
  "/var/tmp"
]
```

*Declared by:* [`nixos/modules/services/security/clamav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/clamav.nix)

## `services.clamav.updater.enable` {#opt-services.clamav.updater.enable}

Whether to enable ClamAV freshclam updater.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/clamav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/clamav.nix)

## `services.clamav.updater.frequency` {#opt-services.clamav.updater.frequency}

Number of database checks per day.

*Type:* signed integer

*Default:* `12`

*Declared by:* [`nixos/modules/services/security/clamav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/clamav.nix)

## `services.clamav.updater.interval` {#opt-services.clamav.updater.interval}

How often freshclam is invoked. See `systemd.time(7)` for more
information about the format.

*Type:* string

*Default:* `"hourly"`

*Declared by:* [`nixos/modules/services/security/clamav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/clamav.nix)

## `services.clamav.updater.settings` {#opt-services.clamav.updater.settings}

freshclam configuration. Refer to [https://linux.die.net/man/5/freshclam.conf](https://linux.die.net/man/5/freshclam.conf),
for details on supported values.

*Type:* attribute set of (boolean or signed integer or string or list of string)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/clamav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/clamav.nix)

## `services.clatd.enable` {#opt-services.clatd.enable}

Whether to enable clatd.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/clatd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/clatd.nix)

## `services.clatd.enableNetworkManagerIntegration` {#opt-services.clatd.enableNetworkManagerIntegration}

Whether to enable NetworkManager integration.

*Type:* boolean

*Default:* `"config.networking.networkmanager.enable"`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/clatd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/clatd.nix)

## `services.clatd.package` {#opt-services.clatd.package}

The clatd package to use.

*Type:* package

*Default:* `pkgs.clatd`

*Declared by:* [`nixos/modules/services/networking/clatd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/clatd.nix)

## `services.clatd.settings` {#opt-services.clatd.settings}

Configuration of clatd. See [clatd Documentation](https://github.com/toreanderson/clatd/blob/master/README.pod#configuration).

*Type:* open submodule of attribute set of (atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  plat-prefix = "64:ff9b::/96";
}
```

*Declared by:* [`nixos/modules/services/networking/clatd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/clatd.nix)

## `services.clickhouse.enable` {#opt-services.clickhouse.enable}

Whether to enable ClickHouse database server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/clickhouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/clickhouse.nix)

## `services.clickhouse.extraServerConfig` {#opt-services.clickhouse.extraServerConfig}

Additional raw XML configuration for ClickHouse server.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  <clickhouse>
    <max_connections>500</max_connections>
    <keep_alive_timeout>3</keep_alive_timeout>
  </clickhouse>
''
```

*Declared by:* [`nixos/modules/services/databases/clickhouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/clickhouse.nix)

## `services.clickhouse.extraUsersConfig` {#opt-services.clickhouse.extraUsersConfig}

Additional raw XML configuration for ClickHouse server.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  <clickhouse>
    <users>
      <readonly>
        <profile>readonly</profile>
      </readonly>
    </users>
  </clickhouse>
''
```

*Declared by:* [`nixos/modules/services/databases/clickhouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/clickhouse.nix)

## `services.clickhouse.package` {#opt-services.clickhouse.package}

The clickhouse package to use.

*Type:* package

*Default:* `pkgs.clickhouse`

*Example:* `pkgs.clickhouse-lts`

*Declared by:* [`nixos/modules/services/databases/clickhouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/clickhouse.nix)

## `services.clickhouse.serverConfig` {#opt-services.clickhouse.serverConfig}

Your `config.yaml` as a Nix attribute set.
Check the [documentation](https://clickhouse.com/docs/operations/configuration-files)
for possible options.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  http_port = 8123;
  tcp_port = 9000;

  remote_servers = {
    default = {
      shard = {
        replica = [
          { host = "::"; port = "9000"; }
          { host = "::"; port = "9001"; }
          { host = "::"; port = "9002"; }
        ];
      };
    };
  };
}
```

*Declared by:* [`nixos/modules/services/databases/clickhouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/clickhouse.nix)

## `services.clickhouse.usersConfig` {#opt-services.clickhouse.usersConfig}

Your `users.yaml` as a Nix attribute set.
Check the [documentation](https://clickhouse.com/docs/operations/configuration-files#user-settings)
for possible options.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  profiles = {};

  users = {
    default = {
      profile = "default";
      password_sha256_hex = "36dd292533174299fb0c34665df468bb881756ca9eaf9757d0cfde38f9ededa1";  # `echo -n verysecret | sha256sum`
    };
  };
}
```

*Declared by:* [`nixos/modules/services/databases/clickhouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/clickhouse.nix)

## `services.clight.enable` {#opt-services.clight.enable}

Whether to enable clight.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/clight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/clight.nix)

## `services.clight.settings` {#opt-services.clight.settings}

Additional configuration to extend clight.conf. See
[https://github.com/FedeDP/Clight/blob/master/Extra/clight.conf](https://github.com/FedeDP/Clight/blob/master/Extra/clight.conf) for a
sample configuration file.

*Type:* attribute set of (null or signed integer or string or boolean or floating point number or list of (signed integer or string or boolean or floating point number) or attribute set of (signed integer or string or boolean or floating point number or list of (signed integer or string or boolean or floating point number)))

*Default:* `{ }`

*Example:*

``` nix
{
  ac_capture_timeouts = [
    120
    300
    60
  ];
  captures = 20;
  gamma_long_transition = true;
}
```

*Declared by:* [`nixos/modules/services/x11/clight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/clight.nix)

## `services.clight.temperature.day` {#opt-services.clight.temperature.day}

Colour temperature to use during the day, between
`1000` and `25000` K.

*Type:* signed integer

*Default:* `5500`

*Declared by:* [`nixos/modules/services/x11/clight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/clight.nix)

## `services.clight.temperature.night` {#opt-services.clight.temperature.night}

Colour temperature to use at night, between
`1000` and `25000` K.

*Type:* signed integer

*Default:* `3700`

*Declared by:* [`nixos/modules/services/x11/clight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/clight.nix)

## `services.clipcat.enable` {#opt-services.clipcat.enable}

Whether to enable Clipcat clipboard daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/clipcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/clipcat.nix)

## `services.clipcat.package` {#opt-services.clipcat.package}

The clipcat package to use.

*Type:* package

*Default:* `pkgs.clipcat`

*Declared by:* [`nixos/modules/services/misc/clipcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/clipcat.nix)

## `services.clipmenu.enable` {#opt-services.clipmenu.enable}

Whether to enable clipmenu, the clipboard management daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/clipmenu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/clipmenu.nix)

## `services.clipmenu.package` {#opt-services.clipmenu.package}

The clipmenu package to use.

*Type:* package

*Default:* `pkgs.clipmenu`

*Declared by:* [`nixos/modules/services/misc/clipmenu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/clipmenu.nix)

## `services.cliproxyapi.enable` {#opt-services.cliproxyapi.enable}

Whether to enable CLIProxyAPI.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/cliproxyapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cliproxyapi.nix)

## `services.cliproxyapi.environmentFile` {#opt-services.cliproxyapi.environmentFile}

Environment file as defined in `systemd.exec(5)`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/cliproxyapi.env"`

*Declared by:* [`nixos/modules/services/misc/cliproxyapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cliproxyapi.nix)

## `services.cliproxyapi.group` {#opt-services.cliproxyapi.group}

Group under which CLIProxyAPI runs.

*Type:* string

*Default:* `"cliproxyapi"`

*Declared by:* [`nixos/modules/services/misc/cliproxyapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cliproxyapi.nix)

## `services.cliproxyapi.openFirewall` {#opt-services.cliproxyapi.openFirewall}

Whether to open the firewall for [`services.cliproxyapi.settings.server.port`](#opt-services.cliproxyapi.settings.server.port).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/cliproxyapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cliproxyapi.nix)

## `services.cliproxyapi.package` {#opt-services.cliproxyapi.package}

The cliproxyapi package to use.

*Type:* package

*Default:* `pkgs.cliproxyapi`

*Declared by:* [`nixos/modules/services/misc/cliproxyapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cliproxyapi.nix)

## `services.cliproxyapi.settings` {#opt-services.cliproxyapi.settings}

Configuration for CLIProxyAPI. See the
[example configuration](https://github.com/router-for-me/CLIProxyAPI/blob/main/config.example.yaml)
for available options. Secret values can be loaded from files using
`._secret = "/path/to/secret";`.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Example:*

``` nix
{
  server = {
    host = "127.0.0.1";
    port = 8317;
  };
  access.api-keys = [ { _secret = "/run/secrets/cliproxyapi-api-key"; } ];
  management.secret-key._secret = "/run/secrets/cliproxyapi-management-key";
}
```

*Declared by:* [`nixos/modules/services/misc/cliproxyapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cliproxyapi.nix)

## `services.cliproxyapi.settings.oauth.auth-dir` {#opt-services.cliproxyapi.settings.oauth.auth-dir}

Directory where OAuth tokens are stored.

*Type:* string

*Default:* `"/var/lib/cliproxyapi"`

*Declared by:* [`nixos/modules/services/misc/cliproxyapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cliproxyapi.nix)

## `services.cliproxyapi.settings.server.port` {#opt-services.cliproxyapi.settings.server.port}

Port on which CLIProxyAPI listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8317`

*Declared by:* [`nixos/modules/services/misc/cliproxyapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cliproxyapi.nix)

## `services.cliproxyapi.user` {#opt-services.cliproxyapi.user}

User account under which CLIProxyAPI runs.

*Type:* string

*Default:* `"cliproxyapi"`

*Declared by:* [`nixos/modules/services/misc/cliproxyapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cliproxyapi.nix)

## `services.cloud-init.btrfs.enable` {#opt-services.cloud-init.btrfs.enable}

Allow the cloud-init service to operate `btrfs` filesystem.

*Type:* boolean

*Default:* `hasFs "btrfs"`

*Declared by:* [`nixos/modules/services/system/cloud-init.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cloud-init.nix)

## `services.cloud-init.config` {#opt-services.cloud-init.config}

raw cloud-init configuration.

Takes precedence over the `settings` option if set.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/system/cloud-init.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cloud-init.nix)

## `services.cloud-init.enable` {#opt-services.cloud-init.enable}

Enable the cloud-init service. This services reads
configuration metadata in a cloud environment and configures
the machine according to this metadata.

This configuration is not completely compatible with the
NixOS way of doing configuration, as configuration done by
cloud-init might be overridden by a subsequent nixos-rebuild
call. However, some parts of cloud-init fall outside of
NixOS's responsibility, like filesystem resizing and ssh
public key provisioning, and cloud-init is useful for that
parts. Thus, be wary that using cloud-init in NixOS might
come as some cost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/system/cloud-init.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cloud-init.nix)

## `services.cloud-init.ext4.enable` {#opt-services.cloud-init.ext4.enable}

Allow the cloud-init service to operate `ext4` filesystem.

*Type:* boolean

*Default:* `hasFs "ext4"`

*Declared by:* [`nixos/modules/services/system/cloud-init.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cloud-init.nix)

## `services.cloud-init.extraPackages` {#opt-services.cloud-init.extraPackages}

List of additional packages to be available within cloud-init jobs.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/system/cloud-init.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cloud-init.nix)

## `services.cloud-init.network.enable` {#opt-services.cloud-init.network.enable}

Allow the cloud-init service to configure network interfaces
through systemd-networkd.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/system/cloud-init.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cloud-init.nix)

## `services.cloud-init.settings` {#opt-services.cloud-init.settings}

Structured cloud-init configuration.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/system/cloud-init.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cloud-init.nix)

## `services.cloud-init.xfs.enable` {#opt-services.cloud-init.xfs.enable}

Allow the cloud-init service to operate `xfs` filesystem.

*Type:* boolean

*Default:* `hasFs "xfs"`

*Declared by:* [`nixos/modules/services/system/cloud-init.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/cloud-init.nix)

## `services.cloudflare-ddns.cacheExpiration` {#opt-services.cloudflare-ddns.cacheExpiration}

Duration for which API responses (like Zone ID, Record IDs) are cached.
Uses Go's duration format (e.g., "6h", "1h30m").

*Type:* string

*Default:* `"6h"`

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-ddns.credentialsFile` {#opt-services.cloudflare-ddns.credentialsFile}

Path to a file containing the Cloudflare API authentication token.
The file content should be in the format `CLOUDFLARE_API_TOKEN=YOUR_SECRET_TOKEN`.
The service user needs read access to this file.
Ensure permissions are secure (e.g., `0400` or `0440`) and ownership is appropriate
Using `CLOUDFLARE_API_TOKEN` is preferred over the deprecated `CF_API_TOKEN`.

*Type:* absolute path

*Example:* `"/run/secrets/cloudflare-ddns-token"`

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-ddns.deleteOnStop` {#opt-services.cloudflare-ddns.deleteOnStop}

Whether to delete the managed DNS records and clear WAF lists when the service is stopped gracefully.
Warning: Setting this to true with `updateCron = "@once"` will cause immediate deletion.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-ddns.detectionTimeout` {#opt-services.cloudflare-ddns.detectionTimeout}

Timeout for detecting the public IP address.

*Type:* string

*Default:* `"5s"`

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-ddns.domains` {#opt-services.cloudflare-ddns.domains}

List of domain names (FQDNs) to manage. Wildcards like `*.example.com` are supported.
These domains will be managed for both IPv4 and IPv6 unless overridden by
`ip4Domains` or `ip6Domains`, or if the respective providers are disabled.
This corresponds to the `DOMAINS` environment variable.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "home.example.com"
  "*.dynamic.example.org"
]
```

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-ddns.enable` {#opt-services.cloudflare-ddns.enable}

Whether to enable Cloudflare Dynamic DNS service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-ddns.group` {#opt-services.cloudflare-ddns.group}

Group under which the service runs.

*Type:* string

*Default:* `"cloudflare-ddns"`

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-ddns.healthchecks` {#opt-services.cloudflare-ddns.healthchecks}

URL for Healthchecks.io monitoring endpoint (optional).

*Type:* null or string

*Default:* `null`

*Example:* `"https://hc-ping.com/your-uuid"`

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-ddns.ip4Domains` {#opt-services.cloudflare-ddns.ip4Domains}

Explicit list of domains to manage only for IPv4. If set, overrides `domains` for IPv4.
Corresponds to the `IP4_DOMAINS` environment variable.

*Type:* null or (list of string)

*Default:* `null`

*Example:*

``` nix
[
  "ipv4.example.com"
]
```

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-ddns.ip6Domains` {#opt-services.cloudflare-ddns.ip6Domains}

Explicit list of domains to manage only for IPv6. If set, overrides `domains` for IPv6.
Corresponds to the `IP6_DOMAINS` environment variable.

*Type:* null or (list of string)

*Default:* `null`

*Example:*

``` nix
[
  "ipv6.example.com"
]
```

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-ddns.package` {#opt-services.cloudflare-ddns.package}

The cloudflare-ddns package to use.

*Type:* package

*Default:* `pkgs.cloudflare-ddns`

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-ddns.provider.ipv4` {#opt-services.cloudflare-ddns.provider.ipv4}

IP detection provider for IPv4. Common values: `cloudflare.trace`, `cloudflare.doh`, `local`, `url:URL`, `none`.
Use `none` to disable IPv4 updates.
See cloudflare-ddns documentation for all options.

*Type:* string

*Default:* `"cloudflare.trace"`

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-ddns.provider.ipv6` {#opt-services.cloudflare-ddns.provider.ipv6}

IP detection provider for IPv6. Common values: `cloudflare.trace`, `cloudflare.doh`, `local`, `url:URL`, `none`.
Use `none` to disable IPv6 updates.
See cloudflare-ddns documentation for all options.

*Type:* string

*Default:* `"cloudflare.trace"`

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-ddns.proxied` {#opt-services.cloudflare-ddns.proxied}

Whether the managed DNS records should be proxied through Cloudflare ('orange cloud').
Accepts boolean values (`true`, `false`) or a domain expression.
See cloudflare-ddns documentation for expression syntax (e.g., "is(a.com) || sub(b.org)").

*Type:* string

*Default:* `"false"`

*Example:* `"true"`

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-ddns.recordComment` {#opt-services.cloudflare-ddns.recordComment}

Comment to add to managed DNS records.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-ddns.shoutrrr` {#opt-services.cloudflare-ddns.shoutrrr}

List of Shoutrrr notification service URLs (optional).

*Type:* null or (list of string)

*Default:* `null`

*Example:*

``` nix
[
  "discord://token@id"
  "gotify://host/token"
]
```

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-ddns.ttl` {#opt-services.cloudflare-ddns.ttl}

Time To Live (TTL) for the DNS records in seconds.
Must be 1 (for automatic) or between 30 and 86400.

*Type:* positive integer, meaning \>0

*Default:* `1`

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-ddns.updateCron` {#opt-services.cloudflare-ddns.updateCron}

Cron expression for how often to check and update IPs.
Use "@once" to run only once and then exit.

*Type:* string

*Default:* `"@every 5m"`

*Example:* `"@hourly"`

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-ddns.updateOnStart` {#opt-services.cloudflare-ddns.updateOnStart}

Whether to perform an update check immediately on service start.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-ddns.updateTimeout` {#opt-services.cloudflare-ddns.updateTimeout}

Timeout for updating records via the Cloudflare API.

*Type:* string

*Default:* `"30s"`

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-ddns.uptimeKuma` {#opt-services.cloudflare-ddns.uptimeKuma}

URL for Uptime Kuma push monitor endpoint (optional).

*Type:* null or string

*Default:* `null`

*Example:* `"https://status.example.com/api/push/tag?status=up&msg=OK&ping="`

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-ddns.user` {#opt-services.cloudflare-ddns.user}

User account under which the service runs.

*Type:* string

*Default:* `"cloudflare-ddns"`

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-ddns.wafListDescription` {#opt-services.cloudflare-ddns.wafListDescription}

Description for managed WAF lists (used when creating or verifying lists).

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-ddns.wafLists` {#opt-services.cloudflare-ddns.wafLists}

List of WAF IP Lists to manage, in the format `account-id/list-name`.
(Experimental feature as of cloudflare-ddns 1.14.0).

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "YOUR_ACCOUNT_ID/allowed_dynamic_ips"
]
```

*Declared by:* [`nixos/modules/services/networking/cloudflare-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-ddns.nix)

## `services.cloudflare-dyndns.apiTokenFile` {#opt-services.cloudflare-dyndns.apiTokenFile}

The path to a file containing the CloudFlare API token.

*Type:* absolute path not in the Nix store

*Declared by:* [`nixos/modules/services/networking/cloudflare-dyndns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-dyndns.nix)

## `services.cloudflare-dyndns.deleteMissing` {#opt-services.cloudflare-dyndns.deleteMissing}

Whether to delete the record when no IP address is found.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/cloudflare-dyndns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-dyndns.nix)

## `services.cloudflare-dyndns.domains` {#opt-services.cloudflare-dyndns.domains}

List of domain names to update records for.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/cloudflare-dyndns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-dyndns.nix)

## `services.cloudflare-dyndns.enable` {#opt-services.cloudflare-dyndns.enable}

Whether to enable Cloudflare Dynamic DNS Client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/cloudflare-dyndns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-dyndns.nix)

## `services.cloudflare-dyndns.frequency` {#opt-services.cloudflare-dyndns.frequency}

Run cloudflare-dyndns with the given frequency (see
`systemd.time(7)` for the format).
If null, do not run automatically.

*Type:* null or string

*Default:* `"*:0/5"`

*Declared by:* [`nixos/modules/services/networking/cloudflare-dyndns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-dyndns.nix)

## `services.cloudflare-dyndns.ipv4` {#opt-services.cloudflare-dyndns.ipv4}

Whether to enable setting IPv4 A records.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/cloudflare-dyndns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-dyndns.nix)

## `services.cloudflare-dyndns.ipv6` {#opt-services.cloudflare-dyndns.ipv6}

Whether to enable setting IPv6 AAAA records.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/cloudflare-dyndns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-dyndns.nix)

## `services.cloudflare-dyndns.package` {#opt-services.cloudflare-dyndns.package}

The cloudflare-dyndns package to use.

*Type:* package

*Default:* `pkgs.cloudflare-dyndns`

*Declared by:* [`nixos/modules/services/networking/cloudflare-dyndns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-dyndns.nix)

## `services.cloudflare-dyndns.proxied` {#opt-services.cloudflare-dyndns.proxied}

Whether this is a DNS-only record, or also being proxied through CloudFlare.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/cloudflare-dyndns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-dyndns.nix)

## `services.cloudflare-warp.enable` {#opt-services.cloudflare-warp.enable}

Whether to enable Cloudflare Zero Trust client daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/cloudflare-warp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-warp.nix)

## `services.cloudflare-warp.openFirewall` {#opt-services.cloudflare-warp.openFirewall}

Whether to enable opening UDP ports in the firewall.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/cloudflare-warp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-warp.nix)

## `services.cloudflare-warp.package` {#opt-services.cloudflare-warp.package}

The cloudflare-warp package to use.

*Type:* package

*Default:* `pkgs.cloudflare-warp`

*Declared by:* [`nixos/modules/services/networking/cloudflare-warp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-warp.nix)

## `services.cloudflare-warp.rootDir` {#opt-services.cloudflare-warp.rootDir}

Working directory for the warp-svc daemon.

*Type:* string

*Default:* `"/var/lib/cloudflare-warp"`

*Declared by:* [`nixos/modules/services/networking/cloudflare-warp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-warp.nix)

## `services.cloudflare-warp.udpPort` {#opt-services.cloudflare-warp.udpPort}

The UDP port to open in the firewall. Warp uses port 2408 by default, but fallback ports can be used
if that conflicts with another service. See the [firewall documentation](https://developers.cloudflare.com/cloudflare-one/connections/connect-devices/warp/deployment/firewall#warp-udp-ports)
for the pre-configured available fallback ports.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `2408`

*Declared by:* [`nixos/modules/services/networking/cloudflare-warp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflare-warp.nix)

## `services.cloudflared.certificateFile` {#opt-services.cloudflared.certificateFile}

Account certificate file, necessary to create, delete and manage tunnels. It can be obtained by running `cloudflared login`.

Note that this is **necessary** for a fully declarative set up, as routes can not otherwise be created outside of the Cloudflare interface.

See [Cert.pem](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-useful-terms/#certpem) for information about the file, and [Tunnel permissions](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/do-more-with-tunnels/local-management/tunnel-permissions/) for a comparison between the account certificate and the tunnel credentials file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.enable` {#opt-services.cloudflared.enable}

Whether to enable Cloudflare Tunnel client daemon (formerly Argo Tunnel).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.package` {#opt-services.cloudflared.package}

The cloudflared package to use.

*Type:* package

*Default:* `pkgs.cloudflared`

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.tunnels` {#opt-services.cloudflared.tunnels}

Cloudflare tunnels.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "00000000-0000-0000-0000-000000000000" = {
    credentialsFile = "/tmp/test";
    default = "http_status:404";
    ingress = {
      "*.domain1.com" = {
        service = "http://localhost:80";
      };
    };
  };
}
```

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.tunnels.<name>.certificateFile` {#opt-services.cloudflared.tunnels._name_.certificateFile}

Account certificate file, necessary to create, delete and manage tunnels. It can be obtained by running `cloudflared login`.

Note that this is **necessary** for a fully declarative set up, as routes can not otherwise be created outside of the Cloudflare interface.

See [Cert.pem](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-useful-terms/#certpem) for information about the file, and [Tunnel permissions](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/do-more-with-tunnels/local-management/tunnel-permissions/) for a comparison between the account certificate and the tunnel credentials file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.tunnels.<name>.credentialsFile` {#opt-services.cloudflared.tunnels._name_.credentialsFile}

Credential file.

See [Credentials file](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-useful-terms/#credentials-file).

*Type:* absolute path

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.tunnels.<name>.default` {#opt-services.cloudflared.tunnels._name_.default}

Catch-all service if no ingress matches.

See `service`.

*Type:* string

*Example:* `"http_status:404"`

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.tunnels.<name>.edgeIPVersion` {#opt-services.cloudflared.tunnels._name_.edgeIPVersion}

Specifies the IP address version (IPv4 or IPv6) used to establish a connection between `cloudflared` and the Cloudflare global network.

The value `auto` relies on the host operating system to determine which IP version to select. The first IP version returned from the DNS resolution of the region lookup will be used as the primary set. In dual IPv6 and IPv4 network setups, `cloudflared` will separate the IP versions into two address sets that will be used to fallback in connectivity failure scenarios.

See [Tunnel run parameters](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/configure-tunnels/cloudflared-parameters/run-parameters/#edge-ip-version).

*Type:* one of "auto", "4", "6"

*Default:* `"4"`

*Example:* `"auto"`

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.tunnels.<name>.ingress` {#opt-services.cloudflared.tunnels._name_.ingress}

Ingress rules.

See [Ingress rules](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/configuration/local-management/ingress/).

*Type:* attribute set of (string or (submodule))

*Default:* `{ }`

*Example:*

``` nix
{
  "*.anotherone.com" = "http://localhost:80";
  "*.domain.com" = "http://localhost:80";
}
```

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.tunnels.<name>.originRequest.caPool` {#opt-services.cloudflared.tunnels._name_.originRequest.caPool}

Path to the certificate authority (CA) for the certificate of your origin. This option should be used only if your certificate is not signed by Cloudflare.

*Type:* null or string or absolute path

*Default:* `null`

*Example:* `""`

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.tunnels.<name>.originRequest.connectTimeout` {#opt-services.cloudflared.tunnels._name_.originRequest.connectTimeout}

Timeout for establishing a new TCP connection to your origin server. This excludes the time taken to establish TLS, which is controlled by [tlsTimeout](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/configuration/local-management/ingress/#tlstimeout).

*Type:* null or string

*Default:* `null`

*Example:* `"30s"`

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.tunnels.<name>.originRequest.disableChunkedEncoding` {#opt-services.cloudflared.tunnels._name_.originRequest.disableChunkedEncoding}

Disables chunked transfer encoding. Useful if you are running a WSGI server.

*Type:* null or boolean

*Default:* `null`

*Example:* `false`

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.tunnels.<name>.originRequest.httpHostHeader` {#opt-services.cloudflared.tunnels._name_.originRequest.httpHostHeader}

Sets the HTTP `Host` header on requests sent to the local service.

*Type:* null or string

*Default:* `null`

*Example:* `""`

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.tunnels.<name>.originRequest.keepAliveConnections` {#opt-services.cloudflared.tunnels._name_.originRequest.keepAliveConnections}

Maximum number of idle keepalive connections between Tunnel and your origin. This does not restrict the total number of concurrent connections.

*Type:* null or signed integer

*Default:* `null`

*Example:* `100`

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.tunnels.<name>.originRequest.keepAliveTimeout` {#opt-services.cloudflared.tunnels._name_.originRequest.keepAliveTimeout}

Timeout after which an idle keepalive connection can be discarded.

*Type:* null or string

*Default:* `null`

*Example:* `"1m30s"`

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.tunnels.<name>.originRequest.noHappyEyeballs` {#opt-services.cloudflared.tunnels._name_.originRequest.noHappyEyeballs}

Disable the “happy eyeballs” algorithm for IPv4/IPv6 fallback if your local network has misconfigured one of the protocols.

*Type:* null or boolean

*Default:* `null`

*Example:* `false`

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.tunnels.<name>.originRequest.noTLSVerify` {#opt-services.cloudflared.tunnels._name_.originRequest.noTLSVerify}

Disables TLS verification of the certificate presented by your origin. Will allow any certificate from the origin to be accepted.

*Type:* null or boolean

*Default:* `null`

*Example:* `false`

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.tunnels.<name>.originRequest.originServerName` {#opt-services.cloudflared.tunnels._name_.originRequest.originServerName}

Hostname that `cloudflared` should expect from your origin server certificate.

*Type:* null or string

*Default:* `null`

*Example:* `""`

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.tunnels.<name>.originRequest.proxyAddress` {#opt-services.cloudflared.tunnels._name_.originRequest.proxyAddress}

`cloudflared` starts a proxy server to translate HTTP traffic into TCP when proxying, for example, SSH or RDP. This configures the listen address for that proxy.

*Type:* null or string

*Default:* `null`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.tunnels.<name>.originRequest.proxyPort` {#opt-services.cloudflared.tunnels._name_.originRequest.proxyPort}

`cloudflared` starts a proxy server to translate HTTP traffic into TCP when proxying, for example, SSH or RDP. This configures the listen port for that proxy. If set to zero, an unused port will randomly be chosen.

*Type:* null or signed integer

*Default:* `null`

*Example:* `0`

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.tunnels.<name>.originRequest.proxyType` {#opt-services.cloudflared.tunnels._name_.originRequest.proxyType}

`cloudflared` starts a proxy server to translate HTTP traffic into TCP when proxying, for example, SSH or RDP. This configures what type of proxy will be started. Valid options are:

- `""` for the regular proxy
- `"socks"` for a SOCKS5 proxy. Refer to the [tutorial on connecting through Cloudflare Access using kubectl](https://developers.cloudflare.com/cloudflare-one/tutorials/kubectl/) for more information.

*Type:* null or one of "", "socks"

*Default:* `null`

*Example:* `""`

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.tunnels.<name>.originRequest.tcpKeepAlive` {#opt-services.cloudflared.tunnels._name_.originRequest.tcpKeepAlive}

The timeout after which a TCP keepalive packet is sent on a connection between Tunnel and the origin server.

*Type:* null or string

*Default:* `null`

*Example:* `"30s"`

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.tunnels.<name>.originRequest.tlsTimeout` {#opt-services.cloudflared.tunnels._name_.originRequest.tlsTimeout}

Timeout for completing a TLS handshake to your origin server, if you have chosen to connect Tunnel to an HTTPS server.

*Type:* null or string

*Default:* `null`

*Example:* `"10s"`

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.tunnels.<name>.protocol` {#opt-services.cloudflared.tunnels._name_.protocol}

Specifies the protocol used to establish a connection between `cloudflared` and the Cloudflare global network.

The value `auto` lets `cloudflared` choose the protocol (currently QUIC, falling back to HTTP/2).
Set to `http2` to work around QUIC/UDP connectivity issues, such as restrictive firewalls, broken UDP path MTU, or QUIC interop bugs.
Set to `quic` to force QUIC.

See [Tunnel run parameters](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/configure-tunnels/cloudflared-parameters/run-parameters/#protocol).

*Type:* one of "auto", "http2", "quic"

*Default:* `"auto"`

*Example:* `"http2"`

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudflared.tunnels.<name>.warp-routing.enabled` {#opt-services.cloudflared.tunnels._name_.warp-routing.enabled}

Enable warp routing.

See [Connect from WARP to a private network on Cloudflare using Cloudflare Tunnel](https://developers.cloudflare.com/cloudflare-one/tutorials/warp-to-tunnel/).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/cloudflared.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cloudflared.nix)

## `services.cloudlog.baseUrl` {#opt-services.cloudlog.baseUrl}

Cloudlog base URL

*Type:* string

*Default:* `"http://localhost"`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.dataDir` {#opt-services.cloudlog.dataDir}

Cloudlog data directory.

*Type:* string

*Default:* `"/var/lib/cloudlog"`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.database.createLocally` {#opt-services.cloudlog.database.createLocally}

Create the database and database user locally.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.database.host` {#opt-services.cloudlog.database.host}

MySQL database host

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.database.name` {#opt-services.cloudlog.database.name}

MySQL database name.

*Type:* string

*Default:* `"cloudlog"`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.database.passwordFile` {#opt-services.cloudlog.database.passwordFile}

MySQL user password file.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.database.user` {#opt-services.cloudlog.database.user}

MySQL user name.

*Type:* string

*Default:* `"cloudlog"`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.enable` {#opt-services.cloudlog.enable}

Whether to enable Cloudlog.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.extraConfig` {#opt-services.cloudlog.extraConfig}

Any additional text to be appended to the config.php
configuration file. This is a PHP script. For configuration
settings, see [https://github.com/magicbug/Cloudlog/wiki/Cloudlog.php-Configuration-File](https://github.com/magicbug/Cloudlog/wiki/Cloudlog.php-Configuration-File).

*Type:* string

*Default:* `""`

*Example:*

``` nix
''
  $config['show_time'] = TRUE;
''
```

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.poolConfig` {#opt-services.cloudlog.poolConfig}

Options for Cloudlog's PHP-FPM pool.

*Type:* attribute set of (string or signed integer or boolean)

*Default:*

``` nix
{
  pm = "dynamic";
  "pm.max_children" = 32;
  "pm.max_requests" = 500;
  "pm.max_spare_servers" = 4;
  "pm.min_spare_servers" = 2;
  "pm.start_servers" = 2;
}
```

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.update-clublog-scp.enable` {#opt-services.cloudlog.update-clublog-scp.enable}

Whether to periodically update the Clublog SCP database. If enabled,
a systemd timer will run the update task as specified by the interval
option.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.update-clublog-scp.interval` {#opt-services.cloudlog.update-clublog-scp.interval}

Specification (in the format described by `systemd.time(7)`) of the time
at which the Clublog SCP update will occur.

*Type:* string

*Default:* `"monthly"`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.update-dok.enable` {#opt-services.cloudlog.update-dok.enable}

Whether to periodically update the DOK resource file. If enabled, a
systemd timer will run the update task as specified by the interval option.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.update-dok.interval` {#opt-services.cloudlog.update-dok.interval}

Specification (in the format described by `systemd.time(7)`) of the
time at which the DOK update will occur.

*Type:* string

*Default:* `"monthly"`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.update-lotw-users.enable` {#opt-services.cloudlog.update-lotw-users.enable}

Whether to periodically update the list of LoTW users. If enabled, a
systemd timer will run the update task as specified by the interval
option.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.update-lotw-users.interval` {#opt-services.cloudlog.update-lotw-users.interval}

Specification (in the format described by `systemd.time(7)`) of the
time at which the LoTW user update will occur.

*Type:* string

*Default:* `"weekly"`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.update-sota.enable` {#opt-services.cloudlog.update-sota.enable}

Whether to periodically update the SOTA database. If enabled, a
systemd timer will run the update task as specified by the interval option.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.update-sota.interval` {#opt-services.cloudlog.update-sota.interval}

Specification (in the format described by `systemd.time(7)`) of the time
at which the SOTA update will occur.

*Type:* string

*Default:* `"monthly"`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.update-wwff.enable` {#opt-services.cloudlog.update-wwff.enable}

Whether to periodically update the WWFF database. If enabled, a
systemd timer will run the update task as specified by the interval
option.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.update-wwff.interval` {#opt-services.cloudlog.update-wwff.interval}

Specification (in the format described by `systemd.time(7)`) of the time
at which the WWFF update will occur.

*Type:* string

*Default:* `"monthly"`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.upload-clublog.enable` {#opt-services.cloudlog.upload-clublog.enable}

Whether to periodically upload logs to Clublog. If enabled, a systemd
timer will run the log upload task as specified by the interval option.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.upload-clublog.interval` {#opt-services.cloudlog.upload-clublog.interval}

Specification (in the format described by `systemd.time(7)`) of the time
at which the Clublog upload will occur.

*Type:* string

*Default:* `"daily"`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.upload-lotw.enable` {#opt-services.cloudlog.upload-lotw.enable}

Whether to periodically upload logs to LoTW. If enabled, a systemd
timer will run the log upload task as specified by the interval
option.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.upload-lotw.interval` {#opt-services.cloudlog.upload-lotw.interval}

Specification (in the format described by `systemd.time(7)`) of the
time at which the LoTW upload will occur.

*Type:* string

*Default:* `"daily"`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.upload-qrz.enable` {#opt-services.cloudlog.upload-qrz.enable}

Whether to periodically upload logs to QRZ. If enabled, a systemd
timer will run the update task as specified by the interval option.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.upload-qrz.interval` {#opt-services.cloudlog.upload-qrz.interval}

Specification (in the format described by `systemd.time(7)`) of the
time at which the QRZ upload will occur.

*Type:* string

*Default:* `"daily"`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.user` {#opt-services.cloudlog.user}

User account under which Cloudlog runs.

*Type:* string

*Default:* `"cloudlog"`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cloudlog.virtualHost` {#opt-services.cloudlog.virtualHost}

Name of the nginx virtualhost to use and setup. If null, do not setup
any virtualhost.

*Type:* null or string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/cloudlog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cloudlog.nix)

## `services.cntlm.configText` {#opt-services.cntlm.configText}

Verbatim contents of `cntlm.conf`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/cntlm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cntlm.nix)

## `services.cntlm.domain` {#opt-services.cntlm.domain}

Proxy account domain/workgroup name.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/cntlm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cntlm.nix)

## `services.cntlm.enable` {#opt-services.cntlm.enable}

Whether to enable cntlm, which starts a local proxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/cntlm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cntlm.nix)

## `services.cntlm.extraConfig` {#opt-services.cntlm.extraConfig}

Additional config appended to the end of the generated `cntlm.conf`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/cntlm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cntlm.nix)

## `services.cntlm.netbios_hostname` {#opt-services.cntlm.netbios_hostname}

The hostname of your machine.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/cntlm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cntlm.nix)

## `services.cntlm.noproxy` {#opt-services.cntlm.noproxy}

A list of domains where the proxy is skipped.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "*.example.com"
  "example.com"
]
```

*Declared by:* [`nixos/modules/services/networking/cntlm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cntlm.nix)

## `services.cntlm.password` {#opt-services.cntlm.password}

Proxy account password. Note: use chmod 0600 on /etc/cntlm.password for security.

*Type:* string

*Default:* `"/etc/cntlm.password"`

*Declared by:* [`nixos/modules/services/networking/cntlm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cntlm.nix)

## `services.cntlm.port` {#opt-services.cntlm.port}

Specifies on which ports the cntlm daemon listens.

*Type:* list of 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
[
  3128
]
```

*Declared by:* [`nixos/modules/services/networking/cntlm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cntlm.nix)

## `services.cntlm.proxy` {#opt-services.cntlm.proxy}

A list of NTLM/NTLMv2 authenticating HTTP proxies.

Parent proxy, which requires authentication. The same as proxy on the command-line, can be used more than  once  to  specify  unlimited
number  of  proxies.  Should  one proxy fail, cntlm automatically moves on to the next one. The connect request fails only if the whole
list of proxies is scanned and (for each request) and found to be invalid. Command-line takes precedence over the configuration file.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "proxy.example.com:81"
]
```

*Declared by:* [`nixos/modules/services/networking/cntlm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cntlm.nix)

## `services.cntlm.username` {#opt-services.cntlm.username}

Proxy account name, without the possibility to include domain name ('at' sign is interpreted literally).

*Type:* string

*Declared by:* [`nixos/modules/services/networking/cntlm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/cntlm.nix)

## `services.cockpit.allowed-origins` {#opt-services.cockpit.allowed-origins}

List of allowed origins.

Maps to the WebService.Origins setting and allows merging from multiple modules.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/cockpit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/cockpit.nix)

## `services.cockpit.enable` {#opt-services.cockpit.enable}

Whether to enable Cockpit.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/cockpit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/cockpit.nix)

## `services.cockpit.openFirewall` {#opt-services.cockpit.openFirewall}

Open port for cockpit.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/cockpit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/cockpit.nix)

## `services.cockpit.package` {#opt-services.cockpit.package}

The Cockpit package to use.

*Type:* package

*Default:* `pkgs.cockpit`

*Declared by:* [`nixos/modules/services/monitoring/cockpit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/cockpit.nix)

## `services.cockpit.plugins` {#opt-services.cockpit.plugins}

List of cockpit plugins.

This add the passthru.cockpitPath of the packages to the systemd cockpit service.

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
[
  pkgs.cockpit-zfs
]
```

*Declared by:* [`nixos/modules/services/monitoring/cockpit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/cockpit.nix)

## `services.cockpit.port` {#opt-services.cockpit.port}

Port where cockpit will listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9090`

*Declared by:* [`nixos/modules/services/monitoring/cockpit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/cockpit.nix)

## `services.cockpit.settings` {#opt-services.cockpit.settings}

Settings for cockpit that will be saved in /etc/cockpit/cockpit.conf.

See the [documentation](https://cockpit-project.org/guide/latest/cockpit.conf.5.html), that is also available with `man cockpit.conf.5` for details.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/cockpit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/cockpit.nix)

## `services.cockpit.showBanner` {#opt-services.cockpit.showBanner}

Whether to add the Cockpit banner to the issue and motd files.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/monitoring/cockpit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/cockpit.nix)

## `services.cockroachdb.cache` {#opt-services.cockroachdb.cache}

The total size for caches.

This can be a percentage, expressed with a fraction sign or as a
decimal-point number, or any bytes-based unit. For example,
`"25%"`, `"0.25"` both represent
25% of the available system memory. The values
`"1000000000"` and `"1GB"` both
represent 1 gigabyte of memory.

*Type:* string

*Default:* `"25%"`

*Declared by:* [`nixos/modules/services/databases/cockroachdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cockroachdb.nix)

## `services.cockroachdb.certsDir` {#opt-services.cockroachdb.certsDir}

The path to the certificate directory.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/cockroachdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cockroachdb.nix)

## `services.cockroachdb.enable` {#opt-services.cockroachdb.enable}

Whether to enable CockroachDB Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/cockroachdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cockroachdb.nix)

## `services.cockroachdb.extraArgs` {#opt-services.cockroachdb.extraArgs}

Extra CLI arguments passed to `cockroach start`.
For the full list of supported arguments, check [https://www.cockroachlabs.com/docs/stable/cockroach-start.html#flags](https://www.cockroachlabs.com/docs/stable/cockroach-start.html#flags)

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--advertise-addr"
  "[fe80::f6f2:::]"
]
```

*Declared by:* [`nixos/modules/services/databases/cockroachdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cockroachdb.nix)

## `services.cockroachdb.group` {#opt-services.cockroachdb.group}

User account under which CockroachDB runs

*Type:* string

*Default:* `"cockroachdb"`

*Declared by:* [`nixos/modules/services/databases/cockroachdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cockroachdb.nix)

## `services.cockroachdb.http.address` {#opt-services.cockroachdb.http.address}

Address to bind to for http-based Admin UI

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/databases/cockroachdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cockroachdb.nix)

## `services.cockroachdb.http.port` {#opt-services.cockroachdb.http.port}

Port to bind to for http-based Admin UI

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/databases/cockroachdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cockroachdb.nix)

## `services.cockroachdb.insecure` {#opt-services.cockroachdb.insecure}

Run in insecure mode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/cockroachdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cockroachdb.nix)

## `services.cockroachdb.join` {#opt-services.cockroachdb.join}

The addresses for connecting the node to a cluster.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/cockroachdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cockroachdb.nix)

## `services.cockroachdb.listen.address` {#opt-services.cockroachdb.listen.address}

Address to bind to for intra-cluster communication

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/databases/cockroachdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cockroachdb.nix)

## `services.cockroachdb.listen.port` {#opt-services.cockroachdb.listen.port}

Port to bind to for intra-cluster communication

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `26257`

*Declared by:* [`nixos/modules/services/databases/cockroachdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cockroachdb.nix)

## `services.cockroachdb.locality` {#opt-services.cockroachdb.locality}

An ordered, comma-separated list of key-value pairs that describe the
topography of the machine. Topography might include country,
datacenter or rack designations. Data is automatically replicated to
maximize diversities of each tier. The order of tiers is used to
determine the priority of the diversity, so the more inclusive
localities like country should come before less inclusive localities
like datacenter.  The tiers and order must be the same on all nodes.
Including more tiers is better than including fewer. For example:

```
    country=us,region=us-west,datacenter=us-west-1b,rack=12
    country=ca,region=ca-east,datacenter=ca-east-2,rack=4

    planet=earth,province=manitoba,colo=secondary,power=3
```

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/cockroachdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cockroachdb.nix)

## `services.cockroachdb.maxSqlMemory` {#opt-services.cockroachdb.maxSqlMemory}

The maximum in-memory storage capacity available to store temporary
data for SQL queries.

This can be a percentage, expressed with a fraction sign or as a
decimal-point number, or any bytes-based unit. For example,
`"25%"`, `"0.25"` both represent
25% of the available system memory. The values
`"1000000000"` and `"1GB"` both
represent 1 gigabyte of memory.

*Type:* string

*Default:* `"25%"`

*Declared by:* [`nixos/modules/services/databases/cockroachdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cockroachdb.nix)

## `services.cockroachdb.openPorts` {#opt-services.cockroachdb.openPorts}

Open firewall ports for cluster communication by default

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/cockroachdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cockroachdb.nix)

## `services.cockroachdb.package` {#opt-services.cockroachdb.package}

The cockroachdb package to use. This would primarily be useful to enable Enterprise Edition features
in your own custom CockroachDB build (Nixpkgs CockroachDB binaries
only contain open source features and open source code).

*Type:* package

*Default:* `pkgs.cockroachdb`

*Declared by:* [`nixos/modules/services/databases/cockroachdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cockroachdb.nix)

## `services.cockroachdb.user` {#opt-services.cockroachdb.user}

User account under which CockroachDB runs

*Type:* string

*Default:* `"cockroachdb"`

*Declared by:* [`nixos/modules/services/databases/cockroachdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/cockroachdb.nix)

## `services.cocoon.enable` {#opt-services.cocoon.enable}

Whether to enable cocoon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/cocoon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cocoon.nix)

## `services.cocoon.environmentFiles` {#opt-services.cocoon.environmentFiles}

File to load environment variables from. Loaded variables override
values set in `environment`.

Use it to set values of `COCOON_ADMIN_PASSWORD` and `COCOON_SESSION_SECRE`.

Generate `COCOON_ADMIN_PASSWORD` with

```
openssl rand -hex 16
```

Generate `COCOON_SESSION_SECRET` with

```
openssl rand -hex 32
```

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/cocoon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cocoon.nix)

## `services.cocoon.package` {#opt-services.cocoon.package}

The cocoon package to use.

*Type:* package

*Default:* `pkgs.cocoon`

*Declared by:* [`nixos/modules/services/web-apps/cocoon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cocoon.nix)

## `services.cocoon.settings` {#opt-services.cocoon.settings}

Environment variables to set for the service. Secrets should be
specified using `environmentFile`.

Refer to [https://github.com/haileyok/cocoon/blob/main/.env.example](https://github.com/haileyok/cocoon/blob/main/.env.example)
and [https://github.com/haileyok/cocoon/blob/main/README.md](https://github.com/haileyok/cocoon/blob/main/README.md) for
available environment variables.

*Type:* open submodule of attribute set of (null or string or absolute path)

*Declared by:* [`nixos/modules/services/web-apps/cocoon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cocoon.nix)

## `services.cocoon.settings.COCOON_ADDR` {#opt-services.cocoon.settings.COCOON_ADDR}

Address to bind the Cocoon instance to

*Type:* string

*Default:* `":8080"`

*Example:* `":3000"`

*Declared by:* [`nixos/modules/services/web-apps/cocoon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cocoon.nix)

## `services.cocoon.settings.COCOON_CONTACT_EMAIL` {#opt-services.cocoon.settings.COCOON_CONTACT_EMAIL}

Contact email for the Cocoon instance

*Type:* string

*Example:* `"me@example.com"`

*Declared by:* [`nixos/modules/services/web-apps/cocoon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cocoon.nix)

## `services.cocoon.settings.COCOON_DATABASE_URL` {#opt-services.cocoon.settings.COCOON_DATABASE_URL}

Database connection URL

*Type:* null or string

*Default:* `null`

*Example:* `"postgres://cocoon:password@localhost:5432/cocoon?sslmode=disable"`

*Declared by:* [`nixos/modules/services/web-apps/cocoon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cocoon.nix)

## `services.cocoon.settings.COCOON_DB_NAME` {#opt-services.cocoon.settings.COCOON_DB_NAME}

Name of the SQLite database file (if using sqlite)

*Type:* string

*Default:* `"/var/lib/cocoon/cocoon.db"`

*Declared by:* [`nixos/modules/services/web-apps/cocoon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cocoon.nix)

## `services.cocoon.settings.COCOON_DB_TYPE` {#opt-services.cocoon.settings.COCOON_DB_TYPE}

Type of database to use (sqlite or postgres)

*Type:* string

*Default:* `"sqlite"`

*Declared by:* [`nixos/modules/services/web-apps/cocoon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cocoon.nix)

## `services.cocoon.settings.COCOON_DID` {#opt-services.cocoon.settings.COCOON_DID}

DID web address for the Cocoon instance

*Type:* null or string

*Default:* `null`

*Example:* `"did:web:cocoon.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/cocoon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cocoon.nix)

## `services.cocoon.settings.COCOON_HOSTNAME` {#opt-services.cocoon.settings.COCOON_HOSTNAME}

Hostname for the Cocoon instance

*Type:* null or string

*Default:* `null`

*Example:* `"cocoon.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/cocoon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cocoon.nix)

## `services.cocoon.settings.COCOON_JWK_PATH` {#opt-services.cocoon.settings.COCOON_JWK_PATH}

Path to the JWK key file

Generate it with:

```
cocoon create-private-jwk --out /var/lib/cocoon/jwk.key
```

*Type:* absolute path or string

*Default:* `"/var/lib/cocoon/jwk.key"`

*Declared by:* [`nixos/modules/services/web-apps/cocoon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cocoon.nix)

## `services.cocoon.settings.COCOON_RELAYS` {#opt-services.cocoon.settings.COCOON_RELAYS}

Comma-separated list of Nostr relays to connect to

*Type:* string

*Default:* `"https://bsky.network"`

*Declared by:* [`nixos/modules/services/web-apps/cocoon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cocoon.nix)

## `services.cocoon.settings.COCOON_ROTATION_KEY_PATH` {#opt-services.cocoon.settings.COCOON_ROTATION_KEY_PATH}

Path to the rotation key file.

Generate it with:

```
cocoon create-rotation-key --out /var/lib/cocoon/rotation.key
```

*Type:* absolute path or string

*Default:* `"/var/lib/cocoon/rotation.key"`

*Declared by:* [`nixos/modules/services/web-apps/cocoon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cocoon.nix)

## `services.cocoon.settings.COCOON_SESSION_COOKIE_KEY` {#opt-services.cocoon.settings.COCOON_SESSION_COOKIE_KEY}

Name of the session cookie

*Type:* string

*Default:* `"session"`

*Declared by:* [`nixos/modules/services/web-apps/cocoon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cocoon.nix)

## `services.code-server.auth` {#opt-services.code-server.auth}

The type of authentication to use.

*Type:* one of "none", "password"

*Default:* `"password"`

*Declared by:* [`nixos/modules/services/web-apps/code-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/code-server.nix)

## `services.code-server.disableFileDownloads` {#opt-services.code-server.disableFileDownloads}

Disable file downloads from Code.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/code-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/code-server.nix)

## `services.code-server.disableGettingStartedOverride` {#opt-services.code-server.disableGettingStartedOverride}

Disable the coder/coder override in the Help: Getting Started page.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/code-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/code-server.nix)

## `services.code-server.disableTelemetry` {#opt-services.code-server.disableTelemetry}

Disable telemetry.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/code-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/code-server.nix)

## `services.code-server.disableUpdateCheck` {#opt-services.code-server.disableUpdateCheck}

Disable update check.
Without this flag, code-server checks every 6 hours against the latest github release and
then notifies you once every week that a new release is available.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/code-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/code-server.nix)

## `services.code-server.disableWorkspaceTrust` {#opt-services.code-server.disableWorkspaceTrust}

Disable Workspace Trust feature.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/code-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/code-server.nix)

## `services.code-server.enable` {#opt-services.code-server.enable}

Whether to enable code-server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/code-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/code-server.nix)

## `services.code-server.extensionsDir` {#opt-services.code-server.extensionsDir}

Path to the extensions directory.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/code-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/code-server.nix)

## `services.code-server.extraArguments` {#opt-services.code-server.extraArguments}

Additional arguments to pass to code-server.

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "--log=info" ]`

*Declared by:* [`nixos/modules/services/web-apps/code-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/code-server.nix)

## `services.code-server.extraEnvironment` {#opt-services.code-server.extraEnvironment}

Additional environment variables to pass to code-server.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  PKG_CONFIG_PATH = "/run/current-system/sw/lib/pkgconfig";
}
```

*Declared by:* [`nixos/modules/services/web-apps/code-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/code-server.nix)

## `services.code-server.extraGroups` {#opt-services.code-server.extraGroups}

An array of additional groups for the `code-server` user.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "docker"
]
```

*Declared by:* [`nixos/modules/services/web-apps/code-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/code-server.nix)

## `services.code-server.extraPackages` {#opt-services.code-server.extraPackages}

Additional packages to add to the code-server `PATH`.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.go ]`

*Declared by:* [`nixos/modules/services/web-apps/code-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/code-server.nix)

## `services.code-server.group` {#opt-services.code-server.group}

The group to run code-server under.
By default, a group named `code-server` will be created.

*Type:* string

*Default:* `"code-server"`

*Example:* `"yourGroup"`

*Declared by:* [`nixos/modules/services/web-apps/code-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/code-server.nix)

## `services.code-server.hashedPassword` {#opt-services.code-server.hashedPassword}

Create the password with: `echo -n 'thisismypassword' | nix run nixpkgs#libargon2 -- "$(head -c 20 /dev/random | base64)" -e`

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/code-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/code-server.nix)

## `services.code-server.host` {#opt-services.code-server.host}

The host name or IP address the server should listen to.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/code-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/code-server.nix)

## `services.code-server.package` {#opt-services.code-server.package}

The code-server package to use.

*Type:* package

*Default:* `pkgs.code-server`

*Example:*

``` nix
pkgs.vscode-with-extensions.override {
  vscode = pkgs.code-server;
  vscodeExtensions = with pkgs.vscode-extensions; [
    bbenoist.nix
    dracula-theme.theme-dracula
  ];
}
```

*Declared by:* [`nixos/modules/services/web-apps/code-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/code-server.nix)

## `services.code-server.port` {#opt-services.code-server.port}

The port the server should listen to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4444`

*Declared by:* [`nixos/modules/services/web-apps/code-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/code-server.nix)

## `services.code-server.proxyDomain` {#opt-services.code-server.proxyDomain}

Domain used for proxying ports.

*Type:* null or string

*Default:* `null`

*Example:* `"code-server.lan"`

*Declared by:* [`nixos/modules/services/web-apps/code-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/code-server.nix)

## `services.code-server.socket` {#opt-services.code-server.socket}

Path to a socket (bind-addr will be ignored).

*Type:* null or string

*Default:* `null`

*Example:* `"/run/code-server/socket"`

*Declared by:* [`nixos/modules/services/web-apps/code-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/code-server.nix)

## `services.code-server.socketMode` {#opt-services.code-server.socketMode}

File mode of the socket.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/code-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/code-server.nix)

## `services.code-server.user` {#opt-services.code-server.user}

The user to run code-server as.
By default, a user named `code-server` will be created.

*Type:* string

*Default:* `"code-server"`

*Example:* `"yourUser"`

*Declared by:* [`nixos/modules/services/web-apps/code-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/code-server.nix)

## `services.code-server.userDataDir` {#opt-services.code-server.userDataDir}

Path to the user data directory.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/code-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/code-server.nix)

## `services.coder.accessUrl` {#opt-services.coder.accessUrl}

Access URL should be a external IP address or domain with DNS records pointing to Coder.

*Type:* null or string

*Default:* `null`

*Example:* `"https://coder.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/coder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/coder.nix)

## `services.coder.database.createLocally` {#opt-services.coder.database.createLocally}

Create the database and database user locally.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/coder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/coder.nix)

## `services.coder.database.database` {#opt-services.coder.database.database}

Name of database.

*Type:* string

*Default:* `"coder"`

*Declared by:* [`nixos/modules/services/web-apps/coder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/coder.nix)

## `services.coder.database.host` {#opt-services.coder.database.host}

Hostname hosting the database.

*Type:* string

*Default:* `"/run/postgresql"`

*Declared by:* [`nixos/modules/services/web-apps/coder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/coder.nix)

## `services.coder.database.password` {#opt-services.coder.database.password}

Password for accessing the database.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/coder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/coder.nix)

## `services.coder.database.sslmode` {#opt-services.coder.database.sslmode}

Password for accessing the database.

*Type:* null or string

*Default:* `"disable"`

*Declared by:* [`nixos/modules/services/web-apps/coder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/coder.nix)

## `services.coder.database.username` {#opt-services.coder.database.username}

Username for accessing the database.

*Type:* string

*Default:* `"coder"`

*Declared by:* [`nixos/modules/services/web-apps/coder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/coder.nix)

## `services.coder.enable` {#opt-services.coder.enable}

Whether to enable Coder service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/coder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/coder.nix)

## `services.coder.environment.extra` {#opt-services.coder.environment.extra}

Extra environment variables to pass run Coder's server with.
See [Coder configuration reference](https://coder.com/docs/@main/admin/setup/configuration-reference).

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  CODER_OAUTH2_GITHUB_ALLOWED_ORGS = "your-org";
  CODER_OAUTH2_GITHUB_ALLOW_SIGNUPS = true;
}
```

*Declared by:* [`nixos/modules/services/web-apps/coder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/coder.nix)

## `services.coder.environment.file` {#opt-services.coder.environment.file}

Systemd environment file to add to Coder.
See [Coder configuration reference](https://coder.com/docs/@main/admin/setup/configuration-reference).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/coder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/coder.nix)

## `services.coder.group` {#opt-services.coder.group}

Group under which the coder service runs.

::: note
If left as the default value this group will automatically be created
on system activation, otherwise it needs to be configured manually.
:::

*Type:* string

*Default:* `"coder"`

*Declared by:* [`nixos/modules/services/web-apps/coder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/coder.nix)

## `services.coder.homeDir` {#opt-services.coder.homeDir}

Home directory for coder user.

*Type:* string

*Default:* `"/var/lib/coder"`

*Declared by:* [`nixos/modules/services/web-apps/coder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/coder.nix)

## `services.coder.listenAddress` {#opt-services.coder.listenAddress}

Listen address.

*Type:* string

*Default:* `"127.0.0.1:3000"`

*Declared by:* [`nixos/modules/services/web-apps/coder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/coder.nix)

## `services.coder.package` {#opt-services.coder.package}

The coder package to use.

*Type:* package

*Default:* `pkgs.coder`

*Declared by:* [`nixos/modules/services/web-apps/coder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/coder.nix)

## `services.coder.tlsCert` {#opt-services.coder.tlsCert}

The path to the TLS certificate.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/coder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/coder.nix)

## `services.coder.tlsKey` {#opt-services.coder.tlsKey}

The path to the TLS key.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/coder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/coder.nix)

## `services.coder.user` {#opt-services.coder.user}

User under which the coder service runs.

::: note
If left as the default value this user will automatically be created
on system activation, otherwise it needs to be configured manually.
:::

*Type:* string

*Default:* `"coder"`

*Declared by:* [`nixos/modules/services/web-apps/coder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/coder.nix)

## `services.coder.wildcardAccessUrl` {#opt-services.coder.wildcardAccessUrl}

If you are providing TLS certificates directly to the Coder server, you must use a single certificate for the root and wildcard domains.

*Type:* null or string

*Default:* `null`

*Example:* `"*.coder.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/coder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/coder.nix)

## `services.collabora-online.aliasGroups` {#opt-services.collabora-online.aliasGroups}

Alias groups to use.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/collabora-online.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/collabora-online.nix)

## `services.collabora-online.aliasGroups.*.aliases` {#opt-services.collabora-online.aliasGroups._.aliases}

A list of regex pattern of aliasname.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "scheme://aliasname1:port"
  "scheme://aliasname2:port"
]
```

*Declared by:* [`nixos/modules/services/web-apps/collabora-online.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/collabora-online.nix)

## `services.collabora-online.aliasGroups.*.host` {#opt-services.collabora-online.aliasGroups._.host}

Hostname to allow or deny.

*Type:* string

*Example:* `"scheme://hostname:port"`

*Declared by:* [`nixos/modules/services/web-apps/collabora-online.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/collabora-online.nix)

## `services.collabora-online.enable` {#opt-services.collabora-online.enable}

Whether to enable collabora-online.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/collabora-online.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/collabora-online.nix)

## `services.collabora-online.extraArgs` {#opt-services.collabora-online.extraArgs}

Extra arguments to pass to the service.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/collabora-online.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/collabora-online.nix)

## `services.collabora-online.package` {#opt-services.collabora-online.package}

The Collabora Online package to use.

*Type:* package

*Default:* `pkgs.collabora-online`

*Declared by:* [`nixos/modules/services/web-apps/collabora-online.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/collabora-online.nix)

## `services.collabora-online.port` {#opt-services.collabora-online.port}

Listening port

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9980`

*Declared by:* [`nixos/modules/services/web-apps/collabora-online.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/collabora-online.nix)

## `services.collabora-online.settings` {#opt-services.collabora-online.settings}

Configuration for Collabora Online WebSocket Daemon, see
[https://sdk.collaboraonline.com/docs/installation/Configuration.html](https://sdk.collaboraonline.com/docs/installation/Configuration.html), or
[https://github.com/CollaboraOnline/online/blob/master/coolwsd.xml.in](https://github.com/CollaboraOnline/online/blob/master/coolwsd.xml.in) for the default
configuration.

*Type:* `coolwsd.xml` configuration type, used to override values in the default configuration.

Attribute names correspond to XML tags unless prefixed with `@`. Nested attribute sets
correspond to nested XML tags. Attribute prefixed with `@` correspond to XML attributes. E.g.,
`{ storage.wopi."@allow" = true; }` in Nix corresponds to
`<storage><wopi allow="true"/></storage>` in `coolwsd.xml`, or `--o:storage.wopi[@allow]=true`
in the command line.

Arrays correspond to multiple elements with the same tag name. E.g.
`{ host = [ ''127\.0\.0\.1'' "::1" ]; }` in Nix corresponds to

``` xml
<net><post_allow>
  <host>127\.0\.0\.1</host>
  <host>::1</host>
</post_allow></net>
```

in `coolwsd.xml`, or
`--o:net.post_allow.host[0]='127\.0\.0\.1 --o:net.post_allow.host[1]=::1` in the command line.

Null values could be used to remove an element from the default configuration.

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/collabora-online.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/collabora-online.nix)

## `services.collectd.autoLoadPlugin` {#opt-services.collectd.autoLoadPlugin}

Enable plugin autoloading.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/collectd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/collectd.nix)

## `services.collectd.buildMinimalPackage` {#opt-services.collectd.buildMinimalPackage}

Build a minimal collectd package with only the configured `services.collectd.plugins`

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/collectd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/collectd.nix)

## `services.collectd.dataDir` {#opt-services.collectd.dataDir}

Data directory for collectd agent.

*Type:* absolute path

*Default:* `"/var/lib/collectd"`

*Declared by:* [`nixos/modules/services/monitoring/collectd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/collectd.nix)

## `services.collectd.enable` {#opt-services.collectd.enable}

Whether to enable collectd agent.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/collectd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/collectd.nix)

## `services.collectd.extraConfig` {#opt-services.collectd.extraConfig}

Extra configuration for collectd. Use mkBefore to add lines before the
default config, and mkAfter to add them below.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/collectd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/collectd.nix)

## `services.collectd.finalPackage` {#opt-services.collectd.finalPackage}

The final package being used after applying plugins and minimalPackage.

*Type:* unspecified value

*Default:*

``` nix
if config.services.collectd.buildMinimalPackage then
  cfg.package.override {
    enabledPlugins = [ "syslog" ] ++ builtins.attrNames cfg.plugins;
  }
else
  cfg.package
```

*Read only*

*Declared by:* [`nixos/modules/services/monitoring/collectd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/collectd.nix)

## `services.collectd.include` {#opt-services.collectd.include}

Additional paths to load config from.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/collectd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/collectd.nix)

## `services.collectd.package` {#opt-services.collectd.package}

The collectd package to use.

*Type:* package

*Default:* `pkgs.collectd`

*Declared by:* [`nixos/modules/services/monitoring/collectd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/collectd.nix)

## `services.collectd.plugins` {#opt-services.collectd.plugins}

Attribute set of plugin names to plugin config segments

*Type:* attribute set of strings concatenated with "\\n"

*Default:* `{ }`

*Example:*

``` nix
{
  cpu = "";
  memory = "";
  network = "Server 192.168.1.1 25826";
}
```

*Declared by:* [`nixos/modules/services/monitoring/collectd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/collectd.nix)

## `services.collectd.user` {#opt-services.collectd.user}

User under which to run collectd.

*Type:* null or string

*Default:* `"collectd"`

*Declared by:* [`nixos/modules/services/monitoring/collectd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/collectd.nix)

## `services.collectd.validateConfig` {#opt-services.collectd.validateConfig}

Validate the syntax of collectd configuration file at build time.
Disable this if you use the Include directive on files unavailable in
the build sandbox, or when cross-compiling.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/collectd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/collectd.nix)

## `services.colord.enable` {#opt-services.colord.enable}

Whether to enable colord, the color management daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/colord.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/colord.nix)

## `services.comfyui.dataDir` {#opt-services.comfyui.dataDir}

Directory holding ComfyUI's state: models, custom nodes, inputs, outputs and the database.

Defaults to the unit's `StateDirectory`.
Any other directory is created with systemd-tmpfiles and bind-mounted into the service.

Existing state is not migrated, you need to move it yourself.

*Type:* absolute path

*Default:* `"/var/lib/comfyui"`

*Example:* `"/srv/comfyui"`

*Declared by:* [`nixos/modules/services/misc/comfyui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/comfyui.nix)

## `services.comfyui.enable` {#opt-services.comfyui.enable}

Whether to enable ComfyUI.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/comfyui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/comfyui.nix)

## `services.comfyui.extraArgs` {#opt-services.comfyui.extraArgs}

Extra arguments to pass to the server. See `comfyui --help` for available args.

Flags set by the module are prepended with `lib.mkBefore`, so any user supplied flag wins over that.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--enable-assets"
  "--preview-method=auto"
]
```

*Declared by:* [`nixos/modules/services/misc/comfyui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/comfyui.nix)

## `services.comfyui.extraPackages` {#opt-services.comfyui.extraPackages}

List of packages to add to ComfyUI's Python environment.

A popular example is `python3Packages.comfyui-manager` for installing and
managing custom nodes from within ComfyUI.

*Type:* function that evaluates to a(n) list of package

*Default:* `ps: with ps; [ ]`

*Example:*

``` nix
ps: with ps; [ comfyui-manager ]
```

*Declared by:* [`nixos/modules/services/misc/comfyui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/comfyui.nix)

## `services.comfyui.listen` {#opt-services.comfyui.listen}

The host addresses on which ComfyUI should listen.

*Type:* list of string

*Default:*

``` nix
[
  "127.0.0.1"
  "::1"
]
```

*Example:*

``` nix
[
  "0.0.0.0"
  "::"
]
```

*Declared by:* [`nixos/modules/services/misc/comfyui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/comfyui.nix)

## `services.comfyui.models` {#opt-services.comfyui.models}

ComfyUI models to fetch and symlink into `${services.comfyui.dataDir}/models/<installPath>/<name>`.
Files placed manually in the `models` directory are left untouched.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[ {
  name = "RealESRGAN_x4plus_anime_6B.pth";
  url = "https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.2.4/RealESRGAN_x4plus_anime_6B.pth";
  hash = "sha256-+HLYN9PJDtLgUie+1xGvVnGm/RyffX6RyRGmHxVemdo=";
  installPaths = "upscale_models";
} ]
```

*Declared by:* [`nixos/modules/services/misc/comfyui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/comfyui.nix)

## `services.comfyui.models.*.hash` {#opt-services.comfyui.models._.hash}

The SRI hash of the model file. Generate it with `nix-prefetch-url <url>`,
or set this to `lib.fakeHash`, build once and copy the hash from the error message.

*Type:* string

*Example:* `"sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="`

*Declared by:* [`nixos/modules/services/misc/comfyui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/comfyui.nix)

## `services.comfyui.models.*.installPaths` {#opt-services.comfyui.models._.installPaths}

String or list of target subdirectory names below `models/`, such as `upscale_models`, `loras`, `checkpoints`.
Write bare directory names (the module assembles them into `models/<installPath>`,
one symlink per install path); a single string is also accepted and upgraded to a one-element list.

*Type:* (non-empty (list of string matching the pattern \[A-Za-z0-9\_-\]+)) or string matching the pattern \[A-Za-z0-9\_-\]+ convertible to it

*Example:*

``` nix
[
  "upscale_models"
]
```

*Declared by:* [`nixos/modules/services/misc/comfyui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/comfyui.nix)

## `services.comfyui.models.*.name` {#opt-services.comfyui.models._.name}

The model file name, used as the link name in `models/<installPath>/<name>`.
It must be unique within the same `<installPath>`, to avoid conflicts.

*Type:* string

*Declared by:* [`nixos/modules/services/misc/comfyui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/comfyui.nix)

## `services.comfyui.models.*.url` {#opt-services.comfyui.models._.url}

The download URL of the model file.
Pinned-resolve URLs (e.g. HuggingFace's `/resolve/<commit>/<file>`) are recommended to have a stable hash.

*Type:* string

*Declared by:* [`nixos/modules/services/misc/comfyui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/comfyui.nix)

## `services.comfyui.package` {#opt-services.comfyui.package}

The comfyui package to use.

*Type:* package

*Default:* `pkgs.comfyui`

*Declared by:* [`nixos/modules/services/misc/comfyui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/comfyui.nix)

## `services.comfyui.port` {#opt-services.comfyui.port}

The port on that ComfyUI will listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8188`

*Example:* `1234`

*Declared by:* [`nixos/modules/services/misc/comfyui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/comfyui.nix)

## `services.commafeed.enable` {#opt-services.commafeed.enable}

Whether to enable CommaFeed.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/commafeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/commafeed.nix)

## `services.commafeed.environment` {#opt-services.commafeed.environment}

Extra environment variables passed to CommaFeed, refer to
[https://github.com/Athou/commafeed/blob/master/commafeed-server/config.yml.example](https://github.com/Athou/commafeed/blob/master/commafeed-server/config.yml.example)
for supported values. The default user is `admin` and the default password is `admin`.
Correct configuration for H2 database is already provided.

*Type:* attribute set of (boolean or signed integer or string)

*Default:* `{ }`

*Example:*

``` nix
{
  CF_SERVER_APPLICATIONCONNECTORS_0_PORT = 9090;
  CF_SERVER_APPLICATIONCONNECTORS_0_TYPE = "http";
}
```

*Declared by:* [`nixos/modules/services/web-apps/commafeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/commafeed.nix)

## `services.commafeed.environmentFile` {#opt-services.commafeed.environmentFile}

Environment file as defined in `systemd.exec(5)`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/commafeed/commafeed.env"`

*Declared by:* [`nixos/modules/services/web-apps/commafeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/commafeed.nix)

## `services.commafeed.group` {#opt-services.commafeed.group}

Group under which CommaFeed runs.

*Type:* string

*Default:* `"commafeed"`

*Declared by:* [`nixos/modules/services/web-apps/commafeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/commafeed.nix)

## `services.commafeed.package` {#opt-services.commafeed.package}

The commafeed package to use.

*Type:* package

*Default:* `pkgs.commafeed`

*Declared by:* [`nixos/modules/services/web-apps/commafeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/commafeed.nix)

## `services.commafeed.stateDir` {#opt-services.commafeed.stateDir}

Directory holding all state for CommaFeed to run.

*Type:* absolute path

*Default:* `"/var/lib/commafeed"`

*Declared by:* [`nixos/modules/services/web-apps/commafeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/commafeed.nix)

## `services.commafeed.user` {#opt-services.commafeed.user}

User under which CommaFeed runs.

*Type:* string

*Default:* `"commafeed"`

*Declared by:* [`nixos/modules/services/web-apps/commafeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/commafeed.nix)

## `services.compton` {#opt-services.compton}

Alias of `services.picom`.

*Type:* submodule

*Declared by:* [`nixos/modules/services/x11/picom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/picom.nix)

## `services.confd.backend` {#opt-services.confd.backend}

Confd config storage backend to use.

*Type:* one of "etcd", "consul", "redis", "zookeeper"

*Default:* `"etcd"`

*Declared by:* [`nixos/modules/services/misc/confd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/confd.nix)

## `services.confd.confDir` {#opt-services.confd.confDir}

The path to the confd configs.

*Type:* absolute path

*Default:* `"/etc/confd"`

*Declared by:* [`nixos/modules/services/misc/confd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/confd.nix)

## `services.confd.enable` {#opt-services.confd.enable}

Whether to enable confd, a service to manage local application configuration files using templates and data from etcd/consul/redis/zookeeper.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/confd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/confd.nix)

## `services.confd.interval` {#opt-services.confd.interval}

Confd check interval.

*Type:* signed integer

*Default:* `10`

*Declared by:* [`nixos/modules/services/misc/confd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/confd.nix)

## `services.confd.logLevel` {#opt-services.confd.logLevel}

Confd log level.

*Type:* one of "info", "debug"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/misc/confd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/confd.nix)

## `services.confd.nodes` {#opt-services.confd.nodes}

Confd list of nodes to connect to.

*Type:* list of string

*Default:*

``` nix
[
  "http://127.0.0.1:2379"
]
```

*Declared by:* [`nixos/modules/services/misc/confd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/confd.nix)

## `services.confd.package` {#opt-services.confd.package}

The confd package to use.

*Type:* package

*Default:* `pkgs.confd`

*Declared by:* [`nixos/modules/services/misc/confd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/confd.nix)

## `services.confd.prefix` {#opt-services.confd.prefix}

The string to prefix to keys.

*Type:* absolute path

*Default:* `"/"`

*Declared by:* [`nixos/modules/services/misc/confd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/confd.nix)

## `services.confd.watch` {#opt-services.confd.watch}

Confd, whether to watch etcd config for changes.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/confd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/confd.nix)

## `services.conman.config` {#opt-services.conman.config}

The configuration object.

Either `configFile` or `config` must be specified.

See [https://github.com/dun/conman/wiki/Man-5-conman.conf#files](https://github.com/dun/conman/wiki/Man-5-conman.conf#files).

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Example:*

``` nix
''
  server coredump=off
  server keepalive=on
  server loopback=off
  server timestamp=1h
  
  # global config
  global log="/var/log/conman/%N.log"
  global seropts="9600,8n1"
  global ipmiopts="U:<user>,P:<password>"
''
```

*Declared by:* [`nixos/modules/services/misc/conman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/conman.nix)

## `services.conman.configFile` {#opt-services.conman.configFile}

The absolute path to the configuration file.

Either `configFile` or `config` must be specified.

See [https://github.com/dun/conman/wiki/Man-5-conman.conf#files](https://github.com/dun/conman/wiki/Man-5-conman.conf#files).

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/conman.conf"`

*Declared by:* [`nixos/modules/services/misc/conman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/conman.nix)

## `services.conman.enable` {#opt-services.conman.enable}

Whether to enable Enable the conman Console manager.

Either `configFile` or `config` must be specified.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/conman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/conman.nix)

## `services.conman.package` {#opt-services.conman.package}

The conman package to use.

*Type:* package

*Default:* `pkgs.conman`

*Declared by:* [`nixos/modules/services/misc/conman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/conman.nix)

## `services.connman.enable` {#opt-services.connman.enable}

Whether to use ConnMan for managing your network connections.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/connman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/connman.nix)

## `services.connman.enableVPN` {#opt-services.connman.enableVPN}

Whether to enable ConnMan VPN service.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/connman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/connman.nix)

## `services.connman.extraConfig` {#opt-services.connman.extraConfig}

Configuration lines appended to the generated connman configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/connman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/connman.nix)

## `services.connman.extraFlags` {#opt-services.connman.extraFlags}

Extra flags to pass to connmand

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--nodnsproxy"
]
```

*Declared by:* [`nixos/modules/services/networking/connman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/connman.nix)

## `services.connman.networkInterfaceBlacklist` {#opt-services.connman.networkInterfaceBlacklist}

Default blacklisted interfaces, this includes NixOS containers interfaces (ve).

*Type:* list of string

*Default:*

``` nix
[
  "vmnet"
  "vboxnet"
  "virbr"
  "ifb"
  "ve"
]
```

*Declared by:* [`nixos/modules/services/networking/connman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/connman.nix)

## `services.connman.package` {#opt-services.connman.package}

The connman package / build flavor

*Type:* package

*Default:* `pkgs.connman`

*Example:* `pkgs.connmanFull`

*Declared by:* [`nixos/modules/services/networking/connman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/connman.nix)

## `services.connman.wifi.backend` {#opt-services.connman.wifi.backend}

Specify the Wi-Fi backend used.
Currently supported are `wpa_supplicant` or `iwd`.

*Type:* one of "wpa\_supplicant", "iwd"

*Default:* `"wpa_supplicant"`

*Declared by:* [`nixos/modules/services/networking/connman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/connman.nix)

## `services.consul-template.instances` {#opt-services.consul-template.instances}

Attribute set of consul-template instances.
Creates independent `consul-template-${name}.service` systemd units for each instance defined here.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/vault-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault-agent.nix)

## `services.consul-template.instances.<name>.enable` {#opt-services.consul-template.instances._name_.enable}

Whether to enable this consul-template instance.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/vault-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault-agent.nix)

## `services.consul-template.instances.<name>.group` {#opt-services.consul-template.instances._name_.group}

Group under which this instance runs.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/security/vault-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault-agent.nix)

## `services.consul-template.instances.<name>.package` {#opt-services.consul-template.instances._name_.package}

The consul-template package to use.

*Type:* package

*Default:* `pkgs.consul-template`

*Declared by:* [`nixos/modules/services/security/vault-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault-agent.nix)

## `services.consul-template.instances.<name>.settings` {#opt-services.consul-template.instances._name_.settings}

Free-form settings written directly to the `config.json` file.
Refer to [https://github.com/hashicorp/consul-template/blob/main/docs/configuration.md#configuration-file](https://github.com/hashicorp/consul-template/blob/main/docs/configuration.md#configuration-file) for supported values.

::: note
Resulting format is JSON not HCL.
Refer to [https://www.hcl2json.com/](https://www.hcl2json.com/) if you are unsure how to convert HCL options to JSON.
:::

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/vault-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault-agent.nix)

## `services.consul-template.instances.<name>.settings.pid_file` {#opt-services.consul-template.instances._name_.settings.pid_file}

Path to use for the pid file.

*Type:* string

*Default:* `"/run/consul-template/‹name›.pid"`

*Declared by:* [`nixos/modules/services/security/vault-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault-agent.nix)

## `services.consul-template.instances.<name>.user` {#opt-services.consul-template.instances._name_.user}

User under which this instance runs.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/security/vault-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault-agent.nix)

## `services.consul.alerts.consulAddr` {#opt-services.consul.alerts.consulAddr}

Consul api listening address

*Type:* string

*Default:* `"localhost:8500"`

*Declared by:* [`nixos/modules/services/networking/consul.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/consul.nix)

## `services.consul.alerts.enable` {#opt-services.consul.alerts.enable}

Whether to enable consul-alerts.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/consul.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/consul.nix)

## `services.consul.alerts.listenAddr` {#opt-services.consul.alerts.listenAddr}

Api listening address.

*Type:* string

*Default:* `"localhost:9000"`

*Declared by:* [`nixos/modules/services/networking/consul.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/consul.nix)

## `services.consul.alerts.package` {#opt-services.consul.alerts.package}

The consul-alerts package to use.

*Type:* package

*Default:* `pkgs.consul-alerts`

*Declared by:* [`nixos/modules/services/networking/consul.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/consul.nix)

## `services.consul.alerts.watchChecks` {#opt-services.consul.alerts.watchChecks}

Whether to enable check watcher.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/consul.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/consul.nix)

## `services.consul.alerts.watchEvents` {#opt-services.consul.alerts.watchEvents}

Whether to enable event watcher.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/consul.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/consul.nix)

## `services.consul.dropPrivileges` {#opt-services.consul.dropPrivileges}

Whether the consul agent should be run as a non-root consul user.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/consul.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/consul.nix)

## `services.consul.enable` {#opt-services.consul.enable}

Enables the consul daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/consul.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/consul.nix)

## `services.consul.extraConfig` {#opt-services.consul.extraConfig}

Extra configuration options which are serialized to json and added
to the config.json file.

*Type:* attribute set of anything

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/consul.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/consul.nix)

## `services.consul.extraConfigFiles` {#opt-services.consul.extraConfigFiles}

Additional configuration files to pass to consul
NOTE: These will not trigger the service to be restarted when altered.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/consul.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/consul.nix)

## `services.consul.forceAddrFamily` {#opt-services.consul.forceAddrFamily}

Whether to bind ipv4/ipv6 or both kind of addresses.

*Type:* one of "any", "ipv4", "ipv6"

*Default:* `"any"`

*Declared by:* [`nixos/modules/services/networking/consul.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/consul.nix)

## `services.consul.forceIpv4` {#opt-services.consul.forceIpv4}

Deprecated: Use consul.forceAddrFamily instead.
Whether we should force the interfaces to only pull ipv4 addresses.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/consul.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/consul.nix)

## `services.consul.interface.advertise` {#opt-services.consul.interface.advertise}

The name of the interface to pull the advertise\_addr from.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/consul.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/consul.nix)

## `services.consul.interface.bind` {#opt-services.consul.interface.bind}

The name of the interface to pull the bind\_addr from.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/consul.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/consul.nix)

## `services.consul.leaveOnStop` {#opt-services.consul.leaveOnStop}

If enabled, causes a leave action to be sent when closing consul.
This allows a clean termination of the node, but permanently removes
it from the cluster. You probably don't want this option unless you
are running a node which going offline in a permanent / semi-permanent
fashion.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/consul.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/consul.nix)

## `services.consul.package` {#opt-services.consul.package}

The consul package to use.

*Type:* package

*Default:* `pkgs.consul`

*Declared by:* [`nixos/modules/services/networking/consul.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/consul.nix)

## `services.consul.webUi` {#opt-services.consul.webUi}

Enables the web interface on the consul http port.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/consul.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/consul.nix)

## `services.convos.enable` {#opt-services.convos.enable}

Whether to enable Convos.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/convos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/convos.nix)

## `services.convos.listenAddress` {#opt-services.convos.listenAddress}

Address or host the web interface should listen on

*Type:* string

*Default:* `"*"`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/convos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/convos.nix)

## `services.convos.listenPort` {#opt-services.convos.listenPort}

Port the web interface should listen on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Example:* `8080`

*Declared by:* [`nixos/modules/services/web-apps/convos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/convos.nix)

## `services.convos.reverseProxy` {#opt-services.convos.reverseProxy}

Enables reverse proxy support. This will allow Convos to automatically
pick up the `X-Forwarded-For` and
`X-Request-Base` HTTP headers set in your reverse proxy
web server. Note that enabling this option without a reverse proxy in
front will be a security issue.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/convos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/convos.nix)

## `services.cook-cli.autoStart` {#opt-services.cook-cli.autoStart}

Whether to start cook-cli server automatically.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/cook-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cook-cli.nix)

## `services.cook-cli.basePath` {#opt-services.cook-cli.basePath}

Path to the directory cook-cli will look for recipes.

*Type:* string

*Default:* `"/var/lib/cook-cli"`

*Declared by:* [`nixos/modules/services/web-apps/cook-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cook-cli.nix)

## `services.cook-cli.enable` {#opt-services.cook-cli.enable}

Whether to enable cook-cli.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/cook-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cook-cli.nix)

## `services.cook-cli.openFirewall` {#opt-services.cook-cli.openFirewall}

Whether to open the cook-cli server port in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/cook-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cook-cli.nix)

## `services.cook-cli.package` {#opt-services.cook-cli.package}

The cook-cli package to use.

*Type:* package

*Default:* `pkgs.cook-cli`

*Declared by:* [`nixos/modules/services/web-apps/cook-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cook-cli.nix)

## `services.cook-cli.port` {#opt-services.cook-cli.port}

Which port cook-cli server will use.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9080`

*Declared by:* [`nixos/modules/services/web-apps/cook-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cook-cli.nix)

## `services.coredns.config` {#opt-services.coredns.config}

Verbatim Corefile to use.
See [https://coredns.io/manual/toc/#configuration](https://coredns.io/manual/toc/#configuration) for details.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  . {
    whoami
  }
''
```

*Declared by:* [`nixos/modules/services/networking/coredns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coredns.nix)

## `services.coredns.enable` {#opt-services.coredns.enable}

Whether to enable Coredns dns server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/coredns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coredns.nix)

## `services.coredns.extraArgs` {#opt-services.coredns.extraArgs}

Extra arguments to pass to coredns.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-dns.port=53"
]
```

*Declared by:* [`nixos/modules/services/networking/coredns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coredns.nix)

## `services.coredns.package` {#opt-services.coredns.package}

The coredns package to use.

*Type:* package

*Default:* `pkgs.coredns`

*Declared by:* [`nixos/modules/services/networking/coredns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coredns.nix)

## `services.corerad.configFile` {#opt-services.corerad.configFile}

Path to CoreRAD TOML configuration file.

*Type:* absolute path

*Example:* `"${pkgs.corerad}/etc/corerad/corerad.toml"`

*Declared by:* [`nixos/modules/services/networking/corerad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/corerad.nix)

## `services.corerad.enable` {#opt-services.corerad.enable}

Whether to enable CoreRAD IPv6 NDP RA daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/corerad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/corerad.nix)

## `services.corerad.package` {#opt-services.corerad.package}

The corerad package to use.

*Type:* package

*Default:* `pkgs.corerad`

*Declared by:* [`nixos/modules/services/networking/corerad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/corerad.nix)

## `services.corerad.settings` {#opt-services.corerad.settings}

Configuration for CoreRAD, see [https://github.com/mdlayher/corerad/blob/main/internal/config/reference.toml](https://github.com/mdlayher/corerad/blob/main/internal/config/reference.toml)
for supported values. Ignored if configFile is set.

*Type:* TOML value

*Example:*

``` nix
{
  interfaces = [
    # eth0 is an upstream interface monitoring for IPv6 router advertisements.
    {
      name = "eth0";
      monitor = true;
    }
    # eth1 is a downstream interface advertising IPv6 prefixes for SLAAC.
    {
      name = "eth1";
      advertise = true;
      prefix = [{ prefix = "::/64"; }];
    }
  ];
  # Optionally enable Prometheus metrics.
  debug = {
    address = "localhost:9430";
    prometheus = true;
  };
}
```

*Declared by:* [`nixos/modules/services/networking/corerad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/corerad.nix)

## `services.corosync.clusterName` {#opt-services.corosync.clusterName}

Name of the corosync cluster.

*Type:* string

*Default:* `"nixcluster"`

*Declared by:* [`nixos/modules/services/cluster/corosync/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/corosync/default.nix)

## `services.corosync.enable` {#opt-services.corosync.enable}

Whether to enable corosync.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/corosync/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/corosync/default.nix)

## `services.corosync.extraOptions` {#opt-services.corosync.extraOptions}

Additional options with which to start corosync.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/cluster/corosync/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/corosync/default.nix)

## `services.corosync.nodelist` {#opt-services.corosync.nodelist}

Corosync nodelist: all cluster members.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/cluster/corosync/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/corosync/default.nix)

## `services.corosync.nodelist.*.name` {#opt-services.corosync.nodelist._.name}

Node name

*Type:* string

*Declared by:* [`nixos/modules/services/cluster/corosync/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/corosync/default.nix)

## `services.corosync.nodelist.*.nodeid` {#opt-services.corosync.nodelist._.nodeid}

Node ID number

*Type:* signed integer

*Declared by:* [`nixos/modules/services/cluster/corosync/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/corosync/default.nix)

## `services.corosync.nodelist.*.ring_addrs` {#opt-services.corosync.nodelist._.ring_addrs}

List of addresses, one for each ring.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/cluster/corosync/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/corosync/default.nix)

## `services.corosync.package` {#opt-services.corosync.package}

The corosync package to use.

*Type:* package

*Default:* `pkgs.corosync`

*Declared by:* [`nixos/modules/services/cluster/corosync/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/corosync/default.nix)

## `services.corteza.address` {#opt-services.corteza.address}

IP for the HTTP server.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/development/corteza.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/corteza.nix)

## `services.corteza.enable` {#opt-services.corteza.enable}

Whether to enable Corteza, a low-code platform.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/development/corteza.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/corteza.nix)

## `services.corteza.group` {#opt-services.corteza.group}

The group to run Corteza under.

*Type:* string

*Default:* `"corteza"`

*Declared by:* [`nixos/modules/services/development/corteza.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/corteza.nix)

## `services.corteza.openFirewall` {#opt-services.corteza.openFirewall}

Whether to open ports in the firewall.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/development/corteza.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/corteza.nix)

## `services.corteza.package` {#opt-services.corteza.package}

The corteza package to use.

*Type:* package

*Default:* `pkgs.corteza`

*Declared by:* [`nixos/modules/services/development/corteza.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/corteza.nix)

## `services.corteza.port` {#opt-services.corteza.port}

Port for the HTTP server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `80`

*Declared by:* [`nixos/modules/services/development/corteza.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/corteza.nix)

## `services.corteza.settings` {#opt-services.corteza.settings}

Configuration for Corteza, will be passed as environment variables.
See [https://docs.cortezaproject.org/corteza-docs/2026.9/devops-guide/references/configuration/server.html](https://docs.cortezaproject.org/corteza-docs/2026.9/devops-guide/references/configuration/server.html).

*Type:* open submodule of attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/development/corteza.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/corteza.nix)

## `services.corteza.settings.HTTP_WEBAPP_ENABLED` {#opt-services.corteza.settings.HTTP_WEBAPP_ENABLED}

Whether to enable webapps.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/development/corteza.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/corteza.nix)

## `services.corteza.user` {#opt-services.corteza.user}

The user to run Corteza under.

*Type:* string

*Default:* `"corteza"`

*Declared by:* [`nixos/modules/services/development/corteza.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/corteza.nix)

## `services.coturn.alt-listening-port` {#opt-services.coturn.alt-listening-port}

Alternative listening port for UDP and TCP listeners;
default (or zero) value means "listening port plus one".
This is needed for RFC 5780 support
(STUN extension specs, NAT behavior discovery). The TURN Server
supports RFC 5780 only if it is started with more than one
listening IP address of the same family (IPv4 or IPv6).
RFC 5780 is supported only by UDP protocol, other protocols
are listening to that endpoint only for "symmetry".

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `listening-port + 1`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.alt-tls-listening-port` {#opt-services.coturn.alt-tls-listening-port}

Alternative listening port for TLS and DTLS protocols.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `tls-listening-port + 1`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.cert` {#opt-services.coturn.cert}

Certificate file in PEM format.

*Type:* null or string

*Default:* `null`

*Example:* `"/var/lib/acme/example.com/fullchain.pem"`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.cli-ip` {#opt-services.coturn.cli-ip}

Local system IP address to be used for CLI server endpoint.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.cli-password` {#opt-services.coturn.cli-password}

CLI access password.
For the security reasons, it is recommended to use the encrypted
for of the password (see the -P command in the turnadmin utility).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.cli-port` {#opt-services.coturn.cli-port}

CLI server port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5766`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.dh-file` {#opt-services.coturn.dh-file}

Use custom DH TLS key, stored in PEM format in the file.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.enable` {#opt-services.coturn.enable}

Whether to enable coturn TURN server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.extraConfig` {#opt-services.coturn.extraConfig}

Additional configuration options

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.listening-ips` {#opt-services.coturn.listening-ips}

Listener IP addresses of relay server.
If no IP(s) specified in the config file or in the command line options,
then all IPv4 and IPv6 system IPs will be used for listening.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "203.0.113.42"
  "2001:DB8::42"
]
```

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.listening-port` {#opt-services.coturn.listening-port}

TURN listener port for UDP and TCP.
Note: actually, TLS and DTLS sessions can connect to the
"plain" TCP and UDP port(s), too - if allowed by configuration.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3478`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.lt-cred-mech` {#opt-services.coturn.lt-cred-mech}

Use long-term credential mechanism.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.max-port` {#opt-services.coturn.max-port}

Upper bound of UDP relay endpoints

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `65535`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.min-port` {#opt-services.coturn.min-port}

Lower bound of UDP relay endpoints

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `49152`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.no-auth` {#opt-services.coturn.no-auth}

This option is opposite to lt-cred-mech.
(TURN Server with no-auth option allows anonymous access).
If neither option is defined, and no users are defined,
then no-auth is default. If at least one user is defined,
in this file or in command line or in usersdb file, then
lt-cred-mech is default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.no-cli` {#opt-services.coturn.no-cli}

Turn OFF the CLI support.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.no-dtls` {#opt-services.coturn.no-dtls}

Disable DTLS client listener

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.no-tcp` {#opt-services.coturn.no-tcp}

Disable TCP client listener

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.no-tcp-relay` {#opt-services.coturn.no-tcp-relay}

Disable TCP relay endpoints

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.no-tls` {#opt-services.coturn.no-tls}

Disable TLS client listener

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.no-udp` {#opt-services.coturn.no-udp}

Disable UDP client listener

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.no-udp-relay` {#opt-services.coturn.no-udp-relay}

Disable UDP relay endpoints

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.pkey` {#opt-services.coturn.pkey}

Private key file in PEM format.

*Type:* null or string

*Default:* `null`

*Example:* `"/var/lib/acme/example.com/key.pem"`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.realm` {#opt-services.coturn.realm}

The default realm to be used for the users when no explicit
origin/realm relationship was found in the database, or if the TURN
server is not using any database (just the commands-line settings
and the userdb file). Must be used with long-term credentials
mechanism or with TURN REST API.

*Type:* string

*Default:* `config.networking.hostName`

*Example:* `"example.com"`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.relay-ips` {#opt-services.coturn.relay-ips}

Relay address (the local IP address that will be used to relay the
packets to the peer).
Multiple relay addresses may be used.
The same IP(s) can be used as both listening IP(s) and relay IP(s).

If no relay IP(s) specified, then the turnserver will apply the default
policy: it will decide itself which relay addresses to be used, and it
will always be using the client socket IP address as the relay IP address
of the TURN session (if the requested relay address family is the same
as the family of the client socket).

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "203.0.113.42"
  "2001:DB8::42"
]
```

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.secure-stun` {#opt-services.coturn.secure-stun}

Require authentication of the STUN Binding request.
By default, the clients are allowed anonymous access to the STUN Binding functionality.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.static-auth-secret` {#opt-services.coturn.static-auth-secret}

'Static' authentication secret value (a string) for TURN REST API only.
If not set, then the turn server
will try to use the 'dynamic' value in turn\_secret table
in user database (if present). The database-stored  value can be changed on-the-fly
by a separate program, so this is why that other mode is 'dynamic'.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.static-auth-secret-file` {#opt-services.coturn.static-auth-secret-file}

Path to the file containing the static authentication secret.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.tls-listening-port` {#opt-services.coturn.tls-listening-port}

TURN listener port for TLS.
Note: actually, "plain" TCP and UDP sessions can connect to the TLS and
DTLS port(s), too - if allowed by configuration. The TURN server
"automatically" recognizes the type of traffic. Actually, two listening
endpoints (the "plain" one and the "tls" one) are equivalent in terms of
functionality; but we keep both endpoints to satisfy the RFC 5766 specs.
For secure TCP connections, we currently support SSL version 3 and
TLS version 1.0, 1.1 and 1.2.
For secure UDP connections, we support DTLS version 1.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5349`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.coturn.use-auth-secret` {#opt-services.coturn.use-auth-secret}

TURN REST API flag.
Flag that sets a special authorization option that is based upon authentication secret.
This feature can be used with the long-term authentication mechanism, only.
This feature purpose is to support "TURN Server REST API", see
"TURN REST API" link in the project's page
[https://github.com/coturn/coturn/](https://github.com/coturn/coturn/)

This option is used with timestamp:

usercombo -\> "timestamp:userid"
turn user -\> usercombo
turn password -\> base64(hmac(secret key, usercombo))

This allows TURN credentials to be accounted for a specific user id.
If you don't have a suitable id, the timestamp alone can be used.
This option is just turning on secret-based authentication.
The actual value of the secret is defined either by option static-auth-secret,
or can be found in the turn\_secret table in the database.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/coturn.nix)

## `services.couchdb.adminPass` {#opt-services.couchdb.adminPass}

Couchdb (i.e. fauxton) account with permission for all dbs and
tasks.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/couchdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/couchdb.nix)

## `services.couchdb.adminUser` {#opt-services.couchdb.adminUser}

Couchdb (i.e. fauxton) account with permission for all dbs and
tasks.

*Type:* string

*Default:* `"admin"`

*Declared by:* [`nixos/modules/services/databases/couchdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/couchdb.nix)

## `services.couchdb.argsFile` {#opt-services.couchdb.argsFile}

vm.args configuration. Overrides Couchdb's Erlang VM parameters file.

*Type:* absolute path

*Default:* `"config.services.couchdb.package/etc/vm.args"`

*Declared by:* [`nixos/modules/services/databases/couchdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/couchdb.nix)

## `services.couchdb.bindAddress` {#opt-services.couchdb.bindAddress}

Defines the IP address by which CouchDB will be accessible.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/databases/couchdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/couchdb.nix)

## `services.couchdb.configFile` {#opt-services.couchdb.configFile}

Configuration file for persisting runtime changes. File
needs to be readable and writable from couchdb user/group.

*Type:* absolute path

*Default:* `"/var/lib/couchdb/local.ini"`

*Declared by:* [`nixos/modules/services/databases/couchdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/couchdb.nix)

## `services.couchdb.databaseDir` {#opt-services.couchdb.databaseDir}

Specifies location of CouchDB database files (\*.couch named). This
location should be writable and readable for the user the CouchDB
service runs as (couchdb by default).

*Type:* absolute path

*Default:* `"/var/lib/couchdb"`

*Declared by:* [`nixos/modules/services/databases/couchdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/couchdb.nix)

## `services.couchdb.enable` {#opt-services.couchdb.enable}

Whether to enable CouchDB Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/couchdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/couchdb.nix)

## `services.couchdb.extraConfig` {#opt-services.couchdb.extraConfig}

Extra configuration options for CouchDB

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/databases/couchdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/couchdb.nix)

## `services.couchdb.extraConfigFiles` {#opt-services.couchdb.extraConfigFiles}

Extra configuration files. Overrides any other configuration. You can use this to setup the Admin user without putting the password in your nix store.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/databases/couchdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/couchdb.nix)

## `services.couchdb.group` {#opt-services.couchdb.group}

Group account under which couchdb runs.

*Type:* string

*Default:* `"couchdb"`

*Declared by:* [`nixos/modules/services/databases/couchdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/couchdb.nix)

## `services.couchdb.logFile` {#opt-services.couchdb.logFile}

Specifies the location of file for logging output.

*Type:* absolute path

*Default:* `"/var/log/couchdb.log"`

*Declared by:* [`nixos/modules/services/databases/couchdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/couchdb.nix)

## `services.couchdb.package` {#opt-services.couchdb.package}

The couchdb3 package to use.

*Type:* package

*Default:* `pkgs.couchdb3`

*Declared by:* [`nixos/modules/services/databases/couchdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/couchdb.nix)

## `services.couchdb.port` {#opt-services.couchdb.port}

Defined the port number to listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5984`

*Declared by:* [`nixos/modules/services/databases/couchdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/couchdb.nix)

## `services.couchdb.uriFile` {#opt-services.couchdb.uriFile}

This file contains the full URI that can be used to access this
instance of CouchDB. It is used to help discover the port CouchDB is
running on (if it was set to 0 (e.g. automatically assigned any free
one). This file should be writable and readable for the user that
runs the CouchDB service (couchdb by default).

*Type:* absolute path

*Default:* `"/run/couchdb/couchdb.uri"`

*Declared by:* [`nixos/modules/services/databases/couchdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/couchdb.nix)

## `services.couchdb.user` {#opt-services.couchdb.user}

User account under which couchdb runs.

*Type:* string

*Default:* `"couchdb"`

*Declared by:* [`nixos/modules/services/databases/couchdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/couchdb.nix)

## `services.couchdb.viewIndexDir` {#opt-services.couchdb.viewIndexDir}

Specifies location of CouchDB view index files. This location should
be writable and readable for the user that runs the CouchDB service
(couchdb by default).

*Type:* absolute path

*Default:* `"/var/lib/couchdb"`

*Declared by:* [`nixos/modules/services/databases/couchdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/couchdb.nix)

## `services.cpuminer-cryptonight.enable` {#opt-services.cpuminer-cryptonight.enable}

Whether to enable the cpuminer cryptonight miner.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/cpuminer-cryptonight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cpuminer-cryptonight.nix)

## `services.cpuminer-cryptonight.pass` {#opt-services.cpuminer-cryptonight.pass}

Password for mining server

*Type:* string

*Default:* `"x"`

*Declared by:* [`nixos/modules/services/misc/cpuminer-cryptonight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cpuminer-cryptonight.nix)

## `services.cpuminer-cryptonight.threads` {#opt-services.cpuminer-cryptonight.threads}

Number of miner threads, defaults to available processors

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Declared by:* [`nixos/modules/services/misc/cpuminer-cryptonight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cpuminer-cryptonight.nix)

## `services.cpuminer-cryptonight.url` {#opt-services.cpuminer-cryptonight.url}

URL of mining server

*Type:* string

*Declared by:* [`nixos/modules/services/misc/cpuminer-cryptonight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cpuminer-cryptonight.nix)

## `services.cpuminer-cryptonight.user` {#opt-services.cpuminer-cryptonight.user}

Username for mining server

*Type:* string

*Declared by:* [`nixos/modules/services/misc/cpuminer-cryptonight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/cpuminer-cryptonight.nix)

## `services.cpupower-gui.enable` {#opt-services.cpupower-gui.enable}

Enables dbus/systemd service needed by cpupower-gui.
These services are responsible for retrieving and modifying cpu power
saving settings.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/cpupower-gui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/cpupower-gui.nix)

## `services.crab-hole.configFile` {#opt-services.crab-hole.configFile}

The config file of crab-hole.

If files are added via url, make sure the service has access to them.
Setting this option will override any configuration applied by the settings option.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/networking/crab-hole.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/crab-hole.nix)

## `services.crab-hole.enable` {#opt-services.crab-hole.enable}

Whether to enable Crab-hole Service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/crab-hole.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/crab-hole.nix)

## `services.crab-hole.openFirewall` {#opt-services.crab-hole.openFirewall}

Open ports in the firewall for crab-hole's DNS server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/crab-hole.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/crab-hole.nix)

## `services.crab-hole.package` {#opt-services.crab-hole.package}

The crab-hole package to use.

*Type:* package

*Default:* `pkgs.crab-hole`

*Declared by:* [`nixos/modules/services/networking/crab-hole.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/crab-hole.nix)

## `services.crab-hole.settings` {#opt-services.crab-hole.settings}

Crab-holes config. See big example [https://github.com/LuckyTurtleDev/crab-hole/blob/main/example-config.toml](https://github.com/LuckyTurtleDev/crab-hole/blob/main/example-config.toml)

*Type:* open submodule of (TOML value)

*Example:*

``` nix
{
  api = {
    admin_key = "1234";
    listen = "127.0.0.1";
    port = 8080;
    show_doc = true;
  };
  blocklist = {
    allow_list = [
      "file:///allowed.txt"
    ];
    include_subdomains = true;
    lists = [
      "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts"
      "https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt"
      "file:///blocked.txt"
    ];
  };
  downstream = [
    {
      listen = "localhost";
      port = 8080;
      protocol = "udp";
    }
    {
      certificate = "dns.example.com.crt";
      dns_hostname = "dns.example.com";
      key = "dns.example.com.key";
      listen = "[::]";
      port = 8055;
      protocol = "https";
      timeout_ms = 3000;
    }
  ];
  upstream = {
    name_servers = [
      {
        protocol = "tls";
        socket_addr = "[2606:4700:4700::1111]:853";
        tls_dns_name = "1dot1dot1dot1.cloudflare-dns.com";
        trust_nx_responses = false;
      }
      {
        protocol = "tls";
        socket_addr = "1.1.1.1:853";
        tls_dns_name = "1dot1dot1dot1.cloudflare-dns.com";
        trust_nx_responses = false;
      }
    ];
    options = {
      validate = false;
    };
  };
}
```

*Declared by:* [`nixos/modules/services/networking/crab-hole.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/crab-hole.nix)

## `services.crab-hole.settings.blocklist.allow_list` {#opt-services.crab-hole.settings.blocklist.allow_list}

List of allowlists. If files are added via url, make sure the service has access to them!

*Type:* list of (string or absolute path)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/crab-hole.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/crab-hole.nix)

## `services.crab-hole.settings.blocklist.include_subdomains` {#opt-services.crab-hole.settings.blocklist.include_subdomains}

Whether to enable Include subdomains.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/crab-hole.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/crab-hole.nix)

## `services.crab-hole.settings.blocklist.lists` {#opt-services.crab-hole.settings.blocklist.lists}

List of blocklists. If files are added via url, make sure the service has access to them!

*Type:* list of (string or absolute path)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/crab-hole.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/crab-hole.nix)

## `services.crab-hole.supplementaryGroups` {#opt-services.crab-hole.supplementaryGroups}

Adds additional groups to the crab-hole service. Can be useful to prevent permission issues.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "acme"
]
```

*Declared by:* [`nixos/modules/services/networking/crab-hole.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/crab-hole.nix)

## `services.create_ap.enable` {#opt-services.create_ap.enable}

Whether to enable setting up wifi hotspots using create\_ap.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/create_ap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/create_ap.nix)

## `services.create_ap.settings` {#opt-services.create_ap.settings}

Configuration for `create_ap`.
See [upstream example configuration](https://raw.githubusercontent.com/lakinduakash/linux-wifi-hotspot/master/src/scripts/create_ap.conf)
for supported values.

*Type:* attribute set of (signed integer or boolean or string)

*Default:* `{ }`

*Example:*

``` nix
{
  INTERNET_IFACE = "eth0";
  PASSPHRASE = "12345678";
  SSID = "My Wifi Hotspot";
  WIFI_IFACE = "wlan0";
}
```

*Declared by:* [`nixos/modules/services/networking/create_ap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/create_ap.nix)

## `services.croc.debug` {#opt-services.croc.debug}

Whether to enable debug logs.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/croc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/croc.nix)

## `services.croc.enable` {#opt-services.croc.enable}

Whether to enable croc relay.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/croc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/croc.nix)

## `services.croc.openFirewall` {#opt-services.croc.openFirewall}

Whether to enable opening of the peer port(s) in the firewall.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/croc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/croc.nix)

## `services.croc.pass` {#opt-services.croc.pass}

Password or passwordfile for the relay.

*Type:* absolute path or string

*Default:* `"pass123"`

*Declared by:* [`nixos/modules/services/networking/croc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/croc.nix)

## `services.croc.ports` {#opt-services.croc.ports}

Ports of the relay.

*Type:* list of 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
[
  9009
  9010
  9011
  9012
  9013
]
```

*Declared by:* [`nixos/modules/services/networking/croc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/croc.nix)

## `services.cron.cronFiles` {#opt-services.cron.cronFiles}

A list of extra crontab files that will be read and appended to the main
crontab file when the cron service starts.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/scheduling/cron.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/scheduling/cron.nix)

## `services.cron.enable` {#opt-services.cron.enable}

Whether to enable the Vixie cron daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/scheduling/cron.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/scheduling/cron.nix)

## `services.cron.mailto` {#opt-services.cron.mailto}

Email address to which job output will be mailed.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/scheduling/cron.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/scheduling/cron.nix)

## `services.cron.systemCronJobs` {#opt-services.cron.systemCronJobs}

A list of Cron jobs to be appended to the system-wide
crontab.  See the manual page for crontab for the expected
format. If you want to get the results mailed you must setuid
sendmail. See [`security.wrappers`](../../options/security/index.md#opt-security.wrappers)

If neither /var/cron/cron.deny nor /var/cron/cron.allow exist only root
is allowed to have its own crontab file. The /var/cron/cron.deny file
is created automatically for you, so every user can use a crontab.

Many nixos modules set systemCronJobs, so if you decide to disable vixie cron
and enable another cron daemon, you may want it to get its system crontab
based on systemCronJobs.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[ "* * * * *  test   ls -l / > /tmp/cronout 2>&1"
  "* * * * *  eelco  echo Hello World > /home/eelco/cronout"
]
```

*Declared by:* [`nixos/modules/services/scheduling/cron.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/scheduling/cron.nix)

## `services.cross-seed.configDir` {#opt-services.cross-seed.configDir}

Cross-seed config directory

*Type:* absolute path

*Default:* `"/var/lib/cross-seed"`

*Declared by:* [`nixos/modules/services/torrent/cross-seed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/cross-seed.nix)

## `services.cross-seed.enable` {#opt-services.cross-seed.enable}

Whether to enable cross-seed.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/torrent/cross-seed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/cross-seed.nix)

## `services.cross-seed.group` {#opt-services.cross-seed.group}

Group to run cross-seed as.

*Type:* string

*Default:* `"cross-seed"`

*Example:* `"torrents"`

*Declared by:* [`nixos/modules/services/torrent/cross-seed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/cross-seed.nix)

## `services.cross-seed.package` {#opt-services.cross-seed.package}

The cross-seed package to use.

*Type:* package

*Default:* `pkgs.cross-seed`

*Declared by:* [`nixos/modules/services/torrent/cross-seed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/cross-seed.nix)

## `services.cross-seed.settings` {#opt-services.cross-seed.settings}

Configuration options for cross-seed.

Secrets should not be set in this option, as they will be available in
the Nix store. For secrets, please use settingsFile.

For more details, see [the cross-seed documentation](https://www.cross-seed.org/docs/basics/options).

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/torrent/cross-seed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/cross-seed.nix)

## `services.cross-seed.settings.dataDirs` {#opt-services.cross-seed.settings.dataDirs}

Paths to be searched for matching data.

If you use Injection, cross-seed will use the specified linkType
to create a link to the original file in the linkDirs.

If linkType is hardlink, these must be on the same volume as the
data.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/torrent/cross-seed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/cross-seed.nix)

## `services.cross-seed.settings.linkDirs` {#opt-services.cross-seed.settings.linkDirs}

List of directories where cross-seed will create links.

If linkType is hardlink, these must be on the same volume as the data.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/torrent/cross-seed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/cross-seed.nix)

## `services.cross-seed.settings.outputDir` {#opt-services.cross-seed.settings.outputDir}

Directory where cross-seed will place torrent files it finds.

*Type:* null or absolute path

*Default:* `"\${cfg.configDir}/output"`

*Declared by:* [`nixos/modules/services/torrent/cross-seed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/cross-seed.nix)

## `services.cross-seed.settings.port` {#opt-services.cross-seed.settings.port}

Port the cross-seed daemon listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `2468`

*Example:* `3000`

*Declared by:* [`nixos/modules/services/torrent/cross-seed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/cross-seed.nix)

## `services.cross-seed.settings.torrentDir` {#opt-services.cross-seed.settings.torrentDir}

Directory containing torrent files, or if you're using a torrent
client integration and injection - your torrent client's .torrent
file store/cache.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/torrent/cross-seed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/cross-seed.nix)

## `services.cross-seed.settingsFile` {#opt-services.cross-seed.settingsFile}

Path to a JSON file containing settings that will be merged with the
settings option. This is suitable for storing secrets, as they will not
be exposed on the Nix store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/torrent/cross-seed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/cross-seed.nix)

## `services.cross-seed.useGenConfigDefaults` {#opt-services.cross-seed.useGenConfigDefaults}

Whether to use the option defaults from the configuration generated by
`cross-seed gen-config`.

Those are the settings recommended by the project, and can be inspected
from their [template file](https://github.com/cross-seed/cross-seed/blob/master/src/config.template.cjs).

Settings set in [`services.cross-seed.settings`](#opt-services.cross-seed.settings) and
[`services.cross-seed.settingsFile`](#opt-services.cross-seed.settingsFile) will override the ones from
this option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/torrent/cross-seed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/cross-seed.nix)

## `services.cross-seed.user` {#opt-services.cross-seed.user}

User to run cross-seed as.

*Type:* string

*Default:* `"cross-seed"`

*Declared by:* [`nixos/modules/services/torrent/cross-seed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/cross-seed.nix)

## `services.crossfire-server.configFiles` {#opt-services.crossfire-server.configFiles}

Text to append to the corresponding configuration files. Note that the
files given in the example are *not* the complete set of files available
to customize; look in /etc/crossfire after enabling the server to see
the available files, and read the comments in each file for detailed
documentation on the format and what settings are available.

Note that the motd, rules, and news files, if configured here, will
overwrite the example files that come with the server, rather than being
appended to them as the other configuration files are.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  dm_file = ''
    admin:secret_password:localhost
    alice:xyzzy:*
  '';
  ban_file = ''
    # Bob is a jerk
    bob@*
    # So is everyone on 192.168.86.255/24
    *@192.168.86.
  '';
  metaserver2 = ''
    metaserver2_notification on
    localhostname crossfire.example.net
  '';
  motd = "Welcome to CrossFire!";
  news = "No news yet.";
  rules = "Don't be a jerk.";
  settings = ''
    # be nicer to newbies and harsher to experienced players
    balanced_stat_loss true
    # don't let players pick up and use admin-created items
    real_wiz false
  '';
}
```

*Declared by:* [`nixos/modules/services/games/crossfire-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/crossfire-server.nix)

## `services.crossfire-server.dataDir` {#opt-services.crossfire-server.dataDir}

Where to load readonly data from -- maps, archetypes, treasure tables,
and the like. If you plan to edit the data on the live server (rather
than overlaying the crossfire-maps and crossfire-arch packages and
nixos-rebuilding), point this somewhere read-write and copy the data
there before starting the server.

*Type:* string

*Default:* `"${config.services.crossfire.package}/share/crossfire"`

*Declared by:* [`nixos/modules/services/games/crossfire-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/crossfire-server.nix)

## `services.crossfire-server.enable` {#opt-services.crossfire-server.enable}

If enabled, the Crossfire game server will be started at boot.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/crossfire-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/crossfire-server.nix)

## `services.crossfire-server.openFirewall` {#opt-services.crossfire-server.openFirewall}

Whether to open ports in the firewall for the server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/crossfire-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/crossfire-server.nix)

## `services.crossfire-server.package` {#opt-services.crossfire-server.package}

The crossfire-server package to use. ::: {.note}
This will also be used for map/arch data, if you don't change `dataDir`
:::

*Type:* package

*Default:* `pkgs.crossfire-server`

*Declared by:* [`nixos/modules/services/games/crossfire-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/crossfire-server.nix)

## `services.crossfire-server.stateDir` {#opt-services.crossfire-server.stateDir}

Where to store runtime data (save files, persistent items, etc).

If left at the default, this will be automatically created on server
startup if it does not already exist. If changed, it is the admin's
responsibility to make sure that the directory exists and is writeable
by the `crossfire` user.

*Type:* string

*Default:* `"/var/lib/crossfire"`

*Declared by:* [`nixos/modules/services/games/crossfire-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/crossfire-server.nix)

## `services.crossmacro.daemonPackage` {#opt-services.crossmacro.daemonPackage}

The crossmacro-daemon package to use.

*Type:* package

*Default:* `pkgs.crossmacro-daemon`

*Declared by:* [`nixos/modules/services/desktops/crossmacro.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/crossmacro.nix)

## `services.crossmacro.enable` {#opt-services.crossmacro.enable}

Whether to enable CrossMacro, a cross-platform mouse and keyboard macro application.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/crossmacro.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/crossmacro.nix)

## `services.crossmacro.package` {#opt-services.crossmacro.package}

The crossmacro package to use.

*Type:* package

*Default:* `pkgs.crossmacro`

*Declared by:* [`nixos/modules/services/desktops/crossmacro.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/crossmacro.nix)

## `services.crossmacro.users` {#opt-services.crossmacro.users}

Local or directory-service identities granted access to CrossMacro.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "alice"
  "bob"
]
```

*Declared by:* [`nixos/modules/services/desktops/crossmacro.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/crossmacro.nix)

## `services.crowdsec-firewall-bouncer.createRulesets` {#opt-services.crowdsec-firewall-bouncer.createRulesets}

Whether to have the module create the appropriate firewall configuration
based on the bouncer settings.
You may disable this option to manually configure it.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/crowdsec-firewall-bouncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec-firewall-bouncer.nix)

## `services.crowdsec-firewall-bouncer.enable` {#opt-services.crowdsec-firewall-bouncer.enable}

Whether to enable CrowdSec Firewall Bouncer.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/crowdsec-firewall-bouncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec-firewall-bouncer.nix)

## `services.crowdsec-firewall-bouncer.package` {#opt-services.crowdsec-firewall-bouncer.package}

The crowdsec-firewall-bouncer package to use.

*Type:* package

*Default:* `pkgs.crowdsec-firewall-bouncer`

*Declared by:* [`nixos/modules/services/security/crowdsec-firewall-bouncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec-firewall-bouncer.nix)

## `services.crowdsec-firewall-bouncer.registerBouncer.bouncerName` {#opt-services.crowdsec-firewall-bouncer.registerBouncer.bouncerName}

Name to register the bouncer as to the CrowdSec API

*Type:* non-empty string

*Default:* `"crowdsec-firewall-bouncer"`

*Declared by:* [`nixos/modules/services/security/crowdsec-firewall-bouncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec-firewall-bouncer.nix)

## `services.crowdsec-firewall-bouncer.registerBouncer.enable` {#opt-services.crowdsec-firewall-bouncer.registerBouncer.enable}

Whether to automatically register the bouncer to the locally running
`crowdsec` service.

When authenticating to an external CrowdSec API, you may use the
[services (C)](#opt-services.crowdsec-firewall-bouncer.secrets.apiKeyPath) option
instead.

*Type:* boolean

*Default:* `config.services.crowdsec.enable`

*Declared by:* [`nixos/modules/services/security/crowdsec-firewall-bouncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec-firewall-bouncer.nix)

## `services.crowdsec-firewall-bouncer.secrets.apiKeyPath` {#opt-services.crowdsec-firewall-bouncer.secrets.apiKeyPath}

Path to the API key to authenticate with a local CrowdSec API.

You need to call `cscli bouncers add <bouncer-name>` to register
the bouncer and get this API key.

When authenticating to the locally running `crowdsec` service, you may use the
[services (C)](#opt-services.crowdsec-firewall-bouncer.registerBouncer.enable) option instead.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/crowdsec-firewall-bouncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec-firewall-bouncer.nix)

## `services.crowdsec-firewall-bouncer.settings` {#opt-services.crowdsec-firewall-bouncer.settings}

Settings for the main CrowdSec Firewall Bouncer.

Refer to the defaults at [https://github.com/crowdsecurity/cs-firewall-bouncer/blob/main/config/crowdsec-firewall-bouncer.yaml](https://github.com/crowdsecurity/cs-firewall-bouncer/blob/main/config/crowdsec-firewall-bouncer.yaml).

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/crowdsec-firewall-bouncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec-firewall-bouncer.nix)

## `services.crowdsec-firewall-bouncer.settings.api_key` {#opt-services.crowdsec-firewall-bouncer.settings.api_key}

API key to authenticate with a local crowdsec API.

You need to call `cscli bouncers add <bouncer-name>` to register
the bouncer and get this API key.

Setting this option will store this secret in the Nix store.
Instead, you should set the `services.crowdsec-firewall-bouncer.secrets.apiKeyPath`
option, which will read the value at runtime.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/crowdsec-firewall-bouncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec-firewall-bouncer.nix)

## `services.crowdsec-firewall-bouncer.settings.api_url` {#opt-services.crowdsec-firewall-bouncer.settings.api_url}

URL of the local API.

*Type:* string

*Default:* `http://$\{config.services.crowdsec.settings.config.api.server.listen_uri}`

*Example:* `"http://127.0.0.1:8080"`

*Declared by:* [`nixos/modules/services/security/crowdsec-firewall-bouncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec-firewall-bouncer.nix)

## `services.crowdsec-firewall-bouncer.settings.mode` {#opt-services.crowdsec-firewall-bouncer.settings.mode}

Firewall mode to use.

*Type:* string

*Default:* `if config.networking.nftables.enable then "nftables" else "iptables"`

*Declared by:* [`nixos/modules/services/security/crowdsec-firewall-bouncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec-firewall-bouncer.nix)

## `services.crowdsec.autoUpdateService` {#opt-services.crowdsec.autoUpdateService}

Whether to enable if `true` `cscli hub update` will be executed daily. See `https://docs.crowdsec.net/docs/cscli/cscli_hub_update/` for more information.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.enable` {#opt-services.crowdsec.enable}

Whether to enable CrowdSec Security Engine.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.extraGroups` {#opt-services.crowdsec.extraGroups}

List of additional groups that are assigned to the crowdsec user.

The main usecase for this is to allow reading group readable log files.

*Type:* list of string

*Default:* `[ "systemd-journal" ]`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.group` {#opt-services.crowdsec.group}

The group to run crowdsec as

*Type:* string

*Default:* `"crowdsec"`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.hub` {#opt-services.crowdsec.hub}

Hub collections, parsers, AppSec rules, etc.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.hub.appsec-configs` {#opt-services.crowdsec.hub.appsec-configs}

List of hub appsec configurations to install

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "crowdsecurity/appsec-default"
]
```

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.hub.appsec-rules` {#opt-services.crowdsec.hub.appsec-rules}

List of hub appsec rules to install

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "crowdsecurity/base-config"
]
```

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.hub.collections` {#opt-services.crowdsec.hub.collections}

List of hub collections to install

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "crowdsecurity/linux"
]
```

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.hub.parsers` {#opt-services.crowdsec.hub.parsers}

List of hub parsers to install

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "crowdsecurity/sshd-logs"
]
```

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.hub.postoverflows` {#opt-services.crowdsec.hub.postoverflows}

List of hub postoverflows to install

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "crowdsecurity/auditd-nix-wrappers-whitelist-process"
]
```

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.hub.scenarios` {#opt-services.crowdsec.hub.scenarios}

List of hub scenarios to install

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "crowdsecurity/ssh-bf"
]
```

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.name` {#opt-services.crowdsec.name}

Name of the machine when registering it at the central or local api.

*Type:* string

*Default:* `config.networking.hostName`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.package` {#opt-services.crowdsec.package}

The crowdsec package to use.

*Type:* package

*Default:* `pkgs.crowdsec`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.readOnlyPaths` {#opt-services.crowdsec.readOnlyPaths}

Additional read-only paths from the host which the crowdsec service can access.

The main usecase for this is to allow crowdsec to read additional log files.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/var/log/vaultwarden"
  "/var/log/nginx"
]
```

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings` {#opt-services.crowdsec.settings}

Set of various configuration attributes

*Type:* submodule

*Declared by:*

- [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)
- [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)
- [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.acquisitions` {#opt-services.crowdsec.settings.acquisitions}

A list of acquisition specifications, which define the data sources you want to be parsed.

See [https://docs.crowdsec.net/u/getting\_started/post\_installation/acquisition/](https://docs.crowdsec.net/u/getting_started/post_installation/acquisition/) for details.

*Type:* list of (YAML 1.1 value)

*Default:*

``` nix
[
  {
    journalctl_filter = [
      "_SYSTEMD_UNIT=sshd.service"
    ];
    labels = {
      type = "syslog";
    };
    source = "journalctl";
  }
]
```

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.appsecConfigs` {#opt-services.crowdsec.settings.appsecConfigs}

A list of appsec configs specifications.

See [https://docs.crowdsec.net/docs/next/appsec/configuration/](https://docs.crowdsec.net/docs/next/appsec/configuration/) for details.

*Type:* list of (YAML 1.1 value)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    default_remediation = "ban";
    name = "crowdsecurity/my-appsec-config";
    on_load = [
      {
        apply = [
          "SetMaxBodySize(20971520)"
          "SetBodySizeExceededAction(\"partial\")"
        ];
      }
    ];
  }
]
```

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.config` {#opt-services.crowdsec.settings.config}

Settings for the main CrowdSec configuration file.

Defaults are *mostly* equal to the default linux config file: [https://github.com/crowdsecurity/crowdsec/blob/master/config/config.yaml](https://github.com/crowdsecurity/crowdsec/blob/master/config/config.yaml).

See the upstream documentation for possible values: [https://docs.crowdsec.net/docs/configuration/crowdsec\_configuration/#configuration-directives](https://docs.crowdsec.net/docs/configuration/crowdsec_configuration/#configuration-directives).

*Type:* open submodule of (YAML 1.1 value)

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.config.api.client.credentials_path` {#opt-services.crowdsec.settings.config.api.client.credentials_path}

Path to the credential file that contains the API URL and login/password.

*Type:* absolute path or non-empty string

*Default:* `${config.services.crowdsec.settings.config.config_paths.data_dir}/local_api_credentials.yaml`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.config.api.server.console_path` {#opt-services.crowdsec.settings.config.api.server.console_path}

The path to the console configuration.

*Type:* absolute path

*Default:* `${config.services.crowdsec.settings.config.config_paths.data_dir}/console.yaml`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.config.api.server.enable` {#opt-services.crowdsec.settings.config.api.server.enable}

Whether to enable the CrowdSec Local API.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.config.api.server.listen_uri` {#opt-services.crowdsec.settings.config.api.server.listen_uri}

The address and port on which the API will listen on in the form of `host:port`.

*Type:* non-empty string

*Default:* `"127.0.0.1:8080"`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.config.api.server.online_client.credentials_path` {#opt-services.crowdsec.settings.config.api.server.online_client.credentials_path}

Path to a file containing credentials for the Central API.
To automatically register with `crowdsec-setup`, set this option (typically to `/var/lib/crowdsec/online_api_credentials.yaml`).
The file will be automatically created, unless it already exists.

*Type:* null or absolute path or non-empty string

*Default:* `null`

*Example:* `"\${config.services.crowdsec.settings.config.config_paths.data_dir}/online_api_credentials.yaml"`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.config.api.server.profiles_path` {#opt-services.crowdsec.settings.config.api.server.profiles_path}

Path to the profiles file.

*Type:* absolute path

*Default:* `${config.services.crowdsec.settings.config.config_paths.config_dir}/profiles.yaml`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.config.common.log_media` {#opt-services.crowdsec.settings.config.common.log_media}

Log media

*Type:* one of "stdout", "file"

*Default:* `"stdout"`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.config.config_paths.config_dir` {#opt-services.crowdsec.settings.config.config_paths.config_dir}

Main configuration directory of crowdsec.

*Type:* absolute path

*Default:* `"/etc/crowdsec"`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.config.config_paths.data_dir` {#opt-services.crowdsec.settings.config.config_paths.data_dir}

This is where crowdsec is going to store data, such as files downloaded by scenarios, geolocalisation database, metabase configuration database, or even SQLite database.

*Type:* absolute path

*Default:* `"/var/lib/crowdsec/data"`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.config.config_paths.hub_dir` {#opt-services.crowdsec.settings.config.config_paths.hub_dir}

Directory where `cscli` will store parsers, scenarios, collections and such.

*Type:* absolute path

*Default:* `${config.services.crowdsec.settings.config.config_paths.data_dir}/hub`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.config.config_paths.index_path` {#opt-services.crowdsec.settings.config.config_paths.index_path}

Path to the `.index.json` file downloaded by `cscli` to know the list of available configurations.

*Type:* absolute path

*Default:* `${config.services.crowdsec.settings.config.config_paths.hub_dir}/.index.json`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.config.config_paths.notification_dir` {#opt-services.crowdsec.settings.config.config_paths.notification_dir}

Path to directory where configuration files for notification plugins are kept.

*Type:* absolute path

*Default:* `${config.services.crowdsec.settings.config.config_paths.config_dir}/notifications`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.config.config_paths.pattern_dir` {#opt-services.crowdsec.settings.config.config_paths.pattern_dir}

Path to directory where pattern files are located.

*Type:* absolute path

*Default:*

``` nix
''
  A directory which contains the patterns of `config.services.crowdsec.settings.patterns` and the patterns
  from this directory: <https://github.com/crowdsecurity/crowdsec/tree/master/config/patterns>.
''
```

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.config.config_paths.plugin_dir` {#opt-services.crowdsec.settings.config.config_paths.plugin_dir}

Path to directory where the plugin binaries/scripts are located.

*Type:* absolute path

*Default:* `${config.services.crowdsec.settings.config.config_paths.config_dir}/plugins`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.config.config_paths.simulation_path` {#opt-services.crowdsec.settings.config.config_paths.simulation_path}

This file is generated from `config.services.crowdsec.settings.simulation`.

*Type:* absolute path

*Default:* `${config_paths.config_dir}/simulation.yaml`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.config.crowdsec_service.acquisition_dir` {#opt-services.crowdsec.settings.config.crowdsec_service.acquisition_dir}

Path to a directory where each yaml is considered as a acquisition configuration file containing logs that needs to be read.
If both acquisition\_dir and acquisition\_path are specified, the entries are merged altogether.

*Type:* absolute path

*Default:* `${config.services.crowdsec.settings.config.config_paths.config_dir}/acquis.d`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.config.cscli.hub_branch` {#opt-services.crowdsec.settings.config.cscli.hub_branch}

The git branch on which cscli is going to fetch configurations.

See [https://docs.crowdsec.net/docs/configuration/crowdsec\_configuration/#hub\_branch](https://docs.crowdsec.net/docs/configuration/crowdsec_configuration/#hub_branch) for more information.

*Type:* null or non-empty string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.config.db_config.db_path` {#opt-services.crowdsec.settings.config.db_config.db_path}

The path to the database file (only if the type of database is `sqlite`) or path to socket file (only if the type of database is `mysql|pgx`)

*Type:* absolute path

*Default:* `${config.services.crowdsec.settings.config.config_paths.data_dir}/crowdsec.db`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.config.db_config.type` {#opt-services.crowdsec.settings.config.db_config.type}

The database type

*Type:* one of "sqlite", "mysql", "pgx", "postgresql"

*Default:* `"sqlite"`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.config.plugin_config.group` {#opt-services.crowdsec.settings.config.plugin_config.group}

The group to run crowdsec plugins as

*Type:* string

*Default:* `${config.services.crowdsec.group}`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.config.plugin_config.user` {#opt-services.crowdsec.settings.config.plugin_config.user}

The user to run crowdsec plugins as

*Type:* string

*Default:* `${config.services.crowdsec.user}`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.console` {#opt-services.crowdsec.settings.console}

Console Configuration attributes

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.console.configuration` {#opt-services.crowdsec.settings.console.configuration}

Attributes inside the console.yaml file.

*Type:* YAML 1.1 value

*Default:*

``` nix
{
  share_context = false;
  share_custom = false;
  share_manual_decisions = false;
  share_tainted = false;
}
```

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.console.enrollKeyFile` {#opt-services.crowdsec.settings.console.enrollKeyFile}

The Console Token file to use. The file should just contain the token in the first line of the file like this:

```
hiIamAToken
```

Normally you would do `cscli enroll <token>`,
but you can put the token in a file instead and pass the path of that file to this option.

The token is available by clicking the "Enroll command" button at [https://app.crowdsec.net/security-engines?distribution=linux](https://app.crowdsec.net/security-engines?distribution=linux)

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/crowdsec/console_token.txt"`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.contexts` {#opt-services.crowdsec.settings.contexts}

A list of additional contexts to specify.

See [https://docs.crowdsec.net/docs/next/log\_processor/alert\_context/intro](https://docs.crowdsec.net/docs/next/log_processor/alert_context/intro) for details.

*Type:* list of (YAML 1.1 value)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    context = {
      method = [
        "evt.Meta.http_verb"
      ];
      status = [
        "evt.Meta.http_status"
      ];
      target_uri = [
        "evt.Meta.http_path"
      ];
      user_agent = [
        "evt.Meta.http_user_agent"
      ];
    };
  }
]
```

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.notifications` {#opt-services.crowdsec.settings.notifications}

A list of notifications to enable and use in your profiles.
Note that for now, only the plugins shipped by default with CrowdSec are supported.

See [https://docs.crowdsec.net/docs/next/local\_api/notification\_plugins/intro](https://docs.crowdsec.net/docs/next/local_api/notification_plugins/intro) for details.

*Type:* list of (YAML 1.1 value)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    log_level = "info";
    method = "POST";
    name = "default_http_notification";
    type = "http";
    url = "https://example.com/hook";
    yaml = ''
      {{.|toJson}}
    '';
  }
]
```

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.parsers` {#opt-services.crowdsec.settings.parsers}

The set of parser specifications.

See [https://docs.crowdsec.net/docs/next/log\_processor/parsers/intro/](https://docs.crowdsec.net/docs/next/log_processor/parsers/intro/) for details.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.parsers.s00Raw` {#opt-services.crowdsec.settings.parsers.s00Raw}

A list of stage s00-raw specifications. Most of the time, those are already included in the hub, but are presented here anyway.

See [https://docs.crowdsec.net/docs/next/log\_processor/parsers/intro/#s00-raw](https://docs.crowdsec.net/docs/next/log_processor/parsers/intro/#s00-raw) for details.

*Type:* list of (YAML 1.1 value)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.parsers.s01Parse` {#opt-services.crowdsec.settings.parsers.s01Parse}

A list of stage s01-parse specifications.

See [https://docs.crowdsec.net/docs/next/log\_processor/parsers/intro/#s01-parse](https://docs.crowdsec.net/docs/next/log_processor/parsers/intro/#s01-parse) for details.

*Type:* list of (YAML 1.1 value)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    debug = true;
    description = "Parsing custom service logs";
    filter = "1=1";
    grok = {
      apply_on = "message";
      pattern = "^%{DATA:some_data}$";
    };
    name = "example/custom-service-logs";
    onsuccess = "next_stage";
    statics = [
      {
        parsed = "is_my_custom_service";
        value = "yes";
      }
    ];
  }
]
```

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.parsers.s02Enrich` {#opt-services.crowdsec.settings.parsers.s02Enrich}

A list of stage s02-enrich specifications. Inside this list, you can specify Parser Whitelists.

See [https://docs.crowdsec.net/docs/next/log\_processor/parsers/intro/#s01-parse](https://docs.crowdsec.net/docs/next/log_processor/parsers/intro/#s01-parse) for details.

*Type:* list of (YAML 1.1 value)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    description = "Whitelist parse events from my IPs";
    name = "myips/whitelist";
    whitelist = {
      cidr = [
        "1.2.3.0/24"
      ];
      ip = [
        "1.2.3.4"
      ];
      reason = "My IP ranges";
    };
  }
]
```

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.patterns` {#opt-services.crowdsec.settings.patterns}

A list of files containing custom grok patterns.

See [https://docs.crowdsec.net/docs/next/log\_processor/parsers/yaml/#patterns-documentation](https://docs.crowdsec.net/docs/next/log_processor/parsers/yaml/#patterns-documentation) for more details.

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
[ (pkgs.writeTextDir "custom_service_logs" (builtins.readFile ./custom_service_logs)) ]
```

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.postOverflows` {#opt-services.crowdsec.settings.postOverflows}

The set of Postoverflows specifications.

See [https://docs.crowdsec.net/docs/next/log\_processor/parsers/intro#postoverflows](https://docs.crowdsec.net/docs/next/log_processor/parsers/intro#postoverflows) for details.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.postOverflows.s01Whitelist` {#opt-services.crowdsec.settings.postOverflows.s01Whitelist}

A list of stage s01-whitelist specifications. Inside this list, you can specify Postoverflows Whitelists.

See [https://docs.crowdsec.net/docs/next/log\_processor/parsers/intro/#postoverflows](https://docs.crowdsec.net/docs/next/log_processor/parsers/intro/#postoverflows) for details.

*Type:* list of (YAML 1.1 value)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    description = "Whitelist my reverse DNS";
    name = "postoverflows/whitelist_my_dns_domain";
    whitelist = {
      expression = [
        "evt.Enriched.reverse_dns endsWith '.local.'"
      ];
      reason = "Don't ban me";
    };
  }
]
```

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.profiles` {#opt-services.crowdsec.settings.profiles}

A list of profiles to enable.

See [https://docs.crowdsec.net/u/getting\_started/post\_installation/profiles](https://docs.crowdsec.net/u/getting_started/post_installation/profiles) for more details.

*Type:* list of (YAML 1.1 value)

*Default:*

``` nix
[
  {
    decisions = [
      {
        duration = "4h";
        type = "ban";
      }
    ];
    filters = [
      "Alert.Remediation == true && Alert.GetScope() == 'Ip'"
    ];
    name = "default_ip_remediation";
    on_success = "break";
  }
  {
    decisions = [
      {
        duration = "4h";
        type = "ban";
      }
    ];
    filters = [
      "Alert.Remediation == true && Alert.GetScope() == 'Range'"
    ];
    name = "default_range_remediation";
    on_success = "break";
  }
]
```

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.scenarios` {#opt-services.crowdsec.settings.scenarios}

A list of scenarios specifications.

See [https://docs.crowdsec.net/docs/next/log\_processor/scenarios/create/](https://docs.crowdsec.net/docs/next/log_processor/scenarios/create/) for details.

*Type:* list of (YAML 1.1 value)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    capacity = 5;
    description = "Detect myservice bruteforce";
    filter = "evt.Meta.log_type == 'myservice_failed_auth'";
    groupby = "evt.Meta.source_ip";
    leakspeed = "10s";
    name = "crowdsecurity/myservice-bf";
    type = "leaky";
  }
]
```

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.settings.simulation` {#opt-services.crowdsec.settings.simulation}

Attributes inside the simulation.yaml file.

*Type:* YAML 1.1 value

*Default:*

``` nix
{
  simulation = false;
}
```

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.crowdsec.user` {#opt-services.crowdsec.user}

The user to run crowdsec as

*Type:* string

*Default:* `"crowdsec"`

*Declared by:* [`nixos/modules/services/security/crowdsec`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/crowdsec)

## `services.cryptpad.configureNginx` {#opt-services.cryptpad.configureNginx}

Configure Nginx as a reverse proxy for Cryptpad.
Note that this makes some assumptions on your setup, and sets settings that will
affect other virtualHosts running on your Nginx instance, if any.
Alternatively you can configure a reverse-proxy of your choice.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/cryptpad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cryptpad.nix)

## `services.cryptpad.enable` {#opt-services.cryptpad.enable}

Whether to enable cryptpad.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/cryptpad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cryptpad.nix)

## `services.cryptpad.package` {#opt-services.cryptpad.package}

The cryptpad package to use.

*Type:* package

*Default:* `pkgs.cryptpad`

*Declared by:* [`nixos/modules/services/web-apps/cryptpad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cryptpad.nix)

## `services.cryptpad.settings` {#opt-services.cryptpad.settings}

Cryptpad configuration settings.
See [https://github.com/cryptpad/cryptpad/blob/main/config/config.example.js](https://github.com/cryptpad/cryptpad/blob/main/config/config.example.js) for a more extensive
reference documentation.
Test your deployed instance through `https://<domain>/checkup/`.

*Type:* open submodule of (JSON value)

*Declared by:* [`nixos/modules/services/web-apps/cryptpad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cryptpad.nix)

## `services.cryptpad.settings.adminKeys` {#opt-services.cryptpad.settings.adminKeys}

List of public signing keys of users that can access the admin panel

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "[cryptpad-user1@my.awesome.website/YZgXQxKR0Rcb6r6CmxHPdAGLVludrAF2lEnkbx1vVOo=]"
]
```

*Declared by:* [`nixos/modules/services/web-apps/cryptpad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cryptpad.nix)

## `services.cryptpad.settings.blockDailyCheck` {#opt-services.cryptpad.settings.blockDailyCheck}

Disable telemetry. This setting is only effective if the 'Disable server telemetry'
setting in the admin menu has been untouched, and will be ignored by cryptpad once
that option is set either way.
Note that due to the service confinement, just enabling the option in the admin
menu will not be able to resolve DNS and fail; this setting must be set as well.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/cryptpad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cryptpad.nix)

## `services.cryptpad.settings.httpAddress` {#opt-services.cryptpad.settings.httpAddress}

Address on which the Node.js server should listen

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/cryptpad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cryptpad.nix)

## `services.cryptpad.settings.httpPort` {#opt-services.cryptpad.settings.httpPort}

Port on which the Node.js server should listen

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/web-apps/cryptpad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cryptpad.nix)

## `services.cryptpad.settings.httpSafeOrigin` {#opt-services.cryptpad.settings.httpSafeOrigin}

Cryptpad sandbox URL

*Type:* null or string

*Default:* `null`

*Example:* `"https://cryptpad-ui.example.com. Apparently optional but recommended."`

*Declared by:* [`nixos/modules/services/web-apps/cryptpad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cryptpad.nix)

## `services.cryptpad.settings.httpUnsafeOrigin` {#opt-services.cryptpad.settings.httpUnsafeOrigin}

This is the URL that users will enter to load your instance

*Type:* string

*Default:* `""`

*Example:* `"https://cryptpad.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/cryptpad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cryptpad.nix)

## `services.cryptpad.settings.installMethod` {#opt-services.cryptpad.settings.installMethod}

Install method is listed in telemetry if you agree to it through the consentToContact
setting in the admin panel.

*Type:* string

*Default:* `"nixos"`

*Declared by:* [`nixos/modules/services/web-apps/cryptpad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cryptpad.nix)

## `services.cryptpad.settings.logLevel` {#opt-services.cryptpad.settings.logLevel}

Controls log level

*Type:* string

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/web-apps/cryptpad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cryptpad.nix)

## `services.cryptpad.settings.logToStdout` {#opt-services.cryptpad.settings.logToStdout}

Controls whether log output should go to stdout of the systemd service

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/cryptpad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cryptpad.nix)

## `services.cryptpad.settings.maxWorkers` {#opt-services.cryptpad.settings.maxWorkers}

Number of child processes, defaults to number of cores available

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/cryptpad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cryptpad.nix)

## `services.cryptpad.settings.websocketPort` {#opt-services.cryptpad.settings.websocketPort}

Port for the websocket that needs to be separate

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3003`

*Declared by:* [`nixos/modules/services/web-apps/cryptpad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/cryptpad.nix)

## `services.cyrus-imap.cyrusConfigFile` {#opt-services.cyrus-imap.cyrusConfigFile}

Path to the configuration file used for Cyrus.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/cyrus-imap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/cyrus-imap.nix)

## `services.cyrus-imap.cyrusSettings` {#opt-services.cyrus-imap.cyrusSettings}

Cyrus configuration settings. See [cyrus.conf(5)](https://www.cyrusimap.org/imap/reference/manpages/configs/cyrus.conf.html)

*Type:* open submodule of attribute set of attribute set of (boolean or signed integer or list of string)

*Declared by:* [`nixos/modules/services/mail/cyrus-imap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/cyrus-imap.nix)

## `services.cyrus-imap.cyrusSettings.DAEMON` {#opt-services.cyrus-imap.cyrusSettings.DAEMON}

This section lists long running daemons to start before any SERVICES are spawned. `master(8)` will ensure that these processes are running, restarting any process which dies or forks. All listed processes will be shutdown when `master(8)` is exiting.

*Type:* unspecified value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/mail/cyrus-imap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/cyrus-imap.nix)

## `services.cyrus-imap.cyrusSettings.EVENTS` {#opt-services.cyrus-imap.cyrusSettings.EVENTS}

This section lists processes that should be run at specific intervals, similar to cron jobs. This section is typically used to perform scheduled cleanup/maintenance.

*Type:* unspecified value

*Default:*

``` nix
{
  checkpoint = {
    cmd = [
      "ctl_cyrusdb"
      "-c"
    ];
    period = 30;
  };
  deleteprune = {
    at = 430;
    cmd = [
      "cyr_expire"
      "-E"
      "4"
      "-D"
      "28"
    ];
  };
  delprune = {
    at = 400;
    cmd = [
      "cyr_expire"
      "-E"
      "3"
    ];
  };
  expungeprune = {
    at = 445;
    cmd = [
      "cyr_expire"
      "-E"
      "4"
      "-X"
      "28"
    ];
  };
  tlsprune = {
    at = 400;
    cmd = [
      "tls_prune"
    ];
  };
}
```

*Declared by:* [`nixos/modules/services/mail/cyrus-imap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/cyrus-imap.nix)

## `services.cyrus-imap.cyrusSettings.SERVICES` {#opt-services.cyrus-imap.cyrusSettings.SERVICES}

This section is the heart of the cyrus.conf file. It lists the processes that should be spawned to handle client connections made on certain Internet/UNIX sockets.

*Type:* unspecified value

*Default:*

``` nix
{
  imap = {
    cmd = [
      "imapd"
    ];
    listen = "imap";
    prefork = 0;
  };
  lmtpunix = {
    cmd = [
      "lmtpd"
    ];
    listen = "/run/cyrus/lmtp";
    prefork = 0;
  };
  notify = {
    cmd = [
      "notifyd"
    ];
    listen = "/run/cyrus/notify";
    prefork = 0;
    proto = "udp";
  };
  pop3 = {
    cmd = [
      "pop3d"
    ];
    listen = "pop3";
    prefork = 0;
  };
}
```

*Declared by:* [`nixos/modules/services/mail/cyrus-imap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/cyrus-imap.nix)

## `services.cyrus-imap.cyrusSettings.START` {#opt-services.cyrus-imap.cyrusSettings.START}

This section lists the processes to run before any SERVICES are spawned.
This section is typically used to initialize databases.
Master itself will not startup until all tasks in START have completed, so put no blocking commands here.

*Type:* unspecified value

*Default:*

``` nix
{
  recover = {
    cmd = [
      "ctl_cyrusdb"
      "-r"
    ];
  };
}
```

*Declared by:* [`nixos/modules/services/mail/cyrus-imap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/cyrus-imap.nix)

## `services.cyrus-imap.debug` {#opt-services.cyrus-imap.debug}

Whether to enable debugging messages for the Cyrus master process.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/cyrus-imap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/cyrus-imap.nix)

## `services.cyrus-imap.enable` {#opt-services.cyrus-imap.enable}

Whether to enable Cyrus IMAP, an email, contacts and calendar server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/cyrus-imap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/cyrus-imap.nix)

## `services.cyrus-imap.group` {#opt-services.cyrus-imap.group}

Cyrus IMAP group name. If this is not set, a group named `cyrus` will be created.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/cyrus-imap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/cyrus-imap.nix)

## `services.cyrus-imap.imapdConfigFile` {#opt-services.cyrus-imap.imapdConfigFile}

Path to the configuration file used for cyrus-imap.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/cyrus-imap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/cyrus-imap.nix)

## `services.cyrus-imap.imapdSettings` {#opt-services.cyrus-imap.imapdSettings}

IMAP configuration settings. See [imapd.conf(5)](https://www.cyrusimap.org/imap/reference/manpages/configs/imapd.conf.html)

*Type:* open submodule of attribute set of (string or signed integer or boolean or list of string)

*Default:*

``` nix
{
  admins = [
    "cyrus"
  ];
  allowplaintext = true;
  defaultdomain = "localhost";
  defaultpartition = "default";
  duplicate_db_path = "/run/cyrus/db/deliver.db";
  hashimapspool = true;
  httpmodules = [
    "carddav"
    "caldav"
  ];
  mboxname_lockpath = "/run/cyrus/lock";
  partition-default = "/var/lib/cyrus/storage";
  popminpoll = 1;
  proc_path = "/run/cyrus/proc";
  ptscache_db_path = "/run/cyrus/db/ptscache.db";
  sasl_auto_transition = true;
  sasl_pwcheck_method = [
    "saslauthd"
  ];
  sievedir = "/var/lib/cyrus/sieve";
  statuscache_db_path = "/run/cyrus/db/statuscache.db";
  syslog_prefix = "cyrus";
  tls_client_ca_dir = "/etc/ssl/certs";
  tls_session_timeout = 1440;
  tls_sessions_db_path = "/run/cyrus/db/tls_sessions.db";
  virtdomains = "on";
}
```

*Declared by:* [`nixos/modules/services/mail/cyrus-imap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/cyrus-imap.nix)

## `services.cyrus-imap.imapdSettings.configdirectory` {#opt-services.cyrus-imap.imapdSettings.configdirectory}

The pathname of the IMAP configuration directory.

*Type:* absolute path

*Default:* `"/var/lib/cyrus"`

*Declared by:* [`nixos/modules/services/mail/cyrus-imap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/cyrus-imap.nix)

## `services.cyrus-imap.imapdSettings.idlesocket` {#opt-services.cyrus-imap.imapdSettings.idlesocket}

Unix socket that idled listens on.

*Type:* absolute path

*Default:* `"/run/cyrus/idle"`

*Declared by:* [`nixos/modules/services/mail/cyrus-imap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/cyrus-imap.nix)

## `services.cyrus-imap.imapdSettings.lmtpsocket` {#opt-services.cyrus-imap.imapdSettings.lmtpsocket}

Unix socket that lmtpd listens on, used by `deliver(8)`. This should match the path specified in `cyrus.conf(5)`.

*Type:* absolute path

*Default:* `"/run/cyrus/lmtp"`

*Declared by:* [`nixos/modules/services/mail/cyrus-imap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/cyrus-imap.nix)

## `services.cyrus-imap.imapdSettings.notifysocket` {#opt-services.cyrus-imap.imapdSettings.notifysocket}

Unix domain socket that the mail notification daemon listens on.

*Type:* absolute path

*Default:* `"/run/cyrus/notify"`

*Declared by:* [`nixos/modules/services/mail/cyrus-imap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/cyrus-imap.nix)

## `services.cyrus-imap.listenQueue` {#opt-services.cyrus-imap.listenQueue}

Socket listen queue backlog size. See `listen(2)` for more information about a backlog.
Default is 32, which may be increased if you have a very high connection rate.

*Type:* signed integer

*Default:* `32`

*Declared by:* [`nixos/modules/services/mail/cyrus-imap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/cyrus-imap.nix)

## `services.cyrus-imap.tmpDBDir` {#opt-services.cyrus-imap.tmpDBDir}

Location where DB files are stored.
Databases in this directory are recreated upon startup, so ideally they should live in ephemeral storage for best performance.

*Type:* absolute path

*Default:* `"/run/cyrus/db"`

*Declared by:* [`nixos/modules/services/mail/cyrus-imap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/cyrus-imap.nix)

## `services.cyrus-imap.user` {#opt-services.cyrus-imap.user}

Cyrus IMAP user name. If this is not set, a user named `cyrus` will be created.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/cyrus-imap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/cyrus-imap.nix)
