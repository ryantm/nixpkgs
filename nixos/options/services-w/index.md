# services (W) {#sec-options-services-w}

## `services.waagent.enable` {#opt-services.waagent.enable}

Whether to enable Windows Azure Linux Agent.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/waagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/waagent.nix)

## `services.waagent.extraPackages` {#opt-services.waagent.extraPackages}

Additional packages to add to the waagent `PATH`.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.powershell ]`

*Declared by:* [`nixos/modules/virtualisation/waagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/waagent.nix)

## `services.waagent.package` {#opt-services.waagent.package}

The waagent package to use.

*Type:* package

*Default:* `pkgs.waagent`

*Declared by:* [`nixos/modules/virtualisation/waagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/waagent.nix)

## `services.waagent.settings` {#opt-services.waagent.settings}

The waagent.conf configuration, see [https://learn.microsoft.com/en-us/azure/virtual-machines/extensions/agent-linux](https://learn.microsoft.com/en-us/azure/virtual-machines/extensions/agent-linux) for documentation.

*Type:* open submodule of attribute set of (atom (bool, string, int or float) or null or a list of them or an attribute set of them)

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/waagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/waagent.nix)

## `services.waagent.settings.AutoUpdate.UpdateToLatestVersion` {#opt-services.waagent.settings.AutoUpdate.UpdateToLatestVersion}

Whether or not to enable auto-update of the Extension Handler.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/waagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/waagent.nix)

## `services.waagent.settings.HttpProxy.Host` {#opt-services.waagent.settings.HttpProxy.Host}

If you set http proxy, waagent will use is proxy to access the Internet.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/virtualisation/waagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/waagent.nix)

## `services.waagent.settings.HttpProxy.Port` {#opt-services.waagent.settings.HttpProxy.Port}

If you set http proxy, waagent will use this proxy to access the Internet.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/virtualisation/waagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/waagent.nix)

## `services.waagent.settings.Logs.Verbose` {#opt-services.waagent.settings.Logs.Verbose}

If you set this option, log verbosity is boosted.
Waagent logs to `/var/log/waagent.log` and uses the system logrotate functionality to rotate logs.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/waagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/waagent.nix)

## `services.waagent.settings.OS.EnableRDMA` {#opt-services.waagent.settings.OS.EnableRDMA}

If enabled, the agent attempts to install and then load an RDMA kernel driver
that matches the version of the firmware on the underlying hardware.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/waagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/waagent.nix)

## `services.waagent.settings.OS.RootDeviceScsiTimeout` {#opt-services.waagent.settings.OS.RootDeviceScsiTimeout}

Configures the SCSI timeout in seconds on the OS disk and data drives.
If set to `null`, the system defaults are used.

*Type:* null or signed integer

*Default:* `300`

*Declared by:* [`nixos/modules/virtualisation/waagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/waagent.nix)

## `services.waagent.settings.Provisioning.Agent` {#opt-services.waagent.settings.Provisioning.Agent}

Which provisioning agent to use.

*Type:* one of "auto", "waagent", "cloud-init", "disabled"

*Default:* `"auto"`

*Declared by:* [`nixos/modules/virtualisation/waagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/waagent.nix)

## `services.waagent.settings.Provisioning.Enable` {#opt-services.waagent.settings.Provisioning.Enable}

Whether to enable provisioning functionality in the agent.

If provisioning is disabled, SSH host and user keys in the image are preserved
and configuration in the Azure provisioning API is ignored.

Set to `false` if cloud-init is used for provisioning tasks.

*Type:* boolean

*Default:* `!config.services.cloud-init.enable`

*Declared by:* [`nixos/modules/virtualisation/waagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/waagent.nix)

## `services.waagent.settings.ResourceDisk.EnableSwap` {#opt-services.waagent.settings.ResourceDisk.EnableSwap}

If enabled, the agent creates a swap file (`/swapfile`) on the resource disk
and adds it to the system swap space.

This configuration has no effect if resource disk is managed by cloud-init.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/waagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/waagent.nix)

## `services.waagent.settings.ResourceDisk.FileSystem` {#opt-services.waagent.settings.ResourceDisk.FileSystem}

The file system type for the resource disk.
If the string is `X`, then `mkfs.X` should be present in the environment.
You can add additional filesystem packages using `services.waagent.extraPackages`.

This configuration has no effect if resource disk is managed by cloud-init.

*Type:* string

*Default:* `"ext4"`

*Declared by:* [`nixos/modules/virtualisation/waagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/waagent.nix)

## `services.waagent.settings.ResourceDisk.Format` {#opt-services.waagent.settings.ResourceDisk.Format}

If set to `true`, waagent formats and mounts the resource disk that the platform provides,
unless the file system type in `ResourceDisk.FileSystem` is set to `ntfs`.
The agent makes a single Linux partition (ID 83) available on the disk.
This partition isn't formatted if it can be successfully mounted.

This configuration has no effect if resource disk is managed by cloud-init.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/waagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/waagent.nix)

## `services.waagent.settings.ResourceDisk.MountOptions` {#opt-services.waagent.settings.ResourceDisk.MountOptions}

This option specifies disk mount options to be passed to the `mount -o` command.
For more information, see the `mount(8)` manual page.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "nodev"
  "nosuid"
]
```

*Declared by:* [`nixos/modules/virtualisation/waagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/waagent.nix)

## `services.waagent.settings.ResourceDisk.MountPoint` {#opt-services.waagent.settings.ResourceDisk.MountPoint}

This option specifies the path at which the resource disk is mounted.
The resource disk is a temporary disk and might be emptied when the VM is deprovisioned.

This configuration has no effect if resource disk is managed by cloud-init.

*Type:* string

*Default:* `"/mnt/resource"`

*Declared by:* [`nixos/modules/virtualisation/waagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/waagent.nix)

## `services.waagent.settings.ResourceDisk.SwapSizeMB` {#opt-services.waagent.settings.ResourceDisk.SwapSizeMB}

Specifies the size of the swap file in MiB (1024×1024 bytes).

This configuration has no effect if resource disk is managed by cloud-init.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/virtualisation/waagent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/waagent.nix)

## `services.wakapi.database.createLocally` {#opt-services.wakapi.database.createLocally}

Whether to enable automatic database configuration.

::: note
Only PostgreSQL is supported for the time being.
:::

.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/wakapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wakapi.nix)

## `services.wakapi.database.dialect` {#opt-services.wakapi.database.dialect}

The database type to use for Wakapi.

*Type:* null or one of "postgres", "sqlite3", "mysql", "cockroach", "mssql"

*Default:*

``` nix
''
  Database dialect from settings if {option}`services.wakatime.settings.db.dialect`
  is set, or `null` otherwise.
''
```

*Declared by:* [`nixos/modules/services/web-apps/wakapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wakapi.nix)

## `services.wakapi.database.name` {#opt-services.wakapi.database.name}

The name of the database to use for Wakapi.

*Type:* string

*Default:*

``` nix
''
  Database name from settings if {option}`services.wakatime.settings.db.name`
  is set, or "wakapi" otherwise.
''
```

*Declared by:* [`nixos/modules/services/web-apps/wakapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wakapi.nix)

## `services.wakapi.database.user` {#opt-services.wakapi.database.user}

The name of the user to use for Wakapi.

*Type:* string

*Default:*

``` nix
''
  User from settings if {option}`services.wakatime.settings.db.user`
  is set, or "wakapi" otherwise.
''
```

*Declared by:* [`nixos/modules/services/web-apps/wakapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wakapi.nix)

## `services.wakapi.enable` {#opt-services.wakapi.enable}

Whether to enable Wakapi.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/wakapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wakapi.nix)

## `services.wakapi.environmentFiles` {#opt-services.wakapi.environmentFiles}

Use this to set `WAKAPI_PASSWORD_SALT` and `WAKAPI_MAIL_SMTP_PASS`.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/wakapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wakapi.nix)

## `services.wakapi.package` {#opt-services.wakapi.package}

The wakapi package to use.

*Type:* package

*Default:* `pkgs.wakapi`

*Declared by:* [`nixos/modules/services/web-apps/wakapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wakapi.nix)

## `services.wakapi.settings` {#opt-services.wakapi.settings}

Settings for Wakapi.

See [config.default.yml](https://github.com/muety/wakapi/blob/master/config.default.yml) for a list of all possible options.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/wakapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wakapi.nix)

## `services.wakapi.stateDir` {#opt-services.wakapi.stateDir}

The state directory where data is stored. Will also be used as the
working directory for the wakapi service.

*Type:* absolute path

*Default:* `"/var/lib/wakapi"`

*Declared by:* [`nixos/modules/services/web-apps/wakapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wakapi.nix)

## `services.wanderer.about` {#opt-services.wanderer.about}

Markdown shown in the "About" section to visitors who are not logged in.
Note that changing this rebuilds the web frontend!

*Type:* null or absolute path or string

*Default:* `null`

*Example:* `./about.md`

*Declared by:* [`nixos/modules/services/web-apps/wanderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wanderer.nix)

## `services.wanderer.enable` {#opt-services.wanderer.enable}

Whether to enable wanderer, a self-hosted trail database.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/wanderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wanderer.nix)

## `services.wanderer.host` {#opt-services.wanderer.host}

Address on which the wanderer web frontend listens.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/web-apps/wanderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wanderer.nix)

## `services.wanderer.meilisearch.enable` {#opt-services.wanderer.meilisearch.enable}

Whether to enable a local meilisearch instance through `services.meilisearch`.
If disabled, point [`services.wanderer.settings.MEILI_URL`](#opt-services.wanderer.settings.MEILI_URL) at an existing instance.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/wanderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wanderer.nix)

## `services.wanderer.openFirewall` {#opt-services.wanderer.openFirewall}

Whether to open [`services.wanderer.port`](#opt-services.wanderer.port) in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/wanderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wanderer.nix)

## `services.wanderer.package` {#opt-services.wanderer.package}

The wanderer package to use.

*Type:* package

*Default:* `pkgs.wanderer`

*Declared by:* [`nixos/modules/services/web-apps/wanderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wanderer.nix)

## `services.wanderer.plugins` {#opt-services.wanderer.plugins}

Plugins to install.
The first-party plugins are available in `pkgs.wanderer.plugins`.

*Type:* list of package

*Default:* `[ ]`

*Example:* `with pkgs.wanderer.plugins; [ komoot strava ]`

*Declared by:* [`nixos/modules/services/web-apps/wanderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wanderer.nix)

## `services.wanderer.pocketbase.host` {#opt-services.wanderer.pocketbase.host}

Address on which the wanderer PocketBase backend listens.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/wanderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wanderer.nix)

## `services.wanderer.pocketbase.port` {#opt-services.wanderer.pocketbase.port}

Port on which the wanderer PocketBase backend listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8090`

*Declared by:* [`nixos/modules/services/web-apps/wanderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wanderer.nix)

## `services.wanderer.port` {#opt-services.wanderer.port}

Port on which the wanderer web frontend listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/web-apps/wanderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wanderer.nix)

## `services.wanderer.secrets` {#opt-services.wanderer.secrets}

Files containing secrets, passed to the backend as environment variables named after the attribute.
`POCKETBASE_PROXY_SECRET` is passed to the frontend as well.
The files are loaded with systemd's `LoadCredential` and need not be readable by the service user.

*Type:* open submodule of attribute set of (null or absolute path)

*Default:* `{ }`

*Example:*

``` nix
{
  POCKETBASE_ENCRYPTION_KEY = "/run/secrets/wanderer-encryption-key";
  POCKETBASE_PROXY_SECRET = "/run/secrets/wanderer-proxy-secret";
  POCKETBASE_SMTP_PASSWORD = "/run/secrets/wanderer-smtp-password";
}
```

*Declared by:* [`nixos/modules/services/web-apps/wanderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wanderer.nix)

## `services.wanderer.secrets.MEILI_MASTER_KEY` {#opt-services.wanderer.secrets.MEILI_MASTER_KEY}

File containing the meilisearch master key.

*Type:* null or absolute path

*Default:* `if config.services.wanderer.meilisearch.enable then config.services.meilisearch.masterKeyFile else null`

*Declared by:* [`nixos/modules/services/web-apps/wanderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wanderer.nix)

## `services.wanderer.secrets.POCKETBASE_ENCRYPTION_KEY` {#opt-services.wanderer.secrets.POCKETBASE_ENCRYPTION_KEY}

File containing the key used to encrypt secrets in the database.
Must be exactly 32 characters long, for example generated with `openssl rand -hex 16`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/wanderer-encryption-key"`

*Declared by:* [`nixos/modules/services/web-apps/wanderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wanderer.nix)

## `services.wanderer.secrets.POCKETBASE_PROXY_SECRET` {#opt-services.wanderer.secrets.POCKETBASE_PROXY_SECRET}

File containing the secret authenticating the frontend to the backend, for example generated with `openssl rand -hex 32`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/wanderer-proxy-secret"`

*Declared by:* [`nixos/modules/services/web-apps/wanderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wanderer.nix)

## `services.wanderer.settings` {#opt-services.wanderer.settings}

Environment variables passed to the wanderer backend and frontend.
See [the wanderer documentation](https://wanderer.to/run/environment-configuration/) for available options.
Secrets must be set using [`services.wanderer.secrets`](#opt-services.wanderer.secrets) instead.

*Type:* open submodule of attribute set of (null or boolean or signed integer or string)

*Default:* `{ }`

*Example:*

``` nix
{
  ORIGIN = "https://wanderer.example.com";
  POCKETBASE_SMTP_ENABLED = true;
  POCKETBASE_SMTP_SENDER_NAME = "wanderer";
  PUBLIC_DISABLE_SIGNUP = true;
}
```

*Declared by:* [`nixos/modules/services/web-apps/wanderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wanderer.nix)

## `services.wanderer.settings.BODY_SIZE_LIMIT` {#opt-services.wanderer.settings.BODY_SIZE_LIMIT}

Maximum allowed request body size, and therefore upload size, in bytes.
The suffixes `K`, `M` and `G` are accepted, `Infinity` disables the limit.

*Type:* string

*Default:* `"Infinity"`

*Example:* `"512M"`

*Declared by:* [`nixos/modules/services/web-apps/wanderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wanderer.nix)

## `services.wanderer.settings.MEILI_URL` {#opt-services.wanderer.settings.MEILI_URL}

URL of the meilisearch instance, including scheme and port.

*Type:* string

*Default:* `"http://${config.services.meilisearch.listenAddress}:${toString config.services.meilisearch.listenPort}"`

*Declared by:* [`nixos/modules/services/web-apps/wanderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wanderer.nix)

## `services.wanderer.settings.ORIGIN` {#opt-services.wanderer.settings.ORIGIN}

Scheme and address via which the wanderer frontend is reachable.
This must match what users enter into their browser's address bar *exactly*,
otherwise wanderer shows a warning about mismatched hosts on every page.
This also applies when running behind a reverse proxy.

*Type:* string

*Example:* `"https://wanderer.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/wanderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wanderer.nix)

## `services.wanderer.settings.PUBLIC_DISABLE_SIGNUP` {#opt-services.wanderer.settings.PUBLIC_DISABLE_SIGNUP}

Whether to disable signups of new users.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/wanderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wanderer.nix)

## `services.wanderer.settings.PUBLIC_POCKETBASE_URL` {#opt-services.wanderer.settings.PUBLIC_POCKETBASE_URL}

URL under which the frontend reaches the PocketBase backend.

*Type:* string

*Default:* `"http://${config.services.wanderer.pocketbase.host}:${toString config.services.wanderer.pocketbase.port}"`

*Declared by:* [`nixos/modules/services/web-apps/wanderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wanderer.nix)

## `services.wanderer.settings.PUBLIC_PRIVATE_INSTANCE` {#opt-services.wanderer.settings.PUBLIC_PRIVATE_INSTANCE}

