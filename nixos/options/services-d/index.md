# services (D) {#sec-options-services-d}

## `services.dae.assets` {#opt-services.dae.assets}

Assets required to run dae.

*Type:* list of absolute path

*Default:* `with pkgs; [ v2ray-geoip v2ray-domain-list-community ]`

*Declared by:* [`nixos/modules/services/networking/dae.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dae.nix)

## `services.dae.assetsPath` {#opt-services.dae.assetsPath}

The path which contains geolocation database.
This option will override `assets`.

*Type:* string

*Default:*

``` nix
(symlinkJoin {
    name = "dae-assets";
    paths = assets;
})/share/v2ray
```

*Declared by:* [`nixos/modules/services/networking/dae.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dae.nix)

## `services.dae.config` {#opt-services.dae.config}

WARNING: This option will expose store your config unencrypted world-readable in the nix store.
Config text for dae.

See [https://github.com/daeuniverse/dae/blob/main/example.dae](https://github.com/daeuniverse/dae/blob/main/example.dae).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/dae.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dae.nix)

## `services.dae.configFile` {#opt-services.dae.configFile}

The path of dae config file, end with `.dae`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/path/to/your/config.dae"`

*Declared by:* [`nixos/modules/services/networking/dae.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dae.nix)

## `services.dae.disableTxChecksumIpGeneric` {#opt-services.dae.disableTxChecksumIpGeneric}

See [https://github.com/daeuniverse/dae/issues/43](https://github.com/daeuniverse/dae/issues/43)

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/dae.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dae.nix)

## `services.dae.enable` {#opt-services.dae.enable}

Whether to enable dae, a Linux high-performance transparent proxy solution based on eBPF.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/dae.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dae.nix)

## `services.dae.openFirewall` {#opt-services.dae.openFirewall}

Open the firewall port.

*Type:* submodule

*Default:*

``` nix
{
  enable = true;
  port = 12345;
}
```

*Declared by:* [`nixos/modules/services/networking/dae.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dae.nix)

## `services.dae.openFirewall.enable` {#opt-services.dae.openFirewall.enable}

Whether to enable opening `port` in the firewall.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/dae.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dae.nix)

## `services.dae.openFirewall.port` {#opt-services.dae.openFirewall.port}

Port to be opened. Consist with field `tproxy_port` in config file.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/services/networking/dae.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dae.nix)

## `services.dae.package` {#opt-services.dae.package}

The dae package to use.

*Type:* package

*Default:* `pkgs.dae`

*Declared by:* [`nixos/modules/services/networking/dae.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dae.nix)

## `services.dante.config` {#opt-services.dante.config}

Contents of Dante's configuration file.
NOTE: user.privileged, user.unprivileged and logoutput are set by the service.

*Type:* strings concatenated with "\\n"

*Declared by:* [`nixos/modules/services/networking/dante.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dante.nix)

## `services.dante.enable` {#opt-services.dante.enable}

Whether to enable Dante SOCKS proxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/dante.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dante.nix)

## `services.darkhttpd.address` {#opt-services.darkhttpd.address}

Address to listen on.
Pass `all` to listen on all interfaces.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-servers/darkhttpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/darkhttpd.nix)

## `services.darkhttpd.enable` {#opt-services.darkhttpd.enable}

Whether to enable DarkHTTPd web server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/darkhttpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/darkhttpd.nix)

## `services.darkhttpd.extraArgs` {#opt-services.darkhttpd.extraArgs}

Additional configuration passed to the executable.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-servers/darkhttpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/darkhttpd.nix)

## `services.darkhttpd.hideServerId` {#opt-services.darkhttpd.hideServerId}

Don't identify the server type in headers or directory listings.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-servers/darkhttpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/darkhttpd.nix)

## `services.darkhttpd.port` {#opt-services.darkhttpd.port}

Port to listen on.
Pass 0 to let the system choose any free port for you.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `80`

*Declared by:* [`nixos/modules/services/web-servers/darkhttpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/darkhttpd.nix)

## `services.darkhttpd.rootDir` {#opt-services.darkhttpd.rootDir}

Path from which to serve files.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-servers/darkhttpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/darkhttpd.nix)

## `services.das_watchdog.enable` {#opt-services.das_watchdog.enable}

Whether to enable realtime watchdog.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/das_watchdog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/das_watchdog.nix)

## `services.dashy.enable` {#opt-services.dashy.enable}

Whether to enable Dashy, a highly customizable, easy to use, privacy-respecting dashboard app.

Note that this builds a static web app as opposed to running a full node server, unlike the default docker image.

Writing config changes to disk through the UI, triggering a rebuild through the UI and application status checks are
unavailable without the node server; Everything else will work fine.

See the deployment docs for [building from source](https://dashy.to/docs/deployment#build-from-source), [hosting with a CDN](https://dashy.to/docs/deployment#hosting-with-cdn) and [CDN cloud deploy](https://dashy.to/docs/deployment#cdn--cloud-deploy) for more information.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/dashy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dashy.nix)

## `services.dashy.finalDrv` {#opt-services.dashy.finalDrv}

Final derivation containing the fully built static files

*Type:* package

*Default:*

``` nix
''
  if cfg.settings != {}
  then cfg.package.override {inherit (cfg) settings;}
  else cfg.package;
''
```

*Read only*

*Declared by:* [`nixos/modules/services/web-apps/dashy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dashy.nix)

## `services.dashy.package` {#opt-services.dashy.package}

The dashy-ui package to use.

*Type:* package

*Default:* `pkgs.dashy-ui`

*Declared by:* [`nixos/modules/services/web-apps/dashy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dashy.nix)

## `services.dashy.settings` {#opt-services.dashy.settings}

Settings serialized into `user-data/conf.yml` before build.
If left empty, the default configuration shipped with the package will be used instead.

Note that the full configuration will be written to the nix store as world readable, which may include secrets such as [password hashes](https://dashy.to/docs/configuring#appconfigauthusers-optional).

To add files such as icons or backgrounds, you can reference them in line such as

``` nix
icon = "$\{./icon.png}";
```

This will add the file to the nix store upon build, referencing it by file path as expected by Dashy.

*Type:* JSON value

*Default:* `{ }`

*Example:*

``` nix
''
  {
    appConfig = {
      cssThemes = [
        "example-theme-1"
        "example-theme-2"
      ];
      enableFontAwesome = true;
      fontAwesomeKey = "e9076c7025";
      theme = "thebe";
    };
    pageInfo = {
      description = "My Awesome Dashboard";
      navLinks = [
        {
          path = "/";
          title = "Home";
        }
        {
          path = "https://example.com";
          title = "Example 1";
        }
        {
          path = "https://example.com";
          title = "Example 2";
        }
      ];
      title = "Dashy";
    };
    sections = [
      {
        displayData = {
          collapsed = true;
          cols = 2;
          customStyles = "border: 2px dashed red;";
          itemSize = "large";
        };
        items = [
          {
            backgroundColor = "#0079ff";
            color = "#00ffc9";
            description = "Source code and documentation on GitHub";
            icon = "fab fa-github";
            target = "sametab";
            title = "Source";
            url = "https://github.com/Lissy93/dashy";
          }
          {
            description = "View currently open issues, or raise a new one";
            icon = "fas fa-bug";
            title = "Issues";
            url = "https://github.com/Lissy93/dashy/issues";
          }
          {
            description = "Live Demo #1";
            icon = "fas fa-rocket";
            target = "iframe";
            title = "Demo 1";
            url = "https://dashy-demo-1.as93.net";
          }
          {
            description = "Live Demo #2";
            icon = "favicon";
            target = "newtab";
            title = "Demo 2";
            url = "https://dashy-demo-2.as93.net";
          }
        ];
        name = "Getting Started";
      }
    ];
  }
''
```

*Declared by:* [`nixos/modules/services/web-apps/dashy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dashy.nix)

## `services.dashy.virtualHost.domain` {#opt-services.dashy.virtualHost.domain}

Domain to use for the virtual host.

This can be used to change nginx options like

``` nix
services.nginx.virtualHosts."$\{config.services.dashy.virtualHost.domain}".listen = [ ... ]
```

or

``` nix
services.nginx.virtualHosts."example.com".listen = [ ... ]
```

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/dashy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dashy.nix)

## `services.dashy.virtualHost.enableNginx` {#opt-services.dashy.virtualHost.enableNginx}

Whether to enable a virtualhost to serve dashy through nginx.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/dashy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dashy.nix)

## `services.datadog-agent.apiKeyFile` {#opt-services.datadog-agent.apiKeyFile}

Path to a file containing the Datadog API key to associate the
agent with your account.

*Type:* absolute path

*Example:* `"/run/keys/datadog_api_key"`

*Declared by:* [`nixos/modules/services/monitoring/datadog-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/datadog-agent.nix)

## `services.datadog-agent.checks` {#opt-services.datadog-agent.checks}

Configuration for all Datadog checks. Keys of this attribute
set will be used as the name of the check to create the
appropriate configuration in `conf.d/$check.d/conf.yaml`.

The configuration is converted into JSON from the plain Nix
language configuration, meaning that you should write
configuration adhering to Datadog's documentation - but in Nix
language.

Refer to the implementation of this module (specifically the
definition of `defaultChecks`) for an example.

Note: The 'disk' and 'network' check are configured in
separate options because they exist by default. Attempting to
override their configuration here will have no effect.

*Type:* attribute set of (attribute set)

*Default:* `{ }`

*Example:*

``` nix
{
  http_check = {
    init_config = null;
    instances = [
      {
        name = "some-service";
        tags = [
          "some-service"
        ];
        url = "http://localhost:1337/healthz";
      }
    ];
  };
}
```

*Declared by:* [`nixos/modules/services/monitoring/datadog-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/datadog-agent.nix)

## `services.datadog-agent.ddUrl` {#opt-services.datadog-agent.ddUrl}

Custom dd\_url to configure the agent with. Useful if traffic to datadog
needs to go through a proxy.
Don't use this to point to another datadog site (EU) - use site instead.

*Type:* null or string

*Default:* `null`

*Example:* `"http://haproxy.example.com:3834"`

*Declared by:* [`nixos/modules/services/monitoring/datadog-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/datadog-agent.nix)

## `services.datadog-agent.diskCheck` {#opt-services.datadog-agent.diskCheck}

Disk check config

*Type:* attribute set

*Default:*

``` nix
{
  init_config = { };
  instances = [
    {
      use_mount = "false";
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/monitoring/datadog-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/datadog-agent.nix)

## `services.datadog-agent.enable` {#opt-services.datadog-agent.enable}

Whether to enable Datadog-agent v7 monitoring service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/datadog-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/datadog-agent.nix)

## `services.datadog-agent.enableLiveProcessCollection` {#opt-services.datadog-agent.enableLiveProcessCollection}

Whether to enable the live process collection agent.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/datadog-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/datadog-agent.nix)

## `services.datadog-agent.enableTraceAgent` {#opt-services.datadog-agent.enableTraceAgent}

Whether to enable the trace agent.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/datadog-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/datadog-agent.nix)

## `services.datadog-agent.extraConfig` {#opt-services.datadog-agent.extraConfig}

Extra configuration options that will be merged into the
main config file `datadog.yaml`.

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/datadog-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/datadog-agent.nix)

## `services.datadog-agent.extraIntegrations` {#opt-services.datadog-agent.extraIntegrations}

Extra integrations from the Datadog core-integrations
repository that should be built and included.

By default the included integrations are disk, mongo, network,
nginx and postgres.

To include additional integrations the name of the derivation
and a function to filter its dependencies from the Python
package set must be provided.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  ntp = pythonPackages: [ pythonPackages.ntplib ];
}
```

*Declared by:* [`nixos/modules/services/monitoring/datadog-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/datadog-agent.nix)

## `services.datadog-agent.hostname` {#opt-services.datadog-agent.hostname}

The hostname to show in the Datadog dashboard (optional)

*Type:* null or string

*Default:* `null`

*Example:* `"mymachine.mydomain"`

