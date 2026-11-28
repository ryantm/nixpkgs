# services (Z) {#sec-options-services-z}

## `services.zabbixAgent.enable` {#opt-services.zabbixAgent.enable}

Whether to enable the Zabbix Agent.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-agent.nix)

## `services.zabbixAgent.extraPackages` {#opt-services.zabbixAgent.extraPackages}

Packages to be added to the Zabbix `PATH`.
Typically used to add executables for scripts, but can be anything.

*Type:* list of package

*Default:* `with pkgs; [ net-tools ]`

*Example:* `with pkgs; [ net-tools mysql ]`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-agent.nix)

## `services.zabbixAgent.listen.ip` {#opt-services.zabbixAgent.listen.ip}

List of comma delimited IP addresses that the agent should listen on.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-agent.nix)

## `services.zabbixAgent.listen.port` {#opt-services.zabbixAgent.listen.port}

Agent will listen on this port for connections from the server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `10050`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-agent.nix)

## `services.zabbixAgent.modules` {#opt-services.zabbixAgent.modules}

A set of modules to load.

*Type:* attribute set of package

*Default:* `{ }`

*Example:*

``` nix
{
  "dummy.so" = pkgs.stdenv.mkDerivation {
    name = "zabbix-dummy-module-${cfg.package.version}";
    src = cfg.package.src;
    buildInputs = [ cfg.package ];
    sourceRoot = "zabbix-${cfg.package.version}/src/modules/dummy";
    installPhase = ''
      mkdir -p $out/lib
      cp dummy.so $out/lib/
    '';
  };
}
```

*Declared by:* [`nixos/modules/services/monitoring/zabbix-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-agent.nix)

## `services.zabbixAgent.openFirewall` {#opt-services.zabbixAgent.openFirewall}

Open ports in the firewall for the Zabbix Agent.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-agent.nix)

## `services.zabbixAgent.package` {#opt-services.zabbixAgent.package}

The agent package to use.

*Type:* package

*Default:* `pkgs.zabbix.agent`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-agent.nix)

## `services.zabbixAgent.server` {#opt-services.zabbixAgent.server}

The IP address or hostname of the Zabbix server to connect to.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/zabbix-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-agent.nix)

## `services.zabbixAgent.settings` {#opt-services.zabbixAgent.settings}

Zabbix Agent configuration. Refer to
[https://www.zabbix.com/documentation/current/manual/appendix/config/zabbix\_agentd](https://www.zabbix.com/documentation/current/manual/appendix/config/zabbix_agentd)
for details on supported values.

*Type:* attribute set of (signed integer or string or list of string)

*Default:* `{ }`

*Example:*

``` nix
{
  DebugLevel = 4;
  Hostname = "example.org";
}
```

*Declared by:* [`nixos/modules/services/monitoring/zabbix-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-agent.nix)

## `services.zabbixProxy.database.createLocally` {#opt-services.zabbixProxy.database.createLocally}

Whether to create a local database automatically.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-proxy.nix)

## `services.zabbixProxy.database.host` {#opt-services.zabbixProxy.database.host}

Database host address.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-proxy.nix)

## `services.zabbixProxy.database.name` {#opt-services.zabbixProxy.database.name}

Database name.

*Type:* string

*Default:* `zabbix`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-proxy.nix)

## `services.zabbixProxy.database.passwordFile` {#opt-services.zabbixProxy.database.passwordFile}

A file containing the password corresponding to
`database.user`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/zabbix-dbpassword"`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-proxy.nix)

## `services.zabbixProxy.database.port` {#opt-services.zabbixProxy.database.port}

Database host port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
if config.services.zabbixProxy.database.type == "mysql"
then config.services.mysql.port
else config.services.postgresql.settings.port
```

*Declared by:* [`nixos/modules/services/monitoring/zabbix-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-proxy.nix)

## `services.zabbixProxy.database.socket` {#opt-services.zabbixProxy.database.socket}

Path to the unix socket file to use for authentication.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/postgresql"`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-proxy.nix)

## `services.zabbixProxy.database.type` {#opt-services.zabbixProxy.database.type}

Database engine to use.

*Type:* one of "mysql", "pgsql", "sqlite"

*Default:* `"pgsql"`

*Example:* `"mysql"`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-proxy.nix)

## `services.zabbixProxy.database.user` {#opt-services.zabbixProxy.database.user}

Database user.

*Type:* string

*Default:* `"zabbix"`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-proxy.nix)

## `services.zabbixProxy.enable` {#opt-services.zabbixProxy.enable}

Whether to enable the Zabbix Proxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-proxy.nix)

## `services.zabbixProxy.extraPackages` {#opt-services.zabbixProxy.extraPackages}

Packages to be added to the Zabbix `PATH`.
Typically used to add executables for scripts, but can be anything.

*Type:* list of package

*Default:* `[ net-tools nmap traceroute ]`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-proxy.nix)

## `services.zabbixProxy.listen.ip` {#opt-services.zabbixProxy.listen.ip}

List of comma delimited IP addresses that the trapper should listen on.
Trapper will listen on all network interfaces if this parameter is missing.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-proxy.nix)

## `services.zabbixProxy.listen.port` {#opt-services.zabbixProxy.listen.port}

Listen port for trapper.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `10051`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-proxy.nix)

## `services.zabbixProxy.modules` {#opt-services.zabbixProxy.modules}

A set of modules to load.

*Type:* attribute set of package

*Default:* `{ }`

*Example:*

``` nix
{
  "dummy.so" = pkgs.stdenv.mkDerivation {
    name = "zabbix-dummy-module-${cfg.package.version}";
    src = cfg.package.src;
    buildInputs = [ cfg.package ];
    sourceRoot = "zabbix-${cfg.package.version}/src/modules/dummy";
    installPhase = ''
      mkdir -p $out/lib
      cp dummy.so $out/lib/
    '';
  };
}
```

*Declared by:* [`nixos/modules/services/monitoring/zabbix-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-proxy.nix)

## `services.zabbixProxy.openFirewall` {#opt-services.zabbixProxy.openFirewall}

Open ports in the firewall for the Zabbix Proxy.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-proxy.nix)

## `services.zabbixProxy.package` {#opt-services.zabbixProxy.package}

The Zabbix package to use.

*Type:* package

*Default:* `pkgs.zabbix.proxy-pgsql`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-proxy.nix)

## `services.zabbixProxy.server` {#opt-services.zabbixProxy.server}

The IP address or hostname of the Zabbix server to connect to.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/zabbix-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-proxy.nix)

## `services.zabbixProxy.settings` {#opt-services.zabbixProxy.settings}

Zabbix Proxy configuration. Refer to
[https://www.zabbix.com/documentation/current/manual/appendix/config/zabbix\_proxy](https://www.zabbix.com/documentation/current/manual/appendix/config/zabbix_proxy)
for details on supported values.

*Type:* attribute set of (signed integer or string or list of string)

*Default:* `{ }`

*Example:*

``` nix
{
  CacheSize = "1G";
  SSHKeyLocation = "/var/lib/zabbix/.ssh";
  StartPingers = 32;
}
```

*Declared by:* [`nixos/modules/services/monitoring/zabbix-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-proxy.nix)

## `services.zabbixServer.database.createLocally` {#opt-services.zabbixServer.database.createLocally}

Whether to create a local database automatically.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-server.nix)

## `services.zabbixServer.database.host` {#opt-services.zabbixServer.database.host}

Database host address.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-server.nix)

## `services.zabbixServer.database.name` {#opt-services.zabbixServer.database.name}

Database name.

*Type:* string

*Default:* `"zabbix"`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-server.nix)

## `services.zabbixServer.database.passwordFile` {#opt-services.zabbixServer.database.passwordFile}

A file containing the password corresponding to
`database.user`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/zabbix-dbpassword"`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-server.nix)

## `services.zabbixServer.database.port` {#opt-services.zabbixServer.database.port}

Database host port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
if config.services.zabbixServer.database.type == "mysql"
then config.services.mysql.port
else config.services.postgresql.settings.port
```

*Declared by:* [`nixos/modules/services/monitoring/zabbix-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-server.nix)

## `services.zabbixServer.database.socket` {#opt-services.zabbixServer.database.socket}

Path to the unix socket file to use for authentication.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/postgresql"`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-server.nix)

## `services.zabbixServer.database.type` {#opt-services.zabbixServer.database.type}

Database engine to use.

*Type:* one of "mysql", "pgsql"

*Default:* `"pgsql"`

*Example:* `"mysql"`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-server.nix)

## `services.zabbixServer.database.user` {#opt-services.zabbixServer.database.user}

Database user.

*Type:* string

*Default:* `"zabbix"`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-server.nix)

## `services.zabbixServer.enable` {#opt-services.zabbixServer.enable}

Whether to enable the Zabbix Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-server.nix)

## `services.zabbixServer.extraPackages` {#opt-services.zabbixServer.extraPackages}

Packages to be added to the Zabbix `PATH`.
Typically used to add executables for scripts, but can be anything.

*Type:* list of package

*Default:* `[ net-tools nmap traceroute ]`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-server.nix)

## `services.zabbixServer.listen.ip` {#opt-services.zabbixServer.listen.ip}

List of comma delimited IP addresses that the trapper should listen on.
Trapper will listen on all network interfaces if this parameter is missing.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-server.nix)

## `services.zabbixServer.listen.port` {#opt-services.zabbixServer.listen.port}

Listen port for trapper.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `10051`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-server.nix)

## `services.zabbixServer.modules` {#opt-services.zabbixServer.modules}

A set of modules to load.

*Type:* attribute set of package

*Default:* `{ }`

*Example:*

``` nix
{
  "dummy.so" = pkgs.stdenv.mkDerivation {
    name = "zabbix-dummy-module-${cfg.package.version}";
    src = cfg.package.src;
    buildInputs = [ cfg.package ];
    sourceRoot = "zabbix-${cfg.package.version}/src/modules/dummy";
    installPhase = ''
      mkdir -p $out/lib
      cp dummy.so $out/lib/
    '';
  };
}
```

*Declared by:* [`nixos/modules/services/monitoring/zabbix-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-server.nix)

## `services.zabbixServer.openFirewall` {#opt-services.zabbixServer.openFirewall}

Open ports in the firewall for the Zabbix Server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-server.nix)

## `services.zabbixServer.package` {#opt-services.zabbixServer.package}

The Zabbix package to use.

*Type:* package

*Default:* `pkgs.zabbix.server-pgsql`

*Declared by:* [`nixos/modules/services/monitoring/zabbix-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-server.nix)

## `services.zabbixServer.settings` {#opt-services.zabbixServer.settings}

