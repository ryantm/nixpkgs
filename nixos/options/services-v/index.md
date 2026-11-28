# services (V) {#sec-options-services-v}

## `services.v2ray.config` {#opt-services.v2ray.config}

The configuration object.

Either `configFile` or `config` must be specified.

See [https://www.v2fly.org/en\_US/v5/config/overview.html](https://www.v2fly.org/en_US/v5/config/overview.html).

*Type:* null or JSON value

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

*Declared by:* [`nixos/modules/services/networking/v2ray.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/v2ray.nix)

## `services.v2ray.configFile` {#opt-services.v2ray.configFile}

The absolute path to the configuration file.

Either `configFile` or `config` must be specified.

See [https://www.v2fly.org/en\_US/v5/config/overview.html](https://www.v2fly.org/en_US/v5/config/overview.html).

*Type:* null or string

*Default:* `null`

*Example:* `"/etc/v2ray/config.json"`

*Declared by:* [`nixos/modules/services/networking/v2ray.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/v2ray.nix)

## `services.v2ray.enable` {#opt-services.v2ray.enable}

Whether to run v2ray server.

Either `configFile` or `config` must be specified.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/v2ray.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/v2ray.nix)

## `services.v2ray.package` {#opt-services.v2ray.package}

The v2ray package to use.

*Type:* package

*Default:* `pkgs.v2ray`

*Declared by:* [`nixos/modules/services/networking/v2ray.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/v2ray.nix)

## `services.v2raya.cliPackage` {#opt-services.v2raya.cliPackage}

The v2ray package to use. This is the package used for overriding the value of the `v2ray` attribute in the package set by `services.v2raya.package`.

*Type:* package

*Default:* `pkgs.v2ray`

*Example:* `pkgs.xray`

*Declared by:* [`nixos/modules/services/networking/v2raya.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/v2raya.nix)

## `services.v2raya.enable` {#opt-services.v2raya.enable}

Whether to enable the v2rayA service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/v2raya.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/v2raya.nix)

## `services.v2raya.package` {#opt-services.v2raya.package}

The v2raya package to use.

*Type:* package

*Default:* `pkgs.v2raya`

*Declared by:* [`nixos/modules/services/networking/v2raya.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/v2raya.nix)

## `services.v4l2-relayd.instances` {#opt-services.v4l2-relayd.instances}

v4l2-relayd instances to be created.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  example = {
    cardLabel = "Example card";
    input.pipeline = "videotestsrc";
  };
}
```

*Declared by:* [`nixos/modules/services/video/v4l2-relayd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/v4l2-relayd.nix)

## `services.v4l2-relayd.instances.<name>.bufferCount` {#opt-services.v4l2-relayd.instances._name_.bufferCount}

How many buffers to allocate for the v4l2loopback device.
The program default of 2 is not enough for consuming GStreamer.

*Type:* positive integer, meaning \>0

*Default:* `8`

*Declared by:* [`nixos/modules/services/video/v4l2-relayd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/v4l2-relayd.nix)

## `services.v4l2-relayd.instances.<name>.cardLabel` {#opt-services.v4l2-relayd.instances._name_.cardLabel}

The name the camera will show up as.

*Type:* string

*Declared by:* [`nixos/modules/services/video/v4l2-relayd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/v4l2-relayd.nix)

## `services.v4l2-relayd.instances.<name>.enable` {#opt-services.v4l2-relayd.instances._name_.enable}

Whether to enable this v4l2-relayd instance.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/video/v4l2-relayd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/v4l2-relayd.nix)

## `services.v4l2-relayd.instances.<name>.extraPackages` {#opt-services.v4l2-relayd.instances._name_.extraPackages}

Extra packages to add to `GST_PLUGIN_PATH` for the instance.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/video/v4l2-relayd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/v4l2-relayd.nix)

## `services.v4l2-relayd.instances.<name>.input.format` {#opt-services.v4l2-relayd.instances._name_.input.format}

The video-format to read from input-stream.

*Type:* string

*Default:* `"YUY2"`

*Declared by:* [`nixos/modules/services/video/v4l2-relayd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/v4l2-relayd.nix)

## `services.v4l2-relayd.instances.<name>.input.framerate` {#opt-services.v4l2-relayd.instances._name_.input.framerate}

The framerate to read from input-stream.

*Type:* positive integer, meaning \>0

*Default:* `30`

*Declared by:* [`nixos/modules/services/video/v4l2-relayd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/v4l2-relayd.nix)

## `services.v4l2-relayd.instances.<name>.input.height` {#opt-services.v4l2-relayd.instances._name_.input.height}

The height to read from input-stream.

*Type:* positive integer, meaning \>0

*Default:* `720`

*Declared by:* [`nixos/modules/services/video/v4l2-relayd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/v4l2-relayd.nix)

## `services.v4l2-relayd.instances.<name>.input.pipeline` {#opt-services.v4l2-relayd.instances._name_.input.pipeline}

The gstreamer-pipeline to use for the input-stream.

*Type:* string

*Declared by:* [`nixos/modules/services/video/v4l2-relayd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/v4l2-relayd.nix)

## `services.v4l2-relayd.instances.<name>.input.width` {#opt-services.v4l2-relayd.instances._name_.input.width}

The width to read from input-stream.

*Type:* positive integer, meaning \>0

*Default:* `1280`

*Declared by:* [`nixos/modules/services/video/v4l2-relayd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/v4l2-relayd.nix)

## `services.v4l2-relayd.instances.<name>.name` {#opt-services.v4l2-relayd.instances._name_.name}

The name of the instance.

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/video/v4l2-relayd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/v4l2-relayd.nix)

## `services.v4l2-relayd.instances.<name>.output.format` {#opt-services.v4l2-relayd.instances._name_.output.format}

The video-format to write to output-stream.

*Type:* string

*Default:* `"YUY2"`

*Declared by:* [`nixos/modules/services/video/v4l2-relayd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/v4l2-relayd.nix)

## `services.vault-agent.instances` {#opt-services.vault-agent.instances}

Attribute set of vault-agent instances.
Creates independent `vault-agent-${name}.service` systemd units for each instance defined here.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/vault-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault-agent.nix)

## `services.vault-agent.instances.<name>.enable` {#opt-services.vault-agent.instances._name_.enable}

Whether to enable this vault-agent instance.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/vault-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault-agent.nix)

## `services.vault-agent.instances.<name>.group` {#opt-services.vault-agent.instances._name_.group}

Group under which this instance runs.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/security/vault-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault-agent.nix)

## `services.vault-agent.instances.<name>.package` {#opt-services.vault-agent.instances._name_.package}

The vault package to use.

*Type:* package

*Default:* `pkgs.vault`

*Declared by:* [`nixos/modules/services/security/vault-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault-agent.nix)

## `services.vault-agent.instances.<name>.settings` {#opt-services.vault-agent.instances._name_.settings}

Free-form settings written directly to the `config.json` file.
Refer to [https://developer.hashicorp.com/vault/docs/agent#configuration-file-options](https://developer.hashicorp.com/vault/docs/agent#configuration-file-options) for supported values.

::: note
Resulting format is JSON not HCL.
Refer to [https://www.hcl2json.com/](https://www.hcl2json.com/) if you are unsure how to convert HCL options to JSON.
:::

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/vault-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault-agent.nix)

## `services.vault-agent.instances.<name>.settings.pid_file` {#opt-services.vault-agent.instances._name_.settings.pid_file}

Path to use for the pid file.

*Type:* string

*Default:* `"/run/vault-agent/‹name›.pid"`

*Declared by:* [`nixos/modules/services/security/vault-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault-agent.nix)

## `services.vault-agent.instances.<name>.user` {#opt-services.vault-agent.instances._name_.user}

User under which this instance runs.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/security/vault-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault-agent.nix)

## `services.vault.address` {#opt-services.vault.address}

The name of the ip interface to listen to

*Type:* string

*Default:* `"127.0.0.1:8200"`

*Declared by:* [`nixos/modules/services/security/vault.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault.nix)

## `services.vault.dev` {#opt-services.vault.dev}

In this mode, Vault runs in-memory and starts unsealed. This option is not meant production but for development and testing i.e. for nixos tests.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/vault.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault.nix)

## `services.vault.devRootTokenID` {#opt-services.vault.devRootTokenID}

Initial root token. This only applies when [`services.vault.dev`](#opt-services.vault.dev) is true

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/vault.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault.nix)

## `services.vault.enable` {#opt-services.vault.enable}

Whether to enable Vault daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/vault.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault.nix)

## `services.vault.extraConfig` {#opt-services.vault.extraConfig}

Extra text appended to `vault.hcl`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/security/vault.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault.nix)

## `services.vault.extraSettingsPaths` {#opt-services.vault.extraSettingsPaths}

Configuration files to load besides the immutable one defined by the NixOS module.
This can be used to avoid putting credentials in the Nix store, which can be read by any user.

