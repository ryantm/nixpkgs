# services (A) {#sec-options-services-a}

## `services.a2boot.enable` {#opt-services.a2boot.enable}

Whether to enable the a2boot daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/a2boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/a2boot.nix)

## `services.accounts-daemon.enable` {#opt-services.accounts-daemon.enable}

Whether to enable AccountsService, a DBus service for accessing
the list of user accounts and information attached to those accounts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/desktops/accountsservice.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/accountsservice.nix)

## `services.acme-dns.enable` {#opt-services.acme-dns.enable}

Whether to enable acme-dns.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/acme-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/acme-dns.nix)

## `services.acme-dns.package` {#opt-services.acme-dns.package}

The acme-dns package to use.

*Type:* package

*Default:* `pkgs.acme-dns`

*Declared by:* [`nixos/modules/services/networking/acme-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/acme-dns.nix)

## `services.acme-dns.settings` {#opt-services.acme-dns.settings}

Free-form settings written directly to the `acme-dns.cfg` file.
Refer to [https://github.com/joohoi/acme-dns/blob/master/README.md#configuration](https://github.com/joohoi/acme-dns/blob/master/README.md#configuration) for supported values.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/acme-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/acme-dns.nix)

## `services.acme-dns.settings.api.disable_registration` {#opt-services.acme-dns.settings.api.disable_registration}

Whether to disable the HTTP registration endpoint.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/acme-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/acme-dns.nix)

## `services.acme-dns.settings.api.ip` {#opt-services.acme-dns.settings.api.ip}

IP to bind the HTTP API on.

*Type:* string

*Default:* `"[::]"`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/acme-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/acme-dns.nix)

## `services.acme-dns.settings.api.port` {#opt-services.acme-dns.settings.api.port}

Listen port for the HTTP API.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/networking/acme-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/acme-dns.nix)

## `services.acme-dns.settings.api.tls` {#opt-services.acme-dns.settings.api.tls}

TLS backend to use.

*Type:* one of "letsencrypt", "letsencryptstaging", "cert", "none"

*Default:* `"none"`

*Declared by:* [`nixos/modules/services/networking/acme-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/acme-dns.nix)

## `services.acme-dns.settings.database.connection` {#opt-services.acme-dns.settings.database.connection}

Database connection string.

*Type:* string

*Default:* `"/var/lib/acme-dns/acme-dns.db"`

*Example:* `"postgres://user:password@localhost/acmedns"`

*Declared by:* [`nixos/modules/services/networking/acme-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/acme-dns.nix)

## `services.acme-dns.settings.database.engine` {#opt-services.acme-dns.settings.database.engine}

Database engine to use.

*Type:* one of "sqlite", "postgres"

*Default:* `"sqlite"`

*Declared by:* [`nixos/modules/services/networking/acme-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/acme-dns.nix)

## `services.acme-dns.settings.general.domain` {#opt-services.acme-dns.settings.general.domain}

Domain name to serve the requests off of.

*Type:* string

*Example:* `"acme-dns.example.com"`

*Declared by:* [`nixos/modules/services/networking/acme-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/acme-dns.nix)

## `services.acme-dns.settings.general.listen` {#opt-services.acme-dns.settings.general.listen}

IP+port combination to bind and serve the DNS server on.

*Type:* string

*Default:* `"[::]:53"`

*Example:* `"127.0.0.1:53"`

*Declared by:* [`nixos/modules/services/networking/acme-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/acme-dns.nix)

## `services.acme-dns.settings.general.nsadmin` {#opt-services.acme-dns.settings.general.nsadmin}

Zone admin email address for `SOA`.

*Type:* string

*Example:* `"admin.example.com"`

*Declared by:* [`nixos/modules/services/networking/acme-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/acme-dns.nix)

## `services.acme-dns.settings.general.nsname` {#opt-services.acme-dns.settings.general.nsname}

Zone name server.

*Type:* string

*Example:* `"acme-dns.example.com"`

*Declared by:* [`nixos/modules/services/networking/acme-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/acme-dns.nix)

## `services.acme-dns.settings.general.protocol` {#opt-services.acme-dns.settings.general.protocol}

Protocols to serve DNS responses on.

*Type:* one of "both", "both4", "both6", "udp", "udp4", "udp6", "tcp", "tcp4", "tcp6"

*Default:* `"both"`