Zabbix Server configuration. Refer to
[https://www.zabbix.com/documentation/current/manual/appendix/config/zabbix\_server](https://www.zabbix.com/documentation/current/manual/appendix/config/zabbix_server)
for details on supported values.

*Type:* attribute set of (signed integer or string or list of string)

*Default:* `{ }`

*Example:*

``` nix
{
  CacheSize = "1G";
  SSHKeyLocation = "/var/lib/zabbix/.ssh";
  StartPingers = 32;
}
```

*Declared by:* [`nixos/modules/services/monitoring/zabbix-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/zabbix-server.nix)

## `services.zabbixWeb.database.host` {#opt-services.zabbixWeb.database.host}

Database host address.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.database.name` {#opt-services.zabbixWeb.database.name}

Database name.

*Type:* string

*Default:* `"zabbix"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.database.passwordFile` {#opt-services.zabbixWeb.database.passwordFile}

A file containing the password corresponding to
`database.user`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/zabbix-dbpassword"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.database.port` {#opt-services.zabbixWeb.database.port}

Database host port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
if config.services.zabbixWeb.database.type == "mysql" then config.services.mysql.port
else if config.services.zabbixWeb.database.type == "pgsql" then config.services.postgresql.settings.port
else 1521
```

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.database.socket` {#opt-services.zabbixWeb.database.socket}

Path to the unix socket file to use for authentication.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/postgresql"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.database.type` {#opt-services.zabbixWeb.database.type}

Database engine to use.

*Type:* one of "mysql", "pgsql", "oracle"

*Default:* `"pgsql"`

*Example:* `"mysql"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.database.user` {#opt-services.zabbixWeb.database.user}

Database user.

*Type:* string

*Default:* `"zabbix"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.enable` {#opt-services.zabbixWeb.enable}

Whether to enable the Zabbix web interface.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.extraConfig` {#opt-services.zabbixWeb.extraConfig}

Additional configuration to be copied verbatim into `zabbix.conf.php`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.frontend` {#opt-services.zabbixWeb.frontend}

Frontend server to use.

*Type:* one of "nginx", "httpd"

*Default:* `"httpd"`

*Example:* `"nginx"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.hostname` {#opt-services.zabbixWeb.hostname}

Hostname for either nginx or httpd.

*Type:* string

*Default:* `"zabbix.local"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost` {#opt-services.zabbixWeb.httpd.virtualHost}

Apache configuration can be done by adapting `services.httpd.virtualHosts.<name>`.
See [services (H)](../../options/services-h/index.md#opt-services.httpd.virtualHosts) for further information.

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
{
  hostName = "zabbix.example.org";
  adminAddr = "webmaster@example.org";
  forceSSL = true;
  enableACME = true;
}
```

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.acmeRoot` {#opt-services.zabbixWeb.httpd.virtualHost.acmeRoot}

Directory for the acme challenge which is PUBLIC, don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.addSSL` {#opt-services.zabbixWeb.httpd.virtualHost.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.adminAddr` {#opt-services.zabbixWeb.httpd.virtualHost.adminAddr}

E-mail address of the server administrator.

*Type:* null or string

*Default:* `null`

*Example:* `"admin@example.org"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.documentRoot` {#opt-services.zabbixWeb.httpd.virtualHost.documentRoot}

The path of Apache's document root directory.  If left undefined,
an empty directory in the Nix store will be used as root.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.enableACME` {#opt-services.zabbixWeb.httpd.virtualHost.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.enableUserDir` {#opt-services.zabbixWeb.httpd.virtualHost.enableUserDir}

Whether to enable serving `~/public_html` as
`/~«username»`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.extraConfig` {#opt-services.zabbixWeb.httpd.virtualHost.extraConfig}

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

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.forceSSL` {#opt-services.zabbixWeb.httpd.virtualHost.forceSSL}

Whether to add a separate nginx server block that permanently redirects (301)
all plain HTTP traffic to HTTPS. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443), where the non-SSL listens are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.globalRedirect` {#opt-services.zabbixWeb.httpd.virtualHost.globalRedirect}

If set, all requests for this host are redirected permanently to
the given URL.

*Type:* null or string

*Default:* `null`

*Example:* `"http://newserver.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.hostName` {#opt-services.zabbixWeb.httpd.virtualHost.hostName}

Canonical hostname for the server.

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.http2` {#opt-services.zabbixWeb.httpd.virtualHost.http2}

Whether to enable HTTP 2. HTTP/2 is supported in all multi-processing modules that come with httpd. *However, if you use the prefork mpm, there will
be severe restrictions.* Refer to [https://httpd.apache.org/docs/2.4/howto/http2.html#mpm-config](https://httpd.apache.org/docs/2.4/howto/http2.html#mpm-config) for details.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.listen` {#opt-services.zabbixWeb.httpd.virtualHost.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.listen.*.ip` {#opt-services.zabbixWeb.httpd.virtualHost.listen._.ip}

IP to listen on. 0.0.0.0 for IPv4 only, \* for all.

*Type:* string

*Default:* `"*"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.listen.*.port` {#opt-services.zabbixWeb.httpd.virtualHost.listen._.port}

Port to listen on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.listen.*.ssl` {#opt-services.zabbixWeb.httpd.virtualHost.listen._.ssl}

Whether to enable SSL (https) support.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.listenAddresses` {#opt-services.zabbixWeb.httpd.virtualHost.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.locations` {#opt-services.zabbixWeb.httpd.virtualHost.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.locations.<name>.alias` {#opt-services.zabbixWeb.httpd.virtualHost.locations._name_.alias}

Alias directory for requests. See [https://httpd.apache.org/docs/2.4/mod/mod\_alias.html#alias](https://httpd.apache.org/docs/2.4/mod/mod_alias.html#alias).

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.locations.<name>.extraConfig` {#opt-services.zabbixWeb.httpd.virtualHost.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.locations.<name>.index` {#opt-services.zabbixWeb.httpd.virtualHost.locations._name_.index}

Adds DirectoryIndex directive. See [https://httpd.apache.org/docs/2.4/mod/mod\_dir.html#directoryindex](https://httpd.apache.org/docs/2.4/mod/mod_dir.html#directoryindex).

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.locations.<name>.priority` {#opt-services.zabbixWeb.httpd.virtualHost.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.locations.<name>.proxyPass` {#opt-services.zabbixWeb.httpd.virtualHost.locations._name_.proxyPass}

Sets up a simple reverse proxy as described by [https://httpd.apache.org/docs/2.4/howto/reverse\_proxy.html#simple](https://httpd.apache.org/docs/2.4/howto/reverse_proxy.html#simple).

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.logFormat` {#opt-services.zabbixWeb.httpd.virtualHost.logFormat}

Log format for Apache's log files. Possible values are: combined, common, referer, agent.

*Type:* string

*Default:* `"common"`

*Example:* `"combined"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.onlySSL` {#opt-services.zabbixWeb.httpd.virtualHost.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.robotsEntries` {#opt-services.zabbixWeb.httpd.virtualHost.robotsEntries}

Specification of pages to be ignored by web crawlers. See [http://www.robotstxt.org/](http://www.robotstxt.org/) for details.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"Disallow: /foo/"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.servedDirs` {#opt-services.zabbixWeb.httpd.virtualHost.servedDirs}

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

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.servedFiles` {#opt-services.zabbixWeb.httpd.virtualHost.servedFiles}

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

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.serverAliases` {#opt-services.zabbixWeb.httpd.virtualHost.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.sslServerCert` {#opt-services.zabbixWeb.httpd.virtualHost.sslServerCert}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.sslServerChain` {#opt-services.zabbixWeb.httpd.virtualHost.sslServerChain}

Path to server SSL chain file.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/ca.pem"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.sslServerKey` {#opt-services.zabbixWeb.httpd.virtualHost.sslServerKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.httpd.virtualHost.useACMEHost` {#opt-services.zabbixWeb.httpd.virtualHost.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost` {#opt-services.zabbixWeb.nginx.virtualHost}

Nginx configuration can be done by adapting `services.nginx.virtualHosts.<name>`.
See [services (N)](../../options/services-n/index.md#opt-services.nginx.virtualHosts) for further information.

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
{
  forceSSL = true;
  sslCertificateKey = "/etc/ssl/zabbix.key";
  sslCertificate = "/etc/ssl/zabbix.crt";
}
```

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.acmeFallbackHost` {#opt-services.zabbixWeb.nginx.virtualHost.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.acmeRoot` {#opt-services.zabbixWeb.nginx.virtualHost.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.addSSL` {#opt-services.zabbixWeb.nginx.virtualHost.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.basicAuth` {#opt-services.zabbixWeb.nginx.virtualHost.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.basicAuthFile` {#opt-services.zabbixWeb.nginx.virtualHost.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.default` {#opt-services.zabbixWeb.nginx.virtualHost.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.enableACME` {#opt-services.zabbixWeb.nginx.virtualHost.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.extraConfig` {#opt-services.zabbixWeb.nginx.virtualHost.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.forceSSL` {#opt-services.zabbixWeb.nginx.virtualHost.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.globalRedirect` {#opt-services.zabbixWeb.nginx.virtualHost.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.http2` {#opt-services.zabbixWeb.nginx.virtualHost.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.http3` {#opt-services.zabbixWeb.nginx.virtualHost.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.http3_hq` {#opt-services.zabbixWeb.nginx.virtualHost.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.kTLS` {#opt-services.zabbixWeb.nginx.virtualHost.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.listen` {#opt-services.zabbixWeb.nginx.virtualHost.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.listen.*.addr` {#opt-services.zabbixWeb.nginx.virtualHost.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.listen.*.extraParameters` {#opt-services.zabbixWeb.nginx.virtualHost.listen._.extraParameters}

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

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.listen.*.port` {#opt-services.zabbixWeb.nginx.virtualHost.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.listen.*.proxyProtocol` {#opt-services.zabbixWeb.nginx.virtualHost.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.listen.*.ssl` {#opt-services.zabbixWeb.nginx.virtualHost.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.listenAddresses` {#opt-services.zabbixWeb.nginx.virtualHost.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.locations` {#opt-services.zabbixWeb.nginx.virtualHost.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.locations.<name>.alias` {#opt-services.zabbixWeb.nginx.virtualHost.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.locations.<name>.basicAuth` {#opt-services.zabbixWeb.nginx.virtualHost.locations._name_.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.locations.<name>.basicAuthFile` {#opt-services.zabbixWeb.nginx.virtualHost.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.locations.<name>.extraConfig` {#opt-services.zabbixWeb.nginx.virtualHost.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.locations.<name>.fastcgiParams` {#opt-services.zabbixWeb.nginx.virtualHost.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.locations.<name>.index` {#opt-services.zabbixWeb.nginx.virtualHost.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.locations.<name>.priority` {#opt-services.zabbixWeb.nginx.virtualHost.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.locations.<name>.proxyPass` {#opt-services.zabbixWeb.nginx.virtualHost.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.locations.<name>.proxyWebsockets` {#opt-services.zabbixWeb.nginx.virtualHost.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.locations.<name>.recommendedProxySettings` {#opt-services.zabbixWeb.nginx.virtualHost.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.locations.<name>.recommendedUwsgiSettings` {#opt-services.zabbixWeb.nginx.virtualHost.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.locations.<name>.return` {#opt-services.zabbixWeb.nginx.virtualHost.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.locations.<name>.root` {#opt-services.zabbixWeb.nginx.virtualHost.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.locations.<name>.tryFiles` {#opt-services.zabbixWeb.nginx.virtualHost.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.locations.<name>.useGrpcErrorPages` {#opt-services.zabbixWeb.nginx.virtualHost.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.locations.<name>.uwsgiPass` {#opt-services.zabbixWeb.nginx.virtualHost.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.onlySSL` {#opt-services.zabbixWeb.nginx.virtualHost.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.quic` {#opt-services.zabbixWeb.nginx.virtualHost.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.redirectCode` {#opt-services.zabbixWeb.nginx.virtualHost.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.rejectSSL` {#opt-services.zabbixWeb.nginx.virtualHost.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.reuseport` {#opt-services.zabbixWeb.nginx.virtualHost.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.root` {#opt-services.zabbixWeb.nginx.virtualHost.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.serverAliases` {#opt-services.zabbixWeb.nginx.virtualHost.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.serverName` {#opt-services.zabbixWeb.nginx.virtualHost.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.sslCertificate` {#opt-services.zabbixWeb.nginx.virtualHost.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.sslCertificateKey` {#opt-services.zabbixWeb.nginx.virtualHost.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.sslTrustedCertificate` {#opt-services.zabbixWeb.nginx.virtualHost.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.nginx.virtualHost.useACMEHost` {#opt-services.zabbixWeb.nginx.virtualHost.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.package` {#opt-services.zabbixWeb.package}

The web package to use.

*Type:* package

*Default:* `pkgs.zabbix.web`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.poolConfig` {#opt-services.zabbixWeb.poolConfig}

Options for the Zabbix PHP pool. See the documentation on `php-fpm.conf` for details on configuration directives.

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

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.server.address` {#opt-services.zabbixWeb.server.address}

The IP address or hostname of the Zabbix server to connect to.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zabbixWeb.server.port` {#opt-services.zabbixWeb.server.port}

The port of the Zabbix server to connect to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `10051`

*Declared by:* [`nixos/modules/services/web-apps/zabbix.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zabbix.nix)

## `services.zammad.dataDir` {#opt-services.zammad.dataDir}

Path to a folder that will contain Zammad working directory.

*Type:* absolute path

*Default:* `"/var/lib/zammad"`

*Declared by:* [`nixos/modules/services/development/zammad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/zammad.nix)

## `services.zammad.database.createLocally` {#opt-services.zammad.database.createLocally}

Whether to create a local database automatically.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/development/zammad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/zammad.nix)

## `services.zammad.database.host` {#opt-services.zammad.database.host}

Database host address.

*Type:* string

*Default:* `"/run/postgresql"`

*Declared by:* [`nixos/modules/services/development/zammad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/zammad.nix)

## `services.zammad.database.name` {#opt-services.zammad.database.name}

Database name.

*Type:* string

*Default:* `"zammad"`

*Declared by:* [`nixos/modules/services/development/zammad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/zammad.nix)

## `services.zammad.database.passwordFile` {#opt-services.zammad.database.passwordFile}

A file containing the password for [`services.zammad.database.user`](#opt-services.zammad.database.user).

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/zammad-dbpassword"`

*Declared by:* [`nixos/modules/services/development/zammad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/zammad.nix)

## `services.zammad.database.port` {#opt-services.zammad.database.port}

Database port. Use `null` for default port.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/development/zammad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/zammad.nix)

## `services.zammad.database.settings` {#opt-services.zammad.database.settings}

The `database.yml` configuration file as key value set.
See \<TODO\>
for list of configuration parameters.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
}
```

*Declared by:* [`nixos/modules/services/development/zammad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/zammad.nix)

## `services.zammad.database.user` {#opt-services.zammad.database.user}

Database user.

*Type:* null or string

*Default:* `"zammad"`

*Declared by:* [`nixos/modules/services/development/zammad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/zammad.nix)

## `services.zammad.enable` {#opt-services.zammad.enable}

Whether to enable Zammad, a web-based, open source user support/ticketing solution.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/development/zammad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/zammad.nix)

## `services.zammad.group` {#opt-services.zammad.group}

Name of the Zammad group.

*Type:* string

*Default:* `"zammad"`

*Declared by:* [`nixos/modules/services/development/zammad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/zammad.nix)

## `services.zammad.host` {#opt-services.zammad.host}

Host address.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"192.168.23.42"`

*Declared by:* [`nixos/modules/services/development/zammad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/zammad.nix)

## `services.zammad.nginx.configure` {#opt-services.zammad.nginx.configure}

Whether to configure a local nginx for Zammad.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/development/zammad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/zammad.nix)

## `services.zammad.nginx.domain` {#opt-services.zammad.nginx.domain}

The domain under which zammad will be reachable.

*Type:* string

*Declared by:* [`nixos/modules/services/development/zammad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/zammad.nix)

## `services.zammad.package` {#opt-services.zammad.package}

The zammad package to use.

*Type:* package

*Default:* `pkgs.zammad`

*Declared by:* [`nixos/modules/services/development/zammad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/zammad.nix)

## `services.zammad.port` {#opt-services.zammad.port}

Web service port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/development/zammad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/zammad.nix)

## `services.zammad.redis.createLocally` {#opt-services.zammad.redis.createLocally}

Whether to create a local redis automatically.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/development/zammad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/zammad.nix)

## `services.zammad.redis.host` {#opt-services.zammad.redis.host}

Redis server address.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/development/zammad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/zammad.nix)

## `services.zammad.redis.name` {#opt-services.zammad.redis.name}

Name of the redis server. Only used if `createLocally` is set to true.

*Type:* string

*Default:* `"zammad"`

*Declared by:* [`nixos/modules/services/development/zammad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/zammad.nix)

## `services.zammad.redis.port` {#opt-services.zammad.redis.port}

Port of the redis server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6379`

*Declared by:* [`nixos/modules/services/development/zammad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/zammad.nix)

## `services.zammad.secretKeyBaseFile` {#opt-services.zammad.secretKeyBaseFile}

The path to a file containing the
`secret_key_base` secret.

Zammad uses `secret_key_base` to encrypt
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

*Declared by:* [`nixos/modules/services/development/zammad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/zammad.nix)

## `services.zammad.user` {#opt-services.zammad.user}

Name of the Zammad user.

*Type:* string

*Default:* `"zammad"`

*Declared by:* [`nixos/modules/services/development/zammad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/zammad.nix)

## `services.zammad.websocketPort` {#opt-services.zammad.websocketPort}

Websocket service port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6042`

*Declared by:* [`nixos/modules/services/development/zammad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/zammad.nix)

## `services.zapret.blacklist` {#opt-services.zapret.blacklist}

Specify a list of domains NOT to bypass. All other domains will be bypassed.
You can specify either whitelist or blacklist, but not both.
If neither are specified, then bypass all domains.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "example.com"
]
```

*Declared by:* [`nixos/modules/services/networking/zapret.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret.nix)

## `services.zapret.configureFirewall` {#opt-services.zapret.configureFirewall}

Whether to setup firewall routing so that system http(s) traffic is forwarded via this service.
Disable if you want to set it up manually.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/zapret.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret.nix)

## `services.zapret.enable` {#opt-services.zapret.enable}

Whether to enable the Zapret DPI bypass service..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/zapret.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret.nix)

## `services.zapret.httpMode` {#opt-services.zapret.httpMode}

By default this service only changes the first packet sent, which is enough in most cases.
But there are DPIs that monitor the whole traffic within a session.
That requires full processing of every packet, which increases the CPU usage.

Set the mode to `full` if http doesn't work.

*Type:* one of "first", "full"

*Default:* `"first"`

*Example:* `"full"`

*Declared by:* [`nixos/modules/services/networking/zapret.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret.nix)

## `services.zapret.httpSupport` {#opt-services.zapret.httpSupport}

Whether to route http traffic on port 80.
Http bypass rarely works and you might want to disable it if you don't utilise http connections.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/zapret.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret.nix)

## `services.zapret.package` {#opt-services.zapret.package}

The zapret package to use.

*Type:* package

*Default:* `pkgs.zapret`

*Declared by:* [`nixos/modules/services/networking/zapret.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret.nix)

## `services.zapret.params` {#opt-services.zapret.params}

Specify the bypass parameters for Zapret binary.
There are no universal parameters as they vary between different networks, so you'll have to find them yourself.

This can be done by running the `blockcheck` binary from zapret package, i.e. `nix-shell -p nftables zapret --command blockcheck` (or `iptables` instead of `nftables` if that is what your firewall is using).
It'll try different params and then tell you which params are working for your network.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--dpi-desync=fake,disorder2"
  "--dpi-desync-ttl=1"
  "--dpi-desync-autottl=2"
]
```

*Declared by:* [`nixos/modules/services/networking/zapret.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret.nix)

## `services.zapret.qnum` {#opt-services.zapret.qnum}

Routing queue number.
Only change this if you already use the default queue number somewhere else.

*Type:* signed integer

*Default:* `200`

*Declared by:* [`nixos/modules/services/networking/zapret.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret.nix)

## `services.zapret.udpPorts` {#opt-services.zapret.udpPorts}

List of UDP ports to route.
Port ranges are delimited with a colon like this "50000:50099".

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "50000:50099"
  "1234"
]
```

*Declared by:* [`nixos/modules/services/networking/zapret.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret.nix)

## `services.zapret.udpSupport` {#opt-services.zapret.udpSupport}

Enable UDP routing.
This requires you to specify `udpPorts` and `--dpi-desync-any-protocol` parameter.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/zapret.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret.nix)

## `services.zapret.whitelist` {#opt-services.zapret.whitelist}

Specify a list of domains to bypass. All other domains will be ignored.
You can specify either whitelist or blacklist, but not both.
If neither are specified, then bypass all domains.

It is recommended to specify the whitelist. This will make sure that other resources won't be affected by this service.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "youtube.com"
  "googlevideo.com"
  "ytimg.com"
  "youtu.be"
]
```

*Declared by:* [`nixos/modules/services/networking/zapret.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret.nix)

## `services.zapret2.enable` {#opt-services.zapret2.enable}

Whether to enable zapret2, an extensible DPI bypass program.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/zapret2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret2.nix)

## `services.zapret2.extraOptions` {#opt-services.zapret2.extraOptions}

Extra command line parameters to pass to Zapret2.

Profiles and desync strategies should not be set here, instead the
[`services.zapret2.profiles`](#opt-services.zapret2.profiles) option should be used instead,
which allows profiles to be defined and merged correctly across
multiple NixOS modules.

The `--lua-init` parameters should not be included here, the
files to load should instead be set via the
[`services.zapret2.files`](#opt-services.zapret2.files) option.

Likewise, the `--qnum` and `--fwmark` parameters should
also not be included, instead the queue number and firewall desync mark
can be set using the [`services.zapret2.firewall.queue`](#opt-services.zapret2.firewall.queue) and
[`services.zapret2.firewall.desyncFwmark`](#opt-services.zapret2.firewall.desyncFwmark) options respectively.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--debug"
]
```

*Declared by:* [`nixos/modules/services/networking/zapret2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret2.nix)

## `services.zapret2.files` {#opt-services.zapret2.files}

List of Lua files that will be loaded and executed once on startup.
Each entry in the list can be either an absolute path (including the
.lua extension) or the name of a standard library file bundled with
zapret2 (without the .lua extension). In case of the latter, they
will be automatically resolved to the files in the configured zapret2
package.

*Type:* list of (non-empty string or absolute path)

*Default:*

``` nix
[
  "zapret-lib"
  "zapret-antidpi"
]
```

*Example:*

``` nix
[
  "zapret-lib"
  "zapret-obfs"
  "/path/to/custom.lua"
]
```

*Declared by:* [`nixos/modules/services/networking/zapret2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret2.nix)

## `services.zapret2.firewall.configureAutomatically` {#opt-services.zapret2.firewall.configureAutomatically}

Whether to automatically configure the firewall rules to apply the
DPI bypass to all outgoing non-local connections (using nftables).

If disabled, the only options that will be used are
`firewall.queue` and `firewall.desyncFwmark`, for the
`--qnum` and `--fwmark` parameters respectively.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/networking/zapret2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret2.nix)

## `services.zapret2.firewall.desyncFwmark` {#opt-services.zapret2.firewall.desyncFwmark}

The desync mark bitmask to use. This bitmask must contain only a
single bit, and must be unique among all other nftables rules.

*Type:* string matching the pattern 0x(1|2|4|8)(0){0,7}

*Default:* `"0x40000000"`

*Example:* `"0x10000000"`

*Declared by:* [`nixos/modules/services/networking/zapret2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret2.nix)

## `services.zapret2.firewall.interfaces` {#opt-services.zapret2.firewall.interfaces}

A filter for which interfaces to apply the DPI bypass to. Setting
this option to null (the default) means the DPI bypass applies to
all interfaces.

*Type:* null or (non-empty (list of non-empty string))

*Default:* `null`

*Example:*

``` nix
[
  "eth0"
]
```

*Declared by:* [`nixos/modules/services/networking/zapret2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret2.nix)

## `services.zapret2.firewall.maxPackets` {#opt-services.zapret2.firewall.maxPackets}

The number of packets in each connection to route via Zapret2. For
example, a value of 16 will only subject the first 16 packets in each
connection to anti-DPI measures. It's recommended to keep this value
low in order to avoid routing unnecessary traffic through userspace
if possible. However, if necessary, all traffic can be routed by
setting this option to null.

*Type:* null or integer between 2 and 65535 (both inclusive)

*Default:* `16`

*Example:* `20`

*Declared by:* [`nixos/modules/services/networking/zapret2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret2.nix)

## `services.zapret2.firewall.queue` {#opt-services.zapret2.firewall.queue}

The nfqueue queue number to use. This number must be unique between
all other programs using nfqueue.

*Type:* integer between 0 and 65535 (both inclusive)

*Default:* `200`

*Example:* `400`

*Declared by:* [`nixos/modules/services/networking/zapret2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret2.nix)

## `services.zapret2.firewall.tcpPorts` {#opt-services.zapret2.firewall.tcpPorts}

A list of destination TCP ports that are routed to Zapret2 at the
firewall level. Setting this option to null (the default) means all
TCP connections are routed to Zapret2. Setting this option to an
empty list disables routing to Zapret2 for any TCP connection.

*Type:* null or (list of 16 bit unsigned integer; between 0 and 65535 (both inclusive))

*Default:* `null`

*Example:*

``` nix
[
  80
  443
]
```

*Declared by:* [`nixos/modules/services/networking/zapret2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret2.nix)

## `services.zapret2.firewall.udpPorts` {#opt-services.zapret2.firewall.udpPorts}

A list of destination UDP ports that are routed to Zapret2 at the
firewall level. Setting this option to null (the default) means all
UDP connections are routed to Zapret2. Setting this option to an
empty list disables routing to Zapret2 for any UDP connection.

*Type:* null or (list of 16 bit unsigned integer; between 0 and 65535 (both inclusive))

*Default:* `null`

*Example:*

``` nix
[
  443
]
```

*Declared by:* [`nixos/modules/services/networking/zapret2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret2.nix)

## `services.zapret2.package` {#opt-services.zapret2.package}

The zapret2 package to use.

*Type:* package

*Default:* `pkgs.zapret2`

*Declared by:* [`nixos/modules/services/networking/zapret2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret2.nix)

## `services.zapret2.profiles` {#opt-services.zapret2.profiles}

Defines DPI bypass profiles for Zapret2.

Note that each profile should have a unique `--filter-*`
option. By default, a profile matches all traffic, and when a profile
matches some traffic, no other profile is evaluated. Since profiles are
matched in order they are passed on the command line, the ordering of
profiles is important, and if a "fallback"/catch-all profile is
defined, it should be defined with a high priority to make sure it is
last in the list of profiles.

Each profile will be prepended with the `--name` option to set
the name, and then joined together with `--new` between
profiles to form the final command-line parameters that will be passed
to Zapret2. Therefore, neither `--name` nor `--new`
should be used in the values.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  https = {
    parameters = [
      "--filter-tcp=443"
      "--payload=tls_client_hello"
      "--lua-desync=fake:blob=fake_default_tls:tcp_ts=-1000:repeats=1"
      "--lua-desync=fakedsplit:pos=1,midsld:tcp_ts=-1000"
    ];
  };
}
```

*Declared by:* [`nixos/modules/services/networking/zapret2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret2.nix)

## `services.zapret2.profiles.<name>.hosts.autodetect.enable` {#opt-services.zapret2.profiles._name_.hosts.autodetect.enable}

Whether to enable automatic tracking of which hosts the DPI bypass is necessary for
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/zapret2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret2.nix)

## `services.zapret2.profiles.<name>.hosts.autodetect.file` {#opt-services.zapret2.profiles._name_.hosts.autodetect.file}

The file where the automatic host list is saved. This path must
be writable by the user Zapret2 runs as (by default, it uses a
dynamic user, so it should generally be in
`/var/lib/zapret2`).

*Type:* absolute path

*Default:* `"/var/lib/zapret2/‹name›-hosts.txt"`

*Declared by:* [`nixos/modules/services/networking/zapret2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret2.nix)

## `services.zapret2.profiles.<name>.hosts.exclude` {#opt-services.zapret2.profiles._name_.hosts.exclude}

An explicit list of hostnames to exclude from the DPI bypass.
Each member is a hostname, optionally prefixed with ^ to be a
strict match (by default all subdomains are matched).

If set to null (the default) or an empty list, no exclude list is
set, meaning no hostnames are excluded from the DPI bypass.

*Type:* null or (list of non-empty string)

*Default:* `null`

*Example:*

``` nix
[
  "ru"
  "yandex.net"
  "yastatic.net"
]
```

*Declared by:* [`nixos/modules/services/networking/zapret2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret2.nix)

## `services.zapret2.profiles.<name>.hosts.include` {#opt-services.zapret2.profiles._name_.hosts.include}

An explicit list of hostnames to include in the DPI bypass. Each
member is a hostname, optionally prefixed with ^ to be a strict
match (by default all subdomains are matched).

If set to null (the default), no include list is set, meaning all
hostnames are included in the DPI bypass. If set to an empty
list, the include list will be empty, and no hostname will be
included in the DPI bypass.

*Type:* null or (list of non-empty string)

*Default:* `null`

*Example:*

``` nix
[
  "youtube.com"
  "chess.com"
]
```

*Declared by:* [`nixos/modules/services/networking/zapret2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret2.nix)

## `services.zapret2.profiles.<name>.ips.exclude` {#opt-services.zapret2.profiles._name_.ips.exclude}

An explicit list of IP addresses to exclude from the DPI bypass.
Each member is an IPv4 or IPv6 address, or a subnet in CIDR
notation.

If set to null (the default) or an empty list, no exclude list is
set, meaning no IP addresses are excluded from the DPI bypass.

*Type:* null or (list of non-empty string)

*Default:* `null`

*Example:*

``` nix
[
  "173.245.48.0/20"
  "103.21.244.0/22"
  "103.22.200.0/22"
  "103.31.4.0/22"
  "141.101.64.0/18"
  "108.162.192.0/18"
  "190.93.240.0/20"
  "188.114.96.0/20"
  "197.234.240.0/22"
  "198.41.128.0/17"
  "162.158.0.0/15"
  "104.16.0.0/13"
  "104.24.0.0/14"
  "172.64.0.0/13"
  "131.0.72.0/22"
]
```

*Declared by:* [`nixos/modules/services/networking/zapret2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret2.nix)

## `services.zapret2.profiles.<name>.ips.include` {#opt-services.zapret2.profiles._name_.ips.include}

An explicit list of IP addresses to include in the DPI bypass.
Each member is an IPv4 or IPv6 address, or a subnet in CIDR
notation.

If set to null (the default), no include list is set, meaning all
IP addresses are included in the DPI bypass. If set to an empty
list, the include list will be empty, and no IP address will be
included in the DPI bypass.

*Type:* null or (list of non-empty string)

*Default:* `null`

*Example:*

``` nix
[
  "213.59.192.0/18"
]
```

*Declared by:* [`nixos/modules/services/networking/zapret2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret2.nix)

## `services.zapret2.profiles.<name>.name` {#opt-services.zapret2.profiles._name_.name}

A unique string that identifies this profile.

*Type:* non-empty string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/networking/zapret2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret2.nix)

## `services.zapret2.profiles.<name>.parameters` {#opt-services.zapret2.profiles._name_.parameters}

The parameters to use for this profile. Note that, when using
multiple profiles, a `--filter-*` parameter MUST be defined,
otherwise the first profile will match everything and no other
profile will even be executed.

To obtain a list of suitable parameters, consider running the
`blockcheck2` program (part of the zapret2 package), searching the
[Zapret forums](https://ntc.party/c/community-software/zapret-antidpi/) for community solutions, or consulting the
[Zapret manual](https://github.com/bol-van/zapret2/blob/master/docs/manual.en.md).

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--filter-tcp=443"
  "--payload=tls_client_hello"
  "--lua-desync=fake:blob=fake_default_tls:tcp_ts=-1000:repeats=1"
  "--lua-desync=fakedsplit:pos=1,midsld:tcp_ts=-1000"
]
```

*Declared by:* [`nixos/modules/services/networking/zapret2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret2.nix)

## `services.zapret2.profiles.<name>.priority` {#opt-services.zapret2.profiles._name_.priority}

The priority for the profile when constructing the command-line
parameters. Lower priority values will cause the profile to be
ordered before others, meaning it will be matched before others.
Higher priority values will cause the profile to be ordered after
others, meaning it will be matched after others.

*Type:* signed integer

*Default:* `1000`

*Example:* `0`

*Declared by:* [`nixos/modules/services/networking/zapret2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zapret2.nix)

## `services.zeitgeist.enable` {#opt-services.zeitgeist.enable}

Whether to enable zeitgeist, a service which logs the users' activities and events.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/zeitgeist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/zeitgeist.nix)

## `services.zenohd.backends` {#opt-services.zenohd.backends}

Storage backend packages to add to zenohd search paths.

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
[ pkgs.zenoh-backend-rocksdb ]
```

*Declared by:* [`nixos/modules/services/networking/zenohd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zenohd.nix)

## `services.zenohd.enable` {#opt-services.zenohd.enable}

Whether to enable Zenoh daemon..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/zenohd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zenohd.nix)

## `services.zenohd.env` {#opt-services.zenohd.env}

Set environment variables consumed by zenohd and its plugins.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/zenohd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zenohd.nix)

## `services.zenohd.extraOptions` {#opt-services.zenohd.extraOptions}

Extra command line options for zenohd.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/zenohd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zenohd.nix)

## `services.zenohd.home` {#opt-services.zenohd.home}

Base directory for zenohd related files defined via ZENOH\_HOME.

*Type:* string

*Default:* `"/var/lib/zenoh"`

*Declared by:* [`nixos/modules/services/networking/zenohd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zenohd.nix)

## `services.zenohd.package` {#opt-services.zenohd.package}

The zenoh package to use.

*Type:* package

*Default:* `pkgs.zenoh`

*Declared by:* [`nixos/modules/services/networking/zenohd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zenohd.nix)

## `services.zenohd.plugins` {#opt-services.zenohd.plugins}

Plugin packages to add to zenohd search paths.

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
[ pkgs.zenoh-plugin-mqtt ]
```

*Declared by:* [`nixos/modules/services/networking/zenohd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zenohd.nix)

## `services.zenohd.settings` {#opt-services.zenohd.settings}

Config options for `zenoh.json5` configuration file.

See [https://github.com/eclipse-zenoh/zenoh/blob/main/DEFAULT\_CONFIG.json5](https://github.com/eclipse-zenoh/zenoh/blob/main/DEFAULT_CONFIG.json5)
for more information.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/zenohd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zenohd.nix)

## `services.zerobin.dataDir` {#opt-services.zerobin.dataDir}

Path to the 0bin data directory

*Type:* string

*Default:* `"/var/lib/zerobin"`

*Declared by:* [`nixos/modules/services/networking/zerobin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zerobin.nix)

## `services.zerobin.enable` {#opt-services.zerobin.enable}

Whether to enable 0bin.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/zerobin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zerobin.nix)

## `services.zerobin.extraConfig` {#opt-services.zerobin.extraConfig}

Extra configuration to be appended to the 0bin config file
(see [https://0bin.readthedocs.org/en/latest/en/options.html](https://0bin.readthedocs.org/en/latest/en/options.html))

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  MENU = (
  ('Home', '/'),
  )
  COMPRESSED_STATIC_FILE = True
''
```

*Declared by:* [`nixos/modules/services/networking/zerobin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zerobin.nix)

## `services.zerobin.group` {#opt-services.zerobin.group}

The group 0bin should run as

*Type:* string

*Default:* `"zerobin"`

*Declared by:* [`nixos/modules/services/networking/zerobin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zerobin.nix)

## `services.zerobin.listenAddress` {#opt-services.zerobin.listenAddress}

The address zerobin should listen to

*Type:* string

*Default:* `"localhost"`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/zerobin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zerobin.nix)

## `services.zerobin.listenPort` {#opt-services.zerobin.listenPort}

The port zerobin should listen on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8000`

*Example:* `1357`

*Declared by:* [`nixos/modules/services/networking/zerobin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zerobin.nix)

## `services.zerobin.user` {#opt-services.zerobin.user}

The user 0bin should run as

*Type:* string

*Default:* `"zerobin"`

*Declared by:* [`nixos/modules/services/networking/zerobin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zerobin.nix)

## `services.zerobyte.appSecretFile` {#opt-services.zerobyte.appSecretFile}

Path to a file containing the application secret (32–256 characters),
used to encrypt sensitive data in the database. Generate one with
`openssl rand -hex 32`.

This should not be a path in the Nix store. The file is passed to the
service via systemd credentials.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/zerobyte-app-secret"`

*Declared by:* [`nixos/modules/services/web-apps/zerobyte.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zerobyte.nix)

## `services.zerobyte.dataDir` {#opt-services.zerobyte.dataDir}

Directory used to store the database, encryption keys, local
repositories, volume mounts and the restic cache.

Do not point this to a network share, this will cause permission
issues and strong performance degradation.

*Type:* string

*Default:* `"/var/lib/zerobyte"`

*Declared by:* [`nixos/modules/services/web-apps/zerobyte.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zerobyte.nix)

## `services.zerobyte.enable` {#opt-services.zerobyte.enable}

Whether to enable Zerobyte, backup automation for self-hosters built on top of restic.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/zerobyte.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zerobyte.nix)

## `services.zerobyte.environmentFile` {#opt-services.zerobyte.environmentFile}

Environment file loaded by systemd, which may be used to pass secrets
such as `APP_SECRET` to Zerobyte without putting them into the Nix
store.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/zerobyte.env"`

*Declared by:* [`nixos/modules/services/web-apps/zerobyte.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zerobyte.nix)

## `services.zerobyte.extraPackages` {#opt-services.zerobyte.extraPackages}

Extra packages added to the `PATH` of the Zerobyte service. The
default contains the tools needed to mount NFS, SMB, WebDAV and SFTP
volumes. Add `shoutrrr` here if you want notifications to be
delivered.

*Type:* list of package

*Default:* `with pkgs; [ cifs-utils davfs2 fuse3 nfs-utils openssh sshfs util-linux ]`

*Declared by:* [`nixos/modules/services/web-apps/zerobyte.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zerobyte.nix)

## `services.zerobyte.group` {#opt-services.zerobyte.group}

Group under which Zerobyte runs.

*Type:* string

*Default:* `"zerobyte"`

*Declared by:* [`nixos/modules/services/web-apps/zerobyte.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zerobyte.nix)

## `services.zerobyte.openFirewall` {#opt-services.zerobyte.openFirewall}

Whether to open the firewall for the Zerobyte web interface.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/zerobyte.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zerobyte.nix)

## `services.zerobyte.package` {#opt-services.zerobyte.package}

The zerobyte package to use.

*Type:* package

*Default:* `pkgs.zerobyte`

*Declared by:* [`nixos/modules/services/web-apps/zerobyte.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zerobyte.nix)

## `services.zerobyte.provisioningFile` {#opt-services.zerobyte.provisioningFile}

Path to a JSON file with operator-managed repositories and volumes to
sync at startup. See
[https://zerobyte.app/docs/guides/provisioning](https://zerobyte.app/docs/guides/provisioning) for the format.

This may contain secrets, so it should not be a path in the Nix store.
The file is passed to the service via systemd credentials.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/zerobyte.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zerobyte.nix)

## `services.zerobyte.settings` {#opt-services.zerobyte.settings}

Zerobyte configuration passed as environment variables. See
[https://github.com/nicotsx/zerobyte#configuration](https://github.com/nicotsx/zerobyte#configuration) for the available
settings.

`BASE_URL` is required. It is highly discouraged to expose Zerobyte
directly to the internet; bind `HOST` to localhost and use a secure
tunnel or an authenticating reverse proxy instead.

Do not put secrets here; use
[services (Z)](#opt-services.zerobyte.environmentFile) instead.

*Type:* open submodule of attribute set of (boolean or signed integer or string)

*Default:* `{ }`

*Example:*

``` nix
{
  BASE_URL = "https://zerobyte.example.com";
  GOMAXPROCS = 2;
  LOG_LEVEL = "debug";
  TRUST_PROXY = true;
}
```

*Declared by:* [`nixos/modules/services/web-apps/zerobyte.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zerobyte.nix)

## `services.zerobyte.user` {#opt-services.zerobyte.user}

User account under which Zerobyte runs.

*Type:* string

*Default:* `"zerobyte"`

*Declared by:* [`nixos/modules/services/web-apps/zerobyte.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zerobyte.nix)

## `services.zeronet.enable` {#opt-services.zeronet.enable}

Whether to enable zeronet.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/zeronet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zeronet.nix)

## `services.zeronet.fileserverPort` {#opt-services.zeronet.fileserverPort}

Zeronet fileserver port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `12261`

*Declared by:* [`nixos/modules/services/networking/zeronet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zeronet.nix)

## `services.zeronet.package` {#opt-services.zeronet.package}

The zeronet-conservancy package to use.

*Type:* package

*Default:* `pkgs.zeronet-conservancy`

*Declared by:* [`nixos/modules/services/networking/zeronet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zeronet.nix)

## `services.zeronet.port` {#opt-services.zeronet.port}

Optional zeronet web UI port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `43110`

*Declared by:* [`nixos/modules/services/networking/zeronet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zeronet.nix)

## `services.zeronet.settings` {#opt-services.zeronet.settings}

`zeronet.conf` configuration. Refer to
[https://zeronet.readthedocs.io/en/latest/faq/#is-it-possible-to-use-a-configuration-file](https://zeronet.readthedocs.io/en/latest/faq/#is-it-possible-to-use-a-configuration-file)
for details on supported values;

*Type:* attribute set of attribute set of (string or signed integer or boolean or list of string)

*Default:* `{ }`

*Example:* `{ global.tor = enable; }`

*Declared by:* [`nixos/modules/services/networking/zeronet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zeronet.nix)

## `services.zeronet.tor` {#opt-services.zeronet.tor}

Use TOR for zeronet traffic where possible.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/zeronet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zeronet.nix)

## `services.zeronet.torAlways` {#opt-services.zeronet.torAlways}

Use TOR for all zeronet traffic.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/zeronet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zeronet.nix)

## `services.zeronsd.servedNetworks` {#opt-services.zeronsd.servedNetworks}

ZeroTier Networks to start zeronsd instances for.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  a8a2c3c10c1a68de = {
    settings = {
      token = "/var/lib/zeronsd/apitoken";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/networking/zeronsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zeronsd.nix)

## `services.zeronsd.servedNetworks.<name>.package` {#opt-services.zeronsd.servedNetworks._name_.package}

The zeronsd package to use.

*Type:* package

*Default:* `pkgs.zeronsd`

*Declared by:* [`nixos/modules/services/networking/zeronsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zeronsd.nix)

## `services.zeronsd.servedNetworks.<name>.settings` {#opt-services.zeronsd.servedNetworks._name_.settings}

Settings for zeronsd

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/zeronsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zeronsd.nix)

## `services.zeronsd.servedNetworks.<name>.settings.domain` {#opt-services.zeronsd.servedNetworks._name_.settings.domain}

Domain under which ZeroTier records will be available.

*Type:* (optionally newline-terminated) single-line string

*Default:* `"home.arpa"`

*Declared by:* [`nixos/modules/services/networking/zeronsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zeronsd.nix)

## `services.zeronsd.servedNetworks.<name>.settings.log_level` {#opt-services.zeronsd.servedNetworks._name_.settings.log_level}

Log Level.

*Type:* one of "off", "error", "warn", "info", "debug", "trace"

*Default:* `"warn"`

*Declared by:* [`nixos/modules/services/networking/zeronsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zeronsd.nix)

## `services.zeronsd.servedNetworks.<name>.settings.token` {#opt-services.zeronsd.servedNetworks._name_.settings.token}

Path to a file containing the API Token for ZeroTier Central.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/networking/zeronsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zeronsd.nix)

## `services.zeronsd.servedNetworks.<name>.settings.wildcard` {#opt-services.zeronsd.servedNetworks._name_.settings.wildcard}

Whether to serve a wildcard record for ZeroTier Nodes.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/zeronsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zeronsd.nix)

## `services.zerotierone.enable` {#opt-services.zerotierone.enable}

Whether to enable ZeroTierOne.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/zerotierone.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zerotierone.nix)

## `services.zerotierone.joinNetworks` {#opt-services.zerotierone.joinNetworks}

List of ZeroTier Network IDs to join on startup.
Note that networks are only ever joined, but not automatically left after removing them from the list.
To remove networks, use the ZeroTier CLI: `zerotier-cli leave <network-id>`

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "a8a2c3c10c1a68de"
]
```

*Declared by:* [`nixos/modules/services/networking/zerotierone.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zerotierone.nix)

## `services.zerotierone.localConf` {#opt-services.zerotierone.localConf}

Optional configuration to be written to the Zerotier JSON-based local.conf.
If set, the configuration will be symlinked to `/var/lib/zerotier-one/local.conf` at build time.
To understand the configuration format, refer to [https://docs.zerotier.com/config/#local-configuration-options](https://docs.zerotier.com/config/#local-configuration-options).

*Type:* JSON value

*Default:* `{ }`

*Example:*

``` nix
{
  settings = {
    allowTcpFallbackRelay = false;
  };
}
```

*Declared by:* [`nixos/modules/services/networking/zerotierone.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zerotierone.nix)

## `services.zerotierone.package` {#opt-services.zerotierone.package}

The zerotierone package to use.

*Type:* package

*Default:* `pkgs.zerotierone`

*Declared by:* [`nixos/modules/services/networking/zerotierone.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zerotierone.nix)

## `services.zerotierone.port` {#opt-services.zerotierone.port}

Network port used by ZeroTier.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9993`

*Declared by:* [`nixos/modules/services/networking/zerotierone.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/zerotierone.nix)

## `services.zeyple.enable` {#opt-services.zeyple.enable}

Whether to enable Zeyple, an utility program to automatically encrypt outgoing emails with GPG.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/zeyple.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/zeyple.nix)

## `services.zeyple.group` {#opt-services.zeyple.group}

Group to use to run Zeyple.

::: note
If left as the default value this group will automatically be created
on system activation, otherwise the sysadmin is responsible for
ensuring the user exists.
:::

*Type:* string

*Default:* `"zeyple"`

*Declared by:* [`nixos/modules/services/mail/zeyple.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/zeyple.nix)

## `services.zeyple.keys` {#opt-services.zeyple.keys}

List of public key files that will be imported by gpg.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/mail/zeyple.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/zeyple.nix)

## `services.zeyple.rotateLogs` {#opt-services.zeyple.rotateLogs}

Whether to enable rotation of log files.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/mail/zeyple.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/zeyple.nix)

## `services.zeyple.settings` {#opt-services.zeyple.settings}

Zeyple configuration. refer to
[https://github.com/infertux/zeyple/blob/master/zeyple/zeyple.conf.example](https://github.com/infertux/zeyple/blob/master/zeyple/zeyple.conf.example)
for details on supported values.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/mail/zeyple.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/zeyple.nix)

## `services.zeyple.user` {#opt-services.zeyple.user}

User to run Zeyple as.

::: note
If left as the default value this user will automatically be created
on system activation, otherwise the sysadmin is responsible for
ensuring the user exists.
:::

*Type:* string

*Default:* `"zeyple"`

*Declared by:* [`nixos/modules/services/mail/zeyple.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/zeyple.nix)

## `services.zfs.autoReplication.enable` {#opt-services.zfs.autoReplication.enable}

Whether to enable ZFS snapshot replication.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/zfs-replication.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/zfs-replication.nix)

## `services.zfs.autoReplication.followDelete` {#opt-services.zfs.autoReplication.followDelete}

Remove remote snapshots that don't have a local correspondent.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/backup/zfs-replication.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/zfs-replication.nix)

## `services.zfs.autoReplication.host` {#opt-services.zfs.autoReplication.host}

Remote host where snapshots should be sent. `lz4` is expected to be installed on this host.

*Type:* string

*Example:* `"example.com"`

*Declared by:* [`nixos/modules/services/backup/zfs-replication.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/zfs-replication.nix)

## `services.zfs.autoReplication.identityFilePath` {#opt-services.zfs.autoReplication.identityFilePath}

Path to SSH key used to login to host.

*Type:* absolute path

*Example:* `"/home/username/.ssh/id_rsa"`

*Declared by:* [`nixos/modules/services/backup/zfs-replication.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/zfs-replication.nix)

## `services.zfs.autoReplication.localFilesystem` {#opt-services.zfs.autoReplication.localFilesystem}

Local ZFS filesystem from which snapshots should be sent.  Defaults to the attribute name.

*Type:* string

*Example:* `"pool/file/path"`

*Declared by:* [`nixos/modules/services/backup/zfs-replication.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/zfs-replication.nix)

## `services.zfs.autoReplication.package` {#opt-services.zfs.autoReplication.package}

The zfs-replicate package to use.

*Type:* package

*Default:* `pkgs.zfs-replicate`

*Declared by:* [`nixos/modules/services/backup/zfs-replication.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/zfs-replication.nix)

## `services.zfs.autoReplication.recursive` {#opt-services.zfs.autoReplication.recursive}

Recursively discover snapshots to send.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/backup/zfs-replication.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/zfs-replication.nix)

## `services.zfs.autoReplication.remoteFilesystem` {#opt-services.zfs.autoReplication.remoteFilesystem}

Remote ZFS filesystem where snapshots should be sent.

*Type:* string

*Example:* `"pool/file/path"`

*Declared by:* [`nixos/modules/services/backup/zfs-replication.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/zfs-replication.nix)

## `services.zfs.autoReplication.username` {#opt-services.zfs.autoReplication.username}

Username used by SSH to login to remote host.

*Type:* string

*Example:* `"username"`

*Declared by:* [`nixos/modules/services/backup/zfs-replication.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/zfs-replication.nix)

## `services.zfs.autoScrub.enable` {#opt-services.zfs.autoScrub.enable}

Whether to enable periodic scrubbing of ZFS pools.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `services.zfs.autoScrub.interval` {#opt-services.zfs.autoScrub.interval}

Systemd calendar expression when to scrub ZFS pools. See
`systemd.time(7)`.

*Type:* string

*Default:* `"monthly"`

*Example:* `"quarterly"`

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `services.zfs.autoScrub.pools` {#opt-services.zfs.autoScrub.pools}

List of ZFS pools to periodically scrub. If empty, all pools
will be scrubbed.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "tank"
]
```

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `services.zfs.autoScrub.randomizedDelaySec` {#opt-services.zfs.autoScrub.randomizedDelaySec}

Add a randomized delay before each ZFS autoscrub.
The delay will be chosen between zero and this value.
This value must be a time span in the format specified by
`systemd.time(7)`

*Type:* string

*Default:* `"6h"`

*Example:* `"12h"`

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `services.zfs.autoSnapshot.daily` {#opt-services.zfs.autoSnapshot.daily}

Number of daily auto-snapshots that you wish to keep.

*Type:* signed integer

*Default:* `7`

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `services.zfs.autoSnapshot.enable` {#opt-services.zfs.autoSnapshot.enable}

Enable the (OpenSolaris-compatible) ZFS auto-snapshotting service.
Note that you must set the `com.sun:auto-snapshot`
property to `true` on all datasets which you wish
to auto-snapshot.

You can override a child dataset to use, or not use auto-snapshotting
by setting its flag with the given interval:
`zfs set com.sun:auto-snapshot:weekly=false DATASET`

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `services.zfs.autoSnapshot.flags` {#opt-services.zfs.autoSnapshot.flags}

Flags to pass to the zfs-auto-snapshot command.

Run `zfs-auto-snapshot` (without any arguments) to
see available flags.

If it's not too inconvenient for snapshots to have timestamps in UTC,
it is suggested that you append `--utc` to the list
of default options (see example).

Otherwise, snapshot names can cause name conflicts or apparent time
reversals due to daylight savings, timezone or other date/time changes.

*Type:* string

*Default:* `"-k -p"`

*Example:* `"-k -p --utc"`

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `services.zfs.autoSnapshot.frequent` {#opt-services.zfs.autoSnapshot.frequent}

Number of frequent (15-minute) auto-snapshots that you wish to keep.

*Type:* signed integer

*Default:* `4`

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `services.zfs.autoSnapshot.hourly` {#opt-services.zfs.autoSnapshot.hourly}

Number of hourly auto-snapshots that you wish to keep.

*Type:* signed integer

*Default:* `24`

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `services.zfs.autoSnapshot.monthly` {#opt-services.zfs.autoSnapshot.monthly}

Number of monthly auto-snapshots that you wish to keep.

*Type:* signed integer

*Default:* `12`

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `services.zfs.autoSnapshot.weekly` {#opt-services.zfs.autoSnapshot.weekly}

Number of weekly auto-snapshots that you wish to keep.

*Type:* signed integer

*Default:* `4`

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `services.zfs.expandOnBoot` {#opt-services.zfs.expandOnBoot}

After importing, expand each device in the specified pools.

Set the value to the plain string "all" to expand all pools on boot:

    services.zfs.expandOnBoot = "all";

or set the value to a list of pools to expand the disks of specific pools:

    services.zfs.expandOnBoot = [ "tank" "dozer" ];

*Type:* one of "disabled", "all" or list of string

*Default:* `"disabled"`

*Example:*

``` nix
[
  "tank"
  "dozer"
]
```

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `services.zfs.trim.enable` {#opt-services.zfs.trim.enable}

Whether to enable periodic TRIM on all ZFS pools.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `services.zfs.trim.interval` {#opt-services.zfs.trim.interval}

How often we run trim. For most desktop and server systems
a sufficient trimming frequency is once a week.

The format is described in
`systemd.time(7)`.

*Type:* string

*Default:* `"weekly"`

*Example:* `"daily"`

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `services.zfs.trim.randomizedDelaySec` {#opt-services.zfs.trim.randomizedDelaySec}

Add a randomized delay before each ZFS trim.
The delay will be chosen between zero and this value.
This value must be a time span in the format specified by
`systemd.time(7)`

*Type:* string

*Default:* `"6h"`

*Example:* `"12h"`

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `services.zfs.zed.enableMail` {#opt-services.zfs.zed.enableMail}

Whether to enable ZED's ability to send emails.

*Type:* boolean

*Default:*

``` nix
config.services.mail.sendmailSetuidWrapper != null
```

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `services.zfs.zed.settings` {#opt-services.zfs.zed.settings}

ZFS Event Daemon /etc/zfs/zed.d/zed.rc content

See
`zed(8)`
for details on ZED and the scripts in /etc/zfs/zed.d to find the possible variables

*Type:* attribute set of (string or signed integer or boolean or list of string)

*Default:* `{ }`

*Example:*

``` nix
{
  ZED_DEBUG_LOG = "/tmp/zed.debug.log";

  ZED_EMAIL_ADDR = [ "root" ];
  ZED_EMAIL_PROG = "mail";
  ZED_EMAIL_OPTS = "-s '@SUBJECT@' @ADDRESS@";

  ZED_NOTIFY_INTERVAL_SECS = 3600;
  ZED_NOTIFY_VERBOSE = false;

  ZED_USE_ENCLOSURE_LEDS = true;
  ZED_SCRUB_AFTER_RESILVER = false;
}
```

*Declared by:* [`nixos/modules/tasks/filesystems/zfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/zfs.nix)

## `services.zigbee2mqtt.dataDir` {#opt-services.zigbee2mqtt.dataDir}

Zigbee2mqtt data directory

*Type:* absolute path

*Default:* `"/var/lib/zigbee2mqtt"`

*Declared by:* [`nixos/modules/services/home-automation/zigbee2mqtt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/zigbee2mqtt.nix)

## `services.zigbee2mqtt.enable` {#opt-services.zigbee2mqtt.enable}

Whether to enable zigbee2mqtt service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/zigbee2mqtt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/zigbee2mqtt.nix)

## `services.zigbee2mqtt.package` {#opt-services.zigbee2mqtt.package}

The zigbee2mqtt package to use.

*Type:* package

*Default:* `pkgs.zigbee2mqtt`

*Declared by:* [`nixos/modules/services/home-automation/zigbee2mqtt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/zigbee2mqtt.nix)

## `services.zigbee2mqtt.settings` {#opt-services.zigbee2mqtt.settings}

Your `configuration.yaml` as a Nix attribute set.
Check the [documentation](https://www.zigbee2mqtt.io/information/configuration.html)
for possible options.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  homeassistant.enabled = config.services.home-assistant.enable;
  permit_join = true;
  serial = {
    port = "/dev/ttyACM1";
  };
}
```

*Declared by:* [`nixos/modules/services/home-automation/zigbee2mqtt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/zigbee2mqtt.nix)

## `services.zipline.database.createLocally` {#opt-services.zipline.database.createLocally}

Whether to enable and configure a local PostgreSQL database server.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/zipline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zipline.nix)

## `services.zipline.enable` {#opt-services.zipline.enable}

Whether to enable Zipline.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/zipline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zipline.nix)

## `services.zipline.environmentFiles` {#opt-services.zipline.environmentFiles}

Files to load environment variables from (in addition to [services (Z)](#opt-services.zipline.settings)). This is useful to avoid putting secrets into the nix store. See [https://zipline.diced.sh/docs/config](https://zipline.diced.sh/docs/config) for more information.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/run/secrets/zipline.env"
]
```

*Declared by:* [`nixos/modules/services/web-apps/zipline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zipline.nix)

## `services.zipline.package` {#opt-services.zipline.package}

The zipline package to use.

*Type:* package

*Default:* `pkgs.zipline`

*Declared by:* [`nixos/modules/services/web-apps/zipline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zipline.nix)

## `services.zipline.settings` {#opt-services.zipline.settings}

Configuration of Zipline. See [https://zipline.diced.sh/docs/config](https://zipline.diced.sh/docs/config) for more information.

*Type:* open submodule of attribute set of (string or signed integer)

*Default:* `{ }`

*Example:*

``` nix
{
  CORE_HOSTNAME = "0.0.0.0";
  CORE_PORT = "3000";
  CORE_SECRET = "changethis";
  DATABASE_URL = "postgres://postgres:postgres@postgres/postgres";
  DATASOURCE_LOCAL_DIRECTORY = "/var/lib/zipline/uploads";
  DATASOURCE_TYPE = "local";
}
```

*Declared by:* [`nixos/modules/services/web-apps/zipline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zipline.nix)

## `services.zipline.settings.CORE_HOSTNAME` {#opt-services.zipline.settings.CORE_HOSTNAME}

The hostname to listen on.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/web-apps/zipline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zipline.nix)

## `services.zipline.settings.CORE_PORT` {#opt-services.zipline.settings.CORE_PORT}

The port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Example:* `8000`

*Declared by:* [`nixos/modules/services/web-apps/zipline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zipline.nix)

## `services.zipline.settings.CORE_TEMP_DIRECTORY` {#opt-services.zipline.settings.CORE_TEMP_DIRECTORY}

The temporary directory to use for file uploads.

*Type:* absolute path

*Default:*

``` nix
"${config.services.zipline.settings.DATASOURCE_LOCAL_DIRECTORY}/.tmp"
```

*Declared by:* [`nixos/modules/services/web-apps/zipline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zipline.nix)

## `services.zitadel.enable` {#opt-services.zitadel.enable}

Whether to enable ZITADEL, a user and identity access management platform.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/zitadel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zitadel.nix)

## `services.zitadel.extraSettingsPaths` {#opt-services.zitadel.extraSettingsPaths}

A list of paths to extra settings files. These will override the
values set in [settings](#opt-services.zitadel.settings). Useful if
you want to keep sensitive secrets out of the Nix store.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/zitadel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zitadel.nix)

## `services.zitadel.extraStepsPaths` {#opt-services.zitadel.extraStepsPaths}

A list of paths to extra steps files. These will override the values
set in [steps](#opt-services.zitadel.steps). Useful if you want to
keep sensitive secrets out of the Nix store.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/zitadel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zitadel.nix)

## `services.zitadel.group` {#opt-services.zitadel.group}

The group to run ZITADEL under.

*Type:* string

*Default:* `"zitadel"`

*Declared by:* [`nixos/modules/services/web-apps/zitadel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zitadel.nix)

## `services.zitadel.masterKeyFile` {#opt-services.zitadel.masterKeyFile}

Path to a file containing a master encryption key for ZITADEL. The
key must be 32 bytes.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-apps/zitadel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zitadel.nix)

## `services.zitadel.openFirewall` {#opt-services.zitadel.openFirewall}

Whether to open the port specified in `listenPort` in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/zitadel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zitadel.nix)

## `services.zitadel.package` {#opt-services.zitadel.package}

The ZITADEL package to use.

*Type:* package

*Default:* `pkgs.zitadel`

*Declared by:* [`nixos/modules/services/web-apps/zitadel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zitadel.nix)

## `services.zitadel.settings` {#opt-services.zitadel.settings}

Contents of the runtime configuration file. See
[https://zitadel.com/docs/self-hosting/manage/configure](https://zitadel.com/docs/self-hosting/manage/configure) for more
details.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Example:*

``` nix
{
  Port = 8123;
  ExternalDomain = "example.com";
  TLS = {
    CertPath = "/path/to/cert.pem";
    KeyPath = "/path/to/cert.key";
  };
  Database.cockroach.Host = "db.example.com";
};
```

*Declared by:* [`nixos/modules/services/web-apps/zitadel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zitadel.nix)

## `services.zitadel.settings.Port` {#opt-services.zitadel.settings.Port}

The port that ZITADEL listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/web-apps/zitadel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zitadel.nix)

## `services.zitadel.settings.TLS.Cert` {#opt-services.zitadel.settings.TLS.Cert}

The TLS certificate, as a base64-encoded string.

Note that the contents of this option will be added to the Nix
store as world-readable plain text. Set
[CertPath](#opt-services.zitadel.settings.TLS.CertPath) instead
if this is undesired.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/zitadel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zitadel.nix)

## `services.zitadel.settings.TLS.CertPath` {#opt-services.zitadel.settings.TLS.CertPath}

Path to the TLS certificate.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/zitadel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zitadel.nix)

## `services.zitadel.settings.TLS.Key` {#opt-services.zitadel.settings.TLS.Key}

The TLS certificate private key, as a base64-encoded string.

Note that the contents of this option will be added to the Nix
store as world-readable plain text. Set
[KeyPath](#opt-services.zitadel.settings.TLS.KeyPath) instead
if this is undesired.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/zitadel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zitadel.nix)

## `services.zitadel.settings.TLS.KeyPath` {#opt-services.zitadel.settings.TLS.KeyPath}

Path to the TLS certificate private key.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/zitadel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zitadel.nix)

## `services.zitadel.steps` {#opt-services.zitadel.steps}

Contents of the database initialization config file. See
[https://zitadel.com/docs/self-hosting/manage/configure](https://zitadel.com/docs/self-hosting/manage/configure) for more
details.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  FirstInstance = {
    InstanceName = "Example";
    Org.Human = {
      UserName = "foobar";
      FirstName = "Foo";
      LastName = "Bar";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/zitadel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zitadel.nix)

## `services.zitadel.tlsMode` {#opt-services.zitadel.tlsMode}

The TLS mode to use. Options are:

- enabled: ZITADEL accepts HTTPS connections directly. You must
  configure TLS if this option is selected.
- external: ZITADEL forces HTTPS connections, with TLS terminated at a
  reverse proxy.
- disabled: ZITADEL accepts HTTP connections only. Should only be used
  for testing.

*Type:* one of "external", "enabled", "disabled"

*Default:* `"external"`

*Example:* `"enabled"`

*Declared by:* [`nixos/modules/services/web-apps/zitadel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zitadel.nix)

## `services.zitadel.user` {#opt-services.zitadel.user}

The user to run ZITADEL under.

*Type:* string

*Default:* `"zitadel"`

*Declared by:* [`nixos/modules/services/web-apps/zitadel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/zitadel.nix)

## `services.znapzend.autoCreation` {#opt-services.znapzend.autoCreation}

Automatically create the destination dataset if it does not exist.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.enable` {#opt-services.znapzend.enable}

Whether to enable ZnapZend ZFS backup daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.features.compressed` {#opt-services.znapzend.features.compressed}

Whether to enable compressed feature which adds the options `-Lce` to
the `zfs send` command. When this is enabled, make
sure that both the sending and receiving pool have the same relevant
features enabled. Using `-c` will skip unnecessary
decompress-compress stages, `-L` is for large block
support and -e is for embedded data support. see
`znapzend(1)`
and `zfs(8)`
for more info
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.features.lowmemRecurse` {#opt-services.znapzend.features.lowmemRecurse}

Whether to enable use lowmemRecurse on systems where you have too many datasets, so a
recursive listing of attributes to find backup plans exhausts the
memory available to `znapzend`: instead, go the slower
way to first list all impacted dataset names, and then query their
configs one by one
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.features.oracleMode` {#opt-services.znapzend.features.oracleMode}

Whether to enable destroying snapshots one by one instead of using one long argument list.
If source and destination are out of sync for a long time, you may have
so many snapshots to destroy that the argument gets is too long and the
command fails
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.features.recvu` {#opt-services.znapzend.features.recvu}

Whether to enable recvu feature which uses `-u` on the receiving end to keep the destination
filesystem unmounted
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.features.sendRaw` {#opt-services.znapzend.features.sendRaw}

Whether to enable sendRaw feature which adds the options `-w` to the
`zfs send` command. For encrypted source datasets this
instructs zfs not to decrypt before sending which results in a remote
backup that can't be read without the encryption key/passphrase, useful
when the remote isn't fully trusted or not physically secure. This
option must be used consistently, raw incrementals cannot be based on
non-raw snapshots and vice versa
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.features.skipIntermediates` {#opt-services.znapzend.features.skipIntermediates}

Whether to enable the skipIntermediates feature to send a single increment
between latest common snapshot and the newly made one. It may skip
several source snaps if the destination was offline for some time, and
it should skip snapshots not managed by znapzend. Normally for online
destinations, the new snapshot is sent as soon as it is created on the
source, so there are no automatic increments to skip
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.features.zfsGetType` {#opt-services.znapzend.features.zfsGetType}

Whether to enable using zfsGetType if your `zfs get` supports a
`-t` argument for filtering by dataset type at all AND
lists properties for snapshots by default when recursing, so that there
is too much data to process while searching for backup plans.
If these two conditions apply to your system, the time needed for a
`--recursive` search for backup plans can literally
differ by hundreds of times (depending on the amount of snapshots in
that dataset tree... and a decent backup plan will ensure you have a lot
of those), so you would benefit from requesting this feature
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.logLevel` {#opt-services.znapzend.logLevel}

The log level when logging to file. Any of debug, info, warning, err,
alert. Default in daemonized form is debug.

*Type:* one of "debug", "info", "warning", "err", "alert"

*Default:* `"debug"`

*Example:* `"warning"`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.logTo` {#opt-services.znapzend.logTo}

Where to log to (syslog::\<facility\> or \<filepath\>).

*Type:* string

*Default:* `"syslog::daemon"`

*Example:* `"/var/log/znapzend.log"`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.mailErrorSummaryTo` {#opt-services.znapzend.mailErrorSummaryTo}

Email address to send a summary to if "send task(s) failed".

*Type:* (optionally newline-terminated) single-line string

*Default:* `""`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.noDestroy` {#opt-services.znapzend.noDestroy}

Does all changes to the filesystem except destroy.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.pure` {#opt-services.znapzend.pure}

Do not persist any stateful znapzend setups. If this option is
enabled, your previously set znapzend setups will be cleared and only
the ones defined with this module will be applied.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.zetup` {#opt-services.znapzend.zetup}

Znapzend configuration.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "tank/home" = {
    # Make snapshots of tank/home every hour, keep those for 1 day,
    # keep every days snapshot for 1 month, etc.
    plan = "1d=>1h,1m=>1d,1y=>1m";
    recursive = true;
    # Send all those snapshots to john@example.com:rtank/john as well
    destinations.remote = {
      host = "john@example.com";
      dataset = "rtank/john";
    };
  };
};
```

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.zetup.<name>.dataset` {#opt-services.znapzend.zetup._name_.dataset}

The dataset to use for this source.

*Type:* string

*Example:* `"tank/home"`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.zetup.<name>.destinations` {#opt-services.znapzend.zetup._name_.destinations}

Additional destinations.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  local = {
    dataset = "btank/backup";
    presend = "zpool import -N btank";
    postsend = "zpool export btank";
  };
  remote = {
    host = "john@example.com";
    dataset = "tank/john";
  };
};
```

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.zetup.<name>.destinations.<name>.dataset` {#opt-services.znapzend.zetup._name_.destinations._name_.dataset}

Dataset name to send snapshots to.

*Type:* string

*Example:* `"tank/main"`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.zetup.<name>.destinations.<name>.host` {#opt-services.znapzend.zetup._name_.destinations._name_.host}

Host to use for the destination dataset. Can be prefixed with
`user@` to specify the ssh user.

*Type:* null or string

*Default:* `null`

*Example:* `"john@example.com"`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.zetup.<name>.destinations.<name>.label` {#opt-services.znapzend.zetup._name_.destinations._name_.label}

Label for this destination. Defaults to the attribute name.

*Type:* string

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.zetup.<name>.destinations.<name>.plan` {#opt-services.znapzend.zetup._name_.destinations._name_.plan}

The znapzend backup plan to use for the source.

The plan specifies how often to backup and for how long to keep the
backups. It consists of a series of retention periods to interval
associations:

```
  retA=>intA,retB=>intB,...
```

Both intervals and retention periods are expressed in standard units
of time or multiples of them. You can use both the full name or a
shortcut according to the following listing:

```
  second|sec|s, minute|min, hour|h, day|d, week|w, month|mon|m, year|y
```

See `znapzendzetup(1)` for more info.

*Type:* string

*Example:* `"1h=>10min,1d=>1h,1w=>1d,1m=>1w,1y=>1m"`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.zetup.<name>.destinations.<name>.postsend` {#opt-services.znapzend.zetup._name_.destinations._name_.postsend}

Command to run after sending the snapshot to the destination.
Intended to run a remote script via `ssh` on the
destination, e.g. to bring up a backup disk or server or to put a
zpool online/offline. See also `presend`.

*Type:* null or string

*Default:* `null`

*Example:* `"ssh root@bserv zpool export tank"`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.zetup.<name>.destinations.<name>.presend` {#opt-services.znapzend.zetup._name_.destinations._name_.presend}

Command to run before sending the snapshot to the destination.
Intended to run a remote script via `ssh` on the
destination, e.g. to bring up a backup disk or server or to put a
zpool online/offline. See also `postsend`.

*Type:* null or string

*Default:* `null`

*Example:* `"ssh root@bserv zpool import -Nf tank"`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.zetup.<name>.enable` {#opt-services.znapzend.zetup._name_.enable}

Whether to enable this source.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.zetup.<name>.mbuffer.enable` {#opt-services.znapzend.zetup._name_.mbuffer.enable}

Whether to use `mbuffer`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.zetup.<name>.mbuffer.port` {#opt-services.znapzend.zetup._name_.mbuffer.port}

Port to use for `mbuffer`.

If this is null, it will run `mbuffer` through
ssh.

If this is not null, it will run `mbuffer`
directly through TCP, which is not encrypted but faster. In that
case the given port needs to be open on the destination host.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.zetup.<name>.mbuffer.size` {#opt-services.znapzend.zetup._name_.mbuffer.size}

The size for `mbuffer`.
Supports the units b, k, M, G.

*Type:* string of the form number{b|k|M|G}

*Default:* `"1G"`

*Example:* `"128M"`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.zetup.<name>.plan` {#opt-services.znapzend.zetup._name_.plan}

The znapzend backup plan to use for the source.

The plan specifies how often to backup and for how long to keep the
backups. It consists of a series of retention periods to interval
associations:

```
  retA=>intA,retB=>intB,...
```

Both intervals and retention periods are expressed in standard units
of time or multiples of them. You can use both the full name or a
shortcut according to the following listing:

```
  second|sec|s, minute|min, hour|h, day|d, week|w, month|mon|m, year|y
```

See `znapzendzetup(1)` for more info.

*Type:* string

*Example:* `"1h=>10min,1d=>1h,1w=>1d,1m=>1w,1y=>1m"`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.zetup.<name>.postsnap` {#opt-services.znapzend.zetup._name_.postsnap}

Command to run after snapshots are taken on the source dataset,
e.g. for database unlocking. See also `presnap`.

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
"${pkgs.coreutils}/bin/kill `${pkgs.coreutils}/bin/cat /tmp/mariadblock.pid`;${pkgs.coreutils}/bin/rm /tmp/mariadblock.pid"
```

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.zetup.<name>.presnap` {#opt-services.znapzend.zetup._name_.presnap}

Command to run before snapshots are taken on the source dataset,
e.g. for database locking/flushing. See also
`postsnap`.

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
''${pkgs.mariadb}/bin/mysql -e "set autocommit=0;flush tables with read lock;\\! ${pkgs.coreutils}/bin/sleep 600" &  ${pkgs.coreutils}/bin/echo $! > /tmp/mariadblock.pid ; sleep 10''
```

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.zetup.<name>.recursive` {#opt-services.znapzend.zetup._name_.recursive}

Whether to do recursive snapshots.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.zetup.<name>.sendDelay` {#opt-services.znapzend.zetup._name_.sendDelay}

Specify delay (in seconds) before sending snaps to the destination.
May be useful if you want to control sending time.

*Type:* signed integer

*Default:* `0`

*Example:* `60`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znapzend.zetup.<name>.timestampFormat` {#opt-services.znapzend.zetup._name_.timestampFormat}

The timestamp format to use for constructing snapshot names.
The syntax is `strftime`-like. The string must
consist of the mandatory `%Y %m %d %H %M %S`.
Optionally  `- _ . :`  characters as well as any
alphanumeric character are allowed. If suffixed by a
`Z`, times will be in UTC.

*Type:* string containing all of the characters %Y, %m, %d, %H, %M, %S

*Default:* `"%Y-%m-%d-%H%M%S"`

*Example:* `"znapzend-%m.%d.%Y-%H%M%SZ"`

*Declared by:* [`nixos/modules/services/backup/znapzend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/znapzend.nix)

## `services.znc.confOptions.extraZncConf` {#opt-services.znc.confOptions.extraZncConf}

Extra config to `znc.conf` file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/znc/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/options.nix)

## `services.znc.confOptions.modules` {#opt-services.znc.confOptions.modules}

A list of modules to include in the `znc.conf` file.

*Type:* list of string

*Default:*

``` nix
[
  "webadmin"
  "adminlog"
]
```

*Example:*

``` nix
[
  "partyline"
  "webadmin"
  "adminlog"
  "log"
]
```

*Declared by:* [`nixos/modules/services/networking/znc/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/options.nix)

## `services.znc.confOptions.networks` {#opt-services.znc.confOptions.networks}

IRC networks to connect the user to.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "libera" = {
    server = "irc.libera.chat";
    port = 6697;
    useSSL = true;
    modules = [ "simple_away" ];
  };
};
```

*Declared by:* [`nixos/modules/services/networking/znc/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/options.nix)

## `services.znc.confOptions.networks.<name>.channels` {#opt-services.znc.confOptions.networks._name_.channels}

IRC channels to join.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "nixos"
]
```

*Declared by:* [`nixos/modules/services/networking/znc/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/options.nix)

## `services.znc.confOptions.networks.<name>.extraConf` {#opt-services.znc.confOptions.networks._name_.extraConf}

Extra config for the network. Consider using
[`services.znc.config`](#opt-services.znc.config) instead.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  Encoding = ^UTF-8
  FloodBurst = 4
  FloodRate = 1.00
  IRCConnectEnabled = true
  Ident = johntron
  JoinDelay = 0
  Nick = johntron
''
```

*Declared by:* [`nixos/modules/services/networking/znc/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/options.nix)

## `services.znc.confOptions.networks.<name>.hasBitlbeeControlChannel` {#opt-services.znc.confOptions.networks._name_.hasBitlbeeControlChannel}

Whether to add the special Bitlbee operations channel.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/znc/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/options.nix)

## `services.znc.confOptions.networks.<name>.modules` {#opt-services.znc.confOptions.networks._name_.modules}

ZNC network modules to load.

*Type:* list of string

*Default:*

``` nix
[
  "simple_away"
]
```

*Example:* `[ "simple_away" "sasl" ]`

*Declared by:* [`nixos/modules/services/networking/znc/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/options.nix)

## `services.znc.confOptions.networks.<name>.password` {#opt-services.znc.confOptions.networks._name_.password}

IRC server password, such as for a Slack gateway.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/znc/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/options.nix)

## `services.znc.confOptions.networks.<name>.port` {#opt-services.znc.confOptions.networks._name_.port}

IRC server port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6697`

*Declared by:* [`nixos/modules/services/networking/znc/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/options.nix)

## `services.znc.confOptions.networks.<name>.server` {#opt-services.znc.confOptions.networks._name_.server}

IRC server address.

*Type:* string

*Example:* `"irc.libera.chat"`

*Declared by:* [`nixos/modules/services/networking/znc/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/options.nix)

## `services.znc.confOptions.networks.<name>.useSSL` {#opt-services.znc.confOptions.networks._name_.useSSL}

Whether to use SSL to connect to the IRC server.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/znc/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/options.nix)

## `services.znc.confOptions.nick` {#opt-services.znc.confOptions.nick}

The IRC nick.

*Type:* string

*Default:* `"znc-user"`

*Example:* `"john"`

*Declared by:* [`nixos/modules/services/networking/znc/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/options.nix)

## `services.znc.confOptions.passBlock` {#opt-services.znc.confOptions.passBlock}

Generate with `nix-shell -p znc --command "znc --makepass"`.
This is the password used to log in to the ZNC web admin interface.
You can also set this through
`services.znc.config.User.<username>.Pass.Method`
and co.

*Type:* string

*Example:*

``` nix
''
  &lt;Pass password&gt;
     Method = sha256
     Hash = e2ce303c7ea75c571d80d8540a8699b46535be6a085be3414947d638e48d9e93
     Salt = l5Xryew4g*!oa(ECfX2o
  &lt;/Pass&gt;
''
```

*Declared by:* [`nixos/modules/services/networking/znc/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/options.nix)

## `services.znc.confOptions.port` {#opt-services.znc.confOptions.port}

Specifies the port on which to listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5000`

*Declared by:* [`nixos/modules/services/networking/znc/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/options.nix)

## `services.znc.confOptions.uriPrefix` {#opt-services.znc.confOptions.uriPrefix}

An optional URI prefix for the ZNC web interface. Can be
used to make ZNC available behind a reverse proxy.

*Type:* null or string

*Default:* `null`

*Example:* `"/znc/"`

*Declared by:* [`nixos/modules/services/networking/znc/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/options.nix)

## `services.znc.confOptions.useSSL` {#opt-services.znc.confOptions.useSSL}

Indicates whether the ZNC server should use SSL when listening on
the specified port. A self-signed certificate will be generated.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/znc/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/options.nix)

## `services.znc.confOptions.userModules` {#opt-services.znc.confOptions.userModules}

A list of user modules to include in the `znc.conf` file.

*Type:* list of string

*Default:*

``` nix
[
  "chansaver"
  "controlpanel"
]
```

*Example:*

``` nix
[
  "chansaver"
  "controlpanel"
  "fish"
  "push"
]
```

*Declared by:* [`nixos/modules/services/networking/znc/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/options.nix)

## `services.znc.confOptions.userName` {#opt-services.znc.confOptions.userName}

The user name used to log in to the ZNC web admin interface.

*Type:* string

*Default:* `"znc"`

*Example:* `"johntron"`

*Declared by:* [`nixos/modules/services/networking/znc/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/options.nix)

## `services.znc.config` {#opt-services.znc.config}

Configuration for ZNC, see
[https://wiki.znc.in/Configuration](https://wiki.znc.in/Configuration) for details. The
Nix value declared here will be translated directly to the xml-like
format ZNC expects. This is much more flexible than the legacy options
under `services.znc.confOptions.*`, but also can't do
any type checking.

You can use `nix-instantiate --eval --strict '<nixpkgs/nixos>' -A config.services.znc.config`
to view the current value. By default it contains a listener for port
5000 with SSL enabled.

Nix attributes called `extraConfig` will be inserted
verbatim into the resulting config file.

If [`services.znc.useLegacyConfig`](#opt-services.znc.useLegacyConfig) is turned on, the
option values in `services.znc.confOptions.*` will be
gracefully be applied to this option.

If you intend to update the configuration through this option, be sure
to disable [`services.znc.mutable`](#opt-services.znc.mutable), otherwise none of the
changes here will be applied after the initial deploy.

*Type:* attribute set of (znc values (null, atoms (str, int, bool), list of atoms, or attrsets of znc values))

*Default:* `{ }`

*Example:*

``` nix
{
  LoadModule = [ "webadmin" "adminlog" ];
  User.paul = {
    Admin = true;
    Nick = "paul";
    AltNick = "paul1";
    LoadModule = [ "chansaver" "controlpanel" ];
    Network.libera = {
      Server = "irc.libera.chat +6697";
      LoadModule = [ "simple_away" ];
      Chan = {
        "#nixos" = { Detached = false; };
        "##linux" = { Disabled = true; };
      };
    };
    Pass.password = {
      Method = "sha256";
      Hash = "e2ce303c7ea75c571d80d8540a8699b46535be6a085be3414947d638e48d9e93";
      Salt = "l5Xryew4g*!oa(ECfX2o";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/networking/znc/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/default.nix)

## `services.znc.configFile` {#opt-services.znc.configFile}

Configuration file for ZNC. It is recommended to use the
`config` option instead.

Setting this option will override any auto-generated config file
through the `confOptions` or `config`
options.

*Type:* absolute path

*Example:* `~/.znc/configs/znc.conf`

*Declared by:* [`nixos/modules/services/networking/znc/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/default.nix)

## `services.znc.dataDir` {#opt-services.znc.dataDir}

The state directory for ZNC. The config and the modules will be linked
to from this directory as well.

*Type:* absolute path

*Default:* `"/var/lib/znc"`

*Example:* `"/home/john/.znc"`

*Declared by:* [`nixos/modules/services/networking/znc/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/default.nix)

## `services.znc.enable` {#opt-services.znc.enable}

Whether to enable ZNC.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/znc/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/default.nix)

## `services.znc.extraFlags` {#opt-services.znc.extraFlags}

Extra arguments to use for executing znc.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--debug"
]
```

*Declared by:* [`nixos/modules/services/networking/znc/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/default.nix)

## `services.znc.group` {#opt-services.znc.group}

Group to own the ZNC process.

*Type:* string

*Default:* `"znc"`

*Example:* `"users"`

*Declared by:* [`nixos/modules/services/networking/znc/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/default.nix)

## `services.znc.modulePackages` {#opt-services.znc.modulePackages}

A list of global znc module packages to add to znc.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.zncModules.fish pkgs.zncModules.push ]`

*Declared by:* [`nixos/modules/services/networking/znc/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/default.nix)

## `services.znc.mutable` {#opt-services.znc.mutable}

Indicates whether to allow the contents of the
`dataDir` directory to be changed by the user at
run-time.

If enabled, modifications to the ZNC configuration after its initial
creation are not overwritten by a NixOS rebuild. If disabled, the
ZNC configuration is rebuilt on every NixOS rebuild.

If the user wants to manage the ZNC service using the web admin
interface, this option should be enabled.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/znc/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/default.nix)

## `services.znc.openFirewall` {#opt-services.znc.openFirewall}

Whether to open ports in the firewall for ZNC. Does work with
ports for listeners specified in
`services.znc.config.Listener`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/znc/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/default.nix)

## `services.znc.useLegacyConfig` {#opt-services.znc.useLegacyConfig}

Whether to propagate the legacy options under
`services.znc.confOptions.*` to the znc config. If this
is turned on, the znc config will contain a user with the default name
"znc", global modules "webadmin" and "adminlog" will be enabled by
default, and more, all controlled through the
`services.znc.confOptions.*` options.
You can use `nix-instantiate --eval --strict '<nixpkgs/nixos>' -A config.services.znc.config`
to view the current value of the config.

In any case, if you need more flexibility,
[`services.znc.config`](#opt-services.znc.config) can be used to override/add to
all of the legacy options.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/znc/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/options.nix)

## `services.znc.user` {#opt-services.znc.user}

The name of an existing user account to use to own the ZNC server
process. If not specified, a default user will be created.

*Type:* string

*Default:* `"znc"`

*Example:* `"john"`

*Declared by:* [`nixos/modules/services/networking/znc/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/znc/default.nix)

## `services.zoneminder.cameras` {#opt-services.zoneminder.cameras}

Set this to the number of cameras you expect to support.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/misc/zoneminder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zoneminder.nix)

## `services.zoneminder.database.createLocally` {#opt-services.zoneminder.database.createLocally}

Create the database and database user locally.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/zoneminder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zoneminder.nix)

## `services.zoneminder.database.host` {#opt-services.zoneminder.database.host}

Hostname hosting the database.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/misc/zoneminder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zoneminder.nix)

## `services.zoneminder.database.name` {#opt-services.zoneminder.database.name}

Name of database.

*Type:* string

*Default:* `"zm"`

*Declared by:* [`nixos/modules/services/misc/zoneminder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zoneminder.nix)

## `services.zoneminder.database.password` {#opt-services.zoneminder.database.password}

Username for accessing the database.
Not used if `createLocally` is set.

*Type:* string

*Default:* `"zmpass"`

*Declared by:* [`nixos/modules/services/misc/zoneminder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zoneminder.nix)

## `services.zoneminder.database.username` {#opt-services.zoneminder.database.username}

Username for accessing the database.

*Type:* string

*Default:* `"zmuser"`

*Declared by:* [`nixos/modules/services/misc/zoneminder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zoneminder.nix)

## `services.zoneminder.enable` {#opt-services.zoneminder.enable}

Whether to enable ZoneMinder.

If you intend to run the database locally, you should set
`config.services.zoneminder.database.createLocally` to true. Otherwise,
when set to `false` (the default), you will have to create the database
and database user as well as populate the database yourself.
Additionally, you will need to run `zmupdate.pl` yourself when
upgrading to a newer version
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/zoneminder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zoneminder.nix)

## `services.zoneminder.extraConfig` {#opt-services.zoneminder.extraConfig}

Additional configuration added verbatim to the configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/zoneminder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zoneminder.nix)

## `services.zoneminder.hostname` {#opt-services.zoneminder.hostname}

The hostname on which to listen.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/misc/zoneminder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zoneminder.nix)

## `services.zoneminder.openFirewall` {#opt-services.zoneminder.openFirewall}

Open the firewall port(s).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/zoneminder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zoneminder.nix)

## `services.zoneminder.port` {#opt-services.zoneminder.port}

The port on which to listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8095`

*Declared by:* [`nixos/modules/services/misc/zoneminder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zoneminder.nix)

## `services.zoneminder.storageDir` {#opt-services.zoneminder.storageDir}

ZoneMinder can generate quite a lot of data, so in case you don't want
to use the default /var/lib/zoneminder, you can override the path here.

*Type:* null or string

*Default:* `null`

*Example:* `"/storage/tank"`

*Declared by:* [`nixos/modules/services/misc/zoneminder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zoneminder.nix)

## `services.zoneminder.webserver` {#opt-services.zoneminder.webserver}

The webserver to configure for the PHP frontend.

Set it to `none` if you want to configure it yourself. PRs are welcome
for support for other web servers.

*Type:* one of "nginx", "none"

*Default:* `"nginx"`

*Declared by:* [`nixos/modules/services/misc/zoneminder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zoneminder.nix)

## `services.zookeeper.dataDir` {#opt-services.zookeeper.dataDir}

Data directory for Zookeeper

*Type:* absolute path

*Default:* `"/var/lib/zookeeper"`

*Declared by:* [`nixos/modules/services/misc/zookeeper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zookeeper.nix)

## `services.zookeeper.enable` {#opt-services.zookeeper.enable}

Whether to enable Zookeeper.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/zookeeper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zookeeper.nix)

## `services.zookeeper.extraCmdLineOptions` {#opt-services.zookeeper.extraCmdLineOptions}

Extra command line options for the Zookeeper launcher.

*Type:* list of string

*Default:*

``` nix
[
  "-Dcom.sun.management.jmxremote"
  "-Dcom.sun.management.jmxremote.local.only=true"
]
```

*Example:*

``` nix
[
  "-Djava.net.preferIPv4Stack=true"
  "-Dcom.sun.management.jmxremote"
  "-Dcom.sun.management.jmxremote.local.only=true"
]
```

*Declared by:* [`nixos/modules/services/misc/zookeeper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zookeeper.nix)

## `services.zookeeper.extraConf` {#opt-services.zookeeper.extraConf}

Extra configuration for Zookeeper.

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  initLimit=5
  syncLimit=2
  tickTime=2000
''
```

*Declared by:* [`nixos/modules/services/misc/zookeeper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zookeeper.nix)

## `services.zookeeper.id` {#opt-services.zookeeper.id}

Zookeeper ID.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/misc/zookeeper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zookeeper.nix)

## `services.zookeeper.jre` {#opt-services.zookeeper.jre}

The JRE with which to run Zookeeper

*Type:* package

*Default:* `pkgs.zookeeper.jre`

*Example:* `pkgs.jre`

*Declared by:* [`nixos/modules/services/misc/zookeeper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zookeeper.nix)

## `services.zookeeper.logging` {#opt-services.zookeeper.logging}

Zookeeper logging configuration, logback.xml.

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  <configuration>
    <property name="zookeeper.console.threshold" value="INFO" />
    <property name="zookeeper.log.dir" value="." />
    <property name="zookeeper.log.file" value="zookeeper.log" />
    <property name="zookeeper.log.threshold" value="INFO" />
    <property name="zookeeper.log.maxfilesize" value="256MB" />
    <property name="zookeeper.log.maxbackupindex" value="20" />
    <appender name="CONSOLE" class="ch.qos.logback.core.ConsoleAppender">
      <encoder>
        <pattern>%d{ISO8601} [myid:%X{myid}] - %-5p [%t:%C{1}@%L] - %m%n</pattern>
      </encoder>
      <filter class="ch.qos.logback.classic.filter.ThresholdFilter">
        <level>''${zookeeper.console.threshold}</level>
      </filter>
    </appender>
    <root level="INFO">
      <appender-ref ref="CONSOLE" />
    </root>
  </configuration>
''
```

*Declared by:* [`nixos/modules/services/misc/zookeeper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zookeeper.nix)

## `services.zookeeper.package` {#opt-services.zookeeper.package}

The zookeeper package to use.

*Type:* package

*Default:* `pkgs.zookeeper`

*Declared by:* [`nixos/modules/services/misc/zookeeper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zookeeper.nix)

## `services.zookeeper.port` {#opt-services.zookeeper.port}

Zookeeper Client port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `2181`

*Declared by:* [`nixos/modules/services/misc/zookeeper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zookeeper.nix)

## `services.zookeeper.preferIPv4` {#opt-services.zookeeper.preferIPv4}

Add the -Djava.net.preferIPv4Stack=true flag to the Zookeeper server.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/zookeeper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zookeeper.nix)

## `services.zookeeper.purgeInterval` {#opt-services.zookeeper.purgeInterval}

The time interval in hours for which the purge task has to be triggered. Set to a positive integer (1 and above) to enable the auto purging.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/misc/zookeeper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zookeeper.nix)

## `services.zookeeper.servers` {#opt-services.zookeeper.servers}

All Zookeeper Servers.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  server.0=host0:2888:3888
  server.1=host1:2888:3888
  server.2=host2:2888:3888
''
```

*Declared by:* [`nixos/modules/services/misc/zookeeper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/zookeeper.nix)

## `services.zram-generator.enable` {#opt-services.zram-generator.enable}

Whether to enable Systemd unit generator for zram devices.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/system/zram-generator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/zram-generator.nix)

## `services.zram-generator.package` {#opt-services.zram-generator.package}

The zram-generator package to use.

*Type:* package

*Default:* `pkgs.zram-generator`

*Declared by:* [`nixos/modules/services/system/zram-generator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/zram-generator.nix)

## `services.zram-generator.settings` {#opt-services.zram-generator.settings}

Configuration for zram-generator,
see [https://github.com/systemd/zram-generator](https://github.com/systemd/zram-generator) for documentation.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/system/zram-generator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/zram-generator.nix)

## `services.zrepl.enable` {#opt-services.zrepl.enable}

Whether to enable zrepl.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/zrepl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/zrepl.nix)

## `services.zrepl.package` {#opt-services.zrepl.package}

The zrepl package to use.

*Type:* package

*Default:* `pkgs.zrepl`

*Declared by:* [`nixos/modules/services/backup/zrepl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/zrepl.nix)

## `services.zrepl.settings` {#opt-services.zrepl.settings}

Configuration for zrepl. See [https://zrepl.github.io/configuration.html](https://zrepl.github.io/configuration.html)
for more information.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/backup/zrepl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/zrepl.nix)

## `services.zwave-js-ui.enable` {#opt-services.zwave-js-ui.enable}

Whether to enable zwave-js-ui.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/zwave-js-ui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/zwave-js-ui.nix)

## `services.zwave-js-ui.package` {#opt-services.zwave-js-ui.package}

The zwave-js-ui package to use.

*Type:* package

*Default:* `pkgs.zwave-js-ui`

*Declared by:* [`nixos/modules/services/home-automation/zwave-js-ui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/zwave-js-ui.nix)

## `services.zwave-js-ui.serialPort` {#opt-services.zwave-js-ui.serialPort}

Serial port for the Z-Wave controller.

Only used to grant permissions to the device; must be additionally configured in the application

*Type:* absolute path

*Example:* `"/dev/serial/by-id/usb-example"`

*Declared by:* [`nixos/modules/services/home-automation/zwave-js-ui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/zwave-js-ui.nix)

## `services.zwave-js-ui.settings` {#opt-services.zwave-js-ui.settings}

Extra environment variables passed to the zwave-js-ui process.

Check [https://zwave-js.github.io/zwave-js-ui/#/guide/env-vars](https://zwave-js.github.io/zwave-js-ui/#/guide/env-vars) for possible options

*Type:* open submodule of attribute set of (null or string or absolute path or package)

*Example:*

``` nix
{
  HOST = "::";
  PORT = "8091";
}
```

*Declared by:* [`nixos/modules/services/home-automation/zwave-js-ui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/zwave-js-ui.nix)

## `services.zwave-js.enable` {#opt-services.zwave-js.enable}

Whether to enable the zwave-js server on boot.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/zwave-js.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/zwave-js.nix)

## `services.zwave-js.extraFlags` {#opt-services.zwave-js.extraFlags}

Extra flags to pass to command

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--mock-driver"
]
```

*Declared by:* [`nixos/modules/services/home-automation/zwave-js.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/zwave-js.nix)

## `services.zwave-js.package` {#opt-services.zwave-js.package}

The zwave-js-server package to use.

*Type:* package

*Default:* `pkgs.zwave-js-server`

*Declared by:* [`nixos/modules/services/home-automation/zwave-js.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/zwave-js.nix)

## `services.zwave-js.port` {#opt-services.zwave-js.port}

Port for the server to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/home-automation/zwave-js.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/zwave-js.nix)

## `services.zwave-js.secretsConfigFile` {#opt-services.zwave-js.secretsConfigFile}

JSON file containing secret keys. A dummy example:

```
{
  "securityKeys": {
    "S0_Legacy": "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
    "S2_Unauthenticated": "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
    "S2_Authenticated": "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC",
    "S2_AccessControl": "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD"
  }
}
```

See
[https://zwave-js.github.io/node-zwave-js/#/getting-started/security-s2](https://zwave-js.github.io/node-zwave-js/#/getting-started/security-s2)
for details. This file will be merged with the module-generated config
file (taking precedence).

Z-Wave keys can be generated with:

`< /dev/urandom tr -dc A-F0-9 | head -c32 ;echo`

::: warning
A file in the nix store should not be used since it will be readable to
all users.
:::

*Type:* absolute path

*Example:* `"/secrets/zwave-js-keys.json"`

*Declared by:* [`nixos/modules/services/home-automation/zwave-js.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/zwave-js.nix)

## `services.zwave-js.serialPort` {#opt-services.zwave-js.serialPort}

Serial port device path for Z-Wave controller.

*Type:* absolute path

*Example:* `"/dev/ttyUSB0"`

*Declared by:* [`nixos/modules/services/home-automation/zwave-js.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/zwave-js.nix)

## `services.zwave-js.settings` {#opt-services.zwave-js.settings}

Configuration settings for the generated config file.

This config is combined with the contents of `secretsConfigFile` and
passed to zwave-js-server via `--config`. The project's README [1](https://ntc.party/c/community-software/zapret-antidpi/)
states that the config must follow the Z-Wave JS config format [2](https://github.com/bol-van/zapret2/blob/master/docs/manual.en.md).

::: warning
Secrets should go in `secretsConfigFile`. The contents of `settings` is
written to the nix store, which is world-readable.
:::

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/home-automation/zwave-js.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/zwave-js.nix)

## `services.zwave-js.settings.storage.cacheDir` {#opt-services.zwave-js.settings.storage.cacheDir}

Cache directory

*Type:* absolute path

*Default:* `"/var/cache/zwave-js"`

*Read only*

*Declared by:* [`nixos/modules/services/home-automation/zwave-js.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/zwave-js.nix)