Each path can point to a JSON- or HCL-formatted file, or a directory
to be scanned for files with `.hcl` or
`.json` extensions.

To upload the confidential file with NixOps, use for example:

```
# https://releases.nixos.org/nixops/latest/manual/manual.html#opt-deployment.keys
deployment.keys."vault.hcl" = let db = import ./db-credentials.nix; in {
  text = ''
    storage "postgresql" {
      connection_url = "postgres://${db.username}:${db.password}@host.example.com/exampledb?sslmode=verify-ca"
    }
  '';
  user = "vault";
};
services.vault.extraSettingsPaths = ["/run/keys/vault.hcl"];
services.vault.storageBackend = "postgresql";
users.users.vault.extraGroups = ["keys"];
```

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/vault.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault.nix)

## `services.vault.listenerExtraConfig` {#opt-services.vault.listenerExtraConfig}

Extra text appended to the listener section.

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  tls_min_version = "tls12"
''
```

*Declared by:* [`nixos/modules/services/security/vault.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault.nix)

## `services.vault.package` {#opt-services.vault.package}

The vault package to use.

*Type:* package

*Default:* `pkgs.vault`

*Declared by:* [`nixos/modules/services/security/vault.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault.nix)

## `services.vault.storageBackend` {#opt-services.vault.storageBackend}

The name of the type of storage backend

*Type:* one of "inmem", "file", "consul", "zookeeper", "s3", "azure", "dynamodb", "etcd", "mssql", "mysql", "postgresql", "swift", "gcs", "raft"

*Default:* `"inmem"`

*Declared by:* [`nixos/modules/services/security/vault.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault.nix)

## `services.vault.storageConfig` {#opt-services.vault.storageConfig}

HCL configuration to insert in the storageBackend section.

Confidential values should not be specified here because this option's
value is written to the Nix store, which is publicly readable.
Provide credentials and such in a separate file using
[services (V)](#opt-services.vault.extraSettingsPaths).

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/vault.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault.nix)

## `services.vault.storagePath` {#opt-services.vault.storagePath}

Data directory for file backend

*Type:* null or absolute path

*Default:*

``` nix
if config.services.vault.storageBackend == "file" || cfg.storageBackend == "raft"
then "/var/lib/vault"
else null
```

*Declared by:* [`nixos/modules/services/security/vault.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault.nix)

## `services.vault.telemetryConfig` {#opt-services.vault.telemetryConfig}

Telemetry configuration

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/security/vault.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault.nix)

## `services.vault.tlsCertFile` {#opt-services.vault.tlsCertFile}

TLS certificate file. TLS will be disabled unless this option is set

*Type:* null or string

*Default:* `null`

*Example:* `"/path/to/your/cert.pem"`

*Declared by:* [`nixos/modules/services/security/vault.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault.nix)

## `services.vault.tlsKeyFile` {#opt-services.vault.tlsKeyFile}

TLS private key file. TLS will be disabled unless this option is set

*Type:* null or string

*Default:* `null`

*Example:* `"/path/to/your/key.pem"`

*Declared by:* [`nixos/modules/services/security/vault.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault.nix)

## `services.vaultwarden.backupDir` {#opt-services.vaultwarden.backupDir}

The directory under which vaultwarden will backup its persistent data.

*Type:* null or string

*Default:* `null`

*Example:* `"/var/backup/vaultwarden"`

*Declared by:* [`nixos/modules/services/security/vaultwarden/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vaultwarden/default.nix)

## `services.vaultwarden.config` {#opt-services.vaultwarden.config}

The configuration of vaultwarden is done through environment variables,
therefore it is recommended to use upper snake case (e.g. `DISABLE_2FA_REMEMBER`).

However, camel case (e.g. `disable2FARemember`) is also supported:
The NixOS module will convert it automatically to
upper case snake case (e.g. `DISABLE_2FA_REMEMBER`).
In this conversion digits (0-9) are handled just like upper case characters,
so `foo2` would be converted to `FOO_2`.
Names already in this format remain unchanged, so `FOO2` remains `FOO2` if passed as such,
even though `foo2` would have been converted to `FOO_2`.
This allows working around any potential future conflicting naming conventions.

Based on the attributes passed to this config option an environment file will be generated
that is passed to vaultwarden's systemd service.

The available configuration options can be found in
[the environment template file](https://github.com/dani-garcia/vaultwarden/blob/1.37.5/.env.template).

See [services (V)](#opt-services.vaultwarden.environmentFile) for how
to set up access to the Admin UI to invite initial users.

*Type:* attribute set of (null or boolean or signed integer or string)

*Default:*

``` nix
{
  ROCKET_ADDRESS = "::1";
  ROCKET_PORT = 8222;
}
```

*Example:*

``` nix
{
  DOMAIN = "https://bitwarden.example.com";
  SIGNUPS_ALLOWED = false;

  # Vaultwarden recommends running behind a reverse proxy, the configureNginx option can be used for that.
  ROCKET_ADDRESS = "127.0.0.1";
  ROCKET_PORT = 8222;

  ROCKET_LOG = "critical";

  # This example assumes a mailserver running on localhost,
  # thus without transport encryption.
  # If you use an external mail server, follow:
  #   https://github.com/dani-garcia/vaultwarden/wiki/SMTP-configuration
  SMTP_HOST = "127.0.0.1";
  SMTP_PORT = 25;
  SMTP_SSL = false;

  SMTP_FROM = "admin@bitwarden.example.com";
  SMTP_FROM_NAME = "example.com Bitwarden server";
}
```

*Declared by:* [`nixos/modules/services/security/vaultwarden/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vaultwarden/default.nix)

## `services.vaultwarden.configureNginx` {#opt-services.vaultwarden.configureNginx}

Whether to configure nginx to serve VaultWarden.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/vaultwarden/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vaultwarden/default.nix)

## `services.vaultwarden.configurePostgres` {#opt-services.vaultwarden.configurePostgres}

Whether to configure a local PostgreSQL server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/vaultwarden/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vaultwarden/default.nix)

## `services.vaultwarden.dbBackend` {#opt-services.vaultwarden.dbBackend}

Which database backend vaultwarden will be using.

*Type:* one of "sqlite", "mysql", "postgresql", "sqlite\_system"

*Default:* `"sqlite_system"`

*Declared by:* [`nixos/modules/services/security/vaultwarden/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vaultwarden/default.nix)

## `services.vaultwarden.domain` {#opt-services.vaultwarden.domain}

The domain under which VaultWarden will be reachable.

*Type:* null or string

*Default:* `null`

*Example:* `"bitwarden.example.com"`

*Declared by:* [`nixos/modules/services/security/vaultwarden/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vaultwarden/default.nix)

## `services.vaultwarden.enable` {#opt-services.vaultwarden.enable}

Whether to enable vaultwarden.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/vaultwarden/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vaultwarden/default.nix)

## `services.vaultwarden.environmentFile` {#opt-services.vaultwarden.environmentFile}

Additional environment file or files as defined in `systemd.exec(5)`.

Secrets like `ADMIN_TOKEN` and `SMTP_PASSWORD`
should be passed to the service without adding them to the world-readable Nix store.

Note that this file needs to be available on the host on which `vaultwarden` is running.

As a concrete example, to make the Admin UI available (from which new users can be invited initially),
the secret `ADMIN_TOKEN` needs to be defined as described
[here](https://github.com/dani-garcia/vaultwarden/wiki/Enabling-admin-page):

```
# Admin secret token, see
# https://github.com/dani-garcia/vaultwarden/wiki/Enabling-admin-page
ADMIN_TOKEN=...copy-paste a unique generated secret token here...
```

*Type:* (list of absolute path) or absolute path convertible to it

*Default:* `[ ]`

*Example:* `"/var/lib/vaultwarden.env"`

*Declared by:* [`nixos/modules/services/security/vaultwarden/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vaultwarden/default.nix)

## `services.vaultwarden.package` {#opt-services.vaultwarden.package}

The vaultwarden package to use.

*Type:* package

*Default:* `pkgs.vaultwarden`

*Declared by:* [`nixos/modules/services/security/vaultwarden/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vaultwarden/default.nix)

## `services.vaultwarden.webVaultPackage` {#opt-services.vaultwarden.webVaultPackage}

The webvault package to use.

*Type:* package

*Default:* `pkgs.vaultwarden.webvault`

*Declared by:* [`nixos/modules/services/security/vaultwarden/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vaultwarden/default.nix)

## `services.vdirsyncer.enable` {#opt-services.vdirsyncer.enable}

Whether to enable vdirsyncer.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/vdirsyncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vdirsyncer.nix)

## `services.vdirsyncer.jobs` {#opt-services.vdirsyncer.jobs}

vdirsyncer job configurations

*Type:* attribute set of (submodule)

*Declared by:* [`nixos/modules/services/networking/vdirsyncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vdirsyncer.nix)

## `services.vdirsyncer.jobs.<name>.additionalGroups` {#opt-services.vdirsyncer.jobs._name_.additionalGroups}

additional groups to add the dynamic user to

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/vdirsyncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vdirsyncer.nix)

## `services.vdirsyncer.jobs.<name>.config.general` {#opt-services.vdirsyncer.jobs._name_.config.general}

general configuration

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/vdirsyncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vdirsyncer.nix)

## `services.vdirsyncer.jobs.<name>.config.pairs` {#opt-services.vdirsyncer.jobs._name_.config.pairs}

vdirsyncer pair configurations

*Type:* attribute set of (attribute set)

*Default:* `{ }`

*Example:*

``` nix
{
  my_contacts = {
    a = "my_cloud_contacts";
    b = "my_local_contacts";
    collections = [ "from a" ];
    conflict_resolution = "a wins";
    metadata = [ "color" "displayname" ];
  };
};
```

*Declared by:* [`nixos/modules/services/networking/vdirsyncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vdirsyncer.nix)

## `services.vdirsyncer.jobs.<name>.config.statusPath` {#opt-services.vdirsyncer.jobs._name_.config.statusPath}

vdirsyncer's status path

*Type:* null or string

*Default:* `/var/lib/vdirsyncer/${attrName}`

*Declared by:* [`nixos/modules/services/networking/vdirsyncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vdirsyncer.nix)

## `services.vdirsyncer.jobs.<name>.config.storages` {#opt-services.vdirsyncer.jobs._name_.config.storages}

vdirsyncer storage configurations

*Type:* attribute set of (attribute set)

*Default:* `{ }`

*Example:*

``` nix
{
  my_cloud_contacts = {
    type = "carddav";
    url = "https://dav.example.com/";
    read_only = true;
    username = "user";
    "password.fetch" = [ "command" "cat" "/etc/vdirsyncer/cloud.passwd" ];
  };
  my_local_contacts = {
    type = "carddav";
    url = "https://localhost/";
    username = "user";
    "password.fetch" = [ "command" "cat" "/etc/vdirsyncer/local.passwd" ];
  };
}
```

*Declared by:* [`nixos/modules/services/networking/vdirsyncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vdirsyncer.nix)

## `services.vdirsyncer.jobs.<name>.configFile` {#opt-services.vdirsyncer.jobs._name_.configFile}

existing configuration file

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/vdirsyncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vdirsyncer.nix)

