# services (H) {#sec-options-services-h}

## `services.h2o.defaultHTTPListenPort` {#opt-services.h2o.defaultHTTPListenPort}

If hosts do not specify listen.port, use these ports for HTTP by default.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `80`

*Example:* `8080`

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.defaultTLSListenPort` {#opt-services.h2o.defaultTLSListenPort}

If hosts do not specify listen.port, use these ports for SSL by default.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `443`

*Example:* `8443`

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.defaultTLSRecommendations` {#opt-services.h2o.defaultTLSRecommendations}

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

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.enable` {#opt-services.h2o.enable}

Whether to enable H2O web server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.group` {#opt-services.h2o.group}

Group running H2O services

*Type:* non-empty string

*Default:* `"h2o"`

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.hosts` {#opt-services.h2o.hosts}

The `hosts` config to be merged with the settings.

Note that unlike YAML used for H2O, Nix will not support duplicate
keys to, for instance, have multiple listens in a host block; use the
virtual host options in like `http` & `tls` or use `$HOST:$PORT`
keys if manually specifying config.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "hydra.example.com" = {
    tls = {
      policy = "force";
      identity = [
        {
          key-file = "/path/to/key";
          certificate-file = "/path/to/cert";
        };
      ];
      extraSettings = {
        minimum-version = "TLSv1.3";
      };
    };
    settings = {
      paths."/" = {
        "file:dir" = "/var/www/default";
      };
    };
  };
}
```

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.hosts.<name>.acme` {#opt-services.h2o.hosts._name_.acme}

ACME options for virtual host.

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.hosts.<name>.acme.enable` {#opt-services.h2o.hosts._name_.acme.enable}

Whether to ask Let’s Encrypt to sign a certificate for this
virtual host. Alternatively, an existing host can be used thru
`acme.useHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.hosts.<name>.acme.root` {#opt-services.h2o.hosts._name_.acme.root}

Directory for the ACME challenge, which is **public**. Don’t put
certs or keys in here. Set to `null` to inherit from
config.security.acme.

*Type:* null or absolute path

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.hosts.<name>.acme.useHost` {#opt-services.h2o.hosts._name_.acme.useHost}

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

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.hosts.<name>.host` {#opt-services.h2o.hosts._name_.host}

Set the host address for this virtual host. If unset, the default is to
listen on all network interfaces.

*Type:* null or non-empty string

*Default:* `null`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.hosts.<name>.http` {#opt-services.h2o.hosts._name_.http}

HTTP options for virtual host

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.hosts.<name>.http.port` {#opt-services.h2o.hosts._name_.http.port}

Override the default HTTP port for this virtual host.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
config.services.h2o.defaultHTTPListenPort
```

*Example:* `8080`

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.hosts.<name>.serverAliases` {#opt-services.h2o.hosts._name_.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.hosts.<name>.serverName` {#opt-services.h2o.hosts._name_.serverName}

Server name to be used for this virtual host. Defaults to attribute
name in hosts.

*Type:* null or non-empty string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.hosts.<name>.settings` {#opt-services.h2o.hosts._name_.settings}

Attrset to be transformed into YAML for host config. Note that the HTTP
/ TLS configurations will override these config values. See
[https://h2o.examp1e.net/configure/base\_directives.html#hosts](https://h2o.examp1e.net/configure/base_directives.html#hosts).

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.hosts.<name>.tls` {#opt-services.h2o.hosts._name_.tls}

TLS options for virtual host

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.hosts.<name>.tls.extraSettings` {#opt-services.h2o.hosts._name_.tls.extraSettings}

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

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.hosts.<name>.tls.identity` {#opt-services.h2o.hosts._name_.tls.identity}

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

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.hosts.<name>.tls.identity.*.certificate-file` {#opt-services.h2o.hosts._name_.tls.identity._.certificate-file}

Path to certificate file. See
[https://h2o.examp1e.net/configure/base\_directives.html#certificate-file](https://h2o.examp1e.net/configure/base_directives.html#certificate-file).

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.hosts.<name>.tls.identity.*.key-file` {#opt-services.h2o.hosts._name_.tls.identity._.key-file}

Path to key file. See
[https://h2o.examp1e.net/configure/base\_directives.html#key-file](https://h2o.examp1e.net/configure/base_directives.html#key-file).

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.hosts.<name>.tls.policy` {#opt-services.h2o.hosts._name_.tls.policy}

`add` will additionally listen for TLS connections. `only` will
disable   TLS connections. `force` will redirect non-TLS traffic
to the TLS connection.

*Type:* one of "add", "only", "force"

*Example:* `"force"`

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.hosts.<name>.tls.port` {#opt-services.h2o.hosts._name_.tls.port}

Override the default TLS port for this virtual host.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
config.services.h2o.defaultTLSListenPort
```

*Example:* `8443`

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.hosts.<name>.tls.quic` {#opt-services.h2o.hosts._name_.tls.quic}

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

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.hosts.<name>.tls.recommendations` {#opt-services.h2o.hosts._name_.tls.recommendations}

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

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.hosts.<name>.tls.redirectCode` {#opt-services.h2o.hosts._name_.tls.redirectCode}

HTTP status used by `globalRedirect` & `forceSSL`. Possible
usecases include temporary (302, 307) redirects, keeping the
request method & body (307, 308), or explicitly resetting the
method to GET (303). See
[https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.package` {#opt-services.h2o.package}

The h2o package to use.

*Type:* package

*Default:* `pkgs.h2o`

*Example:*

``` nix
pkgs.h2o.override {
  withMruby = false;
  openssl = pkgs.openssl_legacy;
}
```

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.settings` {#opt-services.h2o.settings}

Configuration for H2O (see [https://h2o.examp1e.net/configure.html](https://h2o.examp1e.net/configure.html))

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  compress = "ON";
  ssl-offload = "kernel";
  http2-reprioritize-blocking-assets = "ON";
  "file.mime.addtypes" = {
    "text/x-rst" = {
      extensions = [ ".rst" ];
      is_compressible = "YES";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.h2o.user` {#opt-services.h2o.user}

User running H2O service

*Type:* non-empty string

*Default:* `"h2o"`

*Declared by:* [`nixos/modules/services/web-servers/h2o/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/h2o/default.nix)

## `services.hadoop.containerExecutorCfg` {#opt-services.hadoop.containerExecutorCfg}

Yarn container-executor.cfg definition
[https://hadoop.apache.org/docs/r2.7.2/hadoop-yarn/hadoop-yarn-site/SecureContainer.html](https://hadoop.apache.org/docs/r2.7.2/hadoop-yarn/hadoop-yarn-site/SecureContainer.html)

*Type:* attribute set of anything

*Default:*

``` nix
{
  "feature.mount-cgroup.enabled" = 1;
  "feature.terminal.enabled" = 1;
  "min.user.id" = 1000;
  "yarn.nodemanager.linux-container-executor.group" = "hadoop";
}
```

*Example:*

``` nix
options.services.hadoop.containerExecutorCfg.default // {
  "feature.terminal.enabled" = 0;
}
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/default.nix)

## `services.hadoop.coreSite` {#opt-services.hadoop.coreSite}

Hadoop core-site.xml definition
[https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/core-default.xml](https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/core-default.xml)

*Type:* attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  "fs.defaultFS" = "hdfs://localhost";
}
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/default.nix)

## `services.hadoop.extraConfDirs` {#opt-services.hadoop.extraConfDirs}

Directories containing additional config files to be added to HADOOP\_CONF\_DIR

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  ./extraHDFSConfs
  ./extraYARNConfs
]
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/default.nix)

## `services.hadoop.gatewayRole.enable` {#opt-services.hadoop.gatewayRole.enable}

Whether to enable gateway role for deploying hadoop configs.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/hadoop/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/default.nix)

## `services.hadoop.gatewayRole.enableHbaseCli` {#opt-services.hadoop.gatewayRole.enableHbaseCli}

Whether to enable HBase CLI tools.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.master.enable` {#opt-services.hadoop.hbase.master.enable}

Whether to enable HBase master.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.master.environment` {#opt-services.hadoop.hbase.master.environment}

Environment variables passed to master.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  HBASE_MASTER_OPTS = "-Dcom.sun.management.jmxremote.ssl=true";
}
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.master.extraFlags` {#opt-services.hadoop.hbase.master.extraFlags}

Extra flags for the master service.

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "--backup" ]`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.master.initHDFS` {#opt-services.hadoop.hbase.master.initHDFS}

Whether to enable initialization of the hbase directory on HDFS.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.master.openFirewall` {#opt-services.hadoop.hbase.master.openFirewall}

Open firewall ports for HBase master.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.master.restartIfChanged` {#opt-services.hadoop.hbase.master.restartIfChanged}

Restart master con config change.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.package` {#opt-services.hadoop.hbase.package}

The hbase package to use.

*Type:* package

*Default:* `pkgs.hbase`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.regionServer.enable` {#opt-services.hadoop.hbase.regionServer.enable}

Whether to enable HBase regionServer.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.regionServer.environment` {#opt-services.hadoop.hbase.regionServer.environment}

Environment variables passed to regionServer.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  HBASE_MASTER_OPTS = "-Dcom.sun.management.jmxremote.ssl=true";
}
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.regionServer.extraFlags` {#opt-services.hadoop.hbase.regionServer.extraFlags}

Extra flags for the regionServer service.

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "--backup" ]`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.regionServer.openFirewall` {#opt-services.hadoop.hbase.regionServer.openFirewall}

Open firewall ports for HBase regionServer.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.regionServer.overrideHosts` {#opt-services.hadoop.hbase.regionServer.overrideHosts}

Remove /etc/hosts entries for "127.0.0.2" and "::1" defined in nixos/modules/config/networking.nix
Regionservers must be able to resolve their hostnames to their IP addresses, through PTR records
or /etc/hosts entries.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.regionServer.restartIfChanged` {#opt-services.hadoop.hbase.regionServer.restartIfChanged}

Restart regionServer con config change.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.rest.enable` {#opt-services.hadoop.hbase.rest.enable}

Whether to enable HBase rest.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.rest.environment` {#opt-services.hadoop.hbase.rest.environment}

Environment variables passed to rest.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  HBASE_MASTER_OPTS = "-Dcom.sun.management.jmxremote.ssl=true";
}
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.rest.extraFlags` {#opt-services.hadoop.hbase.rest.extraFlags}

Extra flags for the rest service.

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "--backup" ]`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.rest.infoPort` {#opt-services.hadoop.hbase.rest.infoPort}

web UI port

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8085`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.rest.openFirewall` {#opt-services.hadoop.hbase.rest.openFirewall}

Open firewall ports for HBase rest.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.rest.port` {#opt-services.hadoop.hbase.rest.port}

RPC port

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.rest.restartIfChanged` {#opt-services.hadoop.hbase.rest.restartIfChanged}

Restart rest con config change.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.rootdir` {#opt-services.hadoop.hbase.rootdir}

This option will set "hbase.rootdir" in hbase-site.xml and determine
the directory shared by region servers and into which HBase persists.
The URL should be 'fully-qualified' to include the filesystem scheme.
If a core-site.xml is provided, the FS scheme defaults to the value
of "fs.defaultFS".

Filesystems other than HDFS (like S3, QFS, Swift) are also supported.

*Type:* string

*Default:* `"/hbase"`

*Example:* `"hdfs://nameservice1/hbase"`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.thrift.enable` {#opt-services.hadoop.hbase.thrift.enable}

Whether to enable HBase thrift.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.thrift.environment` {#opt-services.hadoop.hbase.thrift.environment}

Environment variables passed to thrift.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  HBASE_MASTER_OPTS = "-Dcom.sun.management.jmxremote.ssl=true";
}
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.thrift.extraFlags` {#opt-services.hadoop.hbase.thrift.extraFlags}

Extra flags for the thrift service.

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "--backup" ]`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.thrift.infoPort` {#opt-services.hadoop.hbase.thrift.infoPort}

web UI port

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9095`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.thrift.openFirewall` {#opt-services.hadoop.hbase.thrift.openFirewall}

Open firewall ports for HBase thrift.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.thrift.port` {#opt-services.hadoop.hbase.thrift.port}

RPC port

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9090`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.thrift.restartIfChanged` {#opt-services.hadoop.hbase.thrift.restartIfChanged}

Restart thrift con config change.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbase.zookeeperQuorum` {#opt-services.hadoop.hbase.zookeeperQuorum}

This option will set "hbase.zookeeper.quorum" in hbase-site.xml.
Comma-separated list of servers in the ZooKeeper ensemble.

*Type:* null or strings concatenated with ","

*Default:* `null`

*Example:* `"zk1.internal,zk2.internal,zk3.internal"`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbaseSite` {#opt-services.hadoop.hbaseSite}

Additional options and overrides for hbase-site.xml
[https://github.com/apache/hbase/blob/rel/2.4.11/hbase-common/src/main/resources/hbase-default.xml](https://github.com/apache/hbase/blob/rel/2.4.11/hbase-common/src/main/resources/hbase-default.xml)

*Type:* attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  "hbase.hregion.max.filesize" = 20*1024*1024*1024;
  "hbase.table.normalization.enabled" = "true";
}
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hbaseSiteDefault` {#opt-services.hadoop.hbaseSiteDefault}

Default options for hbase-site.xml

*Type:* attribute set of anything

*Default:*

``` nix
{
  "hbase.cluster.distributed" = "true";
  "hbase.master.info.bindAddress" = "0.0.0.0";
  "hbase.master.ipc.address" = "0.0.0.0";
  "hbase.regionserver.info.bindAddress" = "0.0.0.0";
  "hbase.regionserver.ipc.address" = "0.0.0.0";
}
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/hbase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hbase.nix)

## `services.hadoop.hdfs.datanode.dataDirs` {#opt-services.hadoop.hdfs.datanode.dataDirs}

Tier and path definitions for datanode storage.

*Type:* null or (list of (submodule))

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.datanode.dataDirs.*.path` {#opt-services.hadoop.hdfs.datanode.dataDirs._.path}

Determines where on the local filesystem a data node should store its blocks.

*Type:* absolute path

*Example:*

``` nix
[
  "/var/lib/hadoop/hdfs/dn"
]
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.datanode.dataDirs.*.type` {#opt-services.hadoop.hdfs.datanode.dataDirs._.type}

Storage types (\[SSD\]/\[DISK\]/\[ARCHIVE\]/\[RAM\_DISK\]) for HDFS storage policies.

*Type:* one of "SSD", "DISK", "ARCHIVE", "RAM\_DISK"

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.datanode.enable` {#opt-services.hadoop.hdfs.datanode.enable}

Whether to enable HDFS DataNode.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.datanode.extraEnv` {#opt-services.hadoop.hdfs.datanode.extraEnv}

Extra environment variables for HDFS DataNode

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.datanode.extraFlags` {#opt-services.hadoop.hdfs.datanode.extraFlags}

Extra command line flags to pass to HDFS DataNode

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-Dcom.sun.management.jmxremote"
  "-Dcom.sun.management.jmxremote.port=8010"
]
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.datanode.openFirewall` {#opt-services.hadoop.hdfs.datanode.openFirewall}

Open firewall ports for HDFS DataNode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.datanode.restartIfChanged` {#opt-services.hadoop.hdfs.datanode.restartIfChanged}

Automatically restart the service on config change.
This can be set to false to defer restarts on clusters running critical applications.
Please consider the security implications of inadvertently running an older version,
and the possibility of unexpected behavior caused by inconsistent versions across a cluster when disabling this option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.httpfs.enable` {#opt-services.hadoop.hdfs.httpfs.enable}

Whether to enable HDFS JournalNode.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.httpfs.extraEnv` {#opt-services.hadoop.hdfs.httpfs.extraEnv}

Extra environment variables for HDFS JournalNode

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.httpfs.extraFlags` {#opt-services.hadoop.hdfs.httpfs.extraFlags}

Extra command line flags to pass to HDFS JournalNode

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-Dcom.sun.management.jmxremote"
  "-Dcom.sun.management.jmxremote.port=8010"
]
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.httpfs.openFirewall` {#opt-services.hadoop.hdfs.httpfs.openFirewall}

Open firewall ports for HDFS JournalNode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.httpfs.restartIfChanged` {#opt-services.hadoop.hdfs.httpfs.restartIfChanged}

Automatically restart the service on config change.
This can be set to false to defer restarts on clusters running critical applications.
Please consider the security implications of inadvertently running an older version,
and the possibility of unexpected behavior caused by inconsistent versions across a cluster when disabling this option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.httpfs.tempPath` {#opt-services.hadoop.hdfs.httpfs.tempPath}

HTTPFS\_TEMP path used by HTTPFS

*Type:* absolute path

*Default:* `"/tmp/hadoop/httpfs"`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.journalnode.enable` {#opt-services.hadoop.hdfs.journalnode.enable}

Whether to enable HDFS JournalNode.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.journalnode.extraEnv` {#opt-services.hadoop.hdfs.journalnode.extraEnv}

Extra environment variables for HDFS JournalNode

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.journalnode.extraFlags` {#opt-services.hadoop.hdfs.journalnode.extraFlags}

Extra command line flags to pass to HDFS JournalNode

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-Dcom.sun.management.jmxremote"
  "-Dcom.sun.management.jmxremote.port=8010"
]
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.journalnode.openFirewall` {#opt-services.hadoop.hdfs.journalnode.openFirewall}

Open firewall ports for HDFS JournalNode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.journalnode.restartIfChanged` {#opt-services.hadoop.hdfs.journalnode.restartIfChanged}

Automatically restart the service on config change.
This can be set to false to defer restarts on clusters running critical applications.
Please consider the security implications of inadvertently running an older version,
and the possibility of unexpected behavior caused by inconsistent versions across a cluster when disabling this option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.namenode.enable` {#opt-services.hadoop.hdfs.namenode.enable}

Whether to enable HDFS NameNode.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.namenode.extraEnv` {#opt-services.hadoop.hdfs.namenode.extraEnv}

Extra environment variables for HDFS NameNode

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.namenode.extraFlags` {#opt-services.hadoop.hdfs.namenode.extraFlags}

Extra command line flags to pass to HDFS NameNode

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-Dcom.sun.management.jmxremote"
  "-Dcom.sun.management.jmxremote.port=8010"
]
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.namenode.formatOnInit` {#opt-services.hadoop.hdfs.namenode.formatOnInit}

Format HDFS namenode on first start. This is useful for quickly spinning up
ephemeral HDFS clusters with a single namenode.
For HA clusters, initialization involves multiple steps across multiple nodes.
Follow this guide to initialize an HA cluster manually:
[https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/HDFSHighAvailabilityWithQJM.html](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/HDFSHighAvailabilityWithQJM.html)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.namenode.openFirewall` {#opt-services.hadoop.hdfs.namenode.openFirewall}

Open firewall ports for HDFS NameNode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.namenode.restartIfChanged` {#opt-services.hadoop.hdfs.namenode.restartIfChanged}

Automatically restart the service on config change.
This can be set to false to defer restarts on clusters running critical applications.
Please consider the security implications of inadvertently running an older version,
and the possibility of unexpected behavior caused by inconsistent versions across a cluster when disabling this option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.zkfc.enable` {#opt-services.hadoop.hdfs.zkfc.enable}

Whether to enable HDFS ZooKeeper failover controller.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.zkfc.extraEnv` {#opt-services.hadoop.hdfs.zkfc.extraEnv}

Extra environment variables for HDFS ZooKeeper failover controller

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.zkfc.extraFlags` {#opt-services.hadoop.hdfs.zkfc.extraFlags}

Extra command line flags to pass to HDFS ZooKeeper failover controller

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-Dcom.sun.management.jmxremote"
  "-Dcom.sun.management.jmxremote.port=8010"
]
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfs.zkfc.restartIfChanged` {#opt-services.hadoop.hdfs.zkfc.restartIfChanged}

Automatically restart the service on config change.
This can be set to false to defer restarts on clusters running critical applications.
Please consider the security implications of inadvertently running an older version,
and the possibility of unexpected behavior caused by inconsistent versions across a cluster when disabling this option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/hadoop/hdfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/hdfs.nix)

## `services.hadoop.hdfsSite` {#opt-services.hadoop.hdfsSite}

Additional options and overrides for hdfs-site.xml
[https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-hdfs/hdfs-default.xml](https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-hdfs/hdfs-default.xml)

*Type:* attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  "dfs.nameservices" = "namenode1";
}
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/default.nix)

## `services.hadoop.hdfsSiteDefault` {#opt-services.hadoop.hdfsSiteDefault}

Default options for hdfs-site.xml

*Type:* attribute set of anything

*Default:*

``` nix
{
  "dfs.namenode.http-address" = "0.0.0.0:9870";
  "dfs.namenode.http-bind-host" = "0.0.0.0";
  "dfs.namenode.rpc-bind-host" = "0.0.0.0";
  "dfs.namenode.servicerpc-bind-host" = "0.0.0.0";
}
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/default.nix)

## `services.hadoop.httpfsSite` {#opt-services.hadoop.httpfsSite}

Hadoop httpfs-site.xml definition
[https://hadoop.apache.org/docs/current/hadoop-hdfs-httpfs/httpfs-default.html](https://hadoop.apache.org/docs/current/hadoop-hdfs-httpfs/httpfs-default.html)

*Type:* attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  "hadoop.http.max.threads" = 500;
}
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/default.nix)

## `services.hadoop.log4jProperties` {#opt-services.hadoop.log4jProperties}

log4j.properties file added to HADOOP\_CONF\_DIR

*Type:* absolute path

*Default:*

``` nix
"${config.services.hadoop.package}/etc/hadoop/log4j.properties"
```

*Example:*

``` nix
"${pkgs.hadoop}/etc/hadoop/log4j.properties";
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/default.nix)

## `services.hadoop.mapredSite` {#opt-services.hadoop.mapredSite}

Additional options and overrides for mapred-site.xml
[https://hadoop.apache.org/docs/current/hadoop-mapreduce-client/hadoop-mapreduce-client-core/mapred-default.xml](https://hadoop.apache.org/docs/current/hadoop-mapreduce-client/hadoop-mapreduce-client-core/mapred-default.xml)

*Type:* attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  "mapreduce.map.java.opts" = "-Xmx900m -XX:+UseParallelGC";
}
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/default.nix)

## `services.hadoop.mapredSiteDefault` {#opt-services.hadoop.mapredSiteDefault}

Default options for mapred-site.xml

*Type:* attribute set of anything

*Default:*

``` nix
{
  "mapreduce.framework.name" = "yarn";
  "yarn.app.mapreduce.am.env" = "HADOOP_MAPRED_HOME=${config.services.hadoop.package}";
  "mapreduce.map.env" = "HADOOP_MAPRED_HOME=${config.services.hadoop.package}";
  "mapreduce.reduce.env" = "HADOOP_MAPRED_HOME=${config.services.hadoop.package}";
}
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/default.nix)

## `services.hadoop.package` {#opt-services.hadoop.package}

The hadoop package to use.

*Type:* package

*Default:* `pkgs.hadoop`

*Declared by:* [`nixos/modules/services/cluster/hadoop/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/default.nix)

## `services.hadoop.yarn.nodemanager.addBinBash` {#opt-services.hadoop.yarn.nodemanager.addBinBash}

Add /bin/bash. This is needed by the linux container executor's launch script.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/cluster/hadoop/yarn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/yarn.nix)

## `services.hadoop.yarn.nodemanager.enable` {#opt-services.hadoop.yarn.nodemanager.enable}

Whether to enable Hadoop YARN NodeManager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/hadoop/yarn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/yarn.nix)

## `services.hadoop.yarn.nodemanager.extraEnv` {#opt-services.hadoop.yarn.nodemanager.extraEnv}

Extra environment variables

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/cluster/hadoop/yarn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/yarn.nix)

## `services.hadoop.yarn.nodemanager.extraFlags` {#opt-services.hadoop.yarn.nodemanager.extraFlags}

Extra command line flags to pass to the service

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-Dcom.sun.management.jmxremote"
  "-Dcom.sun.management.jmxremote.port=8010"
]
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/yarn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/yarn.nix)

## `services.hadoop.yarn.nodemanager.localDir` {#opt-services.hadoop.yarn.nodemanager.localDir}

List of directories to store localized files in.

*Type:* null or (list of absolute path)

*Default:* `null`

*Example:*

``` nix
[
  "/var/lib/hadoop/yarn/nm"
]
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/yarn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/yarn.nix)

## `services.hadoop.yarn.nodemanager.openFirewall` {#opt-services.hadoop.yarn.nodemanager.openFirewall}

Open firewall ports for nodemanager.
Because containers can listen on any ephemeral port, TCP ports 1024–65535 will be opened.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/hadoop/yarn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/yarn.nix)

## `services.hadoop.yarn.nodemanager.resource.cpuVCores` {#opt-services.hadoop.yarn.nodemanager.resource.cpuVCores}

Number of vcores that can be allocated for containers.

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/hadoop/yarn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/yarn.nix)

## `services.hadoop.yarn.nodemanager.resource.maximumAllocationMB` {#opt-services.hadoop.yarn.nodemanager.resource.maximumAllocationMB}

The maximum physical memory any container can be allocated.

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/hadoop/yarn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/yarn.nix)

## `services.hadoop.yarn.nodemanager.resource.maximumAllocationVCores` {#opt-services.hadoop.yarn.nodemanager.resource.maximumAllocationVCores}

The maximum virtual CPU cores any container can be allocated.

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/hadoop/yarn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/yarn.nix)

## `services.hadoop.yarn.nodemanager.resource.memoryMB` {#opt-services.hadoop.yarn.nodemanager.resource.memoryMB}

Amount of physical memory, in MB, that can be allocated for containers.

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/hadoop/yarn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/yarn.nix)

## `services.hadoop.yarn.nodemanager.restartIfChanged` {#opt-services.hadoop.yarn.nodemanager.restartIfChanged}

Automatically restart the service on config change.
This can be set to false to defer restarts on clusters running critical applications.
Please consider the security implications of inadvertently running an older version,
and the possibility of unexpected behavior caused by inconsistent versions across a cluster when disabling this option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/hadoop/yarn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/yarn.nix)

## `services.hadoop.yarn.nodemanager.useCGroups` {#opt-services.hadoop.yarn.nodemanager.useCGroups}

Use cgroups to enforce resource limits on containers

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/cluster/hadoop/yarn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/yarn.nix)

## `services.hadoop.yarn.resourcemanager.enable` {#opt-services.hadoop.yarn.resourcemanager.enable}

Whether to enable Hadoop YARN ResourceManager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/hadoop/yarn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/yarn.nix)

## `services.hadoop.yarn.resourcemanager.extraEnv` {#opt-services.hadoop.yarn.resourcemanager.extraEnv}

Extra environment variables

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/cluster/hadoop/yarn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/yarn.nix)

## `services.hadoop.yarn.resourcemanager.extraFlags` {#opt-services.hadoop.yarn.resourcemanager.extraFlags}

Extra command line flags to pass to the service

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-Dcom.sun.management.jmxremote"
  "-Dcom.sun.management.jmxremote.port=8010"
]
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/yarn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/yarn.nix)

## `services.hadoop.yarn.resourcemanager.openFirewall` {#opt-services.hadoop.yarn.resourcemanager.openFirewall}

Open firewall ports for resourcemanager

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/hadoop/yarn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/yarn.nix)

## `services.hadoop.yarn.resourcemanager.restartIfChanged` {#opt-services.hadoop.yarn.resourcemanager.restartIfChanged}

Automatically restart the service on config change.
This can be set to false to defer restarts on clusters running critical applications.
Please consider the security implications of inadvertently running an older version,
and the possibility of unexpected behavior caused by inconsistent versions across a cluster when disabling this option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/hadoop/yarn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/yarn.nix)

## `services.hadoop.yarnSite` {#opt-services.hadoop.yarnSite}

Additional options and overrides for yarn-site.xml
[https://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-common/yarn-default.xml](https://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-common/yarn-default.xml)

*Type:* attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  "yarn.resourcemanager.hostname" = "${config.networking.hostName}";
}
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/default.nix)

## `services.hadoop.yarnSiteDefault` {#opt-services.hadoop.yarnSiteDefault}

Default options for yarn-site.xml

*Type:* attribute set of anything

*Default:*

``` nix
{
  "yarn.nodemanager.admin-env" = "PATH=$PATH";
  "yarn.nodemanager.aux-services" = "mapreduce_shuffle";
  "yarn.nodemanager.aux-services.mapreduce_shuffle.class" = "org.apache.hadoop.mapred.ShuffleHandler";
  "yarn.nodemanager.bind-host" = "0.0.0.0";
  "yarn.nodemanager.container-executor.class" = "org.apache.hadoop.yarn.server.nodemanager.LinuxContainerExecutor";
  "yarn.nodemanager.env-whitelist" = "JAVA_HOME,HADOOP_COMMON_HOME,HADOOP_HDFS_HOME,HADOOP_CONF_DIR,CLASSPATH_PREPEND_DISTCACHE,HADOOP_YARN_HOME,HADOOP_HOME,LANG,TZ";
  "yarn.nodemanager.linux-container-executor.group" = "hadoop";
  "yarn.nodemanager.linux-container-executor.path" = "/run/wrappers/yarn-nodemanager/bin/container-executor";
  "yarn.nodemanager.log-dirs" = "/var/log/hadoop/yarn/nodemanager";
  "yarn.resourcemanager.bind-host" = "0.0.0.0";
  "yarn.resourcemanager.scheduler.class" = "org.apache.hadoop.yarn.server.resourcemanager.scheduler.fair.FairScheduler";
}
```

*Declared by:* [`nixos/modules/services/cluster/hadoop/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/hadoop/default.nix)

## `services.handheld-daemon.adjustor.enable` {#opt-services.handheld-daemon.adjustor.enable}

Whether to enable Handheld Daemon TDP control plugin.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/handheld-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/handheld-daemon.nix)

## `services.handheld-daemon.adjustor.loadAcpiCallModule` {#opt-services.handheld-daemon.adjustor.loadAcpiCallModule}

Whether to load the acpi\_call kernel module.
Required for TDP control by adjustor on most devices.

*Type:* boolean

*Declared by:* [`nixos/modules/services/hardware/handheld-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/handheld-daemon.nix)

## `services.handheld-daemon.enable` {#opt-services.handheld-daemon.enable}

Whether to enable Handheld Daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/handheld-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/handheld-daemon.nix)

## `services.handheld-daemon.package` {#opt-services.handheld-daemon.package}

The handheld-daemon package to use.

*Type:* package

*Default:* `pkgs.handheld-daemon`

*Declared by:* [`nixos/modules/services/hardware/handheld-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/handheld-daemon.nix)

## `services.handheld-daemon.ui.enable` {#opt-services.handheld-daemon.ui.enable}

Whether to enable Handheld Daemon UI.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/handheld-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/handheld-daemon.nix)

## `services.handheld-daemon.ui.package` {#opt-services.handheld-daemon.ui.package}

The handheld-daemon-ui package to use.

*Type:* package

*Default:* `pkgs.handheld-daemon-ui`

*Declared by:* [`nixos/modules/services/hardware/handheld-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/handheld-daemon.nix)

## `services.handheld-daemon.user` {#opt-services.handheld-daemon.user}

The user to run Handheld Daemon with.

*Type:* string

*Declared by:* [`nixos/modules/services/hardware/handheld-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/handheld-daemon.nix)

## `services.hans.clients` {#opt-services.hans.clients}

Each attribute of this option defines a systemd service that
runs hans. Many or none may be defined.
The name of each service is
`hans-«name»`
where «name» is the name of the
corresponding attribute name.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  foo = {
    server = "192.0.2.1";
    extraConfig = "-v";
  }
}
```

*Declared by:* [`nixos/modules/services/networking/hans.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hans.nix)

## `services.hans.clients.<name>.extraConfig` {#opt-services.hans.clients._name_.extraConfig}

Additional command line parameters

*Type:* string

*Default:* `""`

*Example:* `"-v"`

*Declared by:* [`nixos/modules/services/networking/hans.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hans.nix)

## `services.hans.clients.<name>.passwordFile` {#opt-services.hans.clients._name_.passwordFile}

File that contains password

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/hans.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hans.nix)

## `services.hans.clients.<name>.server` {#opt-services.hans.clients._name_.server}

IP address of server running hans

*Type:* string

*Default:* `""`

*Example:* `"192.0.2.1"`

*Declared by:* [`nixos/modules/services/networking/hans.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hans.nix)

## `services.hans.server.enable` {#opt-services.hans.server.enable}

enable hans server

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/hans.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hans.nix)

## `services.hans.server.extraConfig` {#opt-services.hans.server.extraConfig}

Additional command line parameters

*Type:* string

*Default:* `""`

*Example:* `"-v"`

*Declared by:* [`nixos/modules/services/networking/hans.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hans.nix)

## `services.hans.server.ip` {#opt-services.hans.server.ip}

The assigned ip range

*Type:* string

*Default:* `""`

*Example:* `"198.51.100.0"`

*Declared by:* [`nixos/modules/services/networking/hans.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hans.nix)

## `services.hans.server.passwordFile` {#opt-services.hans.server.passwordFile}

File that contains password

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/hans.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hans.nix)

## `services.hans.server.respondToSystemPings` {#opt-services.hans.server.respondToSystemPings}

Force hans respond to ordinary pings

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/hans.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hans.nix)

## `services.haproxy.config` {#opt-services.haproxy.config}

Contents of the HAProxy configuration file,
`haproxy.conf`.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/haproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/haproxy.nix)

## `services.haproxy.enable` {#opt-services.haproxy.enable}

Whether to enable HAProxy, the reliable, high performance TCP/HTTP load balancer.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/haproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/haproxy.nix)

## `services.haproxy.group` {#opt-services.haproxy.group}

Group account under which haproxy runs.

*Type:* string

*Default:* `"haproxy"`

*Declared by:* [`nixos/modules/services/networking/haproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/haproxy.nix)

## `services.haproxy.package` {#opt-services.haproxy.package}

The haproxy package to use.

*Type:* package

*Default:* `pkgs.haproxy`

*Declared by:* [`nixos/modules/services/networking/haproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/haproxy.nix)

## `services.haproxy.user` {#opt-services.haproxy.user}

User account under which haproxy runs.

*Type:* string

*Default:* `"haproxy"`

*Declared by:* [`nixos/modules/services/networking/haproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/haproxy.nix)

## `services.hardware.argonone.enable` {#opt-services.hardware.argonone.enable}

Whether to enable the driver for Argon One Raspberry Pi case fan and power button.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/argonone.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/argonone.nix)

## `services.hardware.argonone.package` {#opt-services.hardware.argonone.package}

The argononed package to use.

*Type:* package

*Default:* `pkgs.argononed`

*Declared by:* [`nixos/modules/services/hardware/argonone.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/argonone.nix)

## `services.hardware.bolt.enable` {#opt-services.hardware.bolt.enable}

Whether to enable Bolt, a userspace daemon to enable
security levels for Thunderbolt 3 on GNU/Linux.

Bolt is used by GNOME 3 to handle Thunderbolt settings.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/bolt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/bolt.nix)

## `services.hardware.bolt.package` {#opt-services.hardware.bolt.package}

The bolt package to use.

*Type:* package

*Default:* `pkgs.bolt`

*Declared by:* [`nixos/modules/services/hardware/bolt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/bolt.nix)

## `services.hardware.deepcool-digital-linux.enable` {#opt-services.hardware.deepcool-digital-linux.enable}

Whether to enable DeepCool Digital monitoring daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/deepcool-digital-linux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/deepcool-digital-linux.nix)

## `services.hardware.deepcool-digital-linux.extraArgs` {#opt-services.hardware.deepcool-digital-linux.extraArgs}

Extra command line arguments to be passed to the deepcool-digital-linux daemon.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  # Change the update interval
  "--update 750"
  # Enable the alarm
  "--alarm"
]
```

*Declared by:* [`nixos/modules/services/hardware/deepcool-digital-linux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/deepcool-digital-linux.nix)

## `services.hardware.deepcool-digital-linux.package` {#opt-services.hardware.deepcool-digital-linux.package}

The deepcool-digital-linux package to use.

*Type:* package

*Default:* `pkgs.deepcool-digital-linux`

*Declared by:* [`nixos/modules/services/hardware/deepcool-digital-linux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/deepcool-digital-linux.nix)

## `services.hardware.dell-bios-fan-control.enable` {#opt-services.hardware.dell-bios-fan-control.enable}

Whether to enable One-shot service to disable dell bios fan control on startup.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/dell-bios-fan-control.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/dell-bios-fan-control.nix)

## `services.hardware.dell-bios-fan-control.package` {#opt-services.hardware.dell-bios-fan-control.package}

The dell-bios-fan-control package to use.

*Type:* package

*Default:* `pkgs.dell-bios-fan-control`

*Declared by:* [`nixos/modules/services/hardware/dell-bios-fan-control.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/dell-bios-fan-control.nix)

## `services.hardware.lcd.client.enable` {#opt-services.hardware.lcd.client.enable}

Enable the LCD panel client (LCDproc)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/lcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/lcd.nix)

## `services.hardware.lcd.client.extraConfig` {#opt-services.hardware.lcd.client.extraConfig}

Additional configuration added verbatim to the client config.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/hardware/lcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/lcd.nix)

## `services.hardware.lcd.client.restartForever` {#opt-services.hardware.lcd.client.restartForever}

Try restarting the client forever.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/hardware/lcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/lcd.nix)

## `services.hardware.lcd.server.enable` {#opt-services.hardware.lcd.server.enable}

Enable the LCD panel server (LCDd)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/lcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/lcd.nix)

## `services.hardware.lcd.server.extraConfig` {#opt-services.hardware.lcd.server.extraConfig}

Additional configuration added verbatim to the server config.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/hardware/lcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/lcd.nix)

## `services.hardware.lcd.server.openPorts` {#opt-services.hardware.lcd.server.openPorts}

Open the ports in the firewall

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/lcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/lcd.nix)

## `services.hardware.lcd.server.usbGroup` {#opt-services.hardware.lcd.server.usbGroup}

The group to use for settings permissions. This group must exist or you will have to create it.

*Type:* string

*Default:* `"dialout"`

*Declared by:* [`nixos/modules/services/hardware/lcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/lcd.nix)

## `services.hardware.lcd.server.usbPermissions` {#opt-services.hardware.lcd.server.usbPermissions}

Set group-write permissions on a USB device.

A USB connected LCD panel will most likely require having its
permissions modified for lcdd to write to it. Enabling this option
sets group-write permissions on the device identified by
`services.hardware.lcd.usbVid` and
`services.hardware.lcd.usbPid`. In order to find the
values, you can run the `lsusb` command. Example
output:

```
Bus 005 Device 002: ID 0403:c630 Future Technology Devices International, Ltd lcd2usb interface
```

In this case the vendor id is 0403 and the product id is c630.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/lcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/lcd.nix)

## `services.hardware.lcd.server.usbPid` {#opt-services.hardware.lcd.server.usbPid}

The product ID of the USB device to claim.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/hardware/lcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/lcd.nix)

## `services.hardware.lcd.server.usbVid` {#opt-services.hardware.lcd.server.usbVid}

The vendor ID of the USB device to claim.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/hardware/lcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/lcd.nix)

## `services.hardware.lcd.serverHost` {#opt-services.hardware.lcd.serverHost}

Host on which LCDd is listening.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/hardware/lcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/lcd.nix)

## `services.hardware.lcd.serverPort` {#opt-services.hardware.lcd.serverPort}

Port on which LCDd is listening.

*Type:* signed integer

*Default:* `13666`

*Declared by:* [`nixos/modules/services/hardware/lcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/lcd.nix)

## `services.hardware.openrgb.enable` {#opt-services.hardware.openrgb.enable}

Whether to enable OpenRGB server, for RGB lighting control.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/openrgb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/openrgb.nix)

## `services.hardware.openrgb.motherboard` {#opt-services.hardware.openrgb.motherboard}

CPU family of motherboard. Allows for addition motherboard i2c support.

*Type:* null or one of "amd", "intel"

*Default:* if config.hardware.cpu.intel.updateMicrocode then "intel"
else if config.hardware.cpu.amd.updateMicrocode then "amd"
else null;

*Declared by:* [`nixos/modules/services/hardware/openrgb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/openrgb.nix)

## `services.hardware.openrgb.package` {#opt-services.hardware.openrgb.package}

The openrgb package to use.

*Type:* package

*Default:* `pkgs.openrgb`

*Declared by:* [`nixos/modules/services/hardware/openrgb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/openrgb.nix)

## `services.hardware.openrgb.server.port` {#opt-services.hardware.openrgb.server.port}

Set server port of openrgb.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6742`

*Declared by:* [`nixos/modules/services/hardware/openrgb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/openrgb.nix)

## `services.hardware.openrgb.startupProfile` {#opt-services.hardware.openrgb.startupProfile}

The profile file to load from "/var/lib/OpenRGB" at startup.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/openrgb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/openrgb.nix)

## `services.hardware.pommed.configFile` {#opt-services.hardware.pommed.configFile}

The path to the `pommed.conf` file. Leave
to null to use the default config file
(`/etc/pommed.conf.mactel`). See the
files `/etc/pommed.conf.mactel` and
`/etc/pommed.conf.pmac` for examples to
build on.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/pommed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/pommed.nix)

## `services.hardware.pommed.enable` {#opt-services.hardware.pommed.enable}

Whether to use the pommed tool to handle Apple laptop
keyboard hotkeys.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/pommed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/pommed.nix)

## `services.harmonia.cache.enable` {#opt-services.harmonia.cache.enable}

Whether to enable Harmonia: Nix binary cache written in Rust.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/harmonia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/harmonia.nix)

## `services.harmonia.cache.settings` {#opt-services.harmonia.cache.settings}

Settings to merge with the default configuration.
For the list of the default configuration, see [https://github.com/nix-community/harmonia/tree/master#configuration](https://github.com/nix-community/harmonia/tree/master#configuration).

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/harmonia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/harmonia.nix)

## `services.harmonia.cache.signKeyPath` {#opt-services.harmonia.cache.signKeyPath}

DEPRECATED: Use `services.harmonia.cache.signKeyPaths` instead. Path to the signing key to use for signing the cache

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/harmonia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/harmonia.nix)

## `services.harmonia.cache.signKeyPaths` {#opt-services.harmonia.cache.signKeyPaths}

Paths to the signing keys to use for signing the cache

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/harmonia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/harmonia.nix)

## `services.harmonia.daemon.dbPath` {#opt-services.harmonia.daemon.dbPath}

Path to the Nix database

*Type:* string

*Default:* `"/nix/var/nix/db/db.sqlite"`

*Declared by:* [`nixos/modules/services/networking/harmonia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/harmonia.nix)

## `services.harmonia.daemon.enable` {#opt-services.harmonia.daemon.enable}

Whether to enable Harmonia daemon: Nix daemon protocol implementation.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/harmonia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/harmonia.nix)

## `services.harmonia.daemon.logLevel` {#opt-services.harmonia.daemon.logLevel}

Log level for the daemon

*Type:* string

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/networking/harmonia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/harmonia.nix)

## `services.harmonia.daemon.socketPath` {#opt-services.harmonia.daemon.socketPath}

Path where the daemon socket will be created

*Type:* string

*Default:* `"/run/harmonia-daemon/socket"`

*Declared by:* [`nixos/modules/services/networking/harmonia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/harmonia.nix)

## `services.harmonia.daemon.storeDir` {#opt-services.harmonia.daemon.storeDir}

Path to the Nix store directory

*Type:* string

*Default:* `"/nix/store"`

*Declared by:* [`nixos/modules/services/networking/harmonia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/harmonia.nix)

## `services.harmonia.gc.automatic` {#opt-services.harmonia.gc.automatic}

Run garbage collection automatically on a schedule.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/harmonia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/harmonia.nix)

## `services.harmonia.gc.chunkSize` {#opt-services.harmonia.gc.chunkSize}

Number of dead paths invalidated per database transaction. Lower
values keep the WAL (and its disk use) smaller during deletion at
the cost of more checkpoints; null uses the built-in default.

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/harmonia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/harmonia.nix)

## `services.harmonia.gc.dates` {#opt-services.harmonia.gc.dates}

When to run garbage collection. Calendar event in the format
specified by `systemd.time(7)`.

*Type:* (optionally newline-terminated) single-line string or list of string

*Default:*

``` nix
[
  "03:15"
]
```

*Example:* `"weekly"`

*Declared by:* [`nixos/modules/services/networking/harmonia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/harmonia.nix)

## `services.harmonia.gc.deleteOlderThan` {#opt-services.harmonia.gc.deleteOlderThan}

Delete profile generations older than this.

*Type:* null or (optionally newline-terminated) single-line string

*Default:* `null`

*Example:* `"30d"`

*Declared by:* [`nixos/modules/services/networking/harmonia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/harmonia.nix)

## `services.harmonia.gc.enable` {#opt-services.harmonia.gc.enable}

Whether to enable harmonia-gc, a faster nix-collect-garbage.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/harmonia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/harmonia.nix)

## `services.harmonia.gc.ensureFree` {#opt-services.harmonia.gc.ensureFree}

Free space until this much is available, then stop. Accepts an
absolute size like "50G" or a percentage of the store's filesystem
like "20%".

*Type:* null or (optionally newline-terminated) single-line string

*Default:* `null`

*Example:* `"50G"`

*Declared by:* [`nixos/modules/services/networking/harmonia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/harmonia.nix)

## `services.harmonia.gc.extraArgs` {#opt-services.harmonia.gc.extraArgs}

Extra arguments to pass to harmonia-gc.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/harmonia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/harmonia.nix)

## `services.harmonia.gc.gcRootsDirs` {#opt-services.harmonia.gc.gcRootsDirs}

Extra directories to scan for GC roots, treated like the standard
gcroots directory. Nix only scans its own state directories; this
keeps roots that live elsewhere from being collected.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/mnt/extra-roots"
]
```

*Declared by:* [`nixos/modules/services/networking/harmonia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/harmonia.nix)

## `services.harmonia.gc.keepRecent` {#opt-services.harmonia.gc.keepRecent}

Keep store paths registered within this time window. Avoids deleting
build dependencies fetched during a recent build.

*Type:* null or (optionally newline-terminated) single-line string

*Default:* `null`

*Example:* `"1d"`

*Declared by:* [`nixos/modules/services/networking/harmonia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/harmonia.nix)

## `services.harmonia.gc.noVacuum` {#opt-services.harmonia.gc.noVacuum}

Skip the SQLite VACUUM after garbage collection. Enable on busy
builders, where concurrent nix-daemon readers prevent cleanup of
the database-sized WAL that VACUUM produces.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/harmonia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/harmonia.nix)

## `services.harmonia.gc.persistent` {#opt-services.harmonia.gc.persistent}

Run on next boot if a scheduled run was missed.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/harmonia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/harmonia.nix)

## `services.harmonia.gc.randomizedDelaySec` {#opt-services.harmonia.gc.randomizedDelaySec}

Randomized delay before each run.

*Type:* (optionally newline-terminated) single-line string

*Default:* `"0"`

*Example:* `"45min"`

*Declared by:* [`nixos/modules/services/networking/harmonia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/harmonia.nix)

## `services.harmonia.package` {#opt-services.harmonia.package}

The harmonia package to use.

*Type:* package

*Default:* `pkgs.harmonia`

*Declared by:* [`nixos/modules/services/networking/harmonia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/harmonia.nix)

## `services.hatsu.enable` {#opt-services.hatsu.enable}

Whether to enable Self-hosted and fully-automated ActivityPub bridge for static sites.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/hatsu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hatsu.nix)

## `services.hatsu.package` {#opt-services.hatsu.package}

The hatsu package to use.

*Type:* package

*Default:* `pkgs.hatsu`

*Declared by:* [`nixos/modules/services/web-apps/hatsu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hatsu.nix)

## `services.hatsu.settings` {#opt-services.hatsu.settings}

Configuration for Hatsu, see
[https://hatsu.cli.rs/admins/environments.html](https://hatsu.cli.rs/admins/environments.html)
for supported values.

*Type:* open submodule of attribute set of (null or boolean or signed integer or 16 bit unsigned integer; between 0 and 65535 (both inclusive) or string)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/hatsu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hatsu.nix)

## `services.hatsu.settings.HATSU_DATABASE_URL` {#opt-services.hatsu.settings.HATSU_DATABASE_URL}

Database URL.

*Type:* string

*Default:* `"sqlite:///var/lib/hatsu/hatsu.sqlite?mode=rwc"`

*Example:* `"postgres://username:password@host/database"`

*Declared by:* [`nixos/modules/services/web-apps/hatsu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hatsu.nix)

## `services.hatsu.settings.HATSU_DOMAIN` {#opt-services.hatsu.settings.HATSU_DOMAIN}

The domain name of your instance (eg 'hatsu.local').

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/hatsu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hatsu.nix)

## `services.hatsu.settings.HATSU_LISTEN_HOST` {#opt-services.hatsu.settings.HATSU_LISTEN_HOST}

Host where hatsu should listen for incoming requests.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/hatsu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hatsu.nix)

## `services.hatsu.settings.HATSU_LISTEN_PORT` {#opt-services.hatsu.settings.HATSU_LISTEN_PORT}

Port where hatsu should listen for incoming requests.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3939`

*Declared by:* [`nixos/modules/services/web-apps/hatsu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hatsu.nix)

## `services.hatsu.settings.HATSU_PRIMARY_ACCOUNT` {#opt-services.hatsu.settings.HATSU_PRIMARY_ACCOUNT}

The primary account of your instance (eg 'example.com').

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/hatsu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hatsu.nix)

## `services.haveged.enable` {#opt-services.haveged.enable}

Whether to enable haveged entropy daemon, which refills /dev/random when low.
NOTE: does nothing on kernels newer than 5.6
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/haveged.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/haveged.nix)

## `services.haveged.refill_threshold` {#opt-services.haveged.refill_threshold}

The number of bits of available entropy beneath which
haveged should refill the entropy pool.

*Type:* signed integer

*Default:* `1024`

*Declared by:* [`nixos/modules/services/security/haveged.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/haveged.nix)

## `services.haven.blastrRelays` {#opt-services.haven.blastrRelays}

List of relay configurations for blastr

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "relay.example.com"
]
```

*Declared by:* [`nixos/modules/services/web-apps/haven.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/haven.nix)

