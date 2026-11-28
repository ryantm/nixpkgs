# services (E) {#sec-options-services-e}

## `services.e-imzo.enable` {#opt-services.e-imzo.enable}

Whether to enable E-IMZO.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/e-imzo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/e-imzo.nix)

## `services.e-imzo.package` {#opt-services.e-imzo.package}

The e-imzo package to use. Official mirror deletes old versions as soon as they release new one. Feel free to use either unstable or your own custom e-imzo package and ping maintainer.

*Type:* package

*Default:* `pkgs.e-imzo`

*Declared by:* [`nixos/modules/services/security/e-imzo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/e-imzo.nix)

## `services.earlyoom.enable` {#opt-services.earlyoom.enable}

Whether to enable early out of memory killing.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/system/earlyoom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/earlyoom.nix)

## `services.earlyoom.enableDebugInfo` {#opt-services.earlyoom.enableDebugInfo}

Enable debugging messages.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/system/earlyoom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/earlyoom.nix)

## `services.earlyoom.enableNotifications` {#opt-services.earlyoom.enableNotifications}

Send notifications about killed processes via the system d-bus.

WARNING: enabling this option (while convenient) should *not* be done on a
machine where you do not trust the other users as it allows any other
local user to DoS your session by spamming notifications.

To actually see the notifications in your GUI session, you need to have
`systembus-notify` running as your user, which this
option handles by enabling `services.systembus-notify`.

See [README](https://github.com/rfjakob/earlyoom#notifications) for details.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/system/earlyoom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/earlyoom.nix)

## `services.earlyoom.extraArgs` {#opt-services.earlyoom.extraArgs}

Extra command-line arguments to be passed to earlyoom. Each element in
the value list will be escaped as an argument without further
word-breaking.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-g"
  "--prefer"
  "(^|/)(java|chromium)$"
]
```

*Declared by:* [`nixos/modules/services/system/earlyoom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/earlyoom.nix)

## `services.earlyoom.freeMemKillThreshold` {#opt-services.earlyoom.freeMemKillThreshold}

Minimum available memory (in percent) before sending SIGKILL.
If unset, this defaults to half of `freeMemThreshold`.

See the description of [services (E)](#opt-services.earlyoom.freeMemThreshold).

*Type:* null or integer between 1 and 100 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/system/earlyoom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/earlyoom.nix)

## `services.earlyoom.freeMemThreshold` {#opt-services.earlyoom.freeMemThreshold}

Minimum available memory (in percent).

If the available memory falls below this threshold (and the analog is true for
`freeSwapThreshold`) the killing begins.
SIGTERM is sent first to the process that uses the most memory; then, if the available
memory falls below `freeMemKillThreshold` (and the analog is true for
`freeSwapKillThreshold`), SIGKILL is sent.

See [README](https://github.com/rfjakob/earlyoom#command-line-options) for details.

*Type:* integer between 1 and 100 (both inclusive)

*Default:* `10`

*Declared by:* [`nixos/modules/services/system/earlyoom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/earlyoom.nix)

## `services.earlyoom.freeSwapKillThreshold` {#opt-services.earlyoom.freeSwapKillThreshold}

Minimum free swap space (in percent) before sending SIGKILL.
If unset, this defaults to half of `freeSwapThreshold`.

See the description of [services (E)](#opt-services.earlyoom.freeMemThreshold).

*Type:* null or integer between 1 and 100 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/system/earlyoom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/earlyoom.nix)

## `services.earlyoom.freeSwapThreshold` {#opt-services.earlyoom.freeSwapThreshold}

Minimum free swap space (in percent) before sending SIGTERM.

See the description of [services (E)](#opt-services.earlyoom.freeMemThreshold).

*Type:* integer between 1 and 100 (both inclusive)

*Default:* `10`

*Declared by:* [`nixos/modules/services/system/earlyoom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/earlyoom.nix)

## `services.earlyoom.killHook` {#opt-services.earlyoom.killHook}

An absolute path to an executable to be run for each process killed.
Some environment variables are available, see
[README](https://github.com/rfjakob/earlyoom#notifications) and
[the man page](https://github.com/rfjakob/earlyoom/blob/master/MANPAGE.md#-n-pathtoscript)
for details.

WARNING: earlyoom is running in a sandbox with ProtectSystem="strict"
by default, so filesystem write is also prohibited for the hook.
If you want to change these protection rules, override the systemd
service via `systemd.services.earlyoom.serviceConfig.ProtectSystem`.

*Type:* null or absolute path

*Default:* `null`

*Example:*

``` nix
pkgs.writeShellScript "earlyoom-kill-hook" ''
  echo "Process $EARLYOOM_NAME ($EARLYOOM_PID) was killed" >> /path/to/log
''
```

*Declared by:* [`nixos/modules/services/system/earlyoom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/earlyoom.nix)

## `services.earlyoom.package` {#opt-services.earlyoom.package}

The earlyoom package to use.

*Type:* package

*Default:* `pkgs.earlyoom`

*Declared by:* [`nixos/modules/services/system/earlyoom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/earlyoom.nix)

## `services.earlyoom.reportInterval` {#opt-services.earlyoom.reportInterval}

Interval (in seconds) at which a memory report is printed (set to 0 to disable).

*Type:* signed integer

*Default:* `3600`

*Example:* `0`

*Declared by:* [`nixos/modules/services/system/earlyoom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/earlyoom.nix)

## `services.easytier.allowSystemForward` {#opt-services.easytier.allowSystemForward}

Whether to enable Allow the system to forward packets from easytier. Useful when
`proxy_forward_by_system` enabled.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/easytier.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/easytier.nix)

## `services.easytier.enable` {#opt-services.easytier.enable}

Whether to enable EasyTier daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/easytier.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/easytier.nix)

## `services.easytier.instances` {#opt-services.easytier.instances}

EasyTier instances.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  extraSettings = {
    flags = {
      dev_name = "tun1";
    };
  };
  settings = {
    ipv4 = "10.144.144.1/24";
    network_name = "easytier";
    network_secret = "easytier";
    peers = [
      "tcp://public.easytier.cn:11010"
      "wss://example.com:443"
    ];
  };
}
```

*Declared by:* [`nixos/modules/services/networking/easytier.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/easytier.nix)

## `services.easytier.instances.<name>.configFile` {#opt-services.easytier.instances._name_.configFile}

Path to easytier config file. Setting this option will
override `settings` and `extraSettings` of this instance.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/easytier.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/easytier.nix)

## `services.easytier.instances.<name>.configServer` {#opt-services.easytier.instances._name_.configServer}

Configure the instance from config server. When this option
set, any other settings for configuring the instance manually
except `hostname` will be ignored. Valid formats are:

- full uri for custom server: `udp://example.com:22020/<token>`

Since 2.7.0 a full URL is required; a bare `<token>` is rejected.

*Type:* null or string

*Default:* `null`

*Example:* `"udp://example.com:22020/myusername"`

*Declared by:* [`nixos/modules/services/networking/easytier.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/easytier.nix)

## `services.easytier.instances.<name>.enable` {#opt-services.easytier.instances._name_.enable}

Enable the instance.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/easytier.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/easytier.nix)

## `services.easytier.instances.<name>.environmentFiles` {#opt-services.easytier.instances._name_.environmentFiles}

Environment files for this instance. All command-line args
have corresponding environment variables.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  /path/to/.env
  /path/to/.env.secret
]
```

*Declared by:* [`nixos/modules/services/networking/easytier.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/easytier.nix)

## `services.easytier.instances.<name>.extraArgs` {#opt-services.easytier.instances._name_.extraArgs}

Extra args append to the easytier command-line.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/easytier.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/easytier.nix)

## `services.easytier.instances.<name>.extraSettings` {#opt-services.easytier.instances._name_.extraSettings}

Extra settings to add to `easytier-‹name›.toml`.

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/easytier.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/easytier.nix)

## `services.easytier.instances.<name>.settings` {#opt-services.easytier.instances._name_.settings}

Settings to generate `easytier-‹name›.toml`

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/easytier.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/easytier.nix)

## `services.easytier.instances.<name>.settings.dhcp` {#opt-services.easytier.instances._name_.settings.dhcp}

Automatically determine the IPv4 address of this peer based on
existing peers on network.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/easytier.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/easytier.nix)

## `services.easytier.instances.<name>.settings.hostname` {#opt-services.easytier.instances._name_.settings.hostname}

Hostname shown in peer list and web console.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/easytier.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/easytier.nix)

## `services.easytier.instances.<name>.settings.instance_name` {#opt-services.easytier.instances._name_.settings.instance_name}

Identify different instances on same host

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/networking/easytier.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/easytier.nix)

## `services.easytier.instances.<name>.settings.ipv4` {#opt-services.easytier.instances._name_.settings.ipv4}

IPv4 cidr address of this peer in the virtual network. If
empty, this peer will only forward packets and no TUN device
will be created.

*Type:* null or string

*Default:* `null`

*Example:* `"10.144.144.1/24"`

*Declared by:* [`nixos/modules/services/networking/easytier.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/easytier.nix)

## `services.easytier.instances.<name>.settings.listeners` {#opt-services.easytier.instances._name_.settings.listeners}

Listener addresses to accept connections from other peers.
Valid format is: `<proto>://<addr>:<port>`, where the protocol
can be `tcp`, `udp`, `ring`, `wg`, `ws`, `wss`.

*Type:* list of string

*Default:*

``` nix
[
  "tcp://0.0.0.0:11010"
  "udp://0.0.0.0:11010"
]
```

*Declared by:* [`nixos/modules/services/networking/easytier.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/easytier.nix)

## `services.easytier.instances.<name>.settings.network_name` {#opt-services.easytier.instances._name_.settings.network_name}

EasyTier network name.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/easytier.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/easytier.nix)

## `services.easytier.instances.<name>.settings.network_secret` {#opt-services.easytier.instances._name_.settings.network_secret}

EasyTier network credential used for verification and
encryption. It can also be set in environmentFile.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/easytier.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/easytier.nix)

## `services.easytier.instances.<name>.settings.peers` {#opt-services.easytier.instances._name_.settings.peers}

Peers to connect initially. Valid format is: `<proto>://<addr>:<port>`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "tcp://example.com:11010"
]
```

*Declared by:* [`nixos/modules/services/networking/easytier.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/easytier.nix)

## `services.easytier.package` {#opt-services.easytier.package}

The easytier package to use.

*Type:* package

*Default:* `pkgs.easytier`

*Declared by:* [`nixos/modules/services/networking/easytier.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/easytier.nix)

## `services.ebusd.configpath` {#opt-services.ebusd.configpath}

Directory to read CSV config files from. This can be a local folder or a URL.

*Type:* string

*Default:* `"https://ebus.github.io/"`

*Declared by:* [`nixos/modules/services/home-automation/ebusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/ebusd.nix)

## `services.ebusd.device` {#opt-services.ebusd.device}