Whether to block visitors without an account from viewing any content.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/wanderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wanderer.nix)

## `services.warpgate.databaseEncryptionKeysFile` {#opt-services.warpgate.databaseEncryptionKeysFile}

Path to file containing encryption key(s) to encrypt target credentials stored in database.
Should be a env-like file: `WARPGATE_ENCRYPTION_KEY=$(openssl rand -base64 32)`.
If you are rotating key, move the old key to `WARPGATE_ENCRYPTION_KEY_OLD`.
See [Encrypting credentials at rest](https://warpgate.null.page/encryption/).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.databaseUrlFile` {#opt-services.warpgate.databaseUrlFile}

Path to file containing database connection string with credentials.
Should be a one line file with: `database_url: <protocol>://<username>:<password>@<host>/<database>`.
See [SeaORM documentation](https://www.sea-ql.org/SeaORM/docs/install-and-config/connection/).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.enable` {#opt-services.warpgate.enable}

Whether to enable Warpgate.
This module will initialize Warpgate base on your config automatically. Please run `warpgate recover-access` to gain access.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.package` {#opt-services.warpgate.package}

The warpgate package to use.

*Type:* package

*Default:* `pkgs.warpgate`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings` {#opt-services.warpgate.settings}

Warpgate configuration.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Example:*

``` nix
{
  http = {
    listen = "[::]:8011";
  };
  ssh = {
    enable = true;
    listen = "[::]:2211";
  };
}
```

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.database_url` {#opt-services.warpgate.settings.database_url}

Database connection string.
See [SeaORM documentation](https://www.sea-ql.org/SeaORM/docs/install-and-config/connection/).

*Type:* null or string

*Default:* `"sqlite:/var/lib/warpgate/db"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.external_host` {#opt-services.warpgate.settings.external_host}

Configure the domain name of this Warpgate instance.
See [HTTP domain binding](https://warpgate.null.page/http-domain-binding/).
This option is considered legacy, please use protocol specific `external_host` instead.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.http.certificate` {#opt-services.warpgate.settings.http.certificate}

Path to HTTPS listener certificate.

*Type:* string

*Default:* `"/var/lib/warpgate/tls.certificate.pem"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.http.cookie_max_age` {#opt-services.warpgate.settings.http.cookie_max_age}

How long until logged in cookie expires.

*Type:* string

*Default:* `"1day"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.http.external_host` {#opt-services.warpgate.settings.http.external_host}

The HTTP listener is reachable via this domain name externally.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.http.external_port` {#opt-services.warpgate.settings.http.external_port}

The HTTP listener is reachable via this port externally.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.http.key` {#opt-services.warpgate.settings.http.key}

Path to HTTPS listener private key.

*Type:* string

*Default:* `"/var/lib/warpgate/tls.key.pem"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.http.listen` {#opt-services.warpgate.settings.http.listen}

Listen endpoint of HTTP listener.

*Type:* string

*Default:* `"[::]:8888"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.http.proxy_protocol` {#opt-services.warpgate.settings.http.proxy_protocol}

Accept HAProxy PROXY protocol v1/v2 headers from upstream reverse proxy.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.http.session_max_age` {#opt-services.warpgate.settings.http.session_max_age}

How long until a logged in session expires.

*Type:* string

*Default:* `"30m"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.http.sni_certificates` {#opt-services.warpgate.settings.http.sni_certificates}

Certificates for additional domains.

*Type:* list of (open submodule of (YAML 1.1 value))

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    certificate = "/var/lib/warpgate/example.tld.pem";
    key = "/var/lib/warpgate/example.tld.key.pem";
  }
  {
    ...
  }
]
```

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.http.sni_certificates.*.certificate` {#opt-services.warpgate.settings.http.sni_certificates._.certificate}

Path to certificate.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.http.sni_certificates.*.key` {#opt-services.warpgate.settings.http.sni_certificates._.key}

Path to private key.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.http.trust_x_forwarded_headers` {#opt-services.warpgate.settings.http.trust_x_forwarded_headers}

Trust X-Forwarded-\* headers. Required when being reverse proxied.
See [Running behind a reverse proxy](https://warpgate.null.page/reverse-proxy/).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.kubernetes.certificate` {#opt-services.warpgate.settings.kubernetes.certificate}

Path to Kubernetes listener certificate.

*Type:* string

*Default:* `"/var/lib/warpgate/tls.certificate.pem"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.kubernetes.enable` {#opt-services.warpgate.settings.kubernetes.enable}

Whether to enable Kubernetes listener.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.kubernetes.external_host` {#opt-services.warpgate.settings.kubernetes.external_host}

The Kubernetes listener is reachable via this domain name externally.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.kubernetes.external_port` {#opt-services.warpgate.settings.kubernetes.external_port}

The Kubernetes listener is reachable via this port externally.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.kubernetes.key` {#opt-services.warpgate.settings.kubernetes.key}

Path to Kubernetes listener private key.

*Type:* string

*Default:* `"/var/lib/warpgate/tls.key.pem"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.kubernetes.listen` {#opt-services.warpgate.settings.kubernetes.listen}

Listen endpoint of Kubernetes listener.

*Type:* string

*Default:* `"[::]:8443"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.kubernetes.proxy_protocol` {#opt-services.warpgate.settings.kubernetes.proxy_protocol}

Accept HAProxy PROXY protocol v1/v2 headers from upstream reverse proxy.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.kubernetes.session_max_age` {#opt-services.warpgate.settings.kubernetes.session_max_age}

How long until a logged in session expires.

*Type:* string

*Default:* `"30m"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.log.audit_retention` {#opt-services.warpgate.settings.log.audit_retention}

How long Warpgate keeps its audit logs.

*Type:* string

*Default:* `"1year"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.log.format` {#opt-services.warpgate.settings.log.format}

The format Warpgate emits logs in.

*Type:* one of "text", "json"

*Default:* `"text"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.log.retention` {#opt-services.warpgate.settings.log.retention}

How long Warpgate keeps its non-audit logs and session recordings.

*Type:* string

*Default:* `"7days"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.log.send_to` {#opt-services.warpgate.settings.log.send_to}

Path of UNIX socket of log forwarder.
See [Log forwarding](https://warpgate.null.page/log-forwarding/);

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.mysql.advertised_version` {#opt-services.warpgate.settings.mysql.advertised_version}

The server version advertised to clients during the handshake.
Warpgate can't auto-match the target's version since the target is only known after the handshake, but Warpgate's clients use it to pick a protocol dialect.

*Type:* string

*Default:* `"8.0.3-Warpgate"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.mysql.certificate` {#opt-services.warpgate.settings.mysql.certificate}

Path to MySQL listener certificate.

*Type:* string

*Default:* `"/var/lib/warpgate/tls.certificate.pem"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.mysql.enable` {#opt-services.warpgate.settings.mysql.enable}

Whether to enable MySQL listener.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.mysql.external_host` {#opt-services.warpgate.settings.mysql.external_host}

The MySQL listener is reachable via this domain name externally.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.mysql.external_port` {#opt-services.warpgate.settings.mysql.external_port}

The MySQL listener is reachable via this port externally.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.mysql.key` {#opt-services.warpgate.settings.mysql.key}

Path to MySQL listener private key.

*Type:* string

*Default:* `"/var/lib/warpgate/tls.key.pem"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.mysql.listen` {#opt-services.warpgate.settings.mysql.listen}

Listen endpoint of MySQL listener.

*Type:* string

*Default:* `"[::]:33306"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.mysql.proxy_protocol` {#opt-services.warpgate.settings.mysql.proxy_protocol}

Accept HAProxy PROXY protocol v1/v2 headers from upstream reverse proxy.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.postgres.certificate` {#opt-services.warpgate.settings.postgres.certificate}

Path to PostgreSQL listener certificate.

*Type:* string

*Default:* `"/var/lib/warpgate/tls.certificate.pem"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.postgres.enable` {#opt-services.warpgate.settings.postgres.enable}

Whether to enable PostgreSQL listener.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.postgres.external_host` {#opt-services.warpgate.settings.postgres.external_host}

The PostgreSQL listener is reachable via this domain name externally.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.postgres.external_port` {#opt-services.warpgate.settings.postgres.external_port}

The PostgreSQL listener is reachable via this port externally.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.postgres.key` {#opt-services.warpgate.settings.postgres.key}

Path to PostgreSQL listener private key.

*Type:* string

*Default:* `"/var/lib/warpgate/tls.key.pem"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.postgres.listen` {#opt-services.warpgate.settings.postgres.listen}

Listen endpoint of PostgreSQL listener.

*Type:* string

*Default:* `"[::]:55432"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.postgres.proxy_protocol` {#opt-services.warpgate.settings.postgres.proxy_protocol}

Accept HAProxy PROXY protocol v1/v2 headers from upstream reverse proxy.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.rdp.certificate` {#opt-services.warpgate.settings.rdp.certificate}

Path to RDP listener certificate.

*Type:* string

*Default:* `"/var/lib/warpgate/tls.certificate.pem"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.rdp.enable` {#opt-services.warpgate.settings.rdp.enable}

Whether to enable RDP listener.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.rdp.external_host` {#opt-services.warpgate.settings.rdp.external_host}

The RDP listener is reachable via this domain name externally.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.rdp.external_port` {#opt-services.warpgate.settings.rdp.external_port}

The RDP listener is reachable via this port externally.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.rdp.key` {#opt-services.warpgate.settings.rdp.key}

Path to RDP listener private key.

*Type:* string

*Default:* `"/var/lib/warpgate/tls.key.pem"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.rdp.listen` {#opt-services.warpgate.settings.rdp.listen}

Listen endpoint of RDP listener.

*Type:* string

*Default:* `"[::]:3389"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.rdp.proxy_protocol` {#opt-services.warpgate.settings.rdp.proxy_protocol}

Accept HAProxy PROXY protocol v1/v2 headers from the listener's peer.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.ssh.enable` {#opt-services.warpgate.settings.ssh.enable}

Whether to enable SSH listener.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.ssh.external_host` {#opt-services.warpgate.settings.ssh.external_host}

The SSH listener is reachable via this domain name externally.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.ssh.external_port` {#opt-services.warpgate.settings.ssh.external_port}

The SSH listener is reachable via this port externally.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.ssh.host_key_verification` {#opt-services.warpgate.settings.ssh.host_key_verification}

Specify host key verification action when connecting to a SSH target with unknown/differing host key.

*Type:* one of "prompt", "auto\_accept", "auto\_reject"

*Default:* `"prompt"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.ssh.inactivity_timeout` {#opt-services.warpgate.settings.ssh.inactivity_timeout}

How long can user be inactive until Warpgate terminates the connection.

*Type:* string

*Default:* `"5m"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.ssh.keepalive_interval` {#opt-services.warpgate.settings.ssh.keepalive_interval}

If nothing is received from the client for this amount of time, server will send a keepalive message.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.ssh.keys` {#opt-services.warpgate.settings.ssh.keys}

Path to store SSH host & client keys.

*Type:* string

*Default:* `"/var/lib/warpgate/ssh-keys"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.ssh.listen` {#opt-services.warpgate.settings.ssh.listen}

Listen endpoint of SSH listener.

*Type:* string

*Default:* `"[::]:2222"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.ssh.proxy_protocol` {#opt-services.warpgate.settings.ssh.proxy_protocol}

Accept HAProxy PROXY protocol v1/v2 headers from upstream reverse proxy.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.sso_providers` {#opt-services.warpgate.settings.sso_providers}

Configure OIDC single sign-on providers.
Main documentation can be found [here](https://warpgate.null.page/sso).

*Type:* list of (open submodule of (YAML 1.1 value))

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    name = "3rd party SSO";
    label = "ACME SSO";
    provider = {
      type = "custom";
      client_id = "123...";
      client_secret = "BC...";
      issuer_url = "https://sso.acme.inc";
      scopes = ["email"];
    };
  }
  {
    ...
  }
]
```

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.sso_providers.*.auto_create_users` {#opt-services.warpgate.settings.sso_providers._.auto_create_users}

Whether to create user automatically at first SSO login.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.sso_providers.*.label` {#opt-services.warpgate.settings.sso_providers._.label}

SSO provider name displayed on login page.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.sso_providers.*.name` {#opt-services.warpgate.settings.sso_providers._.name}

Internal identifier of SSO provider.

*Type:* string

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.sso_providers.*.provider` {#opt-services.warpgate.settings.sso_providers._.provider}

SSO provider configurations.
See [here](https://github.com/warp-tech/warpgate/blob/ffc755f0137944bd39cf4cbce90f4279da500943/config-schema.json#L430) for all acceptable options.

*Type:* attribute set of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.sso_providers.*.return_domain_whitelist` {#opt-services.warpgate.settings.sso_providers._.return_domain_whitelist}

Controls the SSO return URL supplied to SSO provider.
This will also required you to connect to this instance via whitelisted domain when doing SSO login.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.sso_providers.*.return_url_prefix` {#opt-services.warpgate.settings.sso_providers._.return_url_prefix}

Controls the SSO return URL supplied to SSO provider.
Useful for providers that do not allow the @ sign in the URL (e.g. Azure).

*Type:* one of "@", "\_"

*Default:* `"@"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.vnc.certificate` {#opt-services.warpgate.settings.vnc.certificate}

Path to VNC listener certificate.

*Type:* string

*Default:* `"/var/lib/warpgate/tls.certificate.pem"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.vnc.enable` {#opt-services.warpgate.settings.vnc.enable}

Whether to enable VNC listener.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.vnc.enable_ard_auth` {#opt-services.warpgate.settings.vnc.enable_ard_auth}

Enable Apple-DH (Apple Remote Desktop / type 30) auth, which is to ensure compatibility with Apple clients.
However [connections from macOS built-in VNC client with ARD auth is not supported](https://github.com/warp-tech/warpgate/blob/47e676969a0b1e0b8456f9a5f1474d6c58648c4f/warpgate-protocol-vnc/src/server/rfb.rs#L8-L10).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.vnc.external_host` {#opt-services.warpgate.settings.vnc.external_host}

The VNC listener is reachable via this domain name externally.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.vnc.external_port` {#opt-services.warpgate.settings.vnc.external_port}

The VNC listener is reachable via this port externally.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.vnc.key` {#opt-services.warpgate.settings.vnc.key}

Path to VNC listener private key.

*Type:* string

*Default:* `"/var/lib/warpgate/tls.key.pem"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.vnc.listen` {#opt-services.warpgate.settings.vnc.listen}

Listen endpoint of VNC listener.

*Type:* string

*Default:* `"[::]:5900"`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.warpgate.settings.vnc.proxy_protocol` {#opt-services.warpgate.settings.vnc.proxy_protocol}

Accept HAProxy PROXY protocol v1/v2 headers from the listener's peer.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/warpgate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/warpgate.nix)

## `services.wastebin.enable` {#opt-services.wastebin.enable}

Whether to enable Wastebin, a pastebin service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/wastebin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/wastebin.nix)

## `services.wastebin.package` {#opt-services.wastebin.package}

The wastebin package to use.

*Type:* package

*Default:* `pkgs.wastebin`

*Declared by:* [`nixos/modules/services/misc/wastebin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/wastebin.nix)

## `services.wastebin.secretFile` {#opt-services.wastebin.secretFile}

Path to file containing sensitive environment variables.
Some variables that can be considered secrets are:

- WASTEBIN\_PASSWORD\_SALT:
  salt used to hash user passwords used for encrypting pastes.

- WASTEBIN\_SIGNING\_KEY:
  sets the key to sign cookies. If not set, a random key will be
  generated which means cookies will become invalid after restarts and
  paste creators will not be able to delete their pastes anymore.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/wastebin.env"`

*Declared by:* [`nixos/modules/services/misc/wastebin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/wastebin.nix)

## `services.wastebin.settings` {#opt-services.wastebin.settings}

Additional configuration for wastebin, see
[https://github.com/matze/wastebin#usage](https://github.com/matze/wastebin#usage) for supported values.
For secrets use secretFile option instead.

*Type:* open submodule of attribute set of (boolean or signed integer or string)

*Default:* `{ }`

*Example:*

``` nix
{
  WASTEBIN_TITLE = "My awesome pastebin";
}
```

*Declared by:* [`nixos/modules/services/misc/wastebin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/wastebin.nix)

## `services.wastebin.settings.RUST_LOG` {#opt-services.wastebin.settings.RUST_LOG}

Influences logging. Besides the typical trace, debug, info etc.
keys, you can also set the tower\_http key to some log level to get
additional information request and response logs.

*Type:* string

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/misc/wastebin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/wastebin.nix)

## `services.wastebin.settings.WASTEBIN_ADDRESS_PORT` {#opt-services.wastebin.settings.WASTEBIN_ADDRESS_PORT}

Address and port to bind to

*Type:* string

*Default:* `"0.0.0.0:8088"`

*Declared by:* [`nixos/modules/services/misc/wastebin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/wastebin.nix)

## `services.wastebin.settings.WASTEBIN_BASE_URL` {#opt-services.wastebin.settings.WASTEBIN_BASE_URL}

Base URL for the QR code display. If not set, the user agent's Host
header field is used as an approximation.

*Type:* string

*Default:* `"http://localhost"`

*Example:* `"https://myhost.tld"`

*Declared by:* [`nixos/modules/services/misc/wastebin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/wastebin.nix)

## `services.wastebin.settings.WASTEBIN_CACHE_SIZE` {#opt-services.wastebin.settings.WASTEBIN_CACHE_SIZE}

Number of rendered syntax highlight items to cache. Can be disabled by setting to 0.

*Type:* signed integer

*Default:* `128`

*Declared by:* [`nixos/modules/services/misc/wastebin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/wastebin.nix)

## `services.wastebin.settings.WASTEBIN_DATABASE_PATH` {#opt-services.wastebin.settings.WASTEBIN_DATABASE_PATH}

Path to the sqlite3 database file. If not set, an in-memory database is used.

*Type:* string

*Default:* `"/var/lib/wastebin/sqlite3.db"`

*Declared by:* [`nixos/modules/services/misc/wastebin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/wastebin.nix)

## `services.wastebin.settings.WASTEBIN_HTTP_TIMEOUT` {#opt-services.wastebin.settings.WASTEBIN_HTTP_TIMEOUT}

Maximum number of seconds a request can be processed until wastebin responds with 408

*Type:* signed integer

*Default:* `5`

*Declared by:* [`nixos/modules/services/misc/wastebin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/wastebin.nix)

## `services.wastebin.settings.WASTEBIN_MAX_BODY_SIZE` {#opt-services.wastebin.settings.WASTEBIN_MAX_BODY_SIZE}

Number of bytes to accept for POST requests

*Type:* signed integer

*Default:* `1048576`

*Declared by:* [`nixos/modules/services/misc/wastebin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/wastebin.nix)

## `services.wastebin.settings.WASTEBIN_TITLE` {#opt-services.wastebin.settings.WASTEBIN_TITLE}

Overrides the HTML page title

*Type:* string

*Default:* `"wastebin"`

*Declared by:* [`nixos/modules/services/misc/wastebin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/wastebin.nix)

## `services.wastebin.stateDir` {#opt-services.wastebin.stateDir}

State directory of the daemon.

*Type:* absolute path

*Default:* `"/var/lib/wastebin"`

*Declared by:* [`nixos/modules/services/misc/wastebin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/wastebin.nix)

## `services.watchdogd.enable` {#opt-services.watchdogd.enable}

Whether to enable watchdogd, an advanced system & process supervisor.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/watchdogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/watchdogd.nix)

## `services.watchdogd.package` {#opt-services.watchdogd.package}

The watchdogd package to use.

*Type:* package

*Default:* `pkgs.watchdogd`

*Declared by:* [`nixos/modules/services/monitoring/watchdogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/watchdogd.nix)

## `services.watchdogd.settings` {#opt-services.watchdogd.settings}

Configuration to put in `watchdogd.conf`.
See `watchdogd.conf(5)` for more details.

*Type:* open submodule of attribute set of (boolean or signed integer or floating point number or string or attribute set of (boolean or signed integer or floating point number or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/watchdogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/watchdogd.nix)

## `services.watchdogd.settings.filenr.critical` {#opt-services.watchdogd.settings.filenr.critical}

The critical watermark level. Alert sent to log, followed by reboot or script action.

*Type:* nonnegative integer or floating point number, meaning \>=0

*Default:* `1.0`

*Declared by:* [`nixos/modules/services/monitoring/watchdogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/watchdogd.nix)

## `services.watchdogd.settings.filenr.enabled` {#opt-services.watchdogd.settings.filenr.enabled}

Whether to enable watchdogd plugin filenr.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/watchdogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/watchdogd.nix)

## `services.watchdogd.settings.filenr.interval` {#opt-services.watchdogd.settings.filenr.interval}

Amount of seconds between every poll.

*Type:* unsigned integer, meaning \>=0

*Default:* `300`

*Declared by:* [`nixos/modules/services/monitoring/watchdogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/watchdogd.nix)

## `services.watchdogd.settings.filenr.logmark` {#opt-services.watchdogd.settings.filenr.logmark}

Whether to log current stats every poll interval.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/watchdogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/watchdogd.nix)

## `services.watchdogd.settings.filenr.warning` {#opt-services.watchdogd.settings.filenr.warning}

The high watermark level. Alert sent to log.

*Type:* nonnegative integer or floating point number, meaning \>=0

*Default:* `0.9`

*Declared by:* [`nixos/modules/services/monitoring/watchdogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/watchdogd.nix)

## `services.watchdogd.settings.interval` {#opt-services.watchdogd.settings.interval}

The kick interval, i.e. how often `watchdogd(8)` should reset the WDT timer.

*Type:* unsigned integer, meaning \>=0

*Default:* `5`

*Declared by:* [`nixos/modules/services/monitoring/watchdogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/watchdogd.nix)

## `services.watchdogd.settings.loadavg.critical` {#opt-services.watchdogd.settings.loadavg.critical}

The critical watermark level. Alert sent to log, followed by reboot or script action.

*Type:* nonnegative integer or floating point number, meaning \>=0

*Default:* `2.0`

*Declared by:* [`nixos/modules/services/monitoring/watchdogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/watchdogd.nix)

## `services.watchdogd.settings.loadavg.enabled` {#opt-services.watchdogd.settings.loadavg.enabled}

Whether to enable watchdogd plugin loadavg.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/watchdogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/watchdogd.nix)

## `services.watchdogd.settings.loadavg.interval` {#opt-services.watchdogd.settings.loadavg.interval}

Amount of seconds between every poll.

*Type:* unsigned integer, meaning \>=0

*Default:* `300`

*Declared by:* [`nixos/modules/services/monitoring/watchdogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/watchdogd.nix)

## `services.watchdogd.settings.loadavg.logmark` {#opt-services.watchdogd.settings.loadavg.logmark}

Whether to log current stats every poll interval.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/watchdogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/watchdogd.nix)

## `services.watchdogd.settings.loadavg.warning` {#opt-services.watchdogd.settings.loadavg.warning}

The high watermark level. Alert sent to log.

*Type:* nonnegative integer or floating point number, meaning \>=0

*Default:* `1.0`

*Declared by:* [`nixos/modules/services/monitoring/watchdogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/watchdogd.nix)

## `services.watchdogd.settings.meminfo.critical` {#opt-services.watchdogd.settings.meminfo.critical}

The critical watermark level. Alert sent to log, followed by reboot or script action.

*Type:* nonnegative integer or floating point number, meaning \>=0

*Default:* `0.95`

*Declared by:* [`nixos/modules/services/monitoring/watchdogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/watchdogd.nix)

## `services.watchdogd.settings.meminfo.enabled` {#opt-services.watchdogd.settings.meminfo.enabled}

Whether to enable watchdogd plugin meminfo.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/watchdogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/watchdogd.nix)

## `services.watchdogd.settings.meminfo.interval` {#opt-services.watchdogd.settings.meminfo.interval}

Amount of seconds between every poll.

*Type:* unsigned integer, meaning \>=0

*Default:* `300`

*Declared by:* [`nixos/modules/services/monitoring/watchdogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/watchdogd.nix)

## `services.watchdogd.settings.meminfo.logmark` {#opt-services.watchdogd.settings.meminfo.logmark}

Whether to log current stats every poll interval.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/watchdogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/watchdogd.nix)

## `services.watchdogd.settings.meminfo.warning` {#opt-services.watchdogd.settings.meminfo.warning}

The high watermark level. Alert sent to log.

*Type:* nonnegative integer or floating point number, meaning \>=0

*Default:* `0.9`

*Declared by:* [`nixos/modules/services/monitoring/watchdogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/watchdogd.nix)

## `services.watchdogd.settings.safe-exit` {#opt-services.watchdogd.settings.safe-exit}

With `safeExit` enabled, the daemon will ask the driver to disable the WDT before exiting.
However, some WDT drivers (or hardware) may not support this.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/watchdogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/watchdogd.nix)

## `services.watchdogd.settings.timeout` {#opt-services.watchdogd.settings.timeout}

The WDT timeout before reset.

*Type:* unsigned integer, meaning \>=0

*Default:* `15`

*Declared by:* [`nixos/modules/services/monitoring/watchdogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/watchdogd.nix)

## `services.watt.enable` {#opt-services.watt.enable}

Whether to enable automatic CPU speed & power optimizer for Linux.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/watt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/watt.nix)

## `services.watt.extraFlags` {#opt-services.watt.extraFlags}

Extra flags passed to the Watt command in the service definition.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-q"
]
```

*Declared by:* [`nixos/modules/services/hardware/watt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/watt.nix)

## `services.watt.package` {#opt-services.watt.package}

The watt package to use.

*Type:* package

*Default:* `pkgs.watt`

*Declared by:* [`nixos/modules/services/hardware/watt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/watt.nix)

## `services.watt.settings` {#opt-services.watt.settings}

Configuration for Watt. Options at https://github.com/notaShelf/watt

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/hardware/watt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/watt.nix)

## `services.wealthfolio.address` {#opt-services.wealthfolio.address}

The IP address the Wealthfolio server binds to.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/wealthfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wealthfolio.nix)

## `services.wealthfolio.authPasswordHashFile` {#opt-services.wealthfolio.authPasswordHashFile}

Path to a file containing the Argon2id PHC string defining the login password.
Required for web access unless `authRequired` is false.

Generate with: `printf 'your-password' | argon2 yoursalt16chars! -id -e`

*Type:* null or absolute path

*Default:* `null`

*Example:* `config.age.secrets.wealthfolio-hash.path`

*Declared by:* [`nixos/modules/services/web-apps/wealthfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wealthfolio.nix)

## `services.wealthfolio.authRequired` {#opt-services.wealthfolio.authRequired}

Whether to require internal authentication.

Security Note: The server panics at startup if the listener is bound to a
non-loopback address and authentication is disabled. Set this to `false`
only if a reverse proxy handles authentication for you.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/wealthfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wealthfolio.nix)

## `services.wealthfolio.authTokenTtlMinutes` {#opt-services.wealthfolio.authTokenTtlMinutes}

JWT access token lifetime in minutes. (e.g., 1440 for 24h, 10080 for 7d).

*Type:* positive integer, meaning \>0

*Default:* `60`

*Declared by:* [`nixos/modules/services/web-apps/wealthfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wealthfolio.nix)

## `services.wealthfolio.cookieSecure` {#opt-services.wealthfolio.cookieSecure}

Controls the Secure attribute on the authentication session cookie.

- auto: Sets Secure based on HTTPS protocol.
- true: Always sets Secure (Use behind a reverse proxy that terminates HTTPS).
- false: Never sets Secure (Not recommended).

*Type:* one of "auto", "true", "false"

*Default:* `"auto"`

*Declared by:* [`nixos/modules/services/web-apps/wealthfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wealthfolio.nix)

## `services.wealthfolio.corsAllowOrigins` {#opt-services.wealthfolio.corsAllowOrigins}

Comma-separated list of allowed CORS origins.

Security Note: The server panics at startup if `*` is used while authentication
is enabled, as this is a CSRF vector. Set explicit origins matching your
deployment URL (scheme + host + port).

*Type:* string

*Default:* `"*"`

*Example:* `"https://wealthfolio.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/wealthfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wealthfolio.nix)

## `services.wealthfolio.enable` {#opt-services.wealthfolio.enable}

Whether to enable Wealthfolio personal investment tracker.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/wealthfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wealthfolio.nix)

## `services.wealthfolio.logFormat` {#opt-services.wealthfolio.logFormat}

Log output format. `json` is recommended if shipping to log aggregators.

*Type:* one of "text", "json"

*Default:* `"text"`

*Declared by:* [`nixos/modules/services/web-apps/wealthfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wealthfolio.nix)

## `services.wealthfolio.openFirewall` {#opt-services.wealthfolio.openFirewall}

Whether to automatically open the specified port in the system firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/wealthfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wealthfolio.nix)

## `services.wealthfolio.package` {#opt-services.wealthfolio.package}

The wealthfolio-server package to use.

*Type:* package

*Default:* `pkgs.wealthfolio-server`

*Declared by:* [`nixos/modules/services/web-apps/wealthfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wealthfolio.nix)

## `services.wealthfolio.port` {#opt-services.wealthfolio.port}

The port the Wealthfolio server listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8088`

*Declared by:* [`nixos/modules/services/web-apps/wealthfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wealthfolio.nix)

## `services.wealthfolio.requestTimeoutMs` {#opt-services.wealthfolio.requestTimeoutMs}

HTTP request timeout in milliseconds. Default (5m) accommodates large broker syncs.

*Type:* positive integer, meaning \>0

*Default:* `300000`

*Declared by:* [`nixos/modules/services/web-apps/wealthfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wealthfolio.nix)

## `services.wealthfolio.requireDatabaseEncryption` {#opt-services.wealthfolio.requireDatabaseEncryption}

Enforces database encryption.

WARNING: This does not encrypt an existing database. If you have an existing
plaintext database, you must keep this `false`, stop the service, and manually
run `wealthfolio-server db encrypt` against your data directory before enabling.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/wealthfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wealthfolio.nix)

## `services.wealthfolio.secretKeyFile` {#opt-services.wealthfolio.secretKeyFile}

Path to a file containing the 32-byte secret key used for encrypting sensitive data
at rest (broker credentials, API keys) and signing JWT tokens.

Generate with: `openssl rand -base64 32`.

Note: Losing this key means losing access to all stored encrypted secrets.
There is no recovery.

*Type:* null or absolute path

*Default:* `null`

*Example:* `config.age.secrets.wealthfolio-key.path`

*Declared by:* [`nixos/modules/services/web-apps/wealthfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wealthfolio.nix)

## `services.webdav-server-rs.configFile` {#opt-services.webdav-server-rs.configFile}

Path to config file. If this option is set, it will override any
configuration done in services.webdav-server-rs.settings.

*Type:* absolute path

*Default:* `"Config file generated from services.webdav-server-rs.settings"`

*Example:* `"/etc/webdav-server.toml"`

*Declared by:* [`nixos/modules/services/network-filesystems/webdav-server-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/webdav-server-rs.nix)

## `services.webdav-server-rs.debug` {#opt-services.webdav-server-rs.debug}

Enable debug mode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/webdav-server-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/webdav-server-rs.nix)

## `services.webdav-server-rs.enable` {#opt-services.webdav-server-rs.enable}

Whether to enable WebDAV server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/webdav-server-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/webdav-server-rs.nix)

## `services.webdav-server-rs.group` {#opt-services.webdav-server-rs.group}

Group to run under when setuid is not enabled.

*Type:* string

*Default:* `"webdav"`

*Declared by:* [`nixos/modules/services/network-filesystems/webdav-server-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/webdav-server-rs.nix)

## `services.webdav-server-rs.settings` {#opt-services.webdav-server-rs.settings}

Attrset that is converted and passed as config file. Available
options can be found at
[here](https://github.com/miquels/webdav-server-rs/blob/master/webdav-server.toml).

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  server.listen = [ "0.0.0.0:4918" "[::]:4918" ];
  accounts = {
    auth-type = "htpasswd.default";
    acct-type = "unix";
  };
  htpasswd.default = {
    htpasswd = "/etc/htpasswd";
  };
  location = [
    {
      route = [ "/public/*path" ];
      directory = "/srv/public";
      handler = "filesystem";
      methods = [ "webdav-ro" ];
      autoindex = true;
      auth = "false";
    }
    {
      route = [ "/user/:user/*path" ];
      directory = "~";
      handler = "filesystem";
      methods = [ "webdav-rw" ];
      autoindex = true;
      auth = "true";
      setuid = true;
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/network-filesystems/webdav-server-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/webdav-server-rs.nix)

## `services.webdav-server-rs.user` {#opt-services.webdav-server-rs.user}

User to run under when setuid is not enabled.

*Type:* string

*Default:* `"webdav"`

*Declared by:* [`nixos/modules/services/network-filesystems/webdav-server-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/webdav-server-rs.nix)

## `services.webdav.configFile` {#opt-services.webdav.configFile}

Path to config file. If this option is set, it will override any
configuration done in options.services.webdav.settings.

*Type:* absolute path

*Default:* `"Config file generated from services.webdav.settings"`

*Example:* `"/etc/webdav/config.yaml"`

*Declared by:* [`nixos/modules/services/network-filesystems/webdav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/webdav.nix)

## `services.webdav.enable` {#opt-services.webdav.enable}

Whether to enable WebDAV server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/webdav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/webdav.nix)

## `services.webdav.environmentFile` {#opt-services.webdav.environmentFile}

Environment file as defined in `systemd.exec(5)`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/network-filesystems/webdav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/webdav.nix)

## `services.webdav.group` {#opt-services.webdav.group}

Group under which WebDAV runs.

*Type:* string

*Default:* `"webdav"`

*Declared by:* [`nixos/modules/services/network-filesystems/webdav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/webdav.nix)

## `services.webdav.package` {#opt-services.webdav.package}

The webdav package to use.

*Type:* package

*Default:* `pkgs.webdav`

*Declared by:* [`nixos/modules/services/network-filesystems/webdav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/webdav.nix)

## `services.webdav.settings` {#opt-services.webdav.settings}

Attrset that is converted and passed as config file. Available options
can be found at
[here](https://github.com/hacdias/webdav).

This program supports reading username and password configuration
from environment variables, so it's strongly recommended to store
username and password in a separate
[EnvironmentFile](https://www.freedesktop.org/software/systemd/man/systemd.exec.html#EnvironmentFile=).
This prevents adding secrets to the world-readable Nix store.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
    address = "0.0.0.0";
    port = 8080;
    directory = "/srv/public";
    permissions = "R";
    users = [
      {
        username = "{env}ENV_USERNAME";
        password = "{env}ENV_PASSWORD";
      }
    ];
}
```

*Declared by:* [`nixos/modules/services/network-filesystems/webdav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/webdav.nix)

## `services.webdav.user` {#opt-services.webdav.user}

User account under which WebDAV runs.

*Type:* string

*Default:* `"webdav"`

*Declared by:* [`nixos/modules/services/network-filesystems/webdav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/webdav.nix)

## `services.webhook.enable` {#opt-services.webhook.enable}

Whether to enable [Webhook](https://github.com/adnanh/webhook), a server written in Go that allows you to create HTTP endpoints (hooks),
which execute configured commands for any person or service that knows the URL
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/webhook.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/webhook.nix)

## `services.webhook.enableTemplates` {#opt-services.webhook.enableTemplates}

Enable the generated hooks file to be parsed as a Go template.
See [the documentation](https://github.com/adnanh/webhook/blob/master/docs/Templates.md) for more information.

*Type:* boolean

*Default:* `hooksTemplated != {}`

*Declared by:* [`nixos/modules/services/networking/webhook.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/webhook.nix)

## `services.webhook.environment` {#opt-services.webhook.environment}

Extra environment variables passed to webhook.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/webhook.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/webhook.nix)

## `services.webhook.extraArgs` {#opt-services.webhook.extraArgs}

These are arguments passed to the webhook command in the systemd service.
You can find the available arguments and options in the [documentation](https://github.com/adnanh/webhook/blob/master/docs/Webhook-Parameters.md).

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-secure"
]
```

*Declared by:* [`nixos/modules/services/networking/webhook.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/webhook.nix)

## `services.webhook.group` {#opt-services.webhook.group}

Webhook will be run under this group.

If set, you must create this group yourself!

*Type:* string

*Default:* `"webhook"`

*Declared by:* [`nixos/modules/services/networking/webhook.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/webhook.nix)

## `services.webhook.hooks` {#opt-services.webhook.hooks}

The actual configuration of which hooks will be served.

Read more on the [project homepage](https://github.com/adnanh/webhook#configuration) and on the [hook definition](https://github.com/adnanh/webhook/blob/master/docs/Hook-Definition.md) page.
At least one hook needs to be configured.

*Type:* attribute set of (open submodule of (JSON value))

*Default:* `{ }`

*Example:*

``` nix
{
  echo = {
    execute-command = "echo";
    response-message = "Webhook is reachable!";
  };
  redeploy-webhook = {
    command-working-directory = "/var/webhook";
    execute-command = "/var/scripts/redeploy.sh";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/webhook.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/webhook.nix)

## `services.webhook.hooks.<name>.execute-command` {#opt-services.webhook.hooks._name_.execute-command}

The command that should be executed when the hook is triggered.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/webhook.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/webhook.nix)

## `services.webhook.hooks.<name>.id` {#opt-services.webhook.hooks._name_.id}

The ID of your hook. This value is used to create the HTTP endpoint (`protocol://yourserver:port/prefix/${id}`).

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/networking/webhook.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/webhook.nix)

## `services.webhook.hooksTemplated` {#opt-services.webhook.hooksTemplated}

Same as `hooks`, but these hooks are specified as literal strings instead of Nix values,
and hence can include [template syntax](https://github.com/adnanh/webhook/blob/master/docs/Templates.md)
which might not be representable as JSON.

Template syntax requires the `enableTemplates` option to be set to `true`, which is
done by default if this option is set.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  echo-template = ''
    {
      "id": "echo-template",
      "execute-command": "echo",
      "response-message": "{{ getenv "MESSAGE" }}"
    }
  '';
}
```

*Declared by:* [`nixos/modules/services/networking/webhook.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/webhook.nix)

## `services.webhook.ip` {#opt-services.webhook.ip}

The IP webhook should serve hooks on.

The default means it can be reached on any interface if `openFirewall = true`.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/networking/webhook.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/webhook.nix)

## `services.webhook.openFirewall` {#opt-services.webhook.openFirewall}

Open the configured port in the firewall for external ingress traffic.
Preferably the Webhook server is instead put behind a reverse proxy.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/webhook.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/webhook.nix)

## `services.webhook.package` {#opt-services.webhook.package}

The webhook package to use.

*Type:* package

*Default:* `pkgs.webhook`

*Declared by:* [`nixos/modules/services/networking/webhook.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/webhook.nix)

## `services.webhook.port` {#opt-services.webhook.port}

The port webhook should be reachable from.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9000`

*Declared by:* [`nixos/modules/services/networking/webhook.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/webhook.nix)

## `services.webhook.urlPrefix` {#opt-services.webhook.urlPrefix}

The URL path prefix to use for served hooks (`protocol://yourserver:port/${prefix}/hook-id`).

*Type:* string

*Default:* `"hooks"`

*Declared by:* [`nixos/modules/services/networking/webhook.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/webhook.nix)

## `services.webhook.user` {#opt-services.webhook.user}

Webhook will be run under this user.

If set, you must create this user yourself!

*Type:* string

*Default:* `"webhook"`

*Declared by:* [`nixos/modules/services/networking/webhook.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/webhook.nix)

## `services.webhook.verbose` {#opt-services.webhook.verbose}

Whether to show verbose output.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/webhook.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/webhook.nix)

## `services.weblate.configurePostgresql` {#opt-services.weblate.configurePostgresql}

Whether to enable and configure a local PostgreSQL server by creating a user and database for weblate.
The default `settings` reference this database, if you disable this option you must provide a database URL in `extraConfig`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/weblate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/weblate.nix)

## `services.weblate.djangoSecretKeyFile` {#opt-services.weblate.djangoSecretKeyFile}

Location of the Django secret key.

This should be a path pointing to a file with secure permissions (not /nix/store).

Can be generated with `weblate-generate-secret-key` which is available as the `weblate` user.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-apps/weblate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/weblate.nix)

## `services.weblate.enable` {#opt-services.weblate.enable}

Whether to enable Weblate service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/weblate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/weblate.nix)

## `services.weblate.extraConfig` {#opt-services.weblate.extraConfig}

Text to append to `settings.py` Weblate configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/weblate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/weblate.nix)

## `services.weblate.localDomain` {#opt-services.weblate.localDomain}

The domain name serving your Weblate instance.

*Type:* string

*Example:* `"weblate.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/weblate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/weblate.nix)

## `services.weblate.package` {#opt-services.weblate.package}

The weblate package to use.

*Type:* package

*Default:* `pkgs.weblate`

*Declared by:* [`nixos/modules/services/web-apps/weblate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/weblate.nix)

## `services.weblate.smtp.enable` {#opt-services.weblate.smtp.enable}

Whether to enable Weblate SMTP support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/weblate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/weblate.nix)

## `services.weblate.smtp.from` {#opt-services.weblate.smtp.from}

The from address being used in sent emails.

*Type:* string

*Default:* `"config.services.weblate.smtp.user"`

*Example:* `"weblate@example.com"`

*Declared by:* [`nixos/modules/services/web-apps/weblate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/weblate.nix)

## `services.weblate.smtp.host` {#opt-services.weblate.smtp.host}

SMTP host used when sending emails to users.

*Type:* string

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/weblate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/weblate.nix)

## `services.weblate.smtp.passwordFile` {#opt-services.weblate.smtp.passwordFile}

Location of a file containing the SMTP password.

This should be a path pointing to a file with secure permissions (not /nix/store).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/weblate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/weblate.nix)

## `services.weblate.smtp.port` {#opt-services.weblate.smtp.port}

SMTP port used when sending emails to users.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `587`

*Example:* `25`

*Declared by:* [`nixos/modules/services/web-apps/weblate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/weblate.nix)

## `services.weblate.smtp.user` {#opt-services.weblate.smtp.user}

SMTP login name.

*Type:* null or string

*Default:* `null`

*Example:* `"weblate@example.org"`

*Declared by:* [`nixos/modules/services/web-apps/weblate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/weblate.nix)

## `services.websurfx.enable` {#opt-services.websurfx.enable}

Whether to enable Websurfx, a metasearch engine.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/websurfx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/websurfx.nix)

## `services.websurfx.openFirewall` {#opt-services.websurfx.openFirewall}

Whether to enable Whether to open the used port in the firewall.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/websurfx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/websurfx.nix)

## `services.websurfx.package` {#opt-services.websurfx.package}

The websurfx package to use.

*Type:* package

*Default:* `pkgs.websurfx`

*Declared by:* [`nixos/modules/services/web-apps/websurfx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/websurfx.nix)

## `services.websurfx.settings` {#opt-services.websurfx.settings}

Configuration options for Websurfx, see
[websurfx/config.lua](https://github.com/neon-mmd/websurfx/blob/rolling/websurfx/config.lua)
for supported values.

*Type:* open submodule of attribute set of lua value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/websurfx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/websurfx.nix)

## `services.websurfx.settings.binding_ip` {#opt-services.websurfx.settings.binding_ip}

IP address on which the server should be launched

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/websurfx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/websurfx.nix)

## `services.websurfx.settings.port` {#opt-services.websurfx.settings.port}

Port on which the server should be launched

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4567`

*Declared by:* [`nixos/modules/services/web-apps/websurfx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/websurfx.nix)

## `services.weechat.binary` {#opt-services.weechat.binary}

Binary to execute.

*Type:* absolute path

*Default:* `"${cfg.package}/bin/weechat"`

*Example:* `"${cfg.package}/bin/weechat-headless"`

*Declared by:* [`nixos/modules/services/misc/weechat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/weechat.nix)

## `services.weechat.enable` {#opt-services.weechat.enable}

Whether to enable weechat.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/weechat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/weechat.nix)

## `services.weechat.headless` {#opt-services.weechat.headless}

Allows specifying if weechat should run in TUI or headless mode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/weechat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/weechat.nix)

## `services.weechat.package` {#opt-services.weechat.package}

The weechat package to use.

*Type:* package

*Default:* `pkgs.weechat`

*Declared by:* [`nixos/modules/services/misc/weechat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/weechat.nix)

## `services.weechat.root` {#opt-services.weechat.root}

Weechat state directory.

*Type:* absolute path

*Default:* `"/var/lib/weechat"`

*Declared by:* [`nixos/modules/services/misc/weechat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/weechat.nix)

## `services.weechat.sessionName` {#opt-services.weechat.sessionName}

Name of the `screen` session for weechat.

*Type:* string

*Default:* `"weechat-screen"`

*Declared by:* [`nixos/modules/services/misc/weechat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/weechat.nix)

## `services.wg-netmanager.enable` {#opt-services.wg-netmanager.enable}

Whether to enable Wireguard network manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/wg-netmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-netmanager.nix)

## `services.wgautomesh.enable` {#opt-services.wgautomesh.enable}

Whether to enable the wgautomesh daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/wgautomesh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wgautomesh.nix)

## `services.wgautomesh.enableGossipEncryption` {#opt-services.wgautomesh.enableGossipEncryption}

Enable encryption of gossip traffic.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/wgautomesh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wgautomesh.nix)

## `services.wgautomesh.enablePersistence` {#opt-services.wgautomesh.enablePersistence}

Enable persistence of Wireguard peer info between restarts.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/wgautomesh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wgautomesh.nix)

## `services.wgautomesh.gossipSecretFile` {#opt-services.wgautomesh.gossipSecretFile}

File containing the gossip secret, a shared secret key to use for gossip
encryption.  Required if `enableGossipEncryption` is set.  This file
may contain any arbitrary-length utf8 string.  To generate a new gossip
secret, use a command such as `openssl rand -base64 32`.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/networking/wgautomesh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wgautomesh.nix)

## `services.wgautomesh.logLevel` {#opt-services.wgautomesh.logLevel}

wgautomesh log level.

*Type:* one of "trace", "debug", "info", "warn", "error"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/networking/wgautomesh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wgautomesh.nix)

## `services.wgautomesh.openFirewall` {#opt-services.wgautomesh.openFirewall}

Automatically open gossip port in firewall (recommended).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/wgautomesh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wgautomesh.nix)

## `services.wgautomesh.settings` {#opt-services.wgautomesh.settings}

Configuration for wgautomesh.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/wgautomesh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wgautomesh.nix)

## `services.wgautomesh.settings.gossip_port` {#opt-services.wgautomesh.settings.gossip_port}

wgautomesh gossip port, this MUST be the same number on all nodes in
the wgautomesh network.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1666`

*Declared by:* [`nixos/modules/services/networking/wgautomesh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wgautomesh.nix)

## `services.wgautomesh.settings.interface` {#opt-services.wgautomesh.settings.interface}

Wireguard interface to manage (it is NOT created by wgautomesh, you
should use another NixOS option to create it such as
`networking.wireguard.interfaces.wg0 = {...};`).

*Type:* string

*Example:* `"wg0"`

*Declared by:* [`nixos/modules/services/networking/wgautomesh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wgautomesh.nix)

## `services.wgautomesh.settings.lan_discovery` {#opt-services.wgautomesh.settings.lan_discovery}

Enable discovery of peers on the same LAN using UDP broadcast.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/wgautomesh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wgautomesh.nix)

## `services.wgautomesh.settings.peers` {#opt-services.wgautomesh.settings.peers}

wgautomesh peer list.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/wgautomesh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wgautomesh.nix)

## `services.wgautomesh.settings.peers.*.address` {#opt-services.wgautomesh.settings.peers._.address}

Wireguard address of this peer (a single IP address, multiple
addresses or address ranges are not supported).

*Type:* string

*Example:* `"10.0.0.42"`

*Declared by:* [`nixos/modules/services/networking/wgautomesh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wgautomesh.nix)

## `services.wgautomesh.settings.peers.*.endpoint` {#opt-services.wgautomesh.settings.peers._.endpoint}

Bootstrap endpoint for connecting to this Wireguard peer if no
other address is known or none are working.

*Type:* null or string

*Default:* `null`

*Example:* `"wgnode.mydomain.example:51820"`

*Declared by:* [`nixos/modules/services/networking/wgautomesh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wgautomesh.nix)

## `services.wgautomesh.settings.peers.*.pubkey` {#opt-services.wgautomesh.settings.peers._.pubkey}

Wireguard public key of this peer.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/wgautomesh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wgautomesh.nix)

## `services.wgautomesh.settings.upnp_forward_external_port` {#opt-services.wgautomesh.settings.upnp_forward_external_port}

Public port number to try to redirect to this machine's Wireguard
daemon using UPnP IGD.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/wgautomesh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wgautomesh.nix)

## `services.whisparr.dataDir` {#opt-services.whisparr.dataDir}

The directory where Whisparr stores its data files.

*Type:* absolute path

*Default:* `"/var/lib/whisparr/.config/Whisparr"`

*Declared by:* [`nixos/modules/services/misc/servarr/whisparr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/whisparr.nix)

## `services.whisparr.enable` {#opt-services.whisparr.enable}

Whether to enable Whisparr.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/servarr/whisparr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/whisparr.nix)

## `services.whisparr.environmentFiles` {#opt-services.whisparr.environmentFiles}

Environment file to pass secret configuration values.
Each line must follow the `WHISPARR__SECTION__KEY=value` pattern.
Please consult the documentation at the [wiki](https://wiki.servarr.com/useful-tools#using-environment-variables-for-config).

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/servarr/whisparr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/whisparr.nix)

## `services.whisparr.group` {#opt-services.whisparr.group}

Group under which Whisparr runs.

*Type:* string

*Default:* `"whisparr"`

*Declared by:* [`nixos/modules/services/misc/servarr/whisparr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/whisparr.nix)

## `services.whisparr.openFirewall` {#opt-services.whisparr.openFirewall}

Open ports in the firewall for the Whisparr web interface.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/servarr/whisparr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/whisparr.nix)

## `services.whisparr.package` {#opt-services.whisparr.package}

The whisparr package to use.

*Type:* package

*Default:* `pkgs.whisparr`

*Declared by:* [`nixos/modules/services/misc/servarr/whisparr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/whisparr.nix)

## `services.whisparr.settings` {#opt-services.whisparr.settings}

Attribute set of arbitrary config options.
Please consult the documentation at the [wiki](https://wiki.servarr.com/useful-tools#using-environment-variables-for-config).

WARNING: this configuration is stored in the world-readable Nix store!
For secrets use [services (W)](#opt-services.whisparr.environmentFiles).

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  update.mechanism = "internal";
  server = {
    urlbase = "localhost";
    port = 6969;
    bindaddress = "*";
  };
}
```

*Declared by:* [`nixos/modules/services/misc/servarr/whisparr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/whisparr.nix)

## `services.whisparr.settings.log.analyticsEnabled` {#opt-services.whisparr.settings.log.analyticsEnabled}

Send Anonymous Usage Data

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/servarr/whisparr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/whisparr.nix)

## `services.whisparr.settings.server.port` {#opt-services.whisparr.settings.server.port}

Port Number

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6969`

*Declared by:* [`nixos/modules/services/misc/servarr/whisparr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/whisparr.nix)

## `services.whisparr.settings.update.automatically` {#opt-services.whisparr.settings.update.automatically}

Automatically download and install updates.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/servarr/whisparr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/whisparr.nix)

## `services.whisparr.settings.update.mechanism` {#opt-services.whisparr.settings.update.mechanism}

which update mechanism to use

*Type:* null or one of "external", "builtIn", "script"

*Default:* `"external"`

*Declared by:* [`nixos/modules/services/misc/servarr/whisparr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/whisparr.nix)

## `services.whisparr.user` {#opt-services.whisparr.user}

User account under which Whisparr runs.

*Type:* string

*Default:* `"whisparr"`

*Declared by:* [`nixos/modules/services/misc/servarr/whisparr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/whisparr.nix)

## `services.whitebophir.enable` {#opt-services.whitebophir.enable}

Whether to enable whitebophir, an online collaborative whiteboard server (persistent state will be maintained under `/var/lib/whitebophir`).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/whitebophir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/whitebophir.nix)

## `services.whitebophir.listenAddress` {#opt-services.whitebophir.listenAddress}

Address to listen on (use 0.0.0.0 to allow access from any address).

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/web-apps/whitebophir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/whitebophir.nix)

## `services.whitebophir.package` {#opt-services.whitebophir.package}

The whitebophir package to use.

*Type:* package

*Default:* `pkgs.whitebophir`

*Declared by:* [`nixos/modules/services/web-apps/whitebophir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/whitebophir.nix)

## `services.whitebophir.port` {#opt-services.whitebophir.port}

Port to bind to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5001`

*Declared by:* [`nixos/modules/services/web-apps/whitebophir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/whitebophir.nix)

## `services.whoami.enable` {#opt-services.whoami.enable}

Whether to enable whoami.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/whoami.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/whoami.nix)

## `services.whoami.extraArgs` {#opt-services.whoami.extraArgs}

Extra command line arguments to pass to whoami. See [https://github.com/traefik/whoami#flags](https://github.com/traefik/whoami#flags) for details.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/whoami.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/whoami.nix)

## `services.whoami.package` {#opt-services.whoami.package}

The whoami package to use.

*Type:* package

*Default:* `pkgs.whoami`

*Declared by:* [`nixos/modules/services/web-apps/whoami.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/whoami.nix)

## `services.whoami.port` {#opt-services.whoami.port}

The port whoami should listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8000`

*Declared by:* [`nixos/modules/services/web-apps/whoami.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/whoami.nix)

## `services.whoogle-search.enable` {#opt-services.whoogle-search.enable}

Whether to enable Whoogle, a metasearch engine.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/whoogle-search.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/whoogle-search.nix)

## `services.whoogle-search.extraEnv` {#opt-services.whoogle-search.extraEnv}

Extra environment variables to pass to Whoogle, see
https://github.com/benbusby/whoogle-search?tab=readme-ov-file#environment-variables

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/whoogle-search.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/whoogle-search.nix)

## `services.whoogle-search.listenAddress` {#opt-services.whoogle-search.listenAddress}

Address to listen on for the web interface.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/whoogle-search.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/whoogle-search.nix)

## `services.whoogle-search.port` {#opt-services.whoogle-search.port}

Port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5000`

*Declared by:* [`nixos/modules/services/networking/whoogle-search.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/whoogle-search.nix)

## `services.wiki-js.enable` {#opt-services.wiki-js.enable}

Whether to enable wiki-js.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/wiki-js.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wiki-js.nix)

## `services.wiki-js.environmentFile` {#opt-services.wiki-js.environmentFile}

Environment file to inject e.g. secrets into the configuration.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/root/wiki-js.env"`

*Declared by:* [`nixos/modules/services/web-apps/wiki-js.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wiki-js.nix)

## `services.wiki-js.settings` {#opt-services.wiki-js.settings}

Settings to configure `wiki-js`. This directly
corresponds to [the upstream configuration options](https://docs.requarks.io/install/config).

Secrets can be injected via the environment by

- specifying [services (W)](#opt-services.wiki-js.environmentFile)
  to contain secrets
- and setting sensitive values to `$(ENVIRONMENT_VAR)`
  with this value defined in the environment-file.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/wiki-js.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wiki-js.nix)

## `services.wiki-js.settings.bindIP` {#opt-services.wiki-js.settings.bindIP}

IPs the service should listen to.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/web-apps/wiki-js.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wiki-js.nix)

## `services.wiki-js.settings.db.db` {#opt-services.wiki-js.settings.db.db}

Name of the database to use.

*Type:* string

*Default:* `"wiki"`

*Declared by:* [`nixos/modules/services/web-apps/wiki-js.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wiki-js.nix)

## `services.wiki-js.settings.db.host` {#opt-services.wiki-js.settings.db.host}

Hostname or socket-path to connect to.

*Type:* string

*Example:* `"/run/postgresql"`

*Declared by:* [`nixos/modules/services/web-apps/wiki-js.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wiki-js.nix)

## `services.wiki-js.settings.db.type` {#opt-services.wiki-js.settings.db.type}

Database driver to use for persistence. Please note that `sqlite`
is currently not supported as the build process for it is currently not implemented
in `pkgs.wiki-js` and it's not recommended by upstream for
production use.

*Type:* one of "postgres", "mysql", "mariadb", "mssql"

*Default:* `"postgres"`

*Declared by:* [`nixos/modules/services/web-apps/wiki-js.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wiki-js.nix)

## `services.wiki-js.settings.logLevel` {#opt-services.wiki-js.settings.logLevel}

Define how much detail is supposed to be logged at runtime.

*Type:* one of "error", "warn", "info", "verbose", "debug", "silly"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/web-apps/wiki-js.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wiki-js.nix)

## `services.wiki-js.settings.offline` {#opt-services.wiki-js.settings.offline}

Disable latest file updates and enable
[sideloading](https://docs.requarks.io/install/sideload).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/wiki-js.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wiki-js.nix)

## `services.wiki-js.settings.port` {#opt-services.wiki-js.settings.port}

TCP port the process should listen to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/web-apps/wiki-js.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wiki-js.nix)

## `services.wiki-js.stateDirectoryName` {#opt-services.wiki-js.stateDirectoryName}

Name of the directory in `/var/lib`.

*Type:* string

*Default:* `"wiki-js"`

*Declared by:* [`nixos/modules/services/web-apps/wiki-js.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wiki-js.nix)

## `services.windmill.baseUrl` {#opt-services.windmill.baseUrl}

The base url that windmill will be served on.

*Type:* string

*Default:*

``` nix
"https://localhost:\$\{toString config.services.windmill.serverPort}";
```

*Example:* `"https://windmill.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/windmill.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/windmill.nix)

## `services.windmill.database.createLocally` {#opt-services.windmill.database.createLocally}

Whether to create a local database automatically.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/windmill.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/windmill.nix)

## `services.windmill.database.name` {#opt-services.windmill.database.name}

Database name.

*Type:* string

*Default:* `"windmill"`

*Declared by:* [`nixos/modules/services/web-apps/windmill.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/windmill.nix)

## `services.windmill.database.url` {#opt-services.windmill.database.url}

Database url. Note that any secret here would be world-readable. Use `services.windmill.database.urlPath` unstead to include secrets in the url.

*Type:* string

*Default:*

``` nix
"postgres://\$\{config.services.windmill.database.name}?host=/var/run/postgresql";
```

*Declared by:* [`nixos/modules/services/web-apps/windmill.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/windmill.nix)

## `services.windmill.database.urlPath` {#opt-services.windmill.database.urlPath}

Path to the file containing the database url windmill should connect to. This is not deducted from database user and name as it might contain a secret

*Type:* null or absolute path

*Default:* `null`

*Example:* `"config.age.secrets.DATABASE_URL_FILE.path"`

*Declared by:* [`nixos/modules/services/web-apps/windmill.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/windmill.nix)

## `services.windmill.database.user` {#opt-services.windmill.database.user}

Database user.

*Type:* string

*Default:* `"windmill"`

*Declared by:* [`nixos/modules/services/web-apps/windmill.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/windmill.nix)

## `services.windmill.enable` {#opt-services.windmill.enable}

Whether to enable windmill service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/windmill.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/windmill.nix)

## `services.windmill.logLevel` {#opt-services.windmill.logLevel}

Log level

*Type:* one of "error", "warn", "info", "debug", "trace"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/web-apps/windmill.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/windmill.nix)

