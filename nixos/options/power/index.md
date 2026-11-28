# power {#sec-options-power}

## `power.ups.enable` {#opt-power.ups.enable}

Whether to enable support for Power Devices, such as Uninterruptible Power
Supplies, Power Distribution Units and Solar Controllers
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.maxStartDelay` {#opt-power.ups.maxStartDelay}

This can be set as a global variable above your first UPS
definition and it can also be set in a UPS section.  This value
controls how long upsdrvctl will wait for the driver to finish
starting.  This keeps your system from getting stuck due to a
broken driver or UPS.

*Type:* signed integer

*Default:* `45`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.mode` {#opt-power.ups.mode}

The MODE determines which part of the NUT is to be started, and
which configuration files must be modified.

The values of MODE can be:

- none: NUT is not configured, or use the Integrated Power
  Management, or use some external system to startup NUT
  components. So nothing is to be started.

- standalone: This mode address a local only configuration, with 1
  UPS protecting the local system. This implies to start the 3 NUT
  layers (driver, upsd and upsmon) and the matching configuration
  files. This mode can also address UPS redundancy.

- netserver: same as for the standalone configuration, but also
  need some more ACLs and possibly a specific LISTEN directive in
  upsd.conf.  Since this MODE is opened to the network, a special
  care should be applied to security concerns.

- netclient: this mode only requires upsmon.

*Type:* one of "none", "standalone", "netserver", "netclient"

*Default:* `"standalone"`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.openFirewall` {#opt-power.ups.openFirewall}

Open ports in the firewall for `upsd`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.package` {#opt-power.ups.package}

The nut package to use.

*Type:* package

*Default:* `pkgs.nut`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.schedulerRules` {#opt-power.ups.schedulerRules}

File which contains the rules to handle UPS events.

*Type:* string

*Example:* `"/etc/nixos/upssched.conf"`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.ups` {#opt-power.ups.ups}

This is where you configure all the UPSes that this system will be
monitoring directly.  These are usually attached to serial ports,
but USB devices are also supported.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.ups.<name>.description` {#opt-power.ups.ups._name_.description}

Description of the UPS.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.ups.<name>.directives` {#opt-power.ups.ups._name_.directives}

List of configuration directives for this UPS.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.ups.<name>.driver` {#opt-power.ups.ups._name_.driver}

Specify the program to run to talk to this UPS.  apcsmart,
bestups, and sec are some examples.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.ups.<name>.maxStartDelay` {#opt-power.ups.ups._name_.maxStartDelay}

This can be set as a global variable above your first UPS
definition and it can also be set in a UPS section.  This value
controls how long upsdrvctl will wait for the driver to finish
starting.  This keeps your system from getting stuck due to a
broken driver or UPS.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.ups.<name>.port` {#opt-power.ups.ups._name_.port}

The serial port to which your UPS is connected.  `/dev/ttyS0` is
usually the first port on Linux boxes, for example.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.ups.<name>.shutdownOrder` {#opt-power.ups.ups._name_.shutdownOrder}

When you have multiple UPSes on your system, you usually need to
turn them off in a certain order.  upsdrvctl shuts down all the
0s, then the 1s, 2s, and so on.  To exclude a UPS from the
shutdown sequence, set this to -1.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.ups.<name>.summary` {#opt-power.ups.ups._name_.summary}

Lines which would be added inside `ups.conf` for handling this UPS.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.upsd` {#opt-power.ups.upsd}

Options for the `upsd.conf` configuration file.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.upsd.enable` {#opt-power.ups.upsd.enable}

Whether to enable `upsd`.

*Type:* boolean

*Default:* `true` if `mode` is one of `standalone`, `netserver`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.upsd.extraConfig` {#opt-power.ups.upsd.extraConfig}

Additional lines to add to `upsd.conf`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.upsd.listen` {#opt-power.ups.upsd.listen}

Address of the interface for `upsd` to listen on.
See `upsd(8)` for details\`.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    address = "192.168.50.1";
  }
  {
    address = "::1";
    port = 5923;
  }
]
```

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.upsd.listen.*.address` {#opt-power.ups.upsd.listen._.address}

Address of the interface for `upsd` to listen on.
See `upsd.conf(5)` for details.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.upsd.listen.*.port` {#opt-power.ups.upsd.listen._.port}

TCP port for `upsd` to listen on.
See `upsd.conf(5)` for details.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3493`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.upsmon` {#opt-power.ups.upsmon}

Options for the `upsmon.conf` configuration file.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.upsmon.enable` {#opt-power.ups.upsmon.enable}

Whether to enable `upsmon`.

*Type:* boolean

*Default:* `true` if `mode` is one of `standalone`, `netserver`, `netclient`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.upsmon.group` {#opt-power.ups.upsmon.group}

Group for the default `nutmon` user. If the default user is created
and this is not specified, a default group will be created.

*Type:* string

*Default:* `"nutmon"`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.upsmon.monitor` {#opt-power.ups.upsmon.monitor}

Set of UPS to monitor. See `upsmon.conf(5)` for details.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.upsmon.monitor.<name>.passwordFile` {#opt-power.ups.upsmon.monitor._name_.passwordFile}

The full path to a file containing the password from
`upsd.users` for accessing this UPS. The password file
is read on service start.
See `upsmon.conf(5)` for details.

*Type:* string

*Default:* power.ups.users.${user}.passwordFile

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.upsmon.monitor.<name>.powerValue` {#opt-power.ups.upsmon.monitor._name_.powerValue}

Number of power supplies that the UPS feeds on this system.
See `upsmon.conf` for details.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.upsmon.monitor.<name>.system` {#opt-power.ups.upsmon.monitor._name_.system}

Identifier of the UPS to monitor, in this form: `<upsname>[@<hostname>[:<port>]]`
See `upsmon.conf(5)` for details.

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.upsmon.monitor.<name>.type` {#opt-power.ups.upsmon.monitor._name_.type}

The relationship with `upsd`.
See `upsmon.conf(5)` for details.

*Type:* string

*Default:* `"master"`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.upsmon.monitor.<name>.user` {#opt-power.ups.upsmon.monitor._name_.user}

Username from `upsd.users` for accessing this UPS.
See `upsmon.conf(5)` for details.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.upsmon.settings` {#opt-power.ups.upsmon.settings}

Additional settings to add to `upsmon.conf`.

*Type:* attribute set of (atom (null, bool, int, float or string) or list of non-empty (list of (atom (null, bool, int, float or string))))

*Default:* {
MINSUPPLIES = 1;
MONITOR = <generated from config.power.ups.upsmon.monitor>
NOTIFYCMD = "${cfg.package}/bin/upssched";
POWERDOWNFLAG = "/run/killpower";
SHUTDOWNCMD = "${config.systemd.package}/bin/shutdown now";
}

*Example:* {
MINSUPPLIES = 2;
NOTIFYFLAG = \[
\[ "ONLINE" "SYSLOG+EXEC" \]
\[ "ONBATT" "SYSLOG+EXEC" \]
\];
}

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.upsmon.user` {#opt-power.ups.upsmon.user}

User to run `upsmon` as. `upsmon.conf` will have its owner set to this
user. If not specified, a default user will be created.

*Type:* string

*Default:* `"nutmon"`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.users` {#opt-power.ups.users}

Users that can access upsd. See `upsd.users(5)`.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.users.<name>.actions` {#opt-power.ups.users._name_.actions}

Allow the user to do certain things with upsd.
See `upsd.users(5)` for details.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.users.<name>.instcmds` {#opt-power.ups.users._name_.instcmds}

Let the user initiate specific instant commands. Use "ALL" to grant all commands automatically. For the full list of what your UPS supports, use "upscmd -l".
See `upsd.users(5)` for details.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.users.<name>.passwordFile` {#opt-power.ups.users._name_.passwordFile}

The full path to a file that contains the user's (clear text)
password. The password file is read on service start.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)

## `power.ups.users.<name>.upsmon` {#opt-power.ups.users._name_.upsmon}

Add the necessary actions for a upsmon process to work.
See `upsd.users(5)` for details.

*Type:* null or one of "primary", "secondary"

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/ups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ups.nix)