Use DEV as eBUS device \[/dev/ttyUSB0\].
This can be either:
enh:DEVICE or enh:IP:PORT for enhanced device (only adapter v3 and newer),
ens:DEVICE for enhanced high speed serial device (only adapter v3 and newer with firmware since 20220731),
DEVICE for serial device (normal speed, for all other serial adapters like adapter v2 as well as adapter v3 in non-enhanced mode), or
\[udp:\]IP:PORT for network device.

Source: [https://github.com/john30/ebusd/wiki/2.-Run#device-options](https://github.com/john30/ebusd/wiki/2.-Run#device-options)

*Type:* string

*Default:* `""`

*Example:* `"IP:PORT"`

*Declared by:* [`nixos/modules/services/home-automation/ebusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/ebusd.nix)

## `services.ebusd.enable` {#opt-services.ebusd.enable}

Whether to enable ebusd, a daemon for communication with eBUS heating systems.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/ebusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/ebusd.nix)

## `services.ebusd.extraArguments` {#opt-services.ebusd.extraArguments}

Extra arguments to the ebus daemon

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/home-automation/ebusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/ebusd.nix)

## `services.ebusd.logs.all` {#opt-services.ebusd.logs.all}

Only write log for matching `AREA`s (all|main|network|bus|device|update|other) below or equal to `LEVEL` (none|error|notice|info|debug)

*Type:* one of "none", "error", "notice", "info", "debug"

*Default:* `"notice"`

*Example:* `"debug"`

*Declared by:* [`nixos/modules/services/home-automation/ebusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/ebusd.nix)

## `services.ebusd.logs.bus` {#opt-services.ebusd.logs.bus}

Only write log for matching `AREA`s (all|main|network|bus|device|update|other) below or equal to `LEVEL` (none|error|notice|info|debug)

*Type:* one of "none", "error", "notice", "info", "debug"

*Default:* `"notice"`

*Example:* `"debug"`

*Declared by:* [`nixos/modules/services/home-automation/ebusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/ebusd.nix)

## `services.ebusd.logs.device` {#opt-services.ebusd.logs.device}

Only write log for matching `AREA`s (all|main|network|bus|device|update|other) below or equal to `LEVEL` (none|error|notice|info|debug)

*Type:* one of "none", "error", "notice", "info", "debug"

*Default:* `"notice"`

*Example:* `"debug"`

*Declared by:* [`nixos/modules/services/home-automation/ebusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/ebusd.nix)

## `services.ebusd.logs.main` {#opt-services.ebusd.logs.main}

Only write log for matching `AREA`s (all|main|network|bus|device|update|other) below or equal to `LEVEL` (none|error|notice|info|debug)

*Type:* one of "none", "error", "notice", "info", "debug"

*Default:* `"notice"`

*Example:* `"debug"`

*Declared by:* [`nixos/modules/services/home-automation/ebusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/ebusd.nix)

## `services.ebusd.logs.network` {#opt-services.ebusd.logs.network}

Only write log for matching `AREA`s (all|main|network|bus|device|update|other) below or equal to `LEVEL` (none|error|notice|info|debug)

*Type:* one of "none", "error", "notice", "info", "debug"

*Default:* `"notice"`

*Example:* `"debug"`

*Declared by:* [`nixos/modules/services/home-automation/ebusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/ebusd.nix)

## `services.ebusd.logs.other` {#opt-services.ebusd.logs.other}

Only write log for matching `AREA`s (all|main|network|bus|device|update|other) below or equal to `LEVEL` (none|error|notice|info|debug)

*Type:* one of "none", "error", "notice", "info", "debug"

*Default:* `"notice"`

*Example:* `"debug"`

*Declared by:* [`nixos/modules/services/home-automation/ebusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/ebusd.nix)

## `services.ebusd.logs.update` {#opt-services.ebusd.logs.update}

Only write log for matching `AREA`s (all|main|network|bus|device|update|other) below or equal to `LEVEL` (none|error|notice|info|debug)

*Type:* one of "none", "error", "notice", "info", "debug"

*Default:* `"notice"`

*Example:* `"debug"`

*Declared by:* [`nixos/modules/services/home-automation/ebusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/ebusd.nix)

## `services.ebusd.mqtt.enable` {#opt-services.ebusd.mqtt.enable}

Whether to enable support for MQTT.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/ebusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/ebusd.nix)

## `services.ebusd.mqtt.home-assistant` {#opt-services.ebusd.mqtt.home-assistant}

Adds the Home Assistant topics to MQTT, read more at [MQTT Integration](https://github.com/john30/ebusd/wiki/MQTT-integration)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/home-automation/ebusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/ebusd.nix)

## `services.ebusd.mqtt.host` {#opt-services.ebusd.mqtt.host}

Connect to MQTT broker on HOST.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/home-automation/ebusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/ebusd.nix)

## `services.ebusd.mqtt.password` {#opt-services.ebusd.mqtt.password}

The MQTT password.

*Type:* string

*Declared by:* [`nixos/modules/services/home-automation/ebusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/ebusd.nix)

## `services.ebusd.mqtt.port` {#opt-services.ebusd.mqtt.port}

The port on which to connect to MQTT

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1883`

*Declared by:* [`nixos/modules/services/home-automation/ebusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/ebusd.nix)

## `services.ebusd.mqtt.retain` {#opt-services.ebusd.mqtt.retain}

Whether to enable set the retain flag on all topics instead of only selected global ones.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/ebusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/ebusd.nix)

## `services.ebusd.mqtt.user` {#opt-services.ebusd.mqtt.user}

The MQTT user to use

*Type:* string

*Declared by:* [`nixos/modules/services/home-automation/ebusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/ebusd.nix)

## `services.ebusd.package` {#opt-services.ebusd.package}

The ebusd package to use.

*Type:* package

*Default:* `pkgs.ebusd`

*Declared by:* [`nixos/modules/services/home-automation/ebusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/ebusd.nix)

## `services.ebusd.port` {#opt-services.ebusd.port}

The port on which to listen on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8888`

*Declared by:* [`nixos/modules/services/home-automation/ebusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/ebusd.nix)

## `services.ebusd.readonly` {#opt-services.ebusd.readonly}

Only read from device, never write to it

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/home-automation/ebusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/ebusd.nix)

## `services.ebusd.scanconfig` {#opt-services.ebusd.scanconfig}

Pick CSV config files matching initial scan ("none" or empty for no initial scan message, "full" for full scan, or a single hex address to scan, default is to send a broadcast ident message).
If combined with --checkconfig, you can add scan message data as arguments for checking a particular scan configuration, e.g. "FF08070400/0AB5454850303003277201". For further details on this option,
see [Automatic configuration](https://github.com/john30/ebusd/wiki/4.7.-Automatic-configuration).

*Type:* string

*Default:* `"full"`

*Declared by:* [`nixos/modules/services/home-automation/ebusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/ebusd.nix)

## `services.echoip.enable` {#opt-services.echoip.enable}

Whether to enable echoip.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/echoip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/echoip.nix)

## `services.echoip.enablePortLookup` {#opt-services.echoip.enablePortLookup}

Whether to enable port lookup.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/echoip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/echoip.nix)

## `services.echoip.enableReverseHostnameLookups` {#opt-services.echoip.enableReverseHostnameLookups}

Whether to enable reverse hostname lookups.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/echoip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/echoip.nix)

## `services.echoip.extraArgs` {#opt-services.echoip.extraArgs}

Extra command line arguments to pass to echoip. See [https://github.com/mpolden/echoip](https://github.com/mpolden/echoip) for details.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/echoip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/echoip.nix)

## `services.echoip.listenAddress` {#opt-services.echoip.listenAddress}

The address echoip should listen on

*Type:* string

*Default:* `":8080"`

*Example:* `"127.0.0.1:8000"`

*Declared by:* [`nixos/modules/services/web-apps/echoip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/echoip.nix)

## `services.echoip.package` {#opt-services.echoip.package}

The echoip package to use.

*Type:* package

*Default:* `pkgs.echoip`

*Declared by:* [`nixos/modules/services/web-apps/echoip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/echoip.nix)

## `services.echoip.remoteIpHeader` {#opt-services.echoip.remoteIpHeader}

Header to trust for remote IP, if present

*Type:* null or string

*Default:* `null`

*Example:* `"X-Real-IP"`

*Declared by:* [`nixos/modules/services/web-apps/echoip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/echoip.nix)

## `services.echoip.virtualHost` {#opt-services.echoip.virtualHost}

Name of the nginx virtual host to use and setup. If null, do not setup anything.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/echoip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/echoip.nix)

## `services.ecs-agent.enable` {#opt-services.ecs-agent.enable}

Whether to enable Amazon ECS agent.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/virtualisation/ecs-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/ecs-agent.nix)

## `services.ecs-agent.extra-environment` {#opt-services.ecs-agent.extra-environment}

The environment the ECS agent should run with. See the ECS agent documentation for keys that work here.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/virtualisation/ecs-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/ecs-agent.nix)

## `services.ecs-agent.package` {#opt-services.ecs-agent.package}

The ecs-agent package to use.

*Type:* package

*Default:* `pkgs.ecs-agent`

*Declared by:* [`nixos/modules/virtualisation/ecs-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/ecs-agent.nix)

## `services.eg25-manager.enable` {#opt-services.eg25-manager.enable}

Whether to enable Quectel EG25 modem manager service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/network/eg25-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/network/eg25-manager.nix)

## `services.eg25-manager.package` {#opt-services.eg25-manager.package}

The eg25-manager package to use.

*Type:* package

*Default:* `pkgs.eg25-manager`

*Declared by:* [`nixos/modules/hardware/network/eg25-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/network/eg25-manager.nix)

## `services.ejabberd.configFile` {#opt-services.ejabberd.configFile}

Configuration file for ejabberd in YAML format

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ejabberd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ejabberd.nix)

## `services.ejabberd.ctlConfig` {#opt-services.ejabberd.ctlConfig}

Configuration of ejabberdctl

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/ejabberd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ejabberd.nix)

## `services.ejabberd.enable` {#opt-services.ejabberd.enable}

Whether to enable ejabberd server

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ejabberd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ejabberd.nix)

## `services.ejabberd.group` {#opt-services.ejabberd.group}

Group under which ejabberd is ran

*Type:* string

*Default:* `"ejabberd"`

*Declared by:* [`nixos/modules/services/networking/ejabberd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ejabberd.nix)

## `services.ejabberd.imagemagick` {#opt-services.ejabberd.imagemagick}

Add ImageMagick to server's path; allows for image thumbnailing

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ejabberd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ejabberd.nix)

## `services.ejabberd.loadDumps` {#opt-services.ejabberd.loadDumps}

Configuration dumps that should be loaded on the first startup

*Type:* list of absolute path

*Default:* `[ ]`

*Example:* `[ ./myejabberd.dump ]`