## `services.vdirsyncer.jobs.<name>.enable` {#opt-services.vdirsyncer.jobs._name_.enable}

Whether to enable this vdirsyncer job.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/networking/vdirsyncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vdirsyncer.nix)

## `services.vdirsyncer.jobs.<name>.forceDiscover` {#opt-services.vdirsyncer.jobs._name_.forceDiscover}

Run `yes | vdirsyncer discover` prior to `vdirsyncer sync`

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/vdirsyncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vdirsyncer.nix)

## `services.vdirsyncer.jobs.<name>.group` {#opt-services.vdirsyncer.jobs._name_.group}

group to run vdirsyncer as

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/vdirsyncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vdirsyncer.nix)

## `services.vdirsyncer.jobs.<name>.timerConfig` {#opt-services.vdirsyncer.jobs._name_.timerConfig}

systemd timer configuration

*Type:* attribute set

*Default:*

``` nix
{
  OnBootSec = "1h";
  OnUnitActiveSec = "6h";
}
```

*Declared by:* [`nixos/modules/services/networking/vdirsyncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vdirsyncer.nix)

## `services.vdirsyncer.jobs.<name>.user` {#opt-services.vdirsyncer.jobs._name_.user}

User account to run vdirsyncer as, otherwise as a systemd
dynamic user

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/vdirsyncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vdirsyncer.nix)

## `services.vdirsyncer.package` {#opt-services.vdirsyncer.package}

The vdirsyncer package to use.

*Type:* package

*Default:* `pkgs.vdirsyncer`

*Declared by:* [`nixos/modules/services/networking/vdirsyncer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vdirsyncer.nix)

## `services.vdr.enable` {#opt-services.vdr.enable}

Whether to enable VDR, a video disk recorder.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/vdr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/vdr.nix)

## `services.vdr.enableLirc` {#opt-services.vdr.enableLirc}

Whether to enable LIRC.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/vdr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/vdr.nix)

## `services.vdr.extraArguments` {#opt-services.vdr.extraArguments}

Additional command line arguments to pass to VDR.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/hardware/vdr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/vdr.nix)

## `services.vdr.group` {#opt-services.vdr.group}

Group under which the VDRvdr service runs.

*Type:* string

*Default:* `"vdr"`

*Declared by:* [`nixos/modules/services/hardware/vdr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/vdr.nix)

## `services.vdr.package` {#opt-services.vdr.package}

The vdr package to use.

*Type:* package

*Default:* `pkgs.vdr`

*Example:* `wrapVdr.override { plugins = with pkgs.vdrPlugins; [ hello ]; }`

*Declared by:* [`nixos/modules/services/hardware/vdr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/vdr.nix)

## `services.vdr.user` {#opt-services.vdr.user}

User under which the VDR service runs.

*Type:* string

*Default:* `"vdr"`

*Declared by:* [`nixos/modules/services/hardware/vdr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/vdr.nix)

## `services.vdr.videoDir` {#opt-services.vdr.videoDir}

Recording directory

*Type:* absolute path

*Default:* `"/srv/vdr/video"`

*Declared by:* [`nixos/modules/services/hardware/vdr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/vdr.nix)

## `services.vector.enable` {#opt-services.vector.enable}

Whether to enable Vector, a high-performance observability data pipeline.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/logging/vector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/vector.nix)

## `services.vector.gracefulShutdownLimitSecs` {#opt-services.vector.gracefulShutdownLimitSecs}

Set the duration in seconds to wait for graceful shutdown after SIGINT or SIGTERM are received.
After the duration has passed, Vector will force shutdown.

*Type:* positive integer, meaning \>0

*Default:* `60`

*Declared by:* [`nixos/modules/services/logging/vector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/vector.nix)

## `services.vector.journaldAccess` {#opt-services.vector.journaldAccess}

Enable Vector to access journald.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/logging/vector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/vector.nix)

## `services.vector.package` {#opt-services.vector.package}

The vector package to use.

*Type:* package

*Default:* `pkgs.vector`

*Declared by:* [`nixos/modules/services/logging/vector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/vector.nix)

## `services.vector.settings` {#opt-services.vector.settings}

Specify the configuration for Vector in Nix.

*Type:* JSON value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/logging/vector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/vector.nix)

## `services.vector.validateConfig` {#opt-services.vector.validateConfig}

Enable the checking of the vector config during build time. This should be disabled when interpolating environment variables.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/logging/vector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/vector.nix)

## `services.veilid.enable` {#opt-services.veilid.enable}

Whether to enable Veilid Headless Node.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/veilid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/veilid.nix)

## `services.veilid.openFirewall` {#opt-services.veilid.openFirewall}

Whether to open firewall on ports 5150/tcp, 5150/udp

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/veilid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/veilid.nix)

## `services.veilid.settings` {#opt-services.veilid.settings}

Build veilid-server.conf with nix expression.
Check [Configuration Keys](https://veilid.gitlab.io/developer-book/admin/config.html#configuration-keys).

*Type:* open submodule of (YAML 1.1 value)

*Declared by:* [`nixos/modules/services/networking/veilid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/veilid.nix)

## `services.veilid.settings.client_api.ipc_directory` {#opt-services.veilid.settings.client_api.ipc_directory}

IPC directory where file sockets are stored.

*Type:* string

*Default:* `"/var/db/veilid-server/ipc"`

*Declared by:* [`nixos/modules/services/networking/veilid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/veilid.nix)

## `services.veilid.settings.client_api.ipc_enabled` {#opt-services.veilid.settings.client_api.ipc_enabled}

veilid-server will respond to Python and other JSON client requests.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/veilid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/veilid.nix)

## `services.veilid.settings.core.block_store.directory` {#opt-services.veilid.settings.core.block_store.directory}

The filesystem directory to store blocks for the block store.

*Type:* null or string

*Default:* `"/var/db/veilid-server/block_store"`