*Declared by:* [`nixos/modules/services/networking/acme-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/acme-dns.nix)

## `services.acme-dns.settings.general.records` {#opt-services.acme-dns.settings.general.records}

Predefined DNS records served in addition to the `_acme-challenge` TXT records.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  # replace with your acme-dns server's public IPv4
  "acme-dns.example.com. A 198.51.100.1"
  # replace with your acme-dns server's public IPv6
  "acme-dns.example.com. AAAA 2001:db8::1"
  # acme-dns.example.com should resolve any *.acme-dns.example.com records
  "acme-dns.example.com. NS acme-dns.example.com."
]
```

*Declared by:* [`nixos/modules/services/networking/acme-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/acme-dns.nix)

## `services.acme-dns.settings.logconfig.loglevel` {#opt-services.acme-dns.settings.logconfig.loglevel}

Level to log on.

*Type:* one of "error", "warning", "info", "debug"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/networking/acme-dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/acme-dns.nix)

## `services.acpid.acEventCommands` {#opt-services.acpid.acEventCommands}

Shell commands to execute on an ac\_adapter.\* event.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/hardware/acpid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/acpid.nix)

## `services.acpid.enable` {#opt-services.acpid.enable}

Whether to enable the ACPI daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/acpid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/acpid.nix)

## `services.acpid.handlers` {#opt-services.acpid.handlers}

Event handlers.

::: note
Handler can be a single command.
:::

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  ac-power = {
    action = ''
      vals=($1)  # space separated string to array of multiple values
      case ''${vals[3]} in
          00000000)
              echo unplugged >> /tmp/acpi.log
              ;;
          00000001)
              echo plugged in >> /tmp/acpi.log
              ;;
          *)
              echo unknown >> /tmp/acpi.log
              ;;
      esac
    '';
    event = "ac_adapter/*";
  };
}
```

*Declared by:* [`nixos/modules/services/hardware/acpid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/acpid.nix)

## `services.acpid.handlers.<name>.action` {#opt-services.acpid.handlers._name_.action}

Shell commands to execute when the event is triggered.

*Type:* strings concatenated with "\\n"

*Declared by:* [`nixos/modules/services/hardware/acpid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/acpid.nix)

## `services.acpid.handlers.<name>.event` {#opt-services.acpid.handlers._name_.event}

Event type.

*Type:* string

*Example:* `"button/power.*" "button/lid.*" "ac_adapter.*" "button/mute.*" "button/volumedown.*" "cd/play.*" "cd/next.*"`

*Declared by:* [`nixos/modules/services/hardware/acpid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/acpid.nix)

## `services.acpid.lidEventCommands` {#opt-services.acpid.lidEventCommands}

Shell commands to execute on a button/lid.\* event.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/hardware/acpid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/acpid.nix)

## `services.acpid.logEvents` {#opt-services.acpid.logEvents}

Log all event activity.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/acpid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/acpid.nix)

## `services.acpid.powerEventCommands` {#opt-services.acpid.powerEventCommands}

Shell commands to execute on a button/power.\* event.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/hardware/acpid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/acpid.nix)

## `services.activemq.baseDir` {#opt-services.activemq.baseDir}

The base directory where ActiveMQ stores its persistent data and logs.
This will be overridden if you set "activemq.base" and "activemq.data"
in the `javaProperties` option. You can also override
this in activemq.xml.

*Type:* string

*Default:* `"/var/activemq"`

*Declared by:* [`nixos/modules/services/amqp/activemq/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/amqp/activemq/default.nix)

## `services.activemq.configurationDir` {#opt-services.activemq.configurationDir}

The base directory for ActiveMQ's configuration.
By default, this directory is searched for a file named activemq.xml,
which should contain the configuration for the broker service.

*Type:* string

*Default:* `"${pkgs.activemq}/conf"`

*Declared by:* [`nixos/modules/services/amqp/activemq/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/amqp/activemq/default.nix)

## `services.activemq.configurationURI` {#opt-services.activemq.configurationURI}

The URI that is passed along to the BrokerFactory to
set up the configuration of the ActiveMQ broker service.
You should not need to change this. For custom configuration,
set the `configurationDir` instead, and create
an activemq.xml configuration file in it.

*Type:* string

*Default:* `"xbean:activemq.xml"`

*Declared by:* [`nixos/modules/services/amqp/activemq/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/amqp/activemq/default.nix)

## `services.activemq.enable` {#opt-services.activemq.enable}

Enable the Apache ActiveMQ message broker service.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/amqp/activemq/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/amqp/activemq/default.nix)

## `services.activemq.extraJavaOptions` {#opt-services.activemq.extraJavaOptions}

Add extra options here that you want to be sent to the
Java runtime when the broker service is started.

*Type:* strings concatenated with " "

*Default:* `""`

*Example:* `"-Xmx2G -Xms2G -XX:MaxPermSize=512M"`

*Declared by:* [`nixos/modules/services/amqp/activemq/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/amqp/activemq/default.nix)

## `services.activemq.javaProperties` {#opt-services.activemq.javaProperties}

Specifies Java properties that are sent to the ActiveMQ
broker service with the "-D" option. You can set properties
here to change the behaviour and configuration of the broker.
All essential properties that are not set here are automatically
given reasonable defaults.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  "java.net.preferIPv4Stack" = "true";
}
```

*Declared by:* [`nixos/modules/services/amqp/activemq/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/amqp/activemq/default.nix)

## `services.actkbd.bindings` {#opt-services.actkbd.bindings}

Key bindings for `actkbd`.

See `actkbd` `README` for documentation.

The example shows a piece of what `sound.mediaKeys.enable` does when enabled.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[ { keys = [ 113 ]; events = [ "key" ]; command = "${pkgs.alsa-utils}/bin/amixer -q set Master toggle"; }
]
```

*Declared by:* [`nixos/modules/services/hardware/actkbd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/actkbd.nix)

## `services.actkbd.bindings.*.attributes` {#opt-services.actkbd.bindings._.attributes}

List of attributes.

*Type:* list of string

*Default:*

``` nix
[
  "exec"
]
```

*Declared by:* [`nixos/modules/services/hardware/actkbd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/actkbd.nix)

## `services.actkbd.bindings.*.command` {#opt-services.actkbd.bindings._.command}

What to run.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/hardware/actkbd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/actkbd.nix)

## `services.actkbd.bindings.*.events` {#opt-services.actkbd.bindings._.events}

List of events to match.

*Type:* list of (one of "key", "rep", "rel")

*Default:*

``` nix
[
  "key"
]
```

*Declared by:* [`nixos/modules/services/hardware/actkbd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/actkbd.nix)

## `services.actkbd.bindings.*.keys` {#opt-services.actkbd.bindings._.keys}

List of keycodes to match.

*Type:* list of signed integer

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/hardware/actkbd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/actkbd.nix)

## `services.actkbd.enable` {#opt-services.actkbd.enable}

Whether to enable the `actkbd` key mapping daemon.

Turning this on will start an `actkbd`
instance for every evdev input that has at least one key
(which is okay even for systems with tiny memory footprint,
since actkbd normally uses \<100 bytes of memory per
instance).

This allows binding keys globally without the need for e.g.
X11.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/actkbd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/actkbd.nix)

## `services.actkbd.extraConfig` {#opt-services.actkbd.extraConfig}

Literal contents to append to the end of actkbd configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/hardware/actkbd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/actkbd.nix)

## `services.actual.enable` {#opt-services.actual.enable}

Whether to enable actual, a privacy focused app for managing your finances.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/actual.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/actual.nix)

## `services.actual.group` {#opt-services.actual.group}

Group account under which Actual runs.

If null is specified (default), a temporary user will be created by systemd. Otherwise won't be automatically created by the service.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/actual.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/actual.nix)

## `services.actual.openFirewall` {#opt-services.actual.openFirewall}

Whether to open the firewall for the specified port.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/actual.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/actual.nix)

## `services.actual.package` {#opt-services.actual.package}

The actual-server package to use.

*Type:* package

*Default:* `pkgs.actual-server`

*Declared by:* [`nixos/modules/services/web-apps/actual.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/actual.nix)

## `services.actual.settings` {#opt-services.actual.settings}

Server settings, refer to [the documentation](https://actualbudget.org/docs/config/) for available options.
You can specify secret values in this configuration by setting `somevalue._secret = "/path/to/file"` instead of setting `somevalue` directly.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/actual.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/actual.nix)

## `services.actual.settings.dataDir` {#opt-services.actual.settings.dataDir}

Directory under which Actual runs and saves its data.

Changing this after you already have a working instance may make Actual fail to start, even if you move all files in the data dir. If migration is needed, refer to [this comment](https://github.com/actualbudget/actual/issues/3957#issuecomment-2567076794) for a fix.

*Type:* string

*Default:* `"/var/lib/actual"`

*Declared by:* [`nixos/modules/services/web-apps/actual.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/actual.nix)

## `services.actual.settings.hostname` {#opt-services.actual.settings.hostname}

The address to listen on

*Type:* string

*Default:* `"::"`

*Declared by:* [`nixos/modules/services/web-apps/actual.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/actual.nix)

## `services.actual.settings.port` {#opt-services.actual.settings.port}

The port to listen on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/web-apps/actual.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/actual.nix)

## `services.actual.settings.serverFiles` {#opt-services.actual.settings.serverFiles}

The server will put an account.sqlite file in this directory, which will contain the (hashed) server password, a list of all the budget files the server knows about, and the active session token (along with anything else the server may want to store in the future).

*Type:* string

*Default:* `"\${cfg.settings.dataDir}/server-files"`

*Declared by:* [`nixos/modules/services/web-apps/actual.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/actual.nix)

## `services.actual.settings.userFiles` {#opt-services.actual.settings.userFiles}

The server will put all the budget files in this directory as binary blobs.

*Type:* string

*Default:* `"\${cfg.settings.dataDir}/user-files"`

*Declared by:* [`nixos/modules/services/web-apps/actual.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/actual.nix)

## `services.actual.user` {#opt-services.actual.user}

User account under which Actual runs.

If null is specified (default), a temporary user will be created by systemd. Otherwise won't be automatically created by the service.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/actual.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/actual.nix)

## `services.adguardhome.allowDHCP` {#opt-services.adguardhome.allowDHCP}

Allows AdGuard Home to open raw sockets (`CAP_NET_RAW`), which is
required for the integrated DHCP server.

The default enables this conditionally if the declarative configuration
enables the integrated DHCP server. Manually setting this option is only
required for non-declarative setups.

*Type:* boolean

*Default:* `config.services.adguardhome.settings.dhcp.enabled or false`

*Declared by:* [`nixos/modules/services/networking/adguardhome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/adguardhome.nix)

## `services.adguardhome.enable` {#opt-services.adguardhome.enable}

Whether to enable AdGuard Home network-wide ad blocker.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/adguardhome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/adguardhome.nix)

## `services.adguardhome.extraArgs` {#opt-services.adguardhome.extraArgs}

Extra command line parameters to be passed to the adguardhome binary.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/adguardhome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/adguardhome.nix)

## `services.adguardhome.mutableSettings` {#opt-services.adguardhome.mutableSettings}

Allow changes made on the AdGuard Home web interface to persist between
service restarts.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/adguardhome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/adguardhome.nix)

## `services.adguardhome.openFirewall` {#opt-services.adguardhome.openFirewall}

Open ports in the firewall for the AdGuard Home web interface. Does not
open the port needed to access the DNS resolver.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/adguardhome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/adguardhome.nix)

## `services.adguardhome.package` {#opt-services.adguardhome.package}

The package that runs adguardhome.

*Type:* package

*Default:* `pkgs.adguardhome`

*Declared by:* [`nixos/modules/services/networking/adguardhome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/adguardhome.nix)

## `services.adguardhome.settings` {#opt-services.adguardhome.settings}

AdGuard Home configuration. Refer to
[https://github.com/AdguardTeam/AdGuardHome/wiki/Configuration#configuration-file](https://github.com/AdguardTeam/AdGuardHome/wiki/Configuration#configuration-file)
for details on supported values.

::: note
On start and if `mutableSettings` is `true`,
these options are merged into the configuration file on start, taking
precedence over configuration changes made on the web interface.

Set this to `null` (default) for a non-declarative configuration without any
Nix-supplied values.
Declarative configurations are supplied with a default `schema_version`, and `http.address`.
:::

*Type:* null or (open submodule of (YAML 1.1 value))

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/adguardhome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/adguardhome.nix)

## `services.adguardhome.settings.http.address` {#opt-services.adguardhome.settings.http.address}

Address to serve the web interface on, in the `host:port` format.

*Type:* string

*Default:* `"0.0.0.0:3000"`

*Declared by:* [`nixos/modules/services/networking/adguardhome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/adguardhome.nix)

## `services.adguardhome.settings.schema_version` {#opt-services.adguardhome.settings.schema_version}

Schema version for the configuration.
Defaults to the `schema_version` supplied by `cfg.package`.

*Type:* signed integer

*Default:* `cfg.package.schema_version`

*Declared by:* [`nixos/modules/services/networking/adguardhome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/adguardhome.nix)

## `services.adw-bluetooth.enable` {#opt-services.adw-bluetooth.enable}

Whether to enable Adwaita Bluetooth daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/adw-bluetooth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/adw-bluetooth.nix)

## `services.adw-bluetooth.package` {#opt-services.adw-bluetooth.package}

The adw-bluetooth package to use.

*Type:* package

*Default:* `pkgs.adw-bluetooth`

*Declared by:* [`nixos/modules/services/desktops/adw-bluetooth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/adw-bluetooth.nix)

## `services.aerospike.enable` {#opt-services.aerospike.enable}

Whether to enable Aerospike server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/aerospike.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/aerospike.nix)

## `services.aerospike.extraConfig` {#opt-services.aerospike.extraConfig}

Extra configuration

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  namespace test {
    replication-factor 2
    memory-size 4G
    default-ttl 30d
    storage-engine memory
  }
''
```

*Declared by:* [`nixos/modules/services/databases/aerospike.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/aerospike.nix)

## `services.aerospike.networkConfig` {#opt-services.aerospike.networkConfig}

network section of configuration file

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  service {
    address any
    port 3000
  }
  
  heartbeat {
    address any
    mode mesh
    port 3002
    interval 150
    timeout 10
  }
  
  fabric {
    address any
    port 3001
  }
  
  info {
    address any
    port 3003
  }
''
```

*Declared by:* [`nixos/modules/services/databases/aerospike.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/aerospike.nix)

## `services.aerospike.package` {#opt-services.aerospike.package}

The aerospike package to use.

*Type:* package

*Default:* `pkgs.aerospike`

*Declared by:* [`nixos/modules/services/databases/aerospike.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/aerospike.nix)

## `services.aerospike.workDir` {#opt-services.aerospike.workDir}

Location where Aerospike stores its files

*Type:* string

*Default:* `"/var/lib/aerospike"`

*Declared by:* [`nixos/modules/services/databases/aerospike.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/aerospike.nix)

## `services.aesmd.enable` {#opt-services.aesmd.enable}

Whether to enable Intel's Architectural Enclave Service Manager (AESM) for Intel SGX.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/aesmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/aesmd.nix)

## `services.aesmd.environment` {#opt-services.aesmd.environment}

Additional environment variables to pass to the AESM service.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  AZDCAP_COLLATERAL_VERSION = "v2";
  AZDCAP_DEBUG_LOG_LEVEL = "INFO";
}
```

*Declared by:* [`nixos/modules/services/security/aesmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/aesmd.nix)

## `services.aesmd.package` {#opt-services.aesmd.package}

The sgx-psw package to use.

*Type:* package

*Default:* `pkgs.sgx-psw`

*Declared by:* [`nixos/modules/services/security/aesmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/aesmd.nix)

## `services.aesmd.quoteProviderLibrary` {#opt-services.aesmd.quoteProviderLibrary}

Custom quote provider library to use.

*Type:* null or absolute path

*Default:* `null`

*Example:* `pkgs.sgx-azure-dcap-client`

*Declared by:* [`nixos/modules/services/security/aesmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/aesmd.nix)

## `services.aesmd.settings.defaultQuotingType` {#opt-services.aesmd.settings.defaultQuotingType}

Attestation quote type.

*Type:* null or value "ecdsa\_256" (singular enum)

*Default:* `null`

*Example:* `"ecdsa_256"`

*Declared by:* [`nixos/modules/services/security/aesmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/aesmd.nix)

## `services.aesmd.settings.proxy` {#opt-services.aesmd.settings.proxy}

HTTP network proxy.

*Type:* null or string

*Default:* `null`

*Example:* `"http://proxy_url:1234"`

*Declared by:* [`nixos/modules/services/security/aesmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/aesmd.nix)

## `services.aesmd.settings.proxyType` {#opt-services.aesmd.settings.proxyType}

Type of proxy to use. The `default` uses the system's default proxy.
If `direct` is given, uses no proxy.
A value of `manual` uses the proxy from
[`services.aesmd.settings.proxy`](#opt-services.aesmd.settings.proxy).

*Type:* null or one of "default", "direct", "manual"

*Default:*

``` nix
if (cfg.settings.proxy != null) then "manual" else null
```

*Example:* `"default"`

*Declared by:* [`nixos/modules/services/security/aesmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/aesmd.nix)

## `services.aesmd.settings.qplLogLevel` {#opt-services.aesmd.settings.qplLogLevel}

Log level for the default quote provider library.

*Type:* null or one of "info", "error"

*Default:* `null`

*Example:* `"error"`

*Declared by:* [`nixos/modules/services/security/aesmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/aesmd.nix)

## `services.agate.addresses` {#opt-services.agate.addresses}

Addresses to listen on, IP:PORT, if you haven't disabled forwarding
only set IPv4.

*Type:* list of string

*Default:*

``` nix
[
  "0.0.0.0:1965"
]
```

*Declared by:* [`nixos/modules/services/web-servers/agate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/agate.nix)

## `services.agate.certificatesDir` {#opt-services.agate.certificatesDir}

Root of the certificate directory.

*Type:* absolute path

*Default:* `"/var/lib/agate/certificates"`

*Declared by:* [`nixos/modules/services/web-servers/agate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/agate.nix)

## `services.agate.contentDir` {#opt-services.agate.contentDir}

Root of the content directory.

*Type:* absolute path

*Default:* `"/var/lib/agate/content"`

*Declared by:* [`nixos/modules/services/web-servers/agate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/agate.nix)

## `services.agate.enable` {#opt-services.agate.enable}

Whether to enable Agate Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/agate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/agate.nix)

## `services.agate.extraArgs` {#opt-services.agate.extraArgs}

Extra arguments to use running agate.

*Type:* list of string

*Default:*

``` nix
[
  ""
]
```

*Example:*

``` nix
[
  "--log-ip"
]
```

*Declared by:* [`nixos/modules/services/web-servers/agate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/agate.nix)

## `services.agate.hostnames` {#opt-services.agate.hostnames}

Domain name of this Gemini server, enables checking hostname and port
in requests. (multiple occurrences means basic vhosts)

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-servers/agate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/agate.nix)

## `services.agate.language` {#opt-services.agate.language}

RFC 4646 Language code for text/gemini documents.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/agate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/agate.nix)

## `services.agate.onlyTls_1_3` {#opt-services.agate.onlyTls_1_3}

Only use TLSv1.3 (default also allows TLSv1.2).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/agate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/agate.nix)

## `services.agate.package` {#opt-services.agate.package}

The agate package to use.

*Type:* package

*Default:* `pkgs.agate`

*Declared by:* [`nixos/modules/services/web-servers/agate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/agate.nix)

## `services.agorakit.appKeyFile` {#opt-services.agorakit.appKeyFile}

A file containing the Laravel APP\_KEY - a 32 character long,
base64 encoded key used for encryption where needed. Can be
generated with <code>head -c 32 /dev/urandom | base64</code>.

*Type:* absolute path

*Example:* `"/run/keys/agorakit-appkey"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.appURL` {#opt-services.agorakit.appURL}

The root URL that you want to host agorakit on. All URLs in agorakit will be generated using this value.
If you change this in the future you may need to run a command to update stored URLs in the database.
Command example: <code>php artisan agorakit:update-url https://old.example.com https://new.example.com</code>

*Type:* string

*Default:* `"http\${lib.optionalString tlsEnabled \"s\"}://\${cfg.hostName}"`

*Example:* `"https://example.com"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.config` {#opt-services.agorakit.config}

Agorakit configuration options to set in the
<filename>.env</filename> file.

Refer to [https://github.com/agorakit/agorakit](https://github.com/agorakit/agorakit)
for details on supported values.

Settings containing secret data should be set to an attribute
set containing the attribute `_secret` - a
string pointing to a file containing the value the option
should be set to. See the example to get a better picture of
this: in the resulting <filename>.env</filename> file, the
`OIDC_CLIENT_SECRET` key will be set to the
contents of the <filename>/run/keys/oidc\_secret</filename>
file.

*Type:* attribute set of (null or boolean or signed integer or 16 bit unsigned integer; between 0 and 65535 (both inclusive) or absolute path or string or (submodule))

*Default:* `{ }`

*Example:*

``` nix
''
  {
    ALLOWED_IFRAME_HOSTS = "https://example.com";
    AUTH_METHOD = "oidc";
    OIDC_NAME = "MyLogin";
    OIDC_DISPLAY_NAME_CLAIMS = "name";
    OIDC_CLIENT_ID = "agorakit";
    OIDC_CLIENT_SECRET = {_secret = "/run/keys/oidc_secret"};
    OIDC_ISSUER = "https://keycloak.example.com/auth/realms/My%20Realm";
    OIDC_ISSUER_DISCOVER = true;
  }
''
```

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.dataDir` {#opt-services.agorakit.dataDir}

agorakit data directory

*Type:* absolute path

*Default:* `"/var/lib/agorakit"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.database.createLocally` {#opt-services.agorakit.database.createLocally}

Create the database and database user locally.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.database.host` {#opt-services.agorakit.database.host}

Database host address.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.database.name` {#opt-services.agorakit.database.name}

Database name.

*Type:* string

*Default:* `"agorakit"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.database.passwordFile` {#opt-services.agorakit.database.passwordFile}

A file containing the password corresponding to

<option>database.user</option>.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/agorakit-dbpassword"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.database.port` {#opt-services.agorakit.database.port}

Database host port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3306`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.database.user` {#opt-services.agorakit.database.user}

Database username.

*Type:* string

*Default:* `user`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.enable` {#opt-services.agorakit.enable}

Whether to enable agorakit.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.group` {#opt-services.agorakit.group}

Group agorakit runs as.

*Type:* string

*Default:* `"agorakit"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.hostName` {#opt-services.agorakit.hostName}

The hostname to serve agorakit on.

*Type:* string

*Default:* `config.networking.fqdn`

*Example:* `"agorakit.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.mail.driver` {#opt-services.agorakit.mail.driver}

Mail driver to use.

*Type:* one of "smtp", "sendmail"

*Default:* `"smtp"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.mail.encryption` {#opt-services.agorakit.mail.encryption}

SMTP encryption mechanism to use.

*Type:* null or value "tls" (singular enum)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.mail.from` {#opt-services.agorakit.mail.from}

Mail "from" email.

*Type:* string

*Default:* `"mail@agorakit.com"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.mail.fromName` {#opt-services.agorakit.mail.fromName}

Mail "from" name.

*Type:* string

*Default:* `"agorakit"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.mail.host` {#opt-services.agorakit.mail.host}

Mail host address.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.mail.passwordFile` {#opt-services.agorakit.mail.passwordFile}

A file containing the password corresponding to

<option>mail.user</option>.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/agorakit-mailpassword"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.mail.port` {#opt-services.agorakit.mail.port}

Mail host port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1025`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.mail.user` {#opt-services.agorakit.mail.user}

Mail username.

*Type:* null or string

*Default:* `null`

*Example:* `"agorakit"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.maxUploadSize` {#opt-services.agorakit.maxUploadSize}

The maximum size for uploads (e.g. images).

*Type:* string

*Default:* `"18M"`

*Example:* `"1G"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx` {#opt-services.agorakit.nginx}

With this option, you can customize the nginx virtualHost settings.

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
''
  {
    serverAliases = [
      "agorakit.''${config.networking.domain}"
    ];
    # To enable encryption and let let's encrypt take care of certificate
    forceSSL = true;
    enableACME = true;
  }
''
```

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.acmeFallbackHost` {#opt-services.agorakit.nginx.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.acmeRoot` {#opt-services.agorakit.nginx.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.addSSL` {#opt-services.agorakit.nginx.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.basicAuth` {#opt-services.agorakit.nginx.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.basicAuthFile` {#opt-services.agorakit.nginx.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.default` {#opt-services.agorakit.nginx.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.enableACME` {#opt-services.agorakit.nginx.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.extraConfig` {#opt-services.agorakit.nginx.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.forceSSL` {#opt-services.agorakit.nginx.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.globalRedirect` {#opt-services.agorakit.nginx.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.http2` {#opt-services.agorakit.nginx.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.http3` {#opt-services.agorakit.nginx.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.http3_hq` {#opt-services.agorakit.nginx.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.kTLS` {#opt-services.agorakit.nginx.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.listen` {#opt-services.agorakit.nginx.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.listen.*.addr` {#opt-services.agorakit.nginx.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.listen.*.extraParameters` {#opt-services.agorakit.nginx.listen._.extraParameters}

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

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.listen.*.port` {#opt-services.agorakit.nginx.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.listen.*.proxyProtocol` {#opt-services.agorakit.nginx.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.listen.*.ssl` {#opt-services.agorakit.nginx.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.listenAddresses` {#opt-services.agorakit.nginx.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.locations` {#opt-services.agorakit.nginx.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.locations.<name>.alias` {#opt-services.agorakit.nginx.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.locations.<name>.basicAuth` {#opt-services.agorakit.nginx.locations._name_.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.locations.<name>.basicAuthFile` {#opt-services.agorakit.nginx.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.locations.<name>.extraConfig` {#opt-services.agorakit.nginx.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.locations.<name>.fastcgiParams` {#opt-services.agorakit.nginx.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.locations.<name>.index` {#opt-services.agorakit.nginx.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.locations.<name>.priority` {#opt-services.agorakit.nginx.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.locations.<name>.proxyPass` {#opt-services.agorakit.nginx.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.locations.<name>.proxyWebsockets` {#opt-services.agorakit.nginx.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.locations.<name>.recommendedProxySettings` {#opt-services.agorakit.nginx.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.locations.<name>.recommendedUwsgiSettings` {#opt-services.agorakit.nginx.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.locations.<name>.return` {#opt-services.agorakit.nginx.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.locations.<name>.root` {#opt-services.agorakit.nginx.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.locations.<name>.tryFiles` {#opt-services.agorakit.nginx.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.locations.<name>.useGrpcErrorPages` {#opt-services.agorakit.nginx.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.locations.<name>.uwsgiPass` {#opt-services.agorakit.nginx.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.onlySSL` {#opt-services.agorakit.nginx.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.quic` {#opt-services.agorakit.nginx.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.redirectCode` {#opt-services.agorakit.nginx.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.rejectSSL` {#opt-services.agorakit.nginx.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.reuseport` {#opt-services.agorakit.nginx.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.root` {#opt-services.agorakit.nginx.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.serverAliases` {#opt-services.agorakit.nginx.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.serverName` {#opt-services.agorakit.nginx.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.sslCertificate` {#opt-services.agorakit.nginx.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.sslCertificateKey` {#opt-services.agorakit.nginx.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.sslTrustedCertificate` {#opt-services.agorakit.nginx.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.nginx.useACMEHost` {#opt-services.agorakit.nginx.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.phpPackage` {#opt-services.agorakit.phpPackage}

The php package to use.

*Type:* package

*Default:* `pkgs.php`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.poolConfig` {#opt-services.agorakit.poolConfig}

Options for the agorakit PHP pool. See the documentation on <literal>php-fpm.conf</literal>
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

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.agorakit.user` {#opt-services.agorakit.user}

User agorakit runs as.

*Type:* string

*Default:* `"agorakit"`

*Declared by:* [`nixos/modules/services/web-apps/agorakit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/agorakit.nix)

## `services.airsonic.contextPath` {#opt-services.airsonic.contextPath}

The context path, i.e., the last part of the Airsonic
URL. Typically '/' or '/airsonic'. Default '/'

*Type:* absolute path

*Default:* `"/"`

*Declared by:* [`nixos/modules/services/misc/airsonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/airsonic.nix)

## `services.airsonic.enable` {#opt-services.airsonic.enable}

Whether to enable Airsonic, the Free and Open Source media streaming server (fork of Subsonic and Libresonic).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/airsonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/airsonic.nix)

## `services.airsonic.home` {#opt-services.airsonic.home}

The directory where Airsonic will create files.
Make sure it is writable.

*Type:* absolute path

*Default:* `"/var/lib/airsonic"`

*Declared by:* [`nixos/modules/services/misc/airsonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/airsonic.nix)

## `services.airsonic.jre` {#opt-services.airsonic.jre}

The jre8 package to use. ::: {.note}
Airsonic only supports Java 8, airsonic-advanced requires at least
Java 11.
:::

*Type:* package

*Default:* `pkgs.jre8`

*Declared by:* [`nixos/modules/services/misc/airsonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/airsonic.nix)

## `services.airsonic.jvmOptions` {#opt-services.airsonic.jvmOptions}

Extra command line options for the JVM running AirSonic.
Useful for sending jukebox output to non-default alsa
devices.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-Djavax.sound.sampled.Clip='#CODEC [plughw:1,0]'"
  "-Djavax.sound.sampled.Port='#Port CODEC [hw:1]'"
  "-Djavax.sound.sampled.SourceDataLine='#CODEC [plughw:1,0]'"
  "-Djavax.sound.sampled.TargetDataLine='#CODEC [plughw:1,0]'"
]
```

*Declared by:* [`nixos/modules/services/misc/airsonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/airsonic.nix)

## `services.airsonic.listenAddress` {#opt-services.airsonic.listenAddress}

The host name or IP address on which to bind Airsonic.
The default value is appropriate for first launch, when the
default credentials are easy to guess. It is also appropriate
if you intend to use the virtualhost option in the service
module. In other cases, you may want to change this to a
specific IP or 0.0.0.0 to listen on all interfaces.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/misc/airsonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/airsonic.nix)

## `services.airsonic.maxMemory` {#opt-services.airsonic.maxMemory}

The memory limit (max Java heap size) in megabytes.
Default: 100

*Type:* signed integer

*Default:* `100`

*Declared by:* [`nixos/modules/services/misc/airsonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/airsonic.nix)

## `services.airsonic.port` {#opt-services.airsonic.port}

The port on which Airsonic will listen for
incoming HTTP traffic. Set to 0 to disable.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4040`

*Declared by:* [`nixos/modules/services/misc/airsonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/airsonic.nix)

## `services.airsonic.transcoders` {#opt-services.airsonic.transcoders}

List of paths to transcoder executables that should be accessible
from Airsonic. Symlinks will be created to each executable inside
${config.services.airsonic.home}/transcoders.

*Type:* list of absolute path

*Default:* `[ "${pkgs.ffmpeg.bin}/bin/ffmpeg" ]`

*Declared by:* [`nixos/modules/services/misc/airsonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/airsonic.nix)

## `services.airsonic.user` {#opt-services.airsonic.user}

User account under which airsonic runs.

*Type:* string

*Default:* `"airsonic"`

*Declared by:* [`nixos/modules/services/misc/airsonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/airsonic.nix)

## `services.airsonic.virtualHost` {#opt-services.airsonic.virtualHost}

Name of the nginx virtualhost to use and setup. If null, do not setup any virtualhost.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/airsonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/airsonic.nix)

## `services.airsonic.war` {#opt-services.airsonic.war}

Airsonic war file to use.

*Type:* absolute path

*Default:* `"${pkgs.airsonic}/webapps/airsonic.war"`

*Declared by:* [`nixos/modules/services/misc/airsonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/airsonic.nix)

## `services.akkoma.config` {#opt-services.akkoma.config}

Configuration for Akkoma. The attributes are serialised to Elixir DSL.

Refer to [https://docs.akkoma.dev/stable/configuration/cheatsheet/](https://docs.akkoma.dev/stable/configuration/cheatsheet/) for
configuration options.

Settings containing secret data should be set to an attribute set containing the
attribute `_secret` - a string pointing to a file containing the value the option
should be set to.

*Type:* open submodule of attribute set of attribute set of (Elixir value)

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":joken".":default_signer"` {#opt-services.akkoma.config.__joken_.__default_signer_}

JWT signing secret.

The attribute `_secret` should point to a file containing the secret.

This secret can be generated as follows:

``` ShellSession
$ tr -dc 'A-Za-z0-9-._~' </dev/urandom | head -c 64
```

*Type:* secret value

*Default:*

``` nix
{
  _secret = "/var/lib/secrets/akkoma/jwt-signer";
}
```

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":logger".":ex_syslogger".level` {#opt-services.akkoma.config.__logger_.__ex_syslogger_.level}

Log level.

Refer to
[https://hexdocs.pm/logger/Logger.html#module-levels](https://hexdocs.pm/logger/Logger.html#module-levels)
for options.

*Type:* non-empty string

*Default:* `":info"`

*Example:* `":warning"`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":pleroma".":frontends"` {#opt-services.akkoma.config.__pleroma_.__frontends_}

Frontend configuration.

Users should rely on the default value and prefer to configure frontends through
[`config.services.akkoma.frontends`](#opt-services.akkoma.frontends).

*Type:* Elixir value

*Default:*

``` nix
lib.mapAttrs (key: val:
  (pkgs.formats.elixirConf { }).lib.mkMap { name = val.name; ref = val.ref; })
  config.services.akkoma.frontends;
```

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":pleroma".":instance".description` {#opt-services.akkoma.config.__pleroma_.__instance_.description}

Instance description.

*Type:* non-empty string

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":pleroma".":instance".email` {#opt-services.akkoma.config.__pleroma_.__instance_.email}

Instance administrator email.

*Type:* non-empty string

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":pleroma".":instance".name` {#opt-services.akkoma.config.__pleroma_.__instance_.name}

Instance name.

*Type:* non-empty string

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":pleroma".":instance".static_dir` {#opt-services.akkoma.config.__pleroma_.__instance_.static_dir}

Directory of static files.

This directory can be built using a derivation, or it can be managed as mutable
state by setting the option to an absolute path.

*Type:* absolute path

*Default:* Derivation gathering the following paths into a directory:

- \[[`services.akkoma.frontends`](#opt-services.akkoma.frontends)\](#opt-services.akkoma.frontends)
- \[[`services.akkoma.extraStatic`](#opt-services.akkoma.extraStatic)\](#opt-services.akkoma.extraStatic)

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":pleroma".":instance".upload_dir` {#opt-services.akkoma.config.__pleroma_.__instance_.upload_dir}

Directory where Akkoma will put uploaded files.

*Type:* absolute path

*Default:* `"/var/lib/akkoma/uploads"`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":pleroma".":media_proxy".base_url` {#opt-services.akkoma.config.__pleroma_.__media_proxy_.base_url}

Base path for the media proxy.
Whilst this can just be set to a subdirectory of the main domain, it is now recommended to use a different subdomain.

*Type:* null or non-empty string

*Default:*

``` nix
if lib.versionOlder config.system.stateVersion "24.05"
then "$\{httpConf.scheme}://$\{httpConf.host}:$\{toString httpConf.port}"
else null;
```

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":pleroma".":media_proxy".enabled` {#opt-services.akkoma.config.__pleroma_.__media_proxy_.enabled}

Whether to enable proxying of remote media through the instance's proxy.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":pleroma"."Pleroma.Repo"` {#opt-services.akkoma.config.__pleroma_._Pleroma.Repo_}

Database configuration.

Refer to
[https://hexdocs.pm/ecto\_sql/Ecto.Adapters.Postgres.html#module-connection-options](https://hexdocs.pm/ecto_sql/Ecto.Adapters.Postgres.html#module-connection-options)
for options.

*Type:* Elixir value

*Default:*

``` nix
{
  adapter = (pkgs.formats.elixirConf { }).lib.mkRaw "Ecto.Adapters.Postgres";
  socket_dir = "/run/postgresql";
  username = config.services.akkoma.user;
  database = "akkoma";
}
```

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":pleroma"."Pleroma.Upload".base_url` {#opt-services.akkoma.config.__pleroma_._Pleroma.Upload_.base_url}

Base path which uploads will be stored at.
Whilst this can just be set to a subdirectory of the main domain, it is now recommended to use a different subdomain.

*Type:* non-empty string

*Default:*

``` nix
if lib.versionOlder config.system.stateVersion "24.05"
then "$\{httpConf.scheme}://$\{httpConf.host}:$\{toString httpConf.port}/media/"
else null;
```

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":pleroma"."Pleroma.Web.Endpoint".http.ip` {#opt-services.akkoma.config.__pleroma_._Pleroma.Web.Endpoint_.http.ip}

Listener IP address or Unix socket path.

The value is automatically converted to Elixir’s internal address
representation during serialisation.

*Type:* absolute path or IPv4 or IPv6 address

*Default:* `"/run/akkoma/socket"`

*Example:* `"::1"`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":pleroma"."Pleroma.Web.Endpoint".http.port` {#opt-services.akkoma.config.__pleroma_._Pleroma.Web.Endpoint_.http.port}

Listener port number.

Must be 0 if using a Unix socket.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
if isAbsolutePath config.services.akkoma.config.:pleroma"."Pleroma.Web.Endpoint".http.ip
  then 0
  else 4000;
```

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":pleroma"."Pleroma.Web.Endpoint".live_view.signing_salt` {#opt-services.akkoma.config.__pleroma_._Pleroma.Web.Endpoint_.live_view.signing_salt}

LiveView signing salt.

The attribute `_secret` should point to a file containing the secret.

This salt can be generated as follows:

``` ShellSession
$ tr -dc 'A-Za-z0-9-._~' </dev/urandom | head -c 8
```

*Type:* secret value

*Default:*

``` nix
{
  _secret = "/var/lib/secrets/akkoma/liveview-salt";
}
```

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":pleroma"."Pleroma.Web.Endpoint".secret_key_base` {#opt-services.akkoma.config.__pleroma_._Pleroma.Web.Endpoint_.secret_key_base}

Secret key used as a base to generate further secrets for encrypting and
signing data.

The attribute `_secret` should point to a file containing the secret.

This key can generated can be generated as follows:

``` ShellSession
$ tr -dc 'A-Za-z-._~' </dev/urandom | head -c 64
```

*Type:* secret value

*Default:*

``` nix
{
  _secret = "/var/lib/secrets/akkoma/key-base";
}
```

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":pleroma"."Pleroma.Web.Endpoint".signing_salt` {#opt-services.akkoma.config.__pleroma_._Pleroma.Web.Endpoint_.signing_salt}

Signing salt.

The attribute `_secret` should point to a file containing the secret.

This salt can be generated as follows:

``` ShellSession
$ tr -dc 'A-Za-z0-9-._~' </dev/urandom | head -c 8
```

*Type:* secret value

*Default:*

``` nix
{
  _secret = "/var/lib/secrets/akkoma/signing-salt";
}
```

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":pleroma"."Pleroma.Web.Endpoint".url.host` {#opt-services.akkoma.config.__pleroma_._Pleroma.Web.Endpoint_.url.host}

Domain name of the instance.

*Type:* non-empty string

*Default:* `config.networking.fqdn`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":pleroma"."Pleroma.Web.Endpoint".url.port` {#opt-services.akkoma.config.__pleroma_._Pleroma.Web.Endpoint_.url.port}

External port number.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `443`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":pleroma"."Pleroma.Web.Endpoint".url.scheme` {#opt-services.akkoma.config.__pleroma_._Pleroma.Web.Endpoint_.url.scheme}

URL scheme.

*Type:* non-empty string

*Default:* `"https"`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":web_push_encryption"` {#opt-services.akkoma.config.__web_push_encryption_}

Web Push Notifications configuration.

The necessary key pair can be generated as follows:

``` ShellSession
$ nix-shell -p nodejs --run 'npx web-push generate-vapid-keys'
```

*Type:* open submodule of (Elixir value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":web_push_encryption".":vapid_details".private_key` {#opt-services.akkoma.config.__web_push_encryption_.__vapid_details_.private_key}

base64-encoded private ECDH key.

The attribute `_secret` should point to a file containing the secret.

*Type:* secret value

*Default:*

``` nix
{
  _secret = "/var/lib/secrets/akkoma/vapid-private";
}
```

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":web_push_encryption".":vapid_details".public_key` {#opt-services.akkoma.config.__web_push_encryption_.__vapid_details_.public_key}

base64-encoded public ECDH key.

*Type:* non-empty string or secret value

*Default:*

``` nix
{
  _secret = "/var/lib/secrets/akkoma/vapid-public";
}
```

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.config.":web_push_encryption".":vapid_details".subject` {#opt-services.akkoma.config.__web_push_encryption_.__vapid_details_.subject}

mailto URI for administrative contact.

*Type:* non-empty string

*Default:*

``` nix
"mailto:${config.services.akkoma.config.":pleroma".":instance".email}"
```

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.dist.address` {#opt-services.akkoma.dist.address}

Listen address for Erlang distribution protocol and Port Mapper Daemon (epmd).

*Type:* IPv4 or IPv6 address

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.dist.cookie` {#opt-services.akkoma.dist.cookie}

Erlang release cookie.

If set to `null`, a temporary random cookie will be generated.

*Type:* null or secret value

*Default:* `null`

*Example:*

``` nix
{
  _secret = "/var/lib/secrets/akkoma/releaseCookie";
}
```

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.dist.epmdPort` {#opt-services.akkoma.dist.epmdPort}

TCP port to bind Erlang Port Mapper Daemon to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4369`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.dist.extraFlags` {#opt-services.akkoma.dist.extraFlags}

Extra flags to pass to Erlang

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "+sbwt"
  "none"
  "+sbwtdcpu"
  "none"
  "+sbwtdio"
  "none"
]
```

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.dist.portMax` {#opt-services.akkoma.dist.portMax}

Upper bound for Erlang distribution protocol TCP port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `65535`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.dist.portMin` {#opt-services.akkoma.dist.portMin}

Lower bound for Erlang distribution protocol TCP port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `49152`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.enable` {#opt-services.akkoma.enable}

Whether to enable Akkoma.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.extraPackages` {#opt-services.akkoma.extraPackages}

List of extra packages to include in the executable search path of the service unit.
These are needed by various configurable components such as:

- ExifTool for the `Pleroma.Upload.Filter.Exiftool` upload filter,
- ImageMagick for still image previews in the media proxy as well as for the
  `Pleroma.Upload.Filters.Mogrify` upload filter, and
- ffmpeg for video previews in the media proxy.

*Type:* list of package

*Default:* `with pkgs; [ exiftool ffmpeg-headless imagemagick ]`

*Example:* `with pkgs; [ exiftool ffmpeg-full imagemagick ]`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.extraStatic` {#opt-services.akkoma.extraStatic}

Attribute set of extra paths to add to the static files directory.

Do not add frontends here. These should be configured through
\[[`services.akkoma.frontends`](#opt-services.akkoma.frontends)\](#opt-services.akkoma.frontends).

*Type:* null or (attribute set of path in the Nix store)

*Default:* `null`

*Example:*

``` nix
{
  "emoji/blobs.gg" = pkgs.blobs_gg;
  "static/terms-of-service.html" = pkgs.writeText "terms-of-service.html" ''
    …
  '';
  "favicon.png" = let
    rev = "697a8211b0f427a921e7935a35d14bb3e32d0a2c";
  in pkgs.stdenvNoCC.mkDerivation {
    name = "favicon.png";

    src = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/TilCreator/NixOwO/${rev}/NixOwO_plain.svg";
      hash = "sha256-tWhHMfJ3Od58N9H5yOKPMfM56hYWSOnr/TGCBi8bo9E=";
    };

    nativeBuildInputs = with pkgs; [ librsvg ];

    dontUnpack = true;
    installPhase = ''
      rsvg-convert -o $out -w 96 -h 96 $src
    '';
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.frontends` {#opt-services.akkoma.frontends}

Akkoma frontends.

*Type:* attribute set of (submodule)

*Default:*

``` nix
{
  primary = {
    package = pkgs.akkoma-fe;
    name = "akkoma-fe";
    ref = "stable";
  };
  admin = {
    package = pkgs.akkoma-admin-fe;
    name = "admin-fe";
    ref = "stable";
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.frontends.<name>.name` {#opt-services.akkoma.frontends._name_.name}

Akkoma frontend name.

*Type:* non-empty string

*Example:* `"akkoma-fe"`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.frontends.<name>.package` {#opt-services.akkoma.frontends._name_.package}

Akkoma frontend package.

*Type:* package

*Example:* `pkgs.akkoma-fe`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.frontends.<name>.ref` {#opt-services.akkoma.frontends._name_.ref}

Akkoma frontend reference.

*Type:* non-empty string

*Example:* `"stable"`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.group` {#opt-services.akkoma.group}

Group account under which Akkoma runs.

*Type:* non-empty string

*Default:* `"akkoma"`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.initDb.enable` {#opt-services.akkoma.initDb.enable}

Whether to automatically initialise the database on startup. This will create a
database role and database if they do not already exist, and (re)set the role password
and the ownership of the database.

This setting can be used safely even if the database already exists and contains data.

The database settings are configured through
[`config.services.akkoma.config.":pleroma"."Pleroma.Repo"`](#opt-services.akkoma.config.__pleroma_._Pleroma.Repo_).

If disabled, the database has to be set up manually:

``` SQL
CREATE ROLE akkoma LOGIN;

CREATE DATABASE akkoma
  OWNER akkoma
  TEMPLATE template0
  ENCODING 'utf8'
  LOCALE 'C';

\connect akkoma
CREATE EXTENSION IF NOT EXISTS citext;
CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
```

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.initDb.password` {#opt-services.akkoma.initDb.password}

Password of the database user to initialise the database with.

If set to `null`, no password will be used.

The attribute `_secret` should point to a file containing the secret.

*Type:* null or secret value

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.initDb.username` {#opt-services.akkoma.initDb.username}

Name of the database user to initialise the database with.

This user is required to have the `CREATEROLE` and `CREATEDB` capabilities.

*Type:* non-empty string

*Default:* `config.services.postgresql.superUser`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.initSecrets` {#opt-services.akkoma.initSecrets}

Whether to initialise non‐existent secrets with random values.

If enabled, appropriate secrets for the following options will be created automatically
if the files referenced in the `_secrets` attribute do not exist during startup.

- `config.":pleroma"."Pleroma.Web.Endpoint".secret_key_base`
- `config.":pleroma"."Pleroma.Web.Endpoint".signing_salt`
- `config.":pleroma"."Pleroma.Web.Endpoint".live_view.signing_salt`
- `config.":web_push_encryption".":vapid_details".private_key`
- `config.":web_push_encryption".":vapid_details".public_key`
- `config.":joken".":default_signer"`

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.installWrapper` {#opt-services.akkoma.installWrapper}

Whether to install a wrapper around `pleroma_ctl` to simplify administration of the
Akkoma instance.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx` {#opt-services.akkoma.nginx}

Extra configuration for the nginx virtual host of Akkoma.

If set to `null`, no virtual host will be added to the nginx configuration.

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.acmeFallbackHost` {#opt-services.akkoma.nginx.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.acmeRoot` {#opt-services.akkoma.nginx.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.addSSL` {#opt-services.akkoma.nginx.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.basicAuth` {#opt-services.akkoma.nginx.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.basicAuthFile` {#opt-services.akkoma.nginx.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.default` {#opt-services.akkoma.nginx.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.enableACME` {#opt-services.akkoma.nginx.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.extraConfig` {#opt-services.akkoma.nginx.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.forceSSL` {#opt-services.akkoma.nginx.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.globalRedirect` {#opt-services.akkoma.nginx.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.http2` {#opt-services.akkoma.nginx.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.http3` {#opt-services.akkoma.nginx.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.http3_hq` {#opt-services.akkoma.nginx.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.kTLS` {#opt-services.akkoma.nginx.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.listen` {#opt-services.akkoma.nginx.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.listen.*.addr` {#opt-services.akkoma.nginx.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.listen.*.extraParameters` {#opt-services.akkoma.nginx.listen._.extraParameters}

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

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.listen.*.port` {#opt-services.akkoma.nginx.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.listen.*.proxyProtocol` {#opt-services.akkoma.nginx.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.listen.*.ssl` {#opt-services.akkoma.nginx.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.listenAddresses` {#opt-services.akkoma.nginx.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.locations` {#opt-services.akkoma.nginx.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.locations.<name>.alias` {#opt-services.akkoma.nginx.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.locations.<name>.basicAuth` {#opt-services.akkoma.nginx.locations._name_.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.locations.<name>.basicAuthFile` {#opt-services.akkoma.nginx.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.locations.<name>.extraConfig` {#opt-services.akkoma.nginx.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.locations.<name>.fastcgiParams` {#opt-services.akkoma.nginx.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.locations.<name>.index` {#opt-services.akkoma.nginx.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.locations.<name>.priority` {#opt-services.akkoma.nginx.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.locations.<name>.proxyPass` {#opt-services.akkoma.nginx.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.locations.<name>.proxyWebsockets` {#opt-services.akkoma.nginx.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.locations.<name>.recommendedProxySettings` {#opt-services.akkoma.nginx.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.locations.<name>.recommendedUwsgiSettings` {#opt-services.akkoma.nginx.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.locations.<name>.return` {#opt-services.akkoma.nginx.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.locations.<name>.root` {#opt-services.akkoma.nginx.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.locations.<name>.tryFiles` {#opt-services.akkoma.nginx.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.locations.<name>.useGrpcErrorPages` {#opt-services.akkoma.nginx.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.locations.<name>.uwsgiPass` {#opt-services.akkoma.nginx.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.onlySSL` {#opt-services.akkoma.nginx.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.quic` {#opt-services.akkoma.nginx.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.redirectCode` {#opt-services.akkoma.nginx.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.rejectSSL` {#opt-services.akkoma.nginx.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.reuseport` {#opt-services.akkoma.nginx.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.root` {#opt-services.akkoma.nginx.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.serverAliases` {#opt-services.akkoma.nginx.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.serverName` {#opt-services.akkoma.nginx.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.sslCertificate` {#opt-services.akkoma.nginx.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.sslCertificateKey` {#opt-services.akkoma.nginx.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.sslTrustedCertificate` {#opt-services.akkoma.nginx.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.nginx.useACMEHost` {#opt-services.akkoma.nginx.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.package` {#opt-services.akkoma.package}

The akkoma package to use.

*Type:* package

*Default:* `pkgs.akkoma`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.akkoma.user` {#opt-services.akkoma.user}

User account under which Akkoma runs.

*Type:* non-empty string

*Default:* `"akkoma"`

*Declared by:* [`nixos/modules/services/web-apps/akkoma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/akkoma.nix)

## `services.alerta.authenticationRequired` {#opt-services.alerta.authenticationRequired}

Whether users must authenticate when using the web UI or command-line tool

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/alerta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/alerta.nix)

## `services.alerta.bind` {#opt-services.alerta.bind}

Address to bind to. The default is to bind to all addresses

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/monitoring/alerta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/alerta.nix)

## `services.alerta.corsOrigins` {#opt-services.alerta.corsOrigins}

List of URLs that can access the API for Cross-Origin Resource Sharing (CORS)

*Type:* list of string

*Default:*

``` nix
[
  "http://localhost"
  "http://localhost:5000"
]
```

*Declared by:* [`nixos/modules/services/monitoring/alerta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/alerta.nix)

## `services.alerta.databaseName` {#opt-services.alerta.databaseName}

Name of the database instance to connect to

*Type:* string

*Default:* `"monitoring"`

*Declared by:* [`nixos/modules/services/monitoring/alerta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/alerta.nix)

## `services.alerta.databaseUrl` {#opt-services.alerta.databaseUrl}

URL of the MongoDB or PostgreSQL database to connect to

*Type:* string

*Default:* `"mongodb://localhost"`

*Declared by:* [`nixos/modules/services/monitoring/alerta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/alerta.nix)

## `services.alerta.enable` {#opt-services.alerta.enable}

Whether to enable alerta.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/alerta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/alerta.nix)

## `services.alerta.extraConfig` {#opt-services.alerta.extraConfig}

These lines go into alertad.conf verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/alerta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/alerta.nix)

## `services.alerta.logDir` {#opt-services.alerta.logDir}

Location where the logfiles are stored

*Type:* absolute path

*Default:* `"/var/log/alerta"`

*Declared by:* [`nixos/modules/services/monitoring/alerta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/alerta.nix)

## `services.alerta.port` {#opt-services.alerta.port}

Port of Alerta

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5000`

*Declared by:* [`nixos/modules/services/monitoring/alerta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/alerta.nix)

## `services.alerta.signupEnabled` {#opt-services.alerta.signupEnabled}

Whether to prevent sign-up of new users via the web UI

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/alerta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/alerta.nix)

## `services.alice-lg.enable` {#opt-services.alice-lg.enable}

Whether to enable Alice Looking Glass.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/alice-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/alice-lg.nix)

## `services.alice-lg.package` {#opt-services.alice-lg.package}

The alice-lg package to use.

*Type:* package

*Default:* `pkgs.alice-lg`

*Declared by:* [`nixos/modules/services/networking/alice-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/alice-lg.nix)

## `services.alice-lg.settings` {#opt-services.alice-lg.settings}

alice-lg configuration, for configuration options see the example on [github](https://github.com/alice-lg/alice-lg/blob/main/etc/alice-lg/alice.example.conf)

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  server = {
    # configures the built-in webserver and provides global application settings
    listen_http = "127.0.0.1:7340";
    enable_prefix_lookup = true;
    asn = 9033;
    store_backend = postgres;
    routes_store_refresh_parallelism = 5;
    neighbors_store_refresh_parallelism = 10000;
    routes_store_refresh_interval = 5;
    neighbors_store_refresh_interval = 5;
  };
  postgres = {
    url = "postgres://postgres:postgres@localhost:5432/alice";
    min_connections = 2;
    max_connections = 128;
  };
  pagination = {
    routes_filtered_page_size = 250;
    routes_accepted_page_size = 250;
    routes_not_exported_page_size = 250;
  };
}
```

*Declared by:* [`nixos/modules/services/networking/alice-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/alice-lg.nix)

## `services.alloy.checkConfig` {#opt-services.alloy.checkConfig}

Check the configuration with `alloy validate` when
building the system. This catches syntax errors, unknown
components and component names declared more than once across
files, which would otherwise only show up as a failed reload at
runtime.

Covers the `alloy/*.alloy` files in [`environment.etc`](../../options/environment/index.md#opt-environment.etc)
when `configPath` is `/etc/alloy`, and a
`configPath` in the Nix store. Other paths are not
checked.

When cross compiling, the check runs `package` built
for the build platform. This does not work for a package changed
with `override` or `overrideAttrs`, so disable the check in that
case.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/alloy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/alloy.nix)

## `services.alloy.configPath` {#opt-services.alloy.configPath}

Alloy configuration file/directory path.

We default to `/etc/alloy` here, and expect the user to configure a
configuration file via `environment.etc."alloy/config.alloy"`.

This allows config reload, contrary to specifying a store path.

All `.alloy` files in the same directory (ignoring subdirs) are also
honored and are added to `systemd.services.alloy.reloadTriggers` to
enable config reload during nixos-rebuild switch.

This can also point to another directory containing `*.alloy` files, or
a single Alloy file in the Nix store (at the cost of reload).

Component names must be unique across all Alloy configuration files, and
configuration blocks must not be repeated.

Alloy will continue to run if subsequent reloads of the configuration
file fail, potentially marking components as unhealthy depending on
the nature of the failure. When this happens, Alloy will continue
functioning in the last valid state.

*Type:* absolute path

*Default:* `"/etc/alloy"`

*Declared by:* [`nixos/modules/services/monitoring/alloy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/alloy.nix)

## `services.alloy.enable` {#opt-services.alloy.enable}

Whether to enable Grafana Alloy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/alloy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/alloy.nix)

## `services.alloy.environmentFile` {#opt-services.alloy.environmentFile}

EnvironmentFile as defined in `systemd.exec(5)`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/alloy.env"`

*Declared by:* [`nixos/modules/services/monitoring/alloy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/alloy.nix)

## `services.alloy.extraFlags` {#opt-services.alloy.extraFlags}

Extra command-line flags passed to `alloy run`.

See [https://grafana.com/docs/alloy/latest/reference/cli/run/](https://grafana.com/docs/alloy/latest/reference/cli/run/)

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--server.http.listen-addr=127.0.0.1:12346"
  "--disable-reporting"
]
```

*Declared by:* [`nixos/modules/services/monitoring/alloy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/alloy.nix)

## `services.alloy.package` {#opt-services.alloy.package}

The grafana-alloy package to use.

*Type:* package

*Default:* `pkgs.grafana-alloy`

*Declared by:* [`nixos/modules/services/monitoring/alloy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/alloy.nix)

## `services.alps.enable` {#opt-services.alps.enable}

Whether to enable alps.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/alps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/alps.nix)

## `services.alps.package` {#opt-services.alps.package}

The alps package to use.

*Type:* package

*Default:* `pkgs.alps`

*Declared by:* [`nixos/modules/services/web-apps/alps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/alps.nix)

## `services.alps.settings` {#opt-services.alps.settings}

The ALPS configuration, see [https://github.com/migadu/alps/blob/main/docs/CONFIGURATION.md](https://github.com/migadu/alps/blob/main/docs/CONFIGURATION.md) for documentation.

Options containing secret data should be set to an attribute set
containing the attribute `_secret` - a string pointing to a file
containing the value the option should be set to.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/alps.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/alps.nix)

## `services.amazon-cloudwatch-agent.commonConfiguration` {#opt-services.amazon-cloudwatch-agent.commonConfiguration}

See `commonConfigurationFile`.

`commonConfigurationFile` takes precedence over `commonConfiguration`.

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  credentials = {
    shared_credential_file = "/path/to/credentials";
    shared_credential_profile = "profile_name";
  };
  proxy = {
    http_proxy = "http_url";
    https_proxy = "https_url";
    no_proxy = "domain";
  };
}
```

*Declared by:* [`nixos/modules/services/monitoring/amazon-cloudwatch-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/amazon-cloudwatch-agent.nix)

## `services.amazon-cloudwatch-agent.commonConfigurationFile` {#opt-services.amazon-cloudwatch-agent.commonConfigurationFile}

Amazon CloudWatch Agent common configuration. See
[https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/install-CloudWatch-Agent-commandline-fleet.html#CloudWatch-Agent-profile-instance-first](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/install-CloudWatch-Agent-commandline-fleet.html#CloudWatch-Agent-profile-instance-first)
for supported values.

`commonConfigurationFile` takes precedence over `commonConfiguration`.

Note: Restricted evaluation blocks access to paths outside the Nix store.
This means detecting content changes for mutable paths (i.e. not input or content-addressed) can't be done.
As a result, `nixos-rebuild` won't reload/restart the systemd unit when mutable path contents change.
`systemctl restart amazon-cloudwatch-agent.service` must be used instead.

*Type:* absolute path

*Default:* `tomlFormat.generate "common-config.toml" cfg.commonConfiguration`

*Example:* `"/etc/amazon-cloudwatch-agent/amazon-cloudwatch-agent.json"`

*Declared by:* [`nixos/modules/services/monitoring/amazon-cloudwatch-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/amazon-cloudwatch-agent.nix)

## `services.amazon-cloudwatch-agent.configuration` {#opt-services.amazon-cloudwatch-agent.configuration}

See `configurationFile`.

`configurationFile` takes precedence over `configuration`.

*Type:* JSON value

*Default:* `{ }`

*Example:*

``` nix
{
  agent = {
    logfile = "/var/log/amazon-cloudwatch-agent/amazon-cloudwatch-agent.log";
    metrics_collection_interval = 10;
  };
  logs = {
    force_flush_interval = 15;
    log_stream_name = "log_stream_name";
    logs_collected = {
      files = {
        collect_list = [
          {
            file_path = "/var/log/amazon-cloudwatch-agent/amazon-cloudwatch-agent.log";
            log_group_name = "amazon-cloudwatch-agent.log";
            log_stream_name = "{instance_id}";
            timezone = "UTC";
          }
        ];
      };
    };
  };
  metrics = {
    metrics_collected = {
      cpu = {
        append_dimensions = {
          customized_dimension_key_1 = "customized_dimension_value_1";
          customized_dimension_key_2 = "customized_dimension_value_2";
        };
        measurement = [
          {
            name = "cpu_usage_idle";
            rename = "CPU_USAGE_IDLE";
            unit = "Percent";
          }
          {
            name = "cpu_usage_nice";
            unit = "Percent";
          }
          "cpu_usage_guest"
        ];
        metrics_collection_interval = 10;
        resource = [
          "*"
        ];
        totalcpu = false;
      };
    };
    namespace = "MyCustomNamespace";
  };
  traces = {
    traces_collected = {
      oltp = { };
      xray = { };
    };
  };
}
```

*Declared by:* [`nixos/modules/services/monitoring/amazon-cloudwatch-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/amazon-cloudwatch-agent.nix)

## `services.amazon-cloudwatch-agent.configurationFile` {#opt-services.amazon-cloudwatch-agent.configurationFile}

Amazon CloudWatch Agent configuration file. See
[https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Agent-Configuration-File-Details.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Agent-Configuration-File-Details.html)
for supported values.

The following options aren't supported:

- `agent.run_as_user`
  - Use `user` instead.

`configurationFile` takes precedence over `configuration`.

Note: Restricted evaluation blocks access to paths outside the Nix store.
This means detecting content changes for mutable paths (i.e. not input or content-addressed) can't be done.
As a result, `nixos-rebuild` won't reload/restart the systemd unit when mutable path contents change.
`systemctl restart amazon-cloudwatch-agent.service` must be used instead.

*Type:* absolute path

*Default:* `jsonFormat.generate "amazon-cloudwatch-agent.json" cfg.configuration`

*Example:* `"/etc/amazon-cloudwatch-agent/amazon-cloudwatch-agent.json"`

*Declared by:* [`nixos/modules/services/monitoring/amazon-cloudwatch-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/amazon-cloudwatch-agent.nix)

## `services.amazon-cloudwatch-agent.enable` {#opt-services.amazon-cloudwatch-agent.enable}

Whether to enable Amazon CloudWatch Agent.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/amazon-cloudwatch-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/amazon-cloudwatch-agent.nix)

## `services.amazon-cloudwatch-agent.mode` {#opt-services.amazon-cloudwatch-agent.mode}

Amazon CloudWatch Agent mode. Indicates whether the agent is running in EC2 ("ec2"), on-premises ("onPremise"),
or if it should guess based on metadata endpoints like IMDS or the ECS task metadata endpoint ("auto").

*Type:* string

*Default:* `"auto"`

*Example:* `"onPremise"`

*Declared by:* [`nixos/modules/services/monitoring/amazon-cloudwatch-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/amazon-cloudwatch-agent.nix)

## `services.amazon-cloudwatch-agent.package` {#opt-services.amazon-cloudwatch-agent.package}

The amazon-cloudwatch-agent package to use.

*Type:* package

*Default:* `pkgs.amazon-cloudwatch-agent`

*Declared by:* [`nixos/modules/services/monitoring/amazon-cloudwatch-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/amazon-cloudwatch-agent.nix)

## `services.amazon-cloudwatch-agent.user` {#opt-services.amazon-cloudwatch-agent.user}

The user that runs the Amazon CloudWatch Agent.

*Type:* string

*Default:* `"root"`

*Example:* `"amazon-cloudwatch-agent"`

*Declared by:* [`nixos/modules/services/monitoring/amazon-cloudwatch-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/amazon-cloudwatch-agent.nix)

## `services.amazon-ssm-agent.enable` {#opt-services.amazon-ssm-agent.enable}

Whether to enable Amazon SSM agent.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/amazon-ssm-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/amazon-ssm-agent.nix)

## `services.amazon-ssm-agent.package` {#opt-services.amazon-ssm-agent.package}

The amazon-ssm-agent package to use.

*Type:* package

*Default:* `pkgs.amazon-ssm-agent`

*Declared by:* [`nixos/modules/services/misc/amazon-ssm-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/amazon-ssm-agent.nix)

## `services.amule.AmuleApiAdminPasswordFile` {#opt-services.amule.AmuleApiAdminPasswordFile}

File containing the admin password for amuleapi (REST API and Web UI).
It is set with `amuleapi --set-admin-pass-stdin` before amuled starts.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.ExternalConnectPasswordFile` {#opt-services.amule.ExternalConnectPasswordFile}

File containing the password for connecting with amule-gui,
set this only if you didn't set `settings.ExternalConnect.ECPassword`

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.WebServerPasswordFile` {#opt-services.amule.WebServerPasswordFile}

File containing the password for connecting to the web server,
set this only if you didn't set `settings.ExternalConnect.ECPassword`

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.amuleApiPackage` {#opt-services.amule.amuleApiPackage}

The amule-api package to use.

*Type:* package

*Default:* `pkgs.amule-api`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.amuleWebPackage` {#opt-services.amule.amuleWebPackage}

The amule-web package to use.

*Type:* package

*Default:* `pkgs.amule-web`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.dataDir` {#opt-services.amule.dataDir}

Directory holding configuration and by default also incoming and temporary files

*Type:* absolute path

*Default:* `"/var/lib/amuled"`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.enable` {#opt-services.amule.enable}

Whether to enable aMule daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.extraArgs` {#opt-services.amule.extraArgs}

Additional passed arguments

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.group` {#opt-services.amule.group}

Group under which amule runs

*Type:* string

*Default:* `"amule"`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.openAmuleApiPort` {#opt-services.amule.openAmuleApiPort}

Whether to enable open the amuleapi (REST API and Web UI) port.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.openExternalConnectPort` {#opt-services.amule.openExternalConnectPort}

Whether to enable open the external connect port.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.openPeerPorts` {#opt-services.amule.openPeerPorts}

Whether to enable open the peer port(s) in the firewall.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.openWebServerPort` {#opt-services.amule.openWebServerPort}

Whether to enable open the web server port.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.package` {#opt-services.amule.package}

The amule-daemon package to use.

*Type:* package

*Default:* `pkgs.amule-daemon`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.settings` {#opt-services.amule.settings}

Free form attribute set for aMule settings.
The final configuration file is generated merging the default settings with these options.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  eMule = {
    IncomingDir = "/mnt/hd/amule/Incoming";
    TempDir = "/mnt/hd/amule/Temp";
  };
  AmuleApi.Enabled = 1;
}
```

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.settings.AmuleApi.BindAddress` {#opt-services.amule.settings.AmuleApi.BindAddress}

Address amuleapi listens on.
amuleapi refuses to bind anything other than `127.0.0.1` unless an admin password is set,
see [`services.amule.AmuleApiAdminPasswordFile`](#opt-services.amule.AmuleApiAdminPasswordFile).

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.settings.AmuleApi.Enabled` {#opt-services.amule.settings.AmuleApi.Enabled}

Set to 1 to let amuled spawn amuleapi, the REST API and Web UI
replacing the deprecated web server.

*Type:* one of 0, 1

*Default:* `0`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.settings.AmuleApi.HttpPort` {#opt-services.amule.settings.AmuleApi.HttpPort}

amuleapi HTTP port, serving both the REST API and the Web UI

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4713`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.settings.ExternalConnect.ECPassword` {#opt-services.amule.settings.ExternalConnect.ECPassword}

MD5 hash of the password, obtainaible with `echo "<password>" | md5sum | cut -d ' ' -f 1`

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.settings.ExternalConnect.ECPort` {#opt-services.amule.settings.ExternalConnect.ECPort}

TCP port for external connections, like remote control via amule-gui

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4712`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.settings.WebServer.Enabled` {#opt-services.amule.settings.WebServer.Enabled}

Set to 1 to enable the web server

*Type:* one of 0, 1

*Default:* `0`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.settings.WebServer.Password` {#opt-services.amule.settings.WebServer.Password}

MD5 hash of the password, obtainaible with `echo "<password>" | md5sum | cut -d ' ' -f 1`

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.settings.WebServer.Port` {#opt-services.amule.settings.WebServer.Port}

Web server port

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4711`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.settings.eMule.IncomingDir` {#opt-services.amule.settings.eMule.IncomingDir}

Directory where aMule moves completed downloads.
Files in this directory are automatically shared.
Ensure the aMule service has write permissions

*Type:* absolute path

*Default:* `${config.services.amule.dataDir}/Incoming`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.settings.eMule.Port` {#opt-services.amule.settings.eMule.Port}

TCP port for eD2k connections.
Required for connecting to servers and achieving a High ID.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4662`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.settings.eMule.TempDir` {#opt-services.amule.settings.eMule.TempDir}

Directory where aMule stores incomplete downloads (.part/.part.met files).

*Type:* absolute path

*Default:* `${config.services.amule.dataDir}/Temp`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.settings.eMule.UDPPort` {#opt-services.amule.settings.eMule.UDPPort}

UDP port for eD2k traffic (searches, source exchange) and all Kad network communication.
Essential for a High ID on both networks and proper Kad functioning.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4672`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.amule.user` {#opt-services.amule.user}

The user the aMule daemon should run as

*Type:* string

*Default:* `"amule"`

*Declared by:* [`nixos/modules/services/networking/amuled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/amuled.nix)

## `services.ananicy.enable` {#opt-services.ananicy.enable}

Whether to enable Ananicy, an auto nice daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/ananicy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ananicy.nix)

## `services.ananicy.extraCgroups` {#opt-services.ananicy.extraCgroups}

Cgroups to write in 'nixCgroups.cgroups'. See:
[https://gitlab.com/ananicy-cpp/ananicy-cpp/#cgroups](https://gitlab.com/ananicy-cpp/ananicy-cpp/#cgroups)

*Type:* list of (attribute set)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    CPUQuota = 80;
    cgroup = "cpu80";
  }
]
```

*Declared by:* [`nixos/modules/services/misc/ananicy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ananicy.nix)

## `services.ananicy.extraRules` {#opt-services.ananicy.extraRules}

Rules to write in 'nixRules.rules'. See:
[https://github.com/Nefelim4ag/Ananicy#configuration](https://github.com/Nefelim4ag/Ananicy#configuration)
[https://gitlab.com/ananicy-cpp/ananicy-cpp/#global-configuration](https://gitlab.com/ananicy-cpp/ananicy-cpp/#global-configuration)

*Type:* list of (attribute set)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    name = "eog";
    type = "Image-Viewer";
  }
  {
    name = "fdupes";
    type = "BG_CPUIO";
  }
]
```

*Declared by:* [`nixos/modules/services/misc/ananicy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ananicy.nix)

## `services.ananicy.extraTypes` {#opt-services.ananicy.extraTypes}

Types to write in 'nixTypes.types'. See:
[https://gitlab.com/ananicy-cpp/ananicy-cpp/#types](https://gitlab.com/ananicy-cpp/ananicy-cpp/#types)

*Type:* list of (attribute set)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    nice = 19;
    other_parameter = "value";
    type = "my_type";
  }
  {
    ioclass = "idle";
    nice = 19;
    sched = "batch";
    type = "compiler";
  }
]
```

*Declared by:* [`nixos/modules/services/misc/ananicy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ananicy.nix)

## `services.ananicy.package` {#opt-services.ananicy.package}

The ananicy package to use.

*Type:* package

*Default:* `pkgs.ananicy`

*Example:* `ananicy-cpp`

*Declared by:* [`nixos/modules/services/misc/ananicy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ananicy.nix)

## `services.ananicy.rulesProvider` {#opt-services.ananicy.rulesProvider}

Which package to copy default rules,types,cgroups from.

*Type:* package

*Default:* `pkgs.ananicy`

*Example:* `ananicy-cpp`

*Declared by:* [`nixos/modules/services/misc/ananicy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ananicy.nix)

## `services.ananicy.settings` {#opt-services.ananicy.settings}

See [https://github.com/Nefelim4ag/Ananicy/blob/master/ananicy.d/ananicy.conf](https://github.com/Nefelim4ag/Ananicy/blob/master/ananicy.d/ananicy.conf)

*Type:* attribute set of (signed integer or boolean or string)

*Default:* `{ }`

*Example:*

``` nix
{
  apply_nice = false;
}
```

*Declared by:* [`nixos/modules/services/misc/ananicy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ananicy.nix)

## `services.angrr.configFile` {#opt-services.angrr.configFile}

Path to the angrr configuration file in TOML format.

If not set, the configuration generated from [`services.angrr.settings`](#opt-services.angrr.settings) will be used.
If specified, [`services.angrr.settings`](#opt-services.angrr.settings) will be ignored.

*Type:* null or absolute path

*Default:* ``"TOML file generated from {option}`services.angrr.settings`"``

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.enable` {#opt-services.angrr.enable}

Whether to enable angrr.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.enableNixGcIntegration` {#opt-services.angrr.enableNixGcIntegration}

Whether to enable nix-gc.service integration.

*Type:* boolean

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.extraArgs` {#opt-services.angrr.extraArgs}

Extra command-line arguments pass to angrr.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.logLevel` {#opt-services.angrr.logLevel}

Set the log level of angrr.

*Type:* one of "off", "error", "warn", "info", "debug", "trace"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.package` {#opt-services.angrr.package}

The angrr package to use.

*Type:* package

*Default:* `pkgs.angrr`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.period` {#opt-services.angrr.period}

If set, it configures [`services.angrr.settings`](#opt-services.angrr.settings) to a preset that
monitor .direnv, results, system, and user profiles,
retaining GC roots that are younger than the specified period.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings` {#opt-services.angrr.settings}

Global configuration for angrr in TOML format.

*Type:* open submodule of (TOML value)

*Example:*

``` nix
{
  profile-policies = {
    system = {
      keep-booted-system = true;
      keep-current-system = true;
      keep-latest-n = 5;
      keep-n-per-bucket = [
        {
          bucket-amount = 7;
          bucket-window = "1 day";
        }
        {
          bucket-amount = 4;
          bucket-window = "1 week";
        }
      ];
      keep-since = "14d";
      profile-paths = [
        "/nix/var/nix/profiles/system"
      ];
    };
    user = {
      enable = false;
      keep-booted-system = false;
      keep-current-system = false;
      keep-latest-n = 1;
      keep-since = "1d";
      profile-paths = [
        "~/.local/state/nix/profiles/profile"
        "/nix/var/nix/profiles/per-user/root/profile"
      ];
    };
  };
  temporary-root-policies = {
    direnv = {
      path-regex = "/\\.direnv/";
      period = "14d";
    };
    result = {
      path-regex = "/result[^/]*$";
      period = "3d";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings.owned-only` {#opt-services.angrr.settings.owned-only}

Only monitors owned symbolic link target of GC roots.

- "auto": behaves like true for normal users, false for root.
- "true": only monitor GC roots owned by the current user.
- "false": monitor all GC roots.

*Type:* one of "auto", "true", "false"

*Default:* `"auto"`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings.profile-policies` {#opt-services.angrr.settings.profile-policies}

Profile GC root policies.

*Type:* attribute set of (open submodule of (TOML value))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings.profile-policies.<name>.enable` {#opt-services.angrr.settings.profile-policies._name_.enable}

Whether to enable this angrr policy.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings.profile-policies.<name>.keep-booted-system` {#opt-services.angrr.settings.profile-policies._name_.keep-booted-system}

Whether to keep the last booted system generation. Only useful for system profiles.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings.profile-policies.<name>.keep-current-system` {#opt-services.angrr.settings.profile-policies._name_.keep-current-system}

Whether to keep the current system generation. Only useful for system profiles.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings.profile-policies.<name>.keep-latest-n` {#opt-services.angrr.settings.profile-policies._name_.keep-latest-n}

Keep the latest N GC roots in this profile.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings.profile-policies.<name>.keep-n-per-bucket` {#opt-services.angrr.settings.profile-policies._name_.keep-n-per-bucket}

Specify a list of rules having n, bucket-window, and bucket-amount attributes.

*Type:* list of (open submodule of (TOML value))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings.profile-policies.<name>.keep-n-per-bucket.*.bucket-amount` {#opt-services.angrr.settings.profile-policies._name_.keep-n-per-bucket._.bucket-amount}

The number of buckets to keep.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings.profile-policies.<name>.keep-n-per-bucket.*.bucket-window` {#opt-services.angrr.settings.profile-policies._name_.keep-n-per-bucket._.bucket-window}

The duration of the bucket window.

*Type:* string

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings.profile-policies.<name>.keep-n-per-bucket.*.n` {#opt-services.angrr.settings.profile-policies._name_.keep-n-per-bucket._.n}

Retain n generations every bucket-window duration for bucket-amount buckets.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings.profile-policies.<name>.keep-since` {#opt-services.angrr.settings.profile-policies._name_.keep-since}

Retention period for the GC roots in this profile.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings.profile-policies.<name>.profile-paths` {#opt-services.angrr.settings.profile-policies._name_.profile-paths}

Paths to the Nix profile.

When angrr runs in owned-only mode, and the option begins with `~`,
it will be expanded to the home directory of the current user.

When angrr does not run in owned-only mode, and the option begins with `~`,
it will be expanded to the home of all users discovered respectively.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings.temporary-root-policies` {#opt-services.angrr.settings.temporary-root-policies}

Policies for temporary GC roots(e.g. result and direnv).

*Type:* attribute set of (open submodule of (TOML value))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings.temporary-root-policies.<name>.enable` {#opt-services.angrr.settings.temporary-root-policies._name_.enable}

Whether to enable this angrr policy.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings.temporary-root-policies.<name>.filter` {#opt-services.angrr.settings.temporary-root-policies._name_.filter}

External filter program to further filter GC roots matched by this policy.

*Type:* null or (open submodule of (TOML value))

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings.temporary-root-policies.<name>.filter.arguments` {#opt-services.angrr.settings.temporary-root-policies._name_.filter.arguments}

Extra command-line arguments pass to the external filter program.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings.temporary-root-policies.<name>.filter.program` {#opt-services.angrr.settings.temporary-root-policies._name_.filter.program}

Path to the external filter program.

*Type:* string

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings.temporary-root-policies.<name>.ignore-prefixes` {#opt-services.angrr.settings.temporary-root-policies._name_.ignore-prefixes}

List of path prefixes to ignore.

If null is specified, angrr builtin settings will be used.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings.temporary-root-policies.<name>.ignore-prefixes-in-home` {#opt-services.angrr.settings.temporary-root-policies._name_.ignore-prefixes-in-home}

Path prefixes to ignore under home directory.

If null is specified, angrr builtin settings will be used.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings.temporary-root-policies.<name>.path-regex` {#opt-services.angrr.settings.temporary-root-policies._name_.path-regex}

Regex pattern to match the GC root path.

*Type:* string

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings.temporary-root-policies.<name>.period` {#opt-services.angrr.settings.temporary-root-policies._name_.period}

Retention period for the GC roots matched by this policy.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings.temporary-root-policies.<name>.priority` {#opt-services.angrr.settings.temporary-root-policies._name_.priority}

Priority of this policy.

Lower number means higher priority, if multiple policies monitor the
same path, the one with higher priority will be applied.

*Type:* signed integer

*Default:* `100`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.settings.touch.project-globs` {#opt-services.angrr.settings.touch.project-globs}

List of glob patterns to include or exclude files when touching GC roots.

Only applied when `angrr touch` is invoked with the `--project` flag.
Patterns use an inverted gitignore-style semantics.
See [https://docs.rs/ignore/latest/ignore/overrides/struct.OverrideBuilder.html#method.add](https://docs.rs/ignore/latest/ignore/overrides/struct.OverrideBuilder.html#method.add).

*Type:* list of string

*Default:*

``` nix
[
  "!.git"
]
```

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.timer.dates` {#opt-services.angrr.timer.dates}

How often or when the retention policy is performed.

*Type:* string

*Default:* `"03:00"`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.angrr.timer.enable` {#opt-services.angrr.timer.enable}

Whether to enable angrr timer.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/angrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/angrr.nix)

## `services.anki-sync-server.address` {#opt-services.anki-sync-server.address}

IP address anki-sync-server listens to.
Note host names are not resolved.

*Type:* string

*Default:* `"::1"`

*Declared by:* [`nixos/modules/services/misc/anki-sync-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/anki-sync-server.nix)

## `services.anki-sync-server.baseDirectory` {#opt-services.anki-sync-server.baseDirectory}

Base directory where user(s) synchronized data will be stored.

*Type:* string

*Default:* `"%S/%N"`

*Declared by:* [`nixos/modules/services/misc/anki-sync-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/anki-sync-server.nix)

## `services.anki-sync-server.enable` {#opt-services.anki-sync-server.enable}

Whether to enable anki-sync-server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/anki-sync-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/anki-sync-server.nix)

## `services.anki-sync-server.openFirewall` {#opt-services.anki-sync-server.openFirewall}

Whether to open the firewall for the specified port.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/anki-sync-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/anki-sync-server.nix)

## `services.anki-sync-server.package` {#opt-services.anki-sync-server.package}

The anki-sync-server package to use.

*Type:* package

*Default:* `pkgs.anki-sync-server`

*Declared by:* [`nixos/modules/services/misc/anki-sync-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/anki-sync-server.nix)

## `services.anki-sync-server.port` {#opt-services.anki-sync-server.port}

Port number anki-sync-server listens to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `27701`

*Declared by:* [`nixos/modules/services/misc/anki-sync-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/anki-sync-server.nix)

## `services.anki-sync-server.users` {#opt-services.anki-sync-server.users}

List of user-password pairs to provide to the sync server.

*Type:* list of (submodule)

*Declared by:* [`nixos/modules/services/misc/anki-sync-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/anki-sync-server.nix)

## `services.anki-sync-server.users.*.password` {#opt-services.anki-sync-server.users._.password}

Password accepted by anki-sync-server for the associated username.
**WARNING**: This option is **not secure**. This password will
be stored in *plaintext* and will be visible to *all users*.
See `services.anki-sync-server.users.passwordFile` for
a more secure option.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/anki-sync-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/anki-sync-server.nix)

## `services.anki-sync-server.users.*.passwordFile` {#opt-services.anki-sync-server.users._.passwordFile}

File containing the password accepted by anki-sync-server for
the associated username.  Make sure to make readable only by
root.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/anki-sync-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/anki-sync-server.nix)

## `services.anki-sync-server.users.*.username` {#opt-services.anki-sync-server.users._.username}

User name accepted by anki-sync-server.

*Type:* string

*Declared by:* [`nixos/modules/services/misc/anki-sync-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/anki-sync-server.nix)

## `services.anubis.defaultOptions` {#opt-services.anubis.defaultOptions}

Default options for all instances of Anubis.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.defaultOptions.enable` {#opt-services.anubis.defaultOptions.enable}

Whether to enable this instance of Anubis.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.defaultOptions.extraFlags` {#opt-services.anubis.defaultOptions.extraFlags}

A list of extra flags to be passed to Anubis.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-metrics-bind \"\""
]
```

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.defaultOptions.group` {#opt-services.anubis.defaultOptions.group}

The group under which Anubis is run.

This module utilizes systemd's DynamicUser feature. See the corresponding section in
`systemd.exec(5)` for more details.

*Type:* string

*Default:* `"anubis"`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.defaultOptions.policy` {#opt-services.anubis.defaultOptions.policy}

Anubis policy configuration.

See [the documentation](https://anubis.techaro.lol/docs/admin/policies) for details.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.defaultOptions.policy.extraBots` {#opt-services.anubis.defaultOptions.policy.extraBots}

Additional bot rules appended to the policy.

When `useDefaultBotRules` is `true`, these rules are added after
Anubis's default rules. When `false`, only these rules are used.

*Type:* list of (JSON value)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    name = "my-bot";
    user_agent_regex = "MyBot/.*";
    action = "ALLOW";
  }
]
```

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.defaultOptions.policy.settings` {#opt-services.anubis.defaultOptions.policy.settings}

Additional policy settings merged into the policy file.

Common settings include `dnsbl`, `store`, `logging`, `thresholds`,
`impressum`, `openGraph`, and `statusCodes`.

See [the documentation](https://anubis.techaro.lol/docs/admin/policies) for
available options.

*Type:* JSON value

*Default:* `{ }`

*Example:*

``` nix
{
  dnsbl = false;
  store = {
    backend = "bbolt";
    parameters.path = "/var/lib/anubis/data.bdb";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.defaultOptions.policy.useDefaultBotRules` {#opt-services.anubis.defaultOptions.policy.useDefaultBotRules}

Whether to include Anubis's default bot detection rules via the
`(data)/meta/default-config.yaml` import.

Set to `false` to define your own bot rules from scratch using
`extraBots`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.defaultOptions.settings` {#opt-services.anubis.defaultOptions.settings}

Freeform configuration via environment variables for Anubis.

See [the documentation](https://anubis.techaro.lol/docs/admin/installation) for a complete list of
available environment variables.

*Type:* open submodule of attribute set of (null or string or signed integer or boolean)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.defaultOptions.settings.BIND_NETWORK` {#opt-services.anubis.defaultOptions.settings.BIND_NETWORK}

The network family that Anubis should bind to.

Accepts anything supported by Go's [`net.Listen`](https://pkg.go.dev/net#Listen).

Common values are `tcp` and `unix`.

*Type:* string

*Default:* `"unix"`

*Example:* `"tcp"`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.defaultOptions.settings.DIFFICULTY` {#opt-services.anubis.defaultOptions.settings.DIFFICULTY}

The difficulty required for clients to solve the challenge.

Currently, this means the amount of leading zeros in a successful response.

*Type:* signed integer

*Default:* `4`

*Example:* `5`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.defaultOptions.settings.METRICS_BIND_NETWORK` {#opt-services.anubis.defaultOptions.settings.METRICS_BIND_NETWORK}

The network family that the metrics server should bind to.

Accepts anything supported by Go's [`net.Listen`](https://pkg.go.dev/net#Listen).

Common values are `tcp` and `unix`.

*Type:* string

*Default:* `"unix"`

*Example:* `"tcp"`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.defaultOptions.settings.OG_PASSTHROUGH` {#opt-services.anubis.defaultOptions.settings.OG_PASSTHROUGH}

Whether to enable Open Graph tag passthrough.

This enables social previews of resources protected by
Anubis without having to exempt each scraper individually.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.defaultOptions.settings.POLICY_FNAME` {#opt-services.anubis.defaultOptions.settings.POLICY_FNAME}

The policy file to use. Leave this as `null` to use the policy generated from
[`services.anubis.instances.<name>.policy`](#opt-services.anubis.instances._name_.policy).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.defaultOptions.settings.SERVE_ROBOTS_TXT` {#opt-services.anubis.defaultOptions.settings.SERVE_ROBOTS_TXT}

Whether to serve a default robots.txt that denies access to common AI bots by name and all other
bots by wildcard.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.defaultOptions.settings.WEBMASTER_EMAIL` {#opt-services.anubis.defaultOptions.settings.WEBMASTER_EMAIL}

If set, shows a contact email address when rendering error pages.

This email address will be how users can get in contact with administrators.

*Type:* null or string

*Default:* `null`

*Example:* `"alice@example.com"`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.defaultOptions.user` {#opt-services.anubis.defaultOptions.user}

The user under which Anubis is run.

This module utilizes systemd's DynamicUser feature. See the corresponding section in
`systemd.exec(5)` for more details.

*Type:* string

*Default:* `"anubis"`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.instances` {#opt-services.anubis.instances}

An attribute set of Anubis instances.

The attribute name may be an empty string, in which case the `-<name>` suffix is not added to the service name
and socket paths.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.instances.<name>.enable` {#opt-services.anubis.instances._name_.enable}

Whether to enable this instance of Anubis.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.instances.<name>.extraFlags` {#opt-services.anubis.instances._name_.extraFlags}

A list of extra flags to be passed to Anubis.

*Type:* list of string

*Default:* `config.services.anubis.defaultOptions.extraFlags`

*Example:*

``` nix
[
  "-metrics-bind \"\""
]
```

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.instances.<name>.group` {#opt-services.anubis.instances._name_.group}

The group under which Anubis is run.

This module utilizes systemd's DynamicUser feature. See the corresponding section in
`systemd.exec(5)` for more details.

*Type:* string

*Default:* `config.services.anubis.defaultOptions.group`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.instances.<name>.policy` {#opt-services.anubis.instances._name_.policy}

Anubis policy configuration.

See [the documentation](https://anubis.techaro.lol/docs/admin/policies) for details.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.instances.<name>.policy.extraBots` {#opt-services.anubis.instances._name_.policy.extraBots}

Additional bot rules appended to the policy.

When `useDefaultBotRules` is `true`, these rules are added after
Anubis's default rules. When `false`, only these rules are used.

*Type:* list of (JSON value)

*Default:* `config.services.anubis.defaultOptions.policy.extraBots`

*Example:*

``` nix
[
  {
    name = "my-bot";
    user_agent_regex = "MyBot/.*";
    action = "ALLOW";
  }
]
```

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.instances.<name>.policy.settings` {#opt-services.anubis.instances._name_.policy.settings}

Additional policy settings merged into the policy file.

Common settings include `dnsbl`, `store`, `logging`, `thresholds`,
`impressum`, `openGraph`, and `statusCodes`.

See [the documentation](https://anubis.techaro.lol/docs/admin/policies) for
available options.

*Type:* JSON value

*Default:* `config.services.anubis.defaultOptions.policy.settings`

*Example:*

``` nix
{
  dnsbl = false;
  store = {
    backend = "bbolt";
    parameters.path = "/var/lib/anubis/data.bdb";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.instances.<name>.policy.useDefaultBotRules` {#opt-services.anubis.instances._name_.policy.useDefaultBotRules}

Whether to include Anubis's default bot detection rules via the
`(data)/meta/default-config.yaml` import.

Set to `false` to define your own bot rules from scratch using
`extraBots`.

*Type:* boolean

*Default:* `config.services.anubis.defaultOptions.policy.useDefaultBotRules`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.instances.<name>.settings` {#opt-services.anubis.instances._name_.settings}

Freeform configuration via environment variables for Anubis.

See [the documentation](https://anubis.techaro.lol/docs/admin/installation) for a complete list of
available environment variables.

*Type:* open submodule of attribute set of (null or string or signed integer or boolean)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.instances.<name>.settings.BIND` {#opt-services.anubis.instances._name_.settings.BIND}

The address that Anubis listens to. See Go's [`net.Listen`](https://pkg.go.dev/net#Listen) for syntax.
When using unix sockets:

- use the prefix "/run/anubis/anubis/" if the instance name is the empty string,
- "/run/anubis/anubis-<name>/" otherwise.

Defaults to Unix domain sockets. To use TCP sockets, set this to a TCP address and `BIND_NETWORK` to `"tcp"`.

*Type:* string

*Default:* `"/run/anubis/anubis-‹name›/anubis.sock"`

*Example:* `":8080"`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.instances.<name>.settings.BIND_NETWORK` {#opt-services.anubis.instances._name_.settings.BIND_NETWORK}

The network family that Anubis should bind to.

Accepts anything supported by Go's [`net.Listen`](https://pkg.go.dev/net#Listen).

Common values are `tcp` and `unix`.

*Type:* string

*Default:* `config.services.anubis.defaultOptions.settings.BIND_NETWORK`

*Example:* `"tcp"`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.instances.<name>.settings.DIFFICULTY` {#opt-services.anubis.instances._name_.settings.DIFFICULTY}

The difficulty required for clients to solve the challenge.

Currently, this means the amount of leading zeros in a successful response.

*Type:* signed integer

*Default:* `config.services.anubis.defaultOptions.settings.DIFFICULTY`

*Example:* `5`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.instances.<name>.settings.METRICS_BIND` {#opt-services.anubis.instances._name_.settings.METRICS_BIND}

The address Anubis' metrics server listens to. See Go's [`net.Listen`](https://pkg.go.dev/net#Listen) for
syntax.
When using unix sockets:

- use the prefix "/run/anubis/anubis/" if the instance name is the empty string,
- "/run/anubis/anubis-<name>/" otherwise.

The metrics server is enabled by default and may be disabled. However, due to implementation details, this is
only possible by setting a command line flag. See [`services.anubis.defaultOptions.extraFlags`](#opt-services.anubis.defaultOptions.extraFlags) for an
example.

Defaults to Unix domain sockets. To use TCP sockets, set this to a TCP address and `METRICS_BIND_NETWORK` to
`"tcp"`.

*Type:* string

*Default:* `"/run/anubis/anubis-‹name›/anubis-metrics.sock"`

*Example:* `"127.0.0.1:8081"`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.instances.<name>.settings.METRICS_BIND_NETWORK` {#opt-services.anubis.instances._name_.settings.METRICS_BIND_NETWORK}

The network family that the metrics server should bind to.

Accepts anything supported by Go's [`net.Listen`](https://pkg.go.dev/net#Listen).

Common values are `tcp` and `unix`.

*Type:* string

*Default:* `config.services.anubis.defaultOptions.settings.METRICS_BIND_NETWORK`

*Example:* `"tcp"`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.instances.<name>.settings.OG_PASSTHROUGH` {#opt-services.anubis.instances._name_.settings.OG_PASSTHROUGH}

Whether to enable Open Graph tag passthrough.

This enables social previews of resources protected by
Anubis without having to exempt each scraper individually.

*Type:* boolean

*Default:* `config.services.anubis.defaultOptions.settings.OG_PASSTHROUGH`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.instances.<name>.settings.POLICY_FNAME` {#opt-services.anubis.instances._name_.settings.POLICY_FNAME}

The policy file to use. Leave this as `null` to use the policy generated from
[`services.anubis.instances.<name>.policy`](#opt-services.anubis.instances._name_.policy).

*Type:* null or absolute path

*Default:* `config.services.anubis.defaultOptions.settings.POLICY_FNAME`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.instances.<name>.settings.SERVE_ROBOTS_TXT` {#opt-services.anubis.instances._name_.settings.SERVE_ROBOTS_TXT}

Whether to serve a default robots.txt that denies access to common AI bots by name and all other
bots by wildcard.

*Type:* boolean

*Default:* `config.services.anubis.defaultOptions.settings.SERVE_ROBOTS_TXT`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.instances.<name>.settings.TARGET` {#opt-services.anubis.instances._name_.settings.TARGET}

The reverse proxy target that Anubis is protecting. This is a required option.

The usage of Unix domain sockets is supported by the following syntax: `unix:///path/to/socket.sock`.

*Type:* string

*Example:* `"http://127.0.0.1:8000"`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.instances.<name>.settings.WEBMASTER_EMAIL` {#opt-services.anubis.instances._name_.settings.WEBMASTER_EMAIL}

If set, shows a contact email address when rendering error pages.

This email address will be how users can get in contact with administrators.

*Type:* null or string

*Default:* `config.services.anubis.defaultOptions.settings.WEBMASTER_EMAIL`

*Example:* `"alice@example.com"`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.instances.<name>.user` {#opt-services.anubis.instances._name_.user}

The user under which Anubis is run.

This module utilizes systemd's DynamicUser feature. See the corresponding section in
`systemd.exec(5)` for more details.

*Type:* string

*Default:* `config.services.anubis.defaultOptions.user`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anubis.package` {#opt-services.anubis.package}

The anubis package to use.

*Type:* package

*Default:* `pkgs.anubis`

*Declared by:* [`nixos/modules/services/networking/anubis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/anubis.nix)

## `services.anuko-time-tracker.dataDir` {#opt-services.anuko-time-tracker.dataDir}

Default data folder for Anuko Time Tracker.

*Type:* string

*Default:* `"/var/lib/anuko-time-tracker"`

*Example:* `"/mnt/anuko-time-tracker"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.database.createLocally` {#opt-services.anuko-time-tracker.database.createLocally}

Create the database and database user locally.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.database.host` {#opt-services.anuko-time-tracker.database.host}

Database host.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.database.name` {#opt-services.anuko-time-tracker.database.name}

Database name.

*Type:* string

*Default:* `"anuko_time_tracker"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.database.passwordFile` {#opt-services.anuko-time-tracker.database.passwordFile}

Database user password file.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.database.user` {#opt-services.anuko-time-tracker.database.user}

Database username.

*Type:* string

*Default:* `"anuko_time_tracker"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.enable` {#opt-services.anuko-time-tracker.enable}

Whether to enable Anuko Time Tracker.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.hostname` {#opt-services.anuko-time-tracker.hostname}

The hostname to serve Anuko Time Tracker on.

*Type:* string

*Default:* `config.networking.fqdn`

*Example:* `"anuko.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx` {#opt-services.anuko-time-tracker.nginx}

With this option, you can customize the Nginx virtualHost settings.

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
{
  serverAliases = [
    "anuko.${config.networking.domain}"
  ];

  # To enable encryption and let let's encrypt take care of certificate
  forceSSL = true;
  enableACME = true;
}
```

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.acmeFallbackHost` {#opt-services.anuko-time-tracker.nginx.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.acmeRoot` {#opt-services.anuko-time-tracker.nginx.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.addSSL` {#opt-services.anuko-time-tracker.nginx.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.basicAuth` {#opt-services.anuko-time-tracker.nginx.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.basicAuthFile` {#opt-services.anuko-time-tracker.nginx.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.default` {#opt-services.anuko-time-tracker.nginx.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.enableACME` {#opt-services.anuko-time-tracker.nginx.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.extraConfig` {#opt-services.anuko-time-tracker.nginx.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.forceSSL` {#opt-services.anuko-time-tracker.nginx.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.globalRedirect` {#opt-services.anuko-time-tracker.nginx.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.http2` {#opt-services.anuko-time-tracker.nginx.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.http3` {#opt-services.anuko-time-tracker.nginx.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.http3_hq` {#opt-services.anuko-time-tracker.nginx.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.kTLS` {#opt-services.anuko-time-tracker.nginx.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.listen` {#opt-services.anuko-time-tracker.nginx.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.listen.*.addr` {#opt-services.anuko-time-tracker.nginx.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.listen.*.extraParameters` {#opt-services.anuko-time-tracker.nginx.listen._.extraParameters}

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

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.listen.*.port` {#opt-services.anuko-time-tracker.nginx.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.listen.*.proxyProtocol` {#opt-services.anuko-time-tracker.nginx.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.listen.*.ssl` {#opt-services.anuko-time-tracker.nginx.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.listenAddresses` {#opt-services.anuko-time-tracker.nginx.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.locations` {#opt-services.anuko-time-tracker.nginx.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.locations.<name>.alias` {#opt-services.anuko-time-tracker.nginx.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.locations.<name>.basicAuth` {#opt-services.anuko-time-tracker.nginx.locations._name_.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.locations.<name>.basicAuthFile` {#opt-services.anuko-time-tracker.nginx.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.locations.<name>.extraConfig` {#opt-services.anuko-time-tracker.nginx.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.locations.<name>.fastcgiParams` {#opt-services.anuko-time-tracker.nginx.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.locations.<name>.index` {#opt-services.anuko-time-tracker.nginx.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.locations.<name>.priority` {#opt-services.anuko-time-tracker.nginx.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.locations.<name>.proxyPass` {#opt-services.anuko-time-tracker.nginx.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.locations.<name>.proxyWebsockets` {#opt-services.anuko-time-tracker.nginx.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.locations.<name>.recommendedProxySettings` {#opt-services.anuko-time-tracker.nginx.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.locations.<name>.recommendedUwsgiSettings` {#opt-services.anuko-time-tracker.nginx.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.locations.<name>.return` {#opt-services.anuko-time-tracker.nginx.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.locations.<name>.root` {#opt-services.anuko-time-tracker.nginx.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.locations.<name>.tryFiles` {#opt-services.anuko-time-tracker.nginx.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.locations.<name>.useGrpcErrorPages` {#opt-services.anuko-time-tracker.nginx.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.locations.<name>.uwsgiPass` {#opt-services.anuko-time-tracker.nginx.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.onlySSL` {#opt-services.anuko-time-tracker.nginx.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.quic` {#opt-services.anuko-time-tracker.nginx.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.redirectCode` {#opt-services.anuko-time-tracker.nginx.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.rejectSSL` {#opt-services.anuko-time-tracker.nginx.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.reuseport` {#opt-services.anuko-time-tracker.nginx.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.root` {#opt-services.anuko-time-tracker.nginx.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.serverAliases` {#opt-services.anuko-time-tracker.nginx.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.serverName` {#opt-services.anuko-time-tracker.nginx.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.sslCertificate` {#opt-services.anuko-time-tracker.nginx.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.sslCertificateKey` {#opt-services.anuko-time-tracker.nginx.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.sslTrustedCertificate` {#opt-services.anuko-time-tracker.nginx.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.nginx.useACMEHost` {#opt-services.anuko-time-tracker.nginx.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.package` {#opt-services.anuko-time-tracker.package}

The anuko-time-tracker package to use.

*Type:* package

*Default:* `pkgs.anuko-time-tracker`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.poolConfig` {#opt-services.anuko-time-tracker.poolConfig}

Options for Anuko Time Tracker's PHP-FPM pool.

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

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.settings.defaultCurrency` {#opt-services.anuko-time-tracker.settings.defaultCurrency}

Defines a default currency symbol for new groups.
Use €, £, a more specific dollar like US$, CAD, etc.

*Type:* string

*Default:* `"$"`

*Example:* `"€"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.settings.defaultLanguage` {#opt-services.anuko-time-tracker.settings.defaultLanguage}

Defines Anuko Time Tracker default language. It is used on Time Tracker login page.
After login, a language set for user group is used.
Empty string means the language is defined by user browser.

*Type:* string

*Default:* `""`

*Example:* `"nl"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.settings.email.mode` {#opt-services.anuko-time-tracker.settings.email.mode}

Mail sending mode. Can be 'mail' or 'smtp'.

*Type:* string

*Default:* `"smtp"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.settings.email.sender` {#opt-services.anuko-time-tracker.settings.email.sender}

Default sender for mail.

*Type:* string

*Default:* `"Anuko Time Tracker <bounces@example.com>"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.settings.email.smtpAuth` {#opt-services.anuko-time-tracker.settings.email.smtpAuth}

MTA requires authentication.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.settings.email.smtpDebug` {#opt-services.anuko-time-tracker.settings.email.smtpDebug}

Debug mail sending.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.settings.email.smtpHost` {#opt-services.anuko-time-tracker.settings.email.smtpHost}

MTA hostname.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.settings.email.smtpPasswordFile` {#opt-services.anuko-time-tracker.settings.email.smtpPasswordFile}

Path to file containing the MTA authentication password.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/anuko-time-tracker/secrets/smtp-password"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.settings.email.smtpPort` {#opt-services.anuko-time-tracker.settings.email.smtpPort}

MTA port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `25`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.settings.email.smtpUser` {#opt-services.anuko-time-tracker.settings.email.smtpUser}

MTA authentication username.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.settings.emailRequired` {#opt-services.anuko-time-tracker.settings.emailRequired}

Defines whether an email is required for new registrations.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.settings.exportDecimalDuration` {#opt-services.anuko-time-tracker.settings.exportDecimalDuration}

Defines whether time duration values are decimal in CSV and XML data
exports (1.25 vs 1:15).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.settings.forumLink` {#opt-services.anuko-time-tracker.settings.forumLink}

Forum link from the main menu.

*Type:* string

*Default:* `"https://www.anuko.com/forum/viewforum.php?f=4"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.settings.helpLink` {#opt-services.anuko-time-tracker.settings.helpLink}

Help link from the main menu.

*Type:* string

*Default:* `"https://www.anuko.com/time-tracker/user-guide/index.htm"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.settings.multiorgMode` {#opt-services.anuko-time-tracker.settings.multiorgMode}

Defines whether users see the Register option in the menu of Time Tracker that allows them
to self-register and create new organizations (top groups).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.settings.reportFooter` {#opt-services.anuko-time-tracker.settings.reportFooter}

Defines whether to use a footer on reports.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.settings.weekendStartDay` {#opt-services.anuko-time-tracker.settings.weekendStartDay}

This option defines which days are highlighted with weekend color.
6 means Saturday. For Saudi Arabia, etc. set it to 4 for Thursday and Friday to be
weekend days.

*Type:* signed integer

*Default:* `6`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.anuko-time-tracker.user` {#opt-services.anuko-time-tracker.user}

User under which Anuko Time Tracker runs.

*Type:* string

*Default:* `"anuko_time_tracker"`

*Declared by:* [`nixos/modules/services/web-apps/anuko-time-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/anuko-time-tracker.nix)

## `services.apache-kafka.clusterId` {#opt-services.apache-kafka.clusterId}

KRaft mode ClusterId used for formatting log directories. Can be generated with `kafka-storage.sh random-uuid`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/apache-kafka.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/apache-kafka.nix)

## `services.apache-kafka.configFiles.log4jProperties` {#opt-services.apache-kafka.configFiles.log4jProperties}

Kafka log4j property configuration file path

*Type:* absolute path

*Default:* `"pkgs.writeText \"log4j.properties\" cfg.log4jProperties"`

*Declared by:* [`nixos/modules/services/misc/apache-kafka.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/apache-kafka.nix)

## `services.apache-kafka.configFiles.serverProperties` {#opt-services.apache-kafka.configFiles.serverProperties}

Kafka server.properties configuration file path.
Defaults to the rendered `settings`.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/misc/apache-kafka.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/apache-kafka.nix)

## `services.apache-kafka.enable` {#opt-services.apache-kafka.enable}

Whether to enable Apache Kafka event streaming broker.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/apache-kafka.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/apache-kafka.nix)

## `services.apache-kafka.formatLogDirs` {#opt-services.apache-kafka.formatLogDirs}

Whether to format log dirs in KRaft mode if all log dirs are
unformatted, ie. they contain no meta.properties.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/apache-kafka.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/apache-kafka.nix)

## `services.apache-kafka.formatLogDirsIgnoreFormatted` {#opt-services.apache-kafka.formatLogDirsIgnoreFormatted}

Whether to ignore already formatted log dirs when formatting log dirs,
instead of failing. Useful when replacing or adding disks.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/apache-kafka.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/apache-kafka.nix)

## `services.apache-kafka.jre` {#opt-services.apache-kafka.jre}

The JRE with which to run Kafka

*Type:* package

*Default:* `pkgs.apacheKafka.passthru.jre`

*Declared by:* [`nixos/modules/services/misc/apache-kafka.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/apache-kafka.nix)

## `services.apache-kafka.jvmOptions` {#opt-services.apache-kafka.jvmOptions}

Extra command line options for the JVM running Kafka.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-Djava.net.preferIPv4Stack=true"
  "-Dcom.sun.management.jmxremote"
  "-Dcom.sun.management.jmxremote.local.only=true"
]
```

*Declared by:* [`nixos/modules/services/misc/apache-kafka.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/apache-kafka.nix)

## `services.apache-kafka.log4jProperties` {#opt-services.apache-kafka.log4jProperties}

Kafka log4j property configuration.

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  log4j.rootLogger=INFO, stdout
  
  log4j.appender.stdout=org.apache.log4j.ConsoleAppender
  log4j.appender.stdout.layout=org.apache.log4j.PatternLayout
  log4j.appender.stdout.layout.ConversionPattern=[%d] %p %m (%c)%n
''
```

*Declared by:* [`nixos/modules/services/misc/apache-kafka.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/apache-kafka.nix)

## `services.apache-kafka.package` {#opt-services.apache-kafka.package}

The apacheKafka package to use.

*Type:* package

*Default:* `pkgs.apacheKafka`

*Declared by:* [`nixos/modules/services/misc/apache-kafka.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/apache-kafka.nix)

## `services.apache-kafka.settings` {#opt-services.apache-kafka.settings}

[Kafka broker configuration](https://kafka.apache.org/documentation.html#brokerconfigs)
`server.properties`.

Note that .properties files contain mappings from string to string.
Keys with dots are NOT represented by nested attrs in these settings,
but instead as quoted strings (ie. `settings."broker.id"`, NOT
`settings.broker.id`).

*Type:* open submodule of lazy attribute set of (null or boolean or signed integer or string or list of (boolean or signed integer or string))

*Declared by:* [`nixos/modules/services/misc/apache-kafka.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/apache-kafka.nix)

## `services.apache-kafka.settings."broker.id"` {#opt-services.apache-kafka.settings._broker.id_}

Broker ID.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/apache-kafka.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/apache-kafka.nix)

## `services.apache-kafka.settings."log.dirs"` {#opt-services.apache-kafka.settings._log.dirs_}

Log file directories.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/apache-kafka.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/apache-kafka.nix)

## `services.apache-kafka.settings.listeners` {#opt-services.apache-kafka.settings.listeners}

Kafka Listener List.
See [listeners](https://kafka.apache.org/documentation/#brokerconfigs_listeners).

*Type:* list of string

*Default:*

``` nix
[
  "PLAINTEXT://localhost:9092"
]
```

*Declared by:* [`nixos/modules/services/misc/apache-kafka.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/apache-kafka.nix)

## `services.apcupsd.configText` {#opt-services.apcupsd.configText}

Contents of the runtime configuration file, apcupsd.conf. The default
settings makes apcupsd autodetect USB UPSes, limit network access to
localhost and shutdown the system when the battery level is below 50
percent, or when the UPS has calculated that it has 5 minutes or less
of remaining power-on time. See man apcupsd.conf for details.

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  UPSTYPE usb
  NISIP 127.0.0.1
  BATTERYLEVEL 50
  MINUTES 5
''
```

*Declared by:* [`nixos/modules/services/monitoring/apcupsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/apcupsd.nix)

## `services.apcupsd.enable` {#opt-services.apcupsd.enable}

Whether to enable the APC UPS daemon. apcupsd monitors your UPS and
permits orderly shutdown of your computer in the event of a power
failure. User manual: http://www.apcupsd.com/manual/manual.html.
Note that apcupsd runs as root (to allow shutdown of computer).
You can check the status of your UPS with the "apcaccess" command.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/apcupsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/apcupsd.nix)

## `services.apcupsd.hooks` {#opt-services.apcupsd.hooks}

Each attribute in this option names an apcupsd event and the string
value it contains will be executed in a shell, in response to that
event (prior to the default action). See "man apccontrol" for the
list of events and what they represent.

A hook script can stop apccontrol from doing its default action by
exiting with value 99. Do not do this unless you know what you're
doing.

*Type:* attribute set of strings concatenated with "\\n"

*Default:* `{ }`

*Example:*

``` nix
{
  doshutdown = "# shell commands to notify that the computer is shutting down";
}
```

*Declared by:* [`nixos/modules/services/monitoring/apcupsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/apcupsd.nix)

## `services.arbtt.enable` {#opt-services.arbtt.enable}

Whether to enable Arbtt statistics capture service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/arbtt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/arbtt.nix)

## `services.arbtt.logFile` {#opt-services.arbtt.logFile}

The log file for captured samples.

*Type:* string

*Default:* `"%h/.arbtt/capture.log"`

*Example:* `"/home/username/.arbtt-capture.log"`

*Declared by:* [`nixos/modules/services/monitoring/arbtt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/arbtt.nix)

## `services.arbtt.package` {#opt-services.arbtt.package}

The arbtt package to use.

*Type:* package

*Default:* `pkgs.haskellPackages.arbtt`

*Declared by:* [`nixos/modules/services/monitoring/arbtt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/arbtt.nix)

## `services.arbtt.sampleRate` {#opt-services.arbtt.sampleRate}

The sampling interval in seconds.

*Type:* signed integer

*Default:* `60`

*Example:* `120`

*Declared by:* [`nixos/modules/services/monitoring/arbtt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/arbtt.nix)

## `services.archisteamfarm.bots` {#opt-services.archisteamfarm.bots}

Bots name and configuration.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  exampleBot = {
    passwordFile = "/var/lib/archisteamfarm/secrets/password";
    settings = {
      SteamParentalCode = "1234";
    };
    username = "alice";
  };
}
```

*Declared by:* [`nixos/modules/services/games/archisteamfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/archisteamfarm.nix)

## `services.archisteamfarm.bots.<name>.enabled` {#opt-services.archisteamfarm.bots._name_.enabled}

Whether to enable the bot on startup.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/games/archisteamfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/archisteamfarm.nix)

## `services.archisteamfarm.bots.<name>.passwordFile` {#opt-services.archisteamfarm.bots._name_.passwordFile}

Path to a file containing the password. The file must be readable by the `archisteamfarm` user/group.
Omit or set to null to provide the password a different way, such as through the web-ui.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/games/archisteamfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/archisteamfarm.nix)

## `services.archisteamfarm.bots.<name>.settings` {#opt-services.archisteamfarm.bots._name_.settings}

Additional settings that are documented [here](https://github.com/JustArchiNET/ArchiSteamFarm/wiki/Configuration#bot-config).

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/games/archisteamfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/archisteamfarm.nix)

## `services.archisteamfarm.bots.<name>.username` {#opt-services.archisteamfarm.bots._name_.username}

Name of the user to log in. Default is attribute name.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/games/archisteamfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/archisteamfarm.nix)

## `services.archisteamfarm.dataDir` {#opt-services.archisteamfarm.dataDir}

The ASF home directory used to store all data.
If left as the default value this directory will automatically be created before the ASF server starts, otherwise the sysadmin is responsible for ensuring the directory exists with appropriate ownership and permissions.

*Type:* absolute path

*Default:* `"/var/lib/archisteamfarm"`

*Declared by:* [`nixos/modules/services/games/archisteamfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/archisteamfarm.nix)

## `services.archisteamfarm.enable` {#opt-services.archisteamfarm.enable}

If enabled, starts the ArchisSteamFarm service.
For configuring the SteamGuard token you will need to use the web-ui, which is enabled by default over on 127.0.0.1:1242.
You cannot configure ASF in any way outside of nix, since all the config files get wiped on restart and replaced with the programnatically set ones by nix.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/archisteamfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/archisteamfarm.nix)

## `services.archisteamfarm.ipcPasswordFile` {#opt-services.archisteamfarm.ipcPasswordFile}

Path to a file containing the password. The file must be readable by the `archisteamfarm` user/group.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/games/archisteamfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/archisteamfarm.nix)

## `services.archisteamfarm.ipcSettings` {#opt-services.archisteamfarm.ipcSettings}

Settings to write to IPC.config.
All options can be found [here](https://github.com/JustArchiNET/ArchiSteamFarm/wiki/IPC#custom-configuration).

*Type:* JSON value

*Default:* `{ }`

*Example:*

``` nix
{
  Kestrel = {
    Endpoints = {
      HTTP = {
        Url = "http://*:1242";
      };
    };
  };
}
```

*Declared by:* [`nixos/modules/services/games/archisteamfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/archisteamfarm.nix)

## `services.archisteamfarm.licenseFile` {#opt-services.archisteamfarm.licenseFile}

Path to a file containing the license. The file must be readable by the `archisteamfarm` user/group.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/games/archisteamfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/archisteamfarm.nix)

## `services.archisteamfarm.package` {#opt-services.archisteamfarm.package}

The archisteamfarm package to use. ::: {.warning}
Should always be the latest version, for security reasons,
since this module uses very new features and to not get out of sync with the Steam API.
:::

*Type:* package

*Default:* `pkgs.archisteamfarm`

*Declared by:* [`nixos/modules/services/games/archisteamfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/archisteamfarm.nix)

## `services.archisteamfarm.settings` {#opt-services.archisteamfarm.settings}

The ASF.json file, all the options are documented [here](https://github.com/JustArchiNET/ArchiSteamFarm/wiki/Configuration#global-config).
Do note that `AutoRestart`  and `UpdateChannel` is always to `false` respectively `0` because NixOS takes care of updating everything.
`Headless` is also always set to `true` because there is no way to provide inputs via a systemd service.
You should try to keep ASF up to date since upstream does not provide support for anything but the latest version and you're exposing yourself to all kinds of issues - as is outlined [here](https://github.com/JustArchiNET/ArchiSteamFarm/wiki/Configuration#updateperiod).

*Type:* JSON value

*Default:* `{ }`

*Example:*

``` nix
{
  Statistics = false;
}
```

*Declared by:* [`nixos/modules/services/games/archisteamfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/archisteamfarm.nix)

## `services.archisteamfarm.web-ui` {#opt-services.archisteamfarm.web-ui}

The Web-UI hosted on 127.0.0.1:1242.

*Type:* submodule

*Default:*

``` nix
{
  enable = true;
}
```

*Example:*

``` nix
{
  enable = false;
}
```

*Declared by:* [`nixos/modules/services/games/archisteamfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/archisteamfarm.nix)

## `services.archisteamfarm.web-ui.enable` {#opt-services.archisteamfarm.web-ui.enable}

Whether to start the web-ui. This is the preferred way of configuring things such as the steam guard token.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/games/archisteamfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/archisteamfarm.nix)

## `services.archisteamfarm.web-ui.package` {#opt-services.archisteamfarm.web-ui.package}

The ui package to use. ::: {.note}
Contents must be in lib/dist
:::

*Type:* package

*Default:* `pkgs.archisteamfarm.ui`

*Declared by:* [`nixos/modules/services/games/archisteamfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/archisteamfarm.nix)

## `services.aria2.downloadDirPermission` {#opt-services.aria2.downloadDirPermission}

The permission for `settings.dir`.

The default is 0770, which denies access for users not in the `aria2`
group.

You may want to adjust `serviceUMask` as well, which further restricts
the file permission for newly created files (i.e. the downloads).

*Type:* string

*Default:* `"0770"`

*Declared by:* [`nixos/modules/services/networking/aria2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/aria2.nix)

## `services.aria2.enable` {#opt-services.aria2.enable}

Whether or not to enable the headless Aria2 daemon service.

Aria2 daemon can be controlled via the RPC interface using one of many
WebUIs (http://localhost:6800/ by default).

Targets are downloaded to `/var/lib/aria2/Downloads` by default and are
accessible to users in the `aria2` group.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/aria2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/aria2.nix)

## `services.aria2.openPorts` {#opt-services.aria2.openPorts}

Open listen and RPC ports found in `settings.listen-port` and
`settings.rpc-listen-port` options in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/aria2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/aria2.nix)

## `services.aria2.rpcSecretFile` {#opt-services.aria2.rpcSecretFile}

A file containing the RPC secret authorization token.
Read [https://aria2.github.io/manual/en/html/aria2c.html#rpc-auth](https://aria2.github.io/manual/en/html/aria2c.html#rpc-auth) to know how this option value is used.

*Type:* absolute path

*Example:* `"/run/secrets/aria2-rpc-token.txt"`

*Declared by:* [`nixos/modules/services/networking/aria2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/aria2.nix)

## `services.aria2.serviceUMask` {#opt-services.aria2.serviceUMask}

The file mode creation mask for Aria2 service.

The default is 0022 for compatibility reason, as this is the default
used by systemd. However, this results in file permission 0644 for new
files, and denies `aria2` group member from modifying the file.

You may want to set this value to `0002` so you can manage the file
more easily.

*Type:* string

*Default:* `"0022"`

*Example:* `"0002"`

*Declared by:* [`nixos/modules/services/networking/aria2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/aria2.nix)

## `services.aria2.settings` {#opt-services.aria2.settings}

Generates the `aria2.conf` file. Refer to [the documentation](https://aria2.github.io/manual/en/html/aria2c.html#synopsis) for
all possible settings.

*Type:* open submodule of attribute set of (boolean or signed integer or floating point number or (optionally newline-terminated) single-line string)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/aria2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/aria2.nix)

## `services.aria2.settings.conf-path` {#opt-services.aria2.settings.conf-path}

Configuration file path.

*Type:* (optionally newline-terminated) single-line string

*Default:* `"/var/lib/aria2/aria2.conf"`

*Declared by:* [`nixos/modules/services/networking/aria2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/aria2.nix)

## `services.aria2.settings.dir` {#opt-services.aria2.settings.dir}

Directory to store downloaded files.

*Type:* (optionally newline-terminated) single-line string

*Default:* `"/var/lib/aria2/Downloads"`

*Declared by:* [`nixos/modules/services/networking/aria2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/aria2.nix)

## `services.aria2.settings.enable-rpc` {#opt-services.aria2.settings.enable-rpc}

Enable JSON-RPC/XML-RPC server.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/aria2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/aria2.nix)

## `services.aria2.settings.listen-port` {#opt-services.aria2.settings.listen-port}

Set UDP listening port range used by DHT(IPv4, IPv6) and UDP tracker.

*Type:* list of attribute set of 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
[
  {
    from = 6881;
    to = 6999;
  }
]
```

*Declared by:* [`nixos/modules/services/networking/aria2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/aria2.nix)

## `services.aria2.settings.rpc-listen-port` {#opt-services.aria2.settings.rpc-listen-port}

Specify a port number for JSON-RPC/XML-RPC server to listen to. Possible Values: 1024-65535

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6800`

*Declared by:* [`nixos/modules/services/networking/aria2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/aria2.nix)

## `services.aria2.settings.save-session` {#opt-services.aria2.settings.save-session}

Save error/unfinished downloads to FILE on exit.

*Type:* (optionally newline-terminated) single-line string

*Default:* `"/var/lib/aria2/aria2.session"`

*Declared by:* [`nixos/modules/services/networking/aria2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/aria2.nix)

## `services.armagetronad.servers` {#opt-services.armagetronad.servers}

Armagetron server definitions.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/games/armagetronad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/armagetronad.nix)

## `services.armagetronad.servers.<name>.dns` {#opt-services.armagetronad.servers._name_.dns}

DNS address to use for this server. Optional.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/games/armagetronad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/armagetronad.nix)

## `services.armagetronad.servers.<name>.enable` {#opt-services.armagetronad.servers._name_.enable}

Whether to enable armagetronad.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/games/armagetronad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/armagetronad.nix)

## `services.armagetronad.servers.<name>.host` {#opt-services.armagetronad.servers._name_.host}

Host to listen on. Used for SERVER\_IP.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/games/armagetronad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/armagetronad.nix)

## `services.armagetronad.servers.<name>.name` {#opt-services.armagetronad.servers._name_.name}

The name of this server.

*Type:* string

*Declared by:* [`nixos/modules/services/games/armagetronad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/armagetronad.nix)

## `services.armagetronad.servers.<name>.openFirewall` {#opt-services.armagetronad.servers._name_.openFirewall}

Set to true to open the configured UDP port for Armagetron Advanced.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/games/armagetronad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/armagetronad.nix)

## `services.armagetronad.servers.<name>.package` {#opt-services.armagetronad.servers._name_.package}

The armagetronad-dedicated package to use. Ensure that you use a derivation which contains the path `bin/armagetronad-dedicated`.

*Type:* package

*Default:* `pkgs.armagetronad-dedicated`

*Example:*

``` nix
pkgs.armagetronad."0.2.9-sty+ct+ap".dedicated
```

*Declared by:* [`nixos/modules/services/games/armagetronad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/armagetronad.nix)

## `services.armagetronad.servers.<name>.port` {#opt-services.armagetronad.servers._name_.port}

Port to listen on. Used for SERVER\_PORT.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4534`

*Declared by:* [`nixos/modules/services/games/armagetronad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/armagetronad.nix)

## `services.armagetronad.servers.<name>.roundSettings` {#opt-services.armagetronad.servers._name_.roundSettings}

Armagetron Advanced server per-round configuration. Refer to:
[https://wiki.armagetronad.org/index.php?title=Console\_Commands](https://wiki.armagetronad.org/index.php?title=Console_Commands)
or `armagetronad-dedicated --doc` for a list.

This attrset is used to populate `everytime.cfg`; see:
[https://wiki.armagetronad.org/index.php/Configuration\_Files](https://wiki.armagetronad.org/index.php/Configuration_Files)

*Type:* attribute set of (atom (null, bool, int, float or string) or a list of them for duplicate keys)

*Default:* `{ }`

*Example:*

``` nix
{
  SAY = [
    "Hosted on NixOS"
    "https://nixos.org"
    "iD Tech High Rubber rul3z!! Happy New Year 2008!!1"
  ];
}
```

*Declared by:* [`nixos/modules/services/games/armagetronad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/armagetronad.nix)

## `services.armagetronad.servers.<name>.settings` {#opt-services.armagetronad.servers._name_.settings}

Armagetron Advanced server rules configuration. Refer to:
[https://wiki.armagetronad.org/index.php?title=Console\_Commands](https://wiki.armagetronad.org/index.php?title=Console_Commands)
or `armagetronad-dedicated --doc` for a list.

This attrset is used to populate `settings_custom.cfg`; see:
[https://wiki.armagetronad.org/index.php/Configuration\_Files](https://wiki.armagetronad.org/index.php/Configuration_Files)

*Type:* attribute set of (atom (null, bool, int, float or string) or a list of them for duplicate keys)

*Default:* `{ }`

*Example:*

``` nix
{
  CYCLE_RUBBER = 40;
}
```

*Declared by:* [`nixos/modules/services/games/armagetronad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/armagetronad.nix)

## `services.artalk.allowModify` {#opt-services.artalk.allowModify}

allow Artalk store the settings to config file persistently

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/artalk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/artalk.nix)

## `services.artalk.configFile` {#opt-services.artalk.configFile}

Artalk config file path. If it is not exist, Artalk will generate one.

*Type:* string

*Default:* `"/etc/artalk/config.yml"`

*Declared by:* [`nixos/modules/services/web-apps/artalk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/artalk.nix)

## `services.artalk.enable` {#opt-services.artalk.enable}

Whether to enable artalk, a comment system.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/artalk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/artalk.nix)

## `services.artalk.group` {#opt-services.artalk.group}

Artalk group name.

*Type:* string

*Default:* `"artalk"`

*Declared by:* [`nixos/modules/services/web-apps/artalk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/artalk.nix)

## `services.artalk.package` {#opt-services.artalk.package}

The artalk package to use.

*Type:* package

*Default:* `pkgs.artalk`

*Declared by:* [`nixos/modules/services/web-apps/artalk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/artalk.nix)

## `services.artalk.settings` {#opt-services.artalk.settings}

The artalk configuration.

If you set allowModify to true, Artalk will be able to store the settings in the config file persistently. This section's content will update in the config file after the service restarts.

Options containing secret data should be set to an attribute set
containing the attribute `_secret` - a string pointing to a file
containing the value the option should be set to.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/artalk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/artalk.nix)

## `services.artalk.settings.host` {#opt-services.artalk.settings.host}

Artalk server listen host

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/web-apps/artalk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/artalk.nix)

## `services.artalk.settings.port` {#opt-services.artalk.settings.port}

Artalk server listen port

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `23366`

*Declared by:* [`nixos/modules/services/web-apps/artalk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/artalk.nix)

## `services.artalk.user` {#opt-services.artalk.user}

Artalk user name.

*Type:* string

*Default:* `"artalk"`

*Declared by:* [`nixos/modules/services/web-apps/artalk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/artalk.nix)

## `services.artalk.workdir` {#opt-services.artalk.workdir}

Artalk working directory

*Type:* string

*Default:* `"/var/lib/artalk"`

*Declared by:* [`nixos/modules/services/web-apps/artalk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/artalk.nix)

## `services.asterisk.confFiles` {#opt-services.asterisk.confFiles}

Sets the content of config files (typically ending with
`.conf`) in the Asterisk configuration directory.

Note that if you want to change `asterisk.conf`, it
is preferable to use the [`services.asterisk.extraConfig`](#opt-services.asterisk.extraConfig)
option over this option. If `"asterisk.conf"` is
specified with the `confFiles` option (not recommended),
you must be prepared to set your own `astetcdir`
path.

See
[https://www.asterisk.org/community/documentation/](https://www.asterisk.org/community/documentation/)
for more examples of what is possible here.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  "extensions.conf" = ''
    [tests]
    ; Dial 100 for "hello, world"
    exten => 100,1,Answer()
    same  =>     n,Wait(1)
    same  =>     n,Playback(hello-world)
    same  =>     n,Hangup()

    [softphones]
    include => tests

    [unauthorized]
  '';
  "sip.conf" = ''
    [general]
    allowguest=no              ; Require authentication
    context=unauthorized       ; Send unauthorized users to /dev/null
    srvlookup=no               ; Don't do DNS lookup
    udpbindaddr=0.0.0.0        ; Listen on all interfaces
    nat=force_rport,comedia    ; Assume device is behind NAT

    [softphone](!)
    type=friend                ; Match on username first, IP second
    context=softphones         ; Send to softphones context in
                               ; extensions.conf file
    host=dynamic               ; Device will register with asterisk
    disallow=all               ; Manually specify codecs to allow
    allow=g722
    allow=ulaw
    allow=alaw

    [myphone](softphone)
    secret=GhoshevFew          ; Change this password!
  '';
  "logger.conf" = ''
    [general]

    [logfiles]
    ; Add debug output to log
    syslog.local0 => notice,warning,error,debug
  '';
}
```

*Declared by:* [`nixos/modules/services/networking/asterisk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/asterisk.nix)

## `services.asterisk.enable` {#opt-services.asterisk.enable}

Whether to enable the Asterisk PBX server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/asterisk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/asterisk.nix)

## `services.asterisk.extraArguments` {#opt-services.asterisk.extraArguments}

Additional command line arguments to pass to Asterisk.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-vvvddd"
  "-e"
  "1024"
]
```

*Declared by:* [`nixos/modules/services/networking/asterisk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/asterisk.nix)

## `services.asterisk.extraConfig` {#opt-services.asterisk.extraConfig}

Extra configuration options appended to the default
`asterisk.conf` file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  [options]
  verbose=3
  debug=3
''
```

*Declared by:* [`nixos/modules/services/networking/asterisk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/asterisk.nix)

## `services.asterisk.package` {#opt-services.asterisk.package}

The asterisk package to use.

*Type:* package

*Default:* `pkgs.asterisk`

*Declared by:* [`nixos/modules/services/networking/asterisk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/asterisk.nix)

## `services.asterisk.useTheseDefaultConfFiles` {#opt-services.asterisk.useTheseDefaultConfFiles}

Sets these config files to the default content. The default value for
this option contains all necesscary files to avoid errors at startup.
This does not override settings via [`services.asterisk.confFiles`](#opt-services.asterisk.confFiles).

*Type:* list of string

*Default:*

``` nix
[
  "ari.conf"
  "acl.conf"
  "agents.conf"
  "amd.conf"
  "calendar.conf"
  "cdr.conf"
  "cdr_syslog.conf"
  "cdr_custom.conf"
  "cel.conf"
  "cel_custom.conf"
  "cli_aliases.conf"
  "confbridge.conf"
  "dundi.conf"
  "features.conf"
  "hep.conf"
  "iax.conf"
  "pjsip.conf"
  "pjsip_wizard.conf"
  "phone.conf"
  "phoneprov.conf"
  "queues.conf"
  "res_config_sqlite3.conf"
  "res_parking.conf"
  "statsd.conf"
  "udptl.conf"
  "unistim.conf"
]
```

*Example:*

``` nix
[
  "sip.conf"
  "dundi.conf"
]
```

*Declared by:* [`nixos/modules/services/networking/asterisk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/asterisk.nix)

## `services.asusd.animeConfig` {#opt-services.asusd.animeConfig}

The content of /etc/asusd/anime.ron.
See [https://asus-linux.org/manual/asusctl-manual/#anime-control](https://asus-linux.org/manual/asusctl-manual/#anime-control).

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/asusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/asusd.nix)

## `services.asusd.animeConfig.source` {#opt-services.asusd.animeConfig.source}

Path of the source file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/asusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/asusd.nix)

## `services.asusd.animeConfig.text` {#opt-services.asusd.animeConfig.text}

Text of the file.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/asusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/asusd.nix)

## `services.asusd.asusdConfig` {#opt-services.asusd.asusdConfig}

The content of /etc/asusd/asusd.ron.
See [https://asus-linux.org/manual/asusctl-manual/](https://asus-linux.org/manual/asusctl-manual/).

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/asusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/asusd.nix)

## `services.asusd.asusdConfig.source` {#opt-services.asusd.asusdConfig.source}

Path of the source file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/asusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/asusd.nix)

## `services.asusd.asusdConfig.text` {#opt-services.asusd.asusdConfig.text}

Text of the file.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/asusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/asusd.nix)

## `services.asusd.auraConfigs` {#opt-services.asusd.auraConfigs}

The content of /etc/asusd/aura\_<name>.ron.
See [https://asus-linux.org/manual/asusctl-manual/#led-keyboard-control](https://asus-linux.org/manual/asusctl-manual/#led-keyboard-control).

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/hardware/asusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/asusd.nix)

## `services.asusd.auraConfigs.<name>.source` {#opt-services.asusd.auraConfigs._name_.source}

Path of the source file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/asusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/asusd.nix)

## `services.asusd.auraConfigs.<name>.text` {#opt-services.asusd.auraConfigs._name_.text}

Text of the file.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/asusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/asusd.nix)

## `services.asusd.enable` {#opt-services.asusd.enable}

Whether to enable the asusd service for ASUS ROG laptops.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/asusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/asusd.nix)

## `services.asusd.fanCurvesConfig` {#opt-services.asusd.fanCurvesConfig}

The content of /etc/asusd/fan\_curves.ron.
See [https://asus-linux.org/manual/asusctl-manual/#fan-curves](https://asus-linux.org/manual/asusctl-manual/#fan-curves).

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/asusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/asusd.nix)

## `services.asusd.fanCurvesConfig.source` {#opt-services.asusd.fanCurvesConfig.source}

Path of the source file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/asusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/asusd.nix)

## `services.asusd.fanCurvesConfig.text` {#opt-services.asusd.fanCurvesConfig.text}

Text of the file.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/asusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/asusd.nix)

## `services.asusd.package` {#opt-services.asusd.package}

The asusctl package to use.

*Type:* package

*Default:* `pkgs.asusctl`

*Declared by:* [`nixos/modules/services/hardware/asusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/asusd.nix)

## `services.asusd.profileConfig` {#opt-services.asusd.profileConfig}

The content of /etc/asusd/profile.ron.
See [https://asus-linux.org/manual/asusctl-manual/#profiles](https://asus-linux.org/manual/asusctl-manual/#profiles).

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/asusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/asusd.nix)

## `services.asusd.profileConfig.source` {#opt-services.asusd.profileConfig.source}

Path of the source file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/asusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/asusd.nix)

## `services.asusd.profileConfig.text` {#opt-services.asusd.profileConfig.text}

Text of the file.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/asusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/asusd.nix)

## `services.asusd.userLedModesConfig` {#opt-services.asusd.userLedModesConfig}

The content of /etc/asusd/asusd-user-ledmodes.ron.
See [https://asus-linux.org/manual/asusctl-manual/#led-keyboard-control](https://asus-linux.org/manual/asusctl-manual/#led-keyboard-control).

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/asusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/asusd.nix)

## `services.asusd.userLedModesConfig.source` {#opt-services.asusd.userLedModesConfig.source}

Path of the source file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/asusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/asusd.nix)

## `services.asusd.userLedModesConfig.text` {#opt-services.asusd.userLedModesConfig.text}

Text of the file.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/asusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/asusd.nix)

## `services.atalkd.configFile` {#opt-services.atalkd.configFile}

Optional path to a custom `atalkd.conf` file. When set, this overrides the generated
configuration from `services.atalkd.interfaces`.

*Type:* null or absolute path

*Default:* `"/nix/store/xxx-atalkd.conf"`

*Declared by:* [`nixos/modules/services/networking/atalkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/atalkd.nix)

## `services.atalkd.enable` {#opt-services.atalkd.enable}

Whether to enable the AppleTalk daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/atalkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/atalkd.nix)

## `services.atalkd.interfaces` {#opt-services.atalkd.interfaces}

Per-interface configuration for atalkd.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/atalkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/atalkd.nix)

## `services.atalkd.interfaces.<name>.config` {#opt-services.atalkd.interfaces._name_.config}

Optional configuration string for this interface.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/atalkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/atalkd.nix)

## `services.atd.allowEveryone` {#opt-services.atd.allowEveryone}

Whether to make `/var/spool/at{jobs,spool}`
writeable by everyone (and sticky).  This is normally not
needed since the `at` commands are
setuid/setgid `atd`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/scheduling/atd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/scheduling/atd.nix)

## `services.atd.enable` {#opt-services.atd.enable}

Whether to enable the `at` daemon, a command scheduler.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/scheduling/atd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/scheduling/atd.nix)

## `services.atftpd.enable` {#opt-services.atftpd.enable}

Whether to enable the atftpd TFTP server. By default, the server
binds to address 0.0.0.0.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/atftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/atftpd.nix)

## `services.atftpd.extraOptions` {#opt-services.atftpd.extraOptions}

Extra command line arguments to pass to atftp.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[ "--bind-address 192.168.9.1"
  "--verbose=7"
]
```

*Declared by:* [`nixos/modules/services/networking/atftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/atftpd.nix)

## `services.atftpd.root` {#opt-services.atftpd.root}

Document root directory for the atftpd.

*Type:* absolute path

*Default:* `"/srv/tftp"`

*Declared by:* [`nixos/modules/services/networking/atftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/atftpd.nix)

## `services.athens.basicAuthPass` {#opt-services.athens.basicAuthPass}

Password for basic auth. Warning: this is stored in plain text in the config file.

*Type:* null or string

*Default:* `null`

*Example:* `"swordfish"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.basicAuthUser` {#opt-services.athens.basicAuthUser}

Username for basic auth.

*Type:* null or string

*Default:* `null`

*Example:* `"user"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.cloudRuntime` {#opt-services.athens.cloudRuntime}

Specifies the Cloud Provider on which the Proxy/registry is running.

*Type:* one of "GCP", "none"

*Default:* `"none"`

*Example:* `"GCP"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.downloadMode` {#opt-services.athens.downloadMode}

Defines how Athens behaves when a module@version
is not found in storage. There are 7 options:

1. "sync": download the module synchronously and
   return the results to the client.
2. "async": return 404, but asynchronously store the module
   in the storage backend.
3. "redirect": return a 301 redirect status to the client
   with the base URL as the DownloadRedirectURL from below.
4. "async\_redirect": same as option number 3 but it will
   asynchronously store the module to the backend.
5. "none": return 404 if a module is not found and do nothing.
6. "file:<path>": will point to an HCL file that specifies
   any of the 5 options above based on different import paths.
7. "custom:<base64-encoded-hcl>" is the same as option 6
   but the file is fully encoded in the option. This is
   useful for using an environment variable in serverless
   deployments.

*Type:* one of "sync", "async", "redirect", "async\_redirect", "none" or string matching the pattern ^file:.*$|^custom:.*$

*Default:* `"async_redirect"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.downloadURL` {#opt-services.athens.downloadURL}

URL used if DownloadMode is set to redirect.

*Type:* string

*Default:* `"https://proxy.golang.org"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.enable` {#opt-services.athens.enable}

Whether to enable Go module datastore and proxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.enablePprof` {#opt-services.athens.enablePprof}

Enable pprof endpoints.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.extraConfig` {#opt-services.athens.extraConfig}

Extra configuration options for the athens config file.

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.filterFile` {#opt-services.athens.filterFile}

Filename for the include exclude filter.

*Type:* null or absolute path

*Default:* `null`

*Example:*

``` nix
pkgs.writeText "filterFile" ''
  - github.com/azure
  + github.com/azure/azure-sdk-for-go
  D golang.org/x/tools
''
```

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.forceSSL` {#opt-services.athens.forceSSL}

Force SSL redirects for incoming requests.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.githubToken` {#opt-services.athens.githubToken}

Creates .netrc file with the given token to be used for GitHub.
Warning: this is stored in plain text in the config file.

*Type:* null or string

*Default:* `null`

*Example:* `"ghp_1234567890"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.globalEndpoint` {#opt-services.athens.globalEndpoint}

Endpoint for a package registry in case of a proxy cache miss.

*Type:* string

*Default:* `""`

*Example:* `"http://upstream-athens.example.com:3000"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.goBinary` {#opt-services.athens.goBinary}

The Go package used by Athens at runtime.

Athens primarily runs two Go commands:

1. `go mod download -json <module>@<version>`
2. `go list -m -json <module>@latest`

*Type:* package

*Default:* `pkgs.go`

*Example:* `"pkgs.go_1_23"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.goBinaryEnvVars` {#opt-services.athens.goBinaryEnvVars}

Environment variables to pass to the Go binary.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
''
  { "GOPROXY" = "direct", "GODEBUG" = "true" }
''
```

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.goEnv` {#opt-services.athens.goEnv}

Specifies the type of environment to run. One of 'development' or 'production'.

*Type:* one of "development", "production"

*Default:* `"development"`

*Example:* `"production"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.goGetDir` {#opt-services.athens.goGetDir}

Temporary directory that Athens will use to
fetch modules from VCS prior to persisting
them to a storage backend.

If the value is empty, Athens will use the
default OS temp directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/tmp/athens"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.goGetWorkers` {#opt-services.athens.goGetWorkers}

Number of workers concurrently downloading modules.

*Type:* signed integer

*Default:* `10`

*Example:* `32`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.hgrcPath` {#opt-services.athens.hgrcPath}

Path to the .hgrc file.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/home/user/.hgrc"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.index.mysql.database` {#opt-services.athens.index.mysql.database}

Database name for the MySQL database.

*Type:* string

*Default:* `"athens"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.index.mysql.host` {#opt-services.athens.index.mysql.host}

Host for the MySQL database.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.index.mysql.params.parseTime` {#opt-services.athens.index.mysql.params.parseTime}

Parse time for the MySQL database.

*Type:* null or string

*Default:* `"true"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.index.mysql.params.timeout` {#opt-services.athens.index.mysql.params.timeout}

Timeout for the MySQL database.

*Type:* null or string

*Default:* `"30s"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.index.mysql.password` {#opt-services.athens.index.mysql.password}

Password for the MySQL database. Warning: this is stored in plain text in the config file.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.index.mysql.port` {#opt-services.athens.index.mysql.port}

Port for the MySQL database.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3306`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.index.mysql.protocol` {#opt-services.athens.index.mysql.protocol}

Protocol for the MySQL database.

*Type:* string

*Default:* `"tcp"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.index.mysql.user` {#opt-services.athens.index.mysql.user}

User for the MySQL database.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.index.postgres.database` {#opt-services.athens.index.postgres.database}

Database name for the Postgres database.

*Type:* string

*Default:* `"athens"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.index.postgres.host` {#opt-services.athens.index.postgres.host}

Host for the Postgres database.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.index.postgres.params.connect_timeout` {#opt-services.athens.index.postgres.params.connect_timeout}

Connect timeout for the Postgres database.

*Type:* null or string

*Default:* `"30s"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.index.postgres.params.sslmode` {#opt-services.athens.index.postgres.params.sslmode}

SSL mode for the Postgres database.

*Type:* null or string

*Default:* `"disable"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.index.postgres.password` {#opt-services.athens.index.postgres.password}

Password for the Postgres database. Warning: this is stored in plain text in the config file.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.index.postgres.port` {#opt-services.athens.index.postgres.port}

Port for the Postgres database.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5432`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.index.postgres.user` {#opt-services.athens.index.postgres.user}

User for the Postgres database.

*Type:* string

*Default:* `"postgres"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.indexType` {#opt-services.athens.indexType}

Type of index backend Athens will use.

*Type:* one of "none", "memory", "mysql", "postgres"

*Default:* `"none"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.logLevel` {#opt-services.athens.logLevel}

Log level for Athens.
Supports all logrus log levels (https://github.com/Sirupsen/logrus#level-logging)".

*Type:* null or one of "panic", "fatal", "error", "warning", "info", "debug", "trace"

*Default:* `"warning"`

*Example:* `"debug"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.netrcPath` {#opt-services.athens.netrcPath}

Path to the .netrc file.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/home/user/.netrc"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.networkMode` {#opt-services.athens.networkMode}

Configures how Athens will return the results
of the /list endpoint as it can be assembled from both its own
storage and the upstream VCS.

Note, that for better error messaging, this would also affect how other
endpoints behave.

Modes:

1. strict: merge VCS versions with storage versions, but fail if either of them fails.
2. offline: only get storage versions, never reach out to VCS.
3. fallback: only return storage versions, if VCS fails. Note this means that you may
   see inconsistent results since fallback mode does a best effort of giving you what's
   available at the time of requesting versions.

*Type:* one of "strict", "offline", "fallback"

*Default:* `"strict"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.noSumPatterns` {#opt-services.athens.noSumPatterns}

List of patterns that Athens sum db proxy will return a 403 for.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "github.com/mycompany/*"
]
```

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.package` {#opt-services.athens.package}

Which athens derivation to use

*Type:* package

*Default:* `pkgs.athens`

*Example:* `"pkgs.athens"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.pathPrefix` {#opt-services.athens.pathPrefix}

Sets basepath for all routes.

*Type:* null or string

*Default:* `null`

*Example:* `"/athens"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.port` {#opt-services.athens.port}

Port number Athens listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Example:* `443`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.pprofPort` {#opt-services.athens.pprofPort}

Port number for pprof endpoints.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3301`

*Example:* `443`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.protocolWorkers` {#opt-services.athens.protocolWorkers}

Number of workers concurrently serving protocol paths.

*Type:* signed integer

*Default:* `30`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.robotsFile` {#opt-services.athens.robotsFile}

Provides /robots.txt for net crawlers.

*Type:* null or absolute path

*Default:* `null`

*Example:* `pkgs.writeText "robots.txt" "# my custom robots.txt ..."`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.shutdownTimeout` {#opt-services.athens.shutdownTimeout}

Number of seconds to wait for the server to shutdown gracefully.

*Type:* signed integer

*Default:* `60`

*Example:* `1`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.singleFlight.etcd.endpoints` {#opt-services.athens.singleFlight.etcd.endpoints}

URLs that determine all distributed etcd servers.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "localhost:2379"
]
```

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.singleFlight.redis.endpoint` {#opt-services.athens.singleFlight.redis.endpoint}

URL of the redis server.

*Type:* string

*Default:* `""`

*Example:* `"localhost:6379"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.singleFlight.redis.lockConfig.maxRetries` {#opt-services.athens.singleFlight.redis.lockConfig.maxRetries}

Maximum number of retries for the lock.

*Type:* signed integer

*Default:* `10`

*Example:* `1`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.singleFlight.redis.lockConfig.timeout` {#opt-services.athens.singleFlight.redis.lockConfig.timeout}

Timeout for the lock in seconds.

*Type:* signed integer

*Default:* `15`

*Example:* `1`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.singleFlight.redis.lockConfig.ttl` {#opt-services.athens.singleFlight.redis.lockConfig.ttl}

TTL for the lock in seconds.

*Type:* signed integer

*Default:* `900`

*Example:* `1`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.singleFlight.redis.password` {#opt-services.athens.singleFlight.redis.password}

Password for the redis server. Warning: this is stored in plain text in the config file.

*Type:* string

*Default:* `""`

*Example:* `"swordfish"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.singleFlight.redisSentinel.endpoints` {#opt-services.athens.singleFlight.redisSentinel.endpoints}

URLs that determine all distributed redis servers.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "localhost:26379"
]
```

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.singleFlight.redisSentinel.lockConfig.maxRetries` {#opt-services.athens.singleFlight.redisSentinel.lockConfig.maxRetries}

Maximum number of retries for the lock.

*Type:* signed integer

*Default:* `10`

*Example:* `1`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.singleFlight.redisSentinel.lockConfig.timeout` {#opt-services.athens.singleFlight.redisSentinel.lockConfig.timeout}

Timeout for the lock in seconds.

*Type:* signed integer

*Default:* `15`

*Example:* `1`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.singleFlight.redisSentinel.lockConfig.ttl` {#opt-services.athens.singleFlight.redisSentinel.lockConfig.ttl}

TTL for the lock in seconds.

*Type:* signed integer

*Default:* `900`

*Example:* `1`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.singleFlight.redisSentinel.masterName` {#opt-services.athens.singleFlight.redisSentinel.masterName}

Name of the sentinel master server.

*Type:* string

*Default:* `""`

*Example:* `"redis-1"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.singleFlight.redisSentinel.sentinelPassword` {#opt-services.athens.singleFlight.redisSentinel.sentinelPassword}

Password for the sentinel server. Warning: this is stored in plain text in the config file.

*Type:* string

*Default:* `""`

*Example:* `"swordfish"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.singleFlightType` {#opt-services.athens.singleFlightType}

Determines what mechanism Athens uses to manage concurrency flowing into the Athens backend.

*Type:* one of "memory", "etcd", "redis", "redis-sentinel", "gcp", "azureblob"

*Default:* `"memory"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.statsExporter` {#opt-services.athens.statsExporter}

Stats exporter to use.

*Type:* null or value "prometheus" (singular enum)

*Default:* `null`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storage.azureblob.accountKey` {#opt-services.athens.storage.azureblob.accountKey}

Account key for the Azure Blob storage backend. Warning: this is stored in plain text in the config file.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storage.azureblob.accountName` {#opt-services.athens.storage.azureblob.accountName}

Account name for the Azure Blob storage backend.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storage.azureblob.containerName` {#opt-services.athens.storage.azureblob.containerName}

Container name for the Azure Blob storage backend.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storage.cdn.endpoint` {#opt-services.athens.storage.cdn.endpoint}

hostname of the CDN server.

*Type:* null or string

*Default:* `null`

*Example:* `"cdn.example.com"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storage.disk.rootPath` {#opt-services.athens.storage.disk.rootPath}

Athens disk root folder.

*Type:* null or absolute path

*Default:* `"/var/lib/athens"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storage.external.url` {#opt-services.athens.storage.external.url}

URL of the backend storage layer.

*Type:* null or string

*Default:* `null`

*Example:* `"https://athens.example.com"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storage.gcp.bucket` {#opt-services.athens.storage.gcp.bucket}

GCP backend storage bucket.

*Type:* null or string

*Default:* `null`

*Example:* `"my-bucket"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storage.gcp.jsonKey` {#opt-services.athens.storage.gcp.jsonKey}

Base64 encoded GCP service account key. Warning: this is stored in plain text in the config file.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storage.gcp.projectID` {#opt-services.athens.storage.gcp.projectID}

GCP project ID.

*Type:* null or string

*Default:* `null`

*Example:* `"my-project"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storage.mongo.certPath` {#opt-services.athens.storage.mongo.certPath}

Path to the certificate file for the mongo database.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/etc/ssl/mongo.pem"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storage.mongo.defaultDBName` {#opt-services.athens.storage.mongo.defaultDBName}

Name of the mongo database.

*Type:* null or string

*Default:* `null`

*Example:* `"athens"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storage.mongo.insecure` {#opt-services.athens.storage.mongo.insecure}

Allow insecure connections to the mongo database.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storage.mongo.url` {#opt-services.athens.storage.mongo.url}

URL of the mongo database.

*Type:* null or string

*Default:* `null`

*Example:* `"mongodb://localhost:27017"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storage.s3.awsContainerCredentialsRelativeURI` {#opt-services.athens.storage.s3.awsContainerCredentialsRelativeURI}

Container relative url (used by fargate).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storage.s3.bucket` {#opt-services.athens.storage.s3.bucket}

Bucket name for the S3 storage backend.

*Type:* null or string

*Default:* `null`

*Example:* `"gomods"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storage.s3.credentialsEndpoint` {#opt-services.athens.storage.s3.credentialsEndpoint}

Credentials endpoint for the S3 storage backend.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storage.s3.endpoint` {#opt-services.athens.storage.s3.endpoint}

Endpoint for the S3 storage backend.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storage.s3.forcePathStyle` {#opt-services.athens.storage.s3.forcePathStyle}

Force path style for the S3 storage backend.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storage.s3.key` {#opt-services.athens.storage.s3.key}

Access key id for the S3 storage backend.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storage.s3.region` {#opt-services.athens.storage.s3.region}

Region of the S3 storage backend.

*Type:* null or string

*Default:* `null`

*Example:* `"eu-west-3"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storage.s3.secret` {#opt-services.athens.storage.s3.secret}

Secret key for the S3 storage backend. Warning: this is stored in plain text in the config file.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storage.s3.token` {#opt-services.athens.storage.s3.token}

Token for the S3 storage backend. Warning: this is stored in plain text in the config file.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storage.s3.useDefaultConfiguration` {#opt-services.athens.storage.s3.useDefaultConfiguration}

Use default configuration for the S3 storage backend.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.storageType` {#opt-services.athens.storageType}

Specifies the type of storage backend to use.

*Type:* one of "memory", "disk", "mongo", "gcp", "s3", "azureblob", "external"

*Default:* `"disk"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.sumDBs` {#opt-services.athens.sumDBs}

List of fully qualified URLs that Athens will proxy
that the go command can use a checksum verifier.

*Type:* list of string

*Default:*

``` nix
[
  "https://sum.golang.org"
]
```

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.timeout` {#opt-services.athens.timeout}

Timeout for external network calls in seconds.

*Type:* signed integer

*Default:* `300`

*Example:* `3`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.tlsCertFile` {#opt-services.athens.tlsCertFile}

Path to the TLS certificate file.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/etc/ssl/certs/athens.crt"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.tlsKeyFile` {#opt-services.athens.tlsKeyFile}

Path to the TLS key file.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/etc/ssl/certs/athens.key"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.traceExporter` {#opt-services.athens.traceExporter}

Trace exporter to use.

*Type:* null or one of "jaeger", "datadog"

*Default:* `null`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.traceExporterURL` {#opt-services.athens.traceExporterURL}

URL endpoint that traces will be sent to.

*Type:* null or string

*Default:* `null`

*Example:* `"http://localhost:14268"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.unixSocket` {#opt-services.athens.unixSocket}

Path to the unix socket file.
If set, Athens will listen on the unix socket instead of TCP socket.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/athens.sock"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.athens.validatorHook` {#opt-services.athens.validatorHook}

Endpoint to validate modules against.

Not used if empty.

*Type:* null or string

*Default:* `null`

*Example:* `"https://validation.example.com"`

*Declared by:* [`nixos/modules/services/development/athens.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/athens.nix)

## `services.atlantis.credentials` {#opt-services.atlantis.credentials}

Secret files to pass to Atlantis and its Terraform subprocesses. Each
attribute name is exported with the systemd credential path as its
value. For example, a `TF_VAR_` attribute lets Terraform consume the
file with `file(var.<name>)`. Values are loaded with systemd
`LoadCredential`. Restart Atlantis to load changes to the files.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
{
  TF_VAR_example_secret_file = "/run/secrets/example";
}
```

*Declared by:* [`nixos/modules/services/web-apps/atlantis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/atlantis.nix)

## `services.atlantis.dataDir` {#opt-services.atlantis.dataDir}

Data directory for Atlantis.

*Type:* absolute path

*Default:* `"/var/lib/atlantis"`

*Declared by:* [`nixos/modules/services/web-apps/atlantis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/atlantis.nix)

## `services.atlantis.enable` {#opt-services.atlantis.enable}

Whether to enable Atlantis service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/atlantis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/atlantis.nix)

## `services.atlantis.environment` {#opt-services.atlantis.environment}

Environment variables to pass to Atlantis and its Terraform subprocesses.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  ATLANTIS_GH_USER = "atlantis-bot";
}
```

*Declared by:* [`nixos/modules/services/web-apps/atlantis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/atlantis.nix)

## `services.atlantis.environmentFile` {#opt-services.atlantis.environmentFile}

Environment file containing secrets.
Restart Atlantis to load changes to the file.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/atlantis"`

*Declared by:* [`nixos/modules/services/web-apps/atlantis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/atlantis.nix)

## `services.atlantis.extraArgs` {#opt-services.atlantis.extraArgs}

Extra command-line arguments to pass to `atlantis server`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--verbose"
]
```

*Declared by:* [`nixos/modules/services/web-apps/atlantis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/atlantis.nix)

## `services.atlantis.extraPackages` {#opt-services.atlantis.extraPackages}

Extra packages to add to the Atlantis service PATH.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.opentofu pkgs.nix ]`

*Declared by:* [`nixos/modules/services/web-apps/atlantis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/atlantis.nix)

## `services.atlantis.group` {#opt-services.atlantis.group}

Group account under which Atlantis runs.

*Type:* string

*Default:* `"atlantis"`

*Declared by:* [`nixos/modules/services/web-apps/atlantis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/atlantis.nix)

## `services.atlantis.openFirewall` {#opt-services.atlantis.openFirewall}

Whether to open the firewall port for Atlantis.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/atlantis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/atlantis.nix)

## `services.atlantis.package` {#opt-services.atlantis.package}

The atlantis package to use.

*Type:* package

*Default:* `pkgs.atlantis`

*Declared by:* [`nixos/modules/services/web-apps/atlantis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/atlantis.nix)

## `services.atlantis.settings` {#opt-services.atlantis.settings}

Settings written to the Atlantis server YAML configuration file.
The generated file is stored in the Nix store and readable by other
users. Keep secrets out of this option. Use
[`services.atlantis.environmentFile`](#opt-services.atlantis.environmentFile) to provide secret values
as environment variables, or [`services.atlantis.credentials`](#opt-services.atlantis.credentials)
to provide secret files whose paths are exposed as environment
variables.

See the docs for details:
[https://www.runatlantis.io/docs/server-configuration.html](https://www.runatlantis.io/docs/server-configuration.html)

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Example:*

``` nix
{
  atlantis-url = "https://atlantis.example.com";
  gh-user = "github_user";
  repo-allowlist = "github.com/yourorg/yourrepo";
  default-tf-version = "1.12.2";
}
```

*Declared by:* [`nixos/modules/services/web-apps/atlantis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/atlantis.nix)

## `services.atlantis.settings.port` {#opt-services.atlantis.settings.port}

Port on which Atlantis listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4141`

*Declared by:* [`nixos/modules/services/web-apps/atlantis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/atlantis.nix)

## `services.atlantis.user` {#opt-services.atlantis.user}

User account under which Atlantis runs.

*Type:* string

*Default:* `"atlantis"`

*Declared by:* [`nixos/modules/services/web-apps/atlantis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/atlantis.nix)

## `services.atticd.enable` {#opt-services.atticd.enable}

Whether to enable the atticd, the Nix Binary Cache server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/atticd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/atticd.nix)

## `services.atticd.environmentFile` {#opt-services.atticd.environmentFile}

Path to an EnvironmentFile containing required environment
variables:

- ATTIC\_SERVER\_TOKEN\_RS256\_SECRET\_BASE64: The base64-encoded RSA PEM PKCS1 of the
  RS256 JWT secret. Generate it with `openssl genrsa -traditional 4096 | base64 -w0`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/atticd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/atticd.nix)

## `services.atticd.group` {#opt-services.atticd.group}

The group under which attic runs.

*Type:* string

*Default:* `"atticd"`

*Declared by:* [`nixos/modules/services/networking/atticd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/atticd.nix)

## `services.atticd.mode` {#opt-services.atticd.mode}

Mode in which to run the server.

'monolithic' runs all components, and is suitable for single-node deployments.

'api-server' runs only the API server, and is suitable for clustering.

'garbage-collector' only runs the garbage collector periodically.

A simple NixOS-based Attic deployment will typically have one 'monolithic' and any number of 'api-server' nodes.

There are several other supported modes that perform one-off operations, but these are the only ones that make sense to run via the NixOS module.

*Type:* one of "monolithic", "api-server", "garbage-collector"

*Default:* `"monolithic"`

*Declared by:* [`nixos/modules/services/networking/atticd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/atticd.nix)

## `services.atticd.package` {#opt-services.atticd.package}

The attic-server package to use.

*Type:* package

*Default:* `pkgs.attic-server`

*Declared by:* [`nixos/modules/services/networking/atticd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/atticd.nix)

## `services.atticd.settings` {#opt-services.atticd.settings}

Structured configurations of atticd.
See [https://github.com/zhaofengli/attic/blob/main/server/src/config-template.toml](https://github.com/zhaofengli/attic/blob/main/server/src/config-template.toml)

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/atticd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/atticd.nix)

## `services.atticd.user` {#opt-services.atticd.user}

The user under which attic runs.

*Type:* string

*Default:* `"atticd"`

*Declared by:* [`nixos/modules/services/networking/atticd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/atticd.nix)

## `services.atuin.database.createLocally` {#opt-services.atuin.database.createLocally}

Create the database and database user locally.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/atuin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/atuin.nix)

## `services.atuin.database.uri` {#opt-services.atuin.database.uri}

URI to the database.
Can be set to null in which case ATUIN\_DB\_URI should be set through an EnvironmentFile

*Type:* null or string

*Default:* `"postgresql:///atuin?host=/run/postgresql"`

*Example:* `"postgresql://atuin@localhost:5432/atuin"`

*Declared by:* [`nixos/modules/services/misc/atuin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/atuin.nix)

## `services.atuin.enable` {#opt-services.atuin.enable}

Whether to enable Atuin server for shell history sync.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/atuin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/atuin.nix)

## `services.atuin.environmentFile` {#opt-services.atuin.environmentFile}

Environment file, used to set any secret ATUIN\_\* environment variables, such as ATUIN\_DB\_URI containing a password.
See [https://docs.atuin.sh/latest/self-hosting/server-setup/#configuration](https://docs.atuin.sh/latest/self-hosting/server-setup/#configuration) for available environment variables.

*Type:* null or absolute path not in the Nix store

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/atuin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/atuin.nix)

## `services.atuin.host` {#opt-services.atuin.host}

The host address the atuin server should listen on.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/misc/atuin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/atuin.nix)

## `services.atuin.maxHistoryLength` {#opt-services.atuin.maxHistoryLength}

The max length of each history item the atuin server should store.

*Type:* signed integer

*Default:* `8192`

*Declared by:* [`nixos/modules/services/misc/atuin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/atuin.nix)

## `services.atuin.openFirewall` {#opt-services.atuin.openFirewall}

Open ports in the firewall for the atuin server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/atuin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/atuin.nix)

## `services.atuin.openRegistration` {#opt-services.atuin.openRegistration}

Allow new user registrations with the atuin server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/atuin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/atuin.nix)

## `services.atuin.package` {#opt-services.atuin.package}

The atuin package to use.

*Type:* package

*Default:* `pkgs.atuin`

*Declared by:* [`nixos/modules/services/misc/atuin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/atuin.nix)

## `services.atuin.path` {#opt-services.atuin.path}

A path to prepend to all the routes of the server.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/atuin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/atuin.nix)

## `services.atuin.port` {#opt-services.atuin.port}

The port the atuin server should listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8888`

*Declared by:* [`nixos/modules/services/misc/atuin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/atuin.nix)

## `services.audiobookshelf.dataDir` {#opt-services.audiobookshelf.dataDir}

Path to Audiobookshelf config and metadata inside of /var/lib.

*Type:* string

*Default:* `"audiobookshelf"`

*Declared by:* [`nixos/modules/services/web-apps/audiobookshelf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/audiobookshelf.nix)

## `services.audiobookshelf.enable` {#opt-services.audiobookshelf.enable}

Whether to enable Audiobookshelf, self-hosted audiobook and podcast server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/audiobookshelf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/audiobookshelf.nix)

## `services.audiobookshelf.group` {#opt-services.audiobookshelf.group}

Group under which Audiobookshelf runs.

*Type:* string

*Default:* `"audiobookshelf"`

*Declared by:* [`nixos/modules/services/web-apps/audiobookshelf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/audiobookshelf.nix)

## `services.audiobookshelf.host` {#opt-services.audiobookshelf.host}

The host Audiobookshelf binds to.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/web-apps/audiobookshelf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/audiobookshelf.nix)

## `services.audiobookshelf.openFirewall` {#opt-services.audiobookshelf.openFirewall}

Open ports in the firewall for the Audiobookshelf web interface.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/audiobookshelf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/audiobookshelf.nix)

## `services.audiobookshelf.package` {#opt-services.audiobookshelf.package}

The audiobookshelf package to use.

*Type:* package

*Default:* `pkgs.audiobookshelf`

*Declared by:* [`nixos/modules/services/web-apps/audiobookshelf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/audiobookshelf.nix)

## `services.audiobookshelf.port` {#opt-services.audiobookshelf.port}

The TCP port Audiobookshelf will listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8000`

*Declared by:* [`nixos/modules/services/web-apps/audiobookshelf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/audiobookshelf.nix)

## `services.audiobookshelf.user` {#opt-services.audiobookshelf.user}

User account under which Audiobookshelf runs.

*Type:* string

*Default:* `"audiobookshelf"`

*Declared by:* [`nixos/modules/services/web-apps/audiobookshelf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/audiobookshelf.nix)

## `services.aurral.dataDir` {#opt-services.aurral.dataDir}

The directory where Aurral stores its stateful data.

*Type:* absolute path not in the Nix store

*Default:* `"/var/lib/aurral"`

*Declared by:* [`nixos/modules/services/misc/aurral.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/aurral.nix)

## `services.aurral.directories` {#opt-services.aurral.directories}

Additional directories to expose to Aurral.
The module also exposes the path in `LIBRARY_FOLDER`, falling back to the deprecated `DOWNLOAD_FOLDER`.
See BindPaths in `systemd.exec(5)`.

*Type:* list of absolute path not in the Nix store

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/aurral.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/aurral.nix)

## `services.aurral.enable` {#opt-services.aurral.enable}

Whether to enable Aurral, a self-hosted music discovery, library management, and streaming service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/aurral.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/aurral.nix)

## `services.aurral.environment` {#opt-services.aurral.environment}

Environment variables passed to the service.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  LIBRARY_FOLDER = "/media/music";
  TRUST_PROXY = "true";
}
```

*Declared by:* [`nixos/modules/services/misc/aurral.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/aurral.nix)

## `services.aurral.environmentFile` {#opt-services.aurral.environmentFile}

Environment file as defined in `systemd.exec(5)` passed to the service.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/aurral.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/aurral.nix)

## `services.aurral.group` {#opt-services.aurral.group}

Group under which Aurral runs.

*Type:* string

*Default:* `"aurral"`

*Declared by:* [`nixos/modules/services/misc/aurral.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/aurral.nix)

## `services.aurral.openFirewall` {#opt-services.aurral.openFirewall}

Open ports in the firewall for Aurral.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/aurral.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/aurral.nix)

## `services.aurral.package` {#opt-services.aurral.package}

The aurral package to use.

*Type:* package

*Default:* `pkgs.aurral`

*Declared by:* [`nixos/modules/services/misc/aurral.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/aurral.nix)

## `services.aurral.plugins` {#opt-services.aurral.plugins}

Plugin packages to install alongside plugins from the web interface.
Enable plugins and configure their settings in Aurral. Update or remove
packaged plugins through this option. A packaged plugin takes precedence
over a web-installed copy with the same ID while it is listed here.
Removing a packaged plugin can leave an empty directory under
`plugins/` in the data directory. If Aurral reports a missing
manifest for that plugin, remove the empty directory with `rmdir`.

Each package must provide `passthru.pluginId` matching its manifest ID
and install `manifest.json` and `index.js` at the root of its output.

*Type:* list of package

*Default:* `[ ]`

*Example:* `with pkgs.aurralPlugins; [ lidarr metadata ]`

*Declared by:* [`nixos/modules/services/misc/aurral.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/aurral.nix)

## `services.aurral.port` {#opt-services.aurral.port}

Port number

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3001`

*Declared by:* [`nixos/modules/services/misc/aurral.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/aurral.nix)

## `services.aurral.user` {#opt-services.aurral.user}

User account under which Aurral runs.

*Type:* string

*Default:* `"aurral"`

*Declared by:* [`nixos/modules/services/misc/aurral.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/aurral.nix)

## `services.authelia.instances` {#opt-services.authelia.instances}

Multi-domain protection currently requires multiple instances of Authelia.
If you don't require multiple instances of Authelia you can define just the one.

[https://www.authelia.com/roadmap/active/multi-domain-protection/](https://www.authelia.com/roadmap/active/multi-domain-protection/)

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
''
  {
    main = {
      enable = true;
      secrets.storageEncryptionKeyFile = "/etc/authelia/storageEncryptionKeyFile";
      secrets.jwtSecretFile = "/etc/authelia/jwtSecretFile";
      settings = {
        theme = "light";
        default_2fa_method = "totp";
        log.level = "debug";
        server.disable_healthcheck = true;
      };
    };
    preprod = {
      enable = false;
      secrets.storageEncryptionKeyFile = "/mnt/pre-prod/authelia/storageEncryptionKeyFile";
      secrets.jwtSecretFile = "/mnt/pre-prod/jwtSecretFile";
      settings = {
        theme = "dark";
        default_2fa_method = "webauthn";
        server.host = "0.0.0.0";
      };
    };
    test.enable = true;
    test.secrets.manual = true;
    test.settings.theme = "grey";
    test.settings.server.disable_healthcheck = true;
    test.settingsFiles = [ "/mnt/test/authelia" "/mnt/test-authelia.conf" ];
    };
  }
''
```

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.enable` {#opt-services.authelia.instances._name_.enable}

Whether to enable Authelia instance.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.environmentVariables` {#opt-services.authelia.instances._name_.environmentVariables}

Additional environment variables to provide to authelia.
If you are providing secrets please consider the options under `services.authelia.<instance>.secrets`
or make sure you use the `_FILE` suffix.
If you provide the raw secret rather than the location of a secret file that secret will be preserved in the nix store.
For more details: [https://www.authelia.com/configuration/methods/secrets/](https://www.authelia.com/configuration/methods/secrets/)

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.group` {#opt-services.authelia.instances._name_.group}

The name of the group for this authelia instance.

*Type:* string

*Default:*

``` nix
if name == "" then "authelia" else "authelia-${name}"
```

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.name` {#opt-services.authelia.instances._name_.name}

Name is used as a suffix for the service name, user, and group.
By default it takes the value you use for `<instance>` in:
`services.authelia.instances.<instance>`

When set to the empty string `""`, the service name, user, and group
will be just `authelia` without a suffix.

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.package` {#opt-services.authelia.instances._name_.package}

The authelia package to use.

*Type:* package

*Default:* `pkgs.authelia`

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.secrets` {#opt-services.authelia.instances._name_.secrets}

It is recommended you keep your secrets separate from the configuration.
It's especially important to keep the raw secrets out of your nix configuration,
as the values will be preserved in your nix store.
This attribute allows you to configure the location of secret files to be loaded at runtime.

[https://www.authelia.com/configuration/methods/secrets/](https://www.authelia.com/configuration/methods/secrets/)

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.secrets.jwtSecretFile` {#opt-services.authelia.instances._name_.secrets.jwtSecretFile}

Path to your JWT secret used during identity verificaton.

*Type:* null or absolute path not in the Nix store

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.secrets.manual` {#opt-services.authelia.instances._name_.secrets.manual}

Configuring authelia's secret files via the secrets attribute set
is intended to be convenient and help catch cases where values are required
to run at all.
If a user wants to set these values themselves and bypass the validation they can set this value to true.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.secrets.oidcHmacSecretFile` {#opt-services.authelia.instances._name_.secrets.oidcHmacSecretFile}

Path to your HMAC secret used to sign OIDC JWTs.

*Type:* null or absolute path not in the Nix store

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.secrets.oidcIssuerPrivateKeyFile` {#opt-services.authelia.instances._name_.secrets.oidcIssuerPrivateKeyFile}

Path to your private key file used to encrypt OIDC JWTs.

*Type:* null or absolute path not in the Nix store

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.secrets.sessionSecretFile` {#opt-services.authelia.instances._name_.secrets.sessionSecretFile}

Path to your session secret. Only used when redis is used as session storage.

*Type:* null or absolute path not in the Nix store

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.secrets.storageEncryptionKeyFile` {#opt-services.authelia.instances._name_.secrets.storageEncryptionKeyFile}

Path to your storage encryption key.

*Type:* null or absolute path not in the Nix store

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.settings` {#opt-services.authelia.instances._name_.settings}

Your Authelia config.yml as a Nix attribute set.
There are several values that are defined and documented in nix such as `default_2fa_method`,
but additional items can also be included.

[https://github.com/authelia/authelia/blob/master/config.template.yml](https://github.com/authelia/authelia/blob/master/config.template.yml)

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Example:*

``` nix
''
  {
    theme = "light";
    default_2fa_method = "totp";
    log.level = "debug";
    server.disable_healthcheck = true;
  }
''
```

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.settings.default_2fa_method` {#opt-services.authelia.instances._name_.settings.default_2fa_method}

Default 2FA method for new users and fallback for preferred but disabled methods.

*Type:* one of "", "totp", "webauthn", "mobile\_push"

*Default:* `""`

*Example:* `"webauthn"`

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.settings.log.file_path` {#opt-services.authelia.instances._name_.settings.log.file_path}

File path where the logs will be written. If not set logs are written to stdout.

*Type:* null or absolute path not in the Nix store

*Default:* `null`

*Example:* `"/var/log/authelia/authelia.log"`

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.settings.log.format` {#opt-services.authelia.instances._name_.settings.log.format}

Format the logs are written as.

*Type:* one of "json", "text"

*Default:* `"json"`

*Example:* `"text"`

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.settings.log.keep_stdout` {#opt-services.authelia.instances._name_.settings.log.keep_stdout}

Whether to also log to stdout when a `file_path` is defined.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.settings.log.level` {#opt-services.authelia.instances._name_.settings.log.level}

Level of verbosity for logs.

*Type:* one of "trace", "debug", "info", "warn", "error"

*Default:* `"debug"`

*Example:* `"info"`

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.settings.server.address` {#opt-services.authelia.instances._name_.settings.server.address}

The address to listen on.

*Type:* string

*Default:* `"tcp://:9091/"`

*Example:* `"unix:///var/run/authelia.sock?path=authelia&umask=0117"`

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.settings.telemetry.metrics.address` {#opt-services.authelia.instances._name_.settings.telemetry.metrics.address}

The address to listen on for metrics. This should be on a different port to the main `server.port` value.

*Type:* string

*Default:* `"tcp://127.0.0.1:9959"`

*Example:* `"tcp://0.0.0.0:8888"`

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.settings.telemetry.metrics.enabled` {#opt-services.authelia.instances._name_.settings.telemetry.metrics.enabled}

Enable Metrics.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.settings.theme` {#opt-services.authelia.instances._name_.settings.theme}

The theme to display.

*Type:* one of "light", "dark", "grey", "auto"

*Default:* `"light"`

*Example:* `"dark"`

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.settingsFiles` {#opt-services.authelia.instances._name_.settingsFiles}

Here you can provide authelia with configuration files or directories.
It is possible to give authelia multiple files and use the nix generated configuration
file set via `services.authelia.<instance>.settings`.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/etc/authelia/config.yml"
  "/etc/authelia/access-control.yml"
  "/etc/authelia/config/"
]
```

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.authelia.instances.<name>.user` {#opt-services.authelia.instances._name_.user}

The name of the user for this authelia instance.

*Type:* string

*Default:*

``` nix
if name == "" then "authelia" else "authelia-${name}"
```

*Declared by:* [`nixos/modules/services/security/authelia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/authelia.nix)

## `services.auto-cpufreq.enable` {#opt-services.auto-cpufreq.enable}

Whether to enable auto-cpufreq daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/auto-cpufreq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/auto-cpufreq.nix)

## `services.auto-cpufreq.settings` {#opt-services.auto-cpufreq.settings}

Configuration for `auto-cpufreq`.

The available options can be found in [the example configuration file](https://github.com/AdnanHodzic/auto-cpufreq/blob/v3.1.0/auto-cpufreq.conf-example).

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  battery = {
    governor = "powersave";
    turbo = "never";
  };
  charger = {
    governor = "performance";
    turbo = "auto";
  };
}
```

*Declared by:* [`nixos/modules/services/hardware/auto-cpufreq.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/auto-cpufreq.nix)

## `services.auto-epp.enable` {#opt-services.auto-epp.enable}

Whether to enable auto-epp for amd active pstate.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/auto-epp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/auto-epp.nix)

## `services.auto-epp.package` {#opt-services.auto-epp.package}

The auto-epp package to use.

*Type:* package

*Default:* `pkgs.auto-epp`

*Declared by:* [`nixos/modules/services/hardware/auto-epp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/auto-epp.nix)

## `services.auto-epp.settings` {#opt-services.auto-epp.settings}

Settings for the auto-epp application.
See upstream example: [https://github.com/jothi-prasath/auto-epp/blob/master/sample-auto-epp.conf](https://github.com/jothi-prasath/auto-epp/blob/master/sample-auto-epp.conf)

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/hardware/auto-epp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/auto-epp.nix)

## `services.auto-epp.settings.Settings.epp_state_for_AC` {#opt-services.auto-epp.settings.Settings.epp_state_for_AC}

energy\_performance\_preference when on plugged in

::: note
See available epp states by running:
`cat /sys/devices/system/cpu/cpu0/cpufreq/energy_performance_available_preferences`
:::

*Type:* string

*Default:* `"balance_performance"`

*Declared by:* [`nixos/modules/services/hardware/auto-epp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/auto-epp.nix)

## `services.auto-epp.settings.Settings.epp_state_for_BAT` {#opt-services.auto-epp.settings.Settings.epp_state_for_BAT}

`energy_performance_preference` when on battery

::: note
See available epp states by running:
`cat /sys/devices/system/cpu/cpu0/cpufreq/energy_performance_available_preferences`
:::

*Type:* string

*Default:* `"power"`

*Declared by:* [`nixos/modules/services/hardware/auto-epp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/auto-epp.nix)

## `services.autobrr.enable` {#opt-services.autobrr.enable}

Whether to enable Autobrr.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/autobrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autobrr.nix)

## `services.autobrr.openFirewall` {#opt-services.autobrr.openFirewall}

Open ports in the firewall for the Autobrr web interface.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/autobrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autobrr.nix)

## `services.autobrr.package` {#opt-services.autobrr.package}

The autobrr package to use.

*Type:* package

*Default:* `pkgs.autobrr`

*Declared by:* [`nixos/modules/services/misc/autobrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autobrr.nix)

## `services.autobrr.settings` {#opt-services.autobrr.settings}

Autobrr configuration options.

Refer to [https://autobrr.com/configuration/autobrr](https://autobrr.com/configuration/autobrr)
for a full list.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Example:*

``` nix
{
  logLevel = "DEBUG";
  port = 7654;
}
```

*Declared by:* [`nixos/modules/services/misc/autobrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autobrr.nix)

## `services.autobrr.settings.checkForUpdates` {#opt-services.autobrr.settings.checkForUpdates}

Whether autobrr needs to check for updates.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/autobrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autobrr.nix)

## `services.autobrr.settings.host` {#opt-services.autobrr.settings.host}

The host address autobrr listens on.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/misc/autobrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autobrr.nix)

## `services.autobrr.settings.port` {#opt-services.autobrr.settings.port}

The port autobrr listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `7474`

*Declared by:* [`nixos/modules/services/misc/autobrr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autobrr.nix)

## `services.autofs.autoMaster` {#opt-services.autofs.autoMaster}

Contents of `/etc/auto.master` file. See `auto.master(5)` and `autofs(5)`.

*Type:* string

*Example:*

``` nix
let
  mapConf = pkgs.writeText "auto" ''
   kernel    -ro,soft,intr       ftp.kernel.org:/pub/linux
   boot      -fstype=ext2        :/dev/hda1
   windoze   -fstype=smbfs       ://windoze/c
   removable -fstype=ext2        :/dev/hdd
   cd        -fstype=iso9660,ro  :/dev/hdc
   floppy    -fstype=auto        :/dev/fd0
   server    -rw,hard,intr       / -ro myserver.me.org:/ \
                                 /usr myserver.me.org:/usr \
                                 /home myserver.me.org:/home
  '';
in ''
  /auto file:${mapConf}
''
```

*Declared by:* [`nixos/modules/services/misc/autofs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autofs.nix)

## `services.autofs.debug` {#opt-services.autofs.debug}

Pass -d and -7 to automount and write log to the system journal.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/autofs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autofs.nix)

## `services.autofs.enable` {#opt-services.autofs.enable}

Mount filesystems on demand. Unmount them automatically.
You may also be interested in afuse.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/autofs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autofs.nix)

## `services.autofs.timeout` {#opt-services.autofs.timeout}

Set the global minimum timeout, in seconds, until directories are unmounted

*Type:* signed integer

*Default:* `600`

*Declared by:* [`nixos/modules/services/misc/autofs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autofs.nix)

## `services.automatic-timezoned.enable` {#opt-services.automatic-timezoned.enable}

Enable `automatic-timezoned`, simple daemon for keeping the system
timezone up-to-date based on the current location. It uses geoclue2 to
determine the current location and systemd-timedated to actually set
the timezone.

To avoid silent overriding by the service, if you have explicitly set a
timezone, either remove it or ensure that it is set with a lower priority
than the default value using `lib.mkDefault` or `lib.mkOverride`. This is
to make the choice deliberate. An error will be presented otherwise.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/system/automatic-timezoned.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/automatic-timezoned.nix)

## `services.automatic-timezoned.package` {#opt-services.automatic-timezoned.package}

The automatic-timezoned package to use.

*Type:* package

*Default:* `pkgs.automatic-timezoned`

*Declared by:* [`nixos/modules/services/system/automatic-timezoned.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/automatic-timezoned.nix)

## `services.automx2.domain` {#opt-services.automx2.domain}

E-Mail-Domain for which mail client autoconfig/autoconfigure should be set up.
The `autoconfig` and `autodiscover` subdomains are automatically prepended and set up with ACME.
The names of those domains are hardcoded in the mail clients and are not configurable.

*Type:* string

*Example:* `"example.com"`

*Declared by:* [`nixos/modules/services/mail/automx2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/automx2.nix)

## `services.automx2.enable` {#opt-services.automx2.enable}

Whether to enable automx2.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/automx2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/automx2.nix)

## `services.automx2.package` {#opt-services.automx2.package}

The automx2 package to use.

*Type:* package

*Default:* `pkgs.python3Packages.automx2`

*Declared by:* [`nixos/modules/services/mail/automx2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/automx2.nix)

## `services.automx2.port` {#opt-services.automx2.port}

Port used by automx2.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4243`

*Declared by:* [`nixos/modules/services/mail/automx2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/automx2.nix)

## `services.automx2.settings` {#opt-services.automx2.settings}

Bootstrap json to populate database.
See [docs](https://rseichter.github.io/automx2/#_sqlite) for details.

*Type:* JSON value

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/automx2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/automx2.nix)

## `services.automysqlbackup.calendar` {#opt-services.automysqlbackup.calendar}

Configured when to run the backup service systemd unit (DayOfWeek Year-Month-Day Hour:Minute:Second).

*Type:* string

*Default:* `"01:15:00"`

*Declared by:* [`nixos/modules/services/backup/automysqlbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/automysqlbackup.nix)

## `services.automysqlbackup.enable` {#opt-services.automysqlbackup.enable}

Whether to enable AutoMySQLBackup.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/automysqlbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/automysqlbackup.nix)

## `services.automysqlbackup.settings` {#opt-services.automysqlbackup.settings}

automysqlbackup configuration. Refer to
`${pkgs.automysqlbackup}/etc/automysqlbackup.conf`
for details on supported values.

*Type:* attribute set of (string or signed integer or boolean or list of string)

*Default:* `{ }`

*Example:*

``` nix
{
  db_names = [ "nextcloud" "matomo" ];
  table_exclude = [ "nextcloud.oc_users" "nextcloud.oc_whats_new" ];
  mailcontent = "log";
  mail_address = "admin@example.org";
}
```

*Declared by:* [`nixos/modules/services/backup/automysqlbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/automysqlbackup.nix)

## `services.autorandr.defaultTarget` {#opt-services.autorandr.defaultTarget}

Fallback if no monitor layout can be detected. See the docs
(https://github.com/phillipberndt/autorandr/blob/v1.0/README.md#how-to-use)
for further reference.

*Type:* string

*Default:* `"default"`

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.enable` {#opt-services.autorandr.enable}

Whether to enable handling of hotplug and sleep events by autorandr.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.hooks` {#opt-services.autorandr.hooks}

Global hook scripts

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
{
  postswitch = {
    "notify-i3" = "${pkgs.i3}/bin/i3-msg restart";
    "change-background" = readFile ./change-background.sh;
    "change-dpi" = ''
      case "$AUTORANDR_CURRENT_PROFILE" in
        default)
          DPI=120
          ;;
        home)
          DPI=192
          ;;
        work)
          DPI=144
          ;;
        *)
          echo "Unknown profle: $AUTORANDR_CURRENT_PROFILE"
          exit 1
      esac
      echo "Xft.dpi: $DPI" | ${pkgs.xrdb}/bin/xrdb -merge
    '';
  };
}
```

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.hooks.postswitch` {#opt-services.autorandr.hooks.postswitch}

Postswitch hook executed after mode switch.

*Type:* attribute set of strings concatenated with "\\n"

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.hooks.predetect` {#opt-services.autorandr.hooks.predetect}

Predetect hook executed before autorandr attempts to run xrandr.

*Type:* attribute set of strings concatenated with "\\n"

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.hooks.preswitch` {#opt-services.autorandr.hooks.preswitch}

Preswitch hook executed before mode switch.

*Type:* attribute set of strings concatenated with "\\n"

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.ignoreLid` {#opt-services.autorandr.ignoreLid}

Treat outputs as connected even if their lids are closed

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.matchEdid` {#opt-services.autorandr.matchEdid}

Match displays based on edid instead of name

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.profiles` {#opt-services.autorandr.profiles}

Autorandr profiles specification.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "work" = {
    fingerprint = {
      eDP1 = "<EDID>";
      DP1 = "<EDID>";
    };
    config = {
      eDP1.enable = false;
      DP1 = {
        enable = true;
        crtc = 0;
        primary = true;
        position = "0x0";
        mode = "3840x2160";
        gamma = "1.0:0.909:0.833";
        rate = "60.00";
        rotate = "left";
      };
    };
    hooks.postswitch = readFile ./work-postswitch.sh;
  };
}
```

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.profiles.<name>.config` {#opt-services.autorandr.profiles._name_.config}

Per output profile configuration.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.profiles.<name>.config.<name>.crtc` {#opt-services.autorandr.profiles._name_.config._name_.crtc}

Output video display controller.

*Type:* null or (unsigned integer, meaning \>=0)

*Default:* `null`

*Example:* `0`

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.profiles.<name>.config.<name>.dpi` {#opt-services.autorandr.profiles._name_.config._name_.dpi}

Output DPI configuration.

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Example:* `96`

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.profiles.<name>.config.<name>.enable` {#opt-services.autorandr.profiles._name_.config._name_.enable}

Whether to enable the output.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.profiles.<name>.config.<name>.gamma` {#opt-services.autorandr.profiles._name_.config._name_.gamma}

Output gamma configuration.

*Type:* string

*Default:* `""`

*Example:* `"1.0:0.909:0.833"`

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.profiles.<name>.config.<name>.mode` {#opt-services.autorandr.profiles._name_.config._name_.mode}

Output resolution.

*Type:* string

*Default:* `""`

*Example:* `"3840x2160"`

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.profiles.<name>.config.<name>.position` {#opt-services.autorandr.profiles._name_.config._name_.position}

Output position

*Type:* string

*Default:* `""`

*Example:* `"5760x0"`

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.profiles.<name>.config.<name>.primary` {#opt-services.autorandr.profiles._name_.config._name_.primary}

Whether output should be marked as primary

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.profiles.<name>.config.<name>.rate` {#opt-services.autorandr.profiles._name_.config._name_.rate}

Output framerate.

*Type:* string

*Default:* `""`

*Example:* `"60.00"`

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.profiles.<name>.config.<name>.rotate` {#opt-services.autorandr.profiles._name_.config._name_.rotate}

Output rotate configuration.

*Type:* null or one of "normal", "left", "right", "inverted"

*Default:* `null`

*Example:* `"left"`

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.profiles.<name>.config.<name>.scale` {#opt-services.autorandr.profiles._name_.config._name_.scale}

Output scale configuration.

Either configure by pixels or a scaling factor. When using pixel method the
`xrandr(1)`
option
`--scale-from`
will be used; when using factor method the option
`--scale`
will be used.

This option is a shortcut version of the transform option and they are mutually
exclusive.

*Type:* null or (submodule)

*Default:* `null`

*Example:*

``` nix
{
  x = 1.25;
  y = 1.25;
}
```

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.profiles.<name>.config.<name>.scale.method` {#opt-services.autorandr.profiles._name_.config._name_.scale.method}

Output scaling method.

*Type:* one of "factor", "pixel"

*Default:* `"factor"`

*Example:* `"pixel"`

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.profiles.<name>.config.<name>.scale.x` {#opt-services.autorandr.profiles._name_.config._name_.scale.x}

Horizontal scaling factor/pixels.

*Type:* floating point number or (positive integer, meaning \>0)

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.profiles.<name>.config.<name>.scale.y` {#opt-services.autorandr.profiles._name_.config._name_.scale.y}

Vertical scaling factor/pixels.

*Type:* floating point number or (positive integer, meaning \>0)

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.profiles.<name>.config.<name>.transform` {#opt-services.autorandr.profiles._name_.config._name_.transform}

Refer to
`xrandr(1)`
for the documentation of the transform matrix.

*Type:* null or (3×3 matrix of floating point numbers)

*Default:* `null`

*Example:*

``` nix
[
  [ 0.6 0.0 0.0 ]
  [ 0.0 0.6 0.0 ]
  [ 0.0 0.0 1.0 ]
]
```

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.profiles.<name>.fingerprint` {#opt-services.autorandr.profiles._name_.fingerprint}

Output name to EDID mapping.
Use `autorandr --fingerprint` to get current setup values.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.profiles.<name>.hooks` {#opt-services.autorandr.profiles._name_.hooks}

Profile hook scripts.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.profiles.<name>.hooks.postswitch` {#opt-services.autorandr.profiles._name_.hooks.postswitch}

Postswitch hook executed after mode switch.

*Type:* attribute set of strings concatenated with "\\n"

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.profiles.<name>.hooks.predetect` {#opt-services.autorandr.profiles._name_.hooks.predetect}

Predetect hook executed before autorandr attempts to run xrandr.

*Type:* attribute set of strings concatenated with "\\n"

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autorandr.profiles.<name>.hooks.preswitch` {#opt-services.autorandr.profiles._name_.hooks.preswitch}

Preswitch hook executed before mode switch.

*Type:* attribute set of strings concatenated with "\\n"

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autorandr.nix)

## `services.autossh-ng.sessions` {#opt-services.autossh-ng.sessions}

Set of SSH sessions to start as systemd services. Each service is
named 'autossh-ng-{session.name}'.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  socket-peer = {
    destination = "billremote@socks.host.net";
    extraArguments = "-L2222:localhost:22 -i \${config.age.secrets.privatekey.path}";
    user = "bill";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/autossh-ng.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/autossh-ng.nix)

## `services.autossh-ng.sessions.<name>.destination` {#opt-services.autossh-ng.sessions._name_.destination}

Destination to connect to

*Type:* string

*Example:* `"billremote@socks.host.net"`

*Declared by:* [`nixos/modules/services/networking/autossh-ng.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/autossh-ng.nix)

## `services.autossh-ng.sessions.<name>.extraArguments` {#opt-services.autossh-ng.sessions._name_.extraArguments}

Arguments to be passed to the ssh process process.
Some meaningful options include
-D (open SOCKS proxy on local port),
-R (forward remote port),
-L (forward local port),
-v (Enable debug),
-i (identity file to use).
Check ssh manual for the complete list.

*Type:* strings concatenated with " "

*Example:* `"-L2222:localhost:22 -i \${config.age.secrets.privatekey.path}"`

*Declared by:* [`nixos/modules/services/networking/autossh-ng.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/autossh-ng.nix)

## `services.autossh-ng.sessions.<name>.hostKeyChecking` {#opt-services.autossh-ng.sessions._name_.hostKeyChecking}

Whether to enable host key checking. The advantage of enabling
host key checking is that it protects against AitM attacks, on
the other hand disabling host key checking makes the autossh
connection resilient against host key rotations of the destination
machine.

*Type:* boolean

*Declared by:* [`nixos/modules/services/networking/autossh-ng.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/autossh-ng.nix)

## `services.autossh-ng.sessions.<name>.knownHostsFile` {#opt-services.autossh-ng.sessions._name_.knownHostsFile}

If you enabled host key checking, use this file to verify
destination host keys against.

*Type:* absolute path

*Example:* `"/home/bill/.ssh/known_hosts"`

*Declared by:* [`nixos/modules/services/networking/autossh-ng.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/autossh-ng.nix)

## `services.autossh-ng.sessions.<name>.user` {#opt-services.autossh-ng.sessions._name_.user}

Name of the user the local session should run as

*Type:* string

*Example:* `"bill"`

*Declared by:* [`nixos/modules/services/networking/autossh-ng.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/autossh-ng.nix)

## `services.autossh.sessions` {#opt-services.autossh.sessions}

List of AutoSSH sessions to start as systemd services. Each service is
named 'autossh-{session.name}'.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    extraArguments = "-N -D4343 billremote@socks.host.net";
    monitoringPort = 20000;
    name = "socks-peer";
    user = "bill";
  }
]
```

*Declared by:* [`nixos/modules/services/networking/autossh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/autossh.nix)

## `services.autossh.sessions.*.extraArguments` {#opt-services.autossh.sessions._.extraArguments}

Arguments to be passed to AutoSSH and retransmitted to SSH
process. Some meaningful options include -N (don't run remote
command), -D (open SOCKS proxy on local port), -R (forward
remote port), -L (forward local port), -v (Enable debug). Check
ssh manual for the complete list.

*Type:* strings concatenated with " "

*Example:* `"-N -D4343 bill@socks.example.net"`

*Declared by:* [`nixos/modules/services/networking/autossh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/autossh.nix)

## `services.autossh.sessions.*.monitoringPort` {#opt-services.autossh.sessions._.monitoringPort}

Port to be used by AutoSSH for peer monitoring. Note, that
AutoSSH also uses mport+1. Value of 0 disables the keep-alive
style monitoring

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `0`

*Example:* `20000`

*Declared by:* [`nixos/modules/services/networking/autossh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/autossh.nix)

## `services.autossh.sessions.*.name` {#opt-services.autossh.sessions._.name}

Name of the local AutoSSH session

*Type:* string

*Example:* `"socks-peer"`

*Declared by:* [`nixos/modules/services/networking/autossh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/autossh.nix)

## `services.autossh.sessions.*.user` {#opt-services.autossh.sessions._.user}

Name of the user the AutoSSH session should run as

*Type:* string

*Example:* `"bill"`

*Declared by:* [`nixos/modules/services/networking/autossh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/autossh.nix)

## `services.autosuspend.checks` {#opt-services.autosuspend.checks}

Checks for activity.  For more information, see:

- [https://autosuspend.readthedocs.io/en/latest/configuration\_file.html#activity-check-configuration](https://autosuspend.readthedocs.io/en/latest/configuration_file.html#activity-check-configuration)
- [https://autosuspend.readthedocs.io/en/latest/available\_checks.html](https://autosuspend.readthedocs.io/en/latest/available_checks.html)

*Type:* attribute set of (open submodule of section of an INI file (attrs of INI atom (null, bool, int, float or string)))

*Default:* `{ }`

*Example:*

``` nix
{
  # Basic activity check configuration.
  # The check class name is derived from the section header (Ping in this case).
  # Remember to enable desired checks. They are disabled by default.
  Ping = {
    hosts = "192.168.0.7";
  };

  # This check is disabled.
  Smb.enabled = false;

  # Example for a custom check name.
  # This will use the Users check with the custom name RemoteUsers.
  # Custom names are necessary in case a check class is used multiple times.
  # Custom names can also be used for clarification.
  RemoteUsers = {
    class = "Users";
    name = ".*";
    terminal = ".*";
    host = "[0-9].*";
  };

  # Here the Users activity check is used again with different settings and a different name
  LocalUsers = {
    class = "Users";
    name = ".*";
    terminal = ".*";
    host = "localhost";
  };
}
```

*Declared by:* [`nixos/modules/services/misc/autosuspend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autosuspend.nix)

## `services.autosuspend.checks.<name>.class` {#opt-services.autosuspend.checks._name_.class}

Name of the class implementing the check.  If this option is not specified, the check's
name must represent a valid internal check class.

*Type:* null or one of "ActiveCalendarEvent", "ActiveConnection", "ExternalCommand", "JsonPath", "Kodi", "KodiIdleTime", "LastLogActivity", "Load", "LogindSessionsIdle", "Mpd", "NetworkBandwidth", "Ping", "Processes", "Smb", "Users", "XIdleTime", "XPath"

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/autosuspend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autosuspend.nix)

## `services.autosuspend.checks.<name>.enabled` {#opt-services.autosuspend.checks._name_.enabled}

Whether to enable this activity check.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/autosuspend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autosuspend.nix)

## `services.autosuspend.enable` {#opt-services.autosuspend.enable}

Whether to enable the autosuspend daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/autosuspend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autosuspend.nix)

## `services.autosuspend.package` {#opt-services.autosuspend.package}

The autosuspend package to use.

*Type:* package

*Default:* `pkgs.autosuspend`

*Declared by:* [`nixos/modules/services/misc/autosuspend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autosuspend.nix)

## `services.autosuspend.settings` {#opt-services.autosuspend.settings}

Configuration for autosuspend, see
[https://autosuspend.readthedocs.io/en/latest/configuration\_file.html#general-configuration](https://autosuspend.readthedocs.io/en/latest/configuration_file.html#general-configuration)
for supported values.

*Type:* open submodule of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  enable = true;
  interval = 30;
  idle_time = 120;
}
```

*Declared by:* [`nixos/modules/services/misc/autosuspend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autosuspend.nix)

## `services.autosuspend.settings.suspend_cmd` {#opt-services.autosuspend.settings.suspend_cmd}

The command to execute in case the host shall be suspended. This line can contain
additional command line arguments to the command to execute.

*Type:* string

*Default:* `"systemctl suspend"`

*Declared by:* [`nixos/modules/services/misc/autosuspend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autosuspend.nix)

## `services.autosuspend.settings.wakeup_cmd` {#opt-services.autosuspend.settings.wakeup_cmd}

The command to execute for scheduling a wake up of the system. The given string is
processed using Python’s `str.format()` and a format argument called `timestamp`
encodes the UTC timestamp of the planned wake up time (float). Additionally `iso`
can be used to acquire the timestamp in ISO 8601 format.

*Type:* string

*Default:* `"sh -c 'echo 0 > /sys/class/rtc/rtc0/wakealarm && echo {timestamp:.0f} > /sys/class/rtc/rtc0/wakealarm' "`

*Declared by:* [`nixos/modules/services/misc/autosuspend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autosuspend.nix)

## `services.autosuspend.wakeups` {#opt-services.autosuspend.wakeups}

Checks for wake up.  For more information, see:

- [https://autosuspend.readthedocs.io/en/latest/configuration\_file.html#wake-up-check-configuration](https://autosuspend.readthedocs.io/en/latest/configuration_file.html#wake-up-check-configuration)
- [https://autosuspend.readthedocs.io/en/latest/available\_wakeups.html](https://autosuspend.readthedocs.io/en/latest/available_wakeups.html)

*Type:* attribute set of (open submodule of section of an INI file (attrs of INI atom (null, bool, int, float or string)))

*Default:* `{ }`

*Example:*

``` nix
{
  # Wake up checks reuse the same configuration mechanism as activity checks.
  Calendar = {
    url = "http://example.org/test.ics";
  };
}
```

*Declared by:* [`nixos/modules/services/misc/autosuspend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autosuspend.nix)

## `services.autosuspend.wakeups.<name>.class` {#opt-services.autosuspend.wakeups._name_.class}

Name of the class implementing the check.  If this option is not specified, the check's
name must represent a valid internal check class.

*Type:* null or one of "Calendar", "Command", "File", "Periodic", "SystemdTimer", "XPath", "XPathDelta"

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/autosuspend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autosuspend.nix)

## `services.autosuspend.wakeups.<name>.enabled` {#opt-services.autosuspend.wakeups._name_.enabled}

Whether to enable this wake-up check.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/autosuspend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/autosuspend.nix)

## `services.autotierfs.enable` {#opt-services.autotierfs.enable}

Whether to enable the autotier passthrough tiering filesystem.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/autotierfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/autotierfs.nix)

## `services.autotierfs.package` {#opt-services.autotierfs.package}

The autotier package to use.

*Type:* package

*Default:* `pkgs.autotier`

*Declared by:* [`nixos/modules/services/autotierfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/autotierfs.nix)

## `services.autotierfs.settings` {#opt-services.autotierfs.settings}

The contents of the configuration file for autotier.
See the [autotier repo](https://github.com/45Drives/autotier#configuration) for supported values.

*Type:* open submodule of attribute set of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  "/mnt/autotier" = {
    Global = {
      "Log Level" = 1;
      "Tier Period" = 1000;
      "Copy Buffer Size" = "1 MiB";
    };
    "Tier 1" = {
      Path = "/mnt/tier1";
      Quota = "30GiB";
    };
    "Tier 2" = {
      Path = "/mnt/tier2";
      Quota = "200GiB";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/autotierfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/autotierfs.nix)

## `services.avahi.debug` {#opt-services.avahi.debug}

Whether to enable debug logging.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.enable` {#opt-services.avahi.enable}

Whether to run the Avahi daemon, which allows Avahi clients
to use Avahi's service discovery facilities and also allows
the local machine to advertise its presence and services
(through the mDNS responder implemented by `avahi-daemon`).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.extraConfig` {#opt-services.avahi.extraConfig}

Extra config to append to avahi-daemon.conf.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.extraServiceFiles` {#opt-services.avahi.extraServiceFiles}

Specify custom service definitions which are placed in the avahi service directory.
See the `avahi.service(5)` manpage for detailed information.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Example:*

``` nix
{
  ssh = "${pkgs.avahi}/etc/avahi/services/ssh.service";
  smb = ''
    <?xml version="1.0" standalone='no'?><!--*-nxml-*-->
    <!DOCTYPE service-group SYSTEM "avahi-service.dtd">
    <service-group>
      <name replace-wildcards="yes">%h</name>
      <service>
        <type>_smb._tcp</type>
        <port>445</port>
      </service>
    </service-group>
  '';
}
```

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.nssmdns4` {#opt-services.avahi.nssmdns4}

Whether to enable the mDNS NSS (Name Service Switch) plug-in for IPv4.
Enabling it allows applications to resolve names in the `.local`
domain by transparently querying the Avahi daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.nssmdns6` {#opt-services.avahi.nssmdns6}

Whether to enable the mDNS NSS (Name Service Switch) plug-in for IPv6.
Enabling it allows applications to resolve names in the `.local`
domain by transparently querying the Avahi daemon.

::: note
Due to the fact that most mDNS responders only register local IPv4 addresses,
most user want to leave this option disabled to avoid long timeouts when applications first resolve the none existing IPv6 address.
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.nssmdnsFull` {#opt-services.avahi.nssmdnsFull}

Whether to enable the full mDNS NSS (Name Service Switch) plug-in.

By default, only the minimal module is enabled. The minimal module
will only resolve `.local` domains and only perform reverse hostname
lookups for `169.254.0.0/16`. The full module will use mDNS to resolve any
domain allowed by [`/etc/mdns.allow`](https://github.com/avahi/nss-mdns/tree/master#etcmdnsallow) and will perform reverse hostname
lookups for any IP address.

::: note
Enabling this option will introduce a 5 second delay to failed reverse
hostname lookups. For example, this will often add a 5 second delay to
ping.
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.openFirewall` {#opt-services.avahi.openFirewall}

Whether to open the firewall for UDP port 5353.
Disabling this setting also disables discovering of network devices.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.package` {#opt-services.avahi.package}

The avahi package to use.

*Type:* package

*Default:* `pkgs.avahi`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.settings` {#opt-services.avahi.settings}

Configuration for `avahi-daemon.conf` as a Nix attribute set.
See `avahi-daemon.conf(5)` for available options.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string) or a non-empty list of them)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.settings.publish.disable-publishing` {#opt-services.avahi.settings.publish.disable-publishing}

Whether to disable publishing in general.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.settings.publish.disable-user-service-publishing` {#opt-services.avahi.settings.publish.disable-user-service-publishing}

Whether to disable publishing user services.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.settings.publish.publish-addresses` {#opt-services.avahi.settings.publish.publish-addresses}

Whether to register mDNS address records for all local IP addresses.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.settings.publish.publish-domain` {#opt-services.avahi.settings.publish.publish-domain}

Whether to announce the locally used domain name for browsing by other hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.settings.publish.publish-hinfo` {#opt-services.avahi.settings.publish.publish-hinfo}

Whether to register a mDNS HINFO record which contains
information about the local operating system and CPU.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.settings.publish.publish-workstation` {#opt-services.avahi.settings.publish.publish-workstation}

Whether to register a service of type "\_workstation.\_tcp" on the
local LAN.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.settings.reflector.enable-reflector` {#opt-services.avahi.settings.reflector.enable-reflector}

Reflect incoming mDNS requests to all allowed network interfaces.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.settings.server.allow-interfaces` {#opt-services.avahi.settings.server.allow-interfaces}

List of network interfaces that should be used by the `avahi-daemon`.
Other interfaces will be ignored. If `null`, all local interfaces
except loopback and point-to-point will be used.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.settings.server.allow-point-to-point` {#opt-services.avahi.settings.server.allow-point-to-point}

Whether to use POINTTOPOINT interfaces. Might make mDNS
unreliable due to usually large latencies with such links and
opens a potential security hole by allowing mDNS access from
Internet connections.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.settings.server.browse-domains` {#opt-services.avahi.settings.server.browse-domains}

List of non-local DNS domains to be browsed.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.settings.server.cache-entries-max` {#opt-services.avahi.settings.server.cache-entries-max}

Number of resource records to be cached per interface. Use 0 to
disable caching. Avahi daemon defaults to 4096 if not set.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.settings.server.deny-interfaces` {#opt-services.avahi.settings.server.deny-interfaces}

List of network interfaces that should be ignored by the
`avahi-daemon`. Other unspecified interfaces will be
used, unless `allow-interfaces` is set. This option takes
precedence over `allow-interfaces`.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.settings.server.domain-name` {#opt-services.avahi.settings.server.domain-name}

Domain name for all advertisements.

*Type:* null or string

*Default:* `"local"`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.settings.server.host-name` {#opt-services.avahi.settings.server.host-name}

Host name advertised on the LAN. If unset, Avahi will use the
system host name.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.settings.server.use-ipv4` {#opt-services.avahi.settings.server.use-ipv4}

Whether to use IPv4.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.settings.server.use-ipv6` {#opt-services.avahi.settings.server.use-ipv6}

Whether to use IPv6.

*Type:* boolean

*Default:* `config.networking.enableIPv6`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.avahi.wideArea` {#opt-services.avahi.wideArea}

Whether to enable wide-area service discovery.

It is recommended to keep this options disabled as it exposes the system to `CVE-2024-52615`/`GHSA-x6vp-f33h-h32g`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/avahi-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/avahi-daemon.nix)

## `services.awstats.configs` {#opt-services.awstats.configs}

Attribute set of domains to collect stats for.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "mysite" = {
    domain = "example.com";
    logFile = "/var/log/nginx/access.log";
  };
}
```

*Declared by:* [`nixos/modules/services/logging/awstats.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/awstats.nix)

## `services.awstats.configs.<name>.domain` {#opt-services.awstats.configs._name_.domain}

The domain name to collect stats for.

*Type:* string

*Default:* `"‹name›"`

*Example:* `"example.com"`

*Declared by:* [`nixos/modules/services/logging/awstats.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/awstats.nix)

## `services.awstats.configs.<name>.extraConfig` {#opt-services.awstats.configs._name_.extraConfig}

Extra configuration to be appended to awstats.${name}.conf.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  "ValidHTTPCodes" = "404";
}
```

*Declared by:* [`nixos/modules/services/logging/awstats.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/awstats.nix)

## `services.awstats.configs.<name>.hostAliases` {#opt-services.awstats.configs._name_.hostAliases}

List of aliases the site has.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "www.example.org"
]
```

*Declared by:* [`nixos/modules/services/logging/awstats.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/awstats.nix)

## `services.awstats.configs.<name>.logFile` {#opt-services.awstats.configs._name_.logFile}

The log file to be scanned.

For mail, set this to

```
journalctl $OLD_CURSOR -u postfix.service | ${pkgs.perl}/bin/perl ${pkgs.awstats.out}/share/awstats/tools/maillogconvert.pl standard |
```

*Type:* string

*Example:* `"/var/log/nginx/access.log"`

*Declared by:* [`nixos/modules/services/logging/awstats.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/awstats.nix)

## `services.awstats.configs.<name>.logFormat` {#opt-services.awstats.configs._name_.logFormat}

The log format being used.

For mail, set this to

```
%time2 %email %email_r %host %host_r %method %url %code %bytesd
```

*Type:* string

*Default:* `"1"`

*Declared by:* [`nixos/modules/services/logging/awstats.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/awstats.nix)

## `services.awstats.configs.<name>.type` {#opt-services.awstats.configs._name_.type}

The type of log being collected.

*Type:* one of "mail", "web"

*Default:* `"web"`

*Example:* `"mail"`

*Declared by:* [`nixos/modules/services/logging/awstats.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/awstats.nix)

## `services.awstats.configs.<name>.webService.enable` {#opt-services.awstats.configs._name_.webService.enable}

Whether to enable awstats web service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/logging/awstats.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/awstats.nix)

## `services.awstats.configs.<name>.webService.hostname` {#opt-services.awstats.configs._name_.webService.hostname}

The hostname the web service appears under.

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/logging/awstats.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/awstats.nix)

## `services.awstats.configs.<name>.webService.urlPrefix` {#opt-services.awstats.configs._name_.webService.urlPrefix}

The URL prefix under which the awstats pages appear.

*Type:* string

*Default:* `"/awstats"`

*Declared by:* [`nixos/modules/services/logging/awstats.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/awstats.nix)

## `services.awstats.dataDir` {#opt-services.awstats.dataDir}

The directory where awstats data will be stored.

*Type:* absolute path

*Default:* `"/var/lib/awstats"`

*Declared by:* [`nixos/modules/services/logging/awstats.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/awstats.nix)

## `services.awstats.enable` {#opt-services.awstats.enable}

Whether to enable awstats, a real-time logfile analyzer.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/logging/awstats.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/awstats.nix)

## `services.awstats.updateAt` {#opt-services.awstats.updateAt}

Specification of the time at which awstats will get updated.
(in the format described by `systemd.time(7)`)

*Type:* null or string

*Default:* `null`

*Example:* `"hourly"`

*Declared by:* [`nixos/modules/services/logging/awstats.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/awstats.nix)

## `services.ax25.axlisten.config` {#opt-services.ax25.axlisten.config}

Options that will be passed to the axlisten daemon.

*Type:* string

*Default:* `"-art"`

*Declared by:* [`nixos/modules/services/networking/ax25/axlisten.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ax25/axlisten.nix)

## `services.ax25.axlisten.enable` {#opt-services.ax25.axlisten.enable}

Whether to enable AX.25 axlisten daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ax25/axlisten.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ax25/axlisten.nix)

## `services.ax25.axlisten.package` {#opt-services.ax25.axlisten.package}

The ax25-apps package to use.

*Type:* package

*Default:* `pkgs.ax25-apps`

*Declared by:* [`nixos/modules/services/networking/ax25/axlisten.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ax25/axlisten.nix)

## `services.ax25.axports` {#opt-services.ax25.axports}

Specification of one or more AX.25 ports.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/ax25/axports.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ax25/axports.nix)

## `services.ax25.axports.<name>.baud` {#opt-services.ax25.axports._name_.baud}

The serial port speed of this interface.

*Type:* signed integer

*Example:* `57600`

*Declared by:* [`nixos/modules/services/networking/ax25/axports.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ax25/axports.nix)

## `services.ax25.axports.<name>.callsign` {#opt-services.ax25.axports._name_.callsign}

The callsign of the physical interface to bind to.

*Type:* string

*Example:* `"WB6WLV-7"`

*Declared by:* [`nixos/modules/services/networking/ax25/axports.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ax25/axports.nix)

## `services.ax25.axports.<name>.description` {#opt-services.ax25.axports._name_.description}

Free format description of this interface.

*Type:* string

*Default:* `"NixOS managed tnc"`

*Declared by:* [`nixos/modules/services/networking/ax25/axports.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ax25/axports.nix)

## `services.ax25.axports.<name>.enable` {#opt-services.ax25.axports._name_.enable}

Whether to enable Enables the axport interface.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ax25/axports.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ax25/axports.nix)

## `services.ax25.axports.<name>.kissParams` {#opt-services.ax25.axports._name_.kissParams}

Kissattach parameters for this interface.

*Type:* null or string

*Default:* `null`

*Example:* `"-t 300 -l 10 -s 12 -r 80 -f n"`

*Declared by:* [`nixos/modules/services/networking/ax25/axports.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ax25/axports.nix)

## `services.ax25.axports.<name>.package` {#opt-services.ax25.axports._name_.package}

The ax25-tools package to use.

*Type:* package

*Default:* `pkgs.ax25-tools`

*Declared by:* [`nixos/modules/services/networking/ax25/axports.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ax25/axports.nix)

## `services.ax25.axports.<name>.paclen` {#opt-services.ax25.axports._name_.paclen}

Default maximum packet size for this interface.

*Type:* signed integer

*Default:* `255`

*Declared by:* [`nixos/modules/services/networking/ax25/axports.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ax25/axports.nix)

## `services.ax25.axports.<name>.tty` {#opt-services.ax25.axports._name_.tty}

Location of hardware kiss tnc for this interface.

*Type:* string

*Example:* `"/dev/ttyACM0"`

*Declared by:* [`nixos/modules/services/networking/ax25/axports.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ax25/axports.nix)

## `services.ax25.axports.<name>.window` {#opt-services.ax25.axports._name_.window}

Default window size for this interface.

*Type:* signed integer

*Default:* `7`

*Declared by:* [`nixos/modules/services/networking/ax25/axports.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ax25/axports.nix)

## `services.ayatana-indicators.enable` {#opt-services.ayatana-indicators.enable}

Whether to enable Ayatana Indicators, a continuation of Canonical's Application Indicators
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/ayatana-indicators.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/ayatana-indicators.nix)

## `services.ayatana-indicators.packages` {#opt-services.ayatana-indicators.packages}

List of packages containing Ayatana Indicator services
that should be brought up by a SystemD "ayatana-indicators" user target.

Packages specified here must have passthru.ayatana-indicators set correctly.

If, how, and where these indicators are displayed will depend on your DE.
Which target they will be brought up by depends on the packages' passthru.ayatana-indicators.

*Type:* list of package

*Default:* `[ ]`

*Example:* `with pkgs; [ ayatana-indicator-messages ]`

*Declared by:* [`nixos/modules/services/desktops/ayatana-indicators.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/ayatana-indicators.nix)
