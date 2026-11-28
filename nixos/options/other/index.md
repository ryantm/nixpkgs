# Other options {#sec-options-other}

## `<imports = [ pkgs.autopush-rs.services.autoconnect ]>` {#opt-_imports_=___pkgs.autopush-rs.services.autoconnect___}

This is a [modular service](https://nixos.org/manual/nixos/unstable/#modular-services), which can be imported into a NixOS configuration using the [`system.services`](https://search.nixos.org/options?channel=unstable&show=system.services&query=modular+service) option.

*Type:* submodule

## `<imports = [ pkgs.autopush-rs.services.autoconnect ]>.autoconnect.package` {#opt-_imports_=___pkgs.autopush-rs.services.autoconnect___.autoconnect.package}

The autopush-rs package to use.

*Type:* package

*Default:* `pkgs.autopush-rs`

*Declared by:* [`pkgs/by-name/au/autopush-rs/service-autoconnect.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/au/autopush-rs/service-autoconnect.nix)

## `<imports = [ pkgs.autopush-rs.services.autoconnect ]>.autoconnect.settings` {#opt-_imports_=___pkgs.autopush-rs.services.autoconnect___.autoconnect.settings}

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`pkgs/by-name/au/autopush-rs/service-autoconnect.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/au/autopush-rs/service-autoconnect.nix)

## `<imports = [ pkgs.autopush-rs.services.autoconnect ]>.autoconnect.settings.db_dsn` {#opt-_imports_=___pkgs.autopush-rs.services.autoconnect___.autoconnect.settings.db_dsn}

Endpoint of the database server.

*Type:* string

*Default:* `""`

*Example:* `redis+socket://${config.services.redis.servers.autopush-rs.port}`

*Declared by:* [`pkgs/by-name/au/autopush-rs/service-autoconnect.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/au/autopush-rs/service-autoconnect.nix)

## `<imports = [ pkgs.autopush-rs.services.autoendpoint ]>` {#opt-_imports_=___pkgs.autopush-rs.services.autoendpoint___}

This is a [modular service](https://nixos.org/manual/nixos/unstable/#modular-services), which can be imported into a NixOS configuration using the [`system.services`](https://search.nixos.org/options?channel=unstable&show=system.services&query=modular+service) option.

*Type:* submodule

## `<imports = [ pkgs.autopush-rs.services.autoendpoint ]>.autoendpoint.package` {#opt-_imports_=___pkgs.autopush-rs.services.autoendpoint___.autoendpoint.package}

The autopush-rs package to use.

*Type:* package

*Default:* `pkgs.autopush-rs`

*Declared by:* [`pkgs/by-name/au/autopush-rs/service-autoendpoint.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/au/autopush-rs/service-autoendpoint.nix)

## `<imports = [ pkgs.autopush-rs.services.autoendpoint ]>.autoendpoint.settings` {#opt-_imports_=___pkgs.autopush-rs.services.autoendpoint___.autoendpoint.settings}

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`pkgs/by-name/au/autopush-rs/service-autoendpoint.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/au/autopush-rs/service-autoendpoint.nix)

## `<imports = [ pkgs.autopush-rs.services.autoendpoint ]>.autoendpoint.settings.db_dsn` {#opt-_imports_=___pkgs.autopush-rs.services.autoendpoint___.autoendpoint.settings.db_dsn}

Endpoint of the database server.

*Type:* string

*Default:* `""`

*Example:* `redis+socket://${config.services.redis.servers.autopush-rs.port}`

*Declared by:* [`pkgs/by-name/au/autopush-rs/service-autoendpoint.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/au/autopush-rs/service-autoendpoint.nix)

## `<imports = [ pkgs.ghostunnel.services.default ]>` {#opt-_imports_=___pkgs.ghostunnel.services.default___}

This is a [modular service](https://nixos.org/manual/nixos/unstable/#modular-services), which can be imported into a NixOS configuration using the [`system.services`](https://search.nixos.org/options?channel=unstable&show=system.services&query=modular+service) option.

*Type:* submodule

## `<imports = [ pkgs.ghostunnel.services.default ]>.ghostunnel.allowAll` {#opt-_imports_=___pkgs.ghostunnel.services.default___.ghostunnel.allowAll}

If true, allow all clients, do not check client cert subject.

*Type:* boolean

*Default:* `false`

*Declared by:* [`pkgs/by-name/gh/ghostunnel/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/gh/ghostunnel/service.nix)

## `<imports = [ pkgs.ghostunnel.services.default ]>.ghostunnel.allowCN` {#opt-_imports_=___pkgs.ghostunnel.services.default___.ghostunnel.allowCN}

Allow client if common name appears in the list.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`pkgs/by-name/gh/ghostunnel/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/gh/ghostunnel/service.nix)

## `<imports = [ pkgs.ghostunnel.services.default ]>.ghostunnel.allowDNS` {#opt-_imports_=___pkgs.ghostunnel.services.default___.ghostunnel.allowDNS}

Allow client if DNS subject alternative name appears in the list.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`pkgs/by-name/gh/ghostunnel/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/gh/ghostunnel/service.nix)

## `<imports = [ pkgs.ghostunnel.services.default ]>.ghostunnel.allowOU` {#opt-_imports_=___pkgs.ghostunnel.services.default___.ghostunnel.allowOU}

Allow client if organizational unit name appears in the list.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`pkgs/by-name/gh/ghostunnel/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/gh/ghostunnel/service.nix)

## `<imports = [ pkgs.ghostunnel.services.default ]>.ghostunnel.allowURI` {#opt-_imports_=___pkgs.ghostunnel.services.default___.ghostunnel.allowURI}

Allow client if URI subject alternative name appears in the list.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`pkgs/by-name/gh/ghostunnel/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/gh/ghostunnel/service.nix)

## `<imports = [ pkgs.ghostunnel.services.default ]>.ghostunnel.cacert` {#opt-_imports_=___pkgs.ghostunnel.services.default___.ghostunnel.cacert}

Path to CA bundle file (PEM/X509). Uses system trust store if `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`pkgs/by-name/gh/ghostunnel/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/gh/ghostunnel/service.nix)

## `<imports = [ pkgs.ghostunnel.services.default ]>.ghostunnel.cert` {#opt-_imports_=___pkgs.ghostunnel.services.default___.ghostunnel.cert}

Path to certificate (PEM with certificate chain).

Not required if `keystore` is set.

*Type:* null or string

*Default:* `null`

*Declared by:* [`pkgs/by-name/gh/ghostunnel/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/gh/ghostunnel/service.nix)

## `<imports = [ pkgs.ghostunnel.services.default ]>.ghostunnel.disableAuthentication` {#opt-_imports_=___pkgs.ghostunnel.services.default___.ghostunnel.disableAuthentication}

Disable client authentication, no client certificate will be required.

*Type:* boolean

*Default:* `false`

*Declared by:* [`pkgs/by-name/gh/ghostunnel/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/gh/ghostunnel/service.nix)

## `<imports = [ pkgs.ghostunnel.services.default ]>.ghostunnel.extraArguments` {#opt-_imports_=___pkgs.ghostunnel.services.default___.ghostunnel.extraArguments}

Extra arguments to pass to `ghostunnel server`

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`pkgs/by-name/gh/ghostunnel/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/gh/ghostunnel/service.nix)

## `<imports = [ pkgs.ghostunnel.services.default ]>.ghostunnel.key` {#opt-_imports_=___pkgs.ghostunnel.services.default___.ghostunnel.key}

Path to certificate private key (PEM with private key).

Not required if `keystore` is set.

*Type:* null or string

*Default:* `null`

*Declared by:* [`pkgs/by-name/gh/ghostunnel/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/gh/ghostunnel/service.nix)

## `<imports = [ pkgs.ghostunnel.services.default ]>.ghostunnel.keystore` {#opt-_imports_=___pkgs.ghostunnel.services.default___.ghostunnel.keystore}

Path to keystore (combined PEM with cert/key, or PKCS12 keystore).

NB: storepass is not supported because it would expose credentials via `/proc/*/cmdline`.

Specify this or `cert` and `key`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`pkgs/by-name/gh/ghostunnel/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/gh/ghostunnel/service.nix)

## `<imports = [ pkgs.ghostunnel.services.default ]>.ghostunnel.listen` {#opt-_imports_=___pkgs.ghostunnel.services.default___.ghostunnel.listen}

Address and port to listen on (can be HOST:PORT, unix:PATH).

*Type:* string

*Declared by:* [`pkgs/by-name/gh/ghostunnel/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/gh/ghostunnel/service.nix)

## `<imports = [ pkgs.ghostunnel.services.default ]>.ghostunnel.package` {#opt-_imports_=___pkgs.ghostunnel.services.default___.ghostunnel.package}

Package to use for ghostunnel

*Type:* package

*Default:* `"The ghostunnel package that provided this module."`

*Declared by:* [`pkgs/by-name/gh/ghostunnel/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/gh/ghostunnel/service.nix)

## `<imports = [ pkgs.ghostunnel.services.default ]>.ghostunnel.target` {#opt-_imports_=___pkgs.ghostunnel.services.default___.ghostunnel.target}

Address to forward connections to (can be HOST:PORT or unix:PATH).

*Type:* string

*Declared by:* [`pkgs/by-name/gh/ghostunnel/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/gh/ghostunnel/service.nix)

