# services (L) {#sec-options-services-l}

## `services.labgrid.coordinator.bindAddress` {#opt-services.labgrid.coordinator.bindAddress}

Bind address for the labgrid coordinator.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/development/labgrid/coordinator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/labgrid/coordinator.nix)

## `services.labgrid.coordinator.debug` {#opt-services.labgrid.coordinator.debug}

Whether to enable debug mode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/development/labgrid/coordinator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/labgrid/coordinator.nix)

## `services.labgrid.coordinator.enable` {#opt-services.labgrid.coordinator.enable}

Whether to enable Labgrid Coordinator.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/development/labgrid/coordinator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/labgrid/coordinator.nix)

## `services.labgrid.coordinator.openFirewall` {#opt-services.labgrid.coordinator.openFirewall}

Whether to automatically open the coordinator listen port in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/development/labgrid/coordinator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/labgrid/coordinator.nix)

## `services.labgrid.coordinator.package` {#opt-services.labgrid.coordinator.package}

The labgrid package to use.

*Type:* package

*Default:* `pkgs.python3Packages.labgrid`

*Declared by:* [`nixos/modules/services/development/labgrid/coordinator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/labgrid/coordinator.nix)

## `services.labgrid.coordinator.port` {#opt-services.labgrid.coordinator.port}

Coordinator port to bind to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `20408`

*Declared by:* [`nixos/modules/services/development/labgrid/coordinator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/labgrid/coordinator.nix)

## `services.lact.enable` {#opt-services.lact.enable}

Whether to enable LACT, a tool for monitoring, configuring and overclocking GPUs.

::: note
If you are on an AMD GPU, it is recommended to enable overdrive mode by using
`hardware.amdgpu.overdrive.enable = true;` in your configuration.
See [LACT wiki](<https://github.com/ilya-zlobintsev/LACT/wiki/Overclocking-(AMD)>) for more information.
:::

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/lact.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/lact.nix)

## `services.lact.package` {#opt-services.lact.package}

The lact package to use.

*Type:* package

*Default:* `pkgs.lact`

*Declared by:* [`nixos/modules/services/hardware/lact.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/lact.nix)

## `services.lact.settings` {#opt-services.lact.settings}

Settings for LACT.

The easiest method of acquiring the settings is to delete
`/etc/lact/config.yaml`, enter your settings and look
at the file.

::: note
When `settings` is populated, the config file will be a symbolic link
and thus LACT daemon will not be able to modify it through the GUI.
:::

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/hardware/lact.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/lact.nix)

## `services.lambdabot.enable` {#opt-services.lambdabot.enable}

Enable the Lambdabot IRC bot

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/lambdabot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lambdabot.nix)

## `services.lambdabot.package` {#opt-services.lambdabot.package}

The lambdabot package to use.

*Type:* package

*Default:* `pkgs.lambdabot`

*Declared by:* [`nixos/modules/services/networking/lambdabot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lambdabot.nix)

## `services.lambdabot.script` {#opt-services.lambdabot.script}

Lambdabot script

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/lambdabot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lambdabot.nix)

## `services.languagetool.allowOrigin` {#opt-services.languagetool.allowOrigin}

Set the Access-Control-Allow-Origin header in the HTTP response,
used for direct (non-proxy) JavaScript-based access from browsers.
`"*"` to allow access from all sites.

*Type:* null or string

*Default:* `null`

*Example:* `"https://my-website.org"`

*Declared by:* [`nixos/modules/services/misc/languagetool.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/languagetool.nix)

## `services.languagetool.enable` {#opt-services.languagetool.enable}

Whether to enable the LanguageTool server, a multilingual spelling, style, and grammar checker that helps correct or paraphrase texts.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/languagetool.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/languagetool.nix)

## `services.languagetool.jvmOptions` {#opt-services.languagetool.jvmOptions}

Extra command line options for the JVM running languagetool.
More information can be found here: [https://docs.oracle.com/en/java/javase/19/docs/specs/man/java.html#standard-options-for-java](https://docs.oracle.com/en/java/javase/19/docs/specs/man/java.html#standard-options-for-java)

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-Xmx512m"
]
```

*Declared by:* [`nixos/modules/services/misc/languagetool.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/languagetool.nix)

## `services.languagetool.package` {#opt-services.languagetool.package}

The languagetool package to use.

*Type:* package

*Default:* `pkgs.languagetool`

*Declared by:* [`nixos/modules/services/misc/languagetool.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/languagetool.nix)

## `services.languagetool.port` {#opt-services.languagetool.port}

Port on which LanguageTool listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8081`

*Example:* `8081`

*Declared by:* [`nixos/modules/services/misc/languagetool.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/languagetool.nix)

## `services.languagetool.public` {#opt-services.languagetool.public}

Whether to enable access from anywhere (rather than just localhost).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/languagetool.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/languagetool.nix)

## `services.languagetool.settings` {#opt-services.languagetool.settings}

Configuration file options for LanguageTool, see
'languagetool-http-server --help'
for supported settings.

*Type:* open submodule of attribute set of (string, package, bool, int or float)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/languagetool.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/languagetool.nix)

## `services.languagetool.settings.cacheSize` {#opt-services.languagetool.settings.cacheSize}

Number of sentences cached.

*Type:* unsigned integer, meaning \>=0

*Default:* `1000`

*Declared by:* [`nixos/modules/services/misc/languagetool.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/languagetool.nix)

## `services.lanraragi.enable` {#opt-services.lanraragi.enable}

Whether to enable LANraragi.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/lanraragi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lanraragi.nix)

## `services.lanraragi.openFirewall` {#opt-services.lanraragi.openFirewall}

Open ports in the firewall for LANraragi's web interface.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/lanraragi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lanraragi.nix)

## `services.lanraragi.package` {#opt-services.lanraragi.package}

The lanraragi package to use.

*Type:* package

*Default:* `pkgs.lanraragi`

*Declared by:* [`nixos/modules/services/web-apps/lanraragi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lanraragi.nix)

## `services.lanraragi.passwordFile` {#opt-services.lanraragi.passwordFile}

A file containing the password for LANraragi's admin interface.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/lanraragi-password"`