## `services.windmill.lspPort` {#opt-services.windmill.lspPort}

Port the windmill lsp listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3001`

*Declared by:* [`nixos/modules/services/web-apps/windmill.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/windmill.nix)

## `services.windmill.package` {#opt-services.windmill.package}

The windmill package to use.

*Type:* package

*Default:* `pkgs.windmill`

*Declared by:* [`nixos/modules/services/web-apps/windmill.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/windmill.nix)

## `services.windmill.serverPort` {#opt-services.windmill.serverPort}

Port the windmill server listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8001`

*Declared by:* [`nixos/modules/services/web-apps/windmill.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/windmill.nix)

## `services.wivrn.autoStart` {#opt-services.wivrn.autoStart}

Whether to enable starting the service by default.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/video/wivrn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/wivrn.nix)

## `services.wivrn.config.enable` {#opt-services.wivrn.config.enable}

Whether to enable configuration for WiVRn.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/video/wivrn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/wivrn.nix)

## `services.wivrn.config.json` {#opt-services.wivrn.config.json}

Configuration for WiVRn. The attributes are serialized to JSON in config.json. The server will fallback to default values for any missing attributes.

Like upstream, the application option is a list including the application and it's flags. In the case of the NixOS module however, the first element of the list must be a package. The module will assert otherwise.
The application can be set to a single package because it gets passed to lib.toList, though this will not allow for flags to be passed.

WiVRn has good default configurations and most options can be configured at runtime so it is recommended to leave this empty and try the defaults before attempting manual configuration.

See [https://github.com/WiVRn/WiVRn/blob/master/docs/configuration.md](https://github.com/WiVRn/WiVRn/blob/master/docs/configuration.md)

*Type:* JSON value

*Default:* `{ }`

*Example:*

``` nix
{
  # left eye, hardware; right eye, software; transparency, hardware
  encoder = [
    {
      encoder = "vulkan";
      codec = "h265";
    }
    {
      encoder = "x264";
      codec = "h264";
    }
    {
      encoder = "vulkan";
      codec = "h265";
    }
  ];
  application = [ pkgs.wayvr ];
}
```

*Declared by:* [`nixos/modules/services/video/wivrn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/wivrn.nix)

## `services.wivrn.enable` {#opt-services.wivrn.enable}

Whether to enable WiVRn, an OpenXR streaming application.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/video/wivrn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/wivrn.nix)