*Declared by:* [`nixos/modules/services/networking/ejabberd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ejabberd.nix)

## `services.ejabberd.logsDir` {#opt-services.ejabberd.logsDir}

Location of the logfile directory of ejabberd

*Type:* absolute path

*Default:* `"/var/log/ejabberd"`

*Declared by:* [`nixos/modules/services/networking/ejabberd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ejabberd.nix)

## `services.ejabberd.package` {#opt-services.ejabberd.package}

The ejabberd package to use.

*Type:* package

*Default:* `pkgs.ejabberd`

*Declared by:* [`nixos/modules/services/networking/ejabberd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ejabberd.nix)

## `services.ejabberd.spoolDir` {#opt-services.ejabberd.spoolDir}

Location of the spooldir of ejabberd

*Type:* absolute path

*Default:* `"/var/lib/ejabberd"`

*Declared by:* [`nixos/modules/services/networking/ejabberd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ejabberd.nix)

## `services.ejabberd.user` {#opt-services.ejabberd.user}

User under which ejabberd is ran

*Type:* string

*Default:* `"ejabberd"`

*Declared by:* [`nixos/modules/services/networking/ejabberd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ejabberd.nix)

## `services.elasticsearch-curator.actionYAML` {#opt-services.elasticsearch-curator.actionYAML}

curator action.yaml file contents, alternatively use curator-cli which takes a simple action command

*Type:* strings concatenated with "\\n"

*Example:*

``` nix
''
  ---
  actions:
    1:
      action: delete_indices
      description: >-
        Delete indices older than 45 days (based on index name), for logstash-
        prefixed indices. Ignore the error if the filter does not result in an
        actionable list of indices (ignore_empty_list) and exit cleanly.
      options:
        ignore_empty_list: True
        disable_action: False
      filters:
      - filtertype: pattern
        kind: prefix
        value: logstash-
      - filtertype: age
        source: name
        direction: older
        timestring: '%Y.%m.%d'
        unit: days
        unit_count: 45
''
```

*Declared by:* [`nixos/modules/services/search/elasticsearch-curator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/elasticsearch-curator.nix)

## `services.elasticsearch-curator.enable` {#opt-services.elasticsearch-curator.enable}

Whether to enable elasticsearch curator.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/search/elasticsearch-curator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/elasticsearch-curator.nix)

## `services.elasticsearch-curator.hosts` {#opt-services.elasticsearch-curator.hosts}

a list of elasticsearch hosts to connect to

*Type:* list of string

*Default:*

``` nix
[
  "localhost"
]
```

*Declared by:* [`nixos/modules/services/search/elasticsearch-curator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/elasticsearch-curator.nix)

## `services.elasticsearch-curator.interval` {#opt-services.elasticsearch-curator.interval}

The frequency to run curator, a systemd.time such as 'hourly'

*Type:* string

*Default:* `"hourly"`

*Declared by:* [`nixos/modules/services/search/elasticsearch-curator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/elasticsearch-curator.nix)

## `services.elasticsearch-curator.port` {#opt-services.elasticsearch-curator.port}

the port that elasticsearch is listening on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9200`

*Declared by:* [`nixos/modules/services/search/elasticsearch-curator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/elasticsearch-curator.nix)

## `services.elasticsearch.cluster_name` {#opt-services.elasticsearch.cluster_name}

Elasticsearch name that identifies your cluster for auto-discovery.

*Type:* string

*Default:* `"elasticsearch"`

*Declared by:* [`nixos/modules/services/search/elasticsearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/elasticsearch.nix)

## `services.elasticsearch.dataDir` {#opt-services.elasticsearch.dataDir}

Data directory for elasticsearch.

*Type:* absolute path

*Default:* `"/var/lib/elasticsearch"`

*Declared by:* [`nixos/modules/services/search/elasticsearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/elasticsearch.nix)

## `services.elasticsearch.enable` {#opt-services.elasticsearch.enable}

Whether to enable elasticsearch.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/search/elasticsearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/elasticsearch.nix)

## `services.elasticsearch.extraCmdLineOptions` {#opt-services.elasticsearch.extraCmdLineOptions}

Extra command line options for the elasticsearch launcher.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/search/elasticsearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/elasticsearch.nix)

## `services.elasticsearch.extraConf` {#opt-services.elasticsearch.extraConf}

Extra configuration for elasticsearch.

*Type:* string

*Default:* `""`

*Example:*

``` nix
''
  node.name: "elasticsearch"
  node.master: true
  node.data: false
''
```

*Declared by:* [`nixos/modules/services/search/elasticsearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/elasticsearch.nix)

## `services.elasticsearch.extraJavaOptions` {#opt-services.elasticsearch.extraJavaOptions}

Extra command line options for Java.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-Djava.net.preferIPv4Stack=true"
]
```

*Declared by:* [`nixos/modules/services/search/elasticsearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/elasticsearch.nix)

## `services.elasticsearch.listenAddress` {#opt-services.elasticsearch.listenAddress}

Elasticsearch listen address.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/search/elasticsearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/elasticsearch.nix)

## `services.elasticsearch.logging` {#opt-services.elasticsearch.logging}

Elasticsearch logging configuration.

*Type:* string

*Default:*

``` nix
''
  logger.action.name = org.elasticsearch.action
  logger.action.level = info
  
  appender.console.type = Console
  appender.console.name = console
  appender.console.layout.type = PatternLayout
  appender.console.layout.pattern = [%d{ISO8601}][%-5p][%-25c{1.}] %marker%m%n
  
  rootLogger.level = info
  rootLogger.appenderRef.console.ref = console
''
```

*Declared by:* [`nixos/modules/services/search/elasticsearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/elasticsearch.nix)

## `services.elasticsearch.package` {#opt-services.elasticsearch.package}

The elasticsearch package to use.

*Type:* package

*Default:* `pkgs.elasticsearch`

*Declared by:* [`nixos/modules/services/search/elasticsearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/elasticsearch.nix)

## `services.elasticsearch.plugins` {#opt-services.elasticsearch.plugins}

Extra elasticsearch plugins

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.elasticsearchPlugins.discovery-ec2 ]`

*Declared by:* [`nixos/modules/services/search/elasticsearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/elasticsearch.nix)

## `services.elasticsearch.port` {#opt-services.elasticsearch.port}

Elasticsearch port to listen for HTTP traffic.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9200`

*Declared by:* [`nixos/modules/services/search/elasticsearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/elasticsearch.nix)

## `services.elasticsearch.restartIfChanged` {#opt-services.elasticsearch.restartIfChanged}

Automatically restart the service on config change.
This can be set to false to defer restarts on a server or cluster.
Please consider the security implications of inadvertently running an older version,
and the possibility of unexpected behavior caused by inconsistent versions across a cluster when disabling this option.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/search/elasticsearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/elasticsearch.nix)

## `services.elasticsearch.single_node` {#opt-services.elasticsearch.single_node}

Start a single-node cluster

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/search/elasticsearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/elasticsearch.nix)

## `services.elasticsearch.tcp_port` {#opt-services.elasticsearch.tcp_port}

Elasticsearch port for the node to node communication.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9300`

*Declared by:* [`nixos/modules/services/search/elasticsearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/elasticsearch.nix)

## `services.elephant.enable` {#opt-services.elephant.enable}

Whether to enable Elephant application launcher backend.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/elephant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/elephant.nix)

## `services.elephant.package` {#opt-services.elephant.package}

The elephant package to use.

*Type:* package

*Default:* `pkgs.elephant`

*Declared by:* [`nixos/modules/services/misc/elephant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/elephant.nix)

## `services.elk.enable` {#opt-services.elk.enable}

Whether to enable Elk, a nimble Mastodon web client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/elk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/elk.nix)

## `services.elk.openFirewall` {#opt-services.elk.openFirewall}

Whether to open the firewall for the specified port.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/elk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/elk.nix)

## `services.elk.package` {#opt-services.elk.package}

The elk package to use.

*Type:* package

*Default:* `pkgs.elk`

*Declared by:* [`nixos/modules/services/web-apps/elk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/elk.nix)

## `services.elk.settings` {#opt-services.elk.settings}

Environment variables for the Elk server process, see
[https://github.com/elk-zone/elk/blob/main/nuxt.config.ts](https://github.com/elk-zone/elk/blob/main/nuxt.config.ts)
for supported keys.

*Type:* open submodule of attribute set of (boolean or signed integer or string)

*Default:* `{ }`

*Example:*

``` nix
{
  NUXT_PUBLIC_DEFAULT_SERVER = "mastodon.social";
  PORT = 3000;
}
```

*Declared by:* [`nixos/modules/services/web-apps/elk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/elk.nix)

## `services.elk.settings.HOST` {#opt-services.elk.settings.HOST}

The address to listen on.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/elk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/elk.nix)

## `services.elk.settings.PORT` {#opt-services.elk.settings.PORT}

The port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/web-apps/elk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/elk.nix)

## `services.emacs.defaultEditor` {#opt-services.emacs.defaultEditor}

When enabled, configures emacsclient to be the default editor
using the EDITOR environment variable.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/editors/emacs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/editors/emacs.nix)

## `services.emacs.enable` {#opt-services.emacs.enable}

Whether to enable a user service for the Emacs daemon. Use `emacsclient` to connect to the
daemon. If `true`, `services.emacs.install` is
considered `true`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/editors/emacs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/editors/emacs.nix)

## `services.emacs.install` {#opt-services.emacs.install}

Whether to install a user service for the Emacs daemon. Once
the service is started, use emacsclient to connect to the
daemon.

The service must be manually started for each user with
"systemctl --user start emacs" or globally through
`services.emacs.enable`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/editors/emacs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/editors/emacs.nix)

## `services.emacs.package` {#opt-services.emacs.package}

The emacs package to use.

*Type:* package

*Default:* `pkgs.emacs`

*Declared by:* [`nixos/modules/services/editors/emacs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/editors/emacs.nix)

## `services.emacs.startWithGraphical` {#opt-services.emacs.startWithGraphical}

Start emacs with the graphical session instead of any session. Without this, emacs clients will not be able to create frames in the graphical session.

*Type:* boolean

*Default:* `config.services.xserver.enable`

*Declared by:* [`nixos/modules/services/editors/emacs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/editors/emacs.nix)

## `services.endlessh-go.enable` {#opt-services.endlessh-go.enable}

Whether to enable endlessh-go service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/endlessh-go.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/endlessh-go.nix)

## `services.endlessh-go.extraOptions` {#opt-services.endlessh-go.extraOptions}

Additional command line options to pass to the endlessh-go daemon.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-conn_type=tcp4"
  "-max_clients=8192"
]
```

*Declared by:* [`nixos/modules/services/security/endlessh-go.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/endlessh-go.nix)

## `services.endlessh-go.listenAddress` {#opt-services.endlessh-go.listenAddress}

Interface address to bind the endlessh-go daemon to SSH connections.

*Type:* string

*Default:* `"0.0.0.0"`