*Declared by:* [`nixos/modules/services/monitoring/datadog-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/datadog-agent.nix)

## `services.datadog-agent.logLevel` {#opt-services.datadog-agent.logLevel}

Logging verbosity.

*Type:* null or one of "DEBUG", "INFO", "WARN", "ERROR"

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/datadog-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/datadog-agent.nix)

## `services.datadog-agent.networkCheck` {#opt-services.datadog-agent.networkCheck}

Network check config

*Type:* attribute set

*Default:*

``` nix
{
  init_config = { };
  instances = [
    {
      collect_connection_state = false;
      excluded_interfaces = [
        "lo"
        "lo0"
      ];
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/monitoring/datadog-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/datadog-agent.nix)

## `services.datadog-agent.package` {#opt-services.datadog-agent.package}

The datadog-agent package to use. ::: {.note}
The provided package is expected to have an overridable `pythonPackages`-attribute
which configures the Python environment with the Datadog checks.
:::

*Type:* package

*Default:* `pkgs.datadog-agent`

*Declared by:* [`nixos/modules/services/monitoring/datadog-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/datadog-agent.nix)

## `services.datadog-agent.processAgentPackage` {#opt-services.datadog-agent.processAgentPackage}

Which DataDog v7 agent package to use. Note that the provided
package is expected to have an overridable `pythonPackages`-attribute
which configures the Python environment with the Datadog
checks.

*Type:* package

*Default:* `pkgs.datadog-process-agent`

*Declared by:* [`nixos/modules/services/monitoring/datadog-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/datadog-agent.nix)

## `services.datadog-agent.site` {#opt-services.datadog-agent.site}

The datadog site to point the agent towards.
Set to datadoghq.eu to point it to their EU site.

*Type:* null or string

*Default:* `null`

*Example:* `"datadoghq.eu"`

*Declared by:* [`nixos/modules/services/monitoring/datadog-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/datadog-agent.nix)

## `services.datadog-agent.tags` {#opt-services.datadog-agent.tags}

The tags to mark this Datadog agent

*Type:* null or (list of string)

*Default:* `null`

*Example:*

``` nix
[
  "test"
  "service"
]
```

*Declared by:* [`nixos/modules/services/monitoring/datadog-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/datadog-agent.nix)

## `services.davfs2.davGroup` {#opt-services.davfs2.davGroup}

The group of the running mount.davfs daemon. Ordinary users must be
member of this group in order to mount a davfs2 file system. Value must
be given as name, not as numerical id.

*Type:* string

*Default:* `"davfs2"`

*Declared by:* [`nixos/modules/services/network-filesystems/davfs2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/davfs2.nix)

## `services.davfs2.davUser` {#opt-services.davfs2.davUser}

When invoked by root the mount.davfs daemon will run as this user.
Value must be given as name, not as numerical id.

*Type:* string

*Default:* `"davfs2"`

*Declared by:* [`nixos/modules/services/network-filesystems/davfs2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/davfs2.nix)

## `services.davfs2.enable` {#opt-services.davfs2.enable}

Whether to enable davfs2.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/davfs2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/davfs2.nix)

## `services.davfs2.settings` {#opt-services.davfs2.settings}

Extra settings appended to the configuration of davfs2.
See `davfs2.conf(5)` for available settings.

*Type:* open submodule of attribute set of attribute set of (boolean or signed integer or string or attribute set of (boolean or signed integer or string))

*Default:* `{ }`

*Example:*

``` nix
{
  globalSection = {
    proxy = "foo.bar:8080";
    use_locks = false;
  };
  sections = {
    "/media/dav" = {
      use_locks = true;
    };
    "/home/otto/mywebspace" = {
      gui_optimize = true;
    };
  };
}
```

*Declared by:* [`nixos/modules/services/network-filesystems/davfs2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/davfs2.nix)

## `services.davis.adminLogin` {#opt-services.davis.adminLogin}

Username for the admin account.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.adminPasswordFile` {#opt-services.davis.adminPasswordFile}

The full path to a file that contains the admin's password. Must be
readable by the user.

*Type:* absolute path

*Example:* `"/run/secrets/davis-admin-pass"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.appSecretFile` {#opt-services.davis.appSecretFile}

A file containing the Symfony APP\_SECRET - Its value should be a series
of characters, numbers and symbols chosen randomly and the recommended
length is around 32 characters. Can be generated with <code>cat
/dev/urandom | tr -dc a-zA-Z0-9 | fold -w 48 | head -n 1</code>.

*Type:* absolute path

*Example:* `"/run/secrets/davis-appsecret"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.config` {#opt-services.davis.config}

*Type:* attribute set of (null or boolean or signed integer or 16 bit unsigned integer; between 0 and 65535 (both inclusive) or absolute path or string or (submodule))

*Default:* `{ }`

*Example:* `""`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.dataDir` {#opt-services.davis.dataDir}

Davis data directory.

*Type:* absolute path

*Default:* `"/var/lib/davis"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.database.createLocally` {#opt-services.davis.database.createLocally}

Create the database and database user locally.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.database.driver` {#opt-services.davis.database.driver}

Database type, required in all circumstances.

*Type:* one of "sqlite", "postgresql", "mysql"

*Default:* `"sqlite"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.database.name` {#opt-services.davis.database.name}

Database name, only used when the database is created locally.

*Type:* null or string

*Default:* `"davis"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.database.urlFile` {#opt-services.davis.database.urlFile}

A file containing the database connection url. If set then it
overrides all other database settings (except driver). This is
mandatory if you want to use an external database, that is when
`services.davis.database.createLocally` is `false`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/davis-db-url"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.enable` {#opt-services.davis.enable}

Whether to enable Davis is a caldav and carddav server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.group` {#opt-services.davis.group}

Group davis runs as.

*Type:* string

*Default:* `"davis"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.hostname` {#opt-services.davis.hostname}

Domain of the host to serve davis under. You may want to change it if you
run Davis on a different URL than davis.yourdomain.

*Type:* string

*Example:* `"davis.yourdomain.org"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.mail.dsn` {#opt-services.davis.mail.dsn}

Mail DSN for sending emails. Mutually exclusive with `services.davis.mail.dsnFile`.

*Type:* null or string

*Default:* `null`

*Example:* `"smtp://username:password@example.com:25"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.mail.dsnFile` {#opt-services.davis.mail.dsnFile}

A file containing the mail DSN for sending emails.  Mutually exclusive with `servies.davis.mail.dsn`.

*Type:* null or string

*Default:* `null`

*Example:* `"/run/secrets/davis-mail-dsn"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.mail.inviteFromAddress` {#opt-services.davis.mail.inviteFromAddress}

Email address to send invitations from.

*Type:* null or string

*Default:* `null`

*Example:* `"no-reply@dav.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx` {#opt-services.davis.nginx}

Use this option to customize an nginx virtual host. To disable the nginx set this to null.

*Type:* null or (submodule)

*Default:* `{ }`

*Example:*

``` nix
''
  {
    serverAliases = [
      "dav.''${config.networking.domain}"
    ];
    # To enable encryption and let let's encrypt take care of certificate
    forceSSL = true;
    enableACME = true;
  }
''
```

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.acmeFallbackHost` {#opt-services.davis.nginx.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.acmeRoot` {#opt-services.davis.nginx.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.addSSL` {#opt-services.davis.nginx.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.basicAuth` {#opt-services.davis.nginx.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.basicAuthFile` {#opt-services.davis.nginx.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.default` {#opt-services.davis.nginx.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.enableACME` {#opt-services.davis.nginx.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.extraConfig` {#opt-services.davis.nginx.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.forceSSL` {#opt-services.davis.nginx.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.globalRedirect` {#opt-services.davis.nginx.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.http2` {#opt-services.davis.nginx.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.http3` {#opt-services.davis.nginx.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.http3_hq` {#opt-services.davis.nginx.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.kTLS` {#opt-services.davis.nginx.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.listen` {#opt-services.davis.nginx.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.listen.*.addr` {#opt-services.davis.nginx.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.listen.*.extraParameters` {#opt-services.davis.nginx.listen._.extraParameters}

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

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.listen.*.port` {#opt-services.davis.nginx.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.listen.*.proxyProtocol` {#opt-services.davis.nginx.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.listen.*.ssl` {#opt-services.davis.nginx.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.listenAddresses` {#opt-services.davis.nginx.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.locations` {#opt-services.davis.nginx.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.locations.<name>.alias` {#opt-services.davis.nginx.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.locations.<name>.basicAuth` {#opt-services.davis.nginx.locations._name_.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.locations.<name>.basicAuthFile` {#opt-services.davis.nginx.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.locations.<name>.extraConfig` {#opt-services.davis.nginx.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.locations.<name>.fastcgiParams` {#opt-services.davis.nginx.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.locations.<name>.index` {#opt-services.davis.nginx.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.locations.<name>.priority` {#opt-services.davis.nginx.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.locations.<name>.proxyPass` {#opt-services.davis.nginx.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.locations.<name>.proxyWebsockets` {#opt-services.davis.nginx.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.locations.<name>.recommendedProxySettings` {#opt-services.davis.nginx.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.locations.<name>.recommendedUwsgiSettings` {#opt-services.davis.nginx.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.locations.<name>.return` {#opt-services.davis.nginx.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.locations.<name>.root` {#opt-services.davis.nginx.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.locations.<name>.tryFiles` {#opt-services.davis.nginx.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.locations.<name>.useGrpcErrorPages` {#opt-services.davis.nginx.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.locations.<name>.uwsgiPass` {#opt-services.davis.nginx.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.onlySSL` {#opt-services.davis.nginx.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.quic` {#opt-services.davis.nginx.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.redirectCode` {#opt-services.davis.nginx.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.rejectSSL` {#opt-services.davis.nginx.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.reuseport` {#opt-services.davis.nginx.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.root` {#opt-services.davis.nginx.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.serverAliases` {#opt-services.davis.nginx.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.serverName` {#opt-services.davis.nginx.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.sslCertificate` {#opt-services.davis.nginx.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.sslCertificateKey` {#opt-services.davis.nginx.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.sslTrustedCertificate` {#opt-services.davis.nginx.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.nginx.useACMEHost` {#opt-services.davis.nginx.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.package` {#opt-services.davis.package}

The davis package to use.

*Type:* package

*Default:* `pkgs.davis`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.poolConfig` {#opt-services.davis.poolConfig}

Options for the davis PHP pool. See the documentation on <literal>php-fpm.conf</literal>
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

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davis.user` {#opt-services.davis.user}

User davis runs as.

*Type:* string

*Default:* `"davis"`

*Declared by:* [`nixos/modules/services/web-apps/davis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/davis.nix)

## `services.davmail.config` {#opt-services.davmail.config}

Davmail configuration. Refer to
[http://davmail.sourceforge.net/serversetup.html](http://davmail.sourceforge.net/serversetup.html)
and [http://davmail.sourceforge.net/advanced.html](http://davmail.sourceforge.net/advanced.html)
for details on supported values.

*Type:* davmail config type (str, int, bool or attribute set thereof)

*Default:* `{ }`

*Example:*

``` nix
{
  davmail.allowRemote = true;
  davmail.imapPort = 55555;
  davmail.bindAddress = "10.0.1.2";
  davmail.smtpSaveInSent = true;
  davmail.folderSizeLimit = 10;
  davmail.caldavAutoSchedule = false;
  log4j.logger.rootLogger = "DEBUG";
}
```

*Declared by:* [`nixos/modules/services/mail/davmail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/davmail.nix)

## `services.davmail.enable` {#opt-services.davmail.enable}

Whether to enable davmail, an MS Exchange gateway.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/davmail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/davmail.nix)

## `services.davmail.url` {#opt-services.davmail.url}

Outlook Web Access URL to access the exchange server, i.e. the base webmail URL.

*Type:* string

*Example:* `"https://outlook.office365.com/EWS/Exchange.asmx"`

*Declared by:* [`nixos/modules/services/mail/davmail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/davmail.nix)

## `services.dawarich.archiveEncryptionKeyFile` {#opt-services.dawarich.archiveEncryptionKeyFile}

Path to file containing the archive encryption key.
A new encryption key can be generated by running:

`nix build -f '<nixpkgs>' dawarich; cd result; bin/bundle exec rails secret`

This file is loaded using systemd credentials, and therefore does not need to be
owned by the dawarich user.

If this option is null, it will be created at /var/lib/dawarich/secrets/archive-encryption-key:

- for `system.stateVersion` \< 27.05: it will copy secret key base, to be able to decrypt old archives;
- for `system.stateVersion` \>= 27.05: a new encryption key is generated.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.automaticMigrations` {#opt-services.dawarich.automaticMigrations}

Whether to perform database migrations automatically

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.configureNginx` {#opt-services.dawarich.configureNginx}

Configure nginx as a reverse proxy for dawarich.
Alternatively you can configure a reverse-proxy of your choice to serve these paths:

`/ -> ${pkgs.dawarich}/public`

`/ -> 127.0.0.1:{{ webPort }}` or `/ -> unix:{{ unixSocket }}` (If there was no file in the directory above.)

Make sure that websockets are forwarded properly. You might want to set up caching
of some requests. Take a look at dawarich's provided reverse proxy configurations at
`https://dawarich.app/docs/tutorials/reverse-proxy`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.database.createLocally` {#opt-services.dawarich.database.createLocally}

Whether to configure a local PostgreSQL server and database for Dawarich.
The connection is performed via Unix sockets.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.database.host` {#opt-services.dawarich.database.host}

Hostname or address of the postgresql server. If an absolute path is given here, it will be interpreted as a unix socket path.

*Type:* string

*Default:* `"/run/postgresql"`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.database.name` {#opt-services.dawarich.database.name}

The name of the dawarich database.

*Type:* string

*Default:* `"dawarich"`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.database.passwordFile` {#opt-services.dawarich.database.passwordFile}

A file containing the password corresponding to [`services.dawarich.database.user`](#opt-services.dawarich.database.user).

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/dawarich-db-password"`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.database.port` {#opt-services.dawarich.database.port}

Port of the postgresql server.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5432`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.database.user` {#opt-services.dawarich.database.user}

The database user for dawarich.

*Type:* string

*Default:* `"dawarich"`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.enable` {#opt-services.dawarich.enable}

Whether to enable Dawarich, a self-hostable alternative to Google Location History.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.environment` {#opt-services.dawarich.environment}

Extra environment variables to pass to all dawarich services.

*Type:* attribute set of (null or string or absolute path or package)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.extraEnvFiles` {#opt-services.dawarich.extraEnvFiles}

Extra environment files to pass to all Dawarich services. Useful for passing down environment secrets.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/etc/dawarich/secret.env"
]
```

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.group` {#opt-services.dawarich.group}

Group under which dawarich runs.

*Type:* string

*Default:* `"dawarich"`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.localDomain` {#opt-services.dawarich.localDomain}

The domain serving your Dawarich instance.

*Type:* string

*Example:* `"dawarich.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.package` {#opt-services.dawarich.package}

The dawarich package to use.

*Type:* package

*Default:* `pkgs.dawarich`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.redis.createLocally` {#opt-services.dawarich.redis.createLocally}

Whether to configure a local Redis server for Dawarich.
The connection is performed via Unix sockets by default,
but that can be changed by configuring [`services.dawarich.redis.host`](#opt-services.dawarich.redis.host) and [`services.dawarich.redis.port`](#opt-services.dawarich.redis.port).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.redis.host` {#opt-services.dawarich.redis.host}

The redis host Dawarich will connect to.

*Type:* string

*Default:* `config.services.redis.servers.dawarich.unixSocket`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.redis.port` {#opt-services.dawarich.redis.port}

The port of the redis server Dawarich will connect to. Set to zero to disable TCP and use Unix sockets instead.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `0`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.secretKeyBaseFile` {#opt-services.dawarich.secretKeyBaseFile}

Path to file containing the secret key base.
A new secret key base can be generated by running:

`nix build -f '<nixpkgs>' dawarich; cd result; bin/bundle exec rails secret`

This file is loaded using systemd credentials, and therefore does not need to be
owned by the dawarich user.

If this option is null, it will be created at /var/lib/dawarich/secrets/secret-key-base
with a new secret key base.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.sidekiqProcesses` {#opt-services.dawarich.sidekiqProcesses}

How many Sidekiq processes should be used to handle background jobs, and which job classes they handle.
Can be used to [speed up](https://dawarich.app/docs/FAQ/#how-to-speed-up-the-import-process) the import process.

*Type:* attribute set of (submodule)

*Default:*

``` nix
{
  all = {
    jobClasses = [ ];
    threads = null;
  };
}
```

*Example:*

``` nix
{
  all = {
    jobClasses = [ ];
    threads = null;
  };
  geocoding = {
    jobClasses = [
      "reverse_geocoding"
    ];
    threads = 10;
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.sidekiqProcesses.<name>.jobClasses` {#opt-services.dawarich.sidekiqProcesses._name_.jobClasses}

If not empty, which job classes should be executed by this process.
*If left empty, all job classes will be executed by this process.*

*Type:* list of (one of "achievements", "app\_version\_checking", "archival", "cache", "data\_migrations", "default", "digests", "exports", "extractions", "families", "highest\_priority", "imports", "low\_priority", "mailers", "places", "points", "posters", "reverse\_geocoding", "route\_videos", "stats", "tracks", "trips", "visit\_suggesting", "webhooks")

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.sidekiqProcesses.<name>.threads` {#opt-services.dawarich.sidekiqProcesses._name_.threads}

Number of threads this process should use for executing jobs.
If null, the configured `sidekiqThreads` are used.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.sidekiqThreads` {#opt-services.dawarich.sidekiqThreads}

Worker threads used by the dawarich-sidekiq-all service.
If `sidekiqProcesses` is configured and any processes specify null `threads`, this value is used.

*Type:* signed integer

*Default:* `3`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.smtp.fromAddress` {#opt-services.dawarich.smtp.fromAddress}

"From" address used when sending emails to users.

*Type:* null or string

*Default:* `null`

*Example:* `"dawarich@example.com"`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.smtp.host` {#opt-services.dawarich.smtp.host}

SMTP host used when sending emails to users.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.smtp.passwordFile` {#opt-services.dawarich.smtp.passwordFile}

Path to file containing the SMTP password.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/dawarich-smtp-password"`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.smtp.port` {#opt-services.dawarich.smtp.port}

SMTP port used when sending emails to users.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `25`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.smtp.user` {#opt-services.dawarich.smtp.user}

SMTP login name.

*Type:* null or string

*Default:* `null`

*Example:* `"dawarich@example.com"`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.unixSocket` {#opt-services.dawarich.unixSocket}

Unix socket the dawarich web service listens on. Set to `null` to not listen on a Unix socket.
It can be used together with [`services.dawarich.webPort`](#opt-services.dawarich.webPort), nginx prefers the Unix socket.

The socket is owned by [`services.dawarich.user`](#opt-services.dawarich.user) and, if [`services.dawarich.configureNginx`](#opt-services.dawarich.configureNginx)
is enabled, the nginx group. Set `SocketUser`, `SocketGroup` and `SocketMode` in
`systemd.sockets.dawarich-web.socketConfig` to change its ownership and mode.

*Type:* null or absolute path

*Default:* `if config.services.dawarich.configureNginx then "/run/dawarich/web.sock" else null`

*Example:* `"/run/dawarich/web.sock"`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.user` {#opt-services.dawarich.user}

User under which dawarich runs. If it is set to "dawarich",
that user will be created, otherwise it should be set to the
name of a user created elsewhere.

*Type:* string

*Default:* `"dawarich"`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.dawarich.webPort` {#opt-services.dawarich.webPort}

TCP port the dawarich web service listens on, on all IPv4 addresses.
Set to `null` to not listen on TCP.

Additional addresses can be added to `systemd.sockets.dawarich-web.listenStreams`.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `if config.services.dawarich.unixSocket == null then 3000 else null`

*Declared by:* [`nixos/modules/services/web-apps/dawarich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dawarich.nix)

## `services.db-rest.enable` {#opt-services.db-rest.enable}

Whether to enable db-rest service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/db-rest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/db-rest.nix)

## `services.db-rest.group` {#opt-services.db-rest.group}

Group under which db-rest runs.

*Type:* string

*Default:* `"db-rest"`

*Declared by:* [`nixos/modules/services/misc/db-rest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/db-rest.nix)

## `services.db-rest.host` {#opt-services.db-rest.host}

The host address the db-rest server should listen on.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/misc/db-rest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/db-rest.nix)

## `services.db-rest.package` {#opt-services.db-rest.package}

The db-rest package to use.

*Type:* package

*Default:* `pkgs.db-rest`

*Declared by:* [`nixos/modules/services/misc/db-rest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/db-rest.nix)

## `services.db-rest.port` {#opt-services.db-rest.port}

The port the db-rest server should listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/misc/db-rest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/db-rest.nix)

## `services.db-rest.redis.createLocally` {#opt-services.db-rest.redis.createLocally}

Configure a local redis server for db-rest.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/db-rest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/db-rest.nix)

## `services.db-rest.redis.enable` {#opt-services.db-rest.redis.enable}

Enable caching with redis for db-rest.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/db-rest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/db-rest.nix)

## `services.db-rest.redis.host` {#opt-services.db-rest.redis.host}

Redis host.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/db-rest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/db-rest.nix)

## `services.db-rest.redis.passwordFile` {#opt-services.db-rest.redis.passwordFile}

Path to a file containing the redis password.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/db-rest/pasword-redis-db"`

*Declared by:* [`nixos/modules/services/misc/db-rest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/db-rest.nix)

## `services.db-rest.redis.port` {#opt-services.db-rest.redis.port}

Redis port.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/db-rest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/db-rest.nix)

## `services.db-rest.redis.useSSL` {#opt-services.db-rest.redis.useSSL}

Use SSL if using a redis network connection.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/db-rest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/db-rest.nix)

## `services.db-rest.redis.user` {#opt-services.db-rest.redis.user}

Optional username used for authentication with redis.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/db-rest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/db-rest.nix)

## `services.db-rest.user` {#opt-services.db-rest.user}

User account under which db-rest runs.

*Type:* string

*Default:* `"db-rest"`

*Declared by:* [`nixos/modules/services/misc/db-rest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/db-rest.nix)

## `services.dbus.apparmor` {#opt-services.dbus.apparmor}

AppArmor mode for dbus.

`enabled` enables mediation when it's
supported in the kernel, `disabled`
always disables AppArmor even with kernel support, and
`required` fails when AppArmor was not found
in the kernel.

*Type:* one of "enabled", "disabled", "required"

*Default:* `"disabled"`

*Declared by:* [`nixos/modules/services/system/dbus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/dbus.nix)

## `services.dbus.brokerPackage` {#opt-services.dbus.brokerPackage}

The dbus-broker package to use.

*Type:* package

*Default:* `pkgs.dbus-broker`

*Declared by:* [`nixos/modules/services/system/dbus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/dbus.nix)

## `services.dbus.dbusPackage` {#opt-services.dbus.dbusPackage}

The dbus package to use.

*Type:* package

*Default:* `pkgs.dbus`

*Declared by:* [`nixos/modules/services/system/dbus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/dbus.nix)

## `services.dbus.implementation` {#opt-services.dbus.implementation}

The implementation to use for the message bus defined by the D-Bus specification.
Can be either the classic dbus daemon or dbus-broker, which aims to provide high
performance and reliability, while keeping compatibility to the D-Bus
reference implementation.

*Type:* one of "dbus", "broker"

*Default:* `"broker"`

*Declared by:* [`nixos/modules/services/system/dbus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/dbus.nix)

## `services.dbus.packages` {#opt-services.dbus.packages}

Packages whose D-Bus configuration files should be included in
the configuration of the D-Bus system-wide or session-wide
message bus.  Specifically, files in the following directories
will be included into their respective DBus configuration paths:
`«pkg»/etc/dbus-1/system.d`
`«pkg»/share/dbus-1/system.d`
`«pkg»/share/dbus-1/system-services`
`«pkg»/etc/dbus-1/session.d`
`«pkg»/share/dbus-1/session.d`
`«pkg»/share/dbus-1/services`

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/system/dbus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/dbus.nix)

## `services.ddccontrol.enable` {#opt-services.ddccontrol.enable}

Whether to enable ddccontrol for controlling displays.

This [enables `hardware.i2c`](../../options/hardware/index.md#opt-hardware.i2c.enable), so note to add
yourself to [`hardware.i2c.group`](../../options/hardware/index.md#opt-hardware.i2c.group).
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/ddccontrol.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/ddccontrol.nix)

## `services.ddccontrol.package` {#opt-services.ddccontrol.package}

The package with which to control brightness; added also to [services.dbus.packages](#opt-services.dbus.packages). package to use.

*Type:* package

*Default:* `pkgs.ddccontrol`

*Example:* `pkgs.ddcutil-service`

*Declared by:* [`nixos/modules/services/hardware/ddccontrol.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/ddccontrol.nix)

## `services.ddclient.configFile` {#opt-services.ddclient.configFile}

Path to configuration file.
When set this overrides the generated configuration from module options.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/root/nixos/secrets/ddclient.conf"`

*Declared by:* [`nixos/modules/services/networking/ddclient.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ddclient.nix)

## `services.ddclient.domains` {#opt-services.ddclient.domains}

Domain name(s) to synchronize.

*Type:* list of string

*Default:*

``` nix
[
  ""
]
```

*Declared by:* [`nixos/modules/services/networking/ddclient.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ddclient.nix)

## `services.ddclient.enable` {#opt-services.ddclient.enable}

Whether to synchronise your machine's IP address with a dynamic DNS provider (e.g. dyndns.org).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ddclient.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ddclient.nix)

## `services.ddclient.extraConfig` {#opt-services.ddclient.extraConfig}

Extra configuration. Contents will be added verbatim to the configuration file.

::: note
`daemon` should not be added here because it does not work great with the systemd-timer approach the service uses.
:::

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/ddclient.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ddclient.nix)

## `services.ddclient.interval` {#opt-services.ddclient.interval}

The interval at which to run the check and update.
See `man 7 systemd.time` for the format.

*Type:* string

*Default:* `"10min"`

*Declared by:* [`nixos/modules/services/networking/ddclient.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ddclient.nix)

## `services.ddclient.package` {#opt-services.ddclient.package}

The ddclient executable package run by the service.

*Type:* package

*Default:* `pkgs.ddclient`

*Declared by:* [`nixos/modules/services/networking/ddclient.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ddclient.nix)

## `services.ddclient.passwordFile` {#opt-services.ddclient.passwordFile}

A file containing the password or a TSIG key in named format when using the nsupdate protocol.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ddclient.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ddclient.nix)

## `services.ddclient.protocol` {#opt-services.ddclient.protocol}

Protocol to use with dynamic DNS provider (see [https://ddclient.net/protocols.html](https://ddclient.net/protocols.html) ).

*Type:* string

*Default:* `"dyndns2"`

*Declared by:* [`nixos/modules/services/networking/ddclient.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ddclient.nix)

## `services.ddclient.quiet` {#opt-services.ddclient.quiet}

Print no messages for unnecessary updates.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ddclient.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ddclient.nix)

## `services.ddclient.script` {#opt-services.ddclient.script}

script as required by some providers.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/ddclient.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ddclient.nix)

## `services.ddclient.secretsFile` {#opt-services.ddclient.secretsFile}

A file containing the secrets for the dynamic DNS provider.
This file should contain lines of valid secrets in the format specified by the ddclient documentation.
If this option is set, it overrides the `passwordFile` option.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ddclient.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ddclient.nix)

## `services.ddclient.server` {#opt-services.ddclient.server}

Server address.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/ddclient.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ddclient.nix)

## `services.ddclient.ssl` {#opt-services.ddclient.ssl}

Whether to use SSL/TLS to connect to dynamic DNS provider.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/ddclient.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ddclient.nix)

## `services.ddclient.use` {#opt-services.ddclient.use}

Method to determine the IP address to send to the dynamic DNS provider.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/ddclient.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ddclient.nix)

## `services.ddclient.username` {#opt-services.ddclient.username}

User name.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/ddclient.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ddclient.nix)

## `services.ddclient.usev4` {#opt-services.ddclient.usev4}

Method to determine the IPv4 address to send to the dynamic DNS provider. Only used if `use` is not set.

*Type:* string

*Default:* `"webv4, webv4=ipify-ipv4"`

*Declared by:* [`nixos/modules/services/networking/ddclient.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ddclient.nix)

## `services.ddclient.usev6` {#opt-services.ddclient.usev6}

Method to determine the IPv6 address to send to the dynamic DNS provider. Only used if `use` is not set.

*Type:* string

*Default:* `"webv6, webv6=ipify-ipv6"`

*Declared by:* [`nixos/modules/services/networking/ddclient.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ddclient.nix)

## `services.ddclient.verbose` {#opt-services.ddclient.verbose}

Print verbose information.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ddclient.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ddclient.nix)

## `services.ddclient.zone` {#opt-services.ddclient.zone}

zone as required by some providers.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/ddclient.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ddclient.nix)

## `services.ddns-updater.enable` {#opt-services.ddns-updater.enable}

Whether to enable Container to update DNS records periodically with WebUI for many DNS providers.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ddns-updater.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ddns-updater.nix)

## `services.ddns-updater.environment` {#opt-services.ddns-updater.environment}

Environment variables to be set for the ddns-updater service. DATADIR is ignored to enable using systemd DynamicUser. For full list see [https://github.com/qdm12/ddns-updater](https://github.com/qdm12/ddns-updater)

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/ddns-updater.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ddns-updater.nix)

## `services.ddns-updater.package` {#opt-services.ddns-updater.package}

The ddns-updater package to use.

*Type:* package

*Default:* `pkgs.ddns-updater`

*Declared by:* [`nixos/modules/services/networking/ddns-updater.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ddns-updater.nix)

## `services.deconz.allowRebootSystem` {#opt-services.deconz.allowRebootSystem}

Whether to enable rebooting the system.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/deconz.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/deconz.nix)

## `services.deconz.allowRestartService` {#opt-services.deconz.allowRestartService}

Whether to enable killing/restarting processes.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/deconz.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/deconz.nix)

## `services.deconz.allowSetSystemTime` {#opt-services.deconz.allowSetSystemTime}

Whether to enable setting the system time.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/deconz.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/deconz.nix)

## `services.deconz.device` {#opt-services.deconz.device}

Force deCONZ to use a specific USB device (e.g. /dev/ttyACM0). By
default it does a search.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/deconz.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/deconz.nix)

## `services.deconz.enable` {#opt-services.deconz.enable}

Whether to enable deCONZ, a Zigbee gateway for use with ConBee/RaspBee hardware (https://phoscon.de/).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/deconz.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/deconz.nix)

## `services.deconz.extraArgs` {#opt-services.deconz.extraArgs}

Extra command line arguments for deCONZ, see
[https://github.com/dresden-elektronik/deconz-rest-plugin/wiki/deCONZ-command-line-parameters](https://github.com/dresden-elektronik/deconz-rest-plugin/wiki/deCONZ-command-line-parameters).

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--dbg-info=1"
  "--dbg-err=2"
]
```

*Declared by:* [`nixos/modules/services/networking/deconz.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/deconz.nix)

## `services.deconz.httpPort` {#opt-services.deconz.httpPort}

TCP port for the web server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `80`

*Declared by:* [`nixos/modules/services/networking/deconz.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/deconz.nix)

## `services.deconz.listenAddress` {#opt-services.deconz.listenAddress}

Pin deCONZ to the network interface specified through the provided IP
address. This applies for the webserver as well as the websocket
notifications.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/deconz.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/deconz.nix)

## `services.deconz.openFirewall` {#opt-services.deconz.openFirewall}

Whether to enable opening up the service ports in the firewall.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/deconz.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/deconz.nix)

## `services.deconz.package` {#opt-services.deconz.package}

The deconz package to use.

*Type:* package

*Default:* `pkgs.deconz`

*Declared by:* [`nixos/modules/services/networking/deconz.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/deconz.nix)

## `services.deconz.wsPort` {#opt-services.deconz.wsPort}

TCP port for the WebSocket.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `443`

*Declared by:* [`nixos/modules/services/networking/deconz.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/deconz.nix)

## `services.deluge.authFile` {#opt-services.deluge.authFile}

The file managing the authentication for deluge, the format of this
file is straightforward, each line contains a
username:password:level tuple in plaintext. It only has an effect
when [`services.deluge.declarative`](#opt-services.deluge.declarative) is set to
`true`.
See [https://dev.deluge-torrent.org/wiki/UserGuide/Authentication](https://dev.deluge-torrent.org/wiki/UserGuide/Authentication) for
more information.

*Type:* absolute path

*Example:* `"/run/keys/deluge-auth"`

*Declared by:* [`nixos/modules/services/torrent/deluge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/deluge.nix)

## `services.deluge.config` {#opt-services.deluge.config}

Deluge core configuration for the core.conf file. Only has an effect
when [`services.deluge.declarative`](#opt-services.deluge.declarative) is set to
`true`. String values must be quoted, integer and
boolean values must not. See
[https://git.deluge-torrent.org/deluge/tree/deluge/core/preferencesmanager.py#n41](https://git.deluge-torrent.org/deluge/tree/deluge/core/preferencesmanager.py#n41)
for the available options.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  download_location = "/srv/torrents/";
  max_upload_speed = "1000.0";
  share_ratio_limit = "2.0";
  allow_remote = true;
  daemon_port = 58846;
  listen_ports = [ 6881 6889 ];
}
```

*Declared by:* [`nixos/modules/services/torrent/deluge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/deluge.nix)

## `services.deluge.dataDir` {#opt-services.deluge.dataDir}

The directory where deluge will create files.

*Type:* absolute path

*Default:* `"/var/lib/deluge"`

*Declared by:* [`nixos/modules/services/torrent/deluge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/deluge.nix)

## `services.deluge.declarative` {#opt-services.deluge.declarative}

Whether to use a declarative deluge configuration.
Only if set to `true`, the options
[`services.deluge.config`](#opt-services.deluge.config),
[`services.deluge.openFirewall`](#opt-services.deluge.openFirewall) and
[`services.deluge.authFile`](#opt-services.deluge.authFile) will be
applied.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/torrent/deluge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/deluge.nix)

## `services.deluge.enable` {#opt-services.deluge.enable}

Whether to enable Deluge daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/torrent/deluge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/deluge.nix)

## `services.deluge.extraPackages` {#opt-services.deluge.extraPackages}

Extra packages available at runtime to enable Deluge's plugins. For example,
extraction utilities are required for the built-in "Extractor" plugin.
This always contains unzip, gnutar, xz and bzip2.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/torrent/deluge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/deluge.nix)

## `services.deluge.group` {#opt-services.deluge.group}

Group under which deluge runs.

*Type:* string

*Default:* `"deluge"`

*Declared by:* [`nixos/modules/services/torrent/deluge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/deluge.nix)

## `services.deluge.openFilesLimit` {#opt-services.deluge.openFilesLimit}

Number of files to allow deluged to open.

*Type:* signed integer or string

*Default:* `4096`

*Declared by:* [`nixos/modules/services/torrent/deluge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/deluge.nix)

## `services.deluge.openFirewall` {#opt-services.deluge.openFirewall}

Whether to open the firewall for the ports in
`services.deluge.config.listen_ports`. It only takes effet if
[`services.deluge.declarative`](#opt-services.deluge.declarative) is set to
`true`.

It does NOT apply to the daemon port nor the web UI port. To access those
ports securely check the documentation
[https://dev.deluge-torrent.org/wiki/UserGuide/ThinClient#CreateSSHTunnel](https://dev.deluge-torrent.org/wiki/UserGuide/ThinClient#CreateSSHTunnel)
or use a VPN or configure certificates for deluge.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/torrent/deluge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/deluge.nix)

## `services.deluge.package` {#opt-services.deluge.package}

The deluge-2\_x package to use.

*Type:* package

*Default:* `pkgs.deluge-2_x`

*Declared by:* [`nixos/modules/services/torrent/deluge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/deluge.nix)

## `services.deluge.user` {#opt-services.deluge.user}

User account under which deluge runs.

*Type:* string

*Default:* `"deluge"`

*Declared by:* [`nixos/modules/services/torrent/deluge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/deluge.nix)

## `services.deluge.web.enable` {#opt-services.deluge.web.enable}

Whether to enable Deluge Web daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/torrent/deluge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/deluge.nix)

## `services.deluge.web.openFirewall` {#opt-services.deluge.web.openFirewall}

Open ports in the firewall for deluge web daemon

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/torrent/deluge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/deluge.nix)

## `services.deluge.web.port` {#opt-services.deluge.web.port}

Deluge web UI port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8112`

*Declared by:* [`nixos/modules/services/torrent/deluge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/deluge.nix)

## `services.dendrite.enable` {#opt-services.dendrite.enable}

Whether to enable matrix.org dendrite.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.environmentFile` {#opt-services.dendrite.environmentFile}

Environment file as defined in `systemd.exec(5)`.
Secrets may be passed to the service without adding them to the world-readable
Nix store, by specifying placeholder variables as the option value in Nix and
setting these variables accordingly in the environment file. Currently only used
for the registration secret to allow secure registration when
client\_api.registration\_disabled is true.

```
  # snippet of dendrite-related config
  services.dendrite.settings.client_api.registration_shared_secret = "$REGISTRATION_SHARED_SECRET";
```

```
  # content of the environment file
  REGISTRATION_SHARED_SECRET=verysecretpassword
```

Note that this file needs to be available on the host on which
`dendrite` is running.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/dendrite/registration_secret"`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.httpPort` {#opt-services.dendrite.httpPort}

The port to listen for HTTP requests on.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8008`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.httpsPort` {#opt-services.dendrite.httpsPort}

The port to listen for HTTPS requests on.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.loadCredential` {#opt-services.dendrite.loadCredential}

This can be used to pass secrets to the systemd service without adding them to
the nix store.
To use the example setting, see the example of
[`services.dendrite.settings.global.private_key`](#opt-services.dendrite.settings.global.private_key).
See the LoadCredential section of systemd.exec manual for more information.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "private_key:/path/to/my_private_key"
]
```

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.openRegistration` {#opt-services.dendrite.openRegistration}

Allow open registration without secondary verification (reCAPTCHA).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.package` {#opt-services.dendrite.package}

The dendrite package to use.

*Type:* package

*Default:* `pkgs.dendrite`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.settings` {#opt-services.dendrite.settings}

Configuration for dendrite, see:
[https://github.com/matrix-org/dendrite/blob/main/dendrite-sample.yaml](https://github.com/matrix-org/dendrite/blob/main/dendrite-sample.yaml)
for available options with which to populate settings.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.settings.app_service_api.database.connection_string` {#opt-services.dendrite.settings.app_service_api.database.connection_string}

Database for the Appservice API.

*Type:* string

*Default:* `"file:federationapi.db"`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.settings.client_api.registration_disabled` {#opt-services.dendrite.settings.client_api.registration_disabled}

Whether to disable user registration to the server
without the shared secret.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.settings.federation_api.database.connection_string` {#opt-services.dendrite.settings.federation_api.database.connection_string}

Database for the Federation API.

*Type:* string

*Default:* `"file:federationapi.db"`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.settings.global.private_key` {#opt-services.dendrite.settings.global.private_key}

The path to the signing private key file, used to sign
requests and events.

```
  nix-shell -p dendrite --command "generate-keys --private-key matrix_key.pem"
```

*Type:* absolute path or string matching the pattern ^$CREDENTIALS\_DIRECTORY/.+

*Example:* `"$CREDENTIALS_DIRECTORY/private_key"`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.settings.global.server_name` {#opt-services.dendrite.settings.global.server_name}

The domain name of the server, with optional explicit port.
This is used by remote servers to connect to this server.
This is also the last part of your UserID.

*Type:* string

*Example:* `"example.com"`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.settings.global.trusted_third_party_id_servers` {#opt-services.dendrite.settings.global.trusted_third_party_id_servers}

Lists of domains that the server will trust as identity
servers to verify third party identifiers such as phone
numbers and email addresses

*Type:* list of string

*Default:*

``` nix
[
  "matrix.org"
  "vector.im"
]
```

*Example:*

``` nix
[
  "matrix.org"
]
```

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.settings.key_server.database.connection_string` {#opt-services.dendrite.settings.key_server.database.connection_string}

Database for the Key Server (for end-to-end encryption).

*Type:* string

*Default:* `"file:keyserver.db"`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.settings.media_api.base_path` {#opt-services.dendrite.settings.media_api.base_path}

Storage path for uploaded media.

*Type:* string

*Default:* `"/var/lib/dendrite/media_store"`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.settings.media_api.database.connection_string` {#opt-services.dendrite.settings.media_api.database.connection_string}

Database for the Media API.

*Type:* string

*Default:* `"file:mediaapi.db"`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.settings.mscs.database.connection_string` {#opt-services.dendrite.settings.mscs.database.connection_string}

Database for exerimental MSC's.

*Type:* string

*Default:* `"file:mscs.db"`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.settings.relay_api.database.connection_string` {#opt-services.dendrite.settings.relay_api.database.connection_string}

Database for the Relay Server.

*Type:* string

*Default:* `"file:relayapi.db"`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.settings.room_server.database.connection_string` {#opt-services.dendrite.settings.room_server.database.connection_string}

Database for the Room Server.

*Type:* string

*Default:* `"file:roomserver.db"`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.settings.sync_api.database.connection_string` {#opt-services.dendrite.settings.sync_api.database.connection_string}

Database for the Sync API.

*Type:* string

*Default:* `"file:syncserver.db"`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.settings.sync_api.search.enabled` {#opt-services.dendrite.settings.sync_api.search.enabled}

Whether to enable Dendrite's full-text search engine.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.settings.sync_api.search.index_path` {#opt-services.dendrite.settings.sync_api.search.index_path}

The path the search index will be created in.

*Type:* string

*Default:* `"/var/lib/dendrite/searchindex"`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.settings.sync_api.search.language` {#opt-services.dendrite.settings.sync_api.search.language}

The language most likely to be used on the server - used when indexing, to
ensure the returned results match expectations. A full list of possible languages
can be found at [https://github.com/blevesearch/bleve/tree/master/analysis/lang](https://github.com/blevesearch/bleve/tree/master/analysis/lang)

*Type:* string

*Default:* `"en"`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.settings.user_api.account_database.connection_string` {#opt-services.dendrite.settings.user_api.account_database.connection_string}

Database for the User API, accounts.

*Type:* string

*Default:* `"file:userapi_accounts.db"`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.settings.user_api.device_database.connection_string` {#opt-services.dendrite.settings.user_api.device_database.connection_string}

Database for the User API, devices.

*Type:* string

*Default:* `"file:userapi_devices.db"`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.tlsCert` {#opt-services.dendrite.tlsCert}

The path to the TLS certificate.

```
  nix-shell -p dendrite --command "generate-keys --tls-cert server.crt --tls-key server.key"
```

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/dendrite/server.cert"`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dendrite.tlsKey` {#opt-services.dendrite.tlsKey}

The path to the TLS key.

```
  nix-shell -p dendrite --command "generate-keys --tls-cert server.crt --tls-key server.key"
```

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/dendrite/server.key"`

*Declared by:* [`nixos/modules/services/matrix/dendrite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/dendrite.nix)

## `services.dependency-track.database.createLocally` {#opt-services.dependency-track.database.createLocally}

Whether a database should be automatically created on the
local host. Set this to false if you plan on provisioning a
local database yourself.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.database.databaseName` {#opt-services.dependency-track.database.databaseName}

Database name to use when connecting to an external or
manually provisioned database; has no effect when a local
database is automatically provisioned.

To use this with a local database, set [`services.dependency-track.database.createLocally`](#opt-services.dependency-track.database.createLocally)
to `false` and create the database and user.

*Type:* string

*Default:* `"dependency-track"`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.database.passwordFile` {#opt-services.dependency-track.database.passwordFile}

The path to a file containing the database password.

*Type:* absolute path

*Example:* `"/run/keys/db_password"`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.database.type` {#opt-services.dependency-track.database.type}

`h2` database is not recommended for a production setup.
`postgresql` this settings it recommended for production setups.
`manual` the module doesn't handle database settings.

*Type:* one of "h2", "postgresql", "manual"

*Default:* `"postgresql"`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.database.username` {#opt-services.dependency-track.database.username}

Username to use when connecting to an external or manually
provisioned database; has no effect when a local database is
automatically provisioned.

To use this with a local database, set [`services.dependency-track.database.createLocally`](#opt-services.dependency-track.database.createLocally)
to `false` and create the database and user.

*Type:* string

*Default:* `"dependency-track"`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.enable` {#opt-services.dependency-track.enable}

Whether to enable dependency-track.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.frontend.baseUrl` {#opt-services.dependency-track.frontend.baseUrl}

The base URL of the API server.

NOTE:

- This URL must be reachable by the browsers of your users.
- The frontend container itself does NOT communicate with the API server directly, it just serves static files.
- When deploying to dedicated servers, please use the external IP or domain of the API server.

*Type:* string

*Default:*

``` nix
lib.optionalString config.services.dependency-track.nginx.enable "${
  if sslEnabled then "https" else "http"
}://${config.services.dependency-track.nginx.domain}";
```

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.javaArgs` {#opt-services.dependency-track.javaArgs}

Java options passed to JVM. Configuring this is usually not necessary, but for small systems
it can be useful to tweak the JVM heap size.

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "-Xmx16G" ] `

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.ldap.bindPasswordFile` {#opt-services.dependency-track.ldap.bindPasswordFile}

The path to a file containing the LDAP bind password.

*Type:* absolute path

*Example:* `"/run/keys/ldap_bind_password"`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.logLevel` {#opt-services.dependency-track.logLevel}

Log level for dependency-track

*Type:* one of "INFO", "WARN", "ERROR", "DEBUG", "TRACE"

*Default:* `"INFO"`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.nginx.domain` {#opt-services.dependency-track.nginx.domain}

The domain name under which to set up the virtual host.

*Type:* string

*Example:* `"dtrack.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.nginx.enable` {#opt-services.dependency-track.nginx.enable}

Whether to set up an nginx virtual host.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.oidc.clientId` {#opt-services.dependency-track.oidc.clientId}

Defines the client ID for OpenID Connect.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.oidc.enable` {#opt-services.dependency-track.oidc.enable}

Whether to enable oidc support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.oidc.flow` {#opt-services.dependency-track.oidc.flow}

Specifies the OpenID Connect flow to use.
Values other than "implicit" will result in the Code+PKCE flow to be used.
Usage of the implicit flow is strongly discouraged, but may be necessary when
the IdP of choice does not support the Code+PKCE flow.
See also:

- [https://oauth.net/2/grant-types/implicit/](https://oauth.net/2/grant-types/implicit/)
- [https://oauth.net/2/pkce/](https://oauth.net/2/pkce/)

*Type:* one of "code", "implicit"

*Default:* `"code"`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.oidc.issuer` {#opt-services.dependency-track.oidc.issuer}

Defines the issuer URL to be used for OpenID Connect.
See alpine.oidc.issuer property of the API server.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.oidc.loginButtonText` {#opt-services.dependency-track.oidc.loginButtonText}

Defines the scopes to request for OpenID Connect.
See also: [https://openid.net/specs/openid-connect-basic-1\_0.html#Scopes](https://openid.net/specs/openid-connect-basic-1_0.html#Scopes)

*Type:* string

*Default:* `"Login with OpenID Connect"`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.oidc.scope` {#opt-services.dependency-track.oidc.scope}

Defines the scopes to request for OpenID Connect.
See also: [https://openid.net/specs/openid-connect-basic-1\_0.html#Scopes](https://openid.net/specs/openid-connect-basic-1_0.html#Scopes)

*Type:* string

*Default:* `"openid profile email"`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.oidc.teamSynchronization` {#opt-services.dependency-track.oidc.teamSynchronization}

This option will ensure that team memberships for OpenID Connect users are dynamic and
synchronized with membership of OpenID Connect groups or assigned roles. When a team is
mapped to an OpenID Connect group, all local OpenID Connect users will automatically be
assigned to the team if they are a member of the group the team is mapped to. If the user
is later removed from the OpenID Connect group, they will also be removed from the team. This
option provides the ability to dynamically control user permissions via the identity provider.
Note that team synchronization is only performed during user provisioning and after successful
authentication.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.oidc.teams.claim` {#opt-services.dependency-track.oidc.teams.claim}

Defines the name of the claim that contains group memberships or role assignments in the provider's userinfo endpoint.
The claim must be an array of strings. Most public identity providers do not support group or role management.
When using a customizable / on-demand hosted identity provider, name, content, and inclusion in the userinfo endpoint
will most likely need to be configured.

*Type:* string

*Default:* `"groups"`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.oidc.teams.default` {#opt-services.dependency-track.oidc.teams.default}

Defines one or more team names that auto-provisioned OIDC users shall be added to.
Multiple team names may be provided as comma-separated list.

Has no effect when [`services.dependency-track.oidc.userProvisioning`](#opt-services.dependency-track.oidc.userProvisioning)=false,
or [`services.dependency-track.oidc.teamSynchronization`](#opt-services.dependency-track.oidc.teamSynchronization)=true.

*Type:* null or strings concatenated with ","

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.oidc.userProvisioning` {#opt-services.dependency-track.oidc.userProvisioning}

Specifies if mapped OpenID Connect accounts are automatically created upon successful
authentication. When a user logs in with a valid access token but an account has
not been previously provisioned, an authentication failure will be returned.
This allows admins to control specifically which OpenID Connect users can access the
system and which users cannot. When this value is set to true, a local OpenID Connect
user will be created and mapped to the OpenID Connect account automatically. This
automatic provisioning only affects authentication, not authorization.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.oidc.usernameClaim` {#opt-services.dependency-track.oidc.usernameClaim}

Defines the name of the claim that contains the username in the provider's userinfo endpoint.
Common claims are "name", "username", "preferred\_username" or "nickname".
See also: [https://openid.net/specs/openid-connect-core-1\_0.html#UserInfoResponse](https://openid.net/specs/openid-connect-core-1_0.html#UserInfoResponse)

*Type:* string

*Default:* `"name"`

*Example:* `"preferred_username"`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.package` {#opt-services.dependency-track.package}

The dependency-track package to use.

*Type:* package

*Default:* `pkgs.dependency-track`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.port` {#opt-services.dependency-track.port}

On which port dependency-track should listen for new HTTP connections.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.settings` {#opt-services.dependency-track.settings}

See [https://docs.dependencytrack.org/getting-started/configuration/#default-configuration](https://docs.dependencytrack.org/getting-started/configuration/#default-configuration) for possible options

*Type:* open submodule of attribute set of (string, package, bool, int or float)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.settings."alpine.data.directory"` {#opt-services.dependency-track.settings._alpine.data.directory_}

Defines the path to the data directory. This directory will hold logs, keys,
and any database or index files along with application-specific files or
directories.

*Type:* absolute path

*Default:* `"/var/lib/dependency-track"`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.settings."alpine.database.driver"` {#opt-services.dependency-track.settings._alpine.database.driver_}

Specifies the JDBC driver class to use.

*Type:* one of "org.h2.Driver", "org.postgresql.Driver", "com.microsoft.sqlserver.jdbc.SQLServerDriver", "com.mysql.cj.jdbc.Driver"

*Default:*

``` nix
if config.services.dependency-track.database.type == "h2" then "org.h2.Driver"
else if config.services.dependency-track.database.type == "postgresql" then "org.postgresql.Driver"
else null;
```

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.settings."alpine.database.mode"` {#opt-services.dependency-track.settings._alpine.database.mode_}

Defines the database mode of operation. Valid choices are:
'server', 'embedded', and 'external'.
In server mode, the database will listen for connections from remote hosts.
In embedded mode, the system will be more secure and slightly faster.
External mode should be used when utilizing an external database server
(i.e. mysql, postgresql, etc).

*Type:* one of "server", "embedded", "external"

*Default:*

``` nix
if config.services.dependency-track.database.type == "h2" then "embedded"
else if config.services.dependency-track.database.type == "postgresql" then "external"
else null
```

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.settings."alpine.database.url"` {#opt-services.dependency-track.settings._alpine.database.url_}

Specifies the JDBC URL to use when connecting to the database.

*Type:* string

*Default:*

``` nix
if config.services.dependency-track.database.type == "h2" then "jdbc:h2:/var/lib/dependency-track/db"
  else if config.services.dependency-track.database.type == "postgresql" then "jdbc:postgresql:${config.services.dependency-track.database.name}?socketFactory=org.newsclub.net.unix.AFUNIXSocketFactory$FactoryArg&socketFactoryArg=/run/postgresql/.s.PGSQL.5432"
  else null
```

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.settings."alpine.database.username"` {#opt-services.dependency-track.settings._alpine.database.username_}

Specifies the username to use when authenticating to the database.

*Type:* string

*Default:*

``` nix
if config.services.dependency-track.database.createLocally then "dependency-track"
else config.services.dependency-track.database.username
```

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.settings."alpine.ldap.enabled"` {#opt-services.dependency-track.settings._alpine.ldap.enabled_}

Defines if LDAP will be used for user authentication. If enabled,
alpine.ldap.\* properties should be set accordingly.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.settings."alpine.oidc.client.id"` {#opt-services.dependency-track.settings._alpine.oidc.client.id_}

Defines the client ID to be used for OpenID Connect.
The client ID should be the same as the one configured for the frontend,
and will only be used to validate ID tokens.

*Type:* string

*Default:* `config.services.dependency-track.oidc.clientId`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.settings."alpine.oidc.enabled"` {#opt-services.dependency-track.settings._alpine.oidc.enabled_}

Defines if OpenID Connect will be used for user authentication.
If enabled, alpine.oidc.\* properties should be set accordingly.

*Type:* boolean

*Default:* `config.services.dependency-track.oidc.enable`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.settings."alpine.oidc.issuer"` {#opt-services.dependency-track.settings._alpine.oidc.issuer_}

Defines the issuer URL to be used for OpenID Connect.
This issuer MUST support provider configuration via the /.well-known/openid-configuration endpoint.
See also:

- [https://openid.net/specs/openid-connect-discovery-1\_0.html#ProviderMetadata](https://openid.net/specs/openid-connect-discovery-1_0.html#ProviderMetadata)
- [https://openid.net/specs/openid-connect-discovery-1\_0.html#ProviderConfig](https://openid.net/specs/openid-connect-discovery-1_0.html#ProviderConfig)

*Type:* string

*Default:* `config.services.dependency-track.oidc.issuer`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.settings."alpine.oidc.team.synchronization"` {#opt-services.dependency-track.settings._alpine.oidc.team.synchronization_}

This option will ensure that team memberships for OpenID Connect users are dynamic and
synchronized with membership of OpenID Connect groups or assigned roles. When a team is
mapped to an OpenID Connect group, all local OpenID Connect users will automatically be
assigned to the team if they are a member of the group the team is mapped to. If the user
is later removed from the OpenID Connect group, they will also be removed from the team. This
option provides the ability to dynamically control user permissions via the identity provider.
Note that team synchronization is only performed during user provisioning and after successful
authentication.

*Type:* boolean

*Default:* `config.services.dependency-track.oidc.teamSynchronization`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.settings."alpine.oidc.teams.claim"` {#opt-services.dependency-track.settings._alpine.oidc.teams.claim_}

Defines the name of the claim that contains group memberships or role assignments in the provider's userinfo endpoint.
The claim must be an array of strings. Most public identity providers do not support group or role management.
When using a customizable / on-demand hosted identity provider, name, content, and inclusion in the userinfo endpoint
will most likely need to be configured.

*Type:* string

*Default:* `config.services.dependency-track.oidc.teams.claim`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.settings."alpine.oidc.teams.default"` {#opt-services.dependency-track.settings._alpine.oidc.teams.default_}

Defines one or more team names that auto-provisioned OIDC users shall be added to.
Multiple team names may be provided as comma-separated list.

Has no effect when [`services.dependency-track.oidc.userProvisioning`](#opt-services.dependency-track.oidc.userProvisioning)=false,
or [`services.dependency-track.oidc.teamSynchronization`](#opt-services.dependency-track.oidc.teamSynchronization)=true.

*Type:* null or strings concatenated with ","

*Default:* `config.services.dependency-track.oidc.teams.default`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.settings."alpine.oidc.user.provisioning"` {#opt-services.dependency-track.settings._alpine.oidc.user.provisioning_}

Specifies if mapped OpenID Connect accounts are automatically created upon successful
authentication. When a user logs in with a valid access token but an account has
not been previously provisioned, an authentication failure will be returned.
This allows admins to control specifically which OpenID Connect users can access the
system and which users cannot. When this value is set to true, a local OpenID Connect
user will be created and mapped to the OpenID Connect account automatically. This
automatic provisioning only affects authentication, not authorization.

*Type:* boolean

*Default:* `config.services.dependency-track.oidc.userProvisioning`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.dependency-track.settings."alpine.oidc.username.claim"` {#opt-services.dependency-track.settings._alpine.oidc.username.claim_}

Defines the name of the claim that contains the username in the provider's userinfo endpoint.
Common claims are "name", "username", "preferred\_username" or "nickname".
See also: [https://openid.net/specs/openid-connect-core-1\_0.html#UserInfoResponse](https://openid.net/specs/openid-connect-core-1_0.html#UserInfoResponse)

*Type:* string

*Default:* `config.services.dependency-track.oidc.usernameClaim`

*Declared by:* [`nixos/modules/services/web-apps/dependency-track.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dependency-track.nix)

## `services.desktopManager.budgie.enable` {#opt-services.desktopManager.budgie.enable}

Whether to enable the Budgie desktop.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktop-managers/budgie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/budgie.nix)

## `services.desktopManager.budgie.extraGSettingsOverridePackages` {#opt-services.desktopManager.budgie.extraGSettingsOverridePackages}

List of packages for which GSettings are overridden.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/desktop-managers/budgie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/budgie.nix)

## `services.desktopManager.budgie.extraGSettingsOverrides` {#opt-services.desktopManager.budgie.extraGSettingsOverrides}

Additional GSettings overrides.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/desktop-managers/budgie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/budgie.nix)

## `services.desktopManager.budgie.extraPlugins` {#opt-services.desktopManager.budgie.extraPlugins}

Extra plugins for the Budgie desktop

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.budgie-analogue-clock-applet ]`

*Declared by:* [`nixos/modules/services/desktop-managers/budgie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/budgie.nix)

## `services.desktopManager.budgie.sessionPath` {#opt-services.desktopManager.budgie.sessionPath}

Additional list of packages to be added to the session search path.
Useful for GSettings-conditional autostart.

Note that this should be a last resort; patching the package is preferred (see GPaste).

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.gpaste ]`

*Declared by:* [`nixos/modules/services/desktop-managers/budgie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/budgie.nix)

## `services.desktopManager.cosmic.enable` {#opt-services.desktopManager.cosmic.enable}

Whether to enable COSMIC desktop environment.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktop-managers/cosmic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/cosmic.nix)

## `services.desktopManager.cosmic.showExcludedPkgsWarning` {#opt-services.desktopManager.cosmic.showExcludedPkgsWarning}

Whether to enable the warning for excluding core packages.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktop-managers/cosmic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/cosmic.nix)

## `services.desktopManager.cosmic.xwayland.enable` {#opt-services.desktopManager.cosmic.xwayland.enable}

Whether to enable Xwayland support for the COSMIC compositor.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktop-managers/cosmic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/cosmic.nix)

## `services.desktopManager.gnome.debug` {#opt-services.desktopManager.gnome.debug}

Whether to enable pkgs.gnome-session debug messages.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktop-managers/gnome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/gnome.nix)

## `services.desktopManager.gnome.enable` {#opt-services.desktopManager.gnome.enable}

Enable GNOME desktop manager.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/desktop-managers/gnome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/gnome.nix)

## `services.desktopManager.gnome.extraGSettingsOverridePackages` {#opt-services.desktopManager.gnome.extraGSettingsOverridePackages}

List of packages for which gsettings are overridden.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/desktop-managers/gnome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/gnome.nix)

## `services.desktopManager.gnome.extraGSettingsOverrides` {#opt-services.desktopManager.gnome.extraGSettingsOverrides}

Additional gsettings overrides.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/desktop-managers/gnome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/gnome.nix)

## `services.desktopManager.gnome.flashback.customSessions` {#opt-services.desktopManager.gnome.flashback.customSessions}

Other GNOME Flashback sessions to enable.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/desktop-managers/gnome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/gnome.nix)

## `services.desktopManager.gnome.flashback.customSessions.*.enableGnomePanel` {#opt-services.desktopManager.gnome.flashback.customSessions._.enableGnomePanel}

Whether to enable the GNOME panel in this session.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/desktop-managers/gnome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/gnome.nix)

## `services.desktopManager.gnome.flashback.customSessions.*.wmCommand` {#opt-services.desktopManager.gnome.flashback.customSessions._.wmCommand}

The executable of the window manager to use.

*Type:* string

*Example:* `"${pkgs.haskellPackages.xmonad}/bin/xmonad"`

*Declared by:* [`nixos/modules/services/desktop-managers/gnome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/gnome.nix)

## `services.desktopManager.gnome.flashback.customSessions.*.wmLabel` {#opt-services.desktopManager.gnome.flashback.customSessions._.wmLabel}

The name of the window manager to show in the session chooser.

*Type:* string

*Example:* `"XMonad"`

*Declared by:* [`nixos/modules/services/desktop-managers/gnome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/gnome.nix)

## `services.desktopManager.gnome.flashback.customSessions.*.wmName` {#opt-services.desktopManager.gnome.flashback.customSessions._.wmName}

A unique identifier for the window manager.

*Type:* string matching the pattern \[a-zA-Z0-9\_-\]+

*Example:* `"xmonad"`

*Declared by:* [`nixos/modules/services/desktop-managers/gnome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/gnome.nix)

## `services.desktopManager.gnome.flashback.enableMetacity` {#opt-services.desktopManager.gnome.flashback.enableMetacity}

Whether to enable the standard GNOME Flashback session with Metacity.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktop-managers/gnome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/gnome.nix)

## `services.desktopManager.gnome.flashback.panelModulePackages` {#opt-services.desktopManager.gnome.flashback.panelModulePackages}

Packages containing modules that should be made available to `pkgs.gnome-panel` (usually for applets).

If you're packaging something to use here, please install the modules in `$out/lib/gnome-panel/modules`.

*Type:* list of package

*Default:* `[ pkgs.gnome-applets ]`

*Declared by:* [`nixos/modules/services/desktop-managers/gnome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/gnome.nix)

## `services.desktopManager.gnome.sessionPath` {#opt-services.desktopManager.gnome.sessionPath}

Additional list of packages to be added to the session search path.
Useful for GNOME Shell extensions or GSettings-conditional autostart.

Note that this should be a last resort; patching the package is preferred (see GPaste).

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.gpaste ]`

*Declared by:* [`nixos/modules/services/desktop-managers/gnome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/gnome.nix)

## `services.desktopManager.lomiri.enable` {#opt-services.desktopManager.lomiri.enable}

Whether to enable the Lomiri graphical shell (formerly known as Unity8)
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktop-managers/lomiri.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/lomiri.nix)

## `services.desktopManager.pantheon.debug` {#opt-services.desktopManager.pantheon.debug}

Whether to enable gnome-session debug messages.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktop-managers/pantheon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/pantheon.nix)

## `services.desktopManager.pantheon.enable` {#opt-services.desktopManager.pantheon.enable}

Enable the pantheon desktop manager

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/desktop-managers/pantheon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/pantheon.nix)

## `services.desktopManager.pantheon.extraGSettingsOverridePackages` {#opt-services.desktopManager.pantheon.extraGSettingsOverridePackages}

List of packages for which gsettings are overridden.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/desktop-managers/pantheon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/pantheon.nix)

## `services.desktopManager.pantheon.extraGSettingsOverrides` {#opt-services.desktopManager.pantheon.extraGSettingsOverrides}

Additional gsettings overrides.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/desktop-managers/pantheon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/pantheon.nix)

## `services.desktopManager.pantheon.extraSwitchboardPlugs` {#opt-services.desktopManager.pantheon.extraSwitchboardPlugs}

Plugs to add to Switchboard.

*Type:* null or (list of package)

*Default:* `null`

*Declared by:* [`nixos/modules/services/desktop-managers/pantheon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/pantheon.nix)

## `services.desktopManager.pantheon.extraWingpanelIndicators` {#opt-services.desktopManager.pantheon.extraWingpanelIndicators}

Indicators to add to Wingpanel.

*Type:* null or (list of package)

*Default:* `null`

*Declared by:* [`nixos/modules/services/desktop-managers/pantheon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/pantheon.nix)

## `services.desktopManager.pantheon.sessionPath` {#opt-services.desktopManager.pantheon.sessionPath}

Additional list of packages to be added to the session search path.
Useful for GSettings-conditional autostart.

Note that this should be a last resort; patching the package is preferred (see GPaste).

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.gpaste ]`

*Declared by:* [`nixos/modules/services/desktop-managers/pantheon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/pantheon.nix)

## `services.desktopManager.phosh.enable` {#opt-services.desktopManager.phosh.enable}

Enable the Phone Shell.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/desktop-managers/phosh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/phosh.nix)

## `services.desktopManager.phosh.group` {#opt-services.desktopManager.phosh.group}

The group to run the Phosh service.

*Type:* string

*Example:* `"users"`

*Declared by:* [`nixos/modules/services/desktop-managers/phosh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/phosh.nix)

## `services.desktopManager.phosh.package` {#opt-services.desktopManager.phosh.package}

The phosh package to use.

*Type:* package

*Default:* `pkgs.phosh`

*Declared by:* [`nixos/modules/services/desktop-managers/phosh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/phosh.nix)

## `services.desktopManager.phosh.phocConfig` {#opt-services.desktopManager.phosh.phocConfig}

Configurations for the Phoc compositor.

*Type:* strings concatenated with "\\n" or absolute path or (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/desktop-managers/phosh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/phosh.nix)

## `services.desktopManager.phosh.user` {#opt-services.desktopManager.phosh.user}

The user to run the Phosh service.

*Type:* string

*Example:* `"alice"`

*Declared by:* [`nixos/modules/services/desktop-managers/phosh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/phosh.nix)

## `services.desktopManager.plasma6.enable` {#opt-services.desktopManager.plasma6.enable}

Enable the Plasma 6 (KDE 6) desktop environment.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/desktop-managers/plasma6.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/plasma6.nix)

## `services.desktopManager.plasma6.enableQt5Integration` {#opt-services.desktopManager.plasma6.enableQt5Integration}

Enable Qt 5 integration (theming, etc). Disable for a pure Qt 6 system.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/desktop-managers/plasma6.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/plasma6.nix)

## `services.desktopManager.plasma6.notoPackage` {#opt-services.desktopManager.plasma6.notoPackage}

The Noto fonts - used for UI by default package to use.

*Type:* package

*Default:* `pkgs.noto-fonts`

*Example:* `noto-fonts-lgc-plus`

*Declared by:* [`nixos/modules/services/desktop-managers/plasma6.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/plasma6.nix)

## `services.devmon.enable` {#opt-services.devmon.enable}

Whether to enable devmon, an automatic device mounting daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/devmon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/devmon.nix)

## `services.devpi-server.enable` {#opt-services.devpi-server.enable}

Whether to enable Devpi Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/devpi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/devpi-server.nix)

## `services.devpi-server.extraPackages` {#opt-services.devpi-server.extraPackages}

Plugins and extra Python packages to be available to devpi-server.

*Type:* (function that evaluates to a(n) list of package) or (list of package) convertible to it

*Default:* `ps: [ ]`

*Example:*

``` nix
ps: with ps; [ devpi-web devpi-ldap ]
```

*Declared by:* [`nixos/modules/services/misc/devpi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/devpi-server.nix)

## `services.devpi-server.host` {#opt-services.devpi-server.host}

domain/ip address to listen on

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/misc/devpi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/devpi-server.nix)

## `services.devpi-server.openFirewall` {#opt-services.devpi-server.openFirewall}

Whether to enable opening the default ports in the firewall for Devpi Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/devpi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/devpi-server.nix)

## `services.devpi-server.package` {#opt-services.devpi-server.package}

The devpi-server package to use.

*Type:* package

*Default:* `pkgs.devpi-server`

*Declared by:* [`nixos/modules/services/misc/devpi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/devpi-server.nix)

## `services.devpi-server.port` {#opt-services.devpi-server.port}

The port on which Devpi Server will listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3141`

*Declared by:* [`nixos/modules/services/misc/devpi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/devpi-server.nix)

## `services.devpi-server.primaryUrl` {#opt-services.devpi-server.primaryUrl}

Url for the primary node. Required option for replica nodes.

*Type:* string

*Declared by:* [`nixos/modules/services/misc/devpi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/devpi-server.nix)

## `services.devpi-server.replica` {#opt-services.devpi-server.replica}

Run node as a replica.
Requires the secretFile option and the primaryUrl to be enabled.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/devpi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/devpi-server.nix)

## `services.devpi-server.secretFile` {#opt-services.devpi-server.secretFile}

Path to a shared secret file used for synchronization,
Required for all nodes in a replica/primary setup.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/devpi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/devpi-server.nix)

## `services.dex.enable` {#opt-services.dex.enable}

Whether to enable the OpenID Connect and OAuth2 identity provider.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/dex.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dex.nix)

## `services.dex.environmentFile` {#opt-services.dex.environmentFile}

Environment file (see `systemd.exec(5)`
"EnvironmentFile=" section for the syntax) to define variables for dex.
This option can be used to safely include secret keys into the dex configuration.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/dex.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dex.nix)

## `services.dex.package` {#opt-services.dex.package}

The dex-oidc package to use.

*Type:* package

*Default:* `pkgs.dex-oidc`

*Declared by:* [`nixos/modules/services/web-apps/dex.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dex.nix)

## `services.dex.settings` {#opt-services.dex.settings}

The available options can be found in
[the example configuration](https://github.com/dexidp/dex/blob/v2.46.1/config.yaml.dist).

It's also possible to refer to environment variables (defined in [services.dex.environmentFile](#opt-services.dex.environmentFile))
using the syntax `$VARIABLE_NAME`.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  # External url
  issuer = "http://127.0.0.1:5556/dex";
  storage = {
    type = "postgres";
    config.host = "/var/run/postgres";
  };
  web = {
    http = "127.0.0.1:5556";
  };
  enablePasswordDB = true;
  staticClients = [
    {
      id = "oidcclient";
      name = "Client";
      redirectURIs = [ "https://example.com/callback" ];
      secretFile = "/etc/dex/oidcclient"; # The content of `secretFile` will be written into to the config as `secret`.
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/web-apps/dex.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dex.nix)

## `services.deye-dummycloud.enable` {#opt-services.deye-dummycloud.enable}

Whether to enable the deye-dummycloud service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/deye-dummycloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/deye-dummycloud.nix)

## `services.deye-dummycloud.mqttBrokerUrl` {#opt-services.deye-dummycloud.mqttBrokerUrl}

MQTT broker URL

*Type:* string

*Default:* `"mqtt://localhost"`

*Declared by:* [`nixos/modules/services/home-automation/deye-dummycloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/deye-dummycloud.nix)

## `services.deye-dummycloud.mqttPassword` {#opt-services.deye-dummycloud.mqttPassword}

MQTT password

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/home-automation/deye-dummycloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/deye-dummycloud.nix)

## `services.deye-dummycloud.mqttUsername` {#opt-services.deye-dummycloud.mqttUsername}

MQTT username

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/home-automation/deye-dummycloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/deye-dummycloud.nix)

## `services.dgraph.alpha.host` {#opt-services.dgraph.alpha.host}

The host which dgraph alpha will be run on.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/databases/dgraph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/dgraph.nix)

## `services.dgraph.alpha.port` {#opt-services.dgraph.alpha.port}

The port which to run dgraph alpha on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `7080`

*Declared by:* [`nixos/modules/services/databases/dgraph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/dgraph.nix)

## `services.dgraph.enable` {#opt-services.dgraph.enable}

Whether to enable Dgraph native GraphQL database with a graph backend.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/dgraph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/dgraph.nix)

## `services.dgraph.package` {#opt-services.dgraph.package}

The dgraph package to use.

*Type:* package

*Default:* `pkgs.dgraph`

*Declared by:* [`nixos/modules/services/databases/dgraph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/dgraph.nix)

## `services.dgraph.settings` {#opt-services.dgraph.settings}

Contents of the dgraph config. For more details see [https://dgraph.io/docs/deploy/config](https://dgraph.io/docs/deploy/config)

*Type:* JSON value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/databases/dgraph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/dgraph.nix)

## `services.dgraph.zero.host` {#opt-services.dgraph.zero.host}

The host which dgraph zero will be run on.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/databases/dgraph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/dgraph.nix)

## `services.dgraph.zero.port` {#opt-services.dgraph.zero.port}

The port which to run dgraph zero on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5080`

*Declared by:* [`nixos/modules/services/databases/dgraph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/dgraph.nix)

## `services.dictd.DBs` {#opt-services.dictd.DBs}

List of databases to make available.

*Type:* list of package

*Default:* `with pkgs.dictdDBs; [ wiktionary wordnet ]`

*Example:* `[ pkgs.dictdDBs.nld2eng ]`

*Declared by:* [`nixos/modules/services/misc/dictd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/dictd.nix)

## `services.dictd.enable` {#opt-services.dictd.enable}

Whether to enable the DICT.org dictionary server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/dictd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/dictd.nix)

## `services.diod.allsquash` {#opt-services.diod.allsquash}

Remap all users to "nobody". The attaching user need not be present in the
password file.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/diod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/diod.nix)

## `services.diod.authRequired` {#opt-services.diod.authRequired}

Allow clients to connect without authentication, i.e. without a valid MUNGE credential.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/diod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/diod.nix)

## `services.diod.enable` {#opt-services.diod.enable}

Whether to enable the diod 9P file server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/diod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/diod.nix)

## `services.diod.exportall` {#opt-services.diod.exportall}

Export all file systems listed in /proc/mounts. If new file systems are mounted
after diod has started, they will become immediately mountable. If there is a
duplicate entry for a file system in the exports list, any options listed in
the exports entry will apply.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/diod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/diod.nix)

## `services.diod.exportopts` {#opt-services.diod.exportopts}

Establish a default set of export options. These are overridden, not appended
to, by opts attributes in an "exports" entry.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/network-filesystems/diod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/diod.nix)

## `services.diod.exports` {#opt-services.diod.exports}

List the file systems that clients will be allowed to mount. All paths should
be fully qualified. The exports table can include two types of element:
a string element (as above),
or an alternate table element form { path="/path", opts="ro" }.
In the alternate form, the (optional) opts attribute is a comma-separated list
of export options. The two table element forms can be mixed in the exports
table. Note that although diod will not traverse file system boundaries for a
given mount due to inode uniqueness constraints, subdirectories of a file
system can be separately exported.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/network-filesystems/diod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/diod.nix)

## `services.diod.extraConfig` {#opt-services.diod.extraConfig}

Extra configuration options for diod.conf.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/network-filesystems/diod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/diod.nix)

## `services.diod.listen` {#opt-services.diod.listen}

\[ "IP:PORT" \[,"IP:PORT",...\] \]
List the interfaces and ports that diod should listen on.

*Type:* list of string

*Default:*

``` nix
[
  "0.0.0.0:564"
]
```

*Declared by:* [`nixos/modules/services/network-filesystems/diod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/diod.nix)

## `services.diod.logdest` {#opt-services.diod.logdest}

Set the destination for logging.
The value has the form of "syslog:facility:level" or "filename".

*Type:* string

*Default:* `"syslog:daemon:err"`

*Declared by:* [`nixos/modules/services/network-filesystems/diod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/diod.nix)

## `services.diod.nwthreads` {#opt-services.diod.nwthreads}

Sets the (fixed) number of worker threads created to handle 9P
requests for a unique aname.

*Type:* signed integer

*Default:* `16`

*Declared by:* [`nixos/modules/services/network-filesystems/diod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/diod.nix)

## `services.diod.squashuser` {#opt-services.diod.squashuser}

Change the squash user. The squash user must be present in the password file.

*Type:* string

*Default:* `"nobody"`

*Declared by:* [`nixos/modules/services/network-filesystems/diod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/diod.nix)

## `services.diod.statfsPassthru` {#opt-services.diod.statfsPassthru}

This option configures statfs to return the host file system's type
rather than V9FS\_MAGIC.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/diod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/diod.nix)

## `services.diod.userdb` {#opt-services.diod.userdb}

This option disables password/group lookups. It allows any uid to attach and
assumes gid=uid, and supplementary groups contain only the primary gid.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/diod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/diod.nix)

## `services.discourse.admin.email` {#opt-services.discourse.admin.email}

The admin user email address.

*Type:* string

*Example:* `"admin@example.com"`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.admin.fullName` {#opt-services.discourse.admin.fullName}

The admin user's full name.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.admin.passwordFile` {#opt-services.discourse.admin.passwordFile}

A path to a file containing the admin user's password.

This should be a string, not a nix path, since nix paths are
copied into the world-readable nix store.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.admin.skipCreate` {#opt-services.discourse.admin.skipCreate}

Do not create the admin account, instead rely on other
existing admin accounts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.admin.username` {#opt-services.discourse.admin.username}

The admin user username.

*Type:* string

*Example:* `"admin"`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.backendSettings` {#opt-services.discourse.backendSettings}

Additional settings to put in the
`discourse.conf` file.

Look in the
[discourse\_defaults.conf](https://github.com/discourse/discourse/blob/master/config/discourse_defaults.conf)
file in the upstream distribution to find available options.

Setting an option to `null` means
“define variable, but leave right-hand side empty”.

*Type:* attribute set of (null or string or signed integer or boolean or floating point number)

*Default:* `{ }`

*Example:*

``` nix
{
  max_reqs_per_ip_per_minute = 300;
  max_reqs_per_ip_per_10_seconds = 60;
  max_asset_reqs_per_ip_per_10_seconds = 250;
  max_reqs_per_ip_mode = "warn+block";
};
```

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.database.createLocally` {#opt-services.discourse.database.createLocally}

Whether a database should be automatically created on the
local host. Set this to `false` if you plan
on provisioning a local database yourself. This has no effect
if [`services.discourse.database.host`](#opt-services.discourse.database.host) is customized.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.database.host` {#opt-services.discourse.database.host}

Discourse database hostname. `null` means
“prefer local unix socket connection”.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.database.ignorePostgresqlVersion` {#opt-services.discourse.database.ignorePostgresqlVersion}

Whether to allow other versions of PostgreSQL than the
recommended one. Only effective when
[`services.discourse.database.createLocally`](#opt-services.discourse.database.createLocally)
is enabled.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.database.name` {#opt-services.discourse.database.name}

Discourse database name.

*Type:* string

*Default:* `"discourse"`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.database.passwordFile` {#opt-services.discourse.database.passwordFile}

File containing the Discourse database user password.

This should be a string, not a nix path, since nix paths are
copied into the world-readable nix store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.database.pool` {#opt-services.discourse.database.pool}

Database connection pool size.

*Type:* signed integer

*Default:* `8`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.database.username` {#opt-services.discourse.database.username}

Discourse database user.

*Type:* string

*Default:* `"discourse"`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.enable` {#opt-services.discourse.enable}

Whether to enable Discourse, an open source discussion platform.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.enableACME` {#opt-services.discourse.enableACME}

Whether an ACME certificate should be used to secure
connections to the server.

*Type:* boolean

*Default:* `true`, unless [`services.discourse.sslCertificate`](#opt-services.discourse.sslCertificate)
and [`services.discourse.sslCertificateKey`](#opt-services.discourse.sslCertificateKey) are set.

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.hostname` {#opt-services.discourse.hostname}

The hostname to serve Discourse on.

*Type:* string

*Default:* `config.networking.fqdnOrHostName`

*Example:* `"discourse.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.mail.contactEmailAddress` {#opt-services.discourse.mail.contactEmailAddress}

Email address of key contact responsible for this
site. Used for critical notifications, as well as on the
`/about` contact form for urgent matters.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.mail.incoming.apiKeyFile` {#opt-services.discourse.mail.incoming.apiKeyFile}

A file containing the Discourse API key used to add
posts and messages from mail. If left at its default
value `null`, one will be automatically
generated.

This should be a string, not a nix path, since nix paths
are copied into the world-readable nix store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.mail.incoming.enable` {#opt-services.discourse.mail.incoming.enable}

Whether to set up Postfix to receive incoming mail.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.mail.incoming.mailReceiverPackage` {#opt-services.discourse.mail.incoming.mailReceiverPackage}

The discourse-mail-receiver package to use.

*Type:* package

*Default:* `pkgs.discourse-mail-receiver`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.mail.incoming.replyEmailAddress` {#opt-services.discourse.mail.incoming.replyEmailAddress}

Template for reply by email incoming email address, for
example: %{reply\_key}@reply.example.com or
replies+%{reply\_key}@example.com

*Type:* string

*Default:* `"%{reply_key}@${config.services.discourse.hostname}"`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.mail.notificationEmailAddress` {#opt-services.discourse.mail.notificationEmailAddress}

The `from:` email address used when
sending all essential system emails. The domain specified
here must have SPF, DKIM and reverse PTR records set
correctly for email to arrive.

*Type:* string

*Default:*

``` nix
"${if config.services.discourse.mail.incoming.enable then "notifications" else "noreply"}@${config.services.discourse.hostname}"
```

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.mail.outgoing.authentication` {#opt-services.discourse.mail.outgoing.authentication}

Authentication type to use, see [https://api.rubyonrails.org/classes/ActionMailer/Base.html](https://api.rubyonrails.org/classes/ActionMailer/Base.html)

*Type:* null or one of "plain", "login", "cram\_md5"

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.mail.outgoing.domain` {#opt-services.discourse.mail.outgoing.domain}

HELO domain to use for outgoing mail.

*Type:* string

*Default:* `config.services.discourse.hostname`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.mail.outgoing.enableStartTLSAuto` {#opt-services.discourse.mail.outgoing.enableStartTLSAuto}

Whether to try to use StartTLS.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.mail.outgoing.forceTLS` {#opt-services.discourse.mail.outgoing.forceTLS}

Force implicit TLS as per RFC 8314 3.3.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.mail.outgoing.opensslVerifyMode` {#opt-services.discourse.mail.outgoing.opensslVerifyMode}

How OpenSSL checks the certificate, see [https://api.rubyonrails.org/classes/ActionMailer/Base.html](https://api.rubyonrails.org/classes/ActionMailer/Base.html)

*Type:* string

*Default:* `"peer"`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.mail.outgoing.passwordFile` {#opt-services.discourse.mail.outgoing.passwordFile}

A file containing the password of the SMTP server account.

This should be a string, not a nix path, since nix paths
are copied into the world-readable nix store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.mail.outgoing.port` {#opt-services.discourse.mail.outgoing.port}

The port of the SMTP server Discourse should use to
send email.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `25`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.mail.outgoing.serverAddress` {#opt-services.discourse.mail.outgoing.serverAddress}

The address of the SMTP server Discourse should use to
send email.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.mail.outgoing.username` {#opt-services.discourse.mail.outgoing.username}

The username of the SMTP server.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.nginx.enable` {#opt-services.discourse.nginx.enable}

Whether an `nginx` virtual host should be
set up to serve Discourse. Only disable if you're planning
to use a different web server, which is not recommended.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.package` {#opt-services.discourse.package}

The discourse package to use.

*Type:* package

*Default:* `pkgs.discourse`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.plugins` {#opt-services.discourse.plugins}

Plugins to install as part of Discourse, expressed as a list of derivations.

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
with config.services.discourse.package.plugins; [
  discourse-canned-replies
  discourse-github
];
```

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.redis.dbNumber` {#opt-services.discourse.redis.dbNumber}

Redis database number.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.redis.host` {#opt-services.discourse.redis.host}

Redis server hostname.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.redis.passwordFile` {#opt-services.discourse.redis.passwordFile}

File containing the Redis password.

This should be a string, not a nix path, since nix paths are
copied into the world-readable nix store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.redis.useSSL` {#opt-services.discourse.redis.useSSL}

Connect to Redis with SSL.

*Type:* boolean

*Default:* `config.services.discourse.redis.host != "localhost"`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.secretKeyBaseFile` {#opt-services.discourse.secretKeyBaseFile}

The path to a file containing the
`secret_key_base` secret.

Discourse uses `secret_key_base` to encrypt
the cookie store, which contains session data, and to digest
user auth tokens.

Needs to be a 64 byte long string of hexadecimal
characters. You can generate one by running

```
openssl rand -hex 64 >/path/to/secret_key_base_file
```

This should be a string, not a nix path, since nix paths are
copied into the world-readable nix store.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/secret_key_base"`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.sidekiqProcesses` {#opt-services.discourse.sidekiqProcesses}

How many Sidekiq processes should be spawned.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.siteSettings` {#opt-services.discourse.siteSettings}

Discourse site settings. These are the settings that can be
changed from the UI. This only defines their default values:
they can still be overridden from the UI.

Available settings can be found by looking in the
[site\_settings.yml](https://github.com/discourse/discourse/blob/master/config/site_settings.yml)
file of the upstream distribution. To find a setting's path,
you only need to care about the first two levels; i.e. its
category and name. See the example.

Settings containing secret data should be set to an
attribute set containing the attribute
`_secret` - a string pointing to a file
containing the value the option should be set to. See the
example to get a better picture of this: in the resulting
`config/nixos_site_settings.json` file,
the `login.github_client_secret` key will
be set to the contents of the
`/run/keys/discourse_github_client_secret`
file.

*Type:* JSON value

*Default:* `{ }`

*Example:*

``` nix
{
  required = {
    title = "My Cats";
    site_description = "Discuss My Cats (and be nice plz)";
  };
  login = {
    enable_github_logins = true;
    github_client_id = "a2f6dfe838cb3206ce20";
    github_client_secret._secret = /run/keys/discourse_github_client_secret;
  };
};
```

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.sslCertificate` {#opt-services.discourse.sslCertificate}

The path to the server SSL certificate. Set this to enable
SSL.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/ssl.cert"`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.sslCertificateKey` {#opt-services.discourse.sslCertificateKey}

The path to the server SSL certificate key. Set this to
enable SSL.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/ssl.key"`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.discourse.unicornTimeout` {#opt-services.discourse.unicornTimeout}

Time in seconds before a request to Unicorn times out.

This can be raised if the system Discourse is running on is
too slow to handle many requests within 30 seconds.

*Type:* signed integer

*Default:* `30`

*Declared by:* [`nixos/modules/services/web-apps/discourse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/discourse.nix)

## `services.disnix.enable` {#opt-services.disnix.enable}

Whether to enable Disnix.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/disnix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/disnix.nix)

## `services.disnix.enableMultiUser` {#opt-services.disnix.enableMultiUser}

Whether to support multi-user mode by enabling the Disnix D-Bus service

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/disnix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/disnix.nix)

## `services.disnix.enableProfilePath` {#opt-services.disnix.enableProfilePath}

Whether to enable exposing the Disnix profiles in the system's PATH.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/disnix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/disnix.nix)

## `services.disnix.package` {#opt-services.disnix.package}

The disnix package to use.

*Type:* package

*Default:* `pkgs.disnix`

*Declared by:* [`nixos/modules/services/misc/disnix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/disnix.nix)

## `services.disnix.profiles` {#opt-services.disnix.profiles}

Names of the Disnix profiles to expose in the system's PATH

*Type:* list of string

*Default:*

``` nix
[
  "default"
]
```

*Declared by:* [`nixos/modules/services/misc/disnix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/disnix.nix)

## `services.disnix.useWebServiceInterface` {#opt-services.disnix.useWebServiceInterface}

Whether to enable the DisnixWebService interface running on Apache Tomcat.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/disnix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/disnix.nix)

## `services.displayManager.airlock.compositor.extraArgs` {#opt-services.displayManager.airlock.compositor.extraArgs}

Arguments to pass to the compositor (defaults to cage).

*Type:* list of string

*Default:*

``` nix
[
  "-s"
]
```

*Example:*

``` nix
[
  "-s"
  "-m"
  "last"
]
```

*Declared by:* [`nixos/modules/services/display-managers/airlock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/airlock.nix)

## `services.displayManager.airlock.compositor.package` {#opt-services.displayManager.airlock.compositor.package}

The cage package to use.

*Type:* package

*Default:* `pkgs.cage`

*Declared by:* [`nixos/modules/services/display-managers/airlock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/airlock.nix)

## `services.displayManager.airlock.enable` {#opt-services.displayManager.airlock.enable}

Whether to enable Airlock, a clean and modern Material Design 3 Quickshell greeter for greetd.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/display-managers/airlock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/airlock.nix)

## `services.displayManager.airlock.extraArgs` {#opt-services.displayManager.airlock.extraArgs}

Extra command-line arguments to pass to `astra-airlock` (e.g. display output options).

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--only"
  "DP-1"
]
```

*Declared by:* [`nixos/modules/services/display-managers/airlock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/airlock.nix)

## `services.displayManager.airlock.package` {#opt-services.displayManager.airlock.package}

The airlock package to use.

*Type:* package

*Default:* `pkgs.airlock`

*Declared by:* [`nixos/modules/services/display-managers/airlock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/airlock.nix)

## `services.displayManager.airlock.syncDynamicScheme.enable` {#opt-services.displayManager.airlock.syncDynamicScheme.enable}

Whether to enable sudoers permissions for wheel users to sync active desktop themes to the greeter non-interactively.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/display-managers/airlock.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/airlock.nix)

## `services.displayManager.autoLogin` {#opt-services.displayManager.autoLogin}

Auto login configuration attrset.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/display-managers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/default.nix)

## `services.displayManager.autoLogin.enable` {#opt-services.displayManager.autoLogin.enable}

Automatically log in as [`services.displayManager.autoLogin.user`](#opt-services.displayManager.autoLogin.user).

*Type:* boolean

*Default:* `config.services.displayManager.autoLogin.user != null`

*Declared by:* [`nixos/modules/services/display-managers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/default.nix)

## `services.displayManager.autoLogin.user` {#opt-services.displayManager.autoLogin.user}

User to be used for the automatic login.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/display-managers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/default.nix)

## `services.displayManager.cosmic-greeter.enable` {#opt-services.displayManager.cosmic-greeter.enable}

Whether to enable COSMIC greeter.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/display-managers/cosmic-greeter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/cosmic-greeter.nix)

## `services.displayManager.cosmic-greeter.package` {#opt-services.displayManager.cosmic-greeter.package}

The cosmic-greeter package to use.

*Type:* package

*Default:* `pkgs.cosmic-greeter`

*Declared by:* [`nixos/modules/services/display-managers/cosmic-greeter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/cosmic-greeter.nix)

## `services.displayManager.defaultSession` {#opt-services.displayManager.defaultSession}

Graphical session to pre-select in the session chooser (only effective for GDM, LightDM and SDDM).

On GDM, LightDM and SDDM, it will also be used as a session for auto-login.

Set this option to empty string to get an error with a list of currently available sessions.

*Type:* null or session name

*Default:* `null`

*Example:* `"gnome"`

*Declared by:* [`nixos/modules/services/display-managers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/default.nix)

## `services.displayManager.dux-greeter.compositor.customConfig` {#opt-services.displayManager.dux-greeter.compositor.customConfig}

Custom compositor configuration to use for the greeter session.

This configuration is written to a file and passed to the compositor
when launching the greeter. The format and available options depend
on the selected compositor.

Leave empty to use the system's default compositor configuration.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  # Niri example
  input {
      keyboard {
          xkb {
              layout "us"
          }
      }
  }
''
```

*Declared by:* [`nixos/modules/services/display-managers/dux-greeter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/dux-greeter.nix)

## `services.displayManager.dux-greeter.compositor.name` {#opt-services.displayManager.dux-greeter.compositor.name}

The Wayland compositor to run the greeter in.

The specified compositor must be enabled via its corresponding
`programs.<compositor>.enable` option.

Supported compositors:

- niri: A scrollable-tiling Wayland compositor
- hyprland: A dynamic tiling Wayland compositor
- sway: An i3-compatible Wayland compositor
- mango: A dwm-inspired Wayland compositor with modern config options and multiple layouts
- miracle-wm: A keyboard-driven Wayland compositor with smooth animations and extensibility
- labwc: Lightweight stacking Wayland compositor inspired by Openbox

*Type:* one of "niri", "hyprland", "sway", "mangowc", "miracle-wm", "labwc"

*Example:* `"niri"`

*Declared by:* [`nixos/modules/services/display-managers/dux-greeter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/dux-greeter.nix)

## `services.displayManager.dux-greeter.configFiles` {#opt-services.displayManager.dux-greeter.configFiles}

List of Dux Shell configuration files to copy into the greeter
data directory at `/var/lib/dms-greeter`.

This is useful for preserving user preferences like wallpapers, themes,
and other settings in the greeter screen.

::: tip
Use `configHome` instead if your configuration files are in
standard XDG locations.
:::

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/home/user/.config/dms/settings.json"
  "/home/user/.local/state/dms/session.json"
]
```

*Declared by:* [`nixos/modules/services/display-managers/dux-greeter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/dux-greeter.nix)

## `services.displayManager.dux-greeter.configHome` {#opt-services.displayManager.dux-greeter.configHome}

Path to a user's home directory from which to copy Dux Shell
configuration files.

When set, the following files will be automatically copied to the greeter:

- `~/.config/dms/settings.json`
- `~/.local/state/dms/session.json`
- `~/.cache/dms/dms-colors.json`

Legacy files from the deprecated `DankMaterialShell` directories are
also copied, with files from the current `dms` directories taking precedence.

If your configuration files are in non-standard locations, use the
`configFiles` option instead.

*Type:* null or string

*Default:* `null`

*Example:* `"/home/alice"`

*Declared by:* [`nixos/modules/services/display-managers/dux-greeter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/dux-greeter.nix)

## `services.displayManager.dux-greeter.enable` {#opt-services.displayManager.dux-greeter.enable}

Whether to enable Dux Greeter.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/display-managers/dux-greeter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/dux-greeter.nix)

## `services.displayManager.dux-greeter.logs.path` {#opt-services.displayManager.dux-greeter.logs.path}

File path where Dux Greeter logs will be saved.

This is useful for debugging greeter issues. Logs will include
output from both the greeter and the compositor.

*Type:* absolute path

*Default:* `"/tmp/dms-greeter.log"`

*Example:* `"/var/log/dms-greeter.log"`

*Declared by:* [`nixos/modules/services/display-managers/dux-greeter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/dux-greeter.nix)

## `services.displayManager.dux-greeter.logs.save` {#opt-services.displayManager.dux-greeter.logs.save}

Whether to enable saving logs from Dux Greeter to a file.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/display-managers/dux-greeter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/dux-greeter.nix)

## `services.displayManager.dux-greeter.package` {#opt-services.displayManager.dux-greeter.package}

The dux-greeter package to use.

*Type:* package

*Default:* `pkgs.dux-greeter`

*Declared by:* [`nixos/modules/services/display-managers/dux-greeter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/dux-greeter.nix)

## `services.displayManager.dux-greeter.quickshell.package` {#opt-services.displayManager.dux-greeter.quickshell.package}

The Quickshell package to use for the greeter.

Defaults to the quickshell package from `programs.dux-shell` if it is enabled,
otherwise defaults to `pkgs.quickshell`.

*Type:* package

*Default:*

``` nix
if config.programs.dux-shell.enable
then config.programs.dux-shell.quickshell.package
else pkgs.quickshell;
```

*Declared by:* [`nixos/modules/services/display-managers/dux-greeter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/dux-greeter.nix)

## `services.displayManager.enable` {#opt-services.displayManager.enable}

Whether to enable shared display manager integration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/display-managers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/default.nix)

## `services.displayManager.gdm.autoLogin.delay` {#opt-services.displayManager.gdm.autoLogin.delay}

Seconds of inactivity after which the autologin will be performed.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/display-managers/gdm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/gdm.nix)

## `services.displayManager.gdm.autoSuspend` {#opt-services.displayManager.gdm.autoSuspend}

On the GNOME Display Manager login screen, suspend the machine after inactivity.
(Does not affect automatic suspend while logged in, or at lock screen.)

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/display-managers/gdm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/gdm.nix)

## `services.displayManager.gdm.banner` {#opt-services.displayManager.gdm.banner}

Optional message to display on the login screen.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Example:*

``` nix
''
  foo
  bar
  baz
''
```

*Declared by:* [`nixos/modules/services/display-managers/gdm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/gdm.nix)

## `services.displayManager.gdm.debug` {#opt-services.displayManager.gdm.debug}

Whether to enable debugging messages in GDM.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/display-managers/gdm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/gdm.nix)

## `services.displayManager.gdm.enable` {#opt-services.displayManager.gdm.enable}

Whether to enable GDM, the GNOME Display Manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/display-managers/gdm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/gdm.nix)

## `services.displayManager.gdm.extraPackages` {#opt-services.displayManager.gdm.extraPackages}

Additional packages to add to XDG\_DATA\_DIRS for GDM.
The `/share` directory of each package will be added to the data path.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.gnome-themes-extra ]`

*Declared by:* [`nixos/modules/services/display-managers/gdm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/gdm.nix)

## `services.displayManager.gdm.settings` {#opt-services.displayManager.gdm.settings}

Options passed to the gdm daemon.
See [here](https://help.gnome.org/admin/gdm/stable/configuration.html.en#daemonconfig) for supported options.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  debug = {
    enable = true;
  };
}
```

*Declared by:* [`nixos/modules/services/display-managers/gdm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/gdm.nix)

## `services.displayManager.generic.enable` {#opt-services.displayManager.generic.enable}

Whether to enable generic display manager integration - deprecated.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/display-managers/generic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/generic.nix)

## `services.displayManager.generic.environment` {#opt-services.displayManager.generic.environment}

Additional environment variables needed by the display manager.

*Type:* attribute set of unspecified value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/display-managers/generic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/generic.nix)

## `services.displayManager.generic.execCmd` {#opt-services.displayManager.generic.execCmd}

Command to start the display manager.

*Type:* null or string

*Default:* `null`

*Example:* `"${pkgs.lightdm}/bin/lightdm"`

*Declared by:* [`nixos/modules/services/display-managers/generic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/generic.nix)

## `services.displayManager.generic.preStart` {#opt-services.displayManager.generic.preStart}

Script executed before the display manager is started.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"rm -f /var/log/my-display-manager.log"`

*Declared by:* [`nixos/modules/services/display-managers/generic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/generic.nix)

## `services.displayManager.hiddenUsers` {#opt-services.displayManager.hiddenUsers}

A list of users which will not be shown in the display manager.

*Type:* list of string

*Default:*

``` nix
[
  "nobody"
]
```

*Declared by:* [`nixos/modules/services/display-managers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/default.nix)

## `services.displayManager.lemurs.enable` {#opt-services.displayManager.lemurs.enable}

Whether to enable lemurs, a customizable TUI display/login manager.

::: note
For Wayland compositors, your user must be in the "seat" group.
:::

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/display-managers/lemurs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/lemurs.nix)

## `services.displayManager.lemurs.package` {#opt-services.displayManager.lemurs.package}

The lemurs package to use.

*Type:* package

*Default:* `pkgs.lemurs`

*Declared by:* [`nixos/modules/services/display-managers/lemurs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/lemurs.nix)

## `services.displayManager.lemurs.settings` {#opt-services.displayManager.lemurs.settings}

Configuration for lemurs, provided as a Nix attribute set and automatically
serialized to TOML.
See [lemurs configuration documentation](https://github.com/coastalwhite/lemurs/blob/main/extra/config.toml) for available options.

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  do_log = true;
}
```

*Declared by:* [`nixos/modules/services/display-managers/lemurs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/lemurs.nix)

## `services.displayManager.logToFile` {#opt-services.displayManager.logToFile}

Whether the display manager redirects the output of the
session script to `~/.xsession-errors`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/display-managers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/default.nix)

## `services.displayManager.logToJournal` {#opt-services.displayManager.logToJournal}

Whether the display manager redirects the output of the
session script to the systemd journal.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/display-managers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/default.nix)

## `services.displayManager.ly.enable` {#opt-services.displayManager.ly.enable}

Whether to enable ly as the display manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/display-managers/ly.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/ly.nix)

## `services.displayManager.ly.package` {#opt-services.displayManager.ly.package}

The ly package to use.

*Type:* package

*Default:* `pkgs.ly`

*Declared by:* [`nixos/modules/services/display-managers/ly.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/ly.nix)

## `services.displayManager.ly.settings` {#opt-services.displayManager.ly.settings}

Extra settings merged in and overwriting defaults in config.ini.

*Type:* attribute set of (INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  load = false;
  save = false;
}
```

*Declared by:* [`nixos/modules/services/display-managers/ly.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/ly.nix)

## `services.displayManager.ly.x11Support` {#opt-services.displayManager.ly.x11Support}

Whether to enable support for X11

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/display-managers/ly.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/ly.nix)

## `services.displayManager.noctalia-greeter.cursorTheme.name` {#opt-services.displayManager.noctalia-greeter.cursorTheme.name}

Name of the cursor theme to use for noctalia-greeter.

*Type:* string

*Default:* `"Adwaita"`

*Declared by:* [`nixos/modules/services/display-managers/noctalia-greeter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/noctalia-greeter.nix)

## `services.displayManager.noctalia-greeter.cursorTheme.package` {#opt-services.displayManager.noctalia-greeter.cursorTheme.package}

The cursor theme package to use.

*Type:* null or package

*Default:* `null`

*Declared by:* [`nixos/modules/services/display-managers/noctalia-greeter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/noctalia-greeter.nix)

## `services.displayManager.noctalia-greeter.enable` {#opt-services.displayManager.noctalia-greeter.enable}

Whether to enable Noctalia Greeter, a minimal login greeter for greetd.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/display-managers/noctalia-greeter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/noctalia-greeter.nix)

## `services.displayManager.noctalia-greeter.extraArgs` {#opt-services.displayManager.noctalia-greeter.extraArgs}

Arguments to add to the noctalia-greeter-session invocation.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/display-managers/noctalia-greeter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/noctalia-greeter.nix)

## `services.displayManager.noctalia-greeter.package` {#opt-services.displayManager.noctalia-greeter.package}

The noctalia-greeter package to use.

*Type:* package

*Default:* `pkgs.noctalia-greeter`

*Declared by:* [`nixos/modules/services/display-managers/noctalia-greeter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/noctalia-greeter.nix)

## `services.displayManager.noctalia-greeter.passwordlessSyncUsers` {#opt-services.displayManager.noctalia-greeter.passwordlessSyncUsers}

Local users allowed to apply the constrained appearance-only sync through
Polkit without authentication. The constrained sync operation never accepts
session command configuration. Leave empty to require administrator
authentication for every sync.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "alice"
]
```

*Declared by:* [`nixos/modules/services/display-managers/noctalia-greeter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/noctalia-greeter.nix)

## `services.displayManager.noctalia-greeter.settings` {#opt-services.displayManager.noctalia-greeter.settings}

Settings for noctalia-greeter written to greeter.toml.

Note that it also can contain some state, like the most recently used
session, which will be clobbered on every activation and boot. This is
due to an upstream limitation; the state is due to be moved to another
file.

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  cursor = {
    size = 24;
    theme = "Adwaita";
  };
  keyboard = {
    layout = "us";
  };
}
```

*Declared by:* [`nixos/modules/services/display-managers/noctalia-greeter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/noctalia-greeter.nix)

## `services.displayManager.phrog.enable` {#opt-services.displayManager.phrog.enable}

Whether to enable phrog, a touch-friendly greetd greeter built on Phosh. Configures greetd
to run it under phoc, replacing the display manager
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/display-managers/phrog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/phrog.nix)

## `services.displayManager.phrog.home` {#opt-services.displayManager.phrog.home}

Home directory for greetd's `greeter` user. phrog persists its
`last-user` and `last-session` settings through dconf, which needs a
writable home; the default `greeter` account has none.

*Type:* absolute path

*Default:* `"/run/phrog"`

*Declared by:* [`nixos/modules/services/display-managers/phrog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/phrog.nix)

## `services.displayManager.phrog.osk.enable` {#opt-services.displayManager.phrog.osk.enable}

Whether to enable Start an on-screen keyboard next to the greeter. Without it there is
no way to type a password on a device with no hardware keyboard.
.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/display-managers/phrog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/phrog.nix)

## `services.displayManager.phrog.osk.package` {#opt-services.displayManager.phrog.osk.package}

Package providing the OSK binary.

*Type:* package

*Default:* `pkgs.squeekboard`

*Example:* `"pkgs.stevia"`

*Declared by:* [`nixos/modules/services/display-managers/phrog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/phrog.nix)

## `services.displayManager.phrog.package` {#opt-services.displayManager.phrog.package}

The phrog package to use.

*Type:* package

*Default:* `pkgs.phrog`

*Declared by:* [`nixos/modules/services/display-managers/phrog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/phrog.nix)

## `services.displayManager.phrog.phocConfig` {#opt-services.displayManager.phrog.phocConfig}

Config rendered to the `phoc.ini` the greeter's compositor is started with.
The default sets suitable scale for a phone and assumes output is DSI-1

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:*

``` nix
{
  core = {
    xwayland = false;
  };
  "output:DSI-1" = {
    scale = 2;
  };
}
```

*Declared by:* [`nixos/modules/services/display-managers/phrog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/phrog.nix)

## `services.displayManager.phrog.phocPackage` {#opt-services.displayManager.phrog.phocPackage}

The phoc compositor the greeter runs under.

*Type:* package

*Default:* `pkgs.phoc`

*Declared by:* [`nixos/modules/services/display-managers/phrog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/phrog.nix)

## `services.displayManager.plasma-login-manager.enable` {#opt-services.displayManager.plasma-login-manager.enable}

Whether to enable Plasma Login Manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/display-managers/plasma-login-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/plasma-login-manager.nix)

## `services.displayManager.plasma-login-manager.package` {#opt-services.displayManager.plasma-login-manager.package}

The plasma-login-manager package to use.

*Type:* package

*Default:* `pkgs.kdePackages.plasma-login-manager`

*Declared by:* [`nixos/modules/services/display-managers/plasma-login-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/plasma-login-manager.nix)

## `services.displayManager.plasma-login-manager.settings` {#opt-services.displayManager.plasma-login-manager.settings}

Additional settings for Plasma Login Manager (see `man plasmalogin.conf`)

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  Users = {
    ReuseSession = false;
  };
}
```

*Declared by:* [`nixos/modules/services/display-managers/plasma-login-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/plasma-login-manager.nix)

## `services.displayManager.regreet.cageArgs` {#opt-services.displayManager.regreet.cageArgs}

Arguments to be passed to [cage](https://github.com/cage-kiosk/cage)
when using it as the default compositor.

*Type:* list of string

*Default:*

``` nix
[
  "-s"
  "-d"
]
```

*Example:*

``` nix
[ "-s" "-d" "-m" "last" ]
```

*Declared by:* [`nixos/modules/services/display-managers/regreet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/regreet.nix)

## `services.displayManager.regreet.cursorTheme.name` {#opt-services.displayManager.regreet.cursorTheme.name}

Name of the cursor theme to use for regreet.

*Type:* string

*Default:* `"Adwaita"`

*Declared by:* [`nixos/modules/services/display-managers/regreet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/regreet.nix)

## `services.displayManager.regreet.cursorTheme.package` {#opt-services.displayManager.regreet.cursorTheme.package}

The package that provides the cursor theme given in the name option.

*Type:* package

*Default:* `pkgs.adwaita-icon-theme`

*Declared by:* [`nixos/modules/services/display-managers/regreet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/regreet.nix)

## `services.displayManager.regreet.enable` {#opt-services.displayManager.regreet.enable}

Enable ReGreet, a clean and customizable greeter for greetd.

By default enables `services.greetd` and configures a
`default_session` to launch ReGreet using the
`cage` compositor.

See the
[ReGreet Readme](https://github.com/rharish101/ReGreet#set-as-default-session)
for other examples.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/display-managers/regreet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/regreet.nix)

## `services.displayManager.regreet.extraCss` {#opt-services.displayManager.regreet.extraCss}

Extra CSS rules to apply on top of the GTK theme. Refer to
[GTK CSS Properties](https://docs.gtk.org/gtk4/css-properties.html) for
modifiable properties.

*Type:* absolute path or strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/display-managers/regreet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/regreet.nix)

## `services.displayManager.regreet.font.name` {#opt-services.displayManager.regreet.font.name}

Name of the font to use for regreet.

*Type:* string

*Default:* `"Cantarell"`

*Declared by:* [`nixos/modules/services/display-managers/regreet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/regreet.nix)

## `services.displayManager.regreet.font.package` {#opt-services.displayManager.regreet.font.package}

The package that provides the font given in the name option.

*Type:* package

*Default:* `pkgs.cantarell-fonts`

*Declared by:* [`nixos/modules/services/display-managers/regreet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/regreet.nix)

## `services.displayManager.regreet.font.size` {#opt-services.displayManager.regreet.font.size}

Size of the font to use for regreet.

*Type:* positive integer, meaning \>0

*Default:* `16`

*Declared by:* [`nixos/modules/services/display-managers/regreet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/regreet.nix)

## `services.displayManager.regreet.iconTheme.name` {#opt-services.displayManager.regreet.iconTheme.name}

Name of the icon theme to use for regreet.

*Type:* string

*Default:* `"Adwaita"`

*Declared by:* [`nixos/modules/services/display-managers/regreet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/regreet.nix)

## `services.displayManager.regreet.iconTheme.package` {#opt-services.displayManager.regreet.iconTheme.package}

The package that provides the icon theme given in the name option.

*Type:* package

*Default:* `pkgs.adwaita-icon-theme`

*Declared by:* [`nixos/modules/services/display-managers/regreet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/regreet.nix)

## `services.displayManager.regreet.package` {#opt-services.displayManager.regreet.package}

The regreet package to use.

*Type:* package

*Default:* `pkgs.regreet`

*Declared by:* [`nixos/modules/services/display-managers/regreet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/regreet.nix)

## `services.displayManager.regreet.settings` {#opt-services.displayManager.regreet.settings}

ReGreet configuration file. Refer
[https://github.com/rharish101/ReGreet/blob/main/regreet.sample.toml](https://github.com/rharish101/ReGreet/blob/main/regreet.sample.toml)
for options.

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/display-managers/regreet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/regreet.nix)

## `services.displayManager.regreet.theme.name` {#opt-services.displayManager.regreet.theme.name}

Name of the theme to use for regreet.

*Type:* string

*Default:* `"Adwaita"`

*Declared by:* [`nixos/modules/services/display-managers/regreet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/regreet.nix)

## `services.displayManager.regreet.theme.package` {#opt-services.displayManager.regreet.theme.package}

The package that provides the theme given in the name option. Not needed
for `Adwaita`, `Adwaita-dark`, `HighContrast` and `HighContrastInverse`,
which GTK4 provides itself.

*Type:* null or package

*Default:* `null`

*Declared by:* [`nixos/modules/services/display-managers/regreet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/regreet.nix)

## `services.displayManager.sddm.autoLogin.minimumUid` {#opt-services.displayManager.sddm.autoLogin.minimumUid}

Minimum user ID for auto-login user.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1000`

*Declared by:* [`nixos/modules/services/display-managers/sddm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/sddm.nix)

## `services.displayManager.sddm.autoLogin.relogin` {#opt-services.displayManager.sddm.autoLogin.relogin}

If true automatic login will kick in again on session exit (logout), otherwise it
will only log in automatically when the display-manager is started.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/display-managers/sddm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/sddm.nix)

## `services.displayManager.sddm.autoNumlock` {#opt-services.displayManager.sddm.autoNumlock}

Enable numlock at login.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/display-managers/sddm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/sddm.nix)

## `services.displayManager.sddm.enable` {#opt-services.displayManager.sddm.enable}

Whether to enable sddm as the display manager.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/display-managers/sddm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/sddm.nix)

## `services.displayManager.sddm.enableHidpi` {#opt-services.displayManager.sddm.enableHidpi}

Whether to enable automatic HiDPI mode.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/display-managers/sddm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/sddm.nix)

## `services.displayManager.sddm.extraPackages` {#opt-services.displayManager.sddm.extraPackages}

Extra Qt plugins / QML libraries to add to the environment.

*Type:* list of package

*Default:* `"[]"`

*Declared by:* [`nixos/modules/services/display-managers/sddm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/sddm.nix)

## `services.displayManager.sddm.package` {#opt-services.displayManager.sddm.package}

The sddm package to use.

*Type:* package

*Default:* `pkgs.kdePackages.sddm`

*Declared by:* [`nixos/modules/services/display-managers/sddm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/sddm.nix)

## `services.displayManager.sddm.settings` {#opt-services.displayManager.sddm.settings}

Extra settings merged in and overwriting defaults in sddm.conf.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  Autologin = {
    Session = "plasma.desktop";
    User = "john";
  };
}
```

*Declared by:* [`nixos/modules/services/display-managers/sddm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/sddm.nix)

## `services.displayManager.sddm.setupScript` {#opt-services.displayManager.sddm.setupScript}

A script to execute when starting the display server. DEPRECATED, please
use [`services.xserver.displayManager.setupCommands`](../../options/services-x/index.md#opt-services.xserver.displayManager.setupCommands).

*Type:* string

*Default:* `""`

*Example:*

``` nix
''
  # workaround for using NVIDIA Optimus without Bumblebee
  xrandr --setprovideroutputsource modesetting NVIDIA-0
  xrandr --auto
''
```

*Declared by:* [`nixos/modules/services/display-managers/sddm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/sddm.nix)

## `services.displayManager.sddm.stopScript` {#opt-services.displayManager.sddm.stopScript}

A script to execute when stopping the display server.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/display-managers/sddm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/sddm.nix)

## `services.displayManager.sddm.theme` {#opt-services.displayManager.sddm.theme}

Greeter theme to use.

*Type:* string

*Default:* `""`

*Example:* `"${pkgs.where-is-my-sddm-theme.override { variants = [ "qt5" ]; }}/share/sddm/themes/where_is_my_sddm_theme_qt5"`

*Declared by:* [`nixos/modules/services/display-managers/sddm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/sddm.nix)

## `services.displayManager.sddm.wayland.compositor` {#opt-services.displayManager.sddm.wayland.compositor}

The compositor to use: kwin, weston

*Type:* one of "kwin", "weston"

*Default:* `"weston"`

*Declared by:* [`nixos/modules/services/display-managers/sddm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/sddm.nix)

## `services.displayManager.sddm.wayland.enable` {#opt-services.displayManager.sddm.wayland.enable}

Whether to enable experimental Wayland support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/display-managers/sddm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/sddm.nix)

## `services.displayManager.sessionPackages` {#opt-services.displayManager.sessionPackages}

A list of packages containing x11 or wayland session files to be passed to the display manager.

*Type:* list of package with provided sessions

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/display-managers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/default.nix)

## `services.distccd.allowedClients` {#opt-services.distccd.allowedClients}

Client IPs which are allowed to connect to distccd in CIDR notation.

Anyone who can connect to the distccd server can run arbitrary
commands on that system as the distcc user, therefore you should use
this judiciously.

*Type:* list of string

*Default:*

``` nix
[
  "127.0.0.1"
]
```

*Example:*

``` nix
[
  "127.0.0.1"
  "192.168.0.0/24"
  "10.0.0.0/24"
]
```

*Declared by:* [`nixos/modules/services/development/distccd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/distccd.nix)

## `services.distccd.enable` {#opt-services.distccd.enable}

Whether to enable distccd, a distributed C/C++ compiler.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/development/distccd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/distccd.nix)

## `services.distccd.jobTimeout` {#opt-services.distccd.jobTimeout}

Maximum duration, in seconds, of a single compilation request.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/development/distccd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/distccd.nix)

## `services.distccd.logLevel` {#opt-services.distccd.logLevel}

Set the minimum severity of error that will be included in the log
file. Useful if you only want to see error messages rather than an
entry for each connection.

*Type:* null or one of "critical", "error", "warning", "notice", "info", "debug"

*Default:* `"warning"`

*Declared by:* [`nixos/modules/services/development/distccd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/distccd.nix)

## `services.distccd.maxJobs` {#opt-services.distccd.maxJobs}

Maximum number of tasks distccd should execute at lib.any time.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/development/distccd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/distccd.nix)

## `services.distccd.nice` {#opt-services.distccd.nice}

Niceness of the compilation tasks.

*Type:* null or integer between -20 and 19 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/development/distccd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/distccd.nix)

## `services.distccd.openFirewall` {#opt-services.distccd.openFirewall}

Opens the specified TCP port for distcc.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/development/distccd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/distccd.nix)

## `services.distccd.package` {#opt-services.distccd.package}

The distcc package to use.

*Type:* package

*Default:* `pkgs.distcc`

*Declared by:* [`nixos/modules/services/development/distccd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/distccd.nix)

## `services.distccd.port` {#opt-services.distccd.port}

The TCP port which distccd will listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3632`

*Declared by:* [`nixos/modules/services/development/distccd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/distccd.nix)

## `services.distccd.stats.enable` {#opt-services.distccd.stats.enable}

Whether to enable statistics reporting via HTTP server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/development/distccd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/distccd.nix)

## `services.distccd.stats.port` {#opt-services.distccd.stats.port}

The TCP port which the distccd statistics HTTP server will listen
on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3633`

*Declared by:* [`nixos/modules/services/development/distccd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/distccd.nix)

## `services.distccd.zeroconf` {#opt-services.distccd.zeroconf}

Whether to register via mDNS/DNS-SD

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/development/distccd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/distccd.nix)

## `services.dkimproxy-out.domains` {#opt-services.dkimproxy-out.domains}

List of domains DKIMproxy can sign for.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "example.org"
  "example.com"
]
```

*Declared by:* [`nixos/modules/services/mail/dkimproxy-out.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dkimproxy-out.nix)

## `services.dkimproxy-out.enable` {#opt-services.dkimproxy-out.enable}

Whether to enable dkimproxy\_out.

Note that a key will be auto-generated, and can be found in
/var/lib/dkimproxy-out.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/mail/dkimproxy-out.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dkimproxy-out.nix)

## `services.dkimproxy-out.keySize` {#opt-services.dkimproxy-out.keySize}

Size of the RSA key to use to sign outgoing emails. Note that the
maximum mandatorily verified as per RFC6376 is 2048.

*Type:* signed integer

*Default:* `2048`

*Declared by:* [`nixos/modules/services/mail/dkimproxy-out.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dkimproxy-out.nix)

## `services.dkimproxy-out.listen` {#opt-services.dkimproxy-out.listen}

Address:port DKIMproxy should listen on.

*Type:* string

*Example:* `"127.0.0.1:10027"`

*Declared by:* [`nixos/modules/services/mail/dkimproxy-out.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dkimproxy-out.nix)

## `services.dkimproxy-out.relay` {#opt-services.dkimproxy-out.relay}

Address:port DKIMproxy should forward mail to.

*Type:* string

*Example:* `"127.0.0.1:10028"`

*Declared by:* [`nixos/modules/services/mail/dkimproxy-out.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dkimproxy-out.nix)

## `services.dkimproxy-out.selector` {#opt-services.dkimproxy-out.selector}

The selector to use for DKIM key identification.

For example, if 'selector1' is used here, then for each domain
'example.org' given in `domain`, 'selector1.\_domainkey.example.org'
should contain the TXT record indicating the public key is the one
in /var/lib/dkimproxy-out/public.key: "v=DKIM1; t=s; p=\[THE PUBLIC KEY\]".

*Type:* string

*Example:* `"selector1"`

*Declared by:* [`nixos/modules/services/mail/dkimproxy-out.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dkimproxy-out.nix)

## `services.dleyna.enable` {#opt-services.dleyna.enable}

Whether to enable dleyna-renderer and dleyna-server service,
a DBus service for handling DLNA servers and renderers.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/desktops/dleyna.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/dleyna.nix)

## `services.dnscache.clientIps` {#opt-services.dnscache.clientIps}

Client IP addresses (or prefixes) from which to accept connections.

*Type:* list of string

*Default:*

``` nix
[
  "127.0.0.1"
]
```

*Example:*

``` nix
[
  "192.168"
  "172.23.75.82"
]
```

*Declared by:* [`nixos/modules/services/networking/dnscache.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnscache.nix)

## `services.dnscache.domainServers` {#opt-services.dnscache.domainServers}

Table of {hostname: server} pairs to use as authoritative servers for hosts (and subhosts).
If entry for @ is not specified predefined list of root servers is used.

*Type:* attribute set of list of string

*Default:* `{ }`

*Example:*

``` nix
{
  "@" = ["8.8.8.8" "8.8.4.4"];
  "example.com" = ["192.168.100.100"];
}
```

*Declared by:* [`nixos/modules/services/networking/dnscache.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnscache.nix)

## `services.dnscache.enable` {#opt-services.dnscache.enable}

Whether to run the dnscache caching dns server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/dnscache.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnscache.nix)

## `services.dnscache.forwardOnly` {#opt-services.dnscache.forwardOnly}

Whether to treat root servers (for @) as caching
servers, requesting addresses the same way a client does. This is
needed if you want to use e.g. Google DNS as your upstream DNS.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/dnscache.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnscache.nix)

## `services.dnscache.ip` {#opt-services.dnscache.ip}

IP address on which to listen for connections.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/networking/dnscache.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnscache.nix)

## `services.dnscache.package` {#opt-services.dnscache.package}

The djbdns package to use.

*Type:* package

*Default:* `pkgs.djbdns`

*Declared by:* [`nixos/modules/services/networking/dnscache.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnscache.nix)

## `services.dnscrypt-proxy.configFile` {#opt-services.dnscrypt-proxy.configFile}

Path to TOML config file. See: [https://github.com/DNSCrypt/dnscrypt-proxy/blob/master/dnscrypt-proxy/example-dnscrypt-proxy.toml](https://github.com/DNSCrypt/dnscrypt-proxy/blob/master/dnscrypt-proxy/example-dnscrypt-proxy.toml)
If this option is set, it will override any configuration done in options.services.dnscrypt-proxy.settings.

*Type:* absolute path

*Default:* TOML file generated from [`services.dnscrypt-proxy.settings`](#opt-services.dnscrypt-proxy.settings)

*Example:* `"/etc/dnscrypt-proxy/dnscrypt-proxy.toml"`

*Declared by:* [`nixos/modules/services/networking/dnscrypt-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnscrypt-proxy.nix)

## `services.dnscrypt-proxy.enable` {#opt-services.dnscrypt-proxy.enable}

Whether to enable dnscrypt-proxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/dnscrypt-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnscrypt-proxy.nix)

## `services.dnscrypt-proxy.package` {#opt-services.dnscrypt-proxy.package}

The dnscrypt-proxy package to use.

*Type:* package

*Default:* `pkgs.dnscrypt-proxy`

*Declared by:* [`nixos/modules/services/networking/dnscrypt-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnscrypt-proxy.nix)

## `services.dnscrypt-proxy.settings` {#opt-services.dnscrypt-proxy.settings}

Attrset that is converted and passed as TOML config file.
For available params, see: [https://github.com/DNSCrypt/dnscrypt-proxy/blob/2.1.20/dnscrypt-proxy/example-dnscrypt-proxy.toml](https://github.com/DNSCrypt/dnscrypt-proxy/blob/2.1.20/dnscrypt-proxy/example-dnscrypt-proxy.toml)

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  sources.public-resolvers = {
    urls = [ "https://download.dnscrypt.info/resolvers-list/v2/public-resolvers.md" ];
    cache_file = "public-resolvers.md";
    minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
    refresh_delay = 72;
  };
}
```

*Declared by:* [`nixos/modules/services/networking/dnscrypt-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnscrypt-proxy.nix)

## `services.dnscrypt-proxy.upstreamDefaults` {#opt-services.dnscrypt-proxy.upstreamDefaults}

Whether to base the config declared in [`services.dnscrypt-proxy.settings`](#opt-services.dnscrypt-proxy.settings) on the upstream example config ([https://github.com/DNSCrypt/dnscrypt-proxy/blob/master/dnscrypt-proxy/example-dnscrypt-proxy.toml](https://github.com/DNSCrypt/dnscrypt-proxy/blob/master/dnscrypt-proxy/example-dnscrypt-proxy.toml))

Disable this if you want to declare your dnscrypt config from scratch.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/dnscrypt-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnscrypt-proxy.nix)

## `services.dnsdist.dnscrypt.certLifetime` {#opt-services.dnsdist.dnscrypt.certLifetime}

The lifetime (in minutes) of the resolver certificate.
This will be automatically rotated before expiration.

*Type:* positive integer, meaning \>0

*Default:* `15`

*Declared by:* [`nixos/modules/services/networking/dnsdist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnsdist.nix)

## `services.dnsdist.dnscrypt.enable` {#opt-services.dnsdist.dnscrypt.enable}

Whether to enable a DNSCrypt endpoint to dnsdist.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/dnsdist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnsdist.nix)

## `services.dnsdist.dnscrypt.listenAddress` {#opt-services.dnsdist.dnscrypt.listenAddress}

Listen IP address of the endpoint

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/networking/dnsdist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnsdist.nix)

## `services.dnsdist.dnscrypt.listenPort` {#opt-services.dnsdist.dnscrypt.listenPort}

Listen port of the endpoint

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `443`

*Declared by:* [`nixos/modules/services/networking/dnsdist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnsdist.nix)

## `services.dnsdist.dnscrypt.providerKey` {#opt-services.dnsdist.dnscrypt.providerKey}

The filepath to the provider secret key.
If not given a new provider key pair will be generated in
/var/lib/dnsdist on the first run.

::: note
The file must be readable by the dnsdist user/group.
:::

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/dnsdist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnsdist.nix)

## `services.dnsdist.dnscrypt.providerName` {#opt-services.dnsdist.dnscrypt.providerName}

The name that will be given to this DNSCrypt resolver.

::: note
The provider name must start with `2.dnscrypt-cert.`.
:::

*Type:* string

*Default:* `2.dnscrypt-cert.${config.networking.hostName}`

*Example:* `"2.dnscrypt-cert.myresolver"`

*Declared by:* [`nixos/modules/services/networking/dnsdist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnsdist.nix)

## `services.dnsdist.enable` {#opt-services.dnsdist.enable}

Whether to enable dnsdist domain name server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/dnsdist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnsdist.nix)

## `services.dnsdist.extraConfig` {#opt-services.dnsdist.extraConfig}

Extra lines to be added verbatim to dnsdist.conf.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/dnsdist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnsdist.nix)

## `services.dnsdist.listenAddress` {#opt-services.dnsdist.listenAddress}

Listen IP address

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/networking/dnsdist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnsdist.nix)

## `services.dnsdist.listenPort` {#opt-services.dnsdist.listenPort}

Listen port

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `53`

*Declared by:* [`nixos/modules/services/networking/dnsdist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnsdist.nix)

## `services.dnsmasq.alwaysKeepRunning` {#opt-services.dnsmasq.alwaysKeepRunning}

If enabled, systemd will always respawn dnsmasq even if shut down manually. The default, disabled, will only restart it on error.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/dnsmasq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnsmasq.nix)

## `services.dnsmasq.configFile` {#opt-services.dnsmasq.configFile}

Path to the configuration file of dnsmasq.

*Type:* package

*Default:* `Path of dnsmasq config file`

*Read only*

*Declared by:* [`nixos/modules/services/networking/dnsmasq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnsmasq.nix)

## `services.dnsmasq.enable` {#opt-services.dnsmasq.enable}

Whether to run dnsmasq.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/dnsmasq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnsmasq.nix)

## `services.dnsmasq.package` {#opt-services.dnsmasq.package}

The dnsmasq package to use.

*Type:* package

*Default:* `pkgs.dnsmasq`

*Declared by:* [`nixos/modules/services/networking/dnsmasq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnsmasq.nix)

## `services.dnsmasq.resolveLocalQueries` {#opt-services.dnsmasq.resolveLocalQueries}

Whether dnsmasq should resolve local queries (i.e. add 127.0.0.1 to
/etc/resolv.conf).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/dnsmasq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnsmasq.nix)

## `services.dnsmasq.settings` {#opt-services.dnsmasq.settings}

Configuration of dnsmasq. Lists get added one value per line (empty
lists and false values don't get added, though false values get
turned to comments). Gets merged with

    {
      dhcp-leasefile = "/var/lib/dnsmasq/dnsmasq.leases";
      conf-file = optional cfg.resolveLocalQueries "/etc/dnsmasq-conf.conf";
      resolv-file = optional cfg.resolveLocalQueries "/etc/dnsmasq-resolv.conf";
    }

*Type:* open submodule of attribute set of (atom (null, bool, int, float or string) or a list of them for duplicate keys)

*Default:* `{ }`

*Example:*

``` nix
{
  domain-needed = true;
  dhcp-range = [ "192.168.0.2,192.168.0.254" ];
}
```

*Declared by:* [`nixos/modules/services/networking/dnsmasq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnsmasq.nix)

## `services.dnsmasq.settings.server` {#opt-services.dnsmasq.settings.server}

The DNS servers which dnsmasq should query.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "8.8.8.8"
  "8.8.4.4"
]
```

*Declared by:* [`nixos/modules/services/networking/dnsmasq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnsmasq.nix)

## `services.dnsproxy.enable` {#opt-services.dnsproxy.enable}

Whether to enable dnsproxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/dnsproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnsproxy.nix)

## `services.dnsproxy.flags` {#opt-services.dnsproxy.flags}

A list of extra command-line flags to pass to dnsproxy. For details on the
available options, see [https://github.com/AdguardTeam/dnsproxy#usage](https://github.com/AdguardTeam/dnsproxy#usage).
Keep in mind that options passed through command-line flags override
config options.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--upstream=1.1.1.1:53"
]
```

*Declared by:* [`nixos/modules/services/networking/dnsproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnsproxy.nix)

## `services.dnsproxy.package` {#opt-services.dnsproxy.package}

The dnsproxy package to use.

*Type:* package

*Default:* `pkgs.dnsproxy`

*Declared by:* [`nixos/modules/services/networking/dnsproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnsproxy.nix)

## `services.dnsproxy.settings` {#opt-services.dnsproxy.settings}

Contents of the `config.yaml` config file.
The `--config-path` argument will only be passed if this set is not empty.

See [https://github.com/AdguardTeam/dnsproxy/blob/master/config.yaml.dist](https://github.com/AdguardTeam/dnsproxy/blob/master/config.yaml.dist).

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  bootstrap = [
    "8.8.8.8:53"
  ];
  listen-addrs = [
    "0.0.0.0"
  ];
  listen-ports = [
    53
  ];
  upstream = [
    "1.1.1.1:53"
  ];
}
```

*Declared by:* [`nixos/modules/services/networking/dnsproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dnsproxy.nix)

## `services.do-agent.enable` {#opt-services.do-agent.enable}

Whether to enable do-agent, the DigitalOcean droplet metrics agent.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/do-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/do-agent.nix)

## `services.dockerRegistry.configFile` {#opt-services.dockerRegistry.configFile}

Path to CNCF distribution config file.

Setting this option will override any configuration applied by the extraConfig option.

*Type:* absolute path

*Default:* `pkgs.writeText "docker-registry-config.yml" "# my custom docker-registry-config.yml ..."`

*Declared by:* [`nixos/modules/services/misc/docker-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/docker-registry.nix)

## `services.dockerRegistry.enable` {#opt-services.dockerRegistry.enable}

Whether to enable Docker Registry.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/docker-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/docker-registry.nix)

## `services.dockerRegistry.enableDelete` {#opt-services.dockerRegistry.enableDelete}

Enable delete for manifests and blobs.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/docker-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/docker-registry.nix)

## `services.dockerRegistry.enableGarbageCollect` {#opt-services.dockerRegistry.enableGarbageCollect}

Whether to enable garbage collect.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/docker-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/docker-registry.nix)

## `services.dockerRegistry.enableRedisCache` {#opt-services.dockerRegistry.enableRedisCache}

Whether to enable redis as blob cache.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/docker-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/docker-registry.nix)

## `services.dockerRegistry.extraConfig` {#opt-services.dockerRegistry.extraConfig}

Docker extra registry configuration.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  log.level = "debug";
}
```

*Declared by:* [`nixos/modules/services/misc/docker-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/docker-registry.nix)

## `services.dockerRegistry.garbageCollectDates` {#opt-services.dockerRegistry.garbageCollectDates}

Specification (in the format described by
`systemd.time(7)`) of the time at
which the garbage collect will occur.

*Type:* string

*Default:* `"daily"`

*Declared by:* [`nixos/modules/services/misc/docker-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/docker-registry.nix)

## `services.dockerRegistry.listenAddress` {#opt-services.dockerRegistry.listenAddress}

Docker registry host or ip to bind to.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/misc/docker-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/docker-registry.nix)

## `services.dockerRegistry.openFirewall` {#opt-services.dockerRegistry.openFirewall}

Opens the port used by the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/docker-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/docker-registry.nix)

## `services.dockerRegistry.package` {#opt-services.dockerRegistry.package}

The distribution package to use.

*Type:* package

*Default:* `pkgs.distribution`

*Example:* `gitlab-container-registry`

*Declared by:* [`nixos/modules/services/misc/docker-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/docker-registry.nix)

## `services.dockerRegistry.port` {#opt-services.dockerRegistry.port}

Docker registry port to bind to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5000`

*Declared by:* [`nixos/modules/services/misc/docker-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/docker-registry.nix)

## `services.dockerRegistry.redisPassword` {#opt-services.dockerRegistry.redisPassword}

Set redis password.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/docker-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/docker-registry.nix)

## `services.dockerRegistry.redisUrl` {#opt-services.dockerRegistry.redisUrl}

Set redis host and port.

*Type:* string

*Default:* `"localhost:6379"`

*Declared by:* [`nixos/modules/services/misc/docker-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/docker-registry.nix)

## `services.dockerRegistry.storagePath` {#opt-services.dockerRegistry.storagePath}

Docker registry storage path for the filesystem storage backend. Set to
null to configure another backend via extraConfig.

*Type:* null or absolute path

*Default:* `"/var/lib/docker-registry"`

*Declared by:* [`nixos/modules/services/misc/docker-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/docker-registry.nix)

## `services.docling-serve.enable` {#opt-services.docling-serve.enable}

Whether to enable Docling Serve server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/docling-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/docling-serve.nix)

## `services.docling-serve.environment` {#opt-services.docling-serve.environment}

Extra environment variables for Docling Serve.
For more details see [https://github.com/docling-project/docling-serve/blob/main/docs/configuration.md](https://github.com/docling-project/docling-serve/blob/main/docs/configuration.md)

*Type:* attribute set of string

*Default:*

``` nix
{
  DOCLING_SERVE_ENABLE_UI = "False";
}
```

*Example:*

``` nix
''
  {
    DOCLING_SERVE_ENABLE_UI = "True";
  }
''
```

*Declared by:* [`nixos/modules/services/misc/docling-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/docling-serve.nix)

## `services.docling-serve.environmentFile` {#opt-services.docling-serve.environmentFile}

Environment file to be passed to the systemd service.
Useful for passing secrets to the service to prevent them from being
world-readable in the Nix store.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/secrets/doclingServeSecrets"`

*Declared by:* [`nixos/modules/services/misc/docling-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/docling-serve.nix)

## `services.docling-serve.host` {#opt-services.docling-serve.host}

The host address which the Docling Serve server HTTP interface listens to.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/docling-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/docling-serve.nix)

## `services.docling-serve.openFirewall` {#opt-services.docling-serve.openFirewall}

Whether to open the firewall for Docling Serve.
This adds `services.Docling Serve.port` to `networking.firewall.allowedTCPPorts`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/docling-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/docling-serve.nix)

## `services.docling-serve.package` {#opt-services.docling-serve.package}

The docling-serve package to use.

*Type:* package

*Default:* `pkgs.docling-serve`

*Declared by:* [`nixos/modules/services/misc/docling-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/docling-serve.nix)

## `services.docling-serve.port` {#opt-services.docling-serve.port}

Which port the Docling Serve server listens to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5001`

*Example:* `11111`

*Declared by:* [`nixos/modules/services/misc/docling-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/docling-serve.nix)

## `services.docling-serve.stateDir` {#opt-services.docling-serve.stateDir}

State directory of Docling Serve.

*Type:* absolute path

*Default:* `"/var/lib/docling-serve"`

*Example:* `"/home/foo"`

*Declared by:* [`nixos/modules/services/misc/docling-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/docling-serve.nix)

## `services.documize.cert` {#opt-services.documize.cert}

The `cert.pem` file used for https.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/documize.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/documize.nix)

## `services.documize.db` {#opt-services.documize.db}

Database specific connection string for example:

- MySQL/Percona/MariaDB:
  `user:password@tcp(host:3306)/documize`
- MySQLv8+:
  `user:password@tcp(host:3306)/documize?allowNativePasswords=true`
- PostgreSQL:
  `host=localhost port=5432 dbname=documize user=admin password=secret sslmode=disable`
- MSSQL:
  `sqlserver://username:password@localhost:1433?database=Documize` or
  `sqlserver://sa@localhost/SQLExpress?database=Documize`

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/documize.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/documize.nix)

## `services.documize.dbtype` {#opt-services.documize.dbtype}

Specify the database provider: `mysql`, `percona`, `mariadb`, `postgresql`, `sqlserver`

*Type:* one of "mysql", "percona", "mariadb", "postgresql", "sqlserver"

*Default:* `"postgresql"`

*Declared by:* [`nixos/modules/services/web-apps/documize.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/documize.nix)

## `services.documize.enable` {#opt-services.documize.enable}

Whether to enable Documize Wiki.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/documize.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/documize.nix)

## `services.documize.forcesslport` {#opt-services.documize.forcesslport}

Redirect given http port number to TLS.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/documize.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/documize.nix)

## `services.documize.key` {#opt-services.documize.key}

The `key.pem` file used for https.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/documize.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/documize.nix)

## `services.documize.location` {#opt-services.documize.location}

reserved

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/documize.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/documize.nix)

## `services.documize.offline` {#opt-services.documize.offline}

Set `true` for offline mode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/documize.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/documize.nix)

## `services.documize.package` {#opt-services.documize.package}

The documize-community package to use.

*Type:* package

*Default:* `pkgs.documize-community`

*Declared by:* [`nixos/modules/services/web-apps/documize.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/documize.nix)

## `services.documize.port` {#opt-services.documize.port}

The http/https port number.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5001`

*Declared by:* [`nixos/modules/services/web-apps/documize.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/documize.nix)

## `services.documize.salt` {#opt-services.documize.salt}

The salt string used to encode JWT tokens, if not set a random value will be generated.

*Type:* null or string

*Default:* `null`

*Example:* `"3edIYV6c8B28b19fh"`

*Declared by:* [`nixos/modules/services/web-apps/documize.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/documize.nix)

## `services.documize.stateDirectoryName` {#opt-services.documize.stateDirectoryName}

The name of the directory below `/var/lib/private`
where documize runs in and stores, for example, backups.

*Type:* string

*Default:* `"documize"`

*Declared by:* [`nixos/modules/services/web-apps/documize.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/documize.nix)

## `services.docuseal.enable` {#opt-services.docuseal.enable}

Whether to enable DocuSeal, open source document signing.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/docuseal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/docuseal.nix)

## `services.docuseal.extraConfig` {#opt-services.docuseal.extraConfig}

Extra environment variables to pass to DocuSeal services.

Refer to [https://www.docuseal.com/docs/configuring-docuseal-via-environment-variables](https://www.docuseal.com/docs/configuring-docuseal-via-environment-variables).

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/docuseal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/docuseal.nix)

## `services.docuseal.extraEnvFiles` {#opt-services.docuseal.extraEnvFiles}

Extra environment files to pass to DocuSeal services. Useful for passing down environmental secrets.
e.g. DATABASE\_URL

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/etc/docuseal/s3config.env"
]
```

*Declared by:* [`nixos/modules/services/web-apps/docuseal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/docuseal.nix)

## `services.docuseal.host` {#opt-services.docuseal.host}

DocuSeal host.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/docuseal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/docuseal.nix)

## `services.docuseal.package` {#opt-services.docuseal.package}

The docuseal package to use.

*Type:* package

*Default:* `pkgs.docuseal`

*Declared by:* [`nixos/modules/services/web-apps/docuseal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/docuseal.nix)

## `services.docuseal.port` {#opt-services.docuseal.port}

DocuSeal port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/web-apps/docuseal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/docuseal.nix)

## `services.docuseal.redis.createLocally` {#opt-services.docuseal.redis.createLocally}

Whether to create a local redis automatically.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/docuseal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/docuseal.nix)

## `services.docuseal.redis.host` {#opt-services.docuseal.redis.host}

Redis server address.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/docuseal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/docuseal.nix)

## `services.docuseal.redis.name` {#opt-services.docuseal.redis.name}

Name of the redis server. Only used if `createLocally` is set to true.

*Type:* string

*Default:* `"docuseal"`

*Declared by:* [`nixos/modules/services/web-apps/docuseal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/docuseal.nix)

## `services.docuseal.redis.port` {#opt-services.docuseal.redis.port}

Port of the redis server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6379`

*Declared by:* [`nixos/modules/services/web-apps/docuseal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/docuseal.nix)

## `services.docuseal.secretKeyBaseFile` {#opt-services.docuseal.secretKeyBaseFile}

Path to file containing the secret key base.
A new secret key base can be generated by running:

`openssl rand -hex 64`

If this file does not exist, it will be created with a new secret key base.

*Type:* absolute path

*Default:* `"/var/lib/docuseal/secrets/secret-key-base"`

*Declared by:* [`nixos/modules/services/web-apps/docuseal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/docuseal.nix)

## `services.docuum.deletionChunkSize` {#opt-services.docuum.deletionChunkSize}

Removes specified quantity of images at a time.

*Type:* signed integer

*Default:* `1`

*Example:* `10`

*Declared by:* [`nixos/modules/services/admin/docuum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/docuum.nix)

## `services.docuum.enable` {#opt-services.docuum.enable}

Whether to enable docuum daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/admin/docuum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/docuum.nix)

## `services.docuum.keep` {#opt-services.docuum.keep}

Prevents deletion of images for which repository:tag matches the specified regex.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "^my-image"
]
```

*Declared by:* [`nixos/modules/services/admin/docuum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/docuum.nix)

## `services.docuum.minAge` {#opt-services.docuum.minAge}

Sets the minimum age of images to be considered for deletion.

*Type:* null or string

*Default:* `null`

*Example:* `"1d"`

*Declared by:* [`nixos/modules/services/admin/docuum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/docuum.nix)

## `services.docuum.threshold` {#opt-services.docuum.threshold}

Threshold for deletion in bytes, like `10 GB`, `10 GiB`, `10GB` or percentage-based thresholds like `50%`

*Type:* string

*Default:* `"10 GB"`

*Example:* `"50%"`

*Declared by:* [`nixos/modules/services/admin/docuum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/docuum.nix)

## `services.doh-proxy-rust.enable` {#opt-services.doh-proxy-rust.enable}

Whether to enable doh-proxy-rust.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/doh-proxy-rust.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/doh-proxy-rust.nix)

## `services.doh-proxy-rust.flags` {#opt-services.doh-proxy-rust.flags}

A list of command-line flags to pass to doh-proxy. For details on the
available options, see [https://github.com/jedisct1/doh-server#usage](https://github.com/jedisct1/doh-server#usage).

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--server-address=9.9.9.9:53"
]
```

*Declared by:* [`nixos/modules/services/networking/doh-proxy-rust.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/doh-proxy-rust.nix)

## `services.doh-server.configFile` {#opt-services.doh-server.configFile}

The config file for the doh-server.
Setting this option will override any configuration applied by the `settings` option.

*Type:* absolute path

*Example:* `"/path/to/doh-server.conf"`

*Declared by:* [`nixos/modules/services/networking/doh-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/doh-server.nix)

## `services.doh-server.enable` {#opt-services.doh-server.enable}

Whether to enable DNS-over-HTTPS server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/doh-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/doh-server.nix)

## `services.doh-server.package` {#opt-services.doh-server.package}

The dns-over-https package to use.

*Type:* package

*Default:* `pkgs.dns-over-https`

*Declared by:* [`nixos/modules/services/networking/doh-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/doh-server.nix)

## `services.doh-server.settings` {#opt-services.doh-server.settings}

Configuration of doh-server in toml. See example in [https://github.com/m13253/dns-over-https/blob/master/doh-server/doh-server.conf](https://github.com/m13253/dns-over-https/blob/master/doh-server/doh-server.conf)

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Example:*

``` nix
{
  listen = [
    ":8153"
  ];
  upstream = [
    "udp:127.0.0.1:53"
  ];
}
```

*Declared by:* [`nixos/modules/services/networking/doh-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/doh-server.nix)

## `services.doh-server.settings.ecs_allow_non_global_ip` {#opt-services.doh-server.settings.ecs_allow_non_global_ip}

By default, non global IP addresses are never forwarded to upstream servers.
This is to prevent two things from happening:

1. the upstream server knowing your private LAN addresses;
2. the upstream server unable to provide geographically near results,
   or even fail to provide any result.
   However, if you are deploying a split tunnel corporation network environment, or for any other reason you want to inhibit this behavior and allow local (eg RFC1918) address to be forwarded, change the following option to "true".

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/doh-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/doh-server.nix)

## `services.doh-server.settings.ecs_use_precise_ip` {#opt-services.doh-server.settings.ecs_use_precise_ip}

If ECS is added to the request, let the full IP address or cap it to 24 or 128 mask. This option is to be used only on private networks where knowledge of the terminal endpoint may be required for security purposes (eg. DNS Firewalling). Not a good option on the internet where IP address may be used to identify the user and not only the approximate location.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/doh-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/doh-server.nix)

## `services.doh-server.settings.listen` {#opt-services.doh-server.settings.listen}

HTTP listen address and port

*Type:* list of string

*Default:*

``` nix
[
  "127.0.0.1:8053"
  "[::1]:8053"
]
```

*Example:*

``` nix
[
  ":443"
]
```

*Declared by:* [`nixos/modules/services/networking/doh-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/doh-server.nix)

## `services.doh-server.settings.log_guessed_client_ip` {#opt-services.doh-server.settings.log_guessed_client_ip}

Enable log IP from HTTPS-reverse proxy header: X-Forwarded-For or X-Real-IP
Note: http uri/useragent log cannot be controlled by this config

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/doh-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/doh-server.nix)

## `services.doh-server.settings.path` {#opt-services.doh-server.settings.path}

HTTP path for resolve application

*Type:* string

*Default:* `"/dns-query"`

*Example:* `"/dns-query"`

*Declared by:* [`nixos/modules/services/networking/doh-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/doh-server.nix)

## `services.doh-server.settings.timeout` {#opt-services.doh-server.settings.timeout}

Upstream timeout

*Type:* signed integer

*Default:* `10`

*Example:* `15`

*Declared by:* [`nixos/modules/services/networking/doh-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/doh-server.nix)

## `services.doh-server.settings.tries` {#opt-services.doh-server.settings.tries}

Number of tries if upstream DNS fails

*Type:* signed integer

*Default:* `3`

*Example:* `5`

*Declared by:* [`nixos/modules/services/networking/doh-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/doh-server.nix)

## `services.doh-server.settings.upstream` {#opt-services.doh-server.settings.upstream}

Upstream DNS resolver.
If multiple servers are specified, a random one will be chosen each time.
You can use "udp", "tcp" or "tcp-tls" for the type prefix.
For "udp", UDP will first be used, and switch to TCP when the server asks to or the response is too large.
For "tcp", only TCP will be used.
For "tcp-tls", DNS-over-TLS (RFC 7858) will be used to secure the upstream connection.

*Type:* list of string

*Default:*

``` nix
[
  "udp:1.1.1.1:53"
  "udp:1.0.0.1:53"
  "udp:8.8.8.8:53"
  "udp:8.8.4.4:53"
]
```

*Example:*

``` nix
[
  "udp:127.0.0.1:53"
]
```

*Declared by:* [`nixos/modules/services/networking/doh-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/doh-server.nix)

## `services.doh-server.settings.verbose` {#opt-services.doh-server.settings.verbose}

Enable logging

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/doh-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/doh-server.nix)

## `services.doh-server.useACMEHost` {#opt-services.doh-server.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Example:* `"doh.example.com"`

*Declared by:* [`nixos/modules/services/networking/doh-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/doh-server.nix)

## `services.dokuwiki.sites` {#opt-services.dokuwiki.sites}

Specification of one or more DokuWiki sites to serve

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/dokuwiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dokuwiki.nix)

## `services.dokuwiki.sites.<name>.acl` {#opt-services.dokuwiki.sites._name_.acl}

Access Control Lists: see [https://www.dokuwiki.org/acl](https://www.dokuwiki.org/acl)
Mutually exclusive with services.dokuwiki.aclFile
Set this to a value other than null to take precedence over aclFile option.

Warning: Consider using aclFile instead if you do not
want to store the ACL in the world-readable Nix store.

*Type:* null or (list of (submodule))

*Default:* `null`

*Example:*

``` nix
[
  {
    page = "start";
    actor = "@external";
    level = "read";
  }
  {
    page = "*";
    actor = "@users";
    level = "upload";
  }
]
```

*Declared by:* [`nixos/modules/services/web-apps/dokuwiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dokuwiki.nix)

## `services.dokuwiki.sites.<name>.acl.*.actor` {#opt-services.dokuwiki.sites._name_.acl._.actor}

User or group to restrict

*Type:* string

*Example:* `"@external"`

*Declared by:* [`nixos/modules/services/web-apps/dokuwiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dokuwiki.nix)

## `services.dokuwiki.sites.<name>.acl.*.level` {#opt-services.dokuwiki.sites._name_.acl._.level}

Permission level to restrict the actor(s) to.
See [https://www.dokuwiki.org/acl#background\_info](https://www.dokuwiki.org/acl#background_info) for explanation

*Type:* one of 4, 16, 2, 0, 1, 8, "create", "delete", "edit", "none", "read", "upload"

*Example:* `"read"`

*Declared by:* [`nixos/modules/services/web-apps/dokuwiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dokuwiki.nix)

## `services.dokuwiki.sites.<name>.acl.*.page` {#opt-services.dokuwiki.sites._name_.acl._.page}

Page or namespace to restrict

*Type:* string

*Example:* `"start"`

*Declared by:* [`nixos/modules/services/web-apps/dokuwiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dokuwiki.nix)

## `services.dokuwiki.sites.<name>.aclFile` {#opt-services.dokuwiki.sites._name_.aclFile}

Location of the dokuwiki acl rules.
Mutually exclusive with services.dokuwiki.acl which is preferred.
Consult documentation [https://www.dokuwiki.org/acl](https://www.dokuwiki.org/acl) for further instructions.
Example: [https://github.com/splitbrain/dokuwiki/blob/master/conf/acl.auth.php.dist](https://github.com/splitbrain/dokuwiki/blob/master/conf/acl.auth.php.dist)

*Type:* null or string

*Default:* `"/var/lib/dokuwiki/‹name›/acl.auth.php"`

*Example:* `"/var/lib/dokuwiki/‹name›/acl.auth.php"`

*Declared by:* [`nixos/modules/services/web-apps/dokuwiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dokuwiki.nix)

## `services.dokuwiki.sites.<name>.extraConfigs` {#opt-services.dokuwiki.sites._name_.extraConfigs}

Path(s) to additional configuration files that are then linked to the 'conf' directory.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
{
  "acronyms.local.conf" = pkgs.writeText "acronyms.local.conf" ''
    r13y  reproducibility
  '';
  "entities.local.conf" = ./dokuwiki-entities;
}
```

*Declared by:* [`nixos/modules/services/web-apps/dokuwiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dokuwiki.nix)

## `services.dokuwiki.sites.<name>.mergedConfig` {#opt-services.dokuwiki.sites._name_.mergedConfig}

Read only representation of the final configuration.

*Type:* unspecified value

*Default:*

``` nix
{
  useacl = true;
}
```

*Read only*

*Declared by:* [`nixos/modules/services/web-apps/dokuwiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dokuwiki.nix)

## `services.dokuwiki.sites.<name>.package` {#opt-services.dokuwiki.sites._name_.package}

The dokuwiki package to use.

*Type:* package

*Default:* `pkgs.dokuwiki`

*Declared by:* [`nixos/modules/services/web-apps/dokuwiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dokuwiki.nix)

## `services.dokuwiki.sites.<name>.phpOptions` {#opt-services.dokuwiki.sites._name_.phpOptions}

Options for PHP's php.ini file for this dokuwiki site.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  "opcache.interned_strings_buffer" = "8";
  "opcache.max_accelerated_files" = "10000";
  "opcache.memory_consumption" = "128";
  "opcache.revalidate_freq" = "15";
  "opcache.fast_shutdown" = "1";
}
```

*Declared by:* [`nixos/modules/services/web-apps/dokuwiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dokuwiki.nix)

## `services.dokuwiki.sites.<name>.phpPackage` {#opt-services.dokuwiki.sites._name_.phpPackage}

The php package to use.

*Type:* package

*Default:* `pkgs.php84`

*Declared by:* [`nixos/modules/services/web-apps/dokuwiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dokuwiki.nix)

## `services.dokuwiki.sites.<name>.plugins` {#opt-services.dokuwiki.sites._name_.plugins}

List of path(s) to respective plugin(s) which are copied into the 'plugin' directory.

::: note
These plugins need to be packaged before use, see example.
:::

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
let
  plugin-icalevents = pkgs.stdenv.mkDerivation rec {
    name = "icalevents";
    version = "2017-06-16";
    src = pkgs.fetchzip {
      stripRoot = false;
      url = "https://github.com/real-or-random/dokuwiki-plugin-icalevents/releases/download/${version}/dokuwiki-plugin-icalevents-${version}.zip";
      hash = "sha256-IPs4+qgEfe8AAWevbcCM9PnyI0uoyamtWeg4rEb+9Wc=";
    };
    installPhase = "mkdir -p $out; cp -R * $out/";
  };
# And then pass this plugin to the plugin list like this:
in [ plugin-icalevents ]
```

*Declared by:* [`nixos/modules/services/web-apps/dokuwiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dokuwiki.nix)

## `services.dokuwiki.sites.<name>.pluginsConfig` {#opt-services.dokuwiki.sites._name_.pluginsConfig}

List of the dokuwiki (un)loaded plugins.

*Type:* attribute set of boolean

*Default:*

``` nix
{
  authad = false;
  authldap = false;
  authmysql = false;
  authpgsql = false;
}
```

*Declared by:* [`nixos/modules/services/web-apps/dokuwiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dokuwiki.nix)

## `services.dokuwiki.sites.<name>.poolConfig` {#opt-services.dokuwiki.sites._name_.poolConfig}

Options for the DokuWiki PHP pool. See the documentation on `php-fpm.conf`
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

*Declared by:* [`nixos/modules/services/web-apps/dokuwiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dokuwiki.nix)

## `services.dokuwiki.sites.<name>.settings` {#opt-services.dokuwiki.sites._name_.settings}

Structural DokuWiki configuration.
Refer to [https://www.dokuwiki.org/config](https://www.dokuwiki.org/config)
for details and supported values.
Settings can either be directly set from nix,
loaded from a file using `._file` or obtained from any
PHP function calls using `._raw`.

*Type:* attribute set of anything

*Default:*

``` nix
{
  superuser = "admin";
  useacl = true;
}
```

*Example:*

``` nix
{
  title = "My Wiki";
  userewrite = 1;
  disableactions = [ "register" ]; # Will be concatenated with commas
  plugin.smtp = {
    smtp_pass._file = "/var/run/secrets/dokuwiki/smtp_pass";
    smtp_user._raw = "getenv('DOKUWIKI_SMTP_USER')";
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/dokuwiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dokuwiki.nix)

## `services.dokuwiki.sites.<name>.stateDir` {#opt-services.dokuwiki.sites._name_.stateDir}

Location of the DokuWiki state directory.

*Type:* absolute path

*Default:* `"/var/lib/dokuwiki/‹name›/data"`

*Declared by:* [`nixos/modules/services/web-apps/dokuwiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dokuwiki.nix)

## `services.dokuwiki.sites.<name>.templates` {#opt-services.dokuwiki.sites._name_.templates}

List of path(s) to respective template(s) which are copied into the 'tpl' directory.

::: note
These templates need to be packaged before use, see example.
:::

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
let
  template-bootstrap3 = pkgs.stdenv.mkDerivation rec {
  name = "bootstrap3";
  version = "2022-07-27";
  src = pkgs.fetchFromGitHub {
    owner = "giterlizzi";
    repo = "dokuwiki-template-bootstrap3";
    rev = "v${version}";
    hash = "sha256-B3Yd4lxdwqfCnfmZdp+i/Mzwn/aEuZ0ovagDxuR6lxo=";
  };
  installPhase = "mkdir -p $out; cp -R * $out/";
};
# And then pass this theme to the template list like this:
in [ template-bootstrap3 ]
```

*Declared by:* [`nixos/modules/services/web-apps/dokuwiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dokuwiki.nix)

## `services.dokuwiki.sites.<name>.usersFile` {#opt-services.dokuwiki.sites._name_.usersFile}

Location of the dokuwiki users file. List of users. Format:

    login:passwordhash:Real Name:email:groups,comma,separated

Create passwordHash easily by using:

    mkpasswd -5 password `pwgen 8 1`

Example: [https://github.com/splitbrain/dokuwiki/blob/master/conf/users.auth.php.dist](https://github.com/splitbrain/dokuwiki/blob/master/conf/users.auth.php.dist)

*Type:* null or string

*Default:* `"/var/lib/dokuwiki/‹name›/users.auth.php"`

*Example:* `"/var/lib/dokuwiki/‹name›/users.auth.php"`

*Declared by:* [`nixos/modules/services/web-apps/dokuwiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dokuwiki.nix)

## `services.dokuwiki.webserver` {#opt-services.dokuwiki.webserver}

Whether to use nginx or caddy for virtual host management.

Further nginx configuration can be done by adapting `services.nginx.virtualHosts.<name>`.
See [services (N)](../../options/services-n/index.md#opt-services.nginx.virtualHosts) for further information.

Further caddy configuration can be done by adapting `services.caddy.virtualHosts.<name>`.
See [services (C)](../../options/services-c/index.md#opt-services.caddy.virtualHosts) for further information.

*Type:* one of "nginx", "caddy"

*Default:* `"nginx"`

*Declared by:* [`nixos/modules/services/web-apps/dokuwiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dokuwiki.nix)

## `services.dolibarr.database.createLocally` {#opt-services.dolibarr.database.createLocally}

Create the database and database user locally.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.database.host` {#opt-services.dolibarr.database.host}

Database host address.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.database.name` {#opt-services.dolibarr.database.name}

Database name.

*Type:* string

*Default:* `"dolibarr"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.database.passwordFile` {#opt-services.dolibarr.database.passwordFile}

Database password file.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/dolibarr-dbpassword"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.database.port` {#opt-services.dolibarr.database.port}

Database host port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3306`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.database.type` {#opt-services.dolibarr.database.type}

Database engine to use.

*Type:* one of "mysql", "postgresql"

*Default:* `"mysql"`

*Example:* `"postgresql"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.database.user` {#opt-services.dolibarr.database.user}

Database username.

*Type:* string

*Default:* `"dolibarr"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.domain` {#opt-services.dolibarr.domain}

Domain name of your server.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.enable` {#opt-services.dolibarr.enable}

Whether to enable dolibarr.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.group` {#opt-services.dolibarr.group}

Group account under which dolibarr runs.

::: note
If left as the default value this group will automatically be created
on system activation, otherwise you are responsible for
ensuring the group exists before the dolibarr application starts.
:::

*Type:* string

*Default:* `"dolibarr"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.h2o` {#opt-services.dolibarr.h2o}

With this option, you can customize an H2O virtual host which already
has sensible defaults for Dolibarr. Set to `{ }` if you do not need any
customization to the virtual host. If enabled, then by default, the
`serverName` is `$`, If this is set to`null` (the
default), no H2O `hosts` will be configured.

*Type:* null or (submodule)

*Default:* `null`

*Example:*

``` nix
{
  acme.enable = true;
  tls.policy = "force";
  compress = "ON";
}
```

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.h2o.acme` {#opt-services.dolibarr.h2o.acme}

ACME options for virtual host.

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.h2o.acme.enable` {#opt-services.dolibarr.h2o.acme.enable}

Whether to ask Let’s Encrypt to sign a certificate for this
virtual host. Alternatively, an existing host can be used thru
`acme.useHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.h2o.acme.root` {#opt-services.dolibarr.h2o.acme.root}

Directory for the ACME challenge, which is **public**. Don’t put
certs or keys in here. Set to `null` to inherit from
config.security.acme.

*Type:* null or absolute path

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.h2o.acme.useHost` {#opt-services.dolibarr.h2o.acme.useHost}

An existing Let’s Encrypt certificate to use for this virtual
host. This is useful if you have many subdomains and want to
avoid hitting the [rate
limit](https://letsencrypt.org/docs/rate-limits). Alternately,
you can generate a certificate through `acme.enable`.
Note that this option neither creates any certificates nor does
it add subdomains to existing ones — you will need to create
them manually using [security](../../options/security/index.md#opt-security.acme.certs).

*Type:* null or non-empty string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.h2o.host` {#opt-services.dolibarr.h2o.host}

Set the host address for this virtual host. If unset, the default is to
listen on all network interfaces.

*Type:* null or non-empty string

*Default:* `null`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.h2o.http` {#opt-services.dolibarr.h2o.http}

HTTP options for virtual host

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.h2o.http.port` {#opt-services.dolibarr.h2o.http.port}

Override the default HTTP port for this virtual host.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
config.services.h2o.defaultHTTPListenPort
```

*Example:* `8080`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.h2o.serverAliases` {#opt-services.dolibarr.h2o.serverAliases}

Additional names of virtual hosts served by this virtual host
configuration.

*Type:* list of non-empty string

*Default:* `[ ]`

*Example:*

``` nix
[
  "www.example.org"
  "example.org"
]
```

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.h2o.serverName` {#opt-services.dolibarr.h2o.serverName}

Server name to be used for this virtual host. Defaults to attribute
name in hosts.

*Type:* null or non-empty string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.h2o.settings` {#opt-services.dolibarr.h2o.settings}

Attrset to be transformed into YAML for host config. Note that the HTTP
/ TLS configurations will override these config values. See
[https://h2o.examp1e.net/configure/base\_directives.html#hosts](https://h2o.examp1e.net/configure/base_directives.html#hosts).

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.h2o.tls` {#opt-services.dolibarr.h2o.tls}

TLS options for virtual host

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.h2o.tls.extraSettings` {#opt-services.dolibarr.h2o.tls.extraSettings}

Additional TLS/SSL-related configuration options. See
[https://h2o.examp1e.net/configure/base\_directives.html#listen-ssl](https://h2o.examp1e.net/configure/base_directives.html#listen-ssl).

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  minimum-version = "TLSv1.3";
}
```

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.h2o.tls.identity` {#opt-services.dolibarr.h2o.tls.identity}

Key / certificate pairs for the virtual host.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    key-file = "/path/to/rsa.key";
    certificate-file = "/path/to/rsa.crt";
  }
  {
    key-file = "/path/to/ecdsa.key";
    certificate-file = "/path/to/ecdsa.crt";
  }
]
```

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.h2o.tls.identity.*.certificate-file` {#opt-services.dolibarr.h2o.tls.identity._.certificate-file}

Path to certificate file. See
[https://h2o.examp1e.net/configure/base\_directives.html#certificate-file](https://h2o.examp1e.net/configure/base_directives.html#certificate-file).

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.h2o.tls.identity.*.key-file` {#opt-services.dolibarr.h2o.tls.identity._.key-file}

Path to key file. See
[https://h2o.examp1e.net/configure/base\_directives.html#key-file](https://h2o.examp1e.net/configure/base_directives.html#key-file).

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.h2o.tls.policy` {#opt-services.dolibarr.h2o.tls.policy}

`add` will additionally listen for TLS connections. `only` will
disable   TLS connections. `force` will redirect non-TLS traffic
to the TLS connection.

*Type:* one of "add", "only", "force"

*Example:* `"force"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.h2o.tls.port` {#opt-services.dolibarr.h2o.tls.port}

Override the default TLS port for this virtual host.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
config.services.h2o.defaultTLSListenPort
```

*Example:* `8443`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.h2o.tls.quic` {#opt-services.dolibarr.h2o.tls.quic}

Enables HTTP/3 over QUIC on the UDP port for TLS. The attrset
provides fine-turning for QUIC behavior, but can be empty. See
[https://h2o.examp1e.net/configure/http3\_directives.html#quic-attributes](https://h2o.examp1e.net/configure/http3_directives.html#quic-attributes).

*Type:* null or (attribute set)

*Default:* `null`

*Example:*

``` nix
{
  amp-limit = 2;
  handshake-timeout-rtt-multiplier = 300;
  retry = "ON";
}
```

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.h2o.tls.recommendations` {#opt-services.dolibarr.h2o.tls.recommendations}

By default, H2O, without prejudice, will use as many TLS versions &
cipher suites as it & the TLS library (OpenSSL) can support. The user is
expected to hone settings for the security of their server. Setting some
constraints is recommended, & if unsure about what TLS settings to use,
this option gives curated TLS settings recommendations from Mozilla’s
‘SSL Configuration Generator’ project (see
[https://ssl-config.mozilla.org](https://ssl-config.mozilla.org)) or read more at Mozilla’s Wiki (see
[https://wiki.mozilla.org/Security/Server\_Side\_TLS](https://wiki.mozilla.org/Security/Server_Side_TLS)).

modern
: Services with clients that support TLS 1.3 & don’t need backward
compatibility

intermediate
: General-purpose servers with a variety of clients, recommended for
almost all systems

The default for all virtual hosts can be set with
services.h2o.defaultTLSRecommendations, but this value can be overridden
on a per-host basis using services.h2o.hosts.<name>.tls.recommmendations.
The settings will also be overidden by manual values set with
services.settings.h2o.hosts.<name>.tls.extraSettings.

NOTE: older/weaker ciphers might require overriding the OpenSSL version
of H2O (such as `openssl_legacy`). This can be done with
sevices.settings.h2o.package.

*Type:* null or one of "modern", "intermediate"

*Default:* `null`

*Example:* `"intermediate"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.h2o.tls.redirectCode` {#opt-services.dolibarr.h2o.tls.redirectCode}

HTTP status used by `globalRedirect` & `forceSSL`. Possible
usecases include temporary (302, 307) redirects, keeping the
request method & body (307, 308), or explicitly resetting the
method to GET (303). See
[https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx` {#opt-services.dolibarr.nginx}

With this option, you can customize an nginx virtual host which already has sensible defaults for Dolibarr.
Set to {} if you do not need any customization to the virtual host.
If enabled, then by default, the `serverName` is
`${domain}`,
SSL is active, and certificates are acquired via ACME.
If this is set to null (the default), no nginx virtualHost will be configured.

*Type:* null or (submodule)

*Default:* `null`

*Example:*

``` nix
{
  serverAliases = [
    "dolibarr.${config.networking.domain}"
    "erp.${config.networking.domain}"
  ];
  enableACME = false;
}
```

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.acmeFallbackHost` {#opt-services.dolibarr.nginx.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.acmeRoot` {#opt-services.dolibarr.nginx.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.addSSL` {#opt-services.dolibarr.nginx.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.basicAuth` {#opt-services.dolibarr.nginx.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.basicAuthFile` {#opt-services.dolibarr.nginx.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.default` {#opt-services.dolibarr.nginx.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.enableACME` {#opt-services.dolibarr.nginx.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.extraConfig` {#opt-services.dolibarr.nginx.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.forceSSL` {#opt-services.dolibarr.nginx.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.globalRedirect` {#opt-services.dolibarr.nginx.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.http2` {#opt-services.dolibarr.nginx.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.http3` {#opt-services.dolibarr.nginx.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.http3_hq` {#opt-services.dolibarr.nginx.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.kTLS` {#opt-services.dolibarr.nginx.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.listen` {#opt-services.dolibarr.nginx.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.listen.*.addr` {#opt-services.dolibarr.nginx.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.listen.*.extraParameters` {#opt-services.dolibarr.nginx.listen._.extraParameters}

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

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.listen.*.port` {#opt-services.dolibarr.nginx.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.listen.*.proxyProtocol` {#opt-services.dolibarr.nginx.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.listen.*.ssl` {#opt-services.dolibarr.nginx.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.listenAddresses` {#opt-services.dolibarr.nginx.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.locations` {#opt-services.dolibarr.nginx.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.locations.<name>.alias` {#opt-services.dolibarr.nginx.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.locations.<name>.basicAuth` {#opt-services.dolibarr.nginx.locations._name_.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.locations.<name>.basicAuthFile` {#opt-services.dolibarr.nginx.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.locations.<name>.extraConfig` {#opt-services.dolibarr.nginx.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.locations.<name>.fastcgiParams` {#opt-services.dolibarr.nginx.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.locations.<name>.index` {#opt-services.dolibarr.nginx.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.locations.<name>.priority` {#opt-services.dolibarr.nginx.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.locations.<name>.proxyPass` {#opt-services.dolibarr.nginx.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.locations.<name>.proxyWebsockets` {#opt-services.dolibarr.nginx.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.locations.<name>.recommendedProxySettings` {#opt-services.dolibarr.nginx.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.locations.<name>.recommendedUwsgiSettings` {#opt-services.dolibarr.nginx.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.locations.<name>.return` {#opt-services.dolibarr.nginx.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.locations.<name>.root` {#opt-services.dolibarr.nginx.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.locations.<name>.tryFiles` {#opt-services.dolibarr.nginx.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.locations.<name>.useGrpcErrorPages` {#opt-services.dolibarr.nginx.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.locations.<name>.uwsgiPass` {#opt-services.dolibarr.nginx.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.onlySSL` {#opt-services.dolibarr.nginx.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.quic` {#opt-services.dolibarr.nginx.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.redirectCode` {#opt-services.dolibarr.nginx.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.rejectSSL` {#opt-services.dolibarr.nginx.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.reuseport` {#opt-services.dolibarr.nginx.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.root` {#opt-services.dolibarr.nginx.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.serverAliases` {#opt-services.dolibarr.nginx.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.serverName` {#opt-services.dolibarr.nginx.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.sslCertificate` {#opt-services.dolibarr.nginx.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.sslCertificateKey` {#opt-services.dolibarr.nginx.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.sslTrustedCertificate` {#opt-services.dolibarr.nginx.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.nginx.useACMEHost` {#opt-services.dolibarr.nginx.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.package` {#opt-services.dolibarr.package}

The dolibarr package to use.

*Type:* package

*Default:* `pkgs.dolibarr`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.poolConfig` {#opt-services.dolibarr.poolConfig}

Options for the Dolibarr PHP pool. See the documentation on [`php-fpm.conf`](https://www.php.net/manual/en/install.fpm.configuration.php)
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

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.settings` {#opt-services.dolibarr.settings}

Dolibarr settings, see [https://github.com/Dolibarr/dolibarr/blob/develop/htdocs/conf/conf.php.example](https://github.com/Dolibarr/dolibarr/blob/develop/htdocs/conf/conf.php.example) for details.

*Type:* attribute set of (boolean or signed integer or string)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.stateDir` {#opt-services.dolibarr.stateDir}

State and configuration directory dolibarr will use.

*Type:* string

*Default:* `"/var/lib/dolibarr"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.dolibarr.user` {#opt-services.dolibarr.user}

User account under which dolibarr runs.

::: note
If left as the default value this user will automatically be created
on system activation, otherwise you are responsible for
ensuring the user exists before the dolibarr application starts.
:::

*Type:* string

*Default:* `"dolibarr"`

*Declared by:* [`nixos/modules/services/web-apps/dolibarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/dolibarr.nix)

## `services.domoticz.bind` {#opt-services.domoticz.bind}

IP address to bind to.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/domoticz.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/domoticz.nix)

## `services.domoticz.enable` {#opt-services.domoticz.enable}

Whether to enable Domoticz home automation.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/domoticz.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/domoticz.nix)

## `services.domoticz.port` {#opt-services.domoticz.port}

Port to bind to for HTTP, set to 0 to disable HTTP.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/misc/domoticz.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/domoticz.nix)

## `services.dovecot2.configFile` {#opt-services.dovecot2.configFile}

Config file used for the whole dovecot configuration.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.createMailUser` {#opt-services.dovecot2.createMailUser}

Whether to enable automatically creating the user
given in `services.dovecot2.settings.mail_uid` and the group
given in `services.dovecot2.settings.mail_gid`.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.enable` {#opt-services.dovecot2.enable}

Whether to enable the dovecot 2.x POP3/IMAP server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.enablePAM` {#opt-services.dovecot2.enablePAM}

Whether to enable creating a own Dovecot PAM service and configure PAM user logins.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.imapsieve.mailbox` {#opt-services.dovecot2.imapsieve.mailbox}

Configure Sieve filtering rules on IMAP actions

::: note
This option is no longer used starting from Dovecot version 2.4.
:::

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.imapsieve.mailbox.*.after` {#opt-services.dovecot2.imapsieve.mailbox._.after}

When an IMAP event of interest occurs, this sieve script is executed after any user script respectively.

This setting each specify the location of a single sieve script. The semantics of this setting is similar to sieve\_after: the specified scripts form a sequence together with the user script in which the next script is only executed when an (implicit) keep action is executed.

*Type:* null or absolute path

*Default:* `null`

*Example:* `./report-spam.sieve`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.imapsieve.mailbox.*.before` {#opt-services.dovecot2.imapsieve.mailbox._.before}

When an IMAP event of interest occurs, this sieve script is executed before any user script respectively.

This setting each specify the location of a single sieve script. The semantics of this setting is similar to sieve\_before: the specified scripts form a sequence together with the user script in which the next script is only executed when an (implicit) keep action is executed.

*Type:* null or absolute path

*Default:* `null`

*Example:* `./report-spam.sieve`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.imapsieve.mailbox.*.causes` {#opt-services.dovecot2.imapsieve.mailbox._.causes}

Only execute the administrator Sieve scripts for the mailbox configured with services.dovecot2.imapsieve.mailbox.<name>.name when one of the listed IMAPSIEVE causes apply.

This has no effect on the user script, which is always executed no matter the cause.

*Type:* list of (one of "APPEND", "COPY", "FLAG")

*Default:* `[ ]`

*Example:*

``` nix
[
  "COPY"
  "APPEND"
]
```

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.imapsieve.mailbox.*.from` {#opt-services.dovecot2.imapsieve.mailbox._.from}

Only execute the administrator Sieve scripts for the mailbox configured with services.dovecot2.imapsieve.mailbox.<name>.name when the message originates from the indicated mailbox.

This setting supports wildcards with a syntax compatible with the IMAP LIST command, meaning that this setting can apply to multiple or even all ("\*") mailboxes.

*Type:* null or string

*Default:* `null`

*Example:* `"*"`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.imapsieve.mailbox.*.name` {#opt-services.dovecot2.imapsieve.mailbox._.name}

This setting configures the name of a mailbox for which administrator scripts are configured.

The settings defined hereafter with matching sequence numbers apply to the mailbox named by this setting.

This setting supports wildcards with a syntax compatible with the IMAP LIST command, meaning that this setting can apply to multiple or even all ("\*") mailboxes.

*Type:* string

*Example:* `"Junk"`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.includeFiles` {#opt-services.dovecot2.includeFiles}

Files to include in the Dovecot config file using !include directives.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/foo/bar/extraDovecotConfig.conf"
]
```

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.mailPlugins` {#opt-services.dovecot2.mailPlugins}

Additional entries to add to the mail\_plugins variable, globally and per protocol

*Type:* submodule

*Default:*

``` nix
{
  globally = {
    enable = [ ];
  };
  perProtocol = { };
}
```

*Example:*

``` nix
{
  globally = {
    enable = [
      "acl"
    ];
  };
  perProtocol = {
    imap = {
      enable = [
        "imap_acl"
      ];
    };
  };
}
```

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.mailPlugins.globally` {#opt-services.dovecot2.mailPlugins.globally}

Additional entries to add to the mail\_plugins variable for all protocols

*Type:* submodule

*Default:*

``` nix
{
  enable = [ ];
}
```

*Example:*

``` nix
{
  enable = [
    "virtual"
  ];
}
```

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.mailPlugins.globally.enable` {#opt-services.dovecot2.mailPlugins.globally.enable}

mail plugins to enable as a list of strings to append to the top-level `$mail_plugins` configuration variable

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.mailPlugins.perProtocol` {#opt-services.dovecot2.mailPlugins.perProtocol}

Additional entries to add to the mail\_plugins variable, per protocol

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  imap = [
    "imap_acl"
  ];
}
```

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.mailPlugins.perProtocol.<name>.enable` {#opt-services.dovecot2.mailPlugins.perProtocol._name_.enable}

mail plugins to enable as a list of strings to append to the corresponding per-protocol `$mail_plugins` configuration variable

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.package` {#opt-services.dovecot2.package}

The dovecot package to use.

*Type:* package

*Default:* `if versionAtLeast config.system.stateVersion "26.05" then pkgs.dovecot else pkgs.dovecot_2_3`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings` {#opt-services.dovecot2.settings}

Dovecot configuration, see [https://doc.dovecot.org/latest/core/summaries/settings.html#all-dovecot-settings](https://doc.dovecot.org/latest/core/summaries/settings.html#all-dovecot-settings)
for all available options.

For information on the configuration structure, see [https://doc.dovecot.org/latest/core/settings/syntax.html](https://doc.dovecot.org/latest/core/settings/syntax.html).

::: warning
Explicit settings in \[[`services.dovecot2.settings`](#opt-services.dovecot2.settings)\](#opt-services.dovecot2.settings) can silently override values set by other `services.dovecot2.*` options.
:::

*Type:* open submodule of attribute set of (Dovecot config value)

*Default:* `{ }`

*Example:*

``` nix
{
  mail_attribute = {
    "dict file" = {
      path = "%{home}/dovecot-attributes";
    };
  };
  mail_driver = "maildir";
  mail_home = "/var/vmail/%{user | domain}/%{user | username}";
  mail_path = "~/mail";
  "namespace inbox" = {
    inbox = true;
    separator = "/";
  };
  "protocol imap" = {
    mail_plugins = {
      imap_filter_sieve = true;
      imap_sieve = true;
    };
  };
  protocols = {
    imap = true;
    lmtp = true;
    submission = true;
  };
  service = [
    {
      _section = {
        name = "imap";
      };
      client_limit = 100;
      "inet_listener imap" = {
        port = 31143;
      };
      "inet_listener imaps" = {
        port = 31993;
      };
      process_min_avail = 1;
    }
    {
      _section = {
        name = "lmtp";
      };
      "unix_listener lmtp" = {
        mode = "0660";
        user = "postfix";
      };
      user = "dovemail";
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings."passdb pam"` {#opt-services.dovecot2.settings._passdb_pam_}

Configuration for the PAM password database.

See [https://doc.dovecot.org/latest/core/config/auth/databases/pam.html](https://doc.dovecot.org/latest/core/config/auth/databases/pam.html).

*Type:* null or (open submodule of attribute set of (Dovecot config value))

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings."passdb pam".args` {#opt-services.dovecot2.settings._passdb_pam_.args}

Arguments for the passdb backend.

This option is exclusive to Dovecot 2.3.

See [https://doc.dovecot.org/2.3/configuration\_manual/authentication/password\_databases\_passdb/#passdb-setting](https://doc.dovecot.org/2.3/configuration_manual/authentication/password_databases_passdb/#passdb-setting).

*Type:* null or (list of string)

*Default:* `"if isPre24 then [ \"dovecot2\" ] else null"`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings."passdb pam".driver` {#opt-services.dovecot2.settings._passdb_pam_.driver}

The driver used for this password database.

See [https://doc.dovecot.org/latest/core/summaries/settings.html#passdb\_driver](https://doc.dovecot.org/latest/core/summaries/settings.html#passdb_driver).

*Type:* null or string

*Default:* `if isPre24 then "pam" else null`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings."passdb pam".failure_show_msg` {#opt-services.dovecot2.settings._passdb_pam_.failure_show_msg}

Replace the default "Authentication failed" reply with PAM's failure.

This option is exclusive to Dovecot 2.4.

See [https://doc.dovecot.org/latest/core/summaries/settings.html#passdb\_pam\_failure\_show\_msg](https://doc.dovecot.org/latest/core/summaries/settings.html#passdb_pam_failure_show_msg).

*Type:* null or boolean

*Default:* `if isPre24 then null else config.services.dovecot2.showPAMFailure`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings."passdb pam".service_name` {#opt-services.dovecot2.settings._passdb_pam_.service_name}

The PAM service name to be used with the pam passdb.

This option is exclusive to Dovecot 2.4.

See [https://doc.dovecot.org/latest/core/summaries/settings.html#passdb\_pam\_service\_name](https://doc.dovecot.org/latest/core/summaries/settings.html#passdb_pam_service_name).

*Type:* null or string

*Default:* `if isPre24 then null else "dovecot2"`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings."userdb passwd"` {#opt-services.dovecot2.settings._userdb_passwd_}

Configuration for the Passwd user database.

See [https://doc.dovecot.org/latest/core/config/auth/databases/passwd.html](https://doc.dovecot.org/latest/core/config/auth/databases/passwd.html).

*Type:* null or (open submodule of attribute set of (Dovecot config value))

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings."userdb passwd".driver` {#opt-services.dovecot2.settings._userdb_passwd_.driver}

The driver used for this user database.

See [https://doc.dovecot.org/latest/core/summaries/settings.html#userdb\_driver](https://doc.dovecot.org/latest/core/summaries/settings.html#userdb_driver).

*Type:* null or string

*Default:* `if isPre24 then "passwd" else null`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings.auth_mechanisms` {#opt-services.dovecot2.settings.auth_mechanisms}

Here you can supply a space-separated list of the authentication mechanisms you wish to use.

See [https://doc.dovecot.org/latest/core/summaries/settings.html#auth\_mechanisms](https://doc.dovecot.org/latest/core/summaries/settings.html#auth_mechanisms).

*Type:* (attribute set of boolean) or list of string

*Default:*

``` nix
[
  "plain"
  "login"
]
```

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings.base_dir` {#opt-services.dovecot2.settings.base_dir}

The base directory in which Dovecot should store runtime data.

See [https://doc.dovecot.org/latest/core/summaries/settings.html#base\_dir](https://doc.dovecot.org/latest/core/summaries/settings.html#base_dir).

*Type:* absolute path

*Default:* `"/run/dovecot2"`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings.default_internal_group` {#opt-services.dovecot2.settings.default_internal_group}

Define the default internal group.

See [https://doc.dovecot.org/latest/core/summaries/settings.html#default\_internal\_group](https://doc.dovecot.org/latest/core/summaries/settings.html#default_internal_group).

*Type:* string

*Default:* `"dovecot2"`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings.default_internal_user` {#opt-services.dovecot2.settings.default_internal_user}

Define the default internal user.

See [https://doc.dovecot.org/latest/core/summaries/settings.html#default\_internal\_user](https://doc.dovecot.org/latest/core/summaries/settings.html#default_internal_user).

*Type:* string

*Default:* `"dovecot2"`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings.dovecot_config_version` {#opt-services.dovecot2.settings.dovecot_config_version}

Dovecot configuration version. It uses the same versioning as Dovecot in general, e.g. 3.0.5. It specifies the configuration syntax, the used setting names and the expected default values.

See [https://doc.dovecot.org/latest/core/summaries/settings.html#dovecot\_config\_version](https://doc.dovecot.org/latest/core/summaries/settings.html#dovecot_config_version).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings.dovecot_storage_version` {#opt-services.dovecot2.settings.dovecot_storage_version}

Dovecot storage file format version. It uses the same versioning as Dovecot in general, e.g. 3.0.5. It specifies the oldest Dovecot version that must be able to read files written by this Dovecot instance.

See [https://doc.dovecot.org/latest/core/summaries/settings.html#dovecot\_storage\_version](https://doc.dovecot.org/latest/core/summaries/settings.html#dovecot_storage_version).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings.mail_plugin_dir` {#opt-services.dovecot2.settings.mail_plugin_dir}

The directory in which to search for Dovecot mail plugins.

See [https://doc.dovecot.org/latest/core/summaries/settings.html#mail\_plugin\_dir](https://doc.dovecot.org/latest/core/summaries/settings.html#mail_plugin_dir).

*Type:* absolute path

*Default:* `"/run/current-system/sw/lib/dovecot/modules"`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings.maildir_copy_with_hardlinks` {#opt-services.dovecot2.settings.maildir_copy_with_hardlinks}

If enabled, copying of a message is done with hard links whenever possible.

See [https://doc.dovecot.org/latest/core/summaries/settings.html#maildir\_copy\_with\_hardlinks](https://doc.dovecot.org/latest/core/summaries/settings.html#maildir_copy_with_hardlinks).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings.plugin` {#opt-services.dovecot2.settings.plugin}

Plugin settings. This option is exclusive to Dovecot 2.3.

*Type:* null or (open submodule of attribute set of (Dovecot config value))

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings.plugin.sieve_extensions` {#opt-services.dovecot2.settings.plugin.sieve_extensions}

The Sieve language extensions available to users.

This option is exclusive to Dovecot 2.3.

See [https://doc.dovecot.org/2.3/settings/pigeonhole/#pigeonhole\_setting-sieve\_extensions](https://doc.dovecot.org/2.3/settings/pigeonhole/#pigeonhole_setting-sieve_extensions).

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings.plugin.sieve_global_extensions` {#opt-services.dovecot2.settings.plugin.sieve_global_extensions}

Which Sieve language extensions are **only** available in global scripts.

This option is exclusive to Dovecot 2.3.

See [https://doc.dovecot.org/2.3/settings/pigeonhole/#pigeonhole\_setting-sieve\_global\_extensions](https://doc.dovecot.org/2.3/settings/pigeonhole/#pigeonhole_setting-sieve_global_extensions).

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings.plugin.sieve_pipe_bin_dir` {#opt-services.dovecot2.settings.plugin.sieve_pipe_bin_dir}

Points to a directory where the plugin looks for programs (shell scripts) to execute directly and pipe messages to for the *vnd.dovecot.pipe* extension.

This option is exclusive to Dovecot 2.3.

See [https://doc.dovecot.org/2.3/configuration\_manual/sieve/plugins/extprograms/#configuration](https://doc.dovecot.org/2.3/configuration_manual/sieve/plugins/extprograms/#configuration).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings.plugin.sieve_plugins` {#opt-services.dovecot2.settings.plugin.sieve_plugins}

List of Sieve plugins to load.

This option is exclusive to Dovecot 2.3.

See [https://doc.dovecot.org/2.3/settings/pigeonhole/#pigeonhole\_setting-sieve\_plugins](https://doc.dovecot.org/2.3/settings/pigeonhole/#pigeonhole_setting-sieve_plugins).

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings.sendmail_path` {#opt-services.dovecot2.settings.sendmail_path}

The binary to use for sending email.

See [https://doc.dovecot.org/latest/core/summaries/settings.html#sendmail\_path](https://doc.dovecot.org/latest/core/summaries/settings.html#sendmail_path).

*Type:* absolute path

*Default:* `"/run/wrappers/bin/sendmail"`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings.sieve_global_extensions` {#opt-services.dovecot2.settings.sieve_global_extensions}

Which Sieve language extensions are **only** available in global scripts.

This option is exclusive to Dovecot 2.4.

See [https://doc.dovecot.org/latest/core/summaries/settings.html#sieve\_global\_extensions](https://doc.dovecot.org/latest/core/summaries/settings.html#sieve_global_extensions).

*Type:* null or (attribute set of boolean) or list of string

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings.sieve_pipe_bin_dir` {#opt-services.dovecot2.settings.sieve_pipe_bin_dir}

Points to a directory where the plugin looks for programs (shell scripts) to execute directly and pipe messages to for the *vnd.dovecot.pipe* extension.

This option is exclusive to Dovecot 2.4.

See [https://doc.dovecot.org/latest/core/summaries/settings.html#sieve\_plugins](https://doc.dovecot.org/latest/core/summaries/settings.html#sieve_plugins).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings.sieve_plugins` {#opt-services.dovecot2.settings.sieve_plugins}

List of Sieve plugins to load.

This option is exclusive to Dovecot 2.4.

See [https://doc.dovecot.org/latest/core/summaries/settings.html#sieve\_plugins](https://doc.dovecot.org/latest/core/summaries/settings.html#sieve_plugins).

*Type:* null or (attribute set of boolean) or list of string

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.settings.sieve_script_bin_path` {#opt-services.dovecot2.settings.sieve_script_bin_path}

Points to the directory where the compiled binaries for this script location are stored. This directory is created automatically if possible.

This option is exclusive to Dovecot 2.4.

See [https://doc.dovecot.org/latest/core/summaries/settings.html#sieve\_script\_bin\_path](https://doc.dovecot.org/latest/core/summaries/settings.html#sieve_script_bin_path).

*Type:* null or string

*Default:*

``` nix
if isPre24 || !hasPigeonhole
then null
else "/tmp/dovecot-%{user|username|lower}"
```

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.showPAMFailure` {#opt-services.dovecot2.showPAMFailure}

Whether to enable showing the PAM failure message on authentication error (useful for OTPW).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.sieve.extensions` {#opt-services.dovecot2.sieve.extensions}

Sieve extensions for use in user scripts

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "notify"
  "imapflags"
  "vnd.dovecot.filter"
]
```

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.sieve.globalExtensions` {#opt-services.dovecot2.sieve.globalExtensions}

Sieve extensions for use in global scripts

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "vnd.dovecot.environment"
]
```

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.sieve.pipeBins` {#opt-services.dovecot2.sieve.pipeBins}

Programs available for use by the vnd.dovecot.pipe extension

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
map lib.getExe [
  (pkgs.writeShellScriptBin "learn-ham.sh" "exec ${pkgs.rspamd}/bin/rspamc learn_ham")
  (pkgs.writeShellScriptBin "learn-spam.sh" "exec ${pkgs.rspamd}/bin/rspamc learn_spam")
]
```

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dovecot2.sieve.scripts` {#opt-services.dovecot2.sieve.scripts}

Sieve scripts to be executed. Key is a sequence, e.g. 'before2', 'after' etc.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/mail/dovecot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/dovecot.nix)

## `services.dragonflydb.bind` {#opt-services.dragonflydb.bind}

The IP interface to bind to.
`null` means "all interfaces".

*Type:* null or string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/databases/dragonflydb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/dragonflydb.nix)

## `services.dragonflydb.cacheMode` {#opt-services.dragonflydb.cacheMode}

Once this mode is on, Dragonfly will evict items least likely to be stumbled
upon in the future but only when it is near maxmemory limit.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/dragonflydb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/dragonflydb.nix)

## `services.dragonflydb.dbNum` {#opt-services.dragonflydb.dbNum}

Maximum number of supported databases for `select`

*Type:* null or (unsigned integer, meaning \>=0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/dragonflydb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/dragonflydb.nix)

## `services.dragonflydb.enable` {#opt-services.dragonflydb.enable}

Whether to enable DragonflyDB.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/dragonflydb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/dragonflydb.nix)

## `services.dragonflydb.keysOutputLimit` {#opt-services.dragonflydb.keysOutputLimit}

Maximum number of returned keys in keys command.
`keys` is a dangerous command.
We truncate its result to avoid blowup in memory when fetching too many keys.

*Type:* unsigned integer, meaning \>=0

*Default:* `8192`

*Declared by:* [`nixos/modules/services/databases/dragonflydb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/dragonflydb.nix)

## `services.dragonflydb.maxMemory` {#opt-services.dragonflydb.maxMemory}

The maximum amount of memory to use for storage (in bytes).
`null` means this will be automatically set.

*Type:* null or (unsigned integer, meaning \>=0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/dragonflydb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/dragonflydb.nix)

## `services.dragonflydb.memcachePort` {#opt-services.dragonflydb.memcachePort}

To enable memcached compatible API on this port.
`null` means disabled.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/dragonflydb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/dragonflydb.nix)

## `services.dragonflydb.port` {#opt-services.dragonflydb.port}

The TCP port to accept connections.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6379`

*Declared by:* [`nixos/modules/services/databases/dragonflydb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/dragonflydb.nix)

## `services.dragonflydb.requirePass` {#opt-services.dragonflydb.requirePass}

Password for database

*Type:* null or string

*Default:* `null`

*Example:* `"letmein!"`

*Declared by:* [`nixos/modules/services/databases/dragonflydb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/dragonflydb.nix)

## `services.dragonflydb.user` {#opt-services.dragonflydb.user}

The user to run DragonflyDB as

*Type:* string

*Default:* `"dragonfly"`

*Declared by:* [`nixos/modules/services/databases/dragonflydb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/dragonflydb.nix)

## `services.drasl.enable` {#opt-services.drasl.enable}

Whether to enable Drasl.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/drasl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drasl.nix)

## `services.drasl.enableDebug` {#opt-services.drasl.enableDebug}

Whether to enable debugging.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/drasl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drasl.nix)

## `services.drasl.package` {#opt-services.drasl.package}

The drasl package to use.

*Type:* package

*Default:* `pkgs.drasl`

*Declared by:* [`nixos/modules/services/web-apps/drasl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drasl.nix)

## `services.drasl.settings` {#opt-services.drasl.settings}

Configuration for Drasl. See the
[Drasl documentation](https://github.com/unmojang/drasl/blob/master/doc/configuration.md)
for possible options.

*Type:* open submodule of (TOML value)

*Declared by:* [`nixos/modules/services/web-apps/drasl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drasl.nix)

## `services.drasl.settings.RegistrationOIDC` {#opt-services.drasl.settings.RegistrationOIDC}

List of OpenID connect providers.

*Type:* list of (open submodule of (TOML value))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/drasl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drasl.nix)

## `services.drasl.settings.RegistrationOIDC.*.ClientSecretFile` {#opt-services.drasl.settings.RegistrationOIDC._.ClientSecretFile}

Path to a file containing the OIDC client secret.

::: note
The NixOS module will automatically load this file using
systemd's LoadCredential. Make sure this file is only
readable by the root user.
:::

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/drasl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drasl.nix)

## `services.draupnir.enable` {#opt-services.draupnir.enable}

Whether to enable Draupnir, a moderations bot for Matrix.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/draupnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/draupnir.nix)

## `services.draupnir.package` {#opt-services.draupnir.package}

The draupnir package to use.

*Type:* package

*Default:* `pkgs.draupnir`

*Declared by:* [`nixos/modules/services/matrix/draupnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/draupnir.nix)

## `services.draupnir.secrets.accessToken` {#opt-services.draupnir.secrets.accessToken}

File containing the access token for Draupnir's Matrix account
to be used in place of `services.draupnir.settings.accessToken`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/matrix/draupnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/draupnir.nix)

## `services.draupnir.secrets.pantalaimon.password` {#opt-services.draupnir.secrets.pantalaimon.password}

File containing the password for Draupnir's Matrix account when used in
conjunction with Pantalaimon to be used in place of
`services.draupnir.settings.pantalaimon.password`.

::: warning
Take note that upstream has limited Pantalaimon and E2EE support:
[https://the-draupnir-project.github.io/draupnir-documentation/bot/encryption](https://the-draupnir-project.github.io/draupnir-documentation/bot/encryption) and
[https://the-draupnir-project.github.io/draupnir-documentation/shared/dogfood#e2ee-support](https://the-draupnir-project.github.io/draupnir-documentation/shared/dogfood#e2ee-support).
:::

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/matrix/draupnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/draupnir.nix)

## `services.draupnir.secrets.web.synapseHTTPAntispam.authorization` {#opt-services.draupnir.secrets.web.synapseHTTPAntispam.authorization}

File containing the secret token when using the Synapse HTTP Antispam module
to be used in place of
`services.draupnir.settings.web.synapseHTTPAntispam.authorization`.

See [https://the-draupnir-project.github.io/draupnir-documentation/bot/synapse-http-antispam](https://the-draupnir-project.github.io/draupnir-documentation/bot/synapse-http-antispam) for details.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/matrix/draupnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/draupnir.nix)

## `services.draupnir.settings` {#opt-services.draupnir.settings}

Free-form settings written to Draupnir's configuration file.
See [Draupnir's default configuration](https://github.com/the-draupnir-project/Draupnir/blob/main/config/default.yaml) for available settings.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Example:*

``` nix
{
  homeserverUrl = "https://matrix.org";
  managementRoom = "#moderators:example.org";

  autojoinOnlyIfManager = true;
  automaticallyRedactForReasons = [ "spam" "advertising" ];
}
```

*Declared by:* [`nixos/modules/services/matrix/draupnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/draupnir.nix)

## `services.draupnir.settings.dataPath` {#opt-services.draupnir.settings.dataPath}

The path Draupnir will store its state/data in.

::: warning
This option is read-only.
:::

::: note
If you want to customize where this data is stored, use a bind mount.
:::

*Type:* absolute path

*Default:* `"/var/lib/draupnir"`

*Read only*

*Declared by:* [`nixos/modules/services/matrix/draupnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/draupnir.nix)

## `services.draupnir.settings.homeserverUrl` {#opt-services.draupnir.settings.homeserverUrl}

Base URL of the Matrix homeserver that provides the Client-Server API.

::: note
When using Pantalaimon, set this to the Pantalaimon URL and
[`services.draupnir.settings.rawHomeserverUrl`](#opt-services.draupnir.settings.rawHomeserverUrl) to the public URL.
:::

*Type:* string

*Example:* `"https://matrix.org"`

*Declared by:* [`nixos/modules/services/matrix/draupnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/draupnir.nix)

## `services.draupnir.settings.managementRoom` {#opt-services.draupnir.settings.managementRoom}

The room ID or alias where moderators can use the bot's functionality.

The bot has no access controls, so anyone in this room can use the bot - secure this room!
Do not enable end-to-end encryption for this room, unless set up with Pantalaimon.

::: warning
When using a room alias, make sure the alias used is on the local homeserver!
This prevents an issue where the control room becomes undefined when the alias can't be resolved.
:::

*Type:* string

*Example:* `"#moderators:example.org"`

*Declared by:* [`nixos/modules/services/matrix/draupnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/draupnir.nix)

## `services.draupnir.settings.rawHomeserverUrl` {#opt-services.draupnir.settings.rawHomeserverUrl}

Public base URL of the Matrix homeserver that provides the Client-Server API when using the Draupnir's
[Report forwarding feature](https://the-draupnir-project.github.io/draupnir-documentation/bot/homeserver-administration#report-forwarding).

::: warning
When using Pantalaimon, do not set this to the Pantalaimon URL!
:::

*Type:* string

*Default:* `config.services.draupnir.settings.homeserverUrl`

*Example:* `"https://matrix.org"`

*Declared by:* [`nixos/modules/services/matrix/draupnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/draupnir.nix)

## `services.drbd.config` {#opt-services.drbd.config}

Contents of the `drbd.conf` configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/network-filesystems/drbd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/drbd.nix)

## `services.drbd.enable` {#opt-services.drbd.enable}

Whether to enable support for DRBD, the Distributed Replicated
Block Device.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/drbd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/drbd.nix)

## `services.druid.broker.config` {#opt-services.druid.broker.config}

(key=value) Configuration to be written to runtime.properties of the druid Druid Broker
[https://druid.apache.org/docs/latest/configuration/index.html](https://druid.apache.org/docs/latest/configuration/index.html)

*Type:* attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  "druid.plainTextPort" = "8082";
  "druid.service" = "servicename";
}
```

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.broker.enable` {#opt-services.druid.broker.enable}

Whether to enable Druid Broker.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.broker.jdk` {#opt-services.druid.broker.jdk}

The JDK package to use.

*Type:* package

*Default:* `pkgs.jdk17_headless`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.broker.jvmArgs` {#opt-services.druid.broker.jvmArgs}

Arguments to pass to the JVM

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.broker.openFirewall` {#opt-services.druid.broker.openFirewall}

Open firewall ports for Druid Broker.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.broker.restartIfChanged` {#opt-services.druid.broker.restartIfChanged}

Automatically restart the service on config change.
This can be set to false to defer restarts on clusters running critical applications.
Please consider the security implications of inadvertently running an older version,
and the possibility of unexpected behavior caused by inconsistent versions across a cluster when disabling this option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.commonConfig` {#opt-services.druid.commonConfig}

(key=value) Configuration to be written to common.runtime.properties

*Type:* attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  "druid.extensions.loadList" = "[ \"mysql-metadata-storage\" ]";
  "druid.metadata.storage.connector.connectURI" = "jdbc:mysql://localhost:3306/druid";
  "druid.metadata.storage.type" = "mysql";
  "druid.zk.service.host" = "localhost:2181";
}
```

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.commonTmpDirs` {#opt-services.druid.commonTmpDirs}

Common List of directories used by druid processes

*Type:* list of string

*Default:*

``` nix
[
  "/var/log/druid/requests"
]
```

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.coordinator.config` {#opt-services.druid.coordinator.config}

(key=value) Configuration to be written to runtime.properties of the druid Druid Coordinator
[https://druid.apache.org/docs/latest/configuration/index.html](https://druid.apache.org/docs/latest/configuration/index.html)

*Type:* attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  "druid.plainTextPort" = "8082";
  "druid.service" = "servicename";
}
```

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.coordinator.enable` {#opt-services.druid.coordinator.enable}

Whether to enable Druid Coordinator.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.coordinator.jdk` {#opt-services.druid.coordinator.jdk}

The JDK package to use.

*Type:* package

*Default:* `pkgs.jdk17_headless`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.coordinator.jvmArgs` {#opt-services.druid.coordinator.jvmArgs}

Arguments to pass to the JVM

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.coordinator.openFirewall` {#opt-services.druid.coordinator.openFirewall}

Open firewall ports for Druid Coordinator.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.coordinator.restartIfChanged` {#opt-services.druid.coordinator.restartIfChanged}

Automatically restart the service on config change.
This can be set to false to defer restarts on clusters running critical applications.
Please consider the security implications of inadvertently running an older version,
and the possibility of unexpected behavior caused by inconsistent versions across a cluster when disabling this option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.extraClassPaths` {#opt-services.druid.extraClassPaths}

Extra classpath to include in the jvm

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.extraConfDirs` {#opt-services.druid.extraConfDirs}

Extra Conf Dirs to include in the jvm

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.historical.config` {#opt-services.druid.historical.config}

(key=value) Configuration to be written to runtime.properties of the druid Druid Historical
[https://druid.apache.org/docs/latest/configuration/index.html](https://druid.apache.org/docs/latest/configuration/index.html)

*Type:* attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  "druid.plainTextPort" = "8082";
  "druid.service" = "servicename";
}
```

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.historical.enable` {#opt-services.druid.historical.enable}

Whether to enable Druid Historical.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.historical.jdk` {#opt-services.druid.historical.jdk}

The JDK package to use.

*Type:* package

*Default:* `pkgs.jdk17_headless`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.historical.jvmArgs` {#opt-services.druid.historical.jvmArgs}

Arguments to pass to the JVM

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.historical.openFirewall` {#opt-services.druid.historical.openFirewall}

Open firewall ports for Druid Historical.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.historical.restartIfChanged` {#opt-services.druid.historical.restartIfChanged}

Automatically restart the service on config change.
This can be set to false to defer restarts on clusters running critical applications.
Please consider the security implications of inadvertently running an older version,
and the possibility of unexpected behavior caused by inconsistent versions across a cluster when disabling this option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.historical.segmentLocations` {#opt-services.druid.historical.segmentLocations}

Locations where the historical will store its data.

*Type:* null or (list of (submodule))

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.historical.segmentLocations.*.freeSpacePercent` {#opt-services.druid.historical.segmentLocations._.freeSpacePercent}

Druid Historical will fail to write if it exceeds this value

*Type:* floating point number

*Default:* `1.0`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.historical.segmentLocations.*.maxSize` {#opt-services.druid.historical.segmentLocations._.maxSize}

Max size the druid historical can occupy

*Type:* string

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.historical.segmentLocations.*.path` {#opt-services.druid.historical.segmentLocations._.path}

the path to store the segments

*Type:* absolute path

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.log4j` {#opt-services.druid.log4j}

Log4j Configuration for the druid process

*Type:* absolute path

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.middleManager.config` {#opt-services.druid.middleManager.config}

(key=value) Configuration to be written to runtime.properties of the druid Druid middleManager
[https://druid.apache.org/docs/latest/configuration/index.html](https://druid.apache.org/docs/latest/configuration/index.html)

*Type:* attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  "druid.plainTextPort" = "8082";
  "druid.service" = "servicename";
}
```

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.middleManager.enable` {#opt-services.druid.middleManager.enable}

Whether to enable Druid middleManager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.middleManager.jdk` {#opt-services.druid.middleManager.jdk}

The JDK package to use.

*Type:* package

*Default:* `pkgs.jdk17_headless`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.middleManager.jvmArgs` {#opt-services.druid.middleManager.jvmArgs}

Arguments to pass to the JVM

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.middleManager.openFirewall` {#opt-services.druid.middleManager.openFirewall}

Open firewall ports for Druid middleManager.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.middleManager.restartIfChanged` {#opt-services.druid.middleManager.restartIfChanged}

Automatically restart the service on config change.
This can be set to false to defer restarts on clusters running critical applications.
Please consider the security implications of inadvertently running an older version,
and the possibility of unexpected behavior caused by inconsistent versions across a cluster when disabling this option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.overlord.config` {#opt-services.druid.overlord.config}

(key=value) Configuration to be written to runtime.properties of the druid Druid Overlord
[https://druid.apache.org/docs/latest/configuration/index.html](https://druid.apache.org/docs/latest/configuration/index.html)

*Type:* attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  "druid.plainTextPort" = "8082";
  "druid.service" = "servicename";
}
```

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.overlord.enable` {#opt-services.druid.overlord.enable}

Whether to enable Druid Overlord.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.overlord.jdk` {#opt-services.druid.overlord.jdk}

The JDK package to use.

*Type:* package

*Default:* `pkgs.jdk17_headless`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.overlord.jvmArgs` {#opt-services.druid.overlord.jvmArgs}

Arguments to pass to the JVM

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.overlord.openFirewall` {#opt-services.druid.overlord.openFirewall}

Open firewall ports for Druid Overlord.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.overlord.restartIfChanged` {#opt-services.druid.overlord.restartIfChanged}

Automatically restart the service on config change.
This can be set to false to defer restarts on clusters running critical applications.
Please consider the security implications of inadvertently running an older version,
and the possibility of unexpected behavior caused by inconsistent versions across a cluster when disabling this option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.package` {#opt-services.druid.package}

The apache-druid package to use.

*Type:* package

*Default:* `pkgs.druid`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.router.config` {#opt-services.druid.router.config}

(key=value) Configuration to be written to runtime.properties of the druid Druid Router
[https://druid.apache.org/docs/latest/configuration/index.html](https://druid.apache.org/docs/latest/configuration/index.html)

*Type:* attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  "druid.plainTextPort" = "8082";
  "druid.service" = "servicename";
}
```

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.router.enable` {#opt-services.druid.router.enable}

Whether to enable Druid Router.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.router.jdk` {#opt-services.druid.router.jdk}

The JDK package to use.

*Type:* package

*Default:* `pkgs.jdk17_headless`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.router.jvmArgs` {#opt-services.druid.router.jvmArgs}

Arguments to pass to the JVM

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.router.openFirewall` {#opt-services.druid.router.openFirewall}

Open firewall ports for Druid Router.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.druid.router.restartIfChanged` {#opt-services.druid.router.restartIfChanged}

Automatically restart the service on config change.
This can be set to false to defer restarts on clusters running critical applications.
Please consider the security implications of inadvertently running an older version,
and the possibility of unexpected behavior caused by inconsistent versions across a cluster when disabling this option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/druid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/druid/default.nix)

## `services.drupal.enable` {#opt-services.drupal.enable}

Whether to enable drupal.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.package` {#opt-services.drupal.package}

The drupal package to use.

*Type:* package

*Default:* `pkgs.drupal`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites` {#opt-services.drupal.sites}

Specification of one or more Drupal sites to serve

*Type:* attribute set of (submodule)

*Default:*

``` nix
{
  localhost = {
    enable = true;
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.configRoot` {#opt-services.drupal.sites._name_.configRoot}

An optional path string with a leading slash
indicating the location of the config sync directory on
the Drupal package. Your package will probably have a config sync
directory if it has been significantly customized.

The path must be relative to the project root directory.

This option differs from the `configSyncDir` option, which
tells this service where to create a user-writeable config directory
on NixOS.

*Type:* string

*Default:* `""`

*Example:* `"/config"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.configSyncDir` {#opt-services.drupal.sites._name_.configSyncDir}

The location of the user-managed Drupal config sync directory.
Drupal will both read from and write to this directory when executing
configuration management operations.

This option differs from the `configRoot` option,
which this service uses to discover
the location of the config sync directory in the package's source code.

*Type:* absolute path

*Default:* `"/var/lib/drupal/<name>/config/sync"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.database.createLocally` {#opt-services.drupal.sites._name_.database.createLocally}

Create the database and database user locally.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.database.host` {#opt-services.drupal.sites._name_.database.host}

Database host address.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.database.name` {#opt-services.drupal.sites._name_.database.name}

Database name.

*Type:* string

*Default:* `"drupal"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.database.passwordFile` {#opt-services.drupal.sites._name_.database.passwordFile}

A file containing the password corresponding to
`database.user`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/database-dbpassword"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.database.port` {#opt-services.drupal.sites._name_.database.port}

Database host port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3306`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.database.socket` {#opt-services.drupal.sites._name_.database.socket}

Path to the unix socket file to use for authentication.

*Type:* null or absolute path

*Default:* `/run/mysqld/mysqld.sock`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.database.tablePrefix` {#opt-services.drupal.sites._name_.database.tablePrefix}

The $table\_prefix is the value placed in the front of your database tables.
Change the value if you want to use something other than dp\_ for your database
prefix. Typically this is changed if you are installing multiple Drupal sites
in the same database.

*Type:* string

*Default:* `"dp_"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.database.user` {#opt-services.drupal.sites._name_.database.user}

Database user.

*Type:* string

*Default:* `"drupal"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.enable` {#opt-services.drupal.sites._name_.enable}

Whether to enable Drupal web application.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.extraConfig` {#opt-services.drupal.sites._name_.extraConfig}

Extra configuration values that you want to insert into settings.php.
All configuration must be written as PHP script.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  $config['user.settings']['anonymous'] = 'Visitor';
  $settings['entity_update_backup'] = TRUE;
''
```

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.filesDir` {#opt-services.drupal.sites._name_.filesDir}

The location of the Drupal files directory.

Many of the files in this directory are variable, so they must be located
in a location writeable by users of the webgroup.

*Type:* absolute path

*Default:* `"/var/lib/drupal/<name>/sites/default/files"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.modulesDir` {#opt-services.drupal.sites._name_.modulesDir}

The location for users to manually install Drupal modules.

Note: in most instances, it is preferable to install modules using
composer, or to package them with your source code repository, if
you are using a custom Drupal.

*Type:* absolute path

*Default:* `"/var/lib/drupal/<name>/modules"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.package` {#opt-services.drupal.sites._name_.package}

The drupal package to use.

*Type:* package

*Default:* `pkgs.drupal`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.phpOptions` {#opt-services.drupal.sites._name_.phpOptions}

Options for PHP's php.ini file for this Drupal site.

*Type:* attribute set of (null or boolean or signed integer or floating point number or string)

*Default:* `{ }`

*Example:*

``` nix
{
  "opcache.interned_strings_buffer" = 8;
  "opcache.max_accelerated_files" = 10000;
  "opcache.memory_consumption" = 128;
  "opcache.revalidate_freq" = 15;
  "opcache.fast_shutdown" = 1;
}
```

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.poolConfig` {#opt-services.drupal.sites._name_.poolConfig}

Options for the Drupal PHP pool. See the documentation on `php-fpm.conf`
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

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.privateFilesDir` {#opt-services.drupal.sites._name_.privateFilesDir}

The location of the Drupal private files directory.

*Type:* absolute path

*Default:* `"/var/lib/drupal/<name>/private"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.stateDir` {#opt-services.drupal.sites._name_.stateDir}

The location of the user-managed Drupal site state directory.
This directory will contain the settings and configuration files for
your Drupal instance. It may also contain your files directory if the
`filesDir` option remains unchanged.

Many of the files in this directory are variable, so they must be located
in a location writeable by users of the webgroup.

*Type:* absolute path

*Default:* `"/var/lib/drupal/<name>"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.themesDir` {#opt-services.drupal.sites._name_.themesDir}

The location for users to manually install Drupal themes.

Note: in most instances, it is preferable to install themes using
composer, or to package them with your source code repository, if
you are using a custom Drupal.

*Type:* absolute path

*Default:* `"/var/lib/drupal/<name>/themes"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost` {#opt-services.drupal.sites._name_.virtualHost}

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

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.acmeRoot` {#opt-services.drupal.sites._name_.virtualHost.acmeRoot}

Directory for the acme challenge which is PUBLIC, don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.addSSL` {#opt-services.drupal.sites._name_.virtualHost.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.adminAddr` {#opt-services.drupal.sites._name_.virtualHost.adminAddr}

E-mail address of the server administrator.

*Type:* null or string

*Default:* `null`

*Example:* `"admin@example.org"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.documentRoot` {#opt-services.drupal.sites._name_.virtualHost.documentRoot}

The path of Apache's document root directory.  If left undefined,
an empty directory in the Nix store will be used as root.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.enableACME` {#opt-services.drupal.sites._name_.virtualHost.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.enableUserDir` {#opt-services.drupal.sites._name_.virtualHost.enableUserDir}

Whether to enable serving `~/public_html` as
`/~«username»`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.extraConfig` {#opt-services.drupal.sites._name_.virtualHost.extraConfig}

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

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.forceSSL` {#opt-services.drupal.sites._name_.virtualHost.forceSSL}

Whether to add a separate nginx server block that permanently redirects (301)
all plain HTTP traffic to HTTPS. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443), where the non-SSL listens are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.globalRedirect` {#opt-services.drupal.sites._name_.virtualHost.globalRedirect}

If set, all requests for this host are redirected permanently to
the given URL.

*Type:* null or string

*Default:* `null`

*Example:* `"http://newserver.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.hostName` {#opt-services.drupal.sites._name_.virtualHost.hostName}

Canonical hostname for the server.

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.http2` {#opt-services.drupal.sites._name_.virtualHost.http2}

Whether to enable HTTP 2. HTTP/2 is supported in all multi-processing modules that come with httpd. *However, if you use the prefork mpm, there will
be severe restrictions.* Refer to [https://httpd.apache.org/docs/2.4/howto/http2.html#mpm-config](https://httpd.apache.org/docs/2.4/howto/http2.html#mpm-config) for details.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.listen` {#opt-services.drupal.sites._name_.virtualHost.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.listen.*.ip` {#opt-services.drupal.sites._name_.virtualHost.listen._.ip}

IP to listen on. 0.0.0.0 for IPv4 only, \* for all.

*Type:* string

*Default:* `"*"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.listen.*.port` {#opt-services.drupal.sites._name_.virtualHost.listen._.port}

Port to listen on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.listen.*.ssl` {#opt-services.drupal.sites._name_.virtualHost.listen._.ssl}

Whether to enable SSL (https) support.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.listenAddresses` {#opt-services.drupal.sites._name_.virtualHost.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.locations` {#opt-services.drupal.sites._name_.virtualHost.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.locations.<name>.alias` {#opt-services.drupal.sites._name_.virtualHost.locations._name_.alias}

Alias directory for requests. See [https://httpd.apache.org/docs/2.4/mod/mod\_alias.html#alias](https://httpd.apache.org/docs/2.4/mod/mod_alias.html#alias).

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.locations.<name>.extraConfig` {#opt-services.drupal.sites._name_.virtualHost.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.locations.<name>.index` {#opt-services.drupal.sites._name_.virtualHost.locations._name_.index}

Adds DirectoryIndex directive. See [https://httpd.apache.org/docs/2.4/mod/mod\_dir.html#directoryindex](https://httpd.apache.org/docs/2.4/mod/mod_dir.html#directoryindex).

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.locations.<name>.priority` {#opt-services.drupal.sites._name_.virtualHost.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.locations.<name>.proxyPass` {#opt-services.drupal.sites._name_.virtualHost.locations._name_.proxyPass}

Sets up a simple reverse proxy as described by [https://httpd.apache.org/docs/2.4/howto/reverse\_proxy.html#simple](https://httpd.apache.org/docs/2.4/howto/reverse_proxy.html#simple).

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.logFormat` {#opt-services.drupal.sites._name_.virtualHost.logFormat}

Log format for Apache's log files. Possible values are: combined, common, referer, agent.

*Type:* string

*Default:* `"common"`

*Example:* `"combined"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.onlySSL` {#opt-services.drupal.sites._name_.virtualHost.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.robotsEntries` {#opt-services.drupal.sites._name_.virtualHost.robotsEntries}

Specification of pages to be ignored by web crawlers. See [http://www.robotstxt.org/](http://www.robotstxt.org/) for details.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"Disallow: /foo/"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.servedDirs` {#opt-services.drupal.sites._name_.virtualHost.servedDirs}

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

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.servedFiles` {#opt-services.drupal.sites._name_.virtualHost.servedFiles}

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

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.serverAliases` {#opt-services.drupal.sites._name_.virtualHost.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.sslServerCert` {#opt-services.drupal.sites._name_.virtualHost.sslServerCert}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.sslServerChain` {#opt-services.drupal.sites._name_.virtualHost.sslServerChain}

Path to server SSL chain file.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/ca.pem"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.sslServerKey` {#opt-services.drupal.sites._name_.virtualHost.sslServerKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.virtualHost.useACMEHost` {#opt-services.drupal.sites._name_.virtualHost.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.sites.<name>.webRoot` {#opt-services.drupal.sites._name_.webRoot}

An optional path string with a leading slash
indicating the location of the Drupal webroot
in your package's source code.

The path relative to the project root directory.

*Type:* string

*Default:* `""`

*Example:* `"/web"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.drupal.webserver` {#opt-services.drupal.webserver}

Whether to use nginx or caddy for virtual host management.

Further nginx configuration can be done by adapting `services.nginx.virtualHosts.<name>`.
See [services (N)](../../options/services-n/index.md#opt-services.nginx.virtualHosts) for further information.

Further caddy configuration can be done by adapting `services.caddy.virtualHosts.<name>`.
See [services (C)](../../options/services-c/index.md#opt-services.caddy.virtualHosts) for further information.

*Type:* one of "nginx", "caddy"

*Default:* `"nginx"`

*Declared by:* [`nixos/modules/services/web-apps/drupal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/drupal.nix)

## `services.dsnet.enable` {#opt-services.dsnet.enable}

Whether to enable dsnet, a centralised Wireguard VPN manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/dsnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dsnet.nix)

## `services.dsnet.package` {#opt-services.dsnet.package}

The dsnet package to use.

*Type:* package

*Default:* `pkgs.dsnet`

*Declared by:* [`nixos/modules/services/networking/dsnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dsnet.nix)

## `services.dsnet.settings` {#opt-services.dsnet.settings}

The settings to use for dsnet. This will be converted to a JSON
object that will be passed to dsnet as a patch, using the patch
command when the service is started. See the dsnet documentation for
more information on the additional options.

Note that the resulting /etc/dsnetconfg.json is more of a database
than it is a configuration file. It is therefore recommended that
system specific values are configured here, rather than the full
configuration including peers.

Peers may be managed via the dsnet add/remove commands, negating the
need to manage key material and cumbersom configuration with nix. If
you want peer configuration in nix, you may as well use the regular
wireguard module.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Example:*

``` nix
{
  DNS = "8.8.8.8";
  ExternalHostname = "vpn.example.com";
  ExternalIP = "127.0.0.1";
  ExternalIP6 = "";
  IP = "10.3.148.1";
  IP6 = "";
  ListenPort = 51820;
  Network = "10.3.148.0/22";
  Network6 = "";
  Networks = [
    "0.0.0.0/0"
  ];
}
```

*Declared by:* [`nixos/modules/services/networking/dsnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dsnet.nix)

## `services.dsnet.settings.ExternalHostname` {#opt-services.dsnet.settings.ExternalHostname}

The hostname that clients should use to connect to this server.
This is used to generate the client configuration files.

This is preferred over ExternalIP, as it allows for IPv4 and
IPv6, as well as enabling the ability tp change IP.

*Type:* null or string

*Default:* `null`

*Example:* `"vpn.example.com"`

*Declared by:* [`nixos/modules/services/networking/dsnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dsnet.nix)

## `services.dsnet.settings.ExternalIP` {#opt-services.dsnet.settings.ExternalIP}

The external IP address of the server. This is used to generate
the client configuration files for when an ExternalHostname is not set.

Leaving this empty will cause dsnet to use the IP address of
what looks like the WAN interface.

*Type:* null or string

*Default:* `null`

*Example:* `"192.0.2.1"`

*Declared by:* [`nixos/modules/services/networking/dsnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dsnet.nix)

## `services.dsnet.settings.ExternalIP6` {#opt-services.dsnet.settings.ExternalIP6}

The external IPv6 address of the server. This is used to generate
the client configuration files for when an ExternalHostname is
not set. Used in preference to ExternalIP.

Leaving this empty will cause dsnet to use the IP address of
what looks like the WAN interface.

*Type:* null or string

*Default:* `null`

*Example:* `"2001:db8::1"`

*Declared by:* [`nixos/modules/services/networking/dsnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dsnet.nix)

## `services.dsnet.settings.IP` {#opt-services.dsnet.settings.IP}

The IPv4 address that the server will use on the network.
Leave this empty to let dsnet choose an address.

*Type:* null or string

*Default:* `null`

*Example:* `"172.18.0.1"`

*Declared by:* [`nixos/modules/services/networking/dsnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dsnet.nix)

## `services.dsnet.settings.IP6` {#opt-services.dsnet.settings.IP6}

The IPv6 address that the server will use on the network
Leave this empty to let dsnet choose an address.

*Type:* null or string

*Default:* `null`

*Example:* `"2001:db8::1"`

*Declared by:* [`nixos/modules/services/networking/dsnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dsnet.nix)

## `services.dsnet.settings.Network` {#opt-services.dsnet.settings.Network}

The IPv4 network that the server will use to allocate IPs on the network.
Leave this empty to let dsnet choose a network.

*Type:* null or string

*Default:* `null`

*Example:* `"172.18.0.0/24"`

*Declared by:* [`nixos/modules/services/networking/dsnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dsnet.nix)

## `services.dsnet.settings.Network6` {#opt-services.dsnet.settings.Network6}

The IPv6 network that the server will use to allocate IPs on the
network.
Leave this empty to let dsnet choose a network.

*Type:* null or string

*Default:* `null`

*Example:* `"2001:db8::1/64"`

*Declared by:* [`nixos/modules/services/networking/dsnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dsnet.nix)

## `services.dsnet.settings.Networks` {#opt-services.dsnet.settings.Networks}

The CIDR networks that should route through this server. Clients
will be configured to route traffic for these networks through
the server peer.

*Type:* null or (list of string)

*Default:* `null`

*Example:*

``` nix
[
  "0.0.0.0/0"
  "192.168.0.0/24"
]
```

*Declared by:* [`nixos/modules/services/networking/dsnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dsnet.nix)

## `services.duckdns.domains` {#opt-services.duckdns.domains}

The domain(s) to update in DuckDNS
(without the .duckdns.org suffix)

*Type:* null or (list of string)

*Default:* `null`

*Example:*

``` nix
[
  "examplehost"
]
```

*Declared by:* [`nixos/modules/services/misc/duckdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/duckdns.nix)

## `services.duckdns.domainsFile` {#opt-services.duckdns.domainsFile}

The path to a file containing a
newline-separated list of DuckDNS
domain(s) to be updated
(without the .duckdns.org suffix)

*Type:* null or absolute path

*Default:* `null`

*Example:*

``` nix
pkgs.writeText "duckdns-domains.txt" ''
  examplehost
  examplehost2
  examplehost3
''
```

*Declared by:* [`nixos/modules/services/misc/duckdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/duckdns.nix)

## `services.duckdns.enable` {#opt-services.duckdns.enable}

Whether to enable DuckDNS Dynamic DNS Client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/duckdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/duckdns.nix)

## `services.duckdns.tokenFile` {#opt-services.duckdns.tokenFile}

The path to a file containing the token
used to authenticate with DuckDNS.

*Type:* absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/duckdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/duckdns.nix)

## `services.duckling.enable` {#opt-services.duckling.enable}

Whether to enable duckling.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/duckling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/duckling.nix)

## `services.duckling.port` {#opt-services.duckling.port}

Port on which duckling will run.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/misc/duckling.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/duckling.nix)

## `services.dufs.bindAddresses` {#opt-services.dufs.bindAddresses}

IP addresses on which dufs listens.

*Type:* non-empty (list of string)

*Default:*

``` nix
[
  "127.0.0.1"
]
```

*Example:*

``` nix
[
  "127.0.0.1"
  "::1"
]
```

*Declared by:* [`nixos/modules/services/network-filesystems/dufs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/dufs.nix)

## `services.dufs.enable` {#opt-services.dufs.enable}

Whether to enable dufs file server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/dufs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/dufs.nix)

## `services.dufs.environmentFile` {#opt-services.dufs.environmentFile}

Environment file as defined in `systemd.exec(5)`. Use
`DUFS_AUTH` in this file to keep authentication credentials out of the
world-readable Nix store.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/dufs.env"`

*Declared by:* [`nixos/modules/services/network-filesystems/dufs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/dufs.nix)

## `services.dufs.group` {#opt-services.dufs.group}

Group under which dufs runs.

*Type:* string

*Default:* `"dufs"`

*Declared by:* [`nixos/modules/services/network-filesystems/dufs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/dufs.nix)

## `services.dufs.openFirewall` {#opt-services.dufs.openFirewall}

Whether to enable opening the dufs TCP port in the firewall.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/dufs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/dufs.nix)

## `services.dufs.package` {#opt-services.dufs.package}

The dufs package to use.

*Type:* package

*Default:* `pkgs.dufs`

*Declared by:* [`nixos/modules/services/network-filesystems/dufs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/dufs.nix)

## `services.dufs.port` {#opt-services.dufs.port}

TCP port on which dufs listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5000`

*Declared by:* [`nixos/modules/services/network-filesystems/dufs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/dufs.nix)

## `services.dufs.servePath` {#opt-services.dufs.servePath}

Path served by dufs. The default path `/var/lib/dufs` is created
automatically. Any other path must already exist and be accessible to
the configured user and group.

*Type:* absolute path

*Default:* `"/var/lib/dufs"`

*Declared by:* [`nixos/modules/services/network-filesystems/dufs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/dufs.nix)

## `services.dufs.settings` {#opt-services.dufs.settings}

Settings written to the dufs YAML configuration file. See the
[dufs configuration documentation](https://github.com/sigoden/dufs#configuration-file)
for available values. Configure `serve-path`, `bind`, and `port` with
their dedicated NixOS options instead.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  allow-delete = true;
  allow-upload = true;
  compress = "low";
  hidden = [
    "*.tmp"
  ];
}
```

*Declared by:* [`nixos/modules/services/network-filesystems/dufs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/dufs.nix)

## `services.dufs.user` {#opt-services.dufs.user}

User account under which dufs runs.

*Type:* string

*Default:* `"dufs"`

*Declared by:* [`nixos/modules/services/network-filesystems/dufs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/dufs.nix)

## `services.dump1090-fa.enable` {#opt-services.dump1090-fa.enable}

Whether to enable dump1090-fa.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/dump1090-fa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/dump1090-fa.nix)

## `services.dump1090-fa.extraArgs` {#opt-services.dump1090-fa.extraArgs}

Additional passed arguments

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/dump1090-fa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/dump1090-fa.nix)

## `services.dump1090-fa.package` {#opt-services.dump1090-fa.package}

The dump1090-fa package to use.

*Type:* package

*Default:* `pkgs.dump1090-fa`

*Declared by:* [`nixos/modules/services/misc/dump1090-fa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/dump1090-fa.nix)

## `services.dunst.enable` {#opt-services.dunst.enable}

Whether to enable Dunst notification daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/dunst.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/dunst.nix)

## `services.dunst.enableWayland` {#opt-services.dunst.enableWayland}

Whether to enable Wayland support.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/desktops/dunst.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/dunst.nix)

## `services.dunst.enableX11` {#opt-services.dunst.enableX11}

Whether to enable X11 support.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/desktops/dunst.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/dunst.nix)

## `services.dunst.package` {#opt-services.dunst.package}

The dunst package to use.

*Type:* package

*Default:* `pkgs.dunst`

*Declared by:* [`nixos/modules/services/desktops/dunst.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/dunst.nix)

## `services.dunst.settings` {#opt-services.dunst.settings}

Dunst configuration, see dunst(5)

*Type:* attribute set of attribute set of (INI atom (null, bool, int, float or string) or attribute set of (INI atom (null, bool, int, float or string)))

*Default:* `{ }`

*Example:*

``` nix
{
  global = {
    width = 300;
    height = 300;
    offset = "30x50";
    origin = "top-right";
    transparency = 10;
    frame_color = "#eceff1";
    font = "Droid Sans 9";
  };

  urgency_normal = {
    background = "#37474f";
    foreground = "#eceff1";
    timeout = 10;
  };
};
```

*Declared by:* [`nixos/modules/services/desktops/dunst.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/dunst.nix)

## `services.duplicati.dataDir` {#opt-services.duplicati.dataDir}

The directory where Duplicati stores its data files.

::: note
If left as the default value this directory will automatically be created
before the Duplicati server starts, otherwise you are responsible for ensuring
the directory exists with appropriate ownership and permissions.
:::

*Type:* string

*Default:* `"/var/lib/duplicati"`

*Declared by:* [`nixos/modules/services/backup/duplicati.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/duplicati.nix)

## `services.duplicati.enable` {#opt-services.duplicati.enable}

Whether to enable Duplicati.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/duplicati.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/duplicati.nix)

## `services.duplicati.interface` {#opt-services.duplicati.interface}

Listening interface for the web UI
Set it to "any" to listen on all available interfaces

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/backup/duplicati.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/duplicati.nix)

## `services.duplicati.package` {#opt-services.duplicati.package}

The duplicati package to use.

*Type:* package

*Default:* `pkgs.duplicati`

*Declared by:* [`nixos/modules/services/backup/duplicati.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/duplicati.nix)

## `services.duplicati.parameters` {#opt-services.duplicati.parameters}

This option can be used to store some or all of the options given to the
commandline client.
Each line in this option should be of the format --option=value.
The options in this file take precedence over the options provided
through command line arguments.
[Duplicati docs: parameters-file](https://duplicati.readthedocs.io/en/latest/06-advanced-options/#parameters-file)

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  --webservice-allowedhostnames=*
''
```

*Declared by:* [`nixos/modules/services/backup/duplicati.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/duplicati.nix)

## `services.duplicati.parametersFile` {#opt-services.duplicati.parametersFile}

This file can be used to store some or all of the options given to the
commandline client.
Each line in the file option should be of the format --option=value.
The options in this file take precedence over the options provided
through command line arguments.
[Duplicati docs: parameters-file](https://duplicati.readthedocs.io/en/latest/06-advanced-options/#parameters-file)

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/duplicati.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/duplicati.nix)

## `services.duplicati.port` {#opt-services.duplicati.port}

Port serving the web interface

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8200`

*Declared by:* [`nixos/modules/services/backup/duplicati.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/duplicati.nix)

## `services.duplicati.user` {#opt-services.duplicati.user}

Duplicati runs as it's own user. It will only be able to backup world-readable files.
Run as root with special care.

*Type:* string

*Default:* `"duplicati"`

*Declared by:* [`nixos/modules/services/backup/duplicati.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/duplicati.nix)

## `services.duplicity.cleanup.maxAge` {#opt-services.duplicity.cleanup.maxAge}

If non-null, delete all backup sets older than the given time.  Old backup sets
will not be deleted if backup sets newer than time depend on them.

*Type:* null or string

*Default:* `null`

*Example:* `"6M"`

*Declared by:* [`nixos/modules/services/backup/duplicity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/duplicity.nix)

## `services.duplicity.cleanup.maxFull` {#opt-services.duplicity.cleanup.maxFull}

If non-null, delete all backups sets that are older than the count:th last full
backup (in other words, keep the last count full backups and
associated incremental sets).

*Type:* null or signed integer

*Default:* `null`

*Example:* `2`

*Declared by:* [`nixos/modules/services/backup/duplicity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/duplicity.nix)

## `services.duplicity.cleanup.maxIncr` {#opt-services.duplicity.cleanup.maxIncr}

If non-null, delete incremental sets of all backups sets that are
older than the count:th last full backup (in other words, keep only
old full backups and not their increments).

*Type:* null or signed integer

*Default:* `null`

*Example:* `1`

*Declared by:* [`nixos/modules/services/backup/duplicity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/duplicity.nix)

## `services.duplicity.enable` {#opt-services.duplicity.enable}

Whether to enable backups with duplicity.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/duplicity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/duplicity.nix)

## `services.duplicity.exclude` {#opt-services.duplicity.exclude}

List of paths to exclude from backups. See the FILE SELECTION section in
`duplicity(1)` for details on the syntax.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/backup/duplicity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/duplicity.nix)

## `services.duplicity.excludeFileList` {#opt-services.duplicity.excludeFileList}

File containing newline-separated list of paths to exclude into the
backups. See the FILE SELECTION section in `duplicity(1)` for
details on the syntax.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/path/to/fileList.txt"`

*Declared by:* [`nixos/modules/services/backup/duplicity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/duplicity.nix)

## `services.duplicity.extraFlags` {#opt-services.duplicity.extraFlags}

Extra command-line flags passed to duplicity. See
`duplicity(1)`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--backend-retry-delay"
  "100"
]
```

*Declared by:* [`nixos/modules/services/backup/duplicity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/duplicity.nix)

## `services.duplicity.frequency` {#opt-services.duplicity.frequency}

Run duplicity with the given frequency (see
`systemd.time(7)` for the format).
If null, do not run automatically.

*Type:* null or string

*Default:* `"daily"`

*Declared by:* [`nixos/modules/services/backup/duplicity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/duplicity.nix)

## `services.duplicity.fullIfOlderThan` {#opt-services.duplicity.fullIfOlderThan}

If `"never"` (the default) always do incremental
backups (the first backup will be a full backup, of course).  If
`"always"` always do full backups.  Otherwise, this
must be a string representing a duration. Full backups will be made
when the latest full backup is older than this duration. If this is not
the case, an incremental backup is performed.

*Type:* string

*Default:* `"never"`

*Example:* `"1M"`

*Declared by:* [`nixos/modules/services/backup/duplicity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/duplicity.nix)

## `services.duplicity.include` {#opt-services.duplicity.include}

List of paths to include into the backups. See the FILE SELECTION
section in `duplicity(1)` for details on the syntax.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/home"
]
```

*Declared by:* [`nixos/modules/services/backup/duplicity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/duplicity.nix)

## `services.duplicity.includeFileList` {#opt-services.duplicity.includeFileList}

File containing newline-separated list of paths to include into the
backups. See the FILE SELECTION section in `duplicity(1)` for
details on the syntax.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/path/to/fileList.txt"`

*Declared by:* [`nixos/modules/services/backup/duplicity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/duplicity.nix)

## `services.duplicity.root` {#opt-services.duplicity.root}

Root directory to backup.

*Type:* absolute path

*Default:* `"/"`

*Declared by:* [`nixos/modules/services/backup/duplicity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/duplicity.nix)

## `services.duplicity.secretFile` {#opt-services.duplicity.secretFile}

Path of a file containing secrets (gpg passphrase, access key...) in
the format of EnvironmentFile as described by
`systemd.exec(5)`. For example:

```
PASSPHRASE=«...»
AWS_ACCESS_KEY_ID=«...»
AWS_SECRET_ACCESS_KEY=«...»
```

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/duplicity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/duplicity.nix)

## `services.duplicity.targetUrl` {#opt-services.duplicity.targetUrl}

Target url to backup to. See the URL FORMAT section in
`duplicity(1)` for supported urls.

*Type:* string

*Example:* `"s3://host:port/prefix"`

*Declared by:* [`nixos/modules/services/backup/duplicity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/duplicity.nix)

## `services.dwm-status.enable` {#opt-services.dwm-status.enable}

Whether to enable dwm-status user service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/dwm-status.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/dwm-status.nix)

## `services.dwm-status.package` {#opt-services.dwm-status.package}

The dwm-status package to use.

*Type:* package

*Default:* `pkgs.dwm-status`

*Example:* `dwm-status.override { enableAlsaUtils = false; }`

*Declared by:* [`nixos/modules/services/misc/dwm-status.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/dwm-status.nix)

## `services.dwm-status.settings` {#opt-services.dwm-status.settings}

Config options for dwm-status, see [https://github.com/Gerschtli/dwm-status#configuration](https://github.com/Gerschtli/dwm-status#configuration)
for available options.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Example:*

``` nix
{
  order = [
    "battery"
    "cpu_load"
    "time"
  ];
  time = {
    format = "%F %a %r";
    update_seconds = true;
  };
}
```

*Declared by:* [`nixos/modules/services/misc/dwm-status.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/dwm-status.nix)

## `services.dwm-status.settings.order` {#opt-services.dwm-status.settings.order}

List of enabled features in order.

*Type:* list of (one of "audio", "backlight", "battery", "cpu\_load", "network", "time")

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/dwm-status.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/dwm-status.nix)

## `services.dysnomia.components` {#opt-services.dysnomia.components}

An attribute set in which each key represents a container and each value an attribute set in which each key represents a component and each value a derivation constructing its initial state

*Type:* attribute set of (attribute set)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/dysnomia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/dysnomia.nix)

## `services.dysnomia.containers` {#opt-services.dysnomia.containers}

An attribute set in which each key represents a container and each value an attribute set providing its configuration properties

*Type:* attribute set of (attribute set)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/dysnomia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/dysnomia.nix)

## `services.dysnomia.enable` {#opt-services.dysnomia.enable}

Whether to enable Dysnomia

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/dysnomia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/dysnomia.nix)

## `services.dysnomia.enableAuthentication` {#opt-services.dysnomia.enableAuthentication}

Whether to publish privacy-sensitive authentication credentials

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/dysnomia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/dysnomia.nix)

## `services.dysnomia.enableLegacyModules` {#opt-services.dysnomia.enableLegacyModules}

Whether to enable Dysnomia legacy process and wrapper modules

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/dysnomia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/dysnomia.nix)

## `services.dysnomia.extraContainerPaths` {#opt-services.dysnomia.extraContainerPaths}

A list of paths containing additional container configurations that are added to the search folders

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/dysnomia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/dysnomia.nix)

## `services.dysnomia.extraContainerProperties` {#opt-services.dysnomia.extraContainerProperties}

An attribute set providing additional container settings in addition to the default properties

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/dysnomia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/dysnomia.nix)

## `services.dysnomia.extraModulePaths` {#opt-services.dysnomia.extraModulePaths}

A list of paths containing additional modules that are added to the search folders

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/dysnomia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/dysnomia.nix)

## `services.dysnomia.package` {#opt-services.dysnomia.package}

The Dysnomia package

*Type:* absolute path

*Declared by:* [`nixos/modules/services/misc/dysnomia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/dysnomia.nix)

## `services.dysnomia.properties` {#opt-services.dysnomia.properties}

An attribute set in which each attribute represents a machine property. Optionally, these values can be shell substitutions.

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/dysnomia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/dysnomia.nix)