## `services.wivrn.extraServerFlags` {#opt-services.wivrn.extraServerFlags}

Flags to add to the wivrn service.

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "--no-publish-service" ]`

*Declared by:* [`nixos/modules/services/video/wivrn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/wivrn.nix)

## `services.wivrn.highPriority` {#opt-services.wivrn.highPriority}

Whether to enable high priority capability for asynchronous reprojection.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/video/wivrn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/wivrn.nix)

## `services.wivrn.monadoEnvironment` {#opt-services.wivrn.monadoEnvironment}

Environment variables to be passed to the Monado environment.

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/video/wivrn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/wivrn.nix)

## `services.wivrn.openFirewall` {#opt-services.wivrn.openFirewall}

Whether to enable the default ports in the firewall for the WiVRn server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/video/wivrn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/wivrn.nix)

## `services.wivrn.package` {#opt-services.wivrn.package}

The wivrn package to use.

*Type:* package

*Default:* `pkgs.wivrn`

*Declared by:* [`nixos/modules/services/video/wivrn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/wivrn.nix)

## `services.wivrn.steam.enable` {#opt-services.wivrn.steam.enable}

Whether to enable Steam support.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/video/wivrn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/wivrn.nix)

## `services.wivrn.steam.importOXRRuntimes` {#opt-services.wivrn.steam.importOXRRuntimes}

Whether to enable Sets `PRESSURE_VESSEL_IMPORT_OPENXR_1_RUNTIMES` system-wide to allow Steam to automatically discover the WiVRn server.

Note that you may have to logout for this variable to be visible
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/video/wivrn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/wivrn.nix)

## `services.wivrn.steam.package` {#opt-services.wivrn.steam.package}

The steam package to use.

*Type:* package

*Default:* `pkgs.steam`

*Declared by:* [`nixos/modules/services/video/wivrn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/wivrn.nix)