## `<imports = [ pkgs.ghostunnel.services.default ]>.ghostunnel.unsafeTarget` {#opt-_imports_=___pkgs.ghostunnel.services.default___.ghostunnel.unsafeTarget}

If set, does not limit target to localhost, 127.0.0.1, \[::1\], or UNIX sockets.

This is meant to protect against accidental unencrypted traffic on
untrusted networks.

*Type:* boolean

*Default:* `false`

*Declared by:* [`pkgs/by-name/gh/ghostunnel/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/gh/ghostunnel/service.nix)

## `<imports = [ pkgs.git-pages.services.default ]>` {#opt-_imports_=___pkgs.git-pages.services.default___}

This is a [modular service](https://nixos.org/manual/nixos/unstable/#modular-services), which can be imported into a NixOS configuration using the [`system.services`](https://search.nixos.org/options?channel=unstable&show=system.services&query=modular+service) option.

*Type:* submodule

## `<imports = [ pkgs.git-pages.services.default ]>.git-pages.package` {#opt-_imports_=___pkgs.git-pages.services.default___.git-pages.package}

Package to use for git-pages

*Type:* package

*Default:* `"The git-pages package that provided this module."`

*Declared by:* [`pkgs/by-name/gi/git-pages/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/gi/git-pages/service.nix)

## `<imports = [ pkgs.git-pages.services.default ]>.git-pages.secretFile` {#opt-_imports_=___pkgs.git-pages.services.default___.git-pages.secretFile}

File that contains secrets for the git-pages config.
If values in this file are set, any options specified take priority over the options set in
`git-pages.settings`.

::: note
See the [git-pages documentation](https://git-pages.org/running-a-server/#configuration) on
secrets and environment variables.
:::

*Type:* null or string

*Default:* `null`

*Declared by:* [`pkgs/by-name/gi/git-pages/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/gi/git-pages/service.nix)

## `<imports = [ pkgs.git-pages.services.default ]>.git-pages.settings` {#opt-_imports_=___pkgs.git-pages.services.default___.git-pages.settings}

Settings to set in config.toml.

::: note
See the [git-pages documentation](https://git-pages.org/running-a-server/#configuration) on configuring the server.
:::

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`pkgs/by-name/gi/git-pages/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/gi/git-pages/service.nix)

## `<imports = [ pkgs.ktls-utils.services.default ]>` {#opt-_imports_=___pkgs.ktls-utils.services.default___}

This is a [modular service](https://nixos.org/manual/nixos/unstable/#modular-services), which can be imported into a NixOS configuration using the [`system.services`](https://search.nixos.org/options?channel=unstable&show=system.services&query=modular+service) option.

*Type:* submodule

## `<imports = [ pkgs.ktls-utils.services.default ]>.tlshd.package` {#opt-_imports_=___pkgs.ktls-utils.services.default___.tlshd.package}

Package to use for tlshd.

*Type:* package

*Default:* The `ktls-utils` package that provided this module.

*Declared by:* [`pkgs/by-name/kt/ktls-utils/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/kt/ktls-utils/service.nix)

## `<imports = [ pkgs.ktls-utils.services.default ]>.tlshd.settings` {#opt-_imports_=___pkgs.ktls-utils.services.default___.tlshd.settings}

Configuration for tlshd in INI format.
See `tlshd.conf(5)` for available options.

*Type:* attribute set of attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  "authenticate.server" = {
    "x509.certificate" = "/var/lib/tlshd/cert.pem";
    "x509.private_key" = "/var/lib/tlshd/key.pem";
    "x509.truststore" = "/var/lib/tlshd/truststore.pem";
  };
}
```

*Declared by:* [`pkgs/by-name/kt/ktls-utils/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/kt/ktls-utils/service.nix)

## `<imports = [ pkgs.php.services.default ]>` {#opt-_imports_=___pkgs.php.services.default___}

This is a [modular service](https://nixos.org/manual/nixos/unstable/#modular-services), which can be imported into a NixOS configuration using the [`system.services`](https://search.nixos.org/options?channel=unstable&show=system.services&query=modular+service) option.

*Type:* submodule

## `<imports = [ pkgs.php.services.default ]>.php-fpm.package` {#opt-_imports_=___pkgs.php.services.default___.php-fpm.package}

PHP package to use for php-fpm

*Type:* package

*Default:* The PHP package that provided this module.

*Example:*

``` nix
php.buildEnv {
  extensions =
    { all, ... }:
    with all;
    [
      imagick
      opcache
    ];
  extraConfig = "memory_limit=256M";
}
```

*Declared by:* [`pkgs/development/interpreters/php/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/development/interpreters/php/service.nix)

## `<imports = [ pkgs.php.services.default ]>.php-fpm.settings` {#opt-_imports_=___pkgs.php.services.default___.php-fpm.settings}

PHP FPM configuration. Refer to [upstream documentation](https://www.php.net/manual/en/install.fpm.configuration.php) for details on supported values.

*Type:* open submodule of attribute set of (string or signed integer or boolean or (open submodule of attribute set of (string or signed integer or boolean)))

*Default:* `{ }`

*Example:*

``` nix
{
  log_level = "debug";
  log_limit = 2048;

  mypool = {
    "user" = "php";
    "group" = "php";
    "listen.owner" = "caddy";
    "listen.group" = "caddy";
    "pm" = "dynamic";
    "pm.max_children" = 75;
    "pm.start_servers" = 10;
    "pm.min_spare_servers" = 5;
    "pm.max_spare_servers" = 20;
    "pm.max_requests" = 500;
  }
}
```

*Declared by:* [`pkgs/development/interpreters/php/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/development/interpreters/php/service.nix)

## `<imports = [ pkgs.php.services.default ]>.php-fpm.settings.log_level` {#opt-_imports_=___pkgs.php.services.default___.php-fpm.settings.log_level}

Error log level.

*Type:* one of "alert", "error", "warning", "notice", "debug"

*Default:* `"notice"`

*Declared by:* [`pkgs/development/interpreters/php/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/development/interpreters/php/service.nix)

## `<imports = [ pkgs.snid.services.default ]>` {#opt-_imports_=___pkgs.snid.services.default___}

This is a [modular service](https://nixos.org/manual/nixos/unstable/#modular-services), which can be imported into a NixOS configuration using the [`system.services`](https://search.nixos.org/options?channel=unstable&show=system.services&query=modular+service) option.

*Type:* submodule

## `<imports = [ pkgs.snid.services.default ]>.snid.backendCidrs` {#opt-_imports_=___pkgs.snid.services.default___.snid.backendCidrs}

Subnets to which connections may be forwarded. Connections to
addresses outside these subnets are rejected. Used in `nat46` and
`tcp` modes.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "2001:db8::/64"
  "192.0.2.0/24"
]
```

*Declared by:* [`pkgs/by-name/sn/snid/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/sn/snid/service.nix)

## `<imports = [ pkgs.snid.services.default ]>.snid.backendPort` {#opt-_imports_=___pkgs.snid.services.default___.snid.backendPort}

Port number to connect to on the backend in TCP mode. If null,
snid uses the same port as the inbound connection.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`pkgs/by-name/sn/snid/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/sn/snid/service.nix)

## `<imports = [ pkgs.snid.services.default ]>.snid.defaultHostname` {#opt-_imports_=___pkgs.snid.services.default___.snid.defaultHostname}

Hostname to use if a client does not include the SNI extension.
If null, SNI-less connections will be terminated with a TLS alert.

*Type:* null or string

*Default:* `null`

*Declared by:* [`pkgs/by-name/sn/snid/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/sn/snid/service.nix)

## `<imports = [ pkgs.snid.services.default ]>.snid.listen` {#opt-_imports_=___pkgs.snid.services.default___.snid.listen}

Addresses to listen on, in go-listener syntax.

Examples: `"tcp:443"`, `"tcp:0.0.0.0:443"`, `"tcp:192.0.2.4:443"`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "tcp:0.0.0.0:443"
]
```

*Declared by:* [`pkgs/by-name/sn/snid/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/sn/snid/service.nix)

## `<imports = [ pkgs.snid.services.default ]>.snid.mode` {#opt-_imports_=___pkgs.snid.services.default___.snid.mode}

Proxy mode. One of `nat46`, `tcp`, or `unix`.

*Type:* one of "nat46", "tcp", "unix"

*Declared by:* [`pkgs/by-name/sn/snid/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/sn/snid/service.nix)

## `<imports = [ pkgs.snid.services.default ]>.snid.nat46Prefix` {#opt-_imports_=___pkgs.snid.services.default___.snid.nat46Prefix}

IPv6 prefix for the source address when connecting to the backend
in NAT46 mode. The client's IPv4 address is placed in the lower 4
bytes.

Note: this prefix must be routed to the local host, e.g.

```
ip route add local 64:ff9b:1::/96 dev lo
```

*Type:* null or string

*Default:* `null`

*Example:* `"64:ff9b:1::"`

*Declared by:* [`pkgs/by-name/sn/snid/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/sn/snid/service.nix)

## `<imports = [ pkgs.snid.services.default ]>.snid.package` {#opt-_imports_=___pkgs.snid.services.default___.snid.package}

Package to use for snid.

*Type:* package

*Default:* `"The snid package that provided this module."`

