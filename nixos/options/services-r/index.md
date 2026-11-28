# services (R) {#sec-options-services-r}

## `services.r53-ddns.domain` {#opt-services.r53-ddns.domain}

The name of your domain in Route53

*Type:* string

*Declared by:* [`nixos/modules/services/networking/r53-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/r53-ddns.nix)

## `services.r53-ddns.enable` {#opt-services.r53-ddns.enable}

Whether to enable r53-ddyns.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/r53-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/r53-ddns.nix)

## `services.r53-ddns.environmentFile` {#opt-services.r53-ddns.environmentFile}

File containing the AWS\_ACCESS\_KEY\_ID and AWS\_SECRET\_ACCESS\_KEY
in the format of an EnvironmentFile as described by `systemd.exec(5)`

*Type:* string

*Declared by:* [`nixos/modules/services/networking/r53-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/r53-ddns.nix)

## `services.r53-ddns.hostname` {#opt-services.r53-ddns.hostname}

Manually specify the hostname. Otherwise the tool will try to use the name
returned by the OS (Call to gethostname)

*Type:* string

*Declared by:* [`nixos/modules/services/networking/r53-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/r53-ddns.nix)

## `services.r53-ddns.interval` {#opt-services.r53-ddns.interval}

How often to update the entry

*Type:* string

*Default:* `"15min"`

*Declared by:* [`nixos/modules/services/networking/r53-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/r53-ddns.nix)

## `services.r53-ddns.ttl` {#opt-services.r53-ddns.ttl}

The TTL for the generated record

*Type:* signed integer

*Declared by:* [`nixos/modules/services/networking/r53-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/r53-ddns.nix)

## `services.r53-ddns.zoneID` {#opt-services.r53-ddns.zoneID}

The ID of your zone in Route53

*Type:* string

*Declared by:* [`nixos/modules/services/networking/r53-ddns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/r53-ddns.nix)

## `services.rabbitmq.config` {#opt-services.rabbitmq.config}

Verbatim advanced configuration file contents using the Erlang syntax.
This is also known as the `advanced.config` file or the old config format.

`configItems` is preferred whenever possible. However, nested
data structures can only be expressed properly using the `config` option.

The contents of this option will be merged into the `configItems`
by RabbitMQ at runtime to form the final configuration.

See the second table on [https://www.rabbitmq.com/configure.html#config-items](https://www.rabbitmq.com/configure.html#config-items)
For the distinct formats, see [https://www.rabbitmq.com/configure.html#config-file-formats](https://www.rabbitmq.com/configure.html#config-file-formats)

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/amqp/rabbitmq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/amqp/rabbitmq.nix)

## `services.rabbitmq.configItems` {#opt-services.rabbitmq.configItems}

Configuration options in RabbitMQ's new config file format,
which is a simple key-value format that can not express nested
data structures. This is known as the `rabbitmq.conf` file,
although outside NixOS that filename may have Erlang syntax, particularly
prior to RabbitMQ 3.7.0.

If you do need to express nested data structures, you can use
`config` option. Configuration from `config`
will be merged into these options by RabbitMQ at runtime to
form the final configuration.

See [https://www.rabbitmq.com/configure.html#config-items](https://www.rabbitmq.com/configure.html#config-items)
For the distinct formats, see [https://www.rabbitmq.com/configure.html#config-file-formats](https://www.rabbitmq.com/configure.html#config-file-formats)

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  "auth_backends.1.authn" = "rabbit_auth_backend_ldap";
  "auth_backends.1.authz" = "rabbit_auth_backend_internal";
}
```

*Declared by:* [`nixos/modules/services/amqp/rabbitmq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/amqp/rabbitmq.nix)

## `services.rabbitmq.dataDir` {#opt-services.rabbitmq.dataDir}

Data directory for rabbitmq.

*Type:* absolute path

*Default:* `"/var/lib/rabbitmq"`

*Declared by:* [`nixos/modules/services/amqp/rabbitmq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/amqp/rabbitmq.nix)

## `services.rabbitmq.enable` {#opt-services.rabbitmq.enable}

Whether to enable the RabbitMQ server, an Advanced Message
Queuing Protocol (AMQP) broker.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/amqp/rabbitmq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/amqp/rabbitmq.nix)

## `services.rabbitmq.listenAddress` {#opt-services.rabbitmq.listenAddress}

IP address on which RabbitMQ will listen for AMQP
connections.  Set to the empty string to listen on all
interfaces.  Note that RabbitMQ creates a user named
`guest` with password
`guest` by default, so you should delete
this user if you intend to allow external access.

Together with 'port' setting it's mostly an alias for
configItems."listeners.tcp.1" and it's left for backwards
compatibility with previous version of this module.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `""`

*Declared by:* [`nixos/modules/services/amqp/rabbitmq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/amqp/rabbitmq.nix)

## `services.rabbitmq.managementPlugin.enable` {#opt-services.rabbitmq.managementPlugin.enable}

Whether to enable the management plugin.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/amqp/rabbitmq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/amqp/rabbitmq.nix)

## `services.rabbitmq.managementPlugin.port` {#opt-services.rabbitmq.managementPlugin.port}

On which port to run the management plugin

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `15672`

*Declared by:* [`nixos/modules/services/amqp/rabbitmq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/amqp/rabbitmq.nix)

## `services.rabbitmq.package` {#opt-services.rabbitmq.package}

The rabbitmq-server package to use.

*Type:* package

*Default:* `pkgs.rabbitmq-server`

*Declared by:* [`nixos/modules/services/amqp/rabbitmq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/amqp/rabbitmq.nix)

## `services.rabbitmq.pluginDirs` {#opt-services.rabbitmq.pluginDirs}

The list of directories containing external plugins

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/amqp/rabbitmq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/amqp/rabbitmq.nix)

## `services.rabbitmq.plugins` {#opt-services.rabbitmq.plugins}

The names of plugins to enable

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/amqp/rabbitmq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/amqp/rabbitmq.nix)

## `services.rabbitmq.port` {#opt-services.rabbitmq.port}

Port on which RabbitMQ will listen for AMQP connections.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5672`

*Declared by:* [`nixos/modules/services/amqp/rabbitmq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/amqp/rabbitmq.nix)

## `services.rabbitmq.unsafeCookie` {#opt-services.rabbitmq.unsafeCookie}

Erlang cookie is a string of arbitrary length which must
be the same for several nodes to be allowed to communicate.
Leave empty to generate automatically.

Setting the cookie via this option exposes the cookie to the store, which
is not recommended for security reasons.
Only use this option in an isolated non-production environment such as
NixOS VM tests.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/amqp/rabbitmq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/amqp/rabbitmq.nix)

## `services.radarr.dataDir` {#opt-services.radarr.dataDir}

The directory where Radarr stores its data files.

*Type:* string

*Default:* `"/var/lib/radarr/.config/Radarr"`

*Declared by:* [`nixos/modules/services/misc/servarr/radarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/radarr.nix)

## `services.radarr.enable` {#opt-services.radarr.enable}

Whether to enable Radarr, a UsetNet/BitTorrent movie downloader.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/servarr/radarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/radarr.nix)

## `services.radarr.environmentFiles` {#opt-services.radarr.environmentFiles}

Environment file to pass secret configuration values.
Each line must follow the `RADARR__SECTION__KEY=value` pattern.
Please consult the documentation at the [wiki](https://wiki.servarr.com/useful-tools#using-environment-variables-for-config).

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/servarr/radarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/radarr.nix)

## `services.radarr.group` {#opt-services.radarr.group}

Group under which Radarr runs.

*Type:* string

*Default:* `"radarr"`

*Declared by:* [`nixos/modules/services/misc/servarr/radarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/radarr.nix)

## `services.radarr.openFirewall` {#opt-services.radarr.openFirewall}

Open ports in the firewall for the Radarr web interface.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/servarr/radarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/radarr.nix)

## `services.radarr.package` {#opt-services.radarr.package}

The radarr package to use.

*Type:* package

*Default:* `pkgs.radarr`

*Declared by:* [`nixos/modules/services/misc/servarr/radarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/radarr.nix)

## `services.radarr.settings` {#opt-services.radarr.settings}

Attribute set of arbitrary config options.
Please consult the documentation at the [wiki](https://wiki.servarr.com/useful-tools#using-environment-variables-for-config).

WARNING: this configuration is stored in the world-readable Nix store!
For secrets use [services (R)](#opt-services.radarr.environmentFiles).

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  update.mechanism = "internal";
  server = {
    urlbase = "localhost";
    port = 7878;
    bindaddress = "*";
  };
}
```

*Declared by:* [`nixos/modules/services/misc/servarr/radarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/radarr.nix)

## `services.radarr.settings.log.analyticsEnabled` {#opt-services.radarr.settings.log.analyticsEnabled}

Send Anonymous Usage Data

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/servarr/radarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/radarr.nix)

## `services.radarr.settings.server.port` {#opt-services.radarr.settings.server.port}

Port Number

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `7878`

*Declared by:* [`nixos/modules/services/misc/servarr/radarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/radarr.nix)

## `services.radarr.settings.update.automatically` {#opt-services.radarr.settings.update.automatically}

Automatically download and install updates.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/servarr/radarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/radarr.nix)

## `services.radarr.settings.update.mechanism` {#opt-services.radarr.settings.update.mechanism}

which update mechanism to use

*Type:* null or one of "external", "builtIn", "script"

*Default:* `"external"`

*Declared by:* [`nixos/modules/services/misc/servarr/radarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/radarr.nix)

## `services.radarr.user` {#opt-services.radarr.user}

User account under which Radarr runs.

*Type:* string

*Default:* `"radarr"`

*Declared by:* [`nixos/modules/services/misc/servarr/radarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/radarr.nix)

## `services.radicale.config` {#opt-services.radicale.config}

Radicale configuration, this will set the service
configuration file.
This option is mutually exclusive with `settings`.
This option is deprecated.  Use `settings` instead.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/radicale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/radicale.nix)

## `services.radicale.enable` {#opt-services.radicale.enable}

Whether to enable Radicale CalDAV and CardDAV server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/radicale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/radicale.nix)

## `services.radicale.extraArgs` {#opt-services.radicale.extraArgs}

Extra arguments passed to the Radicale daemon.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/radicale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/radicale.nix)

## `services.radicale.group` {#opt-services.radicale.group}

Group under which Radicale runs.

*Type:* string

*Default:* `"radicale"`

*Declared by:* [`nixos/modules/services/networking/radicale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/radicale.nix)

## `services.radicale.package` {#opt-services.radicale.package}

Radicale package to use.

*Type:* package

*Default:* `pkgs.radicale`

*Declared by:* [`nixos/modules/services/networking/radicale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/radicale.nix)

## `services.radicale.rights` {#opt-services.radicale.rights}

Configuration for Radicale's rights file. See
[https://radicale.org/v3.html#authentication-and-rights](https://radicale.org/v3.html#authentication-and-rights).
This option only works in conjunction with `settings`.
Setting this will also set `settings.rights.type` and
`settings.rights.file` to appropriate values.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string) or a non-empty list of them)

*Default:* `{ }`

*Example:*

``` nix
root = {
  user = ".+";
  collection = "";
  permissions = "R";
};
principal = {
  user = ".+";
  collection = "{user}";
  permissions = "RW";
};
calendars = {
  user = ".+";
  collection = "{user}/[^/]+";
  permissions = "rw";
};
```

*Declared by:* [`nixos/modules/services/networking/radicale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/radicale.nix)

## `services.radicale.settings` {#opt-services.radicale.settings}

Configuration for Radicale. See
[https://radicale.org/v3.html#configuration](https://radicale.org/v3.html#configuration).
This option is mutually exclusive with `config`.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string) or a non-empty list of them)

*Default:* `{ }`

*Example:*

``` nix
server = {
  hosts = [ "0.0.0.0:5232" "[::]:5232" ];
};
auth = {
  type = "htpasswd";
  htpasswd_filename = "/etc/radicale/users";
  htpasswd_encryption = "bcrypt";
};
storage = {
  filesystem_folder = "/var/lib/radicale/collections";
};
```

*Declared by:* [`nixos/modules/services/networking/radicale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/radicale.nix)

## `services.radicale.user` {#opt-services.radicale.user}

User account under which Radicale runs.

*Type:* string

*Default:* `"radicale"`

*Declared by:* [`nixos/modules/services/networking/radicale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/radicale.nix)

## `services.radicle.checkConfig` {#opt-services.radicle.checkConfig}

Whether to enable checking the `config.json` file resulting from [`services.radicle.settings`](#opt-services.radicle.settings).

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.ci.adapters.native.instances` {#opt-services.radicle.ci.adapters.native.instances}

radicle-native-ci adapter instances.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/adapters/native.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/adapters/native.nix)

## `services.radicle.ci.adapters.native.instances.<name>.enable` {#opt-services.radicle.ci.adapters.native.instances._name_.enable}

Whether to enable this radicle-native-ci instance.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/adapters/native.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/adapters/native.nix)

## `services.radicle.ci.adapters.native.instances.<name>.name` {#opt-services.radicle.ci.adapters.native.instances._name_.name}

Adapter name that is used in the radicle-ci-broker configuration.
Defaults to the attribute name.

*Type:* string

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/adapters/native.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/adapters/native.nix)

## `services.radicle.ci.adapters.native.instances.<name>.package` {#opt-services.radicle.ci.adapters.native.instances._name_.package}

The radicle-native-ci package to use.

*Type:* package

*Default:* `pkgs.radicle-native-ci`

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/adapters/native.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/adapters/native.nix)

## `services.radicle.ci.adapters.native.instances.<name>.runtimePackages` {#opt-services.radicle.ci.adapters.native.instances._name_.runtimePackages}

Packages added to the adapter's `PATH`.

*Type:* list of package

*Default:*

``` nix
with pkgs; [
  bash
  coreutils
  curl
  gawk
  gitMinimal
  gnused
  wget
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/adapters/native.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/adapters/native.nix)

## `services.radicle.ci.adapters.native.instances.<name>.settings` {#opt-services.radicle.ci.adapters.native.instances._name_.settings}

Configuration of radicle-native-ci.
See [https://radicle.network/nodes/seed.radicle.dev/rad:z3qg5TKmN83afz2fj9z3fQjU8vaYE#configuration](https://radicle.network/nodes/seed.radicle.dev/rad:z3qg5TKmN83afz2fj9z3fQjU8vaYE#configuration) for more information.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/adapters/native.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/adapters/native.nix)

## `services.radicle.ci.adapters.native.instances.<name>.settings.base_url` {#opt-services.radicle.ci.adapters.native.instances._name_.settings.base_url}

Base URL for build logs (mandatory for access from CI broker page).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/adapters/native.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/adapters/native.nix)

## `services.radicle.ci.adapters.native.instances.<name>.settings.log` {#opt-services.radicle.ci.adapters.native.instances._name_.settings.log}

File where radicle-native-ci should write the run log.

*Type:* absolute path

*Default:* `"${config.services.radicle.ci.broker.logDir}/adapters/native/‹name›.log"`

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/adapters/native.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/adapters/native.nix)

## `services.radicle.ci.adapters.native.instances.<name>.settings.state` {#opt-services.radicle.ci.adapters.native.instances._name_.settings.state}

Directory where per-run directories are stored.

*Type:* absolute path

*Default:* `"${config.services.radicle.ci.broker.stateDir}/adapters/native/‹name›"`

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/adapters/native.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/adapters/native.nix)

## `services.radicle.ci.broker.checkConfig` {#opt-services.radicle.ci.broker.checkConfig}

Whether to enable checking the `ci-broker.yaml` file resulting from [services (R)](#opt-services.radicle.ci.broker.settings).

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/ci-broker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/ci-broker.nix)

## `services.radicle.ci.broker.enable` {#opt-services.radicle.ci.broker.enable}

Whether to enable radicle-ci-broker.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/ci-broker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/ci-broker.nix)

## `services.radicle.ci.broker.enableHardening` {#opt-services.radicle.ci.broker.enableHardening}

Whether to enable systemd hardening.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/ci-broker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/ci-broker.nix)

## `services.radicle.ci.broker.logDir` {#opt-services.radicle.ci.broker.logDir}

Log directory of radicle-ci-broker.

*Type:* absolute path

*Default:* `"/var/log/radicle-ci"`

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/ci-broker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/ci-broker.nix)

## `services.radicle.ci.broker.logLevel` {#opt-services.radicle.ci.broker.logLevel}

Log level for radicle-ci-broker, set via the `RUST_LOG` environment variable. See
[RUST\_LOG](https://docs.rs/env_logger/latest/env_logger/#enabling-logging)
for the format.

*Type:* string

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/ci-broker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/ci-broker.nix)

## `services.radicle.ci.broker.package` {#opt-services.radicle.ci.broker.package}

The radicle-ci-broker package to use.

*Type:* package

*Default:* `pkgs.radicle-ci-broker`

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/ci-broker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/ci-broker.nix)

## `services.radicle.ci.broker.settings` {#opt-services.radicle.ci.broker.settings}

Configuration of radicle-ci-broker.
See [https://radicle.network/nodes/seed.radicle.dev/rad:zwTxygwuz5LDGBq255RA2CbNGrz8/tree/doc/userguide.md#configuration](https://radicle.network/nodes/seed.radicle.dev/rad:zwTxygwuz5LDGBq255RA2CbNGrz8/tree/doc/userguide.md#configuration) for more information.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Example:*

``` nix
{
  adapters.native = {
    command = lib.getExe pkgs.radicle-native-ci;
    config = { };
    config_env = "RADICLE_NATIVE_CI";
    env.PATH = lib.makeBinPath (with pkgs; [ bash coreutils ]);
  };

  triggers = [
    {
      adapter = "native";
      filters = [
        {
          And = [
            { HasFile = ".radicle/native.yaml"; }
            { Node = "z6MkgEMYod7Hxfy9qCvDv5hYHkZ4ciWmLFgfvm3Wn1b2w2FV"; }
            {
              Or = [
                "DefaultBranch"
                "PatchCreated"
                "PatchUpdated"
              ];
            }
          ];
        }
      ];
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/ci-broker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/ci-broker.nix)

## `services.radicle.ci.broker.settings.adapters` {#opt-services.radicle.ci.broker.settings.adapters}

CI adapters.
See also the options under [services.radicle.ci.adapters](#opt-services.radicle.ci.adapters.native.instances).

*Type:* attribute set of (open submodule of (JSON value))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/ci-broker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/ci-broker.nix)

## `services.radicle.ci.broker.settings.adapters.<name>.command` {#opt-services.radicle.ci.broker.settings.adapters._name_.command}

Adapter command to run.

*Type:* string

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/ci-broker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/ci-broker.nix)

## `services.radicle.ci.broker.settings.adapters.<name>.env` {#opt-services.radicle.ci.broker.settings.adapters._name_.env}

Environment variables to add when running the adapter.

*Type:* attribute set of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/ci-broker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/ci-broker.nix)

## `services.radicle.ci.broker.settings.db` {#opt-services.radicle.ci.broker.settings.db}

Database file path.

*Type:* absolute path

*Default:* `"${config.services.radicle.ci.broker.stateDir}/ci-broker.db"`

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/ci-broker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/ci-broker.nix)

## `services.radicle.ci.broker.settings.report_dir` {#opt-services.radicle.ci.broker.settings.report_dir}

Directory where HTML and JSON report pages are written.

*Type:* null or absolute path

*Default:* `"${config.services.radicle.ci.broker.stateDir}/reports"`

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/ci-broker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/ci-broker.nix)

## `services.radicle.ci.broker.settings.triggers` {#opt-services.radicle.ci.broker.settings.triggers}

CI triggers.

*Type:* list of (open submodule of (JSON value))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/ci-broker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/ci-broker.nix)

## `services.radicle.ci.broker.settings.triggers.*.adapter` {#opt-services.radicle.ci.broker.settings.triggers._.adapter}

Adapter name.

*Type:* string

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/ci-broker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/ci-broker.nix)

## `services.radicle.ci.broker.settings.triggers.*.filters` {#opt-services.radicle.ci.broker.settings.triggers._.filters}

Trigger filter.

*Type:* list of (JSON value)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/ci-broker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/ci-broker.nix)

## `services.radicle.ci.broker.stateDir` {#opt-services.radicle.ci.broker.stateDir}

State directory of radicle-ci-broker.

*Type:* absolute path

*Default:* `"/var/lib/radicle-ci"`