*Declared by:* [`nixos/modules/services/networking/veilid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/veilid.nix)

## `services.veilid.settings.core.capabilities.disable` {#opt-services.veilid.settings.core.capabilities.disable}

A list of capabilities to disable (for example, DHTV to say you cannot store DHT information).

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "APPM"
]
```

*Declared by:* [`nixos/modules/services/networking/veilid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/veilid.nix)

## `services.veilid.settings.core.network.detect_address_changes` {#opt-services.veilid.settings.core.network.detect_address_changes}

Should veilid-core detect and notify on network address changes?

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/veilid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/veilid.nix)

## `services.veilid.settings.core.network.dht.min_peer_count` {#opt-services.veilid.settings.core.network.dht.min_peer_count}

Minimum number of nodes to keep in the peer table.

*Type:* null or signed integer or floating point number

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/veilid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/veilid.nix)

## `services.veilid.settings.core.network.routing_table.bootstrap` {#opt-services.veilid.settings.core.network.routing_table.bootstrap}

Host name of existing well-known Veilid bootstrap servers for the network to connect to.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/veilid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/veilid.nix)

## `services.veilid.settings.core.network.routing_table.public_keys` {#opt-services.veilid.settings.core.network.routing_table.public_keys}

Base64-encoded public key for the node, used as the node's ID.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/veilid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/veilid.nix)

## `services.veilid.settings.core.network.upnp` {#opt-services.veilid.settings.core.network.upnp}

Should the app try to improve its incoming network connectivity using UPnP?

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/veilid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/veilid.nix)

## `services.veilid.settings.core.protected_store.allow_insecure_fallback` {#opt-services.veilid.settings.core.protected_store.allow_insecure_fallback}

If we can't use system-provided secure storage, should we proceed anyway?

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/veilid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/veilid.nix)

## `services.veilid.settings.core.protected_store.always_use_insecure_storage` {#opt-services.veilid.settings.core.protected_store.always_use_insecure_storage}

Should we bypass any attempt to use system-provided secure storage?

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/veilid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/veilid.nix)

## `services.veilid.settings.core.protected_store.directory` {#opt-services.veilid.settings.core.protected_store.directory}

The filesystem directory to store your protected store in.

*Type:* string

*Default:* `"/var/db/veilid-server/protected_store"`

*Declared by:* [`nixos/modules/services/networking/veilid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/veilid.nix)

## `services.veilid.settings.core.table_store.directory` {#opt-services.veilid.settings.core.table_store.directory}

The filesystem directory to store your table store within.

*Type:* string

*Default:* `"/var/db/veilid-server/table_store"`

*Declared by:* [`nixos/modules/services/networking/veilid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/veilid.nix)

## `services.veilid.settings.logging.api.enabled` {#opt-services.veilid.settings.logging.api.enabled}

Events of type 'api' will be logged.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/veilid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/veilid.nix)

## `services.veilid.settings.logging.api.level` {#opt-services.veilid.settings.logging.api.level}

The minimum priority of api events to be logged.

*Type:* string

*Default:* `"info"`

*Example:* `"debug"`

*Declared by:* [`nixos/modules/services/networking/veilid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/veilid.nix)

## `services.veilid.settings.logging.system.enabled` {#opt-services.veilid.settings.logging.system.enabled}

Events of type 'system' will be logged.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/veilid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/veilid.nix)

## `services.veilid.settings.logging.system.level` {#opt-services.veilid.settings.logging.system.level}

The minimum priority of system events to be logged.

*Type:* string

*Default:* `"info"`

*Example:* `"debug"`

*Declared by:* [`nixos/modules/services/networking/veilid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/veilid.nix)

## `services.veilid.settings.logging.terminal.enabled` {#opt-services.veilid.settings.logging.terminal.enabled}

Events of type 'terminal' will be logged.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/veilid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/veilid.nix)

## `services.veilid.settings.logging.terminal.level` {#opt-services.veilid.settings.logging.terminal.level}

The minimum priority of terminal events to be logged.

*Type:* string

*Default:* `"info"`

*Example:* `"debug"`

*Declared by:* [`nixos/modules/services/networking/veilid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/veilid.nix)

## `services.vellum.enable` {#opt-services.vellum.enable}

Whether to enable vellum, a live screen annotation overlay for Wayland.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/wayland/vellum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/wayland/vellum.nix)

## `services.vellum.package` {#opt-services.vellum.package}

The vellum package to use.

*Type:* package

*Default:* `pkgs.vellum`

*Declared by:* [`nixos/modules/services/wayland/vellum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/wayland/vellum.nix)

## `services.vellum.settings` {#opt-services.vellum.settings}

Configuration options for vellum.
See available options at [https://github.com/greyxp1/vellum/blob/master/default-config.toml](https://github.com/greyxp1/vellum/blob/master/default-config.toml).

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  default_fill_shapes = true;
  default_tool = "arrow";
  feedback_duration_ms = 250;
  palette = [
    "#FF6B6B"
    "#FFD93D"
    "#6BCB77"
    "#4D96FF"
    "#845EC2"
  ];
  remember_last_tool = false;
  tools = {
    pen = {
      opacity = 0.75;
    };
  };
}
```

*Declared by:* [`nixos/modules/services/wayland/vellum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/wayland/vellum.nix)

## `services.victorialogs.basicAuthPasswordFile` {#opt-services.victorialogs.basicAuthPasswordFile}

File that contains the Basic Auth password used to protect VictoriaLogs instance by authorization

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/victorialogs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victorialogs.nix)

## `services.victorialogs.basicAuthUsername` {#opt-services.victorialogs.basicAuthUsername}

Basic Auth username used to protect VictoriaLogs instance by authorization

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/victorialogs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victorialogs.nix)

## `services.victorialogs.enable` {#opt-services.victorialogs.enable}

Whether to enable VictoriaLogs is an open source user-friendly database for logs from VictoriaMetrics.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/victorialogs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victorialogs.nix)

## `services.victorialogs.extraOptions` {#opt-services.victorialogs.extraOptions}

Extra options to pass to VictoriaLogs. See `victoria-logs -help` for
possible options.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-loggerLevel=WARN"
]
```

*Declared by:* [`nixos/modules/services/databases/victorialogs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victorialogs.nix)

## `services.victorialogs.listenAddress` {#opt-services.victorialogs.listenAddress}

TCP address to listen for incoming http requests.

*Type:* string

*Default:* `":9428"`

*Declared by:* [`nixos/modules/services/databases/victorialogs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victorialogs.nix)

## `services.victorialogs.package` {#opt-services.victorialogs.package}

The victorialogs package to use.

*Type:* package

*Default:* `pkgs.victorialogs`

*Declared by:* [`nixos/modules/services/databases/victorialogs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victorialogs.nix)

## `services.victorialogs.stateDir` {#opt-services.victorialogs.stateDir}

Directory below `/var/lib` to store VictoriaLogs data.
This directory will be created automatically using systemd's StateDirectory mechanism.

*Type:* string

*Default:* `"victorialogs"`

*Declared by:* [`nixos/modules/services/databases/victorialogs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victorialogs.nix)

## `services.victoriametrics.basicAuthPasswordFile` {#opt-services.victoriametrics.basicAuthPasswordFile}

File that contains the Basic Auth password used to protect VictoriaMetrics instance by authorization

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/victoriametrics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victoriametrics.nix)

## `services.victoriametrics.basicAuthUsername` {#opt-services.victoriametrics.basicAuthUsername}

Basic Auth username used to protect VictoriaMetrics instance by authorization

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/victoriametrics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victoriametrics.nix)

## `services.victoriametrics.checkConfig` {#opt-services.victoriametrics.checkConfig}

Check configuration.

If you use credentials stored in external files (`environmentFile`, etc),
they will not be visible  and it will report errors, despite a correct configuration.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/databases/victoriametrics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victoriametrics.nix)

## `services.victoriametrics.enable` {#opt-services.victoriametrics.enable}

Whether to enable VictoriaMetrics in single-node mode.

VictoriaMetrics is a fast, cost-effective and scalable monitoring solution and time series database.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/victoriametrics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victoriametrics.nix)

## `services.victoriametrics.extraOptions` {#opt-services.victoriametrics.extraOptions}

Extra options to pass to VictoriaMetrics. See the docs:
[https://docs.victoriametrics.com/single-server-victoriametrics/#list-of-command-line-flags](https://docs.victoriametrics.com/single-server-victoriametrics/#list-of-command-line-flags)
or `victoriametrics -help` for more information.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-loggerLevel=WARN"
]
```

*Declared by:* [`nixos/modules/services/databases/victoriametrics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victoriametrics.nix)

## `services.victoriametrics.listenAddress` {#opt-services.victoriametrics.listenAddress}

TCP address to listen for incoming http requests.

*Type:* string

*Default:* `":8428"`

*Declared by:* [`nixos/modules/services/databases/victoriametrics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victoriametrics.nix)

## `services.victoriametrics.package` {#opt-services.victoriametrics.package}

The victoriametrics package to use.

*Type:* package

*Default:* `pkgs.victoriametrics`

*Declared by:* [`nixos/modules/services/databases/victoriametrics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victoriametrics.nix)

## `services.victoriametrics.prometheusConfig` {#opt-services.victoriametrics.prometheusConfig}

