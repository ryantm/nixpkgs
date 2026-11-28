# services (N) {#sec-options-services-n}

## `services.n8n.customNodes` {#opt-services.n8n.customNodes}

List of custom n8n community node packages to load.
Each package is expected to be an npm package with an `n8n.nodes` entry in its `package.json`.
The packages are made available to n8n via the `N8N_CUSTOM_EXTENSIONS` environment variable.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.n8n-nodes-carbonejs ]`

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.n8n.enable` {#opt-services.n8n.enable}

Whether to enable n8n server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.n8n.environment` {#opt-services.n8n.environment}

Environment variables to pass to the n8n service.
See [https://docs.n8n.io/hosting/configuration/environment-variables/](https://docs.n8n.io/hosting/configuration/environment-variables/) for available options.

Environment variables ending with `_FILE` are automatically handled as secrets:
they are loaded via systemd credentials for secure access with `DynamicUser=true`.

This can be useful to pass secrets via tools like `agenix` or `sops-nix`.

*Type:* open submodule of attribute set of (string or (string or signed integer convertible to it) or (string or boolean convertible to it))

*Default:* `{ }`

*Example:*

``` nix
{
  N8N_ENCRYPTION_KEY_FILE = "/run/n8n/encryption_key";
  DB_POSTGRESDB_PASSWORD_FILE = "/run/n8n/db_postgresdb_password";
  WEBHOOK_URL = "https://n8n.example.com";
}
```

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.n8n.environment.GENERIC_TIMEZONE` {#opt-services.n8n.environment.GENERIC_TIMEZONE}

The n8n instance timezone. Important for schedule nodes (such as Cron).

*Type:* null or string

*Default:* `config.time.timeZone`

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.n8n.environment.N8N_DIAGNOSTICS_ENABLED` {#opt-services.n8n.environment.N8N_DIAGNOSTICS_ENABLED}

Whether to share selected, anonymous telemetry with n8n.
Note that if you set this to false, you can't enable Ask AI in the Code node.

*Type:* string or boolean convertible to it

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.n8n.environment.N8N_PORT` {#opt-services.n8n.environment.N8N_PORT}

The HTTP port n8n runs on.

*Type:* string or 16 bit unsigned integer; between 0 and 65535 (both inclusive) convertible to it

*Default:* `5678`

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.n8n.environment.N8N_RUNNERS_AUTH_TOKEN_FILE` {#opt-services.n8n.environment.N8N_RUNNERS_AUTH_TOKEN_FILE}

Path to a file containing the shared authentication token
used between the n8n server (task broker) and the task runners.

This option is required when [`services.n8n.taskRunners.enable`](#opt-services.n8n.taskRunners.enable) is true.
The file should be readable by the service and not stored in the Nix store.
Use tools like `agenix` or `sops-nix` to manage this secret.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.n8n.environment.N8N_RUNNERS_BROKER_LISTEN_ADDRESS` {#opt-services.n8n.environment.N8N_RUNNERS_BROKER_LISTEN_ADDRESS}

Address the task broker listens on.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.n8n.environment.N8N_RUNNERS_BROKER_PORT` {#opt-services.n8n.environment.N8N_RUNNERS_BROKER_PORT}

Port the task broker listens on for task runner connections.

*Type:* string or 16 bit unsigned integer; between 0 and 65535 (both inclusive) convertible to it

*Default:* `5679`

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.n8n.environment.N8N_USER_FOLDER` {#opt-services.n8n.environment.N8N_USER_FOLDER}

Provide the path where n8n will create the .n8n folder.
This directory stores user-specific data, such as database file and encryption key.

*Type:* absolute path

*Default:* `"/var/lib/n8n"`

*Read only*

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.n8n.environment.N8N_VERSION_NOTIFICATIONS_ENABLED` {#opt-services.n8n.environment.N8N_VERSION_NOTIFICATIONS_ENABLED}

When enabled, n8n sends notifications of new versions and security updates.

*Type:* string or boolean convertible to it

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.n8n.openFirewall` {#opt-services.n8n.openFirewall}

Open ports in the firewall for the n8n web interface.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.n8n.package` {#opt-services.n8n.package}

The n8n package to use.

*Type:* package

*Default:* `pkgs.n8n`

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.n8n.taskRunners.enable` {#opt-services.n8n.taskRunners.enable}

Whether to enable n8n task runners for sandboxed Code node execution.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.n8n.taskRunners.environment` {#opt-services.n8n.taskRunners.environment}

Environment variables for the task runner launcher and runners.
These are common to all runners and passed via `allowed-env` in the launcher config.
See [https://docs.n8n.io/hosting/configuration/environment-variables/task-runners/](https://docs.n8n.io/hosting/configuration/environment-variables/task-runners/) for available options.

Environment variables ending with `_FILE` are automatically handled as secrets:
they are loaded via systemd credentials for secure access with `DynamicUser=true`.

Note: The authentication token should be set via [`services.n8n.environment.N8N_RUNNERS_AUTH_TOKEN_FILE`](#opt-services.n8n.environment.N8N_RUNNERS_AUTH_TOKEN_FILE).

*Type:* open submodule of attribute set of (string or (string or signed integer convertible to it) or (string or boolean convertible to it))

*Default:* `{ }`

*Example:*

``` nix
{
  N8N_RUNNERS_AUTO_SHUTDOWN_TIMEOUT = 15;
  N8N_RUNNERS_MAX_CONCURRENCY = 10;
}
```

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.n8n.taskRunners.environment.N8N_RUNNERS_AUTH_TOKEN_FILE` {#opt-services.n8n.taskRunners.environment.N8N_RUNNERS_AUTH_TOKEN_FILE}

Path to the authentication token file for the task runner.

*Type:* null or absolute path

*Default:* `config.services.n8n.environment.N8N_RUNNERS_AUTH_TOKEN_FILE`

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.n8n.taskRunners.environment.N8N_RUNNERS_TASK_BROKER_URI` {#opt-services.n8n.taskRunners.environment.N8N_RUNNERS_TASK_BROKER_URI}

URI of the n8n task broker that the runner connects to.

*Type:* string

*Default:* `"http://${config.services.n8n.environment.N8N_RUNNERS_BROKER_LISTEN_ADDRESS}:${config.services.n8n.environment.N8N_RUNNERS_BROKER_PORT}"`

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.n8n.taskRunners.launcherPackage` {#opt-services.n8n.taskRunners.launcherPackage}

The n8n-task-runner-launcher package to use.

*Type:* package

*Default:* `pkgs.n8n-task-runner-launcher`

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.n8n.taskRunners.runners` {#opt-services.n8n.taskRunners.runners}

Configuration for individual task runners.

*Type:* attribute set of (submodule)

*Default:*

``` nix
{
  javascript = {
    enable = true;
    command = lib.getExe' config.services.n8n.package "n8n-task-runner";
    healthCheckPort = 5681;
  };
  python = {
    enable = true;
    command = lib.getExe' config.services.n8n.package "n8n-task-runner-python";
    healthCheckPort = 5682;
  };
}
```

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.n8n.taskRunners.runners.<name>.args` {#opt-services.n8n.taskRunners.runners._name_.args}

Additional command-line arguments to pass to the task runner.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.n8n.taskRunners.runners.<name>.command` {#opt-services.n8n.taskRunners.runners._name_.command}

Command to execute for this runner.

*Type:* string

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.n8n.taskRunners.runners.<name>.enable` {#opt-services.n8n.taskRunners.runners._name_.enable}

Whether to enable the ‹name› task runner.
Only takes effect when [`services.n8n.taskRunners.enable`](#opt-services.n8n.taskRunners.enable) is true.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.n8n.taskRunners.runners.<name>.environment` {#opt-services.n8n.taskRunners.runners._name_.environment}

Environment variables specific to this task runner.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.n8n.taskRunners.runners.<name>.healthCheckPort` {#opt-services.n8n.taskRunners.runners._name_.healthCheckPort}

Port for the runner's health check server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/services/misc/n8n.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/n8n.nix)

## `services.nagios.cgiConfigFile` {#opt-services.nagios.cgiConfigFile}

Derivation for the configuration file of Nagios CGI scripts
that can be used in web servers for running the Nagios web interface.

*Type:* package

*Default:* `nagiosCGICfgFile`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.enable` {#opt-services.nagios.enable}

Whether to enable [Nagios](https://www.nagios.org/) to monitor your system or network.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.enableWebInterface` {#opt-services.nagios.enableWebInterface}

Whether to enable the Nagios web interface.  You should also
enable Apache ([`services.httpd.enable`](../../options/services-h/index.md#opt-services.httpd.enable)).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.extraConfig` {#opt-services.nagios.extraConfig}

Configuration to add to /etc/nagios.cfg

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  debug_file = "/var/log/nagios/debug.log";
  debug_level = "-1";
}
```

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.mainConfigFile` {#opt-services.nagios.mainConfigFile}

If non-null, overrides the main configuration file of Nagios.

*Type:* null or package

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.objectDefs` {#opt-services.nagios.objectDefs}

A list of Nagios object configuration files that must define
the hosts, host groups, services and contacts for the
network that you want Nagios to monitor.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:* `[ ./objects.cfg ]`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.plugins` {#opt-services.nagios.plugins}

Packages to be added to the Nagios `PATH`.
Typically used to add plugins, but can be anything.

*Type:* list of package

*Default:* `[pkgs.monitoring-plugins pkgs.msmtp pkgs.mailutils]`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.validateConfig` {#opt-services.nagios.validateConfig}

if true, the syntax of the nagios configuration file is checked at build time

*Type:* boolean

*Default:* `pkgs.stdenv.hostPlatform == pkgs.stdenv.buildPlatform`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost` {#opt-services.nagios.virtualHost}

Apache configuration can be done by adapting [`services.httpd.virtualHosts`](../../options/services-h/index.md#opt-services.httpd.virtualHosts).
See [services (H)](../../options/services-h/index.md#opt-services.httpd.virtualHosts) for further information.

*Type:* submodule

*Example:*

``` nix
{ hostName = "example.org";
  adminAddr = "webmaster@example.org";
  enableSSL = true;
  sslServerCert = "/var/lib/acme/example.org/full.pem";
  sslServerKey = "/var/lib/acme/example.org/key.pem";
}
```

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.acmeRoot` {#opt-services.nagios.virtualHost.acmeRoot}

Directory for the acme challenge which is PUBLIC, don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.addSSL` {#opt-services.nagios.virtualHost.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.adminAddr` {#opt-services.nagios.virtualHost.adminAddr}

E-mail address of the server administrator.

*Type:* null or string

*Default:* `null`

*Example:* `"admin@example.org"`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.documentRoot` {#opt-services.nagios.virtualHost.documentRoot}

The path of Apache's document root directory.  If left undefined,
an empty directory in the Nix store will be used as root.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.enableACME` {#opt-services.nagios.virtualHost.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.enableUserDir` {#opt-services.nagios.virtualHost.enableUserDir}

Whether to enable serving `~/public_html` as
`/~«username»`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.extraConfig` {#opt-services.nagios.virtualHost.extraConfig}

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

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.forceSSL` {#opt-services.nagios.virtualHost.forceSSL}

Whether to add a separate nginx server block that permanently redirects (301)
all plain HTTP traffic to HTTPS. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443), where the non-SSL listens are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.globalRedirect` {#opt-services.nagios.virtualHost.globalRedirect}

If set, all requests for this host are redirected permanently to
the given URL.

*Type:* null or string

*Default:* `null`

*Example:* `"http://newserver.example.org/"`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.hostName` {#opt-services.nagios.virtualHost.hostName}

Canonical hostname for the server.

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.http2` {#opt-services.nagios.virtualHost.http2}

Whether to enable HTTP 2. HTTP/2 is supported in all multi-processing modules that come with httpd. *However, if you use the prefork mpm, there will
be severe restrictions.* Refer to [https://httpd.apache.org/docs/2.4/howto/http2.html#mpm-config](https://httpd.apache.org/docs/2.4/howto/http2.html#mpm-config) for details.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.listen` {#opt-services.nagios.virtualHost.listen}

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

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.listen.*.ip` {#opt-services.nagios.virtualHost.listen._.ip}

IP to listen on. 0.0.0.0 for IPv4 only, \* for all.

*Type:* string

*Default:* `"*"`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.listen.*.port` {#opt-services.nagios.virtualHost.listen._.port}

Port to listen on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.listen.*.ssl` {#opt-services.nagios.virtualHost.listen._.ssl}

Whether to enable SSL (https) support.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.listenAddresses` {#opt-services.nagios.virtualHost.listenAddresses}

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

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.locations` {#opt-services.nagios.virtualHost.locations}

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

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.locations.<name>.alias` {#opt-services.nagios.virtualHost.locations._name_.alias}

Alias directory for requests. See [https://httpd.apache.org/docs/2.4/mod/mod\_alias.html#alias](https://httpd.apache.org/docs/2.4/mod/mod_alias.html#alias).

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.locations.<name>.extraConfig` {#opt-services.nagios.virtualHost.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.locations.<name>.index` {#opt-services.nagios.virtualHost.locations._name_.index}

Adds DirectoryIndex directive. See [https://httpd.apache.org/docs/2.4/mod/mod\_dir.html#directoryindex](https://httpd.apache.org/docs/2.4/mod/mod_dir.html#directoryindex).

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.locations.<name>.priority` {#opt-services.nagios.virtualHost.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.locations.<name>.proxyPass` {#opt-services.nagios.virtualHost.locations._name_.proxyPass}

Sets up a simple reverse proxy as described by [https://httpd.apache.org/docs/2.4/howto/reverse\_proxy.html#simple](https://httpd.apache.org/docs/2.4/howto/reverse_proxy.html#simple).

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.logFormat` {#opt-services.nagios.virtualHost.logFormat}

Log format for Apache's log files. Possible values are: combined, common, referer, agent.

*Type:* string

*Default:* `"common"`

*Example:* `"combined"`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.onlySSL` {#opt-services.nagios.virtualHost.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.robotsEntries` {#opt-services.nagios.virtualHost.robotsEntries}

Specification of pages to be ignored by web crawlers. See [http://www.robotstxt.org/](http://www.robotstxt.org/) for details.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"Disallow: /foo/"`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.servedDirs` {#opt-services.nagios.virtualHost.servedDirs}

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

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.servedFiles` {#opt-services.nagios.virtualHost.servedFiles}

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

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.serverAliases` {#opt-services.nagios.virtualHost.serverAliases}

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

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.sslServerCert` {#opt-services.nagios.virtualHost.sslServerCert}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.sslServerChain` {#opt-services.nagios.virtualHost.sslServerChain}

Path to server SSL chain file.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/ca.pem"`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.sslServerKey` {#opt-services.nagios.virtualHost.sslServerKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.nagios.virtualHost.useACMEHost` {#opt-services.nagios.virtualHost.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/nagios.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nagios.nix)

## `services.namecoind.enable` {#opt-services.namecoind.enable}

Whether to enable namecoind, Namecoin client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/namecoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/namecoind.nix)

## `services.namecoind.extraNodes` {#opt-services.namecoind.extraNodes}

List of additional peer IP addresses to connect to.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/namecoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/namecoind.nix)

## `services.namecoind.generate` {#opt-services.namecoind.generate}

Whether to generate (mine) Namecoins.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/namecoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/namecoind.nix)

## `services.namecoind.rpc.address` {#opt-services.namecoind.rpc.address}

IP address the RPC server will bind to.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/networking/namecoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/namecoind.nix)

## `services.namecoind.rpc.allowFrom` {#opt-services.namecoind.rpc.allowFrom}

List of IP address ranges allowed to use the RPC API.
Wiledcards (\*) can be user to specify a range.

*Type:* list of string

*Default:*

``` nix
[
  "127.0.0.1"
]
```

*Declared by:* [`nixos/modules/services/networking/namecoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/namecoind.nix)

## `services.namecoind.rpc.certificate` {#opt-services.namecoind.rpc.certificate}

Certificate file for securing RPC connections.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/namecoind/server.cert"`

*Declared by:* [`nixos/modules/services/networking/namecoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/namecoind.nix)

## `services.namecoind.rpc.key` {#opt-services.namecoind.rpc.key}

Key file for securing RPC connections.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/namecoind/server.pem"`

*Declared by:* [`nixos/modules/services/networking/namecoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/namecoind.nix)

## `services.namecoind.rpc.password` {#opt-services.namecoind.rpc.password}

Password for RPC connections.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/namecoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/namecoind.nix)

## `services.namecoind.rpc.port` {#opt-services.namecoind.rpc.port}

Port the RPC server will bind to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8332`

*Declared by:* [`nixos/modules/services/networking/namecoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/namecoind.nix)

## `services.namecoind.rpc.user` {#opt-services.namecoind.rpc.user}

User name for RPC connections.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/namecoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/namecoind.nix)

## `services.namecoind.trustedNodes` {#opt-services.namecoind.trustedNodes}

List of the only peer IP addresses to connect to. If specified
no other connection will be made.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/namecoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/namecoind.nix)

## `services.namecoind.wallet` {#opt-services.namecoind.wallet}

Wallet file. The ownership of the file has to be
namecoin:namecoin, and the permissions must be 0640.

*Type:* absolute path

*Default:* `"/var/lib/namecoind/wallet.dat"`

*Declared by:* [`nixos/modules/services/networking/namecoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/namecoind.nix)

## `services.nar-serve.cacheURL` {#opt-services.nar-serve.cacheURL}

Binary cache URL to connect to.

The URL format is compatible with the nix remote url style, such as:

- http://, https:// for binary caches via HTTP or HTTPS
- s3:// for binary caches stored in Amazon S3
- gs:// for binary caches stored in Google Cloud Storage

*Type:* string

*Default:* `"https://cache.nixos.org/"`

*Declared by:* [`nixos/modules/services/networking/nar-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nar-serve.nix)

## `services.nar-serve.domain` {#opt-services.nar-serve.domain}

When set, enables the feature of serving <nar-hash>.<domain>
on top of <domain>/nix/store/<nar-hash>-<pname>.

Useful to preview static websites where paths are absolute.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/nar-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nar-serve.nix)

## `services.nar-serve.enable` {#opt-services.nar-serve.enable}

Whether to enable serving NAR file contents via HTTP.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nar-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nar-serve.nix)

## `services.nar-serve.maxConcurrency` {#opt-services.nar-serve.maxConcurrency}

How many requests can walk an archive at the same time.

Decompressing a NAR up to the wanted file is the whole cost of a
request, thus this is what bounds the CPU use of the service.
Requests over the limit wait for a free slot, they are not refused.

Zero does not limit anything.

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Declared by:* [`nixos/modules/services/networking/nar-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nar-serve.nix)

## `services.nar-serve.metricsAddress` {#opt-services.nar-serve.metricsAddress}

Address to serve Prometheus metrics from, as `host:port`.

The metrics get their own listener, thus they can stay on an address
that is not the one the service answers the world from.

An empty string does not serve metrics.

*Type:* string

*Default:* `""`

*Example:* `"127.0.0.1:9464"`

*Declared by:* [`nixos/modules/services/networking/nar-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nar-serve.nix)

## `services.nar-serve.package` {#opt-services.nar-serve.package}

The nar-serve package to use.

*Type:* package

*Default:* `pkgs.nar-serve`

*Declared by:* [`nixos/modules/services/networking/nar-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nar-serve.nix)

## `services.nar-serve.port` {#opt-services.nar-serve.port}

Port number where nar-serve will listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8383`

*Declared by:* [`nixos/modules/services/networking/nar-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nar-serve.nix)

## `services.nats.dataDir` {#opt-services.nats.dataDir}

The NATS data directory. Only used if JetStream is enabled, for
storing stream metadata and messages.

If left as the default value this directory will automatically be
created before the NATS server starts, otherwise the sysadmin is
responsible for ensuring the directory exists with appropriate
ownership and permissions.

*Type:* absolute path

*Default:* `"/var/lib/nats"`

*Declared by:* [`nixos/modules/services/networking/nats.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nats.nix)

## `services.nats.enable` {#opt-services.nats.enable}

Whether to enable NATS messaging system.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nats.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nats.nix)

## `services.nats.group` {#opt-services.nats.group}

Group under which NATS runs.

*Type:* string

*Default:* `"nats"`

*Declared by:* [`nixos/modules/services/networking/nats.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nats.nix)

## `services.nats.jetstream` {#opt-services.nats.jetstream}

Whether to enable JetStream.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nats.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nats.nix)

## `services.nats.port` {#opt-services.nats.port}

Port on which to listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4222`

*Declared by:* [`nixos/modules/services/networking/nats.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nats.nix)

## `services.nats.serverName` {#opt-services.nats.serverName}

Name of the NATS server, must be unique if clustered.

*Type:* string

*Default:* `"nats"`

*Example:* `"n1-c3"`

*Declared by:* [`nixos/modules/services/networking/nats.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nats.nix)

## `services.nats.settings` {#opt-services.nats.settings}

Declarative NATS configuration. See the
[
NATS documentation](https://docs.nats.io/nats-server/configuration) for a list of options.

*Type:* JSON value

*Default:* `{ }`

*Example:*

``` nix
{
  jetstream = {
    max_mem = "1G";
    max_file = "10G";
  };
};
```

*Declared by:* [`nixos/modules/services/networking/nats.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nats.nix)

## `services.nats.user` {#opt-services.nats.user}

User account under which NATS runs.

*Type:* string

*Default:* `"nats"`

*Declared by:* [`nixos/modules/services/networking/nats.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nats.nix)

## `services.nats.validateConfig` {#opt-services.nats.validateConfig}

If true, validate nats config at build time. When the config can't
be checked during build time, for example when it includes other
files, disable this option.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/nats.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nats.nix)

## `services.navidrome.enable` {#opt-services.navidrome.enable}

Whether to enable Navidrome music server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/navidrome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/navidrome.nix)

## `services.navidrome.environmentFile` {#opt-services.navidrome.environmentFile}

Environment file, used to set any secret ND\_\* environment variables.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/audio/navidrome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/navidrome.nix)

## `services.navidrome.finalPackage` {#opt-services.navidrome.finalPackage}

The final navidrome package including all selected plugins.

*Type:* package

*Default:*

``` nix
cfg.package.withPlugins cfg.withPlugins;
```

*Read only*

*Declared by:* [`nixos/modules/services/audio/navidrome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/navidrome.nix)

## `services.navidrome.group` {#opt-services.navidrome.group}

Group under which Navidrome runs.

*Type:* string

*Default:* `"navidrome"`

*Declared by:* [`nixos/modules/services/audio/navidrome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/navidrome.nix)

## `services.navidrome.openFirewall` {#opt-services.navidrome.openFirewall}

Whether to open the TCP port in the firewall

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/audio/navidrome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/navidrome.nix)

## `services.navidrome.package` {#opt-services.navidrome.package}

The navidrome package to use.

*Type:* package

*Default:* `pkgs.navidrome`

*Declared by:* [`nixos/modules/services/audio/navidrome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/navidrome.nix)

## `services.navidrome.settings` {#opt-services.navidrome.settings}

Configuration for Navidrome, see [https://www.navidrome.org/docs/usage/configuration-options/](https://www.navidrome.org/docs/usage/configuration-options/) for supported values.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Example:*

``` nix
{
  MusicFolder = "/mnt/music";
}
```

*Declared by:* [`nixos/modules/services/audio/navidrome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/navidrome.nix)

## `services.navidrome.settings.Address` {#opt-services.navidrome.settings.Address}

Address to run Navidrome on.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/audio/navidrome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/navidrome.nix)

## `services.navidrome.settings.EnableInsightsCollector` {#opt-services.navidrome.settings.EnableInsightsCollector}

Enable anonymous usage data collection, see [https://www.navidrome.org/docs/getting-started/insights/](https://www.navidrome.org/docs/getting-started/insights/) for details.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/audio/navidrome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/navidrome.nix)

## `services.navidrome.settings.Plugins.Enabled` {#opt-services.navidrome.settings.Plugins.Enabled}

Enable plugin support in navidrome.

*Type:* unspecified value

*Default:* `true`

*Declared by:* [`nixos/modules/services/audio/navidrome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/navidrome.nix)

## `services.navidrome.settings.Plugins.Folder` {#opt-services.navidrome.settings.Plugins.Folder}

The folder containing navidrome plugins.

This directory is automatically created from plugins defined in `services.navidrome.plugins`.

*Type:* string

*Default:* `"${config.services.navidrome.finalPackage}/share/plugins"`

*Read only*

*Declared by:* [`nixos/modules/services/audio/navidrome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/navidrome.nix)

## `services.navidrome.settings.Port` {#opt-services.navidrome.settings.Port}

Port to run Navidrome on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4533`

*Declared by:* [`nixos/modules/services/audio/navidrome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/navidrome.nix)

## `services.navidrome.user` {#opt-services.navidrome.user}

User under which Navidrome runs.

*Type:* string

*Default:* `"navidrome"`

*Declared by:* [`nixos/modules/services/audio/navidrome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/navidrome.nix)

## `services.navidrome.withPlugins` {#opt-services.navidrome.withPlugins}

Plugins to bundle with Navidrome

*Type:* function that evaluates to a(n) list of wasm plugins loaded by Navidrome

*Default:* `<function>`

*Example:*

``` nix
p: [ p.listenbrainz-daily-playlist ];
```

*Declared by:* [`nixos/modules/services/audio/navidrome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/navidrome.nix)

## `services.nbd.server.enable` {#opt-services.nbd.server.enable}

Whether to enable the Network Block Device (nbd) server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nbd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nbd.nix)

## `services.nbd.server.exports` {#opt-services.nbd.server.exports}

Files or block devices to make available over the network.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/nbd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nbd.nix)

## `services.nbd.server.exports.<name>.allowAddresses` {#opt-services.nbd.server.exports._name_.allowAddresses}

IPs and subnets that are authorized to connect for this device. If not specified, the server will allow all connections.

*Type:* null or (list of string)

*Default:* `null`

*Example:*

``` nix
[
  "10.10.0.0/24"
  "127.0.0.1"
]
```

*Declared by:* [`nixos/modules/services/networking/nbd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nbd.nix)

## `services.nbd.server.exports.<name>.extraOptions` {#opt-services.nbd.server.exports._name_.extraOptions}

Extra options for this export. See
`nbd-server(5)`.

*Type:* attribute set of (boolean or signed integer or floating point number or string)

*Default:*

``` nix
{
  flush = true;
  fua = true;
}
```

*Declared by:* [`nixos/modules/services/networking/nbd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nbd.nix)

## `services.nbd.server.exports.<name>.path` {#opt-services.nbd.server.exports._name_.path}

File or block device to export.

*Type:* string

*Example:* `"/dev/sdb1"`

*Declared by:* [`nixos/modules/services/networking/nbd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nbd.nix)

## `services.nbd.server.extraOptions` {#opt-services.nbd.server.extraOptions}

Extra options for the server. See
`nbd-server(5)`.

*Type:* attribute set of (boolean or signed integer or floating point number or string)

*Default:*

``` nix
{
  allowlist = false;
}
```

*Declared by:* [`nixos/modules/services/networking/nbd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nbd.nix)

## `services.nbd.server.listenAddress` {#opt-services.nbd.server.listenAddress}

Address to listen on. If not specified, the server will listen on all interfaces.

*Type:* null or string

*Default:* `null`

*Example:* `"10.10.0.1"`

*Declared by:* [`nixos/modules/services/networking/nbd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nbd.nix)

## `services.nbd.server.listenPort` {#opt-services.nbd.server.listenPort}

Port to listen on. The port is NOT automatically opened in the firewall.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `10809`

*Declared by:* [`nixos/modules/services/networking/nbd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nbd.nix)

## `services.ncdns.address` {#opt-services.ncdns.address}

The IP address the ncdns resolver will bind to.  Leave this unchanged
if you do not wish to directly expose the resolver.

*Type:* string

*Default:* `"[::1]"`

*Declared by:* [`nixos/modules/services/networking/ncdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncdns.nix)

## `services.ncdns.dnssec.enable` {#opt-services.ncdns.dnssec.enable}

Whether to enable DNSSEC support in ncdns. This will generate KSK and ZSK keypairs
(unless provided via the options
`services.ncdns.dnssec.publicKey`,
`services.ncdns.dnssec.privateKey` etc.) and add a trust
anchor to recursive resolvers
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ncdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncdns.nix)

## `services.ncdns.dnssec.keys.private` {#opt-services.ncdns.dnssec.keys.private}

Path to the file containing the KSK private key.

*Type:* absolute path

*Default:* `"/var/lib/ncdns/bit.private"`

*Declared by:* [`nixos/modules/services/networking/ncdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncdns.nix)

## `services.ncdns.dnssec.keys.public` {#opt-services.ncdns.dnssec.keys.public}

Path to the file containing the KSK public key.
The key can be generated using the `dnssec-keygen`
command, provided by the package `bind` as follows:

```
$ dnssec-keygen -a RSASHA256 -3 -b 2048 -f KSK bit
```

*Type:* absolute path

*Default:* `"/var/lib/ncdns/bit.key"`

*Declared by:* [`nixos/modules/services/networking/ncdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncdns.nix)

## `services.ncdns.dnssec.keys.zonePrivate` {#opt-services.ncdns.dnssec.keys.zonePrivate}

Path to the file containing the ZSK private key.

*Type:* absolute path

*Default:* `"/var/lib/ncdns/bit-zone.private"`

*Declared by:* [`nixos/modules/services/networking/ncdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncdns.nix)

## `services.ncdns.dnssec.keys.zonePublic` {#opt-services.ncdns.dnssec.keys.zonePublic}

Path to the file containing the ZSK public key.
The key can be generated using the `dnssec-keygen`
command, provided by the package `bind` as follows:

```
$ dnssec-keygen -a RSASHA256 -3 -b 2048 bit
```

*Type:* absolute path

*Default:* `"/var/lib/ncdns/bit-zone.key"`

*Declared by:* [`nixos/modules/services/networking/ncdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncdns.nix)

## `services.ncdns.enable` {#opt-services.ncdns.enable}

Whether to enable ncdns, a Go daemon to bridge Namecoin to DNS.
To resolve .bit domains set `services.namecoind.enable = true;`
and an RPC username/password
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ncdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncdns.nix)

## `services.ncdns.identity.address` {#opt-services.ncdns.identity.address}

The IP address the hostname specified in
[`services.ncdns.identity.hostname`](#opt-services.ncdns.identity.hostname) should resolve to.
If you are only using ncdns locally you can ignore this.

*Type:* string

*Default:* `"127.127.127.127"`

*Declared by:* [`nixos/modules/services/networking/ncdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncdns.nix)

## `services.ncdns.identity.hostmaster` {#opt-services.ncdns.identity.hostmaster}

An email address for the SOA record at the bit zone.
If you are only using ncdns locally you can ignore this.

*Type:* string

*Default:* `""`

*Example:* `"root@example.com"`

*Declared by:* [`nixos/modules/services/networking/ncdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncdns.nix)

## `services.ncdns.identity.hostname` {#opt-services.ncdns.identity.hostname}

The hostname of this ncdns instance, which defaults to the machine
hostname. If specified, ncdns lists the hostname as an NS record at
the zone apex:

```
bit. IN NS ns1.example.com.
```

If unset ncdns will generate an internal pseudo-hostname under the
zone, which will resolve to the value of
[`services.ncdns.identity.address`](#opt-services.ncdns.identity.address).
If you are only using ncdns locally you can ignore this.

*Type:* string

*Default:* `config.networking.hostName`

*Example:* `"example.com"`

*Declared by:* [`nixos/modules/services/networking/ncdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncdns.nix)

## `services.ncdns.port` {#opt-services.ncdns.port}

The port the ncdns resolver will bind to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5333`

*Declared by:* [`nixos/modules/services/networking/ncdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncdns.nix)

## `services.ncdns.settings` {#opt-services.ncdns.settings}

ncdns settings. Use this option to configure ncds
settings not exposed in a NixOS option or to bypass one.
See the example ncdns.conf file at [https://github.com/namecoin/ncdns/blob/master/\_doc/ncdns.conf.example](https://github.com/namecoin/ncdns/blob/master/_doc/ncdns.conf.example)
for the available options.

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{ # enable webserver
  ncdns.httplistenaddr = ":8202";

  # synchronize TLS certs
  certstore.nss = true;
  # note: all paths are relative to the config file
  certstore.nsscertdir =  "../../var/lib/ncdns";
  certstore.nssdbdir = "../../home/alice/.pki/nssdb";
}
```

*Declared by:* [`nixos/modules/services/networking/ncdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncdns.nix)

## `services.ncps.analytics.reporting.enable` {#opt-services.ncps.analytics.reporting.enable}

Enable reporting anonymous usage statistics (DB type, Lock type, Total Size) to the project maintainers.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.analytics.reporting.samples` {#opt-services.ncps.analytics.reporting.samples}

Whether to enable Enable printing the analytics samples to stdout. This is useful for debugging and verification purposes only..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.allowDeleteVerb` {#opt-services.ncps.cache.allowDeleteVerb}

Whether to enable Whether to allow the DELETE verb to delete narinfo and nar files from
the cache.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.allowPutVerb` {#opt-services.ncps.cache.allowPutVerb}

Whether to enable Whether to allow the PUT verb to push narinfo and nar files directly
to the cache.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.cdc.avg` {#opt-services.ncps.cache.cdc.avg}

The average chunk size for CDC in bytes.

*Type:* 32 bit unsigned integer; between 0 and 4294967295 (both inclusive)

*Default:* `65536`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.cdc.backgroundWorkers` {#opt-services.ncps.cache.cdc.backgroundWorkers}

Number of background workers for lazy chunking. When null, ncps
defaults to the number of CPUs.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.cdc.chunkWaitTimeout` {#opt-services.ncps.cache.cdc.chunkWaitTimeout}

Maximum time progressive CDC streaming waits for the next chunk
to be produced/become readable before failing the transfer. Keep
it below your reverse-proxy gateway timeout so a stalled chunk on
high-latency storage surfaces as a retryable error to the client
rather than a gateway 504.

*Type:* string

*Default:* `"30s"`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.cdc.deleteDelay` {#opt-services.ncps.cache.cdc.deleteDelay}

Delay before deleting the compressed NAR files after chunking
completes. When null, ncps uses its default (24h).

*Type:* null or string

*Default:* `null`

*Example:* `"24h"`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.cdc.enabled` {#opt-services.ncps.cache.cdc.enabled}

Whether to enable Whether to enable Content-Defined Chunking (CDC) for deduplication (experimental).
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.cdc.lazyChunking` {#opt-services.ncps.cache.cdc.lazyChunking}

Whether to enable lazy chunking: store the compressed NAR first and chunk it in the
background instead of synchronously on upload
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.cdc.lazyCleanupSchedule` {#opt-services.ncps.cache.cdc.lazyCleanupSchedule}

Cron schedule for cleaning up deleted NAR files after lazy
chunking. When null, ncps uses its default (@every 1h).

*Type:* null or string

*Default:* `null`

*Example:* `"@every 1h"`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.cdc.lazyRecoveryBatchSize` {#opt-services.ncps.cache.cdc.lazyRecoveryBatchSize}

Maximum number of stuck NARs to process per recovery cron run.
When null, ncps uses its default (100).

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.cdc.lazyRecoverySchedule` {#opt-services.ncps.cache.cdc.lazyRecoverySchedule}

Cron schedule for recovering stuck CDC NARs. When null, ncps uses
its default (@every 5m).

*Type:* null or string

*Default:* `null`

*Example:* `"@every 5m"`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.cdc.max` {#opt-services.ncps.cache.cdc.max}

The maximum chunk size for CDC in bytes.

*Type:* 32 bit unsigned integer; between 0 and 4294967295 (both inclusive)

*Default:* `262144`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.cdc.min` {#opt-services.ncps.cache.cdc.min}

The minimum chunk size for CDC in bytes.

*Type:* 32 bit unsigned integer; between 0 and 4294967295 (both inclusive)

*Default:* `16384`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.database.pool.maxIdleConns` {#opt-services.ncps.cache.database.pool.maxIdleConns}

Maximum number of idle connections in the pool (0 = use
database-specific defaults).

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.database.pool.maxOpenConns` {#opt-services.ncps.cache.database.pool.maxOpenConns}

Maximum number of open connections to the database (0 = use
database-specific defaults).

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.databaseURL` {#opt-services.ncps.cache.databaseURL}

The URL of the database (currently only SQLite is supported)

*Type:* null or string

*Default:* `"sqlite:/var/lib/ncps/db/db.sqlite"`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.databaseURLFile` {#opt-services.ncps.cache.databaseURLFile}

File containing the URL of the database.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.getTokenFile` {#opt-services.ncps.cache.getTokenFile}

File containing a bearer token required to access the GET and HEAD
routes. When set, requests without a matching
`Authorization: Bearer <token>` header are rejected with 401
Unauthorized. The /healthz and /metrics routes are always exempt.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.hostName` {#opt-services.ncps.cache.hostName}

The hostname of the cache server. **This is used to generate the
private key used for signing store paths (.narinfo)**

*Type:* string

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.inflightStaging.enable` {#opt-services.ncps.cache.inflightStaging.enable}

Whether to enable in-flight NAR staging: serve a NAR cross-instance while it is still
downloading by staging it to shared storage as part-objects once
another replica waits for it. An HA-safe alternative to CDC; only
active with a distributed (Redis) lock backend
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.inflightStaging.partSize` {#opt-services.ncps.cache.inflightStaging.partSize}

Size in bytes of each in-flight staging part-object (a transport
unit, distinct from CDC chunk sizes). Defaults to 8 MiB.

*Type:* positive integer, meaning \>0

*Default:* `8388608`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.inflightStaging.retention` {#opt-services.ncps.cache.inflightStaging.retention}

Grace period to retain in-flight staging part-objects after the
NAR's final representation is committed, so in-flight readers
drain before reclamation.

*Type:* string

*Default:* `"5m"`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.lock.allowDegradedMode` {#opt-services.ncps.cache.lock.allowDegradedMode}

Allow falling back to local locks if Redis is unavailable (WARNING:
breaks HA guarantees).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.lock.backend` {#opt-services.ncps.cache.lock.backend}

Lock backend to use: 'local' (single instance), 'redis'
(distributed).

*Type:* one of "local", "redis"

*Default:* `"local"`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.lock.downloadTTL` {#opt-services.ncps.cache.lock.downloadTTL}

TTL for download locks (per-hash locks).

*Type:* string

*Default:* `"5m0s"`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.lock.lruTTL` {#opt-services.ncps.cache.lock.lruTTL}

TTL for LRU lock (global exclusive lock).

*Type:* string

*Default:* `"30m0s"`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.lock.redisKeyPrefix` {#opt-services.ncps.cache.lock.redisKeyPrefix}

Prefix for all Redis lock keys (only used when Redis is
configured).

*Type:* string

*Default:* `"ncps:lock:"`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.lock.retry.initialDelay` {#opt-services.ncps.cache.lock.retry.initialDelay}

Initial retry delay for distributed locks.

*Type:* string

*Default:* `"100ms"`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.lock.retry.jitter` {#opt-services.ncps.cache.lock.retry.jitter}

Enable jitter in retry delays to prevent thundering herd.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.lock.retry.maxAttempts` {#opt-services.ncps.cache.lock.retry.maxAttempts}

Maximum number of retry attempts for distributed locks.

*Type:* signed integer

*Default:* `3`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.lock.retry.maxDelay` {#opt-services.ncps.cache.lock.retry.maxDelay}

Maximum retry delay for distributed locks (exponential backoff
caps at this).

*Type:* string

*Default:* `"2s"`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.lru.schedule` {#opt-services.ncps.cache.lru.schedule}

The cron spec for cleaning the store to keep it under
config.ncps.cache.maxSize. Refer to
https://pkg.go.dev/github.com/robfig/cron/v3#hdr-Usage for
documentation.

*Type:* null or string

*Default:* `null`

*Example:* `"0 2 * * *"`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.lru.scheduleTimeZone` {#opt-services.ncps.cache.lru.scheduleTimeZone}

The name of the timezone to use for the cron schedule. See
[https://en.wikipedia.org/wiki/List\_of\_tz\_database\_time\_zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)
for a comprehensive list of possible values for this setting.

*Type:* string

*Default:* `"Local"`

*Example:* `"America/Los_Angeles"`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.maxSize` {#opt-services.ncps.cache.maxSize}

The maximum size of the store. It can be given with units such as
5K, 10G etc. Supported units: B, K, M, G, T.

*Type:* null or string

*Default:* `null`

*Example:* `"100G"`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.redis` {#opt-services.ncps.cache.redis}

Configure Redis.

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.redis.addresses` {#opt-services.ncps.cache.redis.addresses}

A list of host:port for the Redis servers that are part of a cluster.
To use a single Redis instance, just set this to its single address.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
''
  ["redis0:6379" "redis1:6379"]
''
```

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.redis.database` {#opt-services.ncps.cache.redis.database}

Redis database number (0-15)

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.redis.password` {#opt-services.ncps.cache.redis.password}

Redis password for authentication (for Redis ACL).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.redis.passwordFile` {#opt-services.ncps.cache.redis.passwordFile}

File containing the redis password for authentication (for Redis ACL).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.redis.poolSize` {#opt-services.ncps.cache.redis.poolSize}

Redis connection pool size.

*Type:* signed integer

*Default:* `10`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.redis.useTLS` {#opt-services.ncps.cache.redis.useTLS}

Use TLS for Redis connection.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.redis.username` {#opt-services.ncps.cache.redis.username}

Redis username for authentication (for Redis ACL).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.requireTrustedSignature` {#opt-services.ncps.cache.requireTrustedSignature}

Whether to enable rejecting narinfos uploaded via PUT that do not carry a signature
trusted by config.ncps.cache.trustedUploadKeys (fail-closed). Only
relevant when config.ncps.cache.allowPutVerb is enabled
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.secretKeyPath` {#opt-services.ncps.cache.secretKeyPath}

The path to load the secretKey for signing narinfos. Leave this
empty to automatically generate a private/public key.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.signNarinfo` {#opt-services.ncps.cache.signNarinfo}

Whether to sign narInfo files or passthru as-is from upstream

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.storage.local` {#opt-services.ncps.cache.storage.local}

The local directory for storing configuration and cached store
paths. This is ignored if services.ncps.cache.storage.s3 is not
null.

*Type:* absolute path

*Default:* `"/var/lib/ncps"`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.storage.s3` {#opt-services.ncps.cache.storage.s3}

Use S3 for storage instead of local storage.

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.storage.s3.accessKeyIdPath` {#opt-services.ncps.cache.storage.s3.accessKeyIdPath}

The path to a file containing only the access-key-id.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.storage.s3.bucket` {#opt-services.ncps.cache.storage.s3.bucket}

The name of the S3 bucket.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.storage.s3.endpoint` {#opt-services.ncps.cache.storage.s3.endpoint}

S3-compatible endpoint URL with scheme.

*Type:* string

*Example:* `"https://s3.amazonaws.com"`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.storage.s3.forcePathStyle` {#opt-services.ncps.cache.storage.s3.forcePathStyle}

Force path-style S3 addressing (bucket/key vs key.bucket).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.storage.s3.region` {#opt-services.ncps.cache.storage.s3.region}

The S3 region.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.storage.s3.secretAccessKeyPath` {#opt-services.ncps.cache.storage.s3.secretAccessKeyPath}

The path to a file containing only the secret-access-key.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.storage.statTimeout` {#opt-services.ncps.cache.storage.statTimeout}

Maximum time the NAR read path waits on a storage presence probe
before treating presence as undetermined. Keep it below your
reverse-proxy read timeout so a stat blocked on slow storage
(e.g. a hard NFS mount) does not let the proxy abort the response
mid-body. Set to `0` to disable the bound.

*Type:* string

*Default:* `"5s"`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.tempPath` {#opt-services.ncps.cache.tempPath}

The path to the temporary directory that is used by the cache to download NAR files

*Type:* absolute path

*Default:* `"/tmp"`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.trustedUploadKeys` {#opt-services.ncps.cache.trustedUploadKeys}

A list of `name:base64` public keys, in nix format, authorizing PUT
uploads when config.ncps.cache.requireTrustedSignature is enabled.
This is independent of config.ncps.cache.upstream.publicKeys.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "cache.example.com-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
]
```

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.upstream.dialerTimeout` {#opt-services.ncps.cache.upstream.dialerTimeout}

Timeout for establishing TCP connections to upstream caches (e.g., 3s, 5s, 10s).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.upstream.publicKeys` {#opt-services.ncps.cache.upstream.publicKeys}

A list of public keys of upstream caches in the format
`host[-[0-9]*]:public-key`. This flag is used to verify the
signatures of store paths downloaded from upstream caches.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
]
```

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.upstream.responseHeaderTimeout` {#opt-services.ncps.cache.upstream.responseHeaderTimeout}

Timeout for waiting for upstream server's response headers.

*Type:* null or string

*Default:* `null`

*Example:* `"5s"`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.cache.upstream.urls` {#opt-services.ncps.cache.upstream.urls}

A list of URLs of upstream binary caches.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "https://cache.nixos.org"
]
```

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.enable` {#opt-services.ncps.enable}

Whether to enable ncps: Nix binary cache proxy service implemented in Go.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.logLevel` {#opt-services.ncps.logLevel}

Set the level for logging. Refer to
[https://pkg.go.dev/github.com/rs/zerolog#readme-leveled-logging](https://pkg.go.dev/github.com/rs/zerolog#readme-leveled-logging) for
more information.

*Type:* one of "trace", "debug", "info", "warn", "error", "fatal", "panic"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.netrcFile` {#opt-services.ncps.netrcFile}

The path to netrc file for upstream authentication.
When unspecified ncps will look for \`\`$HOME/.netrc\`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/etc/nix/netrc"`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.openTelemetry.enable` {#opt-services.ncps.openTelemetry.enable}

Whether to enable Enable OpenTelemetry logs, metrics, and tracing.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.openTelemetry.grpcURL` {#opt-services.ncps.openTelemetry.grpcURL}

Configure OpenTelemetry gRPC URL. Missing or "https" scheme enables
secure gRPC, "insecure" otherwise. Omit to emit telemetry to
stdout.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.package` {#opt-services.ncps.package}

The ncps package to use.

*Type:* package

*Default:* `pkgs.ncps`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.prometheus.enable` {#opt-services.ncps.prometheus.enable}

Whether to enable Enable Prometheus metrics endpoint at /metrics.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ncps.server.addr` {#opt-services.ncps.server.addr}

The address and port the server listens on.

*Type:* string

*Default:* `":8501"`

*Declared by:* [`nixos/modules/services/networking/ncps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ncps.nix)

## `services.ndppd.configFile` {#opt-services.ndppd.configFile}

Path to configuration file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ndppd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ndppd.nix)

## `services.ndppd.enable` {#opt-services.ndppd.enable}

Whether to enable daemon that proxies NDP (Neighbor Discovery Protocol) messages between interfaces.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ndppd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ndppd.nix)

## `services.ndppd.interface` {#opt-services.ndppd.interface}

Interface which is on link-level with router.
(Legacy option, use services.ndppd.proxies.\<interface\>.rules.\<network\> instead)

*Type:* null or string

*Default:* `null`

*Example:* `"eth0"`

*Declared by:* [`nixos/modules/services/networking/ndppd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ndppd.nix)

## `services.ndppd.network` {#opt-services.ndppd.network}

Network that we proxy.
(Legacy option, use services.ndppd.proxies.\<interface\>.rules.\<network\> instead)

*Type:* null or string

*Default:* `null`

*Example:* `"1111::/64"`

*Declared by:* [`nixos/modules/services/networking/ndppd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ndppd.nix)

## `services.ndppd.proxies` {#opt-services.ndppd.proxies}

This sets up a listener, that will listen for any Neighbor Solicitation
messages, and respond to them according to a set of rules.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  eth0.rules."1111::/64" = {};
}
```

*Declared by:* [`nixos/modules/services/networking/ndppd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ndppd.nix)

## `services.ndppd.proxies.<name>.interface` {#opt-services.ndppd.proxies._name_.interface}

Listen for any Neighbor Solicitation messages on this interface,
and respond to them according to a set of rules.
Defaults to the name of the attrset.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ndppd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ndppd.nix)

## `services.ndppd.proxies.<name>.router` {#opt-services.ndppd.proxies._name_.router}

Turns on or off the router flag for Neighbor Advertisement Messages.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/ndppd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ndppd.nix)

## `services.ndppd.proxies.<name>.rules` {#opt-services.ndppd.proxies._name_.rules}

This is a rule that the target address is to match against. If no netmask
is provided, /128 is assumed. You may have several rule sections, and the
addresses may or may not overlap.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/ndppd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ndppd.nix)

## `services.ndppd.proxies.<name>.rules.<name>.interface` {#opt-services.ndppd.proxies._name_.rules._name_.interface}

Interface to use when method is iface.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ndppd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ndppd.nix)

## `services.ndppd.proxies.<name>.rules.<name>.method` {#opt-services.ndppd.proxies._name_.rules._name_.method}

static: Immediately answer any Neighbor Solicitation Messages
(if they match the IP rule).
iface: Forward the Neighbor Solicitation Message through the specified
interface and only respond if a matching Neighbor Advertisement
Message is received.
auto: Same as iface, but instead of manually specifying the outgoing
interface, check for a matching route in /proc/net/ipv6\_route.

*Type:* one of "static", "iface", "auto"

*Default:* `"auto"`

*Declared by:* [`nixos/modules/services/networking/ndppd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ndppd.nix)

## `services.ndppd.proxies.<name>.rules.<name>.network` {#opt-services.ndppd.proxies._name_.rules._name_.network}

This is the target address is to match against. If no netmask
is provided, /128 is assumed. The addresses of several rules
may or may not overlap.
Defaults to the name of the attrset.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ndppd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ndppd.nix)

## `services.ndppd.proxies.<name>.timeout` {#opt-services.ndppd.proxies._name_.timeout}

Controls how long to wait for a Neighbor Advertisement Message before
invalidating the entry, in milliseconds.

*Type:* signed integer

*Default:* `500`

*Declared by:* [`nixos/modules/services/networking/ndppd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ndppd.nix)

## `services.ndppd.proxies.<name>.ttl` {#opt-services.ndppd.proxies._name_.ttl}

Controls how long a valid or invalid entry remains in the cache, in
milliseconds.

*Type:* signed integer

*Default:* `30000`

*Declared by:* [`nixos/modules/services/networking/ndppd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ndppd.nix)

## `services.ndppd.routeTTL` {#opt-services.ndppd.routeTTL}

This tells 'ndppd' how often to reload the route file /proc/net/ipv6\_route,
in milliseconds.

*Type:* signed integer

*Default:* `30000`

*Declared by:* [`nixos/modules/services/networking/ndppd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ndppd.nix)

## `services.neard.enable` {#opt-services.neard.enable}

Whether to enable neard, an NFC daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/neard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/neard.nix)

## `services.neard.settings` {#opt-services.neard.settings}

Neard INI-style configuration file as a Nix attribute set.

See the upstream [configuration file](https://github.com/linux-nfc/neard/blob/master/src/main.conf).

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/desktops/neard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/neard.nix)

## `services.neard.settings.General.ConstantPoll` {#opt-services.neard.settings.General.ConstantPoll}

Enable constant polling. Constant polling will automatically trigger a new
polling loop whenever a tag or a device is no longer in the RF field.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/desktops/neard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/neard.nix)

## `services.neard.settings.General.DefaultPowered` {#opt-services.neard.settings.General.DefaultPowered}

Automatically turn an adapter on when being discovered.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/desktops/neard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/neard.nix)

## `services.neard.settings.General.ResetOnError` {#opt-services.neard.settings.General.ResetOnError}

Power cycle the adapter when getting a driver error from the kernel.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/desktops/neard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/neard.nix)

## `services.nebula-lighthouse-service.enable` {#opt-services.nebula-lighthouse-service.enable}

Whether to enable nebula-lighthouse-service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nebula-lighthouse-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula-lighthouse-service.nix)

## `services.nebula-lighthouse-service.settings` {#opt-services.nebula-lighthouse-service.settings}

Configuration for nebula-lighthouse-service.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  max-port = 65535;
  min-port = 49152;
  "webserver.ip" = "127.0.0.1";
  "webserver.port" = 8080;
}
```

*Declared by:* [`nixos/modules/services/networking/nebula-lighthouse-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula-lighthouse-service.nix)

## `services.nebula-lighthouse-service.user` {#opt-services.nebula-lighthouse-service.user}

The user and group to run nebula-lighthouse-service as.

*Type:* string

*Default:* `"nebula-lighthouse"`

*Example:* `"nebula-lighthouse"`

*Declared by:* [`nixos/modules/services/networking/nebula-lighthouse-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula-lighthouse-service.nix)

## `services.nebula.networks` {#opt-services.nebula.networks}

Nebula network definitions.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.ca` {#opt-services.nebula.networks._name_.ca}

Path to the certificate authority certificate.

*Type:* absolute path

*Example:* `"/etc/nebula/ca.crt"`

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.cert` {#opt-services.nebula.networks._name_.cert}

Path to the host certificate.

*Type:* absolute path

*Example:* `"/etc/nebula/host.crt"`

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.enable` {#opt-services.nebula.networks._name_.enable}

Enable or disable this network.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.enableReload` {#opt-services.nebula.networks._name_.enableReload}

Enable automatic config reload on config change.
This setting is not enabled by default as nix cannot determine if the config change is reloadable.
Please refer to the [config reference](https://nebula.defined.net/docs/config/) for documentation on reloadable changes.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.firewall.inbound` {#opt-services.nebula.networks._name_.firewall.inbound}

Firewall rules for inbound traffic.

*Type:* list of (attribute set)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    host = "any";
    port = "any";
    proto = "any";
  }
]
```

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.firewall.outbound` {#opt-services.nebula.networks._name_.firewall.outbound}

Firewall rules for outbound traffic.

*Type:* list of (attribute set)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    host = "any";
    port = "any";
    proto = "any";
  }
]
```

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.group` {#opt-services.nebula.networks._name_.group}

Group under which the nebula daemon is run for this network.

::: note
The group will be created if this config is left to the default value.
:::

*Type:* string

*Default:* `"nebula-‹name›"`

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.isLighthouse` {#opt-services.nebula.networks._name_.isLighthouse}

Whether this node is a lighthouse.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.isRelay` {#opt-services.nebula.networks._name_.isRelay}

Whether this node is a relay.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.key` {#opt-services.nebula.networks._name_.key}

Path or reference to the host key.

*Type:* non-empty string or absolute path

*Example:* `"/etc/nebula/host.key"`

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.lighthouse.dns.enable` {#opt-services.nebula.networks._name_.lighthouse.dns.enable}

Whether this lighthouse node should serve DNS.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.lighthouse.dns.host` {#opt-services.nebula.networks._name_.lighthouse.dns.host}

IP address on which nebula lighthouse should serve DNS.
'localhost' is a good default to ensure the service does not listen on public interfaces;
use a Nebula address like 10.0.0.5 to make DNS resolution available to nebula hosts only.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.lighthouse.dns.port` {#opt-services.nebula.networks._name_.lighthouse.dns.port}

UDP port number for lighthouse DNS server.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5353`

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.lighthouses` {#opt-services.nebula.networks._name_.lighthouses}

List of IPs of lighthouse hosts this node should report to and query from. This should be empty on lighthouse
nodes. The IPs should be the lighthouse's Nebula IPs, not their external IPs.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "192.168.100.1"
]
```

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.listen.host` {#opt-services.nebula.networks._name_.listen.host}

IP address to listen on.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.listen.port` {#opt-services.nebula.networks._name_.listen.port}

Port number to listen on.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
if (config.services.nebula.networks.${name}.isLighthouse ||
    config.services.nebula.networks.${name}.isRelay) then
  4242
else
  0;
```

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.listen.udpOffloads` {#opt-services.nebula.networks._name_.listen.udpOffloads}

Enables UDP Generic Segmentation Offload (GSO, Linux kernel 4.18+)
and Generic Receive Offload (GRO) on the UDP socket(s).
Supported from Nebula 1.12, where it defaults to true. null means unset.
See: https://nebula.defined.net/docs/config/listen/#listenudp\_offloads

*Type:* null or boolean

*Default:* `"true if cfg.package is at least 1.12, else null"`

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.package` {#opt-services.nebula.networks._name_.package}

The nebula package to use.

*Type:* package

*Default:* `pkgs.nebula`

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.relays` {#opt-services.nebula.networks._name_.relays}

List of IPs of relays that this node should allow traffic from.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "192.168.100.1"
]
```

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.settings` {#opt-services.nebula.networks._name_.settings}

Nebula configuration. Refer to
[https://github.com/slackhq/nebula/blob/master/examples/config.yml](https://github.com/slackhq/nebula/blob/master/examples/config.yml)
for details on supported values.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  lighthouse.interval = 15;
}
```

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.staticHostMap` {#opt-services.nebula.networks._name_.staticHostMap}

The static host map defines a set of hosts with fixed IP addresses on the internet (or any network).
A host can have multiple fixed IP addresses defined here, and nebula will try each when establishing a tunnel.

*Type:* attribute set of list of string

*Default:* `{ }`

*Example:*

``` nix
{
  "192.168.100.1" = [
    "100.64.22.11:4242"
  ];
}
```

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.tun.device` {#opt-services.nebula.networks._name_.tun.device}

Name of the tun device. Defaults to nebula.${networkName}.

*Type:* null or string

*Default:* `"nebula.‹name›"`

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.tun.disable` {#opt-services.nebula.networks._name_.tun.disable}

When tun is disabled, a lighthouse can be started without a local tun interface (and therefore without root).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.tun.useOffloads` {#opt-services.nebula.networks._name_.tun.useOffloads}

Enable segment offloading on the tun device.
Supported from Nebula 1.12, where it defaults to true. null means unset.
See: https://nebula.defined.net/docs/config/tun/#tunuse\_offloads

*Type:* null or boolean

*Default:* `"true if cfg.package is at least 1.12, else null"`

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.nebula.networks.<name>.user` {#opt-services.nebula.networks._name_.user}

User under which the nebula daemon is run for this network.

::: note
A user will be created if this config is left to the default value.
:::

*Type:* string

*Default:* `"nebula-‹name›"`

*Declared by:* [`nixos/modules/services/networking/nebula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nebula.nix)

## `services.neo4j.bolt.advertisedAddress` {#opt-services.neo4j.bolt.advertisedAddress}

Neo4j advertised address for BOLT traffic. The advertised address is
expressed in the format `<ip-address>:<port-number>`.

*Type:* string

*Default:* `config.services.neo4j.bolt.listenAddress`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.bolt.enable` {#opt-services.neo4j.bolt.enable}

Enable the BOLT connector for Neo4j. Setting this option to
`false` will stop Neo4j from listening for incoming
connections on the BOLT port (7687 by default).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.bolt.listenAddress` {#opt-services.neo4j.bolt.listenAddress}

Neo4j listen address for BOLT traffic. The listen address is
expressed in the format `<ip-address>:<port-number>`.

*Type:* string

*Default:* `":7687"`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.bolt.sslPolicy` {#opt-services.neo4j.bolt.sslPolicy}

Neo4j SSL policy for BOLT traffic.

The legacy policy is a special policy which is not defined in
the policy configuration section, but rather derives from
`directories.certificates` and
associated files (by default: `neo4j.key` and
`neo4j.cert`). Its use will be deprecated.

Note: This connector must be configured to support/require
SSL/TLS for the legacy policy to actually be utilized. See
`bolt.tlsLevel`.

*Type:* string

*Default:* `"legacy"`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.bolt.tlsLevel` {#opt-services.neo4j.bolt.tlsLevel}

SSL/TSL requirement level for BOLT traffic.

*Type:* one of "REQUIRED", "OPTIONAL", "DISABLED"

*Default:* `"OPTIONAL"`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.constrainLoadCsv` {#opt-services.neo4j.constrainLoadCsv}

Sets the root directory for file URLs used with the Cypher
`LOAD CSV` clause to be that defined by
`directories.imports`. It restricts
access to only those files within that directory and its
subdirectories.

Setting this option to `false` introduces
possible security problems.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.defaultListenAddress` {#opt-services.neo4j.defaultListenAddress}

Default network interface to listen for incoming connections. To
listen for connections on all interfaces, use "0.0.0.0".

Specifies the default IP address and address part of connector
specific `listenAddress` options. To bind specific
connectors to a specific network interfaces, specify the entire
`listenAddress` option for that connector.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.directories.certificates` {#opt-services.neo4j.directories.certificates}

Directory for storing certificates to be used by Neo4j for
TLS connections.

When setting this directory to something other than its default,
ensure the directory's existence, and that read/write permissions are
given to the Neo4j daemon user `neo4j`.

Note that changing this directory from its default will prevent
the directory structure required for each SSL policy from being
automatically generated. A policy's directory structure as defined by
its `baseDirectory`,`revokedDir` and
`trustedDir` must then be setup manually. The
existence of these directories is mandatory, as well as the presence
of the certificate file and the private key. Ensure the correct
permissions are set on these directories and files.

*Type:* absolute path

*Default:* `"${config.services.neo4j.directories.home}/certificates"`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.directories.data` {#opt-services.neo4j.directories.data}

Path of the data directory. You must not configure more than one
Neo4j installation to use the same data directory.

When setting this directory to something other than its default,
ensure the directory's existence, and that read/write permissions are
given to the Neo4j daemon user `neo4j`.

*Type:* absolute path

*Default:* `"${config.services.neo4j.directories.home}/data"`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.directories.home` {#opt-services.neo4j.directories.home}

Path of the Neo4j home directory. Other default directories are
subdirectories of this path. This directory will be created if
non-existent, and its ownership will be `chown` to
the Neo4j daemon user `neo4j`.

*Type:* absolute path

*Default:* `"/var/lib/neo4j"`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.directories.imports` {#opt-services.neo4j.directories.imports}

The root directory for file URLs used with the Cypher
`LOAD CSV` clause. Only meaningful when
`constrainLoadCvs` is set to
`true`.

When setting this directory to something other than its default,
ensure the directory's existence, and that read permission is
given to the Neo4j daemon user `neo4j`.

*Type:* absolute path

*Default:* `"${config.services.neo4j.directories.home}/import"`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.directories.plugins` {#opt-services.neo4j.directories.plugins}

Path of the database plugin directory. Compiled Java JAR files that
contain database procedures will be loaded if they are placed in
this directory.

When setting this directory to something other than its default,
ensure the directory's existence, and that read permission is
given to the Neo4j daemon user `neo4j`.

*Type:* absolute path

*Default:* `"${config.services.neo4j.directories.home}/plugins"`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.enable` {#opt-services.neo4j.enable}

Whether to enable Neo4j Community Edition.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.extraServerConfig` {#opt-services.neo4j.extraServerConfig}

Extra configuration for Neo4j Community server. Refer to the
[complete reference](https://neo4j.com/docs/operations-manual/current/reference/configuration-settings/)
of Neo4j configuration settings.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.http.advertisedAddress` {#opt-services.neo4j.http.advertisedAddress}

Neo4j advertised address for HTTP traffic. The advertised address is
expressed in the format `<ip-address>:<port-number>`.

*Type:* string

*Default:* `config.services.neo4j.http.listenAddress`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.http.enable` {#opt-services.neo4j.http.enable}

Enable the HTTP connector for Neo4j. Setting this option to
`false` will stop Neo4j from listening for incoming
connections on the HTTPS port (7474 by default).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.http.listenAddress` {#opt-services.neo4j.http.listenAddress}

Neo4j listen address for HTTP traffic. The listen address is
expressed in the format `<ip-address>:<port-number>`.

*Type:* string

*Default:* `":7474"`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.https.advertisedAddress` {#opt-services.neo4j.https.advertisedAddress}

Neo4j advertised address for HTTPS traffic. The advertised address is
expressed in the format `<ip-address>:<port-number>`.

*Type:* string

*Default:* `config.services.neo4j.https.listenAddress`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.https.enable` {#opt-services.neo4j.https.enable}

Enable the HTTPS connector for Neo4j. Setting this option to
`false` will stop Neo4j from listening for incoming
connections on the HTTPS port (7473 by default).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.https.listenAddress` {#opt-services.neo4j.https.listenAddress}

Neo4j listen address for HTTPS traffic. The listen address is
expressed in the format `<ip-address>:<port-number>`.

*Type:* string

*Default:* `":7473"`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.https.sslPolicy` {#opt-services.neo4j.https.sslPolicy}

Neo4j SSL policy for HTTPS traffic.

The legacy policy is a special policy which is not defined in the
policy configuration section, but rather derives from
`directories.certificates` and
associated files (by default: `neo4j.key` and
`neo4j.cert`). Its use will be deprecated.

*Type:* string

*Default:* `"legacy"`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.package` {#opt-services.neo4j.package}

The neo4j package to use.

*Type:* package

*Default:* `pkgs.neo4j`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.readOnly` {#opt-services.neo4j.readOnly}

Only allow read operations from this Neo4j instance.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.shell.enable` {#opt-services.neo4j.shell.enable}

Enable a remote shell server which Neo4j Shell clients can log in to.
Only applicable to `neo4j-shell`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.ssl.policies` {#opt-services.neo4j.ssl.policies}

Defines the SSL policies for use with Neo4j connectors. Each attribute
of this set defines a policy, with the attribute name defining the name
of the policy and its namespace. Refer to the operations manual section
on Neo4j's
[SSL Framework](https://neo4j.com/docs/operations-manual/current/security/ssl-framework/)
for further details.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.ssl.policies.<name>.allowKeyGeneration` {#opt-services.neo4j.ssl.policies._name_.allowKeyGeneration}

Allows the generation of a private key and associated self-signed
certificate. Only performed when both objects cannot be found for
this policy. It is recommended to turn this off again after keys
have been generated.

The public certificate is required to be duplicated to the
directory holding trusted certificates as defined by the
`trustedDir` option.

Keys should in general be generated and distributed offline by a
trusted certificate authority and not by utilizing this mode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.ssl.policies.<name>.baseDirectory` {#opt-services.neo4j.ssl.policies._name_.baseDirectory}

The mandatory base directory for cryptographic objects of this
policy. This path is only automatically generated when this
option as well as `directories.certificates` are
left at their default. Ensure read/write permissions are given
to the Neo4j daemon user `neo4j`.

It is also possible to override each individual
configuration with absolute paths. See the
`privateKey` and `publicCertificate`
policy options.

*Type:* absolute path

*Default:* `"${config.services.neo4j.directories.certificates}/${name}"`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.ssl.policies.<name>.ciphers` {#opt-services.neo4j.ssl.policies._name_.ciphers}

Restrict the allowed ciphers of this policy to those defined
here. The default ciphers are those of the JVM platform.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.ssl.policies.<name>.clientAuth` {#opt-services.neo4j.ssl.policies._name_.clientAuth}

The client authentication stance for this policy.

*Type:* one of "NONE", "OPTIONAL", "REQUIRE"

*Default:* `"REQUIRE"`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.ssl.policies.<name>.enable` {#opt-services.neo4j.ssl.policies._name_.enable}

Whether to enable this policy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.ssl.policies.<name>.privateKey` {#opt-services.neo4j.ssl.policies._name_.privateKey}

The name of private PKCS #8 key file for this policy to be found
in the `baseDirectory`, or the absolute path to
the key file. It is mandatory that a key can be found or generated.

*Type:* string

*Default:* `"private.key"`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.ssl.policies.<name>.publicCertificate` {#opt-services.neo4j.ssl.policies._name_.publicCertificate}

The name of public X.509 certificate (chain) file in PEM format
for this policy to be found in the `baseDirectory`,
or the absolute path to the certificate file. It is mandatory
that a certificate can be found or generated.

The public certificate is required to be duplicated to the
directory holding trusted certificates as defined by the
`trustedDir` option.

*Type:* string

*Default:* `"public.crt"`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.ssl.policies.<name>.revokedDir` {#opt-services.neo4j.ssl.policies._name_.revokedDir}

Path to directory of CRLs (Certificate Revocation Lists) in
PEM format. Must be an absolute path. The existence of this
directory is mandatory and will need to be created manually when:
setting this option to something other than its default; setting
either this policy's `baseDirectory` or
`directories.certificates` to something other than
their default. Ensure read/write permissions are given to the
Neo4j daemon user `neo4j`.

*Type:* absolute path

*Default:* `"${config.services.neo4j.ssl.policies.<name>.baseDirectory}/revoked"`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.ssl.policies.<name>.tlsVersions` {#opt-services.neo4j.ssl.policies._name_.tlsVersions}

Restrict the TLS protocol versions of this policy to those
defined here.

*Type:* list of string

*Default:*

``` nix
[
  "TLSv1.2"
]
```

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.ssl.policies.<name>.trustAll` {#opt-services.neo4j.ssl.policies._name_.trustAll}

Makes this policy trust all remote parties. Enabling this is not
recommended and the policy's trusted directory will be ignored.
Use of this mode is discouraged. It would offer encryption but
no security.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.ssl.policies.<name>.trustedDir` {#opt-services.neo4j.ssl.policies._name_.trustedDir}

Path to directory of X.509 certificates in PEM format for
trusted parties. Must be an absolute path. The existence of this
directory is mandatory and will need to be created manually when:
setting this option to something other than its default; setting
either this policy's `baseDirectory` or
`directories.certificates` to something other than
their default. Ensure read/write permissions are given to the
Neo4j daemon user `neo4j`.

The public certificate as defined by
`publicCertificate` is required to be duplicated
to this directory.

*Type:* absolute path

*Default:* `"${config.services.neo4j.ssl.policies.<name>.baseDirectory}/trusted"`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.neo4j.workerCount` {#opt-services.neo4j.workerCount}

Number of Neo4j worker threads, where the default of
`0` indicates a worker count equal to the number of
available processors.

*Type:* integer between 0 and 44738 (both inclusive)

*Default:* `0`

*Declared by:* [`nixos/modules/services/databases/neo4j.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/neo4j.nix)

## `services.netatalk.enable` {#opt-services.netatalk.enable}

Whether to enable the Netatalk AFP fileserver.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/netatalk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/netatalk.nix)

## `services.netatalk.extmap` {#opt-services.netatalk.extmap}

File name extension mappings.
See `extmap.conf(5)`. for more information.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/network-filesystems/netatalk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/netatalk.nix)

## `services.netatalk.port` {#opt-services.netatalk.port}

TCP port to be used for AFP.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `548`

*Declared by:* [`nixos/modules/services/network-filesystems/netatalk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/netatalk.nix)

## `services.netatalk.settings` {#opt-services.netatalk.settings}

Configuration for Netatalk. See
`afp.conf(5)`.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  Global = {
    "uam list" = "uams_guest.so";
  };
  Homes = {
    "basedir regex" = "/home";
    path = "afp-data";
  };
  example-volume = {
    path = "/srv/volume";
    "read only" = true;
  };
}
```

*Declared by:* [`nixos/modules/services/network-filesystems/netatalk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/netatalk.nix)

## `services.netbird.clients` {#opt-services.netbird.clients}

Attribute set of NetBird client daemons, by default each one will:

1. be manageable using dedicated tooling:

- `netbird-<name>` script,
- `NetBird - netbird-<name>` graphical interface when appropriate (see `ui.enable`),

2. run as a `netbird-<name>.service`,
3. listen for incoming remote connections on the port `51820` (`openFirewall` by default),
4. manage the `netbird-<name>` wireguard interface,
5. use the `/var/lib/netbird-<name>/config.json` configuration file,
6. override `/var/lib/netbird-<name>/config.json` with values from `/etc/netbird-<name>/config.d/*.json`,
7. (`hardened`) be locally manageable by `netbird-<name>` system group,

With following caveats:

- multiple daemons will interfere with each other's DNS resolution of `netbird.cloud`, but
  should remain fully operational otherwise.
  Setting up custom (non-conflicting) DNS zone is currently possible only when self-hosting.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  services.netbird.clients.wt0.port = 51820;
  services.netbird.clients.personal.port = 51821;
  services.netbird.clients.work1.port = 51822;
}
```

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.autoStart` {#opt-services.netbird.clients._name_.autoStart}

Start the service with the system.

As of 2024-02-13 it is not possible to start a NetBird client daemon without immediately
connecting to the network, but it is [planned for a near future](https://github.com/netbirdio/netbird/projects/2#card-91718018).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.bin.suffix` {#opt-services.netbird.clients._name_.bin.suffix}

A system group name for this client instance.

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.config` {#opt-services.netbird.clients._name_.config}

Additional configuration that exists before the first start and
later overrides the existing values in `config.json`.

It is mostly helpful to manage configuration ignored/not yet implemented
outside of `netbird up` invocation.

WARNING: this is not an upstream feature, it could break in the future
(by having lower priority) after upstream implements an equivalent.

It is implemented as a `preStart` script which overrides `config.json`
with content of `/etc/netbird-‹name›/config.d/*.json` files.
This option manages specifically `50-nixos.json` file.

Consult [the source code](https://github.com/netbirdio/netbird/blob/88747e3e0191abc64f1e8c7ecc65e5e50a1527fd/client/internal/config.go#L49-L82)
or inspect existing file for a complete list of available configurations.

*Type:* JSON value

*Default:*

``` nix
{
  DisableAutoConnect = !client.autoStart;
  WgIface = client.interface;
  WgPort = client.port;
} // optionalAttrs (client.dns-resolver.address != null) {
  CustomDNSAddress = "${client.dns-resolver.address}:${toString client.dns-resolver.port}";
}
```

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.dir.baseName` {#opt-services.netbird.clients._name_.dir.baseName}

A systemd service name to use (without `.service` suffix).

*Type:* string

*Default:* `"netbird-‹name›"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.dir.runtime` {#opt-services.netbird.clients._name_.dir.runtime}

A runtime directory used by NetBird client.

*Type:* absolute path

*Default:* `"/var/run/netbird-‹name›"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.dir.state` {#opt-services.netbird.clients._name_.dir.state}

A state directory used by NetBird client to store `config.json`, `state.json` & `resolv.conf`.

*Type:* absolute path

*Default:* `"/var/lib/netbird-‹name›"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.dns-resolver.address` {#opt-services.netbird.clients._name_.dns-resolver.address}

An explicit address that NetBird will serve `*.netbird.cloud.` (usually) entries on.

NetBird serves DNS on it's own (dynamic) client address by default.

*Type:* null or string

*Default:* `null`

*Example:* `"127.0.0.123"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.dns-resolver.port` {#opt-services.netbird.clients._name_.dns-resolver.port}

A port to serve DNS entries on when `dns-resolver.address` is enabled.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `53`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.environment` {#opt-services.netbird.clients._name_.environment}

Environment for the netbird service, used to pass configuration options.

*Type:* attribute set of string

*Default:*

``` nix
{
  NB_STATE_DIR = client.dir.state;
  NB_CONFIG = "${client.dir.state}/config.json";
  NB_DAEMON_ADDR = "unix://${client.dir.runtime}/sock";
  NB_INTERFACE_NAME = client.interface;
  NB_LOG_FILE = mkOptionDefault "console";
  NB_LOG_LEVEL = client.logLevel;
  NB_SERVICE = client.service.name;
  NB_WIREGUARD_PORT = toString client.port;
} // optionalAttrs (client.dns-resolver.address != null) {
  NB_DNS_RESOLVER_ADDRESS = "${client.dns-resolver.address}:${toString client.dns-resolver.port}";
}
```

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.hardened` {#opt-services.netbird.clients._name_.hardened}

Hardened service:

- runs as a dedicated user with minimal set of permissions (see caveats),
- restricts daemon configuration socket access to dedicated user group
  (you can grant access to it with `users.users."<user>".extraGroups = [ netbird-‹name› ]`),

Even though the local system resources access is restricted:

- `CAP_NET_RAW`, `CAP_NET_ADMIN` and `CAP_BPF` still give unlimited network manipulation possibilites,
- older kernels don't have `CAP_BPF` and use `CAP_SYS_ADMIN` instead,

Known security features that are not (yet) integrated into the module:

- 2024-02-14: `rosenpass` is an experimental feature configurable solely
  through `--enable-rosenpass` flag on the `netbird up` command,
  see [the docs](https://docs.netbird.io/how-to/enable-post-quantum-cryptography)

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.interface` {#opt-services.netbird.clients._name_.interface}

Name of the network interface managed by this client.

*Type:* string

*Default:* `"nb-‹name›"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.logLevel` {#opt-services.netbird.clients._name_.logLevel}

Log level of the NetBird daemon.

*Type:* one of "panic", "fatal", "error", "warn", "warning", "info", "debug", "trace"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.login.enable` {#opt-services.netbird.clients._name_.login.enable}

Whether to enable automated login for NetBird client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.login.setupKeyFile` {#opt-services.netbird.clients._name_.login.setupKeyFile}

A Setup Key file path used for automated login of the machine.

*Type:* null or string

*Default:* `null`

*Example:* `"/run/secrets/netbird-priv/setup-key"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.login.systemdDependencies` {#opt-services.netbird.clients._name_.login.systemdDependencies}

Additional systemd dependencies required to succeed before the Setup Key file becomes available.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[ "sops-install-secrets.service" ]
```

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.name` {#opt-services.netbird.clients._name_.name}

Primary name for use (as a suffix) in:

- systemd service name,
- hardened user name and group,
- [systemd `*Directory=`](https://www.freedesktop.org/software/systemd/man/latest/systemd.exec.html#RuntimeDirectory=) names,
- desktop application identification,

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.openFirewall` {#opt-services.netbird.clients._name_.openFirewall}

Opens up firewall `port` for communication between NetBird peers directly over LAN or public IP,
without using (internet-hosted) TURN servers as intermediaries.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.openInternalFirewall` {#opt-services.netbird.clients._name_.openInternalFirewall}

Opens up internal firewall ports for the NetBird's network interface.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.port` {#opt-services.netbird.clients._name_.port}

Port the NetBird client listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Example:* `51820`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.service.name` {#opt-services.netbird.clients._name_.service.name}

A systemd service name to use (without `.service` suffix).

*Type:* string

*Default:* `"netbird-‹name›"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.suffixedName` {#opt-services.netbird.clients._name_.suffixedName}

A systemd service name to use (without `.service` suffix).

*Type:* string

*Default:* `"netbird-‹name›"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.ui.enable` {#opt-services.netbird.clients._name_.ui.enable}

Controls presence of `netbird-ui` wrapper for this NetBird client.

*Type:* boolean

*Default:* `client.ui.enable`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.user.group` {#opt-services.netbird.clients._name_.user.group}

A system group name for this client instance.

*Type:* string

*Default:* `"netbird-‹name›"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.clients.<name>.user.name` {#opt-services.netbird.clients._name_.user.name}

A system user name for this client instance.

*Type:* string

*Default:* `"netbird-‹name›"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.enable` {#opt-services.netbird.enable}

Enables backward-compatible NetBird client service.

This is strictly equivalent to:

``` nix
services.netbird.clients.default = {
  port = 51820;
  name = "netbird";
  interface = "wt0";
  hardened = false;
};
```

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.package` {#opt-services.netbird.package}

The netbird package to use.

*Type:* package

*Default:* `pkgs.netbird`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.relay.authSecretFile` {#opt-services.netbird.relay.authSecretFile}

Path (as string) to a file containing the auth-secret used by netbird to connect to the relay server.
It will populate `NB_AUTH_SECRET`

*Type:* null or absolute path not in the Nix store

*Default:* `null`

*Example:* `"/run/auth_secret"`

*Declared by:* [`nixos/modules/services/networking/netbird/netbird-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/netbird-relay.nix)

## `services.netbird.relay.enable` {#opt-services.netbird.relay.enable}

Whether to enable Netbird's Relay Service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/netbird/netbird-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/netbird-relay.nix)

## `services.netbird.relay.environmentFile` {#opt-services.netbird.relay.environmentFile}

Path (as string) to an environmentFile with the netbird relay environment variables.
You can find all the variables under [Relay runtime env variables](https://docs.netbird.io/selfhosted/environment-variables#runtime-variables-2).

WARNING: You must manually open any port configured via environmentFile.
If you use an Internet domain privileged port (e.g 443), add CAP\_NET\_BIND\_SERVICE to systemd's CapabilityBoundingSet and AmbientCapabilities

*Type:* null or absolute path not in the Nix store

*Default:* `null`

*Example:* `"/run/netbird-relay.env"`

*Declared by:* [`nixos/modules/services/networking/netbird/netbird-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/netbird-relay.nix)

## `services.netbird.relay.openFirewall` {#opt-services.netbird.relay.openFirewall}

Open STUN ports in the firewall for the netbird relay.

WARNING: You must manually open listen-address port/tcp and port 80/tcp,
if you are exposing the relay directly to the internet.
Review [set-up-external-relays](https://docs.netbird.io/selfhosted/maintenance/scaling/set-up-external-relays)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/netbird/netbird-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/netbird-relay.nix)

## `services.netbird.relay.package` {#opt-services.netbird.relay.package}

The netbird-relay package to use.

*Type:* package

*Default:* `pkgs.netbird-relay`

*Declared by:* [`nixos/modules/services/networking/netbird/netbird-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/netbird-relay.nix)

## `services.netbird.relay.settings` {#opt-services.netbird.relay.settings}

Settings to configure the netbird relay.
Converted automatically into cli args, check all the options with `netbird-relay --help`

*Type:* open submodule of (null or boolean or string or list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/netbird/netbird-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/netbird-relay.nix)

## `services.netbird.relay.settings.enable-stun` {#opt-services.netbird.relay.settings.enable-stun}

Enable embedded STUN server

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/netbird/netbird-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/netbird-relay.nix)

## `services.netbird.relay.settings.exposed-address` {#opt-services.netbird.relay.settings.exposed-address}

Exposed address for peers. Address told to the peers to connect to

*Type:* string

*Example:* `"rels://relay.example.com:443"`

*Declared by:* [`nixos/modules/services/networking/netbird/netbird-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/netbird-relay.nix)

## `services.netbird.relay.settings.health-listen-address` {#opt-services.netbird.relay.settings.health-listen-address}

Listen address of healthcheck server

*Type:* string

*Default:* `":9000"`

*Declared by:* [`nixos/modules/services/networking/netbird/netbird-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/netbird-relay.nix)

## `services.netbird.relay.settings.listen-address` {#opt-services.netbird.relay.settings.listen-address}

The host address and port separated by colon where the relay will listen

*Type:* string

*Default:* `":33080"`

*Declared by:* [`nixos/modules/services/networking/netbird/netbird-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/netbird-relay.nix)

## `services.netbird.relay.settings.log-level` {#opt-services.netbird.relay.settings.log-level}

Log level of the netbird relay service

*Type:* one of "panic", "fatal", "error", "warn", "info", "debug", "trace"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/networking/netbird/netbird-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/netbird-relay.nix)

## `services.netbird.relay.settings.metrics-port` {#opt-services.netbird.relay.settings.metrics-port}

Metrics endpoint http port. Metrics are accessible under host:metrics-port/metrics

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9092`

*Declared by:* [`nixos/modules/services/networking/netbird/netbird-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/netbird-relay.nix)

## `services.netbird.relay.settings.stun-ports` {#opt-services.netbird.relay.settings.stun-ports}

STUN server UDP ports

*Type:* list of 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
[
  3478
]
```

*Declared by:* [`nixos/modules/services/networking/netbird/netbird-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/netbird-relay.nix)

## `services.netbird.server.coturn.domain` {#opt-services.netbird.server.coturn.domain}

The domain under which the coturn server runs.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/netbird/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/coturn.nix)

## `services.netbird.server.coturn.enable` {#opt-services.netbird.server.coturn.enable}

Whether to enable a Coturn server for Netbird, will also open the firewall on the configured range.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/netbird/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/coturn.nix)

## `services.netbird.server.coturn.openPorts` {#opt-services.netbird.server.coturn.openPorts}

The list of ports used by coturn for listening to open in the firewall.

*Type:* list of 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
with config.services.coturn; [
  listening-port
  alt-listening-port
  tls-listening-port
  alt-tls-listening-port
];
```

*Declared by:* [`nixos/modules/services/networking/netbird/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/coturn.nix)

## `services.netbird.server.coturn.password` {#opt-services.netbird.server.coturn.password}

The password of the user used by netbird to connect to the coturn server.
Be advised this will be world readable in the nix store.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/netbird/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/coturn.nix)

## `services.netbird.server.coturn.passwordFile` {#opt-services.netbird.server.coturn.passwordFile}

The path to a file containing the password of the user used by netbird to connect to the coturn server.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/netbird/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/coturn.nix)

## `services.netbird.server.coturn.useAcmeCertificates` {#opt-services.netbird.server.coturn.useAcmeCertificates}

Whether to use ACME certificates corresponding to the given domain for the server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/netbird/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/coturn.nix)

## `services.netbird.server.coturn.user` {#opt-services.netbird.server.coturn.user}

The username used by netbird to connect to the coturn server.

*Type:* string

*Default:* `"netbird"`

*Declared by:* [`nixos/modules/services/networking/netbird/coturn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/coturn.nix)

## `services.netbird.server.dashboard.domain` {#opt-services.netbird.server.dashboard.domain}

The domain under which the dashboard runs.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/networking/netbird/dashboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/dashboard.nix)

## `services.netbird.server.dashboard.enable` {#opt-services.netbird.server.dashboard.enable}

Whether to enable the static netbird dashboard frontend.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/netbird/dashboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/dashboard.nix)

## `services.netbird.server.dashboard.enableNginx` {#opt-services.netbird.server.dashboard.enableNginx}

Whether to enable Nginx reverse-proxy to serve the dashboard.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/netbird/dashboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/dashboard.nix)

## `services.netbird.server.dashboard.finalDrv` {#opt-services.netbird.server.dashboard.finalDrv}

The derivation containing the final templated dashboard.

*Type:* package

*Read only*

*Declared by:* [`nixos/modules/services/networking/netbird/dashboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/dashboard.nix)

## `services.netbird.server.dashboard.managementServer` {#opt-services.netbird.server.dashboard.managementServer}

The address of the management server, used for the API endpoints.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/netbird/dashboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/dashboard.nix)

## `services.netbird.server.dashboard.package` {#opt-services.netbird.server.dashboard.package}

The netbird-dashboard package to use.

*Type:* package

*Default:* `pkgs.netbird-dashboard`

*Declared by:* [`nixos/modules/services/networking/netbird/dashboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/dashboard.nix)

## `services.netbird.server.dashboard.settings` {#opt-services.netbird.server.dashboard.settings}

An attribute set that will be used to substitute variables when building the dashboard.
Any values set here will be templated into the frontend and be public for anyone that can reach your website.
The exact values sadly aren't documented anywhere.
A starting point when searching for valid values is this [script](https://github.com/netbirdio/dashboard/blob/main/docker/init_react_envs.sh)
The only mandatory value is 'AUTH\_AUTHORITY' as we cannot set a default value here.

*Type:* open submodule of attribute set of (string or boolean)

*Default:*

``` nix
''
  {
    AUTH_AUDIENCE = "netbird";
    AUTH_CLIENT_ID = "netbird";
    AUTH_SUPPORTED_SCOPES = "openid profile email";
    NETBIRD_AGENT_NETWORK_ENABLED = false;
    NETBIRD_AGENT_NETWORK_ONLY = false;
    NETBIRD_CLOUD = false;
    NETBIRD_LICENSED = false;
    NETBIRD_TOKEN_SOURCE = "idToken";
    USE_AUTH0 = false;
  }
''
```

*Declared by:* [`nixos/modules/services/networking/netbird/dashboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/dashboard.nix)

## `services.netbird.server.domain` {#opt-services.netbird.server.domain}

The domain under which the netbird server runs.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/netbird/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/server.nix)

## `services.netbird.server.enable` {#opt-services.netbird.server.enable}

Whether to enable Netbird Server stack, comprising the dashboard, management API and signal service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/netbird/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/server.nix)

## `services.netbird.server.enableNginx` {#opt-services.netbird.server.enableNginx}

Whether to enable Nginx reverse-proxy for the netbird server services.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/netbird/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/server.nix)

## `services.netbird.server.management.disableAnonymousMetrics` {#opt-services.netbird.server.management.disableAnonymousMetrics}

Disables push of anonymous usage metrics to NetBird.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/netbird/management.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/management.nix)

## `services.netbird.server.management.disableSingleAccountMode` {#opt-services.netbird.server.management.disableSingleAccountMode}

If set to true, disables single account mode.
The `singleAccountModeDomain` property will be ignored and every new user will have a separate NetBird account.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/netbird/management.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/management.nix)

## `services.netbird.server.management.dnsDomain` {#opt-services.netbird.server.management.dnsDomain}

Domain used for peer resolution.

*Type:* string

*Default:* `"netbird.selfhosted"`

*Declared by:* [`nixos/modules/services/networking/netbird/management.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/management.nix)

## `services.netbird.server.management.domain` {#opt-services.netbird.server.management.domain}

The domain under which the management API runs.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/netbird/management.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/management.nix)

## `services.netbird.server.management.enable` {#opt-services.netbird.server.management.enable}

Whether to enable Netbird Management Service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/netbird/management.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/management.nix)

## `services.netbird.server.management.enableNginx` {#opt-services.netbird.server.management.enableNginx}

Whether to enable Nginx reverse-proxy for the netbird management service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/netbird/management.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/management.nix)

## `services.netbird.server.management.extraOptions` {#opt-services.netbird.server.management.extraOptions}

Additional options given to netbird-mgmt as commandline arguments.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/netbird/management.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/management.nix)

## `services.netbird.server.management.logLevel` {#opt-services.netbird.server.management.logLevel}

Log level of the netbird services.

*Type:* one of "ERROR", "WARN", "INFO", "DEBUG"

*Default:* `"INFO"`

*Declared by:* [`nixos/modules/services/networking/netbird/management.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/management.nix)

## `services.netbird.server.management.metricsPort` {#opt-services.netbird.server.management.metricsPort}

Internal port of the metrics server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9090`

*Declared by:* [`nixos/modules/services/networking/netbird/management.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/management.nix)

## `services.netbird.server.management.oidcConfigEndpoint` {#opt-services.netbird.server.management.oidcConfigEndpoint}

The oidc discovery endpoint.

*Type:* string

*Example:* `"https://example.eu.auth0.com/.well-known/openid-configuration"`

*Declared by:* [`nixos/modules/services/networking/netbird/management.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/management.nix)

## `services.netbird.server.management.package` {#opt-services.netbird.server.management.package}

The netbird-management package to use.

*Type:* package

*Default:* `pkgs.netbird-management`

*Declared by:* [`nixos/modules/services/networking/netbird/management.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/management.nix)

## `services.netbird.server.management.port` {#opt-services.netbird.server.management.port}

Internal port of the management server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8011`

*Declared by:* [`nixos/modules/services/networking/netbird/management.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/management.nix)

## `services.netbird.server.management.settings` {#opt-services.netbird.server.management.settings}

Configuration of the netbird management server.
Options containing secret data should be set to an attribute set containing the attribute \_secret

- a string pointing to a file containing the value the option should be set to.
  See the example to get a better picture of this: in the resulting management.json file,
  the `DataStoreEncryptionKey` key will be set to the contents of the /run/agenix/netbird\_mgmt-data\_store\_encryption\_key file.

*Type:* JSON value

*Default:*

``` nix
defaultSettings = {
  Stuns = [
    {
      Proto = "udp";
      URI = "stun:${cfg.turnDomain}:3478";
      Username = "";
      Password = null;
    }
  ];

  TURNConfig = {
    Turns = [
      {
        Proto = "udp";
        URI = "turn:${cfg.turnDomain}:3478";
        Username = "netbird";
        Password = "netbird";
      }
    ];

    CredentialsTTL = "12h";
    Secret = "not-secure-secret";
    TimeBasedCredentials = false;
  };

  Signal = {
    Proto = "https";
    URI = "${cfg.domain}:443";
    Username = "";
    Password = null;
  };

  ReverseProxy = {
    TrustedHTTPProxies = [ ];
    TrustedHTTPProxiesCount = 0;
    TrustedPeers = [ "0.0.0.0/0" ];
  };

  Datadir = "${stateDir}/data";
  DataStoreEncryptionKey = "genEVP6j/Yp2EeVujm0zgqXrRos29dQkpvX0hHdEUlQ=";
  StoreConfig = { Engine = "sqlite"; };

  HttpConfig = {
    Address = "127.0.0.1:${toString cfg.port}";
    IdpSignKeyRefreshEnabled = true;
    OIDCConfigEndpoint = cfg.oidcConfigEndpoint;
  };

  IdpManagerConfig = {
    ManagerType = "none";
    ClientConfig = {
      Issuer = "";
      TokenEndpoint = "";
      ClientID = "netbird";
      ClientSecret = "";
      GrantType = "client_credentials";
    };

    ExtraConfig = { };
    Auth0ClientCredentials = null;
    AzureClientCredentials = null;
    KeycloakClientCredentials = null;
    ZitadelClientCredentials = null;
  };

  DeviceAuthorizationFlow = {
    Provider = "none";
    ProviderConfig = {
      Audience = "netbird";
      Domain = null;
      ClientID = "netbird";
      TokenEndpoint = null;
      DeviceAuthEndpoint = "";
      Scope = "openid profile email offline_access api";
      UseIDToken = false;
    };
  };

  PKCEAuthorizationFlow = {
    ProviderConfig = {
      Audience = "netbird";
      ClientID = "netbird";
      ClientSecret = "";
      AuthorizationEndpoint = "";
      TokenEndpoint = "";
      Scope = "openid profile email offline_access api";
      RedirectURLs = "http://localhost:53000";
      UseIDToken = false;
    };
  };
};
```

*Example:*

``` nix
{
  DataStoreEncryptionKey = {
    _secret = "/run/agenix/netbird_mgmt-data_store_encryption_key";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/netbird/management.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/management.nix)

## `services.netbird.server.management.singleAccountModeDomain` {#opt-services.netbird.server.management.singleAccountModeDomain}

Enables single account mode.
This means that all the users will be under the same account grouped by the specified domain.
If the installation has more than one account, the property is ineffective.

*Type:* string

*Default:* `"netbird.selfhosted"`

*Declared by:* [`nixos/modules/services/networking/netbird/management.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/management.nix)

## `services.netbird.server.management.turnDomain` {#opt-services.netbird.server.management.turnDomain}

The domain of the TURN server to use.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/netbird/management.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/management.nix)

## `services.netbird.server.management.turnPort` {#opt-services.netbird.server.management.turnPort}

The port of the TURN server to use.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3478`

*Declared by:* [`nixos/modules/services/networking/netbird/management.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/management.nix)

## `services.netbird.server.signal.domain` {#opt-services.netbird.server.signal.domain}

The domain name for the signal service.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/netbird/signal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/signal.nix)

## `services.netbird.server.signal.enable` {#opt-services.netbird.server.signal.enable}

Whether to enable Netbird's Signal Service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/netbird/signal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/signal.nix)

## `services.netbird.server.signal.enableNginx` {#opt-services.netbird.server.signal.enableNginx}

Whether to enable Nginx reverse-proxy for the netbird signal service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/netbird/signal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/signal.nix)

## `services.netbird.server.signal.extraOptions` {#opt-services.netbird.server.signal.extraOptions}

Additional options given to netbird-signal as commandline arguments.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/netbird/signal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/signal.nix)

## `services.netbird.server.signal.logLevel` {#opt-services.netbird.server.signal.logLevel}

Log level of the netbird signal service.

*Type:* one of "ERROR", "WARN", "INFO", "DEBUG"

*Default:* `"INFO"`

*Declared by:* [`nixos/modules/services/networking/netbird/signal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/signal.nix)

## `services.netbird.server.signal.metricsPort` {#opt-services.netbird.server.signal.metricsPort}

Internal port of the metrics server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9091`

*Declared by:* [`nixos/modules/services/networking/netbird/signal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/signal.nix)

## `services.netbird.server.signal.package` {#opt-services.netbird.server.signal.package}

The netbird-signal package to use.

*Type:* package

*Default:* `pkgs.netbird-signal`

*Declared by:* [`nixos/modules/services/networking/netbird/signal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/signal.nix)

## `services.netbird.server.signal.port` {#opt-services.netbird.server.signal.port}

Internal port of the signal server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8012`

*Declared by:* [`nixos/modules/services/networking/netbird/signal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird/signal.nix)

## `services.netbird.tunnels` {#opt-services.netbird.tunnels}

Alias of [`services.netbird.clients`](#opt-services.netbird.clients).

*Type:* attribute set of (submodule)

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.autoStart` {#opt-services.netbird.tunnels._name_.autoStart}

Start the service with the system.

As of 2024-02-13 it is not possible to start a NetBird client daemon without immediately
connecting to the network, but it is [planned for a near future](https://github.com/netbirdio/netbird/projects/2#card-91718018).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.bin.suffix` {#opt-services.netbird.tunnels._name_.bin.suffix}

A system group name for this client instance.

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.config` {#opt-services.netbird.tunnels._name_.config}

Additional configuration that exists before the first start and
later overrides the existing values in `config.json`.

It is mostly helpful to manage configuration ignored/not yet implemented
outside of `netbird up` invocation.

WARNING: this is not an upstream feature, it could break in the future
(by having lower priority) after upstream implements an equivalent.

It is implemented as a `preStart` script which overrides `config.json`
with content of `/etc/netbird-‹name›/config.d/*.json` files.
This option manages specifically `50-nixos.json` file.

Consult [the source code](https://github.com/netbirdio/netbird/blob/88747e3e0191abc64f1e8c7ecc65e5e50a1527fd/client/internal/config.go#L49-L82)
or inspect existing file for a complete list of available configurations.

*Type:* JSON value

*Default:*

``` nix
{
  DisableAutoConnect = !client.autoStart;
  WgIface = client.interface;
  WgPort = client.port;
} // optionalAttrs (client.dns-resolver.address != null) {
  CustomDNSAddress = "${client.dns-resolver.address}:${toString client.dns-resolver.port}";
}
```

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.dir.baseName` {#opt-services.netbird.tunnels._name_.dir.baseName}

A systemd service name to use (without `.service` suffix).

*Type:* string

*Default:* `"netbird-‹name›"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.dir.runtime` {#opt-services.netbird.tunnels._name_.dir.runtime}

A runtime directory used by NetBird client.

*Type:* absolute path

*Default:* `"/var/run/netbird-‹name›"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.dir.state` {#opt-services.netbird.tunnels._name_.dir.state}

A state directory used by NetBird client to store `config.json`, `state.json` & `resolv.conf`.

*Type:* absolute path

*Default:* `"/var/lib/netbird-‹name›"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.dns-resolver.address` {#opt-services.netbird.tunnels._name_.dns-resolver.address}

An explicit address that NetBird will serve `*.netbird.cloud.` (usually) entries on.

NetBird serves DNS on it's own (dynamic) client address by default.

*Type:* null or string

*Default:* `null`

*Example:* `"127.0.0.123"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.dns-resolver.port` {#opt-services.netbird.tunnels._name_.dns-resolver.port}

A port to serve DNS entries on when `dns-resolver.address` is enabled.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `53`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.environment` {#opt-services.netbird.tunnels._name_.environment}

Environment for the netbird service, used to pass configuration options.

*Type:* attribute set of string

*Default:*

``` nix
{
  NB_STATE_DIR = client.dir.state;
  NB_CONFIG = "${client.dir.state}/config.json";
  NB_DAEMON_ADDR = "unix://${client.dir.runtime}/sock";
  NB_INTERFACE_NAME = client.interface;
  NB_LOG_FILE = mkOptionDefault "console";
  NB_LOG_LEVEL = client.logLevel;
  NB_SERVICE = client.service.name;
  NB_WIREGUARD_PORT = toString client.port;
} // optionalAttrs (client.dns-resolver.address != null) {
  NB_DNS_RESOLVER_ADDRESS = "${client.dns-resolver.address}:${toString client.dns-resolver.port}";
}
```

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.hardened` {#opt-services.netbird.tunnels._name_.hardened}

Hardened service:

- runs as a dedicated user with minimal set of permissions (see caveats),
- restricts daemon configuration socket access to dedicated user group
  (you can grant access to it with `users.users."<user>".extraGroups = [ netbird-‹name› ]`),

Even though the local system resources access is restricted:

- `CAP_NET_RAW`, `CAP_NET_ADMIN` and `CAP_BPF` still give unlimited network manipulation possibilites,
- older kernels don't have `CAP_BPF` and use `CAP_SYS_ADMIN` instead,

Known security features that are not (yet) integrated into the module:

- 2024-02-14: `rosenpass` is an experimental feature configurable solely
  through `--enable-rosenpass` flag on the `netbird up` command,
  see [the docs](https://docs.netbird.io/how-to/enable-post-quantum-cryptography)

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.interface` {#opt-services.netbird.tunnels._name_.interface}

Name of the network interface managed by this client.

*Type:* string

*Default:* `"nb-‹name›"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.logLevel` {#opt-services.netbird.tunnels._name_.logLevel}

Log level of the NetBird daemon.

*Type:* one of "panic", "fatal", "error", "warn", "warning", "info", "debug", "trace"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.login.enable` {#opt-services.netbird.tunnels._name_.login.enable}

Whether to enable automated login for NetBird client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.login.setupKeyFile` {#opt-services.netbird.tunnels._name_.login.setupKeyFile}

A Setup Key file path used for automated login of the machine.

*Type:* null or string

*Default:* `null`

*Example:* `"/run/secrets/netbird-priv/setup-key"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.login.systemdDependencies` {#opt-services.netbird.tunnels._name_.login.systemdDependencies}

Additional systemd dependencies required to succeed before the Setup Key file becomes available.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[ "sops-install-secrets.service" ]
```

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.name` {#opt-services.netbird.tunnels._name_.name}

Primary name for use (as a suffix) in:

- systemd service name,
- hardened user name and group,
- [systemd `*Directory=`](https://www.freedesktop.org/software/systemd/man/latest/systemd.exec.html#RuntimeDirectory=) names,
- desktop application identification,

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.openFirewall` {#opt-services.netbird.tunnels._name_.openFirewall}

Opens up firewall `port` for communication between NetBird peers directly over LAN or public IP,
without using (internet-hosted) TURN servers as intermediaries.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.openInternalFirewall` {#opt-services.netbird.tunnels._name_.openInternalFirewall}

Opens up internal firewall ports for the NetBird's network interface.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.port` {#opt-services.netbird.tunnels._name_.port}

Port the NetBird client listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Example:* `51820`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.service.name` {#opt-services.netbird.tunnels._name_.service.name}

A systemd service name to use (without `.service` suffix).

*Type:* string

*Default:* `"netbird-‹name›"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.suffixedName` {#opt-services.netbird.tunnels._name_.suffixedName}

A systemd service name to use (without `.service` suffix).

*Type:* string

*Default:* `"netbird-‹name›"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.ui.enable` {#opt-services.netbird.tunnels._name_.ui.enable}

Controls presence of `netbird-ui` wrapper for this NetBird client.

*Type:* boolean

*Default:* `client.ui.enable`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.user.group` {#opt-services.netbird.tunnels._name_.user.group}

A system group name for this client instance.

*Type:* string

*Default:* `"netbird-‹name›"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.tunnels.<name>.user.name` {#opt-services.netbird.tunnels._name_.user.name}

A system user name for this client instance.

*Type:* string

*Default:* `"netbird-‹name›"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.ui.enable` {#opt-services.netbird.ui.enable}

Controls presence `netbird-ui` wrappers, defaults to presence of graphical sessions.

*Type:* boolean

*Default:*

``` nix
config.services.displayManager.sessionPackages != [ ] || config.services.xserver.enable
```

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.ui.package` {#opt-services.netbird.ui.package}

The netbird-ui package to use.

*Type:* package

*Default:* `pkgs.netbird-ui`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbird.useRoutingFeatures` {#opt-services.netbird.useRoutingFeatures}

Enables settings required for NetBird's routing features: Network Resources, Network Routes & Exit Nodes.

When set to `client` or `both`, reverse path filtering will be set to loose instead of strict.
When set to `server` or `both`, IP forwarding will be enabled.

*Type:* one of "none", "client", "server", "both"

*Default:* `"none"`

*Example:* `"server"`

*Declared by:* [`nixos/modules/services/networking/netbird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netbird.nix)

## `services.netbox.apiTokenPepperFiles` {#opt-services.netbox.apiTokenPepperFiles}

Mapping of cryptographic pepper IDs to files containing the pepper values.

Peppers provide an additional secret input in hashing operations. They
are required for v2 API tokens (NetBox 4.5+).

::: note
By default a random pepper will be created automatically at
`/var/lib/netbox/pepper.1` and configured with pepper ID 1.
:::

*Type:* attribute set of path not in the Nix store

*Default:*

``` nix
{
  "1" = "${config.services.netbox.dataDir}/pepper.1";
}
```

*Example:*

``` nix
{
  "1" = "/run/keys/netbox-pepper-old";
  "2" = "/run/keys/netbox-pepper-current";
}
```

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.bind` {#opt-services.netbox.bind}

IP and port or Unix domain socket path to bind the HTTP socket to.

::: tip
This setting will be passed to gunicorn's [--bind](https://gunicorn.org/reference/settings/#bind) flag.
:::

*Type:* string

*Default:* `"unix:/run/netbox/netbox.sock"`

*Example:* `"[::1]:8001"`

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.dataDir` {#opt-services.netbox.dataDir}

Storage path of netbox.

*Type:* string

*Default:* `"/var/lib/netbox"`

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.enable` {#opt-services.netbox.enable}

Whether to enable Netbox, a DCIM and IPAM source of truth.

This module requires setting up a reverse proxy and has native support
for nginx. Additionally, the NetBox project has example configurations
for [nginx](https://github.com/netbox-community/netbox/blob/main/contrib/nginx.conf) and the [Apache httpd](https://github.com/netbox-community/netbox/blob/main/contrib/apache.conf) server.

The important change to make is to serve `/static` from
`${config.services.netbox.settings.STATIC_ROOT}`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.environmentFiles` {#opt-services.netbox.environmentFiles}

Environment files loaded into all NetBox services and consumable in
[`services.netbox.extraConfig`](#opt-services.netbox.extraConfig).

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.extraConfig` {#opt-services.netbox.extraConfig}

Additional lines that are appended to `configuration.py`.

This option supports native Python code and can be used for reading
secrets from files or the environment into configuration variables:

Possible options can be found in the [NetBox documentation](https://netboxlabs.com/docs/netbox/configuration/) or, for
authentication purposes, in the [Python Social Auth](https://python-social-auth.readthedocs.io/en/latest/backends/index.html#) documentation.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  from os import environ
  
  # https://python-social-auth.readthedocs.io/en/latest/backends/oidc.html
  # From the environment:
  SOCIAL_AUTH_OIDC_SECRET = environ.get("OIDC_CLIENT_SECRET")
  
  # From a file:
  with open("/run/keys/oidc-client-secret") as fd:
    SOCIAL_AUTH_OIDC_SECRET = fd.read().strip()
''
```

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.gunicorn.extraArgs` {#opt-services.netbox.gunicorn.extraArgs}

Extra arguments passed the Gunicorn process that runs NetBox.

See [https://gunicorn.org/reference/settings/](https://gunicorn.org/reference/settings/) for possible flags.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  workers = 9;
];
```

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.ldapConfigFile` {#opt-services.netbox.ldapConfigFile}

Path to the [LDAP configuration](https://netbox.readthedocs.io/en/stable/installation/6-ldap/#configuration) file, also known as `ldap_config.py`.

When set, will automatically load the `django-auth-ldap` plugin and
configure [`services.netbox.settings.REMOTE_AUTH_BACKEND`](#opt-services.netbox.settings.REMOTE_AUTH_BACKEND).

*Type:* null or absolute path

*Default:* `null`

*Example:*

``` nix
''
  import ldap
  from django_auth_ldap.config import LDAPSearch, PosixGroupType
  
  AUTH_LDAP_SERVER_URI = "ldaps://ldap.example.com/"
  
  AUTH_LDAP_USER_SEARCH = LDAPSearch(
      "ou=accounts,ou=posix,dc=example,dc=com",
      ldap.SCOPE_SUBTREE,
      "(uid=%(user)s)",
  )
  
  AUTH_LDAP_GROUP_SEARCH = LDAPSearch(
      "ou=groups,ou=posix,dc=example,dc=com",
      ldap.SCOPE_SUBTREE,
      "(objectClass=posixGroup)",
  )
  AUTH_LDAP_GROUP_TYPE = PosixGroupType()
  
  # Mirror LDAP group assignments.
  AUTH_LDAP_MIRROR_GROUPS = True
  
  # For more granular permissions, we can map LDAP groups to Django groups.
  AUTH_LDAP_FIND_GROUP_PERMS = True
''
```

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.nginx.enable` {#opt-services.netbox.nginx.enable}

Whether to enable nginx and configure a virtual host.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.nginx.hostname` {#opt-services.netbox.nginx.hostname}

The hostname for which an nginx virtual host should be created.

::: tip
Customize the virtual host through
`services.nginx.virtualHosts.${config.services.netbox.nginx.hostname}`.
:::

*Type:* string

*Example:* `"netbox.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.package` {#opt-services.netbox.package}

NetBox package to use.

*Type:* package

*Default:*

``` nix
if lib.versionAtLeast config.system.stateVersion "26.11" then
  pkgs.netbox_4_7
else
  pkgs.netbox_4_5;
```

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.plugins` {#opt-services.netbox.plugins}

List of plugin packages to install.

*Type:* function that evaluates to a(n) list of package

*Default:*

``` nix
python3Packages: with python3Packages; [];
```

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.postgresql.createLocally` {#opt-services.netbox.postgresql.createLocally}

Whether to enable and set up PostgreSQL locally.

This will automatically created a database and a local user, that can
authenticate over Unix domain sockets with `SO_PEERCRED`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.redis.createLocally` {#opt-services.netbox.redis.createLocally}

Whether to enable and set up a Redis database for NetBox locally.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.secretKeyFile` {#opt-services.netbox.secretKeyFile}

Path to a file containing the [secret key](https://netboxlabs.com/docs/netbox/configuration/required-parameters/#secret_key).

The secret key is used for hashing passwords and signing HTTP cookies.
It can be rotated without data loss; however all existing user sessions
will be invalidated.

::: note
If unset, a random secret will be created automatically at
`/var/lib/netbox/secret.key`.
:::

*Type:* null or path not in the Nix store

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.settings` {#opt-services.netbox.settings}

The main `configuration.py` to set up NetBox.

Can be used to define flat and nested key-value pairs. Check the   
[NetBox documentation](https://netboxlabs.com/docs/netbox/configuration/) for possible options.

::: tip
Use [`services.netbox.extraConfig`](#opt-services.netbox.extraConfig) to extend this file with Python code.
:::

*Type:* open submodule of attribute set of (Python value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.settings.ALLOWED_HOSTS` {#opt-services.netbox.settings.ALLOWED_HOSTS}

A list of valid fully-qualified domain names (FQDNs) and/or IP
addresses that can be used to reach the NetBox service.

*Type:* list of string

*Default:*

``` nix
[
  "*"
]
```

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.settings.DATABASES` {#opt-services.netbox.settings.DATABASES}

Configuration for one or multiple [database](https://netbox.readthedocs.io/en/stable/configuration/required-parameters/#database) backends.

At least one database named `default` must be defined.

*Type:* attribute set of attribute set of string

*Default:*

``` nix
{
  default = {
    HOST = "/run/postgresql";
    NAME = "netbox";
    USER = "netbox";
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.settings.LOGGING` {#opt-services.netbox.settings.LOGGING}

[Logging configuration](https://netboxlabs.com/docs/netbox/configuration/system/#logging) based on the Python [`logging.config`](https://docs.python.org/3/library/logging.config.html) module.

*Type:* attribute set of (Python value)

*Default:*

``` nix
{
  formatters = {
    precise = {
      format = "[%(levelname)s@%(name)s] %(message)s";
    };
  };
  handlers = {
    console = {
      class = "logging.StreamHandler";
      formatter = "precise";
    };
  };
  root = {
    handlers = [
      "console"
    ];
    level = "INFO";
  };
  version = 1;
}
```

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.settings.MEDIA_ROOT` {#opt-services.netbox.settings.MEDIA_ROOT}

Path where uploaded media is stored.

*Type:* absolute path

*Default:* `$${config.services.netbox.dataDir}/media`

*Read only*

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.settings.REDIS.caching.URL` {#opt-services.netbox.settings.REDIS.caching.URL}

Redis database connection for caching.

> It is highly recommended to keep the task and cache
> databases separate. Using the same database number on the
> same Redis instance for both may result in queued background
> tasks being lost during cache flushing events.

[https://netboxlabs.com/docs/netbox/configuration/required-parameters/#redis](https://netboxlabs.com/docs/netbox/configuration/required-parameters/#redis)

*Type:* string

*Default:* `"unix://$\${config.services.redis.servers.netbox.unixSocket}?db=0"`

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.settings.REDIS.tasks.URL` {#opt-services.netbox.settings.REDIS.tasks.URL}

Redis database connection for queuing background tasks.

> It is highly recommended to keep the task and cache
> databases separate. Using the same database number on the
> same Redis instance for both may result in queued background
> tasks being lost during cache flushing events.

[https://netboxlabs.com/docs/netbox/configuration/required-parameters/#redis](https://netboxlabs.com/docs/netbox/configuration/required-parameters/#redis)

*Type:* string

*Default:* `unix://$${config.services.redis.servers.netbox.unixSocket}?db=0`

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.settings.REMOTE_AUTH_BACKEND` {#opt-services.netbox.settings.REMOTE_AUTH_BACKEND}

One or multiple [backends](https://netbox.readthedocs.io/en/stable/configuration/remote-authentication/#remote_auth_backend) used for authenticating external users.

When multiple backends are specified, they are tried in order.

*Type:* string or list of string

*Default:*

``` nix
if config.services.netbox.ldapConfigFile != null then
  "netbox.authentication.LDAPBackend"
else
  "netbox.authentication.RemoteUserBackend"
```

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.settings.REPORTS_ROOT` {#opt-services.netbox.settings.REPORTS_ROOT}

Path where generated reports are stored.

*Type:* absolute path

*Default:* `$${config.services.netbox.dataDir}/reports`

*Read only*

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.settings.SCRIPTS_ROOT` {#opt-services.netbox.settings.SCRIPTS_ROOT}

Path where scripts are stored.

*Type:* absolute path

*Default:* `$${config.services.netbox.dataDir}/scripts`

*Read only*

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netbox.settings.STATIC_ROOT` {#opt-services.netbox.settings.STATIC_ROOT}

Path to the collected static assets, served below `/static/`.

*Type:* absolute path

*Default:* `$${config.services.netbox.dataDir}/static/`

*Read only*

*Declared by:* [`nixos/modules/services/web-apps/netbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/netbox.nix)

## `services.netclient.enable` {#opt-services.netclient.enable}

Whether to enable Netclient Daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/netclient.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netclient.nix)

## `services.netclient.package` {#opt-services.netclient.package}

The netclient package to use.

*Type:* package

*Default:* `pkgs.netclient`

*Declared by:* [`nixos/modules/services/networking/netclient.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netclient.nix)

## `services.netdata.claimTokenFile` {#opt-services.netdata.claimTokenFile}

If set, automatically registers the agent using the given claim token
file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/netdata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/netdata.nix)

## `services.netdata.config` {#opt-services.netdata.config}

Configuration for `netdata.conf` as Nix attributes, cannot be combined with `configText`.

*Type:* attribute set of (attribute set)

*Default:* `{ }`

*Example:*

``` nix
global = {
  "debug log" = "syslog";
  "access log" = "syslog";
  "error log" = "syslog";
};
```

*Declared by:* [`nixos/modules/services/monitoring/netdata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/netdata.nix)

## `services.netdata.configDir` {#opt-services.netdata.configDir}

Complete netdata config directory except `netdata.conf`.
The default configuration is merged with changes
defined in this option.

Each top-level attribute denotes a path in the configuration
directory as in `environment.etc`.

Its value is the absolute path and must be readable by netdata.
Cannot be combined with `configText`.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
"health_alarm_notify.conf" = pkgs.writeText "health_alarm_notify.conf" ''
  sendmail="/path/to/sendmail"
'';
"health.d" = "/run/secrets/netdata/health.d";
```

*Declared by:* [`nixos/modules/services/monitoring/netdata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/netdata.nix)

## `services.netdata.configText` {#opt-services.netdata.configText}

Verbatim netdata.conf, cannot be combined with config.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Example:*

``` nix
''
  [global]
  debug log = syslog
  access log = syslog
  error log = syslog
''
```

*Declared by:* [`nixos/modules/services/monitoring/netdata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/netdata.nix)

## `services.netdata.deadlineBeforeStopSec` {#opt-services.netdata.deadlineBeforeStopSec}

In order to detect when netdata is misbehaving, we run a concurrent task pinging netdata (wait-for-netdata-up)
in the systemd unit.

If after a while, this task does not succeed, we stop the unit and mark it as failed.

You can control this deadline in seconds with this option, it's useful to bump it
if you have (1) a lot of data (2) doing upgrades (3) have low IOPS/throughput.

*Type:* signed integer

*Default:* `120`

*Declared by:* [`nixos/modules/services/monitoring/netdata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/netdata.nix)

## `services.netdata.enable` {#opt-services.netdata.enable}

Whether to enable Netdata.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/netdata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/netdata.nix)

## `services.netdata.enableAnalyticsReporting` {#opt-services.netdata.enableAnalyticsReporting}

Enable reporting of anonymous usage statistics to Netdata Inc. via either
Google Analytics (in versions prior to 1.29.4), or Netdata Inc.'s
self-hosted PostHog (in versions 1.29.4 and later).
See: [https://learn.netdata.cloud/docs/agent/anonymous-statistics](https://learn.netdata.cloud/docs/agent/anonymous-statistics)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/netdata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/netdata.nix)

## `services.netdata.extraNdsudoPackages` {#opt-services.netdata.extraNdsudoPackages}

Extra packages to add to `PATH` to make available to `ndsudo`.

::: warning
`ndsudo` has SUID privileges, be careful what packages you list here.
:::

::: note
`cfg.package` must be built with `withNdsudo = true`
:::

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
[
  pkgs.smartmontools
  pkgs.nvme-cli
]
```

*Declared by:* [`nixos/modules/services/monitoring/netdata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/netdata.nix)

## `services.netdata.extraPluginPaths` {#opt-services.netdata.extraPluginPaths}

Extra paths to add to the netdata global "plugins directory"
option.  Useful for when you want to include your own
collection scripts.

Details about writing a custom netdata plugin are available at:
[https://docs.netdata.cloud/collectors/plugins.d/](https://docs.netdata.cloud/collectors/plugins.d/)

Cannot be combined with configText.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[ "/path/to/plugins.d" ]
```

*Declared by:* [`nixos/modules/services/monitoring/netdata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/netdata.nix)

## `services.netdata.group` {#opt-services.netdata.group}

Group under which netdata runs.

*Type:* string

*Default:* `"netdata"`

*Declared by:* [`nixos/modules/services/monitoring/netdata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/netdata.nix)

## `services.netdata.package` {#opt-services.netdata.package}

The netdata package to use.

*Type:* package

*Default:* `pkgs.netdata`

*Declared by:* [`nixos/modules/services/monitoring/netdata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/netdata.nix)

## `services.netdata.python.enable` {#opt-services.netdata.python.enable}

Whether to enable python-based plugins

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/netdata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/netdata.nix)

## `services.netdata.python.extraPackages` {#opt-services.netdata.python.extraPackages}

Extra python packages available at runtime
to enable additional python plugins.

*Type:* function that evaluates to a(n) list of package

*Default:* `ps: []`

*Example:*

``` nix
ps: [
  ps.psycopg2
  ps.docker
  ps.dnspython
]
```

*Declared by:* [`nixos/modules/services/monitoring/netdata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/netdata.nix)

## `services.netdata.python.recommendedPythonPackages` {#opt-services.netdata.python.recommendedPythonPackages}

Whether to enable a set of recommended Python plugins
by installing extra Python packages.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/netdata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/netdata.nix)

## `services.netdata.user` {#opt-services.netdata.user}

User account under which netdata runs.

*Type:* string

*Default:* `"netdata"`

*Declared by:* [`nixos/modules/services/monitoring/netdata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/netdata.nix)

## `services.netfoil.config` {#opt-services.netfoil.config}

Additional configuration options for Netfoil

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/netfoil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netfoil.nix)

## `services.netfoil.doHIPs` {#opt-services.netfoil.doHIPs}

The DoH IPs to use for upstream DNS queries

*Type:* string

*Default:* `"1.1.1.2,1.0.0.2"`

*Declared by:* [`nixos/modules/services/networking/netfoil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netfoil.nix)

## `services.netfoil.doHUrl` {#opt-services.netfoil.doHUrl}

The DoH URL to use for upstream DNS queries

*Type:* string

*Default:* `"https://security.cloudflare-dns.com/dns-query"`

*Declared by:* [`nixos/modules/services/networking/netfoil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netfoil.nix)

## `services.netfoil.enable` {#opt-services.netfoil.enable}

Enable Netfoil, a minimal, filtering, DNS proxy

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/netfoil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netfoil.nix)

## `services.netfoil.listen.ipAddress` {#opt-services.netfoil.listen.ipAddress}

IP address on which Netfoil listens for incoming connections

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/netfoil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netfoil.nix)

## `services.netfoil.listen.port` {#opt-services.netfoil.listen.port}

Port on which Netfoil listens for incoming connections

*Type:* signed integer

*Default:* `53`

*Declared by:* [`nixos/modules/services/networking/netfoil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netfoil.nix)

## `services.netfoil.logAllowed` {#opt-services.netfoil.logAllowed}

Log allowed DNS queries

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/netfoil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netfoil.nix)

## `services.netfoil.logDenied` {#opt-services.netfoil.logDenied}

Log denied DNS queries

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/netfoil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netfoil.nix)

## `services.netfoil.rules.allow.exact` {#opt-services.netfoil.rules.allow.exact}

List of exact domain names to allow

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/netfoil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netfoil.nix)

## `services.netfoil.rules.allow.ipv4` {#opt-services.netfoil.rules.allow.ipv4}

List of ipv4 CIDR ranges to allow

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/netfoil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netfoil.nix)

## `services.netfoil.rules.allow.ipv6` {#opt-services.netfoil.rules.allow.ipv6}

List of ipv6 CIDR ranges to allow

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/netfoil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netfoil.nix)

## `services.netfoil.rules.allow.tld` {#opt-services.netfoil.rules.allow.tld}

List of TLDs to allow

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/netfoil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netfoil.nix)

## `services.netfoil.rules.deny.exact` {#opt-services.netfoil.rules.deny.exact}

List of exact domain names to deny

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/netfoil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netfoil.nix)

## `services.netfoil.rules.deny.ipv4` {#opt-services.netfoil.rules.deny.ipv4}

List of ipv4 CIDR ranges to deny

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/netfoil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netfoil.nix)

## `services.netfoil.rules.deny.ipv6` {#opt-services.netfoil.rules.deny.ipv6}

List of ipv6 CIDR ranges to deny

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/netfoil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netfoil.nix)

## `services.netfoil.rules.deny.tld` {#opt-services.netfoil.rules.deny.tld}

List of TLDs to deny

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/netfoil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netfoil.nix)

## `services.netfoil.rules.known.knownTlds` {#opt-services.netfoil.rules.known.knownTlds}

List of known TLDs

*Type:* list of string

*Default:*

``` nix
[
  ".com"
  ".net"
  ".org"
  ".edu"
  ".gov"
  ".mil"
  ".int"
]
```

*Declared by:* [`nixos/modules/services/networking/netfoil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netfoil.nix)

## `services.netfoil.rules.pin.a` {#opt-services.netfoil.rules.pin.a}

List of A records to pin [domain:ipv4](domain:ipv4)

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/netfoil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netfoil.nix)

## `services.netfoil.rules.pin.responseDomain` {#opt-services.netfoil.rules.pin.responseDomain}

List of domains to pin [domain:domain](domain:domain)

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/netfoil.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netfoil.nix)

## `services.networkaudiod.enable` {#opt-services.networkaudiod.enable}

Whether to enable Networkaudiod (NAA).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/networkaudiod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/networkaudiod.nix)

## `services.networkd-dispatcher.enable` {#opt-services.networkd-dispatcher.enable}

Whether to enable Networkd-dispatcher service for systemd-networkd connection status
change. See [upstream instructions](https://gitlab.com/craftyguy/networkd-dispatcher)
for usage
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/networkd-dispatcher.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkd-dispatcher.nix)

## `services.networkd-dispatcher.extraArgs` {#opt-services.networkd-dispatcher.extraArgs}

Extra arguments to pass to the networkd-dispatcher command.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/networkd-dispatcher.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkd-dispatcher.nix)

## `services.networkd-dispatcher.rules` {#opt-services.networkd-dispatcher.rules}

Declarative configuration of networkd-dispatcher rules. See
[upstream instructions](https://gitlab.com/craftyguy/networkd-dispatcher)
for an introduction and example scripts.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{ "restart-tor" = {
    onState = ["routable" "off"];
    script = ''
      #!${pkgs.runtimeShell}
      if [[ $IFACE == "wlan0" && $AdministrativeState == "configured" ]]; then
        echo "Restarting Tor ..."
        systemctl restart tor
      fi
      exit 0
    '';
  };
};
```

*Declared by:* [`nixos/modules/services/networking/networkd-dispatcher.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkd-dispatcher.nix)

## `services.networkd-dispatcher.rules.<name>.onState` {#opt-services.networkd-dispatcher.rules._name_.onState}

List of names of the systemd-networkd operational states which
should trigger the script. See `networkctl(1)`
for a description of the specific state type.

*Type:* list of (one of "routable", "dormant", "no-carrier", "off", "carrier", "degraded", "configuring", "configured", "enslaved")

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/networkd-dispatcher.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkd-dispatcher.nix)

## `services.networkd-dispatcher.rules.<name>.script` {#opt-services.networkd-dispatcher.rules._name_.script}

Shell commands executed on specified operational states.

*Type:* strings concatenated with "\\n"

*Declared by:* [`nixos/modules/services/networking/networkd-dispatcher.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkd-dispatcher.nix)

## `services.networking.websockify.enable` {#opt-services.networking.websockify.enable}

Whether to enable websockify to forward websocket connections to TCP connections.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/websockify.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/websockify.nix)

## `services.networking.websockify.portMap` {#opt-services.networking.websockify.portMap}

Ports to map by default.

*Type:* attribute set of 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/websockify.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/websockify.nix)

## `services.networking.websockify.sslCert` {#opt-services.networking.websockify.sslCert}

Path to the SSL certificate.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/networking/websockify.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/websockify.nix)

## `services.networking.websockify.sslKey` {#opt-services.networking.websockify.sslKey}

Path to the SSL key.

*Type:* absolute path

*Default:* `config.services.networking.websockify.sslCert`

*Declared by:* [`nixos/modules/services/networking/websockify.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/websockify.nix)

## `services.newt.blueprint` {#opt-services.newt.blueprint}

Blueprint for declarative settings, see [Newt Blueprint docs](https://docs.pangolin.net/manage/blueprints#blueprints) for more information.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  proxy-resources = {
    jellyfin = {
      auth = {
        sso-enabled = true;
      };
      full-domain = "jfn.example.com";
      name = "Jellyfin";
      protocol = "http";
      targets = [
        {
          hostname = "localhost";
          method = "http";
          port = 8096;
        }
      ];
    };
  };
}
```

*Declared by:* [`nixos/modules/services/networking/newt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/newt.nix)

## `services.newt.enable` {#opt-services.newt.enable}

Whether to enable Newt, user space tunnel client for Pangolin.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/newt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/newt.nix)

## `services.newt.environmentFile` {#opt-services.newt.environmentFile}

Path to a file containing sensitive environment variables for Newt. See [Client credentials](https://docs.pangolin.net/manage/clients/credentials) for more information.
These will overwrite anything defined in the config.
The file should contain environment-variable assignments like:
NEWT\_ID=2ix2t8xk22ubpfy
NEWT\_SECRET=nnisrfsdfc7prqsp9ewo1dvtvci50j5uiqotez00dgap0ii2

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/newt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/newt.nix)

## `services.newt.package` {#opt-services.newt.package}

The fosrl-newt package to use.

*Type:* package

*Default:* `pkgs.fosrl-newt`

*Declared by:* [`nixos/modules/services/networking/newt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/newt.nix)

## `services.newt.settings` {#opt-services.newt.settings}

Settings for Newt module, see [Newt CLI docs](https://github.com/fosrl/newt?tab=readme-ov-file#cli-args) for more information.

*Type:* value coercible to CLI argument

*Default:* `{ }`

*Example:*

``` nix
{
  endpoint = "pangolin.example.com";
  id = "8yfsghj438a20ol";
}
```

*Declared by:* [`nixos/modules/services/networking/newt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/newt.nix)

## `services.nextcloud-spreed-signaling.backends` {#opt-services.nextcloud-spreed-signaling.backends}

A list of backends from which clients are allowed to connect from. The name of the attribute will be used as the
backend id.

Each backend will have isolated rooms, i.e. clients connecting to room "abc12345" on backend 1 will be in a
different room than clients connected to a room with the same name on backend 2. Also sessions connected from
different backends will not be able to communicate with each other.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  nextcloud = {
    secretFile = "/run/secrets/nextcloud-secret";
    urls = [
      "https://cloud.example.com"
    ];
  };
}
```

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.backends.<name>.secretFile` {#opt-services.nextcloud-spreed-signaling.backends._name_.secretFile}

The path to the file containing the value for `backends.<name>.secret`.

Shared secret for requests from and to the backend servers.

This must be the same value as configured in the Nextloud Talk admin UI.

*Type:* absolute path

*Example:* `"/run/secrets/backends.<name>.secret"`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.backends.<name>.urls` {#opt-services.nextcloud-spreed-signaling.backends._name_.urls}

List of URLs of the Nextcloud instance

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.configureNginx` {#opt-services.nextcloud-spreed-signaling.configureNginx}

Whether to set up and configure an nginx virtual host according to upstream's recommendations.

The virtualHost domain must be specified under `config.services.nextcloud-spreed-signaling.hostName` if this is enabled.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.enable` {#opt-services.nextcloud-spreed-signaling.enable}

Whether to enable Spreed standalone signaling server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.group` {#opt-services.nextcloud-spreed-signaling.group}

Group under which to run the Spreed signaling server.

*Type:* string

*Default:* `"nextcloud-spreed-signaling"`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.hostName` {#opt-services.nextcloud-spreed-signaling.hostName}

The host name to bind the nginx virtual host to, if
`config.services.nextcloud-spreed-signaling.configureNginx` is set to `true`.

*Type:* null or string

*Default:* `null`

*Example:* `"talk.mydomain.org"`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.package` {#opt-services.nextcloud-spreed-signaling.package}

The nextcloud-spreed-signaling package to use.

*Type:* package

*Default:* `pkgs.nextcloud-spreed-signaling`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.settings` {#opt-services.nextcloud-spreed-signaling.settings}

Declarative configuration. Refer to
[https://github.com/strukturag/nextcloud-spreed-signaling/blob/master/server.conf.in](https://github.com/strukturag/nextcloud-spreed-signaling/blob/master/server.conf.in) for a list of available
options.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.settings.app.debug` {#opt-services.nextcloud-spreed-signaling.settings.app.debug}

Set to "true" to install pprof debug handlers. Access will only be possible from IPs allowed through
IPs declared in `config.services.nextcloud-spreed-signaling.settings.stats.allowed_ips`.

See "https://golang.org/pkg/net/http/pprof/" for further information.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.settings.backend.allowall` {#opt-services.nextcloud-spreed-signaling.settings.backend.allowall}

Allow any hostname as backend endpoint. This is insecure and not advised.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.settings.backend.backendtype` {#opt-services.nextcloud-spreed-signaling.settings.backend.backendtype}

Type of backend configuration.
Defaults to "static".

Possible values:

- static: A comma-separated list of backends is given in the "backends" option (derived from
  `config.services.nextcloud-spreed-signaling.backends`)
- etcd: Backends are retrieved from an etcd cluster.

*Type:* one of "static", "etcd"

*Default:* `"static"`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.settings.backend.connectionsperhost` {#opt-services.nextcloud-spreed-signaling.settings.backend.connectionsperhost}

Maximum number of concurrent backend connections per host

*Type:* positive integer, meaning \>0

*Default:* `8`

*Example:* `12`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.settings.backend.timeout` {#opt-services.nextcloud-spreed-signaling.settings.backend.timeout}

Timeout in seconds for requests to the backend

*Type:* positive integer, meaning \>0

*Default:* `10`

*Example:* `30`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.settings.clients.internalsecretFile` {#opt-services.nextcloud-spreed-signaling.settings.clients.internalsecretFile}

The path to the file containing the value for `clients.internalsecret`.

Shared secret for connections from internal clients.
This must be the same value as configured in the respective internal services.

*Type:* absolute path

*Example:* `"/run/secrets/clients.internalsecret"`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.settings.etcd.endpoints` {#opt-services.nextcloud-spreed-signaling.settings.etcd.endpoints}

List of static etcd endpoints to connect to.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "127.0.0.1:2379"
]
```

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.settings.grpc.listen` {#opt-services.nextcloud-spreed-signaling.settings.grpc.listen}

IP and port to listen on for GRPC requests. Leave `null` to disable the listener.

*Type:* null or string

*Default:* `null`

*Example:* `"127.0.0.1:9090"`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.settings.grpc.targets` {#opt-services.nextcloud-spreed-signaling.settings.grpc.targets}

For target type `static`: List of GRPC targets to connect to for clustering mode.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "192.168.0.1:9090"
]
```

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.settings.http.listen` {#opt-services.nextcloud-spreed-signaling.settings.http.listen}

IP and port to listen on for HTTP requests, in the format of `ip:port`.

If set to `null`, will not spawn a HTTP listener at all.

*Type:* null or string

*Default:* `null`

*Example:* `"127.0.0.1:8080"`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.settings.https.certificate` {#opt-services.nextcloud-spreed-signaling.settings.https.certificate}

Path to the certificate used for the HTTPS listener. Must be set if `config.services.nextcloud-spreed-signaling.settings.https.listen`
is not `null`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/etc/nginx/ssl/server.crt"`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.settings.https.key` {#opt-services.nextcloud-spreed-signaling.settings.https.key}

Path to the private key used for the HTTPS listener. Must be set if `config.services.nextcloud-spreed-signaling.settings.https.listen`
is not `null`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/etc/nginx/ssl/server.key"`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.settings.https.listen` {#opt-services.nextcloud-spreed-signaling.settings.https.listen}

IP and port to listen on for HTTPS requests, in the format of `ip:port`.

If set, must also specify `config.services.nextcloud-spreed-signaling.settings.https.certificate` and `config.services.nextcloud-spreed-signaling.settings.https.key`.
If set to `null`, will not spawn a HTTPS listener at all.

*Type:* null or string

*Default:* `null`

*Example:* `"127.0.0.1:8443"`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.settings.mcu.type` {#opt-services.nextcloud-spreed-signaling.settings.mcu.type}

The type of MCU to use. Leave empty to disable MCU functionality.

*Type:* null or one of "janus", "proxy"

*Default:* `null`

*Example:* `"janus"`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.settings.nats.url` {#opt-services.nextcloud-spreed-signaling.settings.nats.url}

URL of one or more NATS backends to use.

This can be set to `nats://loopback` to process NATS messages internally instead.

*Type:* list of string

*Default:*

``` nix
[
  "nats://loopback"
]
```

*Example:*

``` nix
[
  "nats://localhost:4222"
]
```

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.settings.sessions.blockkeyFile` {#opt-services.nextcloud-spreed-signaling.settings.sessions.blockkeyFile}

The path to the file containing the value for `sessions.blockkey`.

Key for encrypting data in the sessions. Must be either 16, 24, or 32 bytes.
Generate one using `openssl rand -hex 16`

*Type:* absolute path

*Example:* `"/run/secrets/sessions.blockkey"`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.settings.sessions.hashkeyFile` {#opt-services.nextcloud-spreed-signaling.settings.sessions.hashkeyFile}

The path to the file containing the value for `sessions.hashkey`.

Secret value used to generate the checksums of sessions.
This should be a random string of 32 or 64 bytes.
Generate one using `openssl rand -hex 32`

*Type:* absolute path

*Example:* `"/run/secrets/sessions.hashkey"`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.settings.stats.allowed_ips` {#opt-services.nextcloud-spreed-signaling.settings.stats.allowed_ips}

List of IP addresses that are allowed to access the debug, stats and metrics endpoints.

Leave empty or `null` to only allow access from localhost.

*Type:* null or (list of string)

*Default:* `null`

*Example:*

``` nix
[
  "127.0.0.1"
]
```

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.settings.turn.apikeyFile` {#opt-services.nextcloud-spreed-signaling.settings.turn.apikeyFile}

The path to the file containing the value for `turn.apikey`.

API key that the MCU will need to send when requesting TURN credentials.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/turn.apikey"`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.settings.turn.secretFile` {#opt-services.nextcloud-spreed-signaling.settings.turn.secretFile}

The path to the file containing the value for `turn.secret`.

The shared secret to use for generating TURN credentials. This must be the same as on the TURN server.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/turn.secret"`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.settings.turn.servers` {#opt-services.nextcloud-spreed-signaling.settings.turn.servers}

A list of TURN servers to use. Leave empty to disable the TURN REST API.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "turn:1.2.3.4:9991?transport=udp"
]
```

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.stateDir` {#opt-services.nextcloud-spreed-signaling.stateDir}

Directory used for state & config files.

*Type:* absolute path

*Default:* `"/var/lib/nextcloud-spreed-signaling"`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-spreed-signaling.user` {#opt-services.nextcloud-spreed-signaling.user}

User account under which to run the Spreed signaling server.

*Type:* string

*Default:* `"nextcloud-spreed-signaling"`

*Declared by:* [`nixos/modules/services/networking/nextcloud-spreed-signaling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextcloud-spreed-signaling.nix)

## `services.nextcloud-whiteboard-server.enable` {#opt-services.nextcloud-whiteboard-server.enable}

Whether to enable Nextcloud backend server for the Whiteboard app.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud-whiteboard-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud-whiteboard-server.nix)

## `services.nextcloud-whiteboard-server.package` {#opt-services.nextcloud-whiteboard-server.package}

The nextcloud-whiteboard-server package to use.

*Type:* package

*Default:* `pkgs.nextcloud-whiteboard-server`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud-whiteboard-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud-whiteboard-server.nix)

## `services.nextcloud-whiteboard-server.secrets` {#opt-services.nextcloud-whiteboard-server.secrets}

A list of files containing the various secrets. Should be in the
format expected by systemd's `EnvironmentFile` directory.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud-whiteboard-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud-whiteboard-server.nix)

## `services.nextcloud-whiteboard-server.settings` {#opt-services.nextcloud-whiteboard-server.settings}

Settings to configure backend server. Especially the Nextcloud host
url has to be set. The required environment variable `JWT_SECRET_KEY`
should be set via the secrets option.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  NEXTCLOUD_URL = "https://nextcloud.example.org";
}
```

*Declared by:* [`nixos/modules/services/web-apps/nextcloud-whiteboard-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud-whiteboard-server.nix)

## `services.nextcloud.appstoreEnable` {#opt-services.nextcloud.appstoreEnable}

Allow the installation and updating of apps from the Nextcloud appstore.
Enabled by default unless there are packages in [services (N)](#opt-services.nextcloud.extraApps).
Set this to true to force enable the store even if [services (N)](#opt-services.nextcloud.extraApps) is used.
Set this to false to disable the installation of apps from the global appstore. App management is always enabled regardless of this setting.

*Type:* null or boolean

*Default:* `null`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.autoUpdateApps.enable` {#opt-services.nextcloud.autoUpdateApps.enable}

Run a regular auto-update of all apps installed from the Nextcloud app store.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.autoUpdateApps.startAt` {#opt-services.nextcloud.autoUpdateApps.startAt}

When to run the update. See `systemd.services.<name>.startAt`.

*Type:* string or list of string

*Default:* `"05:00:00"`

*Example:* `"Sun 14:00:00"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.caching.apcu` {#opt-services.nextcloud.caching.apcu}

Whether to load the APCu module into PHP.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.caching.memcached` {#opt-services.nextcloud.caching.memcached}

Whether to load the Memcached module into PHP.
You still need to enable Memcached in your config.php.
See [https://docs.nextcloud.com/server/latest/admin\_manual/configuration\_server/caching\_configuration.html](https://docs.nextcloud.com/server/latest/admin_manual/configuration_server/caching_configuration.html)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.caching.redis` {#opt-services.nextcloud.caching.redis}

Whether to load the Redis module into PHP.
You still need to enable Redis in your config.php.
See [https://docs.nextcloud.com/server/latest/admin\_manual/configuration\_server/caching\_configuration.html](https://docs.nextcloud.com/server/latest/admin_manual/configuration_server/caching_configuration.html)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.cli.memoryLimit` {#opt-services.nextcloud.cli.memoryLimit}

The `memory_limit` of PHP is equal to [services (N)](#opt-services.nextcloud.maxUploadSize).
The value can be customized for `nextcloud-cron.service` using this option.

*Type:* null or string

*Default:* `null`

*Example:* `"1G"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.config.dbhost` {#opt-services.nextcloud.config.dbhost}

Database host (+port) or socket path.
If [services (N)](#opt-services.nextcloud.database.createLocally) is true and
[services (N)](#opt-services.nextcloud.config.dbtype) is either `pgsql` or `mysql`,
defaults to the correct Unix socket instead.

*Type:* null or string

*Default:* `"localhost"`

*Example:* `"localhost:5000"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.config.dbname` {#opt-services.nextcloud.config.dbname}

Database name.

*Type:* null or string

*Default:* `"nextcloud"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.config.dbpassFile` {#opt-services.nextcloud.config.dbpassFile}

The full path to a file that contains the database password.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.config.dbtableprefix` {#opt-services.nextcloud.config.dbtableprefix}

Table prefix in Nextcloud's database.

**Note:** since Nextcloud 20 it's not an option anymore to create a database
schema with a custom table prefix. This option only exists for backwards compatibility
with installations that were originally provisioned with Nextcloud \<20.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.config.dbtype` {#opt-services.nextcloud.config.dbtype}

Database type.

*Type:* null or one of "sqlite", "pgsql", "mysql"

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.config.dbuser` {#opt-services.nextcloud.config.dbuser}

Database user.

*Type:* null or string

*Default:* `"nextcloud"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.config.objectstore.s3.bucket` {#opt-services.nextcloud.config.objectstore.s3.bucket}

The name of the S3 bucket.

*Type:* string

*Example:* `"nextcloud"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.config.objectstore.s3.enable` {#opt-services.nextcloud.config.objectstore.s3.enable}

Whether to enable S3 object storage as primary storage.

This mounts a bucket on an Amazon S3 object storage or compatible
implementation into the virtual filesystem.

Further details about this feature can be found in the
[upstream documentation](https://docs.nextcloud.com/server/22/admin_manual/configuration_files/primary_storage.html)
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.config.objectstore.s3.hostname` {#opt-services.nextcloud.config.objectstore.s3.hostname}

Required for some non-Amazon implementations.

*Type:* null or string

*Default:* `null`

*Example:* `"example.com"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.config.objectstore.s3.key` {#opt-services.nextcloud.config.objectstore.s3.key}

The access key for the S3 bucket.

*Type:* string

*Example:* `"EJ39ITYZEUH5BGWDRUFY"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.config.objectstore.s3.port` {#opt-services.nextcloud.config.objectstore.s3.port}

Required for some non-Amazon implementations.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.config.objectstore.s3.region` {#opt-services.nextcloud.config.objectstore.s3.region}

Required for some non-Amazon implementations.

*Type:* null or string

*Default:* `null`

*Example:* `"REGION"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.config.objectstore.s3.secretFile` {#opt-services.nextcloud.config.objectstore.s3.secretFile}

The full path to a file that contains the access secret.

*Type:* string

*Example:* `"/var/nextcloud-objectstore-s3-secret"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.config.objectstore.s3.sseCKeyFile` {#opt-services.nextcloud.config.objectstore.s3.sseCKeyFile}

If provided this is the full path to a file that contains the key
to enable [server-side encryption with customer-provided keys](https://docs.aws.amazon.com/AmazonS3/latest/userguide/ServerSideEncryptionCustomerKeys.html)
(SSE-C).

The file must contain a random 32-byte key encoded as a base64
string, e.g. generated with the command

```
openssl rand 32 | base64
```

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/nextcloud-objectstore-s3-sse-c-key"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.config.objectstore.s3.usePathStyle` {#opt-services.nextcloud.config.objectstore.s3.usePathStyle}

Required for some non-Amazon S3 implementations.

Ordinarily, requests will be made with
`http://bucket.hostname.domain/`, but with path style
enabled requests are made with
`http://hostname.domain/bucket` instead.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.config.objectstore.s3.useSsl` {#opt-services.nextcloud.config.objectstore.s3.useSsl}

Use SSL for objectstore access.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.config.objectstore.s3.verify_bucket_exists` {#opt-services.nextcloud.config.objectstore.s3.verify_bucket_exists}

Create the objectstore bucket if it does not exist.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.configureRedis` {#opt-services.nextcloud.configureRedis}

Whether to configure Nextcloud to use the recommended Redis settings for small instances.

::: note
The Nextcloud system check recommends to configure either Redis or Memcache for file lock caching.
:::

::: note
The `notify_push` app requires Redis to be configured. If this option is turned off, this must be configured manually.
:::

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.database.createLocally` {#opt-services.nextcloud.database.createLocally}

Whether to create the database and database user locally.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.datadir` {#opt-services.nextcloud.datadir}

Nextcloud's data storage path.  Will be [services (N)](#opt-services.nextcloud.home) by default.
This folder will be populated with a config.php file and a data folder which contains the state of the instance (excluding the database).";

*Type:* string

*Default:* `config.services.nextcloud.home`

*Example:* `"/mnt/nextcloud-file"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.enable` {#opt-services.nextcloud.enable}

Whether to enable nextcloud.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.enableImagemagick` {#opt-services.nextcloud.enableImagemagick}

Whether to enable the ImageMagick module for PHP.
This is used by the theming app and for generating previews of certain images (e.g. SVG and HEIF).
You may want to disable it for increased security. In that case, previews will still be available
for some images (e.g. JPEG and PNG).
See [https://github.com/nextcloud/server/issues/13099](https://github.com/nextcloud/server/issues/13099)
.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.extraApps` {#opt-services.nextcloud.extraApps}

Extra apps to install. Should be an attrSet of appid to packages generated by fetchNextcloudApp.
The appid must be identical to the "id" value in the apps appinfo/info.xml.
Using this will disable the appstore to prevent Nextcloud from updating these apps (see [services (N)](#opt-services.nextcloud.appstoreEnable)).

*Type:* attribute set of package

*Default:* `{ }`

*Example:*

``` nix
{
  inherit (pkgs.nextcloud31Packages.apps) mail calendar contacts;
  phonetrack = pkgs.fetchNextcloudApp {
    appName = "phonetrack";
    appVersion = "0.8.2";
    license = "agpl3Plus";
    sha512 = "f67902d1b48def9a244383a39d7bec95bb4215054963a9751f99dae9bd2f2740c02d2ef97b3b76d69a36fa95f8a9374dd049440b195f4dad2f0c4bca645de228";
    url = "https://github.com/julien-nc/phonetrack/releases/download/v0.8.2/phonetrack-0.8.2.tar.gz";
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.extraAppsCheckVersionRanges` {#opt-services.nextcloud.extraAppsCheckVersionRanges}

Check the Nextcloud version falls within the
declared minimum and maximum nextcloud versions
of the configured extraApps.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.extraAppsEnable` {#opt-services.nextcloud.extraAppsEnable}

Automatically enable the apps in [services (N)](#opt-services.nextcloud.extraApps) every time Nextcloud starts.
If set to false, apps need to be enabled in the Nextcloud web user interface or with `nextcloud-occ app:enable`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.fastcgiTimeout` {#opt-services.nextcloud.fastcgiTimeout}

FastCGI timeout for database connection in seconds.

*Type:* signed integer

*Default:* `120`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.finalPackage` {#opt-services.nextcloud.finalPackage}

Package to the finalized Nextcloud package, including all installed apps.
This is automatically set by the module.

*Type:* package

*Read only*

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.home` {#opt-services.nextcloud.home}

Storage path of nextcloud.

*Type:* string

*Default:* `"/var/lib/nextcloud"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.hostName` {#opt-services.nextcloud.hostName}

FQDN for the nextcloud instance.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.https` {#opt-services.nextcloud.https}

Use HTTPS for generated links.

Be aware that this also enables HTTP Strict Transport Security (HSTS) headers.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.imaginary.enable` {#opt-services.nextcloud.imaginary.enable}

Whether to enable Imaginary.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.maxUploadSize` {#opt-services.nextcloud.maxUploadSize}

The upload limit for files. This changes the relevant options
in php.ini and nginx if enabled.

*Type:* string

*Default:* `"512M"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.nginx.enableFastcgiRequestBuffering` {#opt-services.nextcloud.nginx.enableFastcgiRequestBuffering}

Whether to buffer requests against fastcgi requests. This is a workaround
for `PUT` requests with the `Transfer-Encoding: chunked` header set and
an unspecified `Content-Length`. Without request buffering for these requests,
Nextcloud will create files with zero bytes length as described in
[nextcloud/server#7995](https://github.com/nextcloud/server/issues/7995).

::: note
Please keep in mind that upstream suggests to not enable this as it might
lead to timeouts on large files being uploaded as described in the
[administrator manual](https://docs.nextcloud.com/server/latest/admin_manual/configuration_files/big_file_upload_configuration.html#nginx).
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.nginx.hstsMaxAge` {#opt-services.nextcloud.nginx.hstsMaxAge}

Value for the `max-age` directive of the HTTP
`Strict-Transport-Security` header.

See section 6.1.1 of IETF RFC 6797 for detailed information on this
directive and header.

*Type:* positive integer, meaning \>0

*Default:* `15552000`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.notify_push.bendDomainToLocalhost` {#opt-services.nextcloud.notify_push.bendDomainToLocalhost}

Whether to add an entry to `/etc/hosts` for the configured nextcloud domain to point to `localhost` and add `localhost `to nextcloud's `trusted_proxies` config option.

This is useful when nextcloud's domain is not a static IP address and when the reverse proxy cannot be bypassed because the backend connection is done via unix socket.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud-notify_push.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud-notify_push.nix)

## `services.nextcloud.notify_push.dbhost` {#opt-services.nextcloud.notify_push.dbhost}

Database host (+port) or socket path.
If [services (N)](#opt-services.nextcloud.database.createLocally) is true and
[services (N)](#opt-services.nextcloud.config.dbtype) is either `pgsql` or `mysql`,
defaults to the correct Unix socket instead.

*Type:* null or string

*Default:* `config.services.nextcloud.config.dbhost`

*Example:* `"localhost:5000"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud-notify_push.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud-notify_push.nix)

## `services.nextcloud.notify_push.dbname` {#opt-services.nextcloud.notify_push.dbname}

Database name.

*Type:* null or string

*Default:* `config.services.nextcloud.config.dbname`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud-notify_push.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud-notify_push.nix)

## `services.nextcloud.notify_push.dbpassFile` {#opt-services.nextcloud.notify_push.dbpassFile}

The full path to a file that contains the database password.

*Type:* null or string

*Default:* `config.services.nextcloud.config.dbpassFile`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud-notify_push.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud-notify_push.nix)

## `services.nextcloud.notify_push.dbtableprefix` {#opt-services.nextcloud.notify_push.dbtableprefix}

Table prefix in Nextcloud's database.

**Note:** since Nextcloud 20 it's not an option anymore to create a database
schema with a custom table prefix. This option only exists for backwards compatibility
with installations that were originally provisioned with Nextcloud \<20.

*Type:* null or string

*Default:* `config.services.nextcloud.config.dbtableprefix`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud-notify_push.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud-notify_push.nix)

## `services.nextcloud.notify_push.dbtype` {#opt-services.nextcloud.notify_push.dbtype}

Database type.

*Type:* null or one of "sqlite", "pgsql", "mysql"

*Default:* `config.services.nextcloud.config.dbtype`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud-notify_push.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud-notify_push.nix)

## `services.nextcloud.notify_push.dbuser` {#opt-services.nextcloud.notify_push.dbuser}

Database user.

*Type:* null or string

*Default:* `config.services.nextcloud.config.dbuser`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud-notify_push.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud-notify_push.nix)

## `services.nextcloud.notify_push.enable` {#opt-services.nextcloud.notify_push.enable}

Whether to enable Notify push.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud-notify_push.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud-notify_push.nix)

## `services.nextcloud.notify_push.logLevel` {#opt-services.nextcloud.notify_push.logLevel}

Log level

*Type:* one of "error", "warn", "info", "debug", "trace"

*Default:* `"error"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud-notify_push.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud-notify_push.nix)

## `services.nextcloud.notify_push.nextcloudUrl` {#opt-services.nextcloud.notify_push.nextcloudUrl}

Configure the nextcloud URL notify\_push tries to connect to.

*Type:* string

*Default:* `"http${lib.optionalString config.services.nextcloud.https "s"}://${config.services.nextcloud.hostName}"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud-notify_push.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud-notify_push.nix)

## `services.nextcloud.notify_push.package` {#opt-services.nextcloud.notify_push.package}

The nextcloud-notify\_push package to use.

*Type:* package

*Default:* `pkgs.nextcloud-notify_push`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud-notify_push.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud-notify_push.nix)

## `services.nextcloud.notify_push.socketPath` {#opt-services.nextcloud.notify_push.socketPath}

Socket path to use for notify\_push

*Type:* string

*Default:* `"/run/nextcloud-notify_push/sock"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud-notify_push.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud-notify_push.nix)

## `services.nextcloud.occ` {#opt-services.nextcloud.occ}

The nextcloud-occ program preconfigured to target this Nextcloud instance.

*Type:* package

*Default:* generated script

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.package` {#opt-services.nextcloud.package}

Which package to use for the Nextcloud instance.

*Type:* package

*Related packages:*

- [`pkgs.nextcloud33`](https://search.nixos.org/packages?show=nextcloud33&sort=relevance&query=nextcloud33)
- [`pkgs.nextcloud34`](https://search.nixos.org/packages?show=nextcloud34&sort=relevance&query=nextcloud34)
- [`pkgs.nextcloud35`](https://search.nixos.org/packages?show=nextcloud35&sort=relevance&query=nextcloud35)

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.phpExtraExtensions` {#opt-services.nextcloud.phpExtraExtensions}

Additional PHP extensions to use for Nextcloud.
By default, only extensions necessary for a vanilla Nextcloud installation are enabled,
but you may choose from the list of available extensions and add further ones.
This is sometimes necessary to be able to install a certain Nextcloud app that has additional requirements.

*Type:* function that evaluates to a(n) list of package

*Default:* `all: []`

*Example:*

``` nix
all: [ all.pdlib all.bz2 ]
```

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.phpOptions` {#opt-services.nextcloud.phpOptions}

Options for PHP's php.ini file for nextcloud.

Please note that this option is *additive* on purpose while the
attribute values inside the default are option defaults: that means that

``` nix
{
  services.nextcloud.phpOptions."opcache.interned_strings_buffer" = "23";
}
```

will override the `php.ini` option `opcache.interned_strings_buffer` without
discarding the rest of the defaults.

Overriding all of `phpOptions` (including `upload_max_filesize`, `post_max_size`
and `memory_limit` which all point to [services (N)](#opt-services.nextcloud.maxUploadSize)
by default) can be done like this:

``` nix
{
  services.nextcloud.phpOptions = lib.mkForce {
    /* ... */
  };
}
```

*Type:* attribute set of (string or signed integer)

*Default:*

``` nix
{
  display_errors = "stderr";
  error_reporting = "E_ALL & ~E_DEPRECATED & ~E_STRICT";
  expose_php = "Off";
  "opcache.fast_shutdown" = "1";
  "opcache.interned_strings_buffer" = "8";
  "opcache.max_accelerated_files" = "10000";
  "opcache.memory_consumption" = "128";
  "opcache.revalidate_freq" = "1";
  "openssl.cafile" = {
    _type = "literalExpression";
    text = "config.security.pki.caBundle";
  };
  output_buffering = "0";
  short_open_tag = "Off";
}
```

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.phpPackage` {#opt-services.nextcloud.phpPackage}

The php package to use.

*Type:* package

*Default:* `pkgs.php84`

*Example:* `php85`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.poolConfig` {#opt-services.nextcloud.poolConfig}

Options for Nextcloud's PHP pool. See the documentation on `php-fpm.conf` for details on configuration directives.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.poolSettings` {#opt-services.nextcloud.poolSettings}

Options for nextcloud's PHP pool. See the documentation on `php-fpm.conf` for details on
configuration directives. The above are recommended for a server with 4GiB of RAM.

It's advisable to read the [section about PHPFPM tuning in the upstream manual](https://docs.nextcloud.com/server/latest/admin_manual/installation/server_tuning.html#tune-php-fpm)
and consider customizing the values.

*Type:* attribute set of (string or signed integer or boolean)

*Default:*

``` nix
{
  pm = "dynamic";
  "pm.max_children" = "120";
  "pm.max_requests" = "500";
  "pm.max_spare_servers" = "18";
  "pm.min_spare_servers" = "6";
  "pm.start_servers" = "12";
  "pm.status_path" = "/status";
}
```

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.secretFile` {#opt-services.nextcloud.secretFile}

Secret options which will be appended to Nextcloud's config.php file (written as JSON, in the same
form as the [services (N)](#opt-services.nextcloud.settings) option), for example
`{"redis":{"password":"secret"}}`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.secrets` {#opt-services.nextcloud.secrets}

Secret files to read into entries in `config.php`.
This uses `nix_read_secret` and LoadCredential to read the contents of the file into the entry in `config.php`.

*Type:* attribute set of absolute path not in the Nix store

*Default:* `{ }`

*Example:*

``` nix
{
  oidc_login_client_secret = "/run/secrets/nextcloud_oidc_secret";
}
```

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings` {#opt-services.nextcloud.settings}

Extra options which should be appended to Nextcloud's config.php file.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Example:*

``` nix
{
  redis = {
    host = "/run/redis/redis.sock";
    port = 0;
    dbindex = 0;
    password = "secret";
    timeout = 1.5;
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings."profile.enabled"` {#opt-services.nextcloud.settings._profile.enabled_}

Makes user-profiles globally available under `nextcloud.tld/u/user.name`.
Even though it's enabled by default in Nextcloud, it must be explicitly enabled
here because it has the side-effect that personal information is even accessible to
unauthenticated users by default.
By default, the following properties are set to “Show to everyone”
if this flag is enabled:

- About
- Full name
- Headline
- Organisation
- Profile picture
- Role
- Twitter
- Website
  Only has an effect in Nextcloud 23 and later.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings.default_phone_region` {#opt-services.nextcloud.settings.default_phone_region}

An [ISO 3166-1](https://www.iso.org/iso-3166-country-codes.html)
country code which replaces automatic phone-number detection
without a country code.

As an example, with `DE` set as the default phone region,
the `+49` prefix can be omitted for phone numbers.

*Type:* string

*Default:* `""`

*Example:* `"DE"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings.enabledPreviewProviders` {#opt-services.nextcloud.settings.enabledPreviewProviders}

The preview providers that should be explicitly enabled.

*Type:* list of string

*Default:*

``` nix
[
  "OC\\Preview\\PNG"
  "OC\\Preview\\JPEG"
  "OC\\Preview\\GIF"
  "OC\\Preview\\BMP"
  "OC\\Preview\\XBitmap"
  "OC\\Preview\\Krita"
  "OC\\Preview\\WebP"
  "OC\\Preview\\MarkDown"
  "OC\\Preview\\TXT"
  "OC\\Preview\\OpenDocument"
]
```

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings.log_type` {#opt-services.nextcloud.settings.log_type}

Logging backend to use.
systemd automatically adds the php-systemd extensions to services.nextcloud.phpExtraExtensions.
See the [nextcloud documentation](https://docs.nextcloud.com/server/latest/admin_manual/configuration_server/logging_configuration.html) for details.

*Type:* one of "errorlog", "file", "syslog", "systemd"

*Default:* `"syslog"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings.loglevel` {#opt-services.nextcloud.settings.loglevel}

Log level value between 0 (DEBUG) and 4 (FATAL).

- 0 (debug): Log all activity.

- 1 (info): Log activity such as user logins and file activities, plus warnings, errors, and fatal errors.

- 2 (warn): Log successful operations, as well as warnings of potential problems, errors and fatal errors.

- 3 (error): Log failed operations and fatal errors.

- 4 (fatal): Log only fatal errors that cause the server to stop.

*Type:* integer between 0 and 4 (both inclusive)

*Default:* `2`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings.mail_domain` {#opt-services.nextcloud.settings.mail_domain}

The return address that you want to appear on emails sent by the Nextcloud server, for example `nc-admin@example.com`, substituting your own domain, of course.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings.mail_from_address` {#opt-services.nextcloud.settings.mail_from_address}

FROM address that overrides the built-in `sharing-noreply` and `lostpassword-noreply` FROM addresses.
Defaults to different FROM addresses depending on the feature.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings.mail_send_plaintext_only` {#opt-services.nextcloud.settings.mail_send_plaintext_only}

Email will be sent by default with an HTML and a plain text body. This option allows sending only plain text emails.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings.mail_sendmailmode` {#opt-services.nextcloud.settings.mail_sendmailmode}

For `smtp`, the sendmail binary is started with the parameter `-bs`: Use the SMTP protocol on standard input and output.
For `pipe`, the binary is started with the parameters `-t`: Read message from STDIN and extract recipients.

*Type:* one of "smtp", "pipe"

*Default:* `"smtp"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings.mail_smtpauth` {#opt-services.nextcloud.settings.mail_smtpauth}

This depends on `mail_smtpmode`. Change this to `true` if your mail server requires authentication.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings.mail_smtpdebug` {#opt-services.nextcloud.settings.mail_smtpdebug}

Enable SMTP class debugging.
`loglevel` will likely need to be adjusted too.
[See docs](https://docs.nextcloud.com/server/latest/admin_manual/configuration_server/email_configuration.html#enabling-debug-mode).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings.mail_smtphost` {#opt-services.nextcloud.settings.mail_smtphost}

This depends on `mail_smtpmode`. Specify the IP address of your mail server host. This may contain multiple hosts separated by a semicolon. If you need to specify the port number, append it to the IP address separated by a colon, like this: `127.0.0.1:24`.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings.mail_smtpmode` {#opt-services.nextcloud.settings.mail_smtpmode}

Which mode to use for sending mail.
If you are using local or remote SMTP, set this to `smtp`.
For the `sendmail` option, you need an installed and working email system on the server, with your local `sendmail` installation.
For `qmail`, the binary is /var/qmail/bin/sendmail, and it must be installed on your Unix system.
Use the string null to send no mails (disable mail delivery). This can be useful if mails should be sent via APIs and rendering messages is not necessary.

*Type:* one of "sendmail", "smtp", "qmail", "null"

*Default:* `"smtp"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings.mail_smtpname` {#opt-services.nextcloud.settings.mail_smtpname}

This depends on `mail_smtpauth`. Specify the username for authenticating to the SMTP server.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings.mail_smtpport` {#opt-services.nextcloud.settings.mail_smtpport}

This depends on `mail_smtpmode`. Specify the port for sending mail.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `25`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings.mail_smtpsecure` {#opt-services.nextcloud.settings.mail_smtpsecure}

This depends on `mail_smtpmode`. Specify `ssl` when you are using SSL/TLS. Any other value will be ignored.
If the server advertises STARTTLS capabilities, they might be used, but they cannot be enforced by this config option.

*Type:* one of "", "ssl"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings.mail_smtpstreamoptions` {#opt-services.nextcloud.settings.mail_smtpstreamoptions}

This depends on `mail_smtpmode`. Array of additional streams options that will be passed to underlying Swift mailer implementation.

*Type:* attribute set of attribute set of anything

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings.mail_smtptimeout` {#opt-services.nextcloud.settings.mail_smtptimeout}

This depends on `mail_smtpmode`. This sets the SMTP server timeout, in seconds. You may need to increase this if you are running an anti-malware or spam scanner.

*Type:* signed integer

*Default:* `10`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings.mail_template_class` {#opt-services.nextcloud.settings.mail_template_class}

Replaces the default mail template layout. This can be utilized if the options to modify the mail texts with the theming app are not enough.
The class must extend `\OC\Mail\EMailTemplate`

*Type:* string

*Default:* `"\\OC\\Mail\\EMailTemplate"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings.overwriteprotocol` {#opt-services.nextcloud.settings.overwriteprotocol}

Force Nextcloud to always use HTTP or HTTPS i.e. for link generation.
Nextcloud uses the currently used protocol by default, but when
behind a reverse-proxy, it may use `http` for everything although
Nextcloud may be served via HTTPS.

*Type:* one of "", "http", "https"

*Default:* `""`

*Example:* `"https"`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings.skeletondirectory` {#opt-services.nextcloud.settings.skeletondirectory}

The directory where the skeleton files are located. These files will be
copied to the data directory of new users. Leave empty to not copy any
skeleton files.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings.trusted_domains` {#opt-services.nextcloud.settings.trusted_domains}

Trusted domains, from which the nextcloud installation will be
accessible. You don't need to add
`services.nextcloud.hostname` here.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.settings.trusted_proxies` {#opt-services.nextcloud.settings.trusted_proxies}

Trusted proxies, to provide if the nextcloud installation is being
proxied to secure against e.g. spoofing.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextcloud.webfinger` {#opt-services.nextcloud.webfinger}

Enable this option if you plan on using the webfinger plugin.
The appropriate nginx rewrite rules will be added to your configuration.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/nextcloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix)

## `services.nextdns.arguments` {#opt-services.nextdns.arguments}

Additional arguments to be passed to nextdns run.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-config"
  "10.0.3.0/24=abcdef"
]
```

*Declared by:* [`nixos/modules/services/networking/nextdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextdns.nix)

## `services.nextdns.enable` {#opt-services.nextdns.enable}

Whether to enable the NextDNS DNS/53 to DoH Proxy service.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nextdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nextdns.nix)

## `services.nextjs-ollama-llm-ui.enable` {#opt-services.nextjs-ollama-llm-ui.enable}

Whether to enable Simple Ollama web UI service; an easy to use web frontend for a Ollama backend service.
Run state-of-the-art AI large language models (LLM) similar to ChatGPT locally with privacy
on your personal computer.
This service is stateless and doesn't store any data on the server; all data is kept
locally in your web browser.
See [https://github.com/jakobhoeg/nextjs-ollama-llm-ui](https://github.com/jakobhoeg/nextjs-ollama-llm-ui).

Required: You need the Ollama backend service running by having
"services.nextjs-ollama-llm-ui.ollamaUrl" point to the correct url.
You can host such a backend service with NixOS through "services.ollama".
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nextjs-ollama-llm-ui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextjs-ollama-llm-ui.nix)

## `services.nextjs-ollama-llm-ui.hostname` {#opt-services.nextjs-ollama-llm-ui.hostname}

The hostname under which the Ollama UI interface should be accessible.
By default it uses localhost/127.0.0.1 to be accessible only from the local machine.
Change to "0.0.0.0" to make it directly accessible from the local network.

Note: You should keep it at 127.0.0.1 and only serve to the local
network or internet from a (home) server behind a reverse-proxy and secured encryption.
See [https://wiki.nixos.org/wiki/Nginx](https://wiki.nixos.org/wiki/Nginx) for instructions on how to set up a reverse-proxy.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"ui.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/nextjs-ollama-llm-ui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextjs-ollama-llm-ui.nix)

## `services.nextjs-ollama-llm-ui.ollamaUrl` {#opt-services.nextjs-ollama-llm-ui.ollamaUrl}

The address (including host and port) under which we can access the Ollama backend server.
!Note that if the the UI service is running under a domain "https://ui.example.org",
the Ollama backend service must allow "CORS" requests from this domain, e.g. by adding
"services.ollama.environment.OLLAMA\_ORIGINS = \[ ... "https://ui.example.org" \];"!

*Type:* string

*Default:* `"http://127.0.0.1:11434"`

*Example:* `"https://ollama.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/nextjs-ollama-llm-ui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextjs-ollama-llm-ui.nix)

## `services.nextjs-ollama-llm-ui.package` {#opt-services.nextjs-ollama-llm-ui.package}

The nextjs-ollama-llm-ui package to use.

*Type:* package

*Default:* `pkgs.nextjs-ollama-llm-ui`

*Declared by:* [`nixos/modules/services/web-apps/nextjs-ollama-llm-ui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextjs-ollama-llm-ui.nix)

## `services.nextjs-ollama-llm-ui.port` {#opt-services.nextjs-ollama-llm-ui.port}

The port under which the Ollama UI interface should be accessible.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Example:* `3000`

*Declared by:* [`nixos/modules/services/web-apps/nextjs-ollama-llm-ui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextjs-ollama-llm-ui.nix)

## `services.nexus.enable` {#opt-services.nexus.enable}

Whether to enable Sonatype Nexus3 OSS service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nexus.nix)

## `services.nexus.group` {#opt-services.nexus.group}

Group which runs Nexus3.

*Type:* string

*Default:* `"nexus"`

*Declared by:* [`nixos/modules/services/web-apps/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nexus.nix)

## `services.nexus.home` {#opt-services.nexus.home}

Home directory of the Nexus3 instance.

*Type:* string

*Default:* `"/var/lib/sonatype-work"`

*Declared by:* [`nixos/modules/services/web-apps/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nexus.nix)

## `services.nexus.jdkPackage` {#opt-services.nexus.jdkPackage}

The openjdk8 package to use.

*Type:* package

*Default:* `pkgs.openjdk8`

*Declared by:* [`nixos/modules/services/web-apps/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nexus.nix)

## `services.nexus.jvmOpts` {#opt-services.nexus.jvmOpts}

Options for the JVM written to `nexus.jvmopts`.
Please refer to the docs (https://help.sonatype.com/repomanager3/installation/configuring-the-runtime-environment)
for further information.

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  -Xms1200M
  -Xmx1200M
  -XX:MaxDirectMemorySize=2G
  -XX:+UnlockDiagnosticVMOptions
  -XX:+UnsyncloadClass
  -XX:+LogVMOutput
  -XX:LogFile=${home}/nexus3/log/jvm.log
  -XX:-OmitStackTraceInFastThrow
  -Djava.net.preferIPv4Stack=true
  -Dkaraf.home=${package}
  -Dkaraf.base=${package}
  -Dkaraf.etc=${package}/etc/karaf
  -Djava.util.logging.config.file=${package}/etc/karaf/java.util.logging.properties
  -Dkaraf.data=${home}/nexus3
  -Djava.io.tmpdir=${home}/nexus3/tmp
  -Dkaraf.startLocalConsole=false
  -Djava.endorsed.dirs=${package}/lib/endorsed
''
```

*Declared by:* [`nixos/modules/services/web-apps/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nexus.nix)

## `services.nexus.listenAddress` {#opt-services.nexus.listenAddress}

Address to listen on.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nexus.nix)

## `services.nexus.listenPort` {#opt-services.nexus.listenPort}

Port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8081`

*Declared by:* [`nixos/modules/services/web-apps/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nexus.nix)

## `services.nexus.package` {#opt-services.nexus.package}

The nexus package to use.

*Type:* package

*Default:* `pkgs.nexus`

*Declared by:* [`nixos/modules/services/web-apps/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nexus.nix)

## `services.nexus.user` {#opt-services.nexus.user}

User which runs Nexus3.

*Type:* string

*Default:* `"nexus"`

*Declared by:* [`nixos/modules/services/web-apps/nexus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nexus.nix)

## `services.nezha-agent.clientSecretFile` {#opt-services.nezha-agent.clientSecretFile}

Path to the file contained the client\_secret of the dashboard.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/nezha-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha-agent.nix)

## `services.nezha-agent.debug` {#opt-services.nezha-agent.debug}

Whether to enable verbose log.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/nezha-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha-agent.nix)

## `services.nezha-agent.enable` {#opt-services.nezha-agent.enable}

Whether to enable Agent of Nezha Monitoring.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/nezha-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha-agent.nix)

## `services.nezha-agent.genUuid` {#opt-services.nezha-agent.genUuid}

Whether to generate uuid from fqdn automatically.
Please note that changes in hostname/domain will result in different uuid.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/nezha-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha-agent.nix)

## `services.nezha-agent.package` {#opt-services.nezha-agent.package}

The nezha-agent package to use.

*Type:* package

*Default:* `pkgs.nezha-agent`

*Declared by:* [`nixos/modules/services/monitoring/nezha-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha-agent.nix)

## `services.nezha-agent.settings` {#opt-services.nezha-agent.settings}

Generate to `config.json` as a Nix attribute set.
Check the [guide](https://nezha.wiki/en_US/guide/agent.html)
for possible options.

*Type:* open submodule of (JSON value)

*Declared by:* [`nixos/modules/services/monitoring/nezha-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha-agent.nix)

## `services.nezha-agent.settings.disable_command_execute` {#opt-services.nezha-agent.settings.disable_command_execute}

Disable executing the command from dashboard.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/nezha-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha-agent.nix)

## `services.nezha-agent.settings.disable_nat` {#opt-services.nezha-agent.settings.disable_nat}

Disable NAT penetration.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/nezha-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha-agent.nix)

## `services.nezha-agent.settings.disable_send_query` {#opt-services.nezha-agent.settings.disable_send_query}

Disable sending TCP/ICMP/HTTP requests.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/nezha-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha-agent.nix)

## `services.nezha-agent.settings.gpu` {#opt-services.nezha-agent.settings.gpu}

Enable GPU monitoring.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/nezha-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha-agent.nix)

## `services.nezha-agent.settings.report_delay` {#opt-services.nezha-agent.settings.report_delay}

The interval between system status reportings.
The value must be an integer from 1 to 4.

*Type:* integer between 1 and 4 (both inclusive)

*Default:* `3`

*Declared by:* [`nixos/modules/services/monitoring/nezha-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha-agent.nix)

## `services.nezha-agent.settings.server` {#opt-services.nezha-agent.settings.server}

Address to the dashboard.

*Type:* string

*Example:* `"127.0.0.1:8008"`

*Declared by:* [`nixos/modules/services/monitoring/nezha-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha-agent.nix)

## `services.nezha-agent.settings.skip_connection_count` {#opt-services.nezha-agent.settings.skip_connection_count}

Do not monitor the number of connections.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/nezha-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha-agent.nix)

## `services.nezha-agent.settings.skip_procs_count` {#opt-services.nezha-agent.settings.skip_procs_count}

Do not monitor the number of processes.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/nezha-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha-agent.nix)

## `services.nezha-agent.settings.temperature` {#opt-services.nezha-agent.settings.temperature}

Enable temperature monitoring.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/nezha-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha-agent.nix)

## `services.nezha-agent.settings.tls` {#opt-services.nezha-agent.settings.tls}

Enable SSL/TLS encryption.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/nezha-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha-agent.nix)

## `services.nezha-agent.settings.use_ipv6_country_code` {#opt-services.nezha-agent.settings.use_ipv6_country_code}

Use ipv6 countrycode to report location.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/nezha-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha-agent.nix)

## `services.nezha-agent.settings.uuid` {#opt-services.nezha-agent.settings.uuid}

Must be set to a unique identifier, preferably a UUID according to
RFC 4122. UUIDs can be generated with `uuidgen` command, found in
the `util-linux` package.

Set [`services.nezha-agent.genUuid`](#opt-services.nezha-agent.genUuid) to true to generate uuid
from [`networking.fqdn`](../../options/networking/index.md#opt-networking.fqdn) automatically.

*Type:* null or string

*Default:* `null`

*Example:* `"6ba7b810-9dad-11d1-80b4-00c04fd430c8"`

*Declared by:* [`nixos/modules/services/monitoring/nezha-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha-agent.nix)

## `services.nezha.agentSecretFile` {#opt-services.nezha.agentSecretFile}

Path to the file containing the secret used by agents to connect.

*Type:* absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/nezha.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha.nix)

## `services.nezha.debug` {#opt-services.nezha.debug}

Whether to enable verbose log.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/nezha.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha.nix)

## `services.nezha.enable` {#opt-services.nezha.enable}

Whether to enable Nezha Monitoring.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/nezha.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha.nix)

## `services.nezha.extraThemes` {#opt-services.nezha.extraThemes}

A list of additional themes.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.nezha-theme-nazhua ]`

*Declared by:* [`nixos/modules/services/monitoring/nezha.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha.nix)

## `services.nezha.jwtSecretFile` {#opt-services.nezha.jwtSecretFile}

Path to the file containing the secret to sign web requests using JSON Web Tokens.

*Type:* absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/nezha.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha.nix)

## `services.nezha.mutableConfig` {#opt-services.nezha.mutableConfig}

Whether the config.yaml is writable by Nezha.

If this option is disabled, changes on the web interface won't
be possible. If an config.yaml is present, it will be overwritten.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/nezha.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha.nix)

## `services.nezha.package` {#opt-services.nezha.package}

The nezha package to use.

*Type:* package

*Default:* `pkgs.nezha`

*Declared by:* [`nixos/modules/services/monitoring/nezha.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha.nix)

## `services.nezha.settings` {#opt-services.nezha.settings}

Generate to `config.yaml` as a Nix attribute set.
Check the [guide](https://nezha.wiki/en_US/guide/dashboard.html)
for possible options.

*Type:* open submodule of (JSON value)

*Declared by:* [`nixos/modules/services/monitoring/nezha.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha.nix)

## `services.nezha.settings.listenhost` {#opt-services.nezha.settings.listenhost}

Host on which the nezha web interface and grpc should listen.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/monitoring/nezha.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha.nix)

## `services.nezha.settings.listenport` {#opt-services.nezha.settings.listenport}

Port on which the nezha web interface and grpc should listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8008`

*Declared by:* [`nixos/modules/services/monitoring/nezha.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/nezha.nix)

## `services.nfs.extraConfig` {#opt-services.nfs.extraConfig}

Extra nfs-utils configuration.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/tasks/filesystems/nfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/nfs.nix)

## `services.nfs.idmapd.settings` {#opt-services.nfs.idmapd.settings}

libnfsidmap configuration. Refer to
[https://linux.die.net/man/5/idmapd.conf](https://linux.die.net/man/5/idmapd.conf)
for details.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  Translation = {
    GSS-Methods = "static,nsswitch";
  };
  Static = {
    "root/hostname.domain.com@REALM.COM" = "root";
  };
}
```

*Declared by:* [`nixos/modules/tasks/filesystems/nfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/nfs.nix)

## `services.nfs.server.createMountPoints` {#opt-services.nfs.server.createMountPoints}

Whether to create the mount points in the exports file at startup time.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/nfsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/nfsd.nix)

## `services.nfs.server.enable` {#opt-services.nfs.server.enable}

Whether to enable the kernel's NFS server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/nfsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/nfsd.nix)

## `services.nfs.server.exports` {#opt-services.nfs.server.exports}

Contents of the /etc/exports file.  See
`exports(5)` for the format.

*Type:* strings concatenated with "\\n" or (attribute set of attribute set of list of string) convertible to it

*Default:* `""`

*Example:*

``` nix
{
  "/home/joe" = {
    pc001 = [
      "rw"
      "all_squash"
      "anonuid=150"
      "anongid=100"
    ];
  };
  "/usr" = {
    "*.local.domain" = [
      "ro"
    ];
    "@trusted" = [
      "rw"
    ];
  };
}
```

*Declared by:* [`nixos/modules/services/network-filesystems/nfsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/nfsd.nix)

## `services.nfs.server.extraNfsdConfig` {#opt-services.nfs.server.extraNfsdConfig}

Extra configuration options for the \[nfsd\] section of /etc/nfs.conf.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/network-filesystems/nfsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/nfsd.nix)

## `services.nfs.server.hostName` {#opt-services.nfs.server.hostName}

Hostname or address on which NFS requests will be accepted.
Default is all.  See the `-H` option in
`nfsd(8)`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/network-filesystems/nfsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/nfsd.nix)

## `services.nfs.server.lockdPort` {#opt-services.nfs.server.lockdPort}

Use a fixed port for the NFS lock manager kernel module
(`lockd/nlockmgr`).  This is useful if the
NFS server is behind a firewall.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Example:* `4001`

*Declared by:* [`nixos/modules/services/network-filesystems/nfsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/nfsd.nix)

## `services.nfs.server.mountdPort` {#opt-services.nfs.server.mountdPort}

Use fixed port for rpc.mountd, useful if server is behind firewall.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Example:* `4002`

*Declared by:* [`nixos/modules/services/network-filesystems/nfsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/nfsd.nix)

## `services.nfs.server.nproc` {#opt-services.nfs.server.nproc}

Number of NFS server threads.  Defaults to the recommended value of 8.

*Type:* signed integer

*Default:* `8`

*Declared by:* [`nixos/modules/services/network-filesystems/nfsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/nfsd.nix)

## `services.nfs.server.statdPort` {#opt-services.nfs.server.statdPort}

Use a fixed port for `rpc.statd`. This is
useful if the NFS server is behind a firewall.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Example:* `4000`

*Declared by:* [`nixos/modules/services/network-filesystems/nfsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/nfsd.nix)

## `services.nfs.settings` {#opt-services.nfs.settings}

General configuration for NFS daemons and tools.
See `nfs.conf(5)` and related man pages for details.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  mountd.manage-gids = true;
}
```

*Declared by:* [`nixos/modules/tasks/filesystems/nfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/nfs.nix)

## `services.nghttpx.backend-address-family` {#opt-services.nghttpx.backend-address-family}

Specify address family of backend connections. If "auto" is
given, both IPv4 and IPv6 are considered. If "IPv4" is given,
only IPv4 address is considered. If "IPv6" is given, only IPv6
address is considered.

Please see [https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx--backend-address-family](https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx--backend-address-family)

*Type:* one of "auto", "IPv4", "IPv6"

*Default:* `"auto"`

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.backends` {#opt-services.nghttpx.backends}

A list of backend specifications.

*Type:* list of (submodule)

*Example:*

``` nix
[
  {
    params = {
      proto = "http/1.1";
      redirect-if-not-tls = true;
    };
    patterns = [
      "/"
    ];
    server = {
      host = "172.16.0.22";
      port = 8443;
    };
  }
]
```

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.backends.*.params` {#opt-services.nghttpx.backends._.params}

Parameters to configure a backend.

*Type:* null or (submodule)

*Default:* `null`

*Example:*

``` nix
{
  proto = "h2";
  tls = true;
}
```

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.backends.*.params.affinity` {#opt-services.nghttpx.backends._.params.affinity}

If "ip" is given, client IP based session affinity is
enabled. If "none" is given, session affinity is disabled.

Session affinity is enabled (by nghttpx) per-backend
pattern. If at least one backend has a non-"none" affinity,
then session affinity is enabled for all backend servers
sharing the same pattern.

It is advised to set affinity on all backends explicitly if
session affinity is desired. The session affinity may break if
one of the backend gets unreachable, or backend settings are
reloaded or replaced by API.

Please see [https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-b](https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-b)
for more detail.

*Type:* one of "ip", "none"

*Default:* `"none"`

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.backends.*.params.dns` {#opt-services.nghttpx.backends._.params.dns}

Name resolution of a backends host name is done at start up,
or configuration reload. If "dns" is true, name resolution
takes place dynamically.

This is useful if a backends address changes frequently. If
"dns" is true, name resolution of a backend's host name at
start up, or configuration reload is skipped.

Please see [https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-b](https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-b)
for more detail.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.backends.*.params.fall` {#opt-services.nghttpx.backends._.params.fall}

If nghttpx cannot connect to the backend N times in a row, the
backend is assumed to be offline and is excluded from load
balancing. If N is 0 the backend is never excluded from load
balancing.

Please see [https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-b](https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-b)
for more detail.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.backends.*.params.proto` {#opt-services.nghttpx.backends._.params.proto}

This option configures the protocol the backend server expects
to use.

Please see [https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-b](https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-b)
for more detail.

*Type:* one of "h2", "http/1.1"

*Default:* `"http/1.1"`

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.backends.*.params.redirect-if-not-tls` {#opt-services.nghttpx.backends._.params.redirect-if-not-tls}

If true, a backend match requires the frontend connection be
TLS encrypted. If it is not, nghttpx responds to the request
with a 308 status code and https URI the client should use
instead in the Location header.

The port number in the redirect URI is 443 by default and can
be changed using 'services.nghttpx.redirect-https-port'
option.

If at least one backend has "redirect-if-not-tls" set to true,
this feature is enabled for all backend servers with the same
pattern. It is advised to set "redirect-if-no-tls" parameter
to all backends explicitly if this feature is desired.

Please see [https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-b](https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-b)
for more detail.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.backends.*.params.rise` {#opt-services.nghttpx.backends._.params.rise}

If the backend is excluded from load balancing, nghttpx will
periodically attempt to make a connection to the backend. If
the connection is successful N times in a row the backend is
re-included in load balancing. If N is 0 a backend is never
reconsidered for load balancing once it falls.

Please see [https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-b](https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-b)
for more detail.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.backends.*.params.sni` {#opt-services.nghttpx.backends._.params.sni}

Override the TLS SNI field value. This value (in nghttpx)
defaults to the host value of the backend configuration.

Please see [https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-b](https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-b)
for more detail.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.backends.*.params.tls` {#opt-services.nghttpx.backends._.params.tls}

This option determines whether nghttpx will negotiate its
connection with a backend server using TLS or not. The burden
is on the backend server to provide the TLS certificate!

Please see [https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-b](https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-b)
for more detail.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.backends.*.patterns` {#opt-services.nghttpx.backends._.patterns}

List of nghttpx backend patterns.

Please see [https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-b](https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-b)
for more information on the pattern syntax and nghttpxs behavior.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "*.host.net/v1/"
  "host.org/v2/mypath"
  "/somepath"
]
```

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.backends.*.server` {#opt-services.nghttpx.backends._.server}

Backend server location specified as either a host:port pair
or a unix domain docket.

*Type:* (submodule) or absolute path

*Default:*

``` nix
{
  host = "127.0.0.1";
  port = 80;
}
```

*Example:*

``` nix
{
  host = "127.0.0.1";
  port = 8888;
}
```

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.backlog` {#opt-services.nghttpx.backlog}

Listen backlog size.

Please see [https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx--backlog](https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx--backlog)

*Type:* signed integer

*Default:* `65536`

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.enable` {#opt-services.nghttpx.enable}

Whether to enable nghttpx.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.extraConfig` {#opt-services.nghttpx.extraConfig}

Extra configuration options to be appended to the generated
configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.frontends` {#opt-services.nghttpx.frontends}

A list of frontend listener specifications.

*Type:* list of (submodule)

*Example:*

``` nix
[
  {
    params = {
      tls = "no-tls";
    };
    server = {
      host = "*";
      port = 80;
    };
  }
]
```

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.frontends.*.params` {#opt-services.nghttpx.frontends._.params}

Parameters to configure a backend.

*Type:* null or (submodule)

*Default:* `null`

*Example:*

``` nix
{
  tls = "tls";
}
```

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.frontends.*.params.api` {#opt-services.nghttpx.frontends._.params.api}

Enable API access for this frontend. This enables you to
dynamically modify nghttpx at run-time therefore this feature
is disabled by default and should be turned on with care.

Please see [https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-f](https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-f)
for more detail.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.frontends.*.params.healthmon` {#opt-services.nghttpx.frontends._.params.healthmon}

Make this frontend a health monitor endpoint. Any request
received on this frontend is responded to with a 200 OK.

Please see [https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-f](https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-f)
for more detail.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.frontends.*.params.proxyproto` {#opt-services.nghttpx.frontends._.params.proxyproto}

Accept PROXY protocol version 1 on frontend connection.

Please see [https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-f](https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-f)
for more detail.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.frontends.*.params.sni-fwd` {#opt-services.nghttpx.frontends._.params.sni-fwd}

When performing a match to select a backend server, SNI host
name received from the client is used instead of the request
host. See --backend option about the pattern match.

Please see [https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-f](https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-f)
for more detail.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.frontends.*.params.tls` {#opt-services.nghttpx.frontends._.params.tls}

Enable or disable TLS. If true (enabled) the key and
certificate must be configured for nghttpx.

Please see [https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-f](https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-f)
for more detail.

*Type:* one of "tls", "no-tls"

*Default:* `"tls"`

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.frontends.*.server` {#opt-services.nghttpx.frontends._.server}

Frontend server interface binding specification as either a
host:port pair or a unix domain docket.

NB: a host of "\*" listens on all interfaces and includes IPv6
addresses.

*Type:* (submodule) or absolute path

*Default:*

``` nix
{
  host = "127.0.0.1";
  port = 80;
}
```

*Example:*

``` nix
{
  host = "127.0.0.1";
  port = 8888;
}
```

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.rlimit-nofile` {#opt-services.nghttpx.rlimit-nofile}

Set maximum number of open files (RLIMIT\_NOFILE) to \<N\>. If 0
is given, nghttpx does not set the limit.

Please see [https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx--rlimit-nofile](https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx--rlimit-nofile)

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.single-process` {#opt-services.nghttpx.single-process}

Run this program in a single process mode for debugging
purpose. Without this option, nghttpx creates at least 2
processes: master and worker processes. If this option is
used, master and worker are unified into a single
process. nghttpx still spawns additional process if neverbleed
is used. In the single process mode, the signal handling
feature is disabled.

Please see [https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx--single-process](https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx--single-process)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.single-thread` {#opt-services.nghttpx.single-thread}

Run everything in one thread inside the worker process. This
feature is provided for better debugging experience, or for
the platforms which lack thread support. If threading is
disabled, this option is always enabled.

Please see [https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx--single-thread](https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx--single-thread)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.tls` {#opt-services.nghttpx.tls}

TLS certificate and key paths. Note that this does not enable
TLS for a frontend listener, to do so, a frontend
specification must set `params.tls` to true.

*Type:* null or (submodule)

*Default:* `null`

*Example:*

``` nix
{
  crt = "/etc/ssl/certs/server.crt";
  key = "/etc/ssl/keys/server.key";
}
```

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.tls.crt` {#opt-services.nghttpx.tls.crt}

Path to the TLS certificate file.

*Type:* string

*Default:* `"/etc/ssl/certs/server.crt"`

*Example:* `"/etc/ssl/certs/mycert.crt"`

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.tls.key` {#opt-services.nghttpx.tls.key}

Path to the TLS key file.

*Type:* string

*Default:* `"/etc/ssl/keys/server.key"`

*Example:* `"/etc/ssl/keys/mykeyfile.key"`

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nghttpx.workers` {#opt-services.nghttpx.workers}

Set the number of worker threads.

Please see [https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-n](https://nghttp2.org/documentation/nghttpx.1.html#cmdoption-nghttpx-n)

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/networking/nghttpx/nghttpx-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nghttpx/nghttpx-options.nix)

## `services.nginx.additionalModules` {#opt-services.nginx.additionalModules}

Additional [third-party nginx modules](https://www.nginx.com/resources/wiki/modules/)
to install. Packaged modules are available in `pkgs.nginxModules`.

*Type:* list of attribute set of anything

*Default:* `[ ]`

*Example:* `[ pkgs.nginxModules.echo ]`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.appendConfig` {#opt-services.nginx.appendConfig}

Configuration lines appended to the generated Nginx
configuration file. Commonly used by different modules
providing http snippets. `appendConfig`
can be specified more than once and its value will be
concatenated (contrary to `config` which
can be set only once).

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.appendHttpConfig` {#opt-services.nginx.appendHttpConfig}

Configuration lines to be appended to the generated http block.
This is mutually exclusive with using config and httpConfig for
specifying the whole http block verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.clientMaxBodySize` {#opt-services.nginx.clientMaxBodySize}

Set nginx global client\_max\_body\_size.

*Type:* string

*Default:* `"10m"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.commonHttpConfig` {#opt-services.nginx.commonHttpConfig}

With nginx you must provide common http context definitions before
they are used, e.g. log\_format, resolver, etc. inside of server
or location contexts. Use this attribute to set these definitions
at the appropriate location.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  resolver 127.0.0.1 valid=5s;
  
  log_format myformat '$remote_addr - $remote_user [$time_local] '
                      '"$request" $status $body_bytes_sent '
                      '"$http_referer" "$http_user_agent"';
''
```

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.config` {#opt-services.nginx.config}

Verbatim `nginx.conf` configuration.
This is mutually exclusive to any other config option for
`nginx.conf` except for

- [services (N)](#opt-services.nginx.appendConfig)
- [services (N)](#opt-services.nginx.httpConfig)
- [services (N)](#opt-services.nginx.logError)

If additional verbatim config in addition to other options is needed,
[services (N)](#opt-services.nginx.appendConfig) should be used instead.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.defaultHTTPListenPort` {#opt-services.nginx.defaultHTTPListenPort}

If vhosts do not specify listen.port, use these ports for HTTP by default.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `80`

*Example:* `8080`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.defaultListen` {#opt-services.nginx.defaultListen}

If vhosts do not specify listen, use these addresses by default.
This option takes precedence over `defaultListenAddresses` and
other listen-related defaults options.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  { addr = "10.0.0.12"; proxyProtocol = true; ssl = true; }
  { addr = "0.0.0.0"; }
  { addr = "[::0]"; }
]
```

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.defaultListen.*.addr` {#opt-services.nginx.defaultListen._.addr}

IP address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.defaultListen.*.extraParameters` {#opt-services.nginx.defaultListen._.extraParameters}

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

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.defaultListen.*.port` {#opt-services.nginx.defaultListen._.port}

Port number.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.defaultListen.*.proxyProtocol` {#opt-services.nginx.defaultListen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.defaultListen.*.ssl` {#opt-services.nginx.defaultListen._.ssl}

Enable SSL.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.defaultListenAddresses` {#opt-services.nginx.defaultListenAddresses}

If vhosts do not specify listenAddresses, use these addresses by default.
This is akin to writing `defaultListen = [ { addr = "0.0.0.0" } ]`.

*Type:* list of string

*Default:* `[ "0.0.0.0" ] ++ lib.optional config.networking.enableIPv6 "[::0]"`

*Example:* `[ "10.0.0.12" "[2002:a00:1::]" ]`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.defaultMimeTypes` {#opt-services.nginx.defaultMimeTypes}

Default MIME types for NGINX, as MIME types definitions from NGINX are very incomplete,
we use by default the ones bundled in the mailcap package, used by most of the other
Linux distributions.

*Type:* absolute path

*Default:* `$''{pkgs.mailcap}/etc/nginx/mime.types`

*Example:* `$''{pkgs.nginx}/conf/mime.types`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.defaultSSLListenPort` {#opt-services.nginx.defaultSSLListenPort}

If vhosts do not specify listen.port, use these ports for SSL by default.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `443`

*Example:* `8443`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.enable` {#opt-services.nginx.enable}

Whether to enable Nginx Web Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.enableQuicBPF` {#opt-services.nginx.enableQuicBPF}

Enables routing of QUIC packets using eBPF. When enabled, this allows
to support QUIC connection migration. The directive is only supported
on Linux 5.7+.
Note that enabling this option will make nginx run with extended
capabilities that are usually limited to processes running as root
namely `CAP_SYS_ADMIN` and `CAP_NET_ADMIN`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.enableReload` {#opt-services.nginx.enableReload}

Reload nginx when configuration file changes (instead of restart).
The configuration file is exposed at `/etc/nginx/nginx.conf`.
See also `systemd.services.*.restartIfChanged`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.encryptedClientHello.configFile` {#opt-services.nginx.encryptedClientHello.configFile}

Path to the file containing both private key and ECHConfig in PEM
format.

This file will be generated if it does not exist and
[`services.nginx.encryptedClientHello.publicName`](#opt-services.nginx.encryptedClientHello.publicName) is set.

::: info
The `ECHConfig` value must be published into a HTTPS resource
record (\[RFC 9460\]) so clients can retrieve it before setting up
the TLS socket.
:::

[RFC 9460](https://www.rfc-editor.org/info/rfc9460/)

*Type:* path not in the Nix store

*Default:* `"/var/lib/nginx/ech.pem"`

*Example:* `"/run/keys/nginx.ech.pem"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.encryptedClientHello.enable` {#opt-services.nginx.encryptedClientHello.enable}

Whether to enable Encrypted Client Hello extension for TLS 1.3.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.encryptedClientHello.publicName` {#opt-services.nginx.encryptedClientHello.publicName}

Public name advertised in the ECHConfig.

This name is visible in the outer ClientHello. This is not
necessarily the hostname of the requested website.

*Type:* null or string

*Default:* `null`

*Example:* `"ech.example.com"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.eventsConfig` {#opt-services.nginx.eventsConfig}

Configuration lines to be set inside the events block.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.experimentalZstdSettings` {#opt-services.nginx.experimentalZstdSettings}

Enable alpha quality zstd module with recommended settings.
Learn more about compression in Zstd format [here](https://github.com/tokers/zstd-nginx-module).

This adds `pkgs.nginxModules.zstd` to `services.nginx.additionalModules`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.group` {#opt-services.nginx.group}

Group account under which nginx runs.

*Type:* string

*Default:* `"nginx"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.httpConfig` {#opt-services.nginx.httpConfig}

Configuration lines to be set inside the http block.
This is mutually exclusive with the structured configuration
via virtualHosts and the recommendedXyzSettings configuration
options. See appendHttpConfig for appending to the generated http block.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.logError` {#opt-services.nginx.logError}

Configures logging.
The first parameter defines a file that will store the log. The
special value stderr selects the standard error file. Logging to
syslog can be configured by specifying the “syslog:” prefix.
The second parameter determines the level of logging, and can be
one of the following: debug, info, notice, warn, error, crit,
alert, or emerg. Log levels above are listed in the order of
increasing severity. Setting a certain log level will cause all
messages of the specified and more severe log levels to be logged.
If this parameter is omitted then error is used.

*Type:* string

*Default:* `"stderr"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.lua.enable` {#opt-services.nginx.lua.enable}

Whether to enable Lua scripting in nginx via OpenResty's lua-nginx-module,
wiring up `lua_package_path`/`lua_package_cpath` for
[`services.nginx.lua.extraPackages`](#opt-services.nginx.lua.extraPackages).

Use this to add Lua to a stock nginx. For the full OpenResty platform —
required by libraries that depend on its bundled lualib (for example
`lua-resty-openidc`, which needs `resty.string` and friends) — set
[`services.nginx.package`](#opt-services.nginx.package) to `pkgs.openresty` instead; this option
then only sets up the search path and leaves OpenResty's built-in Lua
module in place
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.lua.extraPackages` {#opt-services.nginx.lua.extraPackages}

Extra Lua packages to put on `lua_package_path` / `lua_package_cpath`,
for both stock nginx and `pkgs.openresty`. Packages are selected from
`pkgs.luajit_openresty.pkgs`. `lua-resty-core`, which the Lua module
requires to start, is added automatically.

*Type:* function that evaluates to a(n) list of package

*Default:* `ps: [ ]`

*Example:*

``` nix
ps: with ps; [ lua-resty-openidc ]
```

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.mapHashBucketSize` {#opt-services.nginx.mapHashBucketSize}

Sets the bucket size for the map variables hash tables. Default
value depends on the processor’s cache line size.

Refer to [the nginx docs on hashes](https://nginx.org/en/docs/hash.html)
for more information.

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.mapHashMaxSize` {#opt-services.nginx.mapHashMaxSize}

Sets the maximum size of the map variables hash tables.

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.package` {#opt-services.nginx.package}

Nginx package to use. This defaults to the stable version. Note
that the nginx team recommends to use the mainline version which
available in nixpkgs as `nginxMainline`.
Supported Nginx forks include `angie` and `openresty`.

*Type:* package

*Default:* `pkgs.nginxStable`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.preStart` {#opt-services.nginx.preStart}

Shell commands executed before the service's nginx is started.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.prependConfig` {#opt-services.nginx.prependConfig}

Configuration lines prepended to the generated Nginx
configuration file. Can for example be used to load modules.
`prependConfig` can be specified more than once
and its value will be concatenated (contrary to `config`
which can be set only once).

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.proxyCachePath` {#opt-services.nginx.proxyCachePath}

Configure a proxy cache path entry.
See [https://nginx.org/en/docs/http/ngx\_http\_proxy\_module.html#proxy\_cache\_path](https://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_cache_path) for documentation.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.proxyCachePath.<name>.enable` {#opt-services.nginx.proxyCachePath._name_.enable}

Whether to enable this proxy cache path entry.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.proxyCachePath.<name>.inactive` {#opt-services.nginx.proxyCachePath._name_.inactive}

Cached data that has not been accessed for the time specified by
the inactive parameter is removed from the cache, regardless of
its freshness.

*Type:* string

*Default:* `"10m"`

*Example:* `"1d"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.proxyCachePath.<name>.keysZoneName` {#opt-services.nginx.proxyCachePath._name_.keysZoneName}

Set name to shared memory zone.

*Type:* string

*Default:* `"cache"`

*Example:* `"my_cache"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.proxyCachePath.<name>.keysZoneSize` {#opt-services.nginx.proxyCachePath._name_.keysZoneSize}

Set size to shared memory zone.

*Type:* string

*Default:* `"10m"`

*Example:* `"32m"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.proxyCachePath.<name>.levels` {#opt-services.nginx.proxyCachePath._name_.levels}

The levels parameter defines structure of subdirectories in cache: from
1 to 3, each level accepts values 1 or 2. Can be used any combination of
1 and 2 in these formats: x, x:x and x:x:x.

*Type:* string

*Default:* `"1:2"`

*Example:* `"1:2:2"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.proxyCachePath.<name>.maxSize` {#opt-services.nginx.proxyCachePath._name_.maxSize}

Set maximum cache size

*Type:* string

*Default:* `"1g"`

*Example:* `"2048m"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.proxyCachePath.<name>.useTempPath` {#opt-services.nginx.proxyCachePath._name_.useTempPath}

Nginx first writes files that are destined for the cache to a temporary
storage area, and the use\_temp\_path=off directive instructs Nginx to
write them to the same directories where they will be cached. Recommended
that you set this parameter to off to avoid unnecessary copying of data
between file systems.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.proxyResolveWhileRunning` {#opt-services.nginx.proxyResolveWhileRunning}

Resolves domains of proxyPass targets at runtime and not only at startup.
This can be used as a workaround if nginx fails to start because of not-yet-working DNS.

::: warn
`services.nginx.resolver` must be set for this option to work.
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.proxyTimeout` {#opt-services.nginx.proxyTimeout}

Change the proxy related timeouts in recommendedProxySettings.

*Type:* string

*Default:* `"60s"`

*Example:* `"20s"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.recommendedBrotliSettings` {#opt-services.nginx.recommendedBrotliSettings}

Enable recommended brotli settings.
Learn more about compression in Brotli format [here](https://github.com/google/ngx_brotli/).

This adds `pkgs.nginxModules.brotli` to `services.nginx.additionalModules`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.recommendedGzipSettings` {#opt-services.nginx.recommendedGzipSettings}

Enable recommended gzip settings.
Learn more about compression in Gzip format [here](https://docs.nginx.com/nginx/admin-guide/web-server/compression/).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.recommendedOptimisation` {#opt-services.nginx.recommendedOptimisation}

Enable recommended optimisation settings.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.recommendedProxySettings` {#opt-services.nginx.recommendedProxySettings}

Whether to enable recommended proxy settings if a vhost does not specify the option manually.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.recommendedTlsSettings` {#opt-services.nginx.recommendedTlsSettings}

Enable recommended TLS settings.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.recommendedUwsgiSettings` {#opt-services.nginx.recommendedUwsgiSettings}

Whether to enable recommended uwsgi settings if a vhost does not specify the option manually.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.resolver` {#opt-services.nginx.resolver}

Configures name servers used to resolve names of upstream servers into addresses

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.resolver.addresses` {#opt-services.nginx.resolver.addresses}

List of resolvers to use

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "[::1]" "127.0.0.1:5353" ]`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.resolver.ipv4` {#opt-services.nginx.resolver.ipv4}

By default, nginx will look up both IPv4 and IPv6 addresses while resolving.
If looking up of IPv4 addresses is not desired, the ipv4=off parameter can be
specified.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.resolver.ipv6` {#opt-services.nginx.resolver.ipv6}

By default, nginx will look up both IPv4 and IPv6 addresses while resolving.
If looking up of IPv6 addresses is not desired, the ipv6=off parameter can be
specified.

*Type:* boolean

*Default:* `config.networking.enableIPv6`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.resolver.valid` {#opt-services.nginx.resolver.valid}

By default, nginx caches answers using the TTL value of a response.
An optional valid parameter allows overriding it

*Type:* string

*Default:* `""`

*Example:* `"30s"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.serverNamesHashBucketSize` {#opt-services.nginx.serverNamesHashBucketSize}

Sets the bucket size for the server names hash tables. Default
value depends on the processor’s cache line size.

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.serverNamesHashMaxSize` {#opt-services.nginx.serverNamesHashMaxSize}

Sets the maximum size of the server names hash tables.

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.serverTokens` {#opt-services.nginx.serverTokens}

Show nginx version in headers and error pages.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.sslCiphers` {#opt-services.nginx.sslCiphers}

List of available cipher suites to choose from when negotiating TLS sessions.

::: warn
This option only handles cipher suites up to TLSv1.2. Use
`ssl_conf_command CipherSuites` to configure TLSv1.3 cipher suites.
:::

*Type:* null or string or list of string

*Default:*

``` nix
[
  "ECDHE-ECDSA-AES128-GCM-SHA256"
  "ECDHE-RSA-AES128-GCM-SHA256"
  "ECDHE-ECDSA-AES256-GCM-SHA384"
  "ECDHE-RSA-AES256-GCM-SHA384"
  "ECDHE-ECDSA-CHACHA20-POLY1305"
  "ECDHE-RSA-CHACHA20-POLY1305"
]
```

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.sslProtocols` {#opt-services.nginx.sslProtocols}

Allowed TLS protocol versions.

*Type:* string

*Default:* `"TLSv1.2 TLSv1.3"`

*Example:* `"TLSv1.3"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.sso.configuration` {#opt-services.nginx.sso.configuration}

nginx-sso configuration
([documentation](https://github.com/Luzifer/nginx-sso/wiki/Main-Configuration))
as a Nix attribute set.

Options containing secret data should be set to an attribute set
with the singleton attribute `_secret` - a string value set to the path
to the file containing the secret value which should be used in the
configuration.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  listen = { addr = "127.0.0.1"; port = 8080; };

  providers.token.tokens = {
    myuser = {
      _secret = "/path/to/secret/token.txt"; # File content should be the secret token
    };
  };

  acl = {
    rule_sets = [
      {
        rules = [ { field = "x-application"; equals = "MyApp"; } ];
        allow = [ "myuser" ];
      }
    ];
  };
}
```

*Declared by:* [`nixos/modules/services/security/nginx-sso.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/nginx-sso.nix)

## `services.nginx.sso.enable` {#opt-services.nginx.sso.enable}

Whether to enable nginx-sso service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/nginx-sso.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/nginx-sso.nix)

## `services.nginx.sso.package` {#opt-services.nginx.sso.package}

The nginx-sso package to use.

*Type:* package

*Default:* `pkgs.nginx-sso`

*Declared by:* [`nixos/modules/services/security/nginx-sso.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/nginx-sso.nix)

## `services.nginx.statusPage` {#opt-services.nginx.statusPage}

Enable status page reachable from localhost on http://127.0.0.1/nginx\_status.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.streamConfig` {#opt-services.nginx.streamConfig}

Configuration lines to be set inside the stream block.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  server {
    listen 127.0.0.1:53 udp reuseport;
    proxy_timeout 20s;
    proxy_pass 192.168.0.1:53535;
  }
''
```

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.tailscaleAuth.enable` {#opt-services.nginx.tailscaleAuth.enable}

Whether to enable tailscale.nginx-auth, to authenticate nginx users via tailscale.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/nginx/tailscale-auth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/tailscale-auth.nix)

## `services.nginx.tailscaleAuth.expectedTailnet` {#opt-services.nginx.tailscaleAuth.expectedTailnet}

If you want to prevent node sharing from allowing users to access services
across tailnets, declare your expected tailnets domain here.

*Type:* null or string

*Default:* `""`

*Example:* `"tailnet012345.ts.net"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/tailscale-auth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/tailscale-auth.nix)

## `services.nginx.tailscaleAuth.group` {#opt-services.nginx.tailscaleAuth.group}

Alias of [`services.tailscaleAuth.group`](../../options/services-t/index.md#opt-services.tailscaleAuth.group).

*Type:* string

*Declared by:* [`nixos/modules/services/web-servers/nginx/tailscale-auth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/tailscale-auth.nix)

## `services.nginx.tailscaleAuth.package` {#opt-services.nginx.tailscaleAuth.package}

Alias of [`services.tailscaleAuth.package`](../../options/services-t/index.md#opt-services.tailscaleAuth.package).

*Type:* package

*Declared by:* [`nixos/modules/services/web-servers/nginx/tailscale-auth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/tailscale-auth.nix)

## `services.nginx.tailscaleAuth.socketPath` {#opt-services.nginx.tailscaleAuth.socketPath}

Alias of [`services.tailscaleAuth.socketPath`](../../options/services-t/index.md#opt-services.tailscaleAuth.socketPath).

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-servers/nginx/tailscale-auth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/tailscale-auth.nix)

## `services.nginx.tailscaleAuth.user` {#opt-services.nginx.tailscaleAuth.user}

Alias of [`services.tailscaleAuth.user`](../../options/services-t/index.md#opt-services.tailscaleAuth.user).

*Type:* string

*Declared by:* [`nixos/modules/services/web-servers/nginx/tailscale-auth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/tailscale-auth.nix)

## `services.nginx.tailscaleAuth.virtualHosts` {#opt-services.nginx.tailscaleAuth.virtualHosts}

A list of nginx virtual hosts to put behind tailscale.nginx-auth

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-servers/nginx/tailscale-auth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/tailscale-auth.nix)

## `services.nginx.typesHashMaxSize` {#opt-services.nginx.typesHashMaxSize}

Sets the maximum size of the types hash tables (`types_hash_max_size`).
It is recommended that the minimum size possible size is used.
If `recommendedOptimisation` is disabled, nginx would otherwise
fail to start since the mailmap `mime.types` database has more entries
than the nginx default value 1024.

*Type:* positive integer, meaning \>0

*Default:* `if config.services.nginx.defaultMimeTypes == "${pkgs.mailcap}/etc/nginx/mime.types" then 2688 else 1024`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.upstreams` {#opt-services.nginx.upstreams}

Defines a group of servers to use as proxy target.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  backend = {
    extraConfig = ''
      keepalive 16;
    '';
    servers = {
      "backend1.example.com:8080" = {
        weight = 5;
      };
      "backend2.example.com" = {
        fail_timeout = "30s";
        max_fails = 3;
      };
      "backend3.example.com" = { };
      "backup1.example.com" = {
        backup = true;
      };
      "backup2.example.com" = {
        backup = true;
      };
    };
  };
  memcached = {
    servers = {
      "unix:/run/memcached/memcached.sock" = { };
    };
  };
}
```

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.upstreams.<name>.extraConfig` {#opt-services.nginx.upstreams._name_.extraConfig}

These lines go to the end of the upstream verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.upstreams.<name>.servers` {#opt-services.nginx.upstreams._name_.servers}

Defines the address and other parameters of the upstream servers.
See [the documentation](https://nginx.org/en/docs/http/ngx_http_upstream_module.html#server)
for the available parameters.

*Type:* attribute set of (open submodule of attribute set of (boolean or signed integer or string))

*Default:* `{ }`

*Example:* see [services (N)](#opt-services.nginx.upstreams)

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.upstreams.<name>.servers.<name>.backup` {#opt-services.nginx.upstreams._name_.servers._name_.backup}

Marks the server as a backup server. It will be passed
requests when the primary servers are unavailable.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.user` {#opt-services.nginx.user}

User account under which nginx runs.

*Type:* string

*Default:* `"nginx"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.uwsgiResolveWhileRunning` {#opt-services.nginx.uwsgiResolveWhileRunning}

Resolves domains of uwsgi targets at runtime
and not only at start, you have to set
services.nginx.resolver, too.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.uwsgiTimeout` {#opt-services.nginx.uwsgiTimeout}

Change the uwsgi related timeouts in recommendedUwsgiSettings.

*Type:* string

*Default:* `"60s"`

*Example:* `"20s"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.validateConfigFile` {#opt-services.nginx.validateConfigFile}

Whether to enable validating configuration with pkgs.writeNginxConfig.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts` {#opt-services.nginx.virtualHosts}

Declarative vhost config

*Type:* attribute set of (submodule)

*Default:*

``` nix
{
  localhost = { };
}
```

*Example:*

``` nix
{
  "hydra.example.com" = {
    forceSSL = true;
    enableACME = true;
    locations."/" = {
      proxyPass = "http://localhost:3000";
    };
  };
};
```

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.acmeFallbackHost` {#opt-services.nginx.virtualHosts._name_.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.acmeRoot` {#opt-services.nginx.virtualHosts._name_.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.addSSL` {#opt-services.nginx.virtualHosts._name_.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.basicAuth` {#opt-services.nginx.virtualHosts._name_.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.basicAuthFile` {#opt-services.nginx.virtualHosts._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.default` {#opt-services.nginx.virtualHosts._name_.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.enableACME` {#opt-services.nginx.virtualHosts._name_.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.extraConfig` {#opt-services.nginx.virtualHosts._name_.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.forceSSL` {#opt-services.nginx.virtualHosts._name_.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.globalRedirect` {#opt-services.nginx.virtualHosts._name_.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.http2` {#opt-services.nginx.virtualHosts._name_.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.http3` {#opt-services.nginx.virtualHosts._name_.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.http3_hq` {#opt-services.nginx.virtualHosts._name_.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.kTLS` {#opt-services.nginx.virtualHosts._name_.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.listen` {#opt-services.nginx.virtualHosts._name_.listen}

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

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.listen.*.addr` {#opt-services.nginx.virtualHosts._name_.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.listen.*.extraParameters` {#opt-services.nginx.virtualHosts._name_.listen._.extraParameters}

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

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.listen.*.port` {#opt-services.nginx.virtualHosts._name_.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.listen.*.proxyProtocol` {#opt-services.nginx.virtualHosts._name_.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.listen.*.ssl` {#opt-services.nginx.virtualHosts._name_.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.listenAddresses` {#opt-services.nginx.virtualHosts._name_.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.locations` {#opt-services.nginx.virtualHosts._name_.locations}

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

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.locations.<name>.alias` {#opt-services.nginx.virtualHosts._name_.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.locations.<name>.basicAuth` {#opt-services.nginx.virtualHosts._name_.locations._name_.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.locations.<name>.basicAuthFile` {#opt-services.nginx.virtualHosts._name_.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.locations.<name>.extraConfig` {#opt-services.nginx.virtualHosts._name_.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.locations.<name>.fastcgiParams` {#opt-services.nginx.virtualHosts._name_.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.locations.<name>.index` {#opt-services.nginx.virtualHosts._name_.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.locations.<name>.priority` {#opt-services.nginx.virtualHosts._name_.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.locations.<name>.proxyPass` {#opt-services.nginx.virtualHosts._name_.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.locations.<name>.proxyWebsockets` {#opt-services.nginx.virtualHosts._name_.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.locations.<name>.recommendedProxySettings` {#opt-services.nginx.virtualHosts._name_.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.locations.<name>.recommendedUwsgiSettings` {#opt-services.nginx.virtualHosts._name_.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.locations.<name>.return` {#opt-services.nginx.virtualHosts._name_.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.locations.<name>.root` {#opt-services.nginx.virtualHosts._name_.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.locations.<name>.tryFiles` {#opt-services.nginx.virtualHosts._name_.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.locations.<name>.useGrpcErrorPages` {#opt-services.nginx.virtualHosts._name_.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.locations.<name>.uwsgiPass` {#opt-services.nginx.virtualHosts._name_.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.onlySSL` {#opt-services.nginx.virtualHosts._name_.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.quic` {#opt-services.nginx.virtualHosts._name_.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.redirectCode` {#opt-services.nginx.virtualHosts._name_.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.rejectSSL` {#opt-services.nginx.virtualHosts._name_.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.reuseport` {#opt-services.nginx.virtualHosts._name_.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.root` {#opt-services.nginx.virtualHosts._name_.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.serverAliases` {#opt-services.nginx.virtualHosts._name_.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.serverName` {#opt-services.nginx.virtualHosts._name_.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.sslCertificate` {#opt-services.nginx.virtualHosts._name_.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.sslCertificateKey` {#opt-services.nginx.virtualHosts._name_.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.sslTrustedCertificate` {#opt-services.nginx.virtualHosts._name_.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.virtualHosts.<name>.useACMEHost` {#opt-services.nginx.virtualHosts._name_.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.nginx.workerProcesses` {#opt-services.nginx.workerProcesses}

Defines the number of worker processes.

*Type:* positive integer, meaning \>0, or value "auto" (singular enum)

*Default:* `"auto"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/default.nix)

## `services.ngircd.config` {#opt-services.ngircd.config}

The ngircd configuration (see `ngircd.conf(5)`).

*Type:* strings concatenated with "\\n"

*Declared by:* [`nixos/modules/services/networking/ngircd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ngircd.nix)

## `services.ngircd.enable` {#opt-services.ngircd.enable}

Whether to enable the ngircd IRC server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ngircd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ngircd.nix)

## `services.ngircd.package` {#opt-services.ngircd.package}

The ngircd package to use.

*Type:* package

*Default:* `pkgs.ngircd`

*Declared by:* [`nixos/modules/services/networking/ngircd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ngircd.nix)

## `services.nifi.enable` {#opt-services.nifi.enable}

Whether to enable Apache NiFi.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nifi.nix)

## `services.nifi.enableHTTPS` {#opt-services.nifi.enableHTTPS}

Enable HTTPS protocol. Don\`t use in production.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nifi.nix)

## `services.nifi.group` {#opt-services.nifi.group}

Group account where Apache NiFi runs.

*Type:* string

*Default:* `"nifi"`

*Declared by:* [`nixos/modules/services/web-apps/nifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nifi.nix)

## `services.nifi.initJavaHeapSize` {#opt-services.nifi.initJavaHeapSize}

Set the initial heap size for the JVM in MB.

*Type:* null or signed integer

*Default:* `null`

*Example:* `1024`

*Declared by:* [`nixos/modules/services/web-apps/nifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nifi.nix)

## `services.nifi.initPasswordFile` {#opt-services.nifi.initPasswordFile}

nitial password for Apache NiFi. Password must be at least 12 characters.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/nifi/password-nifi"`

*Declared by:* [`nixos/modules/services/web-apps/nifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nifi.nix)

## `services.nifi.initUser` {#opt-services.nifi.initUser}

Initial user account for Apache NiFi. Username must be at least 4 characters.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/nifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nifi.nix)

## `services.nifi.listenHost` {#opt-services.nifi.listenHost}

Bind to an ip for Apache NiFi web-ui.

*Type:* string

*Default:*

``` nix
if config.services.nifi.enableHTTPS
then "0.0.0.0"
else "127.0.0.1"
```

*Declared by:* [`nixos/modules/services/web-apps/nifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nifi.nix)

## `services.nifi.listenPort` {#opt-services.nifi.listenPort}

Bind to a port for Apache NiFi web-ui.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
if config.services.nifi.enableHTTPS
then "8443"
else "8000"
```

*Declared by:* [`nixos/modules/services/web-apps/nifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nifi.nix)

## `services.nifi.maxJavaHeapSize` {#opt-services.nifi.maxJavaHeapSize}

Set the initial heap size for the JVM in MB.

*Type:* null or signed integer

*Default:* `null`

*Example:* `2048`

*Declared by:* [`nixos/modules/services/web-apps/nifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nifi.nix)

## `services.nifi.package` {#opt-services.nifi.package}

The nifi package to use.

*Type:* package

*Default:* `pkgs.nifi`

*Declared by:* [`nixos/modules/services/web-apps/nifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nifi.nix)

## `services.nifi.proxyHost` {#opt-services.nifi.proxyHost}

Allow requests from a specific host.

*Type:* null or string

*Default:*

``` nix
if config.services.nifi.enableHTTPS
then "0.0.0.0"
else null
```

*Declared by:* [`nixos/modules/services/web-apps/nifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nifi.nix)

## `services.nifi.proxyPort` {#opt-services.nifi.proxyPort}

Allow requests from a specific port.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
if config.services.nifi.enableHTTPS
then "8443"
else null
```

*Declared by:* [`nixos/modules/services/web-apps/nifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nifi.nix)

## `services.nifi.user` {#opt-services.nifi.user}

User account where Apache NiFi runs.

*Type:* string

*Default:* `"nifi"`

*Declared by:* [`nixos/modules/services/web-apps/nifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nifi.nix)

## `services.nipap.authBackendSettings` {#opt-services.nipap.authBackendSettings}

auth.backends options to set in /etc/nipap/nipap.conf.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:*

``` nix
{
  local = {
    db_path = "/var/lib/nipap/local_auth.db";
    type = "SqliteAuth";
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/nipap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nipap.nix)

## `services.nipap.enable` {#opt-services.nipap.enable}

Whether to enable global Neat IP Address Planner (NIPAP) configuration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nipap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nipap.nix)

## `services.nipap.nipap-www.enable` {#opt-services.nipap.nipap-www.enable}

Whether to enable nipap-www server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nipap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nipap.nix)

## `services.nipap.nipap-www.host` {#opt-services.nipap.nipap-www.host}

Host to bind to.

*Type:* null or string

*Default:* `"::"`

*Declared by:* [`nixos/modules/services/web-apps/nipap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nipap.nix)

## `services.nipap.nipap-www.package` {#opt-services.nipap.nipap-www.package}

The nipap-www package to use.

*Type:* package

*Default:* `pkgs.nipap-www`

*Declared by:* [`nixos/modules/services/web-apps/nipap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nipap.nix)

## `services.nipap.nipap-www.port` {#opt-services.nipap.nipap-www.port}

Port to bind to.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `21337`

*Declared by:* [`nixos/modules/services/web-apps/nipap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nipap.nix)

## `services.nipap.nipap-www.umask` {#opt-services.nipap.nipap-www.umask}

umask for files written by Gunicorn, including UNIX socket.

*Type:* string

*Default:* `"0"`

*Declared by:* [`nixos/modules/services/web-apps/nipap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nipap.nix)

## `services.nipap.nipap-www.unixSocket` {#opt-services.nipap.nipap-www.unixSocket}

Path to UNIX socket to bind to.

*Type:* null or string

*Default:* `null`

*Example:* `"/run/nipap/nipap-www.sock"`

*Declared by:* [`nixos/modules/services/web-apps/nipap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nipap.nix)

## `services.nipap.nipap-www.workers` {#opt-services.nipap.nipap-www.workers}

Number of worker processes for Gunicorn to fork.

*Type:* signed integer

*Default:* `4`

*Declared by:* [`nixos/modules/services/web-apps/nipap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nipap.nix)

## `services.nipap.nipap-www.xmlrpcURIFile` {#opt-services.nipap.nipap-www.xmlrpcURIFile}

Path to file containing XMLRPC URI for use by web UI - this is a secret, since it contains auth credentials. If null, it will be initialized assuming that the auth database is local.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/nipap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nipap.nix)

## `services.nipap.nipapd.database.createLocally` {#opt-services.nipap.nipapd.database.createLocally}

Create a nipap database automatically.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nipap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nipap.nix)

## `services.nipap.nipapd.enable` {#opt-services.nipap.nipapd.enable}

Whether to enable nipapd server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nipap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nipap.nix)

## `services.nipap.nipapd.package` {#opt-services.nipap.nipapd.package}

The nipap package to use.

*Type:* package

*Default:* `pkgs.nipap`

*Declared by:* [`nixos/modules/services/web-apps/nipap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nipap.nix)

## `services.nipap.settings` {#opt-services.nipap.settings}

Configuration options to set in /etc/nipap/nipap.conf.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/nipap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nipap.nix)

## `services.nipap.settings.auth.auth_cache_timeout` {#opt-services.nipap.settings.auth.auth_cache_timeout}

Seconds to store cached auth entries for.

*Type:* signed integer

*Default:* `3600`

*Declared by:* [`nixos/modules/services/web-apps/nipap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nipap.nix)

## `services.nipap.settings.auth.default_backend` {#opt-services.nipap.settings.auth.default_backend}

Name of auth backend to use by default.

*Type:* string

*Default:* `"local"`

*Declared by:* [`nixos/modules/services/web-apps/nipap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nipap.nix)

## `services.nipap.settings.nipapd.db_host` {#opt-services.nipap.settings.nipapd.db_host}

PostgreSQL host to connect to. Empty means use UNIX socket.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/nipap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nipap.nix)

## `services.nipap.settings.nipapd.db_name` {#opt-services.nipap.settings.nipapd.db_name}

Name of database to use on PostgreSQL server.

*Type:* string

*Default:* `"nipap"`

*Declared by:* [`nixos/modules/services/web-apps/nipap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nipap.nix)

## `services.nipap.settings.nipapd.debug` {#opt-services.nipap.settings.nipapd.debug}

Enable debug logging.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/nipap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nipap.nix)

## `services.nipap.settings.nipapd.foreground` {#opt-services.nipap.settings.nipapd.foreground}

Remain in foreground rather than forking to background.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nipap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nipap.nix)

## `services.nipap.settings.nipapd.listen` {#opt-services.nipap.settings.nipapd.listen}

IP address to bind nipapd to.

*Type:* string

*Default:* `"::1"`

*Declared by:* [`nixos/modules/services/web-apps/nipap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nipap.nix)

## `services.nipap.settings.nipapd.port` {#opt-services.nipap.settings.nipapd.port}

Port to bind nipapd to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1337`

*Declared by:* [`nixos/modules/services/web-apps/nipap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nipap.nix)

## `services.nipap.user` {#opt-services.nipap.user}

User to use for running NIPAP services.

*Type:* string

*Default:* `"nipap"`

*Declared by:* [`nixos/modules/services/web-apps/nipap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nipap.nix)

## `services.nitter.cache.listMinutes` {#opt-services.nitter.cache.listMinutes}

How long to cache list info (not the tweets, so keep it high).

*Type:* signed integer

*Default:* `240`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.cache.redisConnections` {#opt-services.nitter.cache.redisConnections}

Redis connection pool size.

*Type:* signed integer

*Default:* `20`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.cache.redisHost` {#opt-services.nitter.cache.redisHost}

Redis host.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.cache.redisMaxConnections` {#opt-services.nitter.cache.redisMaxConnections}

Maximum number of connections to Redis.

New connections are opened when none are available, but if the
pool size goes above this, they are closed when released, do not
worry about this unless you receive tons of requests per second.

*Type:* signed integer

*Default:* `30`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.cache.redisPort` {#opt-services.nitter.cache.redisPort}

Redis port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6379`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.cache.rssMinutes` {#opt-services.nitter.cache.rssMinutes}

How long to cache RSS queries.

*Type:* signed integer

*Default:* `10`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.config.base64Media` {#opt-services.nitter.config.base64Media}

Use base64 encoding for proxied media URLs.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.config.enableDebug` {#opt-services.nitter.config.enableDebug}

Whether to enable request logs and debug endpoints.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.config.enableRSS` {#opt-services.nitter.config.enableRSS}

Whether to enable RSS feeds.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.config.proxy` {#opt-services.nitter.config.proxy}

URL to a HTTP/HTTPS proxy.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.config.proxyAuth` {#opt-services.nitter.config.proxyAuth}

Credentials for proxy.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.config.tokenCount` {#opt-services.nitter.config.tokenCount}

Minimum amount of usable tokens.

Tokens are used to authorize API requests, but they expire after
~1 hour, and have a limit of 187 requests. The limit gets reset
every 15 minutes, and the pool is filled up so there is always at
least tokenCount usable tokens. Only increase this if you receive
major bursts all the time.

*Type:* signed integer

*Default:* `10`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.enable` {#opt-services.nitter.enable}

Whether to enable Nitter, an alternative Twitter front-end.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.openFirewall` {#opt-services.nitter.openFirewall}

Open ports in the firewall for Nitter web interface.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.package` {#opt-services.nitter.package}

The nitter package to use.

*Type:* package

*Default:* `pkgs.nitter`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.preferences.autoplayGifs` {#opt-services.nitter.preferences.autoplayGifs}

Autoplay GIFs.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.preferences.bidiSupport` {#opt-services.nitter.preferences.bidiSupport}

Support bidirectional text (makes clicking on tweets harder).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.preferences.hideBanner` {#opt-services.nitter.preferences.hideBanner}

Hide profile banner.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.preferences.hidePins` {#opt-services.nitter.preferences.hidePins}

Hide pinned tweets.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.preferences.hideReplies` {#opt-services.nitter.preferences.hideReplies}

Hide tweet replies.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.preferences.hideTweetStats` {#opt-services.nitter.preferences.hideTweetStats}

Hide tweet stats (replies, retweets, likes).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.preferences.hlsPlayback` {#opt-services.nitter.preferences.hlsPlayback}

Enable HLS video streaming (requires JavaScript).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.preferences.infiniteScroll` {#opt-services.nitter.preferences.infiniteScroll}

Infinite scrolling (requires JavaScript, experimental!).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.preferences.mp4Playback` {#opt-services.nitter.preferences.mp4Playback}

Enable MP4 video playback.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.preferences.muteVideos` {#opt-services.nitter.preferences.muteVideos}

Mute videos by default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.preferences.proxyVideos` {#opt-services.nitter.preferences.proxyVideos}

Proxy video streaming through the server (might be slow).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.preferences.replaceReddit` {#opt-services.nitter.preferences.replaceReddit}

Replace Reddit links with links to this instance (blank to disable).

*Type:* string

*Default:* `""`

*Example:* `"teddit.net"`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.preferences.replaceTwitter` {#opt-services.nitter.preferences.replaceTwitter}

Replace Twitter links with links to this instance (blank to disable).

*Type:* string

*Default:* `""`

*Example:* `"nitter.net"`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.preferences.replaceYouTube` {#opt-services.nitter.preferences.replaceYouTube}

Replace YouTube links with links to this instance (blank to disable).

*Type:* string

*Default:* `""`

*Example:* `"piped.kavin.rocks"`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.preferences.squareAvatars` {#opt-services.nitter.preferences.squareAvatars}

Square profile pictures.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.preferences.stickyProfile` {#opt-services.nitter.preferences.stickyProfile}

Make profile sidebar stick to top.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.preferences.theme` {#opt-services.nitter.preferences.theme}

Instance theme.

*Type:* string

*Default:* `"Nitter"`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.redisCreateLocally` {#opt-services.nitter.redisCreateLocally}

Configure local Redis server for Nitter.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.server.address` {#opt-services.nitter.server.address}

The address to listen on.

*Type:* string

*Default:* `"0.0.0.0"`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.server.hostname` {#opt-services.nitter.server.hostname}

Hostname of the instance.

*Type:* string

*Default:* `"localhost"`

*Example:* `"nitter.net"`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.server.httpMaxConnections` {#opt-services.nitter.server.httpMaxConnections}

Maximum number of HTTP connections.

*Type:* signed integer

*Default:* `100`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.server.https` {#opt-services.nitter.server.https}

Set secure attribute on cookies. Keep it disabled to enable cookies when not using HTTPS.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.server.port` {#opt-services.nitter.server.port}

The port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Example:* `8000`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.server.staticDir` {#opt-services.nitter.server.staticDir}

Path to the static files directory.

*Type:* absolute path

*Default:* `"${config.services.nitter.package}/share/nitter/public"`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.server.title` {#opt-services.nitter.server.title}

Title of the instance.

*Type:* string

*Default:* `"nitter"`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.sessionsFile` {#opt-services.nitter.sessionsFile}

Path to the session tokens file.

This file contains a list of session tokens that can be used to
access the instance without logging in. The file is in JSONL format,
where each line is a JSON object with the following fields:

{"oauth\_token":"some\_token","oauth\_token\_secret":"some\_secret\_key"}

See [https://github.com/zedeus/nitter/wiki/Creating-session-tokens](https://github.com/zedeus/nitter/wiki/Creating-session-tokens)
for more information on session tokens and how to generate them.

*Type:* absolute path

*Default:* `"/var/lib/nitter/sessions.jsonl"`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nitter.settings` {#opt-services.nitter.settings}

Add settings here to override NixOS module generated settings.

Check the official repository for the available settings:
[https://github.com/zedeus/nitter/blob/master/nitter.example.conf](https://github.com/zedeus/nitter/blob/master/nitter.example.conf)

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/nitter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nitter.nix)

## `services.nix-serve.bindAddress` {#opt-services.nix-serve.bindAddress}

IP address where nix-serve will bind its listening socket.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/networking/nix-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nix-serve.nix)

## `services.nix-serve.enable` {#opt-services.nix-serve.enable}

Whether to enable nix-serve, the standalone Nix binary cache server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nix-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nix-serve.nix)

## `services.nix-serve.extraParams` {#opt-services.nix-serve.extraParams}

Extra command line parameters for nix-serve.

*Type:* strings concatenated with " "

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/nix-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nix-serve.nix)

## `services.nix-serve.openFirewall` {#opt-services.nix-serve.openFirewall}

Open ports in the firewall for nix-serve.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nix-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nix-serve.nix)

## `services.nix-serve.package` {#opt-services.nix-serve.package}

The nix-serve package to use.

*Type:* package

*Default:* `pkgs.nix-serve`

*Declared by:* [`nixos/modules/services/networking/nix-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nix-serve.nix)

## `services.nix-serve.port` {#opt-services.nix-serve.port}

Port number where nix-serve will listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5000`

*Declared by:* [`nixos/modules/services/networking/nix-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nix-serve.nix)

## `services.nix-serve.secretKeyFile` {#opt-services.nix-serve.secretKeyFile}

The path to the file used for signing derivation data.
Generate with:

```
nix-store --generate-binary-cache-key key-name secret-key-file public-key-file
```

For more details see `nix-store(1)`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/nix-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nix-serve.nix)

## `services.nix-store-gcs-proxy` {#opt-services.nix-store-gcs-proxy}

An attribute set describing an HTTP to GCS proxy that allows us to use GCS
bucket via HTTP protocol.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/nix-store-gcs-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nix-store-gcs-proxy.nix)

## `services.nix-store-gcs-proxy.<name>.address` {#opt-services.nix-store-gcs-proxy._name_.address}

The address of the proxy.

*Type:* string

*Example:* `"localhost:3000"`

*Declared by:* [`nixos/modules/services/networking/nix-store-gcs-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nix-store-gcs-proxy.nix)

## `services.nix-store-gcs-proxy.<name>.bucketName` {#opt-services.nix-store-gcs-proxy._name_.bucketName}

Name of Google storage bucket

*Type:* string

*Default:* `"‹name›"`

*Example:* `"my-bucket-name"`

*Declared by:* [`nixos/modules/services/networking/nix-store-gcs-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nix-store-gcs-proxy.nix)

## `services.nix-store-gcs-proxy.<name>.enable` {#opt-services.nix-store-gcs-proxy._name_.enable}

Whether to enable proxy for this bucket

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nix-store-gcs-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nix-store-gcs-proxy.nix)

## `services.nixseparatedebuginfod2.cacheExpirationDelay` {#opt-services.nixseparatedebuginfod2.cacheExpirationDelay}

keep unused cache entries for this long. A number followed by a unit

*Type:* string

*Default:* `"1d"`

*Declared by:* [`nixos/modules/services/development/nixseparatedebuginfod2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/nixseparatedebuginfod2.nix)

## `services.nixseparatedebuginfod2.enable` {#opt-services.nixseparatedebuginfod2.enable}

Whether to enable nixseparatedebuginfod2, a debuginfod server providing source and debuginfo for nix packages.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/development/nixseparatedebuginfod2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/nixseparatedebuginfod2.nix)

## `services.nixseparatedebuginfod2.package` {#opt-services.nixseparatedebuginfod2.package}

The nixseparatedebuginfod2 package to use.

*Type:* package

*Default:* `pkgs.nixseparatedebuginfod2`

*Declared by:* [`nixos/modules/services/development/nixseparatedebuginfod2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/nixseparatedebuginfod2.nix)

## `services.nixseparatedebuginfod2.port` {#opt-services.nixseparatedebuginfod2.port}

port to listen

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1949`

*Declared by:* [`nixos/modules/services/development/nixseparatedebuginfod2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/nixseparatedebuginfod2.nix)

## `services.nixseparatedebuginfod2.substituters` {#opt-services.nixseparatedebuginfod2.substituters}

nix substituter to fetch debuginfo from. Either http/https/file substituters, or `local:` to use debuginfo present in the local store.

*Type:* list of string

*Default:*

``` nix
[
  "local:"
  "https://cache.nixos.org"
]
```

*Declared by:* [`nixos/modules/services/development/nixseparatedebuginfod2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/nixseparatedebuginfod2.nix)

## `services.nmtrust.enable` {#opt-services.nmtrust.enable}

Whether to enable network trust management.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nmtrust.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nmtrust.nix)

## `services.nmtrust.evalFailurePolicy` {#opt-services.nmtrust.evalFailurePolicy}

How to handle trust evaluation failures (D-Bus errors, NM
unavailable). `"untrusted"` (default) is fail-closed: trusted-only
units stop. `"offline"` allows units with
`allowOffline` to run.

*Type:* one of "untrusted", "offline"

*Default:* `"untrusted"`

*Declared by:* [`nixos/modules/services/networking/nmtrust.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nmtrust.nix)

## `services.nmtrust.excludedConnectionPatterns` {#opt-services.nmtrust.excludedConnectionPatterns}

Glob patterns matched against connection names at runtime using
fnmatch(3) with FNM\_NOESCAPE. Connection names are treated as
literal strings (no backslash interpretation).
Matching connections are ignored when computing trust state.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/nmtrust.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nmtrust.nix)

## `services.nmtrust.mixedPolicy` {#opt-services.nmtrust.mixedPolicy}

How to treat mixed trust state (some connections trusted,
some untrusted).

*Type:* one of "trusted", "untrusted"

*Default:* `"untrusted"`

*Declared by:* [`nixos/modules/services/networking/nmtrust.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nmtrust.nix)

## `services.nmtrust.systemUnits` {#opt-services.nmtrust.systemUnits}

System units to bind to the trusted network target.
Keys are systemd unit names.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/nmtrust.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nmtrust.nix)

## `services.nmtrust.systemUnits.<name>.allowOffline` {#opt-services.nmtrust.systemUnits._name_.allowOffline}

Whether this unit should also run when offline.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nmtrust.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nmtrust.nix)

## `services.nmtrust.trustedConnections` {#opt-services.nmtrust.trustedConnections}

List of NetworkManager profile names from
`networking.networkmanager.ensureProfiles`.
UUIDs are resolved at evaluation time.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/nmtrust.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nmtrust.nix)

## `services.nmtrust.trustedUUIDsExtra` {#opt-services.nmtrust.trustedUUIDsExtra}

Additional trusted connection UUIDs not managed via
`networking.networkmanager.ensureProfiles`.
Must be valid UUID format.

*Type:* list of string matching the pattern \[0-9a-fA-F\]{8}-\[0-9a-fA-F\]{4}-\[0-9a-fA-F\]{4}-\[0-9a-fA-F\]{4}-\[0-9a-fA-F\]{12}

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/nmtrust.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nmtrust.nix)

## `services.nmtrust.userUnits` {#opt-services.nmtrust.userUnits}

Per-user units to bind to the trusted network target.
Outer keys are usernames, inner keys are systemd unit names.
Users must have linger enabled
([`users.users.<name>.linger`](../../options/users/index.md#opt-users.users._name_.linger)).

*Type:* attribute set of attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  alice = {
    "etesync-dav.service" = { };
    "syncthing.service" = { allowOffline = true; };
  };
}
```

*Declared by:* [`nixos/modules/services/networking/nmtrust.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nmtrust.nix)

## `services.nmtrust.userUnits.<name>.<name>.allowOffline` {#opt-services.nmtrust.userUnits._name_._name_.allowOffline}

Whether this unit should also run when offline.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nmtrust.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nmtrust.nix)

## `services.nncp.caller.enable` {#opt-services.nncp.caller.enable}

Whether to enable cron'ed NNCP TCP daemon caller.
The daemon will take configuration from
[programs](../../options/programs/index.md#opt-programs.nncp.settings)
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nncp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nncp.nix)

## `services.nncp.caller.extraArgs` {#opt-services.nncp.caller.extraArgs}

Extra command-line arguments to pass to caller.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-autotoss"
]
```

*Declared by:* [`nixos/modules/services/networking/nncp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nncp.nix)

## `services.nncp.daemon.enable` {#opt-services.nncp.daemon.enable}

Whether to enable NNCP TCP synronization daemon.
The daemon will take configuration from
[programs](../../options/programs/index.md#opt-programs.nncp.settings)
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nncp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nncp.nix)

## `services.nncp.daemon.extraArgs` {#opt-services.nncp.daemon.extraArgs}

Extra command-line arguments to pass to daemon.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-autotoss"
]
```

*Declared by:* [`nixos/modules/services/networking/nncp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nncp.nix)

## `services.nncp.daemon.socketActivation.enable` {#opt-services.nncp.daemon.socketActivation.enable}

Whether to enable socket activation for nncp-daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nncp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nncp.nix)

## `services.nncp.daemon.socketActivation.listenStreams` {#opt-services.nncp.daemon.socketActivation.listenStreams}

TCP sockets to bind to.
See [systemd](../../options/systemd/index.md#opt-systemd.sockets._name_.listenStreams).

*Type:* list of string

*Default:*

``` nix
[
  "5400"
]
```

*Declared by:* [`nixos/modules/services/networking/nncp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nncp.nix)

## `services.nntp-proxy.enable` {#opt-services.nntp-proxy.enable}

Whether to enable NNTP-Proxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nntp-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nntp-proxy.nix)

## `services.nntp-proxy.listenAddress` {#opt-services.nntp-proxy.listenAddress}

Proxy listen address (IPv6 literal addresses need to be enclosed in "\[" and "\]" characters)

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"[::]"`

*Declared by:* [`nixos/modules/services/networking/nntp-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nntp-proxy.nix)

## `services.nntp-proxy.port` {#opt-services.nntp-proxy.port}

Proxy listen port

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5555`

*Declared by:* [`nixos/modules/services/networking/nntp-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nntp-proxy.nix)

## `services.nntp-proxy.prohibitPosting` {#opt-services.nntp-proxy.prohibitPosting}

Whether to prohibit posting to the upstream server

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/nntp-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nntp-proxy.nix)

## `services.nntp-proxy.sslCert` {#opt-services.nntp-proxy.sslCert}

Proxy ssl certificate path

*Type:* string

*Default:* `"cert.pem"`

*Example:* `"/path/to/your/cert.file"`

*Declared by:* [`nixos/modules/services/networking/nntp-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nntp-proxy.nix)

## `services.nntp-proxy.sslKey` {#opt-services.nntp-proxy.sslKey}

Proxy ssl key path

*Type:* string

*Default:* `"key.pem"`

*Example:* `"/path/to/your/key.file"`

*Declared by:* [`nixos/modules/services/networking/nntp-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nntp-proxy.nix)

## `services.nntp-proxy.upstreamMaxConnections` {#opt-services.nntp-proxy.upstreamMaxConnections}

Upstream server maximum allowed concurrent connections

*Type:* signed integer

*Default:* `20`

*Declared by:* [`nixos/modules/services/networking/nntp-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nntp-proxy.nix)

## `services.nntp-proxy.upstreamPassword` {#opt-services.nntp-proxy.upstreamPassword}

Upstream server password

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/nntp-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nntp-proxy.nix)

## `services.nntp-proxy.upstreamPort` {#opt-services.nntp-proxy.upstreamPort}

Upstream server port

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `563`

*Declared by:* [`nixos/modules/services/networking/nntp-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nntp-proxy.nix)

## `services.nntp-proxy.upstreamServer` {#opt-services.nntp-proxy.upstreamServer}

Upstream server address

*Type:* string

*Default:* `""`

*Example:* `"ssl-eu.astraweb.com"`

*Declared by:* [`nixos/modules/services/networking/nntp-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nntp-proxy.nix)

## `services.nntp-proxy.upstreamUser` {#opt-services.nntp-proxy.upstreamUser}

Upstream server username

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/nntp-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nntp-proxy.nix)

## `services.nntp-proxy.users` {#opt-services.nntp-proxy.users}

NNTP-Proxy user configuration

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "user1" = {
    passwordHash = "$6$1l0t5Kn2Dk$appzivc./9l/kjq57eg5UCsBKlcfyCr0zNWYNerKoPsI1d7eAwiT0SVsOVx/CTgaBNT/u4fi2vN.iGlPfv1ek0";
    maxConnections = 5;
  };
  "anotheruser" = {
    passwordHash = "$6$6lwEsWB.TmsS$W7m1riUx4QrA8pKJz8hvff0dnF1NwtZXgdjmGqA1Dx2MDPj07tI9GNcb0SWlMglE.2/hBgynDdAd/XqqtRqVQ0";
    maxConnections = 7;
  };
}
```

*Declared by:* [`nixos/modules/services/networking/nntp-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nntp-proxy.nix)

## `services.nntp-proxy.users.<name>.maxConnections` {#opt-services.nntp-proxy.users._name_.maxConnections}

Maximum number of concurrent connections to the proxy for this user

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/networking/nntp-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nntp-proxy.nix)

## `services.nntp-proxy.users.<name>.passwordHash` {#opt-services.nntp-proxy.users._name_.passwordHash}

SHA-512 password hash (can be generated by
`mkpasswd -m sha-512 <password>`)

*Type:* string

*Example:* `"$6$GtzE7FrpE$wwuVgFYU.TZH4Rz.Snjxk9XGua89IeVwPQ/fEUD8eujr40q5Y021yhn0aNcsQ2Ifw.BLclyzvzgegopgKcneL0"`

*Declared by:* [`nixos/modules/services/networking/nntp-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nntp-proxy.nix)

## `services.nntp-proxy.users.<name>.username` {#opt-services.nntp-proxy.users._name_.username}

Username

*Type:* string

*Declared by:* [`nixos/modules/services/networking/nntp-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nntp-proxy.nix)

## `services.nntp-proxy.verbosity` {#opt-services.nntp-proxy.verbosity}

Verbosity level

*Type:* one of "error", "warning", "notice", "info", "debug"

*Default:* `"info"`

*Example:* `"error"`

*Declared by:* [`nixos/modules/services/networking/nntp-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nntp-proxy.nix)

## `services.node-red.configFile` {#opt-services.node-red.configFile}

Path to the JavaScript configuration file.
See [https://github.com/node-red/node-red/blob/master/packages/node\_modules/node-red/settings.js](https://github.com/node-red/node-red/blob/master/packages/node_modules/node-red/settings.js)
for a configuration example.

*Type:* absolute path

*Default:* `"${package}/lib/node_modules/node-red/packages/node_modules/node-red/settings.js"`

*Declared by:* [`nixos/modules/services/web-apps/node-red.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/node-red.nix)

## `services.node-red.define` {#opt-services.node-red.define}

List of settings.js overrides to pass via -D to Node-RED.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  "logging.console.level" = "trace";
}
```

*Declared by:* [`nixos/modules/services/web-apps/node-red.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/node-red.nix)

## `services.node-red.enable` {#opt-services.node-red.enable}

Whether to enable the Node-RED service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/node-red.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/node-red.nix)

## `services.node-red.group` {#opt-services.node-red.group}

Group under which Node-RED runs.If left as the default value this group
will automatically be created on system activation, otherwise the
sysadmin is responsible for ensuring the group exists.

*Type:* string

*Default:* `"node-red"`

*Declared by:* [`nixos/modules/services/web-apps/node-red.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/node-red.nix)

## `services.node-red.openFirewall` {#opt-services.node-red.openFirewall}

Open ports in the firewall for the server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/node-red.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/node-red.nix)

## `services.node-red.package` {#opt-services.node-red.package}

The node-red package to use.

*Type:* package

*Default:* `pkgs.node-red`

*Declared by:* [`nixos/modules/services/web-apps/node-red.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/node-red.nix)

## `services.node-red.port` {#opt-services.node-red.port}

Listening port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1880`

*Declared by:* [`nixos/modules/services/web-apps/node-red.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/node-red.nix)

## `services.node-red.safe` {#opt-services.node-red.safe}

Whether to launch Node-RED in --safe mode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/node-red.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/node-red.nix)

## `services.node-red.user` {#opt-services.node-red.user}

User under which Node-RED runs.If left as the default value this user
will automatically be created on system activation, otherwise the
sysadmin is responsible for ensuring the user exists.

*Type:* string

*Default:* `"node-red"`

*Declared by:* [`nixos/modules/services/web-apps/node-red.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/node-red.nix)

## `services.node-red.userDir` {#opt-services.node-red.userDir}

The directory to store all user data, such as flow and credential files and all library data. If left
as the default value this directory will automatically be created before the node-red service starts,
otherwise the sysadmin is responsible for ensuring the directory exists with appropriate ownership
and permissions.

*Type:* absolute path

*Default:* `"/var/lib/node-red"`

*Declared by:* [`nixos/modules/services/web-apps/node-red.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/node-red.nix)

## `services.node-red.withNpmAndGcc` {#opt-services.node-red.withNpmAndGcc}

Give Node-RED access to npm and GCC at runtime, so 'Nodes' can be
downloaded and managed imperatively via the 'Palette Manager'.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/node-red.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/node-red.nix)

## `services.nohang.configPath` {#opt-services.nohang.configPath}

Configuration file to use with nohang. The default and desktop example configurations in the nohang repository
can be used by setting this to "basic" or "desktop" (which is the default). Otherwise, you can set it to the path
of a custom configuration file.

*Type:* one of "basic", "desktop" or absolute path

*Default:* `"desktop"`

*Example:* `./my-nohang-config.conf`

*Declared by:* [`nixos/modules/services/system/nohang.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nohang.nix)

## `services.nohang.enable` {#opt-services.nohang.enable}

Whether to enable nohang, a daemon that keeps system responsiveness when Linux is out of memory.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/system/nohang.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nohang.nix)

## `services.nohang.package` {#opt-services.nohang.package}

The nohang package to use.

*Type:* package

*Default:* `pkgs.nohang`

*Declared by:* [`nixos/modules/services/system/nohang.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nohang.nix)

## `services.nomad.credentials` {#opt-services.nomad.credentials}

Credentials envs used to configure nomad secrets.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  logs_remote_write_password = "/run/keys/nomad_write_password";
}
```

*Declared by:* [`nixos/modules/services/networking/nomad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nomad.nix)

## `services.nomad.dropPrivileges` {#opt-services.nomad.dropPrivileges}

Whether the nomad agent should be run as a non-root nomad user.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/nomad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nomad.nix)

## `services.nomad.enable` {#opt-services.nomad.enable}

Whether to enable Nomad, a distributed, highly available, datacenter-aware scheduler.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nomad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nomad.nix)

## `services.nomad.enableDocker` {#opt-services.nomad.enableDocker}

Enable Docker support. Needed for Nomad's docker driver.

Note that the docker group membership is effectively equivalent
to being root, see [https://github.com/moby/moby/issues/9976](https://github.com/moby/moby/issues/9976).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/nomad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nomad.nix)

## `services.nomad.extraPackages` {#opt-services.nomad.extraPackages}

Extra packages to add to `PATH` for the Nomad agent process.

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
with pkgs; [ cni-plugins ]
```

*Declared by:* [`nixos/modules/services/networking/nomad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nomad.nix)

## `services.nomad.extraSettingsPaths` {#opt-services.nomad.extraSettingsPaths}

Additional settings paths used to configure nomad. These can be files or directories.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[ "/etc/nomad-mutable.json" "/run/keys/nomad-with-secrets.json" "/etc/nomad/config.d" ]
```

*Declared by:* [`nixos/modules/services/networking/nomad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nomad.nix)

## `services.nomad.extraSettingsPlugins` {#opt-services.nomad.extraSettingsPlugins}

Additional plugins dir used to configure nomad.

*Type:* list of (package or absolute path)

*Default:* `[ ]`

*Example:*

``` nix
[ "<pluginDir>" pkgs.nomad-driver-nix pkgs.nomad-driver-podman  ]
```

*Declared by:* [`nixos/modules/services/networking/nomad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nomad.nix)

## `services.nomad.package` {#opt-services.nomad.package}

The nomad package to use.

*Type:* package

*Default:* `pkgs.nomad`

*Declared by:* [`nixos/modules/services/networking/nomad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nomad.nix)

## `services.nomad.settings` {#opt-services.nomad.settings}

Configuration for Nomad. See the [documentation](https://www.nomadproject.io/docs/configuration)
for supported values.

Notes about `data_dir`:

If `data_dir` is set to a value other than the
default value of `"/var/lib/nomad"` it is the Nomad
cluster manager's responsibility to make sure that this directory
exists and has the appropriate permissions.

Additionally, if `dropPrivileges` is
`true` then `data_dir`
*cannot* be customized. Setting
`dropPrivileges` to `true` enables
the `DynamicUser` feature of systemd which directly
manages and operates on `StateDirectory`.

*Type:* JSON value

*Default:* `{ }`

*Example:*

``` nix
{
  # A minimal config example:
  server = {
    enabled = true;
    bootstrap_expect = 1; # for demo; no fault tolerance
  };
  client = {
    enabled = true;
  };
}
```

*Declared by:* [`nixos/modules/services/networking/nomad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nomad.nix)

## `services.nominatim.database.apiUser` {#opt-services.nominatim.database.apiUser}

Postgresql database user with read-only permissions used for Nominatim
web API service.

*Type:* string

*Default:* `"nominatim-api"`

*Declared by:* [`nixos/modules/services/search/nominatim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/nominatim.nix)

## `services.nominatim.database.dbname` {#opt-services.nominatim.database.dbname}

Name of the postgresql database.

*Type:* string

*Default:* `"nominatim"`

*Declared by:* [`nixos/modules/services/search/nominatim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/nominatim.nix)

## `services.nominatim.database.extraConnectionParams` {#opt-services.nominatim.database.extraConnectionParams}

Extra Nominatim database connection parameters.

Format:
<param1>=<value1>;<param2>=<value2>

See [https://www.postgresql.org/docs/current/libpq-connect.html#LIBPQ-PARAMKEYWORDS](https://www.postgresql.org/docs/current/libpq-connect.html#LIBPQ-PARAMKEYWORDS).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/search/nominatim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/nominatim.nix)

## `services.nominatim.database.host` {#opt-services.nominatim.database.host}

Host of the postgresql server. If not set to `localhost`, Nominatim
database and postgresql superuser with appropriate permissions must
exist on target host.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/search/nominatim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/nominatim.nix)

## `services.nominatim.database.passwordFile` {#opt-services.nominatim.database.passwordFile}

Password file used for Nominatim database connection.
Must be readable only for the Nominatim web API user.

The file must be a valid `.pgpass` file as described in:
[https://www.postgresql.org/docs/current/libpq-pgpass.html](https://www.postgresql.org/docs/current/libpq-pgpass.html)

In most cases, the following will be enough:

```
*:*:*:*:<password>
```

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/search/nominatim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/nominatim.nix)

## `services.nominatim.database.port` {#opt-services.nominatim.database.port}

Port of the postgresql database.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5432`

*Declared by:* [`nixos/modules/services/search/nominatim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/nominatim.nix)

## `services.nominatim.database.superUser` {#opt-services.nominatim.database.superUser}

Postgresql database superuser used to create Nominatim database and
import data. If `database.host` is set to `localhost`, a unix user and
group of the same name will be automatically created.

*Type:* string

*Default:* `"nominatim"`

*Declared by:* [`nixos/modules/services/search/nominatim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/nominatim.nix)

## `services.nominatim.enable` {#opt-services.nominatim.enable}

Whether to enable nominatim.

Also enables nginx virtual host management. Further nginx configuration
can be done by adapting `services.nginx.virtualHosts.<name>`.
See [services (N)](#opt-services.nginx.virtualHosts).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/search/nominatim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/nominatim.nix)

## `services.nominatim.hostName` {#opt-services.nominatim.hostName}

Hostname to use for the nginx vhost.

*Type:* string

*Example:* `"nominatim.example.com"`

*Declared by:* [`nixos/modules/services/search/nominatim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/nominatim.nix)

## `services.nominatim.package` {#opt-services.nominatim.package}

The nominatim-api package to use.

*Type:* package

*Default:* `pkgs.nominatim-api`

*Declared by:* [`nixos/modules/services/search/nominatim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/nominatim.nix)

## `services.nominatim.settings` {#opt-services.nominatim.settings}

Nominatim configuration settings.
For the list of available configuration options see
[https://nominatim.org/release-docs/latest/customize/Settings](https://nominatim.org/release-docs/latest/customize/Settings).

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  NOMINATIM_REPLICATION_URL = "https://planet.openstreetmap.org/replication/minute";
  NOMINATIM_REPLICATION_MAX_DIFF = "100";
}
```

*Declared by:* [`nixos/modules/services/search/nominatim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/nominatim.nix)

## `services.nominatim.ui.config` {#opt-services.nominatim.ui.config}

Nominatim UI configuration placed to theme/config.theme.js file.

For the list of available configuration options see
[https://github.com/osm-search/nominatim-ui/blob/master/dist/config.defaults.js](https://github.com/osm-search/nominatim-ui/blob/master/dist/config.defaults.js).

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
''
  Nominatim_Config.Page_Title='My Nominatim instance';
  Nominatim_Config.Nominatim_API_Endpoint='https://localhost/';
''
```

*Declared by:* [`nixos/modules/services/search/nominatim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/nominatim.nix)

## `services.nominatim.ui.enable` {#opt-services.nominatim.ui.enable}

Whether to enable Nominatim UI.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/search/nominatim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/nominatim.nix)

## `services.nominatim.ui.package` {#opt-services.nominatim.ui.package}

The nominatim-ui package to use.

*Type:* package

*Default:* `pkgs.nominatim-ui`

*Declared by:* [`nixos/modules/services/search/nominatim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/nominatim.nix)

## `services.nordvpn.enable` {#opt-services.nordvpn.enable}

Whether to enable Enable NordVPN.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nordvpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nordvpn.nix)

## `services.nordvpn.group` {#opt-services.nordvpn.group}

The Group that owns the `nordvpnd` systemd process.
If overriding the default, a group with the same name must exist.

*Type:* string

*Default:* `"nordvpn"`

*Declared by:* [`nixos/modules/services/networking/nordvpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nordvpn.nix)

## `services.nordvpn.package` {#opt-services.nordvpn.package}

The nordvpn package to use.

*Type:* package

*Default:* `pkgs.nordvpn`

*Declared by:* [`nixos/modules/services/networking/nordvpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nordvpn.nix)

## `services.nordvpn.user` {#opt-services.nordvpn.user}

The User that owns the `nordvpnd` systemd process.
If overriding the default, a user with the same name must exist.

*Type:* string

*Default:* `"nordvpn"`

*Declared by:* [`nixos/modules/services/networking/nordvpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nordvpn.nix)

## `services.nostr-rs-relay.dataDir` {#opt-services.nostr-rs-relay.dataDir}

Directory for SQLite files.

*Type:* absolute path

*Default:* `"/var/lib/nostr-rs-relay"`

*Declared by:* [`nixos/modules/services/web-apps/nostr-rs-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nostr-rs-relay.nix)

## `services.nostr-rs-relay.enable` {#opt-services.nostr-rs-relay.enable}

Whether to enable nostr-rs-relay.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/nostr-rs-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nostr-rs-relay.nix)

## `services.nostr-rs-relay.package` {#opt-services.nostr-rs-relay.package}

The nostr-rs-relay package to use.

*Type:* package

*Default:* `pkgs.nostr-rs-relay`

*Declared by:* [`nixos/modules/services/web-apps/nostr-rs-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nostr-rs-relay.nix)

## `services.nostr-rs-relay.port` {#opt-services.nostr-rs-relay.port}

Listen on this port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `12849`

*Declared by:* [`nixos/modules/services/web-apps/nostr-rs-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nostr-rs-relay.nix)

## `services.nostr-rs-relay.settings` {#opt-services.nostr-rs-relay.settings}

See [https://git.sr.ht/~gheartsfield/nostr-rs-relay/#configuration](https://git.sr.ht/~gheartsfield/nostr-rs-relay/#configuration) for documentation.

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/nostr-rs-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nostr-rs-relay.nix)

## `services.novacomd.enable` {#opt-services.novacomd.enable}

Whether to enable Novacom service for connecting to WebOS devices.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/novacomd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/novacomd.nix)

## `services.nscd.config` {#opt-services.nscd.config}

Configuration to use for Name Service Cache Daemon.
Only used in case glibc-nscd is used.

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  # We basically use nscd as a proxy for forwarding nss requests to appropriate
  # nss modules, as we run nscd with LD_LIBRARY_PATH set to the directory
  # containing all such modules
  # Note that we can not use `enable-cache no` As this will actually cause nscd
  # to just reject the nss requests it receives, which then causes glibc to
  # fallback to trying to handle the request by itself. Which won't work as glibc
  # is not aware of the path in which the nss modules live.  As a workaround, we
  # have `enable-cache yes` with an explicit ttl of 0
  server-user             nscd
  
  enable-cache            passwd          yes
  positive-time-to-live   passwd          0
  negative-time-to-live   passwd          0
  shared                  passwd          yes
  
  enable-cache            group           yes
  positive-time-to-live   group           0
  negative-time-to-live   group           0
  shared                  group           yes
  
  enable-cache            netgroup        yes
  positive-time-to-live   netgroup        0
  negative-time-to-live   netgroup        0
  shared                  netgroup        yes
  
  enable-cache            hosts           yes
  positive-time-to-live   hosts           0
  negative-time-to-live   hosts           0
  shared                  hosts           yes
  
  enable-cache            services        yes
  positive-time-to-live   services        0
  negative-time-to-live   services        0
  shared                  services        yes
''
```

*Declared by:* [`nixos/modules/services/system/nscd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nscd.nix)

## `services.nscd.enable` {#opt-services.nscd.enable}

Whether to enable the Name Service Cache Daemon.
Disabling this is strongly discouraged, as this effectively disables NSS Lookups
from all non-glibc NSS modules, including the ones provided by systemd.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/system/nscd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nscd.nix)

## `services.nscd.enableNsncd` {#opt-services.nscd.enableNsncd}

Whether to use nsncd instead of nscd from glibc.
This is a nscd-compatible daemon, that proxies lookups, without any caching.
Using nscd from glibc is discouraged.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/system/nscd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nscd.nix)

## `services.nscd.group` {#opt-services.nscd.group}

User group under which nscd runs.

*Type:* string

*Default:* `"nscd"`

*Declared by:* [`nixos/modules/services/system/nscd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nscd.nix)

## `services.nscd.package` {#opt-services.nscd.package}

package containing the nscd binary to be used by the service.
Ignored when enableNsncd is set to true.

*Type:* package

*Default:*

``` nix
if pkgs.stdenv.hostPlatform.libc == "glibc"
  then pkgs.stdenv.cc.libc.bin
  else pkgs.glibc.bin;
```

*Declared by:* [`nixos/modules/services/system/nscd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nscd.nix)

## `services.nscd.user` {#opt-services.nscd.user}

User account under which nscd runs.

*Type:* string

*Default:* `"nscd"`

*Declared by:* [`nixos/modules/services/system/nscd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nscd.nix)

## `services.nsd.bind8Stats` {#opt-services.nsd.bind8Stats}

Whether to enable BIND8 like statistics.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.dnssecInterval` {#opt-services.nsd.dnssecInterval}

How often to check whether dnssec key rollover is required

*Type:* string

*Default:* `"1h"`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.enable` {#opt-services.nsd.enable}

Whether to enable NSD authoritative DNS server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.extraConfig` {#opt-services.nsd.extraConfig}

Extra nsd config.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.hideVersion` {#opt-services.nsd.hideVersion}

Whether NSD should answer VERSION.BIND and VERSION.SERVER CHAOS class queries.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.identity` {#opt-services.nsd.identity}

Identify the server (CH TXT ID.SERVER entry).

*Type:* string

*Default:* `"unidentified server"`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.interfaces` {#opt-services.nsd.interfaces}

What addresses the server should listen to.

*Type:* list of string

*Default:*

``` nix
[
  "127.0.0.0"
  "::1"
]
```

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.ipFreebind` {#opt-services.nsd.ipFreebind}

Whether to bind to nonlocal addresses and interfaces that are down.
Similar to ip-transparent.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.ipTransparent` {#opt-services.nsd.ipTransparent}

Allow binding to non local addresses.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.ipv4` {#opt-services.nsd.ipv4}

Whether to listen on IPv4 connections.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.ipv4EDNSSize` {#opt-services.nsd.ipv4EDNSSize}

Preferred EDNS buffer size for IPv4.

*Type:* signed integer

*Default:* `4096`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.ipv6` {#opt-services.nsd.ipv6}

Whether to listen on IPv6 connections.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.ipv6EDNSSize` {#opt-services.nsd.ipv6EDNSSize}

Preferred EDNS buffer size for IPv6.

*Type:* signed integer

*Default:* `4096`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.keys` {#opt-services.nsd.keys}

Define your TSIG keys here.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{ "tsig.example.org" = {
    algorithm = "hmac-md5";
    keyFile = "/path/to/my/key";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.keys.<name>.algorithm` {#opt-services.nsd.keys._name_.algorithm}

Authentication algorithm for this key.

*Type:* string

*Default:* `"hmac-sha256"`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.keys.<name>.keyFile` {#opt-services.nsd.keys._name_.keyFile}

Path to the file which contains the actual base64 encoded
key. The key will be copied into "/var/lib/nsd/private" before
NSD starts. The copied file is only accessibly by the NSD
user.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.logTimeAscii` {#opt-services.nsd.logTimeAscii}

Log time in ascii, if false then in unix epoch seconds.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.nsid` {#opt-services.nsd.nsid}

NSID identity (hex string, or "ascii\_somestring").

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.port` {#opt-services.nsd.port}

Port the service should bind do.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `53`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.ratelimit.enable` {#opt-services.nsd.ratelimit.enable}

Whether to enable ratelimit capabilities.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.ratelimit.ipv4PrefixLength` {#opt-services.nsd.ratelimit.ipv4PrefixLength}

IPv4 prefix length. Addresses are grouped by netblock.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.ratelimit.ipv6PrefixLength` {#opt-services.nsd.ratelimit.ipv6PrefixLength}

IPv6 prefix length. Addresses are grouped by netblock.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.ratelimit.ratelimit` {#opt-services.nsd.ratelimit.ratelimit}

Max qps allowed from any query source.
0 means unlimited. With an verbosity of 2 blocked and
unblocked subnets will be logged.

*Type:* signed integer

*Default:* `200`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.ratelimit.size` {#opt-services.nsd.ratelimit.size}

Size of the hashtable. More buckets use more memory but lower
the chance of hash hash collisions.

*Type:* signed integer

*Default:* `1000000`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.ratelimit.slip` {#opt-services.nsd.ratelimit.slip}

Number of packets that get discarded before replying a SLIP response.
0 disables SLIP responses. 1 will make every response a SLIP response.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.ratelimit.whitelistRatelimit` {#opt-services.nsd.ratelimit.whitelistRatelimit}

Max qps allowed from whitelisted sources.
0 means unlimited. Set the rrl-whitelist option for specific
queries to apply this limit instead of the default to them.

*Type:* signed integer

*Default:* `2000`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.remoteControl.controlCertFile` {#opt-services.nsd.remoteControl.controlCertFile}

Path to the client certificate signed with the server certificate.
This file is used by nsd-control and generated by nsd-control-setup.

*Type:* absolute path

*Default:* `"/etc/nsd/nsd_control.pem"`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.remoteControl.controlKeyFile` {#opt-services.nsd.remoteControl.controlKeyFile}

Path to the client private key, which is used by nsd-control
but not by the server. This file is generated by nsd-control-setup.

*Type:* absolute path

*Default:* `"/etc/nsd/nsd_control.key"`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.remoteControl.enable` {#opt-services.nsd.remoteControl.enable}

Whether to enable remote control via nsd-control.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.remoteControl.interfaces` {#opt-services.nsd.remoteControl.interfaces}

Which interfaces NSD should bind to for remote control.

*Type:* list of string

*Default:*

``` nix
[
  "127.0.0.1"
  "::1"
]
```

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.remoteControl.port` {#opt-services.nsd.remoteControl.port}

Port number for remote control operations (uses TLS over TCP).

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8952`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.remoteControl.serverCertFile` {#opt-services.nsd.remoteControl.serverCertFile}

Path to the server self signed certificate, which is used by the server
but and by nsd-control. This file is generated by nsd-control-setup.

*Type:* absolute path

*Default:* `"/etc/nsd/nsd_server.pem"`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.remoteControl.serverKeyFile` {#opt-services.nsd.remoteControl.serverKeyFile}

Path to the server private key, which is used by the server
but not by nsd-control. This file is generated by nsd-control-setup.

*Type:* absolute path

*Default:* `"/etc/nsd/nsd_server.key"`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.reuseport` {#opt-services.nsd.reuseport}

Whether to enable SO\_REUSEPORT on all used sockets. This lets multiple
processes bind to the same port. This speeds up operation especially
if the server count is greater than one and makes fast restarts less
prone to fail

*Type:* boolean

*Default:* `pkgs.stdenv.hostPlatform.isLinux`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.rootServer` {#opt-services.nsd.rootServer}

Whether this server will be a root server (a DNS root server, you
usually don't want that).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.roundRobin` {#opt-services.nsd.roundRobin}

Whether to enable round robin rotation of records.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.serverCount` {#opt-services.nsd.serverCount}

Number of NSD servers to fork. Put the number of CPUs to use here.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.statistics` {#opt-services.nsd.statistics}

Statistics are produced every number of seconds. Prints to log.
If null no statistics are logged.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.tcpCount` {#opt-services.nsd.tcpCount}

Maximum number of concurrent TCP connections per server.

*Type:* signed integer

*Default:* `100`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.tcpQueryCount` {#opt-services.nsd.tcpQueryCount}

Maximum number of queries served on a single TCP connection.
0 means no maximum.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.tcpTimeout` {#opt-services.nsd.tcpTimeout}

TCP timeout in seconds.

*Type:* signed integer

*Default:* `120`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.verbosity` {#opt-services.nsd.verbosity}

Verbosity level.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.version` {#opt-services.nsd.version}

The version string replied for CH TXT version.server and version.bind
queries. Will use the compiled package version on null.
See hideVersion for enabling/disabling this responses.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.xfrdReloadTimeout` {#opt-services.nsd.xfrdReloadTimeout}

Number of seconds between reloads triggered by xfrd.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zonefilesCheck` {#opt-services.nsd.zonefilesCheck}

Whether to check mtime of all zone files on start and sighup.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zonefilesWrite` {#opt-services.nsd.zonefilesWrite}

Write changed secondary zones to their zonefile every N seconds.
If the zone (pattern) configuration has "" zonefile, it is not written.
Zones that have received zone transfer updates are written to their zonefile.
0 disables writing to zone files.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones` {#opt-services.nsd.zones}

Define your zones here. Zones can cascade other zones and therefore
inherit settings from parent zones. Look at the definition of
children to learn about inheritance and child zones.
The given example will define 3 zones (example.(com|org|net).). Both
example.com. and example.org. inherit their configuration from
serverGroup1.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{ "serverGroup1" = {
    provideXFR = [ "10.1.2.3 NOKEY" ];
    children = {
      "example.com." = {
        data = ''
          $ORIGIN example.com.
          $TTL    86400
          @ IN SOA a.ns.example.com. admin.example.com. (
          ...
        '';
      };
      "example.org." = {
        data = ''
          $ORIGIN example.org.
          $TTL    86400
          @ IN SOA a.ns.example.com. admin.example.com. (
          ...
        '';
      };
    };
  };

  "example.net." = {
    provideXFR = [ "10.3.2.1 NOKEY" ];
    data = ''
      ...
    '';
  };
}
```

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.allowAXFRFallback` {#opt-services.nsd.zones._name_.allowAXFRFallback}

If NSD as secondary server should be allowed to AXFR if the primary
server does not allow IXFR.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.allowNotify` {#opt-services.nsd.zones._name_.allowNotify}

Listed primary servers are allowed to notify this secondary server.

Format: `<ip> <key-name | NOKEY | BLOCKED>`

`<ip>` either a plain IPv4/IPv6 address or range.
Valid patters for ranges:

- `10.0.0.0/24`: via subnet size
- `10.0.0.0&255.255.255.0`: via subnet mask
- `10.0.0.1-10.0.0.254`: via range

A optional port number could be added with a '@':

- `2001:1234::1@1234`

`<key-name | NOKEY | BLOCKED>`

- `<key-name>` will use the specified TSIG key
- `NOKEY` no TSIG signature is required
- `BLOCKED`notifies from non-listed or blocked IPs will be ignored

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "192.0.2.0/24 NOKEY"
  "10.0.0.1-10.0.0.5 my_tsig_key_name"
  "10.0.3.4&255.255.0.0 BLOCKED"
]
```

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.children` {#opt-services.nsd.zones._name_.children}

Children zones inherit all options of their parents. Attributes
defined in a child will overwrite the ones of its parent. Only
leaf zones will be actually served. This way it's possible to
define maybe zones which share most attributes without
duplicating everything. This mechanism replaces nsd's patterns
in a save and functional way.

*Type:* attribute set of anything

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.data` {#opt-services.nsd.zones._name_.data}

The actual zone data. This is the content of your zone file.
Use imports or pkgs.lib.readFile if you don't want this data in your config file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.dnssec` {#opt-services.nsd.zones._name_.dnssec}

Whether to enable DNSSEC.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.dnssecPolicy.algorithm` {#opt-services.nsd.zones._name_.dnssecPolicy.algorithm}

Which algorithm to use for DNSSEC

*Type:* string

*Default:* `"RSASHA256"`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.dnssecPolicy.coverage` {#opt-services.nsd.zones._name_.dnssecPolicy.coverage}

The length of time to ensure that keys will be correct; no action will be taken to create new keys to be activated after this time.

*Type:* string

*Default:* `"1y"`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.dnssecPolicy.keyttl` {#opt-services.nsd.zones._name_.dnssecPolicy.keyttl}

TTL for dnssec records

*Type:* string

*Default:* `"1h"`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.dnssecPolicy.ksk` {#opt-services.nsd.zones._name_.dnssecPolicy.ksk}

Key policy for key signing keys

*Type:* submodule

*Default:*

``` nix
{
  keySize = 4096;
  postPublish = "1mo";
  prePublish = "1mo";
  rollPeriod = "0";
}
```

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.dnssecPolicy.ksk.keySize` {#opt-services.nsd.zones._name_.dnssecPolicy.ksk.keySize}

Key size in bits

*Type:* signed integer

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.dnssecPolicy.ksk.postPublish` {#opt-services.nsd.zones._name_.dnssecPolicy.ksk.postPublish}

How long after deactivation to keep a key in the zone

*Type:* string

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.dnssecPolicy.ksk.prePublish` {#opt-services.nsd.zones._name_.dnssecPolicy.ksk.prePublish}

How long in advance to publish new keys

*Type:* string

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.dnssecPolicy.ksk.rollPeriod` {#opt-services.nsd.zones._name_.dnssecPolicy.ksk.rollPeriod}

How frequently to change keys

*Type:* string

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.dnssecPolicy.zsk` {#opt-services.nsd.zones._name_.dnssecPolicy.zsk}

Key policy for zone signing keys

*Type:* submodule

*Default:*

``` nix
{
  keySize = 2048;
  postPublish = "1w";
  prePublish = "1w";
  rollPeriod = "1mo";
}
```

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.dnssecPolicy.zsk.keySize` {#opt-services.nsd.zones._name_.dnssecPolicy.zsk.keySize}

Key size in bits

*Type:* signed integer

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.dnssecPolicy.zsk.postPublish` {#opt-services.nsd.zones._name_.dnssecPolicy.zsk.postPublish}

How long after deactivation to keep a key in the zone

*Type:* string

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.dnssecPolicy.zsk.prePublish` {#opt-services.nsd.zones._name_.dnssecPolicy.zsk.prePublish}

How long in advance to publish new keys

*Type:* string

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.dnssecPolicy.zsk.rollPeriod` {#opt-services.nsd.zones._name_.dnssecPolicy.zsk.rollPeriod}

How frequently to change keys

*Type:* string

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.maxRefreshSecs` {#opt-services.nsd.zones._name_.maxRefreshSecs}

Limit refresh time for secondary zones. This is the timer which
checks to see if the zone has to be refetched when it expires.
Normally the value from the SOA record is used, but this  option
restricts that value.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.maxRetrySecs` {#opt-services.nsd.zones._name_.maxRetrySecs}

Limit retry time for secondary zones. This is the timeout after
a failed fetch attempt for the zone. Normally the value from
the SOA record is used, but this option restricts that value.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.minRefreshSecs` {#opt-services.nsd.zones._name_.minRefreshSecs}

Limit refresh time for secondary zones.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.minRetrySecs` {#opt-services.nsd.zones._name_.minRetrySecs}

Limit retry time for secondary zones.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.multiMasterCheck` {#opt-services.nsd.zones._name_.multiMasterCheck}

If enabled, checks all masters for the last zone version.
It uses the higher version from all configured masters.
Useful if you have multiple masters that have different version numbers served.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.notify` {#opt-services.nsd.zones._name_.notify}

This primary server will notify all given secondary servers about
zone changes.

Format: `<ip> <key-name | NOKEY>`

`<ip>` a plain IPv4/IPv6 address with on optional port number (ip@port)

`<key-name | NOKEY>`

- `<key-name>` sign notifies with the specified key
- `NOKEY` don't sign notifies

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "10.0.0.1@3721 my_key"
  "::5 NOKEY"
]
```

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.notifyRetry` {#opt-services.nsd.zones._name_.notifyRetry}

Specifies the number of retries for failed notifies. Set this along with notify.

*Type:* signed integer

*Default:* `5`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.outgoingInterface` {#opt-services.nsd.zones._name_.outgoingInterface}

This address will be used for zone-transfer requests if configured
as a secondary server or notifications in case of a primary server.
Supply either a plain IPv4 or IPv6 address with an optional port
number (ip@port).

*Type:* null or string

*Default:* `null`

*Example:* `"2000::1@1234"`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.provideXFR` {#opt-services.nsd.zones._name_.provideXFR}

Allow these IPs and TSIG to transfer zones, addr TSIG|NOKEY|BLOCKED
address range 192.0.2.0/24, 1.2.3.4&255.255.0.0, 3.0.2.20-3.0.2.40

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "192.0.2.0/24 NOKEY"
  "192.0.2.0/24 my_tsig_key_name"
]
```

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.requestXFR` {#opt-services.nsd.zones._name_.requestXFR}

Format: `[AXFR|UDP] <ip-address> <key-name | NOKEY>`

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.rrlWhitelist` {#opt-services.nsd.zones._name_.rrlWhitelist}

Whitelists the given rrl-types.

*Type:* list of (one of "nxdomain", "error", "referral", "any", "rrsig", "wildcard", "nodata", "dnskey", "positive", "all")

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.nsd.zones.<name>.zoneStats` {#opt-services.nsd.zones._name_.zoneStats}

When set to something distinct to null NSD is able to collect
statistics per zone. All statistics of this zone(s) will be added
to the group specified by this given name. Use "%s" to use the zones
name as the group. The groups are output from nsd-control stats
and stats\_noreset.

*Type:* null or string

*Default:* `null`

*Example:* `"%s"`

*Declared by:* [`nixos/modules/services/networking/nsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nsd.nix)

## `services.ntfy-sh.enable` {#opt-services.ntfy-sh.enable}

Whether to enable [ntfy-sh](https://ntfy.sh), a push notification service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/ntfy-sh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ntfy-sh.nix)

## `services.ntfy-sh.environmentFile` {#opt-services.ntfy-sh.environmentFile}

Path to a file containing extra ntfy environment variables in the systemd `EnvironmentFile`
format. Refer to the [documentation](https://docs.ntfy.sh/config/) for config options.

This can be used to pass secrets such as creating declarative users or token without putting them in the Nix store.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/ntfy"`

*Declared by:* [`nixos/modules/services/misc/ntfy-sh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ntfy-sh.nix)

## `services.ntfy-sh.nginx.enable` {#opt-services.ntfy-sh.nginx.enable}

Whether to set up an nginx virtual host.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/ntfy-sh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ntfy-sh.nix)

## `services.ntfy-sh.nginx.port` {#opt-services.ntfy-sh.nginx.port}

Internal port for ntfy to listen to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `2586`

*Declared by:* [`nixos/modules/services/misc/ntfy-sh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ntfy-sh.nix)

## `services.ntfy-sh.nginx.virtualHost` {#opt-services.ntfy-sh.nginx.virtualHost}

Virtual host to use for nginx.

*Type:* non-empty string

*Example:* `"push.example.com"`

*Declared by:* [`nixos/modules/services/misc/ntfy-sh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ntfy-sh.nix)

## `services.ntfy-sh.package` {#opt-services.ntfy-sh.package}

The ntfy-sh package to use.

*Type:* package

*Default:* `pkgs.ntfy-sh`

*Declared by:* [`nixos/modules/services/misc/ntfy-sh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ntfy-sh.nix)

## `services.ntfy-sh.settings` {#opt-services.ntfy-sh.settings}

Configuration for ntfy.sh, supported values are [here](https://ntfy.sh/docs/config/#config-options).

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Example:*

``` nix
{
  listen-http = ":8080";
}
```

*Declared by:* [`nixos/modules/services/misc/ntfy-sh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ntfy-sh.nix)

## `services.ntfy-sh.settings.base-url` {#opt-services.ntfy-sh.settings.base-url}

Public facing base URL of the service

This setting is required for any of the following features:

- attachments (to return a download URL)
- e-mail sending (for the topic URL in the email footer)
- iOS push notifications for self-hosted servers
  (to calculate the Firebase poll\_request topic)
- Matrix Push Gateway (to validate that the pushkey is correct)

*Type:* string

*Example:* `"https://ntfy.example"`

*Declared by:* [`nixos/modules/services/misc/ntfy-sh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ntfy-sh.nix)

## `services.ntopng.configText` {#opt-services.ntopng.configText}

Overridable configuration file contents to use for ntopng. By
default, use the contents automatically generated by NixOS.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  --interface=any
  --http-port=3000
  --disable-login
''
```

*Declared by:* [`nixos/modules/services/networking/ntopng.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntopng.nix)

## `services.ntopng.enable` {#opt-services.ntopng.enable}

Enable ntopng, a high-speed web-based traffic analysis and flow
collection tool.

With the default configuration, ntopng monitors all network
interfaces and displays its findings at http://localhost:${toString
config.services.ntopng.http-port}. Default username and password is admin/admin.

See the `ntopng(8)` manual page and http://www.ntop.org/products/ntop/
for more info.

Note that enabling ntopng will also enable redis (key-value
database server) for persistent data storage.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ntopng.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntopng.nix)

## `services.ntopng.extraConfig` {#opt-services.ntopng.extraConfig}

Configuration lines that will be appended to the generated ntopng
configuration file. Note that this mechanism does not work when the
manual `configText` option is used.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/ntopng.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntopng.nix)

## `services.ntopng.httpPort` {#opt-services.ntopng.httpPort}

Sets the HTTP port of the embedded web server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/networking/ntopng.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntopng.nix)

## `services.ntopng.interfaces` {#opt-services.ntopng.interfaces}

List of interfaces to monitor. Use "any" to monitor all interfaces.

*Type:* list of string

*Default:*

``` nix
[
  "any"
]
```

*Example:*

``` nix
[
  "eth0"
  "wlan0"
]
```

*Declared by:* [`nixos/modules/services/networking/ntopng.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntopng.nix)

## `services.ntopng.redis.address` {#opt-services.ntopng.redis.address}

Redis address - may be a Unix socket or a network host and port.

*Type:* string

*Example:* `config.services.redis.ntopng.unixSocket`

*Declared by:* [`nixos/modules/services/networking/ntopng.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntopng.nix)

## `services.ntopng.redis.createInstance` {#opt-services.ntopng.redis.createInstance}

Local Redis instance name. Set to `null` to disable
local Redis instance. Defaults to `""` for
`system.stateVersion` older than 22.05.

*Type:* null or string

*Default:* `"ntopng"`

*Declared by:* [`nixos/modules/services/networking/ntopng.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntopng.nix)

## `services.ntp.enable` {#opt-services.ntp.enable}

Whether to synchronise your machine's time using ntpd, as a peer in
the NTP network.

Disables `systemd.timesyncd` if enabled.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ntp/ntpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/ntpd.nix)

## `services.ntp.extraConfig` {#opt-services.ntp.extraConfig}

Additional text appended to `ntp.conf`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  fudge 127.127.1.0 stratum 10
''
```

*Declared by:* [`nixos/modules/services/networking/ntp/ntpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/ntpd.nix)

## `services.ntp.extraFlags` {#opt-services.ntp.extraFlags}

Extra flags passed to the ntpd command.

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "--interface=eth0" ]`

*Declared by:* [`nixos/modules/services/networking/ntp/ntpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/ntpd.nix)

## `services.ntp.restrictDefault` {#opt-services.ntp.restrictDefault}

The restriction flags to be set by default.

The default flags prevent external hosts from using ntpd as a DDoS
reflector, setting system time, and querying OS/ntpd version. As
recommended in section 6.5.1.1.3, answer "No" of
https://support.ntp.org/Support/AccessRestrictions

*Type:* list of string

*Default:*

``` nix
[
  "limited"
  "kod"
  "nomodify"
  "notrap"
  "noquery"
  "nopeer"
]
```

*Declared by:* [`nixos/modules/services/networking/ntp/ntpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/ntpd.nix)

## `services.ntp.restrictSource` {#opt-services.ntp.restrictSource}

The restriction flags to be set on source.

The default flags allow peers to be added by ntpd from configured
pool(s), but not by other means.

*Type:* list of string

*Default:*

``` nix
[
  "limited"
  "kod"
  "nomodify"
  "notrap"
  "noquery"
]
```

*Declared by:* [`nixos/modules/services/networking/ntp/ntpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/ntpd.nix)

## `services.ntp.servers` {#opt-services.ntp.servers}

The set of NTP servers from which to synchronise.

*Type:* list of string

*Default:* `config.networking.timeServers`

*Declared by:* [`nixos/modules/services/networking/ntp/ntpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/ntpd.nix)

## `services.ntpd-rs.enable` {#opt-services.ntpd-rs.enable}

Whether to enable Network Time Service (ntpd-rs).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ntp/ntpd-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/ntpd-rs.nix)

## `services.ntpd-rs.metrics.enable` {#opt-services.ntpd-rs.metrics.enable}

Whether to enable ntpd-rs Prometheus Metrics Exporter.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ntp/ntpd-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/ntpd-rs.nix)

## `services.ntpd-rs.package` {#opt-services.ntpd-rs.package}

The ntpd-rs package to use.

*Type:* package

*Default:* `pkgs.ntpd-rs`

*Declared by:* [`nixos/modules/services/networking/ntp/ntpd-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/ntpd-rs.nix)

## `services.ntpd-rs.settings` {#opt-services.ntpd-rs.settings}

Settings to write to `ntp.toml`

See [https://docs.ntpd-rs.pendulum-project.org/latest/man/ntp.toml.5/](https://docs.ntpd-rs.pendulum-project.org/latest/man/ntp.toml.5/)
for more information about available options.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/ntp/ntpd-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/ntpd-rs.nix)

## `services.ntpd-rs.useNetworkingTimeServers` {#opt-services.ntpd-rs.useNetworkingTimeServers}

Use source time servers from `networking.timeServers` in config.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/ntp/ntpd-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/ntpd-rs.nix)

## `services.nullidentdmod.enable` {#opt-services.nullidentdmod.enable}

Whether to enable the nullidentdmod identd daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nullidentdmod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nullidentdmod.nix)

## `services.nullidentdmod.userid` {#opt-services.nullidentdmod.userid}

User ID to return. Set to null to return a random string each time.

*Type:* null or string

*Default:* `null`

*Example:* `"alice"`

*Declared by:* [`nixos/modules/services/networking/nullidentdmod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nullidentdmod.nix)

## `services.nullmailer.config.adminaddr` {#opt-services.nullmailer.config.adminaddr}

If set, all recipients to users at either "localhost" (the literal string)
or the canonical host name (from the me control attribute) are remapped to this address.
This is provided to allow local daemons to be able to send email to
"somebody@localhost" and have it go somewhere sensible instead of being  bounced
by your relay host. To send to multiple addresses,
put them all on one line separated by a comma.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/nullmailer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/nullmailer.nix)

## `services.nullmailer.config.allmailfrom` {#opt-services.nullmailer.config.allmailfrom}

If set, content will override the envelope sender on all messages.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/nullmailer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/nullmailer.nix)

## `services.nullmailer.config.defaultdomain` {#opt-services.nullmailer.config.defaultdomain}

The content of this attribute is appended to any host name that
does not contain a period (except localhost), including defaulthost
and idhost. Defaults to the value of the me attribute, if it exists,
otherwise the literal name defauldomain.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/nullmailer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/nullmailer.nix)

## `services.nullmailer.config.defaulthost` {#opt-services.nullmailer.config.defaulthost}

The content of this attribute is appended to any address that
is missing a host name. Defaults to the value of the me control
attribute, if it exists, otherwise the literal name defaulthost.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/nullmailer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/nullmailer.nix)

## `services.nullmailer.config.doublebounceto` {#opt-services.nullmailer.config.doublebounceto}

If the original sender was empty (the original message was a
delivery status or disposition notification), the double bounce
is sent to the address in this attribute.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/nullmailer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/nullmailer.nix)

## `services.nullmailer.config.helohost` {#opt-services.nullmailer.config.helohost}

Sets  the  environment variable $HELOHOST which is used by the
SMTP protocol module to set the parameter given to the HELO command.
Defaults to the value of the me configuration attribute.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/nullmailer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/nullmailer.nix)

## `services.nullmailer.config.idhost` {#opt-services.nullmailer.config.idhost}

The content of this attribute is used when building the message-id
string for the message. Defaults to the canonicalized value of defaulthost.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/nullmailer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/nullmailer.nix)

## `services.nullmailer.config.maxpause` {#opt-services.nullmailer.config.maxpause}

The maximum time to pause between successive queue runs, in seconds.
Defaults to 24 hours (86400).

*Type:* null or string or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/nullmailer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/nullmailer.nix)

## `services.nullmailer.config.me` {#opt-services.nullmailer.config.me}

The fully-qualifiled host name of the computer running nullmailer.
Defaults to the literal name me.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/nullmailer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/nullmailer.nix)

## `services.nullmailer.config.pausetime` {#opt-services.nullmailer.config.pausetime}

The minimum time to pause between successive queue runs when there
are messages in the queue, in seconds. Defaults to 1 minute (60).
Each time this timeout is reached, the timeout is doubled to a
maximum of maxpause. After new messages are injected, the timeout
is reset.  If this is set to 0, nullmailer-send will exit
immediately after going through the queue once (one-shot mode).

*Type:* null or string or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/nullmailer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/nullmailer.nix)

## `services.nullmailer.config.remotes` {#opt-services.nullmailer.config.remotes}

A list of remote servers to which to send each message. Each line
contains a remote host name or address followed by an optional
protocol string, separated by white space.

See `man 8 nullmailer-send` for syntax and available
options.

WARNING: This is stored world-readable in the nix store. If you need
to specify any secret credentials here, consider using the
`remotesFile` option instead.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/nullmailer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/nullmailer.nix)

## `services.nullmailer.config.sendtimeout` {#opt-services.nullmailer.config.sendtimeout}

The  time to wait for a remote module listed above to complete sending
a message before killing it and trying again, in seconds.
Defaults to 1 hour (3600).  If this is set to 0, nullmailer-send
will wait forever for messages to complete sending.

*Type:* null or string or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/nullmailer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/nullmailer.nix)

## `services.nullmailer.enable` {#opt-services.nullmailer.enable}

Whether to enable nullmailer daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/mail/nullmailer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/nullmailer.nix)

## `services.nullmailer.group` {#opt-services.nullmailer.group}

Group to use to run nullmailer-send.

*Type:* string

*Default:* `"nullmailer"`

*Declared by:* [`nixos/modules/services/mail/nullmailer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/nullmailer.nix)

## `services.nullmailer.remotesFile` {#opt-services.nullmailer.remotesFile}

Path to the `remotes` control file. This file contains a
list of remote servers to which to send each message.

See `man 8 nullmailer-send` for syntax and available
options.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/nullmailer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/nullmailer.nix)

## `services.nullmailer.setSendmail` {#opt-services.nullmailer.setSendmail}

Whether to set the system sendmail to nullmailer's.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/mail/nullmailer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/nullmailer.nix)

## `services.nullmailer.user` {#opt-services.nullmailer.user}

User to use to run nullmailer-send.

*Type:* string

*Default:* `"nullmailer"`

*Declared by:* [`nixos/modules/services/mail/nullmailer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/nullmailer.nix)

## `services.nvme-rs.enable` {#opt-services.nvme-rs.enable}

Whether to enable nvme-rs, a monitoring service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/system/nvme-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nvme-rs.nix)

## `services.nvme-rs.package` {#opt-services.nvme-rs.package}

The nvme-rs package to use.

*Type:* package

*Default:* `pkgs.nvme-rs`

*Declared by:* [`nixos/modules/services/system/nvme-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nvme-rs.nix)

## `services.nvme-rs.settings` {#opt-services.nvme-rs.settings}

Configuration for nvme-rs in TOML format.
See the config.toml example for all available options.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/system/nvme-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nvme-rs.nix)

## `services.nvme-rs.settings.check_interval_secs` {#opt-services.nvme-rs.settings.check_interval_secs}

Check interval in seconds

*Type:* signed integer

*Default:* `3600`

*Example:* `86400`

*Declared by:* [`nixos/modules/services/system/nvme-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nvme-rs.nix)

## `services.nvme-rs.settings.email` {#opt-services.nvme-rs.settings.email}

Email notification configuration

*Type:* null or (open submodule of (TOML value))

*Default:* `null`

*Declared by:* [`nixos/modules/services/system/nvme-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nvme-rs.nix)

## `services.nvme-rs.settings.email.from` {#opt-services.nvme-rs.settings.email.from}

Sender email address

*Type:* string

*Example:* `"nvme-monitor@example.com"`

*Declared by:* [`nixos/modules/services/system/nvme-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nvme-rs.nix)

## `services.nvme-rs.settings.email.smtp_password_file` {#opt-services.nvme-rs.settings.email.smtp_password_file}

File containing SMTP password

*Type:* absolute path

*Example:* `"/run/secrets/smtp-password"`

*Declared by:* [`nixos/modules/services/system/nvme-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nvme-rs.nix)

## `services.nvme-rs.settings.email.smtp_port` {#opt-services.nvme-rs.settings.email.smtp_port}

SMTP server port

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `587`

*Declared by:* [`nixos/modules/services/system/nvme-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nvme-rs.nix)

## `services.nvme-rs.settings.email.smtp_server` {#opt-services.nvme-rs.settings.email.smtp_server}

SMTP server address

*Type:* string

*Default:* `"smtp.gmail.com"`

*Example:* `"mail.example.com"`

*Declared by:* [`nixos/modules/services/system/nvme-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nvme-rs.nix)

## `services.nvme-rs.settings.email.smtp_username` {#opt-services.nvme-rs.settings.email.smtp_username}

SMTP username

*Type:* string

*Example:* `"your-email@gmail.com"`

*Declared by:* [`nixos/modules/services/system/nvme-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nvme-rs.nix)

## `services.nvme-rs.settings.email.to` {#opt-services.nvme-rs.settings.email.to}

Recipient email address

*Type:* string

*Example:* `"admin@example.com"`

*Declared by:* [`nixos/modules/services/system/nvme-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nvme-rs.nix)

## `services.nvme-rs.settings.email.use_tls` {#opt-services.nvme-rs.settings.email.use_tls}

Use TLS for SMTP connection

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/system/nvme-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nvme-rs.nix)

## `services.nvme-rs.settings.thresholds` {#opt-services.nvme-rs.settings.thresholds}

Threshold configuration for NVMe monitoring

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/system/nvme-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nvme-rs.nix)

## `services.nvme-rs.settings.thresholds.error_threshold` {#opt-services.nvme-rs.settings.thresholds.error_threshold}

Error count warning threshold

*Type:* signed integer

*Default:* `100`

*Declared by:* [`nixos/modules/services/system/nvme-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nvme-rs.nix)

## `services.nvme-rs.settings.thresholds.spare_warning` {#opt-services.nvme-rs.settings.thresholds.spare_warning}

Available spare warning threshold (%)

*Type:* signed integer

*Default:* `50`

*Declared by:* [`nixos/modules/services/system/nvme-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nvme-rs.nix)

## `services.nvme-rs.settings.thresholds.temp_critical` {#opt-services.nvme-rs.settings.thresholds.temp_critical}

Temperature critical threshold (°C)

*Type:* signed integer

*Default:* `65`

*Declared by:* [`nixos/modules/services/system/nvme-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nvme-rs.nix)

## `services.nvme-rs.settings.thresholds.temp_warning` {#opt-services.nvme-rs.settings.thresholds.temp_warning}

Temperature warning threshold (°C)

*Type:* signed integer

*Default:* `55`

*Declared by:* [`nixos/modules/services/system/nvme-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nvme-rs.nix)

## `services.nvme-rs.settings.thresholds.wear_critical` {#opt-services.nvme-rs.settings.thresholds.wear_critical}

Wear critical threshold (%)

*Type:* signed integer

*Default:* `50`

*Declared by:* [`nixos/modules/services/system/nvme-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nvme-rs.nix)

## `services.nvme-rs.settings.thresholds.wear_warning` {#opt-services.nvme-rs.settings.thresholds.wear_warning}

Wear warning threshold (%)

*Type:* signed integer

*Default:* `20`

*Declared by:* [`nixos/modules/services/system/nvme-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/nvme-rs.nix)

## `services.nylon.<name>.acceptInterface` {#opt-services.nylon._name_.acceptInterface}

Tell nylon which interface to listen for client requests on, default is "lo".

*Type:* string

*Default:* `"lo"`

*Declared by:* [`nixos/modules/services/networking/nylon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nylon.nix)

## `services.nylon.<name>.allowedIPRanges` {#opt-services.nylon._name_.allowedIPRanges}

Allowed client IP ranges are evaluated first, defaults to ARIN IPv4 private ranges:
\[ "192.168.0.0/16" "127.0.0.0/8" "172.16.0.0/12" "10.0.0.0/8" \]

*Type:* list of string

*Default:*

``` nix
[
  "192.168.0.0/16"
  "127.0.0.1/8"
  "172.16.0.1/12"
  "10.0.0.0/8"
]
```

*Declared by:* [`nixos/modules/services/networking/nylon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nylon.nix)

## `services.nylon.<name>.bindInterface` {#opt-services.nylon._name_.bindInterface}

Tell nylon which interface to use as an uplink, default is "enp3s0f0".

*Type:* string

*Default:* `"enp3s0f0"`

*Declared by:* [`nixos/modules/services/networking/nylon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nylon.nix)

## `services.nylon.<name>.deniedIPRanges` {#opt-services.nylon._name_.deniedIPRanges}

Denied client IP ranges, these gets evaluated after the allowed IP ranges, defaults to all IPv4 addresses:
\[ "0.0.0.0/0" \]
To block all other access than the allowed.

*Type:* list of string

*Default:*

``` nix
[
  "0.0.0.0/0"
]
```

*Declared by:* [`nixos/modules/services/networking/nylon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nylon.nix)

## `services.nylon.<name>.enable` {#opt-services.nylon._name_.enable}

Enables nylon as a running service upon activation.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nylon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nylon.nix)

## `services.nylon.<name>.logging` {#opt-services.nylon._name_.logging}

Enable logging, default is no logging.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nylon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nylon.nix)

## `services.nylon.<name>.name` {#opt-services.nylon._name_.name}

The name of this nylon instance.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/nylon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nylon.nix)

## `services.nylon.<name>.nrConnections` {#opt-services.nylon._name_.nrConnections}

The number of allowed simultaneous connections to the daemon, default 10.

*Type:* signed integer

*Default:* `10`

*Declared by:* [`nixos/modules/services/networking/nylon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nylon.nix)

## `services.nylon.<name>.port` {#opt-services.nylon._name_.port}

What port to listen for client requests, default is 1080.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1080`

*Declared by:* [`nixos/modules/services/networking/nylon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nylon.nix)

## `services.nylon.<name>.verbosity` {#opt-services.nylon._name_.verbosity}

Enable verbose output, default is to not be verbose.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nylon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nylon.nix)

## `services.nzbget.enable` {#opt-services.nzbget.enable}

Whether to enable NZBGet, for downloading files from news servers.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/nzbget.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nzbget.nix)

## `services.nzbget.group` {#opt-services.nzbget.group}

Group under which NZBGet runs

*Type:* string

*Default:* `"nzbget"`

*Declared by:* [`nixos/modules/services/misc/nzbget.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nzbget.nix)

## `services.nzbget.package` {#opt-services.nzbget.package}

The nzbget package to use.

*Type:* package

*Default:* `pkgs.nzbget`

*Declared by:* [`nixos/modules/services/misc/nzbget.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nzbget.nix)

## `services.nzbget.settings` {#opt-services.nzbget.settings}

NZBGet configuration, passed via command line using switch -o. Refer to
[https://github.com/nzbgetcom/nzbget/blob/develop/nzbget.conf](https://github.com/nzbgetcom/nzbget/blob/develop/nzbget.conf)
for details on supported values.

*Type:* attribute set of (boolean or signed integer or string)

*Default:* `{ }`

*Example:*

``` nix
{
  MainDir = "/data";
}
```

*Declared by:* [`nixos/modules/services/misc/nzbget.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nzbget.nix)

## `services.nzbget.user` {#opt-services.nzbget.user}

User account under which NZBGet runs

*Type:* string

*Default:* `"nzbget"`

*Declared by:* [`nixos/modules/services/misc/nzbget.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nzbget.nix)

## `services.nzbhydra2.dataDir` {#opt-services.nzbhydra2.dataDir}

The directory where NZBHydra2 stores its data files.

*Type:* string

*Default:* `"/var/lib/nzbhydra2"`

*Declared by:* [`nixos/modules/services/misc/nzbhydra2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nzbhydra2.nix)

## `services.nzbhydra2.enable` {#opt-services.nzbhydra2.enable}

Whether to enable NZBHydra2, Usenet meta search.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/nzbhydra2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nzbhydra2.nix)

## `services.nzbhydra2.openFirewall` {#opt-services.nzbhydra2.openFirewall}

Open ports in the firewall for the NZBHydra2 web interface.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/nzbhydra2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nzbhydra2.nix)

## `services.nzbhydra2.package` {#opt-services.nzbhydra2.package}

The nzbhydra2 package to use.

*Type:* package

*Default:* `pkgs.nzbhydra2`

*Declared by:* [`nixos/modules/services/misc/nzbhydra2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/nzbhydra2.nix)