*Declared by:* [`pkgs/by-name/sn/snid/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/sn/snid/service.nix)

## `<imports = [ pkgs.snid.services.default ]>.snid.proxyProto` {#opt-_imports_=___pkgs.snid.services.default___.snid.proxyProto}

Use PROXY protocol v2 to convey the client IP address to the
backend. Applicable in `tcp` and `unix` modes.

*Type:* boolean

*Default:* `false`

*Declared by:* [`pkgs/by-name/sn/snid/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/sn/snid/service.nix)

## `<imports = [ pkgs.snid.services.default ]>.snid.unixDirectory` {#opt-_imports_=___pkgs.snid.services.default___.snid.unixDirectory}

Path to the directory containing UNIX domain sockets, used in
`unix` mode.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`pkgs/by-name/sn/snid/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/sn/snid/service.nix)

## `<imports = [ pkgs.trailbase.services.default ]>` {#opt-_imports_=___pkgs.trailbase.services.default___}

This is a [modular service](https://nixos.org/manual/nixos/unstable/#modular-services), which can be imported into a NixOS configuration using the [`system.services`](https://search.nixos.org/options?channel=unstable&show=system.services&query=modular+service) option.

*Type:* submodule

## `<imports = [ pkgs.trailbase.services.default ]>.trailbase.address` {#opt-_imports_=___pkgs.trailbase.services.default___.trailbase.address}

Authority (`<host>:<port>`) the HTTP server binds to.

*Type:* string

*Default:* `"127.0.0.1:4000"`

*Example:* `"0.0.0.0:4000"`

*Declared by:* [`pkgs/by-name/tr/trailbase/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/tr/trailbase/service.nix)

## `<imports = [ pkgs.trailbase.services.default ]>.trailbase.depot` {#opt-_imports_=___pkgs.trailbase.services.default___.trailbase.depot}

Directory for runtime files including the databases.

*Type:* string

*Default:* `"/var/lib/trailbase"`

*Declared by:* [`pkgs/by-name/tr/trailbase/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/tr/trailbase/service.nix)

## `<imports = [ pkgs.trailbase.services.default ]>.trailbase.extraArgs` {#opt-_imports_=___pkgs.trailbase.services.default___.trailbase.extraArgs}

Extra arguments to pass to `trail run`.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`pkgs/by-name/tr/trailbase/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/tr/trailbase/service.nix)

## `<imports = [ pkgs.trailbase.services.default ]>.trailbase.package` {#opt-_imports_=___pkgs.trailbase.services.default___.trailbase.package}

Package to use for TrailBase.

*Type:* package

*Default:* `"The package that provided this module."`

*Declared by:* [`pkgs/by-name/tr/trailbase/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/tr/trailbase/service.nix)

## `_module.args` {#opt-_module.args}

Additional arguments passed to each module in addition to ones
like `lib`, `config`,
and `pkgs`, `modulesPath`.

This option is also available to all submodules. Submodules do not
inherit args from their parent module, nor do they provide args to
their parent module or sibling submodules. The sole exception to
this is the argument `name` which is provided by
parent modules to a submodule and contains the attribute name
the submodule is bound to, or a unique generated name if it is
not bound to an attribute.

Some arguments are already passed by default, of which the
following *cannot* be changed with this option:

- `lib`: The nixpkgs library.

- `config`: The results of all options after merging the values from all modules together.

- `options`: The options declared in all modules.

- `specialArgs`: The `specialArgs` argument passed to `evalModules`.

- All attributes of `specialArgs`

  Whereas option values can generally depend on other option values
  thanks to laziness, this does not apply to `imports`, which
  must be computed statically before anything else.

  For this reason, callers of the module system can provide `specialArgs`
  which are available during import resolution.

  For NixOS, `specialArgs` includes
  `modulesPath`, which allows you to import
  extra modules from the nixpkgs package tree without having to
  somehow make the module aware of the location of the
  `nixpkgs` or NixOS directories.

  ```
  { modulesPath, ... }: {
    imports = [
      (modulesPath + "/profiles/minimal.nix")
    ];
  }
  ```

For NixOS, the default value for this option includes at least this argument:

- `pkgs`: The nixpkgs package set according to
  the [`nixpkgs.pkgs`](#opt-nixpkgs.pkgs) option.

*Type:* lazy attribute set of raw value

*Default:* `{ }`

*Declared by:* [`lib/modules.nix`](https://github.com/NixOS/nixpkgs/blob/master/lib/modules.nix)

## `appstream.enable` {#opt-appstream.enable}

Whether to install files to support the
[AppStream metadata specification](https://www.freedesktop.org/software/appstream/docs/index.html).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/appstream.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/appstream.nix)

## `console.colors` {#opt-console.colors}

The 16 colors palette used by the virtual consoles.
Leave empty to use the default colors.
Colors must be in hexadecimal format and listed in
order from color 0 to color 15.

*Type:* list of string matching the pattern \[\[:xdigit:\]\]{6}

*Default:* `[ ]`

*Example:*

``` nix
[
  "002b36"
  "dc322f"
  "859900"
  "b58900"
  "268bd2"
  "d33682"
  "2aa198"
  "eee8d5"
  "002b36"
  "cb4b16"
  "586e75"
  "657b83"
  "839496"
  "6c71c4"
  "93a1a1"
  "fdf6e3"
]
```

*Declared by:* [`nixos/modules/config/console.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/console.nix)

## `console.earlySetup` {#opt-console.earlySetup}

Enable setting virtual console options as early as possible (in initrd).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/console.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/console.nix)

## `console.enable` {#opt-console.enable}

Whether to enable virtual console.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/config/console.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/console.nix)

## `console.font` {#opt-console.font}

The font used for the virtual consoles.
Can be `null`, a font name, or a path to a PSF font file.

Use `null` to let the kernel choose a built-in font.
The default is 8x16, and, as of Linux 5.3, Terminus 32 bold for display
resolutions of 2560x1080 and higher.
These fonts cover the [IBM437](https://en.wikipedia.org/wiki/Code_page_437) character set.

*Type:* null or string or absolute path

*Default:* `null`

*Example:* `"LatArCyrHeb-16"`

*Declared by:* [`nixos/modules/config/console.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/console.nix)

## `console.keyMap` {#opt-console.keyMap}

The keyboard mapping table for the virtual consoles.

*Type:* string or absolute path

*Default:* `"us"`

*Example:* `"fr"`

*Declared by:* [`nixos/modules/config/console.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/console.nix)

## `console.packages` {#opt-console.packages}

List of additional packages that provide console fonts, keymaps and
other resources for virtual consoles use.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/config/console.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/console.nix)

## `console.useXkbConfig` {#opt-console.useXkbConfig}

If set, configure the virtual console keymap from the xserver
keyboard settings.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/console.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/console.nix)

## `ec2.zfs.datasets` {#opt-ec2.zfs.datasets}

Datasets to create under the `tank` and `boot` zpools.

**NOTE:** This option is used only at image creation time, and
does not attempt to declaratively create or manage datasets
on an existing system.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/amazon-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/amazon-options.nix)

## `ec2.zfs.datasets.<name>.mount` {#opt-ec2.zfs.datasets._name_.mount}

Where to mount this dataset.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/virtualisation/amazon-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/amazon-options.nix)

## `ec2.zfs.datasets.<name>.properties` {#opt-ec2.zfs.datasets._name_.properties}

Properties to set on this dataset.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/amazon-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/amazon-options.nix)

## `fileSystems` {#opt-fileSystems}

The file systems to be mounted.  It must include an entry for
the root directory (`mountPoint = "/"`).  Each
entry in the list is an attribute set with the following fields:
`mountPoint`, `device`,
`fsType` (a file system type recognised by
`mount`), and `options`
(the mount options passed to `mount` using the
`-o` flag; defaults to `[ "defaults" ]`).

Instead of specifying `device`, you can also
specify a volume label (`label`) for file
systems that support it, such as ext2/ext3 (see `mke2fs -L`).

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "/".device = "/dev/hda1";
  "/data" = {
    device = "/dev/hda2";
    fsType = "ext3";
    options = [ "data=journal" ];
  };
  "/bigdisk".label = "bigdisk";
}
```

*Declared by:*

- [`nixos/modules/tasks/filesystems/overlayfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/overlayfs.nix)
- [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)
- [`nixos/modules/tasks/encrypted-devices.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/encrypted-devices.nix)
- [`nixos/modules/system/boot/stage-1.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/stage-1.nix)

## `fileSystems.<name>.autoFormat` {#opt-fileSystems._name_.autoFormat}