Config for prometheus style metrics.
See the docs: [https://docs.victoriametrics.com/vmagent/#how-to-collect-metrics-in-prometheus-format](https://docs.victoriametrics.com/vmagent/#how-to-collect-metrics-in-prometheus-format)
for more information.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Example:*

``` nix
{
  scrape_configs = [
    {
      job_name = "postgres-exporter";
      metrics_path = "/metrics";
      static_configs = [
        {
          targets = ["1.2.3.4:9187"];
          labels.type = "database";
        }
      ];
    }
    {
      job_name = "node-exporter";
      metrics_path = "/metrics";
      static_configs = [
        {
          targets = ["1.2.3.4:9100"];
          labels.type = "node";
        }
        {
          targets = ["5.6.7.8:9100"];
          labels.type = "node";
        }
      ];
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/databases/victoriametrics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victoriametrics.nix)

## `services.victoriametrics.retentionPeriod` {#opt-services.victoriametrics.retentionPeriod}

How long to retain samples in storage.
The minimum retentionPeriod is 24h or 1d. See also -retentionFilter
The following optional suffixes are supported: s (second), h (hour), d (day), w (week), y (year).
If suffix isn't set, then the duration is counted in months (default 1)

*Type:* null or string

*Default:* `null`

*Example:* `"15d"`

*Declared by:* [`nixos/modules/services/databases/victoriametrics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victoriametrics.nix)

## `services.victoriametrics.stateDir` {#opt-services.victoriametrics.stateDir}

Directory below `/var/lib` to store VictoriaMetrics metrics data.
This directory will be created automatically using systemd's StateDirectory mechanism.

*Type:* string

*Default:* `"victoriametrics"`

*Declared by:* [`nixos/modules/services/databases/victoriametrics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victoriametrics.nix)

## `services.victoriatraces.basicAuthPasswordFile` {#opt-services.victoriatraces.basicAuthPasswordFile}

File that contains the Basic Auth password used to protect VictoriaTraces instance by authorization

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/victoriatraces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victoriatraces.nix)

## `services.victoriatraces.basicAuthUsername` {#opt-services.victoriatraces.basicAuthUsername}

Basic Auth username used to protect VictoriaTraces instance by authorization

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/victoriatraces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victoriatraces.nix)

## `services.victoriatraces.enable` {#opt-services.victoriatraces.enable}

Whether to enable VictoriaTraces is an open source distributed traces storage and query engine from VictoriaMetrics.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/victoriatraces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victoriatraces.nix)

## `services.victoriatraces.extraOptions` {#opt-services.victoriatraces.extraOptions}

Extra options to pass to VictoriaTraces. See `victoria-traces -help` for
possible options.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-loggerLevel=WARN"
  "-retention.maxDiskSpaceUsageBytes=1073741824"
]
```

*Declared by:* [`nixos/modules/services/databases/victoriatraces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victoriatraces.nix)

## `services.victoriatraces.listenAddress` {#opt-services.victoriatraces.listenAddress}

TCP address to listen for incoming http requests.

*Type:* string

*Default:* `":10428"`

*Declared by:* [`nixos/modules/services/databases/victoriatraces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victoriatraces.nix)

## `services.victoriatraces.package` {#opt-services.victoriatraces.package}

The victoriatraces package to use.

*Type:* package

*Default:* `pkgs.victoriatraces`

*Declared by:* [`nixos/modules/services/databases/victoriatraces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victoriatraces.nix)

## `services.victoriatraces.retentionPeriod` {#opt-services.victoriatraces.retentionPeriod}

Retention period for trace data. Data older than retentionPeriod is automatically deleted.

*Type:* string

*Default:* `"7d"`

*Example:* `"30d"`

*Declared by:* [`nixos/modules/services/databases/victoriatraces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victoriatraces.nix)

## `services.victoriatraces.stateDir` {#opt-services.victoriatraces.stateDir}

Directory below `/var/lib` to store VictoriaTraces data.
This directory will be created automatically using systemd's StateDirectory mechanism.

*Type:* string

*Default:* `"victoriatraces"`

*Declared by:* [`nixos/modules/services/databases/victoriatraces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/victoriatraces.nix)

## `services.vikunja.address` {#opt-services.vikunja.address}

The IP address to bind to.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/vikunja.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/vikunja.nix)

## `services.vikunja.database.database` {#opt-services.vikunja.database.database}

Database name.

*Type:* string

*Default:* `"vikunja"`

*Declared by:* [`nixos/modules/services/web-apps/vikunja.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/vikunja.nix)

## `services.vikunja.database.host` {#opt-services.vikunja.database.host}

Database host address. Can also be a socket.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/vikunja.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/vikunja.nix)

## `services.vikunja.database.path` {#opt-services.vikunja.database.path}

Path to the sqlite3 database file.

*Type:* string

*Default:* `"/var/lib/vikunja/vikunja.db"`

*Declared by:* [`nixos/modules/services/web-apps/vikunja.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/vikunja.nix)

## `services.vikunja.database.type` {#opt-services.vikunja.database.type}

Database engine to use.

*Type:* one of "sqlite", "mysql", "postgres"

*Default:* `"sqlite"`

*Example:* `"postgres"`

*Declared by:* [`nixos/modules/services/web-apps/vikunja.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/vikunja.nix)

## `services.vikunja.database.user` {#opt-services.vikunja.database.user}

Database user.

*Type:* string

*Default:* `"vikunja"`

*Declared by:* [`nixos/modules/services/web-apps/vikunja.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/vikunja.nix)

## `services.vikunja.enable` {#opt-services.vikunja.enable}

Whether to enable vikunja service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/vikunja.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/vikunja.nix)

## `services.vikunja.environmentFiles` {#opt-services.vikunja.environmentFiles}

List of environment files set in the vikunja systemd service.
For example passwords should be set in one of these files.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/vikunja.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/vikunja.nix)

## `services.vikunja.frontendHostname` {#opt-services.vikunja.frontendHostname}

The Hostname under which the frontend is running.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/vikunja.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/vikunja.nix)

## `services.vikunja.frontendScheme` {#opt-services.vikunja.frontendScheme}

Whether the site is available via http or https.

*Type:* one of "http", "https"

*Declared by:* [`nixos/modules/services/web-apps/vikunja.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/vikunja.nix)

## `services.vikunja.package` {#opt-services.vikunja.package}

The vikunja package to use.

*Type:* package

*Default:* `pkgs.vikunja`

*Declared by:* [`nixos/modules/services/web-apps/vikunja.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/vikunja.nix)

## `services.vikunja.port` {#opt-services.vikunja.port}

The TCP port exposed by the API.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3456`

*Declared by:* [`nixos/modules/services/web-apps/vikunja.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/vikunja.nix)

## `services.vikunja.settings` {#opt-services.vikunja.settings}

Vikunja configuration. Refer to
[https://vikunja.io/docs/config-options/](https://vikunja.io/docs/config-options/)
for details on supported values.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/vikunja.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/vikunja.nix)

## `services.vinyl-cache.config` {#opt-services.vinyl-cache.config}

Verbatim default.vcl configuration.

*Type:* strings concatenated with "\\n"

*Declared by:* [`nixos/modules/services/web-servers/vinyl-cache/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/vinyl-cache/default.nix)

## `services.vinyl-cache.enable` {#opt-services.vinyl-cache.enable}

Whether to enable Vinyl Cache.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/vinyl-cache/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/vinyl-cache/default.nix)

## `services.vinyl-cache.enableConfigCheck` {#opt-services.vinyl-cache.enableConfigCheck}

Whether to enable checking the config during build time.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/vinyl-cache/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/vinyl-cache/default.nix)

## `services.vinyl-cache.enableFileLogging` {#opt-services.vinyl-cache.enableFileLogging}

Whether to enable file based logging.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/vinyl-cache/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/vinyl-cache/default.nix)

## `services.vinyl-cache.extraCommandLine` {#opt-services.vinyl-cache.extraCommandLine}

Command line switches for vinyld (run 'vinyld -?' to get list of options)

*Type:* string

*Default:* `""`

*Example:* `"-s malloc,256M"`

*Declared by:* [`nixos/modules/services/web-servers/vinyl-cache/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/vinyl-cache/default.nix)

## `services.vinyl-cache.extraModules` {#opt-services.vinyl-cache.extraModules}

Vinyl Cache modules (except 'std').

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-servers/vinyl-cache/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/vinyl-cache/default.nix)

## `services.vinyl-cache.listen` {#opt-services.vinyl-cache.listen}

Accept for client requests on the specified listen addresses.

*Type:* list of (submodule)

*Default:* `[ { address="*"; port=6081; } ]`

*Declared by:* [`nixos/modules/services/web-servers/vinyl-cache/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/vinyl-cache/default.nix)

## `services.vinyl-cache.listen.*.address` {#opt-services.vinyl-cache.listen._.address}

If given an IP address, it can be a host name ("localhost"), an IPv4 dotted-quad
("127.0.0.1") or an IPv6  address enclosed in square brackets ("\[::1\]").

(VCL4.1 and higher) If given an absolute Path ("/path/to/listen.sock") or "@"
followed by the name of an abstract socket ("@myvinyld") accept connections
on a Unix domain socket.

The user, group and mode sub-arguments may be used to specify the permissions
of the socket file. These sub-arguments do not apply to  abstract sockets.

*Type:* string