## `services.haven.enable` {#opt-services.haven.enable}

Whether to enable haven.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/haven.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/haven.nix)

## `services.haven.environmentFile` {#opt-services.haven.environmentFile}

Path to a file containing sensitive environment variables. See [https://github.com/bitvora/haven](https://github.com/bitvora/haven) for documentation.
The file should contain environment-variable assignments like:
S3\_SECRET\_KEY=mysecretkey
S3\_ACCESS\_KEY\_ID=myaccesskey

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/haven/secrets.env"`

*Declared by:* [`nixos/modules/services/web-apps/haven.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/haven.nix)

## `services.haven.importRelays` {#opt-services.haven.importRelays}

List of relay configurations for importing historical events

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "relay.example.com"
]
```

*Declared by:* [`nixos/modules/services/web-apps/haven.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/haven.nix)

## `services.haven.package` {#opt-services.haven.package}

The haven package to use.

*Type:* package

*Default:* `pkgs.haven`

*Declared by:* [`nixos/modules/services/web-apps/haven.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/haven.nix)

## `services.haven.settings` {#opt-services.haven.settings}

See [https://github.com/bitvora/haven](https://github.com/bitvora/haven) for documentation.

*Type:* unspecified value

*Default:* `"See <https://github.com/bitvora/haven/blob/master/.env.example>"`

*Example:*

``` nix
{
  RELAY_URL = "relay.example.com";
  OWNER_NPUB = "npub1...";
}
```

*Declared by:* [`nixos/modules/services/web-apps/haven.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/haven.nix)

## `services.hbase-standalone.dataDir` {#opt-services.hbase-standalone.dataDir}

Specifies location of HBase database files. This location should be
writable and readable for the user the HBase service runs as
(hbase by default).

*Type:* absolute path

*Default:* `"/var/lib/hbase"`

*Declared by:* [`nixos/modules/services/databases/hbase-standalone.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/hbase-standalone.nix)

## `services.hbase-standalone.enable` {#opt-services.hbase-standalone.enable}

Whether to enable HBase master in standalone mode with embedded regionserver and zookeper.
Do not use this configuration for production nor for evaluating HBase performance
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/hbase-standalone.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/hbase-standalone.nix)

## `services.hbase-standalone.group` {#opt-services.hbase-standalone.group}

Group account under which HBase runs.

*Type:* string

*Default:* `"hbase"`

*Declared by:* [`nixos/modules/services/databases/hbase-standalone.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/hbase-standalone.nix)

## `services.hbase-standalone.logDir` {#opt-services.hbase-standalone.logDir}

Specifies the location of HBase log files.

*Type:* absolute path

*Default:* `"/var/log/hbase"`

*Declared by:* [`nixos/modules/services/databases/hbase-standalone.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/hbase-standalone.nix)

## `services.hbase-standalone.package` {#opt-services.hbase-standalone.package}

The hbase package to use.

*Type:* package

*Default:* `pkgs.hbase`

*Declared by:* [`nixos/modules/services/databases/hbase-standalone.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/hbase-standalone.nix)

## `services.hbase-standalone.settings` {#opt-services.hbase-standalone.settings}

configurations in hbase-site.xml, see [https://github.com/apache/hbase/blob/master/hbase-server/src/test/resources/hbase-site.xml](https://github.com/apache/hbase/blob/master/hbase-server/src/test/resources/hbase-site.xml) for details.

*Type:* attribute set of (string or signed integer or boolean)

*Default:*

``` nix
{
  "hbase.rootdir" = "file://${config.services.hbase-standalone.dataDir}/hbase";
  "hbase.zookeeper.property.dataDir" = "${config.services.hbase-standalone.dataDir}/zookeeper";
}
```

*Declared by:* [`nixos/modules/services/databases/hbase-standalone.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/hbase-standalone.nix)

## `services.hbase-standalone.user` {#opt-services.hbase-standalone.user}

User account under which HBase runs.

*Type:* string

*Default:* `"hbase"`

*Declared by:* [`nixos/modules/services/databases/hbase-standalone.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/hbase-standalone.nix)

## `services.hdapsd.enable` {#opt-services.hdapsd.enable}

Whether to enable Hard Drive Active Protection System Daemon,
devices are detected and managed automatically by udev and systemd
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/hdaps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/hdaps.nix)

## `services.hddfancontrol.enable` {#opt-services.hddfancontrol.enable}

Whether to enable hddfancontrol daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/hddfancontrol.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/hddfancontrol.nix)

## `services.hddfancontrol.package` {#opt-services.hddfancontrol.package}

The hddfancontrol package to use.

*Type:* package

*Default:* `pkgs.hddfancontrol`

*Declared by:* [`nixos/modules/services/hardware/hddfancontrol.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/hddfancontrol.nix)

## `services.hddfancontrol.settings` {#opt-services.hddfancontrol.settings}

Parameter-sets for each instance of hddfancontrol.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  harddrives = {
    disks = [
      "/dev/sda"
      "/dev/sdb"
      "/dev/sdc"
    ];
    pwmPaths = [
      "/sys/class/hwmon/hwmon1/pwm1:25:10"
    ];
    logVerbosity = "DEBUG";
  };
  ssddrives = {
    disks = [
      "/dev/sdd"
      "/dev/sde"
      "/dev/sdf"
    ];
    pwmPaths = [
      "/sys/class/hwmon/hwmon1/pwm2:25:10"
    ];
    extraArgs = [
      "--interval=30s"
    ];
  };
}
```

*Declared by:* [`nixos/modules/services/hardware/hddfancontrol.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/hddfancontrol.nix)

## `services.hddfancontrol.settings.<drive-bay-name>.disks` {#opt-services.hddfancontrol.settings._drive-bay-name_.disks}

Drive(s) to get temperature from

Can also use command substitution to automatically grab all matching drives; such as all scsi (sas) drives

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/dev/sda"
  "$(find /dev/disk/by-id -name \"scsi*\" -and -not -name \"*-part*\" -printf \"%p \")"
]
```

*Declared by:* [`nixos/modules/services/hardware/hddfancontrol.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/hddfancontrol.nix)

## `services.hddfancontrol.settings.<drive-bay-name>.extraArgs` {#opt-services.hddfancontrol.settings._drive-bay-name_.extraArgs}

Extra commandline arguments for hddfancontrol

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--min-fan-speed-prct=10"
  "--interval=1min"
]
```

*Declared by:* [`nixos/modules/services/hardware/hddfancontrol.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/hddfancontrol.nix)

## `services.hddfancontrol.settings.<drive-bay-name>.logVerbosity` {#opt-services.hddfancontrol.settings._drive-bay-name_.logVerbosity}

Verbosity of the log level

*Type:* one of "TRACE", "DEBUG", "INFO", "WARN", "ERROR"

*Default:* `"INFO"`

*Declared by:* [`nixos/modules/services/hardware/hddfancontrol.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/hddfancontrol.nix)

## `services.hddfancontrol.settings.<drive-bay-name>.pwmPaths` {#opt-services.hddfancontrol.settings._drive-bay-name_.pwmPaths}

PWM filepath(s) to control fan speed (under /sys), followed by initial and fan-stop PWM values
Can also use command substitution to ensure the correct hwmonX is selected on every boot

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/sys/class/hwmon/hwmon2/pwm1:30:10"
  "`echo /sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]`/pwm4:80:20"
]
```

*Declared by:* [`nixos/modules/services/hardware/hddfancontrol.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/hddfancontrol.nix)

## `services.headphones.configFile` {#opt-services.headphones.configFile}

Path to config file.

*Type:* absolute path

*Default:* `"${config.services.headphones.dataDir}/config.ini"`

*Declared by:* [`nixos/modules/services/misc/headphones.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/headphones.nix)

## `services.headphones.dataDir` {#opt-services.headphones.dataDir}

Path where to store data files.

*Type:* absolute path

*Default:* `"/var/lib/headphones"`

*Declared by:* [`nixos/modules/services/misc/headphones.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/headphones.nix)

## `services.headphones.enable` {#opt-services.headphones.enable}

Whether to enable the headphones server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/headphones.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/headphones.nix)

## `services.headphones.group` {#opt-services.headphones.group}

Group to run the service as

*Type:* string

*Default:* `"headphones"`

*Declared by:* [`nixos/modules/services/misc/headphones.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/headphones.nix)

## `services.headphones.host` {#opt-services.headphones.host}

Host to listen on.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/misc/headphones.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/headphones.nix)

## `services.headphones.port` {#opt-services.headphones.port}

Port to bind to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8181`

*Declared by:* [`nixos/modules/services/misc/headphones.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/headphones.nix)

## `services.headphones.user` {#opt-services.headphones.user}

User to run the service as

*Type:* string

*Default:* `"headphones"`