*Declared by:* [`nixos/modules/services/continuous-integration/radicle/ci-broker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/radicle/ci-broker.nix)

## `services.radicle.enable` {#opt-services.radicle.enable}

Whether to enable Radicle Seed Node.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.aliases` {#opt-services.radicle.httpd.aliases}

Alias and RID pairs to shorten git clone commands for repositories.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  heartwood = "rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5";
}
```

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.enable` {#opt-services.radicle.httpd.enable}

Whether to enable Radicle HTTP gateway to radicle-node.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.extraArgs` {#opt-services.radicle.httpd.extraArgs}

Extra arguments for `radicle-httpd`

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.listenAddress` {#opt-services.radicle.httpd.listenAddress}

The IP address on which `radicle-httpd` listens.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.listenPort` {#opt-services.radicle.httpd.listenPort}

The port on which `radicle-httpd` listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx` {#opt-services.radicle.httpd.nginx}

With this option, you can customize an nginx virtual host which already has sensible defaults for `radicle-httpd`.
Set to `{}` if you do not need any customization to the virtual host.
If enabled, then by default, the `serverName` is
`radicle-${config.networking.hostName}.${config.networking.domain}`,
TLS is active, and certificates are acquired via ACME.
If this is set to null (the default), no nginx virtual host will be configured.

*Type:* null or (submodule)

*Default:* `null`

*Example:*

``` nix
{
  serverAliases = [
    "seed.${config.networking.domain}"
  ];
  enableACME = false;
  useACMEHost = config.networking.domain;
}
```

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.acmeFallbackHost` {#opt-services.radicle.httpd.nginx.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.acmeRoot` {#opt-services.radicle.httpd.nginx.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.addSSL` {#opt-services.radicle.httpd.nginx.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.basicAuth` {#opt-services.radicle.httpd.nginx.basicAuth}

Basic Auth protection for a vhost.

WARNING: This is implemented to store the password in plain text in the
Nix store.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  user = "password";
};
```

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.basicAuthFile` {#opt-services.radicle.httpd.nginx.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.default` {#opt-services.radicle.httpd.nginx.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.enableACME` {#opt-services.radicle.httpd.nginx.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.extraConfig` {#opt-services.radicle.httpd.nginx.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.forceSSL` {#opt-services.radicle.httpd.nginx.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.globalRedirect` {#opt-services.radicle.httpd.nginx.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.http2` {#opt-services.radicle.httpd.nginx.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.http3` {#opt-services.radicle.httpd.nginx.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.http3_hq` {#opt-services.radicle.httpd.nginx.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.kTLS` {#opt-services.radicle.httpd.nginx.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.listen` {#opt-services.radicle.httpd.nginx.listen}

Listen addresses and ports for this virtual host.
IPv6 addresses must be enclosed in square brackets.
Note: this option overrides `addSSL`
and `onlySSL`.

If you only want to set the addresses manually and not
the ports, take a look at `listenAddresses`.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    addr = "195.154.1.1";
    port = 443;
    ssl = true;
  }
  {
    addr = "192.154.1.1";
    port = 80;
  }
  {
    addr = "unix:/var/run/nginx.sock";
  }
]
```

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.listen.*.addr` {#opt-services.radicle.httpd.nginx.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.listen.*.extraParameters` {#opt-services.radicle.httpd.nginx.listen._.extraParameters}

Extra parameters of this listen directive.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "backlog=1024"
  "deferred"
]
```

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.listen.*.port` {#opt-services.radicle.httpd.nginx.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.listen.*.proxyProtocol` {#opt-services.radicle.httpd.nginx.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.listen.*.ssl` {#opt-services.radicle.httpd.nginx.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.listenAddresses` {#opt-services.radicle.httpd.nginx.listenAddresses}

Listen addresses for this virtual host.
Compared to `listen` this only sets the addresses
and the ports are chosen automatically.

Note: This option overrides `networking.enableIPv6`

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "127.0.0.1"
  "[::1]"
]
```

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.locations` {#opt-services.radicle.httpd.nginx.locations}

Declarative location config

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "/" = {
    proxyPass = "http://localhost:3000";
  };
};
```

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.locations.<name>.alias` {#opt-services.radicle.httpd.nginx.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.locations.<name>.basicAuth` {#opt-services.radicle.httpd.nginx.locations._name_.basicAuth}

Basic Auth protection for a vhost.

WARNING: This is implemented to store the password in plain text in the
Nix store.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  user = "password";
};
```

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.locations.<name>.basicAuthFile` {#opt-services.radicle.httpd.nginx.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.locations.<name>.extraConfig` {#opt-services.radicle.httpd.nginx.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.locations.<name>.fastcgiParams` {#opt-services.radicle.httpd.nginx.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.locations.<name>.index` {#opt-services.radicle.httpd.nginx.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.locations.<name>.priority` {#opt-services.radicle.httpd.nginx.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.locations.<name>.proxyPass` {#opt-services.radicle.httpd.nginx.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.locations.<name>.proxyWebsockets` {#opt-services.radicle.httpd.nginx.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.locations.<name>.recommendedProxySettings` {#opt-services.radicle.httpd.nginx.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.locations.<name>.recommendedUwsgiSettings` {#opt-services.radicle.httpd.nginx.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.locations.<name>.return` {#opt-services.radicle.httpd.nginx.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.locations.<name>.root` {#opt-services.radicle.httpd.nginx.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.locations.<name>.tryFiles` {#opt-services.radicle.httpd.nginx.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.locations.<name>.useGrpcErrorPages` {#opt-services.radicle.httpd.nginx.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.locations.<name>.uwsgiPass` {#opt-services.radicle.httpd.nginx.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.onlySSL` {#opt-services.radicle.httpd.nginx.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.quic` {#opt-services.radicle.httpd.nginx.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.redirectCode` {#opt-services.radicle.httpd.nginx.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.rejectSSL` {#opt-services.radicle.httpd.nginx.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.reuseport` {#opt-services.radicle.httpd.nginx.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.root` {#opt-services.radicle.httpd.nginx.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.serverAliases` {#opt-services.radicle.httpd.nginx.serverAliases}

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

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.serverName` {#opt-services.radicle.httpd.nginx.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `"radicle-\${config.networking.hostName}.\${config.networking.domain}"`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.sslCertificate` {#opt-services.radicle.httpd.nginx.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.sslCertificateKey` {#opt-services.radicle.httpd.nginx.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.sslTrustedCertificate` {#opt-services.radicle.httpd.nginx.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.nginx.useACMEHost` {#opt-services.radicle.httpd.nginx.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.httpd.package` {#opt-services.radicle.httpd.package}

The radicle-httpd package to use.

*Type:* package

*Default:* `pkgs.radicle-httpd`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.node.extraArgs` {#opt-services.radicle.node.extraArgs}

Extra arguments for `radicle-node`

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.node.listenAddress` {#opt-services.radicle.node.listenAddress}

The IP address on which `radicle-node` listens.

*Type:* string

*Default:* `"[::]"`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.node.listenPort` {#opt-services.radicle.node.listenPort}

The port on which `radicle-node` listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8776`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.node.openFirewall` {#opt-services.radicle.node.openFirewall}

Whether to enable opening the firewall for `radicle-node`.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.package` {#opt-services.radicle.package}

The radicle-node package to use.

*Type:* package

*Default:* `pkgs.radicle-node`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.privateKey` {#opt-services.radicle.privateKey}

An SSH private key (as an absolute file path or Systemd credential name),
usually generated by `rad auth`.

If set to the default value of `null`, radicle will import the private key from a credential
named `dev.radicle.node.secret`.

If configured as a credential name it will be imported via `ImportCredential=` in the service configuration.
Refer to the systemd-creds documentation for more details [https://systemd.io/CREDENTIALS/](https://systemd.io/CREDENTIALS/)

*Type:* null or absolute path or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.privateKeyPassphrase` {#opt-services.radicle.privateKeyPassphrase}

A passphrase for an SSH private key (as a Systemd credential name),
usually provided on generation of the key with `rad auth`.

If set to the default value of `null`, radicle will optionally import the passphrase from a
credential named `dev.radicle.node.passphrase`.

If the passphrase is not set, radicle will prompt for it.

If configured as a credential name it will be imported via `ImportCredential=` in the service configuration.
Refer to the systemd-creds documentation for more details [https://systemd.io/CREDENTIALS/](https://systemd.io/CREDENTIALS/)

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.publicKey` {#opt-services.radicle.publicKey}

An SSH public key (as an absolute file path or directly as a string),
usually generated by `rad auth`.

Make sure to not include a comment if your key comes with a comment.

*Type:* absolute path or string

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radicle.settings` {#opt-services.radicle.settings}

See [https://radicle.network/nodes/iris.radicle.network/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/tree/radicle/src/node/config.rs#L275](https://radicle.network/nodes/iris.radicle.network/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/tree/radicle/src/node/config.rs#L275)

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Example:*

``` nix
{
  web.pinned.repositories = [
    "rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5" # heartwood
    "rad:z3trNYnLWS11cJWC6BbxDs5niGo82" # rips
  ];
}
```

*Declared by:* [`nixos/modules/services/misc/radicle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/radicle.nix)

## `services.radvd.config` {#opt-services.radvd.config}

The contents of the radvd configuration file.

*Type:* strings concatenated with "\\n"

*Example:*

``` nix
''
  interface eth0 {
    AdvSendAdvert on;
    prefix 2001:db8:1234:5678::/64 { };
  };
''
```

*Declared by:* [`nixos/modules/services/networking/radvd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/radvd.nix)

## `services.radvd.debugLevel` {#opt-services.radvd.debugLevel}

The debugging level is an integer in the range from 1 to 5,
from quiet to very verbose. A debugging level of 0 completely
turns off debugging.

*Type:* integer between 0 and 5 (both inclusive)

*Default:* `0`

*Example:* `5`

*Declared by:* [`nixos/modules/services/networking/radvd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/radvd.nix)

## `services.radvd.enable` {#opt-services.radvd.enable}

Whether to enable the Router Advertisement Daemon
(`radvd`), which provides link-local
advertisements of IPv6 router addresses and prefixes using
the Neighbor Discovery Protocol (NDP).  This enables
stateless address autoconfiguration in IPv6 clients on the
network.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/radvd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/radvd.nix)

## `services.radvd.package` {#opt-services.radvd.package}

The radvd package to use.

*Type:* package

*Default:* `pkgs.radvd`

*Declared by:* [`nixos/modules/services/networking/radvd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/radvd.nix)

## `services.ratbagd.enable` {#opt-services.ratbagd.enable}

Whether to enable ratbagd for configuring gaming mice.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/ratbagd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/ratbagd.nix)

## `services.ratbagd.package` {#opt-services.ratbagd.package}

The libratbag package to use.

*Type:* package

*Default:* `pkgs.libratbag`

*Declared by:* [`nixos/modules/services/hardware/ratbagd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/ratbagd.nix)

## `services.rathole.credentialsFile` {#opt-services.rathole.credentialsFile}

Path to a TOML file to be merged with the settings.
Useful to set secret config parameters like tokens, which
should not appear in the Nix Store.

*Type:* absolute path

*Default:* `"/dev/null"`

*Example:* `"/var/lib/secrets/rathole/config.toml"`

*Declared by:* [`nixos/modules/services/networking/rathole.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rathole.nix)

## `services.rathole.enable` {#opt-services.rathole.enable}

Whether to enable Rathole.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/rathole.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rathole.nix)

## `services.rathole.package` {#opt-services.rathole.package}

The rathole package to use.

*Type:* package

*Default:* `pkgs.rathole`

*Declared by:* [`nixos/modules/services/networking/rathole.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rathole.nix)

## `services.rathole.role` {#opt-services.rathole.role}

Select whether rathole needs to be run as a `client` or a `server`.
Server is a machine with a public IP and client is a device behind NAT,
but running some services that need to be exposed to the Internet.

*Type:* one of "server", "client"

*Declared by:* [`nixos/modules/services/networking/rathole.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rathole.nix)

## `services.rathole.settings` {#opt-services.rathole.settings}

Rathole configuration, for options reference
see the [example](https://github.com/rapiz1/rathole?tab=readme-ov-file#configuration) on GitHub.
Both server and client configurations can be specified at the same time, regardless of the selected role.

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  server = {
    bind_addr = "0.0.0.0:2333";
    services = {
      my_nas_ssh = {
        bind_addr = "0.0.0.0:5202";
        token = "use_a_secret_that_only_you_know";
      };
    };
  };
}
```

*Declared by:* [`nixos/modules/services/networking/rathole.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rathole.nix)

## `services.rauc.bootloader` {#opt-services.rauc.bootloader}

The bootloader backend for RAUC.

*Type:* one of "barebox", "grub", "uboot", "efi", "custom", "noop"

*Example:* `"grub"`

*Declared by:* [`nixos/modules/services/hardware/rauc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/rauc.nix)

## `services.rauc.bundleFormats` {#opt-services.rauc.bundleFormats}

Allowable formats for the RAUC bundle.

*Type:* list of string

*Default:*

``` nix
[
  "-plain"
  "+verity"
]
```

*Example:*

``` nix
[
  "-plain"
  "+verity"
]
```

*Declared by:* [`nixos/modules/services/hardware/rauc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/rauc.nix)

## `services.rauc.client.enable` {#opt-services.rauc.client.enable}

Whether to enable RAUC client in the system environment.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/rauc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/rauc.nix)

## `services.rauc.compatible` {#opt-services.rauc.compatible}

The compatibility string for this system. Can be any format so long as you are consistent.

*Type:* string

*Example:* `"nix/appliance/foo"`

*Declared by:* [`nixos/modules/services/hardware/rauc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/rauc.nix)

## `services.rauc.dataDir` {#opt-services.rauc.dataDir}

The state directory for RAUC.

*Type:* absolute path

*Default:* `"/var/lib/rauc"`

*Declared by:* [`nixos/modules/services/hardware/rauc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/rauc.nix)

## `services.rauc.enable` {#opt-services.rauc.enable}

Whether to enable RAUC A/B update service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/rauc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/rauc.nix)

## `services.rauc.mark-good.enable` {#opt-services.rauc.mark-good.enable}

Whether to enable RAUC Good-marking service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/rauc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/rauc.nix)

## `services.rauc.package` {#opt-services.rauc.package}

The rauc package to use.

*Type:* package

*Default:* `pkgs.rauc`

*Declared by:* [`nixos/modules/services/hardware/rauc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/rauc.nix)

## `services.rauc.settings` {#opt-services.rauc.settings}

Rauc configuration that will be converted to INI. Refer to:
[https://rauc.readthedocs.io/en/latest/reference.html#sec-ref-slot-config](https://rauc.readthedocs.io/en/latest/reference.html#sec-ref-slot-config)
for details on supported values.

All module-specific options override these.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/hardware/rauc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/rauc.nix)

## `services.rauc.slots` {#opt-services.rauc.slots}

RAUC slot definitions. Every key is a slot class and every value is a list of slot indexes.

*Type:* attribute set of list of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/hardware/rauc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/rauc.nix)

## `services.rauc.slots.<name>.*.device` {#opt-services.rauc.slots._name_._.device}

The device to update.

*Type:* string

*Declared by:* [`nixos/modules/services/hardware/rauc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/rauc.nix)

## `services.rauc.slots.<name>.*.enable` {#opt-services.rauc.slots._name_._.enable}

Whether to enable this RAUC slot.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/rauc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/rauc.nix)

## `services.rauc.slots.<name>.*.settings` {#opt-services.rauc.slots._name_._.settings}

Settings for this slot.

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/hardware/rauc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/rauc.nix)

## `services.rauc.slots.<name>.*.type` {#opt-services.rauc.slots._name_._.type}

The type of the device.

*Type:* one of "raw", "nand", "nor", "ubivol", "ubifs", "ext4", "vfat"

*Default:* `"raw"`

*Declared by:* [`nixos/modules/services/hardware/rauc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/rauc.nix)

## `services.rdnssd.enable` {#opt-services.rdnssd.enable}

Whether to enable the RDNSS daemon
(`rdnssd`), which configures DNS servers in
`/etc/resolv.conf` from RDNSS
advertisements sent by IPv6 routers.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/rdnssd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rdnssd.nix)

## `services.reaction.checkConfig` {#opt-services.reaction.checkConfig}

Check the syntax of the configuration files at build time

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/reaction.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/reaction.nix)

## `services.reaction.enable` {#opt-services.reaction.enable}

Whether to enable enable reaction.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/reaction.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/reaction.nix)

## `services.reaction.loglevel` {#opt-services.reaction.loglevel}

reaction's loglevel. One of DEBUG, INFO, WARN, ERROR.

*Type:* null or one of "DEBUG", "INFO", "WARN", "ERROR"

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/reaction.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/reaction.nix)

## `services.reaction.package` {#opt-services.reaction.package}

The reaction package to use.

*Type:* package

*Default:* `pkgs.reaction`

*Declared by:* [`nixos/modules/services/security/reaction.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/reaction.nix)

## `services.reaction.runAsRoot` {#opt-services.reaction.runAsRoot}

Whether to run reaction as root.
Defaults to false, where an unprivileged reaction user is created.

Be sure to give it sufficient permissions.
Example config permitting `iptables` and `journalctl` use

``` nix
{
  # allows reading journal logs of processess
  users.users.reaction.extraGroups = [ "systemd-journal" ];

  # allows modifying ip firewall rules
  systemd.services.reaction.unitConfig.ConditionCapability = "CAP_NET_ADMIN";
  systemd.services.reaction.serviceConfig = {
    CapabilityBoundingSet = [ "CAP_NET_ADMIN" ];
    AmbientCapabilities = [ "CAP_NET_ADMIN" ];
  };

  # optional, if more control over ssh logs is needed
  services.openssh.settings.LogLevel = lib.mkDefault "VERBOSE";
}
```

``` nix
# core ipset plugin requires these if running as non-root
systemd.services.reaction.serviceConfig = {
  CapabilityBoundingSet = [
    "CAP_NET_ADMIN"
    "CAP_NET_RAW"
    "CAP_DAC_READ_SEARCH" # for journalctl
  ];
  AmbientCapabilities = [
    "CAP_NET_ADMIN"
    "CAP_NET_RAW"
    "CAP_DAC_READ_SEARCH"
  ];
};
```

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/reaction.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/reaction.nix)

## `services.reaction.settings` {#opt-services.reaction.settings}

Configuration for reaction. See the [wiki](https://framagit.org/ppom/reaction-wiki).

The settings are written as a YAML file.

Can be used in combination with `settingsFiles` option, both will be present in the configuration directory.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/reaction.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/reaction.nix)

## `services.reaction.settings.plugins` {#opt-services.reaction.settings.plugins}

Nixpkgs provides a `reaction-plugins` package set which includes both offical and community plugins for reaction.

To use the plugins in your module configuration, in `settings.plugins` you can use for e.g. `${lib.getExe reaction-plugins.reaction-plugin-ipset}`
See https://reaction.ppom.me/plugins/ to configure plugins.

*Type:* attribute set of (open submodule of (YAML 1.1 value))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/reaction.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/reaction.nix)

## `services.reaction.settings.plugins.<name>.check_root` {#opt-services.reaction.settings.plugins._name_.check_root}

Whether reaction must check that the executable is owned by root

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/reaction.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/reaction.nix)

## `services.reaction.settings.plugins.<name>.enable` {#opt-services.reaction.settings.plugins._name_.enable}

enable reaction-plugin-‹name›

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/reaction.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/reaction.nix)

## `services.reaction.settings.plugins.<name>.path` {#opt-services.reaction.settings.plugins._name_.path}

path to the plugin binary

*Type:* string

*Default:* `${cfg.package.plugins."reaction-plugin-‹name›"}/bin/reaction-plugin-‹name›`

*Declared by:* [`nixos/modules/services/security/reaction.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/reaction.nix)

## `services.reaction.settings.plugins.<name>.systemd` {#opt-services.reaction.settings.plugins._name_.systemd}

Whether reaction must isolate the plugin using systemd's run0

*Type:* boolean

*Default:* `"config.services.reaction.runAsRoot"`

*Declared by:* [`nixos/modules/services/security/reaction.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/reaction.nix)

## `services.reaction.settings.plugins.<name>.systemd_options` {#opt-services.reaction.settings.plugins._name_.systemd_options}

A key-value map of systemd options.
Keys must be strings and values must be string arrays.

See `man systemd.directives` for all supported options, and particularly options in `man systemd.exec`

*Type:* attribute set of list of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/reaction.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/reaction.nix)

## `services.reaction.settingsFiles` {#opt-services.reaction.settingsFiles}

Configuration for reaction, see the [wiki](https://framagit.org/ppom/reaction-wiki).

reaction supports JSON, YAML and JSONnet. For those who prefer to take advantage of JSONnet rather than Nix.

Can be used in combination with `settings` option, both will be present in the configuration directory.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/reaction.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/reaction.nix)

## `services.reaction.stopForFirewall` {#opt-services.reaction.stopForFirewall}

Whether to stop reaction when reloading the firewall.

The presence of a reaction chain in the INPUT table may cause the firewall
reload to fail.
One can alternatively cherry-pick the right iptables commands to execute before and after the firewall

``` nix
{
  systemd.services.firewall.serviceConfig = {
    ExecStopPre = [ "${pkgs.iptables}/bin/iptables -w -D INPUT -p all -j reaction" ];
    ExecStartPost = [ "${pkgs.iptables}/bin/iptables -w -I INPUT -p all -j reaction" ];
  };
}
```

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/reaction.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/reaction.nix)

## `services.readarr.dataDir` {#opt-services.readarr.dataDir}

The directory where Readarr stores its data files.

*Type:* string

*Default:* `"/var/lib/readarr/"`

*Declared by:* [`nixos/modules/services/misc/servarr/readarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/readarr.nix)

## `services.readarr.enable` {#opt-services.readarr.enable}

Whether to enable Readarr, a Usenet/BitTorrent ebook downloader.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/servarr/readarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/readarr.nix)

## `services.readarr.environmentFiles` {#opt-services.readarr.environmentFiles}

Environment file to pass secret configuration values.
Each line must follow the `READARR__SECTION__KEY=value` pattern.
Please consult the documentation at the [wiki](https://wiki.servarr.com/useful-tools#using-environment-variables-for-config).

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/servarr/readarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/readarr.nix)

## `services.readarr.group` {#opt-services.readarr.group}

Group under which Readarr runs.

*Type:* string

*Default:* `"readarr"`

*Declared by:* [`nixos/modules/services/misc/servarr/readarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/readarr.nix)

## `services.readarr.openFirewall` {#opt-services.readarr.openFirewall}

Open ports in the firewall for Readarr

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/servarr/readarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/readarr.nix)

## `services.readarr.package` {#opt-services.readarr.package}

The readarr package to use.

*Type:* package

*Default:* `pkgs.readarr`