## `services.wlock.enable` {#opt-services.wlock.enable}

Whether to enable wlock, a Wayland sessionlocker using the ext-session-lock-v1 protocol.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/wlock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/wlock.nix)

## `services.wlock.package` {#opt-services.wlock.package}

The wlock package to use.

*Type:* package

*Default:* `pkgs.wlock`

*Declared by:* [`nixos/modules/services/desktops/wlock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/wlock.nix)

## `services.woodpecker-agents.agents` {#opt-services.woodpecker-agents.agents}

woodpecker-agents configurations

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  podman = {
    environment = {
      WOODPECKER_SERVER = "localhost:9000";
      WOODPECKER_BACKEND = "docker";
      DOCKER_HOST = "unix:///run/podman/podman.sock";
    };

    extraGroups = [ "podman" ];

    environmentFile = [ "/run/secrets/woodpecker/agent-secret.txt" ];
  };

  exec = {
    environment = {
      WOODPECKER_SERVER = "localhost:9000";
      WOODPECKER_BACKEND = "local";
    };

    environmentFile = [ "/run/secrets/woodpecker/agent-secret.txt" ];

    path = [
      # Needed to clone repos
      git
      git-lfs
      woodpecker-plugin-git
      # Used by the runner as the default shell
      bash
      # Most likely to be used in pipeline definitions
      coreutils
    ];
  };
}
```

*Declared by:* [`nixos/modules/services/continuous-integration/woodpecker/agents.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/woodpecker/agents.nix)

## `services.woodpecker-agents.agents.<name>.enable` {#opt-services.woodpecker-agents.agents._name_.enable}

Whether to enable this Woodpecker-Agent. Agents execute tasks generated by a Server, every install will need one server and at least one agent.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/woodpecker/agents.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/woodpecker/agents.nix)

## `services.woodpecker-agents.agents.<name>.environment` {#opt-services.woodpecker-agents.agents._name_.environment}

woodpecker-agent config environment variables, for other options read the [documentation](https://woodpecker-ci.org/docs/administration/configuration/agent)

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  WOODPECKER_SERVER = "localhost:9000";
  WOODPECKER_BACKEND = "docker";
  DOCKER_HOST = "unix:///run/podman/podman.sock";
}
```

*Declared by:* [`nixos/modules/services/continuous-integration/woodpecker/agents.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/woodpecker/agents.nix)

## `services.woodpecker-agents.agents.<name>.environmentFile` {#opt-services.woodpecker-agents.agents._name_.environmentFile}

File to load environment variables
from. This is helpful for specifying secrets.
Example content of environmentFile:

```
WOODPECKER_AGENT_SECRET=your-shared-secret-goes-here
```

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/var/secrets/woodpecker-agent.env"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/woodpecker/agents.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/woodpecker/agents.nix)

## `services.woodpecker-agents.agents.<name>.extraGroups` {#opt-services.woodpecker-agents.agents._name_.extraGroups}

Additional groups for the systemd service.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "podman"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/woodpecker/agents.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/woodpecker/agents.nix)

## `services.woodpecker-agents.agents.<name>.package` {#opt-services.woodpecker-agents.agents._name_.package}

The woodpecker-agent package to use.

*Type:* package

*Default:* `pkgs.woodpecker-agent`

*Declared by:* [`nixos/modules/services/continuous-integration/woodpecker/agents.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/woodpecker/agents.nix)

## `services.woodpecker-agents.agents.<name>.path` {#opt-services.woodpecker-agents.agents._name_.path}

Additional packages that should be added to the agent's `PATH`.
Mostly useful for the `local` backend.

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
[
  ""
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/woodpecker/agents.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/woodpecker/agents.nix)

## `services.woodpecker-server.enable` {#opt-services.woodpecker-server.enable}

Whether to enable the Woodpecker-Server, a CI/CD application for automatic builds, deployments and tests.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/woodpecker/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/woodpecker/server.nix)

## `services.woodpecker-server.environment` {#opt-services.woodpecker-server.environment}

woodpecker-server config environment variables, for other options read the [documentation](https://woodpecker-ci.org/docs/administration/configuration/server)

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  WOODPECKER_HOST = "https://woodpecker.example.com";
  WOODPECKER_OPEN = "true";
  WOODPECKER_GITEA = "true";
  WOODPECKER_GITEA_CLIENT = "ffffffff-ffff-ffff-ffff-ffffffffffff";
  WOODPECKER_GITEA_URL = "https://git.example.com";
}
```

*Declared by:* [`nixos/modules/services/continuous-integration/woodpecker/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/woodpecker/server.nix)