*Example:* `"[::]"`

*Declared by:* [`nixos/modules/services/security/endlessh-go.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/endlessh-go.nix)

## `services.endlessh-go.openFirewall` {#opt-services.endlessh-go.openFirewall}

Whether to open a firewall port for the SSH listener.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/endlessh-go.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/endlessh-go.nix)

## `services.endlessh-go.package` {#opt-services.endlessh-go.package}

The endlessh-go package to use.

*Type:* package

*Default:* `pkgs.endlessh-go`

*Declared by:* [`nixos/modules/services/security/endlessh-go.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/endlessh-go.nix)

## `services.endlessh-go.port` {#opt-services.endlessh-go.port}

Specifies on which port the endlessh-go daemon listens for SSH
connections.

Setting this to `22` may conflict with `services.openssh`.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `2222`

*Example:* `22`

*Declared by:* [`nixos/modules/services/security/endlessh-go.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/endlessh-go.nix)

## `services.endlessh-go.prometheus.enable` {#opt-services.endlessh-go.prometheus.enable}

Whether to enable Prometheus integration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/endlessh-go.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/endlessh-go.nix)

## `services.endlessh-go.prometheus.listenAddress` {#opt-services.endlessh-go.prometheus.listenAddress}

Interface address to bind the endlessh-go daemon to answer Prometheus
queries.

*Type:* string

*Default:* `"0.0.0.0"`

*Example:* `"[::]"`

*Declared by:* [`nixos/modules/services/security/endlessh-go.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/endlessh-go.nix)

## `services.endlessh-go.prometheus.port` {#opt-services.endlessh-go.prometheus.port}

Specifies on which port the endlessh-go daemon listens for Prometheus
queries.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `2112`

*Example:* `9119`

*Declared by:* [`nixos/modules/services/security/endlessh-go.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/endlessh-go.nix)

## `services.endlessh.enable` {#opt-services.endlessh.enable}

Whether to enable endlessh service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/endlessh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/endlessh.nix)

## `services.endlessh.extraOptions` {#opt-services.endlessh.extraOptions}

Additional command line options to pass to the endlessh daemon.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-6"
  "-d 9000"
  "-v"
]
```

*Declared by:* [`nixos/modules/services/security/endlessh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/endlessh.nix)

## `services.endlessh.openFirewall` {#opt-services.endlessh.openFirewall}

Whether to open a firewall port for the SSH listener.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/endlessh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/endlessh.nix)

## `services.endlessh.port` {#opt-services.endlessh.port}

Specifies on which port the endlessh daemon listens for SSH
connections.

Setting this to `22` may conflict with `services.openssh`.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `2222`

*Example:* `22`

*Declared by:* [`nixos/modules/services/security/endlessh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/endlessh.nix)

## `services.engelsystem.createDatabase` {#opt-services.engelsystem.createDatabase}

Whether to create a local database automatically.
This will override every database setting in [`services.engelsystem.settings`](#opt-services.engelsystem.settings).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/engelsystem.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/engelsystem.nix)

## `services.engelsystem.domain` {#opt-services.engelsystem.domain}

Domain to serve on.

*Type:* string

*Example:* `"engelsystem.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/engelsystem.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/engelsystem.nix)

## `services.engelsystem.enable` {#opt-services.engelsystem.enable}

Whether to enable engelsystem, an online tool for coordinating volunteers and shifts on large events.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/engelsystem.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/engelsystem.nix)

## `services.engelsystem.package` {#opt-services.engelsystem.package}

The engelsystem package to use.

*Type:* package

*Default:* `pkgs.engelsystem`

*Declared by:* [`nixos/modules/services/web-apps/engelsystem.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/engelsystem.nix)

## `services.engelsystem.settings` {#opt-services.engelsystem.settings}

Options to be added to config.php, as a nix attribute set. Options containing secret data
should be set to an attribute set containing the attribute \_secret - a string pointing to a
file containing the value the option should be set to. See the example to get a better
picture of this: in the resulting config.php file, the email.password key will be set to
the contents of the /var/keys/engelsystem/mail file.

See [https://engelsystem.de/doc/admin/configuration/](https://engelsystem.de/doc/admin/configuration/) for available options.

Note that the admin user login credentials cannot be set here - they always default to
admin:asdfasdf. Log in and change them immediately.

*Type:* attribute set

*Default:*

``` nix
{
  database = {
    database = "engelsystem";
    host = "localhost";
    username = "engelsystem";
  };
}
```

*Example:*

``` nix
{
  autoarrive = true;
  database = {
    database = "engelsystem";
    host = "database.example.com";
    password = {
      _secret = "/var/keys/engelsystem/database";
    };
    username = "engelsystem";
  };
  default_locale = "de_DE";
  email = {
    driver = "smtp";
    encryption = "tls";
    from = {
      address = "engelsystem@example.com";
      name = "example engelsystem";
    };
    host = "smtp.example.com";
    password = {
      _secret = "/var/keys/engelsystem/mail";
    };
    port = 587;
    username = "engelsystem@example.com";
  };
  maintenance = false;
  min_password_length = 6;
}
```

*Declared by:* [`nixos/modules/services/web-apps/engelsystem.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/engelsystem.nix)

## `services.ente.api.domain` {#opt-services.ente.api.domain}

The domain under which the api will be served.

*Type:* string

*Example:* `"api.ente.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/ente.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix)

## `services.ente.api.enable` {#opt-services.ente.api.enable}

Whether to enable Museum (API server for ente.io).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/ente.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix)

## `services.ente.api.enableLocalDB` {#opt-services.ente.api.enableLocalDB}

Whether to enable the automatic creation of a local postgres database for museum..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/ente.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix)

## `services.ente.api.group` {#opt-services.ente.api.group}

Group under which museum runs. If you set this option you must make sure the group exists.

*Type:* string

*Default:* `"ente"`

*Declared by:* [`nixos/modules/services/web-apps/ente.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix)

## `services.ente.api.nginx.enable` {#opt-services.ente.api.nginx.enable}

Whether to enable nginx proxy for the API server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/ente.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix)

## `services.ente.api.package` {#opt-services.ente.api.package}

The museum package to use.

*Type:* package

*Default:* `pkgs.museum`

*Declared by:* [`nixos/modules/services/web-apps/ente.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix)

## `services.ente.api.settings` {#opt-services.ente.api.settings}

Museum yaml configuration. Refer to upstream [local.yaml](https://github.com/ente-io/ente/blob/main/server/configurations/local.yaml) for more information.
You can specify secret values in this configuration by setting `somevalue._secret = "/path/to/file"` instead of setting `somevalue` directly.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/ente.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix)

## `services.ente.api.settings.apps.accounts` {#opt-services.ente.api.settings.apps.accounts}

Set this to the URL where your accounts page is running.
This is primarily for passkey support.

*Type:* string

*Default:* `"https://accounts.ente.io"`

*Declared by:* [`nixos/modules/services/web-apps/ente.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix)

## `services.ente.api.settings.apps.cast` {#opt-services.ente.api.settings.apps.cast}

Set this to the URL where your cast page is running.
This is for browser and chromecast casting support.

*Type:* string

*Default:* `"https://cast.ente.io"`

*Declared by:* [`nixos/modules/services/web-apps/ente.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix)

## `services.ente.api.settings.apps.public-albums` {#opt-services.ente.api.settings.apps.public-albums}

If you're running a self hosted instance and wish to serve public links,
set this to the URL where your albums web app is running.

*Type:* string

*Default:* `"https://albums.ente.io"`

*Declared by:* [`nixos/modules/services/web-apps/ente.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix)

## `services.ente.api.settings.db.host` {#opt-services.ente.api.settings.db.host}

The database host

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/ente.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix)

## `services.ente.api.settings.db.name` {#opt-services.ente.api.settings.db.name}

The database name

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/ente.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix)

## `services.ente.api.settings.db.port` {#opt-services.ente.api.settings.db.port}

The database port

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5432`

*Declared by:* [`nixos/modules/services/web-apps/ente.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix)

## `services.ente.api.settings.db.user` {#opt-services.ente.api.settings.db.user}

The database user

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/ente.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix)

## `services.ente.api.settings.http.port` {#opt-services.ente.api.settings.http.port}

The HTTP port for the museum API service.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/web-apps/ente.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix)

## `services.ente.api.user` {#opt-services.ente.api.user}

User under which museum runs. If you set this option you must make sure the user exists.

*Type:* string

*Default:* `"ente"`

*Declared by:* [`nixos/modules/services/web-apps/ente.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix)

## `services.ente.web.domains.accounts` {#opt-services.ente.web.domains.accounts}

The domain under which the accounts frontend will be served.

*Type:* string

*Example:* `"accounts.ente.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/ente.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix)

## `services.ente.web.domains.albums` {#opt-services.ente.web.domains.albums}

The domain under which the albums frontend will be served.

*Type:* string

*Example:* `"albums.ente.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/ente.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix)

## `services.ente.web.domains.api` {#opt-services.ente.web.domains.api}

The domain under which the api is served. This will NOT serve the api itself,
but is a required setting to host the frontends! This will automatically be set
for you if you enable both the api server and web frontends.

*Type:* string

*Example:* `"api.ente.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/ente.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix)

## `services.ente.web.domains.cast` {#opt-services.ente.web.domains.cast}

The domain under which the cast frontend will be served.

*Type:* string

*Example:* `"cast.ente.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/ente.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix)

## `services.ente.web.domains.photos` {#opt-services.ente.web.domains.photos}

The domain under which the photos frontend will be served.

*Type:* string

*Example:* `"photos.ente.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/ente.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix)

## `services.ente.web.enable` {#opt-services.ente.web.enable}

Whether to enable Ente web frontend (Photos, Albums).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/ente.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix)

## `services.ente.web.package` {#opt-services.ente.web.package}

The ente-web package to use.

*Type:* package

*Default:* `pkgs.ente-web`

*Declared by:* [`nixos/modules/services/web-apps/ente.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ente.nix)

## `services.envfs.enable` {#opt-services.envfs.enable}

Fuse filesystem that returns symlinks to executables based on the PATH
of the requesting process. This is useful to execute shebangs on NixOS
that assume hard coded locations in locations like /bin or /usr/bin
etc.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/tasks/filesystems/envfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/envfs.nix)

## `services.envfs.extraFallbackPathCommands` {#opt-services.envfs.extraFallbackPathCommands}

Extra commands to run in the package that contains fallback executables in case not other executable is found

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"ln -s $''{pkgs.bash}/bin/bash $out/bash"`

*Declared by:* [`nixos/modules/tasks/filesystems/envfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/envfs.nix)

## `services.envfs.package` {#opt-services.envfs.package}

Which package to use for the envfs.

*Type:* package

*Default:* `pkgs.envfs`