*Declared by:* [`nixos/modules/services/misc/servarr/readarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/readarr.nix)

## `services.readarr.settings` {#opt-services.readarr.settings}

Attribute set of arbitrary config options.
Please consult the documentation at the [wiki](https://wiki.servarr.com/useful-tools#using-environment-variables-for-config).

WARNING: this configuration is stored in the world-readable Nix store!
For secrets use [services (R)](#opt-services.readarr.environmentFiles).

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  update.mechanism = "internal";
  server = {
    urlbase = "localhost";
    port = 8787;
    bindaddress = "*";
  };
}
```

*Declared by:* [`nixos/modules/services/misc/servarr/readarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/readarr.nix)

## `services.readarr.settings.log.analyticsEnabled` {#opt-services.readarr.settings.log.analyticsEnabled}

Send Anonymous Usage Data

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/servarr/readarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/readarr.nix)

## `services.readarr.settings.server.port` {#opt-services.readarr.settings.server.port}

Port Number

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8787`

*Declared by:* [`nixos/modules/services/misc/servarr/readarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/readarr.nix)

## `services.readarr.settings.update.automatically` {#opt-services.readarr.settings.update.automatically}

Automatically download and install updates.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/servarr/readarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/readarr.nix)

## `services.readarr.settings.update.mechanism` {#opt-services.readarr.settings.update.mechanism}

which update mechanism to use

*Type:* null or one of "external", "builtIn", "script"

*Default:* `"external"`

*Declared by:* [`nixos/modules/services/misc/servarr/readarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/readarr.nix)

## `services.readarr.user` {#opt-services.readarr.user}

User account under which Readarr runs.

*Type:* string

*Default:* `"readarr"`

*Declared by:* [`nixos/modules/services/misc/servarr/readarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/readarr.nix)

## `services.readeck.enable` {#opt-services.readeck.enable}

Whether to enable Readeck.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/readeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/readeck.nix)

## `services.readeck.environmentFile` {#opt-services.readeck.environmentFile}

File containing environment variables to be passed to Readeck.
May be used to provide the Readeck secret key by setting the READECK\_SECRET\_KEY variable.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/readeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/readeck.nix)

## `services.readeck.package` {#opt-services.readeck.package}

The readeck package to use.

*Type:* package

*Default:* `pkgs.readeck`

*Declared by:* [`nixos/modules/services/web-apps/readeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/readeck.nix)

## `services.readeck.settings` {#opt-services.readeck.settings}

Additional configuration for Readeck, see
[https://readeck.org/en/docs/configuration](https://readeck.org/en/docs/configuration)
for supported values.

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  main = {
    log_level = "debug";
  };
  server = {
    port = 9000;
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/readeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/readeck.nix)

## `services.realm.config` {#opt-services.realm.config}

The realm configuration, see [https://github.com/zhboner/realm#overview](https://github.com/zhboner/realm#overview) for documentation.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/realm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/realm.nix)

## `services.realm.enable` {#opt-services.realm.enable}

Whether to enable A simple, high performance relay server written in rust.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/realm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/realm.nix)

## `services.realm.package` {#opt-services.realm.package}

The realm package to use.

*Type:* package

*Default:* `pkgs.realm`

*Declared by:* [`nixos/modules/services/networking/realm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/realm.nix)

## `services.realmd.enable` {#opt-services.realmd.enable}

Whether to enable realmd service for managing system enrollment in Active Directory domains.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/realmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/realmd.nix)

## `services.realmd.package` {#opt-services.realmd.package}

The realmd package to use.

*Type:* package

*Default:* `pkgs.realmd`

*Declared by:* [`nixos/modules/services/misc/realmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/realmd.nix)

## `services.rebuilderd.enable` {#opt-services.rebuilderd.enable}

Whether to enable rebuilderd service for independent verification of binary packages.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/rebuilderd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rebuilderd.nix)

## `services.rebuilderd.package` {#opt-services.rebuilderd.package}

The rebuilderd package to use.

*Type:* package

*Default:* `pkgs.rebuilderd`

*Declared by:* [`nixos/modules/services/misc/rebuilderd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rebuilderd.nix)

## `services.rebuilderd.settings` {#opt-services.rebuilderd.settings}

Configuration for rebuilderd (rebuilderd.conf)

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/rebuilderd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rebuilderd.nix)

## `services.recyclarr.command` {#opt-services.recyclarr.command}

The recyclarr command to run (e.g., sync).

*Type:* string

*Default:* `"sync"`

*Declared by:* [`nixos/modules/services/misc/recyclarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/recyclarr.nix)

## `services.recyclarr.configuration` {#opt-services.recyclarr.configuration}

Recyclarr YAML configuration as a Nix attribute set.

For detailed configuration options and examples, see the
[official configuration reference](https://recyclarr.dev/wiki/yaml/config-reference/).

The configuration is processed using [utils.genJqSecretsReplacement](https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/utils.nix#L232-L331) to handle secret substitution.

```
```

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  radarr = {
    radarr-main = {
      api_key = {
        _secret = "/run/credentials/recyclarr.service/radarr-api_key";
      };
      base_url = "http://localhost:7878";
      instance_name = "main";
    };
  };
  sonarr = {
    sonarr-main = {
      api_key = {
        _secret = "/run/credentials/recyclarr.service/sonarr-api_key";
      };
      base_url = "http://localhost:8989";
      instance_name = "main";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/misc/recyclarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/recyclarr.nix)

## `services.recyclarr.enable` {#opt-services.recyclarr.enable}

Whether to enable recyclarr service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/recyclarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/recyclarr.nix)

## `services.recyclarr.group` {#opt-services.recyclarr.group}

Group under which recyclarr runs.

*Type:* string

*Default:* `"recyclarr"`

*Declared by:* [`nixos/modules/services/misc/recyclarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/recyclarr.nix)

## `services.recyclarr.package` {#opt-services.recyclarr.package}

The recyclarr package to use.

*Type:* package

*Default:* `pkgs.recyclarr`

*Declared by:* [`nixos/modules/services/misc/recyclarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/recyclarr.nix)

## `services.recyclarr.schedule` {#opt-services.recyclarr.schedule}

When to run recyclarr in systemd calendar format.

*Type:* string

*Default:* `"daily"`

*Declared by:* [`nixos/modules/services/misc/recyclarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/recyclarr.nix)

## `services.recyclarr.user` {#opt-services.recyclarr.user}

User account under which recyclarr runs.

*Type:* string

*Default:* `"recyclarr"`

*Declared by:* [`nixos/modules/services/misc/recyclarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/recyclarr.nix)

## `services.redis.package` {#opt-services.redis.package}

The redis package to use.

*Type:* package

*Default:* `pkgs.redis`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers` {#opt-services.redis.servers}

Configuration of multiple `redis-server` instances.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.appendFsync` {#opt-services.redis.servers._name_.appendFsync}

How often to fsync the append-only log, options: no, always, everysec.

*Type:* string

*Default:* `"everysec"`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.appendOnly` {#opt-services.redis.servers._name_.appendOnly}

By default data is only periodically persisted to disk, enable this option to use an append-only file for improved persistence.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.bind` {#opt-services.redis.servers._name_.bind}

The IP interface to bind to.
`null` means "all interfaces".

*Type:* null or string

*Default:* `"127.0.0.1"`

*Example:* `"192.0.2.1"`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.databases` {#opt-services.redis.servers._name_.databases}

Set the number of databases.

*Type:* signed integer

*Default:* `16`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.enable` {#opt-services.redis.servers._name_.enable}

Whether to enable Redis server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.extraParams` {#opt-services.redis.servers._name_.extraParams}

Extra parameters to append to redis-server invocation

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--sentinel"
]
```

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.group` {#opt-services.redis.servers._name_.group}

Group account under which this instance of redis-server runs.

::: {.note}
If left as the default value this group will automatically be
created on system activation, otherwise you are responsible for
ensuring the group exists before the redis service starts.

*Type:* string

*Default:* `config.user`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.logLevel` {#opt-services.redis.servers._name_.logLevel}

Specify the server verbosity level, options: debug, verbose, notice, warning.

*Type:* string

*Default:* `"notice"`

*Example:* `"debug"`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.logfile` {#opt-services.redis.servers._name_.logfile}

Specify the log file name. Also 'stdout' can be used to force Redis to log on the standard output.

*Type:* string

*Default:* `"/dev/null"`

*Example:* `"/var/log/redis.log"`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.masterAuth` {#opt-services.redis.servers._name_.masterAuth}

If the master is password protected (using the requirePass configuration)
it is possible to tell the slave to authenticate before starting the replication synchronization
process, otherwise the master will refuse the slave request.
(STORED PLAIN TEXT, WORLD-READABLE IN NIX STORE)

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.masterAuthFile` {#opt-services.redis.servers._name_.masterAuthFile}

File with password for the master user.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/redis-master-password"`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.masterUser` {#opt-services.redis.servers._name_.masterUser}

If the master is password protected via ACLs this option can be used to specify
the Redis user that is used by replicas.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.maxclients` {#opt-services.redis.servers._name_.maxclients}

Set the max number of connected clients at the same time.

*Type:* signed integer

*Default:* `10000`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.openFirewall` {#opt-services.redis.servers._name_.openFirewall}

Whether to open ports in the firewall for the server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.port` {#opt-services.redis.servers._name_.port}

The TCP port to accept connections.
If port 0 is specified Redis will not listen on a TCP socket.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `if name == "" then 6379 else 0`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.requirePass` {#opt-services.redis.servers._name_.requirePass}

Password for database (STORED PLAIN TEXT, WORLD-READABLE IN NIX STORE).
Use requirePassFile to store it outside of the nix store in a dedicated file.

*Type:* null or string

*Default:* `null`

*Example:* `"letmein!"`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.requirePassFile` {#opt-services.redis.servers._name_.requirePassFile}

File with password for the database.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/redis-password"`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.save` {#opt-services.redis.servers._name_.save}

The schedule in which data is persisted to disk, represented as a list of lists where the first element represent the amount of seconds and the second the number of changes.

If set to the empty list (`[]`) then RDB persistence will be disabled (useful if you are using AOF or don't want any persistence).

*Type:* list of list of signed integer

*Default:*

``` nix
[
  [
    900
    1
  ]
  [
    300
    10
  ]
  [
    60
    10000
  ]
]
```

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.sentinelAuthPassFile` {#opt-services.redis.servers._name_.sentinelAuthPassFile}

File with password for connecting to other Sentinel instances.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/sentinel-password"`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.sentinelAuthUser` {#opt-services.redis.servers._name_.sentinelAuthUser}

The username to use to monitor a master from Sentinel.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.sentinelMasterHost` {#opt-services.redis.servers._name_.sentinelMasterHost}

The IP address (recommended) or hostname of the Redis master that Sentinel will monitor.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.sentinelMasterName` {#opt-services.redis.servers._name_.sentinelMasterName}

The master name of the Redis master that Sentinel will monitor.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.sentinelMasterPort` {#opt-services.redis.servers._name_.sentinelMasterPort}

The TCP port of the Redis master that Sentinel will monitor.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.sentinelMasterQuorum` {#opt-services.redis.servers._name_.sentinelMasterQuorum}

The Sentinel quorum (minimum number of Sentinel nodes online for failover)

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.settings` {#opt-services.redis.servers._name_.settings}

Redis configuration. Refer to
[https://redis.io/topics/config](https://redis.io/topics/config)
for details on supported values.

*Type:* attribute set of (boolean or signed integer or string or list of string)

*Default:* `{ }`

*Example:*

``` nix
{
  loadmodule = [ "/path/to/my_module.so" "/path/to/other_module.so" ];
}
```

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.slaveOf` {#opt-services.redis.servers._name_.slaveOf}

IP and port to which this redis instance acts as a slave.

*Type:* null or (submodule)

*Default:* `null`

*Example:*

``` nix
{
  ip = "192.168.1.100";
  port = 6379;
}
```

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.slaveOf.ip` {#opt-services.redis.servers._name_.slaveOf.ip}

IP of the Redis master

*Type:* string

*Example:* `"192.168.1.100"`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.slaveOf.port` {#opt-services.redis.servers._name_.slaveOf.port}

port of the Redis master

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6379`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.slowLogLogSlowerThan` {#opt-services.redis.servers._name_.slowLogLogSlowerThan}

Log queries whose execution take longer than X in milliseconds.

*Type:* signed integer

*Default:* `10000`

*Example:* `1000`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.slowLogMaxLen` {#opt-services.redis.servers._name_.slowLogMaxLen}

Maximum number of items to keep in slow log.

*Type:* signed integer

*Default:* `128`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.syslog` {#opt-services.redis.servers._name_.syslog}

Enable logging to the system logger.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.unixSocket` {#opt-services.redis.servers._name_.unixSocket}

The path to the socket to bind to.

*Type:* null or absolute path

*Default:*

``` nix
if name == "" then "/run/redis/redis.sock" else "/run/redis-${name}/redis.sock"
```

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.unixSocketPerm` {#opt-services.redis.servers._name_.unixSocketPerm}

Change permissions for the socket

*Type:* signed integer

*Default:* `660`

*Example:* `600`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.servers.<name>.user` {#opt-services.redis.servers._name_.user}

User account under which this instance of redis-server runs.

::: {.note}
If left as the default value this user will automatically be
created on system activation, otherwise you are responsible for
ensuring the user exists before the redis service starts.

*Type:* string

*Default:*

``` nix
if name == "" then "redis" else "redis-${name}"
```

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redis.vmOverCommit` {#opt-services.redis.vmOverCommit}

Whether to enable set `vm.overcommit_memory` sysctl to 1
(Suggested for Background Saving: [https://redis.io/docs/get-started/faq/](https://redis.io/docs/get-started/faq/))
.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/redis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/redis.nix)

## `services.redlib.address` {#opt-services.redlib.address}

The address to listen on

*Type:* string

*Default:* `"0.0.0.0"`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/misc/redlib.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redlib.nix)

## `services.redlib.enable` {#opt-services.redlib.enable}

Whether to enable Private front-end for Reddit.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/redlib.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redlib.nix)

## `services.redlib.openFirewall` {#opt-services.redlib.openFirewall}

Open ports in the firewall for the redlib web interface

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/redlib.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redlib.nix)

## `services.redlib.package` {#opt-services.redlib.package}

The redlib package to use.

*Type:* package

*Default:* `pkgs.redlib`

*Declared by:* [`nixos/modules/services/misc/redlib.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redlib.nix)

## `services.redlib.port` {#opt-services.redlib.port}

The port to listen on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Example:* `8000`

*Declared by:* [`nixos/modules/services/misc/redlib.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redlib.nix)

## `services.redlib.settings` {#opt-services.redlib.settings}

See [GitHub](https://github.com/redlib-org/redlib/tree/main?tab=readme-ov-file#configuration) for available settings.

*Type:* open submodule of attribute set of (null or boolean or signed integer or string)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/redlib.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redlib.nix)

## `services.redmine.address` {#opt-services.redmine.address}

IP address Redmine should bind to.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.components.breezy` {#opt-services.redmine.components.breezy}

Whether to enable bazaar integration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.components.cvs` {#opt-services.redmine.components.cvs}

Whether to enable cvs integration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.components.ghostscript` {#opt-services.redmine.components.ghostscript}

Whether to enable exporting Gant diagrams as PDF.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.components.git` {#opt-services.redmine.components.git}

Whether to enable git integration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.components.imagemagick` {#opt-services.redmine.components.imagemagick}

Whether to enable exporting Gant diagrams as PNG.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.components.mercurial` {#opt-services.redmine.components.mercurial}

Whether to enable Mercurial integration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.components.minimagick_font_path` {#opt-services.redmine.components.minimagick_font_path}

MiniMagick font path

*Type:* string

*Default:* `""`

*Example:* `"/run/current-system/sw/share/X11/fonts/LiberationSans-Regular.ttf"`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.components.pandoc` {#opt-services.redmine.components.pandoc}

Whether to enable pandoc integration for previewing LibreOffice and Microsoft Office documents.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.components.subversion` {#opt-services.redmine.components.subversion}

Whether to enable Subversion integration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.database.createLocally` {#opt-services.redmine.database.createLocally}

Create the database and database user locally.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.database.host` {#opt-services.redmine.database.host}

Database host address.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.database.name` {#opt-services.redmine.database.name}

Database name.

*Type:* string

*Default:* `"redmine"`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.database.passwordFile` {#opt-services.redmine.database.passwordFile}

A file containing the password corresponding to
`database.user`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/redmine-dbpassword"`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.database.port` {#opt-services.redmine.database.port}

Database host port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3306`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.database.socket` {#opt-services.redmine.database.socket}

Path to the unix socket file to use for authentication.

*Type:* null or absolute path

*Default:* `/run/mysqld/mysqld.sock`

*Example:* `"/run/mysqld/mysqld.sock"`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.database.type` {#opt-services.redmine.database.type}

Database engine to use.

*Type:* one of "mysql2", "postgresql", "sqlite3"

*Default:* `"mysql2"`

*Example:* `"postgresql"`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.database.user` {#opt-services.redmine.database.user}

Database user.

*Type:* string

*Default:* `"redmine"`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.enable` {#opt-services.redmine.enable}

Whether to enable Redmine, a project management web application.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.extraEnv` {#opt-services.redmine.extraEnv}

Extra configuration in additional\_environment.rb.

See [https://svn.redmine.org/redmine/trunk/config/additional\_environment.rb.example](https://svn.redmine.org/redmine/trunk/config/additional_environment.rb.example)
for details.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  config.logger.level = Logger::DEBUG
''
```

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.group` {#opt-services.redmine.group}

Group under which Redmine is ran.

*Type:* string

*Default:* `"redmine"`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.package` {#opt-services.redmine.package}

The redmine package to use.

*Type:* package

*Default:* `pkgs.redmine`

*Example:* `redmine.override { ruby = pkgs.ruby_3_4; }`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.plugins` {#opt-services.redmine.plugins}

Set of plugins.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
{
  redmine_env_auth = builtins.fetchurl {
    url = "https://github.com/Intera/redmine_env_auth/archive/0.6.zip";
    sha256 = "0yyr1yjd8gvvh832wdc8m3xfnhhxzk2pk3gm2psg5w9jdvd6skak";
  };
}
```

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.port` {#opt-services.redmine.port}

Port on which Redmine is ran.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.settings` {#opt-services.redmine.settings}

Redmine configuration (`configuration.yml`). Refer to
[https://guides.rubyonrails.org/action\_mailer\_basics.html#action-mailer-configuration](https://guides.rubyonrails.org/action_mailer_basics.html#action-mailer-configuration)
for details.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  email_delivery = {
    delivery_method = "smtp";
    smtp_settings = {
      address = "mail.example.com";
      port = 25;
    };
  };
}
```

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.stateDir` {#opt-services.redmine.stateDir}

The state directory, logs and plugins are stored here.

*Type:* absolute path

*Default:* `"/var/lib/redmine"`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.themes` {#opt-services.redmine.themes}

Set of themes.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
{
  dkuk-redmine_alex_skin = builtins.fetchurl {
    url = "https://bitbucket.org/dkuk/redmine_alex_skin/get/1842ef675ef3.zip";
    sha256 = "0hrin9lzyi50k4w2bd2b30vrf1i4fi1c0gyas5801wn8i7kpm9yl";
  };
}
```

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redmine.user` {#opt-services.redmine.user}

User under which Redmine is ran.

*Type:* string

*Default:* `"redmine"`

*Declared by:* [`nixos/modules/services/misc/redmine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/redmine.nix)

## `services.redshift.brightness.day` {#opt-services.redshift.brightness.day}

Screen brightness to apply during the day,
between `0.1` and `1.0`.

*Type:* string

*Default:* `"1"`

*Declared by:* [`nixos/modules/services/x11/redshift.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/redshift.nix)

## `services.redshift.brightness.night` {#opt-services.redshift.brightness.night}

Screen brightness to apply during the night,
between `0.1` and `1.0`.

*Type:* string

*Default:* `"1"`

*Declared by:* [`nixos/modules/services/x11/redshift.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/redshift.nix)

## `services.redshift.enable` {#opt-services.redshift.enable}

Enable Redshift to change your screen's colour temperature depending on
the time of day.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/redshift.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/redshift.nix)

## `services.redshift.executable` {#opt-services.redshift.executable}

Redshift executable to use within the package.

*Type:* string

*Default:* `"/bin/redshift"`

*Example:* `"/bin/redshift-gtk"`

*Declared by:* [`nixos/modules/services/x11/redshift.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/redshift.nix)

## `services.redshift.extraOptions` {#opt-services.redshift.extraOptions}

Additional command-line arguments to pass to
`redshift`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-v"
  "-m randr"
]
```

*Declared by:* [`nixos/modules/services/x11/redshift.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/redshift.nix)

## `services.redshift.package` {#opt-services.redshift.package}

The redshift package to use.

*Type:* package

*Default:* `pkgs.redshift`

*Declared by:* [`nixos/modules/services/x11/redshift.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/redshift.nix)

## `services.redshift.temperature.day` {#opt-services.redshift.temperature.day}

Colour temperature to use during the day, between
`1000` and `25000` K.

*Type:* integer between 1000 and 25000 (both inclusive)

*Default:* `6500`

*Declared by:* [`nixos/modules/services/x11/redshift.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/redshift.nix)

## `services.redshift.temperature.night` {#opt-services.redshift.temperature.night}

Colour temperature to use at night, between
`1000` and `25000` K.

*Type:* integer between 1000 and 25000 (both inclusive)

*Default:* `4500`

*Declared by:* [`nixos/modules/services/x11/redshift.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/redshift.nix)

## `services.redsocks.chroot` {#opt-services.redsocks.chroot}

Chroot under which to run redsocks. Log file is opened before
chroot, but if logging to syslog /etc/localtime may be required.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/redsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/redsocks.nix)

## `services.redsocks.enable` {#opt-services.redsocks.enable}

Whether to enable redsocks.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/redsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/redsocks.nix)

## `services.redsocks.log` {#opt-services.redsocks.log}

Where to send logs.

Possible values are:

- stderr
- file:/path/to/file
- syslog:FACILITY where FACILITY is any of "daemon", "local0",
  etc.

*Type:* string

*Default:* `"stderr"`

*Declared by:* [`nixos/modules/services/networking/redsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/redsocks.nix)

## `services.redsocks.log_debug` {#opt-services.redsocks.log_debug}

Log connection progress.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/redsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/redsocks.nix)

## `services.redsocks.log_info` {#opt-services.redsocks.log_info}

Log start and end of client sessions.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/redsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/redsocks.nix)

## `services.redsocks.redsocks` {#opt-services.redsocks.redsocks}

Local port to proxy associations to be performed.

The example shows how to configure a proxy to handle port 80 as HTTP
relay, and all other ports as HTTP connect.

*Type:* list of (submodule)

*Example:*

``` nix
[
  {
    doNotRedirect = [
      "-d 1.2.0.0/16"
    ];
    port = 23456;
    proxy = "1.2.3.4:8080";
    redirectCondition = "--dport 80";
    type = "http-relay";
  }
  {
    doNotRedirect = [
      "-d 1.2.0.0/16"
    ];
    port = 23457;
    proxy = "1.2.3.4:8080";
    redirectCondition = true;
    type = "http-connect";
  }
]
```

*Declared by:* [`nixos/modules/services/networking/redsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/redsocks.nix)

## `services.redsocks.redsocks.*.disclose_src` {#opt-services.redsocks.redsocks._.disclose_src}

Way to disclose client IP to the proxy.

- "false": do not disclose

http-connect supports the following ways:

- "X-Forwarded-For": add header "X-Forwarded-For: IP"
- "Forwarded\_ip": add header "Forwarded: for=IP" (see RFC7239)
- "Forwarded\_ipport": add header 'Forwarded: for="IP:port"'

*Type:* one of "false", "X-Forwarded-For", "Forwarded\_ip", "Forwarded\_ipport"

*Default:* `"false"`

*Declared by:* [`nixos/modules/services/networking/redsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/redsocks.nix)

## `services.redsocks.redsocks.*.doNotRedirect` {#opt-services.redsocks.redsocks._.doNotRedirect}

Iptables filters that if matched will get the packet off of
redsocks.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-d 1.2.3.4"
]
```

*Declared by:* [`nixos/modules/services/networking/redsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/redsocks.nix)

## `services.redsocks.redsocks.*.ip` {#opt-services.redsocks.redsocks._.ip}

IP on which redsocks should listen. Defaults to 127.0.0.1 for
security reasons.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/redsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/redsocks.nix)

## `services.redsocks.redsocks.*.login` {#opt-services.redsocks.redsocks._.login}

Login to send to proxy.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/redsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/redsocks.nix)

## `services.redsocks.redsocks.*.password` {#opt-services.redsocks.redsocks._.password}

Password to send to proxy. WARNING, this will end up
world-readable in the store! Awaiting
https://github.com/NixOS/nix/issues/8 to be able to fix.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/redsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/redsocks.nix)

## `services.redsocks.redsocks.*.port` {#opt-services.redsocks.redsocks._.port}

Port on which redsocks should listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `12345`

*Declared by:* [`nixos/modules/services/networking/redsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/redsocks.nix)

## `services.redsocks.redsocks.*.proxy` {#opt-services.redsocks.redsocks._.proxy}

Proxy through which redsocks should forward incoming traffic.
Example: "example.org:8080"

*Type:* string

*Declared by:* [`nixos/modules/services/networking/redsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/redsocks.nix)

## `services.redsocks.redsocks.*.redirectCondition` {#opt-services.redsocks.redsocks._.redirectCondition}

Conditions to make outbound packets go through this redsocks
instance.

If set to false, no packet will be forwarded. If set to true,
all packets will be forwarded (except packets excluded by
redirectInternetOnly).

If set to a string, this is an iptables filter that will be
matched against packets before getting them into redsocks. For
example, setting it to "--dport 80" will only send
packets to port 80 to redsocks. Note "-p tcp" is always
implicitly added, as udp can only be proxied through redudp or
the like.

*Type:* boolean or string

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/redsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/redsocks.nix)

## `services.redsocks.redsocks.*.redirectInternetOnly` {#opt-services.redsocks.redsocks._.redirectInternetOnly}

Exclude all non-globally-routable IPs from redsocks

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/redsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/redsocks.nix)

## `services.redsocks.redsocks.*.type` {#opt-services.redsocks.redsocks._.type}

Type of proxy.

*Type:* one of "socks4", "socks5", "http-connect", "http-relay"

*Declared by:* [`nixos/modules/services/networking/redsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/redsocks.nix)

## `services.reframe.configs` {#opt-services.reframe.configs}

Configurations for ReFrame

*Type:* attribute set of (open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string)))

*Default:* `{ }`

*Example:*

``` nix
''
  {
    main = {
      reframe = {
        card = "card0";
        connector = "eDP-1";
        rotation = 0;
        desktop-width = 1920;
        desktop-height = 1080;
        monitor-x = 0;
        monitor-y = 0;
        default-width = 1920;
        default-height = 1080;
        resize = true;
        cursor = true;
        wakeup = true;
        damage = "cpu";
        fps = 30;
      };
      vnc = {
        ip = "0.0.0.0";
        port = 5933;
        password = "password";
        type = "libvncserver";
      };
    };
  }
''
```

*Declared by:* [`nixos/modules/services/networking/reframe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/reframe.nix)

## `services.reframe.enable` {#opt-services.reframe.enable}

Whether to enable DRM/KMS based remote desktop for Linux that supports Wayland/NVIDIA/headless/login….

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/reframe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/reframe.nix)

## `services.reframe.package` {#opt-services.reframe.package}

The reframe package to use.

*Type:* package

*Default:* `pkgs.reframe`

*Declared by:* [`nixos/modules/services/networking/reframe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/reframe.nix)

## `services.remark42.dataDir` {#opt-services.remark42.dataDir}

Working directory for Remark42. Data files are stored here and
automatic backups will be created in this directory by default.

*Type:* absolute path

*Default:* `"/var/lib/remark42"`

*Declared by:* [`nixos/modules/services/web-apps/remark42.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/remark42.nix)

## `services.remark42.enable` {#opt-services.remark42.enable}

Whether to enable Remark42 commenting server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/remark42.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/remark42.nix)

## `services.remark42.environmentFile` {#opt-services.remark42.environmentFile}

Optional environment file in systemd `EnvironmentFile=` format.
Use this for secrets to avoid storing them in the Nix store.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/remark42.env"`

*Declared by:* [`nixos/modules/services/web-apps/remark42.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/remark42.nix)

## `services.remark42.listenAddress` {#opt-services.remark42.listenAddress}

Bind address (`REMARK_ADDRESS`).

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/web-apps/remark42.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/remark42.nix)

## `services.remark42.openFirewall` {#opt-services.remark42.openFirewall}

Whether to open the firewall for `port`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/remark42.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/remark42.nix)

## `services.remark42.package` {#opt-services.remark42.package}

The remark42 package to use.

*Type:* package

*Default:* `pkgs.remark42`

*Declared by:* [`nixos/modules/services/web-apps/remark42.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/remark42.nix)

## `services.remark42.port` {#opt-services.remark42.port}

Listen port (`REMARK_PORT`).

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/web-apps/remark42.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/remark42.nix)

## `services.remark42.remarkUrl` {#opt-services.remark42.remarkUrl}

Public URL of this Remark42 instance. This is passed to the backend as
`REMARK_URL` and should match the frontend embed config `host`.

*Type:* string

*Example:* `"https://comments.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/remark42.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/remark42.nix)

## `services.remark42.settings` {#opt-services.remark42.settings}

Extra environment variables passed to Remark42.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  AUTH_ANON = "true";
}
```

*Declared by:* [`nixos/modules/services/web-apps/remark42.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/remark42.nix)

## `services.remark42.sites` {#opt-services.remark42.sites}

Site IDs served by this instance (passed as `SITE`, comma-separated).
The frontend embed config `site_id` must match one of these values.

*Type:* list of string

*Default:*

``` nix
[
  "remark"
]
```

*Example:*

``` nix
[
  "blog"
  "docs"
]
```

*Declared by:* [`nixos/modules/services/web-apps/remark42.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/remark42.nix)

## `services.renovate.credentials` {#opt-services.renovate.credentials}

Allows configuring environment variable credentials for renovate, read from files.
This should always be used for passing confidential data to renovate.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
{
  RENOVATE_TOKEN = "/etc/renovate/token";
}
```

*Declared by:* [`nixos/modules/services/misc/renovate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/renovate.nix)

## `services.renovate.enable` {#opt-services.renovate.enable}

Whether to enable renovate.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/renovate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/renovate.nix)

## `services.renovate.environment` {#opt-services.renovate.environment}

Extra environment variables to export to the Renovate process
from the systemd unit configuration.

See [https://docs.renovatebot.com/config-overview](https://docs.renovatebot.com/config-overview) for available environment variables.

*Type:* attribute set of (null or string or absolute path or package)

*Default:* `{ }`

*Example:*

``` nix
{
  LOG_LEVEL = "debug";
}
```

*Declared by:* [`nixos/modules/services/misc/renovate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/renovate.nix)

## `services.renovate.package` {#opt-services.renovate.package}

The renovate package to use.

*Type:* package

*Default:* `pkgs.renovate`

*Declared by:* [`nixos/modules/services/misc/renovate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/renovate.nix)

## `services.renovate.runtimePackages` {#opt-services.renovate.runtimePackages}

Packages available to renovate.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/renovate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/renovate.nix)

## `services.renovate.schedule` {#opt-services.renovate.schedule}

How often to run renovate. See `systemd.time(7)` for the format.

*Type:* null or string

*Default:* `null`

*Example:* `"*:0/10"`

*Declared by:* [`nixos/modules/services/misc/renovate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/renovate.nix)

## `services.renovate.settings` {#opt-services.renovate.settings}

Renovate's global configuration.
If you want to pass secrets to renovate, please use [`services.renovate.credentials`](#opt-services.renovate.credentials) for that.

See [https://docs.renovatebot.com/config-overview](https://docs.renovatebot.com/config-overview) for available settings.

*Type:* JSON value

*Default:* `{ }`

*Example:*

``` nix
{
  endpoint = "https://git.example.com";
  gitAuthor = "Renovate <renovate@example.com>";
  platform = "gitea";
}
```

*Declared by:* [`nixos/modules/services/misc/renovate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/renovate.nix)

## `services.renovate.validateSettings` {#opt-services.renovate.validateSettings}

Whether to run renovate's config validator on the built configuration.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/renovate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/renovate.nix)

## `services.reposilite.database` {#opt-services.reposilite.database}

Database options.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.database.dbname` {#opt-services.reposilite.database.dbname}

Database name.

*Type:* string

*Default:* `"reposilite"`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.database.host` {#opt-services.reposilite.database.host}

Database host address.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.database.passwordFile` {#opt-services.reposilite.database.passwordFile}

Path to the file containing the password for the database connection.
This file must be readable by [`services.reposilite.user`](#opt-services.reposilite.user).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.database.path` {#opt-services.reposilite.database.path}

Path to the embedded database file. Set to `--temporary` to use an in-memory database.

*Type:* string

*Default:* `"reposilite.db"`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.database.port` {#opt-services.reposilite.database.port}

Database TCP port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
if type == "postgresql" then 5432 else 3306
```

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.database.type` {#opt-services.reposilite.database.type}

Database engine to use.

*Type:* one of "h2", "mariadb", "mysql", "postgresql", "sqlite"

*Default:* `"sqlite"`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.database.user` {#opt-services.reposilite.database.user}

Database user.

*Type:* string

*Default:* `"reposilite"`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.enable` {#opt-services.reposilite.enable}

Whether to enable Reposilite.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.extraArgs` {#opt-services.reposilite.extraArgs}

Extra arguments/parameters passed to the Reposilite. Can be used for first token generation.

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "--token" "name:tempsecrettoken" ]`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.group` {#opt-services.reposilite.group}

The group to run Reposilite under.

*Type:* string

*Default:* `"reposilite"`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.keyPasswordFile` {#opt-services.reposilite.keyPasswordFile}

Path the the file containing the password used to unlock the Java KeyStore file specified in [`services.reposilite.settings.keyPath`](#opt-services.reposilite.settings.keyPath).
This file must be readable my [`services.reposilite.user`](#opt-services.reposilite.user).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.openFirewall` {#opt-services.reposilite.openFirewall}

Whether to open the firewall ports for Reposilite. If SSL is enabled, its port will be opened too.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.package` {#opt-services.reposilite.package}

The reposilite package to use.

*Type:* package

*Default:* `pkgs.reposilite`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.plugins` {#opt-services.reposilite.plugins}

List of plugins to add to Reposilite.

*Type:* list of package

*Default:* `[ ]`

*Example:* `"with reposilitePlugins; [ checksum groovy ]"`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.settings` {#opt-services.reposilite.settings}

Configuration written to the reposilite.cdn file

*Type:* open submodule of (CDN value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.settings.basePath` {#opt-services.reposilite.settings.basePath}

Custom base path for this Reposilite instance.
It is not recommended changing this, you should instead prioritize using a different subdomain.

*Type:* string

*Default:* `"/"`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.settings.bypassExternalCache` {#opt-services.reposilite.settings.bypassExternalCache}

Add cache bypass headers to responses from /api/\* to avoid issues with proxies such as Cloudflare.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.settings.cachedLogSize` {#opt-services.reposilite.settings.cachedLogSize}

Amount of messages stored in the cache logger.

*Type:* unsigned integer, meaning \>=0

*Default:* `50`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.settings.compressionStrategy` {#opt-services.reposilite.settings.compressionStrategy}

Compression algorithm used by this instance of Reposilite.
`none` reduces usage of CPU & memory, but requires transfering more data.

*Type:* one of "none", "gzip"

*Default:* `"none"`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.settings.database` {#opt-services.reposilite.settings.database}

Database connection string. Please use [`services.reposilite.database`](#opt-services.reposilite.database) instead.
See [https://reposilite.com/guide/general#local-configuration](https://reposilite.com/guide/general#local-configuration) for valid values.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.settings.databaseThreadPool` {#opt-services.reposilite.settings.databaseThreadPool}

Maximum amount of concurrent connections to the database. (one per thread)
Embedded databases (sqlite, h2) do not support truly concurrent connections, so the value will always be `1` if they are used.

*Type:* positive integer, meaning \>0

*Default:* `1`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.settings.debugEnabled` {#opt-services.reposilite.settings.debugEnabled}

Whether to enable debug mode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.settings.defaultFrontend` {#opt-services.reposilite.settings.defaultFrontend}

Whether to enable the default included frontend with a dashboard.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.settings.enforceSsl` {#opt-services.reposilite.settings.enforceSsl}

Whether to redirect all traffic to SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.settings.hostname` {#opt-services.reposilite.settings.hostname}

The hostname to bind to. Set to `0.0.0.0` to accept connections from everywhere, or `127.0.0.1` to restrict to localhost."

*Type:* string

*Default:* `"0.0.0.0"`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.settings.idleTimeout` {#opt-services.reposilite.settings.idleTimeout}

Default idle timeout used by Jetty.

*Type:* unsigned integer, meaning \>=0

*Default:* `30000`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.settings.ioThreadPool` {#opt-services.reposilite.settings.ioThreadPool}

The IO thread pool handles all tasks that may benefit from non-blocking IO. (min: 2)
Because most tasks are redirected to IO thread pool, it might be a good idea to keep it at least equal to web thread pool.

*Type:* integer between 2 and 65535 (both inclusive)

*Default:* `8`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.settings.keyPassword` {#opt-services.reposilite.settings.keyPassword}

Plaintext password used to unlock the Java KeyStore set in [`services.reposilite.settings.keyPath`](#opt-services.reposilite.settings.keyPath).
WARNING: this option is insecure and should not be used to store the password.
Consider using [`services.reposilite.keyPasswordFile`](#opt-services.reposilite.keyPasswordFile) instead.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.settings.keyPath` {#opt-services.reposilite.settings.keyPath}

Path to the .jsk KeyStore or paths to the PKCS#8 certificate and private key, separated by a space (see example).
You can use `${WORKING_DIRECTORY}` to refer to paths relative to Reposilite's working directory.
If you are using a Java KeyStore, don't forget to specify the password via the `REPOSILITE_LOCAL_KEYPASSWORD` environment variable.
See [https://reposilite.com/guide/ssl](https://reposilite.com/guide/ssl) for more information on how to set SSL up.

*Type:* null or string

*Default:* `null`

*Example:* `"\${WORKING_DIRECTORY}/cert.pem \${WORKING_DIRECTORY}/key.pem"`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.settings.port` {#opt-services.reposilite.settings.port}

The TCP port to bind to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.settings.sslEnabled` {#opt-services.reposilite.settings.sslEnabled}

Whether to listen for encrypted connections on `settings.sslPort`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.settings.sslPort` {#opt-services.reposilite.settings.sslPort}

SSL port to bind to. SSL needs to be enabled explicitly via `settings.enableSsl`.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `443`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.settings.webThreadPool` {#opt-services.reposilite.settings.webThreadPool}

Maximum amount of threads used by the core thread pool. (min: 5)
The web thread pool handles the first few steps of incoming HTTP connections, tasks are redirected as soon as possible to the IO thread pool.

*Type:* integer between 5 and 65535 (both inclusive)

*Default:* `16`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.useACMEHost` {#opt-services.reposilite.useACMEHost}

Host of an existing Let's Encrypt certificate to use for SSL.
Make sure that the certificate directory is readable by the `reposilite` user or group, for example via `security.acme.certs.<cert>.group`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [`security.acme.certs`](../../options/security/index.md#opt-security.acme.certs)*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.user` {#opt-services.reposilite.user}

The user to run Reposilite under.

*Type:* string

*Default:* `"reposilite"`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.reposilite.workingDirectory` {#opt-services.reposilite.workingDirectory}

Working directory for Reposilite.

*Type:* absolute path

*Default:* `"/var/lib/reposilite"`

*Declared by:* [`nixos/modules/services/web-apps/reposilite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/reposilite.nix)

## `services.resilio.apiKey` {#opt-services.resilio.apiKey}

API key, which enables the developer API.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/resilio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/resilio.nix)

## `services.resilio.checkForUpdates` {#opt-services.resilio.checkForUpdates}

Determines whether to check for updates and alert the user
about them in the UI.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/resilio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/resilio.nix)

## `services.resilio.deviceName` {#opt-services.resilio.deviceName}

Name of the Resilio Sync device.

*Type:* string

*Default:* `config.networking.hostName`

*Example:* `"Voltron"`

*Declared by:* [`nixos/modules/services/networking/resilio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/resilio.nix)

## `services.resilio.directoryRoot` {#opt-services.resilio.directoryRoot}

Default directory to add folders in the web UI.

*Type:* string

*Default:* `""`

*Example:* `"/media"`

*Declared by:* [`nixos/modules/services/networking/resilio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/resilio.nix)

## `services.resilio.downloadLimit` {#opt-services.resilio.downloadLimit}

Download speed limit. 0 is unlimited (default).

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Example:* `1024`

*Declared by:* [`nixos/modules/services/networking/resilio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/resilio.nix)

## `services.resilio.enable` {#opt-services.resilio.enable}

If enabled, start the Resilio Sync daemon. Once enabled, you can
interact with the service through the Web UI, or configure it in your
NixOS configuration.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/resilio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/resilio.nix)

## `services.resilio.enableWebUI` {#opt-services.resilio.enableWebUI}

Enable Web UI for administration. Bound to the specified
`httpListenAddress` and
`httpListenPort`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/resilio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/resilio.nix)

## `services.resilio.encryptLAN` {#opt-services.resilio.encryptLAN}

Encrypt LAN data.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/resilio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/resilio.nix)

## `services.resilio.httpListenAddr` {#opt-services.resilio.httpListenAddr}

HTTP address to bind to.

*Type:* string

*Default:* `"[::1]"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/networking/resilio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/resilio.nix)

## `services.resilio.httpListenPort` {#opt-services.resilio.httpListenPort}

HTTP port to bind on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9000`

*Declared by:* [`nixos/modules/services/networking/resilio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/resilio.nix)

## `services.resilio.httpLogin` {#opt-services.resilio.httpLogin}

HTTP web login username.

*Type:* string

*Default:* `""`

*Example:* `"allyourbase"`

*Declared by:* [`nixos/modules/services/networking/resilio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/resilio.nix)

## `services.resilio.httpPass` {#opt-services.resilio.httpPass}

HTTP web login password.

*Type:* string

*Default:* `""`

*Example:* `"arebelongtous"`

*Declared by:* [`nixos/modules/services/networking/resilio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/resilio.nix)

## `services.resilio.listeningPort` {#opt-services.resilio.listeningPort}

Listening port. Defaults to 0 which randomizes the port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `0`

*Example:* `44444`

*Declared by:* [`nixos/modules/services/networking/resilio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/resilio.nix)

## `services.resilio.package` {#opt-services.resilio.package}

The resilio-sync package to use.

*Type:* package

*Default:* `pkgs.resilio-sync`

*Declared by:* [`nixos/modules/services/networking/resilio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/resilio.nix)

## `services.resilio.sharedFolders` {#opt-services.resilio.sharedFolders}

Shared folder list. If enabled, web UI must be
disabled. Secrets can be generated using `rslsync --generate-secret`.

If you would like to be able to modify the contents of this
directories, it is recommended that you make your user a
member of the `rslsync` group.

Directories in this list should be in the
`rslsync` group, and that group must have
write access to the directory. It is also recommended that
`chmod g+s` is applied to the directory
so that any sub directories created will also belong to
the `rslsync` group. Also,
`setfacl -d -m group:rslsync:rwx` and
`setfacl -m group:rslsync:rwx` should also
be applied so that the sub directories are writable by
the group.

*Type:* list of attribute set of anything

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    directory = "/home/user/sync_test";
    knownHosts = [
      "192.168.1.2:4444"
      "192.168.1.3:4444"
    ];
    searchLAN = true;
    secretFile = "/run/resilio-secret";
    useDHT = false;
    useRelayServer = true;
    useSyncTrash = true;
    useTracker = true;
  }
]
```

*Declared by:* [`nixos/modules/services/networking/resilio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/resilio.nix)

## `services.resilio.storagePath` {#opt-services.resilio.storagePath}

Where BitTorrent Sync will store it's database files (containing
things like username info and licenses). Generally, you should not
need to ever change this.

*Type:* absolute path

*Default:* `"/var/lib/resilio-sync/"`

*Declared by:* [`nixos/modules/services/networking/resilio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/resilio.nix)

## `services.resilio.uploadLimit` {#opt-services.resilio.uploadLimit}

Upload speed limit. 0 is unlimited (default).

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Example:* `1024`

*Declared by:* [`nixos/modules/services/networking/resilio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/resilio.nix)

## `services.resilio.useUpnp` {#opt-services.resilio.useUpnp}

Use Universal Plug-n-Play (UPnP)

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/resilio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/resilio.nix)

## `services.resolved.dnsDelegates` {#opt-services.resolved.dnsDelegates}

dns-delegate files to be created.
See `systemd.dns-delegate(5)` for more info.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/resolved.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/resolved.nix)

## `services.resolved.dnsDelegates.<name>.Delegate` {#opt-services.resolved.dnsDelegates._name_.Delegate}

Settings option for systemd dns-delegate files.
See `systemd.dns-delegate(5)` for all available options.

*Type:* open submodule of attribute set of (systemd option)

*Declared by:* [`nixos/modules/system/boot/resolved.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/resolved.nix)

## `services.resolved.enable` {#opt-services.resolved.enable}

Whether to enable the Systemd DNS resolver daemon (systemd-resolved).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/resolved.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/resolved.nix)

## `services.resolved.settings.Resolve` {#opt-services.resolved.settings.Resolve}

Settings option for systemd-resolved.
See `resolved.conf(5)` for all available options.

*Type:* open submodule of attribute set of (systemd option)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/resolved.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/resolved.nix)

## `services.resolved.settings.Resolve.DNS` {#opt-services.resolved.settings.Resolve.DNS}

List of IP addresses to query as recursive DNS resolvers.

*Type:* systemd option

*Default:* `config.networking.nameservers`

*Declared by:* [`nixos/modules/system/boot/resolved.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/resolved.nix)

## `services.resolved.settings.Resolve.DNSOverTLS` {#opt-services.resolved.settings.Resolve.DNSOverTLS}

Whether to use TLS encryption for DNS queries. Requires
nameservers that support DNS-over-TLS.

*Type:* systemd option

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/resolved.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/resolved.nix)

## `services.resolved.settings.Resolve.DNSSEC` {#opt-services.resolved.settings.Resolve.DNSSEC}

Whether to validate DNSSEC for DNS lookups.

*Type:* systemd option

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/resolved.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/resolved.nix)

## `services.resolved.settings.Resolve.Domains` {#opt-services.resolved.settings.Resolve.Domains}

List of search domains used to complete unqualified name lookups.

*Type:* systemd option

*Default:* `config.networking.search`

*Example:*

``` nix
[
  "scope.example.com"
  "example.com"
]
```

*Declared by:* [`nixos/modules/system/boot/resolved.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/resolved.nix)

## `services.restic.backups` {#opt-services.restic.backups}

Periodic backups to create with Restic.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  commandbackup = {
    command = [
      "\${lib.getExe pkgs.sudo}"
      "-u postgres"
      "\${pkgs.postgresql}/bin/pg_dumpall"
    ];
    environmentFile = "/etc/nixos/secrets/restic-environment";
    extraBackupArgs = [
      "--tag database"
    ];
    passwordFile = "/etc/nixos/secrets/restic-password";
    pruneOpts = [
      "--keep-daily 14"
      "--keep-weekly 4"
      "--keep-monthly 2"
      "--group-by tags"
    ];
    repository = "s3:example.com/mybucket";
  };
  localbackup = {
    exclude = [
      "/home/*/.cache"
    ];
    initialize = true;
    passwordFile = "/etc/nixos/secrets/restic-password";
    paths = [
      "/home"
    ];
    repository = "/mnt/backup-hdd";
  };
  remotebackup = {
    extraOptions = [
      "sftp.command='ssh backup@host -i /etc/nixos/secrets/backup-private-key -s sftp'"
    ];
    passwordFile = "/etc/nixos/secrets/restic-password";
    paths = [
      "/home"
    ];
    repository = "sftp:backup@host:/backups/home";
    timerConfig = {
      OnCalendar = "00:05";
      RandomizedDelaySec = "5h";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.backupCleanupCommand` {#opt-services.restic.backups._name_.backupCleanupCommand}

A script that must run after finishing the backup process.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.backupPrepareCommand` {#opt-services.restic.backups._name_.backupPrepareCommand}

A script that must run before starting the backup process.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.checkOpts` {#opt-services.restic.backups._name_.checkOpts}

A list of options for 'restic check'.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--with-cache"
]
```

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.command` {#opt-services.restic.backups._name_.command}

Command to pass to --stdin-from-command. If null or an empty array, and `paths`/`dynamicFilesFrom`
are also null, no backup command will be run.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "sudo"
  "-u"
  "postgres"
  "pg_dumpall"
]
```

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.createWrapper` {#opt-services.restic.backups._name_.createWrapper}

Whether to generate and add a script to the system path, that has the same environment variables set
as the systemd service. This can be used to e.g. mount snapshots or perform other opterations, without
having to manually specify most options.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.dynamicFilesFrom` {#opt-services.restic.backups._name_.dynamicFilesFrom}

A script that produces a list of files to back up.  The
results of this command are given to the '--files-from'
option. The result is merged with paths specified via `paths`.

*Type:* null or string

*Default:* `null`

*Example:* `"find /home/matt/git -type d -name .git"`

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.environmentFile` {#opt-services.restic.backups._name_.environmentFile}

file containing the credentials to access the repository, in the
format of an EnvironmentFile as described by `systemd.exec(5)`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.exclude` {#opt-services.restic.backups._name_.exclude}

Patterns to exclude when backing up. See
https://restic.readthedocs.io/en/latest/040\_backup.html#excluding-files for
details on syntax.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/var/cache"
  "/home/*/.cache"
  ".git"
]
```

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.extraBackupArgs` {#opt-services.restic.backups._name_.extraBackupArgs}

Extra arguments passed to restic backup.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--cleanup-cache"
  "--exclude-file=/etc/nixos/restic-ignore"
]
```

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.extraOptions` {#opt-services.restic.backups._name_.extraOptions}

Extra extended options to be passed to the restic --option flag.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "sftp.command='ssh backup@192.168.1.100 -i /home/user/.ssh/id_rsa -s sftp'"
]
```

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.inhibitsSleep` {#opt-services.restic.backups._name_.inhibitsSleep}

Prevents the system from sleeping while backing up.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.initialize` {#opt-services.restic.backups._name_.initialize}

Create the repository if it doesn't exist.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.noCache` {#opt-services.restic.backups._name_.noCache}

Disables local caching of repository data. May improve performance for local repositories.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.package` {#opt-services.restic.backups._name_.package}

The restic package to use.

*Type:* package

*Default:* `pkgs.restic`

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.passwordFile` {#opt-services.restic.backups._name_.passwordFile}

Read the repository password from a file.

*Type:* null or string

*Default:* `null`

*Example:* `"/etc/nixos/restic-password"`

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.paths` {#opt-services.restic.backups._name_.paths}

Which paths to backup, in addition to ones specified via
`dynamicFilesFrom`.  If null or an empty array and
`dynamicFilesFrom` is also null, no backup command will be run.
This can be used to create a prune-only job.

*Type:* null or (list of string)

*Default:* `[ ]`

*Example:*

``` nix
[
  "/var/lib/postgresql"
  "/home/user/backup"
]
```

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.progressFps` {#opt-services.restic.backups._name_.progressFps}

Controls the frequency of progress reporting.

*Type:* null or (nonnegative integer or floating point number, meaning \>=0)

*Default:* `null`

*Example:* `0.1`

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.pruneOpts` {#opt-services.restic.backups._name_.pruneOpts}

A list of options (--keep-\* et al.) for 'restic forget
--prune', to automatically prune old snapshots.  The
'forget' command is run *after* the 'backup' command, so
keep that in mind when constructing the --keep-\* options.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--keep-daily 7"
  "--keep-weekly 5"
  "--keep-monthly 12"
  "--keep-yearly 75"
]
```

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.rcloneConfig` {#opt-services.restic.backups._name_.rcloneConfig}

Configuration for the rclone remote being used for backup.
See the remote's specific options under rclone's docs at
[https://rclone.org/docs/](https://rclone.org/docs/). When specifying
option names, use the "config" name specified in the docs.
For example, to set `--b2-hard-delete` for a B2
remote, use `hard_delete = true` in the
attribute set.
Warning: Secrets set in here will be world-readable in the Nix
store! Consider using the `rcloneConfigFile`
option instead to specify secret values separately. Note that
options set here will override those set in the config file.

*Type:* null or (attribute set of (string or boolean))

*Default:* `null`

*Example:*

``` nix
{
  account = "xxx";
  hard_delete = true;
  key = "xxx";
  type = "b2";
}
```

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.rcloneConfigFile` {#opt-services.restic.backups._name_.rcloneConfigFile}

Path to the file containing rclone configuration. This file
must contain configuration for the remote specified in this backup
set and also must be readable by root. Options set in
`rcloneConfig` will override those set in this
file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.rcloneOptions` {#opt-services.restic.backups._name_.rcloneOptions}

Options to pass to rclone to control its behavior.
See [https://rclone.org/docs/#options](https://rclone.org/docs/#options) for
available options. When specifying option names, strip the
leading `--`. To set a flag such as
`--drive-use-trash`, which does not take a value,
set the value to the Boolean `true`.

*Type:* null or (attribute set of (string or boolean))

*Default:* `null`

*Example:*

``` nix
{
  bwlimit = "10M";
  drive-use-trash = "true";
}
```

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.repository` {#opt-services.restic.backups._name_.repository}

repository to backup to.

*Type:* null or string

*Default:* `null`

*Example:* `"sftp:backup@192.168.1.100:/backups/‹name›"`

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.repositoryFile` {#opt-services.restic.backups._name_.repositoryFile}

Path to the file containing the repository location to backup to.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.runCheck` {#opt-services.restic.backups._name_.runCheck}

Whether to run the `check` command with the provided `checkOpts` options.

*Type:* boolean

*Default:* `builtins.length config.services.backups.‹name›.checkOpts > 0`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.timerConfig` {#opt-services.restic.backups._name_.timerConfig}

When to run the backup. See `systemd.timer(5)` for
details. If null no timer is created and the backup will only
run when explicitly started.

*Type:* null or (attribute set of (systemd option))

*Default:*

``` nix
{
  OnCalendar = "daily";
  Persistent = true;
}
```

*Example:*

``` nix
{
  OnCalendar = "00:05";
  Persistent = true;
  RandomizedDelaySec = "5h";
}
```

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.backups.<name>.user` {#opt-services.restic.backups._name_.user}

As which user the backup should run.

*Type:* string

*Default:* `"root"`

*Example:* `"postgresql"`

*Declared by:* [`nixos/modules/services/backup/restic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic.nix)

## `services.restic.server.appendOnly` {#opt-services.restic.server.appendOnly}

Enable append only mode.
This mode allows creation of new backups but prevents deletion and modification of existing backups.
This can be useful when backing up systems that have a potential of being hacked.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/restic-rest-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic-rest-server.nix)

## `services.restic.server.dataDir` {#opt-services.restic.server.dataDir}

The directory for storing the restic repository.

*Type:* absolute path

*Default:* `"/var/lib/restic"`

*Declared by:* [`nixos/modules/services/backup/restic-rest-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic-rest-server.nix)

## `services.restic.server.enable` {#opt-services.restic.server.enable}

Whether to enable Restic REST Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/restic-rest-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic-rest-server.nix)

## `services.restic.server.extraFlags` {#opt-services.restic.server.extraFlags}

Extra commandline options to pass to Restic REST server.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/backup/restic-rest-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic-rest-server.nix)

## `services.restic.server.htpasswd-file` {#opt-services.restic.server.htpasswd-file}

The path to the servers .htpasswd file. Defaults to `${dataDir}/.htpasswd`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/restic-rest-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic-rest-server.nix)

## `services.restic.server.listenAddress` {#opt-services.restic.server.listenAddress}

Listen on a specific IP address and port or unix socket.

*Type:* string

*Default:* `"8000"`

*Example:* `"127.0.0.1:8080"`

*Declared by:* [`nixos/modules/services/backup/restic-rest-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic-rest-server.nix)

## `services.restic.server.package` {#opt-services.restic.server.package}

The restic-rest-server package to use.

*Type:* package

*Default:* `pkgs.restic-rest-server`

*Declared by:* [`nixos/modules/services/backup/restic-rest-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic-rest-server.nix)

## `services.restic.server.privateRepos` {#opt-services.restic.server.privateRepos}

Enable private repos.
Grants access only when a subdirectory with the same name as the user is specified in the repository URL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/restic-rest-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic-rest-server.nix)

## `services.restic.server.prometheus` {#opt-services.restic.server.prometheus}

Enable Prometheus metrics at /metrics.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/restic-rest-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/restic-rest-server.nix)

## `services.rethinkdb.dbpath` {#opt-services.rethinkdb.dbpath}

Location where RethinkDB stores its data, 1 data directory per instance.

*Type:* unspecified value

*Default:* `"/var/db/rethinkdb"`

*Declared by:* [`nixos/modules/services/databases/rethinkdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/rethinkdb.nix)

## `services.rethinkdb.enable` {#opt-services.rethinkdb.enable}

Whether to enable RethinkDB server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/rethinkdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/rethinkdb.nix)

## `services.rethinkdb.group` {#opt-services.rethinkdb.group}

Group which rethinkdb user belongs to.

*Type:* unspecified value

*Default:* `"rethinkdb"`

*Declared by:* [`nixos/modules/services/databases/rethinkdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/rethinkdb.nix)

## `services.rethinkdb.pidpath` {#opt-services.rethinkdb.pidpath}

Location where each instance's pid file is located.

*Type:* unspecified value

*Default:* `"/run/rethinkdb"`

*Declared by:* [`nixos/modules/services/databases/rethinkdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/rethinkdb.nix)

## `services.rethinkdb.user` {#opt-services.rethinkdb.user}

User account under which RethinkDB runs.

*Type:* unspecified value

*Default:* `"rethinkdb"`

*Declared by:* [`nixos/modules/services/databases/rethinkdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/rethinkdb.nix)

## `services.riemann-dash.config` {#opt-services.riemann-dash.config}

Contents added to the end of the riemann-dash configuration file.

*Type:* strings concatenated with "\\n"

*Declared by:* [`nixos/modules/services/monitoring/riemann-dash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/riemann-dash.nix)

## `services.riemann-dash.dataDir` {#opt-services.riemann-dash.dataDir}

Location of the riemann-base dir. The dashboard configuration file is
is stored to this directory. The directory is created automatically on
service start, and owner is set to the riemanndash user.

*Type:* string

*Default:* `"/var/riemann-dash"`

*Declared by:* [`nixos/modules/services/monitoring/riemann-dash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/riemann-dash.nix)

## `services.riemann-dash.enable` {#opt-services.riemann-dash.enable}

Enable the riemann-dash dashboard daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/riemann-dash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/riemann-dash.nix)

## `services.riemann-tools.enableHealth` {#opt-services.riemann-tools.enableHealth}

Enable the riemann-health daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/riemann-tools.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/riemann-tools.nix)

## `services.riemann-tools.extraArgs` {#opt-services.riemann-tools.extraArgs}

A list of commandline-switches forwarded to a riemann-tool.
See for example `riemann-health --help` for available options.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-p 5555"
  "--timeout=30"
  "--attribute=myattribute=42"
]
```

*Declared by:* [`nixos/modules/services/monitoring/riemann-tools.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/riemann-tools.nix)

## `services.riemann-tools.riemannHost` {#opt-services.riemann-tools.riemannHost}

Address of the host riemann node. Defaults to localhost.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/monitoring/riemann-tools.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/riemann-tools.nix)

## `services.riemann.config` {#opt-services.riemann.config}

Contents of the Riemann configuration file. For more complicated
config you should use configFile.

*Type:* strings concatenated with "\\n"

*Declared by:* [`nixos/modules/services/monitoring/riemann.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/riemann.nix)

## `services.riemann.configFile` {#opt-services.riemann.configFile}

A Riemann config file. Any files in the same directory as this file
will be added to the classpath by Riemann.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/riemann.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/riemann.nix)

## `services.riemann.configFiles` {#opt-services.riemann.configFiles}

Extra files containing Riemann configuration. These files will be
loaded at runtime by Riemann (with Clojure's
`load-file` function) at the end of the
configuration if you use the config option, this is ignored if you
use configFile.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/riemann.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/riemann.nix)

## `services.riemann.enable` {#opt-services.riemann.enable}

Whether to enable Riemann network monitoring daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/riemann.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/riemann.nix)

## `services.riemann.extraClasspathEntries` {#opt-services.riemann.extraClasspathEntries}

Extra entries added to the Java classpath when running Riemann.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/riemann.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/riemann.nix)

## `services.riemann.extraJavaOpts` {#opt-services.riemann.extraJavaOpts}

Extra Java options used when launching Riemann.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/riemann.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/riemann.nix)

## `services.rimgo.enable` {#opt-services.rimgo.enable}

Whether to enable rimgo.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/rimgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rimgo.nix)

## `services.rimgo.package` {#opt-services.rimgo.package}

The rimgo package to use.

*Type:* package

*Default:* `pkgs.rimgo`

*Declared by:* [`nixos/modules/services/web-apps/rimgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rimgo.nix)

## `services.rimgo.settings` {#opt-services.rimgo.settings}

Settings for rimgo, see [the official documentation](https://rimgo.codeberg.page/docs/usage/configuration/) for supported options.

*Type:* open submodule of attribute set of string

*Example:*

``` nix
{
  PORT = 69420;
  FORCE_WEBP = "1";
}
```

*Declared by:* [`nixos/modules/services/web-apps/rimgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rimgo.nix)

## `services.rimgo.settings.ADDRESS` {#opt-services.rimgo.settings.ADDRESS}

The address to listen on.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"1.1.1.1"`

*Declared by:* [`nixos/modules/services/web-apps/rimgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rimgo.nix)

## `services.rimgo.settings.PORT` {#opt-services.rimgo.settings.PORT}

The port to use.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Example:* `69420`

*Declared by:* [`nixos/modules/services/web-apps/rimgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rimgo.nix)

## `services.ringboard.wayland.enable` {#opt-services.ringboard.wayland.enable}

Whether to enable Wayland support for Ringboard.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/ringboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ringboard.nix)

## `services.ringboard.wayland.package` {#opt-services.ringboard.wayland.package}

The ringboard-wayland package to use.

*Type:* package

*Default:* `pkgs.ringboard-wayland`

*Declared by:* [`nixos/modules/services/misc/ringboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ringboard.nix)

## `services.ringboard.x11.enable` {#opt-services.ringboard.x11.enable}

Whether to enable X11 support for Ringboard.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/ringboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ringboard.nix)

## `services.ringboard.x11.package` {#opt-services.ringboard.x11.package}

The ringboard package to use.

*Type:* package

*Default:* `pkgs.ringboard`

*Declared by:* [`nixos/modules/services/misc/ringboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ringboard.nix)

## `services.rke2.agentToken` {#opt-services.rke2.agentToken}

The rke2 token agents can use to connect to the server.
This option only makes sense on server nodes (`role = server`).

**WARNING**: This option will expose your token unencrypted in the world-readable nix store.
If this is undesired use the tokenFile option instead.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.agentTokenFile` {#opt-services.rke2.agentTokenFile}

File path containing the rke2 token agents can use to connect to the server.
This option only makes sense on server nodes (`role = server`).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.autoDeployCharts` {#opt-services.rke2.autoDeployCharts}

Auto deploying Helm charts that are installed by the rke2 Helm controller. Avoid using
attribute names that are also used in the [services (R)](#opt-services.rke2.manifests) and
[services (R)](#opt-services.rke2.charts) options. Manifests with the same name will override
auto deploying charts with the same name.
This option only makes sense on server nodes (`role = server`). See the
[rke2 Helm documentation](https://docs.rke2.io/helm) for further information.

**WARNING**: If you have multiple server nodes, and set this option on more than one server,
it is your responsibility to ensure that files stay in sync across those nodes. AddOn content is
not synced between nodes, and rke2 cannot guarantee correct behavior if different servers attempt
to deploy conflicting manifests.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  harbor = {
    name = "harbor";
    repo = "https://helm.goharbor.io";
    version = "1.14.0";
    hash = "sha256-fMP7q1MIbvzPGS9My91vbQ1d3OJMjwc+o8YE/BXZaYU=";
    values = {
      existingSecretAdminPassword = "harbor-admin";
      expose = {
        tls = {
          enabled = true;
          certSource = "secret";
          secret.secretName = "my-tls-secret";
        };
        ingress = {
          hosts.core = "example.com";
          className = "nginx";
        };
      };
    };
  };
  nginx = {
    repo = "oci://registry-1.docker.io/bitnamicharts/nginx";
    version = "20.0.0";
    hash = "sha256-sy+tzB+i9jIl/tqOMzzuhVhTU4EZVsoSBtPznxF/36c=";
  };
  custom-chart = {
    package = ../charts/my-chart.tgz;
    values = ../values/my-values.yaml;
    extraFieldDefinitions = {
      spec.timeout = "60s";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.autoDeployCharts.<name>.createNamespace` {#opt-services.rke2.autoDeployCharts._name_.createNamespace}

Whether to create the target namespace if not present.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.autoDeployCharts.<name>.enable` {#opt-services.rke2.autoDeployCharts._name_.enable}

Whether to enable the installation of this Helm chart. Note that setting
this option to `false` will not uninstall the chart from the cluster, if
it was previously installed. Please use the the `--disable` flag or `.skip`
files to delete/disable Helm charts, as mentioned in the
[docs](https://docs.k3s.io/installation/packaged-components#disabling-manifests).

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.autoDeployCharts.<name>.extraDeploy` {#opt-services.rke2.autoDeployCharts._name_.extraDeploy}

List of extra Kubernetes manifests to deploy with this Helm chart.

*Type:* list of (absolute path or (attribute set))

*Default:* `[ ]`

*Example:*

``` nix
[
  ../manifests/my-extra-deployment.yaml
  {
    apiVersion = "v1";
    kind = "Service";
    metadata = {
      name = "app-service";
    };
    spec = {
      selector = {
        "app.kubernetes.io/name" = "MyApp";
      };
      ports = [
        {
          name = "name-of-service-port";
          protocol = "TCP";
          port = 80;
          targetPort = "http-web-svc";
        }
      ];
    };
  }
];
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.autoDeployCharts.<name>.extraFieldDefinitions` {#opt-services.rke2.autoDeployCharts._name_.extraFieldDefinitions}

Extra HelmChart field definitions that are merged with the rest of the HelmChart
custom resource. This can be used to set advanced fields or to overwrite
generated fields. See [https://docs.rke2.io/helm#helmchart-field-definitions](https://docs.rke2.io/helm#helmchart-field-definitions)
for possible fields.

*Type:* JSON value

*Default:* `{ }`

*Example:*

``` nix
{
  spec = {
    backOffLimit = 3;
    bootstrap = true;
    helmVersion = "v2";
    jobImage = "custom-helm-controller:v0.0.1";
  };
}
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.autoDeployCharts.<name>.hash` {#opt-services.rke2.autoDeployCharts._name_.hash}

The hash of the packaged Helm chart. Only has an effect if `package` is not set.
The Helm chart is fetched during build time and placed as a `.tgz` archive on the
filesystem.

*Type:* string

*Default:* `""`

*Example:* `"sha256-ej+vpPNdiOoXsaj1jyRpWLisJgWo8EqX+Z5VbpSjsPA="`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.autoDeployCharts.<name>.name` {#opt-services.rke2.autoDeployCharts._name_.name}

The name of the Helm chart. Only has an effect if `package` is not set.
The Helm chart is fetched during build time and placed as a `.tgz` archive on the
filesystem.

*Type:* non-empty string

*Example:* `"ingress-nginx"`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.autoDeployCharts.<name>.package` {#opt-services.rke2.autoDeployCharts._name_.package}

The packaged Helm chart. Overwrites the options `repo`, `name`, `version`
and `hash` in case of conflicts.

*Type:* absolute path or package

*Example:* `../my-helm-chart.tgz`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.autoDeployCharts.<name>.repo` {#opt-services.rke2.autoDeployCharts._name_.repo}

The repo of the Helm chart. Only has an effect if `package` is not set.
The Helm chart is fetched during build time and placed as a `.tgz` archive on the
filesystem.

*Type:* non-empty string

*Example:* `"https://kubernetes.github.io/ingress-nginx"`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.autoDeployCharts.<name>.targetNamespace` {#opt-services.rke2.autoDeployCharts._name_.targetNamespace}

The namespace in which the Helm chart gets installed.

*Type:* non-empty string

*Default:* `"default"`

*Example:* `"kube-system"`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.autoDeployCharts.<name>.values` {#opt-services.rke2.autoDeployCharts._name_.values}

Override default chart values via Nix expressions. This is equivalent to setting
values in a `values.yaml` file.

**WARNING**: The values (including secrets!) specified here are exposed unencrypted
in the world-readable nix store.

*Type:* absolute path or (attribute set)

*Default:* `{ }`

*Example:*

``` nix
{
  hostName = "my-host";
  replicaCount = 3;
  server = {
    name = "nginx";
    port = 80;
  };
}
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.autoDeployCharts.<name>.version` {#opt-services.rke2.autoDeployCharts._name_.version}

The version of the Helm chart. Only has an effect if `package` is not set.
The Helm chart is fetched during build time and placed as a `.tgz` archive on the
filesystem.

*Type:* non-empty string

*Example:* `"4.7.0"`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.charts` {#opt-services.rke2.charts}

Packaged Helm charts that are linked to `/var/lib/rancher/rke2/server/static/charts` before rke2 starts.
The attribute name will be used as the link target (relative to `/var/lib/rancher/rke2/server/static/charts`).
The specified charts will only be placed on the file system and made available via port 9345 on server nodes. See the [services (R)](#opt-services.rke2.autoDeployCharts) option and the
[rke2 Helm controller docs](https://docs.rke2.io/helm#using-the-helm-controller)
to deploy Helm charts. This option only makes sense on server nodes (`role = server`).

*Type:* attribute set of (absolute path or package)

*Default:* `{ }`

*Example:*

``` nix
nginx = ../charts/my-nginx-chart.tgz;
redis = ../charts/my-redis-chart.tgz;
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.cisHardening` {#opt-services.rke2.cisHardening}

Enable CIS Hardening for RKE2.

The OS-level configuration options required to pass the CIS benchmark are enabled by default.
This option only creates the `etcd` user and group, and passes the `--profile=cis` flag to RKE2.

Learn more about [CIS Hardening for RKE2](https://docs.rke2.io/security/hardening_guide).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.cni` {#opt-services.rke2.cni}

CNI plugins to deploy, one of `none`, `calico`, `canal`, `cilium` or `flannel`.

All CNI plugins get installed via a helm chart after the main components are up and running
and can be [customized by modifying the helm chart options](https://docs.rke2.io/helm).

[Learn more about RKE2 and CNI plugins](https://docs.rke2.io/networking/basic_network_options)

> **WARNING**: Flannel support in RKE2 is currently experimental.

*Type:* null or one of "none", "canal", "cilium", "calico", "flannel"

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.configPath` {#opt-services.rke2.configPath}

File path containing the rke2 YAML config. This is useful when the config is generated (for example on boot).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.containerdConfigTemplate` {#opt-services.rke2.containerdConfigTemplate}

Config template for containerd, to be placed at
`/var/lib/rancher/rke2/agent/etc/containerd/config.toml.tmpl`.
rke2 renders this template as containerd's legacy version 2 configuration and ignores
it when [services (R)](#opt-services.rke2.containerdConfigTemplateV3) is set.
See the docs on [configuring containerd](https://docs.rke2.io/advanced#configuring-containerd).

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
# Base config
{{ template "base" . }}

# Add a custom runtime
[plugins."io.containerd.grpc.v1.cri".containerd.runtimes."custom"]
  runtime_type = "io.containerd.runc.v2"
[plugins."io.containerd.grpc.v1.cri".containerd.runtimes."custom".options]
  BinaryName = "/path/to/custom-container-runtime"
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.containerdConfigTemplateV3` {#opt-services.rke2.containerdConfigTemplateV3}

Config template for containerd in its version 3 configuration format, to be placed at
`/var/lib/rancher/rke2/agent/etc/containerd/config-v3.toml.tmpl`.
rke2 uses this template instead of [services (R)](#opt-services.rke2.containerdConfigTemplate)
when both are set.
See the docs on [configuring containerd](https://docs.rke2.io/advanced#configuring-containerd).

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
# Base config
{{ template "base" . }}

# Add a custom runtime
[plugins.'io.containerd.cri.v1.runtime'.containerd.runtimes.custom]
  runtime_type = "io.containerd.runc.v2"
[plugins.'io.containerd.cri.v1.runtime'.containerd.runtimes.custom.options]
  BinaryName = "/path/to/custom-container-runtime"
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.disable` {#opt-services.rke2.disable}

Disable default components, see the [RKE2 documentation](https://docs.rke2.io/install/packaged_components#using-the---disable-flag).

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.enable` {#opt-services.rke2.enable}

Whether to enable rke2.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.environmentFile` {#opt-services.rke2.environmentFile}

File path containing environment variables for configuring the rke2 service in the format of an EnvironmentFile. See `systemd.exec(5)`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.extraFlags` {#opt-services.rke2.extraFlags}

Extra flags to pass to the rke2 command.

*Type:* string or list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--etcd-expose-metrics"
  "--cluster-cidr 10.24.0.0/16"
]
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.extraKubeProxyConfig` {#opt-services.rke2.extraKubeProxyConfig}

Extra configuration to add to the kube-proxy's configuration file. The subset of the kube-proxy's
configuration that can be configured via a file is defined by the
[KubeProxyConfiguration](https://kubernetes.io/docs/reference/config-api/kube-proxy-config.v1alpha1/)
struct. Note that the kubeconfig param will be overriden by `clientConnection.kubeconfig`, so you must
set the `clientConnection.kubeconfig` option if you want to use `extraKubeProxyConfig`.

*Type:* attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  clientConnection = {
    kubeconfig = "/var/lib/rancher/rke2/agent/kubeproxy.kubeconfig";
  };
  mode = "nftables";
}
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.extraKubeletConfig` {#opt-services.rke2.extraKubeletConfig}

Extra configuration to add to the kubelet's configuration file. The subset of the kubelet's
configuration that can be configured via a file is defined by the
[KubeletConfiguration](https://kubernetes.io/docs/reference/config-api/kubelet-config.v1beta1/)
struct. See the
[documentation](https://kubernetes.io/docs/tasks/administer-cluster/kubelet-config-file/)
for further information.

*Type:* attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  containerLogMaxSize = "5Mi";
  memoryThrottlingFactor = 0.69;
  podsPerCore = 3;
}
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.gracefulNodeShutdown.enable` {#opt-services.rke2.gracefulNodeShutdown.enable}

Whether to enable graceful node shutdowns where the kubelet attempts to detect
node system shutdown and terminates pods running on the node. See the
[documentation](https://kubernetes.io/docs/concepts/cluster-administration/node-shutdown/#graceful-node-shutdown)
for further information.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.gracefulNodeShutdown.shutdownGracePeriod` {#opt-services.rke2.gracefulNodeShutdown.shutdownGracePeriod}

Specifies the total duration that the node should delay the shutdown by. This is the total
grace period for pod termination for both regular and critical pods.

*Type:* non-empty string

*Default:* `"30s"`

*Example:* `"1m30s"`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.gracefulNodeShutdown.shutdownGracePeriodCriticalPods` {#opt-services.rke2.gracefulNodeShutdown.shutdownGracePeriodCriticalPods}

Specifies the duration used to terminate critical pods during a node shutdown. This should be
less than `shutdownGracePeriod`.

*Type:* non-empty string

*Default:* `"10s"`

*Example:* `"15s"`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.images` {#opt-services.rke2.images}

List of derivations that provide container images.
All images are linked into `/var/lib/rancher/rke2/agent/images/nixos/` before rke2 starts and are consequently imported
by the rke2 agent. Consider importing the rke2 core and CNI image archives of the rke2 package in
use, if you want to pre-provision this node with all rke2 container images. For a full list of available airgap images, check the
[source](https://github.com/NixOS/nixpkgs/blob/c8a1939887ee6e5f5aae29ce97321c0d83165f7d/pkgs/applications/networking/cluster/rke2/1_32/images-versions.json).
of the rke2 package in use.

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
[
  (pkgs.dockerTools.pullImage {
    imageName = "docker.io/bitnami/keycloak";
    imageDigest = "sha256:714dfadc66a8e3adea6609bda350345bd3711657b7ef3cf2e8015b526bac2d6b";
    hash = "sha256-IM2BLZ0EdKIZcRWOtuFY9TogZJXCpKtPZnMnPsGlq0Y=";
    finalImageTag = "21.1.2-debian-11-r0";
  })

  config.services.rke2.package.images-core-linux-amd64-tar-zst
  config.services.rke2.package.images-canal-linux-amd64-tar-zst
]
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.manifests` {#opt-services.rke2.manifests}

Auto-deploying manifests that are linked to `/var/lib/rancher/rke2/server/manifests` before rke2 starts.
Note that deleting manifest files will not remove or otherwise modify the resources
it created. Please use the the `--disable` flag or `.skip` files to delete/disable AddOns,
as mentioned in the [docs](https://docs.k3s.io/installation/packaged-components#disabling-manifests).
This option only makes sense on server nodes (`role = server`).
Read the [auto-deploying manifests docs](https://docs.k3s.io/installation/packaged-components#auto-deploying-manifests-addons)
for further information.

**WARNING**: If you have multiple server nodes, and set this option on more than one server,
it is your responsibility to ensure that files stay in sync across those nodes. AddOn content is
not synced between nodes, and rke2 cannot guarantee correct behavior if different servers attempt
to deploy conflicting manifests.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  deployment.source = ../manifests/deployment.yaml;
  my-service = {
    enable = false;
    target = "app-service.yaml";
    content = {
      apiVersion = "v1";
      kind = "Service";
      metadata = {
        name = "app-service";
      };
      spec = {
        selector = {
          "app.kubernetes.io/name" = "MyApp";
        };
        ports = [
          {
            name = "name-of-service-port";
            protocol = "TCP";
            port = 80;
            targetPort = "http-web-svc";
          }
        ];
      };
    };
  };

  nginx.content = [
    {
      apiVersion = "v1";
      kind = "Pod";
      metadata = {
        name = "nginx";
        labels = {
          "app.kubernetes.io/name" = "MyApp";
        };
      };
      spec = {
        containers = [
          {
            name = "nginx";
            image = "nginx:1.14.2";
            ports = [
              {
                containerPort = 80;
                name = "http-web-svc";
              }
            ];
          }
        ];
      };
    }
    {
      apiVersion = "v1";
      kind = "Service";
      metadata = {
        name = "nginx-service";
      };
      spec = {
        selector = {
          "app.kubernetes.io/name" = "MyApp";
        };
        ports = [
          {
            name = "name-of-service-port";
            protocol = "TCP";
            port = 80;
            targetPort = "http-web-svc";
          }
        ];
      };
    }
  ];
};
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.manifests.<name>.content` {#opt-services.rke2.manifests._name_.content}

Content of the manifest file. A single attribute set will
generate a single document YAML file. A list of attribute sets
will generate multiple documents separated by `---` in a single
YAML file.

*Type:* null or (attribute set) or list of (attribute set)

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.manifests.<name>.enable` {#opt-services.rke2.manifests._name_.enable}

Whether this manifest file should be generated.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.manifests.<name>.source` {#opt-services.rke2.manifests._name_.source}

Path of the source `.yaml` file.

*Type:* absolute path

*Example:* `./manifests/app.yaml`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.manifests.<name>.target` {#opt-services.rke2.manifests._name_.target}

Name of the symlink (relative to `/var/lib/rancher/rke2/server/manifests`).
Defaults to the attribute name.

*Type:* non-empty string

*Example:* `"manifest.yaml"`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.nodeExternalIP` {#opt-services.rke2.nodeExternalIP}

IPv4/IPv6 external addresses to advertise for node.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.nodeIP` {#opt-services.rke2.nodeIP}

IPv4/IPv6 addresses to advertise for node.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.nodeLabel` {#opt-services.rke2.nodeLabel}

Registering and starting kubelet with set of labels.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.nodeName` {#opt-services.rke2.nodeName}

Node name.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.nodeTaint` {#opt-services.rke2.nodeTaint}

Registering kubelet with set of taints.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.package` {#opt-services.rke2.package}

The rke2 package to use.

*Type:* package

*Default:* `pkgs.rke2`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.role` {#opt-services.rke2.role}

Whether rke2 should run as a server or agent.

If it's a server:

- By default it also runs workloads as an agent.
- All options can be set.

If it's an agent:

- `serverAddr` is required.
- `token` or `tokenFile` is required.
- `agentToken`, `agentTokenFile`, `disable` and `cni` should not be set.

*Type:* one of "server", "agent"

*Default:* `"server"`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.selinux` {#opt-services.rke2.selinux}

Enable SELinux in containerd.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.serverAddr` {#opt-services.rke2.serverAddr}

The rke2 server to connect to, used to join a cluster.

*Type:* string

*Default:* `""`

*Example:* `"https://10.0.0.10:6443"`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.token` {#opt-services.rke2.token}

The rke2 token to use when connecting to a server.

**WARNING**: This option will expose your token unencrypted in the world-readable nix store.
If this is undesired use the tokenFile option instead.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rke2.tokenFile` {#opt-services.rke2.tokenFile}

File path containing the rke2 token to use when connecting to a server.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.rkvm.client.enable` {#opt-services.rkvm.client.enable}

Whether to enable the rkvm client daemon (input receiver).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/rkvm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rkvm.nix)

## `services.rkvm.client.settings` {#opt-services.rkvm.client.settings}

Structured client daemon configuration

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/rkvm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rkvm.nix)

## `services.rkvm.client.settings.certificate` {#opt-services.rkvm.client.settings.certificate}

TLS ceritficate path.

::: note
This should be generated with `rkvm-certificate-gen`.
:::

*Type:* absolute path

*Default:* `"/etc/rkvm/certificate.pem"`

*Declared by:* [`nixos/modules/services/misc/rkvm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rkvm.nix)

## `services.rkvm.client.settings.password` {#opt-services.rkvm.client.settings.password}

Shared secret token to authenticate the client.
Make sure this matches your server's config.

*Type:* string

*Declared by:* [`nixos/modules/services/misc/rkvm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rkvm.nix)

## `services.rkvm.client.settings.server` {#opt-services.rkvm.client.settings.server}

An RKVM server's internet socket address, either IPv4 or IPv6.

*Type:* string

*Example:* `"192.168.0.123:5258"`

*Declared by:* [`nixos/modules/services/misc/rkvm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rkvm.nix)

## `services.rkvm.enable` {#opt-services.rkvm.enable}

Whether to enable rkvm, a Virtual KVM switch for Linux machines.

*Type:* boolean

*Default:* `config.services.rkvm.server.enable || config.services.rkvm.client.enable`

*Declared by:* [`nixos/modules/services/misc/rkvm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rkvm.nix)

## `services.rkvm.package` {#opt-services.rkvm.package}

The rkvm package to use.

*Type:* package

*Default:* `pkgs.rkvm`

*Declared by:* [`nixos/modules/services/misc/rkvm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rkvm.nix)

## `services.rkvm.server.enable` {#opt-services.rkvm.server.enable}

Whether to enable the rkvm server daemon (input transmitter).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/rkvm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rkvm.nix)

## `services.rkvm.server.settings` {#opt-services.rkvm.server.settings}

Structured server daemon configuration

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/rkvm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rkvm.nix)

## `services.rkvm.server.settings.certificate` {#opt-services.rkvm.server.settings.certificate}

TLS certificate path.

::: note
This should be generated with `rkvm-certificate-gen`.
:::

*Type:* absolute path

*Default:* `"/etc/rkvm/certificate.pem"`

*Declared by:* [`nixos/modules/services/misc/rkvm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rkvm.nix)

## `services.rkvm.server.settings.key` {#opt-services.rkvm.server.settings.key}

TLS key path.

::: note
This should be generated with `rkvm-certificate-gen`.
:::

*Type:* absolute path

*Default:* `"/etc/rkvm/key.pem"`

*Declared by:* [`nixos/modules/services/misc/rkvm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rkvm.nix)

## `services.rkvm.server.settings.listen` {#opt-services.rkvm.server.settings.listen}

An internet socket address to listen on, either IPv4 or IPv6.

*Type:* string

*Default:* `"0.0.0.0:5258"`

*Declared by:* [`nixos/modules/services/misc/rkvm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rkvm.nix)

## `services.rkvm.server.settings.password` {#opt-services.rkvm.server.settings.password}

Shared secret token to authenticate the client.
Make sure this matches your client's config.

*Type:* string

*Declared by:* [`nixos/modules/services/misc/rkvm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rkvm.nix)

## `services.rkvm.server.settings.switch-keys` {#opt-services.rkvm.server.settings.switch-keys}

A key list specifying a host switch combination.

*A list of key names is available in [https://github.com/htrefil/rkvm/blob/master/switch-keys.md](https://github.com/htrefil/rkvm/blob/master/switch-keys.md).*

*Type:* list of string

*Default:*

``` nix
[
  "left-alt"
  "left-ctrl"
]
```

*Declared by:* [`nixos/modules/services/misc/rkvm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rkvm.nix)

## `services.rmfakecloud.enable` {#opt-services.rmfakecloud.enable}

Whether to enable rmfakecloud remarkable self-hosted cloud.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/rmfakecloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rmfakecloud.nix)

## `services.rmfakecloud.environmentFile` {#opt-services.rmfakecloud.environmentFile}

Path to an environment file loaded for the rmfakecloud service.

This can be used to securely store tokens and secrets outside of the
world-readable Nix store. Since this file is read by systemd, it may
have permission 0400 and be owned by root.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/etc/secrets/rmfakecloud.env"`

*Declared by:* [`nixos/modules/services/misc/rmfakecloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rmfakecloud.nix)

## `services.rmfakecloud.extraSettings` {#opt-services.rmfakecloud.extraSettings}

Extra settings in the form of a set of key-value pairs.
For tokens and secrets, use `environmentFile` instead.

Available settings are listed on
https://ddvk.github.io/rmfakecloud/install/configuration/.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  DATADIR = "/custom/path/for/rmfakecloud/data";
}
```

*Declared by:* [`nixos/modules/services/misc/rmfakecloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rmfakecloud.nix)

## `services.rmfakecloud.logLevel` {#opt-services.rmfakecloud.logLevel}

Logging level.

*Type:* one of "info", "debug", "warn", "error"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/misc/rmfakecloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rmfakecloud.nix)

## `services.rmfakecloud.package` {#opt-services.rmfakecloud.package}

The rmfakecloud package to use.

*Type:* package

*Default:* `pkgs.rmfakecloud`

*Declared by:* [`nixos/modules/services/misc/rmfakecloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rmfakecloud.nix)

## `services.rmfakecloud.port` {#opt-services.rmfakecloud.port}

Listening port number.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/misc/rmfakecloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rmfakecloud.nix)

## `services.rmfakecloud.storageUrl` {#opt-services.rmfakecloud.storageUrl}

URL used by the tablet to access the rmfakecloud service.

*Type:* string

*Example:* `"https://local.appspot.com"`

*Declared by:* [`nixos/modules/services/misc/rmfakecloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rmfakecloud.nix)

## `services.rnsd.enable` {#opt-services.rnsd.enable}

Whether to enable Enable Reticulum Network Stack Daemon (rnsd).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/rnsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rnsd.nix)

## `services.rnsd.enableUdevRules` {#opt-services.rnsd.enableUdevRules}

Whether to install udev rules for automatically symlinking RNode devices (e.g., Heltec HT-n5262, RAK4631) to /dev/rnode.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/rnsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rnsd.nix)

## `services.rnsd.extraGroups` {#opt-services.rnsd.extraGroups}

Additional groups for the rnsd service user. E.g., add the `dialout` group to allow rnsd to access serial devices (e.g., `/dev/ttyACM0`).

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/rnsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rnsd.nix)

## `services.rnsd.healthCheck.enable` {#opt-services.rnsd.healthCheck.enable}

Whether to enable wait for rnsd to become healthy after startup.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/rnsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rnsd.nix)

## `services.rnsd.healthCheck.intervalSeconds` {#opt-services.rnsd.healthCheck.intervalSeconds}

Delay in seconds between each `rnstatus` health check attempt.

*Type:* positive integer, meaning \>0

*Default:* `2`

*Declared by:* [`nixos/modules/services/networking/rnsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rnsd.nix)

## `services.rnsd.healthCheck.timeoutSeconds` {#opt-services.rnsd.healthCheck.timeoutSeconds}

Maximum time in seconds to wait for `rnstatus` to succeed during startup.

*Type:* positive integer, meaning \>0

*Default:* `120`

*Declared by:* [`nixos/modules/services/networking/rnsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rnsd.nix)

## `services.rnsd.identities` {#opt-services.rnsd.identities}

Map of identity names to paths of identity files. Each identity file will be copied to $STATE\_DIRECTORY/storage/identities/{name}.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/rnsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rnsd.nix)

## `services.rnsd.identityFile` {#opt-services.rnsd.identityFile}

Path to rnsd identity file. This file will be copied to the dataDir on service start.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/rnsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rnsd.nix)

## `services.rnsd.openMulticastPorts` {#opt-services.rnsd.openMulticastPorts}

Whether to open the UDP ports (27916, 42671) used for multicast peer discovery when the AutoInterface is enabled.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/rnsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rnsd.nix)

## `services.rnsd.package` {#opt-services.rnsd.package}

The rns package to use.

*Type:* package

*Default:* `pkgs.rns`

*Declared by:* [`nixos/modules/services/networking/rnsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rnsd.nix)

## `services.rnsd.packageBinaryName` {#opt-services.rnsd.packageBinaryName}

Name of the program to use. Useful in case of using an alternative implementation.

*Type:* string

*Default:* `"rnsd"`

*Declared by:* [`nixos/modules/services/networking/rnsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rnsd.nix)

## `services.rnsd.settings` {#opt-services.rnsd.settings}

Structured rnsd configuration. The generated file is copied to the dataDir on service start. Use `rnsd --exampleconfig` to get an example config file.

*Type:* null or ConfigObj mapping value

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/rnsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rnsd.nix)

## `services.robustirc-bridge.enable` {#opt-services.robustirc-bridge.enable}

Whether to enable RobustIRC bridge.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/robustirc-bridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/robustirc-bridge.nix)

## `services.robustirc-bridge.extraFlags` {#opt-services.robustirc-bridge.extraFlags}

Extra flags passed to the `robustirc-bridge` command. See [RobustIRC Documentation](https://robustirc.net/docs/adminguide.html#_bridge) or `robustirc-bridge(1)` for details.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-network robustirc.net"
]
```

*Declared by:* [`nixos/modules/services/networking/robustirc-bridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/robustirc-bridge.nix)

## `services.romm.dataDir` {#opt-services.romm.dataDir}

Base path for the ROM library and runtime data
(`${dataDir}/{library,resources,assets,config,cache}`).

The ROM library location is fixed to `${dataDir}/library` by
upstream. To use an existing ROM collection stored elsewhere,
bind-mount it there and make sure it is readable and writable by
[`services.romm.user`](#opt-services.romm.user).

*Type:* absolute path

*Default:* `"/var/lib/romm"`

*Declared by:* [`nixos/modules/services/web-apps/romm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/romm.nix)

## `services.romm.database.createLocally` {#opt-services.romm.database.createLocally}

Whether to create the PostgreSQL database and user locally (peer
authentication over the unix socket).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/romm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/romm.nix)

## `services.romm.database.host` {#opt-services.romm.database.host}

PostgreSQL host. Ignored when
[`services.romm.database.createLocally`](#opt-services.romm.database.createLocally) is set; the password
for a remote database is passed as `DB_PASSWD` via
[`services.romm.environmentFile`](#opt-services.romm.environmentFile).

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/romm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/romm.nix)

## `services.romm.database.name` {#opt-services.romm.database.name}

Database name.

*Type:* string

*Default:* `"romm"`

*Declared by:* [`nixos/modules/services/web-apps/romm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/romm.nix)

## `services.romm.database.port` {#opt-services.romm.database.port}

PostgreSQL port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5432`

*Declared by:* [`nixos/modules/services/web-apps/romm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/romm.nix)

## `services.romm.database.user` {#opt-services.romm.database.user}

Database user. With [`services.romm.database.createLocally`](#opt-services.romm.database.createLocally)
this must equal [`services.romm.user`](#opt-services.romm.user).

*Type:* string

*Default:* `"romm"`

*Declared by:* [`nixos/modules/services/web-apps/romm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/romm.nix)

## `services.romm.enable` {#opt-services.romm.enable}

Whether to enable RomM, a self-hosted ROM manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/romm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/romm.nix)

## `services.romm.environmentFile` {#opt-services.romm.environmentFile}

Environment file with secrets such as metadata provider credentials
(`IGDB_CLIENT_ID`, `IGDB_CLIENT_SECRET`, `SCREENSCRAPER_USER`, ...).
`ROMM_AUTH_SECRET_KEY` may also be set here; when absent, one is
generated and persisted under [`services.romm.dataDir`](#opt-services.romm.dataDir).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/romm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/romm.nix)

## `services.romm.extraEnvironment` {#opt-services.romm.extraEnvironment}

Extra environment variables passed to all RomM services. See
[https://docs.romm.app/latest/Getting-Started/Environment-Variables/](https://docs.romm.app/latest/Getting-Started/Environment-Variables/).

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  WEB_CONCURRENCY = "4";
}
```

*Declared by:* [`nixos/modules/services/web-apps/romm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/romm.nix)

## `services.romm.group` {#opt-services.romm.group}

Group under which RomM runs.

*Type:* string

*Default:* `"romm"`

*Declared by:* [`nixos/modules/services/web-apps/romm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/romm.nix)

## `services.romm.listenAddress` {#opt-services.romm.listenAddress}

Address the RomM API binds to. The frontend and downloads are served
by the nginx virtual host, not by the API directly.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/web-apps/romm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/romm.nix)

## `services.romm.nginx.enable` {#opt-services.romm.nginx.enable}

Whether to serve RomM through a local nginx virtual host, as
upstream's container image does. The backend only exposes the API;
nginx serves the frontend, ROM downloads (`X-Accel-Redirect`,
`mod_zip`) and the cross-origin isolation headers for the emulator.
Point external reverse proxies at this virtual host.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/romm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/romm.nix)

## `services.romm.nginx.virtualHost` {#opt-services.romm.nginx.virtualHost}

Server name of the RomM virtual host.

*Type:* string

*Example:* `"romm.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/romm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/romm.nix)

## `services.romm.package` {#opt-services.romm.package}

The romm package to use.

*Type:* package

*Default:* `pkgs.romm`

*Declared by:* [`nixos/modules/services/web-apps/romm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/romm.nix)

## `services.romm.port` {#opt-services.romm.port}

Port the RomM API listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/web-apps/romm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/romm.nix)

## `services.romm.redis.createLocally` {#opt-services.romm.redis.createLocally}

Whether to create a dedicated local Redis instance
(`services.redis.servers.romm`).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/romm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/romm.nix)

## `services.romm.redis.host` {#opt-services.romm.redis.host}

Redis host. Ignored when
[`services.romm.redis.createLocally`](#opt-services.romm.redis.createLocally) is set; credentials for
a remote Redis are passed via
[`services.romm.environmentFile`](#opt-services.romm.environmentFile) (`REDIS_PASSWORD`, and
`RQ_REDIS_URL` for the job queue).

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/romm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/romm.nix)

## `services.romm.redis.port` {#opt-services.romm.redis.port}

Redis port. RomM does not support unix sockets for Redis.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6379`

*Declared by:* [`nixos/modules/services/web-apps/romm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/romm.nix)

## `services.romm.user` {#opt-services.romm.user}

User account under which RomM runs.

*Type:* string

*Default:* `"romm"`

*Declared by:* [`nixos/modules/services/web-apps/romm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/romm.nix)

## `services.romm.watcher.enable` {#opt-services.romm.watcher.enable}

Whether to run the filesystem watcher that rescans the library on changes.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/romm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/romm.nix)

## `services.roon-bridge.enable` {#opt-services.roon-bridge.enable}

Whether to enable Roon Bridge.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/roon-bridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/roon-bridge.nix)

## `services.roon-bridge.group` {#opt-services.roon-bridge.group}

Group to run the Roon Bridge as.

*Type:* string

*Default:* `"roon-bridge"`

*Declared by:* [`nixos/modules/services/audio/roon-bridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/roon-bridge.nix)

## `services.roon-bridge.openFirewall` {#opt-services.roon-bridge.openFirewall}

Open ports in the firewall for the bridge.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/audio/roon-bridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/roon-bridge.nix)

## `services.roon-bridge.user` {#opt-services.roon-bridge.user}

User to run the Roon bridge as.

*Type:* string

*Default:* `"roon-bridge"`

*Declared by:* [`nixos/modules/services/audio/roon-bridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/roon-bridge.nix)

## `services.roon-server.enable` {#opt-services.roon-server.enable}

Whether to enable Roon Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/roon-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/roon-server.nix)

## `services.roon-server.group` {#opt-services.roon-server.group}

Group to run the Roon Server as.

*Type:* string

*Default:* `"roon-server"`

*Declared by:* [`nixos/modules/services/audio/roon-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/roon-server.nix)

## `services.roon-server.openFirewall` {#opt-services.roon-server.openFirewall}

Open ports in the firewall for the server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/audio/roon-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/roon-server.nix)

## `services.roon-server.package` {#opt-services.roon-server.package}

The roon-server package to use.

*Type:* package

*Default:* `pkgs.roon-server`

*Declared by:* [`nixos/modules/services/audio/roon-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/roon-server.nix)

## `services.roon-server.user` {#opt-services.roon-server.user}

User to run the Roon Server as.

*Type:* string

*Default:* `"roon-server"`

*Declared by:* [`nixos/modules/services/audio/roon-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/roon-server.nix)

## `services.rosec.enable` {#opt-services.rosec.enable}

Whether to enable rosec, a secrets daemon implementing the freedesktop.org Secret Service API.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/rosec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/rosec.nix)

## `services.rosec.package` {#opt-services.rosec.package}

The rosec package to use.

*Type:* package

*Default:* `pkgs.rosec`

*Declared by:* [`nixos/modules/services/security/rosec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/rosec.nix)

## `services.rosec.pam.enable` {#opt-services.rosec.pam.enable}

Whether to enable PAM integration to automatically unlock the rosec vault on login.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/rosec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/rosec.nix)

## `services.rosec.pam.services` {#opt-services.rosec.pam.services}

List of PAM services for which to enable rosec automatic unlock.

*Type:* list of string

*Default:*

``` nix
[
  "login"
]
```

*Example:*

``` nix
[
  "login"
  "greetd"
]
```

*Declared by:* [`nixos/modules/services/security/rosec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/rosec.nix)

## `services.rosenpass.defaultDevice` {#opt-services.rosenpass.defaultDevice}

Name of the network interface to use for all peers by default.

*Type:* null or string

*Default:* `null`

*Example:* `"wg0"`

*Declared by:* [`nixos/modules/services/networking/rosenpass.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rosenpass.nix)

## `services.rosenpass.enable` {#opt-services.rosenpass.enable}

Whether to enable Rosenpass.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/rosenpass.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rosenpass.nix)

## `services.rosenpass.package` {#opt-services.rosenpass.package}

The rosenpass package to use.

*Type:* package

*Default:* `pkgs.rosenpass`

*Declared by:* [`nixos/modules/services/networking/rosenpass.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rosenpass.nix)

## `services.rosenpass.settings` {#opt-services.rosenpass.settings}

Configuration for Rosenpass, see [https://rosenpass.eu/](https://rosenpass.eu/) for further information.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/rosenpass.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rosenpass.nix)

## `services.rosenpass.settings.listen` {#opt-services.rosenpass.settings.listen}

List of local endpoints to listen for connections.

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "0.0.0.0:10000" ]`

*Declared by:* [`nixos/modules/services/networking/rosenpass.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rosenpass.nix)

## `services.rosenpass.settings.peers` {#opt-services.rosenpass.settings.peers}

List of peers to exchange keys with.

*Type:* list of (open submodule of (TOML value))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/rosenpass.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rosenpass.nix)

## `services.rosenpass.settings.peers.*.device` {#opt-services.rosenpass.settings.peers._.device}

Name of the local WireGuard interface to use for this peer.

*Type:* string

*Default:* `config.services.rosenpass.defaultDevice`

*Declared by:* [`nixos/modules/services/networking/rosenpass.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rosenpass.nix)

## `services.rosenpass.settings.peers.*.endpoint` {#opt-services.rosenpass.settings.peers._.endpoint}

Endpoint of the remote Rosenpass peer.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/rosenpass.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rosenpass.nix)

## `services.rosenpass.settings.peers.*.peer` {#opt-services.rosenpass.settings.peers._.peer}

WireGuard public key corresponding to the remote Rosenpass peer.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/rosenpass.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rosenpass.nix)

## `services.rosenpass.settings.peers.*.public_key` {#opt-services.rosenpass.settings.peers._.public_key}

Path to a file containing the public key of the remote Rosenpass peer.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/networking/rosenpass.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rosenpass.nix)

## `services.rosenpass.settings.public_key` {#opt-services.rosenpass.settings.public_key}

Path to a file containing the public key of the local Rosenpass peer. Generate this by running `rosenpass gen-keys`.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/networking/rosenpass.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rosenpass.nix)

## `services.rosenpass.settings.secret_key` {#opt-services.rosenpass.settings.secret_key}

Path to a file containing the secret key of the local Rosenpass peer. Generate this by running `rosenpass gen-keys`.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/networking/rosenpass.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rosenpass.nix)

## `services.rosenpass.settings.verbosity` {#opt-services.rosenpass.settings.verbosity}

Verbosity of output produced by the service.

*Type:* one of "Verbose", "Quiet"

*Default:* `"Quiet"`

*Declared by:* [`nixos/modules/services/networking/rosenpass.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rosenpass.nix)

## `services.roundcube.configureNginx` {#opt-services.roundcube.configureNginx}

Configure nginx as a reverse proxy for roundcube.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/mail/roundcube.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/roundcube.nix)

## `services.roundcube.database.dbname` {#opt-services.roundcube.database.dbname}

Name of the postgresql database

*Type:* string

*Default:* `"roundcube"`

*Declared by:* [`nixos/modules/services/mail/roundcube.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/roundcube.nix)

## `services.roundcube.database.host` {#opt-services.roundcube.database.host}

Host of the postgresql server. If this is not set to
`localhost`, you have to create the
postgresql user and database yourself, with appropriate
permissions.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/mail/roundcube.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/roundcube.nix)

## `services.roundcube.database.password` {#opt-services.roundcube.database.password}

Password for the postgresql connection. Do not use: the password will be stored world readable in the store; use `passwordFile` instead.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/mail/roundcube.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/roundcube.nix)

## `services.roundcube.database.passwordFile` {#opt-services.roundcube.database.passwordFile}

Password file for the postgresql connection.
Must be formatted according to PostgreSQL .pgpass standard (see [https://www.postgresql.org/docs/current/libpq-pgpass.html](https://www.postgresql.org/docs/current/libpq-pgpass.html))
but only one line, no comments and readable by user `nginx`.
Ignored if `database.host` is set to `localhost`, as peer authentication will be used.

*Type:* absolute path

*Example:*

``` nix
pkgs.writeText "roundcube-postgres-passwd.txt" ''
  hostname:port:database:username:password
''
```

*Declared by:* [`nixos/modules/services/mail/roundcube.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/roundcube.nix)

## `services.roundcube.database.username` {#opt-services.roundcube.database.username}

Username for the postgresql connection.
If `database.host` is set to `localhost`, a unix user and group of the same name will be created as well.

*Type:* string

*Default:* `"roundcube"`

*Declared by:* [`nixos/modules/services/mail/roundcube.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/roundcube.nix)

## `services.roundcube.dicts` {#opt-services.roundcube.dicts}

List of aspell dictionaries for spell checking. If empty, spell checking is disabled.

*Type:* list of package

*Default:* `[ ]`

*Example:* `with pkgs.aspellDicts; [ en fr de ]`

*Declared by:* [`nixos/modules/services/mail/roundcube.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/roundcube.nix)

## `services.roundcube.enable` {#opt-services.roundcube.enable}

Whether to enable roundcube.

Also enables nginx virtual host management.
Further nginx configuration can be done by adapting `services.nginx.virtualHosts.<name>`.
See [services (N)](../../options/services-n/index.md#opt-services.nginx.virtualHosts) for further information.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/mail/roundcube.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/roundcube.nix)

## `services.roundcube.extraConfig` {#opt-services.roundcube.extraConfig}

Extra configuration for roundcube webmail instance

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/mail/roundcube.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/roundcube.nix)

## `services.roundcube.hostName` {#opt-services.roundcube.hostName}

Hostname to use for the nginx vhost

*Type:* string

*Example:* `"webmail.example.com"`

*Declared by:* [`nixos/modules/services/mail/roundcube.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/roundcube.nix)

## `services.roundcube.maxAttachmentSize` {#opt-services.roundcube.maxAttachmentSize}

The maximum attachment size in MB.
\[upstream issue comment\]: https://github.com/roundcube/roundcubemail/issues/7979#issuecomment-808879209

::: note
Since there is some overhead in base64 encoding applied to attachments, + 37% will be added
to the value set in this option in order to offset the overhead. For example, setting
`maxAttachmentSize` to `100` would result in `137M` being the real value in the configuration.
See \[upstream issue comment\] for more details on the motivations behind this.
:::

*Type:* signed integer

*Default:* `18`

*Declared by:* [`nixos/modules/services/mail/roundcube.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/roundcube.nix)

## `services.roundcube.package` {#opt-services.roundcube.package}

The roundcube package to use.

*Type:* package

*Default:* `pkgs.roundcube`

*Example:* `roundcube.withPlugins (plugins: [ plugins.persistent_login ])`

*Declared by:* [`nixos/modules/services/mail/roundcube.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/roundcube.nix)

## `services.roundcube.plugins` {#opt-services.roundcube.plugins}

List of roundcube plugins to enable. Currently, only those directly shipped with Roundcube are supported.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/mail/roundcube.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/roundcube.nix)

## `services.routedns.configFile` {#opt-services.routedns.configFile}

Path to RouteDNS TOML configuration file.

*Type:* absolute path

*Default:* `"A RouteDNS configuration file automatically generated by values from services.routedns.*"`

*Example:* `"${pkgs.routedns}/cmd/routedns/example-config/use-case-1.toml"`

*Declared by:* [`nixos/modules/services/networking/routedns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/routedns.nix)

## `services.routedns.enable` {#opt-services.routedns.enable}

Whether to enable RouteDNS - DNS stub resolver, proxy and router.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/routedns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/routedns.nix)

## `services.routedns.package` {#opt-services.routedns.package}

The routedns package to use.

*Type:* package

*Default:* `pkgs.routedns`

*Declared by:* [`nixos/modules/services/networking/routedns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/routedns.nix)

## `services.routedns.settings` {#opt-services.routedns.settings}

Configuration for RouteDNS, see [https://github.com/folbricht/routedns/blob/master/doc/configuration.md](https://github.com/folbricht/routedns/blob/master/doc/configuration.md)
for more information.

*Type:* TOML value

*Example:*

``` nix
{
  resolvers.cloudflare-dot = {
    address = "1.1.1.1:853";
    protocol = "dot";
  };
  groups.cloudflare-cached = {
    type = "cache";
    resolvers = ["cloudflare-dot"];
  };
  listeners.local-udp = {
    address = "127.0.0.1:53";
    protocol = "udp";
    resolver = "cloudflare-cached";
  };
  listeners.local-tcp = {
    address = "127.0.0.1:53";
    protocol = "tcp";
    resolver = "cloudflare-cached";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/routedns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/routedns.nix)

## `services.routinator.enable` {#opt-services.routinator.enable}

Whether to enable Routinator 3000.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/routinator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/routinator.nix)

## `services.routinator.extraArgs` {#opt-services.routinator.extraArgs}

Extra arguments passed to routinator, see [https://routinator.docs.nlnetlabs.nl/en/stable/manual-page.html#options](https://routinator.docs.nlnetlabs.nl/en/stable/manual-page.html#options) for options.";

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--no-rir-tals"
]
```

*Declared by:* [`nixos/modules/services/networking/routinator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/routinator.nix)

## `services.routinator.extraServerArgs` {#opt-services.routinator.extraServerArgs}

Extra arguments passed to the server subcommand, see [https://routinator.docs.nlnetlabs.nl/en/stable/manual-page.html#subcmd-server](https://routinator.docs.nlnetlabs.nl/en/stable/manual-page.html#subcmd-server) for options.";

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--rtr-client-metrics"
]
```

*Declared by:* [`nixos/modules/services/networking/routinator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/routinator.nix)

## `services.routinator.package` {#opt-services.routinator.package}

The routinator package to use.

*Type:* package

*Default:* `pkgs.routinator`

*Declared by:* [`nixos/modules/services/networking/routinator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/routinator.nix)

## `services.routinator.settings` {#opt-services.routinator.settings}

Configuration for Routinator 3000, see [https://routinator.docs.nlnetlabs.nl/en/stable/manual-page.html#configuration-file](https://routinator.docs.nlnetlabs.nl/en/stable/manual-page.html#configuration-file) for options.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/routinator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/routinator.nix)

## `services.routinator.settings.expire` {#opt-services.routinator.settings.expire}

An integer value specifying the number of seconds an RTR client is requested to use a data set if it cannot get an update before throwing it away and continuing with no data at all.

*Type:* null or signed integer

*Default:* `7200`

*Declared by:* [`nixos/modules/services/networking/routinator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/routinator.nix)

## `services.routinator.settings.http-listen` {#opt-services.routinator.settings.http-listen}

An array of string values each providing an address and port on which the HTTP server should listen. Address and port should be separated by a colon. IPv6 address should be enclosed in square brackets.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/routinator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/routinator.nix)

## `services.routinator.settings.log` {#opt-services.routinator.settings.log}

A string specifying where to send log messages to.
See, [https://routinator.docs.nlnetlabs.nl/en/stable/manual-page.html#term-log](https://routinator.docs.nlnetlabs.nl/en/stable/manual-page.html#term-log)

*Type:* null or one of "default", "stderr", "syslog", "file"

*Default:* `"default"`

*Declared by:* [`nixos/modules/services/networking/routinator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/routinator.nix)

## `services.routinator.settings.log-file` {#opt-services.routinator.settings.log-file}

A string value containing the path to a file to which log messages will be appended if the log configuration value is set to file. In this case, the value is mandatory.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/routinator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/routinator.nix)

## `services.routinator.settings.log-level` {#opt-services.routinator.settings.log-level}

A string value specifying the maximum log level for which log messages should be emitted.
See, [https://routinator.docs.nlnetlabs.nl/en/stable/manual-page.html#logging](https://routinator.docs.nlnetlabs.nl/en/stable/manual-page.html#logging)

*Type:* null or one of "error", "warn", "info", "debug"

*Default:* `"warn"`

*Declared by:* [`nixos/modules/services/networking/routinator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/routinator.nix)

## `services.routinator.settings.refresh` {#opt-services.routinator.settings.refresh}

An integer value specifying the number of seconds Routinator should wait between consecutive validation runs in server mode. The next validation run will happen earlier, if objects expire earlier.

*Type:* null or signed integer

*Default:* `600`

*Declared by:* [`nixos/modules/services/networking/routinator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/routinator.nix)

## `services.routinator.settings.repository-dir` {#opt-services.routinator.settings.repository-dir}

The path where the collected RPKI data is stored.

*Type:* absolute path

*Default:* `"/var/lib/routinator/rpki-cache"`

*Declared by:* [`nixos/modules/services/networking/routinator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/routinator.nix)

## `services.routinator.settings.retry` {#opt-services.routinator.settings.retry}

An integer value specifying the number of seconds an RTR client is requested to wait after it failed to receive a data set.

*Type:* null or signed integer

*Default:* `600`

*Declared by:* [`nixos/modules/services/networking/routinator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/routinator.nix)

## `services.routinator.settings.rtr-listen` {#opt-services.routinator.settings.rtr-listen}

An array of string values each providing an address and port on which the RTR server should listen in TCP mode. Address and port should be separated by a colon. IPv6 address should be enclosed in square brackets.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/routinator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/routinator.nix)

## `services.rpcbind.enable` {#opt-services.rpcbind.enable}

Whether to enable `rpcbind`, an ONC RPC directory service
notably used by NFS and NIS, and which can be queried
using the `rpcinfo(1)` command. `rpcbind` is a replacement for
`portmap`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/rpcbind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rpcbind.nix)

## `services.rqbit.downloadDir` {#opt-services.rqbit.downloadDir}

Directory where to download torrents.

*Type:* absolute path

*Default:* `"/var/lib/rqbit/downloads"`

*Example:* `"/mnt/storage/torrents"`

*Declared by:* [`nixos/modules/services/torrent/rqbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/rqbit.nix)

## `services.rqbit.enable` {#opt-services.rqbit.enable}

Whether to enable rqbit BitTorrent daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/torrent/rqbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/rqbit.nix)

## `services.rqbit.group` {#opt-services.rqbit.group}

Group account under which rqbit runs.

*Type:* string

*Default:* `"rqbit"`

*Declared by:* [`nixos/modules/services/torrent/rqbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/rqbit.nix)

## `services.rqbit.httpHost` {#opt-services.rqbit.httpHost}

The listen host for the HTTP API.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/torrent/rqbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/rqbit.nix)

## `services.rqbit.httpPort` {#opt-services.rqbit.httpPort}

The listen port for the HTTP API.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3030`

*Declared by:* [`nixos/modules/services/torrent/rqbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/rqbit.nix)

## `services.rqbit.openFirewall` {#opt-services.rqbit.openFirewall}

Whether to enable opening of the HTTP and Peer ports in the firewall.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/torrent/rqbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/rqbit.nix)

## `services.rqbit.package` {#opt-services.rqbit.package}

The rqbit package to use.

*Type:* package

*Default:* `pkgs.rqbit`

*Declared by:* [`nixos/modules/services/torrent/rqbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/rqbit.nix)

## `services.rqbit.peerPort` {#opt-services.rqbit.peerPort}

The port to listen for incoming BitTorrent peer connections (TCP and uTP).

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4240`

*Declared by:* [`nixos/modules/services/torrent/rqbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/rqbit.nix)

## `services.rqbit.user` {#opt-services.rqbit.user}

User account under which rqbit runs.

*Type:* string

*Default:* `"rqbit"`

*Declared by:* [`nixos/modules/services/torrent/rqbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/rqbit.nix)

## `services.rshim.backend` {#opt-services.rshim.backend}

Specify the backend to attach. If not specified, the driver will scan
all rshim backends unless the `device` option is given with a device
name specified.

*Type:* null or one of "usb", "pcie", "pcie\_lf"

*Default:* `null`

*Example:* `"pcie"`

*Declared by:* [`nixos/modules/services/misc/rshim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rshim.nix)

## `services.rshim.config` {#opt-services.rshim.config}

Structural setting for the rshim configuration file
(`/etc/rshim.conf`). It can be used to specify the static mapping
between rshim devices and rshim names. It can also be used to ignore
some rshim devices.

*Type:* attribute set of (signed integer or string)

*Default:* `{ }`

*Example:*

``` nix
{
  DISPLAY_LEVEL = 0;
  none = "usb-1-1.4";
  rshim0 = "usb-2-1.7";
}
```

*Declared by:* [`nixos/modules/services/misc/rshim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rshim.nix)

## `services.rshim.device` {#opt-services.rshim.device}

Specify the device name to attach. The backend driver can be deduced
from the device name, thus the `backend` option is not needed.

*Type:* null or string

*Default:* `null`

*Example:* `"pcie-04:00.2"`

*Declared by:* [`nixos/modules/services/misc/rshim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rshim.nix)

## `services.rshim.enable` {#opt-services.rshim.enable}

Whether to enable user-space rshim driver for the BlueField SoC.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/rshim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rshim.nix)

## `services.rshim.index` {#opt-services.rshim.index}

Specify the index to create device path `/dev/rshim<index>`. It's also
used to create network interface name `tmfifo_net<index>`. This option
is needed when multiple rshim instances are running.

*Type:* null or signed integer

*Default:* `null`

*Example:* `1`

*Declared by:* [`nixos/modules/services/misc/rshim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rshim.nix)

## `services.rshim.log-level` {#opt-services.rshim.log-level}

Specify the log level (0:none, 1:error, 2:warning, 3:notice, 4:debug).

*Type:* integer between 0 and 4 (both inclusive)

*Default:* `2`

*Example:* `4`

*Declared by:* [`nixos/modules/services/misc/rshim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rshim.nix)

## `services.rshim.package` {#opt-services.rshim.package}

The rshim-user-space package to use.

*Type:* package

*Default:* `pkgs.rshim-user-space`

*Declared by:* [`nixos/modules/services/misc/rshim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rshim.nix)

## `services.rsnapshot.cronIntervals` {#opt-services.rsnapshot.cronIntervals}

Periodicity at which intervals should be run by cron.
Note that the intervals also have to exist in configuration
as retain options.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  daily = "50 21 * * *";
  hourly = "0 * * * *";
}
```

*Declared by:* [`nixos/modules/services/backup/rsnapshot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/rsnapshot.nix)

## `services.rsnapshot.enable` {#opt-services.rsnapshot.enable}

Whether to enable rsnapshot backups.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/rsnapshot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/rsnapshot.nix)

## `services.rsnapshot.enableManualRsnapshot` {#opt-services.rsnapshot.enableManualRsnapshot}

Whether to enable manual usage of the rsnapshot command with this module.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/backup/rsnapshot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/rsnapshot.nix)

## `services.rsnapshot.extraConfig` {#opt-services.rsnapshot.extraConfig}

rsnapshot configuration option in addition to the defaults from
rsnapshot and this module.

Note that tabs are required to separate option arguments, and
directory names require trailing slashes.

The "extra" in the option name might be a little misleading right
now, as it is required to get a functional configuration.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  retains	hourly	24
  retain	daily	365
  backup	/home/	localhost/
''
```

*Declared by:* [`nixos/modules/services/backup/rsnapshot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/rsnapshot.nix)

## `services.rspamd-trainer.enable` {#opt-services.rspamd-trainer.enable}

Whether to enable Spam/ham trainer for rspamd.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/rspamd-trainer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd-trainer.nix)

## `services.rspamd-trainer.secrets` {#opt-services.rspamd-trainer.secrets}

A list of files containing the various secrets. Should be in the
format expected by systemd's `EnvironmentFile` directory. For the
IMAP account password use `PASSWORD = mypassword`.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/mail/rspamd-trainer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd-trainer.nix)

## `services.rspamd-trainer.settings` {#opt-services.rspamd-trainer.settings}

IMAP authentication configuration for rspamd-trainer. For supplying
the IMAP password, use the `secrets` option.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Example:*

``` nix
{
  HOST = "localhost";
  USERNAME = "spam@example.com";
  INBOXPREFIX = "INBOX/";
}
```

*Declared by:* [`nixos/modules/services/mail/rspamd-trainer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd-trainer.nix)

## `services.rspamd.debug` {#opt-services.rspamd.debug}

Whether to run the rspamd daemon in debug mode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.enable` {#opt-services.rspamd.enable}

Whether to enable rspamd, the Rapid spam filtering system.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.extraArgs` {#opt-services.rspamd.extraArgs}

A list of extra command line arguments to pass to rspamd.
Check `rspamd --help` for possible arguments.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--var=RBL_API_KEY=\${RBL_API_KEY}"
]
```

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.extraConfig` {#opt-services.rspamd.extraConfig}

Extra configuration to add at the end of the rspamd configuration
file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.group` {#opt-services.rspamd.group}

Group to use when no root privileges are required.

*Type:* string

*Default:* `"rspamd"`

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.localLuaRules` {#opt-services.rspamd.localLuaRules}

Path of file to link to `/etc/rspamd/rspamd.local.lua` for local
rules written in Lua

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.locals` {#opt-services.rspamd.locals}

Local configuration files, written into `/etc/rspamd/local.d/{name}`.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{ "redis.conf".source = "/nix/store/.../etc/dir/redis.conf";
  "arc.conf".text = "allow_envfrom_empty = true;";
}
```

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.locals.<name>.enable` {#opt-services.rspamd.locals._name_.enable}

Whether this file locals should be generated.  This
option allows specific locals files to be disabled.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.locals.<name>.source` {#opt-services.rspamd.locals._name_.source}

Path of the source file.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.locals.<name>.text` {#opt-services.rspamd.locals._name_.text}

Text of the file.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.overrides` {#opt-services.rspamd.overrides}

Overridden configuration files, written into `/etc/rspamd/override.d/{name}`.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{ "redis.conf".source = "/nix/store/.../etc/dir/redis.conf";
  "arc.conf".text = "allow_envfrom_empty = true;";
}
```

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.overrides.<name>.enable` {#opt-services.rspamd.overrides._name_.enable}

Whether this file overrides should be generated.  This
option allows specific overrides files to be disabled.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.overrides.<name>.source` {#opt-services.rspamd.overrides._name_.source}

Path of the source file.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.overrides.<name>.text` {#opt-services.rspamd.overrides._name_.text}

Text of the file.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.package` {#opt-services.rspamd.package}

The rspamd package to use.

*Type:* package

*Default:* `pkgs.rspamd`

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.postfix.config` {#opt-services.rspamd.postfix.config}

Addon to postfix configuration

*Type:* attribute set of (boolean or string or list of string)

*Default:*

``` nix
{
  non_smtpd_milters = [
    "unix:/run/rspamd/rspamd-milter.sock"
  ];
  smtpd_milters = [
    "unix:/run/rspamd/rspamd-milter.sock"
  ];
}
```

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.postfix.enable` {#opt-services.rspamd.postfix.enable}

Add rspamd milter to postfix main.conf

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.user` {#opt-services.rspamd.user}

User to use when no root privileges are required.

*Type:* string

*Default:* `"rspamd"`

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.workers` {#opt-services.rspamd.workers}

Attribute set of workers to start.

*Type:* attribute set of (submodule)

*Default:*

``` nix
{
  controller = { };
  normal = { };
}
```

*Example:*

``` nix
{
  normal = {
    includes = [ "$CONFDIR/worker-normal.inc" ];
    bindSockets = [{
      socket = "/run/rspamd/rspamd.sock";
      mode = "0660";
      owner = "${config.services.rspamd.user}";
      group = "${config.services.rspamd.group}";
    }];
  };
  controller = {
    includes = [ "$CONFDIR/worker-controller.inc" ];
    bindSockets = [ "[::1]:11334" ];
  };
}
```

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.workers.<name>.bindSockets` {#opt-services.rspamd.workers._name_.bindSockets}

List of sockets to listen, in format acceptable by rspamd

*Type:* list of (string or (submodule))

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    mode = "0666";
    owner = "rspamd";
    socket = "/run/rspamd.sock";
  }
  "*:11333"
]
```

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.workers.<name>.count` {#opt-services.rspamd.workers._name_.count}

Number of worker instances to run

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.workers.<name>.enable` {#opt-services.rspamd.workers._name_.enable}

Whether to run the rspamd worker.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.workers.<name>.extraConfig` {#opt-services.rspamd.workers._name_.extraConfig}

Additional entries to put verbatim into worker section of rspamd config file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.workers.<name>.includes` {#opt-services.rspamd.workers._name_.includes}

List of files to include in configuration

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.workers.<name>.name` {#opt-services.rspamd.workers._name_.name}

Name of the worker

*Type:* null or string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rspamd.workers.<name>.type` {#opt-services.rspamd.workers._name_.type}

The type of this worker. The type `proxy` is
deprecated and only kept for backwards compatibility and should be
replaced with `rspamd_proxy`.

*Type:* null or one of "normal", "controller", "fuzzy", "rspamd\_proxy", "lua", "proxy"

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/rspamd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rspamd.nix)

## `services.rss-bridge.config` {#opt-services.rss-bridge.config}

Attribute set of arbitrary config options.
Please consult the documentation at the [wiki](https://rss-bridge.github.io/rss-bridge/For_Hosts/Custom_Configuration.html)
and [sample config](https://github.com/RSS-Bridge/rss-bridge/blob/master/config.default.ini.php) to see a list of available options.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Example:*

``` nix
{
  system.enabled_bridges = [ "*" ];
  error = {
    output = "http";
    report_limit = 5;
  };
  FileCache = {
    enable_purge = true;
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/rss-bridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rss-bridge.nix)

## `services.rss-bridge.config.FileCache.path` {#opt-services.rss-bridge.config.FileCache.path}

Directory where to store cache files (if cache.type = "file").

*Type:* string

*Default:* `${config.services.rss-bridge.dataDir}/cache/`

*Declared by:* [`nixos/modules/services/web-apps/rss-bridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rss-bridge.nix)

## `services.rss-bridge.config.system.enabled_bridges` {#opt-services.rss-bridge.config.system.enabled_bridges}

Only enabled bridges are available for feed production

*Type:* null or string or list of string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/rss-bridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rss-bridge.nix)

## `services.rss-bridge.dataDir` {#opt-services.rss-bridge.dataDir}

Location in which cache directory will be created.
You can put `config.ini.php` in here.

*Type:* string

*Default:* `"/var/lib/rss-bridge"`

*Declared by:* [`nixos/modules/services/web-apps/rss-bridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rss-bridge.nix)

## `services.rss-bridge.enable` {#opt-services.rss-bridge.enable}

Whether to enable rss-bridge.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/rss-bridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rss-bridge.nix)

## `services.rss-bridge.group` {#opt-services.rss-bridge.group}

The group under which the web application runs.

*Type:* string

*Default:* ``"{option}`config.services.rss-bridge.webserver` or \"rss-bridge\""``

*Declared by:* [`nixos/modules/services/web-apps/rss-bridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rss-bridge.nix)

## `services.rss-bridge.package` {#opt-services.rss-bridge.package}

The rss-bridge package to use.

*Type:* package

*Default:* `pkgs.rss-bridge`

*Declared by:* [`nixos/modules/services/web-apps/rss-bridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rss-bridge.nix)

## `services.rss-bridge.pool` {#opt-services.rss-bridge.pool}

Name of phpfpm pool that is used to run web-application.
If `null` specified none will be created, otherwise automatically created with default values.

*Type:* null or string

*Default:* `"rss-bridge"`

*Declared by:* [`nixos/modules/services/web-apps/rss-bridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rss-bridge.nix)

## `services.rss-bridge.user` {#opt-services.rss-bridge.user}

The user account under which both the service and the web application run.

*Type:* string

*Default:* ``"{option}`config.services.rss-bridge.webserver` or \"rss-bridge\""``

*Declared by:* [`nixos/modules/services/web-apps/rss-bridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rss-bridge.nix)

## `services.rss-bridge.virtualHost` {#opt-services.rss-bridge.virtualHost}

Name of the nginx or caddy virtualhost to use and setup. If null, do not setup any virtualhost.

*Type:* null or string

*Default:* `"rss-bridge"`

*Declared by:* [`nixos/modules/services/web-apps/rss-bridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rss-bridge.nix)

## `services.rss-bridge.webserver` {#opt-services.rss-bridge.webserver}

Type of virtualhost to use and setup. If null, do not setup any virtualhost.

*Type:* null or one of "nginx", "caddy"

*Default:* `"nginx"`

*Declared by:* [`nixos/modules/services/web-apps/rss-bridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rss-bridge.nix)

## `services.rss2email.config` {#opt-services.rss2email.config}

The configuration to give rss2email.

Default will use system-wide `sendmail` to send the
email. This is rss2email's default when running
`r2e new`.

This set contains key-value associations that will be set in the
`[DEFAULT]` block along with the
`to` parameter.

See `man r2e` for more information on which
parameters are accepted.

*Type:* attribute set of (string or signed integer or boolean)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/mail/rss2email.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rss2email.nix)

## `services.rss2email.enable` {#opt-services.rss2email.enable}

Whether to enable rss2email.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/mail/rss2email.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rss2email.nix)

## `services.rss2email.feeds` {#opt-services.rss2email.feeds}

The feeds to watch.

*Type:* attribute set of (submodule)

*Declared by:* [`nixos/modules/services/mail/rss2email.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rss2email.nix)

## `services.rss2email.feeds.<name>.to` {#opt-services.rss2email.feeds._name_.to}

Email address to which to send feed items.

If `null`, this will not be set in the
configuration file, and rss2email will make it default to
`rss2email.to`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/rss2email.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rss2email.nix)

## `services.rss2email.feeds.<name>.url` {#opt-services.rss2email.feeds._name_.url}

The URL at which to fetch the feed.

*Type:* string

*Declared by:* [`nixos/modules/services/mail/rss2email.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rss2email.nix)

## `services.rss2email.interval` {#opt-services.rss2email.interval}

How often to check the feeds, in systemd interval format

*Type:* string

*Default:* `"12h"`

*Declared by:* [`nixos/modules/services/mail/rss2email.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rss2email.nix)

## `services.rss2email.to` {#opt-services.rss2email.to}

Mail address to which to send emails

*Type:* string

*Declared by:* [`nixos/modules/services/mail/rss2email.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/rss2email.nix)

## `services.rsshub.enable` {#opt-services.rsshub.enable}

Whether to enable RSSHub service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/rsshub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rsshub.nix)

## `services.rsshub.openFirewall` {#opt-services.rsshub.openFirewall}

Whether to open the firewall for the specified port.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/rsshub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rsshub.nix)

## `services.rsshub.package` {#opt-services.rsshub.package}

The rsshub package to use.

*Type:* package

*Default:* `pkgs.rsshub`

*Declared by:* [`nixos/modules/services/web-apps/rsshub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rsshub.nix)

## `services.rsshub.redis.createLocally` {#opt-services.rsshub.redis.createLocally}

Create and use a local Redis instance. Sets `services.redis.servers.rsshub`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/rsshub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rsshub.nix)

## `services.rsshub.redis.enable` {#opt-services.rsshub.redis.enable}

Whether to enable Redis for RSSHub.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/rsshub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rsshub.nix)

## `services.rsshub.redis.host` {#opt-services.rsshub.redis.host}

The Redis host.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/rsshub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rsshub.nix)

## `services.rsshub.redis.port` {#opt-services.rsshub.redis.port}

The Redis port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6379`

*Declared by:* [`nixos/modules/services/web-apps/rsshub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rsshub.nix)

## `services.rsshub.secretFiles` {#opt-services.rsshub.secretFiles}

Environment variables stored in files for secrets.
See [https://docs.rsshub.app/deploy/config](https://docs.rsshub.app/deploy/config) for available options.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[ config.sops.secrets.rsshub.path ]
```

*Declared by:* [`nixos/modules/services/web-apps/rsshub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rsshub.nix)

## `services.rsshub.settings` {#opt-services.rsshub.settings}

Environment variables for RSSHub.
See [https://docs.rsshub.app/deploy/config](https://docs.rsshub.app/deploy/config) for available options.

*Type:* open submodule of attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  REQUEST_TIMEOUT = "3000";
  REQUEST_RETRY = "10";
  CHROMIUM_EXECUTABLE_PATH = lib.getExe pkgs.chromium;
}
```

*Declared by:* [`nixos/modules/services/web-apps/rsshub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rsshub.nix)

## `services.rsshub.settings.LISTEN_INADDR_ANY` {#opt-services.rsshub.settings.LISTEN_INADDR_ANY}

Listen to any address

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/rsshub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rsshub.nix)

## `services.rsshub.settings.NO_LOGFILES` {#opt-services.rsshub.settings.NO_LOGFILES}

Print logs into stderr.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/rsshub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rsshub.nix)

## `services.rsshub.settings.PORT` {#opt-services.rsshub.settings.PORT}

Listen on port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1200`

*Declared by:* [`nixos/modules/services/web-apps/rsshub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rsshub.nix)

## `services.rstudio-server.enable` {#opt-services.rstudio-server.enable}

Whether to enable RStudio server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/development/rstudio-server/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/rstudio-server/default.nix)

## `services.rstudio-server.listenAddr` {#opt-services.rstudio-server.listenAddr}

Address to listen on (www-address in rserver.conf).

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/development/rstudio-server/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/rstudio-server/default.nix)

## `services.rstudio-server.package` {#opt-services.rstudio-server.package}

The rstudio-server package to use.

*Type:* package

*Default:* `pkgs.rstudio-server`

*Example:* `rstudioServerWrapper.override { packages = [ pkgs.rPackages.ggplot2 ]; }`

*Declared by:* [`nixos/modules/services/development/rstudio-server/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/rstudio-server/default.nix)

## `services.rstudio-server.rserverExtraConfig` {#opt-services.rstudio-server.rserverExtraConfig}

Extra contents for rserver.conf.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/development/rstudio-server/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/rstudio-server/default.nix)

## `services.rstudio-server.rsessionExtraConfig` {#opt-services.rstudio-server.rsessionExtraConfig}

Extra contents for resssion.conf.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/development/rstudio-server/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/rstudio-server/default.nix)

## `services.rstudio-server.serverWorkingDir` {#opt-services.rstudio-server.serverWorkingDir}

Default working directory for server (server-working-dir in rserver.conf).

*Type:* string

*Default:* `"/var/lib/rstudio-server"`

*Declared by:* [`nixos/modules/services/development/rstudio-server/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/rstudio-server/default.nix)

## `services.rsync.enable` {#opt-services.rsync.enable}

Whether to enable periodic directory syncing via rsync.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/rsync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rsync.nix)

## `services.rsync.jobs` {#opt-services.rsync.jobs}

Synchronization jobs to run.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/rsync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rsync.nix)

## `services.rsync.jobs.<name>.destination` {#opt-services.rsync.jobs._name_.destination}

Destination directory.

*Type:* string

*Example:* `"/srv/dst"`

*Declared by:* [`nixos/modules/services/misc/rsync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rsync.nix)

## `services.rsync.jobs.<name>.group` {#opt-services.rsync.jobs._name_.group}

The name of an existing user group under which the rsync process should run.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/misc/rsync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rsync.nix)

## `services.rsync.jobs.<name>.inhibit` {#opt-services.rsync.jobs._name_.inhibit}

Run the rsync process with an inhibition lock taken;
see `systemd-inhibit(1)` for a list of possible operations.

*Type:* list of string matching the pattern ^\[^:\]+$

*Default:* `[ ]`

*Example:*

``` nix
[
  "sleep"
]
```

*Declared by:* [`nixos/modules/services/misc/rsync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rsync.nix)

## `services.rsync.jobs.<name>.settings` {#opt-services.rsync.jobs._name_.settings}

Settings that should be passed to rsync via long options.
See `rsync(1)` for available options.

*Type:* attribute set of (boolean or string or signed integer or floating point number or list of (boolean or string or signed integer or floating point number))

*Default:* `{ }`

*Example:*

``` nix
{
  archive = true;
  delete = true;
  mkpath = true;
  verbose = true;
}
```

*Declared by:* [`nixos/modules/services/misc/rsync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rsync.nix)

## `services.rsync.jobs.<name>.sources` {#opt-services.rsync.jobs._name_.sources}

Source directories.

*Type:* non-empty (list of string)

*Example:*

``` nix
[
  "/srv/src1/"
  "/srv/src2/"
]
```

*Declared by:* [`nixos/modules/services/misc/rsync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rsync.nix)

## `services.rsync.jobs.<name>.timerConfig` {#opt-services.rsync.jobs._name_.timerConfig}

When to run the job.

*Type:* null or (attribute set of (systemd option))

*Default:*

``` nix
{
  OnCalendar = "daily";
  Persistent = true;
}
```

*Declared by:* [`nixos/modules/services/misc/rsync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rsync.nix)

## `services.rsync.jobs.<name>.user` {#opt-services.rsync.jobs._name_.user}

The name of an existing user account under which the rsync process should run.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/misc/rsync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rsync.nix)

## `services.rsync.package` {#opt-services.rsync.package}

The rsync package to use.

*Type:* package

*Default:* `pkgs.rsync`

*Declared by:* [`nixos/modules/services/misc/rsync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rsync.nix)

## `services.rsyncd.enable` {#opt-services.rsyncd.enable}

Whether to enable the rsync daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/rsyncd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/rsyncd.nix)

## `services.rsyncd.port` {#opt-services.rsyncd.port}

TCP port the daemon will listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `873`

*Declared by:* [`nixos/modules/services/network-filesystems/rsyncd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/rsyncd.nix)

## `services.rsyncd.settings` {#opt-services.rsyncd.settings}

Configuration for rsyncd. See
`rsyncd.conf(5)`.

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
{
  globalSection = {
    address = "0.0.0.0";
    gid = "nobody";
    "max connections" = 4;
    uid = "nobody";
    "use chroot" = true;
  };
  sections = {
    cvs = {
      "auth users" = [
        "tridge"
        "susan"
      ];
      comment = "CVS repository (requires authentication)";
      path = "/data/cvs";
      "secrets file" = "/etc/rsyncd.secrets";
    };
    ftp = {
      comment = "whole ftp area";
      path = "/var/ftp/./pub";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/network-filesystems/rsyncd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/rsyncd.nix)

## `services.rsyncd.settings.globalSection` {#opt-services.rsyncd.settings.globalSection}

global section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Type:* section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/network-filesystems/rsyncd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/rsyncd.nix)

## `services.rsyncd.settings.sections` {#opt-services.rsyncd.settings.sections}

attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/network-filesystems/rsyncd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/rsyncd.nix)

## `services.rsyncd.socketActivated` {#opt-services.rsyncd.socketActivated}

If enabled Rsync will be socket-activated rather than run persistently.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/rsyncd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/rsyncd.nix)

## `services.rsyslogd.defaultConfig` {#opt-services.rsyslogd.defaultConfig}

The default `syslog.conf` file configures a
fairly standard setup of log files, which can be extended by
means of `extraConfig`.

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  # "local1" is used for dhcpd messages.
  local1.*                     -/var/log/dhcpd
  
  mail.*                       -/var/log/mail
  
  *.=warning;*.=err            -/var/log/warn
  *.crit                        /var/log/warn
  
  *.*;mail.none;local1.none    -/var/log/messages
''
```

*Declared by:* [`nixos/modules/services/logging/rsyslogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/rsyslogd.nix)

## `services.rsyslogd.enable` {#opt-services.rsyslogd.enable}

Whether to enable syslogd.  Note that systemd also logs
syslog messages, so you normally don't need to run syslogd.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/logging/rsyslogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/rsyslogd.nix)

## `services.rsyslogd.extraConfig` {#opt-services.rsyslogd.extraConfig}

Additional text appended to `syslog.conf`,
i.e. the contents of `defaultConfig`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"news.* -/var/log/news"`

*Declared by:* [`nixos/modules/services/logging/rsyslogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/rsyslogd.nix)

## `services.rsyslogd.extraParams` {#opt-services.rsyslogd.extraParams}

Additional parameters passed to `rsyslogd`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-m 0"
]
```

*Declared by:* [`nixos/modules/services/logging/rsyslogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/rsyslogd.nix)

## `services.rtorrent.configText` {#opt-services.rtorrent.configText}

The content of `rtorrent.rc`. The [upstream example configuration](https://github.com/rakshasa/rtorrent/blob/master/doc/rtorrent.rc-example)
adapted to the values specified in this module will be prepended using mkBefore.
You can use mkForce to overwrite the config completely.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/torrent/rtorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/rtorrent.nix)

## `services.rtorrent.dataDir` {#opt-services.rtorrent.dataDir}

The directory where rtorrent stores its data files.

*Type:* string

*Default:* `"/var/lib/rtorrent"`

*Declared by:* [`nixos/modules/services/torrent/rtorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/rtorrent.nix)

## `services.rtorrent.dataPermissions` {#opt-services.rtorrent.dataPermissions}

Unix Permissions in octal on the rtorrent directory.

*Type:* string

*Default:* `"0750"`

*Example:* `"0755"`

*Declared by:* [`nixos/modules/services/torrent/rtorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/rtorrent.nix)

## `services.rtorrent.downloadDir` {#opt-services.rtorrent.downloadDir}

Where to put downloaded files.

*Type:* string

*Default:* `"${config.services.rtorrent.dataDir}/download"`

*Declared by:* [`nixos/modules/services/torrent/rtorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/rtorrent.nix)

## `services.rtorrent.enable` {#opt-services.rtorrent.enable}

Whether to enable rtorrent.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/torrent/rtorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/rtorrent.nix)

## `services.rtorrent.group` {#opt-services.rtorrent.group}

Group under which rtorrent runs.

*Type:* string

*Default:* `"rtorrent"`

*Declared by:* [`nixos/modules/services/torrent/rtorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/rtorrent.nix)

## `services.rtorrent.openFirewall` {#opt-services.rtorrent.openFirewall}

Whether to open the firewall for the port in [`services.rtorrent.port`](#opt-services.rtorrent.port).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/torrent/rtorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/rtorrent.nix)

## `services.rtorrent.package` {#opt-services.rtorrent.package}

The rtorrent package to use.

*Type:* package

*Default:* `pkgs.rtorrent`

*Declared by:* [`nixos/modules/services/torrent/rtorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/rtorrent.nix)

## `services.rtorrent.port` {#opt-services.rtorrent.port}

The rtorrent port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `50000`

*Declared by:* [`nixos/modules/services/torrent/rtorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/rtorrent.nix)

## `services.rtorrent.rpcSocket` {#opt-services.rtorrent.rpcSocket}

RPC socket path.

*Type:* string

*Default:* `"/run/rtorrent/rpc.sock"`

*Read only*

*Declared by:* [`nixos/modules/services/torrent/rtorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/rtorrent.nix)

## `services.rtorrent.user` {#opt-services.rtorrent.user}

User account under which rtorrent runs.

*Type:* string

*Default:* `"rtorrent"`

*Declared by:* [`nixos/modules/services/torrent/rtorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/rtorrent.nix)

## `services.rumno.enable` {#opt-services.rumno.enable}

Whether to enable rumno visual pop-up notification manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/rumno.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rumno.nix)

## `services.rumno.extraArgs` {#opt-services.rumno.extraArgs}

Extra command-line arguments to pass to the rumno daemon.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--verbose"
  "--config"
  "/etc/rumno/config.toml"
]
```

*Declared by:* [`nixos/modules/services/misc/rumno.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rumno.nix)

## `services.rumno.package` {#opt-services.rumno.package}

The rumno package to use.

*Type:* package

*Default:* `pkgs.rumno`

*Declared by:* [`nixos/modules/services/misc/rumno.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/rumno.nix)

## `services.rundeck.aclPolicies` {#opt-services.rundeck.aclPolicies}

ACL policies for Rundeck, where the attribute name is the filename and the value is the policy content

*Type:* attribute set of string

*Default:*

``` nix
{
  "admin.aclpolicy" = ''
    description: Admin, all access.
    context:
      project: '.*'
    for:
      resource:
        - allow: '*'
      adhoc:
        - allow: '*'
      job:
        - allow: '*'
      node:
        - allow: '*'
      runner:
        - allow: '*'
    by:
      group: admin
    
    ---
    
    description: Admin, all access.
    context:
      application: 'rundeck'
    for:
      resource:
        - allow: '*'
      project:
        - allow: '*'
      project_acl:
        - allow: '*'
      storage:
        - allow: '*'
    by:
      group: admin
  '';
}
```

*Example:*

``` nix
{
  "admin.aclpolicy" = ''
    description: Admin access for administrators
    context:
      project: '.*'
    for:
      resource:
        - allow: '*'
      job:
        - allow: '*'
      node:
        - allow: '*'
    by:
      group: admin
    ---
    description: Admin access in application scope
    context:
      application: 'rundeck'
    for:
      resource:
        - allow: '*'
      project:
        - allow: '*'
    by:
      group: admin
  '';
}
```

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.adminPasswordFile` {#opt-services.rundeck.adminPasswordFile}

Path to a file containing the admin password

*Type:* absolute path

*Example:* `"/run/secrets/rundeck-admin-password"`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.adminUser` {#opt-services.rundeck.adminUser}

Username for the Rundeck admin user

*Type:* string

*Default:* `"admin"`

*Example:* `"rundeck-admin"`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.configDir` {#opt-services.rundeck.configDir}

Directory for Rundeck configuration files

*Type:* absolute path

*Default:* `"/etc/rundeck"`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.dataDir` {#opt-services.rundeck.dataDir}

Directory for Rundeck runtime data (RDECK\_BASE)

*Type:* absolute path

*Default:* `"/var/lib/rundeck"`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.database.host` {#opt-services.rundeck.database.host}

Database host

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.database.name` {#opt-services.rundeck.database.name}

Database name

*Type:* string

*Default:* `"rundeck"`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.database.passwordFile` {#opt-services.rundeck.database.passwordFile}

Path to a file containing the database password

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/rundeck-db-password"`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.database.port` {#opt-services.rundeck.database.port}

Database port (defaults: PostgreSQL: 5432, MySQL: 3306)

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
if config.services.rundeck.database.type == "postgresql" then
  5432
else if config.services.rundeck.database.type == "mysql" then
  3306
else
  null
```

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.database.type` {#opt-services.rundeck.database.type}

Database type to use (h2, postgresql, or mysql)

*Type:* one of "h2", "postgresql", "mysql"

*Default:* `"h2"`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.database.username` {#opt-services.rundeck.database.username}

Database username

*Type:* string

*Default:* `"rundeck"`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.enable` {#opt-services.rundeck.enable}

Whether to enable Rundeck service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.frameworkSettings` {#opt-services.rundeck.frameworkSettings}

Configuration written to `framework.properties`.
See [https://docs.rundeck.com/docs/administration/configuration/config-file-reference.html](https://docs.rundeck.com/docs/administration/configuration/config-file-reference.html)
for available options.

*Type:* open submodule of attribute set of (string, package, bool, int or float)

*Default:* `{ }`

*Example:*

``` nix
{
  "framework.ssh.timeout" = "120";
  "framework.ssh.user" = "deploy";
}
```

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.group` {#opt-services.rundeck.group}

Group account under which Rundeck runs

*Type:* string

*Default:* `"rundeck"`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.javaOpts` {#opt-services.rundeck.javaOpts}

Additional Java options for Rundeck

*Type:* list of string

*Default:*

``` nix
[
  "-Xmx1024m"
  "-Xms256m"
  "-XX:MaxMetaspaceSize=256m"
  "-server"
]
```

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.openFirewall` {#opt-services.rundeck.openFirewall}

Whether to open the Rundeck port in the firewall

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.package` {#opt-services.rundeck.package}

The rundeck package to use.

*Type:* package

*Default:* `pkgs.rundeck`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.serverHostname` {#opt-services.rundeck.serverHostname}

Hostname for the Rundeck server

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.serverPort` {#opt-services.rundeck.serverPort}

Port on which Rundeck will listen

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4440`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.serverURL` {#opt-services.rundeck.serverURL}

Complete Grails server URL

*Type:* string

*Default:* `<scheme>://<serverHostname>:<port>`, where scheme is `https` when
`ssl.enable` else `http`, and port is `ssl.port` when `ssl.enable`
else `serverPort`.

*Example:* `"https://myhost:4443/rundeck"`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.serverUUID` {#opt-services.rundeck.serverUUID}

UUID for the Rundeck server (automatically generated if not specified)

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.settings` {#opt-services.rundeck.settings}

Configuration written to `rundeck-config.properties`.
See [https://docs.rundeck.com/docs/administration/configuration/config-file-reference.html](https://docs.rundeck.com/docs/administration/configuration/config-file-reference.html)
for available options.

Secrets must not be set here, as this ends up world-readable in the Nix
store. Use the dedicated `*File` options instead.

*Type:* open submodule of attribute set of (string, package, bool, int or float)

*Default:* `{ }`

*Example:*

``` nix
{
  "rundeck.feature.repository.enabled" = "true";
  "rundeck.projectsStorageType" = "db";
  "rundeck.gui.title" = "My Rundeck Instance";
  "rdeck.security.useHMacRequestTokens" = "true";
  "rundeck.web.jetty.servlet.MaxFormKeys" = "2000";
}
```

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.sshKeyType` {#opt-services.rundeck.sshKeyType}

Type of SSH key to generate (rsa for compatibility, ed25519 for better security)

*Type:* one of "rsa", "ed25519"

*Default:* `"rsa"`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.ssl.enable` {#opt-services.rundeck.ssl.enable}

Whether to enable SSL support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.ssl.keyStore` {#opt-services.rundeck.ssl.keyStore}

Path to the keystore containing the SSL certificate

*Type:* absolute path

*Example:* `"/etc/rundeck/ssl/keystore"`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.ssl.keyStorePasswordFile` {#opt-services.rundeck.ssl.keyStorePasswordFile}

Path to a file containing the SSL keystore password

*Type:* absolute path

*Example:* `"/run/secrets/rundeck-keystore-password"`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.ssl.port` {#opt-services.rundeck.ssl.port}

Port on which Rundeck will listen for HTTPS when ssl.enable is true

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4443`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.startTimeout` {#opt-services.rundeck.startTimeout}

Timeout in seconds before systemd considers the service startup as failed

*Type:* signed integer

*Default:* `180`

*Example:* `120`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rundeck.user` {#opt-services.rundeck.user}

User account under which Rundeck runs

*Type:* string

*Default:* `"rundeck"`

*Declared by:* [`nixos/modules/services/web-apps/rundeck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rundeck.nix)

## `services.rust-federation-tester.enable` {#opt-services.rust-federation-tester.enable}

Whether to enable rust-federation-tester.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/rust-federation-tester.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/rust-federation-tester.nix)

## `services.rust-federation-tester.settings` {#opt-services.rust-federation-tester.settings}

Settings representing the values in `config.yaml` of the service.

Refer to [`config.yaml.example`](https://github.com/MTRNord/rust-federation-tester/blob/main/config.yaml.example) for supported values.

*Type:* open submodule of (JSON value)

*Declared by:* [`nixos/modules/services/matrix/rust-federation-tester.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/rust-federation-tester.nix)

## `services.rust-federation-tester.settings.database_url` {#opt-services.rust-federation-tester.settings.database_url}

The database to store accounts and statistics.

*Type:* string

*Default:* `"sqlite:///var/lib/rust-federation-tester/db?mode=rwc"`

*Example:* `"postgres://localhost/db?currentSchema=schema"`

*Declared by:* [`nixos/modules/services/matrix/rust-federation-tester.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/rust-federation-tester.nix)

## `services.rust-federation-tester.settings.frontend_url` {#opt-services.rust-federation-tester.settings.frontend_url}

URL of the service's frontend.

*Type:* string

*Example:* `"federation-tester.example.org"`

*Declared by:* [`nixos/modules/services/matrix/rust-federation-tester.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/rust-federation-tester.nix)

## `services.rust-federation-tester.settings.listen_addr` {#opt-services.rust-federation-tester.settings.listen_addr}

Address the API server should listen on.

*Type:* string

*Default:* `"[::]:8080"`

*Example:* `"unix:/run/rust-federation-tester/rust-federation-tester.sock"`

*Declared by:* [`nixos/modules/services/matrix/rust-federation-tester.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/rust-federation-tester.nix)

## `services.rust-federation-tester.settings.smtp.enabled` {#opt-services.rust-federation-tester.settings.smtp.enabled}

Whether to enable mail delivery for configured alerts.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/rust-federation-tester.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/rust-federation-tester.nix)

## `services.rustdesk-server.enable` {#opt-services.rustdesk-server.enable}

Whether to enable RustDesk, a remote access and remote control software, allowing maintenance of computers and other devices.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/rustdesk-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/rustdesk-server.nix)

## `services.rustdesk-server.openFirewall` {#opt-services.rustdesk-server.openFirewall}

Open the connection ports.
TCP (21115, 21116, 21117, 21118, 21119)
UDP (21116)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/rustdesk-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/rustdesk-server.nix)

## `services.rustdesk-server.package` {#opt-services.rustdesk-server.package}

The rustdesk-server package to use.

*Type:* package

*Default:* `pkgs.rustdesk-server`

*Declared by:* [`nixos/modules/services/monitoring/rustdesk-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/rustdesk-server.nix)

## `services.rustdesk-server.relay.enable` {#opt-services.rustdesk-server.relay.enable}

Whether to enable the RustDesk relay server.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/rustdesk-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/rustdesk-server.nix)

## `services.rustdesk-server.relay.extraArgs` {#opt-services.rustdesk-server.relay.extraArgs}

A list of extra command line arguments to pass to the `hbbr` process.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-k"
  "_"
]
```

*Declared by:* [`nixos/modules/services/monitoring/rustdesk-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/rustdesk-server.nix)

## `services.rustdesk-server.signal.enable` {#opt-services.rustdesk-server.signal.enable}

Whether to enable the RustDesk signal server.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/rustdesk-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/rustdesk-server.nix)

## `services.rustdesk-server.signal.extraArgs` {#opt-services.rustdesk-server.signal.extraArgs}

A list of extra command line arguments to pass to the `hbbs` process.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-k"
  "_"
]
```

*Declared by:* [`nixos/modules/services/monitoring/rustdesk-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/rustdesk-server.nix)

## `services.rustdesk-server.signal.relayHosts` {#opt-services.rustdesk-server.signal.relayHosts}

The relay server IP addresses or DNS names of the RustDesk relay.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/rustdesk-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/rustdesk-server.nix)

## `services.rustfs.enable` {#opt-services.rustfs.enable}

Whether to enable RustFS Object Storage Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/rustfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustfs.nix)

## `services.rustfs.environmentFile` {#opt-services.rustfs.environmentFile}

Path to environment file containing secrets like RUSTFS\_ACCESS\_KEY or RUSTFS\_SECRET\_KEY.

*Type:* string

*Declared by:* [`nixos/modules/services/web-servers/rustfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustfs.nix)

## `services.rustfs.group` {#opt-services.rustfs.group}

The group RustFS should run as.

*Type:* string

*Default:* `"rustfs"`

*Declared by:* [`nixos/modules/services/web-servers/rustfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustfs.nix)

## `services.rustfs.package` {#opt-services.rustfs.package}

The rustfs package to use.

*Type:* package

*Default:* `pkgs.rustfs`

*Declared by:* [`nixos/modules/services/web-servers/rustfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustfs.nix)

## `services.rustfs.settings` {#opt-services.rustfs.settings}

Options for RustFS configuration. Refer to
[https://docs.rustfs.com/installation/linux/single-node-single-disk.html#\_5-configure-environment-variables](https://docs.rustfs.com/installation/linux/single-node-single-disk.html#_5-configure-environment-variables)
for details on supported values.

*Type:* open submodule of attribute set of (string or signed integer)

*Default:* `{ }`

*Example:*

``` nix
{
  RUSTFS_CONSOLE_ENABLE = "true";
  RUSTFS_VOLUMES = "/mnt/rustfs";
}
```

*Declared by:* [`nixos/modules/services/web-servers/rustfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustfs.nix)

## `services.rustfs.settings.RUSTFS_VOLUMES` {#opt-services.rustfs.settings.RUSTFS_VOLUMES}

The directory where RustFS stores it's data.

*Type:* absolute path

*Default:* `"/var/lib/rustfs"`

*Declared by:* [`nixos/modules/services/web-servers/rustfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustfs.nix)

## `services.rustfs.user` {#opt-services.rustfs.user}

The user RustFS should run as.

*Type:* string

*Default:* `"rustfs"`

*Declared by:* [`nixos/modules/services/web-servers/rustfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustfs.nix)

## `services.rustical.enable` {#opt-services.rustical.enable}

Whether to enable RustiCali CalDAV/CardDAV server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/rustical.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rustical.nix)

## `services.rustical.environmentFiles` {#opt-services.rustical.environmentFiles}

Environment files to load into the runtime environment.

Check the documentation for how to construct [environment variables](https://lennart-k.github.io/rustical/installation/configuration/#environment-variables).

::: tip
Environment variables can substitute any config value and are useful for
hiding secrets.
:::

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/run/keys/rustical.env"
]
```

*Declared by:* [`nixos/modules/services/web-apps/rustical.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rustical.nix)

## `services.rustical.package` {#opt-services.rustical.package}

The rustical package to use.

*Type:* package

*Default:* `pkgs.rustical`

*Declared by:* [`nixos/modules/services/web-apps/rustical.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rustical.nix)

## `services.rustical.settings` {#opt-services.rustical.settings}

Your `/etc/rustical/config.toml` as a Nix attribute set.

Possible options can be found in the [Config struct](https://lennart-k.github.io/rustical/_crate/rustical/config/struct.Config.html). A default
configuration can be viewed by running `rustical gen-config`.

*Type:* open submodule of (TOML value)

*Declared by:* [`nixos/modules/services/web-apps/rustical.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rustical.nix)

## `services.rustical.settings.data_store.sqlite.db_url` {#opt-services.rustical.settings.data_store.sqlite.db_url}

Path where the sqlite database is stored.

*Type:* absolute path

*Default:* `"/var/lib/rustical/db.sqlite3"`

*Declared by:* [`nixos/modules/services/web-apps/rustical.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rustical.nix)

## `services.rustical.settings.dav_push.enabled` {#opt-services.rustical.settings.dav_push.enabled}

Whether to enable [WebDav Push](https://github.com/bitfireAT/webdav-push/) support.

This allows the server to notify clients about changed data.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/rustical.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rustical.nix)

## `services.rustical.settings.frontend.enabled` {#opt-services.rustical.settings.frontend.enabled}

Whether to enable the HTTP frontend.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/rustical.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rustical.nix)

## `services.rustical.settings.http.bind` {#opt-services.rustical.settings.http.bind}

Address and port or UNIX socket path to bind the HTTP service to.

::: note
Rustical expects to be hosted behind a reverse proxy that
provides HTTPS. Without HTTPS, the web frontend and some clients
(e.g. Apple Calendar) may not work.
:::

*Type:* string

*Default:* `"unix:/run/rustical/sock"`

*Example:* `"[::]:4000"`

*Declared by:* [`nixos/modules/services/web-apps/rustical.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rustical.nix)

## `services.rustical.settings.nextcloud_login.enabled` {#opt-services.rustical.settings.nextcloud_login.enabled}

Whether to emulate the Nextcloud login flow.

This is supported in [DAVx5](https://www.davx5.com/) and enables automatic app token generation.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/rustical.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rustical.nix)

## `services.rustus.cors` {#opt-services.rustus.cors}

list of origins allowed to upload

*Type:* list of string

*Default:*

``` nix
[
  "*"
]
```

*Example:*

``` nix
[
  "*.staging.domain"
  "*.prod.domain"
]
```

*Declared by:* [`nixos/modules/services/web-servers/rustus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustus.nix)

## `services.rustus.disable_health_access_logs` {#opt-services.rustus.disable_health_access_logs}

disable access log for /health endpoint

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/rustus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustus.nix)

## `services.rustus.enable` {#opt-services.rustus.enable}

Whether to enable TUS protocol implementation in Rust.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/rustus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustus.nix)

## `services.rustus.host` {#opt-services.rustus.host}

The host that rustus will connect to.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-servers/rustus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustus.nix)

## `services.rustus.info_storage` {#opt-services.rustus.info_storage}

Info storages are used to store information about file uploads. These storages must be persistent, because every time chunk is uploaded rustus updates information about upload. And when someone wants to download file, information about it requested from storage to get actual path of an upload.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-servers/rustus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustus.nix)

## `services.rustus.info_storage.dir` {#opt-services.rustus.info_storage.dir}

directory to store info about uploads

*Type:* string

*Default:* `"/var/lib/rustus"`

*Declared by:* [`nixos/modules/services/web-servers/rustus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustus.nix)

## `services.rustus.info_storage.type` {#opt-services.rustus.info_storage.type}

Type of info storage to use

*Type:* value "file-info-storage" (singular enum)

*Default:* `"file-info-storage"`

*Declared by:* [`nixos/modules/services/web-servers/rustus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustus.nix)

## `services.rustus.log_level` {#opt-services.rustus.log_level}

Desired log level

*Type:* one of "DEBUG", "INFO", "ERROR"

*Default:* `"INFO"`

*Example:* `"ERROR"`

*Declared by:* [`nixos/modules/services/web-servers/rustus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustus.nix)

## `services.rustus.max_body_size` {#opt-services.rustus.max_body_size}

Maximum body size in bytes

*Type:* string

*Default:* `"10000000"`

*Example:* `"100000000"`

*Declared by:* [`nixos/modules/services/web-servers/rustus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustus.nix)

## `services.rustus.port` {#opt-services.rustus.port}

The port that rustus will connect to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1081`

*Example:* `1081`

*Declared by:* [`nixos/modules/services/web-servers/rustus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustus.nix)

## `services.rustus.remove_parts` {#opt-services.rustus.remove_parts}

remove parts files after successful concatenation

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/web-servers/rustus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustus.nix)

## `services.rustus.storage` {#opt-services.rustus.storage}

Storages are used to actually store your files. You can configure where you want to store files.

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
{
  type = "hybrid-s3"
  s3_access_key_file = konfig.age.secrets.R2_ACCESS_KEY.path;
  s3_secret_key_file = konfig.age.secrets.R2_SECRET_KEY.path;
  s3_bucket = "my_bucket";
  s3_url = "https://s3.example.com";
}
```

*Declared by:* [`nixos/modules/services/web-servers/rustus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustus.nix)

## `services.rustus.storage.data_dir` {#opt-services.rustus.storage.data_dir}

path to the local directory where all files are stored

*Type:* string

*Default:* `"/var/lib/rustus"`

*Declared by:* [`nixos/modules/services/web-servers/rustus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustus.nix)

## `services.rustus.storage.dir_structure` {#opt-services.rustus.storage.dir_structure}

pattern of a directory structure locally and on s3

*Type:* string

*Default:* `"{year}/{month}/{day}"`

*Declared by:* [`nixos/modules/services/web-servers/rustus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustus.nix)

## `services.rustus.storage.force_sync` {#opt-services.rustus.storage.force_sync}

calls fsync system call after every write to disk in local storage

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-servers/rustus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustus.nix)

## `services.rustus.storage.s3_access_key_file` {#opt-services.rustus.storage.s3_access_key_file}

File path that contains the S3 access key.

*Type:* string

*Declared by:* [`nixos/modules/services/web-servers/rustus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustus.nix)

## `services.rustus.storage.s3_bucket` {#opt-services.rustus.storage.s3_bucket}

S3 bucket.

*Type:* string

*Declared by:* [`nixos/modules/services/web-servers/rustus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustus.nix)

## `services.rustus.storage.s3_region` {#opt-services.rustus.storage.s3_region}

S3 region name.

*Type:* string

*Default:* `"us-east-1"`

*Declared by:* [`nixos/modules/services/web-servers/rustus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustus.nix)

## `services.rustus.storage.s3_secret_key_file` {#opt-services.rustus.storage.s3_secret_key_file}

File path that contains the S3 secret key.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-servers/rustus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustus.nix)

## `services.rustus.storage.s3_url` {#opt-services.rustus.storage.s3_url}

S3 url.

*Type:* string

*Declared by:* [`nixos/modules/services/web-servers/rustus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustus.nix)

## `services.rustus.storage.type` {#opt-services.rustus.storage.type}

Type of storage to use

*Type:* one of "file-storage", "hybrid-s3"

*Declared by:* [`nixos/modules/services/web-servers/rustus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustus.nix)

## `services.rustus.tus_extensions` {#opt-services.rustus.tus_extensions}

Since TUS protocol offers extensibility you can turn off some protocol extensions.

*Type:* list of (one of "getting", "creation", "termination", "creation-with-upload", "creation-defer-length", "concatenation", "checksum")

*Default:*

``` nix
[
  "getting"
  "creation"
  "termination"
  "creation-with-upload"
  "creation-defer-length"
  "concatenation"
  "checksum"
]
```

*Declared by:* [`nixos/modules/services/web-servers/rustus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustus.nix)

## `services.rustus.url` {#opt-services.rustus.url}

url path for uploads

*Type:* string

*Default:* `"/files"`

*Declared by:* [`nixos/modules/services/web-servers/rustus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/rustus.nix)

## `services.rutorrent.dataDir` {#opt-services.rutorrent.dataDir}

Storage path of ruTorrent.

*Type:* string

*Default:* `"/var/lib/rutorrent"`

*Declared by:* [`nixos/modules/services/web-apps/rutorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rutorrent.nix)

## `services.rutorrent.enable` {#opt-services.rutorrent.enable}

Whether to enable ruTorrent.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/rutorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rutorrent.nix)

## `services.rutorrent.group` {#opt-services.rutorrent.group}

Group which runs the ruTorrent service.

*Type:* string

*Default:* `"rutorrent"`

*Declared by:* [`nixos/modules/services/web-apps/rutorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rutorrent.nix)

## `services.rutorrent.hostName` {#opt-services.rutorrent.hostName}

FQDN for the ruTorrent instance.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/rutorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rutorrent.nix)

## `services.rutorrent.nginx.enable` {#opt-services.rutorrent.nginx.enable}

Whether to enable nginx virtual host management.
Further nginx configuration can be done by adapting `services.nginx.virtualHosts.<name>`.
See [`services.nginx.virtualHosts`](../../options/services-n/index.md#opt-services.nginx.virtualHosts) for further information.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/rutorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rutorrent.nix)

## `services.rutorrent.nginx.exposeInsecureRPC2mount` {#opt-services.rutorrent.nginx.exposeInsecureRPC2mount}

If you do not enable one of the `rpc` or `httprpc` plugins you need to expose an RPC mount through scgi using this option.
Warning: This allow to run arbitrary commands, as the rtorrent user, so make sure to use authentication. The simplest way would be to use the [`services.nginx.virtualHosts.<name>.basicAuth`](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.basicAuth) option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/rutorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rutorrent.nix)

## `services.rutorrent.plugins` {#opt-services.rutorrent.plugins}

List of plugins to enable. See the list of [available plugins](https://github.com/Novik/ruTorrent/wiki/Plugins#currently-there-are-the-following-plugins). Note: the `unpack` plugin needs the nonfree `unrar` package.
You need to either enable one of the `rpc` or `httprpc` plugin or enable the [`services.rutorrent.nginx.exposeInsecureRPC2mount`](#opt-services.rutorrent.nginx.exposeInsecureRPC2mount) option.

*Type:* list of (string or package)

*Default:*

``` nix
[
  "httprpc"
]
```

*Example:* `[ "httprpc" "data" "diskspace" "edit" "erasedata" "theme" "trafic" ]`

*Declared by:* [`nixos/modules/services/web-apps/rutorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rutorrent.nix)

## `services.rutorrent.poolSettings` {#opt-services.rutorrent.poolSettings}

Options for ruTorrent's PHP pool. See the documentation on `php-fpm.conf` for details on configuration directives.

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

*Declared by:* [`nixos/modules/services/web-apps/rutorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rutorrent.nix)

## `services.rutorrent.rpcSocket` {#opt-services.rutorrent.rpcSocket}

Path to rtorrent rpc socket.

*Type:* string

*Default:* `"config.services.rtorrent.rpcSocket"`

*Declared by:* [`nixos/modules/services/web-apps/rutorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rutorrent.nix)

## `services.rutorrent.user` {#opt-services.rutorrent.user}

User which runs the ruTorrent service.

*Type:* string

*Default:* `"rutorrent"`

*Declared by:* [`nixos/modules/services/web-apps/rutorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/rutorrent.nix)