*Declared by:* [`nixos/modules/services/web-apps/lanraragi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lanraragi.nix)

## `services.lanraragi.port` {#opt-services.lanraragi.port}

Port for LANraragi's web interface.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/web-apps/lanraragi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lanraragi.nix)

## `services.lanraragi.redis.passwordFile` {#opt-services.lanraragi.redis.passwordFile}

A file containing the password for LANraragi's Redis server.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/redis-lanraragi-password"`

*Declared by:* [`nixos/modules/services/web-apps/lanraragi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lanraragi.nix)

## `services.lanraragi.redis.port` {#opt-services.lanraragi.redis.port}

Port for LANraragi's Redis server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6379`

*Declared by:* [`nixos/modules/services/web-apps/lanraragi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lanraragi.nix)

## `services.lasuite-docs.backendPackage` {#opt-services.lasuite-docs.backendPackage}

The lasuite-docs package to use.

*Type:* package

*Default:* `pkgs.lasuite-docs`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.bind` {#opt-services.lasuite-docs.bind}

The path, host/port or file descriptior to bind the gunicorn socket to.

See  [https://docs.gunicorn.org/en/stable/settings.html#bind](https://docs.gunicorn.org/en/stable/settings.html#bind) for possible options.

*Type:* string

*Default:* `"unix:/run/lasuite-docs/gunicorn.sock"`

*Example:* `"127.0.0.1:8000"`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.celery.extraArgs` {#opt-services.lasuite-docs.celery.extraArgs}

Extra arguments to pass to the celery process.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.collaborationServer.enable` {#opt-services.lasuite-docs.collaborationServer.enable}

Whether to enable legacy collaboration server.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.collaborationServer.package` {#opt-services.lasuite-docs.collaborationServer.package}

The lasuite-docs-collaboration-server package to use.

*Type:* package

*Default:* `pkgs.lasuite-docs-collaboration-server`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.collaborationServer.port` {#opt-services.lasuite-docs.collaborationServer.port}

Port used by the collaboration server to listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4444`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.collaborationServer.settings` {#opt-services.lasuite-docs.collaborationServer.settings}

Configuration options of collaboration server.

See [https://github.com/suitenumerique/docs/blob/v6.1.0/docs/env.md](https://github.com/suitenumerique/docs/blob/v6.1.0/docs/env.md)

*Type:* open submodule of attribute set of (string or boolean)

*Default:* `{ }`

*Example:*

``` nix
''
  {
    COLLABORATION_LOGGING = true;
  }
''
```

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.collaborationServer.settings.COLLABORATION_BACKEND_BASE_URL` {#opt-services.lasuite-docs.collaborationServer.settings.COLLABORATION_BACKEND_BASE_URL}

URL to the backend server base

*Type:* string

*Default:* `https://${cfg.domain}`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.collaborationServer.settings.COLLABORATION_SERVER_ORIGIN` {#opt-services.lasuite-docs.collaborationServer.settings.COLLABORATION_SERVER_ORIGIN}

Origins allowed to connect to the collaboration server

*Type:* string

*Default:* `https://${cfg.domain}`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.collaborationServer.settings.PORT` {#opt-services.lasuite-docs.collaborationServer.settings.PORT}

Port used by collaboration server to listen to

*Type:* string

*Default:* `"4444"`

*Read only*

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.domain` {#opt-services.lasuite-docs.domain}

Domain name of the docs instance.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.enable` {#opt-services.lasuite-docs.enable}

Whether to enable SuiteNumérique Docs.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.enableNginx` {#opt-services.lasuite-docs.enableNginx}

Whether to enable enable and configure Nginx for reverse proxying.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.environmentFile` {#opt-services.lasuite-docs.environmentFile}

Path to environment file.

This can be useful to pass secrets to docs via tools like `agenix` or `sops`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.frontendPackage` {#opt-services.lasuite-docs.frontendPackage}

The lasuite-docs-frontend package to use.

*Type:* package

*Default:* `pkgs.lasuite-docs-frontend`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.gunicorn.extraArgs` {#opt-services.lasuite-docs.gunicorn.extraArgs}

Extra arguments to pass to the gunicorn process.

*Type:* list of string

*Default:*

``` nix
[
  "--name=impress"
  "--workers=3"
]
```

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.postgresql.createLocally` {#opt-services.lasuite-docs.postgresql.createLocally}

Configure local PostgreSQL database server for docs.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.redis.createLocally` {#opt-services.lasuite-docs.redis.createLocally}

Configure local Redis cache server for docs.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.redis.port` {#opt-services.lasuite-docs.redis.port}

Port for the Redis instance of LaSuite docs.

Please note that yhub uses `@redis/client@v5` which doesn't suport UDS.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `26379`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.s3Url` {#opt-services.lasuite-docs.s3Url}

URL of the S3 bucket.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.secretKeyPath` {#opt-services.lasuite-docs.secretKeyPath}

Path to the Django secret key.

The key can be generated using:

```
python3 -c 'import secrets; print(secrets.token_hex())'
```

If not set, the secret key will be automatically generated.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.settings` {#opt-services.lasuite-docs.settings}

Configuration options of docs.

See [https://github.com/suitenumerique/docs/blob/v6.1.0/docs/env.md](https://github.com/suitenumerique/docs/blob/v6.1.0/docs/env.md)

`REDIS_URL` and `CELERY_BROKER_URL` are set if `services.lasuite-docs.redis.createLocally` is true.
`DB_HOST` is set if `services.lasuite-docs.postgresql.createLocally` is true.

*Type:* open submodule of attribute set of (null or string or boolean or absolute path or signed integer)

*Default:* `{ }`

*Example:*

``` nix
''
  {
    DJANGO_ALLOWED_HOSTS = "*";
  }
''
```

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.settings.CELERY_BROKER_URL` {#opt-services.lasuite-docs.settings.CELERY_BROKER_URL}

URL of the redis backend for celery

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.settings.DATA_DIR` {#opt-services.lasuite-docs.settings.DATA_DIR}

Path to the data directory

*Type:* absolute path

*Default:* `"/var/lib/lasuite-docs"`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.settings.DB_HOST` {#opt-services.lasuite-docs.settings.DB_HOST}

Host of the database

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.settings.DB_NAME` {#opt-services.lasuite-docs.settings.DB_NAME}

Name of the database

*Type:* string

*Default:* `"lasuite-docs"`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.settings.DB_USER` {#opt-services.lasuite-docs.settings.DB_USER}

User of the database

*Type:* string

*Default:* `"lasuite-docs"`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.settings.DJANGO_ALLOWED_HOSTS` {#opt-services.lasuite-docs.settings.DJANGO_ALLOWED_HOSTS}

Comma-separated list of hosts that are able to connect to the server

*Type:* string

*Default:*

``` nix
if cfg.enableNginx then "localhost,127.0.0.1,${cfg.domain}" else ""
```

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.settings.DJANGO_SECRET_KEY_FILE` {#opt-services.lasuite-docs.settings.DJANGO_SECRET_KEY_FILE}

The path to the file containing Django's secret key

*Type:* absolute path

*Default:* `"/var/lib/lasuite-docs/django_secret_key"`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.settings.JWT_PRIVATE_KEY_FILE` {#opt-services.lasuite-docs.settings.JWT_PRIVATE_KEY_FILE}

Path to the RSA private key (PEM) the backend signs its calls to the collaboration server with.
Generated by `lasuite-docs-setup-keys.service`.

*Type:* absolute path not in the Nix store

*Default:* `"/var/lib/lasuite-docs/private.pem"`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.settings.REDIS_URL` {#opt-services.lasuite-docs.settings.REDIS_URL}

URL of the redis backend

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.settings.YHUB_API_BASE_URL` {#opt-services.lasuite-docs.settings.YHUB_API_BASE_URL}

Internal base URL for the Y collaboration server.

*Type:* string

*Default:* `http://localhost:${cfg.yhub.settings.PORT}`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.yhub.package` {#opt-services.lasuite-docs.yhub.package}

The lasuite-docs-yhub-server package to use.

*Type:* package

*Default:* `pkgs.lasuite-docs-yhub-server`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.yhub.settings` {#opt-services.lasuite-docs.yhub.settings}

Settings passed as environment variables to the Y collaboration server.
By default, the migration mode from the old collaboration-server is enabled.
To turn it off, set `SOFT_MIGRATION = false;` and disable the migration
service by also setting [services (L)](#opt-services.lasuite-docs.collaborationServer.enable)
to `true`.

*Type:* open submodule of attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.yhub.settings.COLLABORATION_BACKEND_BASE_URL` {#opt-services.lasuite-docs.yhub.settings.COLLABORATION_BACKEND_BASE_URL}

URL to the backend server base

*Type:* string

*Default:* `https://${cfg.domain}`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.yhub.settings.COLLABORATION_SERVER_ORIGIN` {#opt-services.lasuite-docs.yhub.settings.COLLABORATION_SERVER_ORIGIN}

Origins allowed to connect to the collaboration server

*Type:* string

*Default:* `https://${cfg.domain}`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.yhub.settings.PORT` {#opt-services.lasuite-docs.yhub.settings.PORT}

Port of Yhub server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3002`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.yhub.settings.POSTGRES` {#opt-services.lasuite-docs.yhub.settings.POSTGRES}

Connection URL to PostgreSQL.
See the [upstream docs on the format](https://github.com/suitenumerique/docs/tree/v6.0.0/src/yhub-server#database-schema-yarn-init-db) for more information.
It's possible to override parameters of this URL via
[the supported environment variables](https://github.com/porsager/postgres/tree/v3.4.9#environmental-variables) of the client library.
This is e.g. necessary since the URL format doesn't support declaring a UNIX socket.

Set to an empty string if `services.lasuite-docs.postgresql.createLocally == true`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.yhub.settings.REDIS` {#opt-services.lasuite-docs.yhub.settings.REDIS}

URL of the redis backend

*Type:* null or string

*Default:*

``` nix
if config.services.lasuite-docs.redis.createLocally then
  "redis://${config.services.redis.servers.lasuite-docs.bind}:${toString config.services.redis.servers.lasuite-docs.port}/2"
else null
```

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.yhub.settings.SOFT_MIGRATION` {#opt-services.lasuite-docs.yhub.settings.SOFT_MIGRATION}

Whether we're in soft-migration mode where the old server is still used to import documents.
See [Upgrade guide to v6 for more details](https://github.com/suitenumerique/docs/blob/v6.0.0/UPGRADE.md).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-docs.yhub.settings.YHUB_JWT_PRIVATE_KEY_FILE` {#opt-services.lasuite-docs.yhub.settings.YHUB_JWT_PRIVATE_KEY_FILE}

Path to the RSA private key (PEM) yhub signs its calls to the backend with.
Generated by `lasuite-docs-yhub-server-setup-keys.service`.

*Type:* absolute path not in the Nix store

*Default:* `"/var/lib/lasuite-docs-yhub-server/private.pem"`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-docs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-docs.nix)

## `services.lasuite-drive.bind` {#opt-services.lasuite-drive.bind}

The path, host/port or file descriptior to bind the gunicorn socket to.

See  [https://docs.gunicorn.org/en/stable/settings.html#bind](https://docs.gunicorn.org/en/stable/settings.html#bind) for possible options.

*Type:* string

*Default:* `"unix:/run/lasuite-drive/gunicorn.sock"`

*Example:* `"127.0.0.1:8000"`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-drive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-drive.nix)

## `services.lasuite-drive.celery.extraArgs` {#opt-services.lasuite-drive.celery.extraArgs}

Extra arguments to pass to the celery process.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-drive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-drive.nix)

## `services.lasuite-drive.domain` {#opt-services.lasuite-drive.domain}

Domain name of the drive instance.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/lasuite-drive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-drive.nix)

## `services.lasuite-drive.enable` {#opt-services.lasuite-drive.enable}

Whether to enable SuiteNumérique Drive.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-drive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-drive.nix)

## `services.lasuite-drive.enableNginx` {#opt-services.lasuite-drive.enableNginx}

Whether to enable enable and configure Nginx for reverse proxying.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-drive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-drive.nix)

## `services.lasuite-drive.environmentFiles` {#opt-services.lasuite-drive.environmentFiles}

Path to environment files.

This can be useful to pass secrets to drive via tools like `agenix` or `sops`.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-drive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-drive.nix)

## `services.lasuite-drive.gunicorn.extraArgs` {#opt-services.lasuite-drive.gunicorn.extraArgs}

Extra arguments to pass to the gunicorn process.

*Type:* list of string

*Default:*

``` nix
[
  "--name=drive"
  "--workers=3"
]
```

*Declared by:* [`nixos/modules/services/web-apps/lasuite-drive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-drive.nix)

## `services.lasuite-drive.package` {#opt-services.lasuite-drive.package}

The lasuite-drive package to use.

*Type:* package

*Default:* `pkgs.lasuite-drive`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-drive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-drive.nix)

## `services.lasuite-drive.postgresql.createLocally` {#opt-services.lasuite-drive.postgresql.createLocally}

Configure local PostgreSQL database server for drive.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-drive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-drive.nix)

## `services.lasuite-drive.redis.createLocally` {#opt-services.lasuite-drive.redis.createLocally}

Configure local Redis cache server for drive.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-drive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-drive.nix)

## `services.lasuite-drive.s3Url` {#opt-services.lasuite-drive.s3Url}

URL of the S3 bucket.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/lasuite-drive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-drive.nix)

## `services.lasuite-drive.secretKeyPath` {#opt-services.lasuite-drive.secretKeyPath}

Path to the Django secret key.

The key can be generated using:

```
python3 -c 'import secrets; print(secrets.token_hex())'
```

::: note
If not specified, a secret key is automatically generated and stored in the state directory.
:::

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-drive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-drive.nix)

## `services.lasuite-drive.settings` {#opt-services.lasuite-drive.settings}

Configuration options of drive.

See [https://github.com/suitenumerique/drive/blob/v0.19.0/docs/env.md](https://github.com/suitenumerique/drive/blob/v0.19.0/docs/env.md)

`REDIS_URL` and `CELERY_BROKER_URL` are set if `services.lasuite-drive.redis.createLocally` is true.
`DB_HOST` is set if `services.lasuite-drive.postgresql.createLocally` is true.

*Type:* open submodule of attribute set of (null or string or boolean or absolute path or signed integer)

*Default:* `{ }`

*Example:*

``` nix
''
  {
    AWS_S3_ENDPOINT_URL = "https://s3.us-west.amazonaws.com";
  }
''
```

*Declared by:* [`nixos/modules/services/web-apps/lasuite-drive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-drive.nix)

## `services.lasuite-drive.settings.CELERY_BROKER_URL` {#opt-services.lasuite-drive.settings.CELERY_BROKER_URL}

URL of the redis backend for celery

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-drive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-drive.nix)

## `services.lasuite-drive.settings.DATA_DIR` {#opt-services.lasuite-drive.settings.DATA_DIR}

Path to the data directory

*Type:* absolute path

*Default:* `"/var/lib/lasuite-drive"`

*Read only*

*Declared by:* [`nixos/modules/services/web-apps/lasuite-drive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-drive.nix)

## `services.lasuite-drive.settings.DB_HOST` {#opt-services.lasuite-drive.settings.DB_HOST}

Host of the database

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-drive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-drive.nix)

## `services.lasuite-drive.settings.DB_NAME` {#opt-services.lasuite-drive.settings.DB_NAME}

Name of the database

*Type:* string

*Default:* `"lasuite-drive"`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-drive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-drive.nix)

## `services.lasuite-drive.settings.DB_USER` {#opt-services.lasuite-drive.settings.DB_USER}

User of the database

*Type:* string

*Default:* `"lasuite-drive"`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-drive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-drive.nix)

## `services.lasuite-drive.settings.DJANGO_ALLOWED_HOSTS` {#opt-services.lasuite-drive.settings.DJANGO_ALLOWED_HOSTS}

Comma-separated list of hosts that are able to connect to the server

*Type:* list of string

*Default:*

``` nix
if cfg.enableNginx then [ "localhost" "127.0.0.1" cfg.domain ] else [ ]
```

*Declared by:* [`nixos/modules/services/web-apps/lasuite-drive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-drive.nix)

## `services.lasuite-drive.settings.DJANGO_SECRET_KEY_FILE` {#opt-services.lasuite-drive.settings.DJANGO_SECRET_KEY_FILE}

The path to the file containing Django's secret key

*Type:* absolute path

*Default:* `"/var/lib/lasuite-drive/django_secret_key"`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-drive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-drive.nix)

## `services.lasuite-drive.settings.REDIS_URL` {#opt-services.lasuite-drive.settings.REDIS_URL}

URL of the redis backend

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-drive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-drive.nix)

## `services.lasuite-meet.addons` {#opt-services.lasuite-meet.addons}

Addons to use and configure

*Type:* list of value "outlook" (singular enum)

*Default:* `[ ]`

*Example:*

``` nix
''
  [
    "outlook"
  ]
''
```

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.bind` {#opt-services.lasuite-meet.bind}

The path, host/port or file descriptior to bind the gunicorn socket to.

See  [https://docs.gunicorn.org/en/stable/settings.html#bind](https://docs.gunicorn.org/en/stable/settings.html#bind) for possible options.

*Type:* string

*Default:* `"unix:/run/lasuite-meet/gunicorn.sock"`

*Example:* `"127.0.0.1:8000"`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.celery.extraArgs` {#opt-services.lasuite-meet.celery.extraArgs}

Extra arguments to pass to the celery process.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.domain` {#opt-services.lasuite-meet.domain}

Domain name of the meet instance.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.enable` {#opt-services.lasuite-meet.enable}

Whether to enable SuiteNumérique Meet.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.enableNginx` {#opt-services.lasuite-meet.enableNginx}

Whether to enable enable and configure Nginx for reverse proxying.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.environmentFile` {#opt-services.lasuite-meet.environmentFile}

Path to environment file.

This can be useful to pass secrets to meet via tools like `agenix` or `sops`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.gunicorn.extraArgs` {#opt-services.lasuite-meet.gunicorn.extraArgs}

Extra arguments to pass to the gunicorn process.

*Type:* list of string

*Default:*

``` nix
[
  "--name=meet"
  "--workers=3"
]
```

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.livekit.enable` {#opt-services.lasuite-meet.livekit.enable}

Whether to enable Configure local livekit server.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.livekit.keyFile` {#opt-services.lasuite-meet.livekit.keyFile}

LiveKit key file holding one or multiple application secrets.
Use `livekit-server generate-keys` to generate a random key name and secret.

The file should have the YAML format `<keyname>: <secret>`.
Example:
`lasuite-meet: f6lQGaHtM5HfgZjIcec3cOCRfiDqIine4CpZZnqdT5cE`

Individual key/secret pairs need to be passed to clients to connect to this instance.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.livekit.openFirewall` {#opt-services.lasuite-meet.livekit.openFirewall}

Whether to enable Open firewall ports for livekit.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.livekit.settings` {#opt-services.lasuite-meet.livekit.settings}

Settings to pass to the livekit server.

See `services.livekit.settings` for more details.

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.package` {#opt-services.lasuite-meet.package}

The lasuite-meet package to use.

*Type:* package

*Default:* `pkgs.lasuite-meet`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.postgresql.createLocally` {#opt-services.lasuite-meet.postgresql.createLocally}

Whether to enable Configure local PostgreSQL database server for meet.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.redis.createLocally` {#opt-services.lasuite-meet.redis.createLocally}

Whether to enable Configure local Redis cache server for meet.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.secretKeyPath` {#opt-services.lasuite-meet.secretKeyPath}

Path to the Django secret key.

The key can be generated using:

```
python3 -c 'import secrets; print(secrets.token_hex())'
```

If not set, the secret key will be automatically generated.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.settings` {#opt-services.lasuite-meet.settings}

Configuration options of meet.
See https://github.com/suitenumerique/meet/blob/v1.38.0/docs/env.md
`REDIS_URL` and `CELERY_BROKER_URL` are set if `services.lasuite-meet.redis.createLocally` is true.
`DB_NAME` `DB_USER` and `DB_HOST` are set if `services.lasuite-meet.postgresql.createLocally` is true.

*Type:* open submodule of lazy attribute set of (null or string or boolean or absolute path or signed integer)

*Default:* `{ }`

*Example:*

``` nix
''
  {
    DJANGO_ALLOWED_HOSTS = "*";
  }
''
```

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.settings.CELERY_BROKER_URL` {#opt-services.lasuite-meet.settings.CELERY_BROKER_URL}

URL of the redis backend for celery

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.settings.DB_HOST` {#opt-services.lasuite-meet.settings.DB_HOST}

Host of the database

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.settings.DB_NAME` {#opt-services.lasuite-meet.settings.DB_NAME}

Name of the database

*Type:* string

*Default:* `"lasuite-meet"`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.settings.DB_USER` {#opt-services.lasuite-meet.settings.DB_USER}

User of the database

*Type:* string

*Default:* `"lasuite-meet"`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.settings.DJANGO_ALLOWED_HOSTS` {#opt-services.lasuite-meet.settings.DJANGO_ALLOWED_HOSTS}

Comma-separated list of hosts that are able to connect to the server

*Type:* string

*Default:*

``` nix
if cfg.enableNginx then "localhost,127.0.0.1,${cfg.domain}" else ""
```

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.settings.DJANGO_DATA_DIR` {#opt-services.lasuite-meet.settings.DJANGO_DATA_DIR}

Path to the data directory

*Type:* absolute path

*Default:* `"/var/lib/lasuite-meet"`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.settings.DJANGO_SECRET_KEY_FILE` {#opt-services.lasuite-meet.settings.DJANGO_SECRET_KEY_FILE}

The path to the file containing Django's secret key

*Type:* absolute path

*Default:* `"/var/lib/lasuite-meet/django_secret_key"`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.settings.LIVEKIT_API_URL` {#opt-services.lasuite-meet.settings.LIVEKIT_API_URL}

URL to the livekit server

*Type:* null or string

*Default:*

``` nix
if cfg.enableNginx && cfg.livekit.enable then
  "http://$${cfg.domain}/livekit"
else
  null
```

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lasuite-meet.settings.REDIS_URL` {#opt-services.lasuite-meet.settings.REDIS_URL}

URL of the redis backend

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/lasuite-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lasuite-meet.nix)

## `services.lauti.dataDir` {#opt-services.lauti.dataDir}

Data directory for Lauti

*Type:* absolute path

*Default:* `"/var/lib/lauti"`

*Declared by:* [`nixos/modules/services/web-apps/lauti.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lauti.nix)

## `services.lauti.enable` {#opt-services.lauti.enable}

Whether to enable Lauti community event calendar web app.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/lauti.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lauti.nix)

## `services.lauti.secrets` {#opt-services.lauti.secrets}

A list of files containing the various secrets. Should be in the
format expected by systemd's `EnvironmentFile` directory.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/lauti.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lauti.nix)

## `services.lauti.settings` {#opt-services.lauti.settings}

Settings to configure web service. See
[https://codeberg.org/Klasse-Methode/lauti/src/branch/main/DEPLOYMENT.md](https://codeberg.org/Klasse-Methode/lauti/src/branch/main/DEPLOYMENT.md)
for available options.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  LAUTI_ADDR = ":1234";
  LAUTI_ADMIN_EMAIL = "admin@example.org";
  LAUTI_TIMEZONE = "Europe/Berlin";
}
```

*Declared by:* [`nixos/modules/services/web-apps/lauti.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lauti.nix)

## `services.lavalink.address` {#opt-services.lavalink.address}

The network address to bind to.

*Type:* string

*Default:* `"0.0.0.0"`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/audio/lavalink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/lavalink.nix)

## `services.lavalink.enable` {#opt-services.lavalink.enable}

Whether to enable Lavalink.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/lavalink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/lavalink.nix)

## `services.lavalink.enableHttp2` {#opt-services.lavalink.enableHttp2}

Whether to enable HTTP/2 support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/lavalink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/lavalink.nix)

## `services.lavalink.environmentFile` {#opt-services.lavalink.environmentFile}

Add custom environment variables from a file.
See [https://lavalink.dev/configuration/index.html#example-environment-variables](https://lavalink.dev/configuration/index.html#example-environment-variables) for the full documentation.

*Type:* null or string

*Default:* `null`

*Example:* `"/run/secrets/lavalink/passwordEnvFile"`

*Declared by:* [`nixos/modules/services/audio/lavalink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/lavalink.nix)

## `services.lavalink.extraConfig` {#opt-services.lavalink.extraConfig}

Configuration to write to `application.yml`.
See [https://lavalink.dev/configuration/#example-applicationyml](https://lavalink.dev/configuration/#example-applicationyml) for the full documentation.

Individual configuration parameters can be overwritten using environment variables.
See [https://lavalink.dev/configuration/#example-environment-variables](https://lavalink.dev/configuration/#example-environment-variables) for more information.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Example:*

``` nix
{
  lavalink.server = {
    sources.twitch = true;

    filters.volume = true;
  };

  logging.file.path = "./logs/";
}
```

*Declared by:* [`nixos/modules/services/audio/lavalink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/lavalink.nix)

## `services.lavalink.group` {#opt-services.lavalink.group}

The group of the service.

*Type:* string

*Default:* `"lavalink"`

*Example:* `"medias"`

*Declared by:* [`nixos/modules/services/audio/lavalink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/lavalink.nix)

## `services.lavalink.home` {#opt-services.lavalink.home}

The home directory for lavalink.

*Type:* string

*Default:* `"/var/lib/lavalink"`

*Example:* `"/home/lavalink"`

*Declared by:* [`nixos/modules/services/audio/lavalink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/lavalink.nix)

## `services.lavalink.jvmArgs` {#opt-services.lavalink.jvmArgs}

Set custom JVM arguments.

*Type:* string

*Default:* `"-Xmx4G"`

*Example:* `"-Djava.io.tmpdir=/var/lib/lavalink/tmp -Xmx6G"`

*Declared by:* [`nixos/modules/services/audio/lavalink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/lavalink.nix)

## `services.lavalink.openFirewall` {#opt-services.lavalink.openFirewall}

Whether to expose the port to the network.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/lavalink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/lavalink.nix)

## `services.lavalink.package` {#opt-services.lavalink.package}

The lavalink package to use.

*Type:* package

*Default:* `pkgs.lavalink`

*Declared by:* [`nixos/modules/services/audio/lavalink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/lavalink.nix)

## `services.lavalink.password` {#opt-services.lavalink.password}

The password for Lavalink's authentication in plain text.

*Type:* null or string

*Default:* `null`

*Example:* `"s3cRe!p4SsW0rD"`

*Declared by:* [`nixos/modules/services/audio/lavalink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/lavalink.nix)

## `services.lavalink.plugins` {#opt-services.lavalink.plugins}

A list of plugins for lavalink.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    dependency = "dev.lavalink.youtube:youtube-plugin:1.8.0";
    repository = "https://maven.lavalink.dev/snapshots";
    hash = lib.fakeHash;
    configName = "youtube";
    extraConfig = {
      enabled = true;
      allowSearch = true;
      allowDirectVideoIds = true;
      allowDirectPlaylistIds = true;
    };
  }
]
```

*Declared by:* [`nixos/modules/services/audio/lavalink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/lavalink.nix)

## `services.lavalink.plugins.*.configName` {#opt-services.lavalink.plugins._.configName}

The name of the plugin to use as the key for the plugin configuration.

*Type:* null or string

*Default:* `null`

*Example:* `"youtube"`

*Declared by:* [`nixos/modules/services/audio/lavalink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/lavalink.nix)

## `services.lavalink.plugins.*.dependency` {#opt-services.lavalink.plugins._.dependency}

The coordinates of the plugin.

*Type:* string

*Example:* `"dev.lavalink.youtube:youtube-plugin:1.8.0"`

*Declared by:* [`nixos/modules/services/audio/lavalink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/lavalink.nix)

## `services.lavalink.plugins.*.extraConfig` {#opt-services.lavalink.plugins._.extraConfig}

The configuration for the plugin.

The [`services.lavalink.plugins.*.configName`](#opt-services.lavalink.plugins._.configName) option must be set.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/audio/lavalink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/lavalink.nix)

## `services.lavalink.plugins.*.hash` {#opt-services.lavalink.plugins._.hash}

The hash of the plugin.

*Type:* string

*Example:* `"sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="`

*Declared by:* [`nixos/modules/services/audio/lavalink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/lavalink.nix)

## `services.lavalink.plugins.*.repository` {#opt-services.lavalink.plugins._.repository}

The plugin repository. Defaults to the lavalink releases repository.

To use the snapshots repository, use [https://maven.lavalink.dev/snapshots](https://maven.lavalink.dev/snapshots) instead

*Type:* string

*Default:* `"https://maven.lavalink.dev/releases"`

*Example:* `"https://maven.example.com/releases"`

*Declared by:* [`nixos/modules/services/audio/lavalink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/lavalink.nix)

## `services.lavalink.port` {#opt-services.lavalink.port}

The port that Lavalink will use.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `2333`

*Example:* `4567`

*Declared by:* [`nixos/modules/services/audio/lavalink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/lavalink.nix)

## `services.lavalink.user` {#opt-services.lavalink.user}

The user of the service.

*Type:* string

*Default:* `"lavalink"`

*Example:* `"root"`

*Declared by:* [`nixos/modules/services/audio/lavalink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/lavalink.nix)

## `services.leaps.address` {#opt-services.leaps.address}

Hostname or IP-address to listen to. By default it will listen on all interfaces.

*Type:* string

*Default:* `""`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/misc/leaps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/leaps.nix)

## `services.leaps.enable` {#opt-services.leaps.enable}

Whether to enable leaps, a pair programming service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/leaps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/leaps.nix)

## `services.leaps.path` {#opt-services.leaps.path}

Subdirectory used for reverse proxy setups

*Type:* absolute path

*Default:* `"/"`

*Declared by:* [`nixos/modules/services/misc/leaps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/leaps.nix)

## `services.leaps.port` {#opt-services.leaps.port}

A port where leaps listens for incoming http requests

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/misc/leaps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/leaps.nix)

## `services.legit.enable` {#opt-services.legit.enable}

Whether to enable legit git web frontend.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/legit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/legit.nix)

## `services.legit.group` {#opt-services.legit.group}

Group account under which legit runs.

*Type:* string

*Default:* `"legit"`

*Declared by:* [`nixos/modules/services/networking/legit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/legit.nix)

## `services.legit.package` {#opt-services.legit.package}

The legit-web package to use.

*Type:* package

*Default:* `pkgs.legit-web`

*Declared by:* [`nixos/modules/services/networking/legit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/legit.nix)

## `services.legit.settings` {#opt-services.legit.settings}

The primary legit configuration. See the
[sample configuration](https://github.com/icyphox/legit/blob/master/config.yaml)
for possible values.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/legit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/legit.nix)

## `services.legit.settings.dirs.static` {#opt-services.legit.settings.dirs.static}

Directories where static files are located.

*Type:* absolute path

*Default:* `"${config.services.legit.package}/lib/legit/static"`

*Declared by:* [`nixos/modules/services/networking/legit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/legit.nix)

## `services.legit.settings.dirs.templates` {#opt-services.legit.settings.dirs.templates}

Directories where template files are located.

*Type:* absolute path

*Default:* `"${config.services.legit.package}/lib/legit/templates"`

*Declared by:* [`nixos/modules/services/networking/legit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/legit.nix)

## `services.legit.settings.meta.description` {#opt-services.legit.settings.meta.description}

Website description.

*Type:* string

*Default:* `"git frontend"`

*Declared by:* [`nixos/modules/services/networking/legit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/legit.nix)

## `services.legit.settings.meta.title` {#opt-services.legit.settings.meta.title}

Website title.

*Type:* string

*Default:* `"legit"`

*Declared by:* [`nixos/modules/services/networking/legit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/legit.nix)

## `services.legit.settings.repo.ignore` {#opt-services.legit.settings.repo.ignore}

Repositories to ignore.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/legit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/legit.nix)

## `services.legit.settings.repo.mainBranch` {#opt-services.legit.settings.repo.mainBranch}

Main branch to look for.

*Type:* list of string

*Default:*

``` nix
[
  "main"
  "master"
]
```

*Declared by:* [`nixos/modules/services/networking/legit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/legit.nix)

## `services.legit.settings.repo.readme` {#opt-services.legit.settings.repo.readme}

Readme files to look for.

*Type:* list of string

*Default:*

``` nix
[
  "readme"
  "README"
  "readme.md"
  "README.md"
]
```

*Declared by:* [`nixos/modules/services/networking/legit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/legit.nix)

## `services.legit.settings.repo.scanPath` {#opt-services.legit.settings.repo.scanPath}

Directory where legit will scan for repositories.

*Type:* absolute path

*Default:* `"/var/lib/legit"`

*Declared by:* [`nixos/modules/services/networking/legit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/legit.nix)

## `services.legit.settings.server.host` {#opt-services.legit.settings.server.host}

Host address.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/legit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/legit.nix)

## `services.legit.settings.server.name` {#opt-services.legit.settings.server.name}

Server name.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/networking/legit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/legit.nix)

## `services.legit.settings.server.port` {#opt-services.legit.settings.server.port}

Legit port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5555`

*Declared by:* [`nixos/modules/services/networking/legit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/legit.nix)

## `services.legit.user` {#opt-services.legit.user}

User account under which legit runs.

*Type:* string

*Default:* `"legit"`

*Declared by:* [`nixos/modules/services/networking/legit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/legit.nix)

## `services.lemmy.adminPasswordFile` {#opt-services.lemmy.adminPasswordFile}

File which contains the value of `setup.admin_password`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/lemmy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lemmy.nix)

## `services.lemmy.caddy.enable` {#opt-services.lemmy.caddy.enable}

Whether to enable exposing Lemmy with the Caddy reverse proxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/lemmy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lemmy.nix)

## `services.lemmy.database.createLocally` {#opt-services.lemmy.database.createLocally}

Whether to enable creation of a local PostgreSQL database.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/lemmy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lemmy.nix)

## `services.lemmy.database.uri` {#opt-services.lemmy.database.uri}

The connection URI to use. Takes priority over the configuration file if set.

*Type:* null or string

*Default:* `null`

*Example:* `"postgres:///lemmy?host=/run/postgresql&user=lemmy"`

*Declared by:* [`nixos/modules/services/web-apps/lemmy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lemmy.nix)

## `services.lemmy.database.uriFile` {#opt-services.lemmy.database.uriFile}

File which contains the database uri.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/lemmy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lemmy.nix)

## `services.lemmy.enable` {#opt-services.lemmy.enable}

Whether to enable Lemmy, a federated alternative to Reddit.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/lemmy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lemmy.nix)

## `services.lemmy.nginx.enable` {#opt-services.lemmy.nginx.enable}

Whether to enable exposing Lemmy with the nginx reverse proxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/lemmy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lemmy.nix)

## `services.lemmy.pictrsApiKeyFile` {#opt-services.lemmy.pictrsApiKeyFile}

File which contains the value of `pictrs.api_key`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/lemmy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lemmy.nix)

## `services.lemmy.server.package` {#opt-services.lemmy.server.package}

The lemmy-server package to use.

*Type:* package

*Default:* `pkgs.lemmy-server`

*Declared by:* [`nixos/modules/services/web-apps/lemmy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lemmy.nix)

## `services.lemmy.settings` {#opt-services.lemmy.settings}

Lemmy configuration

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/lemmy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lemmy.nix)

## `services.lemmy.settings.captcha.difficulty` {#opt-services.lemmy.settings.captcha.difficulty}

Difficulty of the captcha to solve.

*Type:* one of "easy", "medium", "hard"

*Default:* `"medium"`

*Declared by:* [`nixos/modules/services/web-apps/lemmy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lemmy.nix)

## `services.lemmy.settings.captcha.enabled` {#opt-services.lemmy.settings.captcha.enabled}

Whether to enable captcha.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/lemmy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lemmy.nix)

## `services.lemmy.settings.hostname` {#opt-services.lemmy.settings.hostname}

Public domain name of the instance.

*Type:* string

*Example:* `"lemmy.ml"`

*Declared by:* [`nixos/modules/services/web-apps/lemmy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lemmy.nix)

## `services.lemmy.settings.port` {#opt-services.lemmy.settings.port}

Port where Lemmy should listen for incoming requests.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8536`

*Declared by:* [`nixos/modules/services/web-apps/lemmy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lemmy.nix)

## `services.lemmy.smtpPasswordFile` {#opt-services.lemmy.smtpPasswordFile}

File which contains the value of `email.smtp_password`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/lemmy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lemmy.nix)

## `services.lemmy.ui.package` {#opt-services.lemmy.ui.package}

The lemmy-ui package to use.

*Type:* package

*Default:* `pkgs.lemmy-ui`

*Declared by:* [`nixos/modules/services/web-apps/lemmy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lemmy.nix)

## `services.lemmy.ui.port` {#opt-services.lemmy.ui.port}

Port where lemmy-ui should listen for incoming requests.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1234`

*Declared by:* [`nixos/modules/services/web-apps/lemmy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lemmy.nix)

## `services.libeufin.bank.createLocalDatabase` {#opt-services.libeufin.bank.createLocalDatabase}

Whether to enable automatic creation of a local postgres database.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/finance/libeufin/bank.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/bank.nix)

## `services.libeufin.bank.debug` {#opt-services.libeufin.bank.debug}

Whether to enable debug logging.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/finance/libeufin/bank.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/bank.nix)

## `services.libeufin.bank.enable` {#opt-services.libeufin.bank.enable}

Whether to enable libeufin core banking system and web interface.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/finance/libeufin/bank.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/bank.nix)

## `services.libeufin.bank.initialAccounts` {#opt-services.libeufin.bank.initialAccounts}

Accounts to enable before the bank service starts.

This is mainly needed for the nexus currency conversion
since the exchange's bank account is expected to be already
registered.

Don't forget to change the account passwords afterwards.

*Type:* list of (attribute set)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/finance/libeufin/bank.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/bank.nix)

## `services.libeufin.bank.openFirewall` {#opt-services.libeufin.bank.openFirewall}

Whether to open ports in the firewall

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/finance/libeufin/bank.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/bank.nix)

## `services.libeufin.bank.package` {#opt-services.libeufin.bank.package}

The libeufin package to use.

*Type:* package

*Default:* `pkgs.libeufin`

*Declared by:* [`nixos/modules/services/finance/libeufin/bank.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/bank.nix)

## `services.libeufin.bank.settings` {#opt-services.libeufin.bank.settings}

Configuration options for the libeufin bank system config file.

For a list of all possible options, please see the man page [`libeufin-bank.conf(5)`](https://docs.taler.net/manpages/libeufin-bank.conf.5.html)

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Declared by:* [`nixos/modules/services/finance/libeufin/bank.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/bank.nix)

## `services.libeufin.bank.settings.libeufin-bank.CURRENCY` {#opt-services.libeufin.bank.settings.libeufin-bank.CURRENCY}

The currency under which the libeufin-bank should operate.

This defaults to the GNU taler module's currency for convenience
but if you run libeufin-bank separately from taler, you must set
this yourself.

*Type:* string

*Declared by:* [`nixos/modules/services/finance/libeufin/bank.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/bank.nix)

## `services.libeufin.bank.settings.libeufin-bank.PORT` {#opt-services.libeufin.bank.settings.libeufin-bank.PORT}

The port on which libeufin-bank should listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8082`

*Declared by:* [`nixos/modules/services/finance/libeufin/bank.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/bank.nix)

## `services.libeufin.bank.settings.libeufin-bank.SUGGESTED_WITHDRAWAL_EXCHANGE` {#opt-services.libeufin.bank.settings.libeufin-bank.SUGGESTED_WITHDRAWAL_EXCHANGE}

Exchange that is suggested to wallets when withdrawing.

Note that, in order for withdrawals to work, your libeufin-bank
must be able to communicate with and send money etc. to the bank
at which the exchange used for withdrawals has its bank account.

If you also have your own bank and taler exchange network, you
probably want to set one of your exchange's url here instead of
the demo exchange.

This setting must always be set in order for the Android app to
not crash during the withdrawal process but the exchange to be
used can always be changed in the app.

*Type:* string

*Default:* `"https://exchange.demo.taler.net/"`

*Declared by:* [`nixos/modules/services/finance/libeufin/bank.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/bank.nix)

## `services.libeufin.bank.settings.libeufin-bankdb-postgres.CONFIG` {#opt-services.libeufin.bank.settings.libeufin-bankdb-postgres.CONFIG}

The database connection string for the libeufin-bank database.

*Type:* string

*Declared by:* [`nixos/modules/services/finance/libeufin/bank.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/bank.nix)

## `services.libeufin.nexus.createLocalDatabase` {#opt-services.libeufin.nexus.createLocalDatabase}

Whether to enable automatic creation of a local postgres database.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/finance/libeufin/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/nexus.nix)

## `services.libeufin.nexus.debug` {#opt-services.libeufin.nexus.debug}

Whether to enable debug logging.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/finance/libeufin/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/nexus.nix)

## `services.libeufin.nexus.enable` {#opt-services.libeufin.nexus.enable}

Whether to enable libeufin core banking system and web interface.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/finance/libeufin/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/nexus.nix)

## `services.libeufin.nexus.openFirewall` {#opt-services.libeufin.nexus.openFirewall}

Whether to open ports in the firewall

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/finance/libeufin/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/nexus.nix)

## `services.libeufin.nexus.package` {#opt-services.libeufin.nexus.package}

The libeufin package to use.

*Type:* package

*Default:* `pkgs.libeufin`

*Declared by:* [`nixos/modules/services/finance/libeufin/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/nexus.nix)

## `services.libeufin.nexus.settings` {#opt-services.libeufin.nexus.settings}

Configuration options for the libeufin nexus config file.

For a list of all possible options, please see the man page [`libeufin-nexus.conf(5)`](https://docs.taler.net/manpages/libeufin-nexus.conf.5.html)

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Declared by:* [`nixos/modules/services/finance/libeufin/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/nexus.nix)

## `services.libeufin.nexus.settings.libeufin-nexusdb-postgres.CONFIG` {#opt-services.libeufin.nexus.settings.libeufin-nexusdb-postgres.CONFIG}

The database connection string for the libeufin-nexus database.

*Type:* string

*Declared by:* [`nixos/modules/services/finance/libeufin/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/nexus.nix)

## `services.libeufin.nexus.settings.nexus-ebics.BANK_DIALECT` {#opt-services.libeufin.nexus.settings.nexus-ebics.BANK_DIALECT}

Name of the following combination: EBICS version and ISO20022
recommendations that Nexus would honor in the communication with the
bank.

Currently only the "postfinance" or "gls" value is supported.

*Type:* one of "postfinance", "gls"

*Example:* `"postfinance"`

*Declared by:* [`nixos/modules/services/finance/libeufin/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/nexus.nix)

## `services.libeufin.nexus.settings.nexus-ebics.BANK_PUBLIC_KEYS_FILE` {#opt-services.libeufin.nexus.settings.nexus-ebics.BANK_PUBLIC_KEYS_FILE}

Filesystem location where Nexus should store the bank public keys.

*Type:* absolute path

*Default:* `"/var/lib/libeufin-nexus/bank-ebics-keys.json"`

*Declared by:* [`nixos/modules/services/finance/libeufin/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/nexus.nix)

## `services.libeufin.nexus.settings.nexus-ebics.BIC` {#opt-services.libeufin.nexus.settings.nexus-ebics.BIC}

BIC of the bank account that is associated with the EBICS subscriber.

*Type:* non-empty string

*Example:* `"POFICHBEXXX"`

*Declared by:* [`nixos/modules/services/finance/libeufin/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/nexus.nix)

## `services.libeufin.nexus.settings.nexus-ebics.CLIENT_PRIVATE_KEYS_FILE` {#opt-services.libeufin.nexus.settings.nexus-ebics.CLIENT_PRIVATE_KEYS_FILE}

Filesystem location where Nexus should store the subscriber private keys.

*Type:* absolute path

*Default:* `"/var/lib/libeufin-nexus/client-ebics-keys.json"`

*Declared by:* [`nixos/modules/services/finance/libeufin/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/nexus.nix)

## `services.libeufin.nexus.settings.nexus-ebics.CURRENCY` {#opt-services.libeufin.nexus.settings.nexus-ebics.CURRENCY}

Name of the fiat currency.

*Type:* non-empty string

*Example:* `"CHF"`

*Declared by:* [`nixos/modules/services/finance/libeufin/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/nexus.nix)

## `services.libeufin.nexus.settings.nexus-ebics.HOST_BASE_URL` {#opt-services.libeufin.nexus.settings.nexus-ebics.HOST_BASE_URL}

URL of the EBICS server.

*Type:* non-empty string

*Example:* `"https://ebics.postfinance.ch/ebics/ebics.aspx"`

*Declared by:* [`nixos/modules/services/finance/libeufin/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/nexus.nix)

## `services.libeufin.nexus.settings.nexus-ebics.HOST_ID` {#opt-services.libeufin.nexus.settings.nexus-ebics.HOST_ID}

Name of the EBICS host.

*Type:* non-empty string

*Example:* `"PFEBICS"`

*Declared by:* [`nixos/modules/services/finance/libeufin/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/nexus.nix)

## `services.libeufin.nexus.settings.nexus-ebics.IBAN` {#opt-services.libeufin.nexus.settings.nexus-ebics.IBAN}

IBAN of the bank account that is associated with the EBICS subscriber.

*Type:* non-empty string

*Example:* `"CH7789144474425692816"`

*Declared by:* [`nixos/modules/services/finance/libeufin/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/nexus.nix)

## `services.libeufin.nexus.settings.nexus-ebics.NAME` {#opt-services.libeufin.nexus.settings.nexus-ebics.NAME}

Legal entity that is associated with the EBICS subscriber.

*Type:* non-empty string

*Example:* `"John Smith S.A."`

*Declared by:* [`nixos/modules/services/finance/libeufin/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/nexus.nix)

## `services.libeufin.nexus.settings.nexus-ebics.PARTNER_ID` {#opt-services.libeufin.nexus.settings.nexus-ebics.PARTNER_ID}

Partner ID of the EBICS subscriber.

This value must be assigned by the bank after having activated a new EBICS subscriber.

*Type:* non-empty string

*Example:* `"PFC00563"`

*Declared by:* [`nixos/modules/services/finance/libeufin/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/nexus.nix)

## `services.libeufin.nexus.settings.nexus-ebics.USER_ID` {#opt-services.libeufin.nexus.settings.nexus-ebics.USER_ID}

User ID of the EBICS subscriber.

This value must be assigned by the bank after having activated a new EBICS subscriber.

*Type:* non-empty string

*Example:* `"PFC00563"`

*Declared by:* [`nixos/modules/services/finance/libeufin/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/nexus.nix)

## `services.libeufin.nexus.settings.nexus-httpd.PORT` {#opt-services.libeufin.nexus.settings.nexus-httpd.PORT}

The port on which libeufin-bank should listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8084`

*Declared by:* [`nixos/modules/services/finance/libeufin/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/nexus.nix)

## `services.libeufin.settings` {#opt-services.libeufin.settings}

Global configuration options for the libeufin bank system config file.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/finance/libeufin/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/libeufin/module.nix)

## `services.libinput.enable` {#opt-services.libinput.enable}

Whether to enable libinput.

*Type:* boolean

*Default:* `config.services.xserver.enable`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.accelPointsFallback` {#opt-services.libinput.mouse.accelPointsFallback}

Sets the points of the fallback acceleration function. The value must be a list of
floating point non-negative numbers. This only applies to the custom profile.

*Type:* null or (list of (signed integer or floating point number))

*Default:* `null`

*Example:*

``` nix
[
  0.0
  1.0
  2.4
  2.5
]
```

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.accelPointsMotion` {#opt-services.libinput.mouse.accelPointsMotion}

Sets the points of the (pointer) motion acceleration function. The value must be a
list of floating point non-negative numbers. This only applies to the custom profile.

*Type:* null or (list of (signed integer or floating point number))

*Default:* `null`

*Example:*

``` nix
[
  0.0
  1.0
  2.4
  2.5
]
```

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.accelPointsScroll` {#opt-services.libinput.mouse.accelPointsScroll}

Sets the points of the scroll acceleration function. The value must be a list of
floating point non-negative numbers. This only applies to the custom profile.

*Type:* null or (list of (signed integer or floating point number))

*Default:* `null`

*Example:*

``` nix
[
  0.0
  1.0
  2.4
  2.5
]
```

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.accelProfile` {#opt-services.libinput.mouse.accelProfile}

Sets the pointer acceleration profile to the given profile.
Permitted values are `adaptive`, `flat`, `custom`.
Not all devices support this option or all profiles.
If a profile is unsupported, the default profile for this is used.
`flat`: Pointer motion is accelerated by a constant
(device-specific) factor, depending on the current speed.
`adaptive`: Pointer acceleration depends on the input speed.
This is the default profile for most devices.
`custom`: Allows the user to define a custom acceleration function.
To define custom functions use the accelPoints\<Fallback/Motion/Scroll\>
and accelStep\<Fallback/Motion/Scroll\> options.

*Type:* one of "flat", "adaptive", "custom"

*Default:* `"adaptive"`

*Example:* `"flat"`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.accelSpeed` {#opt-services.libinput.mouse.accelSpeed}

Cursor acceleration (how fast speed increases from minSpeed to maxSpeed).
This only applies to the flat or adaptive profile.

*Type:* null or string

*Default:* `null`

*Example:* `"-0.5"`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.accelStepFallback` {#opt-services.libinput.mouse.accelStepFallback}

Sets the step between the points of the fallback acceleration function. When a step of
0.0 is provided, libinput's Fallback acceleration function is used. This only applies
to the custom profile.

*Type:* null or signed integer or floating point number

*Default:* `null`

*Example:* `0.1`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.accelStepMotion` {#opt-services.libinput.mouse.accelStepMotion}

Sets the step between the points of the (pointer) motion acceleration function. When a
step of 0.0 is provided, libinput's Fallback acceleration function is used. This only
applies to the custom profile.

*Type:* null or signed integer or floating point number

*Default:* `null`

*Example:* `0.1`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.accelStepScroll` {#opt-services.libinput.mouse.accelStepScroll}

Sets the step between the points of the scroll acceleration function. When a step of
0.0 is provided, libinput's Fallback acceleration function is used. This only applies
to the custom profile.

*Type:* null or signed integer or floating point number

*Default:* `null`

*Example:* `0.1`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.additionalOptions` {#opt-services.libinput.mouse.additionalOptions}

Additional options for libinput mouse driver. See
`libinput(4)`
for available options.";

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  Option "DragLockButtons" "L1 B1 L2 B2"
''
```

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.buttonMapping` {#opt-services.libinput.mouse.buttonMapping}

Sets the logical button mapping for this device, see `XSetPointerMapping(3)`. The string  must
be  a  space-separated  list  of  button mappings in the order of the logical buttons on the
device, starting with button 1.  The default mapping is "1 2 3 ... 32". A mapping of 0 deac‐
tivates the button. Multiple buttons can have the same mapping.  Invalid mapping strings are
discarded and the default mapping is used for all buttons.  Buttons  not  specified  in  the
user's mapping use the default mapping. See section BUTTON MAPPING for more details.

*Type:* null or string

*Default:* `null`

*Example:* `"1 6 3 4 5 0 7"`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.calibrationMatrix` {#opt-services.libinput.mouse.calibrationMatrix}

A string of 9 space-separated floating point numbers. Sets the calibration matrix to the
3x3 matrix where the first row is (abc), the second row is (def) and the third row is (ghi).

*Type:* null or string

*Default:* `null`

*Example:* `"0.5 0 0 0 0.8 0.1 0 0 1"`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.clickMethod` {#opt-services.libinput.mouse.clickMethod}

Enables a click method. Permitted values are `none`,
`buttonareas`, `clickfinger`.
Not all devices support all methods, if an option is unsupported,
the default click method for this device is used.

*Type:* null or one of "none", "buttonareas", "clickfinger"

*Default:* `null`

*Example:* `"buttonareas"`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.dev` {#opt-services.libinput.mouse.dev}

Path for mouse device.  Set to `null` to apply to any
auto-detected mouse.

*Type:* null or string

*Default:* `null`

*Example:* `"/dev/input/event0"`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.disableWhileTyping` {#opt-services.libinput.mouse.disableWhileTyping}

Disable input method while typing.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.horizontalScrolling` {#opt-services.libinput.mouse.horizontalScrolling}

Enables or disables horizontal scrolling. When disabled, this driver will discard any
horizontal scroll events from libinput. This does not disable horizontal scroll events
from libinput; it merely discards the horizontal axis from any scroll events.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.leftHanded` {#opt-services.libinput.mouse.leftHanded}

Enables left-handed button orientation, i.e. swapping left and right buttons.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.middleEmulation` {#opt-services.libinput.mouse.middleEmulation}

Enables middle button emulation. When enabled, pressing the left and right buttons
simultaneously produces a middle mouse button click.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.naturalScrolling` {#opt-services.libinput.mouse.naturalScrolling}

Enables or disables natural scrolling behavior.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.scrollButton` {#opt-services.libinput.mouse.scrollButton}

Designates a button as scroll button. If the ScrollMethod is button and the button is logically
held down, x/y axis movement is converted into scroll events.

*Type:* null or signed integer

*Default:* `null`

*Example:* `1`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.scrollMethod` {#opt-services.libinput.mouse.scrollMethod}

Specify the scrolling method: `twofinger`, `edge`,
`button`, or `none`

*Type:* one of "twofinger", "edge", "button", "none"

*Default:* `"twofinger"`

*Example:* `"edge"`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.sendEventsMode` {#opt-services.libinput.mouse.sendEventsMode}

Sets the send events mode to `disabled`, `enabled`,
or `disabled-on-external-mouse`

*Type:* one of "disabled", "enabled", "disabled-on-external-mouse"

*Default:* `"enabled"`

*Example:* `"disabled"`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.tapping` {#opt-services.libinput.mouse.tapping}

Enables or disables tap-to-click behavior.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.tappingButtonMap` {#opt-services.libinput.mouse.tappingButtonMap}

Set the button mapping for 1/2/3-finger taps to left/right/middle or left/middle/right, respectively.

*Type:* null or one of "lrm", "lmr"

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.tappingDragLock` {#opt-services.libinput.mouse.tappingDragLock}

Enables or disables drag lock during tapping behavior. When enabled, a finger up during tap-
and-drag will not immediately release the button. If the finger is set down again within the
timeout, the dragging process continues.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.mouse.transformationMatrix` {#opt-services.libinput.mouse.transformationMatrix}

A string of 9 space-separated floating point numbers. Sets the transformation matrix to
the 3x3 matrix where the first row is (abc), the second row is (def) and the third row is (ghi).

*Type:* null or string

*Default:* `null`

*Example:* `"0.5 0 0 0 0.8 0.1 0 0 1"`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.accelPointsFallback` {#opt-services.libinput.touchpad.accelPointsFallback}

Sets the points of the fallback acceleration function. The value must be a list of
floating point non-negative numbers. This only applies to the custom profile.

*Type:* null or (list of (signed integer or floating point number))

*Default:* `null`

*Example:*

``` nix
[
  0.0
  1.0
  2.4
  2.5
]
```

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.accelPointsMotion` {#opt-services.libinput.touchpad.accelPointsMotion}

Sets the points of the (pointer) motion acceleration function. The value must be a
list of floating point non-negative numbers. This only applies to the custom profile.

*Type:* null or (list of (signed integer or floating point number))

*Default:* `null`

*Example:*

``` nix
[
  0.0
  1.0
  2.4
  2.5
]
```

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.accelPointsScroll` {#opt-services.libinput.touchpad.accelPointsScroll}

Sets the points of the scroll acceleration function. The value must be a list of
floating point non-negative numbers. This only applies to the custom profile.

*Type:* null or (list of (signed integer or floating point number))

*Default:* `null`

*Example:*

``` nix
[
  0.0
  1.0
  2.4
  2.5
]
```

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.accelProfile` {#opt-services.libinput.touchpad.accelProfile}

Sets the pointer acceleration profile to the given profile.
Permitted values are `adaptive`, `flat`, `custom`.
Not all devices support this option or all profiles.
If a profile is unsupported, the default profile for this is used.
`flat`: Pointer motion is accelerated by a constant
(device-specific) factor, depending on the current speed.
`adaptive`: Pointer acceleration depends on the input speed.
This is the default profile for most devices.
`custom`: Allows the user to define a custom acceleration function.
To define custom functions use the accelPoints\<Fallback/Motion/Scroll\>
and accelStep\<Fallback/Motion/Scroll\> options.

*Type:* one of "flat", "adaptive", "custom"

*Default:* `"adaptive"`

*Example:* `"flat"`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.accelSpeed` {#opt-services.libinput.touchpad.accelSpeed}

Cursor acceleration (how fast speed increases from minSpeed to maxSpeed).
This only applies to the flat or adaptive profile.

*Type:* null or string

*Default:* `null`

*Example:* `"-0.5"`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.accelStepFallback` {#opt-services.libinput.touchpad.accelStepFallback}

Sets the step between the points of the fallback acceleration function. When a step of
0.0 is provided, libinput's Fallback acceleration function is used. This only applies
to the custom profile.

*Type:* null or signed integer or floating point number

*Default:* `null`

*Example:* `0.1`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.accelStepMotion` {#opt-services.libinput.touchpad.accelStepMotion}

Sets the step between the points of the (pointer) motion acceleration function. When a
step of 0.0 is provided, libinput's Fallback acceleration function is used. This only
applies to the custom profile.

*Type:* null or signed integer or floating point number

*Default:* `null`

*Example:* `0.1`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.accelStepScroll` {#opt-services.libinput.touchpad.accelStepScroll}

Sets the step between the points of the scroll acceleration function. When a step of
0.0 is provided, libinput's Fallback acceleration function is used. This only applies
to the custom profile.

*Type:* null or signed integer or floating point number

*Default:* `null`

*Example:* `0.1`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.additionalOptions` {#opt-services.libinput.touchpad.additionalOptions}

Additional options for libinput touchpad driver. See
`libinput(4)`
for available options.";

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  Option "DragLockButtons" "L1 B1 L2 B2"
''
```

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.buttonMapping` {#opt-services.libinput.touchpad.buttonMapping}

Sets the logical button mapping for this device, see `XSetPointerMapping(3)`. The string  must
be  a  space-separated  list  of  button mappings in the order of the logical buttons on the
device, starting with button 1.  The default mapping is "1 2 3 ... 32". A mapping of 0 deac‐
tivates the button. Multiple buttons can have the same mapping.  Invalid mapping strings are
discarded and the default mapping is used for all buttons.  Buttons  not  specified  in  the
user's mapping use the default mapping. See section BUTTON MAPPING for more details.

*Type:* null or string

*Default:* `null`

*Example:* `"1 6 3 4 5 0 7"`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.calibrationMatrix` {#opt-services.libinput.touchpad.calibrationMatrix}

A string of 9 space-separated floating point numbers. Sets the calibration matrix to the
3x3 matrix where the first row is (abc), the second row is (def) and the third row is (ghi).

*Type:* null or string

*Default:* `null`

*Example:* `"0.5 0 0 0 0.8 0.1 0 0 1"`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.clickMethod` {#opt-services.libinput.touchpad.clickMethod}

Enables a click method. Permitted values are `none`,
`buttonareas`, `clickfinger`.
Not all devices support all methods, if an option is unsupported,
the default click method for this device is used.

*Type:* null or one of "none", "buttonareas", "clickfinger"

*Default:* `null`

*Example:* `"buttonareas"`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.dev` {#opt-services.libinput.touchpad.dev}

Path for touchpad device.  Set to `null` to apply to any
auto-detected touchpad.

*Type:* null or string

*Default:* `null`

*Example:* `"/dev/input/event0"`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.disableWhileTyping` {#opt-services.libinput.touchpad.disableWhileTyping}

Disable input method while typing.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.horizontalScrolling` {#opt-services.libinput.touchpad.horizontalScrolling}

Enables or disables horizontal scrolling. When disabled, this driver will discard any
horizontal scroll events from libinput. This does not disable horizontal scroll events
from libinput; it merely discards the horizontal axis from any scroll events.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.leftHanded` {#opt-services.libinput.touchpad.leftHanded}

Enables left-handed button orientation, i.e. swapping left and right buttons.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.middleEmulation` {#opt-services.libinput.touchpad.middleEmulation}

Enables middle button emulation. When enabled, pressing the left and right buttons
simultaneously produces a middle mouse button click.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.naturalScrolling` {#opt-services.libinput.touchpad.naturalScrolling}

Enables or disables natural scrolling behavior.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.scrollButton` {#opt-services.libinput.touchpad.scrollButton}

Designates a button as scroll button. If the ScrollMethod is button and the button is logically
held down, x/y axis movement is converted into scroll events.

*Type:* null or signed integer

*Default:* `null`

*Example:* `1`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.scrollMethod` {#opt-services.libinput.touchpad.scrollMethod}

Specify the scrolling method: `twofinger`, `edge`,
`button`, or `none`

*Type:* one of "twofinger", "edge", "button", "none"

*Default:* `"twofinger"`

*Example:* `"edge"`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.sendEventsMode` {#opt-services.libinput.touchpad.sendEventsMode}

Sets the send events mode to `disabled`, `enabled`,
or `disabled-on-external-mouse`

*Type:* one of "disabled", "enabled", "disabled-on-external-mouse"

*Default:* `"enabled"`

*Example:* `"disabled"`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.tapping` {#opt-services.libinput.touchpad.tapping}

Enables or disables tap-to-click behavior.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.tappingButtonMap` {#opt-services.libinput.touchpad.tappingButtonMap}

Set the button mapping for 1/2/3-finger taps to left/right/middle or left/middle/right, respectively.

*Type:* null or one of "lrm", "lmr"

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.tappingDragLock` {#opt-services.libinput.touchpad.tappingDragLock}

Enables or disables drag lock during tapping behavior. When enabled, a finger up during tap-
and-drag will not immediately release the button. If the finger is set down again within the
timeout, the dragging process continues.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.libinput.touchpad.transformationMatrix` {#opt-services.libinput.touchpad.transformationMatrix}

A string of 9 space-separated floating point numbers. Sets the transformation matrix to
the 3x3 matrix where the first row is (abc), the second row is (def) and the third row is (ghi).

*Type:* null or string

*Default:* `null`

*Example:* `"0.5 0 0 0 0.8 0.1 0 0 1"`

*Declared by:* [`nixos/modules/services/hardware/libinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/libinput.nix)

## `services.librechat.credentials` {#opt-services.librechat.credentials}

Environment variables which are loaded from the contents of files at a file paths, mainly used for secrets.
See [LibreChat environment variables](https://www.librechat.ai/docs/configuration/dotenv).
Alternatively you can use `services.librechat.credentialsFile` to define all the variables in a single file.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
{
  CREDS_KEY = "/run/secrets/creds_key";
}
```

*Declared by:* [`nixos/modules/services/web-apps/librechat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librechat.nix)

## `services.librechat.credentialsFile` {#opt-services.librechat.credentialsFile}

Path to a file that contains environment variables.
See [LibreChat environment variables](https://www.librechat.ai/docs/configuration/dotenv).

Example content of the file:

```
CREDS_KEY=6d6deb03cdfb27ea454f6b9ddd42494bdce4af25d50d8aee454ddce583690cc5
```

Alternatively you can use `services.librechat.credentials` to define the value of each variable in a separate file.

*Type:* null or absolute path

*Default:* `"/dev/null"`

*Example:* `"/run/secrets/librechat"`

*Declared by:* [`nixos/modules/services/web-apps/librechat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librechat.nix)

## `services.librechat.dataDir` {#opt-services.librechat.dataDir}

Absolute path for where the LibreChat server will use as its data directory to store logs, user uploads, and generated images.

*Type:* absolute path

*Default:* `"/var/lib/librechat"`

*Example:* `"/persist/librechat"`

*Declared by:* [`nixos/modules/services/web-apps/librechat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librechat.nix)

## `services.librechat.enable` {#opt-services.librechat.enable}

Whether to enable the LibreChat server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/librechat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librechat.nix)

## `services.librechat.enableLocalDB` {#opt-services.librechat.enableLocalDB}

Whether to enable a local mongodb instance.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/librechat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librechat.nix)

## `services.librechat.env` {#opt-services.librechat.env}

Environment variables that will be set for the service.
See [LibreChat environment variables](https://www.librechat.ai/docs/configuration/dotenv).

*Type:* open submodule of attribute set of (string or absolute path or (string or signed integer convertible to it) or (string or floating point number convertible to it) or (string or 16 bit unsigned integer; between 0 and 65535 (both inclusive) convertible to it) or (string or boolean convertible to it))

*Example:*

``` nix
{
  ALLOW_REGISTRATION = true;
  CONSOLE_JSON_STRING_LENGTH = 255;
  HOST = "0.0.0.0";
  PORT = 2309;
}
```

*Declared by:* [`nixos/modules/services/web-apps/librechat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librechat.nix)

## `services.librechat.env.LIBRECHAT_LOG_DIR` {#opt-services.librechat.env.LIBRECHAT_LOG_DIR}

Logs will be saved into this directory.
By default it is relative to `services.librechat.dataDir`.

*Type:* string

*Default:* `/var/lib/librechat/logs`

*Declared by:* [`nixos/modules/services/web-apps/librechat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librechat.nix)

## `services.librechat.env.PORT` {#opt-services.librechat.env.PORT}

The value that will be passed to the PORT environment variable, telling LibreChat what to listen on.

*Type:* string or 16 bit unsigned integer; between 0 and 65535 (both inclusive) convertible to it

*Default:* `3080`

*Example:* `2309`

*Declared by:* [`nixos/modules/services/web-apps/librechat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librechat.nix)

## `services.librechat.group` {#opt-services.librechat.group}

The group to run the service as.

*Type:* string

*Default:* `"librechat"`

*Example:* `"users"`

*Declared by:* [`nixos/modules/services/web-apps/librechat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librechat.nix)

## `services.librechat.meilisearch` {#opt-services.librechat.meilisearch}

See [LibreChat search feature](https://www.librechat.ai/docs/features/search).

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/librechat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librechat.nix)

## `services.librechat.meilisearch.enable` {#opt-services.librechat.meilisearch.enable}

Whether to enable and configure Meilisearch locally for Librechat.
You will manually need to set `services.meilisearch.masterKeyFile`.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/librechat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librechat.nix)

## `services.librechat.openFirewall` {#opt-services.librechat.openFirewall}

Whether to open the port in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/librechat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librechat.nix)

## `services.librechat.package` {#opt-services.librechat.package}

The librechat package to use.

*Type:* package

*Default:* `pkgs.librechat`

*Declared by:* [`nixos/modules/services/web-apps/librechat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librechat.nix)

## `services.librechat.settings` {#opt-services.librechat.settings}

A free-form attribute set that will be written to librechat.yaml.
See the [LibreChat configuration options](https://www.librechat.ai/docs/configuration/librechat_yaml).
You can use environment variables by wrapping them in ${}. Take care to escape the $ character.

*Type:* open submodule of (YAML 1.1 value)

*Default:*

``` nix
{
  version = "1.2.1";
}
```

*Example:*

``` nix
{
  cache = true;
  endpoints = {
    custom = [
      {
        apiKey = "\${OPENROUTER_KEY}";
        baseURL = "https://openrouter.ai/api/v1";
        dropParams = [
          "stop"
        ];
        modelDisplayLabel = "OpenRouter";
        models = {
          default = [
            "meta-llama/llama-3-70b-instruct"
          ];
          fetch = true;
        };
        name = "OpenRouter";
        titleConvo = true;
        titleModule = "meta-llama/llama-3-70b-instruct";
      }
    ];
  };
  interface = {
    privacyPolicy = {
      externalUrl = "https://librechat.ai/privacy-policy";
      openNewTab = true;
    };
  };
  version = "1.2.1";
}
```

*Declared by:* [`nixos/modules/services/web-apps/librechat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librechat.nix)

## `services.librechat.user` {#opt-services.librechat.user}

The user to run the service as.

*Type:* string

*Default:* `"librechat"`

*Example:* `"alice"`

*Declared by:* [`nixos/modules/services/web-apps/librechat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librechat.nix)

## `services.librenms.dataDir` {#opt-services.librenms.dataDir}

Path of the LibreNMS state directory.

*Type:* absolute path

*Default:* `"/var/lib/librenms"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.database.createLocally` {#opt-services.librenms.database.createLocally}

Whether to create a local database automatically.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.database.database` {#opt-services.librenms.database.database}

Name of the database on the MySQL/MariaDB server.

*Type:* string

*Default:* `"librenms"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.database.host` {#opt-services.librenms.database.host}

Hostname or IP of the MySQL/MariaDB server.
Ignored if 'socket' is defined.

*Type:* unspecified value

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.database.passwordFile` {#opt-services.librenms.database.passwordFile}

A file containing the password for the user of the MySQL/MariaDB server.
Must be readable for the LibreNMS user.
Ignored if 'socket' is defined, mandatory otherwise.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/mysql.pass"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.database.port` {#opt-services.librenms.database.port}

Port of the MySQL/MariaDB server.
Ignored if 'socket' is defined.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3306`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.database.socket` {#opt-services.librenms.database.socket}

A unix socket to mysql, accessible by the librenms user.
Useful when mysql is on the localhost.

*Type:* null or string

*Default:* `null`

*Example:* `"/run/mysqld/mysqld.sock"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.database.username` {#opt-services.librenms.database.username}

Name of the user on the MySQL/MariaDB server.
Ignored if 'socket' is defined.

*Type:* string

*Default:* `"librenms"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.distributedPoller.distributedBilling` {#opt-services.librenms.distributedPoller.distributedBilling}

Enable distributed billing on this poller.

Note: according to [the docs](https://docs.librenms.org/Extensions/Distributed-Poller/#discovery),
billing should only be calculated on a single node per poller group. You can disable billing on
some nodes with the `services.librenms.enableLocalBilling` option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.distributedPoller.enable` {#opt-services.librenms.distributedPoller.enable}

Configure this LibreNMS instance as a [distributed poller](https://docs.librenms.org/Extensions/Distributed-Poller/).
This will disable all web features and just configure the poller features.
Use the `mysql` database of your main LibreNMS instance in the database settings.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.distributedPoller.group` {#opt-services.librenms.distributedPoller.group}

Group(s) of this poller.

*Type:* string

*Default:* `"0"`

*Example:* `"1,2"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.distributedPoller.memcachedHost` {#opt-services.librenms.distributedPoller.memcachedHost}

Hostname or IP of the `memcached` server.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.distributedPoller.memcachedPort` {#opt-services.librenms.distributedPoller.memcachedPort}

Port of the `memcached` server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `11211`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.distributedPoller.name` {#opt-services.librenms.distributedPoller.name}

Custom name of this poller.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.distributedPoller.rrdcachedHost` {#opt-services.librenms.distributedPoller.rrdcachedHost}

Hostname or IP of the `rrdcached` server.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.distributedPoller.rrdcachedPort` {#opt-services.librenms.distributedPoller.rrdcachedPort}

Port of the `memcached` server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `42217`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.enable` {#opt-services.librenms.enable}

Whether to enable LibreNMS network monitoring system.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.enableLocalBilling` {#opt-services.librenms.enableLocalBilling}

Enable billing Cron-Jobs on the local instance. Enabled by default, but you may disable it
on some nodes within a distributed poller setup. See [the docs](https://docs.librenms.org/Extensions/Distributed-Poller/#discovery)
for more informations about billing with distributed pollers.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.enableOneMinutePolling` {#opt-services.librenms.enableOneMinutePolling}

Enables the [1-Minute Polling](https://docs.librenms.org/Support/1-Minute-Polling/).
Changing this option will automatically convert your existing rrd files.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.environmentFile` {#opt-services.librenms.environmentFile}

File containing env-vars to be substituted into the final config. Useful for secrets.
Does not apply to settings defined in `extraConfig`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.extraConfig` {#opt-services.librenms.extraConfig}

Additional config for LibreNMS that will be appended to the `config.php`. See
[https://github.com/librenms/librenms/blob/master/misc/config\_definitions.json](https://github.com/librenms/librenms/blob/master/misc/config_definitions.json)
for possible options. Useful if you want to use PHP-Functions in your config.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.finalPackage` {#opt-services.librenms.finalPackage}

The final package used by the module. This is the package that has all overrides.

*Type:* package

*Default:* `package`

*Read only*

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.group` {#opt-services.librenms.group}

Name of the LibreNMS group.

*Type:* string

*Default:* `"librenms"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.hostname` {#opt-services.librenms.hostname}

The hostname to serve LibreNMS on.

*Type:* string

*Default:* `config.networking.fqdnOrHostName`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.logDir` {#opt-services.librenms.logDir}

Path of the LibreNMS logging directory.

*Type:* absolute path

*Default:* `"/var/log/librenms"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx` {#opt-services.librenms.nginx}

With this option, you can customize the nginx virtualHost settings.

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
{
  serverAliases = [
    "librenms.${config.networking.domain}"
  ];
  # To enable encryption and let let's encrypt take care of certificate
  forceSSL = true;
  enableACME = true;
  # To set the LibreNMS virtualHost as the default virtualHost;
  default = true;
}
```

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.acmeFallbackHost` {#opt-services.librenms.nginx.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.acmeRoot` {#opt-services.librenms.nginx.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.addSSL` {#opt-services.librenms.nginx.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.basicAuth` {#opt-services.librenms.nginx.basicAuth}

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

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.basicAuthFile` {#opt-services.librenms.nginx.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.default` {#opt-services.librenms.nginx.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.enableACME` {#opt-services.librenms.nginx.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.extraConfig` {#opt-services.librenms.nginx.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.forceSSL` {#opt-services.librenms.nginx.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.globalRedirect` {#opt-services.librenms.nginx.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.http2` {#opt-services.librenms.nginx.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.http3` {#opt-services.librenms.nginx.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.http3_hq` {#opt-services.librenms.nginx.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.kTLS` {#opt-services.librenms.nginx.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.listen` {#opt-services.librenms.nginx.listen}

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

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.listen.*.addr` {#opt-services.librenms.nginx.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.listen.*.extraParameters` {#opt-services.librenms.nginx.listen._.extraParameters}

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

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.listen.*.port` {#opt-services.librenms.nginx.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.listen.*.proxyProtocol` {#opt-services.librenms.nginx.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.listen.*.ssl` {#opt-services.librenms.nginx.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.listenAddresses` {#opt-services.librenms.nginx.listenAddresses}

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

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.locations` {#opt-services.librenms.nginx.locations}

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

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.locations.<name>.alias` {#opt-services.librenms.nginx.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.locations.<name>.basicAuth` {#opt-services.librenms.nginx.locations._name_.basicAuth}

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

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.locations.<name>.basicAuthFile` {#opt-services.librenms.nginx.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.locations.<name>.extraConfig` {#opt-services.librenms.nginx.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.locations.<name>.fastcgiParams` {#opt-services.librenms.nginx.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.locations.<name>.index` {#opt-services.librenms.nginx.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.locations.<name>.priority` {#opt-services.librenms.nginx.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.locations.<name>.proxyPass` {#opt-services.librenms.nginx.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.locations.<name>.proxyWebsockets` {#opt-services.librenms.nginx.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.locations.<name>.recommendedProxySettings` {#opt-services.librenms.nginx.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.locations.<name>.recommendedUwsgiSettings` {#opt-services.librenms.nginx.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.locations.<name>.return` {#opt-services.librenms.nginx.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.locations.<name>.root` {#opt-services.librenms.nginx.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.locations.<name>.tryFiles` {#opt-services.librenms.nginx.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.locations.<name>.useGrpcErrorPages` {#opt-services.librenms.nginx.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.locations.<name>.uwsgiPass` {#opt-services.librenms.nginx.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.onlySSL` {#opt-services.librenms.nginx.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.quic` {#opt-services.librenms.nginx.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.redirectCode` {#opt-services.librenms.nginx.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.rejectSSL` {#opt-services.librenms.nginx.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.reuseport` {#opt-services.librenms.nginx.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.root` {#opt-services.librenms.nginx.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.serverAliases` {#opt-services.librenms.nginx.serverAliases}

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

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.serverName` {#opt-services.librenms.nginx.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.sslCertificate` {#opt-services.librenms.nginx.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.sslCertificateKey` {#opt-services.librenms.nginx.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.sslTrustedCertificate` {#opt-services.librenms.nginx.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.nginx.useACMEHost` {#opt-services.librenms.nginx.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.package` {#opt-services.librenms.package}

The librenms package to use.

*Type:* package

*Default:* `pkgs.librenms`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.phpOptions` {#opt-services.librenms.phpOptions}

Options for PHP's php.ini file for librenms.

Please note that this option is *additive* on purpose while the
attribute values inside the default are option defaults: that means that

``` nix
{
  services.librenms.phpOptions."opcache.enable" = 1;
}
```

will override the `php.ini` option `opcache.enable` without discarding the rest of the defaults.

Overriding all of `phpOptions` can be done like this:

``` nix
{
  services.librenms.phpOptions = lib.mkForce {
    /* ... */
  };
}
```

*Type:* attribute set of (string or signed integer)

*Default:*

``` nix
{
  "date.timezone" = {
    _type = "literalExpression";
    text = "config.time.timeZone";
  };
  log_errors = "on";
  memory_limit = {
    _type = "literalExpression";
    text = "\${toString cfg.settings.php_memory_limit}M";
  };
  "opcache.enable" = {
    _type = "literalExpression";
    text = "1";
  };
  "opcache.memory_consumption" = {
    _type = "literalExpression";
    text = "256";
  };
  post_max_size = "100M";
  upload_max_filesize = "100M";
  zend_extension = {
    _type = "literalExpression";
    text = "opcache";
  };
}
```

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.pollerThreads` {#opt-services.librenms.pollerThreads}

Amount of threads of the cron-poller.

*Type:* signed integer

*Default:* `16`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.poolConfig` {#opt-services.librenms.poolConfig}

Options for the LibreNMS PHP pool. See the documentation on `php-fpm.conf`
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

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.settings` {#opt-services.librenms.settings}

Attrset of the LibreNMS configuration.
See [https://docs.librenms.org/Support/Configuration/](https://docs.librenms.org/Support/Configuration/) for reference.
All possible options are listed [here](https://github.com/librenms/librenms/blob/master/resources/definitions/config_definitions.json).
See [https://docs.librenms.org/Extensions/Authentication/](https://docs.librenms.org/Extensions/Authentication/) for setting other authentication methods.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Example:*

``` nix
{
  base_url = "/librenms/";
  top_devices = true;
  top_ports = false;
}
```

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.useDistributedPollers` {#opt-services.librenms.useDistributedPollers}

Enables [distributed pollers](https://docs.librenms.org/Extensions/Distributed-Poller/)
for this LibreNMS instance. This will enable a local `rrdcached` and `memcached` server.

To use this feature, make sure to configure your firewall that the distributed pollers
can reach the local `mysql`, `rrdcached` and `memcached` ports.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.librenms.user` {#opt-services.librenms.user}

Name of the LibreNMS user.

*Type:* string

*Default:* `"librenms"`

*Declared by:* [`nixos/modules/services/monitoring/librenms.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/librenms.nix)

## `services.libreqos.enable` {#opt-services.libreqos.enable}

Whether to enable LibreQoS, a traffic shaping and quality-of-experience management platform.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/libreqos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/libreqos.nix)

## `services.libreqos.openFirewall` {#opt-services.libreqos.openFirewall}

Whether to enable Whether to open the web UI port in the firewall.
See `services.libreqos.settings.webserver_listen`.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/libreqos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/libreqos.nix)

## `services.libreqos.package` {#opt-services.libreqos.package}

The libreqos package to use.

*Type:* package

*Default:* `pkgs.libreqos`

*Declared by:* [`nixos/modules/services/networking/libreqos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/libreqos.nix)

## `services.libreqos.settings` {#opt-services.libreqos.settings}

Rendered to `/etc/lqos.conf`.

See [example configuration](https://github.com/LibreQoE/LibreQoS/blob/main/src/lqos.example) for available options.
Exactly one of the `bridge` or `single_interface` sections must be set.

The shaping data files `network.json` and `ShapedDevices.csv` in `/var/lib/libreqos`
are mutable (optional) runtime data, normally managed through the web UI or a CRM integration.
Empty files are created if they are missing. To manage them declaratively instead, symlink them into place:

``` nix
systemd.tmpfiles.rules = [
  "L+ /var/lib/libreqos/network.json - - - - ${./network.json}"
  "L+ /var/lib/libreqos/ShapedDevices.csv - - - - ${./ShapedDevices.csv}"
];
```

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Example:*

``` nix
{
  bridge = {
    use_xdp_bridge = false;
    to_internet = "eth0";
    to_network = "eth1";
  };
  queues = {
    uplink_bandwidth_mbps = 1000;
    downlink_bandwidth_mbps = 1000;
  };
}
```

*Declared by:* [`nixos/modules/services/networking/libreqos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/libreqos.nix)

## `services.librespeed.domain` {#opt-services.librespeed.domain}

If not `null`, this will add an entry to `services.librespeed.servers` and
configure librespeed to use TLS.

*Type:* null or non-empty string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/librespeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librespeed.nix)

## `services.librespeed.downloadIPDB` {#opt-services.librespeed.downloadIPDB}

Whether to download the IP info database before starting librespeed.
Disable this if you want to use the Go implementation.

*Type:* boolean

*Default:* `!(config.services.librespeed.secrets ? "ipinfo_api_key")`

*Declared by:* [`nixos/modules/services/web-apps/librespeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librespeed.nix)

## `services.librespeed.enable` {#opt-services.librespeed.enable}

Whether to enable LibreSpeed server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/librespeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librespeed.nix)

## `services.librespeed.frontend.contactEmail` {#opt-services.librespeed.frontend.contactEmail}

Email address listed in the privacy policy.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/librespeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librespeed.nix)

## `services.librespeed.frontend.enable` {#opt-services.librespeed.frontend.enable}

Enables the LibreSpeed frontend and adds a nginx virtual host if
not explicitly disabled and `services.librespeed.domain` is not `null`.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/librespeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librespeed.nix)

## `services.librespeed.frontend.pageTitle` {#opt-services.librespeed.frontend.pageTitle}

Title of the webpage.

*Type:* string

*Default:* `"LibreSpeed"`

*Declared by:* [`nixos/modules/services/web-apps/librespeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librespeed.nix)

## `services.librespeed.frontend.servers` {#opt-services.librespeed.frontend.servers}

LibreSpeed servers that should appear in the server list.

*Type:* list of (submodule)

*Declared by:* [`nixos/modules/services/web-apps/librespeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librespeed.nix)

## `services.librespeed.frontend.servers.*.dlURL` {#opt-services.librespeed.frontend.servers._.dlURL}

URL path to download test on this server.
Append `.php` to the default value if the server uses the php implementation.

*Type:* non-empty string

*Default:* `"backend/garbage"`

*Declared by:* [`nixos/modules/services/web-apps/librespeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librespeed.nix)

## `services.librespeed.frontend.servers.*.getIpURL` {#opt-services.librespeed.frontend.servers._.getIpURL}

URL path to IP lookup on this server.
Append `.php` to the default value if the server uses the php implementation.

*Type:* non-empty string

*Default:* `"backend/getIP"`

*Declared by:* [`nixos/modules/services/web-apps/librespeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librespeed.nix)

## `services.librespeed.frontend.servers.*.name` {#opt-services.librespeed.frontend.servers._.name}

Name shown in the server list.

*Type:* non-empty string

*Declared by:* [`nixos/modules/services/web-apps/librespeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librespeed.nix)

## `services.librespeed.frontend.servers.*.pingURL` {#opt-services.librespeed.frontend.servers._.pingURL}

URL path to latency/jitter test on this server.
Append `.php` to the default value if the server uses the php implementation.

*Type:* non-empty string

*Default:* `"backend/empty"`

*Declared by:* [`nixos/modules/services/web-apps/librespeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librespeed.nix)

## `services.librespeed.frontend.servers.*.server` {#opt-services.librespeed.frontend.servers._.server}

URL to the server. You may use `//` instead of `http://` or `https://`.

*Type:* non-empty string

*Declared by:* [`nixos/modules/services/web-apps/librespeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librespeed.nix)

## `services.librespeed.frontend.servers.*.ulURL` {#opt-services.librespeed.frontend.servers._.ulURL}

URL path to upload test on this server.
Append `.php` to the default value if the server uses the php implementation.

*Type:* non-empty string

*Default:* `"backend/empty"`

*Declared by:* [`nixos/modules/services/web-apps/librespeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librespeed.nix)

## `services.librespeed.frontend.settings` {#opt-services.librespeed.frontend.settings}

Override default settings of the speedtest web client.
See [speedtest\_worker.js](https://github.com/librespeed/speedtest/blob/master/speedtest_worker.js#L39) for a list of possible values.

*Type:* null or (open submodule of attribute set of (boolean or signed integer or string or floating point number))

*Default:*

``` nix
{
  telemetry_level = "basic";
}
```

*Declared by:* [`nixos/modules/services/web-apps/librespeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librespeed.nix)

## `services.librespeed.frontend.useNginx` {#opt-services.librespeed.frontend.useNginx}

Configure nginx for the LibreSpeed frontend.
This will only create a virtual host for the frontend and won't proxy all requests because
the reported upload and download speeds are inaccurate if proxied.

*Type:* boolean

*Default:* `config.services.librespeed.domain != null`

*Declared by:* [`nixos/modules/services/web-apps/librespeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librespeed.nix)

## `services.librespeed.package` {#opt-services.librespeed.package}

The librespeed-rust package to use.

*Type:* package

*Default:* `pkgs.librespeed-rust`

*Declared by:* [`nixos/modules/services/web-apps/librespeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librespeed.nix)

## `services.librespeed.secrets` {#opt-services.librespeed.secrets}

Attribute set of filesystem paths.
The contents of the specified paths will be read at service start time and merged with the attributes provided in `settings`.

*Type:* null or (attribute set of absolute path not in the Nix store)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/librespeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librespeed.nix)

## `services.librespeed.settings` {#opt-services.librespeed.settings}

LibreSpeed configuration written as Nix expression.
All values set to `null` will be excluded from the evaluated config.
This is useful if you want to omit certain defaults when using a different LibreSpeed implementation.

See [github.com/librespeed](https://github.com/librespeed/speedtest-rust) for configuration help.

*Type:* null or (attribute set of (null or boolean or signed integer or string or package))

*Default:*

``` nix
{
  assets_path = if (config.services.librespeed.frontend.enable && !config.services.librespeed.frontend.useNginx) then
    librespeedAssets
  else
    pkgs.writeTextDir "index.html" "";

  bind_address = "::";
  listen_port = 8989;
  base_url = "backend";
  worker_threads = "auto";

  database_type = "none";
  database_file = "/var/lib/librespeed/speedtest.sqlite";

  # librespeed-rust will fail to start if the following config parameters are omitted.
  ipinfo_api_key = "";
  stats_password = "";

  redact_ip_addresses = false;
  result_image_theme = "light";

  enable_tls = config.services.librespeed.tlsCertificate != null && config.services.librespeed.tlsKey != null;
  tls_cert_file = lib.optionalString (config.services.librespeed.tlsCertificate != null) "/run/credentials/librespeed.service/cert.pem";
  tls_key_file = lib.optionalString (config.services.librespeed.tlsKey != null) "/run/credentials/librespeed.service/key.pem";
}
```

*Declared by:* [`nixos/modules/services/web-apps/librespeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librespeed.nix)

## `services.librespeed.tlsCertificate` {#opt-services.librespeed.tlsCertificate}

TLS certificate to use. Use together with `tlsKey`.

*Type:* null or non-empty string

*Default:* `lib.optionalString (config.services.librespeed.useACMEHost != null) "${config.security.acme.certs.${config.services.librespeed.useACMEHost}.directory}/cert.pem"`

*Declared by:* [`nixos/modules/services/web-apps/librespeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librespeed.nix)

## `services.librespeed.tlsKey` {#opt-services.librespeed.tlsKey}

TLS private key to use. Use together with `tlsCertificate`.

*Type:* null or non-empty string

*Default:* `lib.optionalString (config.services.librespeed.useACMEHost != null) "${config.security.acme.certs.${config.services.librespeed.useACMEHost}.directory}/key.pem"`

*Declared by:* [`nixos/modules/services/web-apps/librespeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librespeed.nix)

## `services.librespeed.useACMEHost` {#opt-services.librespeed.useACMEHost}

Use a certificate generated by the NixOS ACME module for the given host.
Note that this will not generate a new certificate - you will need to do so with `security.acme.certs`.

*Type:* null or non-empty string

*Default:* `null`

*Example:* `"speed.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/librespeed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/librespeed.nix)

## `services.libreswan.configSetup` {#opt-services.libreswan.configSetup}

Options to go in the 'config setup' section of the Libreswan IPsec configuration

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  protostack=netkey
  virtual_private=%v4:10.0.0.0/8,%v4:192.168.0.0/16,%v4:172.16.0.0/12,%v4:25.0.0.0/8,%v4:100.64.0.0/10,%v6:fd00::/8,%v6:fe80::/10
''
```

*Example:*

``` nix
''
  secretsfile=/root/ipsec.secrets
  protostack=netkey
  virtual_private=%v4:10.0.0.0/8,%v4:192.168.0.0/16,%v4:172.16.0.0/12,%v4:25.0.0.0/8,%v4:100.64.0.0/10,%v6:fd00::/8,%v6:fe80::/10
''
```

*Declared by:* [`nixos/modules/services/networking/libreswan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/libreswan.nix)

## `services.libreswan.connections` {#opt-services.libreswan.connections}

A set of connections to define for the Libreswan IPsec service

*Type:* attribute set of strings concatenated with "\\n"

*Default:* `{ }`

*Example:*

``` nix
{ myconnection = ''
    auto=add
    left=%defaultroute
    leftid=@user

    right=my.vpn.com

    ikev2=no
    ikelifetime=8h
  '';
}
```

*Declared by:* [`nixos/modules/services/networking/libreswan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/libreswan.nix)

## `services.libreswan.disableRedirects` {#opt-services.libreswan.disableRedirects}

Whether to disable send and accept redirects for all network interfaces.
See the Libreswan [
FAQ](https://libreswan.org/wiki/FAQ#Why_is_it_recommended_to_disable_send_redirects_in_.2Fproc.2Fsys.2Fnet_.3F) page for why this is recommended.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/libreswan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/libreswan.nix)

## `services.libreswan.enable` {#opt-services.libreswan.enable}

Whether to enable Libreswan IPsec service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/libreswan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/libreswan.nix)

## `services.libreswan.policies` {#opt-services.libreswan.policies}

A set of policies to apply to the IPsec connections.

::: note
The policy name must match the one of connection it needs to apply to.
:::

*Type:* attribute set of strings concatenated with "\\n"

*Default:* `{ }`

*Example:*

``` nix
{ private-or-clear = ''
    # Attempt opportunistic IPsec for the entire Internet
    0.0.0.0/0
    ::/0
  '';
}
```

*Declared by:* [`nixos/modules/services/networking/libreswan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/libreswan.nix)

## `services.libretranslate.configureNginx` {#opt-services.libretranslate.configureNginx}

Configure nginx as a reverse proxy for LibreTranslate.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/libretranslate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/libretranslate.nix)

## `services.libretranslate.dataDir` {#opt-services.libretranslate.dataDir}

The data directory.

*Type:* absolute path

*Default:* `"/var/lib/libretranslate"`

*Example:* `"/srv/data/libretranslate"`

*Declared by:* [`nixos/modules/services/web-apps/libretranslate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/libretranslate.nix)

## `services.libretranslate.disableWebUI` {#opt-services.libretranslate.disableWebUI}

Whether to disable the Web UI.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/libretranslate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/libretranslate.nix)

## `services.libretranslate.domain` {#opt-services.libretranslate.domain}

The domain serving your LibreTranslate instance.
Required for configure nginx as a reverse proxy.

*Type:* string

*Default:* `""`

*Example:* `"libretranslate.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/libretranslate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/libretranslate.nix)

## `services.libretranslate.enable` {#opt-services.libretranslate.enable}

Whether to enable LibreTranslate service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/libretranslate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/libretranslate.nix)

## `services.libretranslate.enableApiKeys` {#opt-services.libretranslate.enableApiKeys}

Whether to enable the API keys database.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/libretranslate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/libretranslate.nix)

## `services.libretranslate.extraArgs` {#opt-services.libretranslate.extraArgs}

Extra arguments passed to the LibreTranslate.

*Type:* attribute set of (null or boolean or string or signed integer or list of (boolean or string or signed integer))

*Default:* `{ }`

*Example:*

``` nix
{
  debug = true;
  disable-files-translation = true;
  url-prefix = "translate";
}
```

*Declared by:* [`nixos/modules/services/web-apps/libretranslate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/libretranslate.nix)

## `services.libretranslate.group` {#opt-services.libretranslate.group}

Group account under which libretranslate runs.

*Type:* string

*Default:* `"libretranslate"`

*Declared by:* [`nixos/modules/services/web-apps/libretranslate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/libretranslate.nix)

## `services.libretranslate.host` {#opt-services.libretranslate.host}

The address the application should listen on.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/libretranslate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/libretranslate.nix)

## `services.libretranslate.package` {#opt-services.libretranslate.package}

The libretranslate package to use.

*Type:* package

*Default:* `pkgs.libretranslate`

*Declared by:* [`nixos/modules/services/web-apps/libretranslate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/libretranslate.nix)

## `services.libretranslate.port` {#opt-services.libretranslate.port}

The the application should listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5000`

*Declared by:* [`nixos/modules/services/web-apps/libretranslate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/libretranslate.nix)

## `services.libretranslate.threads` {#opt-services.libretranslate.threads}

Set number of threads.

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Example:* `8`

*Declared by:* [`nixos/modules/services/web-apps/libretranslate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/libretranslate.nix)

## `services.libretranslate.updateModels` {#opt-services.libretranslate.updateModels}

Update language models at startup

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/libretranslate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/libretranslate.nix)

## `services.libretranslate.user` {#opt-services.libretranslate.user}

User account under which libretranslate runs.

*Type:* string

*Default:* `"libretranslate"`

*Declared by:* [`nixos/modules/services/web-apps/libretranslate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/libretranslate.nix)

## `services.libvirtd.autoSnapshot.calendar` {#opt-services.libvirtd.autoSnapshot.calendar}

When to create snapshots (systemd calendar format).
Default is 4:15 AM.

*Type:* string

*Default:* `"04:15:00"`

*Declared by:* [`nixos/modules/services/backup/libvirtd-autosnapshot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/libvirtd-autosnapshot.nix)

## `services.libvirtd.autoSnapshot.enable` {#opt-services.libvirtd.autoSnapshot.enable}

Whether to enable LibVirt VM snapshots.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/libvirtd-autosnapshot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/libvirtd-autosnapshot.nix)

## `services.libvirtd.autoSnapshot.keep` {#opt-services.libvirtd.autoSnapshot.keep}

Default number of snapshots to keep for VMs that don't specify a keep value.

*Type:* signed integer

*Default:* `2`

*Declared by:* [`nixos/modules/services/backup/libvirtd-autosnapshot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/libvirtd-autosnapshot.nix)

## `services.libvirtd.autoSnapshot.prefix` {#opt-services.libvirtd.autoSnapshot.prefix}

Prefix for automatic snapshot names.
This is used to identify and manage automatic snapshots
separately from manual ones.

*Type:* string

*Default:* `"autosnap"`

*Declared by:* [`nixos/modules/services/backup/libvirtd-autosnapshot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/libvirtd-autosnapshot.nix)

## `services.libvirtd.autoSnapshot.snapshotType` {#opt-services.libvirtd.autoSnapshot.snapshotType}

Type of snapshot to create (internal or external).

*Type:* one of "internal", "external"

*Default:* `"internal"`

*Declared by:* [`nixos/modules/services/backup/libvirtd-autosnapshot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/libvirtd-autosnapshot.nix)

## `services.libvirtd.autoSnapshot.vms` {#opt-services.libvirtd.autoSnapshot.vms}

If specified only the list of VMs will be snapshotted else all existing one. Each entry can be either:

- A string (VM name, uses default settings)
- An attribute set with VM configuration

*Type:* null or (list of (string or (submodule)))

*Default:* `null`

*Example:*

``` nix
[
  "myvm1"              # Uses defaults
  {
    name = "myvm2";
    keep = 30;         # Override retention
  }
]
```

*Declared by:* [`nixos/modules/services/backup/libvirtd-autosnapshot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/libvirtd-autosnapshot.nix)

## `services.lidarr.dataDir` {#opt-services.lidarr.dataDir}

The directory where Lidarr stores its data files.

*Type:* string

*Default:* `"/var/lib/lidarr/.config/Lidarr"`

*Declared by:* [`nixos/modules/services/misc/servarr/lidarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/lidarr.nix)

## `services.lidarr.enable` {#opt-services.lidarr.enable}

Whether to enable Lidarr, a Usenet/BitTorrent music downloader.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/servarr/lidarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/lidarr.nix)

## `services.lidarr.environmentFiles` {#opt-services.lidarr.environmentFiles}

Environment file to pass secret configuration values.
Each line must follow the `LIDARR__SECTION__KEY=value` pattern.
Please consult the documentation at the [wiki](https://wiki.servarr.com/useful-tools#using-environment-variables-for-config).

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/servarr/lidarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/lidarr.nix)

## `services.lidarr.group` {#opt-services.lidarr.group}

Group under which Lidarr runs.

*Type:* string

*Default:* `"lidarr"`

*Declared by:* [`nixos/modules/services/misc/servarr/lidarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/lidarr.nix)

## `services.lidarr.openFirewall` {#opt-services.lidarr.openFirewall}

Open ports in the firewall for Lidarr

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/servarr/lidarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/lidarr.nix)

## `services.lidarr.package` {#opt-services.lidarr.package}

The lidarr package to use.

*Type:* package

*Default:* `pkgs.lidarr`

*Declared by:* [`nixos/modules/services/misc/servarr/lidarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/lidarr.nix)

## `services.lidarr.settings` {#opt-services.lidarr.settings}

Attribute set of arbitrary config options.
Please consult the documentation at the [wiki](https://wiki.servarr.com/useful-tools#using-environment-variables-for-config).

WARNING: this configuration is stored in the world-readable Nix store!
For secrets use [services (L)](#opt-services.lidarr.environmentFiles).

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  update.mechanism = "internal";
  server = {
    urlbase = "localhost";
    port = 8686;
    bindaddress = "*";
  };
}
```

*Declared by:* [`nixos/modules/services/misc/servarr/lidarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/lidarr.nix)

## `services.lidarr.settings.log.analyticsEnabled` {#opt-services.lidarr.settings.log.analyticsEnabled}

Send Anonymous Usage Data

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/servarr/lidarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/lidarr.nix)

## `services.lidarr.settings.server.port` {#opt-services.lidarr.settings.server.port}

Port Number

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8686`

*Declared by:* [`nixos/modules/services/misc/servarr/lidarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/lidarr.nix)

## `services.lidarr.settings.update.automatically` {#opt-services.lidarr.settings.update.automatically}

Automatically download and install updates.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/servarr/lidarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/lidarr.nix)

## `services.lidarr.settings.update.mechanism` {#opt-services.lidarr.settings.update.mechanism}

which update mechanism to use

*Type:* null or one of "external", "builtIn", "script"

*Default:* `"external"`

*Declared by:* [`nixos/modules/services/misc/servarr/lidarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/lidarr.nix)

## `services.lidarr.user` {#opt-services.lidarr.user}

User account under which Lidarr runs.

*Type:* string

*Default:* `"lidarr"`

*Declared by:* [`nixos/modules/services/misc/servarr/lidarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/lidarr.nix)

## `services.lifecycled.awsRegion` {#opt-services.lifecycled.awsRegion}

The region used for accessing AWS services.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/lifecycled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/lifecycled.nix)

## `services.lifecycled.cloudwatchGroup` {#opt-services.lifecycled.cloudwatchGroup}

Write logs to a specific Cloudwatch Logs group.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/lifecycled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/lifecycled.nix)

## `services.lifecycled.cloudwatchStream` {#opt-services.lifecycled.cloudwatchStream}

Write logs to a specific Cloudwatch Logs stream. Defaults to the instance ID.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/lifecycled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/lifecycled.nix)

## `services.lifecycled.debug` {#opt-services.lifecycled.debug}

Enable debugging information.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/lifecycled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/lifecycled.nix)

## `services.lifecycled.enable` {#opt-services.lifecycled.enable}

Whether to enable lifecycled, a daemon for responding to AWS AutoScaling Lifecycle Hooks.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/lifecycled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/lifecycled.nix)

## `services.lifecycled.handler` {#opt-services.lifecycled.handler}

The script to invoke to handle events.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/misc/lifecycled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/lifecycled.nix)

## `services.lifecycled.instanceId` {#opt-services.lifecycled.instanceId}

The instance ID to listen for events for.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/lifecycled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/lifecycled.nix)

## `services.lifecycled.json` {#opt-services.lifecycled.json}

Enable JSON logging.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/lifecycled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/lifecycled.nix)

## `services.lifecycled.noSpot` {#opt-services.lifecycled.noSpot}

Disable the spot termination listener.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/lifecycled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/lifecycled.nix)

## `services.lifecycled.queueCleaner.enable` {#opt-services.lifecycled.queueCleaner.enable}

Whether to enable lifecycled-queue-cleaner.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/lifecycled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/lifecycled.nix)

## `services.lifecycled.queueCleaner.frequency` {#opt-services.lifecycled.queueCleaner.frequency}

How often to trigger the queue cleaner.

NOTE: This string should be a valid value for a systemd
timer's `OnCalendar` configuration. See
`systemd.timer(5)`
for more information.

*Type:* string

*Default:* `"hourly"`

*Declared by:* [`nixos/modules/services/misc/lifecycled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/lifecycled.nix)

## `services.lifecycled.queueCleaner.parallel` {#opt-services.lifecycled.queueCleaner.parallel}

The number of parallel deletes to run.

*Type:* unsigned integer, meaning \>=0

*Default:* `20`

*Declared by:* [`nixos/modules/services/misc/lifecycled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/lifecycled.nix)

## `services.lifecycled.snsTopic` {#opt-services.lifecycled.snsTopic}

The SNS topic that receives events.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/lifecycled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/lifecycled.nix)

## `services.lighthouse.beacon` {#opt-services.lighthouse.beacon}

Beacon node

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.beacon.address` {#opt-services.lighthouse.beacon.address}

Listen address of Beacon node.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.beacon.dataDir` {#opt-services.lighthouse.beacon.dataDir}

Directory where data will be stored. Each chain will be stored under it's own specific subdirectory.

*Type:* string

*Default:* `"/var/lib/lighthouse-beacon"`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.beacon.disableDepositContractSync` {#opt-services.lighthouse.beacon.disableDepositContractSync}

Explicitly disables syncing of deposit logs from the execution node.
This overrides any previous option that depends on it.
Useful if you intend to run a non-validating beacon node.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.beacon.enable` {#opt-services.lighthouse.beacon.enable}

Whether to enable Lightouse Beacon node.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.beacon.execution.address` {#opt-services.lighthouse.beacon.execution.address}

Listen address for the execution layer.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.beacon.execution.jwtPath` {#opt-services.lighthouse.beacon.execution.jwtPath}

Path for the jwt secret required to connect to the execution layer.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.beacon.execution.port` {#opt-services.lighthouse.beacon.execution.port}

Port number the Beacon node will be listening on for the execution layer.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8551`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.beacon.extraArgs` {#opt-services.lighthouse.beacon.extraArgs}

Additional arguments passed to the lighthouse beacon command.

*Type:* string

*Default:* `""`

*Example:* `""`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.beacon.http.address` {#opt-services.lighthouse.beacon.http.address}

Listen address of Beacon node RPC service.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.beacon.http.enable` {#opt-services.lighthouse.beacon.http.enable}

Whether to enable Beacon node http api.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.beacon.http.port` {#opt-services.lighthouse.beacon.http.port}

Port number of Beacon node RPC service.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5052`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.beacon.metrics.address` {#opt-services.lighthouse.beacon.metrics.address}

Listen address of Beacon node metrics service.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.beacon.metrics.enable` {#opt-services.lighthouse.beacon.metrics.enable}

Whether to enable Beacon node prometheus metrics.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.beacon.metrics.port` {#opt-services.lighthouse.beacon.metrics.port}

Port number of Beacon node metrics service.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5054`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.beacon.openFirewall` {#opt-services.lighthouse.beacon.openFirewall}

Open the port in the firewall

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.beacon.port` {#opt-services.lighthouse.beacon.port}

Port number the Beacon node will be listening on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9000`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.extraArgs` {#opt-services.lighthouse.extraArgs}

Additional arguments passed to every lighthouse command.

*Type:* string

*Default:* `""`

*Example:* `""`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.network` {#opt-services.lighthouse.network}

The network to connect to. Mainnet is the default ethereum network.

*Type:* one of "mainnet", "gnosis", "chiado", "sepolia", "holesky"

*Default:* `"mainnet"`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.package` {#opt-services.lighthouse.package}

The lighthouse package to use.

*Type:* package

*Default:* `pkgs.lighthouse`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.validator` {#opt-services.lighthouse.validator}

Validator node

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.validator.beaconNodes` {#opt-services.lighthouse.validator.beaconNodes}

Beacon nodes to connect to.

*Type:* list of string

*Default:*

``` nix
[
  "http://localhost:5052"
]
```

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.validator.dataDir` {#opt-services.lighthouse.validator.dataDir}

Directory where data will be stored. Each chain will be stored under it's own specific subdirectory.

*Type:* string

*Default:* `"/var/lib/lighthouse-validator"`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.validator.enable` {#opt-services.lighthouse.validator.enable}

Enable Lightouse Validator node.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.validator.extraArgs` {#opt-services.lighthouse.validator.extraArgs}

Additional arguments passed to the lighthouse validator command.

*Type:* string

*Default:* `""`

*Example:* `""`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.validator.metrics.address` {#opt-services.lighthouse.validator.metrics.address}

Listen address of Validator node metrics service.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.validator.metrics.enable` {#opt-services.lighthouse.validator.metrics.enable}

Whether to enable Validator node prometheus metrics.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighthouse.validator.metrics.port` {#opt-services.lighthouse.validator.metrics.port}

Port number of Validator node metrics service.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5056`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/lighthouse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/lighthouse.nix)

## `services.lighttpd.cgit.configText` {#opt-services.lighttpd.cgit.configText}

Verbatim contents of the cgit runtime configuration file. Documentation
(with cgitrc example file) is available in "man cgitrc". Or online:
[http://git.zx2c4.com/cgit/tree/cgitrc.5.txt](http://git.zx2c4.com/cgit/tree/cgitrc.5.txt)

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  source-filter=${pkgs.cgit}/lib/cgit/filters/syntax-highlighting.py
  about-filter=${pkgs.cgit}/lib/cgit/filters/about-formatting.sh
  cache-size=1000
  scan-path=/srv/git
''
```

*Declared by:* [`nixos/modules/services/web-servers/lighttpd/cgit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/lighttpd/cgit.nix)

## `services.lighttpd.cgit.enable` {#opt-services.lighttpd.cgit.enable}

If true, enable cgit (fast web interface for git repositories) as a
sub-service in lighttpd.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/lighttpd/cgit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/lighttpd/cgit.nix)

## `services.lighttpd.cgit.subdir` {#opt-services.lighttpd.cgit.subdir}

The subdirectory in which to serve cgit. The web application will be
accessible at http://yourserver/${subdir}

*Type:* string

*Default:* `"cgit"`

*Example:* `""`

*Declared by:* [`nixos/modules/services/web-servers/lighttpd/cgit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/lighttpd/cgit.nix)

## `services.lighttpd.collectd.collectionCgi` {#opt-services.lighttpd.collectd.collectionCgi}

Path to collection.cgi script from (collectd sources)/contrib/collection.cgi
This option allows to use a customized version

*Type:* absolute path

*Default:* `config.services.collectd.package` configured for lighttpd

*Declared by:* [`nixos/modules/services/web-servers/lighttpd/collectd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/lighttpd/collectd.nix)

## `services.lighttpd.collectd.enable` {#opt-services.lighttpd.collectd.enable}

Whether to enable collectd subservice accessible at http://yourserver/collectd.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/lighttpd/collectd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/lighttpd/collectd.nix)

## `services.lighttpd.configText` {#opt-services.lighttpd.configText}

Overridable config file contents to use for lighttpd. By default, use
the contents automatically generated by NixOS.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"...verbatim config file contents..."`

*Declared by:* [`nixos/modules/services/web-servers/lighttpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/lighttpd/default.nix)

## `services.lighttpd.document-root` {#opt-services.lighttpd.document-root}

Document-root of the web server. Must be readable by the "lighttpd" user.

*Type:* absolute path

*Default:* `"/srv/www"`

*Declared by:* [`nixos/modules/services/web-servers/lighttpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/lighttpd/default.nix)

## `services.lighttpd.enable` {#opt-services.lighttpd.enable}

Enable the lighttpd web server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/lighttpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/lighttpd/default.nix)

## `services.lighttpd.enableModules` {#opt-services.lighttpd.enableModules}

List of lighttpd modules to enable. Sub-services take care of
enabling modules as needed, so this option is mainly for when you
want to add custom stuff to
[`services.lighttpd.extraConfig`](#opt-services.lighttpd.extraConfig) that depends on a
certain module.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "mod_cgi"
  "mod_status"
]
```

*Declared by:* [`nixos/modules/services/web-servers/lighttpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/lighttpd/default.nix)

## `services.lighttpd.enableUpstreamMimeTypes` {#opt-services.lighttpd.enableUpstreamMimeTypes}

Whether to include the list of mime types bundled with lighttpd
(upstream). If you disable this, no mime types will be added by
NixOS and you will have to add your own mime types in
[`services.lighttpd.extraConfig`](#opt-services.lighttpd.extraConfig).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-servers/lighttpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/lighttpd/default.nix)

## `services.lighttpd.extraConfig` {#opt-services.lighttpd.extraConfig}

These configuration lines will be appended to the generated lighttpd
config file. Note that this mechanism does not work when the manual
`configText` option is used.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-servers/lighttpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/lighttpd/default.nix)

## `services.lighttpd.gitweb.enable` {#opt-services.lighttpd.gitweb.enable}

If true, enable gitweb in lighttpd. Access it at http://yourserver/gitweb

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/lighttpd/gitweb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/lighttpd/gitweb.nix)

## `services.lighttpd.mod_status` {#opt-services.lighttpd.mod_status}

Show server status overview at /server-status, statistics at
/server-statistics and list of loaded modules at /server-config.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/lighttpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/lighttpd/default.nix)

## `services.lighttpd.mod_userdir` {#opt-services.lighttpd.mod_userdir}

If true, requests in the form /~user/page.html are rewritten to take
the file public\_html/page.html from the home directory of the user.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/lighttpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/lighttpd/default.nix)

## `services.lighttpd.package` {#opt-services.lighttpd.package}

The lighttpd package to use.

*Type:* package

*Default:* `pkgs.lighttpd`

*Declared by:* [`nixos/modules/services/web-servers/lighttpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/lighttpd/default.nix)

## `services.lighttpd.port` {#opt-services.lighttpd.port}

TCP port number for lighttpd to bind to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `80`

*Declared by:* [`nixos/modules/services/web-servers/lighttpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/lighttpd/default.nix)

## `services.limesurvey.config` {#opt-services.limesurvey.config}

LimeSurvey configuration. Refer to
[https://manual.limesurvey.org/Optional\_settings](https://manual.limesurvey.org/Optional_settings)
for details on supported values.

*Type:* limesurvey config type (str, int, bool or attribute set thereof)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.database.createLocally` {#opt-services.limesurvey.database.createLocally}

Create the database and database user locally.
This currently only applies if database type "mysql" is selected.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.database.dbEngine` {#opt-services.limesurvey.database.dbEngine}

Database storage engine to use.

*Type:* one of "MyISAM", "InnoDB"

*Default:* `"InnoDB"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.database.host` {#opt-services.limesurvey.database.host}

Database host address.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.database.name` {#opt-services.limesurvey.database.name}

Database name.

*Type:* string

*Default:* `"limesurvey"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.database.passwordFile` {#opt-services.limesurvey.database.passwordFile}

A file containing the password corresponding to
`database.user`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/limesurvey-dbpassword"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.database.port` {#opt-services.limesurvey.database.port}

Database host port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3306`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.database.socket` {#opt-services.limesurvey.database.socket}

Path to the unix socket file to use for authentication.

*Type:* null or absolute path

*Default:* `/run/mysqld/mysqld.sock`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.database.type` {#opt-services.limesurvey.database.type}

Database engine to use.

*Type:* one of "mysql", "pgsql", "odbc", "mssql"

*Default:* `"mysql"`

*Example:* `"pgsql"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.database.user` {#opt-services.limesurvey.database.user}

Database user.

*Type:* string

*Default:* `"limesurvey"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.enable` {#opt-services.limesurvey.enable}

Whether to enable Limesurvey web application.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.encryptionKeyFile` {#opt-services.limesurvey.encryptionKeyFile}

32-byte key used to encrypt variables in the database.

Note: It should be string not a store path in order to prevent the password from being world readable

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.encryptionNonceFile` {#opt-services.limesurvey.encryptionNonceFile}

24-byte used to encrypt variables in the database.

Note: It should be string not a store path in order to prevent the password from being world readable

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost` {#opt-services.limesurvey.httpd.virtualHost}

Apache configuration can be done by adapting `services.httpd.virtualHosts.<name>`.
See [services (H)](../../options/services-h/index.md#opt-services.httpd.virtualHosts) for further information.

*Type:* submodule

*Example:*

``` nix
{
  hostName = "survey.example.org";
  adminAddr = "webmaster@example.org";
  forceSSL = true;
  enableACME = true;
}
```

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.acmeRoot` {#opt-services.limesurvey.httpd.virtualHost.acmeRoot}

Directory for the acme challenge which is PUBLIC, don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.addSSL` {#opt-services.limesurvey.httpd.virtualHost.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.adminAddr` {#opt-services.limesurvey.httpd.virtualHost.adminAddr}

E-mail address of the server administrator.

*Type:* null or string

*Default:* `null`

*Example:* `"admin@example.org"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.documentRoot` {#opt-services.limesurvey.httpd.virtualHost.documentRoot}

The path of Apache's document root directory.  If left undefined,
an empty directory in the Nix store will be used as root.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.enableACME` {#opt-services.limesurvey.httpd.virtualHost.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.enableUserDir` {#opt-services.limesurvey.httpd.virtualHost.enableUserDir}

Whether to enable serving `~/public_html` as
`/~«username»`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.extraConfig` {#opt-services.limesurvey.httpd.virtualHost.extraConfig}

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

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.forceSSL` {#opt-services.limesurvey.httpd.virtualHost.forceSSL}

Whether to add a separate nginx server block that permanently redirects (301)
all plain HTTP traffic to HTTPS. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443), where the non-SSL listens are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.globalRedirect` {#opt-services.limesurvey.httpd.virtualHost.globalRedirect}

If set, all requests for this host are redirected permanently to
the given URL.

*Type:* null or string

*Default:* `null`

*Example:* `"http://newserver.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.hostName` {#opt-services.limesurvey.httpd.virtualHost.hostName}

Canonical hostname for the server.

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.http2` {#opt-services.limesurvey.httpd.virtualHost.http2}

Whether to enable HTTP 2. HTTP/2 is supported in all multi-processing modules that come with httpd. *However, if you use the prefork mpm, there will
be severe restrictions.* Refer to [https://httpd.apache.org/docs/2.4/howto/http2.html#mpm-config](https://httpd.apache.org/docs/2.4/howto/http2.html#mpm-config) for details.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.listen` {#opt-services.limesurvey.httpd.virtualHost.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.listen.*.ip` {#opt-services.limesurvey.httpd.virtualHost.listen._.ip}

IP to listen on. 0.0.0.0 for IPv4 only, \* for all.

*Type:* string

*Default:* `"*"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.listen.*.port` {#opt-services.limesurvey.httpd.virtualHost.listen._.port}

Port to listen on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.listen.*.ssl` {#opt-services.limesurvey.httpd.virtualHost.listen._.ssl}

Whether to enable SSL (https) support.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.listenAddresses` {#opt-services.limesurvey.httpd.virtualHost.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.locations` {#opt-services.limesurvey.httpd.virtualHost.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.locations.<name>.alias` {#opt-services.limesurvey.httpd.virtualHost.locations._name_.alias}

Alias directory for requests. See [https://httpd.apache.org/docs/2.4/mod/mod\_alias.html#alias](https://httpd.apache.org/docs/2.4/mod/mod_alias.html#alias).

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.locations.<name>.extraConfig` {#opt-services.limesurvey.httpd.virtualHost.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.locations.<name>.index` {#opt-services.limesurvey.httpd.virtualHost.locations._name_.index}

Adds DirectoryIndex directive. See [https://httpd.apache.org/docs/2.4/mod/mod\_dir.html#directoryindex](https://httpd.apache.org/docs/2.4/mod/mod_dir.html#directoryindex).

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.locations.<name>.priority` {#opt-services.limesurvey.httpd.virtualHost.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.locations.<name>.proxyPass` {#opt-services.limesurvey.httpd.virtualHost.locations._name_.proxyPass}

Sets up a simple reverse proxy as described by [https://httpd.apache.org/docs/2.4/howto/reverse\_proxy.html#simple](https://httpd.apache.org/docs/2.4/howto/reverse_proxy.html#simple).

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.logFormat` {#opt-services.limesurvey.httpd.virtualHost.logFormat}

Log format for Apache's log files. Possible values are: combined, common, referer, agent.

*Type:* string

*Default:* `"common"`

*Example:* `"combined"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.onlySSL` {#opt-services.limesurvey.httpd.virtualHost.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.robotsEntries` {#opt-services.limesurvey.httpd.virtualHost.robotsEntries}

Specification of pages to be ignored by web crawlers. See [http://www.robotstxt.org/](http://www.robotstxt.org/) for details.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"Disallow: /foo/"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.servedDirs` {#opt-services.limesurvey.httpd.virtualHost.servedDirs}

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

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.servedFiles` {#opt-services.limesurvey.httpd.virtualHost.servedFiles}

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

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.serverAliases` {#opt-services.limesurvey.httpd.virtualHost.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.sslServerCert` {#opt-services.limesurvey.httpd.virtualHost.sslServerCert}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.sslServerChain` {#opt-services.limesurvey.httpd.virtualHost.sslServerChain}

Path to server SSL chain file.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/ca.pem"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.sslServerKey` {#opt-services.limesurvey.httpd.virtualHost.sslServerKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.httpd.virtualHost.useACMEHost` {#opt-services.limesurvey.httpd.virtualHost.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost` {#opt-services.limesurvey.nginx.virtualHost}

Nginx configuration can be done by adapting `services.nginx.virtualHosts.<name>`.
See [services (N)](../../options/services-n/index.md#opt-services.nginx.virtualHosts) for further information.

*Type:* submodule

*Example:*

``` nix
{
  serverName = "survey.example.org";
  forceSSL = true;
  enableACME = true;
}
```

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.acmeFallbackHost` {#opt-services.limesurvey.nginx.virtualHost.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.acmeRoot` {#opt-services.limesurvey.nginx.virtualHost.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.addSSL` {#opt-services.limesurvey.nginx.virtualHost.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.basicAuth` {#opt-services.limesurvey.nginx.virtualHost.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.basicAuthFile` {#opt-services.limesurvey.nginx.virtualHost.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.default` {#opt-services.limesurvey.nginx.virtualHost.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.enableACME` {#opt-services.limesurvey.nginx.virtualHost.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.extraConfig` {#opt-services.limesurvey.nginx.virtualHost.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.forceSSL` {#opt-services.limesurvey.nginx.virtualHost.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.globalRedirect` {#opt-services.limesurvey.nginx.virtualHost.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.http2` {#opt-services.limesurvey.nginx.virtualHost.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.http3` {#opt-services.limesurvey.nginx.virtualHost.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.http3_hq` {#opt-services.limesurvey.nginx.virtualHost.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.kTLS` {#opt-services.limesurvey.nginx.virtualHost.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.listen` {#opt-services.limesurvey.nginx.virtualHost.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.listen.*.addr` {#opt-services.limesurvey.nginx.virtualHost.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.listen.*.extraParameters` {#opt-services.limesurvey.nginx.virtualHost.listen._.extraParameters}

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

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.listen.*.port` {#opt-services.limesurvey.nginx.virtualHost.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.listen.*.proxyProtocol` {#opt-services.limesurvey.nginx.virtualHost.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.listen.*.ssl` {#opt-services.limesurvey.nginx.virtualHost.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.listenAddresses` {#opt-services.limesurvey.nginx.virtualHost.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.locations` {#opt-services.limesurvey.nginx.virtualHost.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.locations.<name>.alias` {#opt-services.limesurvey.nginx.virtualHost.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.locations.<name>.basicAuth` {#opt-services.limesurvey.nginx.virtualHost.locations._name_.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.locations.<name>.basicAuthFile` {#opt-services.limesurvey.nginx.virtualHost.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.locations.<name>.extraConfig` {#opt-services.limesurvey.nginx.virtualHost.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.locations.<name>.fastcgiParams` {#opt-services.limesurvey.nginx.virtualHost.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.locations.<name>.index` {#opt-services.limesurvey.nginx.virtualHost.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.locations.<name>.priority` {#opt-services.limesurvey.nginx.virtualHost.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.locations.<name>.proxyPass` {#opt-services.limesurvey.nginx.virtualHost.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.locations.<name>.proxyWebsockets` {#opt-services.limesurvey.nginx.virtualHost.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.locations.<name>.recommendedProxySettings` {#opt-services.limesurvey.nginx.virtualHost.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.locations.<name>.recommendedUwsgiSettings` {#opt-services.limesurvey.nginx.virtualHost.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.locations.<name>.return` {#opt-services.limesurvey.nginx.virtualHost.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.locations.<name>.root` {#opt-services.limesurvey.nginx.virtualHost.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.locations.<name>.tryFiles` {#opt-services.limesurvey.nginx.virtualHost.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.locations.<name>.useGrpcErrorPages` {#opt-services.limesurvey.nginx.virtualHost.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.locations.<name>.uwsgiPass` {#opt-services.limesurvey.nginx.virtualHost.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.onlySSL` {#opt-services.limesurvey.nginx.virtualHost.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.quic` {#opt-services.limesurvey.nginx.virtualHost.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.redirectCode` {#opt-services.limesurvey.nginx.virtualHost.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.rejectSSL` {#opt-services.limesurvey.nginx.virtualHost.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.reuseport` {#opt-services.limesurvey.nginx.virtualHost.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.root` {#opt-services.limesurvey.nginx.virtualHost.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.serverAliases` {#opt-services.limesurvey.nginx.virtualHost.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.serverName` {#opt-services.limesurvey.nginx.virtualHost.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.sslCertificate` {#opt-services.limesurvey.nginx.virtualHost.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.sslCertificateKey` {#opt-services.limesurvey.nginx.virtualHost.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.sslTrustedCertificate` {#opt-services.limesurvey.nginx.virtualHost.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.nginx.virtualHost.useACMEHost` {#opt-services.limesurvey.nginx.virtualHost.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.package` {#opt-services.limesurvey.package}

The limesurvey package to use.

*Type:* package

*Default:* `pkgs.limesurvey`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.poolConfig` {#opt-services.limesurvey.poolConfig}

Options for the LimeSurvey PHP pool. See the documentation on `php-fpm.conf`
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

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.limesurvey.webserver` {#opt-services.limesurvey.webserver}

Webserver to configure for reverse-proxying limesurvey.

*Type:* one of "httpd", "nginx"

*Default:* `"httpd"`

*Example:* `"nginx"`

*Declared by:* [`nixos/modules/services/web-apps/limesurvey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/limesurvey.nix)

## `services.linkding.address` {#opt-services.linkding.address}

Address on which linkding listens.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/linkding.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkding.nix)

## `services.linkding.contextPath` {#opt-services.linkding.contextPath}

Configures a URL context path under which linkding is accessible.
When set, linkding is available at `http://host:<port>/<contextPath>`.
Must end with a `/` when non-empty.

*Type:* string

*Default:* `""`

*Example:* `"linkding/"`

*Declared by:* [`nixos/modules/services/web-apps/linkding.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkding.nix)

## `services.linkding.dataDir` {#opt-services.linkding.dataDir}

Directory used for all mutable state: SQLite database, secret key, favicons, previews, and assets.

*Type:* absolute path

*Default:* `"/var/lib/linkding"`

*Declared by:* [`nixos/modules/services/web-apps/linkding.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkding.nix)

## `services.linkding.database.createLocally` {#opt-services.linkding.database.createLocally}

Whether to automatically create a local PostgreSQL database and user.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/linkding.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkding.nix)

## `services.linkding.database.host` {#opt-services.linkding.database.host}

PostgreSQL server host.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/linkding.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkding.nix)

## `services.linkding.database.name` {#opt-services.linkding.database.name}

PostgreSQL database name.

*Type:* string

*Default:* `"linkding"`

*Declared by:* [`nixos/modules/services/web-apps/linkding.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkding.nix)

## `services.linkding.database.port` {#opt-services.linkding.database.port}

PostgreSQL server port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5432`

*Declared by:* [`nixos/modules/services/web-apps/linkding.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkding.nix)

## `services.linkding.database.type` {#opt-services.linkding.database.type}

Database engine to use. Defaults to SQLite.

*Type:* one of "sqlite", "postgres"

*Default:* `"sqlite"`

*Declared by:* [`nixos/modules/services/web-apps/linkding.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkding.nix)

## `services.linkding.database.user` {#opt-services.linkding.database.user}

PostgreSQL user name.

*Type:* string

*Default:* `"linkding"`

*Declared by:* [`nixos/modules/services/web-apps/linkding.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkding.nix)

## `services.linkding.enable` {#opt-services.linkding.enable}

Whether to enable linkding, a self-hosted bookmark manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/linkding.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkding.nix)

## `services.linkding.environmentFile` {#opt-services.linkding.environmentFile}

Path to an environment file loaded by all linkding services.
Useful for injecting secrets that should not appear in the Nix store,
such as `LD_DB_PASSWORD` or `LD_SUPERUSER_PASSWORD`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/linkding.env"`

*Declared by:* [`nixos/modules/services/web-apps/linkding.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkding.nix)

## `services.linkding.group` {#opt-services.linkding.group}

Group under which linkding runs.

::: note
If left as the default value this group will automatically be created
on system activation, otherwise you are responsible for ensuring the
group exists before the linkding service starts.
:::

*Type:* string

*Default:* `"linkding"`

*Declared by:* [`nixos/modules/services/web-apps/linkding.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkding.nix)

## `services.linkding.openFirewall` {#opt-services.linkding.openFirewall}

Open the linkding port in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/linkding.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkding.nix)

## `services.linkding.package` {#opt-services.linkding.package}

The linkding package to use.

*Type:* package

*Default:* `pkgs.linkding`

*Declared by:* [`nixos/modules/services/web-apps/linkding.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkding.nix)

## `services.linkding.port` {#opt-services.linkding.port}

Port on which linkding listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9090`

*Declared by:* [`nixos/modules/services/web-apps/linkding.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkding.nix)

## `services.linkding.processes` {#opt-services.linkding.processes}

Number of uWSGI processes to spawn.

*Type:* positive integer, meaning \>0

*Default:* `2`

*Declared by:* [`nixos/modules/services/web-apps/linkding.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkding.nix)

## `services.linkding.settings` {#opt-services.linkding.settings}

Additional environment variables passed to linkding.
Refer to the [linkding documentation](https://linkding.link/options/)
for the full list of supported `LD_*` options.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  LD_DISABLE_BACKGROUND_TASKS = "True";
  LD_DISABLE_URL_VALIDATION = "True";
  LD_ENABLE_OIDC = "True";
}
```

*Declared by:* [`nixos/modules/services/web-apps/linkding.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkding.nix)

## `services.linkding.threads` {#opt-services.linkding.threads}

Number of threads to spawn (per uWSGI process).

*Type:* positive integer, meaning \>0

*Default:* `2`

*Declared by:* [`nixos/modules/services/web-apps/linkding.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkding.nix)

## `services.linkding.user` {#opt-services.linkding.user}

User account under which linkding runs.

::: note
If left as the default value this user will automatically be created
on system activation, otherwise you are responsible for ensuring the
user exists before the linkding service starts.
:::

*Type:* string

*Default:* `"linkding"`

*Declared by:* [`nixos/modules/services/web-apps/linkding.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkding.nix)

## `services.linkwarden.cacheLocation` {#opt-services.linkwarden.cacheLocation}

Directory used as cache. If it is not the default, the directory has to be created manually such that the linkwarden user is able to read and write to it.

*Type:* absolute path

*Default:* `"/var/cache/linkwarden"`

*Declared by:* [`nixos/modules/services/web-apps/linkwarden.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkwarden.nix)

## `services.linkwarden.database.createLocally` {#opt-services.linkwarden.database.createLocally}

Whether to enable the automatic creation of the database for Linkwarden..

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/linkwarden.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkwarden.nix)

## `services.linkwarden.database.host` {#opt-services.linkwarden.database.host}

Hostname or address of the postgresql server. If an absolute path is given here, it will be interpreted as a unix socket path.

*Type:* string

*Default:* `"/run/postgresql"`

*Example:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/linkwarden.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkwarden.nix)

## `services.linkwarden.database.name` {#opt-services.linkwarden.database.name}

The name of the Linkwarden database.

*Type:* string

*Default:* `"linkwarden"`

*Declared by:* [`nixos/modules/services/web-apps/linkwarden.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkwarden.nix)

## `services.linkwarden.database.port` {#opt-services.linkwarden.database.port}

Port of the postgresql server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5432`

*Declared by:* [`nixos/modules/services/web-apps/linkwarden.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkwarden.nix)

## `services.linkwarden.database.user` {#opt-services.linkwarden.database.user}

The database user for Linkwarden.

*Type:* string

*Default:* `"linkwarden"`

*Declared by:* [`nixos/modules/services/web-apps/linkwarden.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkwarden.nix)

## `services.linkwarden.enable` {#opt-services.linkwarden.enable}

Whether to enable Linkwarden.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/linkwarden.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkwarden.nix)

## `services.linkwarden.enableRegistration` {#opt-services.linkwarden.enableRegistration}

Whether to enable registration for new users.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/linkwarden.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkwarden.nix)

## `services.linkwarden.environment` {#opt-services.linkwarden.environment}

Extra configuration environment variables. Refer to the [documentation](https://docs.linkwarden.app/self-hosting/environment-variables) for options.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  PAGINATION_TAKE_COUNT = "50";
}
```

*Declared by:* [`nixos/modules/services/web-apps/linkwarden.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkwarden.nix)

## `services.linkwarden.environmentFile` {#opt-services.linkwarden.environmentFile}

Path of a file with extra environment variables to be loaded from disk.
This file is not added to the nix store, so it can be used to pass secrets to linkwarden.
Refer to the [documentation](https://docs.linkwarden.app/self-hosting/environment-variables) for options.

Linkwarden needs at least a nextauth secret. To set a database password use POSTGRES\_PASSWORD:

```
NEXTAUTH_SECRET=<secret>
POSTGRES_PASSWORD=<pass>
```

*Type:* null or string

*Default:* `null`

*Example:* `"/run/secrets/linkwarden"`

*Declared by:* [`nixos/modules/services/web-apps/linkwarden.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkwarden.nix)

## `services.linkwarden.group` {#opt-services.linkwarden.group}

The group Linkwarden should run as.

*Type:* string

*Default:* `"linkwarden"`

*Declared by:* [`nixos/modules/services/web-apps/linkwarden.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkwarden.nix)

## `services.linkwarden.host` {#opt-services.linkwarden.host}

The host that Linkwarden will listen on.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/linkwarden.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkwarden.nix)

## `services.linkwarden.openFirewall` {#opt-services.linkwarden.openFirewall}

Whether to open the Linkwarden port in the firewall

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/linkwarden.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkwarden.nix)

## `services.linkwarden.package` {#opt-services.linkwarden.package}

The linkwarden package to use.

*Type:* package

*Default:* `pkgs.linkwarden`

*Declared by:* [`nixos/modules/services/web-apps/linkwarden.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkwarden.nix)

## `services.linkwarden.port` {#opt-services.linkwarden.port}

The port that Linkwarden will listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/web-apps/linkwarden.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkwarden.nix)

## `services.linkwarden.secretFiles` {#opt-services.linkwarden.secretFiles}

Attribute set containing paths to files to add to the environment of linkwarden.
The files are not added to the nix store, so they can be used to pass secrets to linkwarden.
Refer to the [documentation](https://docs.linkwarden.app/self-hosting/environment-variables) for options.

Linkwarden needs at least a nextauth secret. To set a database password use POSTGRES\_PASSWORD:

```
NEXTAUTH_SECRET=<secret>
POSTGRES_PASSWORD=<pass>
```

*Type:* attribute set of (null or string)

*Default:* `{ }`

*Example:*

``` nix
{
  NEXTAUTH_SECRET = "/run/secrets/linkwarden_secret";
  POSTGRES_PASSWORD = "/run/secrets/linkwarden_postgres_passwd";
}
```

*Declared by:* [`nixos/modules/services/web-apps/linkwarden.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkwarden.nix)

## `services.linkwarden.storageLocation` {#opt-services.linkwarden.storageLocation}

Directory used to store media files. If it is not the default, the directory has to be created manually such that the linkwarden user is able to read and write to it.

*Type:* absolute path

*Default:* `"/var/lib/linkwarden"`

*Declared by:* [`nixos/modules/services/web-apps/linkwarden.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkwarden.nix)

## `services.linkwarden.user` {#opt-services.linkwarden.user}

The user Linkwarden should run as.

*Type:* string

*Default:* `"linkwarden"`

*Declared by:* [`nixos/modules/services/web-apps/linkwarden.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/linkwarden.nix)

## `services.linux-enable-ir-emitter.device` {#opt-services.linux-enable-ir-emitter.device}

IR camera device to depend on. For example, for `/dev/video2`
the value would be `video2`. Find this with the command
`realpath /dev/v4l/by-path/<generated-driver-name>`.

*Type:* string

*Default:* `"video2"`

*Declared by:* [`nixos/modules/services/misc/linux-enable-ir-emitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/linux-enable-ir-emitter.nix)

## `services.linux-enable-ir-emitter.enable` {#opt-services.linux-enable-ir-emitter.enable}

Whether to enable IR emitter hardware. Designed to be used with the
Howdy facial authentication. After enabling the service, configure
the emitter with `sudo linux-enable-ir-emitter configure`.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/linux-enable-ir-emitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/linux-enable-ir-emitter.nix)

## `services.linux-enable-ir-emitter.package` {#opt-services.linux-enable-ir-emitter.package}

Package to use for the Linux Enable IR Emitter service.

*Type:* package

*Default:* `pkgs.linux-enable-ir-emitter`

*Declared by:* [`nixos/modules/services/misc/linux-enable-ir-emitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/linux-enable-ir-emitter.nix)

## `services.linyaps.boxPackage` {#opt-services.linyaps.boxPackage}

The linyaps-box package to use.

*Type:* package

*Default:* `pkgs.linyaps-box`

*Declared by:* [`nixos/modules/services/desktops/linyaps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/linyaps.nix)

## `services.linyaps.enable` {#opt-services.linyaps.enable}

Whether to enable linyaps, a cross-distribution package manager with sandboxed apps and shared runtime.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/linyaps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/linyaps.nix)

## `services.linyaps.package` {#opt-services.linyaps.package}

The linyaps package to use.

*Type:* package

*Default:* `pkgs.linyaps`

*Declared by:* [`nixos/modules/services/desktops/linyaps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/linyaps.nix)

## `services.linyaps.webStoreInstallerPackage` {#opt-services.linyaps.webStoreInstallerPackage}

The linyaps-web-store-installer package to use.

*Type:* package

*Default:* `pkgs.linyaps-web-store-installer`

*Declared by:* [`nixos/modules/services/desktops/linyaps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/linyaps.nix)

## `services.liquidsoap.streams` {#opt-services.liquidsoap.streams}

Set of Liquidsoap streams to start,
one systemd service per stream.

*Type:* attribute set of (absolute path or string)

*Default:* `{ }`

*Example:*

``` nix
{
  myStream1 = "/etc/liquidsoap/myStream1.liq";
  myStream2 = ./myStream2.liq;
  myStream3 = "out(playlist(\"/srv/music/\"))";
}
```

*Declared by:* [`nixos/modules/services/audio/liquidsoap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/liquidsoap.nix)

## `services.lirc.configs` {#opt-services.lirc.configs}

Configurations for lircd to load, see man:lircd.conf(5) for details (`lircd.conf`)

*Type:* list of strings concatenated with "\\n"

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/hardware/lirc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/lirc.nix)

## `services.lirc.enable` {#opt-services.lirc.enable}

Whether to enable the LIRC daemon, to receive and send infrared signals.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/lirc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/lirc.nix)

## `services.lirc.extraArguments` {#opt-services.lirc.extraArguments}

Extra arguments to lircd.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/hardware/lirc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/lirc.nix)

## `services.lirc.options` {#opt-services.lirc.options}

LIRC default options described in man:lircd(8) (`lirc_options.conf`)

*Type:* strings concatenated with "\\n"

*Example:*

``` nix
''
  [lircd]
  nodaemon = False
''
```

*Declared by:* [`nixos/modules/services/hardware/lirc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/lirc.nix)

## `services.listmonk.database.createLocally` {#opt-services.listmonk.database.createLocally}

Create the PostgreSQL database and database user locally.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/mail/listmonk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/listmonk.nix)

## `services.listmonk.database.mutableSettings` {#opt-services.listmonk.database.mutableSettings}

Database settings will be reset to the value set in this module if this is not enabled.
Enable this if you want to persist changes you have done in the application.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/mail/listmonk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/listmonk.nix)

## `services.listmonk.database.settings` {#opt-services.listmonk.database.settings}

Dynamic settings in the PostgreSQL database, set by a SQL script, see [https://github.com/knadh/listmonk/blob/master/schema.sql#L177-L230](https://github.com/knadh/listmonk/blob/master/schema.sql#L177-L230) for details.

*Type:* null or (open submodule of attribute set of ((list of string) or list of attribute set of anything or string or signed integer or boolean))

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/listmonk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/listmonk.nix)

## `services.listmonk.database.settings."app.notify_emails"` {#opt-services.listmonk.database.settings._app.notify_emails_}

Administrator emails for system notifications

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/mail/listmonk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/listmonk.nix)

## `services.listmonk.database.settings."bounce.mailboxes"` {#opt-services.listmonk.database.settings._bounce.mailboxes_}

List of bounce mailboxes

*Type:* list of (open submodule of list of attribute set of anything)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/mail/listmonk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/listmonk.nix)

## `services.listmonk.database.settings."privacy.domain_blocklist"` {#opt-services.listmonk.database.settings._privacy.domain_blocklist_}

E-mail addresses with these domains are disallowed from subscribing.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/mail/listmonk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/listmonk.nix)

## `services.listmonk.database.settings."privacy.exportable"` {#opt-services.listmonk.database.settings._privacy.exportable_}

List of fields which can be exported through an automatic export request

*Type:* list of string

*Default:*

``` nix
[
  "profile"
  "subscriptions"
  "campaign_views"
  "link_clicks"
]
```

*Declared by:* [`nixos/modules/services/mail/listmonk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/listmonk.nix)

## `services.listmonk.database.settings.messengers` {#opt-services.listmonk.database.settings.messengers}

List of messengers, see: [https://github.com/knadh/listmonk/blob/master/models/settings.go#L64-L74](https://github.com/knadh/listmonk/blob/master/models/settings.go#L64-L74) for options.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/mail/listmonk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/listmonk.nix)

## `services.listmonk.database.settings.smtp` {#opt-services.listmonk.database.settings.smtp}

List of outgoing SMTP servers

*Type:* list of (open submodule of attribute set of anything)

*Declared by:* [`nixos/modules/services/mail/listmonk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/listmonk.nix)

## `services.listmonk.database.settings.smtp.*.enabled` {#opt-services.listmonk.database.settings.smtp._.enabled}

Whether to enable this SMTP server for listmonk.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/listmonk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/listmonk.nix)

## `services.listmonk.database.settings.smtp.*.host` {#opt-services.listmonk.database.settings.smtp._.host}

Hostname for the SMTP server

*Type:* string

*Declared by:* [`nixos/modules/services/mail/listmonk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/listmonk.nix)

## `services.listmonk.database.settings.smtp.*.max_conns` {#opt-services.listmonk.database.settings.smtp._.max_conns}

Maximum number of simultaneous connections, defaults to 1

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/mail/listmonk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/listmonk.nix)

## `services.listmonk.database.settings.smtp.*.port` {#opt-services.listmonk.database.settings.smtp._.port}

Port for the SMTP server

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/services/mail/listmonk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/listmonk.nix)

## `services.listmonk.database.settings.smtp.*.tls_type` {#opt-services.listmonk.database.settings.smtp._.tls_type}

Type of TLS authentication with the SMTP server

*Type:* one of "none", "STARTTLS", "TLS"

*Declared by:* [`nixos/modules/services/mail/listmonk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/listmonk.nix)

## `services.listmonk.enable` {#opt-services.listmonk.enable}

Whether to enable Listmonk, this module assumes a reverse proxy to be set.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/listmonk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/listmonk.nix)

## `services.listmonk.package` {#opt-services.listmonk.package}

The listmonk package to use.

*Type:* package

*Default:* `pkgs.listmonk`

*Declared by:* [`nixos/modules/services/mail/listmonk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/listmonk.nix)

## `services.listmonk.secretFile` {#opt-services.listmonk.secretFile}

A file containing secrets as environment variables. See [https://listmonk.app/docs/configuration/#environment-variables](https://listmonk.app/docs/configuration/#environment-variables) for details on supported values.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/listmonk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/listmonk.nix)

## `services.listmonk.settings` {#opt-services.listmonk.settings}

Static settings set in the config.toml, see [https://github.com/knadh/listmonk/blob/master/config.toml.sample](https://github.com/knadh/listmonk/blob/master/config.toml.sample) for details.
You can set secrets using the secretFile option with environment variables following [https://listmonk.app/docs/configuration/#environment-variables](https://listmonk.app/docs/configuration/#environment-variables).

*Type:* open submodule of (TOML value)

*Declared by:* [`nixos/modules/services/mail/listmonk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/listmonk.nix)

## `services.litellm.enable` {#opt-services.litellm.enable}

Whether to enable LiteLLM server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/litellm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/litellm.nix)

## `services.litellm.environment` {#opt-services.litellm.environment}

Extra environment variables for LiteLLM.

*Type:* attribute set of string

*Default:*

``` nix
{
  ANONYMIZED_TELEMETRY = "False";
  DO_NOT_TRACK = "True";
  SCARF_NO_ANALYTICS = "True";
}
```

*Example:*

``` nix
''
  {
    NO_DOCS="True";
  }
''
```

*Declared by:* [`nixos/modules/services/misc/litellm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/litellm.nix)

## `services.litellm.environmentFile` {#opt-services.litellm.environmentFile}

Environment file to be passed to the systemd service.
Useful for passing secrets to the service to prevent them from being
world-readable in the Nix store.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/secrets/liteLLMSecrets"`

*Declared by:* [`nixos/modules/services/misc/litellm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/litellm.nix)

## `services.litellm.host` {#opt-services.litellm.host}

The host address which the LiteLLM server HTTP interface listens to.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/litellm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/litellm.nix)

## `services.litellm.openFirewall` {#opt-services.litellm.openFirewall}

Whether to open the firewall for LiteLLM.
This adds `services.litellm.port` to `networking.firewall.allowedTCPPorts`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/litellm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/litellm.nix)

## `services.litellm.package` {#opt-services.litellm.package}

The litellm package to use.

*Type:* package

*Default:* `pkgs.litellm`

*Declared by:* [`nixos/modules/services/misc/litellm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/litellm.nix)

## `services.litellm.port` {#opt-services.litellm.port}

Which port the LiteLLM server listens to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Example:* `11111`

*Declared by:* [`nixos/modules/services/misc/litellm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/litellm.nix)

## `services.litellm.settings` {#opt-services.litellm.settings}

Configuration for LiteLLM.
See [https://docs.litellm.ai/docs/proxy/configs](https://docs.litellm.ai/docs/proxy/configs) for more.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/litellm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/litellm.nix)

## `services.litellm.settings.environment_variables` {#opt-services.litellm.settings.environment_variables}

Environment variables to pass to the Lite

*Type:* YAML 1.1 value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/litellm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/litellm.nix)

## `services.litellm.settings.general_settings` {#opt-services.litellm.settings.general_settings}

LiteLLM Server settings

*Type:* YAML 1.1 value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/litellm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/litellm.nix)

## `services.litellm.settings.litellm_settings` {#opt-services.litellm.settings.litellm_settings}

LiteLLM Module settings

*Type:* YAML 1.1 value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/litellm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/litellm.nix)

## `services.litellm.settings.model_list` {#opt-services.litellm.settings.model_list}

List of supported models on the server, with model-specific configs.

*Type:* YAML 1.1 value

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/litellm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/litellm.nix)

## `services.litellm.settings.router_settings` {#opt-services.litellm.settings.router_settings}

LiteLLM Router settings

*Type:* YAML 1.1 value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/litellm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/litellm.nix)

## `services.litellm.stateDir` {#opt-services.litellm.stateDir}

State directory of LiteLLM.

*Type:* absolute path

*Default:* `"/var/lib/litellm"`

*Example:* `"/home/foo"`

*Declared by:* [`nixos/modules/services/misc/litellm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/litellm.nix)

## `services.litestream.enable` {#opt-services.litestream.enable}

Whether to enable litestream.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/litestream/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/litestream/default.nix)

## `services.litestream.environmentFile` {#opt-services.litestream.environmentFile}

Environment file as defined in `systemd.exec(5)`.

Secrets may be passed to the service without adding them to the
world-readable Nix store, by specifying placeholder variables as
the option value in Nix and setting these variables accordingly in the
environment file.

By default, Litestream will perform environment variable expansion
within the config file before reading it. Any references to $VAR or
${VAR} formatted variables will be replaced with their environment
variable values. If no value is set then it will be replaced with an
empty string.

```
  # Content of the environment file
  LITESTREAM_ACCESS_KEY_ID=AKIAxxxxxxxxxxxxxxxx
  LITESTREAM_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxxxxx
```

Note that this file needs to be available on the host on which
this exporter is running.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/litestream"`

*Declared by:* [`nixos/modules/services/network-filesystems/litestream/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/litestream/default.nix)

## `services.litestream.package` {#opt-services.litestream.package}

The litestream package to use.

*Type:* package

*Default:* `pkgs.litestream`

*Declared by:* [`nixos/modules/services/network-filesystems/litestream/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/litestream/default.nix)

## `services.litestream.settings` {#opt-services.litestream.settings}

See the [documentation](https://litestream.io/reference/config/).

*Type:* YAML 1.1 value

*Default:* `null`

*Example:*

``` nix
{
  dbs = [
    {
      path = "/var/lib/db1";
      replicas = [
        {
          url = "s3://mybkt.litestream.io/db1";
        }
      ];
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/network-filesystems/litestream/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/litestream/default.nix)

## `services.livebook.enableUserService` {#opt-services.livebook.enableUserService}

Whether to enable a user service for Livebook.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/development/livebook.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/livebook.nix)

## `services.livebook.environment` {#opt-services.livebook.environment}

Environment variables to set.

Livebook is configured through the use of environment variables. The
available configuration options can be found in the [Livebook
documentation](https://hexdocs.pm/livebook/readme.html#environment-variables).

Note that all environment variables set through this configuration
parameter will be readable by anyone with access to the host
machine. Therefore, sensitive information like `LIVEBOOK_PASSWORD`
or `LIVEBOOK_COOKIE` should never be set using this configuration
option, but should instead use
[services (L)](#opt-services.livebook.environmentFile). See the documentation for
that option for more information.

Any environment variables specified in the
[services (L)](#opt-services.livebook.environmentFile) will supersede environment
variables specified in this option.

*Type:* attribute set of (null or boolean or signed integer or string)

*Default:* `{ }`

*Example:*

``` nix
{
  LIVEBOOK_PORT = 8080;
}
```

*Declared by:* [`nixos/modules/services/development/livebook.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/livebook.nix)

## `services.livebook.environmentFile` {#opt-services.livebook.environmentFile}

Additional environment file as defined in `systemd.exec(5)`.

Secrets like `LIVEBOOK_PASSWORD` (which is used to specify the
password needed to access the livebook site) or `LIVEBOOK_COOKIE`
(which is used to specify the
[cookie](https://www.erlang.org/doc/reference_manual/distributed.html#security)
used to connect to the running Elixir system) may be passed to the
service without making them readable to everyone with access to
systemctl by using this configuration parameter.

Note that this file needs to be available on the host on which
`livebook` is running.

For security purposes, this file should contain at least
`LIVEBOOK_PASSWORD` or `LIVEBOOK_TOKEN_ENABLED=false`.

See the [Livebook
documentation](https://hexdocs.pm/livebook/readme.html#environment-variables)
and the [services (L)](#opt-services.livebook.environment) configuration parameter
for further options.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/livebook.env"`

*Declared by:* [`nixos/modules/services/development/livebook.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/livebook.nix)

## `services.livebook.extraPackages` {#opt-services.livebook.extraPackages}

Extra packages to make available to the Livebook service.

*Type:* list of package

*Default:* `[ ]`

*Example:* `with pkgs; [ gcc gnumake ]`

*Declared by:* [`nixos/modules/services/development/livebook.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/livebook.nix)

## `services.livebook.package` {#opt-services.livebook.package}

The livebook package to use.

*Type:* package

*Default:* `pkgs.livebook`

*Declared by:* [`nixos/modules/services/development/livebook.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/livebook.nix)

## `services.livekit.enable` {#opt-services.livekit.enable}

Whether to enable the livekit server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/livekit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit.nix)

## `services.livekit.ingress.enable` {#opt-services.livekit.ingress.enable}

Whether to enable the livekit ingress service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/livekit-ingress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit-ingress.nix)

## `services.livekit.ingress.environmentFile` {#opt-services.livekit.ingress.environmentFile}

Environment file as defined in `systemd.exec(5)` passed to the service.

Use this to specify `LIVEKIT_API_KEY` and `LIVEKIT_API_SECRET`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/livekit-ingress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit-ingress.nix)

## `services.livekit.ingress.openFirewall.rtc` {#opt-services.livekit.ingress.openFirewall.rtc}

Open WebRTC ports in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/livekit-ingress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit-ingress.nix)

## `services.livekit.ingress.openFirewall.rtmp` {#opt-services.livekit.ingress.openFirewall.rtmp}

Open RTMP port in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/livekit-ingress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit-ingress.nix)

## `services.livekit.ingress.openFirewall.whip` {#opt-services.livekit.ingress.openFirewall.whip}

Open WHIP port in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/livekit-ingress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit-ingress.nix)

## `services.livekit.ingress.package` {#opt-services.livekit.ingress.package}

The livekit-ingress package to use.

*Type:* package

*Default:* `pkgs.livekit-ingress`

*Declared by:* [`nixos/modules/services/networking/livekit-ingress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit-ingress.nix)

## `services.livekit.ingress.settings` {#opt-services.livekit.ingress.settings}

LiveKit Ingress configuration.

See [https://github.com/livekit/ingress?tab=readme-ov-file#config](https://github.com/livekit/ingress?tab=readme-ov-file#config) for possible options.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Example:*

``` nix
{
  cpu_cost = {
    rtmp_cpu_cost = 3.0;
    whip_cpu_cost = 1.0;
  };
  prometheus_port = 9039;
}
```

*Declared by:* [`nixos/modules/services/networking/livekit-ingress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit-ingress.nix)

## `services.livekit.ingress.settings.redis.address` {#opt-services.livekit.ingress.settings.redis.address}

Address or hostname and port for redis connection

*Type:* null or string

*Default:* `"Host and port of the local livekit redis instance, if enabled, or null"`

*Example:* `"redis.example.com:6379"`

*Declared by:* [`nixos/modules/services/networking/livekit-ingress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit-ingress.nix)

## `services.livekit.ingress.settings.rtc_config.port_range_end` {#opt-services.livekit.ingress.settings.rtc_config.port_range_end}

End of UDP port range for WebRTC

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `51000`

*Declared by:* [`nixos/modules/services/networking/livekit-ingress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit-ingress.nix)

## `services.livekit.ingress.settings.rtc_config.port_range_start` {#opt-services.livekit.ingress.settings.rtc_config.port_range_start}

Start of UDP port range for WebRTC

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `50000`

*Declared by:* [`nixos/modules/services/networking/livekit-ingress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit-ingress.nix)

## `services.livekit.ingress.settings.rtc_config.use_external_ip` {#opt-services.livekit.ingress.settings.rtc_config.use_external_ip}

When set to true, attempts to discover the host's public IP via STUN.
This is useful for cloud environments such as AWS & Google where hosts have an internal IP that maps to an external one.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/livekit-ingress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit-ingress.nix)

## `services.livekit.ingress.settings.rtmp_port` {#opt-services.livekit.ingress.settings.rtmp_port}

TCP port for RTMP connections. -1 to disable

*Type:* integer between -1 and 65535 (both inclusive)

*Default:* `1935`

*Declared by:* [`nixos/modules/services/networking/livekit-ingress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit-ingress.nix)

## `services.livekit.ingress.settings.whip_port` {#opt-services.livekit.ingress.settings.whip_port}

TCP port for WHIP connections. -1 to disable

*Type:* integer between -1 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/networking/livekit-ingress.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit-ingress.nix)

## `services.livekit.keyFile` {#opt-services.livekit.keyFile}

LiveKit key file holding one or multiple application secrets. Use `livekit-server generate-keys` to generate a random key name and secret.

The file should have the format `<keyname>: <secret>`.
Example:
`lk-jwt-service: f6lQGaHtM5HfgZjIcec3cOCRfiDqIine4CpZZnqdT5cE`

Individual key/secret pairs need to be passed to clients to connect to this instance.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/networking/livekit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit.nix)

## `services.livekit.openFirewall` {#opt-services.livekit.openFirewall}

Opens port range for LiveKit on the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/livekit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit.nix)

## `services.livekit.package` {#opt-services.livekit.package}

The livekit package to use.

*Type:* package

*Default:* `pkgs.livekit`

*Declared by:* [`nixos/modules/services/networking/livekit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit.nix)

## `services.livekit.redis.createLocally` {#opt-services.livekit.redis.createLocally}

Whether to set up a local redis instance.

*Type:* boolean

*Default:* `"true if any other Livekit component is enabled locally else false"`

*Declared by:* [`nixos/modules/services/networking/livekit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit.nix)

## `services.livekit.redis.host` {#opt-services.livekit.redis.host}

Address to bind local redis instance to.

*Type:* null or string

*Default:* `"127.0.0.1 if config.services.livekit.redis.createLocally else null"`

*Declared by:* [`nixos/modules/services/networking/livekit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit.nix)

## `services.livekit.redis.port` {#opt-services.livekit.redis.port}

Port to bind local redis instance to.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/livekit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit.nix)

## `services.livekit.settings` {#opt-services.livekit.settings}

LiveKit configuration file expressed in nix.

For an example configuration, see [https://docs.livekit.io/home/self-hosting/deployment/#configuration](https://docs.livekit.io/home/self-hosting/deployment/#configuration).
For all possible values, see [https://github.com/livekit/livekit/blob/master/config-sample.yaml](https://github.com/livekit/livekit/blob/master/config-sample.yaml).

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/livekit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit.nix)

## `services.livekit.settings.port` {#opt-services.livekit.settings.port}

Main TCP port for RoomService and RTC endpoint.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `7880`

*Declared by:* [`nixos/modules/services/networking/livekit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit.nix)

## `services.livekit.settings.redis.address` {#opt-services.livekit.settings.redis.address}

Host and port used to connect to a redis instance.

*Type:* null or string

*Default:* `Local Redis host/port when a local ingress component is enabled else null`

*Example:* `"redis.example.com:6379"`

*Declared by:* [`nixos/modules/services/networking/livekit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit.nix)

## `services.livekit.settings.rtc.port_range_end` {#opt-services.livekit.settings.rtc.port_range_end}

End of UDP port range for WebRTC

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `51000`

*Declared by:* [`nixos/modules/services/networking/livekit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit.nix)

## `services.livekit.settings.rtc.port_range_start` {#opt-services.livekit.settings.rtc.port_range_start}

Start of UDP port range for WebRTC

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `50000`

*Declared by:* [`nixos/modules/services/networking/livekit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit.nix)

## `services.livekit.settings.rtc.use_external_ip` {#opt-services.livekit.settings.rtc.use_external_ip}

When set to true, attempts to discover the host's public IP via STUN.
This is useful for cloud environments such as AWS & Google where hosts have an internal IP that maps to an external one.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/livekit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/livekit.nix)

## `services.lk-jwt-service.enable` {#opt-services.lk-jwt-service.enable}

Whether to enable lk-jwt-service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/lk-jwt-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/lk-jwt-service.nix)

## `services.lk-jwt-service.keyFile` {#opt-services.lk-jwt-service.keyFile}

Path to a file containing the credential mapping (`<keyname>: <secret>`) to access LiveKit.

Example:
`lk-jwt-service: f6lQGaHtM5HfgZjIcec3cOCRfiDqIine4CpZZnqdT5cE`

For more information, see [https://github.com/element-hq/lk-jwt-service#configuration](https://github.com/element-hq/lk-jwt-service#configuration).

*Type:* absolute path

*Declared by:* [`nixos/modules/services/matrix/lk-jwt-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/lk-jwt-service.nix)

## `services.lk-jwt-service.livekitUrl` {#opt-services.lk-jwt-service.livekitUrl}

The public websocket URL for livekit.
The proto needs to be either  `wss://` (recommended) or `ws://` (insecure).

*Type:* string matching the pattern ^wss?://.\*

*Example:* `"wss://example.com/livekit/sfu"`

*Declared by:* [`nixos/modules/services/matrix/lk-jwt-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/lk-jwt-service.nix)

## `services.lk-jwt-service.package` {#opt-services.lk-jwt-service.package}

The lk-jwt-service package to use.

*Type:* package

*Default:* `pkgs.lk-jwt-service`

*Declared by:* [`nixos/modules/services/matrix/lk-jwt-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/lk-jwt-service.nix)

## `services.lk-jwt-service.port` {#opt-services.lk-jwt-service.port}

Port that lk-jwt-service should listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/matrix/lk-jwt-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/lk-jwt-service.nix)

## `services.llama-cpp.enable` {#opt-services.llama-cpp.enable}

Whether to enable llama.cpp HTTP server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/llama-cpp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/llama-cpp.nix)

## `services.llama-cpp.openFirewall` {#opt-services.llama-cpp.openFirewall}

Open ports in the firewall for the server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/llama-cpp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/llama-cpp.nix)

## `services.llama-cpp.package` {#opt-services.llama-cpp.package}

The llama-cpp package to use.

*Type:* package

*Default:* `pkgs.llama-cpp`

*Declared by:* [`nixos/modules/services/misc/llama-cpp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/llama-cpp.nix)

## `services.llama-cpp.settings` {#opt-services.llama-cpp.settings}

Command-line arguments for `llama-server`.

See [https://github.com/ggml-org/llama.cpp/blob/master/tools/server/README.md](https://github.com/ggml-org/llama.cpp/blob/master/tools/server/README.md)
for the full list of options.

*Type:* open submodule of (attribute set)

*Default:* `{ }`

*Example:*

``` nix
{
  batch-size = 512;
  ctx-size = 252144;
  flash-attn = "on";
  host = "0.0.0.0";
  model = "/mnt/llms/Foo3.6-27B-UD-Q4_K_XL.gguf";
  port = 1337;
  spec-draft-n-max = 2;
  spec-type = "draft-mtp";
  temp = 0.6;
  top-k = 20;
  top-p = 0.95;
  ubatch-size = 256;
}
```

*Declared by:* [`nixos/modules/services/misc/llama-cpp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/llama-cpp.nix)

## `services.llama-cpp.settings.host` {#opt-services.llama-cpp.settings.host}

IP address on which the server should listen on.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/llama-cpp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/llama-cpp.nix)

## `services.llama-cpp.settings.port` {#opt-services.llama-cpp.settings.port}

Port on which the server should listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Example:* `1337`

*Declared by:* [`nixos/modules/services/misc/llama-cpp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/llama-cpp.nix)

## `services.llama-swap.enable` {#opt-services.llama-swap.enable}

Whether to enable the llama-swap service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/llama-swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/llama-swap.nix)

## `services.llama-swap.listenAddress` {#opt-services.llama-swap.listenAddress}

Address that llama-swap listens on.

*Type:* string

*Default:* `"localhost"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/networking/llama-swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/llama-swap.nix)

## `services.llama-swap.openFirewall` {#opt-services.llama-swap.openFirewall}

Whether to open the firewall for llama-swap.
This adds `port` to [networking](../../options/networking/index.md#opt-networking.firewall.allowedTCPPorts).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/llama-swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/llama-swap.nix)

## `services.llama-swap.package` {#opt-services.llama-swap.package}

The llama-swap package to use.

*Type:* package

*Default:* `pkgs.llama-swap`

*Declared by:* [`nixos/modules/services/networking/llama-swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/llama-swap.nix)

## `services.llama-swap.port` {#opt-services.llama-swap.port}

Port that llama-swap listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Example:* `11343`

*Declared by:* [`nixos/modules/services/networking/llama-swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/llama-swap.nix)

## `services.llama-swap.settings` {#opt-services.llama-swap.settings}

llama-swap configuration. Refer to the [llama-swap example configuration](https://github.com/mostlygeek/llama-swap/blob/main/docs/config.example.yaml)
for details on supported values.

*Type:* open submodule of (YAML 1.1 value)

*Example:*

``` nix
let
  llama-cpp = pkgs.llama-cpp.override { rocmSupport = true; };
  llama-server = lib.getExe' llama-cpp "llama-server";
in
{
  healthCheckTimeout = 60;
  models = {
    "some-model" = {
      cmd = "${llama-server} --port ${PORT} -m /var/lib/llama-cpp/models/some-model.gguf -ngl 0 --no-webui";
      aliases = [
        "the-best"
      ];
    };
    "other-model" = {
      proxy = "http://127.0.0.1:5555";
      cmd = "${llama-server} --port 5555 -m /var/lib/llama-cpp/models/other-model.gguf -ngl 0 -c 4096 -np 4 --no-webui";
      concurrencyLimit = 4;
    };
  };
};
```

*Declared by:* [`nixos/modules/services/networking/llama-swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/llama-swap.nix)

## `services.llama-swap.tls.certFile` {#opt-services.llama-swap.tls.certFile}

Path to the TLS certificate file. This certificate will be offered to,
and may be verified by, clients.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/path/to/cert.pem"`

*Declared by:* [`nixos/modules/services/networking/llama-swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/llama-swap.nix)

## `services.llama-swap.tls.enable` {#opt-services.llama-swap.tls.enable}

Whether to enable TLS encryption.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/llama-swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/llama-swap.nix)

## `services.llama-swap.tls.keyFile` {#opt-services.llama-swap.tls.keyFile}

Path to the TLS private key file. This key will be used to decrypt,
data received from clients.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/path/to/key.pem"`

*Declared by:* [`nixos/modules/services/networking/llama-swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/llama-swap.nix)

## `services.llama-swap.validateConfigFile` {#opt-services.llama-swap.validateConfigFile}

Whether to enable validating configuration with `llama-swap -validate`.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/llama-swap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/llama-swap.nix)

## `services.lldap.database.createLocally` {#opt-services.lldap.database.createLocally}

Create the database and database user locally.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/databases/lldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/lldap.nix)

## `services.lldap.database.type` {#opt-services.lldap.database.type}

Database engine to use.

*Type:* one of "mariadb", "postgresql", "sqlite"

*Default:* `"sqlite"`

*Example:* `"postgresql"`

*Declared by:* [`nixos/modules/services/databases/lldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/lldap.nix)

## `services.lldap.enable` {#opt-services.lldap.enable}

Whether to enable lldap, a lightweight authentication server that provides an opinionated, simplified LDAP interface for authentication.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/lldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/lldap.nix)

## `services.lldap.environment` {#opt-services.lldap.environment}

Environment variables passed to the service.
Any config option name prefixed with `LLDAP_` takes priority over the one in the configuration file.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  LLDAP_JWT_SECRET_FILE = "/run/lldap/jwt_secret";
  LLDAP_LDAP_USER_PASS_FILE = "/run/lldap/user_password";
}
```

*Declared by:* [`nixos/modules/services/databases/lldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/lldap.nix)

## `services.lldap.environmentFile` {#opt-services.lldap.environmentFile}

Environment file as defined in `systemd.exec(5)` passed to the service.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/lldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/lldap.nix)

## `services.lldap.package` {#opt-services.lldap.package}

The lldap package to use.

*Type:* package

*Default:* `pkgs.lldap`

*Declared by:* [`nixos/modules/services/databases/lldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/lldap.nix)

## `services.lldap.settings` {#opt-services.lldap.settings}

Free-form settings written directly to the `lldap_config.toml` file.
Refer to [https://github.com/lldap/lldap/blob/main/lldap\_config.docker\_template.toml](https://github.com/lldap/lldap/blob/main/lldap_config.docker_template.toml) for supported values.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/databases/lldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/lldap.nix)

## `services.lldap.settings.database_url` {#opt-services.lldap.settings.database_url}

Database URL.

*Type:* null or string

*Default:*

``` nix
if config.services.lldap.database.createLocally
then
  if cfg.database.type == "sqlite"
  then "sqlite://./users.db?mode=rwc"
  else if cfg.database.type == "postgresql"
  then "postgresql:///lldap?host=/run/postgresql"
  else if cfg.database.type == "mariadb"
  then "mysql://lldap@localhost/lldap?socket=/run/mysqld/mysqld.sock"
else null
```

*Example:* `"postgres://postgres-user:password@postgres-server/my-database"`

*Declared by:* [`nixos/modules/services/databases/lldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/lldap.nix)

## `services.lldap.settings.force_ldap_user_pass_reset` {#opt-services.lldap.settings.force_ldap_user_pass_reset}

Force reset of the admin password.

Set this setting to `"always"` to update the admin password when `ldap_user_pass_file` changes.
Setting to `"always"` also means any password update in the UI will be overwritten next time the service restarts.

The difference between `true` and `"always"` is the former is intended for a one time fix
while the latter is intended for a declarative workflow. In practice, the result
is the same: the password gets reset. The only practical difference is the former
outputs a warning message while the latter outputs an info message.

*Type:* boolean or value "always" (singular enum)

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/lldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/lldap.nix)

## `services.lldap.settings.http_host` {#opt-services.lldap.settings.http_host}

The host address that the HTTP server will be bound to.

*Type:* string

*Default:* `"::"`

*Declared by:* [`nixos/modules/services/databases/lldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/lldap.nix)

## `services.lldap.settings.http_port` {#opt-services.lldap.settings.http_port}

The port on which to have the HTTP server, for user login and administration.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `17170`

*Declared by:* [`nixos/modules/services/databases/lldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/lldap.nix)

## `services.lldap.settings.http_url` {#opt-services.lldap.settings.http_url}

The public URL of the server, for password reset links.

*Type:* string

*Default:* `"http://localhost"`

*Declared by:* [`nixos/modules/services/databases/lldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/lldap.nix)

## `services.lldap.settings.jwt_secret_file` {#opt-services.lldap.settings.jwt_secret_file}

Path to a file containing the JWT secret.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/lldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/lldap.nix)

## `services.lldap.settings.ldap_base_dn` {#opt-services.lldap.settings.ldap_base_dn}

Base DN for LDAP.

*Type:* string

*Example:* `"dc=example,dc=com"`

*Declared by:* [`nixos/modules/services/databases/lldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/lldap.nix)

## `services.lldap.settings.ldap_host` {#opt-services.lldap.settings.ldap_host}

The host address that the LDAP server will be bound to.

*Type:* string

*Default:* `"::"`

*Declared by:* [`nixos/modules/services/databases/lldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/lldap.nix)

## `services.lldap.settings.ldap_port` {#opt-services.lldap.settings.ldap_port}

The port on which to have the LDAP server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3890`

*Declared by:* [`nixos/modules/services/databases/lldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/lldap.nix)

## `services.lldap.settings.ldap_user_dn` {#opt-services.lldap.settings.ldap_user_dn}

Admin username

*Type:* string

*Default:* `"admin"`

*Declared by:* [`nixos/modules/services/databases/lldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/lldap.nix)

## `services.lldap.settings.ldap_user_email` {#opt-services.lldap.settings.ldap_user_email}

Admin email.

*Type:* string

*Default:* `"admin@example.com"`

*Declared by:* [`nixos/modules/services/databases/lldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/lldap.nix)

## `services.lldap.settings.ldap_user_pass` {#opt-services.lldap.settings.ldap_user_pass}

Password for default admin password.

Unsecure: Use `ldap_user_pass_file` settings instead.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/lldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/lldap.nix)

## `services.lldap.settings.ldap_user_pass_file` {#opt-services.lldap.settings.ldap_user_pass_file}

Path to a file containing the default admin password.

If you want to update the default admin password through this setting,
you must set `force_ldap_user_pass_reset` to `true`.
Otherwise changing this setting will have no effect
unless this is the very first time LLDAP is started and its database is still empty.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/lldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/lldap.nix)

## `services.lldap.silenceForceUserPassResetWarning` {#opt-services.lldap.silenceForceUserPassResetWarning}

Disable warning when the admin password is set declaratively with the `ldap_user_pass_file` setting
but the `force_ldap_user_pass_reset` is set to `false`.

This can lead to the admin password to drift from the one given declaratively.
If that is okay for you and you want to silence the warning, set this option to `true`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/lldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/lldap.nix)

## `services.lldpd.enable` {#opt-services.lldpd.enable}

Whether to enable Link Layer Discovery Protocol Daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/lldpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lldpd.nix)

## `services.lldpd.extraArgs` {#opt-services.lldpd.extraArgs}

List of command line parameters for lldpd

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-c"
  "-k"
  "-I eth0"
]
```

*Declared by:* [`nixos/modules/services/networking/lldpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lldpd.nix)

## `services.local-content-share.enable` {#opt-services.local-content-share.enable}

Whether to enable Local-Content-Share.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/local-content-share.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/local-content-share.nix)

## `services.local-content-share.listenAddress` {#opt-services.local-content-share.listenAddress}

Address on which the service will be available.

The service will listen on all interfaces if set to an empty string.

*Type:* string

*Default:* `""`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/misc/local-content-share.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/local-content-share.nix)

## `services.local-content-share.openFirewall` {#opt-services.local-content-share.openFirewall}

Whether to automatically open the specified port in the firewall

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/local-content-share.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/local-content-share.nix)

## `services.local-content-share.package` {#opt-services.local-content-share.package}

The local-content-share package to use.

*Type:* package

*Default:* `pkgs.local-content-share`

*Declared by:* [`nixos/modules/services/misc/local-content-share.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/local-content-share.nix)

## `services.local-content-share.port` {#opt-services.local-content-share.port}

Port on which the service will be available

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/misc/local-content-share.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/local-content-share.nix)

## `services.localtimed.enable` {#opt-services.localtimed.enable}

Enable `localtimed`, a simple daemon for keeping the
system timezone up-to-date based on the current location. It uses
geoclue2 to determine the current location.

To avoid silent overriding by the service, if you have explicitly set a
timezone, either remove it or ensure that it is set with a lower priority
than the default value using `lib.mkDefault` or `lib.mkOverride`. This is
to make the choice deliberate. An error will be presented otherwise.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/system/localtimed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/localtimed.nix)

## `services.localtimed.geoclue2Package` {#opt-services.localtimed.geoclue2Package}

The Geoclue2 package to use.

*Type:* package

*Default:* `pkgs.geoclue2-with-demo-agent`

*Declared by:* [`nixos/modules/services/system/localtimed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/localtimed.nix)

## `services.localtimed.package` {#opt-services.localtimed.package}

The localtime package to use.

*Type:* package

*Default:* `pkgs.localtime`

*Declared by:* [`nixos/modules/services/system/localtimed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/localtimed.nix)

## `services.locate.enable` {#opt-services.locate.enable}

If enabled, NixOS will periodically update the database of
files used by the `locate` command.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/misc/locate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/locate.nix)

## `services.locate.extraFlags` {#opt-services.locate.extraFlags}

Extra flags to pass to `updatedb`.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/misc/locate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/locate.nix)

## `services.locate.interval` {#opt-services.locate.interval}

Update the locate database at this interval. Updates by
default at 2:15 AM every day.

The format is described in
`systemd.time(7)`.

To disable automatic updates, set to `"never"`
and run `updatedb` manually.

*Type:* string

*Default:* `"02:15"`

*Example:* `"hourly"`

*Declared by:* [`nixos/modules/misc/locate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/locate.nix)

## `services.locate.output` {#opt-services.locate.output}

The database file to build.

When using plocate, this is also compiled in as the default database
of `updatedb` and `locate`.

*Type:* absolute path not in the Nix store

*Default:* `"/var/cache/locatedb"`

*Declared by:* [`nixos/modules/misc/locate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/locate.nix)

## `services.locate.package` {#opt-services.locate.package}

The plocate package to use.

*Type:* package

*Default:* `pkgs.plocate`

*Example:* `mlocate`

*Declared by:* [`nixos/modules/misc/locate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/locate.nix)

## `services.locate.pruneBindMounts` {#opt-services.locate.pruneBindMounts}

Whether not to index bind mounts

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/misc/locate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/locate.nix)

## `services.locate.pruneFS` {#opt-services.locate.pruneFS}

Which filesystem types to exclude from indexing

*Type:* list of string

*Default:*

``` nix
[
  "afs"
  "anon_inodefs"
  "auto"
  "autofs"
  "bdev"
  "binfmt"
  "binfmt_misc"
  "ceph"
  "cgroup"
  "cgroup2"
  "cifs"
  "coda"
  "configfs"
  "cramfs"
  "cpuset"
  "curlftpfs"
  "debugfs"
  "devfs"
  "devpts"
  "devtmpfs"
  "eventpollfs"
  "exofs"
  "futexfs"
  "ftpfs"
  "fuse"
  "fusectl"
  "fusesmb"
  "fuse.ceph"
  "fuse.glusterfs"
  "fuse.gvfsd-fuse"
  "fuse.mfs"
  "fuse.rclone"
  "fuse.rozofs"
  "fuse.sshfs"
  "gfs"
  "gfs2"
  "hostfs"
  "hugetlbfs"
  "inotifyfs"
  "iso9660"
  "jffs2"
  "lustre"
  "lustre_lite"
  "misc"
  "mfs"
  "mqueue"
  "ncpfs"
  "nfs"
  "NFS"
  "nfs4"
  "nfsd"
  "nnpfs"
  "ocfs"
  "ocfs2"
  "pipefs"
  "proc"
  "ramfs"
  "rpc_pipefs"
  "securityfs"
  "selinuxfs"
  "sfs"
  "shfs"
  "smbfs"
  "sockfs"
  "spufs"
  "sshfs"
  "subfs"
  "supermount"
  "sysfs"
  "tmpfs"
  "tracefs"
  "ubifs"
  "udev"
  "udf"
  "usbfs"
  "vboxsf"
  "vperfctrfs"
]
```

*Declared by:* [`nixos/modules/misc/locate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/locate.nix)

## `services.locate.pruneNames` {#opt-services.locate.pruneNames}

Directory components which should exclude paths containing them from indexing

*Type:* list of string

*Default:* `[ ".bzr" ".cache" ".git" ".hg" ".svn" ]`, if
supported by the locate implementation (i.e. mlocate or plocate).

*Declared by:* [`nixos/modules/misc/locate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/locate.nix)

## `services.locate.prunePaths` {#opt-services.locate.prunePaths}

Which paths to exclude from indexing

*Type:* list of absolute path

*Default:*

``` nix
[
  "/tmp"
  "/var/tmp"
  "/var/cache"
  "/var/lock"
  "/var/run"
  "/var/spool"
  "/nix/store"
  "/nix/var/log/nix"
]
```

*Declared by:* [`nixos/modules/misc/locate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/locate.nix)

## `services.logcheck.config` {#opt-services.logcheck.config}

Config options that you would like in logcheck.conf.

*Type:* strings concatenated with "\\n"

*Default:* `"FQDN=1"`

*Declared by:* [`nixos/modules/services/logging/logcheck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logcheck.nix)

## `services.logcheck.enable` {#opt-services.logcheck.enable}

Whether to enable logcheck cron job, to mail anomalies in the system logfiles to the administrator.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/logging/logcheck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logcheck.nix)

## `services.logcheck.extraGroups` {#opt-services.logcheck.extraGroups}

Extra groups for the logcheck user, for example to be able to use sendmail,
or to access certain log files.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "postdrop"
  "mongodb"
]
```

*Declared by:* [`nixos/modules/services/logging/logcheck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logcheck.nix)

## `services.logcheck.extraRulesDirs` {#opt-services.logcheck.extraRulesDirs}

Directories with extra rules.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/etc/logcheck"
]
```

*Declared by:* [`nixos/modules/services/logging/logcheck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logcheck.nix)

## `services.logcheck.files` {#opt-services.logcheck.files}

Which log files to check.

*Type:* list of absolute path

*Default:*

``` nix
[
  "/var/log/messages"
]
```

*Example:*

``` nix
[
  "/var/log/messages"
  "/var/log/mail"
]
```

*Declared by:* [`nixos/modules/services/logging/logcheck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logcheck.nix)

## `services.logcheck.ignore` {#opt-services.logcheck.ignore}

This option defines extra ignore rules.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/logging/logcheck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logcheck.nix)

## `services.logcheck.ignore.<name>.level` {#opt-services.logcheck.ignore._name_.level}

Set the logcheck level.

*Type:* one of "workstation", "server", "paranoid"

*Default:* `"server"`

*Declared by:* [`nixos/modules/services/logging/logcheck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logcheck.nix)

## `services.logcheck.ignore.<name>.regex` {#opt-services.logcheck.ignore._name_.regex}

Regex specifying which log lines to ignore.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/logging/logcheck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logcheck.nix)

## `services.logcheck.ignoreCron` {#opt-services.logcheck.ignoreCron}

This option defines extra ignore rules for cronjobs.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/logging/logcheck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logcheck.nix)

## `services.logcheck.ignoreCron.<name>.cmdline` {#opt-services.logcheck.ignoreCron._name_.cmdline}

Command line for the cron job. Will be turned into a regex for the logcheck ignore rule.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/logging/logcheck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logcheck.nix)

## `services.logcheck.ignoreCron.<name>.timeArgs` {#opt-services.logcheck.ignoreCron._name_.timeArgs}

"min hr dom mon dow" crontab time args, to auto-create a cronjob too.
Leave at null to not do this and just add a logcheck ignore rule.

*Type:* null or string

*Default:* `null`

*Example:* `"02 06 * * *"`

*Declared by:* [`nixos/modules/services/logging/logcheck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logcheck.nix)

## `services.logcheck.ignoreCron.<name>.user` {#opt-services.logcheck.ignoreCron._name_.user}

User that runs the cronjob.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/logging/logcheck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logcheck.nix)

## `services.logcheck.level` {#opt-services.logcheck.level}

Set the logcheck level. Either "workstation", "server", or "paranoid".

*Type:* string

*Default:* `"server"`

*Declared by:* [`nixos/modules/services/logging/logcheck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logcheck.nix)

## `services.logcheck.mailTo` {#opt-services.logcheck.mailTo}

Email address to send reports to.

*Type:* string

*Default:* `"root"`

*Example:* `"you@domain.com"`

*Declared by:* [`nixos/modules/services/logging/logcheck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logcheck.nix)

## `services.logcheck.timeOfDay` {#opt-services.logcheck.timeOfDay}

Time of day to run logcheck. A logcheck will be scheduled at xx:02 each day.
Leave default (\*) to run every hour. Of course when nothing special was logged,
logcheck will be silent.

*Type:* string

*Default:* `"*"`

*Example:* `"6"`

*Declared by:* [`nixos/modules/services/logging/logcheck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logcheck.nix)

## `services.logcheck.user` {#opt-services.logcheck.user}

Username for the logcheck user.

*Type:* string

*Default:* `"logcheck"`

*Declared by:* [`nixos/modules/services/logging/logcheck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logcheck.nix)

## `services.logind.enable` {#opt-services.logind.enable}

Whether to enable the `systemd-logind` login service.

*Type:* boolean

*Default:* `config.systemd.package.withLogind`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/logind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/logind.nix)

## `services.logind.settings.Login` {#opt-services.logind.settings.Login}

Settings option for systemd-logind.
See `logind.conf(5)` for available options.

*Type:* open submodule of attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  HandleLidSwitch = "ignore";
  KillUserProcesses = false;
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/logind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/logind.nix)

## `services.logind.settings.Login.KillUserProcesses` {#opt-services.logind.settings.Login.KillUserProcesses}

Specifies whether the processes of a user should be killed
when the user logs out.  If true, the scope unit corresponding
to the session and all processes inside that scope will be
terminated.  If false, the scope is "abandoned"
(see `systemd.scope(5)`),
and processes are not killed.

See `logind.conf(5)` for more details.

Defaulted to false in nixpkgs because many tools that rely on
persistent user processes—like `tmux`, `screen`, `mosh`, `VNC`,
`nohup`, and more — would break by the systemd-default behavior.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/systemd/logind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/logind.nix)

## `services.logiops.config` {#opt-services.logiops.config}

The standard libconfig-style config for LogiOps.

*Type:* attribute set of (libconfig value)

*Default:* `{ }`

*Example:*

``` nix
devices = [
{
    name = "Wireless Mouse MX Master";
    dpi = 1000;
    smartshift =
    {
        on = true;
        threshold = 30;
        torque = 50;
    };
}
];
```

*Declared by:* [`nixos/modules/services/hardware/logiops.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/logiops.nix)

## `services.logiops.enable` {#opt-services.logiops.enable}

Whether to enable LogiOps, a unofficial userspace driver for HID++ Logitech devices.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/logiops.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/logiops.nix)

## `services.logiops.package` {#opt-services.logiops.package}

The logiops package to use.

*Type:* package

*Default:* `pkgs.logiops`

*Declared by:* [`nixos/modules/services/hardware/logiops.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/logiops.nix)

## `services.logkeys.device` {#opt-services.logkeys.device}

Use the given device as keyboard input event device instead of /dev/input/eventX default.

*Type:* null or string

*Default:* `null`

*Example:* `"/dev/input/event15"`

*Declared by:* [`nixos/modules/services/misc/logkeys.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/logkeys.nix)

## `services.logkeys.enable` {#opt-services.logkeys.enable}

Whether to enable logkeys, a keylogger service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/logkeys.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/logkeys.nix)

## `services.logmein-hamachi.enable` {#opt-services.logmein-hamachi.enable}

Whether to enable LogMeIn Hamachi, a proprietary
(closed source) commercial VPN software.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/logmein-hamachi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/logmein-hamachi.nix)

## `services.logrotate.allowNetworking` {#opt-services.logrotate.allowNetworking}

Whether to enable network access for logrotate.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/logging/logrotate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logrotate.nix)

## `services.logrotate.checkConfig` {#opt-services.logrotate.checkConfig}

Whether the config should be checked at build time.

Some options are not checkable at build time because of the build sandbox:
for example, the test does not know about existing files and system users are
not known.
These limitations mean we must adjust the file for tests (missingok is forced
and users are replaced by dummy users), so tests are complemented by a
logrotate-checkconf service that is enabled by default.
This extra check can be disabled by disabling it at the systemd level with the
`systemd.services.logrotate-checkconf.enable` option.

Conversely there are still things that might make this check fail incorrectly
(e.g. a file path where we don't have access to intermediate directories):
in this case you can disable the failing check with this option.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/logging/logrotate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logrotate.nix)

## `services.logrotate.enable` {#opt-services.logrotate.enable}

Whether to enable the logrotate systemd service.

*Type:* boolean

*Default:* `cfg.settings != {}`

*Example:* `true`

*Declared by:* [`nixos/modules/services/logging/logrotate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logrotate.nix)

## `services.logrotate.extraArgs` {#opt-services.logrotate.extraArgs}

Additional command line arguments to pass on logrotate invocation

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/logging/logrotate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logrotate.nix)

## `services.logrotate.settings` {#opt-services.logrotate.settings}

logrotate freeform settings: each attribute here will define its own section,
ordered by [`services.logrotate.settings.<name>.priority`](#opt-services.logrotate.settings._name_.priority),
which can either define files to rotate with their settings
or settings common to all further files settings.
All attribute names not explicitly defined as sub-options here are passed through
as logrotate config directives,
refer to [https://linux.die.net/man/8/logrotate](https://linux.die.net/man/8/logrotate) for details.

*Type:* attribute set of (open submodule of attribute set of (null or signed integer or boolean or string))

*Default:* `{ }`

*Example:*

``` nix
{
  # global options
  header = {
    dateext = true;
  };
  # example custom files
  "/var/log/mylog.log" = {
    frequency = "daily";
    rotate = 3;
  };
  "multiple paths" = {
     files = [
      "/var/log/first*.log"
      "/var/log/second.log"
    ];
  };
  # specify custom order of sections
  "/var/log/myservice/*.log" = {
    # ensure lower priority
    priority = 110;
    postrotate = ''
      systemctl reload myservice
    '';
  };
};
```

*Declared by:* [`nixos/modules/services/logging/logrotate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logrotate.nix)

## `services.logrotate.settings.<name>.enable` {#opt-services.logrotate.settings._name_.enable}

Whether to enable setting individual kill switch.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/logging/logrotate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logrotate.nix)

## `services.logrotate.settings.<name>.files` {#opt-services.logrotate.settings._name_.files}

Single or list of files for which rules are defined.
The files are quoted with double-quotes in logrotate configuration,
so globs and spaces are supported.
Note this setting is ignored if globals is true.

*Type:* string or list of string

*Default:*

``` nix
''
  The attrset name if not specified
''
```

*Declared by:* [`nixos/modules/services/logging/logrotate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logrotate.nix)

## `services.logrotate.settings.<name>.frequency` {#opt-services.logrotate.settings._name_.frequency}

How often to rotate the logs. Defaults to previously set global setting,
which itself defaults to weekly.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/logging/logrotate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logrotate.nix)

## `services.logrotate.settings.<name>.global` {#opt-services.logrotate.settings._name_.global}

Whether this setting is a global option or not: set to have these
settings apply to all files settings with a higher priority.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/logging/logrotate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logrotate.nix)

## `services.logrotate.settings.<name>.priority` {#opt-services.logrotate.settings._name_.priority}

Order of this logrotate block in relation to the others. The semantics are
the same as with `lib.mkOrder`. Smaller values are inserted first.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/logging/logrotate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logrotate.nix)

## `services.logstash.dataDir` {#opt-services.logstash.dataDir}

A path to directory writable by logstash that it uses to store data.
Plugins will also have access to this path.

*Type:* string

*Default:* `"/var/lib/logstash"`

*Declared by:* [`nixos/modules/services/logging/logstash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logstash.nix)

## `services.logstash.enable` {#opt-services.logstash.enable}

Enable logstash.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/logging/logstash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logstash.nix)

## `services.logstash.extraJvmOptions` {#opt-services.logstash.extraJvmOptions}

Extra JVM options, one per line (jvm.options format).

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  -Xms2g
  -Xmx2g
''
```

*Declared by:* [`nixos/modules/services/logging/logstash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logstash.nix)

## `services.logstash.extraSettings` {#opt-services.logstash.extraSettings}

Extra Logstash settings in YAML format.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  pipeline:
    batch:
      size: 125
      delay: 5
''
```

*Declared by:* [`nixos/modules/services/logging/logstash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logstash.nix)

## `services.logstash.filterConfig` {#opt-services.logstash.filterConfig}

logstash filter configuration.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  if [type] == "syslog" {
    # Keep only relevant systemd fields
    # https://www.freedesktop.org/software/systemd/man/systemd.journal-fields.html
    prune {
      whitelist_names => [
        "type", "@timestamp", "@version",
        "MESSAGE", "PRIORITY", "SYSLOG_FACILITY"
      ]
    }
  }
''
```

*Declared by:* [`nixos/modules/services/logging/logstash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logstash.nix)

## `services.logstash.filterWorkers` {#opt-services.logstash.filterWorkers}

The quantity of filter workers to run.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/logging/logstash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logstash.nix)

## `services.logstash.inputConfig` {#opt-services.logstash.inputConfig}

Logstash input configuration.

*Type:* strings concatenated with "\\n"

*Default:* `"generator { }"`

*Example:*

``` nix
''
  # Read from journal
  pipe {
    command => "${config.systemd.package}/bin/journalctl -f -o json"
    type => "syslog" codec => json {}
  }
''
```

*Declared by:* [`nixos/modules/services/logging/logstash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logstash.nix)

## `services.logstash.listenAddress` {#opt-services.logstash.listenAddress}

Address on which to start webserver.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/logging/logstash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logstash.nix)

## `services.logstash.logLevel` {#opt-services.logstash.logLevel}

Logging verbosity level.

*Type:* one of "debug", "info", "warn", "error", "fatal"

*Default:* `"warn"`

*Declared by:* [`nixos/modules/services/logging/logstash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logstash.nix)

## `services.logstash.outputConfig` {#opt-services.logstash.outputConfig}

Logstash output configuration.

*Type:* strings concatenated with "\\n"

*Default:* `"stdout { codec => rubydebug }"`

*Example:*

``` nix
''
  redis { host => ["localhost"] data_type => "list" key => "logstash" codec => json }
  elasticsearch { }
''
```

*Declared by:* [`nixos/modules/services/logging/logstash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logstash.nix)

## `services.logstash.package` {#opt-services.logstash.package}

The logstash package to use.

*Type:* package

*Default:* `pkgs.logstash`

*Declared by:* [`nixos/modules/services/logging/logstash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logstash.nix)

## `services.logstash.plugins` {#opt-services.logstash.plugins}

The paths to find other logstash plugins in.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:* `[ pkgs.logstash-contrib ]`

*Declared by:* [`nixos/modules/services/logging/logstash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logstash.nix)

## `services.logstash.port` {#opt-services.logstash.port}

Port on which to start webserver.

*Type:* string

*Default:* `"9292"`

*Declared by:* [`nixos/modules/services/logging/logstash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/logstash.nix)

## `services.loki.configFile` {#opt-services.loki.configFile}

Specify a configuration file that Loki should use.

Cannot be specified together with [`services.loki.configuration`](#opt-services.loki.configuration).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/loki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/loki.nix)

## `services.loki.configuration` {#opt-services.loki.configuration}

Specify the configuration for Loki in Nix.

See [documentation of Grafana Loki](https://grafana.com/docs/loki/latest/configure/) for all available options.

Cannot be specified together with [`services.loki.configFile`](#opt-services.loki.configFile).

*Type:* JSON value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/loki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/loki.nix)

## `services.loki.dataDir` {#opt-services.loki.dataDir}

Specify the data directory for Loki.

*Type:* absolute path

*Default:* `"/var/lib/loki"`

*Declared by:* [`nixos/modules/services/monitoring/loki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/loki.nix)

## `services.loki.enable` {#opt-services.loki.enable}

Whether to enable Grafana Loki.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/loki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/loki.nix)

## `services.loki.extraFlags` {#opt-services.loki.extraFlags}

Specify a list of additional command line flags,
which get escaped and are then passed to Loki.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--server.http-listen-port=3101"
]
```

*Declared by:* [`nixos/modules/services/monitoring/loki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/loki.nix)

## `services.loki.group` {#opt-services.loki.group}

Group under which the Loki service runs.

*Type:* string

*Default:* `"loki"`

*Declared by:* [`nixos/modules/services/monitoring/loki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/loki.nix)

## `services.loki.package` {#opt-services.loki.package}

The grafana-loki package to use.

*Type:* package

*Default:* `pkgs.grafana-loki`

*Declared by:* [`nixos/modules/services/monitoring/loki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/loki.nix)

## `services.loki.user` {#opt-services.loki.user}

User under which the Loki service runs.

*Type:* string

*Default:* `"loki"`

*Declared by:* [`nixos/modules/services/monitoring/loki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/loki.nix)

## `services.lokinet.enable` {#opt-services.lokinet.enable}

Whether to enable Lokinet daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/lokinet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lokinet.nix)

## `services.lokinet.package` {#opt-services.lokinet.package}

The lokinet package to use.

*Type:* package

*Default:* `pkgs.lokinet`

*Declared by:* [`nixos/modules/services/networking/lokinet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lokinet.nix)

## `services.lokinet.settings` {#opt-services.lokinet.settings}

Configuration for Lokinet.
Currently, the best way to view the available settings is by
generating a config file using `lokinet -g`.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string) or a list of them for duplicate keys)

*Default:* `{ }`

*Example:*

``` nix
{
  dns = {
    bind = "127.3.2.1";
    upstream = [ "1.1.1.1" "8.8.8.8" ];
  };

  network.exit-node = [ "example.loki" "example2.loki" ];
}
```

*Declared by:* [`nixos/modules/services/networking/lokinet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lokinet.nix)

## `services.lokinet.settings.dns.bind` {#opt-services.lokinet.settings.dns.bind}

Address to bind to for handling DNS requests.

*Type:* string

*Default:* `"127.3.2.1"`

*Declared by:* [`nixos/modules/services/networking/lokinet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lokinet.nix)

## `services.lokinet.settings.dns.upstream` {#opt-services.lokinet.settings.dns.upstream}

Upstream resolver(s) to use as fallback for non-loki addresses.
Multiple values accepted.

*Type:* list of string

*Default:*

``` nix
[
  "9.9.9.10"
]
```

*Example:*

``` nix
[
  "1.1.1.1"
  "8.8.8.8"
]
```

*Declared by:* [`nixos/modules/services/networking/lokinet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lokinet.nix)

## `services.lokinet.settings.network.exit` {#opt-services.lokinet.settings.network.exit}

Whether to act as an exit node. Beware that this
increases demand on the server and may pose liability concerns.
Enable at your own risk.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/lokinet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lokinet.nix)

## `services.lokinet.settings.network.exit-node` {#opt-services.lokinet.settings.network.exit-node}

Specify a `.loki` address and an optional ip range to use as an exit broker.
See [http://probably.loki/wiki/index.php?title=Exit\_Nodes](http://probably.loki/wiki/index.php?title=Exit_Nodes) for
a list of exit nodes.

*Type:* null or (list of string)

*Default:* `null`

*Example:*

``` nix
''
  exit-node = [ "example.loki" ];              # maps all exit traffic to example.loki
  exit-node = [ "example.loki:100.0.0.0/24" ]; # maps 100.0.0.0/24 to example.loki
''
```

*Declared by:* [`nixos/modules/services/networking/lokinet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lokinet.nix)

## `services.lokinet.settings.network.keyfile` {#opt-services.lokinet.settings.network.keyfile}

The private key to persist address with. If not specified the address will be ephemeral.
This keyfile is generated automatically if the specified file doesn't exist.

*Type:* null or string

*Default:* `null`

*Example:* `"snappkey.private"`

*Declared by:* [`nixos/modules/services/networking/lokinet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lokinet.nix)

## `services.lokinet.useLocally` {#opt-services.lokinet.useLocally}

Whether to use Lokinet locally.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/lokinet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lokinet.nix)

## `services.longview.apacheStatusUrl` {#opt-services.longview.apacheStatusUrl}

The Apache status page URL. If provided, Longview will
gather statistics from this location. This requires Apache
mod\_status to be loaded and enabled.

*Type:* string

*Default:* `""`

*Example:* `"http://127.0.0.1/server-status"`

*Declared by:* [`nixos/modules/services/monitoring/longview.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/longview.nix)

## `services.longview.apiKey` {#opt-services.longview.apiKey}

Longview API key. To get this, look in Longview settings which
are found at [https://manager.linode.com/longview/](https://manager.linode.com/longview/).

Warning: this secret is stored in the world-readable Nix store!
Use `apiKeyFile` instead.

*Type:* string

*Default:* `""`

*Example:* `"01234567-89AB-CDEF-0123456789ABCDEF"`

*Declared by:* [`nixos/modules/services/monitoring/longview.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/longview.nix)

## `services.longview.apiKeyFile` {#opt-services.longview.apiKeyFile}

A file containing the Longview API key.
To get this, look in Longview settings which
are found at [https://manager.linode.com/longview/](https://manager.linode.com/longview/).

`apiKeyFile` takes precedence over `apiKey`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/longview-api-key"`

*Declared by:* [`nixos/modules/services/monitoring/longview.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/longview.nix)

## `services.longview.enable` {#opt-services.longview.enable}

If enabled, system metrics will be sent to Linode LongView.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/longview.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/longview.nix)

## `services.longview.mysqlPassword` {#opt-services.longview.mysqlPassword}

The password corresponding to `mysqlUser`.
Warning: this is stored in cleartext in the Nix store!
Use `mysqlPasswordFile` instead.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/longview.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/longview.nix)

## `services.longview.mysqlPasswordFile` {#opt-services.longview.mysqlPasswordFile}

A file containing the password corresponding to `mysqlUser`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/dbpassword"`

*Declared by:* [`nixos/modules/services/monitoring/longview.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/longview.nix)

## `services.longview.mysqlUser` {#opt-services.longview.mysqlUser}

The user for connecting to the MySQL database. If provided,
Longview will connect to MySQL and collect statistics about
queries, etc. This user does not need to have been granted
any extra privileges.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/longview.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/longview.nix)

## `services.longview.nginxStatusUrl` {#opt-services.longview.nginxStatusUrl}

The Nginx status page URL. Longview will gather statistics
from this URL. This requires the Nginx stub\_status module to
be enabled and configured at the given location.

*Type:* string

*Default:* `""`

*Example:* `"http://127.0.0.1/nginx_status"`

*Declared by:* [`nixos/modules/services/monitoring/longview.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/longview.nix)

## `services.loops-server.dataDir` {#opt-services.loops-server.dataDir}

State directory of the `loops` user which holds
the application's state and data.

*Type:* string

*Default:* `"/var/lib/loops-server"`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.database.automaticMigrations` {#opt-services.loops-server.database.automaticMigrations}

Whether to enable automatic migrations for database schema and data.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.database.createLocally` {#opt-services.loops-server.database.createLocally}

Whether to enable a local database using UNIX socket authentication.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.database.name` {#opt-services.loops-server.database.name}

Database name.

*Type:* string

*Default:* `"loops"`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.domain` {#opt-services.loops-server.domain}

FQDN for the Loops instance.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.enable` {#opt-services.loops-server.enable}

Whether to enable a Loops instance.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.group` {#opt-services.loops-server.group}

Group account under which Loops runs.

::: note
If left as the default value this group will automatically be created
on system activation, otherwise you are responsible for
ensuring the group exists before the Loops application starts.
:::

*Type:* string

*Default:* `"loops"`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.maxUploadSize` {#opt-services.loops-server.maxUploadSize}

Max upload size with units.

*Type:* string

*Default:* `"100M"`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx` {#opt-services.loops-server.nginx}

With this option, you can customize an nginx virtual host which already has sensible defaults for Loops.
Set to {} if you do not need any customization to the virtual host.
If enabled, then by default, the `serverName` is
`${domain}`,
If this is set to null (the default), no nginx virtualHost will be configured.

*Type:* null or (submodule)

*Default:* `null`

*Example:*

``` nix
{
  serverAliases = [
    "pics.${config.networking.domain}"
  ];
  enableACME = true;
  forceSSL = true;
}
```

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.acmeFallbackHost` {#opt-services.loops-server.nginx.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.acmeRoot` {#opt-services.loops-server.nginx.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.addSSL` {#opt-services.loops-server.nginx.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.basicAuth` {#opt-services.loops-server.nginx.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.basicAuthFile` {#opt-services.loops-server.nginx.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.default` {#opt-services.loops-server.nginx.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.enableACME` {#opt-services.loops-server.nginx.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.extraConfig` {#opt-services.loops-server.nginx.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.forceSSL` {#opt-services.loops-server.nginx.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.globalRedirect` {#opt-services.loops-server.nginx.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.http2` {#opt-services.loops-server.nginx.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.http3` {#opt-services.loops-server.nginx.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.http3_hq` {#opt-services.loops-server.nginx.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.kTLS` {#opt-services.loops-server.nginx.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.listen` {#opt-services.loops-server.nginx.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.listen.*.addr` {#opt-services.loops-server.nginx.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.listen.*.extraParameters` {#opt-services.loops-server.nginx.listen._.extraParameters}

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

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.listen.*.port` {#opt-services.loops-server.nginx.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.listen.*.proxyProtocol` {#opt-services.loops-server.nginx.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.listen.*.ssl` {#opt-services.loops-server.nginx.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.listenAddresses` {#opt-services.loops-server.nginx.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.locations` {#opt-services.loops-server.nginx.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.locations.<name>.alias` {#opt-services.loops-server.nginx.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.locations.<name>.basicAuth` {#opt-services.loops-server.nginx.locations._name_.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.locations.<name>.basicAuthFile` {#opt-services.loops-server.nginx.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.locations.<name>.extraConfig` {#opt-services.loops-server.nginx.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.locations.<name>.fastcgiParams` {#opt-services.loops-server.nginx.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.locations.<name>.index` {#opt-services.loops-server.nginx.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.locations.<name>.priority` {#opt-services.loops-server.nginx.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.locations.<name>.proxyPass` {#opt-services.loops-server.nginx.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.locations.<name>.proxyWebsockets` {#opt-services.loops-server.nginx.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.locations.<name>.recommendedProxySettings` {#opt-services.loops-server.nginx.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.locations.<name>.recommendedUwsgiSettings` {#opt-services.loops-server.nginx.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.locations.<name>.return` {#opt-services.loops-server.nginx.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.locations.<name>.root` {#opt-services.loops-server.nginx.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.locations.<name>.tryFiles` {#opt-services.loops-server.nginx.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.locations.<name>.useGrpcErrorPages` {#opt-services.loops-server.nginx.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.locations.<name>.uwsgiPass` {#opt-services.loops-server.nginx.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.onlySSL` {#opt-services.loops-server.nginx.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.quic` {#opt-services.loops-server.nginx.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.redirectCode` {#opt-services.loops-server.nginx.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.rejectSSL` {#opt-services.loops-server.nginx.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.reuseport` {#opt-services.loops-server.nginx.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.root` {#opt-services.loops-server.nginx.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.serverAliases` {#opt-services.loops-server.nginx.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.serverName` {#opt-services.loops-server.nginx.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.sslCertificate` {#opt-services.loops-server.nginx.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.sslCertificateKey` {#opt-services.loops-server.nginx.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.sslTrustedCertificate` {#opt-services.loops-server.nginx.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.nginx.useACMEHost` {#opt-services.loops-server.nginx.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.package` {#opt-services.loops-server.package}

The loops-server package to use.

*Type:* package

*Default:* `pkgs.loops-server`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.phpPackage` {#opt-services.loops-server.phpPackage}

The php85 package to use.

*Type:* package

*Default:* `pkgs.php85`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.poolConfig` {#opt-services.loops-server.poolConfig}

Options for Loops's PHP-FPM pool.

*Type:* attribute set of (signed integer or string or boolean)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.redis.createLocally` {#opt-services.loops-server.redis.createLocally}

Whether to enable a local Redis database using UNIX socket authentication.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.schedulerInterval` {#opt-services.loops-server.schedulerInterval}

How often the Loops cron task should run

*Type:* string

*Default:* `"1d"`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.secretFile` {#opt-services.loops-server.secretFile}

A secret file to be sourced for the .env settings.
Place `APP_KEY` and other settings that should not end up in the Nix store here.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.settings` {#opt-services.loops-server.settings}

.env settings for Loops.
Secrets should use `secretFile` option instead.

*Type:* attribute set of (boolean or signed integer or string)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.loops-server.user` {#opt-services.loops-server.user}

User account under which Loops runs.

::: note
If left as the default value this user will automatically be created
on system activation, otherwise you are responsible for
ensuring the user exists before the Loops application starts.
:::

*Type:* string

*Default:* `"loops"`

*Declared by:* [`nixos/modules/services/web-apps/loops-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/loops-server.nix)

## `services.lorri.enable` {#opt-services.lorri.enable}

Enables the daemon for `lorri`, a nix-shell replacement for project
development. The socket-activated daemon starts on the first request
issued by the `lorri` command.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/development/lorri.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/lorri.nix)

## `services.lorri.package` {#opt-services.lorri.package}

The lorri package to use.

*Type:* package

*Default:* `pkgs.lorri`

*Declared by:* [`nixos/modules/services/development/lorri.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/lorri.nix)

## `services.lubelogger.dataDir` {#opt-services.lubelogger.dataDir}

Path to LubeLogger config and metadata inside of `/var/lib/`.

*Type:* string

*Default:* `"lubelogger"`

*Declared by:* [`nixos/modules/services/web-apps/lubelogger.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lubelogger.nix)

## `services.lubelogger.enable` {#opt-services.lubelogger.enable}

Whether to enable LubeLogger, a self-hosted, open-source, web-based vehicle maintenance and fuel milage tracker.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/lubelogger.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lubelogger.nix)

## `services.lubelogger.environmentFile` {#opt-services.lubelogger.environmentFile}

Path to a file containing extra LubeLogger config options in the systemd `EnvironmentFile` format.
Refer to the [documentation](https://docs.lubelogger.com/Advanced/Environment%20Variables) for supported options.

This can be used to pass secrets to LubeLogger without putting them in the Nix store.

For example, to set an SMTP password, point `environmentFile` at a file containing:

```
MailConfig__Password=<pass>
```

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/lubelogger"`

*Declared by:* [`nixos/modules/services/web-apps/lubelogger.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lubelogger.nix)

## `services.lubelogger.group` {#opt-services.lubelogger.group}

Group under which LubeLogger runs.

*Type:* string

*Default:* `"lubelogger"`

*Declared by:* [`nixos/modules/services/web-apps/lubelogger.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lubelogger.nix)

## `services.lubelogger.listenAddress` {#opt-services.lubelogger.listenAddress}

The address LubeLogger will listen on.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/lubelogger.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lubelogger.nix)

## `services.lubelogger.openFirewall` {#opt-services.lubelogger.openFirewall}

Open ports in the firewall for the LubeLogger web interface.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/lubelogger.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lubelogger.nix)

## `services.lubelogger.package` {#opt-services.lubelogger.package}

The lubelogger package to use.

*Type:* package

*Default:* `pkgs.lubelogger`

*Declared by:* [`nixos/modules/services/web-apps/lubelogger.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lubelogger.nix)

## `services.lubelogger.port` {#opt-services.lubelogger.port}

The TCP port LubeLogger will listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5000`

*Declared by:* [`nixos/modules/services/web-apps/lubelogger.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lubelogger.nix)

## `services.lubelogger.settings` {#opt-services.lubelogger.settings}

Additional configuration for LubeLogger, see [https://docs.lubelogger.com/Environment%20Variables](https://docs.lubelogger.com/Environment%20Variables) for supported values.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  LUBELOGGER_ALLOWED_FILE_EXTENSIONS = "";
  LUBELOGGER_LOGO_URL = "";
}
```

*Declared by:* [`nixos/modules/services/web-apps/lubelogger.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lubelogger.nix)

## `services.lubelogger.user` {#opt-services.lubelogger.user}

User account under which LubeLogger runs.

*Type:* string

*Default:* `"lubelogger"`

*Declared by:* [`nixos/modules/services/web-apps/lubelogger.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/lubelogger.nix)

## `services.lvm.boot.thin.enable` {#opt-services.lvm.boot.thin.enable}

Whether to enable support for booting from ThinLVs.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/tasks/lvm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/lvm.nix)

## `services.lvm.boot.vdo.enable` {#opt-services.lvm.boot.vdo.enable}

Whether to enable support for booting from VDOLVs.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/tasks/lvm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/lvm.nix)

## `services.lvm.dmeventd.enable` {#opt-services.lvm.dmeventd.enable}

Whether to enable the LVM dmevent daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/tasks/lvm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/lvm.nix)

## `services.lvm.enable` {#opt-services.lvm.enable}

Whether to enable lvm2.

::: note
The lvm2 package contains device-mapper udev rules and without those tools like cryptsetup do not fully function!
:::

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/tasks/lvm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/lvm.nix)

## `services.lvm.resizeHelper.enable` {#opt-services.lvm.resizeHelper.enable}

Whether to enable lvresize\_fs\_helper.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/tasks/lvm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/lvm.nix)

## `services.lxd-image-server.enable` {#opt-services.lxd-image-server.enable}

Whether to enable lxd-image-server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/lxd-image-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lxd-image-server.nix)

## `services.lxd-image-server.group` {#opt-services.lxd-image-server.group}

Group assigned to the user and the webroot directory.

*Type:* string

*Default:* `"nginx"`

*Example:* `"www-data"`

*Declared by:* [`nixos/modules/services/networking/lxd-image-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lxd-image-server.nix)

## `services.lxd-image-server.nginx.domain` {#opt-services.lxd-image-server.nginx.domain}

Domain to use for nginx virtual host.

*Type:* string

*Example:* `"images.example.org"`

*Declared by:* [`nixos/modules/services/networking/lxd-image-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lxd-image-server.nix)

## `services.lxd-image-server.nginx.enable` {#opt-services.lxd-image-server.nginx.enable}

Whether to enable nginx.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/lxd-image-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lxd-image-server.nix)

## `services.lxd-image-server.settings` {#opt-services.lxd-image-server.settings}

Configuration for lxd-image-server.

Example see [https://github.com/Avature/lxd-image-server/blob/master/config.toml](https://github.com/Avature/lxd-image-server/blob/master/config.toml).

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/lxd-image-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lxd-image-server.nix)

## `services.lxmd.enable` {#opt-services.lxmd.enable}

Whether to enable Enable Reticulum Network Lightweight Extensible Message Format Daemon (lxmd).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/lxmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lxmd.nix)

## `services.lxmd.extraGroups` {#opt-services.lxmd.extraGroups}

Additional groups for the lxmd service user.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/lxmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lxmd.nix)

## `services.lxmd.healthCheck.enable` {#opt-services.lxmd.healthCheck.enable}

Whether to enable wait for lxmd to become healthy after startup.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/lxmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lxmd.nix)

## `services.lxmd.healthCheck.intervalSeconds` {#opt-services.lxmd.healthCheck.intervalSeconds}

Delay in seconds between each `lxmd --status` health check attempt.

*Type:* positive integer, meaning \>0

*Default:* `2`

*Declared by:* [`nixos/modules/services/networking/lxmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lxmd.nix)

## `services.lxmd.healthCheck.timeoutSeconds` {#opt-services.lxmd.healthCheck.timeoutSeconds}

Maximum time in seconds to wait for `lxmd --status` to succeed during startup.

*Type:* positive integer, meaning \>0

*Default:* `120`

*Declared by:* [`nixos/modules/services/networking/lxmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lxmd.nix)

## `services.lxmd.identityFile` {#opt-services.lxmd.identityFile}

Path to lxmd identity file. This file will be copied to the state directory on service start.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/lxmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lxmd.nix)

## `services.lxmd.package` {#opt-services.lxmd.package}

The lxmf package to use.

*Type:* package

*Default:* `pkgs.lxmf`

*Declared by:* [`nixos/modules/services/networking/lxmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lxmd.nix)

## `services.lxmd.packageBinaryName` {#opt-services.lxmd.packageBinaryName}

Name of the program to use. Useful in case of using an alternative implementation.

*Type:* string

*Default:* `"lxmd"`

*Declared by:* [`nixos/modules/services/networking/lxmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lxmd.nix)

## `services.lxmd.rnsd.identities` {#opt-services.lxmd.rnsd.identities}

Map of identity names to paths of identity files.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/lxmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lxmd.nix)

## `services.lxmd.rnsd.identityFile` {#opt-services.lxmd.rnsd.identityFile}

Path to rnsd identity file. This file will be copied to the state directory on service start.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/lxmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lxmd.nix)

## `services.lxmd.rnsd.settings` {#opt-services.lxmd.rnsd.settings}

Structured rnsd configuration. The generated file is copied to the state directory on service start. Use `rnsd --exampleconfig` to get an example config file.

*Type:* null or ConfigObj mapping value

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/lxmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lxmd.nix)

## `services.lxmd.settings` {#opt-services.lxmd.settings}

Structured lxmd configuration. The generated file is copied to the state directory on service start. Use `lxmd --exampleconfig` to get an example config file.

*Type:* null or ConfigObj mapping value

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/lxmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/lxmd.nix)