*Declared by:* [`nixos/modules/tasks/filesystems/envfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/envfs.nix)

## `services.envoy.enable` {#opt-services.envoy.enable}

Whether to enable Envoy reverse proxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/envoy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/envoy.nix)

## `services.envoy.package` {#opt-services.envoy.package}

The envoy package to use.

*Type:* package

*Default:* `pkgs.envoy`

*Declared by:* [`nixos/modules/services/networking/envoy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/envoy.nix)

## `services.envoy.requireValidConfig` {#opt-services.envoy.requireValidConfig}

Whether a failure during config validation at build time is fatal.
When the config can't be checked during build time, for example when it includes
other files, disable this option.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/envoy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/envoy.nix)

## `services.envoy.settings` {#opt-services.envoy.settings}

Specify the configuration for Envoy in Nix.

*Type:* JSON value

*Default:* `{ }`

*Example:*

``` nix
{
  admin = {
    access_log_path = "/dev/null";
    address = {
      socket_address = {
        protocol = "TCP";
        address = "127.0.0.1";
        port_value = 9901;
      };
    };
  };
  static_resources = {
    listeners = [];
    clusters = [];
  };
}
```

*Declared by:* [`nixos/modules/services/networking/envoy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/envoy.nix)

## `services.epgstation.database.name` {#opt-services.epgstation.database.name}

Name of the MySQL database that holds EPGStation's data.

*Type:* string

*Default:* `"epgstation"`

*Declared by:* [`nixos/modules/services/video/epgstation/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/epgstation/default.nix)

## `services.epgstation.database.passwordFile` {#opt-services.epgstation.database.passwordFile}

A file containing the password for the database named
`database.name`.

*Type:* absolute path

*Example:* `"/run/keys/epgstation-db-password"`

*Declared by:* [`nixos/modules/services/video/epgstation/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/epgstation/default.nix)

## `services.epgstation.enable` {#opt-services.epgstation.enable}

Whether to enable EPGStation: DVR system for Mirakurun-managed TV tuners.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/video/epgstation/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/epgstation/default.nix)

## `services.epgstation.ffmpeg` {#opt-services.epgstation.ffmpeg}

The ffmpeg package to use.

*Type:* package

*Default:* `pkgs.ffmpeg-headless`

*Example:* `ffmpeg-full`

*Declared by:* [`nixos/modules/services/video/epgstation/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/epgstation/default.nix)

## `services.epgstation.openFirewall` {#opt-services.epgstation.openFirewall}

Open ports in the firewall for the EPGStation web interface.

::: warning
Exposing EPGStation to the open internet is generally advised
against. Only use it inside a trusted local network, or consider
putting it behind a VPN if you want remote access.
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/video/epgstation/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/epgstation/default.nix)

## `services.epgstation.package` {#opt-services.epgstation.package}

The epgstation package to use.

*Type:* package

*Default:* `pkgs.epgstation`

*Declared by:* [`nixos/modules/services/video/epgstation/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/epgstation/default.nix)

## `services.epgstation.settings` {#opt-services.epgstation.settings}

Options to add to config.yml.

Documentation:
[https://github.com/l3tnun/EPGStation/blob/master/doc/conf-manual.md](https://github.com/l3tnun/EPGStation/blob/master/doc/conf-manual.md)

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Example:*

``` nix
{
  conflictPriority = 10;
  recPriority = 20;
}
```

*Declared by:* [`nixos/modules/services/video/epgstation/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/epgstation/default.nix)

## `services.epgstation.settings.clientSocketioPort` {#opt-services.epgstation.settings.clientSocketioPort}

Socket.io port that the web client is going to connect to. This may
be different from [`services.epgstation.settings.socketioPort`](#opt-services.epgstation.settings.socketioPort) if
EPGStation is hidden behind a reverse proxy.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `config.services.epgstation.settings.socketioPort`

*Declared by:* [`nixos/modules/services/video/epgstation/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/epgstation/default.nix)

## `services.epgstation.settings.concurrentEncodeNum` {#opt-services.epgstation.settings.concurrentEncodeNum}

The maximum number of encoding jobs that EPGStation would run at the
same time.

*Type:* positive integer, meaning \>0

*Default:* `1`

*Declared by:* [`nixos/modules/services/video/epgstation/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/epgstation/default.nix)

## `services.epgstation.settings.encode` {#opt-services.epgstation.settings.encode}

Encoding presets for recorded videos.

*Type:* list of (attribute set)

*Default:*

``` nix
[
  {
    name = "H.264";
    cmd = "%NODE% config.services.epgstation.package/libexec/enc.js";
    suffix = ".mp4";
  }
]
```

*Declared by:* [`nixos/modules/services/video/epgstation/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/epgstation/default.nix)

## `services.epgstation.settings.encodeProcessNum` {#opt-services.epgstation.settings.encodeProcessNum}

The maximum number of processes that EPGStation would allow to run
at the same time for encoding or streaming videos.

*Type:* positive integer, meaning \>0

*Default:* `4`

*Declared by:* [`nixos/modules/services/video/epgstation/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/epgstation/default.nix)

## `services.epgstation.settings.mirakurunPath` {#opt-services.epgstation.settings.mirakurunPath}

URL to connect to Mirakurun.

*Type:* string

*Default:*

``` nix
"http+unix://${lib.replaceStrings ["/"] ["%2F"] config.services.mirakurun.unixSocket}"
```

*Example:* `"http://localhost:40772"`

*Declared by:* [`nixos/modules/services/video/epgstation/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/epgstation/default.nix)

## `services.epgstation.settings.port` {#opt-services.epgstation.settings.port}

HTTP port for EPGStation to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `20772`

*Declared by:* [`nixos/modules/services/video/epgstation/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/epgstation/default.nix)

## `services.epgstation.settings.socketioPort` {#opt-services.epgstation.settings.socketioPort}

Socket.io port for EPGStation to listen on. It is valid to share
ports with [`services.epgstation.settings.port`](#opt-services.epgstation.settings.port).

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `config.services.epgstation.settings.port + 1`

*Declared by:* [`nixos/modules/services/video/epgstation/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/epgstation/default.nix)

## `services.epgstation.usePreconfiguredStreaming` {#opt-services.epgstation.usePreconfiguredStreaming}

Use preconfigured default streaming options.

Upstream defaults:
[https://github.com/l3tnun/EPGStation/blob/master/config/config.yml.template](https://github.com/l3tnun/EPGStation/blob/master/config/config.yml.template)

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/video/epgstation/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/epgstation/default.nix)

## `services.epmd.enable` {#opt-services.epmd.enable}

Whether to enable socket activation for Erlang Port Mapper Daemon (epmd),
which acts as a name server on all hosts involved in distributed
Erlang computations.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/epmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/epmd.nix)

## `services.epmd.listenStream` {#opt-services.epmd.listenStream}

the listenStream used by the systemd socket.
see [https://www.freedesktop.org/software/systemd/man/systemd.socket.html#ListenStream=](https://www.freedesktop.org/software/systemd/man/systemd.socket.html#ListenStream=) for more information.
use this to change the port epmd will run on.
if not defined, epmd will use "\[::\]:4369"

*Type:* string or list of string

*Default:* `"[::]:4369"`

*Declared by:* [`nixos/modules/services/networking/epmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/epmd.nix)

## `services.epmd.package` {#opt-services.epmd.package}

The erlang package to use.

*Type:* package

*Default:* `pkgs.beamPackages.erlang`

*Declared by:* [`nixos/modules/services/networking/epmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/epmd.nix)

## `services.ergo.api.keyHash` {#opt-services.ergo.api.keyHash}

Hex-encoded Blake2b256 hash of an API key as a 64-chars long Base16 string.

*Type:* null or string

*Default:* `null`

*Example:* `"324dcf027dd4a30a932c441f365a25e86b173defa4b8e58948253471b81b72cf"`

*Declared by:* [`nixos/modules/services/networking/ergo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ergo.nix)

## `services.ergo.api.listen.ip` {#opt-services.ergo.api.listen.ip}

IP address that the Ergo node API should listen on if `api.keyHash` is defined.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/networking/ergo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ergo.nix)

## `services.ergo.api.listen.port` {#opt-services.ergo.api.listen.port}

Listen port for the API endpoint if `api.keyHash` is defined.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9052`

*Declared by:* [`nixos/modules/services/networking/ergo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ergo.nix)

## `services.ergo.dataDir` {#opt-services.ergo.dataDir}

The data directory for the Ergo node.

*Type:* absolute path

*Default:* `"/var/lib/ergo"`

*Declared by:* [`nixos/modules/services/networking/ergo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ergo.nix)

## `services.ergo.enable` {#opt-services.ergo.enable}

Whether to enable Ergo service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ergo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ergo.nix)

## `services.ergo.group` {#opt-services.ergo.group}

The group as which to run the Ergo node.

*Type:* string

*Default:* `config.services.ergo.user`

*Declared by:* [`nixos/modules/services/networking/ergo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ergo.nix)

## `services.ergo.listen.ip` {#opt-services.ergo.listen.ip}

IP address on which the Ergo node should listen.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/networking/ergo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ergo.nix)

## `services.ergo.listen.port` {#opt-services.ergo.listen.port}

Listen port for the Ergo node.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9006`

*Declared by:* [`nixos/modules/services/networking/ergo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ergo.nix)

## `services.ergo.openFirewall` {#opt-services.ergo.openFirewall}

Open ports in the firewall for the Ergo node as well as the API.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ergo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ergo.nix)

## `services.ergo.testnet` {#opt-services.ergo.testnet}

Connect to testnet network instead of the default mainnet.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ergo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ergo.nix)

## `services.ergo.user` {#opt-services.ergo.user}

The user as which to run the Ergo node.

*Type:* string

*Default:* `"ergo"`

*Declared by:* [`nixos/modules/services/networking/ergo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ergo.nix)

## `services.ergochat.configFile` {#opt-services.ergochat.configFile}

Path to configuration file.
Setting this will skip any configuration done via `settings`

*Type:* absolute path

*Default:* generated config file from `settings`

*Declared by:* [`nixos/modules/services/networking/ergochat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ergochat.nix)

## `services.ergochat.enable` {#opt-services.ergochat.enable}

Whether to enable Ergo IRC daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ergochat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ergochat.nix)

## `services.ergochat.openFilesLimit` {#opt-services.ergochat.openFilesLimit}

Maximum number of open files. Limits the clients and server connections.

*Type:* signed integer

*Default:* `1024`