*Declared by:* [`nixos/modules/services/web-servers/vinyl-cache/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/vinyl-cache/default.nix)

## `services.vinyl-cache.listen.*.group` {#opt-services.vinyl-cache.listen._.group}

Group name who owns the socket file.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/vinyl-cache/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/vinyl-cache/default.nix)

## `services.vinyl-cache.listen.*.mode` {#opt-services.vinyl-cache.listen._.mode}

Permission of the socket file (3-digit octal value).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/vinyl-cache/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/vinyl-cache/default.nix)

## `services.vinyl-cache.listen.*.name` {#opt-services.vinyl-cache.listen._.name}

Name is referenced in logs. If name is not specified, 'a0', 'a1', etc. is used.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/vinyl-cache/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/vinyl-cache/default.nix)

## `services.vinyl-cache.listen.*.port` {#opt-services.vinyl-cache.listen._.port}

The port to use for IP sockets. If port is not specified, port 80 (http) is used.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/vinyl-cache/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/vinyl-cache/default.nix)

## `services.vinyl-cache.listen.*.proto` {#opt-services.vinyl-cache.listen._.proto}

PROTO can be 'HTTP' (the default) or 'PROXY'.  Both version 1 and 2 of the proxy protocol can be used.

*Type:* one of "HTTP", "PROXY"

*Default:* `"HTTP"`

*Declared by:* [`nixos/modules/services/web-servers/vinyl-cache/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/vinyl-cache/default.nix)

## `services.vinyl-cache.listen.*.user` {#opt-services.vinyl-cache.listen._.user}

User name who owns the socket file.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/vinyl-cache/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/vinyl-cache/default.nix)

## `services.vinyl-cache.package` {#opt-services.vinyl-cache.package}

The vinyl-cache package to use.

*Type:* package

*Default:* `pkgs.vinyl-cache`

*Declared by:* [`nixos/modules/services/web-servers/vinyl-cache/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/vinyl-cache/default.nix)

## `services.vlagent.enable` {#opt-services.vlagent.enable}

Whether to enable VictoriaMetrics's `vlagent`.

`vlagent` is a tiny agent which helps you collect logs from various sources and store them in VictoriaLogs .

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/vlagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vlagent.nix)

## `services.vlagent.extraArgs` {#opt-services.vlagent.extraArgs}

Extra args to pass to `vlagent`. See the docs:
[https://docs.victoriametrics.com/vlagent.html#advanced-usage](https://docs.victoriametrics.com/vlagent.html#advanced-usage)
or `vlagent -help` for more information.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/vlagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vlagent.nix)

## `services.vlagent.openFirewall` {#opt-services.vlagent.openFirewall}

Whether to open the firewall for the default ports.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/vlagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vlagent.nix)

## `services.vlagent.package` {#opt-services.vlagent.package}

The vlagent package to use.

*Type:* package

*Default:* `pkgs.vlagent`

*Declared by:* [`nixos/modules/services/monitoring/vlagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vlagent.nix)

## `services.vlagent.remoteWrite.basicAuthPasswordFile` {#opt-services.vlagent.remoteWrite.basicAuthPasswordFile}

File that contains the Basic Auth password used to connect to remote\_write endpoint

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/vlagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vlagent.nix)

## `services.vlagent.remoteWrite.basicAuthUsername` {#opt-services.vlagent.remoteWrite.basicAuthUsername}

Basic Auth username used to connect to remote\_write endpoint

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/vlagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vlagent.nix)

## `services.vlagent.remoteWrite.maxDiskUsagePerUrl` {#opt-services.vlagent.remoteWrite.maxDiskUsagePerUrl}

The maximum file-based buffer size in bytes. Supports the following optional suffixes for size values: KB, MB, GB, TB, KiB, MiB, GiB, TiB.
See docs for more infomations: [https://docs.victoriametrics.com/vlagent.html#advanced-usage](https://docs.victoriametrics.com/vlagent.html#advanced-usage)

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/vlagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vlagent.nix)

## `services.vlagent.remoteWrite.url` {#opt-services.vlagent.remoteWrite.url}

Endpoint for the victorialogs instance

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/vlagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vlagent.nix)

## `services.vmagent.checkConfig` {#opt-services.vmagent.checkConfig}

Check configuration.

If you use credentials stored in external files (`environmentFile`, etc),
they will not be visible  and it will report errors, despite a correct configuration.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/vmagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vmagent.nix)

## `services.vmagent.enable` {#opt-services.vmagent.enable}

Whether to enable VictoriaMetrics's `vmagent`.

`vmagent` efficiently scrape metrics from Prometheus-compatible exporters

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/vmagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vmagent.nix)

## `services.vmagent.extraArgs` {#opt-services.vmagent.extraArgs}

Extra args to pass to `vmagent`. See the docs:
[https://docs.victoriametrics.com/vmagent.html#advanced-usage](https://docs.victoriametrics.com/vmagent.html#advanced-usage)
or `vmagent -help` for more information.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/vmagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vmagent.nix)

## `services.vmagent.openFirewall` {#opt-services.vmagent.openFirewall}

Whether to open the firewall for the default ports.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/vmagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vmagent.nix)

## `services.vmagent.package` {#opt-services.vmagent.package}

The vmagent package to use.

*Type:* package

*Default:* `pkgs.vmagent`

*Declared by:* [`nixos/modules/services/monitoring/vmagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vmagent.nix)

## `services.vmagent.prometheusConfig` {#opt-services.vmagent.prometheusConfig}

Config for prometheus style metrics

*Type:* open submodule of (YAML 1.1 value)

*Declared by:* [`nixos/modules/services/monitoring/vmagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vmagent.nix)

## `services.vmagent.remoteWrite.basicAuthPasswordFile` {#opt-services.vmagent.remoteWrite.basicAuthPasswordFile}

File that contains the Basic Auth password used to connect to remote\_write endpoint

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/vmagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vmagent.nix)

## `services.vmagent.remoteWrite.basicAuthUsername` {#opt-services.vmagent.remoteWrite.basicAuthUsername}

Basic Auth username used to connect to remote\_write endpoint

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/vmagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vmagent.nix)

## `services.vmagent.remoteWrite.url` {#opt-services.vmagent.remoteWrite.url}

Endpoint for prometheus compatible remote\_write

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/vmagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vmagent.nix)

## `services.vmalert.instances` {#opt-services.vmalert.instances}

Define multiple instances of vmalert.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/vmalert.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vmalert.nix)

## `services.vmalert.instances.<name>.enable` {#opt-services.vmalert.instances._name_.enable}

Wether to enable VictoriaMetrics's `vmalert`.

`vmalert` evaluates alerting and recording rules against a data source, sends notifications via Alertmanager.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/vmalert.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vmalert.nix)

## `services.vmalert.instances.<name>.rules` {#opt-services.vmalert.instances._name_.rules}