*Declared by:* [`nixos/modules/services/misc/headphones.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/headphones.nix)

## `services.headplane.agent.package` {#opt-services.headplane.agent.package}

The headplane-agent package to use.

*Type:* package

*Default:* `pkgs.headplane-agent`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.debug` {#opt-services.headplane.debug}

Whether to enable debug logging.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.enable` {#opt-services.headplane.enable}

Whether to enable Headplane.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.package` {#opt-services.headplane.package}

The headplane package to use.

*Type:* package

*Default:* `pkgs.headplane`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings` {#opt-services.headplane.settings}

Headplane configuration options. Generates a YAML config file.
See [https://github.com/tale/headplane/blob/main/config.example.yaml](https://github.com/tale/headplane/blob/main/config.example.yaml).

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.headscale` {#opt-services.headplane.settings.headscale}

Headscale specific settings for Headplane integration.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.headscale.api_key_path` {#opt-services.headplane.settings.headscale.api_key_path}

Path to a file containing a Headscale API key.
This is required for OIDC authentication aswell for the Headplane agent.

*Type:* null or absolute path

*Default:* `null`

*Example:* `config.sops.secrets.headplane_pre_authkey.path`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.headscale.config_path` {#opt-services.headplane.settings.headscale.config_path}

Path to the Headscale configuration file.
This is optional, but HIGHLY recommended for the best experience.
If this is read only, Headplane will show your configuration settings
in the Web UI, but they cannot be changed.

*Type:* null or absolute path

*Default:* `config.services.headscale.configFile`

*Example:* `"/etc/headscale/config.yaml"`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.headscale.config_strict` {#opt-services.headplane.settings.headscale.config_strict}

Whether to enable Headplane internally validates the Headscale configuration
to ensure that it changes the configuration in a safe way.
Disabled by default because it clashes with how the Headplane works in NixOS.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.headscale.dns_records_path` {#opt-services.headplane.settings.headscale.dns_records_path}

If you are using `dns.extra_records_path` in your Headscale configuration, you need to set this to the path for Headplane to be able to read the DNS records.
Ensure that the file is both readable and writable by the Headplane process.
When using this, Headplane will no longer need to automatically restart Headscale for DNS record changes.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/headplane/extra_records.json"`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.headscale.public_url` {#opt-services.headplane.settings.headscale.public_url}

Public URL if different. This affects certain parts of the web UI.

*Type:* null or string

*Default:* `config.services.headscale.settings.server_url`

*Example:* `"https://headscale.example.com"`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.headscale.tls_cert_path` {#opt-services.headplane.settings.headscale.tls_cert_path}

Path to a file containing the TLS certificate.

*Type:* null or absolute path

*Default:* `null`

*Example:* `config.sops.secrets.tls_cert.path`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.headscale.url` {#opt-services.headplane.settings.headscale.url}

The URL to your Headscale instance.
All API requests are routed through this URL.
THIS IS NOT the gRPC endpoint, but the HTTP endpoint.
IMPORTANT: If you are using TLS this MUST be set to `https://`.

*Type:* string

*Default:* `http://127.0.0.1:${toString config.services.headscale.port}`

*Example:* `"https://headscale.example.com"`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.integration` {#opt-services.headplane.settings.integration}

Integration configurations for Headplane to interact with Headscale.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.integration.agent` {#opt-services.headplane.settings.integration.agent}

Agent configuration for the Headplane agent.

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.integration.agent.cache_ttl` {#opt-services.headplane.settings.integration.agent.cache_ttl}

How long to cache agent information (in milliseconds).
If you want data to update faster, reduce the TTL, but this will increase the frequency of requests to Headscale.

*Type:* positive integer, meaning \>0

*Default:* `180000`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.integration.agent.enabled` {#opt-services.headplane.settings.integration.agent.enabled}

The Headplane agent allows retrieving information about nodes.
This allows the UI to display version, OS, and connectivity data.
You will see the Headplane agent in your Tailnet as a node when it connects.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.integration.agent.executable_path` {#opt-services.headplane.settings.integration.agent.executable_path}

Path to the headplane agent binary.

*Type:* absolute path

*Default:* `"${config.services.headplane.agent.package}/bin/hp_agent"`

*Read only*

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.integration.agent.host_name` {#opt-services.headplane.settings.integration.agent.host_name}

Optionally change the name of the agent in the Tailnet.

*Type:* string

*Default:* `"headplane-agent"`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.integration.agent.work_dir` {#opt-services.headplane.settings.integration.agent.work_dir}

Do not change this unless you are running a custom deployment.
The work\_dir represents where the agent will store its data to be able to automatically reauthenticate with your Tailnet.
It needs to be writable by the user running the Headplane process.

*Type:* absolute path

*Default:* `"/var/lib/headplane/agent"`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.integration.proc` {#opt-services.headplane.settings.integration.proc}

Native process integration settings.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.integration.proc.enabled` {#opt-services.headplane.settings.integration.proc.enabled}

Enable "Native" integration that works when Headscale and
Headplane are running outside of a container. There is no additional
configuration, but you need to ensure that the Headplane process
can terminate the Headscale process.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.oidc` {#opt-services.headplane.settings.oidc}

OIDC Configuration for authentication.

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.oidc.authorization_endpoint` {#opt-services.headplane.settings.oidc.authorization_endpoint}

Custom authorization endpoint URL.

*Type:* null or string

*Default:* `null`

*Example:* `"https://provider.example.com/authorize"`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.oidc.client_id` {#opt-services.headplane.settings.oidc.client_id}

The client ID for the OIDC client.

*Type:* string

*Example:* `"your-client-id"`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.oidc.client_secret_path` {#opt-services.headplane.settings.oidc.client_secret_path}

Path to a file containing the OIDC client secret.

*Type:* null or absolute path

*Default:* `null`

*Example:* `config.sops.secrets.oidc_client_secret.path`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.oidc.disable_api_key_login` {#opt-services.headplane.settings.oidc.disable_api_key_login}

Whether to disable API key login.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.oidc.enabled` {#opt-services.headplane.settings.oidc.enabled}

Explicitly control OIDC availability.
Set to false to define OIDC config without enabling it.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.oidc.extra_params` {#opt-services.headplane.settings.oidc.extra_params}

Extra parameters to send to the OIDC provider.

*Type:* null or (attribute set of string)

*Default:* `null`

*Example:*

``` nix
{
  prompt = "consent";
}
```

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.oidc.issuer` {#opt-services.headplane.settings.oidc.issuer}

URL to OpenID issuer.

*Type:* string

*Example:* `"https://provider.example.com/issuer-url"`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.oidc.profile_picture_source` {#opt-services.headplane.settings.oidc.profile_picture_source}

Source for user profile pictures.

*Type:* one of "oidc", "gravatar"

*Default:* `"oidc"`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.oidc.scope` {#opt-services.headplane.settings.oidc.scope}

OIDC scope to request.

*Type:* string

*Default:* `"openid email profile"`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.oidc.token_endpoint` {#opt-services.headplane.settings.oidc.token_endpoint}

Custom token endpoint URL.

*Type:* null or string

*Default:* `null`

*Example:* `"https://provider.example.com/token"`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.oidc.token_endpoint_auth_method` {#opt-services.headplane.settings.oidc.token_endpoint_auth_method}

The token endpoint authentication method.
If not set, Headplane will auto-detect the best method
and fall back to client\_secret\_basic.

*Type:* null or one of "client\_secret\_post", "client\_secret\_basic", "client\_secret\_jwt"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.oidc.use_pkce` {#opt-services.headplane.settings.oidc.use_pkce}

Whether to use PKCE when authenticating users.
Your OIDC provider must support PKCE and it must be enabled on the client.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.oidc.userinfo_endpoint` {#opt-services.headplane.settings.oidc.userinfo_endpoint}

Custom userinfo endpoint URL.

*Type:* null or string

*Default:* `null`

*Example:* `"https://provider.example.com/userinfo"`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.server` {#opt-services.headplane.settings.server}

Server configuration for Headplane web application.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.server.base_url` {#opt-services.headplane.settings.server.base_url}

The base URL for Headplane. Used for OIDC redirect callback URL
detection. Should not include the dashboard prefix (/admin).

*Type:* null or string

*Default:* `null`

*Example:* `"https://headplane.example.com"`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.server.cookie_domain` {#opt-services.headplane.settings.server.cookie_domain}

Restrict the cookie to a specific domain.
This may not work as expected if not using a reverse proxy.

*Type:* null or string

*Default:* `null`

*Example:* `"example.com"`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.server.cookie_max_age` {#opt-services.headplane.settings.server.cookie_max_age}

The maximum age of the session cookie in seconds.

*Type:* positive integer, meaning \>0

*Default:* `86400`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.server.cookie_secret_path` {#opt-services.headplane.settings.server.cookie_secret_path}

Path to a file containing the cookie secret.
The secret must be exactly 32 characters long.

*Type:* null or absolute path

*Default:* `null`

*Example:* `config.sops.secrets.headplane_cookie.path`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.server.cookie_secure` {#opt-services.headplane.settings.server.cookie_secure}

Should the cookies only work over HTTPS?
Set to false if running via HTTP without a proxy.
Recommended to be true in production.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.server.data_path` {#opt-services.headplane.settings.server.data_path}

The path to persist Headplane specific data.
All data going forward is stored in this directory, including the internal database and any cache related files.

*Type:* absolute path

*Default:* `"/var/lib/headplane"`

*Example:* `"/var/lib/headplane"`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.server.host` {#opt-services.headplane.settings.server.host}

The host address to bind to.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.server.port` {#opt-services.headplane.settings.server.port}

The port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.server.proxy_auth` {#opt-services.headplane.settings.server.proxy_auth}

Delegate Headplane authentication to a trusted reverse proxy. See the
upstream [Proxy Authentication docs](https://github.com/tale/headplane/blob/main/docs/features/proxy-auth.md).

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.server.proxy_auth.allowed_cidrs` {#opt-services.headplane.settings.server.proxy_auth.allowed_cidrs}

Client CIDRs allowed to authenticate via the configured proxy
headers.

*Type:* list of string

*Default:*

``` nix
[
  "127.0.0.1/32"
  "::1/128"
]
```

*Example:*

``` nix
[
  "10.0.0.0/8"
]
```

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.server.proxy_auth.email_header` {#opt-services.headplane.settings.server.proxy_auth.email_header}

Optional header containing the authenticated user's email address.

*Type:* null or string

*Default:* `null`

*Example:* `"Remote-Email"`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.server.proxy_auth.enabled` {#opt-services.headplane.settings.server.proxy_auth.enabled}

Whether to enable delegating Headplane authentication to a trusted reverse proxy
instead of logging in through Headplane directly. Identity
headers are only trusted on requests whose client IP matches
`allowed_cidrs`; all Headscale API calls then use
`headscale.api_key_path`
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.server.proxy_auth.ip_header` {#opt-services.headplane.settings.server.proxy_auth.ip_header}

Header containing the original client IP, such as
`X-Forwarded-For` or `X-Real-IP`. Only read when the direct
socket peer matches `trusted_proxy_cidrs`.

*Type:* null or string

*Default:* `null`

*Example:* `"X-Forwarded-For"`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.server.proxy_auth.name_header` {#opt-services.headplane.settings.server.proxy_auth.name_header}

Optional header containing the authenticated user's display name.

*Type:* null or string

*Default:* `null`

*Example:* `"Remote-Name"`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.server.proxy_auth.picture_header` {#opt-services.headplane.settings.server.proxy_auth.picture_header}

Optional header containing the authenticated user's profile picture URL.

*Type:* null or string

*Default:* `null`

*Example:* `"Remote-Picture"`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.server.proxy_auth.trusted_proxy_cidrs` {#opt-services.headplane.settings.server.proxy_auth.trusted_proxy_cidrs}

Direct proxy CIDRs trusted to supply `ip_header`.

*Type:* list of string

*Default:*

``` nix
[
  "127.0.0.1/32"
  "::1/128"
]
```

*Example:*

``` nix
[
  "127.0.0.1/32"
]
```

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headplane.settings.server.proxy_auth.user_header` {#opt-services.headplane.settings.server.proxy_auth.user_header}

Header containing the stable authenticated user identity.

*Type:* string

*Default:* `"Remote-User"`

*Example:* `"Remote-User"`

*Declared by:* [`nixos/modules/services/networking/headplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headplane.nix)

## `services.headscale.address` {#opt-services.headscale.address}

Listening address of headscale.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.configFile` {#opt-services.headscale.configFile}

Path to the configuration file of headscale.

*Type:* absolute path

*Default:* `(pkgs.formats.yaml { }).generate "headscale.yaml" (lib.filterAttrsRecursive (n: v: v != null) config.services.headscale.settings)`

*Read only*

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.enable` {#opt-services.headscale.enable}

Whether to enable headscale, Open Source coordination server for Tailscale.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.group` {#opt-services.headscale.group}

Group under which headscale runs.

::: note
If left as the default value this group will automatically be created
on system activation, otherwise you are responsible for
ensuring the user exists before the headscale service starts.
:::

*Type:* string

*Default:* `"headscale"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.package` {#opt-services.headscale.package}

The headscale package to use.

*Type:* package

*Default:* `pkgs.headscale`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.port` {#opt-services.headscale.port}

Listening port of headscale.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Example:* `443`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings` {#opt-services.headscale.settings}

Overrides to `config.yaml` as a Nix attribute set.
Check the [example config](https://github.com/juanfont/headscale/blob/main/config-example.yaml)
for possible options.

*Type:* open submodule of (YAML 1.1 value)

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.database.postgres.host` {#opt-services.headscale.settings.database.postgres.host}

Database host address.

*Type:* null or string

*Default:* `null`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.database.postgres.name` {#opt-services.headscale.settings.database.postgres.name}

Database name.

*Type:* null or string

*Default:* `null`

*Example:* `"headscale"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.database.postgres.password_file` {#opt-services.headscale.settings.database.postgres.password_file}

A file containing the password corresponding to
`database.user`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/headscale-dbpassword"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.database.postgres.port` {#opt-services.headscale.settings.database.postgres.port}

Database host port.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Example:* `3306`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.database.postgres.user` {#opt-services.headscale.settings.database.postgres.user}

Database user.

*Type:* null or string

*Default:* `null`

*Example:* `"headscale"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.database.sqlite.path` {#opt-services.headscale.settings.database.sqlite.path}

Path to the sqlite3 database file.

*Type:* null or string

*Default:* `"/var/lib/headscale/db.sqlite"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.database.sqlite.write_ahead_log` {#opt-services.headscale.settings.database.sqlite.write_ahead_log}

Enable WAL mode for SQLite. This is recommended for production environments.
[https://www.sqlite.org/wal.html](https://www.sqlite.org/wal.html)

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.database.type` {#opt-services.headscale.settings.database.type}

Database engine to use.
Please note that using Postgres is highly discouraged as it is only supported for legacy reasons.
All new development, testing and optimisations are done with SQLite in mind.

*Type:* one of "sqlite", "sqlite3", "postgres"

*Default:* `"sqlite"`

*Example:* `"postgres"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.derp.auto_update_enabled` {#opt-services.headscale.settings.derp.auto_update_enabled}

Whether to automatically update DERP maps on a set frequency.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.derp.paths` {#opt-services.headscale.settings.derp.paths}

List of file paths containing DERP maps.
See [How Tailscale works](https://tailscale.com/blog/how-tailscale-works/) for more information on DERP maps.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.derp.server.private_key_path` {#opt-services.headscale.settings.derp.server.private_key_path}

Path to derp private key file, generated automatically if it does not exist.

*Type:* absolute path

*Default:* `"/var/lib/headscale/derp_server_private.key"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.derp.update_frequency` {#opt-services.headscale.settings.derp.update_frequency}

Frequency to update DERP maps.

*Type:* string

*Default:* `"24h"`

*Example:* `"5m"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.derp.urls` {#opt-services.headscale.settings.derp.urls}

List of urls containing DERP maps.
See [How Tailscale works](https://tailscale.com/blog/how-tailscale-works/) for more information on DERP maps.

*Type:* list of string

*Default:*

``` nix
[
  "https://controlplane.tailscale.com/derpmap/default"
]
```

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.dns.base_domain` {#opt-services.headscale.settings.dns.base_domain}

Defines the base domain to create the hostnames for MagicDNS.
This domain must be different from the `server_url`
domain.
`base_domain` must be a FQDN, without the trailing dot.
The FQDN of the hosts will be `hostname.base_domain` (e.g.
`myhost.tailnet.example.com`).

*Type:* string

*Default:* `""`

*Example:* `"tailnet.example.com"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.dns.extra_records` {#opt-services.headscale.settings.dns.extra_records}

Extra DNS records to expose to clients.

*Type:* null or (list of (submodule))

*Default:* `null`

*Example:*

``` nix
''
  [ {
    name = "grafana.tailnet.example.com";
    type = "A";
    example = "100.64.0.3";
  } ]
''
```

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.dns.extra_records.*.name` {#opt-services.headscale.settings.dns.extra_records._.name}

DNS record name.

*Type:* string

*Example:* `"grafana.tailnet.example.com"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.dns.extra_records.*.type` {#opt-services.headscale.settings.dns.extra_records._.type}

DNS record type.

*Type:* one of "A", "AAAA"

*Example:* `"A"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.dns.extra_records.*.value` {#opt-services.headscale.settings.dns.extra_records._.value}

DNS record value (IP address).

*Type:* string

*Example:* `"100.64.0.3"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.dns.extra_records_path` {#opt-services.headscale.settings.dns.extra_records_path}

Path to a JSON file containing extra DNS records.
This is mutually exclusive with `extra_records`.

*Type:* null or string

*Default:* `null`

*Example:* `"/run/headscale/records.json"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.dns.magic_dns` {#opt-services.headscale.settings.dns.magic_dns}

Whether to use [MagicDNS](https://tailscale.com/kb/1081/magicdns/).

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.dns.nameservers.global` {#opt-services.headscale.settings.dns.nameservers.global}

List of nameservers to pass to Tailscale clients.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.dns.nameservers.split` {#opt-services.headscale.settings.dns.nameservers.split}

Split DNS configuration (map of domains and which DNS server to use for each).
See [https://tailscale.com/kb/1054/dns/](https://tailscale.com/kb/1054/dns/).

*Type:* attribute set of list of string

*Default:* `{ }`

*Example:*

``` nix
{
  "foo.bar.com" = [
    "1.1.1.1"
  ];
}
```

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.dns.override_local_dns` {#opt-services.headscale.settings.dns.override_local_dns}

Whether to [override clients' DNS servers](https://tailscale.com/kb/1054/dns#override-dns-servers).

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.dns.search_domains` {#opt-services.headscale.settings.dns.search_domains}

Search domains to inject to Tailscale clients.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "mydomain.internal"
]
```

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.log.format` {#opt-services.headscale.settings.log.format}

headscale log format.

*Type:* string

*Default:* `"text"`

*Example:* `"json"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.log.level` {#opt-services.headscale.settings.log.level}

headscale log level.

*Type:* string

*Default:* `"info"`

*Example:* `"debug"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.node.ephemeral.inactivity_timeout` {#opt-services.headscale.settings.node.ephemeral.inactivity_timeout}

Time before an inactive ephemeral node is deleted.

*Type:* string

*Default:* `"30m"`

*Example:* `"5m"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.noise.private_key_path` {#opt-services.headscale.settings.noise.private_key_path}

Path to noise private key file, generated automatically if it does not exist.

*Type:* absolute path

*Default:* `"/var/lib/headscale/noise_private.key"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.oidc.allowed_domains` {#opt-services.headscale.settings.oidc.allowed_domains}

Allowed principal domains. if an authenticated user's domain
is not in this list authentication request will be rejected.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "example.com"
]
```

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.oidc.allowed_users` {#opt-services.headscale.settings.oidc.allowed_users}

Users allowed to authenticate even if not in allowedDomains.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "alice@example.com"
]
```

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.oidc.client_id` {#opt-services.headscale.settings.oidc.client_id}

OpenID Connect client ID.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.oidc.client_secret_path` {#opt-services.headscale.settings.oidc.client_secret_path}

Path to OpenID Connect client secret file. Expands environment variables in format ${VAR}.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.oidc.extra_params` {#opt-services.headscale.settings.oidc.extra_params}

Custom query parameters to send with the Authorize Endpoint request.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  domain_hint = "example.com";
}
```

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.oidc.issuer` {#opt-services.headscale.settings.oidc.issuer}

URL to OpenID issuer.

*Type:* string

*Default:* `""`

*Example:* `"https://openid.example.com"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.oidc.pkce.enabled` {#opt-services.headscale.settings.oidc.pkce.enabled}

Enable or disable PKCE (Proof Key for Code Exchange) support.
PKCE adds an additional layer of security to the OAuth 2.0
authorization code flow by preventing authorization code
interception attacks
See https://datatracker.ietf.org/doc/html/rfc7636

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.oidc.pkce.method` {#opt-services.headscale.settings.oidc.pkce.method}

PKCE method to use:

- plain: Use plain code verifier
- S256: Use SHA256 hashed code verifier (default, recommended)

*Type:* string

*Default:* `"S256"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.oidc.scope` {#opt-services.headscale.settings.oidc.scope}

Scopes used in the OIDC flow.

*Type:* list of string

*Default:*

``` nix
[
  "openid"
  "profile"
  "email"
]
```

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.policy.mode` {#opt-services.headscale.settings.policy.mode}

The mode can be "file" or "database" that defines
where the ACL policies are stored and read from.

*Type:* one of "file", "database"

*Default:* `"file"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.policy.path` {#opt-services.headscale.settings.policy.path}

If the mode is set to "file", the path to a
HuJSON file containing ACL policies.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.prefixes.allocation` {#opt-services.headscale.settings.prefixes.allocation}

Strategy used for allocation of IPs to nodes, available options:

- sequential (default): assigns the next free IP from the previous given IP.
- random: assigns the next free IP from a pseudo-random IP generator (crypto/rand).

*Type:* one of "sequential", "random"

*Default:* `"sequential"`

*Example:* `"random"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.prefixes.v4` {#opt-services.headscale.settings.prefixes.v4}

Each prefix consists of either an IPv4 or IPv6 address,
and the associated prefix length, delimited by a slash.
It must be within IP ranges supported by the Tailscale
client - i.e., subnets of 100.64.0.0/10 and fd7a:115c:a1e0::/48.

*Type:* string

*Default:* `"100.64.0.0/10"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.prefixes.v6` {#opt-services.headscale.settings.prefixes.v6}

Each prefix consists of either an IPv4 or IPv6 address,
and the associated prefix length, delimited by a slash.
It must be within IP ranges supported by the Tailscale
client - i.e., subnets of 100.64.0.0/10 and fd7a:115c:a1e0::/48.

*Type:* string

*Default:* `"fd7a:115c:a1e0::/48"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.server_url` {#opt-services.headscale.settings.server_url}

The url clients will connect to.

*Type:* string

*Default:* `"http://127.0.0.1:8080"`

*Example:* `"https://myheadscale.example.com:443"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.tls_cert_path` {#opt-services.headscale.settings.tls_cert_path}

Path to already created certificate.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.tls_key_path` {#opt-services.headscale.settings.tls_key_path}

Path to key for already created certificate.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.tls_letsencrypt_challenge_type` {#opt-services.headscale.settings.tls_letsencrypt_challenge_type}

Type of ACME challenge to use, currently supported types:
`HTTP-01` or `TLS-ALPN-01`.

*Type:* one of "TLS-ALPN-01", "HTTP-01"

*Default:* `"HTTP-01"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.tls_letsencrypt_hostname` {#opt-services.headscale.settings.tls_letsencrypt_hostname}

Domain name to request a TLS certificate for.

*Type:* null or string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.settings.tls_letsencrypt_listen` {#opt-services.headscale.settings.tls_letsencrypt_listen}

When HTTP-01 challenge is chosen, letsencrypt must set up a
verification endpoint, and it will be listening on:
`:http = port 80`.

*Type:* null or string

*Default:* `":http"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.headscale.user` {#opt-services.headscale.user}

User account under which headscale runs.

::: note
If left as the default value this user will automatically be created
on system activation, otherwise you are responsible for
ensuring the user exists before the headscale service starts.
:::

*Type:* string

*Default:* `"headscale"`

*Declared by:* [`nixos/modules/services/networking/headscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/headscale.nix)

## `services.healthchecks.dataDir` {#opt-services.healthchecks.dataDir}

The directory used to store all data for healthchecks.

::: note
If left as the default value this directory will automatically be created before
the healthchecks server starts, otherwise you are responsible for ensuring the
directory exists with appropriate ownership and permissions.
:::

*Type:* string

*Default:* `"/var/lib/healthchecks"`

*Declared by:* [`nixos/modules/services/web-apps/healthchecks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/healthchecks.nix)

## `services.healthchecks.enable` {#opt-services.healthchecks.enable}

Enable healthchecks.
It is expected to be run behind a HTTP reverse proxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/healthchecks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/healthchecks.nix)

## `services.healthchecks.group` {#opt-services.healthchecks.group}

Group account under which healthchecks runs.

::: note
If left as the default value this group will automatically be created
on system activation, otherwise you are responsible for
ensuring the group exists before the healthchecks service starts.
:::

*Type:* string

*Default:* `"healthchecks"`

*Declared by:* [`nixos/modules/services/web-apps/healthchecks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/healthchecks.nix)

## `services.healthchecks.listenAddress` {#opt-services.healthchecks.listenAddress}

Address the server will listen on.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/healthchecks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/healthchecks.nix)

## `services.healthchecks.package` {#opt-services.healthchecks.package}

The healthchecks package to use.

*Type:* package

*Default:* `pkgs.healthchecks`

*Declared by:* [`nixos/modules/services/web-apps/healthchecks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/healthchecks.nix)

## `services.healthchecks.port` {#opt-services.healthchecks.port}

Port the server will listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8000`

*Declared by:* [`nixos/modules/services/web-apps/healthchecks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/healthchecks.nix)

## `services.healthchecks.settings` {#opt-services.healthchecks.settings}

Environment variables which are read by healthchecks `(local)_settings.py`.

Settings which are explicitly covered in options below, are type-checked and/or transformed
before added to the environment, everything else is passed as a string.

See [https://healthchecks.io/docs/self\_hosted\_configuration/](https://healthchecks.io/docs/self_hosted_configuration/)
for a full documentation of settings.

We add additional variables to this list inside the packages `local_settings.py.`

- `STATIC_ROOT` to set a state directory for dynamically generated static files.
- `SECRET_KEY_FILE` to read `SECRET_KEY` from a file at runtime and keep it out of
  /nix/store.
- `_FILE` variants for several values that hold sensitive information in
  [Healthchecks configuration](https://healthchecks.io/docs/self_hosted_configuration/) so
  that they also can be read from a file and kept out of /nix/store. To see which values
  have support for a `_FILE` variant, run:
  - `nix-instantiate --eval --expr '(import <nixpkgs> {}).healthchecks.secrets'`
  - or `nix eval 'nixpkgs#healthchecks.secrets'` if the flake support has been enabled.

If the same variable is set in both `settings` and `settingsFile` the value from `settingsFile` has priority.

*Type:* open submodule of attribute set of string

*Declared by:* [`nixos/modules/services/web-apps/healthchecks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/healthchecks.nix)

## `services.healthchecks.settings.ALLOWED_HOSTS` {#opt-services.healthchecks.settings.ALLOWED_HOSTS}

The host/domain names that this site can serve.

*Type:* list of string

*Default:*

``` nix
[
  "*"
]
```

*Declared by:* [`nixos/modules/services/web-apps/healthchecks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/healthchecks.nix)

## `services.healthchecks.settings.DB` {#opt-services.healthchecks.settings.DB}

Database engine to use.

*Type:* one of "sqlite", "postgres", "mysql"

*Default:* `"sqlite"`

*Declared by:* [`nixos/modules/services/web-apps/healthchecks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/healthchecks.nix)

## `services.healthchecks.settings.DB_NAME` {#opt-services.healthchecks.settings.DB_NAME}

Database name.

*Type:* string

*Default:*

``` nix
if config.services.healthchecks.settings.DB == "sqlite"
then "${config.services.healthchecks.dataDir}/healthchecks.sqlite"
else "hc"
```

*Declared by:* [`nixos/modules/services/web-apps/healthchecks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/healthchecks.nix)

## `services.healthchecks.settings.DEBUG` {#opt-services.healthchecks.settings.DEBUG}

Enable debug mode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/healthchecks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/healthchecks.nix)

## `services.healthchecks.settings.REGISTRATION_OPEN` {#opt-services.healthchecks.settings.REGISTRATION_OPEN}

A boolean that controls whether site visitors can create new accounts.
Set it to false if you are setting up a private Healthchecks instance,
but it needs to be publicly accessible (so, for example, your cloud
services can send pings to it).
If you close new user registration, you can still selectively invite
users to your team account.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/healthchecks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/healthchecks.nix)

## `services.healthchecks.settings.SECRET_KEY_FILE` {#opt-services.healthchecks.settings.SECRET_KEY_FILE}

Path to a file containing the secret key.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/healthchecks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/healthchecks.nix)

## `services.healthchecks.settingsFile` {#opt-services.healthchecks.settingsFile}

Environment variables which are read by healthchecks `(local)_settings.py`.

Settings which are explicitly covered in options below, are type-checked and/or transformed
before added to the environment, everything else is passed as a string.

See [https://healthchecks.io/docs/self\_hosted\_configuration/](https://healthchecks.io/docs/self_hosted_configuration/)
for a full documentation of settings.

We add additional variables to this list inside the packages `local_settings.py.`

- `STATIC_ROOT` to set a state directory for dynamically generated static files.
- `SECRET_KEY_FILE` to read `SECRET_KEY` from a file at runtime and keep it out of
  /nix/store.
- `_FILE` variants for several values that hold sensitive information in
  [Healthchecks configuration](https://healthchecks.io/docs/self_hosted_configuration/) so
  that they also can be read from a file and kept out of /nix/store. To see which values
  have support for a `_FILE` variant, run:
  - `nix-instantiate --eval --expr '(import <nixpkgs> {}).healthchecks.secrets'`
  - or `nix eval 'nixpkgs#healthchecks.secrets'` if the flake support has been enabled.

If the same variable is set in both `settings` and `settingsFile` the value from `settingsFile` has priority.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/healthchecks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/healthchecks.nix)

## `services.healthchecks.user` {#opt-services.healthchecks.user}

User account under which healthchecks runs.

::: note
If left as the default value this user will automatically be created
on system activation, otherwise you are responsible for
ensuring the user exists before the healthchecks service starts.
:::

*Type:* string

*Default:* `"healthchecks"`

*Declared by:* [`nixos/modules/services/web-apps/healthchecks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/healthchecks.nix)

## `services.heapster.enable` {#opt-services.heapster.enable}

Whether to enable Heapster monitoring.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/heapster.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/heapster.nix)

## `services.heapster.extraOpts` {#opt-services.heapster.extraOpts}

Heapster extra options

*Type:* strings concatenated with " "

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/heapster.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/heapster.nix)

## `services.heapster.package` {#opt-services.heapster.package}

The heapster package to use.

*Type:* package

*Default:* `pkgs.heapster`

*Declared by:* [`nixos/modules/services/monitoring/heapster.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/heapster.nix)

## `services.heapster.sink` {#opt-services.heapster.sink}

Heapster metic sink

*Type:* string

*Example:* `"influxdb:http://localhost:8086"`

*Declared by:* [`nixos/modules/services/monitoring/heapster.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/heapster.nix)

## `services.heapster.source` {#opt-services.heapster.source}

Heapster metric source

*Type:* string

*Example:* `"kubernetes:https://kubernetes.default"`

*Declared by:* [`nixos/modules/services/monitoring/heapster.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/heapster.nix)

## `services.heartbeat.enable` {#opt-services.heartbeat.enable}

Whether to enable heartbeat, uptime monitoring.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/logging/heartbeat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/heartbeat.nix)

## `services.heartbeat.extraConfig` {#opt-services.heartbeat.extraConfig}

Any other configuration options you want to add

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  heartbeat.monitors:
  - type: http
    urls: ["http://localhost:9200"]
    schedule: '@every 10s'
''
```

*Declared by:* [`nixos/modules/services/logging/heartbeat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/heartbeat.nix)

## `services.heartbeat.name` {#opt-services.heartbeat.name}

Name of the beat

*Type:* string

*Default:* `"heartbeat"`

*Declared by:* [`nixos/modules/services/logging/heartbeat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/heartbeat.nix)

## `services.heartbeat.package` {#opt-services.heartbeat.package}

The heartbeat package to use.

*Type:* package

*Default:* `pkgs.heartbeat`

*Example:* `heartbeat7`

*Declared by:* [`nixos/modules/services/logging/heartbeat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/heartbeat.nix)

## `services.heartbeat.stateDir` {#opt-services.heartbeat.stateDir}

The state directory. heartbeat's own logs and other data are stored here.

*Type:* string

*Default:* `"/var/lib/heartbeat"`

*Declared by:* [`nixos/modules/services/logging/heartbeat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/heartbeat.nix)

## `services.heartbeat.tags` {#opt-services.heartbeat.tags}

Tags to place on the shipped log messages

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/logging/heartbeat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/heartbeat.nix)

## `services.hebbot.botPasswordFile` {#opt-services.hebbot.botPasswordFile}

A path to the password file for your bot.

Consider using a path that does not end up in your Nix store
as it would be world readable.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/matrix/hebbot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/hebbot.nix)

## `services.hebbot.enable` {#opt-services.hebbot.enable}

Whether to enable hebbot.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/hebbot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/hebbot.nix)

## `services.hebbot.package` {#opt-services.hebbot.package}

The hebbot package to use.

*Type:* package

*Default:* `pkgs.hebbot`

*Declared by:* [`nixos/modules/services/matrix/hebbot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/hebbot.nix)

## `services.hebbot.settings` {#opt-services.hebbot.settings}

Configuration for Hebbot, see, for examples:

- [https://github.com/matrix-org/twim-config/blob/master/config.toml](https://github.com/matrix-org/twim-config/blob/master/config.toml)
- [https://gitlab.gnome.org/Teams/Websites/thisweek.gnome.org/-/blob/main/hebbot/config.toml](https://gitlab.gnome.org/Teams/Websites/thisweek.gnome.org/-/blob/main/hebbot/config.toml)

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/matrix/hebbot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/hebbot.nix)

## `services.hebbot.templates.project` {#opt-services.hebbot.templates.project}

A path to the Markdown file for the project template.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/matrix/hebbot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/hebbot.nix)

## `services.hebbot.templates.report` {#opt-services.hebbot.templates.report}

A path to the Markdown file for the report template.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/matrix/hebbot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/hebbot.nix)

## `services.hebbot.templates.section` {#opt-services.hebbot.templates.section}

A path to the Markdown file for the section template.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/matrix/hebbot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/hebbot.nix)

## `services.hedgedoc.configureNginx` {#opt-services.hedgedoc.configureNginx}

Whether to configure nginx as a reverse proxy.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/hedgedoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hedgedoc.nix)

## `services.hedgedoc.enable` {#opt-services.hedgedoc.enable}

Whether to enable the HedgeDoc Markdown Editor.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/hedgedoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hedgedoc.nix)

## `services.hedgedoc.environmentFile` {#opt-services.hedgedoc.environmentFile}

Environment file as defined in `systemd.exec(5)`.

Secrets may be passed to the service without adding them to the world-readable
Nix store, by specifying placeholder variables as the option value in Nix and
setting these variables accordingly in the environment file.

Snippet of HedgeDoc config containing a secret:

```
services.hedgedoc.settings.dbURL = "postgres://hedgedoc:\${DB_PASSWORD}@db-host:5432/hedgedocdb";
```

and the content of this environment file:

````
  DB_PASSWORD=verysecretdbpassword
```
````

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/hedgedoc/hedgedoc.env"`

*Declared by:* [`nixos/modules/services/web-apps/hedgedoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hedgedoc.nix)

## `services.hedgedoc.package` {#opt-services.hedgedoc.package}

The hedgedoc package to use.

*Type:* package

*Default:* `pkgs.hedgedoc`

*Declared by:* [`nixos/modules/services/web-apps/hedgedoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hedgedoc.nix)

## `services.hedgedoc.settings` {#opt-services.hedgedoc.settings}

HedgeDoc configuration, see
[https://docs.hedgedoc.org/configuration/](https://docs.hedgedoc.org/configuration/)
for documentation.

*Type:* open submodule of (JSON value)

*Declared by:* [`nixos/modules/services/web-apps/hedgedoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hedgedoc.nix)

## `services.hedgedoc.settings.allowGravatar` {#opt-services.hedgedoc.settings.allowGravatar}

Whether to enable [Libravatar](https://wiki.libravatar.org/) as
profile picture source on your instance.

Despite the naming of the setting, Hedgedoc replaced Gravatar
with Libravatar in [CodiMD 1.4.0](https://hedgedoc.org/releases/1.4.0/)

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/hedgedoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hedgedoc.nix)

## `services.hedgedoc.settings.allowOrigin` {#opt-services.hedgedoc.settings.allowOrigin}

List of domains to whitelist.

*Type:* list of string

*Default:*

``` nix
with config.services.hedgedoc.settings; [ host ] ++ lib.optionals (domain != null) [ domain ]
```

*Example:*

``` nix
[
  "localhost"
  "hedgedoc.org"
]
```

*Declared by:* [`nixos/modules/services/web-apps/hedgedoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hedgedoc.nix)

## `services.hedgedoc.settings.db` {#opt-services.hedgedoc.settings.db}

Specify the configuration for sequelize.
HedgeDoc supports `mysql`, `postgres`, `sqlite` and `mssql`.
See [https://sequelize.readthedocs.io/en/v3/](https://sequelize.readthedocs.io/en/v3/) for more information.

::: note
The relevant parts will be overridden if you set `dbURL`.
:::

::: note
The `sqlite` backend only supports paths under `/var/lib/hedgedoc`.
:::

*Type:* attribute set

*Default:*

``` nix
{
  dialect = "sqlite";
  storage = "/var/lib/hedgedoc/db.sqlite";
}
```

*Example:*

``` nix
db = {
  username = "hedgedoc";
  database = "hedgedoc";
  host = "localhost:5432";
  # or via socket
  # host = "/run/postgresql";
  dialect = "postgresql";
};
```

*Declared by:* [`nixos/modules/services/web-apps/hedgedoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hedgedoc.nix)

## `services.hedgedoc.settings.domain` {#opt-services.hedgedoc.settings.domain}

Domain to use for website.

This is useful if you are trying to run hedgedoc behind
a reverse proxy.

*Type:* null or string

*Default:* `null`

*Example:* `"hedgedoc.org"`

*Declared by:* [`nixos/modules/services/web-apps/hedgedoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hedgedoc.nix)

## `services.hedgedoc.settings.host` {#opt-services.hedgedoc.settings.host}

Address to listen on.

*Type:* null or string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/hedgedoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hedgedoc.nix)

## `services.hedgedoc.settings.path` {#opt-services.hedgedoc.settings.path}

Path to UNIX domain socket to listen on

::: note
If specified, `host` and `port` will be ignored.
:::

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/hedgedoc/hedgedoc.sock"`

*Declared by:* [`nixos/modules/services/web-apps/hedgedoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hedgedoc.nix)

## `services.hedgedoc.settings.port` {#opt-services.hedgedoc.settings.port}

Port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Example:* `80`

*Declared by:* [`nixos/modules/services/web-apps/hedgedoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hedgedoc.nix)

## `services.hedgedoc.settings.protocolUseSSL` {#opt-services.hedgedoc.settings.protocolUseSSL}

Use `https://` for all links.

This is useful if you are trying to run hedgedoc behind
a reverse proxy.

::: note
Only applied if `domain` is set.
:::

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/hedgedoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hedgedoc.nix)

## `services.hedgedoc.settings.uploadsPath` {#opt-services.hedgedoc.settings.uploadsPath}

Directory for storing uploaded images.

*Type:* absolute path

*Default:* `"/var/lib/hedgedoc/uploads"`

*Declared by:* [`nixos/modules/services/web-apps/hedgedoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hedgedoc.nix)

## `services.hedgedoc.settings.urlPath` {#opt-services.hedgedoc.settings.urlPath}

URL path for the website.

This is useful if you are hosting hedgedoc on a path like
`www.example.com/hedgedoc`

*Type:* null or string

*Default:* `null`

*Example:* `"hedgedoc"`

*Declared by:* [`nixos/modules/services/web-apps/hedgedoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hedgedoc.nix)

## `services.hedgedoc.settings.useSSL` {#opt-services.hedgedoc.settings.useSSL}

Enable to use SSL server.

::: note
This will also enable `protocolUseSSL`.

It will also require you to set the following:

- `sslKeyPath`
- `sslCertPath`
- `sslCAPath`
- `dhParamPath`
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/hedgedoc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hedgedoc.nix)

## `services.heisenbridge.address` {#opt-services.heisenbridge.address}

Address to listen on. IPv6 does not seem to be supported.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/heisenbridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/heisenbridge.nix)

## `services.heisenbridge.debug` {#opt-services.heisenbridge.debug}

More verbose logging. Recommended during initial setup.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/heisenbridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/heisenbridge.nix)

## `services.heisenbridge.enable` {#opt-services.heisenbridge.enable}

Whether to enable the Matrix to IRC bridge.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/heisenbridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/heisenbridge.nix)

## `services.heisenbridge.extraArgs` {#opt-services.heisenbridge.extraArgs}

Heisenbridge is configured over the command line. Append extra arguments here

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/heisenbridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/heisenbridge.nix)

## `services.heisenbridge.homeserver` {#opt-services.heisenbridge.homeserver}

The URL to the home server for client-server API calls

*Type:* string

*Example:* `"http://localhost:8008"`

*Declared by:* [`nixos/modules/services/misc/heisenbridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/heisenbridge.nix)

## `services.heisenbridge.identd.enable` {#opt-services.heisenbridge.identd.enable}

Whether to enable identd service support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/heisenbridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/heisenbridge.nix)

## `services.heisenbridge.identd.port` {#opt-services.heisenbridge.identd.port}

identd listen port

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `113`

*Declared by:* [`nixos/modules/services/misc/heisenbridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/heisenbridge.nix)

## `services.heisenbridge.namespaces` {#opt-services.heisenbridge.namespaces}

Configure the 'namespaces' section of the registration.yml for the bridge and the server

*Type:* open submodule of (JSON value)

*Default:*

``` nix
{
  aliases = [ ];
  rooms = [ ];
  users = [
    {
      exclusive = true;
      regex = "@irc_.*";
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/misc/heisenbridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/heisenbridge.nix)

## `services.heisenbridge.owner` {#opt-services.heisenbridge.owner}

Set owner MXID otherwise first talking local user will claim the bridge

*Type:* null or string

*Default:* `null`

*Example:* `"@admin:example.org"`

*Declared by:* [`nixos/modules/services/misc/heisenbridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/heisenbridge.nix)

## `services.heisenbridge.package` {#opt-services.heisenbridge.package}

The heisenbridge package to use.

*Type:* package

*Default:* `pkgs.heisenbridge`

*Declared by:* [`nixos/modules/services/misc/heisenbridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/heisenbridge.nix)

## `services.heisenbridge.port` {#opt-services.heisenbridge.port}

The port to listen on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9898`

*Declared by:* [`nixos/modules/services/misc/heisenbridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/heisenbridge.nix)

## `services.heisenbridge.registrationUrl` {#opt-services.heisenbridge.registrationUrl}

The URL where the application service is listening for HS requests, from the Matrix HS perspective.#
The default value assumes the bridge runs on the same host as the home server, in the same network.

*Type:* string

*Default:* `"http://$\${cfg.address}:$\${toString cfg.port}"`

*Example:* `"https://matrix.example.org"`

*Declared by:* [`nixos/modules/services/misc/heisenbridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/heisenbridge.nix)

## `services.hercules-ci-agent.enable` {#opt-services.hercules-ci-agent.enable}

Enable to run Hercules CI Agent as a system service.

[Hercules CI](https://hercules-ci.com) is a
continuous integation service that is centered around Nix.

Support is available at [help@hercules-ci.com](mailto:help@hercules-ci.com).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix)

## `services.hercules-ci-agent.package` {#opt-services.hercules-ci-agent.package}

The hercules-ci-agent package to use.

*Type:* package

*Default:* `pkgs.hercules-ci-agent`

*Declared by:* [`nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix)

## `services.hercules-ci-agent.settings` {#opt-services.hercules-ci-agent.settings}

These settings are written to the `agent.toml` file.

Not all settings are listed as options, can be set nonetheless.

For the exhaustive list of settings, see [https://docs.hercules-ci.com/hercules-ci/reference/agent-config/](https://docs.hercules-ci.com/hercules-ci/reference/agent-config/).

*Type:* open submodule of (TOML value)

*Declared by:* [`nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix)

## `services.hercules-ci-agent.settings.apiBaseUrl` {#opt-services.hercules-ci-agent.settings.apiBaseUrl}

API base URL that the agent will connect to.

When using Hercules CI Enterprise, set this to the URL where your
Hercules CI server is reachable.

*Type:* string

*Default:* `"https://hercules-ci.com"`

*Declared by:* [`nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix)

## `services.hercules-ci-agent.settings.baseDirectory` {#opt-services.hercules-ci-agent.settings.baseDirectory}

State directory (secrets, work directory, etc) for agent

*Type:* absolute path

*Default:* `"/var/lib/hercules-ci-agent"`

*Declared by:* [`nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix)

## `services.hercules-ci-agent.settings.binaryCachesPath` {#opt-services.hercules-ci-agent.settings.binaryCachesPath}

Path to a JSON file containing binary cache secret keys.

As these values are confidential, they should not be in the store, but
copied over using other means, such as agenix, NixOps
`deployment.keys`, or manual installation.

The format is described on [https://docs.hercules-ci.com/hercules-ci-agent/binary-caches-json/](https://docs.hercules-ci.com/hercules-ci-agent/binary-caches-json/).

*Type:* absolute path

*Default:* `staticSecretsDirectory + "/binary-caches.json"`

*Declared by:* [`nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix)

## `services.hercules-ci-agent.settings.clusterJoinTokenPath` {#opt-services.hercules-ci-agent.settings.clusterJoinTokenPath}

Location of the cluster-join-token.key file.

You can retrieve the contents of the file when creating a new agent via
[https://hercules-ci.com/dashboard](https://hercules-ci.com/dashboard).

As this value is confidential, it should not be in the store, but
installed using other means, such as agenix, NixOps
`deployment.keys`, or manual installation.

The contents of the file are used for authentication between the agent and the API.

*Type:* absolute path

*Default:* `staticSecretsDirectory + "/cluster-join-token.key"`

*Declared by:* [`nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix)

## `services.hercules-ci-agent.settings.concurrentTasks` {#opt-services.hercules-ci-agent.settings.concurrentTasks}

Number of tasks to perform simultaneously.

A task is a single derivation build, an evaluation or an effect run.
At minimum, you need 2 concurrent tasks for `x86_64-linux`
in your cluster, to allow for import from derivation.

`concurrentTasks` can be around the CPU core count or lower if memory is
the bottleneck.

The optimal value depends on the resource consumption characteristics of your workload,
including memory usage and in-task parallelism. This is typically determined empirically.

When scaling, it is generally better to have a double-size machine than two machines,
because each split of resources causes inefficiencies; particularly with regards
to build latency because of extra downloads.

*Type:* positive integer, meaning \>0, or value "auto" (singular enum)

*Default:* `"auto"`, meaning equal to the number of CPU cores.

*Declared by:* [`nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix)

## `services.hercules-ci-agent.settings.labels` {#opt-services.hercules-ci-agent.settings.labels}

A key-value map of user data.

This data will be available to organization members in the dashboard and API.

The values can be of any TOML type that corresponds to a JSON type, but arrays
can not contain tables/objects due to limitations of the TOML library. Values
involving arrays of non-primitive types may not be representable currently.

*Type:* TOML value

*Default:*

``` nix
{
  agent.source = "..."; # One of "nixpkgs", "flake", "override"
  lib.version = "...";
  pkgs.version = "...";
}
```

*Declared by:* [`nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix)

## `services.hercules-ci-agent.settings.secretsJsonPath` {#opt-services.hercules-ci-agent.settings.secretsJsonPath}

Path to a JSON file containing secrets for effects.

As these values are confidential, they should not be in the store, but
copied over using other means, such as agenix, NixOps
`deployment.keys`, or manual installation.

The format is described on [https://docs.hercules-ci.com/hercules-ci-agent/secrets-json/](https://docs.hercules-ci.com/hercules-ci-agent/secrets-json/).

*Type:* absolute path

*Default:* `staticSecretsDirectory + "/secrets.json"`

*Declared by:* [`nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix)

## `services.hercules-ci-agent.settings.staticSecretsDirectory` {#opt-services.hercules-ci-agent.settings.staticSecretsDirectory}

This is the default directory to look for statically configured secrets like `cluster-join-token.key`.

See also `clusterJoinTokenPath` and `binaryCachesPath` for fine-grained configuration.

*Type:* absolute path

*Default:* `baseDirectory + "/secrets"`

*Declared by:* [`nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix)

## `services.hercules-ci-agent.settings.workDirectory` {#opt-services.hercules-ci-agent.settings.workDirectory}

The directory in which temporary subdirectories are created for task state. This includes sources for Nix evaluation.

*Type:* absolute path

*Default:* `baseDirectory + "/work"`

*Declared by:* [`nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hercules-ci-agent/common.nix)

## `services.hickory-dns.configFile` {#opt-services.hickory-dns.configFile}

Path to an existing toml file to configure hickory-dns with.

This can usually be left unspecified, in which case it will be
generated from the values in `settings`.
If manually specified, then the options in `settings` are ignored.

*Type:* absolute path

*Default:*

``` nix
let toml = pkgs.formats.toml { }; in toml.generate "hickory-dns.toml" cfg.settings
```

*Declared by:* [`nixos/modules/services/networking/hickory-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hickory-dns.nix)

## `services.hickory-dns.debug` {#opt-services.hickory-dns.debug}

Log DEBUG, INFO, WARN and ERROR messages.
This option is mutually exclusive with the `debug` option.
If neither `quiet` nor `debug` are enabled, logging defaults to the INFO level.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/hickory-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hickory-dns.nix)

## `services.hickory-dns.enable` {#opt-services.hickory-dns.enable}

Whether to enable hickory-dns.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/hickory-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hickory-dns.nix)

## `services.hickory-dns.package` {#opt-services.hickory-dns.package}

The hickory-dns package to use. ::: {.note}
The package must provide `meta.mainProgram` which names the server binary; any other utilities (client, resolver) are not needed.
:::

*Type:* package

*Default:* `pkgs.hickory-dns`

*Declared by:* [`nixos/modules/services/networking/hickory-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hickory-dns.nix)

## `services.hickory-dns.quiet` {#opt-services.hickory-dns.quiet}

Log ERROR level messages only.
This option is mutually exclusive with the `debug` option.
If neither `quiet` nor `debug` are enabled, logging defaults to the INFO level.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/hickory-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hickory-dns.nix)

## `services.hickory-dns.settings` {#opt-services.hickory-dns.settings}

Settings for hickory-dns. The options enumerated here are not exhaustive.
Refer to upstream documentation for all available options:

- [Example settings](https://github.com/hickory-dns/hickory-dns/blob/main/tests/test-data/test_configs/example.toml)

*Type:* open submodule of (TOML value)

*Declared by:* [`nixos/modules/services/networking/hickory-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hickory-dns.nix)

## `services.hickory-dns.settings.directory` {#opt-services.hickory-dns.settings.directory}

The directory in which hickory-dns should look for .zone files,
whenever zones aren't specified by absolute path.

*Type:* string

*Default:* `"/var/lib/hickory-dns"`

*Declared by:* [`nixos/modules/services/networking/hickory-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hickory-dns.nix)

## `services.hickory-dns.settings.listen_addrs_ipv4` {#opt-services.hickory-dns.settings.listen_addrs_ipv4}

List of ipv4 addresses on which to listen for DNS queries.

*Type:* list of string

*Default:*

``` nix
[
  "0.0.0.0"
]
```

*Declared by:* [`nixos/modules/services/networking/hickory-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hickory-dns.nix)

## `services.hickory-dns.settings.listen_addrs_ipv6` {#opt-services.hickory-dns.settings.listen_addrs_ipv6}

List of ipv6 addresses on which to listen for DNS queries.

*Type:* list of string

*Default:* `lib.optional config.networking.enableIPv6 "::0"`

*Declared by:* [`nixos/modules/services/networking/hickory-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hickory-dns.nix)

## `services.hickory-dns.settings.listen_port` {#opt-services.hickory-dns.settings.listen_port}

Port to listen on (applies to all listen addresses).

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `53`

*Declared by:* [`nixos/modules/services/networking/hickory-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hickory-dns.nix)

## `services.hickory-dns.settings.zones` {#opt-services.hickory-dns.settings.zones}

List of zones to serve.

*Type:* list of ((open submodule of (TOML value)) or string convertible to it)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/hickory-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hickory-dns.nix)

## `services.hickory-dns.settings.zones.*.file` {#opt-services.hickory-dns.settings.zones._.file}

Path to the .zone file.
If not fully-qualified, this path will be interpreted relative to the `directory` option.
If omitted, defaults to the value of the `zone` option suffixed with ".zone" when `zone_type` isn't External; otherwise, defaults to `null`.

*Type:* null or absolute path or string

*Default:* `if config.zone_type != "External" then "${config.zone}.zone" else null`

*Declared by:* [`nixos/modules/services/networking/hickory-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hickory-dns.nix)

## `services.hickory-dns.settings.zones.*.zone` {#opt-services.hickory-dns.settings.zones._.zone}

Zone name, like "example.com", "localhost", or "0.0.127.in-addr.arpa".

*Type:* string

*Declared by:* [`nixos/modules/services/networking/hickory-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hickory-dns.nix)

## `services.hickory-dns.settings.zones.*.zone_type` {#opt-services.hickory-dns.settings.zones._.zone_type}

One of:

- "Primary" (the master, authority for the zone).
- "Secondary" (the slave, replicated from the primary).
- "External" (a cached zone that queries other nameservers).

For more details about these zone types, consult the documentation for BIND,
though note that hickory-dns supports only a subset of BIND's zone types:
[https://bind9.readthedocs.io/en/v9\_18\_4/reference.html#type](https://bind9.readthedocs.io/en/v9_18_4/reference.html#type)

*Type:* one of "Primary", "Secondary", "External"

*Default:* `"Primary"`

*Declared by:* [`nixos/modules/services/networking/hickory-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hickory-dns.nix)

## `services.hickory-dns.validateConfig` {#opt-services.hickory-dns.validateConfig}

Whether to validate the generated configuration with hickory-dns at build time.
Disable this if the configuration references files unavailable during the build.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/hickory-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hickory-dns.nix)

## `services.hister.configPath` {#opt-services.hister.configPath}

Path to an existing Hister configuration file mounted read-only into
the service runtime directory and passed via `HISTER_CONFIG`. Mutually
exclusive with [`services.hister.settings`](#opt-services.hister.settings).

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/etc/hister/config.yml"`

*Declared by:* [`nixos/modules/services/web-apps/hister.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hister.nix)

## `services.hister.dataDir` {#opt-services.hister.dataDir}

Directory where Hister stores its data. When `null` (the default), the
service is isolated under `/var/lib/hister` via systemd's
`StateDirectory=`. When set to an explicit path, that path is created
with `systemd-tmpfiles` and granted via `ReadWritePaths=` instead.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/hister"`

*Declared by:* [`nixos/modules/services/web-apps/hister.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hister.nix)

## `services.hister.enable` {#opt-services.hister.enable}

Whether to enable Hister, a web history service with content-based search.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/hister.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hister.nix)

## `services.hister.environmentFile` {#opt-services.hister.environmentFile}

Path to an environment file (read at service start) used to inject
secrets such as `HISTER__APP__ACCESS_TOKEN` without placing them in the
world-readable Nix store.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/hister.env"`

*Declared by:* [`nixos/modules/services/web-apps/hister.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hister.nix)

## `services.hister.group` {#opt-services.hister.group}

Group under which Hister runs.

*Type:* string

*Default:* `"hister"`

*Declared by:* [`nixos/modules/services/web-apps/hister.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hister.nix)

## `services.hister.openFirewall` {#opt-services.hister.openFirewall}

Whether to open [`services.hister.port`](#opt-services.hister.port) in the firewall. Has no
effect if `port` is `null`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/hister.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hister.nix)

## `services.hister.package` {#opt-services.hister.package}

The hister package to use.

*Type:* package

*Default:* `pkgs.hister`

*Declared by:* [`nixos/modules/services/web-apps/hister.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hister.nix)

## `services.hister.port` {#opt-services.hister.port}

Port on which Hister listens. When set, this overrides the port in
`server.address` from the configuration file via the `HISTER_PORT`
environment variable.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Example:* `4433`

*Declared by:* [`nixos/modules/services/web-apps/hister.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hister.nix)

## `services.hister.settings` {#opt-services.hister.settings}

Hister configuration rendered to YAML and passed via `HISTER_CONFIG`.
Accepts any structure the server accepts: see the `app`, `server`,
`indexer`, `crawler`, `hotkeys`, `extractors`, `semantic_search`, and
`sensitive_content_patterns` blocks documented upstream.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  app = {
    search_url = "https://google.com/search?q={query}";
    log_level = "info";
  };
  server = {
    address = "127.0.0.1:4433";
    database = "db.sqlite3";
  };
  hotkeys.web = {
    "/" = "focus_search_input";
    "enter" = "open_result";
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/hister.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hister.nix)

## `services.hister.user` {#opt-services.hister.user}

User account under which Hister runs.

*Type:* string

*Default:* `"hister"`

*Declared by:* [`nixos/modules/services/web-apps/hister.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hister.nix)

## `services.hitch.backend` {#opt-services.hitch.backend}

The host and port Hitch connects to when receiving
a connection in the form \[HOST\]:PORT

*Type:* string

*Declared by:* [`nixos/modules/services/web-servers/hitch/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/hitch/default.nix)

## `services.hitch.ciphers` {#opt-services.hitch.ciphers}

The list of ciphers to use

*Type:* string

*Default:* `"EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH"`

*Declared by:* [`nixos/modules/services/web-servers/hitch/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/hitch/default.nix)

## `services.hitch.enable` {#opt-services.hitch.enable}

Whether to enable Hitch Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/hitch/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/hitch/default.nix)

## `services.hitch.extraConfig` {#opt-services.hitch.extraConfig}

Additional configuration lines

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-servers/hitch/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/hitch/default.nix)

## `services.hitch.frontend` {#opt-services.hitch.frontend}

The port and interface of the listen endpoint in the
form \[HOST\]:PORT\[+CERT\].

*Type:* string or list of string

*Default:* `"[127.0.0.1]:443"`

*Declared by:* [`nixos/modules/services/web-servers/hitch/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/hitch/default.nix)

## `services.hitch.group` {#opt-services.hitch.group}

The group to run as

*Type:* string

*Default:* `"hitch"`

*Declared by:* [`nixos/modules/services/web-servers/hitch/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/hitch/default.nix)

## `services.hitch.ocsp-stapling.enabled` {#opt-services.hitch.ocsp-stapling.enabled}

Whether to enable OCSP Stapling

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-servers/hitch/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/hitch/default.nix)

## `services.hitch.pem-files` {#opt-services.hitch.pem-files}

PEM files to use

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-servers/hitch/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/hitch/default.nix)

## `services.hitch.user` {#opt-services.hitch.user}

The user to run as

*Type:* string

*Default:* `"hitch"`

*Declared by:* [`nixos/modules/services/web-servers/hitch/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/hitch/default.nix)

## `services.hledger-web.allow` {#opt-services.hledger-web.allow}

User's access level for changing data.

- view: view only permission.
- add: view and add permissions.
- edit: view, add, and edit permissions.
- sandstorm: permissions from the `X-Sandstorm-Permissions` request header.

*Type:* one of "view", "add", "edit", "sandstorm"

*Default:* `"view"`

*Declared by:* [`nixos/modules/services/web-apps/hledger-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hledger-web.nix)

## `services.hledger-web.baseUrl` {#opt-services.hledger-web.baseUrl}

Base URL, when sharing over a network.

*Type:* null or string

*Default:* `null`

*Example:* `"https://example.org"`

*Declared by:* [`nixos/modules/services/web-apps/hledger-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hledger-web.nix)

## `services.hledger-web.enable` {#opt-services.hledger-web.enable}

Whether to enable hledger-web service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/hledger-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hledger-web.nix)

## `services.hledger-web.extraOptions` {#opt-services.hledger-web.extraOptions}

Extra command line arguments to pass to hledger-web.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--forecast"
]
```

*Declared by:* [`nixos/modules/services/web-apps/hledger-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hledger-web.nix)

## `services.hledger-web.host` {#opt-services.hledger-web.host}

Address to listen on.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/hledger-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hledger-web.nix)

## `services.hledger-web.journalFiles` {#opt-services.hledger-web.journalFiles}

Paths to journal files relative to [`services.hledger-web.stateDir`](#opt-services.hledger-web.stateDir).

*Type:* list of string

*Default:*

``` nix
[
  ".hledger.journal"
]
```

*Declared by:* [`nixos/modules/services/web-apps/hledger-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hledger-web.nix)

## `services.hledger-web.port` {#opt-services.hledger-web.port}

Port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5000`

*Example:* `80`

*Declared by:* [`nixos/modules/services/web-apps/hledger-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hledger-web.nix)

## `services.hledger-web.serveApi` {#opt-services.hledger-web.serveApi}

Whether to enable serving only the JSON web API, without the web UI.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/hledger-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hledger-web.nix)

## `services.hledger-web.stateDir` {#opt-services.hledger-web.stateDir}

Path the service has access to. If left as the default value this
directory will automatically be created before the hledger-web server
starts, otherwise the sysadmin is responsible for ensuring the
directory exists with appropriate ownership and permissions.

*Type:* absolute path

*Default:* `"/var/lib/hledger-web"`

*Declared by:* [`nixos/modules/services/web-apps/hledger-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/hledger-web.nix)

## `services.hockeypuck.enable` {#opt-services.hockeypuck.enable}

Whether to enable Hockeypuck OpenPGP Key Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/hockeypuck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/hockeypuck.nix)

## `services.hockeypuck.port` {#opt-services.hockeypuck.port}

HKP port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `11371`

*Declared by:* [`nixos/modules/services/security/hockeypuck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/hockeypuck.nix)

## `services.hockeypuck.settings` {#opt-services.hockeypuck.settings}

Configuration file for hockeypuck, here you can override
certain settings (`loglevel` and
`openpgp.db.dsn`) by just setting those values.

For other settings you need to use lib.mkForce to override them.

This service doesn't provision or enable postgres on your
system, it rather assumes that you enable postgres and create
the database yourself.

Example:

```
  services.postgresql = {
    enable = true;
    ensureDatabases = [ "hockeypuck" ];
    ensureUsers = [{
      name = "hockeypuck";
      ensureDBOwnership = true;
    }];
  };
```

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  hockeypuck = {
    loglevel = "INFO";
    logfile = "/var/log/hockeypuck/hockeypuck.log";
    indexTemplate = "${pkgs.hockeypuck-web}/share/templates/index.html.tmpl";
    vindexTemplate = "${pkgs.hockeypuck-web}/share/templates/index.html.tmpl";
    statsTemplate = "${pkgs.hockeypuck-web}/share/templates/stats.html.tmpl";
    webroot = "${pkgs.hockeypuck-web}/share/webroot";

    hkp.bind = ":${toString cfg.port}";

    openpgp.db = {
      driver = "postgres-jsonb";
      dsn = "database=hockeypuck host=/var/run/postgresql sslmode=disable";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/security/hockeypuck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/hockeypuck.nix)

## `services.hologram-agent.dialAddress` {#opt-services.hologram-agent.dialAddress}

Hologram server and port.

*Type:* string

*Default:* `"localhost:3100"`

*Declared by:* [`nixos/modules/services/security/hologram-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/hologram-agent.nix)

## `services.hologram-agent.enable` {#opt-services.hologram-agent.enable}

Whether to enable the Hologram agent for AWS instance credentials

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/hologram-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/hologram-agent.nix)

## `services.hologram-agent.httpPort` {#opt-services.hologram-agent.httpPort}

Port for metadata service to listen on.

*Type:* string

*Default:* `"80"`

*Declared by:* [`nixos/modules/services/security/hologram-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/hologram-agent.nix)

## `services.hologram-server.awsAccount` {#opt-services.hologram-server.awsAccount}

AWS account number

*Type:* string

*Declared by:* [`nixos/modules/services/security/hologram-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/hologram-server.nix)

## `services.hologram-server.awsDefaultRole` {#opt-services.hologram-server.awsDefaultRole}

AWS default role

*Type:* string

*Declared by:* [`nixos/modules/services/security/hologram-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/hologram-server.nix)

## `services.hologram-server.cacheTimeoutSeconds` {#opt-services.hologram-server.cacheTimeoutSeconds}

How often (in seconds) to refresh the LDAP cache

*Type:* signed integer

*Default:* `3600`

*Declared by:* [`nixos/modules/services/security/hologram-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/hologram-server.nix)

## `services.hologram-server.enable` {#opt-services.hologram-server.enable}

Whether to enable the Hologram server for AWS instance credentials

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/hologram-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/hologram-server.nix)

## `services.hologram-server.enableLdapRoles` {#opt-services.hologram-server.enableLdapRoles}

Whether to assign user roles based on the user's LDAP group memberships

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/hologram-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/hologram-server.nix)

## `services.hologram-server.groupClassAttr` {#opt-services.hologram-server.groupClassAttr}

The objectclass attribute to search for groups when enableLdapRoles is true

*Type:* string

*Default:* `"groupOfNames"`

*Declared by:* [`nixos/modules/services/security/hologram-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/hologram-server.nix)

## `services.hologram-server.ldapBaseDN` {#opt-services.hologram-server.ldapBaseDN}

The base DN for your Hologram users

*Type:* string

*Declared by:* [`nixos/modules/services/security/hologram-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/hologram-server.nix)

## `services.hologram-server.ldapBindDN` {#opt-services.hologram-server.ldapBindDN}

DN of account to use to query the LDAP server

*Type:* string

*Declared by:* [`nixos/modules/services/security/hologram-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/hologram-server.nix)

## `services.hologram-server.ldapBindPassword` {#opt-services.hologram-server.ldapBindPassword}

Password of account to use to query the LDAP server

*Type:* string

*Declared by:* [`nixos/modules/services/security/hologram-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/hologram-server.nix)

## `services.hologram-server.ldapHost` {#opt-services.hologram-server.ldapHost}

Address of the LDAP server to use

*Type:* string

*Declared by:* [`nixos/modules/services/security/hologram-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/hologram-server.nix)

## `services.hologram-server.ldapInsecure` {#opt-services.hologram-server.ldapInsecure}

Whether to connect to LDAP over SSL or not

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/hologram-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/hologram-server.nix)

## `services.hologram-server.ldapUserAttr` {#opt-services.hologram-server.ldapUserAttr}

The LDAP attribute for usernames

*Type:* string

*Default:* `"cn"`

*Declared by:* [`nixos/modules/services/security/hologram-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/hologram-server.nix)

## `services.hologram-server.listenAddress` {#opt-services.hologram-server.listenAddress}

Address and port to listen on

*Type:* string

*Default:* `"0.0.0.0:3100"`

*Declared by:* [`nixos/modules/services/security/hologram-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/hologram-server.nix)

## `services.hologram-server.roleAttr` {#opt-services.hologram-server.roleAttr}

Which LDAP group attribute to search for authorized role ARNs

*Type:* string

*Default:* `"businessCategory"`

*Declared by:* [`nixos/modules/services/security/hologram-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/hologram-server.nix)

## `services.hologram-server.statsAddress` {#opt-services.hologram-server.statsAddress}

Address of statsd server

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/security/hologram-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/hologram-server.nix)

## `services.home-assistant-matter-hub.accessTokenFile` {#opt-services.home-assistant-matter-hub.accessTokenFile}

Path to a file containing a Home Assistant long-lived access token.
The file is loaded as a systemd credential and read into
`HAMH_HOME_ASSISTANT_ACCESS_TOKEN` at service start.

*Type:* absolute path not in the Nix store

*Example:* `"/run/secrets/home-assistant-matter-hub-token"`

*Declared by:* [`nixos/modules/services/home-automation/home-assistant-matter-hub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant-matter-hub.nix)

## `services.home-assistant-matter-hub.enable` {#opt-services.home-assistant-matter-hub.enable}

Whether to enable home-assistant-matter-hub, a Matter bridge for Home Assistant.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/home-assistant-matter-hub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant-matter-hub.nix)

## `services.home-assistant-matter-hub.openFirewall` {#opt-services.home-assistant-matter-hub.openFirewall}

Whether to open the Matter commissioning ports (UDP/TCP 5540) in the
firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/home-automation/home-assistant-matter-hub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant-matter-hub.nix)

## `services.home-assistant-matter-hub.package` {#opt-services.home-assistant-matter-hub.package}

The home-assistant-matter-hub package to use.

*Type:* package

*Default:* `pkgs.home-assistant-matter-hub`

*Declared by:* [`nixos/modules/services/home-automation/home-assistant-matter-hub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant-matter-hub.nix)

## `services.home-assistant-matter-hub.settings` {#opt-services.home-assistant-matter-hub.settings}

Configuration written to a JSON file and passed to
`home-assistant-matter-hub start --config`. Keys use camelCase, matching
the long-form CLI flags. See
[https://riddix.github.io/home-assistant-matter-hub/getting-started/installation#23-configuration-options](https://riddix.github.io/home-assistant-matter-hub/getting-started/installation#23-configuration-options)
for the full list of options.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Example:*

``` nix
{
  homeAssistantUrl = config.services.home-assistant.config.homeassistant.internal_url;
}
```

*Declared by:* [`nixos/modules/services/home-automation/home-assistant-matter-hub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant-matter-hub.nix)

## `services.home-assistant-matter-hub.settings.homeAssistantUrl` {#opt-services.home-assistant-matter-hub.settings.homeAssistantUrl}

HTTP URL of the Home Assistant instance to bridge.

*Type:* string

*Example:* `config.services.home-assistant.config.homeassistant.internal_url`

*Declared by:* [`nixos/modules/services/home-automation/home-assistant-matter-hub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant-matter-hub.nix)

## `services.home-assistant-matter-hub.settings.httpPort` {#opt-services.home-assistant-matter-hub.settings.httpPort}

Port the web interface listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8482`

*Declared by:* [`nixos/modules/services/home-automation/home-assistant-matter-hub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant-matter-hub.nix)

## `services.home-assistant.blueprints.automation` {#opt-services.home-assistant.blueprints.automation}

List of automation
[blueprints](https://www.home-assistant.io/docs/blueprint/) to
install into `${config.services.home-assistant.configDir}/blueprints/automation`.

*Type:* list of (path in the Nix store or absolute path convertible to it)

*Default:* `[ ]`

*Example:*

``` nix
[
  (pkgs.fetchurl {
    url = "https://github.com/home-assistant/core/raw/2025.1.4/homeassistant/components/automation/blueprints/motion_light.yaml";
    hash = "sha256-4HrDX65ycBMfEY2nZ7A25/d3ZnIHdpHZ+80Cblp+P5w=";
  })
]
```

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.blueprints.script` {#opt-services.home-assistant.blueprints.script}

List of script
[blueprints](https://www.home-assistant.io/docs/blueprint/) to
install into `${config.services.home-assistant.configDir}/blueprints/script`.

*Type:* list of (path in the Nix store or absolute path convertible to it)

*Default:* `[ ]`

*Example:* `[ ./blueprint.yaml ]`

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.blueprints.template` {#opt-services.home-assistant.blueprints.template}

List of template
[blueprints](https://www.home-assistant.io/docs/blueprint/) to
install into `${config.services.home-assistant.configDir}/blueprints/template`.

*Type:* list of (path in the Nix store or absolute path convertible to it)

*Default:* `[ ]`

*Example:* `[ "${pkgs.home-assistant.src}/homeassistant/components/template/blueprints/inverted_binary_sensor.yaml" ]`

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.config` {#opt-services.home-assistant.config}

Your `configuration.yaml` as a Nix attribute set.

YAML functions like [secrets](https://www.home-assistant.io/docs/configuration/secrets/)
can be passed as a string and will be unquoted automatically.

Unless this option is explicitly set to `null`
we assume your `configuration.yaml` is
managed through this module and thereby overwritten on startup.

*Type:* null or (open submodule of (YAML 1.1 value))

*Example:*

``` nix
{
  homeassistant = {
    name = "Home";
    latitude = "!secret latitude";
    longitude = "!secret longitude";
    elevation = "!secret elevation";
    unit_system = "metric";
    time_zone = "UTC";
  };
  frontend = {
    themes = "!include_dir_merge_named themes";
  };
  http = {};
  feedreader.urls = [ "https://nixos.org/blogs.xml" ];
}
```

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.config.homeassistant.latitude` {#opt-services.home-assistant.config.homeassistant.latitude}

Latitude of your location required to calculate the time the sun rises and sets.

*Type:* null or floating point number or string

*Default:* `null`

*Example:* `52.3`

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.config.homeassistant.longitude` {#opt-services.home-assistant.config.homeassistant.longitude}

Longitude of your location required to calculate the time the sun rises and sets.

*Type:* null or floating point number or string

*Default:* `null`

*Example:* `4.9`

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.config.homeassistant.name` {#opt-services.home-assistant.config.homeassistant.name}

Name of the location where Home Assistant is running.

*Type:* null or string

*Default:* `null`

*Example:* `"Home"`

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.config.homeassistant.temperature_unit` {#opt-services.home-assistant.config.homeassistant.temperature_unit}

Override temperature unit set by unit\_system. `C` for Celsius, `F` for Fahrenheit.

*Type:* null or one of "C", "F"

*Default:* `null`

*Example:* `"C"`

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.config.homeassistant.time_zone` {#opt-services.home-assistant.config.homeassistant.time_zone}

Pick your time zone from the column TZ of Wikipedia’s [list of tz database time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).

*Type:* null or string

*Default:*

``` nix
config.time.timeZone or null
```

*Example:* `"Europe/Amsterdam"`

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.config.homeassistant.unit_system` {#opt-services.home-assistant.config.homeassistant.unit_system}

The unit system to use. This also sets temperature\_unit, Celsius for Metric and Fahrenheit for US Customary.

*Type:* null or one of "metric", "us\_customary"

*Default:* `null`

*Example:* `"metric"`

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.config.lovelace.dashboards.nixos-lovelace` {#opt-services.home-assistant.config.lovelace.dashboards.nixos-lovelace}

Default NixOS-managed Lovelace dashboard. Automatically populated
when `lovelaceConfig` or `lovelaceConfigFile` is set.

Additional dashboards can be defined under
`config.lovelace.dashboards.<name>`.

See [https://www.home-assistant.io/lovelace/dashboards/](https://www.home-assistant.io/lovelace/dashboards/) for details.

*Type:* null or YAML 1.1 value

*Default:*

``` nix
if cfg.lovelaceConfig != null || cfg.lovelaceConfigFile != null then {
  mode = "yaml";
  filename = "ui-lovelace.yaml";
  title = "Overview";
  icon = "mdi:view-dashboard";
  show_in_sidebar = true;
} else null
```

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.config.lovelace.resource_mode` {#opt-services.home-assistant.config.lovelace.resource_mode}

Set to `"yaml"` to load Lovelace resources from YAML configuration,
or `"storage"` to manage them through the UI. See
[https://www.home-assistant.io/dashboards/dashboards/#resource\_mode](https://www.home-assistant.io/dashboards/dashboards/#resource_mode).

Automatically set to `"yaml"` when `customLovelaceModules`
is non-empty.

*Type:* null or one of "yaml", "storage"

*Default:*

``` nix
if cfg.customLovelaceModules != [ ] then "yaml" else null
```

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.configDir` {#opt-services.home-assistant.configDir}

The config directory, where your `configuration.yaml` is located.

*Type:* absolute path

*Default:* `"/var/lib/hass"`

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.configWritable` {#opt-services.home-assistant.configWritable}

Whether to make `configuration.yaml` writable.

This will allow you to edit it from Home Assistant's web interface.

This only has an effect if `config` is set.
However, bear in mind that it will be overwritten at every start of the service.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.customComponents` {#opt-services.home-assistant.customComponents}

List of custom component packages to install.

Available components can be found below `pkgs.home-assistant-custom-components`.

*Type:* list of package that is a Home Assistant component

*Default:* `[ ]`

*Example:*

``` nix
with pkgs.home-assistant-custom-components; [
  prometheus_sensor
];
```

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.customLovelaceModules` {#opt-services.home-assistant.customLovelaceModules}

List of custom lovelace card packages to load as lovelace resources.

Available cards can be found below `pkgs.home-assistant-custom-lovelace-modules`.

::: note
When non-empty, `lovelace.resource_mode` is automatically set to `"yaml"`
so that resources are loaded from the YAML configuration.
:::

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
with pkgs.home-assistant-custom-lovelace-modules; [
  mini-graph-card
  mini-media-player
];
```

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.defaultIntegrations` {#opt-services.home-assistant.defaultIntegrations}

List of integrations set are always set up, unless in recovery mode.

*Type:* list of (one of "3\_day\_blinds", "abode", "abrp", "acaia", "accuweather", "acmeda", "acomax", "actiontec", "actron\_air", "adax", "adguard", "ads", "advantage\_air", "aemet", "aep\_ohio", "aep\_texas", "aerosmart", "aftership", "agent\_dvr", "ai\_task", "aidot", "air\_quality", "airgradient", "airly", "airnow", "airobot", "airos", "airpatrol", "airq", "airthings", "airthings\_ble", "airtouch4", "airtouch5", "airvisual", "airvisual\_pro", "airzone", "airzone\_cloud", "aladdin\_connect", "alarm\_control\_panel", "alarmdecoder", "alert", "alexa", "alexa\_devices", "alpha\_bidet\_infrared", "alpha\_vantage", "altruist", "amazon\_polly", "amberelectric", "ambient\_network", "ambient\_station", "amcrest", "amp\_motorization", "analytics", "analytics\_insights", "android\_ip\_webcam", "androidtv", "androidtv\_remote", "anel\_pwrctrl", "anglian\_water", "anova", "anthemav", "anthropic", "anwb\_energie", "any\_list", "aosmith", "apache\_kafka", "apcupsd", "api", "apollo\_automation", "appalachianpower", "apple\_tv", "application\_credentials", "apprise", "aprilaire", "aprs", "apsystems", "aquacell", "aqualogic", "aquostv", "aqvify", "aranet", "arcam\_fmj", "arest", "ariston", "arris\_tg2492lg", "artsound", "aruba", "arve", "arwn", "aseko\_pool\_live", "assist\_pipeline", "assist\_satellite", "asuswrt", "atag", "atlanticcityelectric", "atome", "august", "august\_ble", "aurora", "aurora\_abb\_powerone", "aussie\_broadband", "austroflamm", "autarco", "auth", "automation", "autoskope", "avea", "avosdim", "awair", "aws", "aws\_s3", "axis", "axle\_energy", "azure\_data\_explorer", "azure\_devops", "azure\_event\_hub", "azure\_service\_bus", "azure\_storage", "backblaze\_b2", "backup", "baf", "baidu", "balay", "balboa", "bang\_olufsen", "battery", "bauknecht", "bayesian", "bbox", "besen", "beverly", "bge", "binary\_sensor", "bitcoin", "bitvis", "bizkaibus", "blackbird", "blebox", "blink", "bliss\_automation", "bloc\_blinds", "blockchain", "blue\_current", "bluemaestro", "blueprint", "bluesound", "bluetooth", "bluetooth\_adapters", "bluetooth\_le\_tracker", "bluetti\_modbus", "bmw\_connected\_drive", "bond", "bosch\_alarm", "bosch\_shc", "bosch\_smart\_camera", "brands", "brandt", "braviatv", "brel\_home", "bring", "broadlink", "brother", "brottsplatskartan", "browser", "brunt", "bryant\_evolution", "bsblan", "bswitch", "bt\_home\_hub\_5", "bt\_smarthub", "bthome", "bticino", "bubendorff", "bugu", "buienradar", "burbank\_water\_and\_power", "button", "bwt", "caldav", "calendar", "cambridge\_audio", "camera", "canary", "carrier", "casper\_glow", "cast", "ccm15", "centriconnect", "cert\_expiry", "chacon\_dio", "channels", "chef\_iq", "chess\_com", "chirpstack", "cielo\_home", "cisco\_ios", "cisco\_mobility\_express", "cisco\_webex\_teams", "citybikes", "clickatell", "clicksend", "clicksend\_tts", "climate", "cloud", "cloudflare", "cloudflare\_r2", "cmus", "co2signal", "coautilities", "coinbase", "collection\_image", "colmo", "color\_extractor", "comed", "comed\_hourly\_pricing", "comelit", "comfee", "comfoconnect", "command\_line", "compensation", "compit", "concord232", "coned", "config", "configurator", "constructa", "control4", "conversation", "cookidoo", "coolmaster", "cosori", "counter", "cover", "cozytouch", "cppm\_tracker", "cpuspeed", "cribl", "crownstone", "currencylayer", "cync", "dacia", "daikin", "danfoss\_air", "data\_grand\_lyon", "datadog", "date", "datetime", "ddwrt", "deako", "debug\_console", "debugpy", "deconz", "decora\_wifi", "decorquip", "default\_config", "delijn", "delmarva", "deluge", "demo", "denon", "denon\_rs232", "denonavr", "derivative", "devialet", "device\_automation", "device\_sun\_light\_trigger", "device\_tracker", "devolo\_home\_control", "devolo\_home\_network", "dexcom", "dhcp", "diagnostics", "dialogflow", "diaz", "digital\_loggers", "digital\_ocean", "directv", "discogs", "discord", "discovergy", "dlink", "dlna\_dmr", "dlna\_dms", "dnsip", "doods", "door", "doorbell", "doorbird", "dooya", "dormakaba\_dkey", "downloader", "dremel\_3d\_printer", "drop\_connect", "dropbox", "droplet", "dsmr", "dsmr\_reader", "duckdns", "duco", "dunehd", "duotecno", "duquesne\_light", "dwd\_weather\_warnings", "dynalite", "dyson\_infrared", "eafm", "earn\_e\_p1", "eastron", "easyenergy", "ebox", "ebusd", "ecoal\_boiler", "ecobee", "ecoforest", "econet", "ecosmart", "ecospar", "ecovacs", "ecowitt", "edifier\_infrared", "edimax", "edl21", "efergy", "egardia", "egauge", "eheimdigital", "eight\_sleep", "ekeybionyx", "electrasmart", "electric\_kiwi", "elevenlabs", "elgato", "elkm1", "elmax", "elv", "elvia", "emby", "emoncms", "emoncms\_history", "emonitor", "emulated\_hue", "emulated\_kasa", "emulated\_roku", "energenie\_power\_sockets", "energie\_vanons", "energieleser", "energy", "energyid", "energyzero", "engie\_be", "enigma2", "enocean", "enphase\_envoy", "entur\_public\_transport", "envertech\_evt800", "environment\_canada", "envisalink", "ephember", "epic\_games\_store", "epion", "epson", "eq3btsmart", "escea", "esera\_onewire", "esphome", "essent", "eufy", "eufylife\_ble", "eurotronic\_cometblue", "event", "evergy", "everlights", "everything\_smart\_home", "evil\_genius\_labs", "evohome", "exicom\_spin\_ble", "ezviz", "faa\_delays", "facebook", "fail2ban", "familyhub", "fan", "fastdotcom", "feedreader", "ffmpeg", "ffmpeg\_motion", "ffmpeg\_noise", "fibaro", "fido", "file", "file\_upload", "filesize", "filter", "fing", "fints", "fire\_tv", "firefly\_iii", "fireservicerota", "firmata", "fish\_audio", "fitbit", "fivem", "fixer", "fjaraskupan", "fleetgo", "flexit", "flexit\_bacnet", "flexom", "flic", "flic\_button", "flipr", "flo", "flock", "flow\_it", "flume", "fluss", "flux", "flux\_led", "folder", "folder\_watcher", "foobot", "foreca", "forecast\_solar", "forked\_daapd", "fortios", "foscam", "foursquare", "frankever", "free\_mobile", "freebox", "freedns", "freedompro", "freshr", "fressnapf\_tracker", "fritz", "fritzbox", "fritzbox\_callmonitor", "fronius", "frontend", "frontier\_silicon", "fuelprices\_dk", "fujitsu\_anywair", "fujitsu\_fglair", "fully\_kiosk", "fumis", "futurenow", "fyta", "gaggenau", "garadget", "garage\_door", "garages\_amsterdam", "gardena\_bluetooth", "gate", "gatus", "gaviota", "gc100", "gdacs", "generic", "generic\_hygrostat", "generic\_thermostat", "geniushub", "gentex\_homelink", "geo\_json\_events", "geo\_location", "geo\_rss\_events", "geocaching", "geofency", "geonetnz\_quakes", "geonetnz\_volcano", "geosphere\_austria\_warnings", "ghost", "gios", "github", "gitlab\_ci", "gitter", "glances", "go2rtc", "goalzero", "gogogate2", "goodwe", "google", "google\_air\_quality", "google\_assistant", "google\_assistant\_sdk", "google\_cloud", "google\_drive", "google\_generative\_ai\_conversation", "google\_health", "google\_mail", "google\_maps", "google\_photos", "google\_pubsub", "google\_sheets", "google\_tasks", "google\_translate", "google\_travel\_time", "google\_weather", "google\_wifi", "govee\_ble", "govee\_light\_local", "gpsd", "gpslogger", "grandstream\_home", "graphite", "gree", "gree\_infrared", "green\_planet\_energy", "greencell", "greeneye\_monitor", "group", "growatt\_server", "gtfs", "guardian", "guntamatic", "haas\_sohn", "habitica", "hanna", "harbor", "hardkernel", "hardware", "harman\_kardon\_avr", "harman\_luxury", "harmony", "harvey", "hase\_iq", "hassio", "havana\_shade", "haveibeenpwned", "haven\_iaq", "hddtemp", "hdfury", "hdmi\_cec", "heatmiser", "hegel", "heicko", "heiwa", "helty", "helty\_cloud", "heos", "here\_travel\_time", "heta", "hexaom", "hi\_kumo", "hikvision", "hikvisioncam", "hisense\_aehw4a1", "history", "history\_stats", "hitron\_coda", "hive", "hko", "hlk\_sw16", "holiday", "home\_connect", "home\_plus\_control", "homeassistant", "homeassistant\_alerts", "homeassistant\_connect\_zbt2", "homeassistant\_green", "homeassistant\_hardware", "homeassistant\_sky\_connect", "homeassistant\_yellow", "homee", "homekit", "homekit\_controller", "homematic", "homematicip\_cloud", "homevolt", "homewizard", "homeworks", "honeywell", "honeywell\_string\_lights", "horizon", "hortimax", "hotspring", "hp\_ilo", "hp\_printer", "hr\_energy\_qube", "html5", "http", "huawei\_lte", "hue", "hue\_ble", "huisbaasje", "humidifier", "humidity", "hunterdouglas\_powerview", "hurrican\_shutters\_wholesale", "husqvarna\_automower", "husqvarna\_automower\_ble", "huum", "hvv\_departures", "hydrawise", "hydroquebec\_peak", "hyperion", "hypontech", "ialarm", "iammeter", "iaqualink", "ibeacon", "icloud", "idasen\_desk", "idrive\_e2", "idteck\_prox", "ifttt", "iglo", "igloohome", "ign\_sismologia", "ihc", "illuminance", "image", "image\_processing", "image\_upload", "imap", "imeon\_inverter", "imgw\_pib", "immich", "imou", "improv\_ble", "incomfort", "indevolt", "indi\_allsky", "indianamichiganpower", "inels", "influxdb", "infrared", "inkbird", "input\_boolean", "input\_button", "input\_datetime", "input\_number", "input\_select", "input\_text", "inspired\_shades", "insteon", "integration", "intelliclima", "intellifire", "intent", "intent\_script", "intesishome", "inventor", "iometer", "ios", "iotawatt", "iotorero", "iotty", "iperf3", "ipma", "ipp", "iqvia", "irish\_rail\_transport", "irm\_kmi", "iron\_os", "isal", "iseo\_argo\_ble", "iskra", "islamic\_prayer\_times", "ismartwindow", "israel\_rail", "iss", "ista\_ecotrend", "isy994", "itach", "itunes", "ituran", "izone", "jellyfin", "jewish\_calendar", "joaoapps\_join", "juicenet", "justnimbus", "jvc\_projector", "kaco\_modbus", "kaco\_rs485", "kaiser\_nienhaus", "kaiterra", "kaleidescape", "kankun", "karakeep", "keba", "keenetic\_ndms2", "kef", "kegtron", "kentuckypower", "keyboard\_remote", "keymitt\_ble", "kiosker", "kira", "kitchen\_sink", "kiwi", "klik\_aan\_klik\_uit", "kmtronic", "knocki", "knx", "kodi", "konnected", "konnected\_esphome", "kostal\_plenticore", "kraken", "krispol", "kulersky", "kwb", "labs", "lacrosse", "lacrosse\_view", "lamarzocco", "lametric", "landisgyr\_heat\_meter", "lannouncer", "lastfm", "launch\_library", "laundrify", "lawn\_mower", "lcn", "ld2410\_ble", "leaone", "led\_ble", "led\_infrared", "legrand", "lektrico", "letpot", "levoit", "lg\_infrared", "lg\_netcast", "lg\_soundbar", "lg\_thinq", "lg\_tv\_rs232", "libre\_hardware\_monitor", "librenms", "libresync", "lichess", "lidarr", "liebherr", "life360", "lifx", "lifx\_cloud", "light", "lightwave", "limitlessled", "linak", "linkedgo", "linkplay", "linksys\_smart", "linux\_battery", "linx", "litejet", "litellm", "litterrobot", "little\_swan", "livisi", "llama\_cpp", "llamalab\_automate", "llm", "local\_calendar", "local\_file", "local\_ip", "local\_todo", "locative", "lock", "logbook", "logger", "lojack", "london\_air", "london\_underground", "lookin", "loqed", "lorawan", "lovelace", "luci", "luftdaten", "lunatone", "lupusec", "lutron", "lutron\_caseta", "luxaflex", "lw12wifi", "lyngdorf", "lyric", "madeco", "madvr", "mailgun", "manual", "manual\_mqtt", "map\_tiles", "marantz", "marantz\_infrared", "marantz\_rs232", "marketplace", "martec", "marytts", "mastodon", "matrix", "matter", "maxcube", "maytag", "mazda", "mcp", "mcp\_server", "mealie", "meater", "medcom\_ble", "media\_extractor", "media\_player", "media\_source", "mediaroom", "melcloud", "melcloud\_home", "melissa", "melnor", "meraki", "message\_bird", "met", "met\_eireann", "meteo\_france", "meteo\_lt", "meteoalarm", "meteoclimatic", "metoffice", "mfi", "microbees", "microsoft", "midea", "miele", "mijn\_farmad\_apotheek", "mijndomein\_energie", "mikrotik", "mill", "min\_max", "minecraft\_server", "minio", "mitsubishi\_comfort", "mjpeg", "moat", "mobile\_app", "mochad", "modbus", "modem\_callerid", "modern\_forms", "moehlenhoff\_alpha2", "moisture", "mold\_indicator", "monarch\_money", "monessen", "monoprice", "monzo", "moon", "mopeka", "motion", "motion\_blinds", "motionblinds\_ble", "motioneye", "motionmount", "mpd", "mqtt", "mqtt\_eventstream", "mqtt\_json", "mqtt\_room", "mqtt\_statestream", "msteams", "mta", "mullvad", "music\_assistant", "mutesync", "mvglive", "my", "my\_pv", "myneomitis", "myq", "mysensors", "mystrom", "mythicbeastsdns", "myuplink", "nad", "nam", "namecheapdns", "nanoleaf", "nasweb", "nature\_remo", "neato", "nederlandse\_spoorwegen", "neff", "neo", "neopool", "ness\_alarm", "nest", "netatmo", "netdata", "netgear", "netgear\_lte", "netio", "netsu", "network", "neurio\_energy", "nexblue", "nexen", "nexia", "nexity", "nextbus", "nextcloud", "nextdns", "nfandroidtv", "nibe\_heatpump", "nice\_go", "nightscout", "niko\_home\_control", "nilu", "nina", "nintendo\_parental\_controls", "nissan\_leaf", "nmap\_tracker", "nmbs", "no\_ip", "noaa\_tides", "nobo\_hub", "nordpool", "norway\_air", "notify", "notify\_events", "notion", "novy\_cooker\_hood", "nrgkick", "nsw\_fuel\_station", "nsw\_rural\_fire\_service\_feed", "ntfy", "nuheat", "nuki", "numato", "number", "nut", "nutrichef", "nws", "nx584", "nyt\_games", "nzbget", "oasa\_telematics", "obihai", "occupancy", "octoprint", "oem", "ogemray", "ogeneral", "ohmconnect", "ohme", "okok\_scale", "olimpia\_splendid", "ollama", "ombi", "omie", "omnilogic", "onboarding", "oncue", "ondilo\_ico", "onedrive", "onedrive\_for\_business", "onewire", "onida\_infrared", "onkyo", "onvif", "open\_meteo", "open\_router", "openai\_conversation", "openalpr\_cloud", "opendisplay", "openerz", "openevse", "openexchangerates", "opengarage", "openhardwaremonitor", "openhome", "openrgb", "opensensemap", "opensky", "opentherm\_gw", "openuv", "openweathermap", "opnsense", "opower", "opple", "oralb", "oru\_opower", "orvibo", "osoenergy", "osram\_infrared", "osramlightify", "otbr", "otp", "ouman\_eh\_800", "ourgroceries", "overkiz", "overseerr", "ovhcloud\_ai\_endpoints", "ovo\_energy", "owntracks", "p1\_monitor", "paj\_gps", "palazzetti", "panasonic\_bluray", "panasonic\_viera", "panel\_custom", "paperless\_ngx", "pcs\_lighting", "peblar", "peco", "peco\_opower", "pegel\_online", "pencom", "pepco", "permobil", "persang\_infrared", "persistent\_notification", "person", "pge", "pglab", "philips\_infrared", "philips\_js", "pi\_hole", "picnic", "picotts", "pinecil", "ping", "pioneer", "piper", "pitsos", "pjlink", "plaato", "plant", "playstation\_network", "plex", "plugwise", "plum\_lightpad", "pocketcasts", "point", "pooldose", "poolsense", "portainer", "power", "powerfox", "powerfox\_local", "powerwall", "prana", "private\_ble\_device", "pro\_breeze", "probe\_plus", "profiler", "profilo", "progettihwsw", "proliphix", "prometheus", "prosegur", "prowl", "proximity", "proxmoxve", "proxy", "prusalink", "ps4", "pse", "psoklahoma", "ptdevices", "pterodactyl", "pulseaudio\_loopback", "pure\_energie", "purpleair", "push", "pushbullet", "pushover", "pushsafer", "pvoutput", "pvpc\_hourly\_pricing", "pyload", "python\_script", "qbittorrent", "qbus", "qingping", "qld\_bushfire", "qnap", "qnap\_qsw", "qrcode", "quadrafire", "quantum\_gateway", "qvr\_pro", "qwikswitch", "rabbitair", "rachio", "radarr", "radio\_browser", "radio\_frequency", "radiotherm", "rainbird", "rainbowminer", "rainforest\_eagle", "rainforest\_raven", "rainmachine", "random", "rapt\_ble", "raspberry\_pi", "raspyrfm", "raven\_rock\_mfg", "rdw", "recollect\_waste", "recorder", "recovery\_mode", "recswitch", "reddit", "redgtech", "refoss", "rehlko", "rejseplanen", "remember\_the\_milk", "remote", "remote\_calendar", "remote\_rpi\_gpio", "renault", "renson", "reolink", "repairs", "repetier", "rest", "rest\_command", "rexel", "rflink", "rfxtrx", "rhasspy", "ridwell", "ring", "ripple", "risco", "rituals\_perfume\_genie", "rmvtransport", "roborock", "rocketchat", "roku", "romy", "roomba", "roon", "rotenso", "route53", "route\_b\_smart\_meter", "rova", "rpi\_power", "rss\_feed\_template", "rtorrent", "ruckus\_unleashed", "russound\_rio", "russound\_rnet", "ruuvi\_gateway", "ruuvitag\_ble", "rympro", "sabnzbd", "saj", "samsam", "samsung\_exlink", "samsung\_infrared", "samsungtv", "sanix", "satel\_integra", "saunum", "scene", "schedule", "schlage", "schluter", "scl", "scorpiontrack", "scrape", "screenaway", "screenlogic", "script", "seafile", "search", "season", "select", "sendgrid", "sense", "sensecap\_lorawan", "sensibo", "sensirion\_ble", "sensor", "sensorblue", "sensorpro", "sensorpush", "sensorpush\_cloud", "sensoterra", "sentry", "senz", "serial", "serial\_pm", "sesame", "seven\_segments", "seventeentrack", "sfr\_box", "sftp\_storage", "sharkiq", "shell\_command", "shelly", "shodan", "shopping\_list", "sia", "siemens", "sighthound", "signal\_messenger", "silla\_prism", "silvercrest\_infrared", "simplefin", "simplepush", "simplisafe", "simply\_automated", "simu", "sinch", "siren", "sisyphus", "skoda", "sky\_hub", "sky\_remote", "skybeacon", "skybell", "slack", "sleep\_as\_android", "sleepiq", "slide", "slide\_local", "slimproto", "sma", "smappee", "smarla", "smart\_blinds", "smart\_home", "smart\_meter\_texas", "smart\_rollos", "smarther", "smartthings", "smarttub", "smarty", "smartyplants", "smhi", "smlight", "smtp", "smud", "snapcast", "snmp", "snoo", "snooz", "sofar", "solaredge", "solaredge\_modbus", "solarlog", "solarman", "solax", "solyx\_energy\_cloud", "soma", "somfy", "somfy\_mylink", "sonarr", "songpal", "sonos", "sony\_projector", "soundtouch", "spaceapi", "spc", "specialized\_turbo", "speedtestdotnet", "spider", "splunk", "spotify", "sql", "squeezebox", "srp\_energy", "ssdp", "starline", "starlingbank", "starlink", "startca", "statistics", "statsd", "steam\_online", "steamist", "steamvr\_base\_station", "steinway\_lyngdorf", "stiebel\_eltron", "stookwijzer", "stream", "streamlabswater", "stt", "subaru", "suez\_water", "sun", "sunricher\_dali", "sunsynk", "sunweg", "supervisord", "supla", "surepetcare", "swepco", "swiss\_hydrological\_data", "swiss\_public\_transport", "swisscom", "switch", "switch\_as\_x", "switchbee", "switchbot", "switchbot\_cloud", "switcher\_kis", "switchmate", "symfonisk", "syncthing", "syncthru", "synology\_chat", "synology\_dsm", "synology\_srm", "syslog", "system\_bridge", "system\_health", "system\_log", "systemmonitor", "systemnexa2", "tado", "tag", "tailscale", "tailwind", "tami4", "tank\_utility", "tankerkoenig", "tapsaff", "tasmota", "tautulli", "tcp", "technove", "ted5000", "tedee", "telegram", "telegram\_bot", "teleinfo", "tellduslive", "tellstick", "telnet", "teltonika", "temper", "temperature", "template", "tesla\_fleet", "tesla\_wall\_connector", "teslemetry", "tessie", "text", "theben\_conexa", "thermador", "thermobeacon", "thermoplus", "thermopro", "thethingsnetwork", "thethingsnetwork\_lorawan", "thingspeak", "thinkingcleaner", "thomson", "thread", "threema", "threshold", "tibber", "tile", "tilt\_ble", "tilt\_pi", "time", "time\_date", "timer", "tmb", "tod", "todo", "todoist", "togrill", "tolo", "tomato", "tomorrowio", "tonewinner", "toon", "torque", "toshiba\_lifestyle", "totalconnect", "touchline", "touchline\_sl", "tplink", "tplink\_lte", "tplink\_omada", "tplink\_tapo", "traccar", "traccar\_server", "trace", "tractive", "tradfri", "trafikverket\_camera", "trafikverket\_ferry", "trafikverket\_train", "trafikverket\_weatherstation", "trane", "transmission", "transport\_nsw", "trend", "triggercmd", "trmnl", "tts", "tuya", "twentemilieu", "twilio", "twilio\_call", "twilio\_sms", "twinkly", "twitch", "twitter", "ubiwizz", "ublockout", "ubus", "uhoo", "uk\_transport", "ukraine\_alarm", "ultraloq", "unifi", "unifi\_access", "unifi\_direct", "unifi\_discovery", "unifiprotect", "universal", "upb", "upc\_connect", "upcloud", "update", "upnp", "uprise\_smart\_shades", "uptime", "uptime\_kuma", "uptimerobot", "usage\_prediction", "usb", "usgs\_earthquakes\_feed", "utility\_meter", "uvc", "v2c", "vacuum", "vagner\_pool", "vallox", "valve", "vandelo", "vasttrafik", "vegehub", "velbus", "velux", "venstar", "vera", "verisure", "vermont\_castings", "versasense", "version", "vesync", "viaggiatreno", "vibration", "vicare", "victron\_ble", "victron\_gx", "victron\_remote\_monitoring", "vilfo", "vistapool", "vitesy", "vivotek", "vizio", "vlc\_telnet", "vodafone\_station", "voicerss", "voip", "volkszaehler", "volumio", "volvo", "w800rf32", "wahin", "wake\_on\_lan", "wake\_word", "wallbox", "waqi", "water\_heater", "waterfurnace", "watergate", "watts", "watttime", "wattwaechter", "waze\_travel\_time", "weather", "weatherflow", "weatherflow\_cloud", "weatherkit", "web\_rtc", "webdav", "webhook", "webmin", "webostv", "websocket\_api", "weheat", "wemo", "whirlpool", "whisper", "whois", "wiffi", "wiim", "wilight", "willow", "window", "wirelesstag", "withings", "wiz", "wled", "wmspro", "wolflink", "workday", "worldclock", "worldtidesinfo", "worxlandroid", "ws66i", "wsdot", "wyoming", "x10", "xbox", "xeoma", "xiaomi", "xiaomi\_aqara", "xiaomi\_ble", "xiaomi\_miio", "xiaomi\_tv", "xiaomi\_weather", "xmpp", "xs1", "xthings\_cloud", "yale", "yale\_smart\_alarm", "yalexs\_ble", "yamaha", "yamaha\_musiccast", "yandex\_transport", "yandextts", "yardian", "yeelight", "yeelightsunflower", "yi", "yolink", "yoto", "youless", "youtube", "zabbix", "zamg", "zbox\_hub", "zengge", "zeroconf", "zerproc", "zeversolar", "zha", "zhong\_hong", "ziggo\_mediabox\_xl", "zimi", "zinvolt", "zodiac", "zondergas", "zone", "zoneminder", "zonneplan", "zwave\_js", "zwave\_me")

*Default:*

``` nix
[
  "application_credentials"
  "frontend"
  "hardware"
  "logger"
  "network"
  "system_health"
  "automation"
  "person"
  "scene"
  "script"
  "tag"
  "zone"
  "counter"
  "input_boolean"
  "input_button"
  "input_datetime"
  "input_number"
  "input_select"
  "input_text"
  "schedule"
  "timer"
  "backup"
]
```

*Read only*

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.enable` {#opt-services.home-assistant.enable}

Whether to enable Home Assistant, open source home automation that puts local control and privacy first.

Your instance will bind to `*:8123` by default. This can be changed in the [HTTP](https://www.home-assistant.io/integrations/http/) integration in the frontend.

::: warning
The upstream project does not support this installation method. Make sure to file issues against nixpkgs first.
:::

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.extraArgs` {#opt-services.home-assistant.extraArgs}

Extra arguments to pass to the hass executable.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--debug"
]
```

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.extraComponents` {#opt-services.home-assistant.extraComponents}

List of [components](https://www.home-assistant.io/integrations/) that have their dependencies included in the package.

The component name can be found in the URL, for example `https://www.home-assistant.io/integrations/ffmpeg/` would map to `ffmpeg`.

*Type:* list of (one of "3\_day\_blinds", "abode", "abrp", "acaia", "accuweather", "acmeda", "acomax", "actiontec", "actron\_air", "adax", "adguard", "ads", "advantage\_air", "aemet", "aep\_ohio", "aep\_texas", "aerosmart", "aftership", "agent\_dvr", "ai\_task", "aidot", "air\_quality", "airgradient", "airly", "airnow", "airobot", "airos", "airpatrol", "airq", "airthings", "airthings\_ble", "airtouch4", "airtouch5", "airvisual", "airvisual\_pro", "airzone", "airzone\_cloud", "aladdin\_connect", "alarm\_control\_panel", "alarmdecoder", "alert", "alexa", "alexa\_devices", "alpha\_bidet\_infrared", "alpha\_vantage", "altruist", "amazon\_polly", "amberelectric", "ambient\_network", "ambient\_station", "amcrest", "amp\_motorization", "analytics", "analytics\_insights", "android\_ip\_webcam", "androidtv", "androidtv\_remote", "anel\_pwrctrl", "anglian\_water", "anova", "anthemav", "anthropic", "anwb\_energie", "any\_list", "aosmith", "apache\_kafka", "apcupsd", "api", "apollo\_automation", "appalachianpower", "apple\_tv", "application\_credentials", "apprise", "aprilaire", "aprs", "apsystems", "aquacell", "aqualogic", "aquostv", "aqvify", "aranet", "arcam\_fmj", "arest", "ariston", "arris\_tg2492lg", "artsound", "aruba", "arve", "arwn", "aseko\_pool\_live", "assist\_pipeline", "assist\_satellite", "asuswrt", "atag", "atlanticcityelectric", "atome", "august", "august\_ble", "aurora", "aurora\_abb\_powerone", "aussie\_broadband", "austroflamm", "autarco", "auth", "automation", "autoskope", "avea", "avosdim", "awair", "aws", "aws\_s3", "axis", "axle\_energy", "azure\_data\_explorer", "azure\_devops", "azure\_event\_hub", "azure\_service\_bus", "azure\_storage", "backblaze\_b2", "backup", "baf", "baidu", "balay", "balboa", "bang\_olufsen", "battery", "bauknecht", "bayesian", "bbox", "besen", "beverly", "bge", "binary\_sensor", "bitcoin", "bitvis", "bizkaibus", "blackbird", "blebox", "blink", "bliss\_automation", "bloc\_blinds", "blockchain", "blue\_current", "bluemaestro", "blueprint", "bluesound", "bluetooth", "bluetooth\_adapters", "bluetooth\_le\_tracker", "bluetti\_modbus", "bmw\_connected\_drive", "bond", "bosch\_alarm", "bosch\_shc", "bosch\_smart\_camera", "brands", "brandt", "braviatv", "brel\_home", "bring", "broadlink", "brother", "brottsplatskartan", "browser", "brunt", "bryant\_evolution", "bsblan", "bswitch", "bt\_home\_hub\_5", "bt\_smarthub", "bthome", "bticino", "bubendorff", "bugu", "buienradar", "burbank\_water\_and\_power", "button", "bwt", "caldav", "calendar", "cambridge\_audio", "camera", "canary", "carrier", "casper\_glow", "cast", "ccm15", "centriconnect", "cert\_expiry", "chacon\_dio", "channels", "chef\_iq", "chess\_com", "chirpstack", "cielo\_home", "cisco\_ios", "cisco\_mobility\_express", "cisco\_webex\_teams", "citybikes", "clickatell", "clicksend", "clicksend\_tts", "climate", "cloud", "cloudflare", "cloudflare\_r2", "cmus", "co2signal", "coautilities", "coinbase", "collection\_image", "colmo", "color\_extractor", "comed", "comed\_hourly\_pricing", "comelit", "comfee", "comfoconnect", "command\_line", "compensation", "compit", "concord232", "coned", "config", "configurator", "constructa", "control4", "conversation", "cookidoo", "coolmaster", "cosori", "counter", "cover", "cozytouch", "cppm\_tracker", "cpuspeed", "cribl", "crownstone", "currencylayer", "cync", "dacia", "daikin", "danfoss\_air", "data\_grand\_lyon", "datadog", "date", "datetime", "ddwrt", "deako", "debug\_console", "debugpy", "deconz", "decora\_wifi", "decorquip", "default\_config", "delijn", "delmarva", "deluge", "demo", "denon", "denon\_rs232", "denonavr", "derivative", "devialet", "device\_automation", "device\_sun\_light\_trigger", "device\_tracker", "devolo\_home\_control", "devolo\_home\_network", "dexcom", "dhcp", "diagnostics", "dialogflow", "diaz", "digital\_loggers", "digital\_ocean", "directv", "discogs", "discord", "discovergy", "dlink", "dlna\_dmr", "dlna\_dms", "dnsip", "doods", "door", "doorbell", "doorbird", "dooya", "dormakaba\_dkey", "downloader", "dremel\_3d\_printer", "drop\_connect", "dropbox", "droplet", "dsmr", "dsmr\_reader", "duckdns", "duco", "dunehd", "duotecno", "duquesne\_light", "dwd\_weather\_warnings", "dynalite", "dyson\_infrared", "eafm", "earn\_e\_p1", "eastron", "easyenergy", "ebox", "ebusd", "ecoal\_boiler", "ecobee", "ecoforest", "econet", "ecosmart", "ecospar", "ecovacs", "ecowitt", "edifier\_infrared", "edimax", "edl21", "efergy", "egardia", "egauge", "eheimdigital", "eight\_sleep", "ekeybionyx", "electrasmart", "electric\_kiwi", "elevenlabs", "elgato", "elkm1", "elmax", "elv", "elvia", "emby", "emoncms", "emoncms\_history", "emonitor", "emulated\_hue", "emulated\_kasa", "emulated\_roku", "energenie\_power\_sockets", "energie\_vanons", "energieleser", "energy", "energyid", "energyzero", "engie\_be", "enigma2", "enocean", "enphase\_envoy", "entur\_public\_transport", "envertech\_evt800", "environment\_canada", "envisalink", "ephember", "epic\_games\_store", "epion", "epson", "eq3btsmart", "escea", "esera\_onewire", "esphome", "essent", "eufy", "eufylife\_ble", "eurotronic\_cometblue", "event", "evergy", "everlights", "everything\_smart\_home", "evil\_genius\_labs", "evohome", "exicom\_spin\_ble", "ezviz", "faa\_delays", "facebook", "fail2ban", "familyhub", "fan", "fastdotcom", "feedreader", "ffmpeg", "ffmpeg\_motion", "ffmpeg\_noise", "fibaro", "fido", "file", "file\_upload", "filesize", "filter", "fing", "fints", "fire\_tv", "firefly\_iii", "fireservicerota", "firmata", "fish\_audio", "fitbit", "fivem", "fixer", "fjaraskupan", "fleetgo", "flexit", "flexit\_bacnet", "flexom", "flic", "flic\_button", "flipr", "flo", "flock", "flow\_it", "flume", "fluss", "flux", "flux\_led", "folder", "folder\_watcher", "foobot", "foreca", "forecast\_solar", "forked\_daapd", "fortios", "foscam", "foursquare", "frankever", "free\_mobile", "freebox", "freedns", "freedompro", "freshr", "fressnapf\_tracker", "fritz", "fritzbox", "fritzbox\_callmonitor", "fronius", "frontend", "frontier\_silicon", "fuelprices\_dk", "fujitsu\_anywair", "fujitsu\_fglair", "fully\_kiosk", "fumis", "futurenow", "fyta", "gaggenau", "garadget", "garage\_door", "garages\_amsterdam", "gardena\_bluetooth", "gate", "gatus", "gaviota", "gc100", "gdacs", "generic", "generic\_hygrostat", "generic\_thermostat", "geniushub", "gentex\_homelink", "geo\_json\_events", "geo\_location", "geo\_rss\_events", "geocaching", "geofency", "geonetnz\_quakes", "geonetnz\_volcano", "geosphere\_austria\_warnings", "ghost", "gios", "github", "gitlab\_ci", "gitter", "glances", "go2rtc", "goalzero", "gogogate2", "goodwe", "google", "google\_air\_quality", "google\_assistant", "google\_assistant\_sdk", "google\_cloud", "google\_drive", "google\_generative\_ai\_conversation", "google\_health", "google\_mail", "google\_maps", "google\_photos", "google\_pubsub", "google\_sheets", "google\_tasks", "google\_translate", "google\_travel\_time", "google\_weather", "google\_wifi", "govee\_ble", "govee\_light\_local", "gpsd", "gpslogger", "grandstream\_home", "graphite", "gree", "gree\_infrared", "green\_planet\_energy", "greencell", "greeneye\_monitor", "group", "growatt\_server", "gtfs", "guardian", "guntamatic", "haas\_sohn", "habitica", "hanna", "harbor", "hardkernel", "hardware", "harman\_kardon\_avr", "harman\_luxury", "harmony", "harvey", "hase\_iq", "hassio", "havana\_shade", "haveibeenpwned", "haven\_iaq", "hddtemp", "hdfury", "hdmi\_cec", "heatmiser", "hegel", "heicko", "heiwa", "helty", "helty\_cloud", "heos", "here\_travel\_time", "heta", "hexaom", "hi\_kumo", "hikvision", "hikvisioncam", "hisense\_aehw4a1", "history", "history\_stats", "hitron\_coda", "hive", "hko", "hlk\_sw16", "holiday", "home\_connect", "home\_plus\_control", "homeassistant", "homeassistant\_alerts", "homeassistant\_connect\_zbt2", "homeassistant\_green", "homeassistant\_hardware", "homeassistant\_sky\_connect", "homeassistant\_yellow", "homee", "homekit", "homekit\_controller", "homematic", "homematicip\_cloud", "homevolt", "homewizard", "homeworks", "honeywell", "honeywell\_string\_lights", "horizon", "hortimax", "hotspring", "hp\_ilo", "hp\_printer", "hr\_energy\_qube", "html5", "http", "huawei\_lte", "hue", "hue\_ble", "huisbaasje", "humidifier", "humidity", "hunterdouglas\_powerview", "hurrican\_shutters\_wholesale", "husqvarna\_automower", "husqvarna\_automower\_ble", "huum", "hvv\_departures", "hydrawise", "hydroquebec\_peak", "hyperion", "hypontech", "ialarm", "iammeter", "iaqualink", "ibeacon", "icloud", "idasen\_desk", "idrive\_e2", "idteck\_prox", "ifttt", "iglo", "igloohome", "ign\_sismologia", "ihc", "illuminance", "image", "image\_processing", "image\_upload", "imap", "imeon\_inverter", "imgw\_pib", "immich", "imou", "improv\_ble", "incomfort", "indevolt", "indi\_allsky", "indianamichiganpower", "inels", "influxdb", "infrared", "inkbird", "input\_boolean", "input\_button", "input\_datetime", "input\_number", "input\_select", "input\_text", "inspired\_shades", "insteon", "integration", "intelliclima", "intellifire", "intent", "intent\_script", "intesishome", "inventor", "iometer", "ios", "iotawatt", "iotorero", "iotty", "iperf3", "ipma", "ipp", "iqvia", "irish\_rail\_transport", "irm\_kmi", "iron\_os", "isal", "iseo\_argo\_ble", "iskra", "islamic\_prayer\_times", "ismartwindow", "israel\_rail", "iss", "ista\_ecotrend", "isy994", "itach", "itunes", "ituran", "izone", "jellyfin", "jewish\_calendar", "joaoapps\_join", "juicenet", "justnimbus", "jvc\_projector", "kaco\_modbus", "kaco\_rs485", "kaiser\_nienhaus", "kaiterra", "kaleidescape", "kankun", "karakeep", "keba", "keenetic\_ndms2", "kef", "kegtron", "kentuckypower", "keyboard\_remote", "keymitt\_ble", "kiosker", "kira", "kitchen\_sink", "kiwi", "klik\_aan\_klik\_uit", "kmtronic", "knocki", "knx", "kodi", "konnected", "konnected\_esphome", "kostal\_plenticore", "kraken", "krispol", "kulersky", "kwb", "labs", "lacrosse", "lacrosse\_view", "lamarzocco", "lametric", "landisgyr\_heat\_meter", "lannouncer", "lastfm", "launch\_library", "laundrify", "lawn\_mower", "lcn", "ld2410\_ble", "leaone", "led\_ble", "led\_infrared", "legrand", "lektrico", "letpot", "levoit", "lg\_infrared", "lg\_netcast", "lg\_soundbar", "lg\_thinq", "lg\_tv\_rs232", "libre\_hardware\_monitor", "librenms", "libresync", "lichess", "lidarr", "liebherr", "life360", "lifx", "lifx\_cloud", "light", "lightwave", "limitlessled", "linak", "linkedgo", "linkplay", "linksys\_smart", "linux\_battery", "linx", "litejet", "litellm", "litterrobot", "little\_swan", "livisi", "llama\_cpp", "llamalab\_automate", "llm", "local\_calendar", "local\_file", "local\_ip", "local\_todo", "locative", "lock", "logbook", "logger", "lojack", "london\_air", "london\_underground", "lookin", "loqed", "lorawan", "lovelace", "luci", "luftdaten", "lunatone", "lupusec", "lutron", "lutron\_caseta", "luxaflex", "lw12wifi", "lyngdorf", "lyric", "madeco", "madvr", "mailgun", "manual", "manual\_mqtt", "map\_tiles", "marantz", "marantz\_infrared", "marantz\_rs232", "marketplace", "martec", "marytts", "mastodon", "matrix", "matter", "maxcube", "maytag", "mazda", "mcp", "mcp\_server", "mealie", "meater", "medcom\_ble", "media\_extractor", "media\_player", "media\_source", "mediaroom", "melcloud", "melcloud\_home", "melissa", "melnor", "meraki", "message\_bird", "met", "met\_eireann", "meteo\_france", "meteo\_lt", "meteoalarm", "meteoclimatic", "metoffice", "mfi", "microbees", "microsoft", "midea", "miele", "mijn\_farmad\_apotheek", "mijndomein\_energie", "mikrotik", "mill", "min\_max", "minecraft\_server", "minio", "mitsubishi\_comfort", "mjpeg", "moat", "mobile\_app", "mochad", "modbus", "modem\_callerid", "modern\_forms", "moehlenhoff\_alpha2", "moisture", "mold\_indicator", "monarch\_money", "monessen", "monoprice", "monzo", "moon", "mopeka", "motion", "motion\_blinds", "motionblinds\_ble", "motioneye", "motionmount", "mpd", "mqtt", "mqtt\_eventstream", "mqtt\_json", "mqtt\_room", "mqtt\_statestream", "msteams", "mta", "mullvad", "music\_assistant", "mutesync", "mvglive", "my", "my\_pv", "myneomitis", "myq", "mysensors", "mystrom", "mythicbeastsdns", "myuplink", "nad", "nam", "namecheapdns", "nanoleaf", "nasweb", "nature\_remo", "neato", "nederlandse\_spoorwegen", "neff", "neo", "neopool", "ness\_alarm", "nest", "netatmo", "netdata", "netgear", "netgear\_lte", "netio", "netsu", "network", "neurio\_energy", "nexblue", "nexen", "nexia", "nexity", "nextbus", "nextcloud", "nextdns", "nfandroidtv", "nibe\_heatpump", "nice\_go", "nightscout", "niko\_home\_control", "nilu", "nina", "nintendo\_parental\_controls", "nissan\_leaf", "nmap\_tracker", "nmbs", "no\_ip", "noaa\_tides", "nobo\_hub", "nordpool", "norway\_air", "notify", "notify\_events", "notion", "novy\_cooker\_hood", "nrgkick", "nsw\_fuel\_station", "nsw\_rural\_fire\_service\_feed", "ntfy", "nuheat", "nuki", "numato", "number", "nut", "nutrichef", "nws", "nx584", "nyt\_games", "nzbget", "oasa\_telematics", "obihai", "occupancy", "octoprint", "oem", "ogemray", "ogeneral", "ohmconnect", "ohme", "okok\_scale", "olimpia\_splendid", "ollama", "ombi", "omie", "omnilogic", "onboarding", "oncue", "ondilo\_ico", "onedrive", "onedrive\_for\_business", "onewire", "onida\_infrared", "onkyo", "onvif", "open\_meteo", "open\_router", "openai\_conversation", "openalpr\_cloud", "opendisplay", "openerz", "openevse", "openexchangerates", "opengarage", "openhardwaremonitor", "openhome", "openrgb", "opensensemap", "opensky", "opentherm\_gw", "openuv", "openweathermap", "opnsense", "opower", "opple", "oralb", "oru\_opower", "orvibo", "osoenergy", "osram\_infrared", "osramlightify", "otbr", "otp", "ouman\_eh\_800", "ourgroceries", "overkiz", "overseerr", "ovhcloud\_ai\_endpoints", "ovo\_energy", "owntracks", "p1\_monitor", "paj\_gps", "palazzetti", "panasonic\_bluray", "panasonic\_viera", "panel\_custom", "paperless\_ngx", "pcs\_lighting", "peblar", "peco", "peco\_opower", "pegel\_online", "pencom", "pepco", "permobil", "persang\_infrared", "persistent\_notification", "person", "pge", "pglab", "philips\_infrared", "philips\_js", "pi\_hole", "picnic", "picotts", "pinecil", "ping", "pioneer", "piper", "pitsos", "pjlink", "plaato", "plant", "playstation\_network", "plex", "plugwise", "plum\_lightpad", "pocketcasts", "point", "pooldose", "poolsense", "portainer", "power", "powerfox", "powerfox\_local", "powerwall", "prana", "private\_ble\_device", "pro\_breeze", "probe\_plus", "profiler", "profilo", "progettihwsw", "proliphix", "prometheus", "prosegur", "prowl", "proximity", "proxmoxve", "proxy", "prusalink", "ps4", "pse", "psoklahoma", "ptdevices", "pterodactyl", "pulseaudio\_loopback", "pure\_energie", "purpleair", "push", "pushbullet", "pushover", "pushsafer", "pvoutput", "pvpc\_hourly\_pricing", "pyload", "python\_script", "qbittorrent", "qbus", "qingping", "qld\_bushfire", "qnap", "qnap\_qsw", "qrcode", "quadrafire", "quantum\_gateway", "qvr\_pro", "qwikswitch", "rabbitair", "rachio", "radarr", "radio\_browser", "radio\_frequency", "radiotherm", "rainbird", "rainbowminer", "rainforest\_eagle", "rainforest\_raven", "rainmachine", "random", "rapt\_ble", "raspberry\_pi", "raspyrfm", "raven\_rock\_mfg", "rdw", "recollect\_waste", "recorder", "recovery\_mode", "recswitch", "reddit", "redgtech", "refoss", "rehlko", "rejseplanen", "remember\_the\_milk", "remote", "remote\_calendar", "remote\_rpi\_gpio", "renault", "renson", "reolink", "repairs", "repetier", "rest", "rest\_command", "rexel", "rflink", "rfxtrx", "rhasspy", "ridwell", "ring", "ripple", "risco", "rituals\_perfume\_genie", "rmvtransport", "roborock", "rocketchat", "roku", "romy", "roomba", "roon", "rotenso", "route53", "route\_b\_smart\_meter", "rova", "rpi\_power", "rss\_feed\_template", "rtorrent", "ruckus\_unleashed", "russound\_rio", "russound\_rnet", "ruuvi\_gateway", "ruuvitag\_ble", "rympro", "sabnzbd", "saj", "samsam", "samsung\_exlink", "samsung\_infrared", "samsungtv", "sanix", "satel\_integra", "saunum", "scene", "schedule", "schlage", "schluter", "scl", "scorpiontrack", "scrape", "screenaway", "screenlogic", "script", "seafile", "search", "season", "select", "sendgrid", "sense", "sensecap\_lorawan", "sensibo", "sensirion\_ble", "sensor", "sensorblue", "sensorpro", "sensorpush", "sensorpush\_cloud", "sensoterra", "sentry", "senz", "serial", "serial\_pm", "sesame", "seven\_segments", "seventeentrack", "sfr\_box", "sftp\_storage", "sharkiq", "shell\_command", "shelly", "shodan", "shopping\_list", "sia", "siemens", "sighthound", "signal\_messenger", "silla\_prism", "silvercrest\_infrared", "simplefin", "simplepush", "simplisafe", "simply\_automated", "simu", "sinch", "siren", "sisyphus", "skoda", "sky\_hub", "sky\_remote", "skybeacon", "skybell", "slack", "sleep\_as\_android", "sleepiq", "slide", "slide\_local", "slimproto", "sma", "smappee", "smarla", "smart\_blinds", "smart\_home", "smart\_meter\_texas", "smart\_rollos", "smarther", "smartthings", "smarttub", "smarty", "smartyplants", "smhi", "smlight", "smtp", "smud", "snapcast", "snmp", "snoo", "snooz", "sofar", "solaredge", "solaredge\_modbus", "solarlog", "solarman", "solax", "solyx\_energy\_cloud", "soma", "somfy", "somfy\_mylink", "sonarr", "songpal", "sonos", "sony\_projector", "soundtouch", "spaceapi", "spc", "specialized\_turbo", "speedtestdotnet", "spider", "splunk", "spotify", "sql", "squeezebox", "srp\_energy", "ssdp", "starline", "starlingbank", "starlink", "startca", "statistics", "statsd", "steam\_online", "steamist", "steamvr\_base\_station", "steinway\_lyngdorf", "stiebel\_eltron", "stookwijzer", "stream", "streamlabswater", "stt", "subaru", "suez\_water", "sun", "sunricher\_dali", "sunsynk", "sunweg", "supervisord", "supla", "surepetcare", "swepco", "swiss\_hydrological\_data", "swiss\_public\_transport", "swisscom", "switch", "switch\_as\_x", "switchbee", "switchbot", "switchbot\_cloud", "switcher\_kis", "switchmate", "symfonisk", "syncthing", "syncthru", "synology\_chat", "synology\_dsm", "synology\_srm", "syslog", "system\_bridge", "system\_health", "system\_log", "systemmonitor", "systemnexa2", "tado", "tag", "tailscale", "tailwind", "tami4", "tank\_utility", "tankerkoenig", "tapsaff", "tasmota", "tautulli", "tcp", "technove", "ted5000", "tedee", "telegram", "telegram\_bot", "teleinfo", "tellduslive", "tellstick", "telnet", "teltonika", "temper", "temperature", "template", "tesla\_fleet", "tesla\_wall\_connector", "teslemetry", "tessie", "text", "theben\_conexa", "thermador", "thermobeacon", "thermoplus", "thermopro", "thethingsnetwork", "thethingsnetwork\_lorawan", "thingspeak", "thinkingcleaner", "thomson", "thread", "threema", "threshold", "tibber", "tile", "tilt\_ble", "tilt\_pi", "time", "time\_date", "timer", "tmb", "tod", "todo", "todoist", "togrill", "tolo", "tomato", "tomorrowio", "tonewinner", "toon", "torque", "toshiba\_lifestyle", "totalconnect", "touchline", "touchline\_sl", "tplink", "tplink\_lte", "tplink\_omada", "tplink\_tapo", "traccar", "traccar\_server", "trace", "tractive", "tradfri", "trafikverket\_camera", "trafikverket\_ferry", "trafikverket\_train", "trafikverket\_weatherstation", "trane", "transmission", "transport\_nsw", "trend", "triggercmd", "trmnl", "tts", "tuya", "twentemilieu", "twilio", "twilio\_call", "twilio\_sms", "twinkly", "twitch", "twitter", "ubiwizz", "ublockout", "ubus", "uhoo", "uk\_transport", "ukraine\_alarm", "ultraloq", "unifi", "unifi\_access", "unifi\_direct", "unifi\_discovery", "unifiprotect", "universal", "upb", "upc\_connect", "upcloud", "update", "upnp", "uprise\_smart\_shades", "uptime", "uptime\_kuma", "uptimerobot", "usage\_prediction", "usb", "usgs\_earthquakes\_feed", "utility\_meter", "uvc", "v2c", "vacuum", "vagner\_pool", "vallox", "valve", "vandelo", "vasttrafik", "vegehub", "velbus", "velux", "venstar", "vera", "verisure", "vermont\_castings", "versasense", "version", "vesync", "viaggiatreno", "vibration", "vicare", "victron\_ble", "victron\_gx", "victron\_remote\_monitoring", "vilfo", "vistapool", "vitesy", "vivotek", "vizio", "vlc\_telnet", "vodafone\_station", "voicerss", "voip", "volkszaehler", "volumio", "volvo", "w800rf32", "wahin", "wake\_on\_lan", "wake\_word", "wallbox", "waqi", "water\_heater", "waterfurnace", "watergate", "watts", "watttime", "wattwaechter", "waze\_travel\_time", "weather", "weatherflow", "weatherflow\_cloud", "weatherkit", "web\_rtc", "webdav", "webhook", "webmin", "webostv", "websocket\_api", "weheat", "wemo", "whirlpool", "whisper", "whois", "wiffi", "wiim", "wilight", "willow", "window", "wirelesstag", "withings", "wiz", "wled", "wmspro", "wolflink", "workday", "worldclock", "worldtidesinfo", "worxlandroid", "ws66i", "wsdot", "wyoming", "x10", "xbox", "xeoma", "xiaomi", "xiaomi\_aqara", "xiaomi\_ble", "xiaomi\_miio", "xiaomi\_tv", "xiaomi\_weather", "xmpp", "xs1", "xthings\_cloud", "yale", "yale\_smart\_alarm", "yalexs\_ble", "yamaha", "yamaha\_musiccast", "yandex\_transport", "yandextts", "yardian", "yeelight", "yeelightsunflower", "yi", "yolink", "yoto", "youless", "youtube", "zabbix", "zamg", "zbox\_hub", "zengge", "zeroconf", "zerproc", "zeversolar", "zha", "zhong\_hong", "ziggo\_mediabox\_xl", "zimi", "zinvolt", "zodiac", "zondergas", "zone", "zoneminder", "zonneplan", "zwave\_js", "zwave\_me")

*Default:*

``` nix
[
  "default_config"
  "met"
  "esphome"
]
```

*Example:*

``` nix
[
  "analytics"
  "default_config"
  "esphome"
  "my"
  "shopping_list"
  "wled"
]
```

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.extraPackages` {#opt-services.home-assistant.extraPackages}

List of packages to add to propagatedBuildInputs.

A popular example is `python3Packages.psycopg2`
for PostgreSQL support in the recorder component.

*Type:* function that evaluates to a(n) list of package

*Default:*

``` nix
python3Packages: with python3Packages; [];
```

*Example:*

``` nix
python3Packages: with python3Packages; [
  # postgresql support
  psycopg2
];
```

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.lovelaceConfig` {#opt-services.home-assistant.lovelaceConfig}

Your `ui-lovelace.yaml` as a Nix attribute set.
Setting this option will automatically configure a Lovelace dashboard in YAML mode.

Beware that setting this option will delete your previous `ui-lovelace.yaml`

*Type:* null or YAML 1.1 value

*Default:* `null`

*Example:*

``` nix
{
  title = "My Awesome Home";
  views = [ {
    title = "Example";
    cards = [ {
      type = "markdown";
      title = "Lovelace";
      content = "Welcome to your **Lovelace UI**.";
    } ];
  } ];
}
```

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.lovelaceConfigFile` {#opt-services.home-assistant.lovelaceConfigFile}

Your `ui-lovelace.yaml` managed as configuration file.
Setting this option will automatically configure a Lovelace dashboard in YAML mode.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/path/to/ui-lovelace.yaml"`

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.lovelaceConfigWritable` {#opt-services.home-assistant.lovelaceConfigWritable}

Whether to make `ui-lovelace.yaml` writable.

This will allow you to edit it from Home Assistant's web interface.

This only has an effect if `lovelaceConfig` is set.
However, bear in mind that it will be overwritten at every start of the service.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.openFirewallForComponents` {#opt-services.home-assistant.openFirewallForComponents}

Whether to open required firewall ports for enabled components.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.package` {#opt-services.home-assistant.package}

The Home Assistant package to use.

*Type:* package

*Default:*

``` nix
pkgs.home-assistant.overrideAttrs (oldAttrs: {
  doInstallCheck = false;
})
```

*Example:*

``` nix
pkgs.home-assistant.override {
  extraPackages = python3Packages: with python3Packages; [
    psycopg2
  ];
  extraComponents = [
    "default_config"
    "esphome"
    "met"
  ];
}
```

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.home-assistant.themes` {#opt-services.home-assistant.themes}

List of themes to load.

Available themes can be found below `pkgs.home-assistant-themes`.

::: note
When `themes` is set, the module takes authoritative control
over the `frontend.themes` setting in
[`services.home-assistant.config`](#opt-services.home-assistant.config).
:::

*Type:* list of package that is a Home Assistant theme

*Default:* `[ ]`

*Example:*

``` nix
with pkgs.home-assistant-themes; [
  material-you-theme
];
```

*Declared by:* [`nixos/modules/services/home-automation/home-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/home-assistant.nix)

## `services.homebox.database.createLocally` {#opt-services.homebox.database.createLocally}

Configure local PostgreSQL database server for Homebox.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/homebox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/homebox.nix)

## `services.homebox.enable` {#opt-services.homebox.enable}

Whether to enable homebox.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/homebox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/homebox.nix)

## `services.homebox.group` {#opt-services.homebox.group}

Group under which Homebox runs.

*Type:* string

*Default:* `"homebox"`

*Declared by:* [`nixos/modules/services/web-apps/homebox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/homebox.nix)

## `services.homebox.package` {#opt-services.homebox.package}

The homebox package to use.

*Type:* package

*Default:* `pkgs.homebox`

*Declared by:* [`nixos/modules/services/web-apps/homebox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/homebox.nix)

## `services.homebox.secrets` {#opt-services.homebox.secrets}

This follows the same structure as [`services.homebox.settings`](#opt-services.homebox.settings)
but the value of each key is a path.

The specified secret path is then read by systemd via [`LoadCredential=`](https://www.freedesktop.org/software/systemd/man/latest/systemd.exec.html#Credentials)
and templated into [`services.homebox.settings`](#opt-services.homebox.settings) for you.

*Type:* open submodule of attribute set of absolute path not in the Nix store

*Default:* `{ }`

*Example:*

``` nix
{
  HBOX_AUTH_API_KEY_PEPPER = "/run/secrets/homebox-api-pepper";
}
```

*Declared by:* [`nixos/modules/services/web-apps/homebox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/homebox.nix)

## `services.homebox.secrets.HBOX_AUTH_API_KEY_PEPPER` {#opt-services.homebox.secrets.HBOX_AUTH_API_KEY_PEPPER}

Path to the API key pepper secret file (required for homebox to start).

*Type:* absolute path not in the Nix store

*Default:* `"/var/lib/homebox/api-pepper-secret"`

*Example:* `"/run/secrets/homebox-api-pepper"`

*Declared by:* [`nixos/modules/services/web-apps/homebox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/homebox.nix)

## `services.homebox.settings` {#opt-services.homebox.settings}

The homebox configuration as environment variables. For definitions and available options see the upstream
[documentation](https://homebox.software/en/configure/#configure-homebox).

*Type:* open submodule of attribute set of (null or string)

*Default:*

``` nix
{
  HBOX_STORAGE_CONN_STRING = "file:///var/lib/homebox?no_tmp_dir=1";
  HBOX_STORAGE_PREFIX_PATH = "data";
  HBOX_DATABASE_DRIVER = "sqlite3";
  HBOX_DATABASE_SQLITE_PATH = "/var/lib/homebox/data/homebox.db?_pragma=busy_timeout=999&_pragma=journal_mode=WAL&_fk=1";
  HBOX_OPTIONS_ALLOW_REGISTRATION = "false";
  HBOX_OPTIONS_GITHUB_RELEASE_CHECK = "false";
  HBOX_MODE = "production";
  HOME = "/var/lib/homebox";
}
```

*Declared by:* [`nixos/modules/services/web-apps/homebox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/homebox.nix)

## `services.homebox.user` {#opt-services.homebox.user}

User account under which Homebox runs.

*Type:* string

*Default:* `"homebox"`

*Declared by:* [`nixos/modules/services/web-apps/homebox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/homebox.nix)

## `services.homebridge.enable` {#opt-services.homebridge.enable}

Whether to enable Homebridge: Homekit home automation.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homebridge.environmentFile` {#opt-services.homebridge.environmentFile}

Path to an environment-file which may contain secrets.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homebridge.group` {#opt-services.homebridge.group}

Group to run homebridge as.

*Type:* string

*Default:* `"homebridge"`

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homebridge.openFirewall` {#opt-services.homebridge.openFirewall}

Open ports in the firewall for the Homebridge web interface and service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homebridge.pluginPath` {#opt-services.homebridge.pluginPath}

Path to the plugin download directory (needs to be writeable).
Seems this needs to end with node\_modules, as Homebridge will run npm
on the parent directory.

*Type:* string

*Default:* `"/var/lib/homebridge/node_modules"`

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homebridge.settings` {#opt-services.homebridge.settings}

Configuration options for homebridge.

For more details, see [the homebridge documentation](https://github.com/homebridge/homebridge/wiki/Homebridge-Config-JSON-Explained).

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homebridge.settings.accessories` {#opt-services.homebridge.settings.accessories}

Homebridge Accessories

*Type:* list of (open submodule of (JSON value))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homebridge.settings.accessories.*.accessory` {#opt-services.homebridge.settings.accessories._.accessory}

Accessory type

*Type:* string

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homebridge.settings.accessories.*.name` {#opt-services.homebridge.settings.accessories._.name}

Name of the accessory

*Type:* string

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homebridge.settings.bridge.name` {#opt-services.homebridge.settings.bridge.name}

Name of the homebridge

*Type:* string

*Default:* `"Homebridge"`

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homebridge.settings.bridge.port` {#opt-services.homebridge.settings.bridge.port}

The port homebridge listens on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `51826`

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homebridge.settings.description` {#opt-services.homebridge.settings.description}

Description of the homebridge instance.

*Type:* string

*Default:* `"Homebridge"`

*Read only*

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homebridge.settings.platforms` {#opt-services.homebridge.settings.platforms}

Homebridge Platforms

*Type:* list of (open submodule of (JSON value))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homebridge.settings.platforms.*.name` {#opt-services.homebridge.settings.platforms._.name}

Name of the platform

*Type:* string

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homebridge.settings.platforms.*.platform` {#opt-services.homebridge.settings.platforms._.platform}

Platform type

*Type:* string

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homebridge.uiSettings` {#opt-services.homebridge.uiSettings}

Configuration options for homebridge config UI plugin.

For more details, see [the homebridge-config-ui-x documentation](https://github.com/homebridge/homebridge-config-ui-x/wiki/Config-Options).

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homebridge.uiSettings.log.method` {#opt-services.homebridge.uiSettings.log.method}

Method to use for logging

*Type:* string

*Default:* `"systemd"`

*Read only*

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homebridge.uiSettings.log.service` {#opt-services.homebridge.uiSettings.log.service}

Name of the systemd service to log to

*Type:* string

*Default:* `"homebridge"`

*Read only*

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homebridge.uiSettings.name` {#opt-services.homebridge.uiSettings.name}

Name of the homebridge UI platform

*Type:* string

*Default:* `"Config"`

*Read only*

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homebridge.uiSettings.platform` {#opt-services.homebridge.uiSettings.platform}

Type of the homebridge UI platform

*Type:* string

*Default:* `"config"`

*Read only*

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homebridge.uiSettings.port` {#opt-services.homebridge.uiSettings.port}

The port the UI web service should listen on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8581`

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homebridge.uiSettings.restart` {#opt-services.homebridge.uiSettings.restart}

Command to restart the homebridge UI service

*Type:* string

*Default:* `"sudo -n systemctl restart homebridge"`

*Read only*

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homebridge.user` {#opt-services.homebridge.user}

User to run homebridge as.

*Type:* string

*Default:* `"homebridge"`

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homebridge.userStoragePath` {#opt-services.homebridge.userStoragePath}

Path to store homebridge user files (needs to be writeable).

*Type:* string

*Default:* `"/var/lib/homebridge"`

*Declared by:* [`nixos/modules/services/home-automation/homebridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/homebridge.nix)

## `services.homed.enable` {#opt-services.homed.enable}

Whether to enable systemd home area/user account manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/homed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/homed.nix)

## `services.homed.promptOnFirstBoot` {#opt-services.homed.promptOnFirstBoot}

Whether to enable interactively prompting for user creation on first boot
.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/homed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/homed.nix)

## `services.homed.settings.Home` {#opt-services.homed.settings.Home}

Options for systemd-homed. See `homed.conf(5)` man page for
available options.

*Type:* open submodule of attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  DefaultFileSystemType = "btrfs";
  DefaultStorage = "luks";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/homed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/homed.nix)

## `services.homepage-dashboard.allowedHosts` {#opt-services.homepage-dashboard.allowedHosts}

Hosts that homepage-dashboard will be running under.
You will want to change this in order to acess homepage from anything other than localhost.
see the upsream documentation:

[https://gethomepage.dev/installation/#homepage\_allowed\_hosts](https://gethomepage.dev/installation/#homepage_allowed_hosts)

*Type:* string

*Default:* `"localhost:8082,127.0.0.1:8082"`

*Example:* `"example.com"`

*Declared by:* [`nixos/modules/services/misc/homepage-dashboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/homepage-dashboard.nix)

## `services.homepage-dashboard.bookmarks` {#opt-services.homepage-dashboard.bookmarks}

Homepage bookmarks configuration.

See [https://gethomepage.dev/configs/bookmarks/](https://gethomepage.dev/configs/bookmarks/).

*Type:* YAML 1.1 value

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    Developer = [
      {
        Github = [
          {
            abbr = "GH";
            href = "https://github.com/";
          }
        ];
      }
    ];
  }
  {
    Entertainment = [
      {
        YouTube = [
          {
            abbr = "YT";
            href = "https://youtube.com/";
          }
        ];
      }
    ];
  }
]
```

*Declared by:* [`nixos/modules/services/misc/homepage-dashboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/homepage-dashboard.nix)

## `services.homepage-dashboard.customCSS` {#opt-services.homepage-dashboard.customCSS}

Custom CSS for styling Homepage.

See [https://gethomepage.dev/configs/custom-css-js/](https://gethomepage.dev/configs/custom-css-js/).

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/homepage-dashboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/homepage-dashboard.nix)

## `services.homepage-dashboard.customJS` {#opt-services.homepage-dashboard.customJS}

Custom Javascript for Homepage.

See [https://gethomepage.dev/configs/custom-css-js/](https://gethomepage.dev/configs/custom-css-js/).

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/homepage-dashboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/homepage-dashboard.nix)

## `services.homepage-dashboard.docker` {#opt-services.homepage-dashboard.docker}

Homepage docker configuration.

See [https://gethomepage.dev/configs/docker/](https://gethomepage.dev/configs/docker/).

*Type:* YAML 1.1 value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/homepage-dashboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/homepage-dashboard.nix)

## `services.homepage-dashboard.enable` {#opt-services.homepage-dashboard.enable}

Whether to enable Homepage Dashboard, a highly customizable application dashboard.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/homepage-dashboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/homepage-dashboard.nix)

## `services.homepage-dashboard.environmentFiles` {#opt-services.homepage-dashboard.environmentFiles}

A list of paths to environment files that contain environment variables to pass
to the homepage-dashboard service, for the purpose of passing secrets to
the service.

See the upstream documentation:

[https://gethomepage.dev/installation/docker/#using-environment-secrets](https://gethomepage.dev/installation/docker/#using-environment-secrets)

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/homepage-dashboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/homepage-dashboard.nix)

## `services.homepage-dashboard.kubernetes` {#opt-services.homepage-dashboard.kubernetes}

Homepage kubernetes configuration.

See [https://gethomepage.dev/configs/kubernetes/](https://gethomepage.dev/configs/kubernetes/).

*Type:* YAML 1.1 value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/homepage-dashboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/homepage-dashboard.nix)

## `services.homepage-dashboard.listenPort` {#opt-services.homepage-dashboard.listenPort}

Port for Homepage to bind to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8082`

*Declared by:* [`nixos/modules/services/misc/homepage-dashboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/homepage-dashboard.nix)

## `services.homepage-dashboard.openFirewall` {#opt-services.homepage-dashboard.openFirewall}

Open ports in the firewall for Homepage.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/homepage-dashboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/homepage-dashboard.nix)

## `services.homepage-dashboard.package` {#opt-services.homepage-dashboard.package}

The homepage-dashboard package to use.

*Type:* package

*Default:* `pkgs.homepage-dashboard`

*Declared by:* [`nixos/modules/services/misc/homepage-dashboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/homepage-dashboard.nix)

## `services.homepage-dashboard.proxmox` {#opt-services.homepage-dashboard.proxmox}

Homepage proxmox configuration.

See [https://gethomepage.dev/configs/proxmox/](https://gethomepage.dev/configs/proxmox/).

*Type:* YAML 1.1 value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/homepage-dashboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/homepage-dashboard.nix)

## `services.homepage-dashboard.services` {#opt-services.homepage-dashboard.services}

Homepage services configuration.

See [https://gethomepage.dev/configs/services/](https://gethomepage.dev/configs/services/).

*Type:* YAML 1.1 value

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    "My First Group" = [
      {
        "My First Service" = {
          description = "Homepage is awesome";
          href = "http://localhost/";
        };
      }
    ];
  }
  {
    "My Second Group" = [
      {
        "My Second Service" = {
          description = "Homepage is the best";
          href = "http://localhost/";
        };
      }
    ];
  }
]
```

*Declared by:* [`nixos/modules/services/misc/homepage-dashboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/homepage-dashboard.nix)

## `services.homepage-dashboard.settings` {#opt-services.homepage-dashboard.settings}

Homepage settings.

See [https://gethomepage.dev/configs/settings/](https://gethomepage.dev/configs/settings/).

*Type:* YAML 1.1 value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/homepage-dashboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/homepage-dashboard.nix)

## `services.homepage-dashboard.widgets` {#opt-services.homepage-dashboard.widgets}

Homepage widgets configuration.

See [https://gethomepage.dev/widgets/](https://gethomepage.dev/widgets/).

*Type:* YAML 1.1 value

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    resources = {
      cpu = true;
      disk = "/";
      memory = true;
    };
  }
  {
    search = {
      provider = "duckduckgo";
      target = "_blank";
    };
  }
]
```

*Declared by:* [`nixos/modules/services/misc/homepage-dashboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/homepage-dashboard.nix)

## `services.homer.enable` {#opt-services.homer.enable}

Whether to enable A dead simple static HOMepage for your servER to keep your services on hand, from a simple yaml configuration file.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/homer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/homer.nix)

## `services.homer.package` {#opt-services.homer.package}

The homer package to use.

*Type:* package

*Default:* `pkgs.homer`

*Declared by:* [`nixos/modules/services/web-apps/homer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/homer.nix)

## `services.homer.settings` {#opt-services.homer.settings}

Settings serialized into `config.yml` before build.
If left empty, the default configuration shipped with the package will be used instead.
For more information, see the [official documentation](https://github.com/bastienwirtz/homer/blob/main/docs/configuration.md).

Note that the full configuration will be written to the nix store as world readable, which may include secrets such as [api-keys](https://github.com/bastienwirtz/homer/blob/main/docs/customservices.md).

To add files such as icons or backgrounds, you can reference them in line such as

``` nix
icon = "${./icon.png}";
```

This will add the file to the nix store upon build, referencing it by file path as expected by Homer.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
''
  {
    title = "App dashboard";
    subtitle = "Homer";
    logo = "assets/logo.png";
    header = true;
    footer = '''
      <p>Created with <span class="has-text-danger">❤️</span> with
      <a href="https://bulma.io/">bulma</a>,
      <a href="https://vuejs.org/">vuejs</a> &
      <a href="https://fontawesome.com/">font awesome</a> //
      Fork me on <a href="https://github.com/bastienwirtz/homer">
      <i class="fab fa-github-alt"></i></a></p>
    ''';
    columns = "3";
    connectivityCheck = true;
  
    proxy = {
      useCredentials = false;
      headers = {
        Test = "Example";
        Test1 = "Example1";
      };
    };
  
    defaults = {
      layout = "columns";
      colorTheme = "auto";
    };
  
    theme = "default";
  
    message = {
      style = "is-warning";
      title = "Optional message!";
      icon = "fa fa-exclamation-triangle";
      content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
    };
  
    links = [
      {
        name = "Link 1";
        icon = "fab fa-github";
        url = "https://github.com/bastienwirtz/homer";
        target = "_blank";
      }
      {
        name = "link 2";
        icon = "fas fa-book";
        url = "https://github.com/bastienwirtz/homer";
      }
    ];
  
    services = [
      {
        name = "Application";
        icon = "fas fa-code-branch";
        items = [
          {
            name = "Awesome app";
            logo = "assets/tools/sample.png";
            subtitle = "Bookmark example";
            tag = "app";
            keywords = "self hosted reddit";
            url = "https://www.reddit.com/r/selfhosted/";
            target = "_blank";
          }
          {
            name = "Another one";
            logo = "assets/tools/sample2.png";
            subtitle = "Another application";
            tag = "app";
            tagstyle = "is-success";
            url = "#";
          }
        ];
      }
      {
        name = "Other group";
        icon = "fas fa-heartbeat";
        items = [
          {
            name = "Pi-hole";
            logo = "assets/tools/sample.png";
            tag = "other";
            url = "http://192.168.0.151/admin";
            type = "PiHole";
            target = "_blank";
          }
        ];
      }
    ];
  }
  
''
```

*Declared by:* [`nixos/modules/services/web-apps/homer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/homer.nix)

## `services.homer.virtualHost.caddy.enable` {#opt-services.homer.virtualHost.caddy.enable}

Whether to enable a virtualhost to serve homer through caddy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/homer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/homer.nix)

## `services.homer.virtualHost.domain` {#opt-services.homer.virtualHost.domain}

Domain to use for the virtual host.

This can be used to change nginx options like

``` nix
services.nginx.virtualHosts."$\{config.services.homer.virtualHost.domain}".listen = [ ... ]
```

or

``` nix
services.nginx.virtualHosts."example.com".listen = [ ... ]
```

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/homer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/homer.nix)

## `services.homer.virtualHost.nginx.enable` {#opt-services.homer.virtualHost.nginx.enable}

Whether to enable a virtualhost to serve homer through nginx.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/homer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/homer.nix)

## `services.hoogle.enable` {#opt-services.hoogle.enable}

Whether to enable Haskell documentation server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/development/hoogle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/hoogle.nix)

## `services.hoogle.extraOptions` {#opt-services.hoogle.extraOptions}

Additional command-line arguments to pass to
`hoogle server`

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--no-security-headers"
]
```

*Declared by:* [`nixos/modules/services/development/hoogle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/hoogle.nix)

## `services.hoogle.haskellPackages` {#opt-services.hoogle.haskellPackages}

Which haskell package set to use.

*Type:* attribute set

*Default:* `pkgs.haskellPackages`

*Declared by:* [`nixos/modules/services/development/hoogle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/hoogle.nix)

## `services.hoogle.home` {#opt-services.hoogle.home}

Url for hoogle logo

*Type:* string

*Default:* `"https://hoogle.haskell.org"`

*Declared by:* [`nixos/modules/services/development/hoogle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/hoogle.nix)

## `services.hoogle.host` {#opt-services.hoogle.host}

Set the host to bind on.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/development/hoogle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/hoogle.nix)

## `services.hoogle.packages` {#opt-services.hoogle.packages}

The Haskell packages to generate documentation for.

The option value is a function that takes the package set specified in
the `haskellPackages` option as its sole parameter and
returns a list of packages.

*Type:* function that evaluates to a(n) list of package

*Default:* `hp: []`

*Example:* `hp: with hp; [ text lens ]`

*Declared by:* [`nixos/modules/services/development/hoogle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/hoogle.nix)

## `services.hoogle.port` {#opt-services.hoogle.port}

Port number Hoogle will be listening to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/development/hoogle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/hoogle.nix)

## `services.hostapd.enable` {#opt-services.hostapd.enable}

Whether to enable hostapd, a user space daemon for access point and
authentication servers. It implements IEEE 802.11 access point management,
IEEE 802.1X/WPA/WPA2/EAP Authenticators, RADIUS client, EAP server, and RADIUS
authentication server
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.package` {#opt-services.hostapd.package}

The hostapd package to use.

*Type:* package

*Default:* `pkgs.hostapd`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios` {#opt-services.hostapd.radios}

This option allows you to define APs for one or multiple physical radios.
At least one radio must be specified.

For each radio, hostapd requires a separate logical interface (like wlp3s0, wlp3s1, ...).
A default interface is usually be created automatically by your system, but to use
multiple radios of a single device, it may be required to create additional logical interfaces
for example by using [`networking.wlanInterfaces`](../../options/networking/index.md#opt-networking.wlanInterfaces).

Each physical radio can only support a single hardware-mode that is configured via
(`services.hostapd.radios.<radio>.band`). To create a dual-band
or tri-band AP, you will have to use a device that has multiple physical radios
and supports configuring multiple APs (Refer to valid interface combinations in
`iw list`).

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  # Simple 2.4GHz AP
  wlp2s0 = {
    # countryCode = "US";
    networks.wlp2s0 = {
      ssid = "AP 1";
      authentication.saePasswords = [{ passwordFile = "/run/secrets/my-password"; }];
    };
  };

  # WiFi 5 (5GHz) with two advertised networks
  wlp3s0 = {
    band = "5g";
    channel = 0; # Enable automatic channel selection (ACS). Use only if your hardware supports it.
    # countryCode = "US";
    networks.wlp3s0 = {
      ssid = "My AP";
      authentication.saePasswords = [{ passwordFile = "/run/secrets/my-password"; }];
    };
    networks.wlp3s0-1 = {
      ssid = "Open AP with WiFi5";
      authentication.mode = "none";
    };
  };

  # Legacy WPA2 example
  wlp4s0 = {
    # countryCode = "US";
    networks.wlp4s0 = {
      ssid = "AP 2";
      authentication = {
        mode = "wpa2-sha256";
        wpaPassword = "a flakey password"; # Use wpaPasswordFile if possible.
      };
    };
  };
}
```

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.band` {#opt-services.hostapd.radios._name_.band}

Specifies the frequency band to use, possible values are 2g for 2.4 GHz,
5g for 5 GHz, 6g for 6 GHz and 60g for 60 GHz.

*Type:* one of "2g", "5g", "6g", "60g"

*Default:* `"2g"`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.channel` {#opt-services.hostapd.radios._name_.channel}

The channel to operate on. Use 0 to enable ACS (Automatic Channel Selection).
Beware that not every device supports ACS in which case `hostapd`
will fail to start.

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Example:* `11`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.countryCode` {#opt-services.hostapd.radios._name_.countryCode}

Country code (ISO/IEC 3166-1). Used to set regulatory domain.
Set as needed to indicate country in which device is operating.
This can limit available channels and transmit power.
These two octets are used as the first two octets of the Country String
(dot11CountryString).

Setting this will force you to also enable IEEE 802.11d and IEEE 802.11h.

IEEE 802.11d: This advertises the countryCode and the set of allowed channels
and transmit power levels based on the regulatory limits.

IEEE802.11h: This enables radar detection and DFS (Dynamic Frequency Selection)
support if available. DFS support is required on outdoor 5 GHz channels in most
countries of the world.

*Type:* null or string

*Default:* `null`

*Example:* `"US"`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.driver` {#opt-services.hostapd.radios._name_.driver}

The driver `hostapd` will use.
`nl80211` is used with all Linux mac80211 drivers.
`none` is used if building a standalone RADIUS server that does
not control any wireless/wired driver.
Most applications will probably use the default.

*Type:* string

*Default:* `"nl80211"`

*Example:* `"none"`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.dynamicConfigScripts` {#opt-services.hostapd.radios._name_.dynamicConfigScripts}

All of these scripts will be executed in lexicographical order before hostapd
is started, right after the global segment was generated and may dynamically
append global options the generated configuration file.

The first argument will point to the configuration file that you may append to.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
{
  exampleDynamicConfig = pkgs.writeShellScript "dynamic-config" ''
    HOSTAPD_CONFIG=$1

    cat >> "$HOSTAPD_CONFIG" << EOF
    # Add some dynamically generated statements here,
    # for example based on the physical adapter in use
    EOF
  '';
}
```

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks` {#opt-services.hostapd.radios._name_.networks}

This defines a BSS, colloquially known as a WiFi network.
You have to specify at least one.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  wlp2s0 = {
    ssid = "Primary advertised network";
    authentication.saePasswords = [{ passwordFile = "/run/secrets/my-password"; }];
  };
  wlp2s0-1 = {
    ssid = "Secondary advertised network (Open)";
    authentication.mode = "none";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.apIsolate` {#opt-services.hostapd.radios._name_.networks._name_.apIsolate}

Isolate traffic between stations (clients) and prevent them from
communicating with each other.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.authentication.enableRecommendedPairwiseCiphers` {#opt-services.hostapd.radios._name_.networks._name_.authentication.enableRecommendedPairwiseCiphers}

Additionally enable the recommended set of pairwise ciphers.
This enables newer secure ciphers, additionally to those defined in `pairwiseCiphers`.
You will have to test whether your hardware supports these by trial-and-error, because
even if `iw list` indicates hardware support, your driver might not expose it.

Beware `hostapd` will most likely not return a useful error message in case
this is enabled despite the driver or hardware not supporting the newer ciphers.
Look out for messages like `Failed to set beacon parameters`.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.authentication.mode` {#opt-services.hostapd.radios._name_.networks._name_.authentication.mode}

Selects the authentication mode for this AP.

- `"none"`: Don't configure any authentication. This will disable wpa alltogether
  and create an open AP. Use `settings` together with this option if you
  want to configure the authentication manually. Any password options will still be
  effective, if set.
- `"wpa2-sha1"`: Not recommended. WPA2-Personal using HMAC-SHA1. Passwords are set
  using `wpaPassword` or preferably by `wpaPasswordFile` or `wpaPskFile`.
- `"wpa2-sha256"`: WPA2-Personal using HMAC-SHA256 (IEEE 802.11i/RSN). Passwords are set
  using `wpaPassword` or preferably by `wpaPasswordFile` or `wpaPskFile`.
- `"wpa3-sae-transition"`: Use WPA3-Personal (SAE) if possible, otherwise fallback
  to WPA2-Personal. Only use if necessary and switch to the newer WPA3-SAE when possible.
  You will have to specify both `wpaPassword` and `saePasswords` (or one of their alternatives).
- `"wpa3-sae"`: Use WPA3-Personal (SAE). This is currently the recommended way to
  setup a secured WiFi AP (as of March 2023) and therefore the default. Passwords are set
  using either `saePasswords` or `saePasswordsFile`.

*Type:* one of "none", "wpa2-sha1", "wpa2-sha256", "wpa3-sae-transition", "wpa3-sae"

*Default:* `"wpa3-sae"`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.authentication.pairwiseCiphers` {#opt-services.hostapd.radios._name_.networks._name_.authentication.pairwiseCiphers}

Set of accepted cipher suites (encryption algorithms) for pairwise keys (unicast packets).
By default this allows just CCMP, which is the only commonly supported secure option.
Use `enableRecommendedPairwiseCiphers` to also enable newer recommended ciphers.

Please refer to the hostapd documentation for allowed values. Generally, only
CCMP or GCMP modes should be considered safe options. Most devices support CCMP while
GCMP and GCMP-256 is often only available with devices supporting WiFi 5 (IEEE 802.11ac) or higher.
CCMP-256 support is rare.

*Type:* list of string

*Default:*

``` nix
[
  "CCMP"
]
```

*Example:*

``` nix
[
  "GCMP"
  "GCMP-256"
]
```

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.authentication.saeAddToMacAllow` {#opt-services.hostapd.radios._name_.networks._name_.authentication.saeAddToMacAllow}

If set, all sae password entries that have a non-wildcard MAC associated to
them will additionally be used to populate the MAC allow list. This is
additional to any entries set via `macAllow` or `macAllowFile`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.authentication.saePasswords` {#opt-services.hostapd.radios._name_.networks._name_.authentication.saePasswords}

Sets allowed passwords for WPA3-SAE.

The last matching (based on peer MAC address and identifier) entry is used to
select which password to use. An empty string has the special meaning of
removing all previously added entries.

Warning: These entries will get put into a world-readable file in
the Nix store! Using `saePasswordFile` instead is recommended.

Not used when `mode` is `"wpa2-sha1"` or `"wpa2-sha256"`.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  # Any client may use these passwords
  { password = "Wi-Figure it out"; }
  { passwordFile = "/run/secrets/my-password-file"; mac = "ff:ff:ff:ff:ff:ff"; }

  # Only the client with MAC-address 11:22:33:44:55:66 can use this password
  { password = "sekret pazzword"; mac = "11:22:33:44:55:66"; }
]
```

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.authentication.saePasswords.*.id` {#opt-services.hostapd.radios._name_.networks._name_.authentication.saePasswords._.id}

If this attribute is given with non-zero length, it will set the password identifier
for this entry. It can then only be used with that identifier.

*Type:* null or string

*Default:* `null`

*Example:* `""`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.authentication.saePasswords.*.mac` {#opt-services.hostapd.radios._name_.networks._name_.authentication.saePasswords._.mac}

If this attribute is not included, or if is set to the wildcard address (`ff:ff:ff:ff:ff:ff`),
the entry is available for any station (client) to use. If a specific peer MAC address is included,
only a station with that MAC address is allowed to use the entry.

*Type:* null or string

*Default:* `null`

*Example:* `"11:22:33:44:55:66"`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.authentication.saePasswords.*.password` {#opt-services.hostapd.radios._name_.networks._name_.authentication.saePasswords._.password}

The password for this entry. SAE technically imposes no restrictions on
password length or character set. But due to limitations of `hostapd`'s
config file format, a true newline character cannot be parsed.

Warning: This password will get put into a world-readable file in
the Nix store! Prefer using the sibling option `passwordFile` or directly set `saePasswordsFile`.

*Type:* null or string

*Default:* `null`

*Example:* `"a flakey password"`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.authentication.saePasswords.*.passwordFile` {#opt-services.hostapd.radios._name_.networks._name_.authentication.saePasswords._.passwordFile}

The password for this entry, read from the given file when starting hostapd.
SAE technically imposes no restrictions on password length or character set.
But due to limitations of `hostapd`'s config file format, a true newline
character cannot be parsed.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.authentication.saePasswords.*.pk` {#opt-services.hostapd.radios._name_.networks._name_.authentication.saePasswords._.pk}

If this attribute is given, SAE-PK will be enabled for this connection.
This prevents evil-twin attacks, but a public key is required additionally to connect.
(Essentially adds pubkey authentication such that the client can verify identity of the AP)

*Type:* null or string

*Default:* `null`

*Example:* `""`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.authentication.saePasswords.*.vlanid` {#opt-services.hostapd.radios._name_.networks._name_.authentication.saePasswords._.vlanid}

If this attribute is given, all clients using this entry will get tagged with the given VLAN ID.

*Type:* null or (unsigned integer, meaning \>=0)

*Default:* `null`

*Example:* `1`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.authentication.saePasswordsFile` {#opt-services.hostapd.radios._name_.networks._name_.authentication.saePasswordsFile}

Sets the password for WPA3-SAE. Follows the same rules as `saePasswords`,
but reads the entries from the given file to prevent them from being
put into the Nix store.

One entry per line, empty lines and lines beginning with # will be ignored.
Each line must match the following format, although the order of optional
parameters doesn't matter:
`<password>[|mac=<peer mac>][|vlanid=<VLAN ID>][|pk=<m:ECPrivateKey-base64>][|id=<identifier>]`

Not used when `mode` is `"wpa2-sha1"` or `"wpa2-sha256"`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.authentication.transitionDisable` {#opt-services.hostapd.radios._name_.networks._name_.authentication.transitionDisable}

Enable the WPA3-Personal Transition Disable indication. After a successful
WPA3 association, compatible stations will disable WPA2-Personal for this
network profile, protecting subsequent associations against downgrade attacks.
Legacy stations can still connect using WPA2 in transition mode.

This option is supported in `"wpa3-sae"` and `"wpa3-sae-transition"` modes.

::: warning
Enable this only when every BSS in the network using this SSID supports
WPA3-Personal. The indication applies to a station's entire network profile
and can prevent it from connecting to WPA2-only BSSs. Therefore, the WPA3 spec
requires this to be disabled by default.
:::

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.authentication.wpaPassword` {#opt-services.hostapd.radios._name_.networks._name_.authentication.wpaPassword}

Sets the password for WPA-PSK that will be converted to the pre-shared key.
The password length must be in the range \[8, 63\] characters. While some devices
may allow arbitrary characters (such as UTF-8) to be used, but the standard specifies
that each character in the passphrase must be an ASCII character in the range \[0x20, 0x7e\]
(IEEE Std. 802.11i-2004, Annex H.4.1). Use emojis at your own risk.

Not used when `mode` is `"wpa3-sae"`.

Warning: This password will get put into a world-readable file in the Nix store!
Using `wpaPasswordFile` or `wpaPskFile` instead is recommended.

*Type:* null or string

*Default:* `null`

*Example:* `"a flakey password"`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.authentication.wpaPasswordFile` {#opt-services.hostapd.radios._name_.networks._name_.authentication.wpaPasswordFile}

Sets the password for WPA-PSK. Follows the same rules as `wpaPassword`,
but reads the password from the given file to prevent the password from being
put into the Nix store.

Not used when `mode` is `"wpa3-sae"`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.authentication.wpaPskFile` {#opt-services.hostapd.radios._name_.networks._name_.authentication.wpaPskFile}

Sets the password(s) for WPA-PSK. Similar to `wpaPasswordFile`,
but additionally allows specifying multiple passwords, and some other options.

Each line, except for empty lines and lines starting with #, must contain a
MAC address and either a 64-hex-digit PSK or a password separated with a space.
The password must follow the same rules as outlined in `wpaPassword`.
The special MAC address `00:00:00:00:00:00` can be used to configure PSKs
that any client can use.

An optional key identifier can be added by prefixing the line with `keyid=<keyid_string>`
An optional VLAN ID can be specified by prefixing the line with `vlanid=<VLAN ID>`.
An optional WPS tag can be added by prefixing the line with `wps=<0/1>` (default: 0).
Any matching entry with that tag will be used when generating a PSK for a WPS Enrollee
instead of generating a new random per-Enrollee PSK.

Not used when `mode` is `"wpa3-sae"`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.bssid` {#opt-services.hostapd.radios._name_.networks._name_.bssid}

Specifies the BSSID for this BSS. Usually determined automatically,
but for now you have to manually specify them when using multiple BSS.
Try assigning related addresses from the locally administered MAC address ranges,
by reusing the hardware address but replacing the second nibble with 2, 6, A or E.
(e.g. if real address is `XX:XX:XX:XX:XX`, try `X2:XX:XX:XX:XX:XX`, `X6:XX:XX:XX:XX:XX`, ...
for the second, third, ... BSS)

*Type:* null or string

*Default:* `null`

*Example:* `"11:22:33:44:55:66"`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.dynamicConfigScripts` {#opt-services.hostapd.radios._name_.networks._name_.dynamicConfigScripts}

All of these scripts will be executed in lexicographical order before hostapd
is started, right after the bss segment was generated and may dynamically
append bss options to the generated configuration file.

The first argument will point to the configuration file that you may append to.
The second and third argument will point to this BSS's MAC allow and MAC deny file respectively.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
{
  exampleDynamicConfig = pkgs.writeShellScript "dynamic-config" ''
    HOSTAPD_CONFIG=$1
    # These always exist, but may or may not be used depending on the actual configuration
    MAC_ALLOW_FILE=$2
    MAC_DENY_FILE=$3

    cat >> "$HOSTAPD_CONFIG" << EOF
    # Add some dynamically generated statements here
    EOF
  '';
}
```

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.group` {#opt-services.hostapd.radios._name_.networks._name_.group}

Members of this group can access the control socket for this interface.

*Type:* string

*Default:* `"wheel"`

*Example:* `"network"`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.ignoreBroadcastSsid` {#opt-services.hostapd.radios._name_.networks._name_.ignoreBroadcastSsid}

Send empty SSID in beacons and ignore probe request frames that do not
specify full SSID, i.e., require stations to know SSID. Note that this does
not increase security, since your clients will then broadcast the SSID instead,
which can increase congestion.

- `"disabled"`: Advertise ssid normally.
- `"empty"`: send empty (length=0) SSID in beacon and ignore probe request for broadcast SSID
- `"clear"`: clear SSID (ASCII 0), but keep the original length (this may be required with some
  legacy clients that do not support empty SSID) and ignore probe requests for broadcast SSID. Only
  use this if empty does not work with your clients.

*Type:* one of "disabled", "empty", "clear"

*Default:* `"disabled"`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.interfaceName` {#opt-services.hostapd.radios._name_.networks._name_.interfaceName}

Network interface name emitted in the hostapd configuration.
Secondary BSSs on different radios may share an interface
name when configured as links of the same multi-link device
(with `settings.mld_ap = true`). The attribute name remains
the unique configuration identity, including for ACL files.

The primary BSS must use the radio's interface name.

*Type:* string

*Default:* the network's attribute name

*Example:* `"mld0"`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.logLevel` {#opt-services.hostapd.radios._name_.networks._name_.logLevel}

Levels (minimum value for logged events):
0 = verbose debugging
1 = debugging
2 = informational messages
3 = notification
4 = warning

*Type:* integer between 0 and 4 (both inclusive)

*Default:* `2`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.macAcl` {#opt-services.hostapd.radios._name_.networks._name_.macAcl}

Station MAC address -based authentication. The following modes are available:

- `"deny"`: Allow unless listed in `macDeny` (default)
- `"allow"`: Deny unless listed in `macAllow`
- `"radius"`: Use external radius server, but check both `macAllow` and `macDeny` first

Please note that this kind of access control requires a driver that uses
hostapd to take care of management frame processing and as such, this can be
used with driver=hostap or driver=nl80211, but not with driver=atheros.

*Type:* one of "deny", "allow", "radius"

*Default:* `"deny"`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.macAllow` {#opt-services.hostapd.radios._name_.networks._name_.macAllow}

Specifies the MAC addresses to allow if `macAcl` is set to `"allow"` or `"radius"`.
These values will be world-readable in the Nix store. Values will automatically be merged with
`macAllowFile` if necessary.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "11:22:33:44:55:66"
]
```

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.macAllowFile` {#opt-services.hostapd.radios._name_.networks._name_.macAllowFile}

Specifies a file containing the MAC addresses to allow if `macAcl` is set to `"allow"` or `"radius"`.
The file should contain exactly one MAC address per line. Comments and empty lines are ignored,
only lines starting with a valid MAC address will be considered (e.g. `11:22:33:44:55:66`) and
any content after the MAC address is ignored.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.macDeny` {#opt-services.hostapd.radios._name_.networks._name_.macDeny}

Specifies the MAC addresses to deny if `macAcl` is set to `"deny"` or `"radius"`.
These values will be world-readable in the Nix store. Values will automatically be merged with
`macDenyFile` if necessary.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "11:22:33:44:55:66"
]
```

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.macDenyFile` {#opt-services.hostapd.radios._name_.networks._name_.macDenyFile}

Specifies a file containing the MAC addresses to deny if `macAcl` is set to `"deny"` or `"radius"`.
The file should contain exactly one MAC address per line. Comments and empty lines are ignored,
only lines starting with a valid MAC address will be considered (e.g. `11:22:33:44:55:66`) and
any content after the MAC address is ignored.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.settings` {#opt-services.hostapd.radios._name_.networks._name_.settings}

Extra configuration options to put at the end of this BSS's defintion in the
hostapd.conf for the associated interface. To find out which options are global
and which are per-bss you have to read hostapd's source code, which is non-trivial
and not documented otherwise.

Lists will be converted to multiple definitions of the same key, and booleans to 0/1.
Otherwise, the inputs are not modified or checked for correctness.

*Type:* open submodule of attribute set of (atom (bool, int or string) or a list of them for duplicate keys)

*Default:* `{ }`

*Example:*

``` nix
{
  multi_ap = true;
}
```

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.ssid` {#opt-services.hostapd.radios._name_.networks._name_.ssid}

SSID to be used in IEEE 802.11 management frames.

*Type:* string

*Example:* `"❄️ cool ❄️"`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.networks.<name>.utf8Ssid` {#opt-services.hostapd.radios._name_.networks._name_.utf8Ssid}

Whether the SSID is to be interpreted using UTF-8 encoding.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.noScan` {#opt-services.hostapd.radios._name_.noScan}

Disables scan for overlapping BSSs in HT40+/- mode.
Caution: turning this on will likely violate regulatory requirements!

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.settings` {#opt-services.hostapd.radios._name_.settings}

Extra configuration options to put at the end of global initialization, before defining BSSs.
To find out which options are global and which are per-bss you have to read hostapd's source code,
which is non-trivial and not documented otherwise.

Lists will be converted to multiple definitions of the same key, and booleans to 0/1.
Otherwise, the inputs are not modified or checked for correctness.

*Type:* open submodule of attribute set of (atom (bool, int or string) or a list of them for duplicate keys)

*Default:* `{ }`

*Example:*

``` nix
{
  acs_exclude_dfs = true;
}
```

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.wifi4.capabilities` {#opt-services.hostapd.radios._name_.wifi4.capabilities}

HT (High Throughput) capabilities given as a list of flags.
Please refer to the hostapd documentation for allowed values and
only set values supported by your physical adapter.

The default contains common values supported by most adapters.

*Type:* list of string

*Default:*

``` nix
[
  "HT40"
  "SHORT-GI-20"
  "SHORT-GI-40"
]
```

*Example:*

``` nix
[
  "LDPC"
  "HT40+"
  "HT40-"
  "GF"
  "SHORT-GI-20"
  "SHORT-GI-40"
  "TX-STBC"
  "RX-STBC1"
]
```

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.wifi4.enable` {#opt-services.hostapd.radios._name_.wifi4.enable}

Enables support for IEEE 802.11n (WiFi 4, HT).
This is enabled by default, since the vase majority of devices
are expected to support this.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.wifi4.require` {#opt-services.hostapd.radios._name_.wifi4.require}

Require stations (clients) to support WiFi 4 (HT) and disassociate them if they don't.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.wifi5.capabilities` {#opt-services.hostapd.radios._name_.wifi5.capabilities}

VHT (Very High Throughput) capabilities given as a list of flags.
Please refer to the hostapd documentation for allowed values and
only set values supported by your physical adapter.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "SHORT-GI-80"
  "TX-STBC-2BY1"
  "RX-STBC-1"
  "RX-ANTENNA-PATTERN"
  "TX-ANTENNA-PATTERN"
]
```

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.wifi5.enable` {#opt-services.hostapd.radios._name_.wifi5.enable}

Enables support for IEEE 802.11ac (WiFi 5, VHT)

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.wifi5.operatingChannelWidth` {#opt-services.hostapd.radios._name_.wifi5.operatingChannelWidth}

Determines the operating channel width for VHT.

- `"20or40"`: 20 or 40 MHz operating channel width
- `"80"`: 80 MHz channel width
- `"160"`: 160 MHz channel width
- `"80+80"`: 80+80 MHz channel width

*Type:* one of "20or40", "80", "160", "80+80"

*Default:* `"20or40"`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.wifi5.require` {#opt-services.hostapd.radios._name_.wifi5.require}

Require stations (clients) to support WiFi 5 (VHT) and disassociate them if they don't.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.wifi6.enable` {#opt-services.hostapd.radios._name_.wifi6.enable}

Enables support for IEEE 802.11ax (WiFi 6, HE)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.wifi6.multiUserBeamformer` {#opt-services.hostapd.radios._name_.wifi6.multiUserBeamformer}

HE multi user beamformee support

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.wifi6.operatingChannelWidth` {#opt-services.hostapd.radios._name_.wifi6.operatingChannelWidth}

Determines the operating channel width for HE.

- `"20or40"`: 20 or 40 MHz operating channel width
- `"80"`: 80 MHz channel width
- `"160"`: 160 MHz channel width
- `"80+80"`: 80+80 MHz channel width

*Type:* one of "20or40", "80", "160", "80+80"

*Default:* `"20or40"`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.wifi6.require` {#opt-services.hostapd.radios._name_.wifi6.require}

Require stations (clients) to support WiFi 6 (HE) and disassociate them if they don't.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.wifi6.singleUserBeamformee` {#opt-services.hostapd.radios._name_.wifi6.singleUserBeamformee}

HE single user beamformee support

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.wifi6.singleUserBeamformer` {#opt-services.hostapd.radios._name_.wifi6.singleUserBeamformer}

HE single user beamformer support

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.wifi7.enable` {#opt-services.hostapd.radios._name_.wifi7.enable}

Enables support for IEEE 802.11be (WiFi 7, EHT). This is currently experimental
and requires you to manually enable CONFIG\_IEEE80211BE when building hostapd.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.wifi7.multiUserBeamformer` {#opt-services.hostapd.radios._name_.wifi7.multiUserBeamformer}

EHT multi user beamformee support

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.wifi7.operatingChannelWidth` {#opt-services.hostapd.radios._name_.wifi7.operatingChannelWidth}

Determines the operating channel width for EHT.

- `"20or40"`: 20 or 40 MHz operating channel width
- `"80"`: 80 MHz channel width
- `"160"`: 160 MHz channel width
- `"80+80"`: 80+80 MHz channel width

*Type:* one of "20or40", "80", "160", "80+80"

*Default:* `"20or40"`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.wifi7.singleUserBeamformee` {#opt-services.hostapd.radios._name_.wifi7.singleUserBeamformee}

EHT single user beamformee support

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hostapd.radios.<name>.wifi7.singleUserBeamformer` {#opt-services.hostapd.radios._name_.wifi7.singleUserBeamformer}

EHT single user beamformer support

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/hostapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hostapd.nix)

## `services.hound.enable` {#opt-services.hound.enable}

Whether to enable hound.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/search/hound.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/hound.nix)

## `services.hound.group` {#opt-services.hound.group}

Group the hound daemon should execute under.

*Type:* string

*Default:* `"hound"`

*Declared by:* [`nixos/modules/services/search/hound.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/hound.nix)

## `services.hound.home` {#opt-services.hound.home}

The path to use as hound's $HOME.
If the default user "hound" is configured then this is the home of the "hound" user.

*Type:* absolute path

*Default:* `"/var/lib/hound"`

*Declared by:* [`nixos/modules/services/search/hound.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/hound.nix)

## `services.hound.listen` {#opt-services.hound.listen}

Listen on this \[IP\]:port

*Type:* string

*Default:* `"0.0.0.0:6080"`

*Example:* `":6080"`

*Declared by:* [`nixos/modules/services/search/hound.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/hound.nix)

## `services.hound.package` {#opt-services.hound.package}

The hound package to use.

*Type:* package

*Default:* `pkgs.hound`

*Declared by:* [`nixos/modules/services/search/hound.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/hound.nix)

## `services.hound.settings` {#opt-services.hound.settings}

The full configuration of the Hound daemon.
See the upstream documentation [https://github.com/hound-search/hound/blob/main/docs/config-options.md](https://github.com/hound-search/hound/blob/main/docs/config-options.md) for details.

::: {.note}
The `dbpath` should be an absolute path to a writable directory.
:::.com/hound-search/hound/blob/main/docs/config-options.md\>.

*Type:* JSON value

*Default:* `null`

*Example:*

``` nix
{
  max-concurrent-indexers = 2;
  repos.nixpkgs.url = "https://www.github.com/NixOS/nixpkgs.git";
}
```

*Declared by:* [`nixos/modules/services/search/hound.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/hound.nix)

## `services.hound.user` {#opt-services.hound.user}

User the hound daemon should execute under.

*Type:* string

*Default:* `"hound"`

*Declared by:* [`nixos/modules/services/search/hound.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/hound.nix)

## `services.howdy.control` {#opt-services.howdy.control}

PAM control flag to use for Howdy.

Sets the [`security.pam.howdy.control`](../../options/security/index.md#opt-security.pam.howdy.control) option.

Refer to `pam.conf(5)` for options.

*Type:* string

*Default:* `"required"`

*Declared by:* [`nixos/modules/services/security/howdy`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/howdy)

## `services.howdy.enable` {#opt-services.howdy.enable}

Whether to enable Howdy and its PAM module for face recognition. See
`services.linux-enable-ir-emitter` for enabling the IR emitter support.

::: caution
Howdy is not a safe alternative to unlocking with your password. It
can be fooled using a well-printed photo.

Do **not** use it as the sole authentication method for your system.
:::

::: note
By default, the `config.services.howdy.control` option is set
to `"required"`, meaning it will act as a second-factor authentication
in most services. To change this, set the option to `"sufficient"`.
:::

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/howdy`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/howdy)

## `services.howdy.package` {#opt-services.howdy.package}

The howdy package to use.

*Type:* package

*Default:* `pkgs.howdy`

*Declared by:* [`nixos/modules/services/security/howdy`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/howdy)

## `services.howdy.settings` {#opt-services.howdy.settings}

Howdy configuration file. Refer to
[https://github.com/boltgolt/howdy/blob/d3ab99382f88f043d15f15c1450ab69433892a1c/howdy/src/config.ini](https://github.com/boltgolt/howdy/blob/d3ab99382f88f043d15f15c1450ab69433892a1c/howdy/src/config.ini)
for options.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:*

``` nix
{
  core = {
    abort_if_lid_closed = true;
    abort_if_ssh = true;
    detection_notice = false;
    disabled = false;
    no_confirmation = false;
    suppress_unknown = false;
    timeout_notice = true;
    use_cnn = false;
    workaround = "off";
  };
  debug = {
    end_report = false;
    gtk_stdout = false;
    verbose_stamps = false;
  };
  rubberstamps = {
    enabled = false;
    stamp_rules = "nod		5s		failsafe     min_distance=12";
  };
  snapshots = {
    save_failed = false;
    save_successful = false;
  };
  video = {
    certainty = 3.5;
    dark_threshold = 60;
    device_format = "v4l2";
    device_fps = -1;
    device_path = "/dev/video2";
    exposure = -1;
    force_mjpeg = false;
    frame_height = -1;
    frame_width = -1;
    max_height = 320;
    recording_plugin = "opencv";
    rotate = 0;
    timeout = 4;
    warn_no_device = true;
  };
}
```

*Declared by:* [`nixos/modules/services/security/howdy`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/howdy)

## `services.hqplayerd.auth.password` {#opt-services.hqplayerd.auth.password}

Password used for HQPlayer's WebUI.

Without this you will need to manually create the credentials after
first start by going to http://your.ip/8088/auth

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/audio/hqplayerd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/hqplayerd.nix)

## `services.hqplayerd.auth.username` {#opt-services.hqplayerd.auth.username}

Username used for HQPlayer's WebUI.

Without this you will need to manually create the credentials after
first start by going to http://your.ip/8088/auth

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/audio/hqplayerd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/hqplayerd.nix)

## `services.hqplayerd.config` {#opt-services.hqplayerd.config}

HQplayer daemon configuration, written to /etc/hqplayer/hqplayerd.xml.

Refer to share/doc/hqplayerd/readme.txt in the hqplayerd derivation for possible values.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/services/audio/hqplayerd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/hqplayerd.nix)

## `services.hqplayerd.enable` {#opt-services.hqplayerd.enable}

Whether to enable HQPlayer Embedded.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/hqplayerd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/hqplayerd.nix)

## `services.hqplayerd.licenseFile` {#opt-services.hqplayerd.licenseFile}

Path to the HQPlayer license key file.

Without this, the service will run in trial mode and restart every 30
minutes.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/audio/hqplayerd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/hqplayerd.nix)

## `services.hqplayerd.openFirewall` {#opt-services.hqplayerd.openFirewall}

Opens ports needed for the WebUI and controller API.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/audio/hqplayerd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/hqplayerd.nix)

## `services.htpdate.enable` {#opt-services.htpdate.enable}

Enable htpdate daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/htpdate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/htpdate.nix)

## `services.htpdate.extraOptions` {#opt-services.htpdate.extraOptions}

Additional command line arguments to pass to htpdate.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/htpdate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/htpdate.nix)

## `services.htpdate.proxy` {#opt-services.htpdate.proxy}

HTTP proxy used for requests.

*Type:* string

*Default:* `""`

*Example:* `"127.0.0.1:8118"`

*Declared by:* [`nixos/modules/services/networking/htpdate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/htpdate.nix)

## `services.htpdate.servers` {#opt-services.htpdate.servers}

HTTP servers to use for time synchronization.

*Type:* list of string

*Default:*

``` nix
[
  "www.google.com"
]
```

*Declared by:* [`nixos/modules/services/networking/htpdate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/htpdate.nix)

## `services.httpd.adminAddr` {#opt-services.httpd.adminAddr}

E-mail address of the server administrator.

*Type:* null or string

*Default:* `null`

*Example:* `"admin@example.org"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.configFile` {#opt-services.httpd.configFile}

Override the configuration file used by Apache. By default,
NixOS generates one automatically.

*Type:* absolute path

*Default:* `confFile`

*Example:* `pkgs.writeText "httpd.conf" "# my custom config file ..."`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.customLogFormat` {#opt-services.httpd.customLogFormat}

Defines a custom Apache HTTPD access log format string.

This option is only consulted when `logFormat` is set to `custom`.
The value must be a valid Apache `LogFormat` specification and will be registered under the symbolic name `custom`.

See [https://httpd.apache.org/docs/2.4/logs.html#formats](https://httpd.apache.org/docs/2.4/logs.html#formats) for the formal definition of log format directives.

*Type:* string

*Default:* `null`

*Example:* `"%{X-Forwarded-For}i %l %u %t \\\"%r\\\" %>s %b"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.enable` {#opt-services.httpd.enable}

Whether to enable the Apache HTTP Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.enableMellon` {#opt-services.httpd.enableMellon}

Whether to enable the mod\_auth\_mellon module.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.enablePHP` {#opt-services.httpd.enablePHP}

Whether to enable the PHP module.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.enablePerl` {#opt-services.httpd.enablePerl}

Whether to enable the Perl module (mod\_perl).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.extraConfig` {#opt-services.httpd.extraConfig}

Configuration lines appended to the generated Apache
configuration file. Note that this mechanism will not work
when `configFile` is overridden.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.extraModules` {#opt-services.httpd.extraModules}

Additional Apache modules to be used. These can be
specified as a string in the case of modules distributed
with Apache, or as an attribute set specifying the
`name` and `path` of the
module.

*Type:* list of unspecified value

*Default:* `[ ]`

*Example:*

``` nix
[
  "proxy_connect"
  { name = "jk"; path = "${pkgs.apacheHttpdPackages.mod_jk}/modules/mod_jk.so"; }
]
```

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.group` {#opt-services.httpd.group}

Group under which httpd children processes run.

*Type:* string

*Default:* `"wwwrun"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.logDir` {#opt-services.httpd.logDir}

Directory for Apache's log files. It is created automatically.

*Type:* absolute path

*Default:* `"/var/log/httpd"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.logFormat` {#opt-services.httpd.logFormat}

Selects the access log format written to log files.

The values `combined`, `common`, `referer`, and `agent` correspond to predefined Apache HTTPD log formats.
Setting the value to `custom` enables the use of a user-defined format string specified via `customLogFormat`.
The value `none` disables access logging entirely.

Further details on Apache log formats are available at [https://httpd.apache.org/docs/2.4/logs.html](https://httpd.apache.org/docs/2.4/logs.html).

*Type:* one of "combined", "common", "referer", "agent", "custom", "none"

*Default:* `"common"`

*Example:* `"custom"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.logLevel` {#opt-services.httpd.logLevel}

Controls the verbosity of the ErrorLog.
See [https://httpd.apache.org/docs/2.4/mod/core.html#loglevel](https://httpd.apache.org/docs/2.4/mod/core.html#loglevel) for more details.

*Type:* null or one of "emerg", "alert", "crit", "error", "warn", "notice", "info", "debug", "trace1", "trace2", "trace3", "trace4", "trace5", "trace6", "trace7", "trace8"

*Default:* `"notice"`

*Example:* `"crit"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.logPerVirtualHost` {#opt-services.httpd.logPerVirtualHost}

If enabled, each virtual host gets its own
`access.log` and
`error.log`, namely suffixed by the
`hostName` of the virtual host.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.maxClients` {#opt-services.httpd.maxClients}

Maximum number of httpd processes (prefork)

*Type:* positive integer, meaning \>0

*Default:* `150`

*Example:* `8`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.maxRequestsPerChild` {#opt-services.httpd.maxRequestsPerChild}

Maximum number of httpd requests answered per httpd child (prefork), 0 means unlimited.

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Example:* `500`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.mpm` {#opt-services.httpd.mpm}

Multi-processing module to be used by Apache. Available
modules are `prefork` (handles each
request in a separate child process), `worker`
(hybrid approach that starts a number of child processes
each running a number of threads) and `event`
(the default; a recent variant of `worker`
that handles persistent connections more efficiently).

*Type:* one of "event", "prefork", "worker"

*Default:* `"event"`

*Example:* `"worker"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.package` {#opt-services.httpd.package}

The apacheHttpd package to use.

*Type:* package

*Default:* `pkgs.apacheHttpd`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.phpOptions` {#opt-services.httpd.phpOptions}

Structured options appended to the PHP configuration file
`php.ini`.

For backwards compatibility, a string in
`php.ini` format is also accepted, but deprecated.
It will be removed in a future release. Please migrate to
the attribute set format:

``` nix
{
  services.httpd.phpOptions = {
    "date.timezone" = "CET";
  };
}
```

*Type:* strings concatenated with "\\n" or attribute set of (null or boolean or signed integer or floating point number or string)

*Default:* `{ }`

*Example:*

``` nix
{
  "date.timezone" = "CET";
}
```

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.phpPackage` {#opt-services.httpd.phpPackage}

The php package to use.

*Type:* package

*Default:* `pkgs.php`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.sslCiphers` {#opt-services.httpd.sslCiphers}

Cipher Suite available for negotiation in SSL proxy handshake.

*Type:* string

*Default:* `"HIGH:!aNULL:!MD5:!EXP"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.sslProtocols` {#opt-services.httpd.sslProtocols}

Allowed SSL/TLS protocol versions.

*Type:* string

*Default:* `"All -SSLv2 -SSLv3 -TLSv1 -TLSv1.1"`

*Example:* `"All -SSLv2 -SSLv3"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.user` {#opt-services.httpd.user}

User account under which httpd children processes run.

If you require the main httpd process to run as
`root` add the following configuration:

```
systemd.services.httpd.serviceConfig.User = lib.mkForce "root";
```

*Type:* string

*Default:* `"wwwrun"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts` {#opt-services.httpd.virtualHosts}

Specification of the virtual hosts served by Apache. Each
element should be an attribute set specifying the
configuration of the virtual host.

*Type:* attribute set of (submodule)

*Default:*

``` nix
{
  localhost = {
    documentRoot = "${package.out}/htdocs";
  };
}
```

*Example:*

``` nix
{
  "foo.example.com" = {
    forceSSL = true;
    documentRoot = "/var/www/foo.example.com"
  };
  "bar.example.com" = {
    addSSL = true;
    documentRoot = "/var/www/bar.example.com";
  };
}
```

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.acmeRoot` {#opt-services.httpd.virtualHosts._name_.acmeRoot}

Directory for the acme challenge which is PUBLIC, don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.addSSL` {#opt-services.httpd.virtualHosts._name_.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.adminAddr` {#opt-services.httpd.virtualHosts._name_.adminAddr}

E-mail address of the server administrator.

*Type:* null or string

*Default:* `null`

*Example:* `"admin@example.org"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.documentRoot` {#opt-services.httpd.virtualHosts._name_.documentRoot}

The path of Apache's document root directory.  If left undefined,
an empty directory in the Nix store will be used as root.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.enableACME` {#opt-services.httpd.virtualHosts._name_.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.enableUserDir` {#opt-services.httpd.virtualHosts._name_.enableUserDir}

Whether to enable serving `~/public_html` as
`/~«username»`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.extraConfig` {#opt-services.httpd.virtualHosts._name_.extraConfig}

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

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.forceSSL` {#opt-services.httpd.virtualHosts._name_.forceSSL}

Whether to add a separate nginx server block that permanently redirects (301)
all plain HTTP traffic to HTTPS. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443), where the non-SSL listens are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.globalRedirect` {#opt-services.httpd.virtualHosts._name_.globalRedirect}

If set, all requests for this host are redirected permanently to
the given URL.

*Type:* null or string

*Default:* `null`

*Example:* `"http://newserver.example.org/"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.hostName` {#opt-services.httpd.virtualHosts._name_.hostName}

Canonical hostname for the server.

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.http2` {#opt-services.httpd.virtualHosts._name_.http2}

Whether to enable HTTP 2. HTTP/2 is supported in all multi-processing modules that come with httpd. *However, if you use the prefork mpm, there will
be severe restrictions.* Refer to [https://httpd.apache.org/docs/2.4/howto/http2.html#mpm-config](https://httpd.apache.org/docs/2.4/howto/http2.html#mpm-config) for details.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.listen` {#opt-services.httpd.virtualHosts._name_.listen}

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

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.listen.*.ip` {#opt-services.httpd.virtualHosts._name_.listen._.ip}

IP to listen on. 0.0.0.0 for IPv4 only, \* for all.

*Type:* string

*Default:* `"*"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.listen.*.port` {#opt-services.httpd.virtualHosts._name_.listen._.port}

Port to listen on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.listen.*.ssl` {#opt-services.httpd.virtualHosts._name_.listen._.ssl}

Whether to enable SSL (https) support.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.listenAddresses` {#opt-services.httpd.virtualHosts._name_.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.locations` {#opt-services.httpd.virtualHosts._name_.locations}

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

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.locations.<name>.alias` {#opt-services.httpd.virtualHosts._name_.locations._name_.alias}

Alias directory for requests. See [https://httpd.apache.org/docs/2.4/mod/mod\_alias.html#alias](https://httpd.apache.org/docs/2.4/mod/mod_alias.html#alias).

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.locations.<name>.extraConfig` {#opt-services.httpd.virtualHosts._name_.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.locations.<name>.index` {#opt-services.httpd.virtualHosts._name_.locations._name_.index}

Adds DirectoryIndex directive. See [https://httpd.apache.org/docs/2.4/mod/mod\_dir.html#directoryindex](https://httpd.apache.org/docs/2.4/mod/mod_dir.html#directoryindex).

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.locations.<name>.priority` {#opt-services.httpd.virtualHosts._name_.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.locations.<name>.proxyPass` {#opt-services.httpd.virtualHosts._name_.locations._name_.proxyPass}

Sets up a simple reverse proxy as described by [https://httpd.apache.org/docs/2.4/howto/reverse\_proxy.html#simple](https://httpd.apache.org/docs/2.4/howto/reverse_proxy.html#simple).

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.logFormat` {#opt-services.httpd.virtualHosts._name_.logFormat}

Log format for Apache's log files. Possible values are: combined, common, referer, agent.

*Type:* string

*Default:* `"common"`

*Example:* `"combined"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.onlySSL` {#opt-services.httpd.virtualHosts._name_.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.robotsEntries` {#opt-services.httpd.virtualHosts._name_.robotsEntries}

Specification of pages to be ignored by web crawlers. See [http://www.robotstxt.org/](http://www.robotstxt.org/) for details.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"Disallow: /foo/"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.servedDirs` {#opt-services.httpd.virtualHosts._name_.servedDirs}

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

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.servedFiles` {#opt-services.httpd.virtualHosts._name_.servedFiles}

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

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.serverAliases` {#opt-services.httpd.virtualHosts._name_.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.sslServerCert` {#opt-services.httpd.virtualHosts._name_.sslServerCert}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.sslServerChain` {#opt-services.httpd.virtualHosts._name_.sslServerChain}

Path to server SSL chain file.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/ca.pem"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.sslServerKey` {#opt-services.httpd.virtualHosts._name_.sslServerKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.httpd.virtualHosts.<name>.useACMEHost` {#opt-services.httpd.virtualHosts._name_.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/apache-httpd/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/apache-httpd/default.nix)

## `services.https-dns-proxy.address` {#opt-services.https-dns-proxy.address}

The address on which to listen

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/https-dns-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/https-dns-proxy.nix)

## `services.https-dns-proxy.enable` {#opt-services.https-dns-proxy.enable}

Whether to enable https-dns-proxy daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/https-dns-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/https-dns-proxy.nix)

## `services.https-dns-proxy.extraArgs` {#opt-services.https-dns-proxy.extraArgs}

Additional arguments to pass to the process.

*Type:* list of string

*Default:*

``` nix
[
  "-v"
]
```

*Declared by:* [`nixos/modules/services/networking/https-dns-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/https-dns-proxy.nix)

## `services.https-dns-proxy.port` {#opt-services.https-dns-proxy.port}

The port on which to listen

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5053`

*Declared by:* [`nixos/modules/services/networking/https-dns-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/https-dns-proxy.nix)

## `services.https-dns-proxy.preferIPv4` {#opt-services.https-dns-proxy.preferIPv4}

https\_dns\_proxy will by default use IPv6 and fail if it is not available.
To play it safe, we choose IPv4.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/https-dns-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/https-dns-proxy.nix)

## `services.https-dns-proxy.provider.ips` {#opt-services.https-dns-proxy.provider.ips}

The custom provider IPs

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/https-dns-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/https-dns-proxy.nix)

## `services.https-dns-proxy.provider.kind` {#opt-services.https-dns-proxy.provider.kind}

The upstream provider to use or custom in case you do not trust any of
the predefined providers or just want to use your own.

The default is quad9 and there are privacy and security
trade-offs when using any upstream provider. Please consider that
before using any of them.

Supported providers: cloudflare, custom, google, opendns, quad9

If you pick the custom provider, you will need to provide the
bootstrap IP addresses as well as the resolver https URL.

*Type:* one of "cloudflare", "custom", "google", "opendns", "quad9"

*Default:* `"quad9"`

*Declared by:* [`nixos/modules/services/networking/https-dns-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/https-dns-proxy.nix)

## `services.https-dns-proxy.provider.url` {#opt-services.https-dns-proxy.provider.url}

The custom provider URL

*Type:* string

*Declared by:* [`nixos/modules/services/networking/https-dns-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/https-dns-proxy.nix)

## `services.hydra-builder.authorizationFile` {#opt-services.hydra-builder.authorizationFile}

Path to a file holding the authorization token, as an alternative to
`mtls`. The token has to be listed in the queue runner's
[`services.hydra.queueRunner.settings.tokenPaths`](#opt-services.hydra.queueRunner.settings.tokenPaths).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.enable` {#opt-services.hydra-builder.enable}

Whether to enable the Hydra build agent, which connects to the queue runner over gRPC and executes builds.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.mtls` {#opt-services.hydra-builder.mtls}

mTLS material used to authenticate against the queue runner.

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.mtls.clientCertPath` {#opt-services.hydra-builder.mtls.clientCertPath}

Client certificate path.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.mtls.clientKeyPath` {#opt-services.hydra-builder.mtls.clientKeyPath}

Client key path.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.mtls.domainName` {#opt-services.hydra-builder.mtls.domainName}

Domain name the server certificate is validated against.

*Type:* (optionally newline-terminated) single-line string

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.mtls.serverRootCaCertPath` {#opt-services.hydra-builder.mtls.serverRootCaCertPath}

Server root CA certificate path.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.otel` {#opt-services.hydra-builder.otel}

OpenTelemetry (OTLP) tracing options for the builder.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.otel.enable` {#opt-services.hydra-builder.otel.enable}

Whether to enable OpenTelemetry tracing. This builds the builder with the `otel`
cargo feature and exports spans via OTLP/gRPC, configured through
the standard `OTEL_*` environment variables
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.otel.endpoint` {#opt-services.hydra-builder.otel.endpoint}

OTLP collector endpoint (`OTEL_EXPORTER_OTLP_ENDPOINT`). The
exporter uses gRPC, so point it at the gRPC port (typically 4317).

*Type:* null or (optionally newline-terminated) single-line string

*Default:* `null`

*Example:* `"http://127.0.0.1:4317"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.otel.extraEnv` {#opt-services.hydra-builder.otel.extraEnv}

Additional `OTEL_*` environment variables not exposed as dedicated options.

*Type:* attribute set of (optionally newline-terminated) single-line string

*Default:* `{ }`

*Example:*

``` nix
{
  OTEL_TRACES_SAMPLER = "parentbased_traceidratio";
  OTEL_TRACES_SAMPLER_ARG = "0.1";
}
```

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.otel.headers` {#opt-services.hydra-builder.otel.headers}

Headers sent to the collector (`OTEL_EXPORTER_OTLP_HEADERS`). They
end up in the world-readable systemd unit, so do not put secrets
here.

*Type:* null or (optionally newline-terminated) single-line string

*Default:* `null`

*Example:* `"authorization=Bearer token"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.otel.protocol` {#opt-services.hydra-builder.otel.protocol}

OTLP protocol (`OTEL_EXPORTER_OTLP_PROTOCOL`).

*Type:* null or one of "grpc", "http/protobuf", "http/json"

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.otel.serviceName` {#opt-services.hydra-builder.otel.serviceName}

Service name reported to the collector (`OTEL_SERVICE_NAME`).
Defaults to the binary name (`hydra-builder`).

*Type:* null or (optionally newline-terminated) single-line string

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.package` {#opt-services.hydra-builder.package}

The `hydra-builder` package to use.

*Type:* package

*Default:* `pkgs.hydra-builder.override { withOtel = config.services.hydra-builder.otel.enable; }`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.queueRunnerAddr` {#opt-services.hydra-builder.queueRunnerAddr}

Address of the queue runner's gRPC endpoint, see
`services.hydra.queueRunner.grpc`.

*Type:* (optionally newline-terminated) single-line string

*Example:* `"http://hydra.example.org:50051"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.settings` {#opt-services.hydra-builder.settings}

Builder settings, written to `/etc/hydra/builder.toml`.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.settings.buildCores` {#opt-services.hydra-builder.settings.buildCores}

Cores made available to each build (`NIX_BUILD_CORES`). 0 means
all available cores.

*Type:* unsigned integer, meaning \>=0

*Default:* `config.nix.settings.cores`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.settings.buildDirAvailThreshold` {#opt-services.hydra-builder.settings.buildDirAvailThreshold}

Percentage of free space on the Nix build directory below which
jobs stop being scheduled on this machine.

*Type:* floating point number

*Default:* `10.0`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.settings.cpuPsiThreshold` {#opt-services.hydra-builder.settings.cpuPsiThreshold}

CPU PSI over the last 10s above which jobs stop being scheduled on this machine.

*Type:* floating point number

*Default:* `75.0`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.settings.ioPsiThreshold` {#opt-services.hydra-builder.settings.ioPsiThreshold}

IO PSI over the last 10s above which jobs stop being scheduled on
this machine. `null` disables this check.

*Type:* null or floating point number

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.settings.load1Threshold` {#opt-services.hydra-builder.settings.load1Threshold}

Load1 above which jobs stop being scheduled on this machine. Only
used when PSI is unavailable.

*Type:* floating point number

*Default:* `8.0`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.settings.mandatoryFeatures` {#opt-services.hydra-builder.settings.mandatoryFeatures}

Features a step must request to be scheduled on this builder.

*Type:* list of (optionally newline-terminated) single-line string

*Default:* `[ ]`

*Example:*

``` nix
[
  "FOD"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.settings.maxJobs` {#opt-services.hydra-builder.settings.maxJobs}

Maximum number of concurrent jobs. Only honoured when the queue
runner's [`services.hydra.queueRunner.settings.machineFreeFn`](#opt-services.hydra.queueRunner.settings.machineFreeFn)
takes job limits into account.

*Type:* positive integer, meaning \>0

*Default:* `4`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.settings.memPsiThreshold` {#opt-services.hydra-builder.settings.memPsiThreshold}

Memory PSI over the last 10s above which jobs stop being scheduled on this machine.

*Type:* floating point number

*Default:* `80.0`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.settings.pingInterval` {#opt-services.hydra-builder.settings.pingInterval}

Interval in seconds at which pings are sent to the queue runner.

*Type:* positive integer, meaning \>0

*Default:* `10`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.settings.speedFactor` {#opt-services.hydra-builder.settings.speedFactor}

Speed factor of this machine, relative to the other builders.

*Type:* positive integer, meaning \>0, or floating point number

*Default:* `1`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.settings.storeAvailThreshold` {#opt-services.hydra-builder.settings.storeAvailThreshold}

Percentage of free space on `/nix/store` below which jobs
stop being scheduled on this machine.

*Type:* floating point number

*Default:* `10.0`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.settings.supportedFeatures` {#opt-services.hydra-builder.settings.supportedFeatures}

Features this builder supports. `null` reads `system-features`
from Nix; an empty list advertises none.

*Type:* null or (list of (optionally newline-terminated) single-line string)

*Default:* `null`

*Example:*

``` nix
[
  "big-parallel"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.settings.systems` {#opt-services.hydra-builder.settings.systems}

Systems this builder can build for. `null` reads `system` and
`extra-platforms` from Nix; an empty list advertises none.

*Type:* null or (list of (optionally newline-terminated) single-line string)

*Default:* `null`

*Example:*

``` nix
[
  "x86_64-linux"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra-builder.settings.useSubstitutes` {#opt-services.hydra-builder.settings.useSubstitutes}

Whether the builder substitutes paths instead of fetching them from the queue runner.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/builder.nix)

## `services.hydra.adHoc.enable` {#opt-services.hydra.adHoc.enable}

Whether to enable hydra-ad-hoc, an experimental service presenting Hydra
as one big Nix daemon. It serves the Nix daemon protocol on
[`services.hydra.adHoc.socketPath`](#opt-services.hydra.adHoc.socketPath), and derivations realised
through it are built by the queue runner as Hydra builds of a hidden
`adhoc/adhoc` jobset.

Members of the `hydra-ad-hoc` group can use the socket. Until the
daemon has its own access control, they are effectively trusted Nix
users on this machine, so grant membership as carefully as
[`nix.settings.trusted-users`](../../options/nix/index.md#opt-nix.settings.trusted-users).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.adHoc.otel` {#opt-services.hydra.adHoc.otel}

OpenTelemetry (OTLP) tracing options for hydra-ad-hoc.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.adHoc.otel.enable` {#opt-services.hydra.adHoc.otel.enable}

Whether to enable OpenTelemetry tracing. This builds hydra-ad-hoc with the `otel`
cargo feature and exports spans via OTLP/gRPC, configured through
the standard `OTEL_*` environment variables
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.adHoc.otel.endpoint` {#opt-services.hydra.adHoc.otel.endpoint}

OTLP collector endpoint (`OTEL_EXPORTER_OTLP_ENDPOINT`). The
exporter uses gRPC, so point it at the gRPC port (typically 4317).

*Type:* null or (optionally newline-terminated) single-line string

*Default:* `null`

*Example:* `"http://127.0.0.1:4317"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.adHoc.otel.extraEnv` {#opt-services.hydra.adHoc.otel.extraEnv}

Additional `OTEL_*` environment variables not exposed as dedicated options.

*Type:* attribute set of (optionally newline-terminated) single-line string

*Default:* `{ }`

*Example:*

``` nix
{
  OTEL_TRACES_SAMPLER = "parentbased_traceidratio";
  OTEL_TRACES_SAMPLER_ARG = "0.1";
}
```

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.adHoc.otel.headers` {#opt-services.hydra.adHoc.otel.headers}

Headers sent to the collector (`OTEL_EXPORTER_OTLP_HEADERS`). They
end up in the world-readable systemd unit, so do not put secrets
here.

*Type:* null or (optionally newline-terminated) single-line string

*Default:* `null`

*Example:* `"authorization=Bearer token"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.adHoc.otel.protocol` {#opt-services.hydra.adHoc.otel.protocol}

OTLP protocol (`OTEL_EXPORTER_OTLP_PROTOCOL`).

*Type:* null or one of "grpc", "http/protobuf", "http/json"

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.adHoc.otel.serviceName` {#opt-services.hydra.adHoc.otel.serviceName}

Service name reported to the collector (`OTEL_SERVICE_NAME`).
Defaults to the binary name (`hydra-ad-hoc`).

*Type:* null or (optionally newline-terminated) single-line string

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.adHoc.package` {#opt-services.hydra.adHoc.package}

The `hydra-ad-hoc` package to use.

*Type:* package

*Default:* `pkgs.hydra-ad-hoc.override { withOtel = config.services.hydra.adHoc.otel.enable; }`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.adHoc.settings` {#opt-services.hydra.adHoc.settings}

Settings for hydra-ad-hoc, written to `/etc/hydra/ad-hoc.toml`.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.adHoc.settings.dbUrl` {#opt-services.hydra.adHoc.settings.dbUrl}

PostgreSQL database URL.

*Type:* (optionally newline-terminated) single-line string

*Default:* `config.services.hydra.dbUrl`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.adHoc.settings.hydraDataDir` {#opt-services.hydra.adHoc.settings.hydraDataDir}

Hydra data directory, whose build logs are streamed to clients.

*Type:* absolute path

*Default:* `"/var/lib/hydra"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.adHoc.settings.maxDbConnections` {#opt-services.hydra.adHoc.settings.maxDbConnections}

Maximum number of PostgreSQL connections.

*Type:* positive integer, meaning \>0

*Default:* `4`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.adHoc.settings.storeDir` {#opt-services.hydra.adHoc.settings.storeDir}

Nix store directory.

*Type:* absolute path

*Default:* `builtins.storeDir`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.adHoc.settings.upstreamSocket` {#opt-services.hydra.adHoc.settings.upstreamSocket}

Upstream nix-daemon socket that read operations and `.drv` uploads
are proxied to.

*Type:* absolute path

*Default:* `"/nix/var/nix/daemon-socket/socket"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.adHoc.socketPath` {#opt-services.hydra.adHoc.socketPath}

Unix socket clients connect to, e.g. with
`nix-store --store unix:///run/hydra-ad-hoc/socket --realise ...`.

*Type:* absolute path

*Default:* `"/run/hydra-ad-hoc/socket"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.dbUrl` {#opt-services.hydra.dbUrl}

`postgres://` URL of the Hydra database.

An `application_name` query parameter is appended per service
(e.g. `hydra-evaluator`), so do not set one here.

*Type:* string

*Default:* `"postgres://hydra@%2Frun%2Fpostgresql:5432/hydra"`

*Example:* `"postgres://foo@postgres.example.org:5432/hydra"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.debugServer` {#opt-services.hydra.debugServer}

Whether to run the server in debug mode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.enable` {#opt-services.hydra.enable}

Whether to run Hydra services.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.evaluatorPackage` {#opt-services.hydra.evaluatorPackage}

The hydra-evaluator package to use.

*Type:* package

*Default:* `pkgs.hydra-evaluator`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.evaluatorSettings` {#opt-services.hydra.evaluatorSettings}

Settings for the evaluator, written to
`/etc/hydra/evaluator.toml`.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.evaluatorSettings.max_concurrent_evals` {#opt-services.hydra.evaluatorSettings.max_concurrent_evals}

How many jobsets to evaluate at once.

*Type:* positive integer, meaning \>0

*Default:* `4`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.extraConfig` {#opt-services.hydra.extraConfig}

Extra lines for the Hydra configuration.

*Type:* strings concatenated with "\\n"

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.extraEnv` {#opt-services.hydra.extraEnv}

Extra environment variables for Hydra.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.gcRootsDir` {#opt-services.hydra.gcRootsDir}

Directory that holds Hydra garbage collector roots.

*Type:* absolute path

*Default:* `"/nix/var/nix/gcroots/hydra"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.hydraURL` {#opt-services.hydra.hydraURL}

The base URL for the Hydra webserver instance. Used for links in emails.

*Type:* string

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.listenHost` {#opt-services.hydra.listenHost}

The hostname or address to listen on or `*` to listen
on all interfaces.

*Type:* string

*Default:* `"*"`

*Example:* `"localhost"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.logo` {#opt-services.hydra.logo}

Path to a file containing the logo of your Hydra instance.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.maxServers` {#opt-services.hydra.maxServers}

Maximum number of starman workers to spawn.

*Type:* signed integer

*Default:* `25`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.maxSpareServers` {#opt-services.hydra.maxSpareServers}

Maximum number of spare starman workers to keep.

*Type:* signed integer

*Default:* `5`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.minSpareServers` {#opt-services.hydra.minSpareServers}

Minimum number of spare starman workers to keep.

*Type:* signed integer

*Default:* `4`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.minimumDiskFree` {#opt-services.hydra.minimumDiskFree}

Threshold of minimum disk space (GiB) to determine if the queue runner should run or not.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.minimumDiskFreeEvaluator` {#opt-services.hydra.minimumDiskFreeEvaluator}

Threshold of minimum disk space (GiB) to determine if the evaluator should run or not.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.notificationSender` {#opt-services.hydra.notificationSender}

Sender email address used for email notifications.

*Type:* string

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.package` {#opt-services.hydra.package}

The hydra package to use.

*Type:* package

*Default:* `pkgs.hydra`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.port` {#opt-services.hydra.port}

TCP port the web server should listen to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.awsCredentialsFile` {#opt-services.hydra.queueRunner.awsCredentialsFile}

Path to an AWS credentials file, exported as
`AWS_SHARED_CREDENTIALS_FILE` to the queue runner.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.grpc.address` {#opt-services.hydra.queueRunner.grpc.address}

Address the gRPC listener binds to. Must be reachable from
machines running `services.hydra-builder`.

*Type:* (optionally newline-terminated) single-line string

*Default:* `"[::1]"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.grpc.port` {#opt-services.hydra.queueRunner.grpc.port}

Port the gRPC listener binds to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `50051`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.grpc.unixSocket` {#opt-services.hydra.queueRunner.grpc.unixSocket}

Listen on this Unix socket instead of `address`/`port`, e.g. behind a
reverse proxy. Set `SocketUser`, `SocketGroup` and `SocketMode` in
`systemd.sockets.hydra-queue-runner-grpc.socketConfig` to control its
ownership and mode.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/hydra-queue-runner-grpc.sock"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.mtls` {#opt-services.hydra.queueRunner.mtls}

mTLS material used to authenticate builders.

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.mtls.clientCaCertPath` {#opt-services.hydra.queueRunner.mtls.clientCaCertPath}

Client CA certificate path.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.mtls.serverCertPath` {#opt-services.hydra.queueRunner.mtls.serverCertPath}

Server certificate path.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.mtls.serverKeyPath` {#opt-services.hydra.queueRunner.mtls.serverKeyPath}

Server key path.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.otel` {#opt-services.hydra.queueRunner.otel}

OpenTelemetry (OTLP) tracing options for the queue runner.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.otel.enable` {#opt-services.hydra.queueRunner.otel.enable}

Whether to enable OpenTelemetry tracing. This builds the queue runner with the `otel`
cargo feature and exports spans via OTLP/gRPC, configured through
the standard `OTEL_*` environment variables
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.otel.endpoint` {#opt-services.hydra.queueRunner.otel.endpoint}

OTLP collector endpoint (`OTEL_EXPORTER_OTLP_ENDPOINT`). The
exporter uses gRPC, so point it at the gRPC port (typically 4317).

*Type:* null or (optionally newline-terminated) single-line string

*Default:* `null`

*Example:* `"http://127.0.0.1:4317"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.otel.extraEnv` {#opt-services.hydra.queueRunner.otel.extraEnv}

Additional `OTEL_*` environment variables not exposed as dedicated options.

*Type:* attribute set of (optionally newline-terminated) single-line string

*Default:* `{ }`

*Example:*

``` nix
{
  OTEL_TRACES_SAMPLER = "parentbased_traceidratio";
  OTEL_TRACES_SAMPLER_ARG = "0.1";
}
```

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.otel.headers` {#opt-services.hydra.queueRunner.otel.headers}

Headers sent to the collector (`OTEL_EXPORTER_OTLP_HEADERS`). They
end up in the world-readable systemd unit, so do not put secrets
here.

*Type:* null or (optionally newline-terminated) single-line string

*Default:* `null`

*Example:* `"authorization=Bearer token"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.otel.protocol` {#opt-services.hydra.queueRunner.otel.protocol}

OTLP protocol (`OTEL_EXPORTER_OTLP_PROTOCOL`).

*Type:* null or one of "grpc", "http/protobuf", "http/json"

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.otel.serviceName` {#opt-services.hydra.queueRunner.otel.serviceName}

Service name reported to the collector (`OTEL_SERVICE_NAME`).
Defaults to the binary name (`hydra-queue-runner`).

*Type:* null or (optionally newline-terminated) single-line string

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.package` {#opt-services.hydra.queueRunner.package}

The `hydra-queue-runner` package to use.

*Type:* package

*Default:* `pkgs.hydra-queue-runner.override { withOtel = config.services.hydra.queueRunner.otel.enable; }`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.rest.address` {#opt-services.hydra.queueRunner.rest.address}

Address the REST listener binds to.

*Type:* (optionally newline-terminated) single-line string

*Default:* `"[::1]"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.rest.port` {#opt-services.hydra.queueRunner.rest.port}

Port the REST listener binds to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings` {#opt-services.hydra.queueRunner.settings}

Reloadable settings for the queue runner, written to
`/etc/hydra/queue-runner.toml`.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.buildTimeout` {#opt-services.hydra.queueRunner.settings.buildTimeout}

Default build timeout in seconds for builds without
`meta.timeout`. Also used as a floor for dependency-only
steps.

*Type:* unsigned integer, meaning \>=0

*Default:* `36000`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.concurrentUploadLimit` {#opt-services.hydra.queueRunner.settings.concurrentUploadLimit}

Maximum number of concurrent uploads to S3.

*Type:* positive integer, meaning \>0

*Default:* `5`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.dbUrl` {#opt-services.hydra.queueRunner.settings.dbUrl}

PostgreSQL database URL.

*Type:* (optionally newline-terminated) single-line string

*Default:* `config.services.hydra.dbUrl`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.dispatchTriggerTimerInS` {#opt-services.hydra.queueRunner.settings.dispatchTriggerTimerInS}

Interval in seconds at which the dispatcher is triggered. A
value \<= 0 disables the timer, leaving the dispatcher to be
triggered by queue changes only.

*Type:* signed integer

*Default:* `120`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.enableFodChecker` {#opt-services.hydra.queueRunner.settings.enableFodChecker}

Whether to enable the fixed-output derivation checker, which
collects FODs in a separate queue and schedules them on
machines advertising the mandatory `FOD` feature.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.forcedSubstituters` {#opt-services.hydra.queueRunner.settings.forcedSubstituters}

Substituters every builder is required to have. Builders that
do not enable `useSubstitutes` with these substituters are
rejected.

*Type:* list of (optionally newline-terminated) single-line string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.hydraDataDir` {#opt-services.hydra.queueRunner.settings.hydraDataDir}

Hydra data directory.

*Type:* absolute path

*Default:* `"/var/lib/hydra"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.machineFreeFn` {#opt-services.hydra.queueRunner.settings.machineFreeFn}

Function used to determine "idle" machines.

*Type:* one of "Dynamic", "DynamicWithMaxJobLimit", "Static"

*Default:* `"Static"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.machineSortFn` {#opt-services.hydra.queueRunner.settings.machineSortFn}

Function used to sort machines.

*Type:* one of "SpeedFactorOnly", "CpuCoreCountWithSpeedFactor", "BogomipsWithSpeedFactor"

*Default:* `"SpeedFactorOnly"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.maxConcurrentDownloads` {#opt-services.hydra.queueRunner.settings.maxConcurrentDownloads}

Maximum number of concurrent downloads per build. Raising this
raises the queue runner's memory usage.

*Type:* positive integer, meaning \>0

*Default:* `5`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.maxDbConnections` {#opt-services.hydra.queueRunner.settings.maxDbConnections}

Maximum number of PostgreSQL connections.

*Type:* positive integer, meaning \>0

*Default:* `128`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.maxLogSize` {#opt-services.hydra.queueRunner.settings.maxLogSize}

Maximum build log size in bytes before a build fails with
`LogLimitExceeded`.

*Type:* unsigned integer, meaning \>=0

*Default:* `67108864`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.maxOutputSize` {#opt-services.hydra.queueRunner.settings.maxOutputSize}

Per-output NAR size limit in bytes. Builds exceeding it fail
with `NarSizeLimitExceeded`. 0 disables the check.

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.maxRetries` {#opt-services.hydra.queueRunner.settings.maxRetries}

Maximum number of retries for a build step.

*Type:* positive integer, meaning \>0

*Default:* `5`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.maxSilentTime` {#opt-services.hydra.queueRunner.settings.maxSilentTime}

Default maximum silent time in seconds for builds without
`meta.maxSilent`. Also used as a floor for dependency-only
steps.

*Type:* unsigned integer, meaning \>=0

*Default:* `3600`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.maxUnsupportedTimeInS` {#opt-services.hydra.queueRunner.settings.maxUnsupportedTimeInS}

Time in seconds after which unsupported steps are aborted.

*Type:* unsigned integer, meaning \>=0

*Default:* `120`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.overflowStore` {#opt-services.hydra.queueRunner.settings.overflowStore}

Overflow S3 store. Steps referenced only by the listed jobsets
are uploaded there instead of to the default store.

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.overflowStore.jobsets` {#opt-services.hydra.queueRunner.settings.overflowStore.jobsets}

Jobsets (`project:jobset`) whose exclusive steps go to the overflow store.

*Type:* list of (optionally newline-terminated) single-line string

*Default:* `[ ]`

*Example:*

``` nix
[
  "nixpkgs:trunk"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.overflowStore.store` {#opt-services.hydra.queueRunner.settings.overflowStore.store}

S3 store URI of the overflow bucket.

*Type:* (optionally newline-terminated) single-line string

*Example:* `"s3://overflow?region=eu-west-1"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.queueTriggerTimerInS` {#opt-services.hydra.queueRunner.settings.queueTriggerTimerInS}

Interval in seconds at which the queue is triggered. A value
\<= 0 disables the timer, leaving the queue to be triggered by
PostgreSQL notifications only.

*Type:* signed integer

*Default:* `-1`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.remoteStoreAddr` {#opt-services.hydra.queueRunner.settings.remoteStoreAddr}

Remote store addresses.

*Type:* list of (optionally newline-terminated) single-line string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.retryBackoff` {#opt-services.hydra.queueRunner.settings.retryBackoff}

Additional backoff on top of `retryInterval`.

*Type:* floating point number

*Default:* `3.0`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.retryInterval` {#opt-services.hydra.queueRunner.settings.retryInterval}

Interval in seconds after which a step may be retried.

*Type:* positive integer, meaning \>0

*Default:* `60`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.rootsDir` {#opt-services.hydra.queueRunner.settings.rootsDir}

Directory holding the garbage collector roots.

*Type:* null or absolute path

*Default:* `config.services.hydra.gcRootsDir`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.stepSortFn` {#opt-services.hydra.queueRunner.settings.stepSortFn}

Function used to sort steps.

*Type:* one of "Legacy", "WithRdeps", "WithCriticalPath"

*Default:* `"WithRdeps"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.stopQueueRunAfterInS` {#opt-services.hydra.queueRunner.settings.stopQueueRunAfterInS}

Seconds after which a queue run is interrupted early. A value
\<= 0 lets queue runs go on for as long as they need.

*Type:* signed integer

*Default:* `60`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.tokenPaths` {#opt-services.hydra.queueRunner.settings.tokenPaths}

Paths of the accepted authentication tokens.

*Type:* null or (list of absolute path)

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.usePresignedUploads` {#opt-services.hydra.queueRunner.settings.usePresignedUploads}

Whether builders upload to S3 themselves instead of the queue
runner. Requires an S3 remote store as well as substitution on
the builders, see `forcedSubstituters`.

Presigned URLs stop working when the credentials that signed
them expire. With temporary credentials, such as instance
profiles or STS, uploads can fail before
`presigned-url-expiry` is reached.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.queueRunner.settings.useSubstitutes` {#opt-services.hydra.queueRunner.settings.useSubstitutes}

Whether to substitute paths instead of building them.

*Type:* boolean

*Default:* `config.services.hydra.useSubstitutes`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.smtpHost` {#opt-services.hydra.smtpHost}

Hostname of the SMTP server to use to send email.

*Type:* null or string

*Default:* `null`

*Example:* `"localhost"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.tracker` {#opt-services.hydra.tracker}

Piece of HTML that is included on all pages.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.useSubstitutes` {#opt-services.hydra.useSubstitutes}

Whether to use binary caches for downloading store paths. Note that
binary substitutions trigger (a potentially large number of) additional
HTTP requests that slow down the queue monitor thread significantly.
Also, this Hydra instance will serve those downloaded store paths to
its users with its own signature attached as if it had built them
itself, so don't enable this feature unless your active binary caches
are absolute trustworthy.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.ws.bind.address` {#opt-services.hydra.ws.bind.address}

Address the WebSocket listener binds to.

*Type:* (optionally newline-terminated) single-line string

*Default:* `"[::1]"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.ws.bind.port` {#opt-services.hydra.ws.bind.port}

Port the WebSocket listener binds to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9283`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.ws.bind.unixSocket` {#opt-services.hydra.ws.bind.unixSocket}

Listen on this Unix socket instead of `address`/`port`, e.g. behind a
reverse proxy. Set `SocketUser`, `SocketGroup` and `SocketMode` in
`systemd.sockets.hydra-ws.socketConfig` to control its ownership and
mode.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/hydra-ws.sock"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.ws.enable` {#opt-services.hydra.ws.enable}

Whether to enable the WebSocket server streaming live build logs to the web interface.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.ws.package` {#opt-services.hydra.ws.package}

The hydra-ws package to use.

*Type:* package

*Default:* `pkgs.hydra-ws`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.ws.settings` {#opt-services.hydra.ws.settings}

Settings for the WebSocket server, written to
`/etc/hydra/ws.toml`.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.ws.settings.dbUrl` {#opt-services.hydra.ws.settings.dbUrl}

PostgreSQL database URL.

*Type:* (optionally newline-terminated) single-line string

*Default:* `config.services.hydra.dbUrl`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.ws.settings.hydraDataDir` {#opt-services.hydra.ws.settings.hydraDataDir}

Hydra data directory.

*Type:* absolute path

*Default:* `"/var/lib/hydra"`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.ws.settings.idleGrace` {#opt-services.hydra.ws.settings.idleGrace}

Idle grace period in seconds before a log tail is stopped.

*Type:* signed integer

*Default:* `128`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hydra.ws.settings.maxDbConnections` {#opt-services.hydra.ws.settings.maxDbConnections}

Maximum number of PostgreSQL connections.

*Type:* positive integer, meaning \>0

*Default:* `128`

*Declared by:* [`nixos/modules/services/continuous-integration/hydra/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/hydra/default.nix)

## `services.hylafax.areaCode` {#opt-services.hylafax.areaCode}

Area code for server and all modems.

*Type:* null or non-empty string

*Default:* `null`

*Example:* `"30"`

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.autostart` {#opt-services.hylafax.autostart}

Autostart the HylaFAX queue manager at system start.
If this is `false`, the queue manager
will still be started if there are pending
jobs or if a user tries to connect to it.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.commonModemConfig` {#opt-services.hylafax.commonModemConfig}

Attribute set of default values for
modem config files `etc/config.*`.
Values can be either strings or integers
(which will be added to the config file verbatimly)
or lists thereof
(which will be translated to multiple
lines with the same configuration key).
Boolean values are translated to "Yes" or "No".
The default contains some reasonable
configuration to yield an operational system.

Think twice before changing
paths of fax-processing scripts.

*Type:* attribute set of ((list of ((string or signed integer convertible to it) or boolean convertible to it)) or ((string or signed integer convertible to it) or boolean convertible to it) convertible to it)

*Default:* `{ }`

*Example:*

``` nix
{
  InternationalPrefix = "00";
  LongDistancePrefix = "0";
}
```

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.countryCode` {#opt-services.hylafax.countryCode}

Country code for server and all modems.

*Type:* null or non-empty string

*Default:* `null`

*Example:* `"49"`

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.enable` {#opt-services.hylafax.enable}

Whether to enable HylaFAX server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.faxcron.enable.frequency` {#opt-services.hylafax.faxcron.enable.frequency}

Purges old files from the spooling area with
`faxcron` with the given frequency
(see `systemd.time(7)`)

*Type:* null or non-empty string

*Default:* `null`

*Example:* `"daily"`

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.faxcron.enable.spoolInit` {#opt-services.hylafax.faxcron.enable.spoolInit}

Whether to enable purging old files from the spooling area with
`faxcron`
each time the spooling area is initialized
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.faxcron.infoDays` {#opt-services.hylafax.faxcron.infoDays}

Set the expiration time for data in the
remote machine information directory in days.

*Type:* positive integer, meaning \>0

*Default:* `30`

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.faxcron.logDays` {#opt-services.hylafax.faxcron.logDays}

Set the expiration time for
session trace log files in days.

*Type:* positive integer, meaning \>0

*Default:* `30`

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.faxcron.rcvDays` {#opt-services.hylafax.faxcron.rcvDays}

Set the expiration time for files in
the received facsimile queue in days.

*Type:* positive integer, meaning \>0

*Default:* `7`

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.faxqConfig` {#opt-services.hylafax.faxqConfig}

Attribute set of lines for the global
faxq config file `etc/config`.
Values can be either strings or integers
(which will be added to the config file verbatimly)
or lists thereof
(which will be translated to multiple
lines with the same configuration key).
Boolean values are translated to "Yes" or "No".
The default contains some reasonable
configuration to yield an operational system.

*Type:* attribute set of ((list of ((string or signed integer convertible to it) or boolean convertible to it)) or ((string or signed integer convertible to it) or boolean convertible to it) convertible to it)

*Default:* `{ }`

*Example:*

``` nix
{
  InternationalPrefix = "00";
  LongDistancePrefix = "0";
}
```

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.faxqclean.archiving` {#opt-services.hylafax.faxqclean.archiving}

Enable or suppress job archiving:
`never` disables job archiving,
`as-flagged` archives jobs that
have been flagged for archiving by sendfax,
`always` forces archiving of all jobs.
See also `sendfax(1)` and `faxqclean(8)`.

*Type:* one of "never", "as-flagged", "always"

*Default:* `"as-flagged"`

*Example:* `"always"`

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.faxqclean.docqMinutes` {#opt-services.hylafax.faxqclean.docqMinutes}

Set the document
age threshold (in minutes) that controls how long
unreferenced files may reside in the docq directory.

*Type:* positive integer, meaning \>0

*Default:* `60`

*Example:* `24*60`

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.faxqclean.doneqMinutes` {#opt-services.hylafax.faxqclean.doneqMinutes}

Set the job
age threshold (in minutes) that controls how long
jobs may reside in the doneq directory.

*Type:* positive integer, meaning \>0

*Default:* `15`

*Example:* `24*60`

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.faxqclean.enable.frequency` {#opt-services.hylafax.faxqclean.enable.frequency}

Purges old files from the spooling area with
`faxcron` with the given frequency
(see `systemd.time(7)`).

*Type:* null or non-empty string

*Default:* `null`

*Example:* `"daily"`

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.faxqclean.enable.spoolInit` {#opt-services.hylafax.faxqclean.enable.spoolInit}

Whether to enable purging old files from the spooling area with
`faxqclean`
each time the spooling area is initialized
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.hfaxdConfig` {#opt-services.hylafax.hfaxdConfig}

Attribute set of lines for the global
hfaxd config file `etc/hfaxd.conf`.
Values can be either strings or integers
(which will be added to the config file verbatimly)
or lists thereof
(which will be translated to multiple
lines with the same configuration key).
Boolean values are translated to "Yes" or "No".
The default contains some reasonable
configuration to yield an operational system.

*Type:* attribute set of ((list of ((string or signed integer convertible to it) or boolean convertible to it)) or ((string or signed integer convertible to it) or boolean convertible to it) convertible to it)

*Default:* `{ }`

*Example:*

``` nix
{
  RecvqProtection = "0400";
}
```

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.internationalPrefix` {#opt-services.hylafax.internationalPrefix}

International prefix for server and all modems.

*Type:* null or string

*Default:* `null`

*Example:* `"00"`

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.longDistancePrefix` {#opt-services.hylafax.longDistancePrefix}

Long distance prefix for server and all modems.

*Type:* null or string

*Default:* `null`

*Example:* `"0"`

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.modems` {#opt-services.hylafax.modems}

Description of installed modems.
At least on modem must be defined
to enable the HylaFAX server.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  ttyS1 = {
    config = {
      FAXNumber = "123456";
      LocalIdentifier = "Smith";
    };
    type = "cirrus";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.modems.<name>.config` {#opt-services.hylafax.modems._name_.config}

Attribute set of values for the given modem.
Values can be either strings or integers
(which will be added to the config file verbatimly)
or lists thereof
(which will be translated to multiple
lines with the same configuration key).
Boolean values are translated to "Yes" or "No".
The default contains some reasonable
configuration to yield an operational system.

Options defined here override options in
`commonModemConfig` for this modem.

*Type:* attribute set of ((list of ((string or signed integer convertible to it) or boolean convertible to it)) or ((string or signed integer convertible to it) or boolean convertible to it) convertible to it)

*Default:* `{ }`

*Example:*

``` nix
{
  AreaCode = "49";
  FAXNumber = "123456";
  LocalCode = "30";
  LocalIdentifier = "LostInBerlin";
}
```

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.modems.<name>.name` {#opt-services.hylafax.modems._name_.name}

Name of modem device,
will be searched for in `/dev`.

*Type:* non-empty string

*Example:* `"ttyS1"`

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.modems.<name>.type` {#opt-services.hylafax.modems._name_.type}

Name of modem configuration file,
will be searched for in `config`
in the spooling area directory.

*Type:* non-empty string

*Example:* `"cirrus"`

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.package` {#opt-services.hylafax.package}

The HylaFAX package to use.

*Type:* package

*Default:* `pkgs.hylafaxplus`

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.sendmailPath` {#opt-services.hylafax.sendmailPath}

Path to `sendmail` program.
The default uses the local sendmail wrapper
(see `config.services.mail.sendmailSetuidWrapper`),
otherwise the `false`
binary to cause an error if used.

*Type:* absolute path

*Example:* `lib.getExe' config.services.postfix.package "sendmail"`

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.spoolAreaPath` {#opt-services.hylafax.spoolAreaPath}

The spooling area will be created/maintained
at the location given here.

*Type:* absolute path

*Default:* `"/var/spool/fax"`

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.spoolExtraInit` {#opt-services.hylafax.spoolExtraInit}

Additional shell code that is executed within the
spooling area directory right after its setup.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"chmod 0755 .  # everyone may read my faxes"`

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hylafax.userAccessFile` {#opt-services.hylafax.userAccessFile}

The `hosts.hfaxd` file entry in the spooling area
will be symlinked to the location given here.
This file must exist and be readable only by the `uucp` user.
See `hosts.hfaxd(5)` for details.
The example shown below permits access for all users.
Note that host-based access can be controlled with
`config.systemd.sockets.hylafax-hfaxd.listenStreams`;
by default, only `127.0.0.1` is permitted to connect.

```
  environment.etc."hosts.hfaxd" = {
    mode = "0600";
    user = "uucp";
    text = ".*";
  };
```

*Type:* absolute path

*Default:* `"/etc/hosts.hfaxd"`

*Declared by:* [`nixos/modules/services/networking/hylafax/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hylafax/options.nix)

## `services.hyphanet.enable` {#opt-services.hyphanet.enable}

Whether to enable Hyphanet daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/hyphanet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hyphanet.nix)

## `services.hyphanet.nice` {#opt-services.hyphanet.nice}

Set the nice level for the Hyphanet daemon

*Type:* integer between -20 and 19 (both inclusive)

*Default:* `10`

*Declared by:* [`nixos/modules/services/networking/hyphanet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/hyphanet.nix)

## `services.hypridle.enable` {#opt-services.hypridle.enable}

Whether to enable hypridle, Hyprland's idle daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/wayland/hypridle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/wayland/hypridle.nix)

## `services.hypridle.package` {#opt-services.hypridle.package}

The hypridle package to use.

*Type:* package

*Default:* `pkgs.hypridle`

*Declared by:* [`nixos/modules/services/wayland/hypridle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/wayland/hypridle.nix)

## `services.hyprwhspr-rs.enable` {#opt-services.hyprwhspr-rs.enable}

Whether to enable hyprwhspr-rs.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/hyprwhspr-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/hyprwhspr-rs.nix)

## `services.hyprwhspr-rs.environmentFile` {#opt-services.hyprwhspr-rs.environmentFile}

File containing API keys (GROQ\_API\_KEY, GEMINI\_API\_KEY) for remote transcription.

*Type:* null or string

*Default:* `null`

*Example:* `"/path/to/hyprwhspr_secret_file"`

*Declared by:* [`nixos/modules/services/misc/hyprwhspr-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/hyprwhspr-rs.nix)

## `services.hyprwhspr-rs.package` {#opt-services.hyprwhspr-rs.package}

The hyprwhspr-rs package to use.

*Type:* package

*Default:* `pkgs.hyprwhspr-rs`

*Declared by:* [`nixos/modules/services/misc/hyprwhspr-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/hyprwhspr-rs.nix)