*Declared by:* [`nixos/modules/services/networking/ergochat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ergochat.nix)

## `services.ergochat.settings` {#opt-services.ergochat.settings}

Ergo IRC daemon configuration file.
https://raw.githubusercontent.com/ergochat/ergo/master/default.yaml

*Type:* YAML 1.1 value

*Default:*

``` nix
{
  accounts = {
    authentication-enabled = true;
    multiclient = {
      allowed-by-default = true;
      always-on = "opt-out";
      auto-away = "opt-out";
      enabled = true;
    };
    registration = {
      allow-before-connect = true;
      bcrypt-cost = 4;
      email-verification = {
        enabled = false;
      };
      enabled = true;
      throttling = {
        duration = "10m";
        enabled = true;
        max-attempts = 30;
      };
    };
  };
  channels = {
    default-modes = "+ntC";
    registration = {
      enabled = true;
    };
  };
  datastore = {
    autoupgrade = true;
    path = "/var/lib/ergo/ircd.db";
  };
  history = {
    autoreplay-on-join = 0;
    autoresize-window = "3d";
    channel-length = 2048;
    chathistory-maxmessages = 100;
    client-length = 256;
    enabled = true;
    restrictions = {
      expire-time = "1w";
      grace-period = "1h";
      query-cutoff = "none";
    };
    retention = {
      allow-individual-delete = false;
      enable-account-indexing = false;
    };
    tagmsg-storage = {
      default = false;
      whitelist = [
        "+draft/react"
        "+react"
      ];
    };
    znc-maxmessages = 2048;
  };
  limits = {
    awaylen = 390;
    channellen = 64;
    identlen = 20;
    kicklen = 390;
    nicklen = 32;
    topiclen = 390;
  };
  network = {
    name = "testnetwork";
  };
  server = {
    casemapping = "permissive";
    check-ident = false;
    enforce-utf = true;
    forward-confirm-hostnames = false;
    ip-cloaking = {
      enabled = false;
    };
    ip-limits = {
      count = false;
      throttle = false;
    };
    listeners = {
      ":6667" = { };
    };
    lookup-hostnames = false;
    max-sendq = "1M";
    name = "example.com";
    relaymsg = {
      enabled = false;
    };
  };
}
```

*Declared by:* [`nixos/modules/services/networking/ergochat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ergochat.nix)

## `services.erigon.enable` {#opt-services.erigon.enable}

Whether to enable Ethereum implementation on the efficiency frontier.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/erigon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/erigon.nix)

## `services.erigon.extraArgs` {#opt-services.erigon.extraArgs}

Additional arguments passed to Erigon

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/erigon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/erigon.nix)

## `services.erigon.package` {#opt-services.erigon.package}

The erigon package to use.

*Type:* package

*Default:* `pkgs.erigon`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/erigon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/erigon.nix)

## `services.erigon.secretJwtPath` {#opt-services.erigon.secretJwtPath}

Path to the secret jwt used for the http api authentication.

*Type:* absolute path

*Default:* `""`

*Example:* `"config.age.secrets.ERIGON_JWT.path"`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/erigon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/erigon.nix)

## `services.erigon.settings` {#opt-services.erigon.settings}

Configuration for Erigon
Refer to [https://github.com/ledgerwatch/erigon#usage](https://github.com/ledgerwatch/erigon#usage) for details on supported values.

*Type:* TOML value

*Default:*

``` nix
{
  datadir = "/var/lib/erigon";
  chain = "mainnet";
  http = true;
  "http.port" = 8545;
  "http.api" = ["eth" "debug" "net" "trace" "web3" "erigon"];
  ws = true;
  port = 30303;
  "authrpc.port" = 8551;
  "torrent.port" = 42069;
  "private.api.addr" = "localhost:9090";
  "log.console.verbosity" = 3; # info
}
```

*Example:*

``` nix
{
  "authrpc.port" = 8551;
  chain = "mainnet";
  datadir = "/var/lib/erigon";
  http = true;
  "http.api" = [
    "eth"
    "debug"
    "net"
    "trace"
    "web3"
    "erigon"
  ];
  "http.port" = 8545;
  "log.console.verbosity" = 3;
  port = 30303;
  "private.api.addr" = "localhost:9090";
  "torrent.port" = 42069;
  ws = true;
}
```

*Declared by:* [`nixos/modules/services/blockchain/ethereum/erigon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/erigon.nix)

## `services.errbot.instances` {#opt-services.errbot.instances}

Errbot instance configs

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/errbot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/errbot.nix)

## `services.errbot.instances.<name>.admins` {#opt-services.errbot.instances._name_.admins}

List of identifiers of errbot admins.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/errbot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/errbot.nix)

## `services.errbot.instances.<name>.backend` {#opt-services.errbot.instances._name_.backend}

Errbot backend name.

*Type:* string

*Default:* `"XMPP"`

*Declared by:* [`nixos/modules/services/misc/errbot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/errbot.nix)

## `services.errbot.instances.<name>.dataDir` {#opt-services.errbot.instances._name_.dataDir}

Data directory for errbot instance.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/errbot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/errbot.nix)

## `services.errbot.instances.<name>.extraConfig` {#opt-services.errbot.instances._name_.extraConfig}

String to be appended to the config verbatim

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/errbot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/errbot.nix)

## `services.errbot.instances.<name>.identity` {#opt-services.errbot.instances._name_.identity}

Errbot identity configuration

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/errbot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/errbot.nix)

## `services.errbot.instances.<name>.logLevel` {#opt-services.errbot.instances._name_.logLevel}

Errbot log level

*Type:* string

*Default:* `"INFO"`

*Declared by:* [`nixos/modules/services/misc/errbot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/errbot.nix)

## `services.errbot.instances.<name>.plugins` {#opt-services.errbot.instances._name_.plugins}

List of errbot plugin derivations.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/errbot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/errbot.nix)

## `services.ersatztv.baseUrl` {#opt-services.ersatztv.baseUrl}

Base URL to support reverse proxies that use paths (e.g. `/ersatztv`)

*Type:* string

*Default:* `"/"`

*Declared by:* [`nixos/modules/services/misc/ersatztv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ersatztv.nix)

## `services.ersatztv.enable` {#opt-services.ersatztv.enable}

Whether to enable ErsatzTV.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/ersatztv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ersatztv.nix)

## `services.ersatztv.environment` {#opt-services.ersatztv.environment}

Environment variables to set for the ErsatzTV service.

*Type:* attribute set of (string or signed integer or floating point number or boolean or absolute path or package)

*Default:*

``` nix
{
  ETV_BASE_URL = "/";
  ETV_UI_PORT = 8409;
}
```

*Example:*

``` nix
{
  ETV_STREAMING_PORT = 8001;
  ETV_UI_PORT = 8000;
}
```

*Declared by:* [`nixos/modules/services/misc/ersatztv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ersatztv.nix)

## `services.ersatztv.group` {#opt-services.ersatztv.group}

Group under which ErsatzTV runs.

*Type:* string

*Default:* `"ersatztv"`

*Declared by:* [`nixos/modules/services/misc/ersatztv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ersatztv.nix)

## `services.ersatztv.openFirewall` {#opt-services.ersatztv.openFirewall}

Open the default ports in the firewall for the server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/ersatztv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ersatztv.nix)

## `services.ersatztv.package` {#opt-services.ersatztv.package}

The ersatztv package to use.

*Type:* package

*Default:* `pkgs.ersatztv`

*Declared by:* [`nixos/modules/services/misc/ersatztv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ersatztv.nix)

## `services.ersatztv.user` {#opt-services.ersatztv.user}

User account under which ErsatzTV runs.

*Type:* string

*Default:* `"ersatztv"`

*Declared by:* [`nixos/modules/services/misc/ersatztv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ersatztv.nix)

## `services.esdm.enable` {#opt-services.esdm.enable}

Whether to enable ESDM service configuration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/esdm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/esdm.nix)

## `services.esdm.enableLinuxCompatServices` {#opt-services.esdm.enableLinuxCompatServices}

Enable /dev/random, /dev/urandom and /proc/sys/kernel/random/\* userspace wrapper.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/esdm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/esdm.nix)

## `services.esdm.package` {#opt-services.esdm.package}

The esdm package to use.

*Type:* package

*Default:* `pkgs.esdm`

*Declared by:* [`nixos/modules/services/security/esdm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/esdm.nix)

## `services.espanso.enable` {#opt-services.espanso.enable}

Whether to enable Espanso.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/espanso.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/espanso.nix)

## `services.espanso.extraPackages` {#opt-services.espanso.extraPackages}

Extra packages to be added to Espanso service path.

*Type:* list of package

*Default:* `[ ]`

*Example:* `with pkgs; [ bash curl python3 ];`

*Declared by:* [`nixos/modules/services/desktops/espanso.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/espanso.nix)

## `services.espanso.package` {#opt-services.espanso.package}

The espanso package to use.

*Type:* package

*Default:* `pkgs.espanso`

*Example:* `pkgs.espanso-wayland`

*Declared by:* [`nixos/modules/services/desktops/espanso.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/espanso.nix)

## `services.esphome.address` {#opt-services.esphome.address}

ESPHome Device Builder HTTP address

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/home-automation/esphome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/esphome.nix)

## `services.esphome.allowedDevices` {#opt-services.esphome.allowedDevices}

A list of device nodes to which `esphome-device-builder` has access to.
Refer to DeviceAllow in `systemd.resource-control(5)` for more information.
Beware that if a device is referred to by an absolute path instead of a device category,
it will only allow devices that already are plugged in when the service is started.

*Type:* list of string

*Default:*

``` nix
[
  "char-ttyS"
  "char-ttyUSB"
]
```

*Example:*

``` nix
[
  "/dev/serial/by-id/usb-Silicon_Labs_CP2102_USB_to_UART_Bridge_Controller_0001-if00-port0"
]
```

*Declared by:* [`nixos/modules/services/home-automation/esphome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/esphome.nix)

## `services.esphome.enable` {#opt-services.esphome.enable}

Whether to enable ESPHome Device Builder, for making custom firmwares for ESP32/ESP8266.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/esphome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/esphome.nix)

## `services.esphome.enableUnixSocket` {#opt-services.esphome.enableUnixSocket}

Listen on a unix socket `/run/esphome/esphome.sock` instead of the TCP port.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/home-automation/esphome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/esphome.nix)

## `services.esphome.environment` {#opt-services.esphome.environment}

Extra environment variables to pass to ESPHome. Secrets should be passed
using the [`services.esphome.environmentFile`](#opt-services.esphome.environmentFile) option.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  ESPHOME_TRUSTED_DOMAINS = "dashboard.example.com";
}
```

*Declared by:* [`nixos/modules/services/home-automation/esphome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/esphome.nix)

## `services.esphome.environmentFile` {#opt-services.esphome.environmentFile}

Path to an environment file.
Use this option for setting the dashboard password.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/home-automation/esphome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/esphome.nix)

## `services.esphome.extraArgs` {#opt-services.esphome.extraArgs}

Extra command line arguments for the ESPHome Device Builder.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/home-automation/esphome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/esphome.nix)

## `services.esphome.logLevel` {#opt-services.esphome.logLevel}

Log level of the ESPHome Device Builder

*Type:* one of "debug", "info", "warning", "error"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/home-automation/esphome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/esphome.nix)

## `services.esphome.openFirewall` {#opt-services.esphome.openFirewall}

