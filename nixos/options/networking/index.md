# networking {#sec-options-networking}

## `networking.bonds` {#opt-networking.bonds}

This option allows you to define bond devices that aggregate multiple,
underlying networking interfaces together. The value of this option is
an attribute set. Each attribute specifies a bond, with the attribute
name specifying the name of the bond's network interface

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  bond0 = {
    interfaces = [ "eth0" "wlan0" ];
    driverOptions = {
  miimon = "100";
  mode = "active-backup";
}
;
  };
  anotherBond.interfaces = [ "enp4s0f0" "enp4s0f1" "enp5s0f0" "enp5s0f1" ];
}
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.bonds.<name>.driverOptions` {#opt-networking.bonds._name_.driverOptions}

Options for the bonding driver.
Documentation can be found in
[https://www.kernel.org/doc/Documentation/networking/bonding.txt](https://www.kernel.org/doc/Documentation/networking/bonding.txt)

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  miimon = "100";
  mode = "active-backup";
}
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.bonds.<name>.interfaces` {#opt-networking.bonds._name_.interfaces}

The interfaces to bond together

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "enp4s0f0"
  "enp4s0f1"
  "wlan0"
]
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.bonds.<name>.lacp_rate` {#opt-networking.bonds._name_.lacp_rate}

DEPRECATED, use `driverOptions`.
Option specifying the rate in which we'll ask our link partner
to transmit LACPDU packets in 802.3ad mode.

*Type:* null or string

*Default:* `null`

*Example:* `"fast"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.bonds.<name>.miimon` {#opt-networking.bonds._name_.miimon}

DEPRECATED, use `driverOptions`.
Miimon is the number of millisecond in between each round of polling
by the device driver for failed links. By default polling is not
enabled and the driver is trusted to properly detect and handle
failure scenarios.

*Type:* null or signed integer

*Default:* `null`

*Example:* `100`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.bonds.<name>.mode` {#opt-networking.bonds._name_.mode}

DEPRECATED, use `driverOptions`.
The mode which the bond will be running. The default mode for
the bonding driver is balance-rr, optimizing for throughput.
More information about valid modes can be found at
https://www.kernel.org/doc/Documentation/networking/bonding.txt

*Type:* null or string

*Default:* `null`

*Example:* `"active-backup"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.bonds.<name>.xmit_hash_policy` {#opt-networking.bonds._name_.xmit_hash_policy}

DEPRECATED, use `driverOptions`.
Selects the transmit hash policy to use for slave selection in
balance-xor, 802.3ad, and tlb modes.

*Type:* null or string

*Default:* `null`

*Example:* `"layer2+3"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.bridges` {#opt-networking.bridges}

This option allows you to define Ethernet bridge devices
that connect physical networks together.  The value of this
option is an attribute set.  Each attribute specifies a
bridge, with the attribute name specifying the name of the
bridge's network interface.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  br0 = {
    interfaces = [
      "eth0"
      "eth1"
    ];
  };
  br1 = {
    interfaces = [
      "eth2"
      "wlan0"
    ];
  };
}
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.bridges.<name>.interfaces` {#opt-networking.bridges._name_.interfaces}

The physical network interfaces connected by the bridge.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "eth0"
  "eth1"
]
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.bridges.<name>.rstp` {#opt-networking.bridges._name_.rstp}

Whether the bridge interface should enable rstp.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.defaultGateway` {#opt-networking.defaultGateway}

The default gateway. It can be left empty if it is auto-detected through DHCP.
It can be specified as a string or an option set along with a network interface.

*Type:* null or ((submodule) or string convertible to it)

*Default:* `null`

*Example:*

``` nix
{
  address = "131.211.84.1";
  interface = "enp3s0";
  source = "131.211.84.2";
}
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.defaultGateway.address` {#opt-networking.defaultGateway.address}

The default gateway address.

*Type:* string

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.defaultGateway.interface` {#opt-networking.defaultGateway.interface}

The default gateway interface.

*Type:* null or string

*Default:* `null`

*Example:* `"enp0s3"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.defaultGateway.metric` {#opt-networking.defaultGateway.metric}

The default gateway metric/preference.

*Type:* null or signed integer

*Default:* `null`

*Example:* `42`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.defaultGateway.source` {#opt-networking.defaultGateway.source}

The default source address.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.defaultGateway6` {#opt-networking.defaultGateway6}

The default ipv6 gateway. It can be left empty if it is auto-detected through DHCP.
It can be specified as a string or an option set along with a network interface.

*Type:* null or ((submodule) or string convertible to it)

*Default:* `null`

*Example:*

``` nix
{
  address = "2001:4d0:1e04:895::1";
  interface = "enp3s0";
  source = "2001:4d0:1e04:895::2";
}
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.defaultGateway6.address` {#opt-networking.defaultGateway6.address}

The default gateway address.

*Type:* string

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.defaultGateway6.interface` {#opt-networking.defaultGateway6.interface}

The default gateway interface.

*Type:* null or string

*Default:* `null`

*Example:* `"enp0s3"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.defaultGateway6.metric` {#opt-networking.defaultGateway6.metric}

The default gateway metric/preference.

*Type:* null or signed integer

*Default:* `null`

*Example:* `42`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.defaultGateway6.source` {#opt-networking.defaultGateway6.source}

The default source address.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.defaultGatewayWindowSize` {#opt-networking.defaultGatewayWindowSize}

The window size of the default gateway. It limits maximal data bursts that TCP peers
are allowed to send to us.

*Type:* null or signed integer

*Default:* `null`

*Example:* `524288`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.dhcpcd.IPv6rs` {#opt-networking.dhcpcd.IPv6rs}

Force enable or disable solicitation and receipt of IPv6 Router Advertisements.
This is required, for example, when using a static unique local IPv6 address (ULA)
and global IPv6 address auto-configuration with SLAAC.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/dhcpcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dhcpcd.nix)

## `networking.dhcpcd.allowInterfaces` {#opt-networking.dhcpcd.allowInterfaces}

Enable the DHCP client for any interface whose name matches
any of the shell glob patterns in this list. Any interface not
explicitly matched by this pattern will be denied. This pattern only
applies when non-null.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/dhcpcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dhcpcd.nix)

## `networking.dhcpcd.allowSetuid` {#opt-networking.dhcpcd.allowSetuid}

Whether to relax the security sandbox to allow running setuid
binaries (e.g. `sudo`) in the dhcpcd hooks.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/dhcpcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dhcpcd.nix)

## `networking.dhcpcd.denyInterfaces` {#opt-networking.dhcpcd.denyInterfaces}

Disable the DHCP client for any interface whose name matches
any of the shell glob patterns in this list. The purpose of
this option is to blacklist virtual interfaces such as those
created by Xen, libvirt, LXC, etc.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/dhcpcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dhcpcd.nix)

## `networking.dhcpcd.enable` {#opt-networking.dhcpcd.enable}

Whether to enable dhcpcd for device configuration. This is mainly to
explicitly disable dhcpcd (for example when using networkd).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/dhcpcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dhcpcd.nix)

## `networking.dhcpcd.extraConfig` {#opt-networking.dhcpcd.extraConfig}

Literal string to append to the config file generated for dhcpcd.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/dhcpcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dhcpcd.nix)

## `networking.dhcpcd.persistent` {#opt-networking.dhcpcd.persistent}

Whether to leave interfaces configured on dhcpcd daemon
shutdown. Set to true if you have your root or store mounted
over the network or this machine accepts SSH connections
through DHCP interfaces and clients should be notified when
it shuts down.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/dhcpcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dhcpcd.nix)

## `networking.dhcpcd.readGroup` {#opt-networking.dhcpcd.readGroup}

Group whose members can read interface and lease data from the dhcpcd
control socket, for example with `dhcpcd -U <interface>` or
`dhcpcd --dumplease`. By default only root can.

The group is created if it does not exist and added to the
supplementary groups of the dhcpcd service. Users need to log in again
after being added to it.

*Type:* null or string

*Default:* `null`

*Example:* `"dhcpcd-read"`

*Declared by:* [`nixos/modules/services/networking/dhcpcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dhcpcd.nix)

## `networking.dhcpcd.runHook` {#opt-networking.dhcpcd.runHook}

Shell code that will be run after all other hooks. See
`man dhcpcd-run-hooks` for details on what is possible.

::: note
To use sudo or similar tools in your script you may have to set:

    networking.dhcpcd.allowSetuid = true;

In addition, as most of the filesystem is inaccessible to dhcpcd
by default, you may want to define some exceptions, e.g.

    systemd.services.dhcpcd.serviceConfig.ReadOnlyPaths = [
      "/run/user/1000/bus"  # to send desktop notifications
    ];
:::

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"if [[ $reason =~ BOUND ]]; then echo $interface: Routers are $new_routers - were $old_routers; fi"`

*Declared by:* [`nixos/modules/services/networking/dhcpcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dhcpcd.nix)

## `networking.dhcpcd.setHostname` {#opt-networking.dhcpcd.setHostname}

Whether to set the machine hostname based on the information
received from the DHCP server.

::: note
The hostname will be changed only if the current one is
the empty string, `localhost` or `nixos`.

Polkit ([security](../../options/security/index.md#opt-security.polkit.enable)) is also required.
:::

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/dhcpcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dhcpcd.nix)

## `networking.dhcpcd.wait` {#opt-networking.dhcpcd.wait}

This option specifies when the dhcpcd service will fork to background.
If set to "background", dhcpcd will fork to background immediately.
If set to "ipv4" or "ipv6", dhcpcd will wait for the corresponding IP
address to be assigned. If set to "any", dhcpcd will wait for any type
(IPv4 or IPv6) to be assigned. If set to "both", dhcpcd will wait for
both an IPv4 and an IPv6 address before forking.
The option "if-carrier-up" is equivalent to "any" if either ethernet
is plugged or WiFi is powered, and to "background" otherwise.

*Type:* one of "background", "any", "ipv4", "ipv6", "both", "if-carrier-up"

*Default:* `"any"`

*Declared by:* [`nixos/modules/services/networking/dhcpcd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/dhcpcd.nix)

## `networking.domain` {#opt-networking.domain}

The system domain name. Used to populate the `fqdn` value.

::: warning
The domain name is not configured for DNS resolution purposes, see `search` instead.
:::

*Type:* null or string

*Default:* `null`

*Example:* `"home.arpa"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.enableB43Firmware` {#opt-networking.enableB43Firmware}

Turn on this option if you want firmware for the NICs supported by the b43 module.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/network/b43.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/network/b43.nix)

## `networking.enableIPv6` {#opt-networking.enableIPv6}

Whether to enable support for IPv6.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.enableIntel2200BGFirmware` {#opt-networking.enableIntel2200BGFirmware}

Turn on this option if you want firmware for the Intel
PRO/Wireless 2200BG to be loaded automatically.  This is
required if you want to use this device.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/network/intel-2200bg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/network/intel-2200bg.nix)

## `networking.extraHosts` {#opt-networking.extraHosts}

Additional verbatim entries to be appended to `/etc/hosts`.
For adding hosts from derivation results, use [`networking.hostFiles`](#opt-networking.hostFiles) instead.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"192.168.0.1 lanlocalhost"`

*Declared by:* [`nixos/modules/config/networking.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/networking.nix)

## `networking.firewall.allowPing` {#opt-networking.firewall.allowPing}

Whether to respond to incoming ICMPv4 echo requests
("pings").  ICMPv6 pings are always allowed because the
larger address space of IPv6 makes network scanning much
less effective.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.allowedTCPPortRanges` {#opt-networking.firewall.allowedTCPPortRanges}

A range of TCP ports on which incoming connections are
accepted.

*Type:* list of attribute set of 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    from = 8999;
    to = 9003;
  }
]
```

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.allowedTCPPorts` {#opt-networking.firewall.allowedTCPPorts}

List of TCP ports on which incoming connections are
accepted.

*Type:* list of 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `[ ]`

*Example:*

``` nix
[
  22
  80
]
```

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.allowedUDPPortRanges` {#opt-networking.firewall.allowedUDPPortRanges}

Range of open UDP ports.

*Type:* list of attribute set of 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    from = 60000;
    to = 61000;
  }
]
```

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.allowedUDPPorts` {#opt-networking.firewall.allowedUDPPorts}

List of open UDP ports.

*Type:* list of 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `[ ]`

*Example:*

``` nix
[
  53
]
```

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.autoLoadConntrackHelpers` {#opt-networking.firewall.autoLoadConntrackHelpers}

Whether to auto-load connection-tracking helpers.
See the description at networking.firewall.connectionTrackingModules

(needs kernel 3.5+)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.backend` {#opt-networking.firewall.backend}

Underlying implementation for the firewall service.

*Type:* one of "iptables", "nftables", "firewalld"

*Default:*

``` nix
if config.services.firewalld.enable then
  "firewalld"
else if config.networking.nftables.enable then
  "nftables"
else
  "iptables"
```

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.checkReversePath` {#opt-networking.firewall.checkReversePath}

Performs a reverse path filter test on a packet.  If a reply
to the packet would not be sent via the same interface that
the packet arrived on, it is refused.

If using asymmetric routing or other complicated routing, set
this option to loose mode or disable it and setup your own
counter-measures.

This option can be either true (or "strict"), "loose" (only
drop the packet if the source address is not reachable via any
interface) or false.

*Type:* boolean or one of "strict", "loose"

*Default:* `"loose"`

*Example:* `"loose"`

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.connectionTrackingModules` {#opt-networking.firewall.connectionTrackingModules}

List of connection-tracking helpers that are auto-loaded.
The complete list of possible values is given in the example.

As helpers can pose as a security risk, it is advised to
set this to an empty list and disable the setting
networking.firewall.autoLoadConntrackHelpers unless you
know what you are doing. Connection tracking is disabled
by default.

Loading of helpers is recommended to be done through the
CT target.  More info:
[https://home.regit.org/netfilter-en/secure-use-of-helpers/](https://home.regit.org/netfilter-en/secure-use-of-helpers/)

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "ftp"
  "irc"
  "sane"
  "sip"
  "tftp"
  "amanda"
  "h323"
  "netbios_sn"
  "pptp"
  "snmp"
]
```

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.enable` {#opt-networking.firewall.enable}

Whether to enable the firewall.  This is a simple stateful
firewall that blocks connection attempts to unauthorised TCP
or UDP ports on this machine.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.extraCommands` {#opt-networking.firewall.extraCommands}

Additional shell commands executed as part of the firewall
initialisation script.  These are executed just before the
final "reject" firewall rule is added, so they can be used
to allow packets that would otherwise be refused.

This option only works with the iptables based firewall.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"iptables -A INPUT -p icmp -j ACCEPT"`

*Declared by:* [`nixos/modules/services/networking/firewall-iptables.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall-iptables.nix)

## `networking.firewall.extraForwardRules` {#opt-networking.firewall.extraForwardRules}

Additional nftables rules to be appended to the forward-allow
chain.

This option only works with the nftables based firewall.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"iifname wg0 accept"`

*Declared by:* [`nixos/modules/services/networking/firewall-nftables.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall-nftables.nix)

## `networking.firewall.extraInputRules` {#opt-networking.firewall.extraInputRules}

Additional nftables rules to be appended to the input-allow
chain.

This option only works with the nftables based firewall.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"ip6 saddr { fc00::/7, fe80::/10 } tcp dport 24800 accept"`

*Declared by:* [`nixos/modules/services/networking/firewall-nftables.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall-nftables.nix)

## `networking.firewall.extraPackages` {#opt-networking.firewall.extraPackages}

Additional packages to be included in the environment of the system
as well as the path of networking.firewall.extraCommands.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.ipset ]`

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.extraReversePathFilterRules` {#opt-networking.firewall.extraReversePathFilterRules}

Additional nftables rules to be appended to the rpfilter-allow
chain.

This option only works with the nftables based firewall.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"fib daddr . mark . iif type local accept"`

*Declared by:* [`nixos/modules/services/networking/firewall-nftables.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall-nftables.nix)

## `networking.firewall.extraStopCommands` {#opt-networking.firewall.extraStopCommands}

Additional shell commands executed as part of the firewall
shutdown script.  These are executed just after the removal
of the NixOS input rule, or if the service enters a failed
state.

This option only works with the iptables based firewall.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"iptables -P INPUT ACCEPT"`

*Declared by:* [`nixos/modules/services/networking/firewall-iptables.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall-iptables.nix)

## `networking.firewall.filterForward` {#opt-networking.firewall.filterForward}

Enable filtering in IP forwarding.

This option only works with the nftables based firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.interfaces` {#opt-networking.firewall.interfaces}

Interface-specific open ports.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.interfaces.<name>.allowedTCPPortRanges` {#opt-networking.firewall.interfaces._name_.allowedTCPPortRanges}

A range of TCP ports on which incoming connections are
accepted.

*Type:* list of attribute set of 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    from = 8999;
    to = 9003;
  }
]
```

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.interfaces.<name>.allowedTCPPorts` {#opt-networking.firewall.interfaces._name_.allowedTCPPorts}

List of TCP ports on which incoming connections are
accepted.

*Type:* list of 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `[ ]`

*Example:*

``` nix
[
  22
  80
]
```

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.interfaces.<name>.allowedUDPPortRanges` {#opt-networking.firewall.interfaces._name_.allowedUDPPortRanges}

Range of open UDP ports.

*Type:* list of attribute set of 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    from = 60000;
    to = 61000;
  }
]
```

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.interfaces.<name>.allowedUDPPorts` {#opt-networking.firewall.interfaces._name_.allowedUDPPorts}

List of open UDP ports.

*Type:* list of 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `[ ]`

*Example:*

``` nix
[
  53
]
```

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.logRefusedConnections` {#opt-networking.firewall.logRefusedConnections}

Whether to log rejected or dropped incoming connections.
Note: The logs are found in the kernel logs, i.e. dmesg
or journalctl -k.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.logRefusedPackets` {#opt-networking.firewall.logRefusedPackets}

Whether to log all rejected or dropped incoming packets.
This tends to give a lot of log messages, so it's mostly
useful for debugging.
Note: The logs are found in the kernel logs, i.e. dmesg
or journalctl -k.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.logRefusedUnicastsOnly` {#opt-networking.firewall.logRefusedUnicastsOnly}

If [`networking.firewall.logRefusedPackets`](#opt-networking.firewall.logRefusedPackets)
and this option are enabled, then only log packets
specifically directed at this machine, i.e., not broadcasts
or multicasts.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.logReversePathDrops` {#opt-networking.firewall.logReversePathDrops}

Logs dropped packets failing the reverse path filter test if
the option networking.firewall.checkReversePath is enabled.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.package` {#opt-networking.firewall.package}

The package to use for running the firewall service.

*Type:* package

*Default:* `if config.networking.nftables.enable then "pkgs.nftables" else "pkgs.iptables"`

*Example:* `pkgs.iptables-legacy`

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.pingLimit` {#opt-networking.firewall.pingLimit}

If pings are allowed, this allows setting rate limits on them.

For the iptables based firewall, it should be set like
"--limit 1/minute --limit-burst 5".

For the nftables based firewall, it should be set like
"2/second" or "1/minute burst 5 packets".

*Type:* null or strings concatenated with " "

*Default:* `null`

*Example:* `"--limit 1/minute --limit-burst 5"`

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.rejectPackets` {#opt-networking.firewall.rejectPackets}

If set, refused packets are rejected rather than dropped
(ignored).  This means that an ICMP "port unreachable" error
message is sent back to the client (or a TCP RST packet in
case of an existing connection).  Rejecting packets makes
port scanning somewhat easier.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.firewall.trustedInterfaces` {#opt-networking.firewall.trustedInterfaces}

Traffic coming in from these interfaces will be accepted
unconditionally.  Traffic from the loopback (lo) interface
will always be accepted.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "enp0s2"
]
```

*Declared by:* [`nixos/modules/services/networking/firewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/firewall.nix)

## `networking.fooOverUDP` {#opt-networking.fooOverUDP}

This option allows you to configure Foo Over UDP and Generic UDP Encapsulation
endpoints. See `ip-fou(8)` for details.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  backup = {
    port = 9002;
  };
  primary = {
    local = {
      address = "192.0.2.1";
      dev = "eth0";
    };
    port = 9001;
  };
}
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.fooOverUDP.<name>.local` {#opt-networking.fooOverUDP._name_.local}

Local address (and optionally device) to bind to using the given port.

*Type:* null or (submodule)

*Default:* `null`

*Example:*

``` nix
{
  address = "203.0.113.22";
}
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.fooOverUDP.<name>.local.address` {#opt-networking.fooOverUDP._name_.local.address}

Local address to bind to. The address must be available when the FOU
endpoint is created, using the scripted network setup this can be achieved
either by setting `dev` or adding dependency information to
`systemd.services.<name>-fou-encap`; it isn't supported
when using networkd.

*Type:* string

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.fooOverUDP.<name>.local.dev` {#opt-networking.fooOverUDP._name_.local.dev}

Network device to bind to.

*Type:* null or string

*Default:* `null`

*Example:* `"eth0"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.fooOverUDP.<name>.port` {#opt-networking.fooOverUDP._name_.port}

Local port of the encapsulation UDP socket.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.fooOverUDP.<name>.protocol` {#opt-networking.fooOverUDP._name_.protocol}

Protocol number of the encapsulated packets. Specifying `null`
(the default) creates a GUE endpoint, specifying a protocol number will create
a FOU endpoint.

*Type:* null or integer between 1 and 255 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.fqdn` {#opt-networking.fqdn}

The fully qualified domain name (FQDN) of this host. By default, it is
the result of combining `networking.hostName` and `networking.domain.`

Using this option will result in an evaluation error if the hostname is empty or
no domain is specified.

Modules that accept a mere `networking.hostName` but prefer a fully qualified
domain name may use `networking.fqdnOrHostName` instead.

*Type:* string

*Default:* `"${networking.hostName}.${networking.domain}"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.fqdnOrHostName` {#opt-networking.fqdnOrHostName}

Either the fully qualified domain name (FQDN), or just the host name if
it does not exist.

This is a convenience option for modules to read instead of `fqdn` when
a mere `hostName` is also an acceptable value; this option does not
throw an error when `domain` or `fqdn` is unset.

*Type:* string

*Default:*

``` nix
if config.networking.domain != null || config.networking.fqdn is set then config.networking.fqdn else config.networking.hostName
```

*Read only*

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.getaddrinfo.enable` {#opt-networking.getaddrinfo.enable}

Enables custom address sorting configuration for `getaddrinfo(3)` according to RFC 3484.

This option generates a `/etc/gai.conf` file to override the default address sorting tables,
as described in `gai.conf(5)`.

This setting is only applicable when using the GNU C Library (glibc).
It has no effect with other libc implementations.

*Type:* boolean

*Default:*

``` nix
pkgs.stdenv.hostPlatform.libc == "glibc"
```

*Declared by:* [`nixos/modules/config/getaddrinfo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/getaddrinfo.nix)

## `networking.getaddrinfo.label` {#opt-networking.getaddrinfo.label}

Adds entries to the label table, as described in section 2.1 of RFC 3484.

If any label entries are provided, the glibc’s default label table is ignored.

*Type:* null or (attribute set of signed integer)

*Default:* `null`

*Example:*

``` nix
{
  "2001:0::/32" = 7;
  "2002::/16" = 2;
  "::/0" = 1;
  "::/96" = 3;
  "::ffff:0:0/96" = 4;
  "fc00::/7" = 6;
  "fec0::/10" = 5;
}
```

*Declared by:* [`nixos/modules/config/getaddrinfo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/getaddrinfo.nix)

## `networking.getaddrinfo.precedence` {#opt-networking.getaddrinfo.precedence}

Similar to [`networking.getaddrinfo.label`](#opt-networking.getaddrinfo.label), but this option
defines entries for the precedence table instead.

See sections 2.1 and 10.3 of RFC 3484 for details.

Providing any value will disable the glibc's default precedence table.

*Type:* null or (attribute set of signed integer)

*Default:* `null`

*Example:*

``` nix
{
  "2002::/16" = 30;
  "::/0" = 40;
  "::/96" = 20;
  "::1/128" = 50;
  "::ffff:0:0/96" = 10;
}
```

*Declared by:* [`nixos/modules/config/getaddrinfo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/getaddrinfo.nix)

## `networking.getaddrinfo.reload` {#opt-networking.getaddrinfo.reload}

Determines whether a process should detect changes to the configuration file since it was last read.

If enabled, the file is re-read automatically. This may cause issues in multithreaded applications
and is generally discouraged.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/getaddrinfo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/getaddrinfo.nix)

## `networking.getaddrinfo.scopev4` {#opt-networking.getaddrinfo.scopev4}

Adds custom rules to the IPv4 scope table.

By default, the scope IDs described in section 3.2 of RFC 6724 are used.

Modifying these values is rarely necessary.

*Type:* null or (attribute set of signed integer)

*Default:* `null`

*Example:*

``` nix
{
  "::ffff:0.0.0.0/96" = 14;
  "::ffff:127.0.0.0/104" = 2;
  "::ffff:169.254.0.0/112" = 2;
}
```

*Declared by:* [`nixos/modules/config/getaddrinfo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/getaddrinfo.nix)

## `networking.greTunnels` {#opt-networking.greTunnels}

This option allows you to define Generic Routing Encapsulation (GRE) tunnels.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  greBridge = {
    remote = "10.0.0.1";
    local = "10.0.0.22";
    dev = "enp4s0f0";
    type = "tap";
    ttl = 255;
  };
  gre6Tunnel = {
    remote = "fd7a:5634::1";
    local = "fd7a:5634::2";
    dev = "enp4s0f0";
    type = "tun6";
    ttl = 255;
  };
}
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.greTunnels.<name>.dev` {#opt-networking.greTunnels._name_.dev}

The underlying network device on which the tunnel resides.

*Type:* null or string

*Default:* `null`

*Example:* `"enp4s0f0"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.greTunnels.<name>.local` {#opt-networking.greTunnels._name_.local}

The address of the local endpoint which the remote
side should send packets to.

*Type:* null or string

*Default:* `null`

*Example:* `"10.0.0.22"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.greTunnels.<name>.remote` {#opt-networking.greTunnels._name_.remote}

The address of the remote endpoint to forward traffic over.

*Type:* null or string

*Default:* `null`

*Example:* `"10.0.0.1"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.greTunnels.<name>.ttl` {#opt-networking.greTunnels._name_.ttl}

The time-to-live/hoplimit of the connection to the remote tunnel endpoint.

*Type:* null or signed integer

*Default:* `null`

*Example:* `255`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.greTunnels.<name>.type` {#opt-networking.greTunnels._name_.type}

Whether the tunnel routes layer 2 (tap) or layer 3 (tun) traffic.

*Type:* one of "tun", "tap", "tun6", "tap6"

*Default:* `"tap"`

*Example:* `"tap"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.hostFiles` {#opt-networking.hostFiles}

Files that should be concatenated together to form `/etc/hosts`.

*Type:* list of absolute path

*Default:* Hosts from [`networking.hosts`](#opt-networking.hosts) and [`networking.extraHosts`](#opt-networking.extraHosts)

*Example:* `[ "${pkgs.my-blocklist-package}/share/my-blocklist/hosts" ]`

*Declared by:* [`nixos/modules/config/networking.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/networking.nix)

## `networking.hostId` {#opt-networking.hostId}

The 32-bit host ID of the machine, formatted as 8 hexadecimal characters.

You should try to make this ID unique among your machines. You can
generate a random 32-bit ID using the following commands:

`head -c 8 /etc/machine-id`

(this derives it from the machine-id that systemd generates) or

`head -c4 /dev/urandom | od -A none -t x4`

The primary use case is to ensure when using ZFS that a pool isn't imported
accidentally on a wrong machine.

*Type:* null or string

*Default:* `null`

*Example:* `"4e98920d"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.hostName` {#opt-networking.hostName}

The name of the machine. Leave it empty if you want to obtain it from a
DHCP server (if using DHCP). The hostname must be a valid DNS label (see
RFC 1035 section 2.3.1: "Preferred name syntax", RFC 1123 section 2.1:
"Host Names and Numbers") and as such must not contain the domain part.
This means that the hostname must start with a letter or digit,
end with a letter or digit, and have as interior characters only
letters, digits, and hyphen. The maximum length is 63 characters.
Additionally it is recommended to only use lower-case characters.
If (e.g. for legacy reasons) a FQDN is required as the Linux kernel
network node hostname (uname --nodename) the option
boot.kernel.sysctl."kernel.hostname" can be used as a workaround (but
the 64 character limit still applies).

WARNING: Do not use underscores (\_) or you may run into unexpected issues.

*Type:* string matching the pattern ^$|^[\[:alnum:\]](../../[[:alnum:]_-]{0,61}[[:alnum:]])?$

*Default:* `config.system.nixos.distroId`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.hosts` {#opt-networking.hosts}

Locally defined maps of hostnames to IP addresses.

*Type:* attribute set of list of string

*Default:* `{ }`

*Example:*

``` nix
{
  "127.0.0.1" = [ "foo.bar.baz" ];
  "192.168.0.2" = [ "fileserver.local" "nameserver.local" ];
};
```

*Declared by:* [`nixos/modules/config/networking.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/networking.nix)

## `networking.ifstate.enable` {#opt-networking.ifstate.enable}

Whether to enable networking using IfState.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ifstate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ifstate.nix)

## `networking.ifstate.package` {#opt-networking.ifstate.package}

The ifstate package to use.

*Type:* package

*Default:* `pkgs.ifstate`

*Declared by:* [`nixos/modules/services/networking/ifstate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ifstate.nix)

## `networking.ifstate.settings` {#opt-networking.ifstate.settings}

Content of IfState's configuration file. See [https://ifstate.net/2.2/schema/](https://ifstate.net/2.2/schema/) for details.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/ifstate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ifstate.nix)

## `networking.interfaces` {#opt-networking.interfaces}

The configuration for each network interface.

Please note that [`systemd.network.netdevs`](../../options/systemd/index.md#opt-systemd.network.netdevs) has more features
and is better maintained. When building new things, it is advised to
use that instead.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  eth0 = {
    ipv4 = {
      addresses = [
        {
          address = "131.211.84.78";
          prefixLength = 25;
        }
      ];
    };
  };
}
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.ipv4.addresses` {#opt-networking.interfaces._name_.ipv4.addresses}

List of IPv4 addresses that will be statically assigned to the interface.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    address = "10.0.0.1";
    prefixLength = 16;
  }
  {
    address = "192.168.1.1";
    prefixLength = 24;
  }
]
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.ipv4.addresses.*.address` {#opt-networking.interfaces._name_.ipv4.addresses._.address}

IPv4 address of the interface. Leave empty to configure the
interface using DHCP.

*Type:* string

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.ipv4.addresses.*.prefixLength` {#opt-networking.interfaces._name_.ipv4.addresses._.prefixLength}

Subnet mask of the interface, specified as the number of
bits in the prefix (`24`).

*Type:* integer between 0 and 32 (both inclusive)

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.ipv4.routes` {#opt-networking.interfaces._name_.ipv4.routes}

List of extra IPv4 static routes that will be assigned to the interface.

::: warning
If the route type is the default `unicast`, then the scope
is set differently depending on the value of [`networking.useNetworkd`](#opt-networking.useNetworkd):
the script-based backend sets it to `link`, while networkd sets
it to `global`.
:::

If you want consistency between the two implementations,
set the scope of the route manually with
`networking.interfaces.eth0.ipv4.routes = [{ options.scope = "global"; }]`
for example.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    address = "10.0.0.0";
    prefixLength = 16;
  }
  {
    address = "192.168.2.0";
    prefixLength = 24;
    via = "192.168.1.1";
  }
]
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.ipv4.routes.*.address` {#opt-networking.interfaces._name_.ipv4.routes._.address}

IPv4 address of the network.

*Type:* string

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.ipv4.routes.*.options` {#opt-networking.interfaces._name_.ipv4.routes._.options}

Other route options. See the symbol `OPTIONS`
in the `ip-route(8)` manual page for the details.
You may also specify `metric`,
`src`, `protocol`,
`scope`, `from`
and `table`, which are technically
not route options, in the sense used in the manual.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  mtu = "1492";
  window = "524288";
}
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.ipv4.routes.*.prefixLength` {#opt-networking.interfaces._name_.ipv4.routes._.prefixLength}

Subnet mask of the network, specified as the number of
bits in the prefix (`24`).

*Type:* integer between 0 and 32 (both inclusive)

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.ipv4.routes.*.type` {#opt-networking.interfaces._name_.ipv4.routes._.type}

Type of the route.  See the `Route types` section
in the `ip-route(8)` manual page for the details.

Note that `prohibit`, `blackhole`,
`unreachable`, and `throw` cannot
be configured per device, so they are not available here. Similarly,
`nat` hasn't been supported since kernel 2.6.

*Type:* null or one of "unicast", "local", "broadcast", "multicast"

*Default:* `null`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.ipv4.routes.*.via` {#opt-networking.interfaces._name_.ipv4.routes._.via}

IPv4 address of the next hop.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.ipv6.addresses` {#opt-networking.interfaces._name_.ipv6.addresses}

List of IPv6 addresses that will be statically assigned to the interface.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    address = "fdfd:b3f0:482::1";
    prefixLength = 48;
  }
  {
    address = "2001:1470:fffd:2098::e006";
    prefixLength = 64;
  }
]
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.ipv6.addresses.*.address` {#opt-networking.interfaces._name_.ipv6.addresses._.address}

IPv6 address of the interface. Leave empty to configure the
interface using DHCP.

*Type:* string

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.ipv6.addresses.*.prefixLength` {#opt-networking.interfaces._name_.ipv6.addresses._.prefixLength}

Subnet mask of the interface, specified as the number of
bits in the prefix (`64`).

*Type:* integer between 0 and 128 (both inclusive)

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.ipv6.routes` {#opt-networking.interfaces._name_.ipv6.routes}

List of extra IPv6 static routes that will be assigned to the interface.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    address = "fdfd:b3f0::";
    prefixLength = 48;
  }
  {
    address = "2001:1470:fffd:2098::";
    prefixLength = 64;
    via = "fdfd:b3f0::1";
  }
]
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.ipv6.routes.*.address` {#opt-networking.interfaces._name_.ipv6.routes._.address}

IPv6 address of the network.

*Type:* string

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.ipv6.routes.*.options` {#opt-networking.interfaces._name_.ipv6.routes._.options}

Other route options. See the symbol `OPTIONS`
in the `ip-route(8)` manual page for the details.
You may also specify `metric`,
`src`, `protocol`,
`scope`, `from`
and `table`, which are technically
not route options, in the sense used in the manual.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  mtu = "1492";
  window = "524288";
}
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.ipv6.routes.*.prefixLength` {#opt-networking.interfaces._name_.ipv6.routes._.prefixLength}

Subnet mask of the network, specified as the number of
bits in the prefix (`64`).

*Type:* integer between 0 and 128 (both inclusive)

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.ipv6.routes.*.type` {#opt-networking.interfaces._name_.ipv6.routes._.type}

Type of the route.  See the `Route types` section
in the `ip-route(8)` manual page for the details.

Note that `prohibit`, `blackhole`,
`unreachable`, and `throw` cannot
be configured per device, so they are not available here. Similarly,
`nat` hasn't been supported since kernel 2.6.

*Type:* null or one of "unicast", "local", "broadcast", "multicast"

*Default:* `null`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.ipv6.routes.*.via` {#opt-networking.interfaces._name_.ipv6.routes._.via}

IPv6 address of the next hop.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.macAddress` {#opt-networking.interfaces._name_.macAddress}

MAC address of the interface. Leave empty to use the default.

*Type:* null or string

*Default:* `null`

*Example:* `"00:11:22:33:44:55"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.mtu` {#opt-networking.interfaces._name_.mtu}

MTU size for packets leaving the interface. Leave empty to use the default.

*Type:* null or signed integer

*Default:* `null`

*Example:* `9000`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.name` {#opt-networking.interfaces._name_.name}

Name of the interface.

*Type:* string

*Example:* `"eth0"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.proxyARP` {#opt-networking.interfaces._name_.proxyARP}

Turn on proxy\_arp for this device.
This is mainly useful for creating pseudo-bridges between a real
interface and a virtual network such as VPN or a virtual machine for
interfaces that don't support real bridging (most wlan interfaces).
As ARP proxying acts slightly above the link-layer, below-ip traffic
isn't bridged, so things like DHCP won't work. The advantage above
using NAT lies in the fact that no IP addresses are shared, so all
hosts are reachable/routeable.

WARNING: turns on ip-routing, so if you have multiple interfaces, you
should think of the consequence and setup firewall rules to limit this.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.tempAddress` {#opt-networking.interfaces._name_.tempAddress}

When IPv6 is enabled with SLAAC, this option controls the use of
temporary address (aka privacy extensions) on this
interface. This is used to reduce tracking.

See also the global option
[networking](#opt-networking.tempAddresses), which
applies to all interfaces where this is not set.

Possible values are:

- `"default"` to generate IPv6 temporary addresses and use these as source addresses in routing;
- `"disabled"` to completely disable IPv6 temporary addresses;
- `"enabled"` to generate IPv6 temporary addresses but still use EUI-64 addresses as source addresses;

*Type:* one of "default", "disabled", "enabled"

*Default:* `config.networking.tempAddresses`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.useDHCP` {#opt-networking.interfaces._name_.useDHCP}

Whether this interface should be configured with DHCP. Overrides the
default set by [`networking.useDHCP`](#opt-networking.useDHCP). If `null` (the default),
DHCP is enabled if the interface has no IPv4 addresses configured
with [`networking.interfaces.<name>.ipv4.addresses`](#opt-networking.interfaces._name_.ipv4.addresses), and
disabled otherwise.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.virtual` {#opt-networking.interfaces._name_.virtual}

Whether this interface is virtual and should be created by tunctl.
This is mainly useful for creating bridges between a host and a virtual
network such as VPN or a virtual machine.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.virtualGroup` {#opt-networking.interfaces._name_.virtualGroup}

In case of a virtual device, the group that owns it.
`null` will not set a group. See
[networking](#opt-networking.interfaces._name_.virtualOwner).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.virtualOwner` {#opt-networking.interfaces._name_.virtualOwner}

In case of a virtual device, the user who owns it.
`null` will not set owner. If neither an owner nor a group is
set, Linux \>= 7.3.3 only allows processes with `CAP_NET_ADMIN`
to attach to the device, older kernels allow any user.

*Type:* null or string

*Default:* `"root"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.virtualType` {#opt-networking.interfaces._name_.virtualType}

The type of interface to create.
The default is TUN for an interface name starting
with "tun", otherwise TAP.

*Type:* one of "tun", "tap"

*Default:* `if hasPrefix "tun" name then "tun" else "tap"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.wakeOnLan.enable` {#opt-networking.interfaces._name_.wakeOnLan.enable}

Whether to enable wol on this interface.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.interfaces.<name>.wakeOnLan.policy` {#opt-networking.interfaces._name_.wakeOnLan.policy}

The [Wake-on-LAN policy](https://www.freedesktop.org/software/systemd/man/systemd.link.html#WakeOnLan=)
to set for the device.

The options are

- `phy`: Wake on PHY activity
- `unicast`: Wake on unicast messages
- `multicast`: Wake on multicast messages
- `broadcast`: Wake on broadcast messages
- `arp`: Wake on ARP
- `magic`: Wake on receipt of a magic packet

*Type:* list of (one of "phy", "unicast", "multicast", "broadcast", "arp", "magic", "secureon")

*Default:*

``` nix
[
  "magic"
]
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.ipips` {#opt-networking.ipips}

This option allows you to define interfaces encapsulating IP
packets within IP packets; which should be automatically created.

For example, this allows you to create 4in6 (RFC 2473)
or IP within IP (RFC 2003) tunnels.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  wan4in6 = {
    remote = "2001:db8::1";
    local = "2001:db8::3";
    dev = "wan6";
    encapsulation.type = "4in6";
    encapsulation.limit = 0;
  };
}
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.ipips.<name>.dev` {#opt-networking.ipips._name_.dev}

The underlying network device on which the tunnel resides.

*Type:* null or string

*Default:* `null`

*Example:* `"wan6"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.ipips.<name>.encapsulation.limit` {#opt-networking.ipips._name_.encapsulation.limit}

For an IPv6-based tunnel, the maximum number of nested
encapsulation to allow. 0 means no nesting, "none" unlimited.

*Type:* value "none" (singular enum) or (unsigned integer, meaning \>=0)

*Default:* `4`

*Example:* `"none"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.ipips.<name>.encapsulation.type` {#opt-networking.ipips._name_.encapsulation.type}

Select the encapsulation type:

- `ipip` to create an IPv4 within IPv4 tunnel (RFC 2003).

- `4in6` to create a 4in6 tunnel (RFC 2473);

- `ip6ip6` to create an IPv6 within IPv6 tunnel (RFC 2473);

::: note
For encapsulating IPv6 within IPv4 packets, see
the ad-hoc [`networking.sits`](#opt-networking.sits) option.
:::

*Type:* one of "ipip", "4in6", "ip6ip6"

*Default:* `"ipip"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.ipips.<name>.local` {#opt-networking.ipips._name_.local}

The address of the local endpoint which the remote
side should send packets to.

*Type:* string

*Example:* `"2001:db8::3"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.ipips.<name>.remote` {#opt-networking.ipips._name_.remote}

The address of the remote endpoint to forward traffic over.

*Type:* string

*Example:* `"2001:db8::1"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.ipips.<name>.ttl` {#opt-networking.ipips._name_.ttl}

The time-to-live of the connection to the remote tunnel endpoint.

*Type:* null or signed integer

*Default:* `null`

*Example:* `255`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.iproute2.enable` {#opt-networking.iproute2.enable}

Whether to enable copying IP route configuration files.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/config/iproute2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/iproute2.nix)

## `networking.iproute2.rttablesExtraConfig` {#opt-networking.iproute2.rttablesExtraConfig}

Verbatim lines to add to /etc/iproute2/rt\_tables

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/config/iproute2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/iproute2.nix)

## `networking.ipvlans` {#opt-networking.ipvlans}

This option allows you to define ipvlan interfaces which should
be automatically created.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  wan = {
    interface = "enp2s0";
    mode = "l2";
    flags = "vepa";
  };
}
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.ipvlans.<name>.flags` {#opt-networking.ipvlans._name_.flags}

The flags of the ipvlan device.

*Type:* null or string

*Default:* `null`

*Example:* `"vepa"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.ipvlans.<name>.interface` {#opt-networking.ipvlans._name_.interface}

The interface the ipvlan will transmit packets through.

*Type:* string

*Example:* `"enp4s0"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.ipvlans.<name>.mode` {#opt-networking.ipvlans._name_.mode}

The mode of the interface.

*Type:* one of "l2", "l3", "l3s"

*Default:* `"l2"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.jool.enable` {#opt-networking.jool.enable}

Whether to enable Jool, an Open Source implementation of IPv4/IPv6
translation on Linux.

Jool can perform stateless IP/ICMP translation (SIIT) or stateful
NAT64, analogous to the IPv4 NAPT. Refer to the upstream
[documentation](https://nicmx.github.io/Jool/en/intro-xlat.html) for
the supported modes of translation and how to configure them.

Enabling this option will install the Jool kernel module and the
command line tools for controlling it.

*Type:* boolean

*Default:* `false`

*Related packages:*

- [`pkgs.linuxPackages.jool`](https://search.nixos.org/packages?show=linuxPackages.jool&sort=relevance&query=linuxPackages.jool)
- [`pkgs.jool-cli`](https://search.nixos.org/packages?show=jool-cli&sort=relevance&query=jool-cli)

*Declared by:* [`nixos/modules/services/networking/jool.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jool.nix)

## `networking.jool.nat64` {#opt-networking.jool.nat64}

Definitions of NAT64 instances of Jool.
See the
[documentation](https://nicmx.github.io/Jool/en/config-atomic.html) for
the available options. Also check out the
[tutorial](https://nicmx.github.io/Jool/en/run-nat64.html) for an
introduction to NAT64 and how to troubleshoot the setup.

The attribute name defines the name of the instance, with the main one
being `default`: this can be accessed from the command line without
specifying the name with `-i`.

::: note
Instances created imperatively from the command line will not interfere
with the NixOS instances, provided the respective `pool4` addresses and
port ranges are not overlapping.
:::

::: warning
Changes to an instance performed via `jool -i <name>` are applied
correctly but will be lost after restarting the respective
`jool-nat64-<name>.service`.
:::

*Type:* attribute set of (open submodule of (JSON value))

*Default:* `{ }`

*Example:*

``` nix
{
  default = {
    # custom NAT64 prefix
    global.pool6 = "2001:db8:64::/96";

    # Port forwarding
    bib = [
      { # SSH 192.0.2.16 → 2001:db8:a::1
        "protocol"     = "TCP";
        "ipv4 address" = "192.0.2.16#22";
        "ipv6 address" = "2001:db8:a::1#22";
      }
      { # DNS (TCP) 192.0.2.16 → 2001:db8:a::2
        "protocol"     = "TCP";
        "ipv4 address" = "192.0.2.16#53";
        "ipv6 address" = "2001:db8:a::2#53";
      }
      { # DNS (UDP) 192.0.2.16 → 2001:db8:a::2
        "protocol" = "UDP";
        "ipv4 address" = "192.0.2.16#53";
        "ipv6 address" = "2001:db8:a::2#53";
      }
    ];

    pool4 = [
      # Port ranges for dynamic translation
      { protocol =  "TCP";  prefix = "192.0.2.16/32"; "port range" = "40001-65535"; }
      { protocol =  "UDP";  prefix = "192.0.2.16/32"; "port range" = "40001-65535"; }
      { protocol = "ICMP";  prefix = "192.0.2.16/32"; "port range" = "40001-65535"; }

      # Ports for static BIB entries
      { protocol =  "TCP";  prefix = "192.0.2.16/32"; "port range" = "22"; }
      { protocol =  "UDP";  prefix = "192.0.2.16/32"; "port range" = "53"; }
    ];
  };
}
```

*Declared by:* [`nixos/modules/services/networking/jool.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jool.nix)

## `networking.jool.nat64.<name>.framework` {#opt-networking.jool.nat64._name_.framework}

The framework to use for attaching Jool's translation to the exist
kernel packet processing rules. See the
[documentation](https://nicmx.github.io/Jool/en/intro-jool.html#design)
for the differences between the two options.

*Type:* one of "netfilter", "iptables"

*Default:* `"netfilter"`

*Declared by:* [`nixos/modules/services/networking/jool.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jool.nix)

## `networking.jool.nat64.<name>.global.pool6` {#opt-networking.jool.nat64._name_.global.pool6}

The prefix used for embedding IPv4 into IPv6 addresses.
Defaults to the well-known NAT64 prefix, defined by
[RFC 6052](https://datatracker.ietf.org/doc/html/rfc6052).

*Type:* Network prefix in CIDR notation

*Default:* `"64:ff9b::/96"`

*Declared by:* [`nixos/modules/services/networking/jool.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jool.nix)

## `networking.jool.siit` {#opt-networking.jool.siit}

Definitions of SIIT instances of Jool.
See the
[documentation](https://nicmx.github.io/Jool/en/config-atomic.html) for
the available options. Also check out the
[tutorial](https://nicmx.github.io/Jool/en/run-vanilla.html) for an
introduction to SIIT and how to troubleshoot the setup.

The attribute name defines the name of the instance, with the main one
being `default`: this can be accessed from the command line without
specifying the name with `-i`.

::: note
Instances created imperatively from the command line will not interfere
with the NixOS instances, provided the respective EAMT addresses and
port ranges are not overlapping.
:::

::: warning
Changes to an instance performed via `jool -i <name>` are applied
correctly but will be lost after restarting the respective
`jool-siit-<name>.service`.
:::

*Type:* attribute set of (open submodule of (JSON value))

*Default:* `{ }`

*Example:*

``` nix
{
  default = {
    # Maps any IPv4 address x.y.z.t to 2001:db8::x.y.z.t and v.v.
    global.pool6 = "2001:db8::/96";

    # Explicit address mappings
    eamt = [
      # 2001:db8:1:: ←→ 192.0.2.0
      { "ipv6 prefix" = "2001:db8:1::/128"; "ipv4 prefix" = "192.0.2.0"; }
      # 2001:db8:1::x ←→ 198.51.100.x
      { "ipv6 prefix" = "2001:db8:2::/120"; "ipv4 prefix" = "198.51.100.0/24"; }
    ];
  };
}
```

*Declared by:* [`nixos/modules/services/networking/jool.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jool.nix)

## `networking.jool.siit.<name>.framework` {#opt-networking.jool.siit._name_.framework}

The framework to use for attaching Jool's translation to the exist
kernel packet processing rules. See the
[documentation](https://nicmx.github.io/Jool/en/intro-jool.html#design)
for the differences between the two options.

*Type:* one of "netfilter", "iptables"

*Default:* `"netfilter"`

*Declared by:* [`nixos/modules/services/networking/jool.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jool.nix)

## `networking.localCommands` {#opt-networking.localCommands}

Shell commands to be executed after all the network
interfaces have been created, but not necessarily
fully configured.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"text=anything; echo You can put $text here."`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.macvlans` {#opt-networking.macvlans}

This option allows you to define macvlan interfaces which should
be automatically created.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  wan = {
    interface = "enp2s0";
    mode = "vepa";
  };
}
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.macvlans.<name>.interface` {#opt-networking.macvlans._name_.interface}

The interface the macvlan will transmit packets through.

*Type:* string

*Example:* `"enp4s0"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.macvlans.<name>.mode` {#opt-networking.macvlans._name_.mode}

The mode of the macvlan device.

*Type:* null or string

*Default:* `null`

*Example:* `"vepa"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.modemmanager.enable` {#opt-networking.modemmanager.enable}

Whether to use ModemManager to manage modem devices.
This is usually used by some higher layer manager such as NetworkManager
but can be used standalone especially if using a modem for non-IP
connectivity (e.g. GPS).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/modemmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/modemmanager.nix)

## `networking.modemmanager.fccUnlockScripts` {#opt-networking.modemmanager.fccUnlockScripts}

List of FCC unlock scripts to enable on the system, behaving as described in
https://modemmanager.org/docs/modemmanager/fcc-unlock/#integration-with-third-party-fcc-unlock-tools.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:* `[{ id = "03f0:4e1d"; path = "${pkgs.modemmanager}/share/ModemManager/fcc-unlock.available.d/03f0:4e1d"; }]`

*Declared by:* [`nixos/modules/services/networking/modemmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/modemmanager.nix)

## `networking.modemmanager.fccUnlockScripts.*.id` {#opt-networking.modemmanager.fccUnlockScripts._.id}

vid:pid of either the PCI or USB vendor and product ID

*Type:* string

*Declared by:* [`nixos/modules/services/networking/modemmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/modemmanager.nix)

## `networking.modemmanager.fccUnlockScripts.*.path` {#opt-networking.modemmanager.fccUnlockScripts._.path}

Path to the unlock script

*Type:* absolute path

*Declared by:* [`nixos/modules/services/networking/modemmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/modemmanager.nix)

## `networking.modemmanager.package` {#opt-networking.modemmanager.package}

The modemmanager package to use.

*Type:* package

*Default:* `pkgs.modemmanager`

*Declared by:* [`nixos/modules/services/networking/modemmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/modemmanager.nix)

## `networking.nameservers` {#opt-networking.nameservers}

The list of nameservers.  It can be left empty if it is auto-detected through DHCP.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "130.161.158.4"
  "130.161.33.17"
]
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.nat.dmzHost` {#opt-networking.nat.dmzHost}

The local IP address to which all traffic that does not match any
forwarding rule is forwarded.

*Type:* null or string

*Default:* `null`

*Example:* `"10.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/nat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nat.nix)

## `networking.nat.enable` {#opt-networking.nat.enable}

Whether to enable Network Address Translation (NAT). A
properly configured firewall or a trusted L2 on all network
interfaces is required to prevent unauthorized access to
the internal network.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nat.nix)

## `networking.nat.enableIPv6` {#opt-networking.nat.enableIPv6}

Whether to enable IPv6 NAT.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nat.nix)

## `networking.nat.externalIP` {#opt-networking.nat.externalIP}

The public IP address to which packets from the local
network are to be rewritten.  If this is left empty, the
IP address associated with the external interface will be
used.  Only connections made to this IP address will be
forwarded to the internal network when using forwardPorts.

*Type:* null or string

*Default:* `null`

*Example:* `"203.0.113.123"`

*Declared by:* [`nixos/modules/services/networking/nat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nat.nix)

## `networking.nat.externalIPv6` {#opt-networking.nat.externalIPv6}

The public IPv6 address to which packets from the local
network are to be rewritten.  If this is left empty, the
IP address associated with the external interface will be
used.  Only connections made to this IP address will be
forwarded to the internal network when using forwardPorts.

*Type:* null or string

*Default:* `null`

*Example:* `"2001:dc0:2001:11::175"`

*Declared by:* [`nixos/modules/services/networking/nat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nat.nix)

## `networking.nat.externalInterface` {#opt-networking.nat.externalInterface}

The name of the external network interface.

*Type:* null or string

*Default:* `null`

*Example:* `"eth1"`

*Declared by:* [`nixos/modules/services/networking/nat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nat.nix)

## `networking.nat.extraCommands` {#opt-networking.nat.extraCommands}

Additional shell commands executed as part of the nat
initialisation script.

This option is incompatible with the nftables based nat module.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"iptables -A INPUT -p icmp -j ACCEPT"`

*Declared by:* [`nixos/modules/services/networking/nat-iptables.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nat-iptables.nix)

## `networking.nat.extraStopCommands` {#opt-networking.nat.extraStopCommands}

Additional shell commands executed as part of the nat
teardown script.

This option is incompatible with the nftables based nat module.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"iptables -D INPUT -p icmp -j ACCEPT || true"`

*Declared by:* [`nixos/modules/services/networking/nat-iptables.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nat-iptables.nix)

## `networking.nat.forwardPorts` {#opt-networking.nat.forwardPorts}

List of forwarded ports from the external interface to
internal destinations by using DNAT. Destination can be
IPv6 if IPv6 NAT is enabled.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    destination = "10.0.0.1:80";
    proto = "tcp";
    sourcePort = 8080;
  }
  {
    destination = "[fc00::2]:80";
    proto = "tcp";
    sourcePort = 8080;
  }
]
```

*Declared by:* [`nixos/modules/services/networking/nat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nat.nix)

## `networking.nat.forwardPorts.*.destination` {#opt-networking.nat.forwardPorts._.destination}

Forward connection to destination ip:port (or \[ipv6\]:port); to specify a port range, use ip:start-end

*Type:* string

*Example:* `"10.0.0.1:80"`

*Declared by:* [`nixos/modules/services/networking/nat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nat.nix)

## `networking.nat.forwardPorts.*.loopbackIPs` {#opt-networking.nat.forwardPorts._.loopbackIPs}

Public IPs for NAT reflection; for connections to `loopbackip:sourcePort` from the host itself and from other hosts behind NAT

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "55.1.2.3" ]`

*Declared by:* [`nixos/modules/services/networking/nat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nat.nix)

## `networking.nat.forwardPorts.*.proto` {#opt-networking.nat.forwardPorts._.proto}

Protocol of forwarded connection

*Type:* string

*Default:* `"tcp"`

*Example:* `"udp"`

*Declared by:* [`nixos/modules/services/networking/nat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nat.nix)

## `networking.nat.forwardPorts.*.sourcePort` {#opt-networking.nat.forwardPorts._.sourcePort}

Source port of the external interface; to specify a port range, use a string with a colon (e.g. "60000:61000")

*Type:* signed integer or string matching the pattern \[\[:digit:\]\]+:\[\[:digit:\]\]+

*Example:* `8080`

*Declared by:* [`nixos/modules/services/networking/nat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nat.nix)

## `networking.nat.internalIPs` {#opt-networking.nat.internalIPs}

The IP address ranges for which to perform NAT.  Packets
coming from these addresses (on any interface) and destined
for the external interface will be rewritten.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "192.168.1.0/24"
]
```

*Declared by:* [`nixos/modules/services/networking/nat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nat.nix)

## `networking.nat.internalIPv6s` {#opt-networking.nat.internalIPv6s}

The IPv6 address ranges for which to perform NAT.  Packets
coming from these addresses (on any interface) and destined
for the external interface will be rewritten.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "fc00::/64"
]
```

*Declared by:* [`nixos/modules/services/networking/nat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nat.nix)

## `networking.nat.internalInterfaces` {#opt-networking.nat.internalInterfaces}

The interfaces for which to perform NAT. Packets coming from
these interface and destined for the external interface will
be rewritten.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "eth0"
]
```

*Declared by:* [`nixos/modules/services/networking/nat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nat.nix)

## `networking.netplan.configFiles` {#opt-networking.netplan.configFiles}

Netplan YAML configuration files to write under /etc/netplan/

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
''
  {
    "10-example.yaml" = \'\'
       ---
       network:
         version: 2
         dummy-devices:
           example:
             addresses: ["fd00::feed:cafe/32"]
       \'\'
  }
''
```

*Declared by:* [`nixos/modules/services/networking/netplan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netplan.nix)

## `networking.netplan.enable` {#opt-networking.netplan.enable}

Whether to enable Whether to enable the netplan-configure service at boot.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/netplan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netplan.nix)

## `networking.netplan.package` {#opt-networking.netplan.package}

The netplan package to use.

*Type:* package

*Default:* `pkgs.netplan`

*Declared by:* [`nixos/modules/services/networking/netplan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/netplan.nix)

## `networking.networkmanager.appendNameservers` {#opt-networking.networkmanager.appendNameservers}

A list of name servers that should be appended
to the ones configured in NetworkManager or received by DHCP.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/networkmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkmanager.nix)

## `networking.networkmanager.connectionConfig` {#opt-networking.networkmanager.connectionConfig}

Configuration for the \[connection\] section of NetworkManager.conf.
Refer to
[https://networkmanager.dev/docs/api/latest/NetworkManager.conf.html#id-1.2.3.11](https://networkmanager.dev/docs/api/latest/NetworkManager.conf.html#id-1.2.3.11)
or
`NetworkManager.conf(5)`
for more information.

*Type:* attribute set of (null or boolean or signed integer or string)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/networkmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkmanager.nix)

## `networking.networkmanager.dhcp` {#opt-networking.networkmanager.dhcp}

Which program (or internal library) should be used for DHCP.

*Type:* one of "dhcpcd", "internal"

*Default:* `"internal"`

*Declared by:* [`nixos/modules/services/networking/networkmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkmanager.nix)

## `networking.networkmanager.dispatcherScripts` {#opt-networking.networkmanager.dispatcherScripts}

A list of scripts which will be executed in response to network events.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[ {
  source = pkgs.writeText "upHook" ''
    if [ "$2" != "up" ]; then
      logger "exit: event $2 != up"
      exit
    fi

    # coreutils and iproute are in PATH too
    logger "Device $DEVICE_IFACE coming up"
  '';
  type = "basic";
} ]
```

*Declared by:* [`nixos/modules/services/networking/networkmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkmanager.nix)

## `networking.networkmanager.dispatcherScripts.*.source` {#opt-networking.networkmanager.dispatcherScripts._.source}

Path to the hook script.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/networking/networkmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkmanager.nix)

## `networking.networkmanager.dispatcherScripts.*.type` {#opt-networking.networkmanager.dispatcherScripts._.type}

Dispatcher hook type. Look up the hooks described at
[https://networkmanager.dev/docs/api/latest/NetworkManager-dispatcher.html](https://networkmanager.dev/docs/api/latest/NetworkManager-dispatcher.html)
and choose the type depending on the output folder.
You should then filter the event type (e.g., "up"/"down") from within your script.

*Type:* one of "basic", "pre-down", "pre-up"

*Default:* `"basic"`

*Declared by:* [`nixos/modules/services/networking/networkmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkmanager.nix)

## `networking.networkmanager.dns` {#opt-networking.networkmanager.dns}

Set the DNS (`resolv.conf`) processing mode.

A description of these modes can be found in the main section of
[https://networkmanager.dev/docs/api/latest/NetworkManager.conf.html](https://networkmanager.dev/docs/api/latest/NetworkManager.conf.html)
or in
`NetworkManager.conf(5)`.

*Type:* one of "default", "dnsmasq", "systemd-resolved", "none"

*Default:* `"default"`

*Declared by:* [`nixos/modules/services/networking/networkmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkmanager.nix)

## `networking.networkmanager.enable` {#opt-networking.networkmanager.enable}

Whether to use NetworkManager to obtain an IP address and other
configuration for all network interfaces that are not manually
configured. If enabled, a group `networkmanager`
will be created. Add all users that should have permission
to change network settings to this group.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/networkmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkmanager.nix)

## `networking.networkmanager.ensureProfiles.environmentFiles` {#opt-networking.networkmanager.ensureProfiles.environmentFiles}

Files to load as environment file. Environment variables from this file
will be substituted into the static configuration file using [envsubst](https://github.com/a8m/envsubst).

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/run/secrets/network-manager.env"
]
```

*Declared by:* [`nixos/modules/services/networking/networkmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkmanager.nix)

## `networking.networkmanager.ensureProfiles.profiles` {#opt-networking.networkmanager.ensureProfiles.profiles}

Declaratively define NetworkManager profiles. You can find information about the generated file format [here](https://networkmanager.dev/docs/api/latest/nm-settings-keyfile.html) and [here](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_and_managing_networking/assembly_networkmanager-connection-profiles-in-keyfile-format_configuring-and-managing-networking).
You current profiles which are most likely stored in `/etc/NetworkManager/system-connections` and there is [a tool](https://github.com/janik-haag/nm2nix) to convert them to the needed nix code.
If you add a new ad-hoc connection via a GUI or nmtui or anything similar it should just work together with the declarative ones.
And if you edit a declarative profile NetworkManager will move it to the persistent storage and treat it like a ad-hoc one,
but there will be two profiles as soon as the systemd unit from this option runs again which can be confusing since NetworkManager tools will start displaying two profiles with the same name and probably a bit different settings depending on what you edited.
A profile won't be deleted even if it's removed from the config until the system reboots because that's when NetworkManager clears it's temp directory.
If `networking.resolvconf.enable` is true, attributes affecting the name resolution (such as `ignore-auto-dns`) may not end up changing `/etc/resolv.conf` as expected when other name services (for example `networking.dhcpcd`) are enabled. Run `resolvconf -l` in the terminal to see what each service produces.

*Type:* attribute set of (open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string)))

*Default:* `{ }`

*Example:*

``` nix
{
  home-wifi = {
    connection = {
      id = "home-wifi";
      permissions = "";
      type = "wifi";
    };
    ipv4 = {
      dns-search = "";
      method = "auto";
    };
    ipv6 = {
      addr-gen-mode = "stable-privacy";
      dns-search = "";
      method = "auto";
    };
    wifi = {
      mac-address-blacklist = "";
      mode = "infrastructure";
      ssid = "Home Wi-Fi";
    };
    wifi-security = {
      auth-alg = "open";
      key-mgmt = "wpa-psk";
      psk = "$HOME_WIFI_PASSWORD";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/networking/networkmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkmanager.nix)

## `networking.networkmanager.ensureProfiles.profiles.<name>.connection.id` {#opt-networking.networkmanager.ensureProfiles.profiles._name_.connection.id}

This is the name that will be displayed by NetworkManager and GUIs.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/networkmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkmanager.nix)

## `networking.networkmanager.ensureProfiles.profiles.<name>.connection.type` {#opt-networking.networkmanager.ensureProfiles.profiles._name_.connection.type}

The connection type defines the connection kind, like vpn, wireguard, gsm, wifi and more.

*Type:* string

*Example:* `"vpn"`

*Declared by:* [`nixos/modules/services/networking/networkmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkmanager.nix)

## `networking.networkmanager.ensureProfiles.secrets.entries` {#opt-networking.networkmanager.ensureProfiles.secrets.entries}

A list of secrets to provide to NetworkManager by reading their values from configured files.

Note that NetworkManager should be configured to read secrets from a secret agent.
This can be done for example through the `networking.networkmanager.ensureProfiles.profiles` options.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    file = "/root/wireguard_key";
    key = "private-key";
    matchId = "My WireGuard VPN";
    matchSetting = "wireguard";
    matchType = "wireguard";
  }
]
```

*Declared by:* [`nixos/modules/services/networking/nm-file-secret-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nm-file-secret-agent.nix)

## `networking.networkmanager.ensureProfiles.secrets.entries.*.file` {#opt-networking.networkmanager.ensureProfiles.secrets.entries._.file}

file from which the secret value is read

*Type:* string

*Declared by:* [`nixos/modules/services/networking/nm-file-secret-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nm-file-secret-agent.nix)

## `networking.networkmanager.ensureProfiles.secrets.entries.*.key` {#opt-networking.networkmanager.ensureProfiles.secrets.entries._.key}

key in the setting section for which this entry provides a value

*Type:* string

*Declared by:* [`nixos/modules/services/networking/nm-file-secret-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nm-file-secret-agent.nix)

## `networking.networkmanager.ensureProfiles.secrets.entries.*.matchId` {#opt-networking.networkmanager.ensureProfiles.secrets.entries._.matchId}

connection id used by NetworkManager. Often displayed as name in GUIs.

NetworkManager describes this as a human readable unique identifier for the connection, like "Work Wi-Fi" or "T-Mobile 3G".

*Type:* null or string

*Default:* `null`

*Example:* `"wifi1"`

*Declared by:* [`nixos/modules/services/networking/nm-file-secret-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nm-file-secret-agent.nix)

## `networking.networkmanager.ensureProfiles.secrets.entries.*.matchIface` {#opt-networking.networkmanager.ensureProfiles.secrets.entries._.matchIface}

interface name of the NetworkManager connection

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/nm-file-secret-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nm-file-secret-agent.nix)

## `networking.networkmanager.ensureProfiles.secrets.entries.*.matchSetting` {#opt-networking.networkmanager.ensureProfiles.secrets.entries._.matchSetting}

name of the setting section for which secrets are requested

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/nm-file-secret-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nm-file-secret-agent.nix)

## `networking.networkmanager.ensureProfiles.secrets.entries.*.matchType` {#opt-networking.networkmanager.ensureProfiles.secrets.entries._.matchType}

NetworkManager connection type

The NetworkManager configuration settings reference roughly corresponds to connection types.
More might be available on your system depending on the installed plugins.

[https://networkmanager.dev/docs/api/latest/ch01.html](https://networkmanager.dev/docs/api/latest/ch01.html)

*Type:* null or string

*Default:* `null`

*Example:* `"wireguard"`

*Declared by:* [`nixos/modules/services/networking/nm-file-secret-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nm-file-secret-agent.nix)

## `networking.networkmanager.ensureProfiles.secrets.entries.*.matchUuid` {#opt-networking.networkmanager.ensureProfiles.secrets.entries._.matchUuid}

UUID of the connection profile

UUIDs are assigned once on connection creation and should never change as long as the connection still applies to the same network.

*Type:* null or string

*Default:* `null`

*Example:* `"669ea4c9-4cb3-4901-ab52-f9606590976e"`

*Declared by:* [`nixos/modules/services/networking/nm-file-secret-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nm-file-secret-agent.nix)

## `networking.networkmanager.ensureProfiles.secrets.entries.*.trim` {#opt-networking.networkmanager.ensureProfiles.secrets.entries._.trim}

whether leading and trailing whitespace should be stripped from the files content before being passed to NetworkManager

*Type:* null or boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/nm-file-secret-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nm-file-secret-agent.nix)

## `networking.networkmanager.ensureProfiles.secrets.package` {#opt-networking.networkmanager.ensureProfiles.secrets.package}

The nm-file-secret-agent package to use.

*Type:* package

*Default:* `pkgs.nm-file-secret-agent`

*Declared by:* [`nixos/modules/services/networking/nm-file-secret-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nm-file-secret-agent.nix)

## `networking.networkmanager.ethernet.macAddress` {#opt-networking.networkmanager.ethernet.macAddress}

Set the MAC address of the interface.

- `"XX:XX:XX:XX:XX:XX"`: MAC address of the interface
- `"permanent"`: Use the permanent MAC address of the device
- `"preserve"`: Don’t change the MAC address of the device upon activation
- `"random"`: Generate a randomized value upon each connect
- `"stable"`: Generate a stable, hashed MAC address

*Type:* string or one of "permanent", "preserve", "random", "stable"

*Default:* `"preserve"`

*Example:* `"00:11:22:33:44:55"`

*Declared by:* [`nixos/modules/services/networking/networkmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkmanager.nix)

## `networking.networkmanager.insertNameservers` {#opt-networking.networkmanager.insertNameservers}

A list of name servers that should be inserted before
the ones configured in NetworkManager or received by DHCP.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/networkmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkmanager.nix)

## `networking.networkmanager.logLevel` {#opt-networking.networkmanager.logLevel}

Set the default logging verbosity level.

*Type:* one of "OFF", "ERR", "WARN", "INFO", "DEBUG", "TRACE"

*Default:* `"WARN"`

*Declared by:* [`nixos/modules/services/networking/networkmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkmanager.nix)

## `networking.networkmanager.package` {#opt-networking.networkmanager.package}

The networkmanager package to use.

*Type:* package

*Default:* `pkgs.networkmanager`

*Declared by:* [`nixos/modules/services/networking/networkmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkmanager.nix)

## `networking.networkmanager.plugins` {#opt-networking.networkmanager.plugins}

List of plugin packages to install.

See [https://search.nixos.org/packages?query=networkmanager-](https://search.nixos.org/packages?query=networkmanager-) for available plugin packages.
and [https://networkmanager.dev/docs/vpn/](https://networkmanager.dev/docs/vpn/) for an overview over builtin and external plugins
and their support status.

*Type:* list of NetworkManager plugin package

*Default:* `[ ]`

*Example:*

``` nix
with pkgs; [
  networkmanager-iodine
  networkmanager-libreswan
  networkmanager-l2tp
  networkmanager-openconnect
  networkmanager-openvpn
  networkmanager-sstp
  networkmanager-strongswan
]
```

*Declared by:* [`nixos/modules/services/networking/networkmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkmanager.nix)

## `networking.networkmanager.settings` {#opt-networking.networkmanager.settings}

Configuration added to the generated NetworkManager.conf, note that you can overwrite settings with this.
Refer to
[https://networkmanager.dev/docs/api/latest/NetworkManager.conf.html](https://networkmanager.dev/docs/api/latest/NetworkManager.conf.html)
or
`NetworkManager.conf(5)`
for more information.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/networkmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkmanager.nix)

## `networking.networkmanager.unmanaged` {#opt-networking.networkmanager.unmanaged}

List of interfaces that will not be managed by NetworkManager.
Interface name can be specified here, but if you need more fidelity,
refer to
[https://networkmanager.dev/docs/api/latest/NetworkManager.conf.html#device-spec](https://networkmanager.dev/docs/api/latest/NetworkManager.conf.html#device-spec)
or the "Device List Format" Appendix of
`NetworkManager.conf(5)`.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/networkmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkmanager.nix)

## `networking.networkmanager.wifi.backend` {#opt-networking.networkmanager.wifi.backend}

Specify the Wi-Fi backend used for the device.
Currently supported are `wpa_supplicant` or `iwd` (experimental).

*Type:* one of "wpa\_supplicant", "iwd"

*Default:* `"wpa_supplicant"`

*Declared by:* [`nixos/modules/services/networking/networkmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkmanager.nix)

## `networking.networkmanager.wifi.macAddress` {#opt-networking.networkmanager.wifi.macAddress}

Set the MAC address of the interface.

- `"XX:XX:XX:XX:XX:XX"`: MAC address of the interface
- `"permanent"`: Use the permanent MAC address of the device
- `"preserve"`: Don’t change the MAC address of the device upon activation
- `"random"`: Generate a randomized value upon each connect
- `"stable"`: Generate a stable, hashed MAC address
- `"stable-ssid"`: Generate a stable MAC addressed based on Wi-Fi network

*Type:* string or one of "permanent", "preserve", "random", "stable", "stable-ssid"

*Default:* `"preserve"`

*Example:* `"00:11:22:33:44:55"`

*Declared by:* [`nixos/modules/services/networking/networkmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkmanager.nix)

## `networking.networkmanager.wifi.powersave` {#opt-networking.networkmanager.wifi.powersave}

Whether to enable Wi-Fi power saving.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/networkmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkmanager.nix)

## `networking.networkmanager.wifi.scanRandMacAddress` {#opt-networking.networkmanager.wifi.scanRandMacAddress}

Whether to enable MAC address randomization of a Wi-Fi device
during scanning.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/networkmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/networkmanager.nix)

## `networking.nftables.checkRuleset` {#opt-networking.nftables.checkRuleset}

Run `nft check` on the ruleset to spot syntax errors during build.
Because this is executed in a sandbox, the check might fail if it requires
access to any environmental factors or paths outside the Nix store.
To circumvent this, the ruleset file can be edited using the preCheckRuleset
option to work in the sandbox environment.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/nftables.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nftables.nix)

## `networking.nftables.checkRulesetRedirects` {#opt-networking.nftables.checkRulesetRedirects}

Set of paths that should be intercepted and rewritten while checking the ruleset
using `pkgs.buildPackages.libredirect`.

*Type:* attribute set of absolute path

*Default:*

``` nix
{
  "/etc/hosts" = config.environment.etc.hosts.source;
  "/etc/protocols" = config.environment.etc.protocols.source;
  "/etc/services" = config.environment.etc.services.source;
}
```

*Declared by:* [`nixos/modules/services/networking/nftables.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nftables.nix)

## `networking.nftables.enable` {#opt-networking.nftables.enable}

Whether to enable nftables and use nftables based firewall if enabled.
nftables is a Linux-based packet filtering framework intended to
replace frameworks like iptables.

Note that if you have Docker enabled you will not be able to use
nftables without intervention. Docker uses iptables internally to
setup NAT for containers. This module disables the ip\_tables kernel
module, however Docker automatically loads the module. Please see
[https://github.com/NixOS/nixpkgs/issues/24318#issuecomment-289216273](https://github.com/NixOS/nixpkgs/issues/24318#issuecomment-289216273)
for more information.

There are other programs that use iptables internally too, such as
libvirt. For information on how the two firewalls interact, see
[https://wiki.nftables.org/wiki-nftables/index.php/Troubleshooting#Question\_4.\_How\_do\_nftables\_and\_iptables\_interact\_when\_used\_on\_the\_same\_system.3F](https://wiki.nftables.org/wiki-nftables/index.php/Troubleshooting#Question_4._How_do_nftables_and_iptables_interact_when_used_on_the_same_system.3F).

Some network configurations may prevent VMs from having network access, see
[https://wiki.nixos.org/wiki/Networking#Virtualization](https://wiki.nixos.org/wiki/Networking#Virtualization).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nftables.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nftables.nix)

## `networking.nftables.extraDeletions` {#opt-networking.nftables.extraDeletions}

Extra deletion commands to be run on every firewall start, reload
and after stopping the firewall.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  # this makes deleting a non-existing table a no-op instead of an error
  table inet some-table;
  
  delete table inet some-table;
''
```

*Declared by:* [`nixos/modules/services/networking/nftables.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nftables.nix)

## `networking.nftables.flattenRulesetFile` {#opt-networking.nftables.flattenRulesetFile}

Use `builtins.readFile` rather than `include` to handle [`networking.nftables.rulesetFile`](#opt-networking.nftables.rulesetFile). It is useful when you want to apply [`networking.nftables.preCheckRuleset`](#opt-networking.nftables.preCheckRuleset) to [`networking.nftables.rulesetFile`](#opt-networking.nftables.rulesetFile).

::: note
It is expected that [`networking.nftables.rulesetFile`](#opt-networking.nftables.rulesetFile) can be accessed from the build sandbox.
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/nftables.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nftables.nix)

## `networking.nftables.flushRuleset` {#opt-networking.nftables.flushRuleset}

Whether to enable flushing the entire ruleset on each reload.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/nftables.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nftables.nix)

## `networking.nftables.preCheckRuleset` {#opt-networking.nftables.preCheckRuleset}

This script gets run before the ruleset is checked. It can be used to
create additional files needed for the ruleset check to work, or modify
the ruleset for cases the build environment cannot cover.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
# replace users/groups that don't exist in the test
sed 's/skgid meadow/skgid root/g' -i ruleset.conf
```

*Declared by:* [`nixos/modules/services/networking/nftables.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nftables.nix)

## `networking.nftables.ruleset` {#opt-networking.nftables.ruleset}

The ruleset to be used with nftables.  Should be in a format that
can be loaded using "/bin/nft -f".  The ruleset is updated atomically.
Note that if the tables should be cleaned first, either:

- networking.nftables.flushRuleset = true; needs to be set (flushes all tables)
- networking.nftables.extraDeletions needs to be set
- or networking.nftables.tables can be used, which will clean up the table automatically

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  # Check out https://wiki.nftables.org/ for better documentation.
  # Table for both IPv4 and IPv6.
  table inet filter {
    # Block all incoming connections traffic except SSH and "ping".
    chain input {
      type filter hook input priority 0;
  
      # accept any localhost traffic
      iifname lo accept
  
      # accept traffic originated from us
      ct state {established, related} accept
  
      # ICMP
      # routers may also want: mld-listener-query, nd-router-solicit
      ip6 nexthdr icmpv6 icmpv6 type { destination-unreachable, packet-too-big, time-exceeded, parameter-problem, nd-router-advert, nd-neighbor-solicit, nd-neighbor-advert } accept
      ip protocol icmp icmp type { destination-unreachable, router-advertisement, time-exceeded, parameter-problem } accept
  
      # allow "ping"
      ip6 nexthdr icmpv6 icmpv6 type echo-request accept
      ip protocol icmp icmp type echo-request accept
  
      # accept SSH connections (required for a server)
      tcp dport 22 accept
  
      # count and drop any other traffic
      counter drop
    }
  
    # Allow all outgoing connections.
    chain output {
      type filter hook output priority 0;
      accept
    }
  
    chain forward {
      type filter hook forward priority 0;
      accept
    }
  }
''
```

*Declared by:* [`nixos/modules/services/networking/nftables.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nftables.nix)

## `networking.nftables.rulesetFile` {#opt-networking.nftables.rulesetFile}

The ruleset file to be used with nftables.  Should be in a format that
can be loaded using "nft -f".  The ruleset is updated atomically.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/nftables.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nftables.nix)

## `networking.nftables.tables` {#opt-networking.nftables.tables}

Tables to be added to ruleset.
Tables will be added together with delete statements to clean up the table before every update.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  filter = {
    content = ''
      # Check out https://wiki.nftables.org/ for better documentation.
      # Table for both IPv4 and IPv6.
      # Block all incoming connections traffic except SSH and "ping".
      chain input {
        type filter hook input priority 0;
      
        # accept any localhost traffic
        iifname lo accept
      
        # accept traffic originated from us
        ct state {established, related} accept
      
        # ICMP
        # routers may also want: mld-listener-query, nd-router-solicit
        ip6 nexthdr icmpv6 icmpv6 type { destination-unreachable, packet-too-big, time-exceeded, parameter-problem, nd-router-advert, nd-neighbor-solicit, nd-neighbor-advert } accept
        ip protocol icmp icmp type { destination-unreachable, router-advertisement, time-exceeded, parameter-problem } accept
      
        # allow "ping"
        ip6 nexthdr icmpv6 icmpv6 type echo-request accept
        ip protocol icmp icmp type echo-request accept
      
        # accept SSH connections (required for a server)
        tcp dport 22 accept
      
        # count and drop any other traffic
        counter drop
      }
      
      # Allow all outgoing connections.
      chain output {
        type filter hook output priority 0;
        accept
      }
      
      chain forward {
        type filter hook forward priority 0;
        accept
      }
    '';
    family = "inet";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/nftables.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nftables.nix)

## `networking.nftables.tables.<name>.content` {#opt-networking.nftables.tables._name_.content}

The table content.

*Type:* strings concatenated with "\\n"

*Declared by:* [`nixos/modules/services/networking/nftables.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nftables.nix)

## `networking.nftables.tables.<name>.enable` {#opt-networking.nftables.tables._name_.enable}

Enable this table.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/nftables.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nftables.nix)

## `networking.nftables.tables.<name>.family` {#opt-networking.nftables.tables._name_.family}

Table family.

*Type:* one of "ip", "ip6", "inet", "arp", "bridge", "netdev"

*Declared by:* [`nixos/modules/services/networking/nftables.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nftables.nix)

## `networking.nftables.tables.<name>.name` {#opt-networking.nftables.tables._name_.name}

Table name.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/nftables.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/nftables.nix)

## `networking.openconnect.interfaces` {#opt-networking.openconnect.interfaces}

OpenConnect interfaces.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  openconnect0 = {
    gateway = "gateway.example.com";
    passwordFile = "/var/lib/secrets/openconnect-passwd";
    protocol = "anyconnect";
    user = "example-user";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/openconnect.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/openconnect.nix)

## `networking.openconnect.interfaces.<name>.autoStart` {#opt-networking.openconnect.interfaces._name_.autoStart}

Whether this VPN connection should be started automatically.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/openconnect.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/openconnect.nix)

## `networking.openconnect.interfaces.<name>.certificate` {#opt-networking.openconnect.interfaces._name_.certificate}

Certificate to authenticate with.

*Type:* null or absolute path or PKCS#11 URI

*Default:* `null`

*Example:* `"/var/lib/secrets/openconnect_certificate.pem"`

*Declared by:* [`nixos/modules/services/networking/openconnect.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/openconnect.nix)

## `networking.openconnect.interfaces.<name>.extraOptions` {#opt-networking.openconnect.interfaces._name_.extraOptions}

Extra config to be appended to the interface config. It should
contain long-format options as would be accepted on the command
line by `openconnect`
(see [https://www.infradead.org/openconnect/manual.html](https://www.infradead.org/openconnect/manual.html)).
Non-key-value options like `deflate` can be used by
declaring them as booleans, i. e. `deflate = true;`.

*Type:* attribute set of (string or boolean)

*Default:* `{ }`

*Example:*

``` nix
{
  compression = "stateless";
  no-dtls = true;
  no-http-keepalive = true;
}
```

*Declared by:* [`nixos/modules/services/networking/openconnect.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/openconnect.nix)

## `networking.openconnect.interfaces.<name>.gateway` {#opt-networking.openconnect.interfaces._name_.gateway}

Gateway server to connect to.

*Type:* string

*Example:* `"gateway.example.com"`

*Declared by:* [`nixos/modules/services/networking/openconnect.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/openconnect.nix)

## `networking.openconnect.interfaces.<name>.passwordFile` {#opt-networking.openconnect.interfaces._name_.passwordFile}

File containing the password to authenticate with. This
is passed to `openconnect` via the
`--passwd-on-stdin` option.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/secrets/openconnect-passwd"`

*Declared by:* [`nixos/modules/services/networking/openconnect.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/openconnect.nix)

## `networking.openconnect.interfaces.<name>.privateKey` {#opt-networking.openconnect.interfaces._name_.privateKey}

Private key to authenticate with.

*Type:* null or absolute path or PKCS#11 URI

*Default:* `null`

*Example:* `"/var/lib/secrets/openconnect_private_key.pem"`

*Declared by:* [`nixos/modules/services/networking/openconnect.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/openconnect.nix)

## `networking.openconnect.interfaces.<name>.protocol` {#opt-networking.openconnect.interfaces._name_.protocol}

Protocol to use.

*Type:* one of "anyconnect", "array", "nc", "pulse", "gp", "f5", "fortinet"

*Example:* `"anyconnect"`

*Declared by:* [`nixos/modules/services/networking/openconnect.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/openconnect.nix)

## `networking.openconnect.interfaces.<name>.user` {#opt-networking.openconnect.interfaces._name_.user}

Username to authenticate with.

*Type:* null or string

*Default:* `null`

*Example:* `"example-user"`

*Declared by:* [`nixos/modules/services/networking/openconnect.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/openconnect.nix)

## `networking.openconnect.package` {#opt-networking.openconnect.package}

The openconnect package to use.

*Type:* package

*Default:* `pkgs.openconnect`

*Declared by:* [`nixos/modules/services/networking/openconnect.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/openconnect.nix)

## `networking.proxy.allProxy` {#opt-networking.proxy.allProxy}

This option specifies the all\_proxy environment variable.

*Type:* null or string

*Default:* `config.networking.proxy.default`

*Example:* `"http://127.0.0.1:3128"`

*Declared by:* [`nixos/modules/config/networking.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/networking.nix)

## `networking.proxy.default` {#opt-networking.proxy.default}

This option specifies the default value for httpProxy, httpsProxy, ftpProxy and rsyncProxy.

*Type:* null or string

*Default:* `null`

*Example:* `"http://127.0.0.1:3128"`

*Declared by:* [`nixos/modules/config/networking.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/networking.nix)

## `networking.proxy.ftpProxy` {#opt-networking.proxy.ftpProxy}

This option specifies the ftp\_proxy environment variable.

*Type:* null or string

*Default:* `config.networking.proxy.default`

*Example:* `"http://127.0.0.1:3128"`

*Declared by:* [`nixos/modules/config/networking.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/networking.nix)

## `networking.proxy.httpProxy` {#opt-networking.proxy.httpProxy}

This option specifies the http\_proxy environment variable.

*Type:* null or string

*Default:* `config.networking.proxy.default`

*Example:* `"http://127.0.0.1:3128"`

*Declared by:* [`nixos/modules/config/networking.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/networking.nix)

## `networking.proxy.httpsProxy` {#opt-networking.proxy.httpsProxy}

This option specifies the https\_proxy environment variable.

*Type:* null or string

*Default:* `config.networking.proxy.default`

*Example:* `"http://127.0.0.1:3128"`

*Declared by:* [`nixos/modules/config/networking.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/networking.nix)

## `networking.proxy.noProxy` {#opt-networking.proxy.noProxy}

This option specifies the no\_proxy environment variable.
If a default proxy is used and noProxy is null,
then noProxy will be set to 127.0.0.1,localhost.

*Type:* null or string

*Default:* `null`

*Example:* `"127.0.0.1,localhost,.localdomain"`

*Declared by:* [`nixos/modules/config/networking.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/networking.nix)

## `networking.proxy.rsyncProxy` {#opt-networking.proxy.rsyncProxy}

This option specifies the rsync\_proxy environment variable.

*Type:* null or string

*Default:* `config.networking.proxy.default`

*Example:* `"http://127.0.0.1:3128"`

*Declared by:* [`nixos/modules/config/networking.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/networking.nix)

## `networking.resolvconf.dnsExtensionMechanism` {#opt-networking.resolvconf.dnsExtensionMechanism}

Enable the `edns0` option in `resolv.conf`. With
that option set, `glibc` supports use of the extension mechanisms for
DNS (EDNS) specified in RFC 2671. The most popular user of that feature is DNSSEC,
which does not work without it.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/resolvconf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/resolvconf.nix)

## `networking.resolvconf.dnsSingleRequest` {#opt-networking.resolvconf.dnsSingleRequest}

Recent versions of glibc will issue both ipv4 (A) and ipv6 (AAAA)
address queries at the same time, from the same port. Sometimes upstream
routers will systemically drop the ipv4 queries. The symptom of this problem is
that 'getent hosts example.com' only returns ipv6 (or perhaps only ipv4) addresses. The
workaround for this is to specify the option 'single-request' in
/etc/resolv.conf. This option enables that.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/resolvconf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/resolvconf.nix)

## `networking.resolvconf.enable` {#opt-networking.resolvconf.enable}

Whether DNS configuration is managed by resolvconf.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/resolvconf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/resolvconf.nix)

## `networking.resolvconf.extraConfig` {#opt-networking.resolvconf.extraConfig}

Extra configuration to append to `resolvconf.conf`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"libc=NO"`

*Declared by:* [`nixos/modules/config/resolvconf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/resolvconf.nix)

## `networking.resolvconf.extraOptions` {#opt-networking.resolvconf.extraOptions}

Set the options in `/etc/resolv.conf`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "ndots:1"
  "rotate"
]
```

*Declared by:* [`nixos/modules/config/resolvconf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/resolvconf.nix)

## `networking.resolvconf.package` {#opt-networking.resolvconf.package}

The package that provides the system-wide resolvconf command. Defaults to `openresolv`
if this module is enabled. Otherwise, can be used by other modules (for example `services.resolved`) to
provide a compatibility layer.

This option generally shouldn't be set by the user.

*Type:* package

*Default:* `pkgs.openresolv`

*Declared by:* [`nixos/modules/config/resolvconf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/resolvconf.nix)

## `networking.resolvconf.useLocalResolver` {#opt-networking.resolvconf.useLocalResolver}

Use local DNS server for resolving.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/resolvconf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/resolvconf.nix)

## `networking.rxe.enable` {#opt-networking.rxe.enable}

Whether to enable RDMA over converged ethernet.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/rxe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rxe.nix)

## `networking.rxe.interfaces` {#opt-networking.rxe.interfaces}

Enable RDMA on the listed interfaces. The corresponding virtual
RDMA interfaces will be named rxe\_\<interface\>.
UDP port 4791 must be open on the respective ethernet interfaces.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "eth0"
]
```

*Declared by:* [`nixos/modules/services/networking/rxe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/rxe.nix)

## `networking.search` {#opt-networking.search}

The list of domain search paths that are considered for resolving
hostnames with fewer dots than configured in the `ndots` option,
which defaults to 1 if unset.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "example.com"
  "home.arpa"
]
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.sits` {#opt-networking.sits}

This option allows you to define interfaces encapsulating IPv6
packets within IPv4 packets; which should be automatically created.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  hurricane = {
    remote = "10.0.0.1";
    local = "10.0.0.22";
    ttl = 255;
  };
  msipv6 = {
    remote = "192.168.0.1";
    dev = "enp3s0";
    ttl = 127;
  };
}
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.sits.<name>.dev` {#opt-networking.sits._name_.dev}

The underlying network device on which the tunnel resides.

*Type:* null or string

*Default:* `null`

*Example:* `"enp4s0f0"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.sits.<name>.encapsulation` {#opt-networking.sits._name_.encapsulation}

Configures the type of encapsulation.

*Type:* null or (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  port = 9001;
  type = "fou";
}
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.sits.<name>.encapsulation.port` {#opt-networking.sits._name_.encapsulation.port}

Destination port when using UDP encapsulation.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Example:* `9001`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.sits.<name>.encapsulation.sourcePort` {#opt-networking.sits._name_.encapsulation.sourcePort}

Source port when using UDP encapsulation.
Will be chosen automatically by the kernel if unset.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Example:* `9002`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.sits.<name>.encapsulation.type` {#opt-networking.sits._name_.encapsulation.type}

Select the encapsulation type:

- `6in4`: the IPv6 packets are encapsulated using the
  6in4 protocol (formerly known as SIT, RFC 4213);

- `gue`: the IPv6 packets are encapsulated in UDP packets
  using the Generic UDP Encapsulation (GUE) scheme;

- `foo`: the IPv6 packets are encapsulated in UDP packets
  using the Foo over UDP (FOU) scheme.

*Type:* one of "6in4", "fou", "gue"

*Default:* `"6in4"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.sits.<name>.local` {#opt-networking.sits._name_.local}

The address of the local endpoint which the remote
side should send packets to.

*Type:* null or string

*Default:* `null`

*Example:* `"10.0.0.22"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.sits.<name>.remote` {#opt-networking.sits._name_.remote}

The address of the remote endpoint to forward traffic over.

*Type:* null or string

*Default:* `null`

*Example:* `"10.0.0.1"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.sits.<name>.ttl` {#opt-networking.sits._name_.ttl}

The time-to-live of the connection to the remote tunnel endpoint.

*Type:* null or signed integer

*Default:* `null`

*Example:* `255`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.stevenblack.block` {#opt-networking.stevenblack.block}

Additional blocklist extensions.

*Type:* list of (one of "fakenews", "gambling", "porn", "social")

*Default:* `[ ]`

*Declared by:* [`nixos/modules/config/stevenblack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/stevenblack.nix)

## `networking.stevenblack.enable` {#opt-networking.stevenblack.enable}

Whether to enable the stevenblack hosts file blocklist.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/config/stevenblack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/stevenblack.nix)

## `networking.stevenblack.package` {#opt-networking.stevenblack.package}

The stevenblack-blocklist package to use.

*Type:* package

*Default:* `pkgs.stevenblack-blocklist`

*Declared by:* [`nixos/modules/config/stevenblack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/stevenblack.nix)

## `networking.stevenblack.whitelist` {#opt-networking.stevenblack.whitelist}

Domains to exclude from blocking.

*Type:* list of string matching the pattern ^\[a-zA-Z0-9\_-\]+(\[.\]\[a-zA-Z0-9\_-\]+)+$

*Default:* `[ ]`

*Example:*

``` nix
[
  "s.click.aliexpress.com"
]
```

*Declared by:* [`nixos/modules/config/stevenblack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/stevenblack.nix)

## `networking.supplicant` {#opt-networking.supplicant}

Interfaces for which to start `wpa_supplicant`.
The supplicant is used to scan for and associate with wireless networks,
or to authenticate with 802.1x capable network switches.

The value of this option is an attribute set. Each attribute configures a
`wpa_supplicant` service, where the attribute name specifies
the name of the interface that `wpa_supplicant` operates on.
The attribute name can be a space-separated list of interfaces.
The attribute names `WLAN`, `LAN` and `DBUS`
have a special meaning. `WLAN` and `LAN` are
configurations for universal `wpa_supplicant` service that is
started for each WLAN interface or for each LAN interface, respectively.
`DBUS` defines a device-unrelated `wpa_supplicant`
service that can be accessed through `D-Bus`.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{ "wlan0 wlan1" = {
    configFile.path = "/etc/wpa_supplicant.conf";
    userControlled.group = "network";
    extraConf = ''
      ap_scan=1
      p2p_disabled=1
    '';
    extraCmdArgs = "-u -W";
    bridge = "br0";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/supplicant.nix)

## `networking.supplicant.<name>.bridge` {#opt-networking.supplicant._name_.bridge}

Name of the bridge interface that wpa\_supplicant should listen at.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/supplicant.nix)

## `networking.supplicant.<name>.configFile.path` {#opt-networking.supplicant._name_.configFile.path}

External `wpa_supplicant.conf` configuration file.
The configuration options defined declaratively within `networking.supplicant` have
precedence over options defined in `configFile`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `/etc/wpa_supplicant.conf`

*Declared by:* [`nixos/modules/services/networking/supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/supplicant.nix)

## `networking.supplicant.<name>.configFile.writable` {#opt-networking.supplicant._name_.configFile.writable}

Whether the configuration file at `configFile.path` should be written to by
`wpa_supplicant`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/supplicant.nix)

## `networking.supplicant.<name>.driver` {#opt-networking.supplicant._name_.driver}

Force a specific wpa\_supplicant driver.

*Type:* null or string

*Default:* `"nl80211,wext"`

*Declared by:* [`nixos/modules/services/networking/supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/supplicant.nix)

## `networking.supplicant.<name>.extraCmdArgs` {#opt-networking.supplicant._name_.extraCmdArgs}

Command line arguments to add when executing `wpa_supplicant`.

*Type:* string

*Default:* `""`

*Example:* `"-e/run/wpa_supplicant/entropy.bin"`

*Declared by:* [`nixos/modules/services/networking/supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/supplicant.nix)

## `networking.supplicant.<name>.extraConf` {#opt-networking.supplicant._name_.extraConf}

Configuration options for `wpa_supplicant.conf`.
Options defined here have precedence over options in `configFile`.
NOTE: Do not write sensitive data into `extraConf` as it will
be world-readable in the `nix-store`. For sensitive information
use the `configFile` instead.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  ap_scan=1
  device_name=My-NixOS-Device
  device_type=1-0050F204-1
  driver_param=use_p2p_group_interface=1
  disable_scan_offload=1
  p2p_listen_reg_class=81
  p2p_listen_channel=1
  p2p_oper_reg_class=81
  p2p_oper_channel=1
  manufacturer=NixOS
  model_name=NixOS_Unstable
  model_number=2015
''
```

*Declared by:* [`nixos/modules/services/networking/supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/supplicant.nix)

## `networking.supplicant.<name>.userControlled.enable` {#opt-networking.supplicant._name_.userControlled.enable}

Allow normal users to control wpa\_supplicant through wpa\_gui or wpa\_cli.
This is useful for laptop users that switch networks a lot and don't want
to depend on a large package such as NetworkManager just to pick nearby
access points.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/supplicant.nix)

## `networking.supplicant.<name>.userControlled.group` {#opt-networking.supplicant._name_.userControlled.group}

Members of this group can control wpa\_supplicant.

*Type:* string

*Default:* `"wheel"`

*Example:* `"network"`

*Declared by:* [`nixos/modules/services/networking/supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/supplicant.nix)

## `networking.supplicant.<name>.userControlled.socketDir` {#opt-networking.supplicant._name_.userControlled.socketDir}

Directory of sockets for controlling wpa\_supplicant.

*Type:* string

*Default:* `"/run/wpa_supplicant"`

*Declared by:* [`nixos/modules/services/networking/supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/supplicant.nix)

## `networking.tcpcrypt.enable` {#opt-networking.tcpcrypt.enable}

Whether to enable opportunistic TCP encryption. If the other end
speaks Tcpcrypt, then your traffic will be encrypted; otherwise
it will be sent in clear text. Thus, Tcpcrypt alone provides no
guarantees -- it is best effort. If, however, a Tcpcrypt
connection is successful and any attackers that exist are
passive, then Tcpcrypt guarantees privacy.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/tcpcrypt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tcpcrypt.nix)

## `networking.tempAddresses` {#opt-networking.tempAddresses}

Whether to enable IPv6 Privacy Extensions for interfaces not
configured explicitly in
[networking](#opt-networking.interfaces._name_.tempAddress).

This sets the ipv6.conf.\*.use\_tempaddr sysctl for all
interfaces. Possible values are:

- `"default"` to generate IPv6 temporary addresses and use these as source addresses in routing;
- `"disabled"` to completely disable IPv6 temporary addresses;
- `"enabled"` to generate IPv6 temporary addresses but still use EUI-64 addresses as source addresses;

*Type:* one of "default", "disabled", "enabled"

*Default:*

``` nix
if ${config.networking.enableIPv6} then "default" else "disabled"
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.timeServers` {#opt-networking.timeServers}

The set of NTP servers from which to synchronise.

*Type:* list of string

*Default:*

``` nix
[
  "0.nixos.pool.ntp.org"
  "1.nixos.pool.ntp.org"
  "2.nixos.pool.ntp.org"
  "3.nixos.pool.ntp.org"
]
```

*Declared by:* [`nixos/modules/config/networking.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/networking.nix)

## `networking.ucarp.addr` {#opt-networking.ucarp.addr}

Virtual shared IP address.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/ucarp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ucarp.nix)

## `networking.ucarp.advBase` {#opt-networking.ucarp.advBase}

Advertisement frequency in seconds.

*Type:* unsigned integer, meaning \>=0

*Default:* `1`

*Declared by:* [`nixos/modules/services/networking/ucarp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ucarp.nix)

## `networking.ucarp.advSkew` {#opt-networking.ucarp.advSkew}

Advertisement skew in seconds.

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Declared by:* [`nixos/modules/services/networking/ucarp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ucarp.nix)

## `networking.ucarp.deadratio` {#opt-networking.ucarp.deadratio}

Ratio to consider a host as dead.

*Type:* unsigned integer, meaning \>=0

*Default:* `3`

*Declared by:* [`nixos/modules/services/networking/ucarp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ucarp.nix)

## `networking.ucarp.downscript` {#opt-networking.ucarp.downscript}

Command to run after become backup, the interface name, virtual address
and optional extra parameters are passed as arguments.

*Type:* absolute path

*Example:*

``` nix
pkgs.writeScript "downscript" ''
  #!/bin/sh
  ${pkgs.iproute2}/bin/ip addr del "$2"/24 dev "$1"
'';
```

*Declared by:* [`nixos/modules/services/networking/ucarp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ucarp.nix)

## `networking.ucarp.enable` {#opt-networking.ucarp.enable}

Whether to enable ucarp, userspace implementation of CARP.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ucarp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ucarp.nix)

## `networking.ucarp.extraParam` {#opt-networking.ucarp.extraParam}

Extra parameter to pass to the up/down scripts.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ucarp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ucarp.nix)

## `networking.ucarp.ignoreIfState` {#opt-networking.ucarp.ignoreIfState}

Ignore interface state, e.g., down or no carrier.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ucarp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ucarp.nix)

## `networking.ucarp.interface` {#opt-networking.ucarp.interface}

Network interface to bind to.

*Type:* string

*Example:* `"eth0"`

*Declared by:* [`nixos/modules/services/networking/ucarp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ucarp.nix)

## `networking.ucarp.neutral` {#opt-networking.ucarp.neutral}

Do not run downscript at start if the host is the backup.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ucarp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ucarp.nix)

## `networking.ucarp.noMcast` {#opt-networking.ucarp.noMcast}

Use broadcast instead of multicast advertisements.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ucarp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ucarp.nix)

## `networking.ucarp.package` {#opt-networking.ucarp.package}

The ucarp package to use. Please note that the default package, pkgs.ucarp, has not received any
upstream updates for a long time and can be considered as unmaintained.

*Type:* package

*Default:* `pkgs.ucarp`

*Declared by:* [`nixos/modules/services/networking/ucarp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ucarp.nix)

## `networking.ucarp.passwordFile` {#opt-networking.ucarp.passwordFile}

File containing shared password between CARP hosts.

*Type:* string

*Example:* `"/run/keys/ucarp-password"`

*Declared by:* [`nixos/modules/services/networking/ucarp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ucarp.nix)

## `networking.ucarp.preempt` {#opt-networking.ucarp.preempt}

Enable preemptive failover.
Thus, this host becomes the CARP master as soon as possible.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ucarp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ucarp.nix)

## `networking.ucarp.shutdown` {#opt-networking.ucarp.shutdown}

Call downscript at exit.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ucarp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ucarp.nix)

## `networking.ucarp.srcIp` {#opt-networking.ucarp.srcIp}

Source (real) IP address of this host.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/ucarp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ucarp.nix)

## `networking.ucarp.upscript` {#opt-networking.ucarp.upscript}

Command to run after become master, the interface name, virtual address
and optional extra parameters are passed as arguments.

*Type:* absolute path

*Example:*

``` nix
pkgs.writeScript "upscript" ''
  #!/bin/sh
  ${pkgs.iproute2}/bin/ip addr add "$2"/24 dev "$1"
'';
```

*Declared by:* [`nixos/modules/services/networking/ucarp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ucarp.nix)

## `networking.ucarp.vhId` {#opt-networking.ucarp.vhId}

Virtual IP identifier shared between CARP hosts.

*Type:* integer between 1 and 255 (both inclusive)

*Example:* `1`

*Declared by:* [`nixos/modules/services/networking/ucarp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ucarp.nix)

## `networking.useDHCP` {#opt-networking.useDHCP}

Whether to use DHCP to obtain an IP address and other
configuration for all network interfaces that do not have any manually
configured IPv4 addresses.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.useHostResolvConf` {#opt-networking.useHostResolvConf}

In containers, whether to use the
`resolv.conf` supplied by the host.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.useNetworkd` {#opt-networking.useNetworkd}

Whether we should use networkd as the network configuration backend or
the legacy script based system.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.usePredictableInterfaceNames` {#opt-networking.usePredictableInterfaceNames}

Whether to assign [predictable names to network interfaces](https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/).
If enabled, interfaces
are assigned names that contain topology information
(e.g. `wlp3s0`) and thus should be stable
across reboots.  If disabled, names depend on the order in
which interfaces are discovered by the kernel, which may
change randomly across reboots; for instance, you may find
`eth0` and `eth1` flipping
unpredictably.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/hardware/udev.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/udev.nix)

## `networking.vlans` {#opt-networking.vlans}

This option allows you to define vlan devices that tag packets
on top of a physical interface. The value of this option is an
attribute set. Each attribute specifies a vlan, with the name
specifying the name of the vlan interface.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  vlan0 = {
    id = 3;
    interface = "enp3s0";
  };
  vlan1 = {
    id = 1;
    interface = "wlan0";
  };
}
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.vlans.<name>.id` {#opt-networking.vlans._name_.id}

The vlan identifier

*Type:* signed integer

*Example:* `1`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.vlans.<name>.interface` {#opt-networking.vlans._name_.interface}

The interface the vlan will transmit packets through.

*Type:* string

*Example:* `"enp4s0"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.vswitches` {#opt-networking.vswitches}

This option allows you to define Open vSwitches that connect
physical networks together. The value of this option is an
attribute set. Each attribute specifies a vswitch, with the
attribute name specifying the name of the vswitch's network
interface.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  vs0 = {
    interfaces = {
      eth0 = { };
      lo1 = {
        type = "internal";
      };
    };
  };
  vs1 = {
    interfaces = [
      {
        name = "eth2";
      }
      {
        name = "lo2";
        type = "internal";
      }
    ];
  };
}
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.vswitches.<name>.controllers` {#opt-networking.vswitches._name_.controllers}

Specify the controller targets. For the allowed options see `man 8 ovs-vsctl`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "ptcp:6653:[::1]"
]
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.vswitches.<name>.extraOvsctlCmds` {#opt-networking.vswitches._name_.extraOvsctlCmds}

Commands to manipulate the Open vSwitch database. Every line executed with `ovs-vsctl`.
All commands are bundled together with the operations for adding the interfaces
into one atomic operation.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  set-fail-mode <switch_name> secure
  set Bridge <switch_name> stp_enable=true
''
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.vswitches.<name>.interfaces` {#opt-networking.vswitches._name_.interfaces}

The physical network interfaces connected by the vSwitch.

*Type:* attribute set of (submodule)

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.vswitches.<name>.interfaces.<name>.name` {#opt-networking.vswitches._name_.interfaces._name_.name}

Name of the interface

*Type:* string

*Example:* `"eth0"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.vswitches.<name>.interfaces.<name>.type` {#opt-networking.vswitches._name_.interfaces._name_.type}

Openvswitch type to assign to interface

*Type:* null or string

*Default:* `null`

*Example:* `"internal"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.vswitches.<name>.interfaces.<name>.vlan` {#opt-networking.vswitches._name_.interfaces._name_.vlan}

Vlan tag to apply to interface

*Type:* null or signed integer

*Default:* `null`

*Example:* `10`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.vswitches.<name>.openFlowRules` {#opt-networking.vswitches._name_.openFlowRules}

OpenFlow rules to insert into the Open vSwitch. All `openFlowRules` are
loaded with `ovs-ofctl` within one atomic operation.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  actions=normal
''
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.vswitches.<name>.openFlowVersion` {#opt-networking.vswitches._name_.openFlowVersion}

Version of OpenFlow protocol to use when communicating with the switch internally (e.g. with `openFlowRules`).

*Type:* string

*Default:* `"OpenFlow13"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.vswitches.<name>.supportedOpenFlowVersions` {#opt-networking.vswitches._name_.supportedOpenFlowVersions}

Supported versions to enable on this switch.

*Type:* list of string

*Default:*

``` nix
[
  "OpenFlow13"
]
```

*Example:*

``` nix
[
  "OpenFlow10"
  "OpenFlow13"
  "OpenFlow14"
]
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.wg-quick.interfaces` {#opt-networking.wg-quick.interfaces}

Wireguard interfaces.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  wg0 = {
    address = [
      "192.168.20.4/24"
    ];
    peers = [
      {
        allowedIPs = [
          "192.168.20.1/32"
        ];
        endpoint = "demo.wireguard.io:12913";
        publicKey = "xTIBA5rboUvnH4htodjb6e697QjLERt1NAB4mZqp8Dg=";
      }
    ];
    privateKey = "yAnz5TF+lXXJte14tji3zlMNq+hd2rYUIgJBgB3fBmk=";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wg-quick.interfaces.<name>.address` {#opt-networking.wg-quick.interfaces._name_.address}

The IP addresses of the interface.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "192.168.2.1/24"
]
```

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wg-quick.interfaces.<name>.autostart` {#opt-networking.wg-quick.interfaces._name_.autostart}

Whether to bring up this interface automatically during boot.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wg-quick.interfaces.<name>.configFile` {#opt-networking.wg-quick.interfaces._name_.configFile}

wg-quick .conf file, describing the interface.
Using this option can be a useful means of configuring WireGuard if
one has an existing .conf file.
This overrides any other configuration interface configuration options.
See wg-quick manpage for more details.

*Type:* null or string

*Default:* `null`

*Example:* `"/secret/wg0.conf"`

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wg-quick.interfaces.<name>.dns` {#opt-networking.wg-quick.interfaces._name_.dns}

The IP addresses of DNS servers to configure.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "192.168.2.2"
]
```

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wg-quick.interfaces.<name>.extraOptions` {#opt-networking.wg-quick.interfaces._name_.extraOptions}

Extra options to append to the interface section. Can be used to define AmneziaWG-specific options.

*Type:* attribute set of (string or signed integer)

*Default:* `{ }`

*Example:*

``` nix
{
  H4 = 12345;
  Jc = 5;
  Jmax = 42;
  Jmin = 10;
  S1 = 60;
  S2 = 90;
}
```

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wg-quick.interfaces.<name>.generatePrivateKeyFile` {#opt-networking.wg-quick.interfaces._name_.generatePrivateKeyFile}

Automatically generate a private key with
`wg genkey`, at the privateKeyFile location.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wg-quick.interfaces.<name>.listenPort` {#opt-networking.wg-quick.interfaces._name_.listenPort}

16-bit port for listening. Optional; if not specified,
automatically generated based on interface name.

*Type:* null or signed integer

*Default:* `null`

*Example:* `51820`

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wg-quick.interfaces.<name>.mtu` {#opt-networking.wg-quick.interfaces._name_.mtu}

If not specified, the MTU is automatically determined
from the endpoint addresses or the system default route, which is usually
a sane choice. However, to manually specify an MTU to override this
automatic discovery, this value may be specified explicitly.

*Type:* null or signed integer

*Default:* `null`

*Example:* `1248`

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wg-quick.interfaces.<name>.peers` {#opt-networking.wg-quick.interfaces._name_.peers}

Peers linked to the interface.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wg-quick.interfaces.<name>.peers.*.allowedIPs` {#opt-networking.wg-quick.interfaces._name_.peers._.allowedIPs}

List of IP (v4 or v6) addresses with CIDR masks from
which this peer is allowed to send incoming traffic and to which
outgoing traffic for this peer is directed. The catch-all 0.0.0.0/0 may
be specified for matching all IPv4 addresses, and ::/0 may be specified
for matching all IPv6 addresses.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "10.192.122.3/32"
  "10.192.124.1/24"
]
```

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wg-quick.interfaces.<name>.peers.*.endpoint` {#opt-networking.wg-quick.interfaces._name_.peers._.endpoint}

Endpoint IP or hostname of the peer, followed by a colon,
and then a port number of the peer.

*Type:* null or string

*Default:* `null`

*Example:* `"demo.wireguard.io:12913"`

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wg-quick.interfaces.<name>.peers.*.persistentKeepalive` {#opt-networking.wg-quick.interfaces._name_.peers._.persistentKeepalive}

This is optional and is by default off, because most
users will not need it. It represents, in seconds, between 1 and 65535
inclusive, how often to send an authenticated empty packet to the peer,
for the purpose of keeping a stateful firewall or NAT mapping valid
persistently. For example, if the interface very rarely sends traffic,
but it might at anytime receive traffic from a peer, and it is behind
NAT, the interface might benefit from having a persistent keepalive
interval of 25 seconds; however, most users will not need this.

*Type:* null or signed integer

*Default:* `null`

*Example:* `25`

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wg-quick.interfaces.<name>.peers.*.presharedKey` {#opt-networking.wg-quick.interfaces._name_.peers._.presharedKey}

Base64 preshared key generated by `wg genpsk`.
Optional, and may be omitted. This option adds an additional layer of
symmetric-key cryptography to be mixed into the already existing
public-key cryptography, for post-quantum resistance.

Warning: Consider using presharedKeyFile instead if you do not
want to store the key in the world-readable Nix store.

*Type:* null or string

*Default:* `null`

*Example:* `"rVXs/Ni9tu3oDBLS4hOyAUAa1qTWVA3loR8eL20os3I="`

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wg-quick.interfaces.<name>.peers.*.presharedKeyFile` {#opt-networking.wg-quick.interfaces._name_.peers._.presharedKeyFile}

File pointing to preshared key as generated by `wg genpsk`.
Optional, and may be omitted. This option adds an additional layer of
symmetric-key cryptography to be mixed into the already existing
public-key cryptography, for post-quantum resistance.

*Type:* null or string

*Default:* `null`

*Example:* `"/private/wireguard_psk"`

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wg-quick.interfaces.<name>.peers.*.publicKey` {#opt-networking.wg-quick.interfaces._name_.peers._.publicKey}

The base64 public key to the peer.

*Type:* string

*Example:* `"xTIBA5rboUvnH4htodjb6e697QjLERt1NAB4mZqp8Dg="`

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wg-quick.interfaces.<name>.postDown` {#opt-networking.wg-quick.interfaces._name_.postDown}

Command called after the interface is taken down.

*Type:* strings concatenated with "\\n" or (list of string) convertible to it

*Default:* `""`

*Example:* `"${pkgs.iproute2}/bin/ip netns del foo"`

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wg-quick.interfaces.<name>.postUp` {#opt-networking.wg-quick.interfaces._name_.postUp}

Commands called after the interface setup.

*Type:* strings concatenated with "\\n" or (list of string) convertible to it

*Default:* `""`

*Example:* `"${pkgs.iproute2}/bin/ip netns add foo"`

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wg-quick.interfaces.<name>.preDown` {#opt-networking.wg-quick.interfaces._name_.preDown}

Command called before the interface is taken down.

*Type:* strings concatenated with "\\n" or (list of string) convertible to it

*Default:* `""`

*Example:* `"${pkgs.iproute2}/bin/ip netns del foo"`

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wg-quick.interfaces.<name>.preUp` {#opt-networking.wg-quick.interfaces._name_.preUp}

Commands called at the start of the interface setup.

*Type:* strings concatenated with "\\n" or (list of string) convertible to it

*Default:* `""`

*Example:* `"${pkgs.iproute2}/bin/ip netns add foo"`

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wg-quick.interfaces.<name>.privateKey` {#opt-networking.wg-quick.interfaces._name_.privateKey}

Base64 private key generated by `wg genkey`.

Warning: Consider using privateKeyFile instead if you do not
want to store the key in the world-readable Nix store.

*Type:* null or string

*Default:* `null`

*Example:* `"yAnz5TF+lXXJte14tji3zlMNq+hd2rYUIgJBgB3fBmk="`

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wg-quick.interfaces.<name>.privateKeyFile` {#opt-networking.wg-quick.interfaces._name_.privateKeyFile}

Private key file as generated by `wg genkey`.

*Type:* null or string

*Default:* `null`

*Example:* `"/private/wireguard_key"`

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wg-quick.interfaces.<name>.table` {#opt-networking.wg-quick.interfaces._name_.table}

The kernel routing table to add this interface's
associated routes to. Setting this is useful for e.g. policy routing
("ip rule") or virtual routing and forwarding ("ip vrf"). Both
numeric table IDs and table names (/etc/rt\_tables) can be used.
Defaults to "main".

*Type:* null or string

*Default:* `null`

*Example:* `"main"`

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wg-quick.interfaces.<name>.type` {#opt-networking.wg-quick.interfaces._name_.type}

The type of the interface. Currently only "wireguard" and "amneziawg" are supported.

*Type:* one of "wireguard", "amneziawg"

*Default:* `"wireguard"`

*Example:* `"amneziawg"`

*Declared by:* [`nixos/modules/services/networking/wg-quick.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wg-quick.nix)

## `networking.wireguard.enable` {#opt-networking.wireguard.enable}

Whether to enable WireGuard.

::: note
By default, this module is powered by a script-based backend. You can
enable the networkd backend with [`networking.wireguard.useNetworkd`](#opt-networking.wireguard.useNetworkd).
:::

*Type:* boolean

*Default:* `config.networking.wireguard.interfaces != { }`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces` {#opt-networking.wireguard.interfaces}

WireGuard interfaces.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  wg0 = {
    ips = [
      "192.168.20.4/24"
    ];
    peers = [
      {
        allowedIPs = [
          "192.168.20.1/32"
        ];
        endpoint = "demo.wireguard.io:12913";
        publicKey = "xTIBA5rboUvnH4htodjb6e697QjLERt1NAB4mZqp8Dg=";
      }
    ];
    privateKey = "yAnz5TF+lXXJte14tji3zlMNq+hd2rYUIgJBgB3fBmk=";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.allowedIPsAsRoutes` {#opt-networking.wireguard.interfaces._name_.allowedIPsAsRoutes}

Determines whether to add allowed IPs as routes or not.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.dynamicEndpointRefreshSeconds` {#opt-networking.wireguard.interfaces._name_.dynamicEndpointRefreshSeconds}

Periodically refresh the endpoint hostname or address for all peers.
Allows WireGuard to notice DNS and IPv4/IPv6 connectivity changes.
This option can be set or overridden for individual peers.

Setting this to `0` disables periodic refresh.

*Type:* signed integer

*Default:* `0`

*Example:* `300`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.extraOptions` {#opt-networking.wireguard.interfaces._name_.extraOptions}

Extra options to append to the interface section. Can be used to define AmneziaWG-specific options.

*Type:* attribute set of (string or signed integer)

*Default:* `{ }`

*Example:*

``` nix
{
  H4 = 12345;
  Jc = 5;
  Jmax = 42;
  Jmin = 10;
  S1 = 60;
  S2 = 90;
}
```

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.fwMark` {#opt-networking.wireguard.interfaces._name_.fwMark}

Mark all wireguard packets originating from
this interface with the given firewall mark. The firewall mark can be
used in firewalls or policy routing to filter the wireguard packets.
This can be useful for setup where all traffic goes through the
wireguard tunnel, because the wireguard packets need to be routed
differently.

*Type:* null or string

*Default:* `null`

*Example:* `"0x6e6978"`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.generatePrivateKeyFile` {#opt-networking.wireguard.interfaces._name_.generatePrivateKeyFile}

Automatically generate a private key with
`wg genkey`, at the privateKeyFile location.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.interfaceNamespace` {#opt-networking.wireguard.interfaces._name_.interfaceNamespace}

The pre-existing network namespace the WireGuard
interface is moved to. The special value `init` means
the init namespace. When `null`, the interface is not
moved.
See [documentation](https://www.wireguard.com/netns/).

*Type:* null or string

*Default:* `null`

*Example:* `"init"`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.ips` {#opt-networking.wireguard.interfaces._name_.ips}

The IP addresses of the interface.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "192.168.2.1/24"
]
```

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.listenPort` {#opt-networking.wireguard.interfaces._name_.listenPort}

16-bit port for listening. Optional; if not specified,
automatically generated based on interface name.

*Type:* null or signed integer

*Default:* `null`

*Example:* `51820`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.metric` {#opt-networking.wireguard.interfaces._name_.metric}

Set the metric of routes related to this Wireguard interface.

*Type:* null or signed integer

*Default:* `null`

*Example:* `700`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.mtu` {#opt-networking.wireguard.interfaces._name_.mtu}

Set the maximum transmission unit in bytes for the wireguard
interface. Beware that the wireguard packets have a header that may
add up to 80 bytes to the mtu. By default, the MTU is (1500 - 80) =
1420. However, if the MTU of the upstream network is lower, the MTU
of the wireguard network has to be adjusted as well.

*Type:* null or signed integer

*Default:* `null`

*Example:* `1280`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.peers` {#opt-networking.wireguard.interfaces._name_.peers}

Peers linked to the interface.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.peers.*.allowedIPs` {#opt-networking.wireguard.interfaces._name_.peers._.allowedIPs}

List of IP (v4 or v6) addresses with CIDR masks from
which this peer is allowed to send incoming traffic and to which
outgoing traffic for this peer is directed. The catch-all 0.0.0.0/0 may
be specified for matching all IPv4 addresses, and ::/0 may be specified
for matching all IPv6 addresses.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "10.192.122.3/32"
  "10.192.124.1/24"
]
```

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.peers.*.dynamicEndpointRefreshRestartSeconds` {#opt-networking.wireguard.interfaces._name_.peers._.dynamicEndpointRefreshRestartSeconds}

When the dynamic endpoint refresh that is configured via
dynamicEndpointRefreshSeconds exits (likely due to a failure),
restart that service after this many seconds.

If set to `null` the value of
`networking.wireguard.dynamicEndpointRefreshSeconds`
will be used as the default.

*Type:* null or (unsigned integer, meaning \>=0)

*Default:* `null`

*Example:* `5`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.peers.*.dynamicEndpointRefreshSeconds` {#opt-networking.wireguard.interfaces._name_.peers._.dynamicEndpointRefreshSeconds}

Periodically re-execute the `wg` utility every
this many seconds in order to let WireGuard notice DNS / hostname
changes.

Setting this to `0` disables periodic reexecution.

::: note
This peer-level setting is not available when [`networking.wireguard.useNetworkd`](#opt-networking.wireguard.useNetworkd)
is enabled. The interface-level setting may be used instead.
:::

*Type:* null or signed integer

*Default:* `config.networking.wireguard.interfaces.<name>.dynamicEndpointRefreshSeconds`

*Example:* `5`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.peers.*.endpoint` {#opt-networking.wireguard.interfaces._name_.peers._.endpoint}

Endpoint IP or hostname of the peer, followed by a colon,
and then a port number of the peer.

Warning for endpoints with changing IPs:
The WireGuard kernel side cannot perform DNS resolution.
Thus DNS resolution is done once by the `wg` userspace
utility, when setting up WireGuard. Consequently, if the IP address
behind the name changes, WireGuard will not notice.
This is especially common for dynamic-DNS setups, but also applies to
any other DNS-based setup.
If you do not use IP endpoints, you likely want to set
`networking.wireguard.dynamicEndpointRefreshSeconds`
to refresh the IPs periodically.

*Type:* null or string

*Default:* `null`

*Example:* `"demo.wireguard.io:12913"`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.peers.*.name` {#opt-networking.wireguard.interfaces._name_.peers._.name}

Name used to derive peer unit name.

*Type:* string

*Default:* `publicKey`

*Example:* `"bernd"`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.peers.*.persistentKeepalive` {#opt-networking.wireguard.interfaces._name_.peers._.persistentKeepalive}

This is optional and is by default off, because most
users will not need it. It represents, in seconds, between 1 and 65535
inclusive, how often to send an authenticated empty packet to the peer,
for the purpose of keeping a stateful firewall or NAT mapping valid
persistently. For example, if the interface very rarely sends traffic,
but it might at anytime receive traffic from a peer, and it is behind
NAT, the interface might benefit from having a persistent keepalive
interval of 25 seconds; however, most users will not need this.

*Type:* null or signed integer

*Default:* `null`

*Example:* `25`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.peers.*.presharedKey` {#opt-networking.wireguard.interfaces._name_.peers._.presharedKey}

Base64 preshared key generated by `wg genpsk`.
Optional, and may be omitted. This option adds an additional layer of
symmetric-key cryptography to be mixed into the already existing
public-key cryptography, for post-quantum resistance.

Warning: Consider using presharedKeyFile instead if you do not
want to store the key in the world-readable Nix store.

*Type:* null or string

*Default:* `null`

*Example:* `"rVXs/Ni9tu3oDBLS4hOyAUAa1qTWVA3loR8eL20os3I="`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.peers.*.presharedKeyFile` {#opt-networking.wireguard.interfaces._name_.peers._.presharedKeyFile}

File pointing to preshared key as generated by `wg genpsk`.
Optional, and may be omitted. This option adds an additional layer of
symmetric-key cryptography to be mixed into the already existing
public-key cryptography, for post-quantum resistance.

*Type:* null or string

*Default:* `null`

*Example:* `"/private/wireguard_psk"`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.peers.*.publicKey` {#opt-networking.wireguard.interfaces._name_.peers._.publicKey}

The base64 public key of the peer.

*Type:* (optionally newline-terminated) single-line string

*Example:* `"xTIBA5rboUvnH4htodjb6e697QjLERt1NAB4mZqp8Dg="`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.postSetup` {#opt-networking.wireguard.interfaces._name_.postSetup}

Commands called at the end of the interface setup.

*Type:* strings concatenated with "\\n" or (list of string) convertible to it

*Default:* `""`

*Example:*

``` nix
''printf "nameserver 10.200.100.1" | ${pkgs.openresolv}/bin/resolvconf -a wg0 -m 0''
```

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.postShutdown` {#opt-networking.wireguard.interfaces._name_.postShutdown}

Commands called after shutting down the interface.

*Type:* strings concatenated with "\\n" or (list of string) convertible to it

*Default:* `""`

*Example:* `"${pkgs.openresolv}/bin/resolvconf -d wg0"`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.preSetup` {#opt-networking.wireguard.interfaces._name_.preSetup}

Commands called at the start of the interface setup.

*Type:* strings concatenated with "\\n" or (list of string) convertible to it

*Default:* `""`

*Example:* `"${pkgs.iproute2}/bin/ip netns add foo"`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.preShutdown` {#opt-networking.wireguard.interfaces._name_.preShutdown}

Commands called before shutting down the interface.

*Type:* strings concatenated with "\\n" or (list of string) convertible to it

*Default:* `""`

*Example:* `"${pkgs.iproute2}/bin/ip netns del foo"`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.privateKey` {#opt-networking.wireguard.interfaces._name_.privateKey}

Base64 private key generated by `wg genkey`.

Warning: Consider using privateKeyFile instead if you do not
want to store the key in the world-readable Nix store.

*Type:* null or string

*Default:* `null`

*Example:* `"yAnz5TF+lXXJte14tji3zlMNq+hd2rYUIgJBgB3fBmk="`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.privateKeyFile` {#opt-networking.wireguard.interfaces._name_.privateKeyFile}

Private key file as generated by `wg genkey`.

*Type:* null or string

*Default:* `null`

*Example:* `"/private/wireguard_key"`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.socketNamespace` {#opt-networking.wireguard.interfaces._name_.socketNamespace}

The pre-existing network namespace in which the
WireGuard interface is created, and which retains the socket even if the
interface is moved via `interfaceNamespace`. When
`null`, the interface is created in the init namespace.
See [documentation](https://www.wireguard.com/netns/).

*Type:* null or string

*Default:* `null`

*Example:* `"container"`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.table` {#opt-networking.wireguard.interfaces._name_.table}

The kernel routing table to add this interface's
associated routes to. Setting this is useful for e.g. policy routing
("ip rule") or virtual routing and forwarding ("ip vrf"). Both
numeric table IDs and table names (/etc/rt\_tables) can be used.
Defaults to "main".

*Type:* string

*Default:* `"main"`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.interfaces.<name>.type` {#opt-networking.wireguard.interfaces._name_.type}

The type of the interface. Currently only "wireguard" and "amneziawg" are supported.

*Type:* one of "wireguard", "amneziawg"

*Default:* `"wireguard"`

*Example:* `"amneziawg"`

*Declared by:* [`nixos/modules/services/networking/wireguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard.nix)

## `networking.wireguard.useNetworkd` {#opt-networking.wireguard.useNetworkd}

Whether to use networkd as the network configuration backend for
Wireguard instead of the legacy script-based system.

::: warning
Some options have slightly different behavior with the networkd and
script-based backends. Check the documentation for each Wireguard
option you use before enabling this option.
:::

*Type:* boolean

*Default:* `config.networking.useNetworkd`

*Declared by:* [`nixos/modules/services/networking/wireguard-networkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wireguard-networkd.nix)

## `networking.wireless.allowAuxiliaryImperativeNetworks` {#opt-networking.wireless.allowAuxiliaryImperativeNetworks}

Whether to allow configuring networks "imperatively" (e.g. via
`wpa_supplicant_gui`) and declaratively via
[networking](#opt-networking.wireless.networks).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.athUserRegulatoryDomain` {#opt-networking.wireless.athUserRegulatoryDomain}

If enabled, sets the ATH\_USER\_REGD kernel config switch to true to
disable the enforcement of EEPROM regulatory restrictions for ath
drivers. Requires at least Linux 5.8.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/network/ath-user-regd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/network/ath-user-regd.nix)

## `networking.wireless.autoDetectInterfaces` {#opt-networking.wireless.autoDetectInterfaces}

Whether to enable automatic detection of wireless interfaces.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.dbusControlled` {#opt-networking.wireless.dbusControlled}

Whether to enable the DBus control interface.
This is only needed when using NetworkManager or connman.

*Type:* boolean

*Default:* `length config.networking.wireless.interfaces < 2`

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.driver` {#opt-networking.wireless.driver}

Force a specific wpa\_supplicant driver.

*Type:* string

*Default:* `"nl80211,wext"`

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.enable` {#opt-networking.wireless.enable}

Whether to enable wpa\_supplicant.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.enableHardening` {#opt-networking.wireless.enableHardening}

Whether to apply security hardening measures to wpa\_supplicant.
These include limiting access to the filesystem, devices and network
capabilities.

::: note
Disabling this will increase the potential attack surface if the
wpa\_supplicant daemon becomes compromised, but it may be necessary
for more complex enterprise networks (for example requiring
access to mutable files, smart cards or TPM devices).
:::

*Type:* unspecified value

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.extraConfig` {#opt-networking.wireless.extraConfig}

Extra lines appended to the configuration file.
See
`wpa_supplicant.conf(5)`
for available options.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  p2p_disabled=1
''
```

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.extraConfigFiles` {#opt-networking.wireless.extraConfigFiles}

Extra wpa\_supplicant configuration files to load.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.fallbackToWPA2` {#opt-networking.wireless.fallbackToWPA2}

Whether to fall back to WPA2 authentication protocols if WPA3 failed.
This allows old wireless cards (that lack recent features required by
WPA3) to connect to mixed WPA2/WPA3 access points.

To avoid possible downgrade attacks, disable this options.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.interfaces` {#opt-networking.wireless.interfaces}

The interfaces `wpa_supplicant` will use. If empty and
[networking](#opt-networking.wireless.autoDetectInterfaces) is true it will
automatically use all wireless interfaces.

::: note
A separate wpa\_supplicant instance will be started for each interface.
:::

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "wlan0"
  "wlan1"
]
```

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.iwd.enable` {#opt-networking.wireless.iwd.enable}

Whether to enable iwd.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/iwd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iwd.nix)

## `networking.wireless.iwd.package` {#opt-networking.wireless.iwd.package}

The iwd package to use.

*Type:* package

*Default:* `pkgs.iwd`

*Declared by:* [`nixos/modules/services/networking/iwd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iwd.nix)

## `networking.wireless.iwd.settings` {#opt-networking.wireless.iwd.settings}

Options passed to iwd.
See `iwd.config(5)` for supported options.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  Network = {
    EnableIPv6 = true;
    RoutePriorityOffset = 300;
  };
  Settings = {
    AutoConnect = true;
  };
}
```

*Declared by:* [`nixos/modules/services/networking/iwd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iwd.nix)

## `networking.wireless.networks` {#opt-networking.wireless.networks}

The network definitions to automatically connect to when
`wpa_supplicant` is running. If this
parameter is left empty wpa\_supplicant will use
/etc/wpa\_supplicant.conf as the configuration file.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{ echelon = {                   # SSID with no spaces or special characters
    psk = "abcdefgh";           # (password will be written to /nix/store!)
  };

  echelon = {                   # safe version of the above: read PSK from the
    pskRaw = "ext:psk_echelon"; # variable psk_echelon, defined in secretsFile,
  };                            # this won't leak into /nix/store

  "echelon's AP" = {            # SSID with spaces and/or special characters
     psk = "ijklmnop";          # (password will be written to /nix/store!)
  };

  "free.wifi" = {};             # Public wireless network
}
```

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.networks.<name>.auth` {#opt-networking.wireless.networks._name_.auth}

Use this option to configure advanced authentication methods
like EAP. See `wpa_supplicant.conf(5)` for example
configurations.

::: warning
Be aware that this will be written to the Nix store
in plaintext! Use an external reference like
`ext:secretname` for secrets.
:::

::: note
Mutually exclusive with `psk` and `pskRaw`.
:::

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
''
  eap=PEAP
  identity="user@example.com"
  password=ext:example_password
''
```

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.networks.<name>.authProtocols` {#opt-networking.wireless.networks._name_.authProtocols}

The list of authentication protocols accepted by this network.
This corresponds to the `key_mgmt` option in wpa\_supplicant.

*Type:* list of (one of "WPA-PSK", "WPA-EAP", "IEEE8021X", "NONE", "WPA-NONE", "FT-PSK", "FT-EAP", "FT-EAP-SHA384", "WPA-PSK-SHA256", "WPA-EAP-SHA256", "SAE", "FT-SAE", "WPA-EAP-SUITE-B", "WPA-EAP-SUITE-B-192", "OSEN", "FILS-SHA256", "FILS-SHA384", "FT-FILS-SHA256", "FT-FILS-SHA384", "OWE", "DPP")

*Default:*

``` nix
[
  "WPA-PSK"
  "WPA-EAP"
  "SAE"
  "FT-PSK"
  "FT-EAP"
  "FT-SAE"
]
```

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.networks.<name>.bssid` {#opt-networking.wireless.networks._name_.bssid}

If set, this network block is used only when associating with
the AP using the configured BSSID.

*Type:* null or string

*Default:* `null`

*Example:* `"02:00:00:00:00:01"`

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.networks.<name>.extraConfig` {#opt-networking.wireless.networks._name_.extraConfig}

Extra configuration lines appended to the network block.
See `wpa_supplicant.conf(5)` for available options.

*Type:* string

*Default:* `""`

*Example:*

``` nix
''
  bssid_blacklist=02:11:22:33:44:55 02:22:aa:44:55:66
''
```

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.networks.<name>.hidden` {#opt-networking.wireless.networks._name_.hidden}

Set this to `true` if the SSID of the network is hidden.

*Type:* boolean

*Default:* `false`

*Example:*

``` nix
{ echelon = {
    hidden = true;
    psk = "abcdefgh";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.networks.<name>.priority` {#opt-networking.wireless.networks._name_.priority}

By default, all networks will get same priority group (0). If
some of the networks are more desirable, this field can be used
to change the order in which wpa\_supplicant goes through the
networks when selecting a BSS. The priority groups will be
iterated in decreasing priority (i.e., the larger the priority
value, the sooner the network is matched against the scan
results). Within each priority group, networks will be selected
based on security policy, signal strength, etc.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.networks.<name>.psk` {#opt-networking.wireless.networks._name_.psk}

The network's pre-shared key in plaintext defaulting
to being a network without any authentication.

::: warning
Be aware that this will be written to the Nix store
in plaintext! Use `pskRaw` with an external
reference to keep it safe.
:::

::: note
Mutually exclusive with `pskRaw`.
:::

*Type:* null or string matching the pattern \[\[:print:\]\]{8,63}

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.networks.<name>.pskRaw` {#opt-networking.wireless.networks._name_.pskRaw}

Either the raw pre-shared key in hexadecimal format
or the name of the secret (as defined inside
[networking](#opt-networking.wireless.secretsFile) and prefixed
with `ext:`) containing the network pre-shared key.

::: warning
Be aware that this will be written to the Nix store
in plaintext! Always use an external reference.
:::

::: note
The external secret can be either the plaintext
passphrase or the raw pre-shared key.
:::

::: note
Mutually exclusive with `psk` and `auth`.
:::

*Type:* null or string matching the pattern (\[\[:xdigit:\]\]{64})|(ext:\[^=\]+)

*Default:* `null`

*Example:* `"ext:name_of_the_secret_here"`

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.networks.<name>.ssid` {#opt-networking.wireless.networks._name_.ssid}

You could use this field to override the network's ssid.
This can be useful to, for example, specify two networks
that share the same SSID but not the same password.
Specifying the BSSID of the network can make two entries of
the same SSID show up as different ones in wpa\_cli.

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.pkcs11.enable` {#opt-networking.wireless.pkcs11.enable}

Whether to make the OpenSSL pkcs11 engine available to
wpa\_supplicant, for EAP-TLS authentication with client keys on
PKCS#11 tokens such as smartcards or a TPM.

::: note
With [`networking.wireless.enableHardening`](#opt-networking.wireless.enableHardening) enabled,
the service is additionally granted:

- Membership in [`security.tpm2.tssGroup`](../../options/security/index.md#opt-security.tpm2.tssGroup).
- Access to the TPM device configured by
  [`security.tpm2.tctiEnvironment.deviceConf`](../../options/security/index.md#opt-security.tpm2.tctiEnvironment.deviceConf).
- pcscd socket for smartcard readers.
- Access to default system-wide token store `/etc/tpm2_pkcs11`.
  Note that the hardened service by default has no home directory,
  so only the system store location applies.

The store must be writable by [`security.tpm2.tssGroup`](../../options/security/index.md#opt-security.tpm2.tssGroup).
Enable [`security.tpm2.pkcs11.enable`](../../options/security/index.md#opt-security.tpm2.pkcs11.enable) option to grant
tss group access to the store.
:::

::: note
wpa\_supplicant loads the engine through OpenSSL's dynamic engine
mechanism, which only searches OpenSSL's own store path;
This option points the search path (the `OPENSSL_ENGINES` environment
variable) at the configured libp11 package instead,
which shadows OpenSSL's built-in engine directory rather than extending it.

wpa\_supplicant never requests the engines shipped there (afalg,
capi, loader\_attic, padlock), so this is normally invisible.
A configuration that nevertheless loads one of them by name
inside this service (e.g. through a custom `OPENSSL_CONF`) can
restore the union of both directories:

``` nix
networking.wireless.pkcs11.package = pkgs.symlinkJoin {
  name = "wpa-supplicant-engines";
  paths = [ pkgs.libp11 ];
  postBuild = "ln -s ${pkgs.openssl.out}/lib/engines-3/*.so $out/lib/engines/";
};
```
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.pkcs11.package` {#opt-networking.wireless.pkcs11.package}

The libp11 package to use.

*Type:* package

*Default:* `pkgs.libp11`

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.scanOnLowSignal` {#opt-networking.wireless.scanOnLowSignal}

Whether to periodically scan for (better) networks when the signal of
the current one is low. This will make roaming between access points
faster, but will consume more power.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.secretsFile` {#opt-networking.wireless.secretsFile}

File consisting of lines of the form `varname=value`
to define variables for the wireless configuration.

Secrets (PSKs, passwords, etc.) can be provided without adding them to
the world-readable Nix store by defining them in the secrets file and
referring to them in option [networking](#opt-networking.wireless.networks)
with the syntax `ext:secretname`. Example:

```
# content of /run/secrets/wireless.conf
psk_home=mypassword
psk_other=6a381cea59c7a2d6b30736ba0e6f397f7564a044bcdb7a327a1d16a1ed91b327
pass_work=myworkpassword

# wireless-related configuration
networking.wireless.secretsFile = "/run/secrets/wireless.conf";
networking.wireless.networks = {
  home.pskRaw = "ext:psk_home";
  other.pskRaw = "ext:psk_other";
  work.auth = ''
    eap=PEAP
    identity="my-user@example.com"
    password=ext:pass_work
  '';
};
```

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/wireless.conf"`

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wireless.userControlled` {#opt-networking.wireless.userControlled}

Allow users of the `wpa_supplicant` group to control wpa\_supplicant
through wpa\_gui or wpa\_cli.
This is useful for laptop users that switch networks a lot and don't want
to depend on a large package such as NetworkManager just to pick nearby
access points.

::: note
When networks are configured declaratively, you cannot persist any settings
via wpa\_gui or wpa\_cli, unless `allowAuxiliaryImperativeNetworks`
is used.
:::

*Type:* boolean or (attribute set) convertible to it

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/wpa_supplicant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wpa_supplicant.nix)

## `networking.wlanInterfaces` {#opt-networking.wlanInterfaces}

Creating multiple WLAN interfaces on top of one physical WLAN device (NIC).

The name of the WLAN interface corresponds to the name of the attribute.
A NIC is referenced by the persistent device name of the WLAN interface that
`udev` assigns to a NIC by default.
If a NIC supports multiple WLAN interfaces, then the one NIC can be used as
`device` for multiple WLAN interfaces.
If a NIC is used for creating WLAN interfaces, then the default WLAN interface
with a persistent device name form `udev` is not created.
A WLAN interface with the persistent name assigned from `udev`
would have to be created explicitly.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  wlan-station0 = {
      device = "wlp6s0";
  };
  wlan-adhoc0 = {
      type = "ibss";
      device = "wlp6s0";
      mac = "02:00:00:00:00:01";
  };
  wlan-p2p0 = {
      device = "wlp6s0";
      mac = "02:00:00:00:00:02";
  };
  wlan-ap0 = {
      device = "wlp6s0";
      mac = "02:00:00:00:00:03";
  };
}
```

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.wlanInterfaces.<name>.device` {#opt-networking.wlanInterfaces._name_.device}

The name of the underlying hardware WLAN device as assigned by `udev`.

*Type:* string

*Example:* `"wlp6s0"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.wlanInterfaces.<name>.flags` {#opt-networking.wlanInterfaces._name_.flags}

Flags for interface of type `monitor`.

*Type:* null or one of "none", "fcsfail", "control", "otherbss", "cook", "active"

*Default:* `null`

*Example:* `"control"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.wlanInterfaces.<name>.fourAddr` {#opt-networking.wlanInterfaces._name_.fourAddr}

Whether to enable `4-address mode` with type `managed`.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.wlanInterfaces.<name>.mac` {#opt-networking.wlanInterfaces._name_.mac}

MAC address to use for the device. If `null`, then the MAC of the
underlying hardware WLAN device is used.

INFO: Locally administered MAC addresses are of the form:

- x2:xx:xx:xx:xx:xx
- x6:xx:xx:xx:xx:xx
- xA:xx:xx:xx:xx:xx
- xE:xx:xx:xx:xx:xx

*Type:* null or string

*Default:* `null`

*Example:* `"02:00:00:00:00:01"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.wlanInterfaces.<name>.meshID` {#opt-networking.wlanInterfaces._name_.meshID}

MeshID of interface with type `mesh`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)

## `networking.wlanInterfaces.<name>.type` {#opt-networking.wlanInterfaces._name_.type}

The type of the WLAN interface.
The type has to be supported by the underlying hardware of the device.

*Type:* one of "managed", "ibss", "monitor", "mesh", "wds"

*Default:* `"managed"`

*Example:* `"ibss"`

*Declared by:* [`nixos/modules/tasks/network-interfaces.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/network-interfaces.nix)