If the device does not currently contain a filesystem (as
determined by `blkid`), then automatically
format it with the filesystem type specified in
`fsType`.  Use with caution.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `fileSystems.<name>.autoResize` {#opt-fileSystems._name_.autoResize}

If set, the filesystem is grown to its maximum size before
being mounted. (This is typically the size of the containing
partition.) This is currently only supported for ext2/3/4
filesystems that are mounted during early boot.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `fileSystems.<name>.depends` {#opt-fileSystems._name_.depends}

List of paths that should be mounted before this one. This filesystem's
`device` and `mountPoint` are always
checked and do not need to be included explicitly. If a path is added
to this list, any other filesystem whose mount point is a parent of
the path will be mounted before this filesystem. The paths do not need
to actually be the `mountPoint` of some other filesystem.

This is useful for mounts which require keys and/or configuration files residing on another filesystem.

*Type:* list of string (with check: non-empty without trailing slash)

*Default:* `[ ]`

*Example:*

``` nix
[
  "/persist"
]
```

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `fileSystems.<name>.device` {#opt-fileSystems._name_.device}

The device as passed to `mount`.

This can be any of:

- a filename of a block special device such as `/dev/sdc3`
- a tag such as `UUID=fdd68895-c307-4549-8c9c-90e44c71f5b7`
- (for bind mounts only) the source path
- something else depending on the `fsType`. For example, `nfs` device may look like `knuth.cwi.nl:/dir`

This is called `device` in `mount(8)` and `fs_spec` in `fstab(5)`.

*Type:* null or string (with check: non-empty)

*Default:* `null`

*Example:* `"/dev/sda"`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `fileSystems.<name>.enable` {#opt-fileSystems._name_.enable}

Whether to enable the filesystem mount.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `fileSystems.<name>.encrypted.blkDev` {#opt-fileSystems._name_.encrypted.blkDev}

Location of the backing encrypted device.

*Type:* null or string

*Default:* `null`

*Example:* `"/dev/sda1"`

*Declared by:* [`nixos/modules/tasks/encrypted-devices.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/encrypted-devices.nix)

## `fileSystems.<name>.encrypted.enable` {#opt-fileSystems._name_.encrypted.enable}

The block device is backed by an encrypted one, adds this device as a initrd luks entry.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/encrypted-devices.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/encrypted-devices.nix)

## `fileSystems.<name>.encrypted.keyFile` {#opt-fileSystems._name_.encrypted.keyFile}

Path to a keyfile used to unlock the backing encrypted
device. When systemd stage 1 is not enabled, at the time
this keyfile is accessed, the `neededForBoot` filesystems
(see `utils.fsNeededForBoot`) will have been mounted under
`/mnt-root`, so the keyfile path should usually start with
"/mnt-root/". When systemd stage 1 is enabled,
`fsNeededForBoot` file systems will be mounted as needed
under `/sysroot`, and the keyfile will not be accessed until
its requisite mounts are done.

*Type:* null or string

*Default:* `null`

*Example:* `"/mnt-root/root/.swapkey"`

*Declared by:* [`nixos/modules/tasks/encrypted-devices.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/encrypted-devices.nix)

## `fileSystems.<name>.encrypted.label` {#opt-fileSystems._name_.encrypted.label}

Label of the unlocked encrypted device. Set `fileSystems.<name?>.device` to `/dev/mapper/<label>` to mount the unlocked device.

*Type:* null or string

*Default:* `null`

*Example:* `"rootfs"`

*Declared by:* [`nixos/modules/tasks/encrypted-devices.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/encrypted-devices.nix)

## `fileSystems.<name>.fsType` {#opt-fileSystems._name_.fsType}

Type of the file system.

This is the `fstype` passed to `-t` in the `mount(8)` command, and is called `fs_vfstype` in `fstab(5)`.

*Type:* string (with check: non-empty)

*Example:* `"ext3"`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `fileSystems.<name>.label` {#opt-fileSystems._name_.label}

Label of the device. This simply sets `device` to
`/dev/disk/by-label/${label}`. Note that devices will not
have a label unless they contain a filesystem which
supports labels, such as ext4 or fat32.

*Type:* null or string (with check: non-empty)

*Default:* `null`

*Example:* `"root-partition"`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `fileSystems.<name>.mountPoint` {#opt-fileSystems._name_.mountPoint}

Location where the file system will be mounted.

This is called `mountpoint` in `mount(8)` and `fs_file` in `fstab(5)`

*Type:* string (with check: non-empty without trailing slash)

*Default:* `"‹name›"`

*Example:* `"/mnt/usb"`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `fileSystems.<name>.neededForBoot` {#opt-fileSystems._name_.neededForBoot}

If set, this file system will be mounted in the initial ramdisk.
Note that the file system will always be mounted in the initial
ramdisk if its mount point is one of the following:
`/`, `/nix`, `/nix/store`, `/var`, `/var/log`, `/var/lib`, `/var/lib/nixos`, `/etc`, `/usr`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/stage-1.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/stage-1.nix)

## `fileSystems.<name>.noCheck` {#opt-fileSystems._name_.noCheck}

Disable running fsck on this filesystem.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `fileSystems.<name>.options` {#opt-fileSystems._name_.options}

Options used to mount the file system.

This is called `options` in `mount(8)` and `fs_mntops` in `fstab(5)`

Some options that can be used for all mounts are documented in `mount(8)` under `FILESYSTEM-INDEPENDENT MOUNT OPTIONS`.

Options that systemd understands are documented in `systemd.mount(5)` under `FSTAB`.

Each filesystem supports additional options, see the docs for that filesystem.

*Type:* non-empty (list of string (with check: non-empty))

*Default:*

``` nix
[
  "defaults"
]
```

*Example:*

``` nix
[
  "data=journal"
]
```

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `fileSystems.<name>.overlay.lowerdir` {#opt-fileSystems._name_.overlay.lowerdir}

The list of path(s) to the lowerdir(s).

To create a writable overlay, you MUST provide an `upperdir` and a
`workdir`.

You can create a read-only overlay when you provide multiple (at
least 2!) lowerdirs and neither an `upperdir` nor a `workdir`.

*Type:* null or (non-empty (list of (string or path in the Nix store)))

*Default:* `null`

*Declared by:* [`nixos/modules/tasks/filesystems/overlayfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/overlayfs.nix)

## `fileSystems.<name>.overlay.upperdir` {#opt-fileSystems._name_.overlay.upperdir}

The path to the upperdir.

If this is null, a read-only overlay is created using the lowerdir.

If the filesystem is `neededForBoot`, this will be prefixed with `/sysroot`,
unless `useStage1BaseDirectories` is set to `true`.

If you set this to some value you MUST also set `workdir`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/tasks/filesystems/overlayfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/overlayfs.nix)

## `fileSystems.<name>.overlay.useStage1BaseDirectories` {#opt-fileSystems._name_.overlay.useStage1BaseDirectories}

If enabled, `lowerdir`, `upperdir` and `workdir` will be prefixed with `/sysroot`.

Disabling this can be useful to create an overlay over directories which aren't on the real root.

Disabling this does not work with the scripted (i.e. non-systemd) initrd.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/tasks/filesystems/overlayfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/overlayfs.nix)

## `fileSystems.<name>.overlay.workdir` {#opt-fileSystems._name_.overlay.workdir}

The path to the workdir.

If the filesystem is `neededForBoot`, this will be prefixed with `/sysroot`,
unless `useStage1BaseDirectories` is set to `true`.

This MUST be set if you set `upperdir`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/tasks/filesystems/overlayfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/overlayfs.nix)

## `fileSystems.<name>.stratis.poolUuid` {#opt-fileSystems._name_.stratis.poolUuid}

UUID of the stratis pool that the fs is located in

This is only relevant if you are using [stratis](https://stratis-storage.github.io/).

*Type:* null or string

*Default:* `null`

*Example:* `"04c68063-90a5-4235-b9dd-6180098a20d9"`

*Declared by:* [`nixos/modules/tasks/filesystems.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems.nix)

## `gtk.iconCache.enable` {#opt-gtk.iconCache.enable}

Whether to build icon theme caches for GTK applications.

*Type:* boolean

*Default:* `config.services.xserver.enable`

*Declared by:* [`nixos/modules/config/gtk/gtk-icon-cache.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/gtk/gtk-icon-cache.nix)

## `lib` {#opt-lib}

This option allows modules to define helper functions, constants, etc.

*Type:* attribute set of (attribute set)

*Default:* `{ }`

*Declared by:* [`nixos/modules/misc/lib.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/lib.nix)

## `lix.buildMachines` {#opt-lix.buildMachines}

Lix TOML configuration for remote builders

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/config/lix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/lix-remote-build.nix)

## `lix.buildMachines.machines` {#opt-lix.buildMachines.machines}

This option lists the machines to be used if distributed builds are
enabled (see [`nix.distributedBuilds`](../../options/nix/index.md#opt-nix.distributedBuilds)).
Nix will perform derivations on those machines via SSH by copying the
inputs to the Nix store on the remote machine, starting the build,
then copying the output back to the local Nix store.

*Type:* attribute set of (open submodule of (TOML value))

*Default:* `{ }`

*Declared by:* [`nixos/modules/config/lix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/lix-remote-build.nix)

## `lix.buildMachines.machines.<name>.enable` {#opt-lix.buildMachines.machines._name_.enable}

Whether to enable this machine statically.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/lix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/lix-remote-build.nix)

## `lix.buildMachines.machines.<name>.jobs` {#opt-lix.buildMachines.machines._name_.jobs}

The maximum number of builds that Lix will execute in parallel on
the machine. Typically, this should be equal to the number of CPU
cores divided by the cores within the target machines configuration, i.e. `jobs * cores ~= cpu cores`

*Type:* 32 bit unsigned integer; between 0 and 4294967295 (both inclusive)

*Default:* `1`

*Declared by:* [`nixos/modules/config/lix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/lix-remote-build.nix)

## `lix.buildMachines.machines.<name>.mandatory-features` {#opt-lix.buildMachines.machines._name_.mandatory-features}

A list of *mandatory features*. A machine will only
be used to build a derivation if all the machine’s mandatory
features appear in the derivation’s `requiredSystemFeatures`
attribute.

*Type:* null or (list of string)

*Default:* `null`

*Example:*

``` nix
[
  "big-parallel"
]
```

*Declared by:* [`nixos/modules/config/lix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/lix-remote-build.nix)

## `lix.buildMachines.machines.<name>.speed-factor` {#opt-lix.buildMachines.machines._name_.speed-factor}

The “speed factor”, indicating the relative speed of the machine. If
there are multiple machines of the right type, Lix will prefer the
fastest, taking load into account.

*Type:* positive integer or floating point number, meaning \>0

*Default:* `1`

*Declared by:* [`nixos/modules/config/lix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/lix-remote-build.nix)

## `lix.buildMachines.machines.<name>.ssh-key` {#opt-lix.buildMachines.machines._name_.ssh-key}

The path to the SSH private key with which to authenticate on
the build machine. The private key must not have a passphrase.
If null, the building user (root on NixOS machines) must have an
appropriate ssh configuration to log in non-interactively.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/root/.ssh/id_buildhost_builduser"`

*Declared by:* [`nixos/modules/config/lix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/lix-remote-build.nix)

## `lix.buildMachines.machines.<name>.ssh-public-host-key` {#opt-lix.buildMachines.machines._name_.ssh-public-host-key}

The public host key of this builder.
If null, SSH will use its regular known-hosts file when connecting.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/config/lix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/lix-remote-build.nix)

## `lix.buildMachines.machines.<name>.supported-features` {#opt-lix.buildMachines.machines._name_.supported-features}

A list of *supported features*. If a derivation has
the `requiredSystemFeatures` attribute, then Lix will only schedule
the derivation on a machine that has the specified features. For
example, the attribute

``` nix
requiredSystemFeatures = [ "kvm" ];
```

will cause the build to be performed on a machine that has the `kvm`
feature.

*Type:* null or (list of string)

*Default:* `null`

*Example:*

``` nix
[
  "kvm"
  "big-parallel"
]
```

*Declared by:* [`nixos/modules/config/lix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/lix-remote-build.nix)

## `lix.buildMachines.machines.<name>.system-types` {#opt-lix.buildMachines.machines._name_.system-types}

A list of Nix platform type identifiers, such as
`x86_64-darwin`. It is possible for a machine to support multiple
platform types, e.g., `i686-linux` and `x86_64-linux`.

*Type:* null or (list of string)

*Default:* `null`

*Example:*

``` nix
[
  "x86_64-linux"
  "aarch64-linux"
]
```

*Declared by:* [`nixos/modules/config/lix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/lix-remote-build.nix)

## `lix.buildMachines.machines.<name>.uri` {#opt-lix.buildMachines.machines._name_.uri}

The URI of the remote store in the format
`ssh[-ng]://[username@]hostname[?port=<port>]`, e.g. `ssh://nix@mac` or `ssh://mac`.
If the ssh server is not listening on port 22 (e.g. port 1337 in this case)
the URI would be `ssh[-ng]://nix@mac?port=1337`. The hostname
may be an alias defined in your `~/.ssh/config`.

*Type:* string

*Example:* `"ssh-ng://andesite@andesite.lix.systems"`

*Declared by:* [`nixos/modules/config/lix-remote-build.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/lix-remote-build.nix)

## `location.latitude` {#opt-location.latitude}

Your current latitude, between
`-90.0` and `90.0`. Must be provided
along with longitude.

*Type:* floating point number

*Declared by:* [`nixos/modules/config/locale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/locale.nix)

## `location.longitude` {#opt-location.longitude}

Your current longitude, between
between `-180.0` and `180.0`. Must be
provided along with latitude.

*Type:* floating point number

*Declared by:* [`nixos/modules/config/locale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/locale.nix)

## `location.provider` {#opt-location.provider}

The location provider to use for determining your location. If set to
`manual` you must also provide latitude/longitude.

*Type:* one of "manual", "geoclue2"

*Default:* `"manual"`

*Declared by:* [`nixos/modules/config/locale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/locale.nix)

## `meta.maintainers` {#opt-meta.maintainers}

List of maintainers of each module.
This option should be defined at most once per module.

The option value is not a list of maintainers, but an attribute set that maps module file names to lists of maintainers.

*Type:* list of lib.maintainers

*Default:* `[ ]`

*Example:* `[ lib.maintainers.alice lib.maintainers.bob ]`

*Declared by:* [`lib/modules/generic/meta-maintainers.nix`](https://github.com/NixOS/nixpkgs/blob/master/lib/modules/generic/meta-maintainers.nix)

## `meta.teams` {#opt-meta.teams}

List of team maintainers of each module.
This option should be defined at most once per module.

*Type:* list of lib.teams

*Default:* `[ ]`

*Example:* `[ lib.teams.acme lib.teams.haskell ]`

*Declared by:* [`lib/modules/generic/meta-maintainers.nix`](https://github.com/NixOS/nixpkgs/blob/master/lib/modules/generic/meta-maintainers.nix)

## `nixops.enableDeprecatedAutoLuks` {#opt-nixops.enableDeprecatedAutoLuks}

Whether to enable the deprecated NixOps AutoLuks module.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/misc/nixops-autoluks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/nixops-autoluks.nix)

## `nixpkgs.buildPlatform` {#opt-nixpkgs.buildPlatform}

Specifies the platform on which NixOS should be built.
By default, NixOS is built on the system where it runs, but you can
change where it's built. Setting this option will cause NixOS to be
cross-compiled.

For instance, if you're doing distributed multi-platform deployment,
or if you're building machines, you can set this to match your
development system and/or build farm.

Ignored when `nixpkgs.pkgs` is set.

*Type:* string or (attribute set)

*Default:* `config.nixpkgs.hostPlatform`

*Example:*

``` nix
{
  system = "x86_64-linux";
}
```

*Declared by:* [`nixos/modules/misc/nixpkgs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/nixpkgs.nix)

## `nixpkgs.config` {#opt-nixpkgs.config}

Global configuration for Nixpkgs.
The complete list of [Nixpkgs configuration options](https://nixos.org/manual/nixpkgs/unstable/#sec-config-options-reference) is in the [Nixpkgs manual section on global configuration](https://nixos.org/manual/nixpkgs/unstable/#chap-packageconfig).

Ignored when [`nixpkgs.pkgs`](#opt-nixpkgs.pkgs) is set.

*Type:* nixpkgs config

*Default:* `{ }`

*Example:*

``` nix
{ allowBroken = true; allowUnfree = true; }
```

*Declared by:* [`nixos/modules/misc/nixpkgs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/nixpkgs.nix)

## `nixpkgs.crossSystem` {#opt-nixpkgs.crossSystem}

Systems with a recently generated `hardware-configuration.nix`
may instead specify *only* [`nixpkgs.buildPlatform`](#opt-nixpkgs.buildPlatform),
or fall back to removing the [`nixpkgs.hostPlatform`](#opt-nixpkgs.hostPlatform) line from the generated config.

Specifies the platform for which NixOS should be
built. Specify this only if it is different from
`nixpkgs.localSystem`, the platform
*on* which NixOS should be built. In other
words, specify this to cross-compile NixOS. Otherwise it
should be set as null, the default. See its description in the
Nixpkgs manual for more details.

Ignored when `nixpkgs.pkgs` or `hostPlatform` is set.

*Type:* null or (attribute set)

*Default:* `null`

*Example:*

``` nix
{
  system = "aarch64-linux";
}
```

*Declared by:* [`nixos/modules/misc/nixpkgs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/nixpkgs.nix)

## `nixpkgs.flake.setFlakeRegistry` {#opt-nixpkgs.flake.setFlakeRegistry}

Whether to pin nixpkgs in the system-wide flake registry (`/etc/nix/registry.json`) to the
store path of the sources of nixpkgs used to build the NixOS system.

This is on by default for NixOS configurations built with flakes.

This option makes `nix run nixpkgs#hello` reuse dependencies from the system, avoid
refetching nixpkgs, and have a consistent result every time.

Note that this option makes the NixOS closure depend on the nixpkgs sources, which may add
undesired closure size if the system will not have any nix commands run on it.

*Type:* boolean

*Default:* `"config.nixpkgs.flake.source != null"`

*Declared by:* [`nixos/modules/misc/nixpkgs-flake.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/nixpkgs-flake.nix)

## `nixpkgs.flake.setNixPath` {#opt-nixpkgs.flake.setNixPath}

Whether to set `NIX_PATH` to include `nixpkgs=flake:nixpkgs` such that `<nixpkgs>`
lookups receive the version of nixpkgs that the system was built with, in concert with
[`nixpkgs.flake.setFlakeRegistry`](#opt-nixpkgs.flake.setFlakeRegistry).

This is on by default for NixOS configurations built with flakes.

This makes `nix-build '<nixpkgs>' -A hello` work out of the box on flake systems.

Note that this option makes the NixOS closure depend on the nixpkgs sources, which may add
undesired closure size if the system will not have any nix commands run on it.

*Type:* boolean

*Default:* `"config.nixpkgs.flake.source != null"`

*Declared by:* [`nixos/modules/misc/nixpkgs-flake.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/nixpkgs-flake.nix)

## `nixpkgs.flake.source` {#opt-nixpkgs.flake.source}

The path to the nixpkgs sources used to build the system. This is automatically set up to be
the store path of the nixpkgs flake used to build the system if using
`nixpkgs.lib.nixosSystem`, and is otherwise null by default.

This can also be optionally set if the NixOS system is not built with a flake but still uses
pinned sources: set this to the store path for the nixpkgs sources used to build the system,
as may be obtained by `fetchTarball`, for example.

Note: the name of the store path must be "source" due to
[https://github.com/NixOS/nix/issues/7075](https://github.com/NixOS/nix/issues/7075).

*Type:* null or string or absolute path

*Default:* `"if (using nixpkgsFlake.lib.nixosSystem) then self.outPath else null"`

*Example:* `"fetchTarball { name = \"source\"; sha256 = \"sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=\"; url = \"https://github.com/nixos/nixpkgs/archive/somecommit.tar.gz\"; }"`

*Declared by:* [`nixos/modules/misc/nixpkgs-flake.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/nixpkgs-flake.nix)

## `nixpkgs.hostPlatform` {#opt-nixpkgs.hostPlatform}

Specifies the platform where the NixOS configuration will run.

To cross-compile, set also `nixpkgs.buildPlatform`.

Ignored when `nixpkgs.pkgs` is set.

*Type:* string or (attribute set)

*Example:*

``` nix
{
  system = "aarch64-linux";
}
```

*Declared by:* [`nixos/modules/misc/nixpkgs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/nixpkgs.nix)

## `nixpkgs.localSystem` {#opt-nixpkgs.localSystem}

Systems with a recently generated `hardware-configuration.nix`
do not need to specify this option, unless cross-compiling, in which case
you should set *only* [`nixpkgs.buildPlatform`](#opt-nixpkgs.buildPlatform).

If this is somehow not feasible, you may fall back to removing the
[`nixpkgs.hostPlatform`](#opt-nixpkgs.hostPlatform) line from the generated config and
use the old options.

Specifies the platform on which NixOS should be built. When
`nixpkgs.crossSystem` is unset, it also specifies
the platform *for* which NixOS should be
built.  If this option is unset, it defaults to the platform
type of the machine where evaluation happens. Specifying this
option is useful when doing distributed multi-platform
deployment, or when building virtual machines. See its
description in the Nixpkgs manual for more details.

Ignored when `nixpkgs.pkgs` or `hostPlatform` is set.

*Type:* attribute set

*Default:* `config.nixpkgs.system`

*Example:*

``` nix
{
  system = "aarch64-linux";
}
```

*Declared by:* [`nixos/modules/misc/nixpkgs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/nixpkgs.nix)

## `nixpkgs.overlays` {#opt-nixpkgs.overlays}

List of overlays to apply to Nixpkgs.
This option allows modifying the Nixpkgs package set accessed through the `pkgs` module argument.

For details, see the [Overlays chapter in the Nixpkgs manual](https://nixos.org/manual/nixpkgs/stable/#chap-overlays).

If the [`nixpkgs.pkgs`](#opt-nixpkgs.pkgs) option is set, overlays specified using `nixpkgs.overlays` will be applied after the overlays that were already included in `nixpkgs.pkgs`.

*Type:* list of (nixpkgs overlay)

*Default:* `[ ]`

*Example:*

``` nix
[
  (self: super: {
    openssh = super.openssh.override {
      hpnSupport = true;
      kerberos = self.libkrb5;
    };
  })
]
```

*Declared by:* [`nixos/modules/misc/nixpkgs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/nixpkgs.nix)

## `nixpkgs.pkgs` {#opt-nixpkgs.pkgs}

If set, the pkgs argument to all NixOS modules is the value of
this option, extended with `nixpkgs.overlays`, if
that is also set. Either `nixpkgs.crossSystem` or
`nixpkgs.localSystem` will be used in an assertion
to check that the NixOS and Nixpkgs architectures match. Any
other options in `nixpkgs.*`, notably `config`,
will be ignored.

If unset, the pkgs argument to all NixOS modules is determined
as shown in the default value for this option.

The default value imports the Nixpkgs source files
relative to the location of this NixOS module, because
NixOS and Nixpkgs are distributed together for consistency,
so the `nixos` in the default value is in fact a
relative path. The `config`, `overlays`,
`localSystem`, and `crossSystem` come
from this option's siblings.

This option can be used by applications like NixOps to increase
the performance of evaluation, or to create packages that depend
on a container that should be built with the exact same evaluation
of Nixpkgs, for example. Applications like this should set
their default value using `lib.mkDefault`, so
user-provided configuration can override it without using
`lib`.

Note that using a distinct version of Nixpkgs with NixOS may
be an unexpected source of problems. Use this option with care.

*Type:* An evaluation of Nixpkgs; the top level attribute set of packages

*Default:*

``` nix
import "${nixos}/.." {
  inherit (config.nixpkgs) config overlays localSystem crossSystem;
}
```

*Example:* `import <nixpkgs> {}`

*Declared by:* [`nixos/modules/misc/nixpkgs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/nixpkgs.nix)

## `nixpkgs.system` {#opt-nixpkgs.system}

This option does not need to be specified for NixOS configurations
with a recently generated `hardware-configuration.nix`.

Specifies the Nix platform type on which NixOS should be built.
It is better to specify `nixpkgs.localSystem` instead.

```
{
  nixpkgs.system = ..;
}
```

is the same as

```
{
  nixpkgs.localSystem.system = ..;
}
```

See `nixpkgs.localSystem` for more information.

Ignored when `nixpkgs.pkgs`, `nixpkgs.localSystem` or `nixpkgs.hostPlatform` is set.

*Type:* string

*Default:* Traditionally `builtins.currentSystem`, but unset when invoking NixOS through `lib.nixosSystem`.

*Example:* `"i686-linux"`

*Declared by:* [`nixos/modules/misc/nixpkgs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/nixpkgs.nix)

## `openstack.zfs.datasets` {#opt-openstack.zfs.datasets}

Datasets to create under the `tank` and `boot` zpools.

**NOTE:** This option is used only at image creation time, and
does not attempt to declaratively create or manage datasets
on an existing system.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/openstack-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/openstack-options.nix)

## `openstack.zfs.datasets.<name>.mount` {#opt-openstack.zfs.datasets._name_.mount}

Where to mount this dataset.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/virtualisation/openstack-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/openstack-options.nix)

## `openstack.zfs.datasets.<name>.properties` {#opt-openstack.zfs.datasets._name_.properties}

Properties to set on this dataset.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/openstack-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/openstack-options.nix)

## `powerManagement.bootCommands` {#opt-powerManagement.bootCommands}

Commands executed only once after initial boot.
These commands are executed before `powerUpCommands`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
"${pkgs.networkmanager}/bin/nmcli radio wifi on"
```

*Declared by:* [`nixos/modules/config/power-management.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/power-management.nix)

## `powerManagement.cpuFreqGovernor` {#opt-powerManagement.cpuFreqGovernor}

Configure the governor used to regulate the frequency of the
available CPUs. By default, the kernel configures the
performance governor, although this may be overwritten in your
hardware-configuration.nix file.

Often used values: "ondemand", "powersave", "performance"

*Type:* null or string

*Default:* `null`

*Example:* `"ondemand"`

*Declared by:* [`nixos/modules/tasks/cpu-freq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/cpu-freq.nix)

## `powerManagement.cpufreq.max` {#opt-powerManagement.cpufreq.max}

The maximum frequency the CPU will use.  Defaults to the maximum possible.

*Type:* null or (unsigned integer, meaning \>=0)

*Default:* `null`

*Example:* `2200000`

*Declared by:* [`nixos/modules/tasks/cpu-freq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/cpu-freq.nix)

## `powerManagement.cpufreq.min` {#opt-powerManagement.cpufreq.min}

The minimum frequency the CPU will use.

*Type:* null or (unsigned integer, meaning \>=0)

*Default:* `null`

*Example:* `800000`

*Declared by:* [`nixos/modules/tasks/cpu-freq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/cpu-freq.nix)

## `powerManagement.enable` {#opt-powerManagement.enable}

Whether to enable power management.  This includes support
for suspend-to-RAM and powersave features on laptops.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/power-management.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/power-management.nix)

## `powerManagement.powerDownCommands` {#opt-powerManagement.powerDownCommands}

Commands executed when the machine powers down.  That is,
they're executed both when the system shuts down and when
it goes to suspend or hibernation.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
"${pkgs.hdparm}/sbin/hdparm -B 255 /dev/sda"
```

*Declared by:* [`nixos/modules/config/power-management.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/power-management.nix)

## `powerManagement.powerUpCommands` {#opt-powerManagement.powerUpCommands}

Commands executed when the machine powers up.  That is,
they're executed both when the system first boots and when
it resumes from suspend or hibernation.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
"${pkgs.powertop}/bin/powertop --auto-tune"
```

*Declared by:* [`nixos/modules/config/power-management.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/power-management.nix)

## `powerManagement.powertop.enable` {#opt-powerManagement.powertop.enable}

Whether to enable powertop auto tuning on startup.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/tasks/powertop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/powertop.nix)

## `powerManagement.powertop.postStart` {#opt-powerManagement.powertop.postStart}

Shell commands executed after `powertop` is started.

This can be used to workaround problematic configurations. For example,
you can retrigger an `udev` rule to disable power saving on unsupported
USB devices:

```
services.udev.extraRules = '''
  # disable USB auto suspend for Logitech, Inc. G PRO Gaming Mouse
  ACTION=="bind", SUBSYSTEM=="usb", ATTR{idVendor}=="046d", ATTR{idProduct}=="c08c", TEST=="power/control", ATTR{power/control}="on"
''';
```

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  ''${lib.getExe' config.systemd.package "udevadm"} trigger -c bind -s usb -a idVendor=046d -a idProduct=c08c
''
```

*Declared by:* [`nixos/modules/tasks/powertop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/powertop.nix)

## `powerManagement.powertop.preStart` {#opt-powerManagement.powertop.preStart}

Shell commands executed before `powertop` is started.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/tasks/powertop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/powertop.nix)

## `powerManagement.resumeCommands` {#opt-powerManagement.resumeCommands}

Commands executed after the system resumes from suspend-to-RAM.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
"${pkgs.util-linux}/bin/rfkill unblock all"
```

*Declared by:* [`nixos/modules/config/power-management.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/power-management.nix)

## `powerManagement.scsiLinkPolicy` {#opt-powerManagement.scsiLinkPolicy}

SCSI link power management policy. The kernel default is
"max\_performance".

"med\_power\_with\_dipm" is supported by kernel versions
4.15 and newer.

*Type:* null or one of "min\_power", "max\_performance", "medium\_power", "med\_power\_with\_dipm"

*Default:* `null`

*Declared by:* [`nixos/modules/tasks/scsi-link-power-management.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/scsi-link-power-management.nix)

## `qt.enable` {#opt-qt.enable}

Whether to enable Qt configuration, including theming.

Enabling this option is necessary for Qt plugins to work in the
installed profiles (e.g.: `nix-env -i` or `environment.systemPackages`).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/config/qt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/qt.nix)

## `qt.platformTheme` {#opt-qt.platformTheme}

Selects the platform theme to use for Qt applications.

The options are

- `gnome`: Use GNOME theme with [qgnomeplatform](https://github.com/FedoraQt/QGnomePlatform)
- `kde`: Use Qt settings from Plasma.
- `lxqt`: Use LXQt style set using the [lxqt-config-appearance](https://github.com/lxqt/lxqt-config)
  application.
- `qt5ct`: Use Qt style set using the [qt5ct](https://sourceforge.net/projects/qt5ct/)
  and [qt6ct](https://github.com/trialuser02/qt6ct) applications.

*Type:* null or one of "gnome", "kde", "lxqt", "qt5ct"

*Default:* `null`

*Example:* `"gnome"`

*Related packages:*

- [`pkgs.qgnomeplatform`](https://search.nixos.org/packages?show=qgnomeplatform&sort=relevance&query=qgnomeplatform)
- [`pkgs.qgnomeplatform-qt6`](https://search.nixos.org/packages?show=qgnomeplatform-qt6&sort=relevance&query=qgnomeplatform-qt6)
- [`pkgs.libsForQt5.qt5ct`](https://search.nixos.org/packages?show=libsForQt5.qt5ct&sort=relevance&query=libsForQt5.qt5ct)
- [`pkgs.libsForQt5.qtstyleplugins`](https://search.nixos.org/packages?show=libsForQt5.qtstyleplugins&sort=relevance&query=libsForQt5.qtstyleplugins)
- [`pkgs.kdePackages.plasma-integration`](https://search.nixos.org/packages?show=kdePackages.plasma-integration&sort=relevance&query=kdePackages.plasma-integration)
- [`pkgs.kdePackages.systemsettings`](https://search.nixos.org/packages?show=kdePackages.systemsettings&sort=relevance&query=kdePackages.systemsettings)
- [`pkgs.lxqt.lxqt-config`](https://search.nixos.org/packages?show=lxqt.lxqt-config&sort=relevance&query=lxqt.lxqt-config)
- [`pkgs.lxqt.lxqt-qtplugin`](https://search.nixos.org/packages?show=lxqt.lxqt-qtplugin&sort=relevance&query=lxqt.lxqt-qtplugin)
- [`pkgs.qt6Packages.qt6ct`](https://search.nixos.org/packages?show=qt6Packages.qt6ct&sort=relevance&query=qt6Packages.qt6ct)

*Declared by:* [`nixos/modules/config/qt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/qt.nix)

## `qt.style` {#opt-qt.style}

Selects the style to use for Qt applications.

The options are

- `adwaita`, `adwaita-dark`, `adwaita-highcontrast`, `adawaita-highcontrastinverse`:
  Use Adwaita Qt style with
  [adwaita](https://github.com/FedoraQt/adwaita-qt)
- `breeze`: Use the Breeze style from
  [breeze](https://github.com/KDE/breeze)
- `bb10bright`, `bb10dark`, `cleanlooks`, `motif`, `plastique`:
  Use styles from
  [qtstyleplugins](https://github.com/qt/qtstyleplugins)
- `kvantum`: Use styles from
  [kvantum](https://github.com/tsujan/Kvantum)

*Type:* null or one of "adwaita", "adwaita-dark", "adwaita-highcontrast", "adwaita-highcontrastinverse", "bb10bright", "bb10dark", "breeze", "cde", "cleanlooks", "kvantum", "motif", "plastique"

*Default:* `null`

*Example:* `"adwaita"`

*Related packages:*

- [`pkgs.adwaita-qt`](https://search.nixos.org/packages?show=adwaita-qt&sort=relevance&query=adwaita-qt)
- [`pkgs.adwaita-qt6`](https://search.nixos.org/packages?show=adwaita-qt6&sort=relevance&query=adwaita-qt6)
- [`pkgs.libsForQt5.qtstyleplugin-kvantum`](https://search.nixos.org/packages?show=libsForQt5.qtstyleplugin-kvantum&sort=relevance&query=libsForQt5.qtstyleplugin-kvantum)
- [`pkgs.libsForQt5.qtstyleplugins`](https://search.nixos.org/packages?show=libsForQt5.qtstyleplugins&sort=relevance&query=libsForQt5.qtstyleplugins)
- [`pkgs.qt6Packages.qtstyleplugin-kvantum`](https://search.nixos.org/packages?show=qt6Packages.qtstyleplugin-kvantum&sort=relevance&query=qt6Packages.qtstyleplugin-kvantum)

*Declared by:* [`nixos/modules/config/qt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/qt.nix)

## `specialisation` {#opt-specialisation}

Additional configurations to build. If
`inheritParentConfig` is true, the system
will be based on the overall system configuration.

To switch to a specialised configuration
(e.g. `fewJobsManyCores`) at runtime, run:

```
sudo /run/current-system/specialisation/fewJobsManyCores/bin/switch-to-configuration test
```

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:* `{ fewJobsManyCores.configuration = { nix.settings = { core = 0; max-jobs = 1; }; }; }`

*Declared by:* [`nixos/modules/system/activation/specialisation.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/specialisation.nix)

## `specialisation.<name>.configuration` {#opt-specialisation._name_.configuration}

Arbitrary NixOS configuration.

Anything you can add to a normal NixOS configuration, you can add
here, including imports and config values, although nested
specialisations will be ignored.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/activation/specialisation.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/specialisation.nix)

## `specialisation.<name>.inheritParentConfig` {#opt-specialisation._name_.inheritParentConfig}

Include the entire system's configuration. Set to false to make a completely differently configured system.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/activation/specialisation.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/activation/specialisation.nix)

## `swapDevices` {#opt-swapDevices}

The swap devices and swap files.  These must have been
initialised using `mkswap`.  Each element
should be an attribute set specifying either the path of the
swap device or file (`device`) or the label
of the swap device (`label`, see
`mkswap -L`).  Using a label is
recommended.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    device = "/dev/hda7";
  }
  {
    device = "/var/swapfile";
  }
  {
    label = "bigswap";
  }
]
```

*Declared by:*

- [`nixos/modules/tasks/encrypted-devices.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/encrypted-devices.nix)
- [`nixos/modules/config/swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/swap.nix)

## `swapDevices.*.device` {#opt-swapDevices._.device}

Path of the device or swap file.

*Type:* non-empty string

*Example:* `"/dev/sda3"`

*Declared by:* [`nixos/modules/config/swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/swap.nix)

## `swapDevices.*.discardPolicy` {#opt-swapDevices._.discardPolicy}

Specify the discard policy for the swap device. If "once", then the
whole swap space is discarded at swapon invocation. If "pages",
asynchronous discard on freed pages is performed, before returning to
the available pages pool. With "both", both policies are activated.
See `swapon(8)` for more information.

*Type:* null or one of "once", "pages", "both"

*Default:* `null`

*Example:* `"once"`

*Declared by:* [`nixos/modules/config/swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/swap.nix)

## `swapDevices.*.encrypted.blkDev` {#opt-swapDevices._.encrypted.blkDev}

Location of the backing encrypted device.

*Type:* null or string

*Default:* `null`

*Example:* `"/dev/sda1"`

*Declared by:* [`nixos/modules/tasks/encrypted-devices.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/encrypted-devices.nix)

## `swapDevices.*.encrypted.enable` {#opt-swapDevices._.encrypted.enable}

The block device is backed by an encrypted one, adds this device as a initrd luks entry.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/encrypted-devices.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/encrypted-devices.nix)

## `swapDevices.*.encrypted.keyFile` {#opt-swapDevices._.encrypted.keyFile}

Path to a keyfile used to unlock the backing encrypted
device. When systemd stage 1 is not enabled, at the time
this keyfile is accessed, the `neededForBoot` filesystems
(see `utils.fsNeededForBoot`) will have been mounted under
`/mnt-root`, so the keyfile path should usually start with
"/mnt-root/". When systemd stage 1 is enabled,
`fsNeededForBoot` file systems will be mounted as needed
under `/sysroot`, and the keyfile will not be accessed until
its requisite mounts are done.

*Type:* null or string

*Default:* `null`

*Example:* `"/mnt-root/root/.swapkey"`

*Declared by:* [`nixos/modules/tasks/encrypted-devices.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/encrypted-devices.nix)

## `swapDevices.*.encrypted.label` {#opt-swapDevices._.encrypted.label}

Label of the unlocked encrypted device. Set `fileSystems.<name?>.device` to `/dev/mapper/<label>` to mount the unlocked device.

*Type:* null or string

*Default:* `null`

*Example:* `"rootfs"`

*Declared by:* [`nixos/modules/tasks/encrypted-devices.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/encrypted-devices.nix)

## `swapDevices.*.label` {#opt-swapDevices._.label}

Label of the device.  Can be used instead of `device`.

*Type:* string

*Example:* `"swap"`

*Declared by:* [`nixos/modules/config/swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/swap.nix)

## `swapDevices.*.options` {#opt-swapDevices._.options}

Options used to mount the swap.

*Type:* list of non-empty string

*Default:*

``` nix
[
  "defaults"
]
```

*Example:*

``` nix
[
  "nofail"
]
```

*Declared by:* [`nixos/modules/config/swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/swap.nix)

## `swapDevices.*.priority` {#opt-swapDevices._.priority}

Specify the priority of the swap device. Priority is a value between 0 and 32767.
Higher numbers indicate higher priority.
null lets the kernel choose a priority, which will show up as a negative value.

*Type:* null or signed integer

*Default:* `null`

*Example:* `2048`

*Declared by:* [`nixos/modules/config/swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/swap.nix)

## `swapDevices.*.randomEncryption` {#opt-swapDevices._.randomEncryption}

Encrypt swap device with a random key. This way you won't have a persistent swap device.

HINT: run "cryptsetup benchmark" to test cipher performance on your machine.

WARNING: Don't try to hibernate when you have at least one swap partition with
this option enabled! We have no way to set the partition into which hibernation image
is saved, so if your image ends up on an encrypted one you would lose it!

WARNING #2: Do not use /dev/disk/by-uuid/… or /dev/disk/by-label/… as your swap device
when using randomEncryption as the UUIDs and labels will get erased on every boot when
the partition is encrypted. Best to use /dev/disk/by-partuuid/…

*Type:* (submodule) or boolean convertible to it

*Default:* `false`

*Example:*

``` nix
{
  cipher = "serpent-xts-plain64";
  enable = true;
  source = "/dev/random";
}
```

*Declared by:* [`nixos/modules/config/swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/swap.nix)

## `swapDevices.*.randomEncryption.allowDiscards` {#opt-swapDevices._.randomEncryption.allowDiscards}

Whether to allow TRIM requests to the underlying device. This option
has security implications; please read the LUKS documentation before
activating it.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/swap.nix)

## `swapDevices.*.randomEncryption.cipher` {#opt-swapDevices._.randomEncryption.cipher}

Use specified cipher for randomEncryption.

Hint: Run "cryptsetup benchmark" to see which one is fastest on your machine.

*Type:* string

*Default:* `"aes-xts-plain64"`

*Example:* `"serpent-xts-plain64"`

*Declared by:* [`nixos/modules/config/swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/swap.nix)

## `swapDevices.*.randomEncryption.enable` {#opt-swapDevices._.randomEncryption.enable}

Encrypt swap device with a random key. This way you won't have a persistent swap device.

WARNING: Don't try to hibernate when you have at least one swap partition with
this option enabled! We have no way to set the partition into which hibernation image
is saved, so if your image ends up on an encrypted one you would lose it!

WARNING #2: Do not use /dev/disk/by-uuid/… or /dev/disk/by-label/… as your swap device
when using randomEncryption as the UUIDs and labels will get erased on every boot when
the partition is encrypted. Best to use /dev/disk/by-partuuid/…

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/swap.nix)

## `swapDevices.*.randomEncryption.keySize` {#opt-swapDevices._.randomEncryption.keySize}

Set the encryption key size for the plain device.

If not specified, the amount of data to read from `source` will be
determined by cryptsetup.

See `cryptsetup-open(8)` for details.

*Type:* null or signed integer

*Default:* `null`

*Example:* `"512"`

*Declared by:* [`nixos/modules/config/swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/swap.nix)

## `swapDevices.*.randomEncryption.sectorSize` {#opt-swapDevices._.randomEncryption.sectorSize}

Set the sector size for the plain encrypted device type.

If not specified, the default sector size is determined from the
underlying block device.

See `cryptsetup-open(8)` for details.

*Type:* null or signed integer

*Default:* `null`

*Example:* `"4096"`

*Declared by:* [`nixos/modules/config/swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/swap.nix)

## `swapDevices.*.randomEncryption.source` {#opt-swapDevices._.randomEncryption.source}

Define the source of randomness to obtain a random key for encryption.

*Type:* string

*Default:* `"/dev/urandom"`

*Example:* `"/dev/random"`

*Declared by:* [`nixos/modules/config/swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/swap.nix)

## `swapDevices.*.size` {#opt-swapDevices._.size}

If this option is set, ‘device’ is interpreted as the
path of a swapfile that will be created automatically
with the indicated size in MiB (1024×1024 bytes).

*Type:* null or signed integer

*Default:* `null`

*Example:* `2048`

*Declared by:* [`nixos/modules/config/swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/swap.nix)

## `time.hardwareClockInLocalTime` {#opt-time.hardwareClockInLocalTime}

If set, keep the hardware clock in local time instead of UTC.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/locale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/locale.nix)

## `time.timeZone` {#opt-time.timeZone}

The time zone used when displaying times and dates. See [https://en.wikipedia.org/wiki/List\_of\_tz\_database\_time\_zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)
for a comprehensive list of possible values for this setting.

If null, the timezone will default to UTC and can be set imperatively
using timedatectl.

*Type:* null or string without spaces

*Default:* `null`

*Example:* `"America/New_York"`

*Declared by:* [`nixos/modules/config/locale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/locale.nix)

## `zramSwap.algorithm` {#opt-zramSwap.algorithm}

Compression algorithm. `lzo` has good compression,
but is slow. `lz4` has bad compression, but is fast.
`zstd` is both good compression and fast, but requires newer kernel.
You can check what other algorithms are supported by your zram device with
`cat /sys/class/block/zram*/comp_algorithm`

*Type:* one of "842", "lzo", "lzo-rle", "lz4", "lz4hc", "zstd" or string

*Default:* `"zstd"`

*Example:* `"lz4"`

*Declared by:* [`nixos/modules/config/zram.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/zram.nix)

## `zramSwap.enable` {#opt-zramSwap.enable}

Enable in-memory compressed devices and swap space provided by the zram
kernel module.
See [
https://www.kernel.org/doc/Documentation/blockdev/zram.txt
](https://www.kernel.org/doc/Documentation/blockdev/zram.txt).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/zram.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/zram.nix)

## `zramSwap.memoryMax` {#opt-zramSwap.memoryMax}

Maximum total amount of memory (in bytes) that can be stored in the zram
swap devices. If set, the smaller one of this option and memoryPercent would
be used.
This doesn't define how much memory will be used by the zram swap devices.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/config/zram.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/zram.nix)

## `zramSwap.memoryPercent` {#opt-zramSwap.memoryPercent}

Maximum total amount of memory that can be stored in the zram swap devices
(as a percentage of your total memory). Defaults to 1/2 of your total
RAM. Run `zramctl` to check how good memory is compressed.
This doesn't define how much memory will be used by the zram swap devices.

*Type:* positive integer, meaning \>0

*Default:* `50`

*Declared by:* [`nixos/modules/config/zram.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/zram.nix)

## `zramSwap.priority` {#opt-zramSwap.priority}

Priority of the zram swap devices. It should be a number higher than
the priority of your disk-based swap devices (so that the system will
fill the zram swap devices before falling back to disk swap).

*Type:* signed integer

*Default:* `5`

*Declared by:* [`nixos/modules/config/zram.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/zram.nix)

## `zramSwap.swapDevices` {#opt-zramSwap.swapDevices}

Number of zram devices to be used as swap, recommended is 1.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/config/zram.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/zram.nix)

## `zramSwap.writebackDevice` {#opt-zramSwap.writebackDevice}

Write incompressible pages to this device,
as there's no gain from keeping them in RAM.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/dev/zvol/tarta-zoot/swap-writeback"`

*Declared by:* [`nixos/modules/config/zram.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/zram.nix)