Whether to open the firewall for the specified port.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/home-automation/esphome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/esphome.nix)

## `services.esphome.package` {#opt-services.esphome.package}

The esphome-device-builder package to use.

*Type:* package

*Default:* `pkgs.esphome-device-builder`

*Declared by:* [`nixos/modules/services/home-automation/esphome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/esphome.nix)

## `services.esphome.port` {#opt-services.esphome.port}

ESPHome Device Builder HTTP port

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6052`

*Declared by:* [`nixos/modules/services/home-automation/esphome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/esphome.nix)

## `services.esphome.remoteBuildAddress` {#opt-services.esphome.remoteBuildAddress}

Address of the remote build server

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/home-automation/esphome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/esphome.nix)

## `services.esphome.remoteBuildOnly` {#opt-services.esphome.remoteBuildOnly}

Only run a headless remote build server and disable the local web dashboard

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/home-automation/esphome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/esphome.nix)

## `services.esphome.remoteBuildPort` {#opt-services.esphome.remoteBuildPort}

Port of the remote build server

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6055`

*Declared by:* [`nixos/modules/services/home-automation/esphome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/esphome.nix)

## `services.esphome.trustedDomains` {#opt-services.esphome.trustedDomains}

Hostnames the WebSocket handshake trusts (case-insensitive, port-tolerant)

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/home-automation/esphome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/esphome.nix)

## `services.etcd.advertiseClientUrls` {#opt-services.etcd.advertiseClientUrls}

Etcd list of this member's client URLs to advertise to the rest of the cluster.

*Type:* list of string

*Default:* `config.services.etcd.listenClientUrls`

*Declared by:* [`nixos/modules/services/databases/etcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/etcd.nix)

## `services.etcd.certFile` {#opt-services.etcd.certFile}

Cert file to use for clients

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/etcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/etcd.nix)

## `services.etcd.clientCertAuth` {#opt-services.etcd.clientCertAuth}

Whether to use certs for client authentication

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/etcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/etcd.nix)

## `services.etcd.dataDir` {#opt-services.etcd.dataDir}

Etcd data directory.

*Type:* absolute path

*Default:* `"/var/lib/etcd"`

*Declared by:* [`nixos/modules/services/databases/etcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/etcd.nix)

## `services.etcd.discovery` {#opt-services.etcd.discovery}

Etcd discovery url

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/databases/etcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/etcd.nix)

## `services.etcd.enable` {#opt-services.etcd.enable}

Whether to enable etcd.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/etcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/etcd.nix)

## `services.etcd.extraConf` {#opt-services.etcd.extraConf}

Etcd extra configuration. See
[https://github.com/coreos/etcd/blob/master/Documentation/op-guide/configuration.md#configuration-flags](https://github.com/coreos/etcd/blob/master/Documentation/op-guide/configuration.md#configuration-flags)

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  "CORS" = "*";
  "NAME" = "default-name";
  "MAX_RESULT_BUFFER" = "1024";
  "MAX_CLUSTER_SIZE" = "9";
  "MAX_RETRY_ATTEMPTS" = "3";
}
```

*Declared by:* [`nixos/modules/services/databases/etcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/etcd.nix)

## `services.etcd.initialAdvertisePeerUrls` {#opt-services.etcd.initialAdvertisePeerUrls}

Etcd list of this member's peer URLs to advertise to rest of the cluster.

*Type:* list of string

*Default:* `config.services.etcd.listenPeerUrls`

*Declared by:* [`nixos/modules/services/databases/etcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/etcd.nix)

## `services.etcd.initialCluster` {#opt-services.etcd.initialCluster}

Etcd initial cluster configuration for bootstrapping.

*Type:* list of string

*Default:* `["${config.services.etcd.name}=http://127.0.0.1:2380"]`

*Declared by:* [`nixos/modules/services/databases/etcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/etcd.nix)

## `services.etcd.initialClusterState` {#opt-services.etcd.initialClusterState}

Etcd initial cluster configuration for bootstrapping.

*Type:* one of "new", "existing"

*Default:* `"new"`

*Declared by:* [`nixos/modules/services/databases/etcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/etcd.nix)

## `services.etcd.initialClusterToken` {#opt-services.etcd.initialClusterToken}

Etcd initial cluster token for etcd cluster during bootstrap.

*Type:* string

*Default:* `"etcd-cluster"`

*Declared by:* [`nixos/modules/services/databases/etcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/etcd.nix)

## `services.etcd.keyFile` {#opt-services.etcd.keyFile}

Key file to use for clients

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/etcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/etcd.nix)

## `services.etcd.listenClientUrls` {#opt-services.etcd.listenClientUrls}

Etcd list of URLs to listen on for client traffic.

*Type:* list of string

*Default:*

``` nix
[
  "http://127.0.0.1:2379"
]
```

*Declared by:* [`nixos/modules/services/databases/etcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/etcd.nix)

## `services.etcd.listenPeerUrls` {#opt-services.etcd.listenPeerUrls}

Etcd list of URLs to listen on for peer traffic.

*Type:* list of string

*Default:*

``` nix
[
  "http://127.0.0.1:2380"
]
```

*Declared by:* [`nixos/modules/services/databases/etcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/etcd.nix)

## `services.etcd.name` {#opt-services.etcd.name}

Etcd unique node name.

*Type:* string

*Default:* `config.networking.hostName`

*Declared by:* [`nixos/modules/services/databases/etcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/etcd.nix)

## `services.etcd.openFirewall` {#opt-services.etcd.openFirewall}

Open etcd ports in the firewall.
Ports opened:

- 2379/tcp for client requests
- 2380/tcp for peer communication

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/etcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/etcd.nix)

## `services.etcd.package` {#opt-services.etcd.package}

The etcd package to use.

*Type:* package

*Default:* `pkgs.etcd`

*Declared by:* [`nixos/modules/services/databases/etcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/etcd.nix)

## `services.etcd.peerCertFile` {#opt-services.etcd.peerCertFile}

Cert file to use for peer to peer communication

*Type:* null or absolute path

*Default:* `config.services.etcd.certFile`

*Declared by:* [`nixos/modules/services/databases/etcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/etcd.nix)

## `services.etcd.peerClientCertAuth` {#opt-services.etcd.peerClientCertAuth}

Whether to check all incoming peer requests from the cluster for valid client certificates signed by the supplied CA

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/etcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/etcd.nix)

## `services.etcd.peerKeyFile` {#opt-services.etcd.peerKeyFile}

Key file to use for peer to peer communication

*Type:* null or absolute path

*Default:* `config.services.etcd.keyFile`

*Declared by:* [`nixos/modules/services/databases/etcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/etcd.nix)

## `services.etcd.peerTrustedCaFile` {#opt-services.etcd.peerTrustedCaFile}

Certificate authority file to use for peer to peer communication

*Type:* null or absolute path

*Default:* `config.services.etcd.trustedCaFile`

*Declared by:* [`nixos/modules/services/databases/etcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/etcd.nix)

## `services.etcd.trustedCaFile` {#opt-services.etcd.trustedCaFile}

Certificate authority file to use for clients

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/etcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/etcd.nix)

## `services.etebase-server.dataDir` {#opt-services.etebase-server.dataDir}

Directory to store the Etebase server data.

*Type:* string

*Default:* `"/var/lib/etebase-server"`

*Declared by:* [`nixos/modules/services/misc/etebase-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/etebase-server.nix)

## `services.etebase-server.enable` {#opt-services.etebase-server.enable}

Whether to enable the Etebase server.

Once enabled you need to create an admin user by invoking the
shell command `etebase-server createsuperuser` with
the user specified by the `user` option or a superuser.
Then you can login and create accounts on your-etebase-server.com/admin

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/etebase-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/etebase-server.nix)

## `services.etebase-server.openFirewall` {#opt-services.etebase-server.openFirewall}

Whether to open ports in the firewall for the server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/etebase-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/etebase-server.nix)

## `services.etebase-server.package` {#opt-services.etebase-server.package}

The etebase-server package to use.

*Type:* package

*Default:* `pkgs.etebase-server`

*Declared by:* [`nixos/modules/services/misc/etebase-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/etebase-server.nix)

## `services.etebase-server.port` {#opt-services.etebase-server.port}

Port to listen on.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8001`

*Declared by:* [`nixos/modules/services/misc/etebase-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/etebase-server.nix)

## `services.etebase-server.settings` {#opt-services.etebase-server.settings}

Configuration for `etebase-server`. Refer to
[https://github.com/etesync/server/blob/master/etebase-server.ini.example](https://github.com/etesync/server/blob/master/etebase-server.ini.example)
and [https://github.com/etesync/server/wiki](https://github.com/etesync/server/wiki)
for details on supported values.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  allowed_hosts = {
    allowed_host2 = "localhost";
  };
  global = {
    debug = true;
    media_root = "/path/to/media";
  };
}
```

*Declared by:* [`nixos/modules/services/misc/etebase-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/etebase-server.nix)

## `services.etebase-server.settings.allowed_hosts.allowed_host1` {#opt-services.etebase-server.settings.allowed_hosts.allowed_host1}

The main host that is allowed access.

*Type:* string

*Default:* `"0.0.0.0"`

*Example:* `"localhost"`

*Declared by:* [`nixos/modules/services/misc/etebase-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/etebase-server.nix)

## `services.etebase-server.settings.database.engine` {#opt-services.etebase-server.settings.database.engine}

The database engine to use.

*Type:* one of "django.db.backends.sqlite3", "django.db.backends.postgresql"

*Default:* `"django.db.backends.sqlite3"`

*Declared by:* [`nixos/modules/services/misc/etebase-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/etebase-server.nix)

## `services.etebase-server.settings.database.name` {#opt-services.etebase-server.settings.database.name}

The database name.

*Type:* string

*Default:* `"${config.services.etebase-server.dataDir}/db.sqlite3"`

*Declared by:* [`nixos/modules/services/misc/etebase-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/etebase-server.nix)

## `services.etebase-server.settings.global.debug` {#opt-services.etebase-server.settings.global.debug}

Whether to set django's DEBUG flag.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/etebase-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/etebase-server.nix)

## `services.etebase-server.settings.global.media_root` {#opt-services.etebase-server.settings.global.media_root}

The media directory.

*Type:* string

*Default:* `"${config.services.etebase-server.dataDir}/media"`

*Declared by:* [`nixos/modules/services/misc/etebase-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/etebase-server.nix)

## `services.etebase-server.settings.global.secret_file` {#opt-services.etebase-server.settings.global.secret_file}

The path to a file containing the secret
used as django's SECRET\_KEY.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/etebase-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/etebase-server.nix)

## `services.etebase-server.settings.global.static_root` {#opt-services.etebase-server.settings.global.static_root}

The directory for static files.

*Type:* string

*Default:* `"${config.services.etebase-server.dataDir}/static"`