## `services.woodpecker-server.environmentFile` {#opt-services.woodpecker-server.environmentFile}

File to load environment variables
from. This is helpful for specifying secrets.
Example content of environmentFile:

```
WOODPECKER_AGENT_SECRET=your-shared-secret-goes-here
WOODPECKER_GITEA_SECRET=gto_**************************************
```

*Type:* (list of absolute path) or absolute path convertible to it

*Default:* `[ ]`

*Example:*

``` nix
[
  "/root/woodpecker-server.env"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/woodpecker/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/woodpecker/server.nix)

## `services.woodpecker-server.package` {#opt-services.woodpecker-server.package}

The woodpecker-server package to use.

*Type:* package

*Default:* `pkgs.woodpecker-server`

*Declared by:* [`nixos/modules/services/continuous-integration/woodpecker/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/woodpecker/server.nix)

## `services.wordpress.sites` {#opt-services.wordpress.sites}

Specification of one or more WordPress sites to serve

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.database.createLocally` {#opt-services.wordpress.sites._name_.database.createLocally}

Create the database and database user locally.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.database.host` {#opt-services.wordpress.sites._name_.database.host}

Database host address.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.database.name` {#opt-services.wordpress.sites._name_.database.name}

Database name.

*Type:* string

*Default:* `"wordpress"`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.database.passwordFile` {#opt-services.wordpress.sites._name_.database.passwordFile}

A file containing the password corresponding to
`database.user`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/wordpress-dbpassword"`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.database.port` {#opt-services.wordpress.sites._name_.database.port}

Database host port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3306`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.database.socket` {#opt-services.wordpress.sites._name_.database.socket}

Path to the unix socket file to use for authentication.

*Type:* null or absolute path

*Default:* `/run/mysqld/mysqld.sock`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.database.tablePrefix` {#opt-services.wordpress.sites._name_.database.tablePrefix}

The $table\_prefix is the value placed in the front of your database tables.
Change the value if you want to use something other than wp\_ for your database
prefix. Typically this is changed if you are installing multiple WordPress blogs
in the same database.

See [https://codex.wordpress.org/Editing\_wp-config.php#table\_prefix](https://codex.wordpress.org/Editing_wp-config.php#table_prefix).

*Type:* string

*Default:* `"wp_"`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.database.user` {#opt-services.wordpress.sites._name_.database.user}

Database user.

*Type:* string

*Default:* `"wordpress"`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.extraConfig` {#opt-services.wordpress.sites._name_.extraConfig}

Any additional text to be appended to the wp-config.php
configuration file. This is a PHP script. For configuration
settings, see [https://codex.wordpress.org/Editing\_wp-config.php](https://codex.wordpress.org/Editing_wp-config.php).

**Note**: Please pass structured settings via
`services.wordpress.sites.‹name›.settings` instead.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  @ini_set( 'log_errors', 'Off' );
  @ini_set( 'display_errors', 'On' );
''
```

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.finalPackage` {#opt-services.wordpress.sites._name_.finalPackage}

WordPress package with bundled configuration, plugins and themes.

*Type:* package

*Default:* `pkg name config`

*Read only*

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.fontsDir` {#opt-services.wordpress.sites._name_.fontsDir}

This directory is used to download fonts from a remote location, e.g.
to host google fonts locally.

*Type:* absolute path

*Default:* `"/var/lib/wordpress/‹name›/fonts"`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.languages` {#opt-services.wordpress.sites._name_.languages}

List of path(s) to respective language(s) which are copied from the 'languages' directory.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  # Let's package the German language.
  # For other languages try to replace language and country code in the download URL with your desired one.
  # Reference https://translate.wordpress.org for available translations and
  # codes.
  (pkgs.stdenv.mkDerivation {
    name = "language-de";
    src = pkgs.fetchurl {
      url = "https://de.wordpress.org/wordpress-${pkgs.wordpress.version}-de_DE.tar.gz";
      # Name is required to invalidate the hash when wordpress is updated
      name = "wordpress-${pkgs.wordpress.version}-language-de";
      sha256 = "sha256-dlas0rXTSV4JAl8f/UyMbig57yURRYRhTMtJwF9g8h0=";
    };
    installPhase = "mkdir -p $out; cp -r ./wp-content/languages/* $out/";
  })
];
```

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.mergedConfig` {#opt-services.wordpress.sites._name_.mergedConfig}

Read only representation of the final configuration.

*Type:* unspecified value

*Default:*

``` nix
{
  DISALLOW_FILE_EDIT = true;
  AUTOMATIC_UPDATER_DISABLED = true;
}
```

*Read only*

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.package` {#opt-services.wordpress.sites._name_.package}

The wordpress package to use.

*Type:* package

*Default:* `pkgs.wordpress`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.plugins` {#opt-services.wordpress.sites._name_.plugins}

Path(s) to respective plugin(s) which are copied from the 'plugins' directory.

::: note
These plugins need to be packaged before use, see example.
:::

*Type:* (attribute set of absolute path) or (list of absolute path) convertible to it

*Default:* `{ }`

*Example:*

``` nix
{
  inherit (pkgs.wordpressPackages.plugins) embed-pdf-viewer-plugin;
}
```

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.poolConfig` {#opt-services.wordpress.sites._name_.poolConfig}

Options for the WordPress PHP pool. See the documentation on `php-fpm.conf`
for details on configuration directives.

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

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.settings` {#opt-services.wordpress.sites._name_.settings}

Structural Wordpress configuration.
Refer to [https://developer.wordpress.org/apis/wp-config-php](https://developer.wordpress.org/apis/wp-config-php)
for details and supported values.

*Type:* attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  WP_DEFAULT_THEME = "twentytwentytwo";
  WP_SITEURL = "https://example.org";
  WP_HOME = "https://example.org";
  WP_DEBUG = true;
  WP_DEBUG_DISPLAY = true;
  WPLANG = "de_DE";
  FORCE_SSL_ADMIN = true;
  AUTOMATIC_UPDATER_DISABLED = true;
}
```

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.themes` {#opt-services.wordpress.sites._name_.themes}

Path(s) to respective theme(s) which are copied from the 'theme' directory.

::: note
These themes need to be packaged before use, see example.
:::

*Type:* (attribute set of absolute path) or (list of absolute path) convertible to it

*Default:* `{ inherit (pkgs.wordpressPackages.themes) twentytwentyfive; }`

*Example:*

``` nix
{
  inherit (pkgs.wordpressPackages.themes) responsive-theme;
}
```

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.uploadsDir` {#opt-services.wordpress.sites._name_.uploadsDir}

This directory is used for uploads of pictures. The directory passed here is automatically
created and permissions adjusted as required.

*Type:* absolute path

*Default:* `"/var/lib/wordpress/‹name›/uploads"`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost` {#opt-services.wordpress.sites._name_.virtualHost}

Apache configuration can be done by adapting [`services.httpd.virtualHosts`](../../options/services-h/index.md#opt-services.httpd.virtualHosts).

*Type:* submodule

*Example:*

``` nix
{
  adminAddr = "webmaster@example.org";
  forceSSL = true;
  enableACME = true;
}
```

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.acmeRoot` {#opt-services.wordpress.sites._name_.virtualHost.acmeRoot}

Directory for the acme challenge which is PUBLIC, don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.addSSL` {#opt-services.wordpress.sites._name_.virtualHost.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.adminAddr` {#opt-services.wordpress.sites._name_.virtualHost.adminAddr}

E-mail address of the server administrator.

*Type:* null or string

*Default:* `null`

*Example:* `"admin@example.org"`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.documentRoot` {#opt-services.wordpress.sites._name_.virtualHost.documentRoot}

The path of Apache's document root directory.  If left undefined,
an empty directory in the Nix store will be used as root.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.enableACME` {#opt-services.wordpress.sites._name_.virtualHost.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.enableUserDir` {#opt-services.wordpress.sites._name_.virtualHost.enableUserDir}

Whether to enable serving `~/public_html` as
`/~«username»`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.extraConfig` {#opt-services.wordpress.sites._name_.virtualHost.extraConfig}

These lines go to httpd.conf verbatim. They will go after
directories and directory aliases defined by default.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  <Directory /home>
    Options FollowSymlinks
    AllowOverride All
  </Directory>
''
```

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.forceSSL` {#opt-services.wordpress.sites._name_.virtualHost.forceSSL}

Whether to add a separate nginx server block that permanently redirects (301)
all plain HTTP traffic to HTTPS. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443), where the non-SSL listens are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.globalRedirect` {#opt-services.wordpress.sites._name_.virtualHost.globalRedirect}

If set, all requests for this host are redirected permanently to
the given URL.

*Type:* null or string

*Default:* `null`

*Example:* `"http://newserver.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.hostName` {#opt-services.wordpress.sites._name_.virtualHost.hostName}

Canonical hostname for the server.

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.http2` {#opt-services.wordpress.sites._name_.virtualHost.http2}

Whether to enable HTTP 2. HTTP/2 is supported in all multi-processing modules that come with httpd. *However, if you use the prefork mpm, there will
be severe restrictions.* Refer to [https://httpd.apache.org/docs/2.4/howto/http2.html#mpm-config](https://httpd.apache.org/docs/2.4/howto/http2.html#mpm-config) for details.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.listen` {#opt-services.wordpress.sites._name_.virtualHost.listen}

Listen addresses and ports for this virtual host.

::: note
This option overrides `addSSL`, `forceSSL` and `onlySSL`.

If you only want to set the addresses manually and not the ports, take a look at `listenAddresses`.
:::

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    ip = "195.154.1.1";
    port = 443;
    ssl = true;
  }
  {
    ip = "192.154.1.1";
    port = 80;
  }
  {
    ip = "*";
    port = 8080;
  }
]
```

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.listen.*.ip` {#opt-services.wordpress.sites._name_.virtualHost.listen._.ip}

IP to listen on. 0.0.0.0 for IPv4 only, \* for all.

*Type:* string

*Default:* `"*"`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.listen.*.port` {#opt-services.wordpress.sites._name_.virtualHost.listen._.port}

Port to listen on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.listen.*.ssl` {#opt-services.wordpress.sites._name_.virtualHost.listen._.ssl}

Whether to enable SSL (https) support.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.listenAddresses` {#opt-services.wordpress.sites._name_.virtualHost.listenAddresses}

Listen addresses for this virtual host.
Compared to `listen` this only sets the addresses
and the ports are chosen automatically.

*Type:* non-empty (list of string)

*Default:*

``` nix
[
  "*"
]
```

*Example:*

``` nix
[
  "127.0.0.1"
]
```

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.locations` {#opt-services.wordpress.sites._name_.virtualHost.locations}

Declarative location config. See [https://httpd.apache.org/docs/2.4/mod/core.html#location](https://httpd.apache.org/docs/2.4/mod/core.html#location) for details.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "/" = {
    proxyPass = "http://localhost:3000";
  };
  "/foo/bar.png" = {
    alias = "/home/eelco/some-file.png";
  };
};
```

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.locations.<name>.alias` {#opt-services.wordpress.sites._name_.virtualHost.locations._name_.alias}

Alias directory for requests. See [https://httpd.apache.org/docs/2.4/mod/mod\_alias.html#alias](https://httpd.apache.org/docs/2.4/mod/mod_alias.html#alias).

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.locations.<name>.extraConfig` {#opt-services.wordpress.sites._name_.virtualHost.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.locations.<name>.index` {#opt-services.wordpress.sites._name_.virtualHost.locations._name_.index}

Adds DirectoryIndex directive. See [https://httpd.apache.org/docs/2.4/mod/mod\_dir.html#directoryindex](https://httpd.apache.org/docs/2.4/mod/mod_dir.html#directoryindex).

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.locations.<name>.priority` {#opt-services.wordpress.sites._name_.virtualHost.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.locations.<name>.proxyPass` {#opt-services.wordpress.sites._name_.virtualHost.locations._name_.proxyPass}

Sets up a simple reverse proxy as described by [https://httpd.apache.org/docs/2.4/howto/reverse\_proxy.html#simple](https://httpd.apache.org/docs/2.4/howto/reverse_proxy.html#simple).

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.logFormat` {#opt-services.wordpress.sites._name_.virtualHost.logFormat}

Log format for Apache's log files. Possible values are: combined, common, referer, agent.

*Type:* string

*Default:* `"common"`

*Example:* `"combined"`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.onlySSL` {#opt-services.wordpress.sites._name_.virtualHost.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.robotsEntries` {#opt-services.wordpress.sites._name_.virtualHost.robotsEntries}

Specification of pages to be ignored by web crawlers. See [http://www.robotstxt.org/](http://www.robotstxt.org/) for details.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"Disallow: /foo/"`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.servedDirs` {#opt-services.wordpress.sites._name_.virtualHost.servedDirs}

This option provides a simple way to serve static directories.

*Type:* list of (attribute set)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    dir = "/home/eelco/Dev/nix-homepage";
    urlPath = "/nix";
  }
]
```

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.servedFiles` {#opt-services.wordpress.sites._name_.virtualHost.servedFiles}

This option provides a simple way to serve individual, static files.

::: note
This option has been deprecated and will be removed in a future
version of NixOS. You can achieve the same result by making use of
the `locations.<name>.alias` option.
:::

*Type:* list of (attribute set)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    file = "/home/eelco/some-file.png";
    urlPath = "/foo/bar.png";
  }
]
```

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.serverAliases` {#opt-services.wordpress.sites._name_.virtualHost.serverAliases}

Additional names of virtual hosts served by this virtual host configuration.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "www.example.org"
  "www.example.org:8080"
  "example.org"
]
```

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.sslServerCert` {#opt-services.wordpress.sites._name_.virtualHost.sslServerCert}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.sslServerChain` {#opt-services.wordpress.sites._name_.virtualHost.sslServerChain}

Path to server SSL chain file.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/ca.pem"`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.sslServerKey` {#opt-services.wordpress.sites._name_.virtualHost.sslServerKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.sites.<name>.virtualHost.useACMEHost` {#opt-services.wordpress.sites._name_.virtualHost.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.wordpress.webserver` {#opt-services.wordpress.webserver}

Whether to use apache2 or nginx for virtual host management.

Further nginx configuration can be done by adapting `services.nginx.virtualHosts.<name>`.
See [services (N)](../../options/services-n/index.md#opt-services.nginx.virtualHosts) for further information.

Further apache2 configuration can be done by adapting `services.httpd.virtualHosts.<name>`.
See [services (H)](../../options/services-h/index.md#opt-services.httpd.virtualHosts) for further information.

*Type:* one of "httpd", "nginx", "caddy"

*Default:* `"httpd"`

*Declared by:* [`nixos/modules/services/web-apps/wordpress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/wordpress.nix)

## `services.workout-tracker.address` {#opt-services.workout-tracker.address}

Web interface address.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/misc/workout-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/workout-tracker.nix)

## `services.workout-tracker.enable` {#opt-services.workout-tracker.enable}

Whether to enable workout tracking web application for personal use (or family, friends), geared towards running and other GPX-based activities.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/workout-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/workout-tracker.nix)

## `services.workout-tracker.environmentFile` {#opt-services.workout-tracker.environmentFile}

An environment file as defined in `systemd.exec(5)`.

Secrets like `WT_JWT_ENCRYPTION_KEY` may be passed to the service without adding them
to the world-readable Nix store.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/workout-tracker.env"`

*Declared by:* [`nixos/modules/services/misc/workout-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/workout-tracker.nix)

## `services.workout-tracker.package` {#opt-services.workout-tracker.package}

The workout-tracker package to use.

*Type:* package

*Default:* `pkgs.workout-tracker`

*Declared by:* [`nixos/modules/services/misc/workout-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/workout-tracker.nix)

## `services.workout-tracker.port` {#opt-services.workout-tracker.port}

Web interface port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/misc/workout-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/workout-tracker.nix)

## `services.workout-tracker.settings` {#opt-services.workout-tracker.settings}

Extra config options.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  WT_DATABASE_DRIVER = "sqlite";
  WT_DEBUG = "false";
  WT_DSN = "./database.db";
  WT_LOGGING = "true";
}
```

*Declared by:* [`nixos/modules/services/misc/workout-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/workout-tracker.nix)

## `services.writefreely.acme.enable` {#opt-services.writefreely.acme.enable}

Whether or not to automatically fetch and configure SSL certs.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.writefreely.admin.initialPasswordFile` {#opt-services.writefreely.admin.initialPasswordFile}

Path to a file containing the initial password for the admin user.
If not provided, the default password will be set to `nixos`.

*Type:* absolute path

*Default:* `"/nix/store/xxx-default-admin-pass"`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.writefreely.admin.name` {#opt-services.writefreely.admin.name}

The name of the first admin user.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.writefreely.database.createLocally` {#opt-services.writefreely.database.createLocally}

When [`services.writefreely.database.type`](#opt-services.writefreely.database.type) is set to
`"mysql"`, this option will enable the MySQL service locally.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.writefreely.database.host` {#opt-services.writefreely.database.host}

The database host to connect to.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.writefreely.database.migrate` {#opt-services.writefreely.database.migrate}

Whether or not to automatically run migrations on startup.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.writefreely.database.name` {#opt-services.writefreely.database.name}

The name of the database to store data in.

*Type:* string

*Default:* `"writefreely"`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.writefreely.database.passwordFile` {#opt-services.writefreely.database.passwordFile}

The file to load the database password from.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.writefreely.database.port` {#opt-services.writefreely.database.port}

The port used when connecting to the database host.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3306`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.writefreely.database.tls` {#opt-services.writefreely.database.tls}

Whether or not TLS should be used for the database connection.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.writefreely.database.type` {#opt-services.writefreely.database.type}

The database provider to use.

*Type:* one of "sqlite3", "mysql"

*Default:* `"sqlite3"`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.writefreely.database.user` {#opt-services.writefreely.database.user}

The database user to connect as.

*Type:* null or string

*Default:* `"writefreely"`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.writefreely.email.smtpPasswordFile` {#opt-services.writefreely.email.smtpPasswordFile}

The file to load the password for the smtp email server.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.writefreely.enable` {#opt-services.writefreely.enable}

Whether to enable Writefreely, build a digital writing community.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.writefreely.group` {#opt-services.writefreely.group}

Group under which Writefreely is ran.

*Type:* string

*Default:* `"writefreely"`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.writefreely.host` {#opt-services.writefreely.host}

The public host name to serve.

*Type:* string

*Default:* `""`

*Example:* `"example.com"`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.writefreely.nginx.enable` {#opt-services.writefreely.nginx.enable}

Whether or not to enable and configure nginx as a proxy for WriteFreely.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.writefreely.nginx.forceSSL` {#opt-services.writefreely.nginx.forceSSL}

Whether or not to force the use of SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.writefreely.package` {#opt-services.writefreely.package}

The writefreely package to use.

*Type:* package

*Default:* `pkgs.writefreely`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.writefreely.settings` {#opt-services.writefreely.settings}

Writefreely configuration (`config.ini`). Refer to
[https://writefreely.org/docs/latest/admin/config](https://writefreely.org/docs/latest/admin/config)
for details.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.writefreely.settings.app.theme` {#opt-services.writefreely.settings.app.theme}

The theme to apply.

*Type:* string

*Default:* `"write"`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.writefreely.settings.server.port` {#opt-services.writefreely.settings.server.port}

The port WriteFreely should listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `"80"`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.writefreely.stateDir` {#opt-services.writefreely.stateDir}

The state directory where keys and data are stored.

*Type:* absolute path

*Default:* `"/var/lib/writefreely"`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.writefreely.user` {#opt-services.writefreely.user}

User under which Writefreely is ran.

*Type:* string

*Default:* `"writefreely"`

*Declared by:* [`nixos/modules/services/web-apps/writefreely.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/writefreely.nix)

## `services.wstunnel.clients` {#opt-services.wstunnel.clients}

`wstunnel` clients to set up.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  wg-tunnel = {
    connectTo = "wss://wstunnel.server.com:8443";
    localToRemote = [
      "tcp://1212:google.com:443"
      "tcp://2:n.lan:4?proxy_protocol"
    ];
    remoteToLocal = [
      "socks5://[::1]:1212"
      "unix://wstunnel.sock:g.com:443"
    ];
  };
}
```

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wstunnel.clients.<name>.addNetBind` {#opt-services.wstunnel.clients._name_.addNetBind}

Whether to enable Whether add CAP\_NET\_BIND\_SERVICE to the tunnel service, this should be enabled if you want to bind port \< 1024.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wstunnel.clients.<name>.autoStart` {#opt-services.wstunnel.clients._name_.autoStart}

Whether to enable starting this wstunnel instance automatically.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wstunnel.clients.<name>.connectTo` {#opt-services.wstunnel.clients._name_.connectTo}

Server address and port to connect to.

*Type:* string

*Example:* `"https://wstunnel.server.com:8443"`

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wstunnel.clients.<name>.enable` {#opt-services.wstunnel.clients._name_.enable}

Whether to enable this `wstunnel` instance.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wstunnel.clients.<name>.environmentFile` {#opt-services.wstunnel.clients._name_.environmentFile}

Environment file to be passed to the systemd service.
Useful for passing secrets to the service to prevent them from being
world-readable in the Nix store.
Note however that the secrets are passed to `wstunnel` through
the command line, which makes them locally readable for all users of
the system at runtime.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/secrets/wstunnelSecrets"`

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wstunnel.clients.<name>.package` {#opt-services.wstunnel.clients._name_.package}

The wstunnel package to use.

*Type:* package

*Default:* `pkgs.wstunnel`

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wstunnel.clients.<name>.settings` {#opt-services.wstunnel.clients._name_.settings}

Command line arguments to pass to `wstunnel`.
Attributes of the form `argName = true;` will be translated to `--argName`,
and `argName = \"value\"` to `--argName value`.

*Type:* open submodule of attribute set of (boolean or signed integer or string or list of string)

*Default:* `{ }`

*Example:*

``` nix
{
  someNewOption = true;
  someNewOptionWithValue = "someValue";
}
```

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wstunnel.clients.<name>.settings.http-headers` {#opt-services.wstunnel.clients._name_.settings.http-headers}

Custom headers to send in the upgrade request

*Type:* (list of string) or (attribute set of string) convertible to it

*Default:* `{ }`

*Example:*

``` nix
{
  X-Some-Header = "some-value";
}
```

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wstunnel.enable` {#opt-services.wstunnel.enable}

Whether to enable wstunnel.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wstunnel.servers` {#opt-services.wstunnel.servers}

`wstunnel` servers to set up.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  wg-tunnel = {
    listen = {
      enableHTTPS = true;
      host = "0.0.0.0";
      port = 8080;
    };
    settings = {
      restrict-to = [
        {
          host = "127.0.0.1";
          port = 51820;
        }
      ];
      tls-certificate = "/var/lib/secrets/fullchain.pem";
      tls-private-key = "/var/lib/secrets/key.pem";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wstunnel.servers.<name>.autoStart` {#opt-services.wstunnel.servers._name_.autoStart}

Whether to enable starting this wstunnel instance automatically.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wstunnel.servers.<name>.enable` {#opt-services.wstunnel.servers._name_.enable}

Whether to enable this `wstunnel` instance.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wstunnel.servers.<name>.environmentFile` {#opt-services.wstunnel.servers._name_.environmentFile}

Environment file to be passed to the systemd service.
Useful for passing secrets to the service to prevent them from being
world-readable in the Nix store.
Note however that the secrets are passed to `wstunnel` through
the command line, which makes them locally readable for all users of
the system at runtime.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/secrets/wstunnelSecrets"`

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wstunnel.servers.<name>.listen` {#opt-services.wstunnel.servers._name_.listen}

Address and port to listen on.
Setting the port to a value below 1024 will also give the process
the required `CAP_NET_BIND_SERVICE` capability.

*Type:* submodule

*Default:*

``` nix
{ config, ... }:
{
  host = "0.0.0.0";
  port = if config.enableHTTPS then 443 else 80;
}
```

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wstunnel.servers.<name>.listen.enableHTTPS` {#opt-services.wstunnel.servers._name_.listen.enableHTTPS}

Use HTTPS for the tunnel server.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wstunnel.servers.<name>.listen.host` {#opt-services.wstunnel.servers._name_.listen.host}

The hostname.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wstunnel.servers.<name>.listen.port` {#opt-services.wstunnel.servers._name_.listen.port}

The port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wstunnel.servers.<name>.package` {#opt-services.wstunnel.servers._name_.package}

The wstunnel package to use.

*Type:* package

*Default:* `pkgs.wstunnel`

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wstunnel.servers.<name>.settings` {#opt-services.wstunnel.servers._name_.settings}

Command line arguments to pass to `wstunnel`.
Attributes of the form `argName = true;` will be translated to `--argName`,
and `argName = \"value\"` to `--argName value`.

*Type:* open submodule of attribute set of (boolean or signed integer or string or list of string)

*Default:* `{ }`

*Example:*

``` nix
{
  someNewOption = true;
  someNewOptionWithValue = "someValue";
}
```

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wstunnel.servers.<name>.settings.restrict-to` {#opt-services.wstunnel.servers._name_.settings.restrict-to}

Restrictions on the connections that the server will accept.
For more flexibility, and the possibility to also allow reverse tunnels,
look into the `restrict-config` option that takes a path to a yaml file.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    host = "127.0.0.1";
    port = 51820;
  }
]
```

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wstunnel.servers.<name>.settings.restrict-to.*.host` {#opt-services.wstunnel.servers._name_.settings.restrict-to._.host}

The hostname.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wstunnel.servers.<name>.settings.restrict-to.*.port` {#opt-services.wstunnel.servers._name_.settings.restrict-to._.port}

The port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wstunnel.servers.<name>.useACMEHost` {#opt-services.wstunnel.servers._name_.useACMEHost}

Use a certificate generated by the NixOS ACME module for the given host.
Note that this will not generate a new certificate - you will need to do so with `security.acme.certs`.

*Type:* null or string

*Default:* `null`

*Example:* `"example.com"`

*Declared by:* [`nixos/modules/services/networking/wstunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wstunnel.nix)

## `services.wyoming.faster-whisper.package` {#opt-services.wyoming.faster-whisper.package}

The wyoming-faster-whisper package to use.

*Type:* package

*Default:* `pkgs.wyoming-faster-whisper`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/faster-whisper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/faster-whisper.nix)

## `services.wyoming.faster-whisper.servers` {#opt-services.wyoming.faster-whisper.servers}

Attribute set of wyoming-faster-whisper instances to spawn.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/faster-whisper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/faster-whisper.nix)

## `services.wyoming.faster-whisper.servers.<name>.beamSize` {#opt-services.wyoming.faster-whisper.servers._name_.beamSize}

The number of beams to use in beam search.

The default (`0`) will use 1 beam on ARM systems (assumes an ARM SBC) and 5 everywhere else.

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Example:* `5`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/faster-whisper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/faster-whisper.nix)

## `services.wyoming.faster-whisper.servers.<name>.device` {#opt-services.wyoming.faster-whisper.servers._name_.device}

Determines the platform faster-whisper is run on. CPU works everywhere, CUDA requires a compatible NVIDIA GPU.

*Type:* one of "cpu", "cuda", "auto"

*Default:* `"cpu"`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/faster-whisper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/faster-whisper.nix)

## `services.wyoming.faster-whisper.servers.<name>.enable` {#opt-services.wyoming.faster-whisper.servers._name_.enable}

Whether to enable Wyoming faster-whisper server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/faster-whisper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/faster-whisper.nix)

## `services.wyoming.faster-whisper.servers.<name>.extraArgs` {#opt-services.wyoming.faster-whisper.servers._name_.extraArgs}

Extra arguments to pass to the server commandline.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/faster-whisper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/faster-whisper.nix)

## `services.wyoming.faster-whisper.servers.<name>.initialPrompt` {#opt-services.wyoming.faster-whisper.servers._name_.initialPrompt}

Optional text to provide as a prompt for the first window.
This can be used to provide, or "prompt-engineer" a context
for transcription, e.g. custom vocabularies or proper nouns to
make it more likely to predict those word correctly.

Only supported when the `sttLibrary` is
`faster-whisper`. Not supported with Distill whisper models.

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
''
  The following conversation takes place in the universe of
  Wizard of Oz. Key terms include 'Yellow Brick Road' (the path
  to follow), 'Emerald City' (the ultimate goal), and 'Ruby
  Slippers' (the magical tools to succeed). Keep these in mind as
  they guide the journey.
''
```

*Declared by:* [`nixos/modules/services/home-automation/wyoming/faster-whisper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/faster-whisper.nix)

## `services.wyoming.faster-whisper.servers.<name>.language` {#opt-services.wyoming.faster-whisper.servers._name_.language}

The language used to to parse words and sentences.

*Type:* one of "auto", "af", "am", "ar", "as", "az", "ba", "be", "bg", "bn", "bo", "br", "bs", "ca", "cs", "cy", "da", "de", "el", "en", "es", "et", "eu", "fa", "fi", "fo", "fr", "gl", "gu", "ha", "haw", "he", "hi", "hr", "ht", "hu", "hy", "id", "is", "it", "ja", "jw", "ka", "kk", "km", "kn", "ko", "la", "lb", "ln", "lo", "lt", "lv", "mg", "mi", "mk", "ml", "mn", "mr", "ms", "mt", "my", "ne", "nl", "nn", "no", "oc", "pa", "pl", "ps", "pt", "ro", "ru", "sa", "sd", "si", "sk", "sl", "sn", "so", "sq", "sr", "su", "sv", "sw", "ta", "te", "tg", "th", "tk", "tl", "tr", "tt", "uk", "ur", "uz", "vi", "yi", "yue", "yo", "zh"

*Example:* `"en"`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/faster-whisper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/faster-whisper.nix)

## `services.wyoming.faster-whisper.servers.<name>.model` {#opt-services.wyoming.faster-whisper.servers._name_.model}

Name of the voice model to use. Can also be a HuggingFace model ID or a path to
a custom model directory.

When set to `auto` picks a default based on the `language`,

With `sttLibrary` set to `transformers`, a HuggingFace transformers Whisper model
ID from HuggingFace like `openai/whisper-tiny` or `openai/whisper-base` must be used.

Compressed models (`int8`) are slightly less accurate, but smaller and faster.
Distilled models are uncompressed and faster and smaller than non-distilled models.

Available models for faster-whisper:

- `tiny-int8` (compressed)
- `tiny`
- `tiny.en` (English only)
- `base-int8` (compressed)
- `base`
- `base.en` (English only)
- `small-int8` (compressed)
- `distil-small.en` (distilled, English only)
- `small`
- `small.en` (English only)
- `medium-int8` (compressed)
- `distil-medium.en` (distilled, English only)
- `medium`
- `medium.en` (English only)
- `large`
- `large-v1`
- `distil-large-v2` (distilled, English only)
- `large-v2`
- `distil-large-v3` (distilled, English only)
- `large-v3`
- `turbo` (faster than large-v3)

*Type:* string

*Default:* `"auto"`

*Example:* `"sherpa-onnx-nemo-parakeet-tdt-0.6b-v3-int8"`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/faster-whisper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/faster-whisper.nix)

## `services.wyoming.faster-whisper.servers.<name>.sttLibrary` {#opt-services.wyoming.faster-whisper.servers._name_.sttLibrary}

Library used for speech-to-text process.

When set to `auto` picks a default based on the `language`.

*Type:* one of "auto", "faster-whisper", "funasr", "onnx-asr", "qwen3-asr", "sherpa", "transformers"

*Default:* `"auto"`

*Example:* `"sherpa"`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/faster-whisper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/faster-whisper.nix)

## `services.wyoming.faster-whisper.servers.<name>.task` {#opt-services.wyoming.faster-whisper.servers._name_.task}

Whisper task to perform.

*Type:* one of "transcribe", "translate"

*Default:* `"transcribe"`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/faster-whisper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/faster-whisper.nix)

## `services.wyoming.faster-whisper.servers.<name>.uri` {#opt-services.wyoming.faster-whisper.servers._name_.uri}

URI to bind the wyoming server to.

*Type:* string matching the pattern ^(tcp|unix)://.\*$

*Example:* `"tcp://0.0.0.0:10300"`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/faster-whisper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/faster-whisper.nix)

## `services.wyoming.faster-whisper.servers.<name>.zeroconf.enable` {#opt-services.wyoming.faster-whisper.servers._name_.zeroconf.enable}

Whether to enable zeroconf discovery.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/faster-whisper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/faster-whisper.nix)

## `services.wyoming.faster-whisper.servers.<name>.zeroconf.name` {#opt-services.wyoming.faster-whisper.servers._name_.zeroconf.name}

The advertised name for zeroconf discovery.

*Type:* string

*Default:* `"faster-whisper-‹name›"`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/faster-whisper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/faster-whisper.nix)

## `services.wyoming.openwakeword.customModelsDirectories` {#opt-services.wyoming.openwakeword.customModelsDirectories}

Paths to directories with custom wake word models (\*.tflite model files).

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/openwakeword.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/openwakeword.nix)

## `services.wyoming.openwakeword.enable` {#opt-services.wyoming.openwakeword.enable}

Whether to enable Wyoming protocol server for openWakeWord wake word detection system.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/openwakeword.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/openwakeword.nix)

## `services.wyoming.openwakeword.extraArgs` {#opt-services.wyoming.openwakeword.extraArgs}

Extra arguments to pass to the server commandline.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/openwakeword.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/openwakeword.nix)

## `services.wyoming.openwakeword.package` {#opt-services.wyoming.openwakeword.package}

The wyoming-openwakeword package to use.

*Type:* package

*Default:* `pkgs.wyoming-openwakeword`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/openwakeword.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/openwakeword.nix)

## `services.wyoming.openwakeword.refractorySeconds` {#opt-services.wyoming.openwakeword.refractorySeconds}

Duration in seconds before a wake word can be detected again.

*Type:* signed integer or floating point number

*Default:* `2`

*Example:* `1.5`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/openwakeword.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/openwakeword.nix)

## `services.wyoming.openwakeword.threshold` {#opt-services.wyoming.openwakeword.threshold}

Activation threshold (0.0-1.0), where higher means fewer activations.

See trigger level for the relationship between activations and
wake word detections.

*Type:* integer or floating point number between 0.0 and 1.0 (both inclusive)

*Default:* `0.5`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/openwakeword.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/openwakeword.nix)

## `services.wyoming.openwakeword.triggerLevel` {#opt-services.wyoming.openwakeword.triggerLevel}

Number of activations before a detection is registered.

A higher trigger level means fewer detections.

*Type:* unsigned integer, meaning \>=0

*Default:* `1`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/openwakeword.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/openwakeword.nix)

## `services.wyoming.openwakeword.uri` {#opt-services.wyoming.openwakeword.uri}

URI to bind the wyoming server to.

*Type:* string matching the pattern ^(tcp|unix)://.\*$

*Default:* `"tcp://0.0.0.0:10400"`

*Example:* `"tcp://192.0.2.1:5000"`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/openwakeword.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/openwakeword.nix)

## `services.wyoming.piper.package` {#opt-services.wyoming.piper.package}

The wyoming-piper package to use.

*Type:* package

*Default:* `pkgs.wyoming-piper`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/piper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/piper.nix)

## `services.wyoming.piper.servers` {#opt-services.wyoming.piper.servers}

Attribute set of wyoming-piper instances to spawn.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/piper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/piper.nix)

## `services.wyoming.piper.servers.<name>.enable` {#opt-services.wyoming.piper.servers._name_.enable}

Whether to enable Wyoming Piper server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/piper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/piper.nix)

## `services.wyoming.piper.servers.<name>.extraArgs` {#opt-services.wyoming.piper.servers._name_.extraArgs}

Extra arguments to pass to the server commandline.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/piper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/piper.nix)

## `services.wyoming.piper.servers.<name>.lengthScale` {#opt-services.wyoming.piper.servers._name_.lengthScale}

Phoneme length value.

*Type:* floating point number

*Default:* `1.0`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/piper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/piper.nix)

## `services.wyoming.piper.servers.<name>.noiseScale` {#opt-services.wyoming.piper.servers._name_.noiseScale}

Generator noise value.

*Type:* floating point number

*Default:* `0.667`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/piper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/piper.nix)

## `services.wyoming.piper.servers.<name>.noiseWidth` {#opt-services.wyoming.piper.servers._name_.noiseWidth}

Phoneme width noise value.

*Type:* floating point number

*Default:* `0.333`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/piper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/piper.nix)

## `services.wyoming.piper.servers.<name>.speaker` {#opt-services.wyoming.piper.servers._name_.speaker}

ID of a specific speaker in a multi-speaker model.

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/piper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/piper.nix)

## `services.wyoming.piper.servers.<name>.uri` {#opt-services.wyoming.piper.servers._name_.uri}

URI to bind the wyoming server to.

*Type:* string matching the pattern ^(tcp|unix)://.\*$

*Example:* `"tcp://0.0.0.0:10200"`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/piper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/piper.nix)

## `services.wyoming.piper.servers.<name>.useCUDA` {#opt-services.wyoming.piper.servers._name_.useCUDA}

Whether to accelerate the underlying onnxruntime library with CUDA.

*Type:* boolean

*Default:* `pkgs.config.cudaSupport`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/piper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/piper.nix)

## `services.wyoming.piper.servers.<name>.voice` {#opt-services.wyoming.piper.servers._name_.voice}

Name of the voice model to use. See the following website for samples:
https://rhasspy.github.io/piper-samples/

*Type:* string

*Example:* `"en-us-ryan-medium"`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/piper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/piper.nix)

## `services.wyoming.piper.servers.<name>.zeroconf.enable` {#opt-services.wyoming.piper.servers._name_.zeroconf.enable}

Whether to enable zeroconf discovery.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/piper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/piper.nix)

## `services.wyoming.piper.servers.<name>.zeroconf.name` {#opt-services.wyoming.piper.servers._name_.zeroconf.name}

The advertised name for zeroconf discovery.

*Type:* string

*Default:* `"piper-‹name›"`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/piper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/piper.nix)

## `services.wyoming.satellite.area` {#opt-services.wyoming.satellite.area}

Area to the satellite.

*Type:* null or string

*Default:* `null`

*Example:* `"Kitchen"`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/satellite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/satellite.nix)

## `services.wyoming.satellite.enable` {#opt-services.wyoming.satellite.enable}

Whether to enable Wyoming Satellite.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/satellite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/satellite.nix)

## `services.wyoming.satellite.extraArgs` {#opt-services.wyoming.satellite.extraArgs}

Extra arguments to pass to the executable.

Check `wyoming-satellite --help` for possible options.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/satellite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/satellite.nix)

## `services.wyoming.satellite.group` {#opt-services.wyoming.satellite.group}

Group to run wyoming-satellite under.

*Type:* string

*Default:* `"users"`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/satellite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/satellite.nix)

## `services.wyoming.satellite.microphone.autoGain` {#opt-services.wyoming.satellite.microphone.autoGain}

Automatic gain control in dbFS, with 31 being the loudest value. Set to 0 to disable.

*Type:* integer between 0 and 31 (both inclusive)

*Default:* `5`

*Example:* `15`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/satellite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/satellite.nix)

## `services.wyoming.satellite.microphone.command` {#opt-services.wyoming.satellite.microphone.command}

Program to run for audio input.

*Type:* string

*Default:* `"arecord -r 16000 -c 1 -f S16_LE -t raw"`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/satellite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/satellite.nix)

## `services.wyoming.satellite.microphone.noiseSuppression` {#opt-services.wyoming.satellite.microphone.noiseSuppression}

Noise suppression level with 4 being the maximum suppression,
which may cause audio distortion. Set to 0 to disable.

*Type:* integer between 0 and 4 (both inclusive)

*Default:* `2`

*Example:* `3`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/satellite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/satellite.nix)

## `services.wyoming.satellite.name` {#opt-services.wyoming.satellite.name}

Name of the satellite.

*Type:* string

*Default:*

``` nix
config.networking.hostName
```

*Declared by:* [`nixos/modules/services/home-automation/wyoming/satellite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/satellite.nix)

## `services.wyoming.satellite.package` {#opt-services.wyoming.satellite.package}

The wyoming-satellite package to use.

*Type:* package

*Default:* `pkgs.wyoming-satellite`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/satellite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/satellite.nix)

## `services.wyoming.satellite.sound.command` {#opt-services.wyoming.satellite.sound.command}

Program to run for sound output.

*Type:* null or string

*Default:* `"aplay -r 22050 -c 1 -f S16_LE -t raw"`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/satellite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/satellite.nix)

## `services.wyoming.satellite.sounds.awake` {#opt-services.wyoming.satellite.sounds.awake}

Path to audio file in WAV format to play when wake word is detected.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/satellite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/satellite.nix)

## `services.wyoming.satellite.sounds.done` {#opt-services.wyoming.satellite.sounds.done}

Path to audio file in WAV format to play when voice command recording has ended.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/satellite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/satellite.nix)

## `services.wyoming.satellite.uri` {#opt-services.wyoming.satellite.uri}

URI where wyoming-satellite will bind its socket.

*Type:* string

*Default:* `"tcp://0.0.0.0:10700"`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/satellite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/satellite.nix)

## `services.wyoming.satellite.user` {#opt-services.wyoming.satellite.user}

User to run wyoming-satellite under.

*Type:* string

*Example:* `"alice"`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/satellite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/satellite.nix)

## `services.wyoming.satellite.vad.enable` {#opt-services.wyoming.satellite.vad.enable}

Whether to enable voice activity detection.

Enabling will result in only streaming audio, when speech gets
detected.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/home-automation/wyoming/satellite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/wyoming/satellite.nix)