A list of the given alerting or recording rules against configured `"datasource.url"` compatible with
Prometheus HTTP API for `vmalert` to execute. Refer to
[https://github.com/VictoriaMetrics/VictoriaMetrics/blob/master/app/vmalert/README.md#rules](https://github.com/VictoriaMetrics/VictoriaMetrics/blob/master/app/vmalert/README.md#rules)
for details on supported values.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  group = [
    {
      name = "TestGroup";
      rules = [
        {
          alert = "ExampleAlertAlwaysFiring";
          expr = ''
            sum by(job)
            (up == 1)
          '';
        }
      ];
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/monitoring/vmalert.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vmalert.nix)

## `services.vmalert.instances.<name>.settings` {#opt-services.vmalert.instances._name_.settings}

`vmalert` configuration, passed via command line flags. Refer to
[https://github.com/VictoriaMetrics/VictoriaMetrics/blob/master/app/vmalert/README.md#configuration](https://github.com/VictoriaMetrics/VictoriaMetrics/blob/master/app/vmalert/README.md#configuration)
for details on supported values.

*Type:* open submodule of attribute set of (boolean or signed integer or absolute path or string or list of (boolean or signed integer or absolute path or string))

*Default:* `{ }`

*Example:*

``` nix
{
  "datasource.disableKeepAlive" = true;
  "datasource.showURL" = false;
  "datasource.url" = "http://localhost:8428";
  rule = [
    "http://<some-server-addr>/path/to/rules"
    "dir/*.yaml"
  ];
}
```

*Declared by:* [`nixos/modules/services/monitoring/vmalert.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vmalert.nix)

## `services.vmalert.instances.<name>.settings."datasource.url"` {#opt-services.vmalert.instances._name_.settings._datasource.url_}

Datasource compatible with Prometheus HTTP API.

*Type:* non-empty string

*Example:* `"http://localhost:8428"`

*Declared by:* [`nixos/modules/services/monitoring/vmalert.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vmalert.nix)

## `services.vmalert.instances.<name>.settings."notifier.url"` {#opt-services.vmalert.instances._name_.settings._notifier.url_}

Prometheus Alertmanager URL. List all Alertmanager URLs if it runs in the cluster mode to ensure high availability.

*Type:* list of non-empty string

*Default:* `[ ]`

*Example:*

``` nix
[
  "http://127.0.0.1:9093"
]
```

*Declared by:* [`nixos/modules/services/monitoring/vmalert.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vmalert.nix)

## `services.vmalert.instances.<name>.settings.rule` {#opt-services.vmalert.instances._name_.settings.rule}

Path to the files with alerting and/or recording rules.

::: note
Consider using the [`services.vmalert.instances.<name>.rules`](#opt-services.vmalert.instances._name_.rules) option as a convenient alternative for declaring rules
directly in the `nix` language.
:::

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/vmalert.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vmalert.nix)

## `services.vmalert.package` {#opt-services.vmalert.package}

The victoriametrics package to use.

*Type:* package

*Default:* `pkgs.victoriametrics`

*Declared by:* [`nixos/modules/services/monitoring/vmalert.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vmalert.nix)

## `services.vnstat.enable` {#opt-services.vnstat.enable}

Whether to enable update of network usage statistics via vnstatd.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/vnstat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vnstat.nix)

## `services.vnstat.package` {#opt-services.vnstat.package}

The vnstat package to use.

*Type:* package

*Default:* `pkgs.vnstat`

*Declared by:* [`nixos/modules/services/monitoring/vnstat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vnstat.nix)

## `services.vnstat.settings` {#opt-services.vnstat.settings}

Configuration for vnstat. Refer to
\[https://humdi.net/vnstat/man/vnstat.conf.html\]
or `vnstat.conf(5)` for more information.

*Type:* open submodule of attribute set of (atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  AlwaysAddNewInterfaces = 1;
}
```

*Declared by:* [`nixos/modules/services/monitoring/vnstat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/vnstat.nix)

## `services.vouch-proxy.clients` {#opt-services.vouch-proxy.clients}

Set of oauth2 clients. A vouch-proxy systemd unit with the name of the client will be run for every client in this set.
Each of these sets should at least define the `port` attribute that defines the port this client's specific vouch-proxy instance listens on.

If `configureNginx` is set to `true`, the `domain` attribute defining the name of the nginx virtualHost (`services.nginx.virtualHost.<name>`) that this client is running under should also be set.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/vouch-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vouch-proxy.nix)

## `services.vouch-proxy.clients.<name>.domain` {#opt-services.vouch-proxy.clients._name_.domain}

The domain of the nginx.virtualHost this client is running under. This should match the corresponding attribute name in `services.nginx.virtualHost.<name>`.

*Type:* string

*Declared by:* [`nixos/modules/services/security/vouch-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vouch-proxy.nix)

## `services.vouch-proxy.clients.<name>.environmentFile` {#opt-services.vouch-proxy.clients._name_.environmentFile}

Environment file as defined in `systemd.exec(5)`.

The environment variables defined therein are passed to the vouch-proxy instance protecting this client.
You can use environment variables to pass secrets to the service without adding
them to the world-redable nix store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/vouch-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vouch-proxy.nix)

## `services.vouch-proxy.clients.<name>.port` {#opt-services.vouch-proxy.clients._name_.port}

The port the vouch-proxy instance protecting this client is listening on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/services/security/vouch-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vouch-proxy.nix)

## `services.vouch-proxy.clients.<name>.settings` {#opt-services.vouch-proxy.clients._name_.settings}

Free-form settings written to the `config.yml` file used by vouch-proxy.
These settings override the global settings set in `services.vouch-proxy.settings` for this specific client.
A sample config can be found at [https://github.com/vouch/vouch-proxy/blob/master/config/config.yml\_example](https://github.com/vouch/vouch-proxy/blob/master/config/config.yml_example).

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/vouch-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vouch-proxy.nix)

## `services.vouch-proxy.clients.<name>.settings.vouch.domains` {#opt-services.vouch-proxy.clients._name_.settings.vouch.domains}

Explicit list of domains protected by this vouch-proxy instance. Each $domain in this list must serve the url `https://vouch.$domain`.

If left empty, anyone who can authenticate with the configured provider will be accepted.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/vouch-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vouch-proxy.nix)

## `services.vouch-proxy.configureNginx` {#opt-services.vouch-proxy.configureNginx}

Automatic configuration of `services.nginx.virtualHosts.${services.vouch-proxy.clients.<name>.domain}` to use vouch-proxy, for every client defined in `services.vouch-proxy.clients`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/vouch-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vouch-proxy.nix)

## `services.vouch-proxy.enable` {#opt-services.vouch-proxy.enable}

Whether to enable vouch-proxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/vouch-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vouch-proxy.nix)

## `services.vouch-proxy.group` {#opt-services.vouch-proxy.group}

The unix group all vouch-proxy instances run as.

*Type:* string

*Default:* `"vouch-proxy"`

*Declared by:* [`nixos/modules/services/security/vouch-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vouch-proxy.nix)

## `services.vouch-proxy.kanidmDomain` {#opt-services.vouch-proxy.kanidmDomain}

If kanidm is used as an oauth2 provider, this can be set to the domain kanidm manages. From this setting, `settings.oauth.auth_url`, `settings.oauth.token_url` and `settings.oauth.user_info_url` are set accordingly for every client.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/vouch-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vouch-proxy.nix)

## `services.vouch-proxy.package` {#opt-services.vouch-proxy.package}

The vouch-proxy package to use.

*Type:* package

*Default:* `pkgs.vouch-proxy`

*Declared by:* [`nixos/modules/services/security/vouch-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vouch-proxy.nix)

## `services.vouch-proxy.settings` {#opt-services.vouch-proxy.settings}

Free-form settings written to the `config.yml` file used by vouch-proxy.
These settings will be used globally for all clients running behind vouch-proxy.
A sample config can be found at [https://github.com/vouch/vouch-proxy/blob/master/config/config.yml\_example](https://github.com/vouch/vouch-proxy/blob/master/config/config.yml_example).

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/vouch-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vouch-proxy.nix)

## `services.vouch-proxy.settings.oauth.code_challenge_method` {#opt-services.vouch-proxy.settings.oauth.code_challenge_method}

PKCE method if enabled, S256 is currently supported.

*Type:* string

*Default:* `"S256"`

*Declared by:* [`nixos/modules/services/security/vouch-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vouch-proxy.nix)

## `services.vouch-proxy.settings.oauth.provider` {#opt-services.vouch-proxy.settings.oauth.provider}

The oauth2 provider to use.

*Type:* one of "adfs", "google", "github", "indieauth", "oidc"

*Default:* `"oidc"`

*Declared by:* [`nixos/modules/services/security/vouch-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vouch-proxy.nix)

## `services.vouch-proxy.settings.oauth.scopes` {#opt-services.vouch-proxy.settings.oauth.scopes}

List of oauth2 scopes requested by vouch-proxy.

*Type:* list of string

*Default:*

``` nix
[
  "openid"
  "email"
]
```

*Declared by:* [`nixos/modules/services/security/vouch-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vouch-proxy.nix)

## `services.vouch-proxy.settings.vouch.document_root` {#opt-services.vouch-proxy.settings.vouch.document_root}

The location within every client's host where its corresponding vouch-proxy is served.

*Type:* string

*Default:* `"/vouch"`

*Declared by:* [`nixos/modules/services/security/vouch-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vouch-proxy.nix)

## `services.vouch-proxy.settings.vouch.listen` {#opt-services.vouch-proxy.settings.vouch.listen}

The address vouch-proxy listens on.

*Type:* string

*Default:* `"[::1]"`

*Declared by:* [`nixos/modules/services/security/vouch-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vouch-proxy.nix)

## `services.vouch-proxy.user` {#opt-services.vouch-proxy.user}

The unix user all vouch-proxy instances run as.

*Type:* string

*Default:* `"vouch-proxy"`

*Declared by:* [`nixos/modules/services/security/vouch-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vouch-proxy.nix)

## `services.vsftpd.allowWriteableChroot` {#opt-services.vsftpd.allowWriteableChroot}