*Declared by:* [`nixos/modules/services/misc/etebase-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/etebase-server.nix)

## `services.etebase-server.unixSocket` {#opt-services.etebase-server.unixSocket}

The path to the socket to bind to.

*Type:* null or string

*Default:* `null`

*Example:* `"/run/etebase-server/etebase-server.sock"`

*Declared by:* [`nixos/modules/services/misc/etebase-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/etebase-server.nix)

## `services.etebase-server.user` {#opt-services.etebase-server.user}

User under which Etebase server runs.

*Type:* string

*Default:* `"etebase-server"`

*Declared by:* [`nixos/modules/services/misc/etebase-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/etebase-server.nix)

## `services.eternal-terminal.enable` {#opt-services.eternal-terminal.enable}

Whether to enable Eternal Terminal server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/eternal-terminal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/eternal-terminal.nix)

## `services.eternal-terminal.logSize` {#opt-services.eternal-terminal.logSize}

The maximum log size.

*Type:* signed integer

*Default:* `20971520`

*Declared by:* [`nixos/modules/services/networking/eternal-terminal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/eternal-terminal.nix)

## `services.eternal-terminal.port` {#opt-services.eternal-terminal.port}

The port the server should listen on. Will use the server's default (2022) if not specified.

Make sure to open this port in the firewall if necessary.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `2022`

*Declared by:* [`nixos/modules/services/networking/eternal-terminal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/eternal-terminal.nix)

## `services.eternal-terminal.silent` {#opt-services.eternal-terminal.silent}

If enabled, disables all logging.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/eternal-terminal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/eternal-terminal.nix)

## `services.eternal-terminal.telemetry` {#opt-services.eternal-terminal.telemetry}

Collects anonymous usage data and crash reports.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/eternal-terminal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/eternal-terminal.nix)

## `services.eternal-terminal.verbosity` {#opt-services.eternal-terminal.verbosity}

The verbosity level (0-9).

*Type:* one of 0, 1, 2, 3, 4, 5, 6, 7, 8, 9

*Default:* `0`

*Declared by:* [`nixos/modules/services/networking/eternal-terminal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/eternal-terminal.nix)

## `services.etesync-dav.apiUrl` {#opt-services.etesync-dav.apiUrl}

The url to the etesync API.

*Type:* string

*Default:* `"https://api.etebase.com/partner/etesync/"`

*Declared by:* [`nixos/modules/services/misc/etesync-dav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/etesync-dav.nix)

## `services.etesync-dav.enable` {#opt-services.etesync-dav.enable}

Whether to enable etesync-dav, end-to-end encrypted sync for contacts, calendars and tasks.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/etesync-dav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/etesync-dav.nix)

## `services.etesync-dav.host` {#opt-services.etesync-dav.host}

The server host address.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/misc/etesync-dav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/etesync-dav.nix)

## `services.etesync-dav.openFirewall` {#opt-services.etesync-dav.openFirewall}

Whether to open the firewall for the specified port.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/etesync-dav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/etesync-dav.nix)

## `services.etesync-dav.port` {#opt-services.etesync-dav.port}

The server host port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `37358`

*Declared by:* [`nixos/modules/services/misc/etesync-dav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/etesync-dav.nix)

## `services.etesync-dav.sslCertificate` {#opt-services.etesync-dav.sslCertificate}

Path to server SSL certificate. It will be copied into
etesync-dav's data directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/etesync.crt"`

*Declared by:* [`nixos/modules/services/misc/etesync-dav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/etesync-dav.nix)

## `services.etesync-dav.sslCertificateKey` {#opt-services.etesync-dav.sslCertificateKey}

Path to server SSL certificate key.  It will be copied into
etesync-dav's data directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/etesync.key"`

*Declared by:* [`nixos/modules/services/misc/etesync-dav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/etesync-dav.nix)

## `services.evcc.enable` {#opt-services.evcc.enable}

Whether to enable EVCC, the extensible EV Charge Controller and Home Energy Management System.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/evcc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/evcc.nix)

## `services.evcc.environmentFile` {#opt-services.evcc.environmentFile}

File with environment variables to pass into the runtime environment.

Useful to pass secrets into the configuration, that get applied using `envsubst`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/evcc"`

*Declared by:* [`nixos/modules/services/home-automation/evcc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/evcc.nix)

## `services.evcc.extraArgs` {#opt-services.evcc.extraArgs}

Extra arguments to pass to the `evcc` executable.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/home-automation/evcc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/evcc.nix)

## `services.evcc.package` {#opt-services.evcc.package}

The evcc package to use.

*Type:* package

*Default:* `pkgs.evcc`

*Declared by:* [`nixos/modules/services/home-automation/evcc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/evcc.nix)

## `services.evcc.settings` {#opt-services.evcc.settings}

evcc configuration as a Nix attribute set. Supports substitution of secrets using `envsubst` from the `environmentFile`.

Check for possible options in the sample [evcc.dist.yaml](https://github.com/andig/evcc/blob/0.319.1/evcc.dist.yaml).

*Type:* YAML 1.1 value

*Default:* `null`

*Declared by:* [`nixos/modules/services/home-automation/evcc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/evcc.nix)

## `services.evdevremapkeys.enable` {#opt-services.evdevremapkeys.enable}

Whether to enable evdevremapkeys, a daemon to remap events on linux input devices.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/evdevremapkeys.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/evdevremapkeys.nix)

## `services.evdevremapkeys.settings` {#opt-services.evdevremapkeys.settings}

config.yaml for evdevremapkeys

*Type:* YAML 1.1 value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/evdevremapkeys.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/evdevremapkeys.nix)

## `services.evremap.enable` {#opt-services.evremap.enable}

Whether to enable evremap, a keyboard input remapper for Linux/Wayland systems.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/evremap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/evremap.nix)

## `services.evremap.settings` {#opt-services.evremap.settings}

Settings for evremap.

See the [upstream documentation](https://github.com/wez/evremap/blob/master/README.md#configuration)
for how to configure evremap.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/evremap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/evremap.nix)

## `services.evremap.settings.device_name` {#opt-services.evremap.settings.device_name}

The name of the device that should be remapped.

You can get a list of devices by running `evremap list-devices` with elevated permissions.

*Type:* string

*Example:* `"AT Translated Set 2 keyboard"`

*Declared by:* [`nixos/modules/services/misc/evremap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/evremap.nix)

## `services.evremap.settings.dual_role` {#opt-services.evremap.settings.dual_role}

List of dual-role remappings that output different key sequences based on whether the
input key is held or tapped.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    hold = [
      "KEY_LEFTCTRL"
    ];
    input = "KEY_CAPSLOCK";
    tap = [
      "KEY_ESC"
    ];
  }
]
```

*Declared by:* [`nixos/modules/services/misc/evremap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/evremap.nix)

## `services.evremap.settings.dual_role.*.hold` {#opt-services.evremap.settings.dual_role._.hold}

The key sequence that should be output when the input key is held.

You can get a list of keys by running `evremap list-keys`.

*Type:* list of key ID prefixed with BTN\_ or KEY\_

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/evremap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/evremap.nix)

## `services.evremap.settings.dual_role.*.input` {#opt-services.evremap.settings.dual_role._.input}

The key that should be remapped.

You can get a list of keys by running `evremap list-keys`.

*Type:* key ID prefixed with BTN\_ or KEY\_

*Declared by:* [`nixos/modules/services/misc/evremap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/evremap.nix)

## `services.evremap.settings.dual_role.*.tap` {#opt-services.evremap.settings.dual_role._.tap}

The key sequence that should be output when the input key is tapped.

You can get a list of keys by running `evremap list-keys`.

*Type:* list of key ID prefixed with BTN\_ or KEY\_

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/evremap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/evremap.nix)

## `services.evremap.settings.phys` {#opt-services.evremap.settings.phys}

The physical device name to listen on.

This attribute may be specified to disambiguate multiple devices with the same device name.
The physical device names of each device can be obtained by running `evremap list-devices` with elevated permissions.

*Type:* null or string

*Default:* `null`

*Example:* `"usb-0000:07:00.3-2.1.1/input0"`

*Declared by:* [`nixos/modules/services/misc/evremap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/evremap.nix)

## `services.evremap.settings.remap` {#opt-services.evremap.settings.remap}

List of remappings.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    input = [
      "KEY_LEFTALT"
      "KEY_UP"
    ];
    output = [
      "KEY_PAGEUP"
    ];
  }
]
```

*Declared by:* [`nixos/modules/services/misc/evremap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/evremap.nix)

## `services.evremap.settings.remap.*.input` {#opt-services.evremap.settings.remap._.input}

The key sequence that should be remapped.

You can get a list of keys by running `evremap list-keys`.

*Type:* list of key ID prefixed with BTN\_ or KEY\_

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/evremap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/evremap.nix)

## `services.evremap.settings.remap.*.output` {#opt-services.evremap.settings.remap._.output}

The key sequence that should be output when the input sequence is entered.

You can get a list of keys by running `evremap list-keys`.

*Type:* list of key ID prefixed with BTN\_ or KEY\_

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/evremap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/evremap.nix)

## `services.exim.config` {#opt-services.exim.config}

Verbatim Exim configuration.  This should not contain exim\_user,
exim\_group, exim\_path, or spool\_directory.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/mail/exim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/exim.nix)

## `services.exim.enable` {#opt-services.exim.enable}

Whether to enable the Exim mail transfer agent.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/mail/exim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/exim.nix)

## `services.exim.group` {#opt-services.exim.group}

Group to use when no root privileges are required.

*Type:* string

*Default:* `"exim"`

*Declared by:* [`nixos/modules/services/mail/exim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/exim.nix)

## `services.exim.package` {#opt-services.exim.package}

The exim package to use. This can be used to enable features such as LDAP or PAM support.

*Type:* package

*Default:* `pkgs.exim`

*Declared by:* [`nixos/modules/services/mail/exim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/exim.nix)

## `services.exim.queueRunnerInterval` {#opt-services.exim.queueRunnerInterval}

How often to spawn a new queue runner.

*Type:* string

*Default:* `"5m"`

*Declared by:* [`nixos/modules/services/mail/exim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/exim.nix)

## `services.exim.spoolDir` {#opt-services.exim.spoolDir}

Location of the spool directory of exim.

*Type:* absolute path

*Default:* `"/var/spool/exim"`

*Declared by:* [`nixos/modules/services/mail/exim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/exim.nix)

## `services.exim.user` {#opt-services.exim.user}

User to use when no root privileges are required.
In particular, this applies when receiving messages and when doing
remote deliveries.  (Local deliveries run as various non-root users,
typically as the owner of a local mailbox.) Specifying this value
as root is not supported.

*Type:* string

*Default:* `"exim"`

*Declared by:* [`nixos/modules/services/mail/exim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/exim.nix)

## `services.expressvpn.enable` {#opt-services.expressvpn.enable}

Enable the ExpressVPN daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/expressvpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/expressvpn.nix)