Allow the use of writeable root inside chroot().

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.anonymousMkdirEnable` {#opt-services.vsftpd.anonymousMkdirEnable}

Whether any uploads are permitted to anonymous users.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.anonymousUmask` {#opt-services.vsftpd.anonymousUmask}

Anonymous write umask.

*Type:* string

*Default:* `"077"`

*Example:* `"002"`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.anonymousUploadEnable` {#opt-services.vsftpd.anonymousUploadEnable}

Whether any uploads are permitted to anonymous users.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.anonymousUser` {#opt-services.vsftpd.anonymousUser}

Whether to enable the anonymous FTP user.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.anonymousUserHome` {#opt-services.vsftpd.anonymousUserHome}

Directory to consider the HOME of the anonymous user.

*Type:* absolute path

*Default:* `"/home/ftp/"`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.anonymousUserNoPassword` {#opt-services.vsftpd.anonymousUserNoPassword}

Whether to disable the password for the anonymous FTP user.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.chrootlocalUser` {#opt-services.vsftpd.chrootlocalUser}

Whether local users are confined to their home directory.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.enable` {#opt-services.vsftpd.enable}

Whether to enable vsftpd.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.enableVirtualUsers` {#opt-services.vsftpd.enableVirtualUsers}

Whether to enable the `pam_userdb`-based
virtual user system

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.extraConfig` {#opt-services.vsftpd.extraConfig}

Extra configuration to add at the bottom of the generated configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"ftpd_banner=Hello"`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.forceLocalDataSSL` {#opt-services.vsftpd.forceLocalDataSSL}

Only applies if `sslEnable` is true. Non anonymous (local) users
must use a secure SSL connection for sending/receiving data on data connection.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.forceLocalLoginsSSL` {#opt-services.vsftpd.forceLocalLoginsSSL}

Only applies if `sslEnable` is true. Non anonymous (local) users
must use a secure SSL connection to send a password.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.localRoot` {#opt-services.vsftpd.localRoot}

This option represents a directory which vsftpd will try to
change into after a local (i.e. non- anonymous) login.

Failure is silently ignored.

*Type:* null or string

*Default:* `null`

*Example:* `"/var/www/$USER"`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.localUsers` {#opt-services.vsftpd.localUsers}

Whether to enable FTP for local users.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.portPromiscuous` {#opt-services.vsftpd.portPromiscuous}

Set to YES if you want to disable the PORT security check that ensures that
outgoing data connections can only connect to the client. Only enable if you
know what you are doing!

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.rsaCertFile` {#opt-services.vsftpd.rsaCertFile}

RSA certificate file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.rsaKeyFile` {#opt-services.vsftpd.rsaKeyFile}

RSA private key file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.ssl_sslv2` {#opt-services.vsftpd.ssl_sslv2}

Only applies if `ssl_enable` is activated. If
enabled, this option will permit SSL v2 protocol connections.
TLS v1 connections are preferred.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.ssl_sslv3` {#opt-services.vsftpd.ssl_sslv3}

Only applies if `ssl_enable` is activated. If
enabled, this option will permit SSL v3 protocol connections.
TLS v1 connections are preferred.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.ssl_tlsv1` {#opt-services.vsftpd.ssl_tlsv1}

Only applies if `ssl_enable` is activated. If
enabled, this option will permit TLS v1 protocol connections.
TLS v1 connections are preferred.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.userDbPath` {#opt-services.vsftpd.userDbPath}

Only applies if `enableVirtualUsers` is true.
Path pointing to the `pam_userdb` user
database used by vsftpd to authenticate the virtual users.

This user list should be stored in the Berkeley DB database
format.

To generate a new user database, create a text file, add
your users using the following format:

```
user1
password1
user2
password2
```

You can then install `pkgs.db` to generate
the Berkeley DB using

```
db_load -T -t hash -f logins.txt userDb.db
```

Caution: `pam_userdb` will automatically
append a `.db` suffix to the filename you
provide though this option. This option shouldn't include
this filetype suffix.

*Type:* null or string

*Default:* `null`

*Example:* `"/etc/vsftpd/userDb"`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.userlist` {#opt-services.vsftpd.userlist}

See `userlistFile`.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.userlistDeny` {#opt-services.vsftpd.userlistDeny}

Specifies whether `userlistFile` is a list of user
names to allow or deny access.
The default `false` means whitelist/allow.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.userlistEnable` {#opt-services.vsftpd.userlistEnable}

Whether users are included.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.userlistFile` {#opt-services.vsftpd.userlistFile}

Newline-separated list of names to be allowed/denied if `userlistEnable`
is `true`. Meaning see `userlistDeny`.

The default is a file containing the users from `userlist`.

If explicitly set to null userlist\_file will not be set in vsftpd's config file.

*Type:* absolute path

*Default:* `pkgs.writeText "userlist" (concatMapStrings (x: "${x}\n") cfg.userlist)`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.virtualUseLocalPrivs` {#opt-services.vsftpd.virtualUseLocalPrivs}

If enabled, virtual users will use the same privileges as local
users. By default, virtual users will use the same privileges as
anonymous users, which tends to be more restrictive (especially
in terms of write access).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsftpd.writeEnable` {#opt-services.vsftpd.writeEnable}

Whether any write activity is permitted to users.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/vsftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vsftpd.nix)

## `services.vsmartcard-vpcd.enable` {#opt-services.vsmartcard-vpcd.enable}

Whether to enable Virtual smart card driver..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/development/vsmartcard-vpcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/vsmartcard-vpcd.nix)

## `services.vsmartcard-vpcd.hostname` {#opt-services.vsmartcard-vpcd.hostname}

Hostname of a waiting vpicc server vpcd will be connecting to. Use /dev/null for listening mode.

*Type:* string

*Default:* `"/dev/null"`

*Declared by:* [`nixos/modules/services/development/vsmartcard-vpcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/vsmartcard-vpcd.nix)

## `services.vsmartcard-vpcd.port` {#opt-services.vsmartcard-vpcd.port}

Port number vpcd will be listening on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `35963`

*Declared by:* [`nixos/modules/services/development/vsmartcard-vpcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/vsmartcard-vpcd.nix)

## `services.vwifi.client.enable` {#opt-services.vwifi.client.enable}

Whether to enable vwifi client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/vwifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vwifi.nix)

## `services.vwifi.client.extraArgs` {#opt-services.vwifi.client.extraArgs}

Extra arguments to pass to vwifi-client. You can use this if you want to bring
the radios up using vwifi-client instead of at boot.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--number"
  "3"
]
```

*Declared by:* [`nixos/modules/services/networking/vwifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vwifi.nix)

## `services.vwifi.client.serverAddress` {#opt-services.vwifi.client.serverAddress}

The address of the server. If set to null, will try to use the vsock protocol.
Note that this assumes that the server is spawned on the host and passed through to
QEMU, with something like:

-device vhost-vsock-pci,id=vwifi0,guest-cid=42

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/vwifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vwifi.nix)

## `services.vwifi.client.serverPort` {#opt-services.vwifi.client.serverPort}

The server port port. Set to null if we should leave it unset.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/vwifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vwifi.nix)

## `services.vwifi.client.spy` {#opt-services.vwifi.client.spy}

Whether to enable spy mode, useful for wireless monitors.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/vwifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vwifi.nix)

## `services.vwifi.module.enable` {#opt-services.vwifi.module.enable}

Whether to enable mac80211\_hwsim module.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/vwifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vwifi.nix)

## `services.vwifi.module.macPrefix` {#opt-services.vwifi.module.macPrefix}

The prefix for MAC addresses to use, without the trailing ':'.
If one radio is created, you can specify the whole MAC address here.
The default is defined in vwifi/src/config.h.

*Type:* string matching the pattern ^((\[0-9A-Fa-f\]{2}:){0,5}\[0-9A-Fa-f\]{2})$

*Default:* `"74:F8:F6"`

*Declared by:* [`nixos/modules/services/networking/vwifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vwifi.nix)

## `services.vwifi.module.numRadios` {#opt-services.vwifi.module.numRadios}

The number of virtual radio interfaces to create.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/networking/vwifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vwifi.nix)

## `services.vwifi.package` {#opt-services.vwifi.package}

The vwifi package to use.

*Type:* package

*Default:* `pkgs.vwifi`

*Declared by:* [`nixos/modules/services/networking/vwifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vwifi.nix)

## `services.vwifi.server.enable` {#opt-services.vwifi.server.enable}

Whether to enable vwifi server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/vwifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vwifi.nix)

## `services.vwifi.server.extraArgs` {#opt-services.vwifi.server.extraArgs}

Extra arguments to pass to vwifi-server. You can use this for things including
changing the ports or inducing packet loss.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--lost-packets"
]
```

*Declared by:* [`nixos/modules/services/networking/vwifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vwifi.nix)

## `services.vwifi.server.openFirewall` {#opt-services.vwifi.server.openFirewall}

Whether to enable opening the firewall for the TCP and spy ports.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/vwifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vwifi.nix)

## `services.vwifi.server.ports.control` {#opt-services.vwifi.server.ports.control}

The control interface port. Set to null if we should leave it unset.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/vwifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vwifi.nix)

## `services.vwifi.server.ports.spy` {#opt-services.vwifi.server.ports.spy}

The spy interface port. Set to null if we should leave it unset.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/vwifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vwifi.nix)

## `services.vwifi.server.ports.tcp` {#opt-services.vwifi.server.ports.tcp}

The TCP server port. Set to null if we should leave it unset.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/vwifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vwifi.nix)

## `services.vwifi.server.ports.vhost` {#opt-services.vwifi.server.ports.vhost}

The vhost port. Set to null if we should leave it unset.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/vwifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vwifi.nix)

## `services.vwifi.server.vsock.enable` {#opt-services.vwifi.server.vsock.enable}

Whether to enable vsock kernel module.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/vwifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/vwifi.nix)
