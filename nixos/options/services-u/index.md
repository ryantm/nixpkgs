# services (U) {#sec-options-services-u}

## `services.u9fs.enable` {#opt-services.u9fs.enable}

Whether to run the u9fs 9P server for Unix.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/u9fs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/u9fs.nix)

## `services.u9fs.extraArgs` {#opt-services.u9fs.extraArgs}

Extra arguments to pass on invocation,
see `man 4 u9fs`

*Type:* string

*Default:* `""`

*Example:* `"-a none"`

*Declared by:* [`nixos/modules/services/network-filesystems/u9fs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/u9fs.nix)

## `services.u9fs.listenStreams` {#opt-services.u9fs.listenStreams}

Sockets to listen for clients on.
See `man 5 systemd.socket` for socket syntax.

*Type:* list of string

*Default:*

``` nix
[
  "564"
]
```

*Example:*

``` nix
[
  "192.168.16.1:564"
]
```

*Declared by:* [`nixos/modules/services/network-filesystems/u9fs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/u9fs.nix)

## `services.u9fs.user` {#opt-services.u9fs.user}

User to run u9fs under.

*Type:* string

*Default:* `"nobody"`

*Declared by:* [`nixos/modules/services/network-filesystems/u9fs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/u9fs.nix)

## `services.udev.enable` {#opt-services.udev.enable}

Whether to enable udev, a device manager for the Linux kernel.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/udev.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/udev.nix)

## `services.udev.extraHwdb` {#opt-services.udev.extraHwdb}

Additional `hwdb` files. They'll be written
into file `99-local.hwdb`. Thus they are
read after all other files.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  evdev:input:b0003v05AFp8277*
    KEYBOARD_KEY_70039=leftalt
    KEYBOARD_KEY_700e2=leftctrl
''
```

*Declared by:* [`nixos/modules/services/hardware/udev.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/udev.nix)

## `services.udev.extraRules` {#opt-services.udev.extraRules}

Additional `udev` rules. They'll be written
into file `99-local.rules`. Thus they are
read and applied after all other rules.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  ENV{ID_VENDOR_ID}=="046d", ENV{ID_MODEL_ID}=="0825", ENV{PULSE_IGNORE}="1"
''
```

*Declared by:* [`nixos/modules/services/hardware/udev.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/udev.nix)

## `services.udev.packages` {#opt-services.udev.packages}

List of packages containing `udev` rules.
All files found in
`«pkg»/etc/udev/rules.d` and
`«pkg»/lib/udev/rules.d`
will be included.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/hardware/udev.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/udev.nix)

## `services.udev.path` {#opt-services.udev.path}

Packages added to the `PATH` environment variable when
executing programs from Udev rules.

coreutils, gnu{sed,grep}, util-linux and config.systemd.package are
automatically included.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/hardware/udev.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/udev.nix)

## `services.udisks2.enable` {#opt-services.udisks2.enable}

Whether to enable udisks2, a DBus service that allows applications to query and manipulate storage devices.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/udisks2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/udisks2.nix)

## `services.udisks2.mountOnMedia` {#opt-services.udisks2.mountOnMedia}

When enabled, instructs udisks2 to mount removable drives under `/media/` directory, instead of the
default, ACL-controlled `/run/media/$USER/`. Since `/media/` is not mounted as tmpfs by default, it
requires cleanup to get rid of stale mountpoints; enabling this option will take care of this at boot.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/udisks2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/udisks2.nix)

## `services.udisks2.package` {#opt-services.udisks2.package}

The udisks package to use.

*Type:* package

*Default:* `pkgs.udisks`

*Declared by:* [`nixos/modules/services/hardware/udisks2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/udisks2.nix)

## `services.udisks2.settings` {#opt-services.udisks2.settings}

Options passed to udisksd.
See [here](http://manpages.ubuntu.com/manpages/latest/en/man5/udisks2.conf.5.html) and
drive configuration in [here](http://manpages.ubuntu.com/manpages/latest/en/man8/udisks.8.html) for supported options.

*Type:* attribute set of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string) or a non-empty list of them)

*Default:*

``` nix
{
  "udisks2.conf" = {
    defaults = {
      encryption = "luks2";
    };
    udisks2 = {
      modules = [
        "*"
      ];
      modules_load_preference = "ondemand";
    };
  };
}
```

*Example:*

``` nix
{
  "WDC-WD10EZEX-60M2NA0-WD-WCC3F3SJ0698.conf" = {
    ATA = {
      StandbyTimeout = 50;
    };
  };
};
```

*Declared by:* [`nixos/modules/services/hardware/udisks2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/udisks2.nix)

## `services.udp-over-tcp.package` {#opt-services.udp-over-tcp.package}

The udp-over-tcp package to use.

*Type:* package

*Default:* `pkgs.udp-over-tcp`

*Declared by:* [`nixos/modules/services/networking/udp-over-tcp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/udp-over-tcp.nix)

## `services.udp-over-tcp.tcp2udp` {#opt-services.udp-over-tcp.tcp2udp}

Mapping of TCP listening ports to UDP forwarding ports or configurations.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "0.0.0.0:443" = {
    forward = "127.0.0.1:51820";
    openFirewall = true;
  };
  "0.0.0.0:444" = {
    threads = 2;
    forward = "127.0.0.1:51821";
    bind = "127.0.0.1";
    recvBufferSize = 16384;
    sendBufferSize = 16384;
    recvTimeout = 10;
    fwmark = 1337;
    nodelay = true;
  };
}
```

*Declared by:* [`nixos/modules/services/networking/udp-over-tcp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/udp-over-tcp.nix)

## `services.udp-over-tcp.tcp2udp.<name>.bind` {#opt-services.udp-over-tcp.tcp2udp._name_.bind}

Which local IP to bind the UDP socket to.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/udp-over-tcp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/udp-over-tcp.nix)

## `services.udp-over-tcp.tcp2udp.<name>.forward` {#opt-services.udp-over-tcp.tcp2udp._name_.forward}

The IP and port to forward all traffic to.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/udp-over-tcp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/udp-over-tcp.nix)

## `services.udp-over-tcp.tcp2udp.<name>.fwmark` {#opt-services.udp-over-tcp.tcp2udp._name_.fwmark}

If given, sets the SO\_MARK option on the TCP socket.

*Type:* null or 32 bit unsigned integer; between 0 and 4294967295 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/udp-over-tcp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/udp-over-tcp.nix)

## `services.udp-over-tcp.tcp2udp.<name>.nodelay` {#opt-services.udp-over-tcp.tcp2udp._name_.nodelay}

Enables TCP\_NODELAY on the TCP socket.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/udp-over-tcp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/udp-over-tcp.nix)

## `services.udp-over-tcp.tcp2udp.<name>.openFirewall` {#opt-services.udp-over-tcp.tcp2udp._name_.openFirewall}

Open the appropriate ports in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/udp-over-tcp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/udp-over-tcp.nix)

## `services.udp-over-tcp.tcp2udp.<name>.recvBufferSize` {#opt-services.udp-over-tcp.tcp2udp._name_.recvBufferSize}

If given, sets the SO\_RCVBUF option on the TCP socket to the given number of bytes.
Changes the size of the operating system's receive buffer associated with the socket.

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/udp-over-tcp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/udp-over-tcp.nix)

## `services.udp-over-tcp.tcp2udp.<name>.recvTimeout` {#opt-services.udp-over-tcp.tcp2udp._name_.recvTimeout}

An application timeout on receiving data from the TCP socket.

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/udp-over-tcp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/udp-over-tcp.nix)

## `services.udp-over-tcp.tcp2udp.<name>.sendBufferSize` {#opt-services.udp-over-tcp.tcp2udp._name_.sendBufferSize}

If given, sets the SO\_SNDBUF option on the TCP socket to the given number of bytes.
Changes the size of the operating system's send buffer associated with the socket.

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/udp-over-tcp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/udp-over-tcp.nix)

## `services.udp-over-tcp.tcp2udp.<name>.threads` {#opt-services.udp-over-tcp.tcp2udp._name_.threads}

Sets the number of worker threads to use.
The default value is the number of cores available to the system.

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/udp-over-tcp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/udp-over-tcp.nix)

## `services.udp-over-tcp.udp2tcp` {#opt-services.udp-over-tcp.udp2tcp}

Mapping of UDP listening ports to TCP forwarding ports or configurations.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "0.0.0.0:51820" = {
    forward = "10.0.0.1:443";
    openFirewall = true;
  };
  "0.0.0.0:51821" = {
    forward = "10.0.0.1:444";
    recvBufferSize = 16384;
    sendBufferSize = 16384;
    recvTimeout = 10;
    fwmark = 1337;
    nodelay = true;
  };
}
```

*Declared by:* [`nixos/modules/services/networking/udp-over-tcp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/udp-over-tcp.nix)

## `services.udp-over-tcp.udp2tcp.<name>.forward` {#opt-services.udp-over-tcp.udp2tcp._name_.forward}

The IP and port to forward all traffic to.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/udp-over-tcp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/udp-over-tcp.nix)

## `services.udp-over-tcp.udp2tcp.<name>.fwmark` {#opt-services.udp-over-tcp.udp2tcp._name_.fwmark}

If given, sets the SO\_MARK option on the TCP socket.

*Type:* null or 32 bit unsigned integer; between 0 and 4294967295 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/udp-over-tcp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/udp-over-tcp.nix)

## `services.udp-over-tcp.udp2tcp.<name>.nodelay` {#opt-services.udp-over-tcp.udp2tcp._name_.nodelay}

Enables TCP\_NODELAY on the TCP socket.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/udp-over-tcp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/udp-over-tcp.nix)

## `services.udp-over-tcp.udp2tcp.<name>.openFirewall` {#opt-services.udp-over-tcp.udp2tcp._name_.openFirewall}

Open the appropriate ports in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/udp-over-tcp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/udp-over-tcp.nix)

## `services.udp-over-tcp.udp2tcp.<name>.recvBufferSize` {#opt-services.udp-over-tcp.udp2tcp._name_.recvBufferSize}

If given, sets the SO\_RCVBUF option on the TCP socket to the given number of bytes.
Changes the size of the operating system's receive buffer associated with the socket.

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/udp-over-tcp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/udp-over-tcp.nix)

## `services.udp-over-tcp.udp2tcp.<name>.recvTimeout` {#opt-services.udp-over-tcp.udp2tcp._name_.recvTimeout}

An application timeout on receiving data from the TCP socket.

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/udp-over-tcp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/udp-over-tcp.nix)

## `services.udp-over-tcp.udp2tcp.<name>.sendBufferSize` {#opt-services.udp-over-tcp.udp2tcp._name_.sendBufferSize}

If given, sets the SO\_SNDBUF option on the TCP socket to the given number of bytes.
Changes the size of the operating system's send buffer associated with the socket.

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/udp-over-tcp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/udp-over-tcp.nix)

## `services.udp514-journal.enable` {#opt-services.udp514-journal.enable}

Whether to enable the udp514-journal systemd socket/service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/logging/udp514-journal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/udp514-journal.nix)

## `services.udp514-journal.openFirewall` {#opt-services.udp514-journal.openFirewall}

Whether to open the port in the firewall.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/logging/udp514-journal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/udp514-journal.nix)

## `services.udp514-journal.package` {#opt-services.udp514-journal.package}

The udp514-journal package to use.

*Type:* package

*Default:* `pkgs.udp514-journal`

*Declared by:* [`nixos/modules/services/logging/udp514-journal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/udp514-journal.nix)

## `services.udp514-journal.port` {#opt-services.udp514-journal.port}

Port to listen on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `514`

*Declared by:* [`nixos/modules/services/logging/udp514-journal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/udp514-journal.nix)

## `services.uhub` {#opt-services.uhub}

Uhub ADC hub instances

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/uhub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/uhub.nix)

## `services.uhub.<name>.enable` {#opt-services.uhub._name_.enable}

Whether to enable hub instance.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/uhub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/uhub.nix)

## `services.uhub.<name>.enableTLS` {#opt-services.uhub._name_.enableTLS}

Whether to enable TLS support.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/uhub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/uhub.nix)

## `services.uhub.<name>.plugins` {#opt-services.uhub._name_.plugins}

Uhub plugin configuration.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/uhub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/uhub.nix)

## `services.uhub.<name>.plugins.*.plugin` {#opt-services.uhub._name_.plugins._.plugin}

Path to plugin file.

*Type:* absolute path

*Example:* `$${pkgs.uhub}/plugins/mod_auth_sqlite.so`

*Declared by:* [`nixos/modules/services/misc/uhub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/uhub.nix)

## `services.uhub.<name>.plugins.*.settings` {#opt-services.uhub._name_.plugins._.settings}

Settings specific to this plugin.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  file = "/etc/uhub/users.db";
}
```

*Declared by:* [`nixos/modules/services/misc/uhub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/uhub.nix)

## `services.uhub.<name>.settings` {#opt-services.uhub._name_.settings}

Configuration of uhub.
See [https://www.uhub.org/doc/config.php](https://www.uhub.org/doc/config.php) for a list of options.

*Type:* attribute set of (boolean or signed integer or string)

*Default:* `{ }`

*Example:*

``` nix
{
  hub_description = "Yet another ADC hub";
  hub_name = "My Public Hub";
  max_users = 150;
  server_bind_addr = "any";
  server_port = 1511;
}
```

*Declared by:* [`nixos/modules/services/misc/uhub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/uhub.nix)

## `services.ulogd.enable` {#opt-services.ulogd.enable}

Whether to enable ulogd, a userspace logging daemon for netfilter/iptables related logging.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/logging/ulogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/ulogd.nix)

## `services.ulogd.logLevel` {#opt-services.ulogd.logLevel}

Log level (1 = debug, 3 = info, 5 = notice, 7 = error, 8 = fatal)

*Type:* one of 1, 3, 5, 7, 8

*Default:* `5`

*Declared by:* [`nixos/modules/services/logging/ulogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/ulogd.nix)

## `services.ulogd.settings` {#opt-services.ulogd.settings}

Configuration for ulogd. See `/share/doc/ulogd/` in `pkgs.ulogd.doc`.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string) or a list of them for duplicate keys)

*Default:* `{ }`

*Example:*

``` nix
{
  emu1 = {
    file = "/var/log/ulogd_pkts.log";
    sync = 1;
  };
  global = {
    stack = [
      "log1:NFLOG,base1:BASE,ifi1:IFINDEX,ip2str1:IP2STR,print1:PRINTPKT,emu1:LOGEMU"
      "log1:NFLOG,base1:BASE,pcap1:PCAP"
    ];
  };
  log1 = {
    group = 2;
  };
  pcap1 = {
    file = "/var/log/ulogd.pcap";
    sync = 1;
  };
}
```

*Declared by:* [`nixos/modules/services/logging/ulogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/ulogd.nix)

## `services.umami.createPostgresqlDatabase` {#opt-services.umami.createPostgresqlDatabase}

Whether to automatically create the database for Umami using PostgreSQL.
Both the database name and username will be `umami`, and the connection is
made through unix sockets using peer authentication.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/web-apps/umami.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/umami.nix)

## `services.umami.enable` {#opt-services.umami.enable}

Whether to enable umami.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/umami.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/umami.nix)

## `services.umami.package` {#opt-services.umami.package}

The umami package to use.

*Type:* package

*Default:* `pkgs.umami`

*Declared by:* [`nixos/modules/services/web-apps/umami.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/umami.nix)

## `services.umami.settings` {#opt-services.umami.settings}

Additional configuration (environment variables) for Umami, see
[https://umami.is/docs/environment-variables](https://umami.is/docs/environment-variables) for supported values.

*Type:* open submodule of attribute set of (boolean or signed integer or string)

*Default:* `{ }`

*Example:*

``` nix
{
  APP_SECRET_FILE = "/run/secrets/umamiAppSecret";
  DISABLE_TELEMETRY = true;
}
```

*Declared by:* [`nixos/modules/services/web-apps/umami.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/umami.nix)

## `services.umami.settings.APP_SECRET_FILE` {#opt-services.umami.settings.APP_SECRET_FILE}

A file containing a secure random string. This is used for signing user sessions.
The contents of the file are read through systemd credentials, therefore the
user running umami does not need permissions to read the file.
If you wish to set this to a string instead (not recommended since it will be
placed world-readable in the Nix store), you can use the APP\_SECRET option.

*Type:* null or string

*Default:* `null`

*Example:* `"/run/secrets/umamiAppSecret"`

*Declared by:* [`nixos/modules/services/web-apps/umami.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/umami.nix)

## `services.umami.settings.BASE_PATH` {#opt-services.umami.settings.BASE_PATH}

Allows you to host Umami under a subdirectory.
You may need to update your reverse proxy settings to correctly handle the BASE\_PATH prefix.

*Type:* string

*Default:* `""`

*Example:* `"/analytics"`

*Declared by:* [`nixos/modules/services/web-apps/umami.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/umami.nix)

## `services.umami.settings.COLLECT_API_ENDPOINT` {#opt-services.umami.settings.COLLECT_API_ENDPOINT}

Allows you to send metrics to a location different than the default `/api/send`.

*Type:* null or string

*Default:* `null`

*Example:* `"/api/alternate-send"`

*Declared by:* [`nixos/modules/services/web-apps/umami.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/umami.nix)

## `services.umami.settings.DATABASE_URL` {#opt-services.umami.settings.DATABASE_URL}

Connection string for the database. Must start with `postgresql://` or `postgres://`.

*Type:* null or string

*Default:* `if config.services.umami.createPostgresqlDatabase then "postgresql://umami@localhost/umami?host=/run/postgresql" else null`

*Example:* `"postgresql://root:root@localhost/umami"`

*Declared by:* [`nixos/modules/services/web-apps/umami.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/umami.nix)

## `services.umami.settings.DATABASE_URL_FILE` {#opt-services.umami.settings.DATABASE_URL_FILE}

A file containing a connection string for the database. The connection string
must start with `postgresql://` or `postgres://`.
The contents of the file are read through systemd credentials, therefore the
user running umami does not need permissions to read the file.

*Type:* null or string

*Default:* `null`

*Example:* `"/run/secrets/umamiDatabaseUrl"`

*Declared by:* [`nixos/modules/services/web-apps/umami.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/umami.nix)

## `services.umami.settings.DISABLE_TELEMETRY` {#opt-services.umami.settings.DISABLE_TELEMETRY}

Umami collects completely anonymous telemetry data in order help improve the application.
You can choose to disable this if you don't want to participate.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/umami.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/umami.nix)

## `services.umami.settings.DISABLE_UPDATES` {#opt-services.umami.settings.DISABLE_UPDATES}

Disables the check for new versions of Umami.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/web-apps/umami.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/umami.nix)

## `services.umami.settings.HOSTNAME` {#opt-services.umami.settings.HOSTNAME}

The address to listen on.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/web-apps/umami.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/umami.nix)

## `services.umami.settings.PORT` {#opt-services.umami.settings.PORT}

The port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Example:* `3010`

*Declared by:* [`nixos/modules/services/web-apps/umami.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/umami.nix)

## `services.umami.settings.TRACKER_SCRIPT_NAME` {#opt-services.umami.settings.TRACKER_SCRIPT_NAME}

Allows you to assign a custom name to the tracker script different from the default `script.js`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "tracker.js"
]
```

*Declared by:* [`nixos/modules/services/web-apps/umami.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/umami.nix)

## `services.umami.settings.TWO_FACTOR_ENCRYPTION_KEY_FILE` {#opt-services.umami.settings.TWO_FACTOR_ENCRYPTION_KEY_FILE}

A file containing a secure random string (best not the same as the app secret).
This is used for encrypting two-factor authentication keys.
The contents of the file are read through systemd credentials, therefore the
user running umami does not need permissions to read the file.
If you wish to set this to a string instead (not recommended since it will be
placed world-readable in the Nix store), you can use the TWO\_FACTOR\_ENCRYPTION\_KEY option.

*Type:* null or string

*Default:* `null`

*Example:* `"/run/secrets/umami2faSecret"`

*Declared by:* [`nixos/modules/services/web-apps/umami.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/umami.nix)

## `services.umurmur.configFile` {#opt-services.umurmur.configFile}

Configuration file, default is generated from config.service.umurmur.settings

*Type:* absolute path

*Default:* `"Configuration file, default is generated from config.service.umurmur.settings"`

*Declared by:* [`nixos/modules/services/networking/umurmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/umurmur.nix)

## `services.umurmur.enable` {#opt-services.umurmur.enable}

Whether to enable uMurmur Mumble server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/umurmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/umurmur.nix)

## `services.umurmur.openFirewall` {#opt-services.umurmur.openFirewall}

Open ports in the firewall for the uMurmur Mumble server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/umurmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/umurmur.nix)

## `services.umurmur.package` {#opt-services.umurmur.package}

The umurmur package to use.

*Type:* package

*Default:* `pkgs.umurmur`

*Declared by:* [`nixos/modules/services/networking/umurmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/umurmur.nix)

## `services.umurmur.settings` {#opt-services.umurmur.settings}

Settings of uMurmur. For reference see [https://github.com/umurmur/umurmur/blob/master/umurmur.conf.example](https://github.com/umurmur/umurmur/blob/master/umurmur.conf.example)

*Type:* open submodule of uMurmur config value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/umurmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/umurmur.nix)

## `services.umurmur.settings.bindaddr` {#opt-services.umurmur.settings.bindaddr}

IPv4 address to bind to. Defaults binding on all addresses.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/networking/umurmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/umurmur.nix)

## `services.umurmur.settings.bindaddr6` {#opt-services.umurmur.settings.bindaddr6}

IPv6 address to bind to. Defaults binding on all addresses.

*Type:* string

*Default:* `"::"`

*Declared by:* [`nixos/modules/services/networking/umurmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/umurmur.nix)

## `services.umurmur.settings.bindport` {#opt-services.umurmur.settings.bindport}

Port to bind to (UDP and TCP).

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `64739`

*Declared by:* [`nixos/modules/services/networking/umurmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/umurmur.nix)

## `services.umurmur.settings.ca_path` {#opt-services.umurmur.settings.ca_path}

Path to your SSL CA certificate.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/umurmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/umurmur.nix)

## `services.umurmur.settings.certificate` {#opt-services.umurmur.settings.certificate}

Path to your SSL certificate. Generates self-signed automatically if not exists.

*Type:* string

*Default:* `"/var/lib/private/umurmur/cert.crt"`

*Declared by:* [`nixos/modules/services/networking/umurmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/umurmur.nix)

## `services.umurmur.settings.channel_links` {#opt-services.umurmur.settings.channel_links}

Channel tree definitions.

*Type:* list of (attribute set)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    destination = "Red team";
    source = "Lobby";
  }
]
```

*Declared by:* [`nixos/modules/services/networking/umurmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/umurmur.nix)

## `services.umurmur.settings.channels` {#opt-services.umurmur.settings.channels}

Channel tree definitions.

*Type:* list of (attribute set)

*Default:*

``` nix
[
  {
    description = "Root channel.";
    name = "root";
    noenter = false;
    parent = "";
  }
]
```

*Declared by:* [`nixos/modules/services/networking/umurmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/umurmur.nix)

## `services.umurmur.settings.default_channel` {#opt-services.umurmur.settings.default_channel}

The channel in which users will appear in when connecting.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/networking/umurmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/umurmur.nix)

## `services.umurmur.settings.max_bandwidth` {#opt-services.umurmur.settings.max_bandwidth}

Maximum bandwidth (in bits per second) that clients may send
speech at.

*Type:* signed integer

*Default:* `48000`

*Declared by:* [`nixos/modules/services/networking/umurmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/umurmur.nix)

## `services.umurmur.settings.max_users` {#opt-services.umurmur.settings.max_users}

Maximum number of concurrent clients allowed.

*Type:* signed integer

*Default:* `10`

*Declared by:* [`nixos/modules/services/networking/umurmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/umurmur.nix)

## `services.umurmur.settings.password` {#opt-services.umurmur.settings.password}

Required password to join server, if specified.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/umurmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/umurmur.nix)

## `services.umurmur.settings.private_key` {#opt-services.umurmur.settings.private_key}

Path to your SSL key. Generates self-signed automatically if not exists.

*Type:* string

*Default:* `"/var/lib/private/umurmur/key.key"`

*Declared by:* [`nixos/modules/services/networking/umurmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/umurmur.nix)

## `services.umurmur.settings.welcometext` {#opt-services.umurmur.settings.welcometext}

Welcome message for connected clients.

*Type:* null or string

*Default:* `"Welcome to uMurmur!"`

*Declared by:* [`nixos/modules/services/networking/umurmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/umurmur.nix)

## `services.unbound.checkconf` {#opt-services.unbound.checkconf}

Whether to check the resulting config file with unbound checkconf for syntax errors.

If settings.include is used, this options is disabled, as the import can likely not be accessed at build time.
If settings.remote-control is used, this option is disabled, too as the control-key-file, server-cert-file and server-key-file cannot be accessed at build time.

*Type:* boolean

*Default:* `"!services.unbound.settings ? include && !services.unbound.settings ? remote-control"`

*Declared by:* [`nixos/modules/services/networking/unbound.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/unbound.nix)

## `services.unbound.enable` {#opt-services.unbound.enable}

Whether to enable Unbound domain name server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/unbound.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/unbound.nix)

## `services.unbound.enableRootTrustAnchor` {#opt-services.unbound.enableRootTrustAnchor}

Use and update root trust anchor for DNSSEC validation.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/unbound.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/unbound.nix)

## `services.unbound.group` {#opt-services.unbound.group}

Group under which unbound runs.

*Type:* string

*Default:* `"unbound"`

*Declared by:* [`nixos/modules/services/networking/unbound.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/unbound.nix)

## `services.unbound.localControlSocketPath` {#opt-services.unbound.localControlSocketPath}

When not set to `null` this option defines the path
at which the unbound remote control socket should be created at. The
socket will be owned by the unbound user (`unbound`)
and group will be `nogroup`.

Users that should be permitted to access the socket must be in the
`config.services.unbound.group` group.

If this option is `null` remote control will not be
enabled. Unbounds default values apply.

*Type:* null or string

*Default:* `null`

*Example:* `"/run/unbound/unbound.ctl"`

*Declared by:* [`nixos/modules/services/networking/unbound.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/unbound.nix)

## `services.unbound.package` {#opt-services.unbound.package}

The unbound-with-systemd package to use.

*Type:* package

*Default:* `pkgs.unbound-with-systemd`

*Declared by:* [`nixos/modules/services/networking/unbound.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/unbound.nix)

## `services.unbound.resolveLocalQueries` {#opt-services.unbound.resolveLocalQueries}

Whether unbound should resolve local queries (i.e. add 127.0.0.1 to
/etc/resolv.conf and set name servers to localhost respectively).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/unbound.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/unbound.nix)

## `services.unbound.settings` {#opt-services.unbound.settings}

Declarative Unbound configuration
See the `unbound.conf(5)` manpage for a list of
available options.

*Type:* open submodule of unbound.conf configuration type. The format consist of an attribute
set of settings. Each settings can be either one value, a list of
values or an attribute set. The allowed values are integers,
strings, booleans or floats.

*Default:* `{ }`

*Example:*

``` nix
{
  server = {
    interface = [ "127.0.0.1" ];
  };
  forward-zone = [
    {
      name = ".";
      forward-addr = "1.1.1.1@853#cloudflare-dns.com";
    }
    {
      name = "example.org.";
      forward-addr = [
        "1.1.1.1@853#cloudflare-dns.com"
        "1.0.0.1@853#cloudflare-dns.com"
      ];
    }
  ];
  remote-control.control-enable = true;
};
```

*Declared by:* [`nixos/modules/services/networking/unbound.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/unbound.nix)

## `services.unbound.stateDir` {#opt-services.unbound.stateDir}

Directory holding all state for unbound to run.

*Type:* absolute path

*Default:* `"/var/lib/unbound"`

*Declared by:* [`nixos/modules/services/networking/unbound.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/unbound.nix)

## `services.unbound.user` {#opt-services.unbound.user}

User account under which unbound runs.

*Type:* string

*Default:* `"unbound"`

*Declared by:* [`nixos/modules/services/networking/unbound.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/unbound.nix)

## `services.unclutter-xfixes.enable` {#opt-services.unclutter-xfixes.enable}

Enable unclutter-xfixes to hide your mouse cursor when inactive.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/unclutter-xfixes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/unclutter-xfixes.nix)

## `services.unclutter-xfixes.extraOptions` {#opt-services.unclutter-xfixes.extraOptions}

More arguments to pass to the unclutter-xfixes command.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "exclude-root"
  "ignore-scrolling"
  "fork"
]
```

*Declared by:* [`nixos/modules/services/x11/unclutter-xfixes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/unclutter-xfixes.nix)

## `services.unclutter-xfixes.package` {#opt-services.unclutter-xfixes.package}

The unclutter-xfixes package to use.

*Type:* package

*Default:* `pkgs.unclutter-xfixes`

*Declared by:* [`nixos/modules/services/x11/unclutter-xfixes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/unclutter-xfixes.nix)

## `services.unclutter-xfixes.threshold` {#opt-services.unclutter-xfixes.threshold}

Minimum number of pixels considered cursor movement.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/x11/unclutter-xfixes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/unclutter-xfixes.nix)

## `services.unclutter-xfixes.timeout` {#opt-services.unclutter-xfixes.timeout}

Number of seconds before the cursor is marked inactive.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/x11/unclutter-xfixes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/unclutter-xfixes.nix)

## `services.unclutter.enable` {#opt-services.unclutter.enable}

Enable unclutter to hide your mouse cursor when inactive

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/unclutter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/unclutter.nix)

## `services.unclutter.excluded` {#opt-services.unclutter.excluded}

Names of windows where unclutter should not apply

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  ""
]
```

*Declared by:* [`nixos/modules/services/x11/unclutter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/unclutter.nix)

## `services.unclutter.extraOptions` {#opt-services.unclutter.extraOptions}

More arguments to pass to the unclutter command

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "noevent"
  "grab"
]
```

*Declared by:* [`nixos/modules/services/x11/unclutter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/unclutter.nix)

## `services.unclutter.keystroke` {#opt-services.unclutter.keystroke}

Wait for a keystroke before hiding the cursor

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/unclutter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/unclutter.nix)

## `services.unclutter.package` {#opt-services.unclutter.package}

The unclutter package to use.

*Type:* package

*Default:* `pkgs.unclutter`

*Declared by:* [`nixos/modules/services/x11/unclutter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/unclutter.nix)

## `services.unclutter.threshold` {#opt-services.unclutter.threshold}

Minimum number of pixels considered cursor movement

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/x11/unclutter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/unclutter.nix)

## `services.unclutter.timeout` {#opt-services.unclutter.timeout}

Number of seconds before the cursor is marked inactive

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/x11/unclutter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/unclutter.nix)

## `services.undervolt.analogioOffset` {#opt-services.undervolt.analogioOffset}

The amount of voltage in mV to offset analogio by.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/undervolt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/undervolt.nix)

## `services.undervolt.coreOffset` {#opt-services.undervolt.coreOffset}

The amount of voltage in mV to offset the CPU cores by.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/undervolt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/undervolt.nix)

## `services.undervolt.enable` {#opt-services.undervolt.enable}

Whether to enable Undervolting service for Intel CPUs.

Warning: This service is not endorsed by Intel and may permanently damage your hardware. Use at your own risk
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/undervolt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/undervolt.nix)

## `services.undervolt.gpuOffset` {#opt-services.undervolt.gpuOffset}

The amount of voltage in mV to offset the GPU by.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/undervolt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/undervolt.nix)

## `services.undervolt.p1.limit` {#opt-services.undervolt.p1.limit}

The P1 Power Limit in Watts.
Both limit and window must be set.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/undervolt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/undervolt.nix)

## `services.undervolt.p1.window` {#opt-services.undervolt.p1.window}

The P1 Time Window in seconds.
Both limit and window must be set.

*Type:* null or floating point number or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/undervolt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/undervolt.nix)

## `services.undervolt.p2.limit` {#opt-services.undervolt.p2.limit}

The P2 Power Limit in Watts.
Both limit and window must be set.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/undervolt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/undervolt.nix)

## `services.undervolt.p2.window` {#opt-services.undervolt.p2.window}

The P2 Time Window in seconds.
Both limit and window must be set.

*Type:* null or floating point number or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/undervolt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/undervolt.nix)

## `services.undervolt.package` {#opt-services.undervolt.package}

The undervolt package to use.

*Type:* package

*Default:* `pkgs.undervolt`

*Declared by:* [`nixos/modules/services/hardware/undervolt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/undervolt.nix)

## `services.undervolt.temp` {#opt-services.undervolt.temp}

The temperature target in Celsius degrees.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/undervolt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/undervolt.nix)

## `services.undervolt.tempAc` {#opt-services.undervolt.tempAc}

The temperature target on AC power in Celsius degrees.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/undervolt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/undervolt.nix)

## `services.undervolt.tempBat` {#opt-services.undervolt.tempBat}

The temperature target on battery power in Celsius degrees.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/undervolt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/undervolt.nix)

## `services.undervolt.turbo` {#opt-services.undervolt.turbo}

Changes the Intel Turbo feature status (1 is disabled and 0 is enabled).

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/undervolt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/undervolt.nix)

## `services.undervolt.uncoreOffset` {#opt-services.undervolt.uncoreOffset}

The amount of voltage in mV to offset uncore by.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/undervolt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/undervolt.nix)

## `services.undervolt.useTimer` {#opt-services.undervolt.useTimer}

Whether to set a timer that applies the undervolt settings every 30s.
This will cause spam in the journal but might be required for some
hardware under specific conditions.
Enable this if your undervolt settings don't hold.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/undervolt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/undervolt.nix)

## `services.undervolt.verbose` {#opt-services.undervolt.verbose}

Whether to enable verbose logging.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/undervolt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/undervolt.nix)

## `services.unifi.enable` {#opt-services.unifi.enable}

Whether to enable UniFi controller service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/unifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/unifi.nix)

## `services.unifi.extraJvmOptions` {#opt-services.unifi.extraJvmOptions}

Set extra options to pass to the JVM.

*Type:* list of string

*Default:* `[ ]`

*Example:* `["-Xlog:gc"]`

*Declared by:* [`nixos/modules/services/networking/unifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/unifi.nix)

## `services.unifi.initialJavaHeapSize` {#opt-services.unifi.initialJavaHeapSize}

Set the initial heap size for the JVM in MB. If this option isn't set, the
JVM will decide this value at runtime.

*Type:* null or signed integer

*Default:* `null`

*Example:* `1024`

*Declared by:* [`nixos/modules/services/networking/unifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/unifi.nix)

## `services.unifi.jrePackage` {#opt-services.unifi.jrePackage}

Which Java runtime to use.

*Type:* package

*Default:* `unifiPackage.passthru.jrePackage`

*Declared by:* [`nixos/modules/services/networking/unifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/unifi.nix)

## `services.unifi.maximumJavaHeapSize` {#opt-services.unifi.maximumJavaHeapSize}

Set the maximum heap size for the JVM in MB. If this option isn't set, the
JVM will decide this value at runtime.

*Type:* null or signed integer

*Default:* `null`

*Example:* `4096`

*Declared by:* [`nixos/modules/services/networking/unifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/unifi.nix)

## `services.unifi.mongodbPackage` {#opt-services.unifi.mongodbPackage}

The mongodb package to use.

*Type:* package

*Default:* `pkgs.mongodb-7_0`

*Declared by:* [`nixos/modules/services/networking/unifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/unifi.nix)

## `services.unifi.openFirewall` {#opt-services.unifi.openFirewall}

Whether or not to open the minimum required ports on the firewall.

This is necessary to allow firmware upgrades and device discovery to
work. For remote login, you should additionally open (or forward) port
8443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/unifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/unifi.nix)

## `services.unifi.unifiPackage` {#opt-services.unifi.unifiPackage}

The unifi package to use.

*Type:* package

*Default:* `pkgs.unifi`

*Declared by:* [`nixos/modules/services/networking/unifi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/unifi.nix)

## `services.unpackerr.enable` {#opt-services.unpackerr.enable}

Whether to enable Unpackerr.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/unpackerr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/unpackerr.nix)

## `services.unpackerr.group` {#opt-services.unpackerr.group}

Group under which Unpackerr runs.

*Type:* string

*Default:* `"unpackerr"`

*Declared by:* [`nixos/modules/services/misc/unpackerr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/unpackerr.nix)

## `services.unpackerr.package` {#opt-services.unpackerr.package}

The unpackerr package to use.

*Type:* package

*Default:* `pkgs.unpackerr`

*Declared by:* [`nixos/modules/services/misc/unpackerr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/unpackerr.nix)

## `services.unpackerr.settings` {#opt-services.unpackerr.settings}

Unpackerr TOML configuration as a Nix attribute set.
Refer to [Unpackerr docs](https://unpackerr.zip/docs/install/configuration) for details.
For setting secrets refer to this [section](https://unpackerr.zip/docs/install/configuration/#secrets-and-passwords).

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  radarr = [
    {
      api_key = "0123456789abcdef0123456789abcdef";
      url = "http://127.0.0.1:8989";
    }
  ];
  sonarr = [
    {
      api_key = "0123456789abcdef0123456789abcdef";
      url = "http://127.0.0.1:7878";
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/misc/unpackerr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/unpackerr.nix)

## `services.unpackerr.user` {#opt-services.unpackerr.user}

User account under which Unpackerr runs.

*Type:* string

*Default:* `"unpackerr"`

*Declared by:* [`nixos/modules/services/misc/unpackerr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/unpackerr.nix)

## `services.unpoller.enable` {#opt-services.unpoller.enable}

Whether to enable unpoller.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.influxdb.db` {#opt-services.unpoller.influxdb.db}

Database name. Database should exist.

*Type:* string

*Default:* `"unifi"`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.influxdb.disable` {#opt-services.unpoller.influxdb.disable}

Whether to disable the influxdb output plugin.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.influxdb.interval` {#opt-services.unpoller.influxdb.interval}

Setting this lower than the Unifi controller's refresh
interval may lead to zeroes in your database.

*Type:* string

*Default:* `"30s"`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.influxdb.pass` {#opt-services.unpoller.influxdb.pass}

Path of a file containing the password for influxdb.
This file needs to be readable by the unifi-poller user.

*Type:* absolute path

*Default:* `unpoller-influxdb-default.password`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.influxdb.url` {#opt-services.unpoller.influxdb.url}

URL of the influxdb host.

*Type:* string

*Default:* `"http://127.0.0.1:8086"`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.influxdb.user` {#opt-services.unpoller.influxdb.user}

Username for the influxdb.

*Type:* string

*Default:* `"unifipoller"`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.influxdb.verify_ssl` {#opt-services.unpoller.influxdb.verify_ssl}

Verify the influxdb's certificate.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.loki.interval` {#opt-services.unpoller.loki.interval}

How often the events are polled and pushed to Loki.

*Type:* string

*Default:* `"2m"`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.loki.pass` {#opt-services.unpoller.loki.pass}

Path of a file containing the password for Loki.
This file needs to be readable by the unifi-poller user.

*Type:* absolute path

*Default:* `"unpoller-influxdb-default.password"`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.loki.tenant_id` {#opt-services.unpoller.loki.tenant_id}

Tenant ID to use in Loki.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.loki.timeout` {#opt-services.unpoller.loki.timeout}

Should be increased in case of timeout errors.

*Type:* string

*Default:* `"10s"`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.loki.url` {#opt-services.unpoller.loki.url}

URL of the Loki host.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.loki.user` {#opt-services.unpoller.loki.user}

Username for Loki.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.loki.verify_ssl` {#opt-services.unpoller.loki.verify_ssl}

Verify Loki's certificate.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.poller.debug` {#opt-services.unpoller.poller.debug}

Turns on line numbers, microsecond logging, and a per-device log.
This may be noisy if you have a lot of devices. It adds one line per device.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.poller.plugins` {#opt-services.unpoller.poller.plugins}

Load additional plugins.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.poller.quiet` {#opt-services.unpoller.poller.quiet}

Turns off per-interval logs. Only startup and error logs will be emitted.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.prometheus.disable` {#opt-services.unpoller.prometheus.disable}

Whether to disable the prometheus output plugin.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.prometheus.http_listen` {#opt-services.unpoller.prometheus.http_listen}

Bind the prometheus exporter to this IP or hostname.

*Type:* string

*Default:* `"[::]:9130"`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.prometheus.report_errors` {#opt-services.unpoller.prometheus.report_errors}

Whether to report errors.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.controllers` {#opt-services.unpoller.unifi.controllers}

List of Unifi controllers to poll. Use defaults if empty.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.controllers.*.hash_pii` {#opt-services.unpoller.unifi.controllers._.hash_pii}

Hash, with md5, client names and MAC addresses. This attempts
to protect personally identifiable information.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.controllers.*.pass` {#opt-services.unpoller.unifi.controllers._.pass}

Path of a file containing the password for the unifi service user.
This file needs to be readable by the unifi-poller user.

*Type:* absolute path

*Default:* `unpoller-unifi-default.password`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.controllers.*.save_alarms` {#opt-services.unpoller.unifi.controllers._.save_alarms}

Collect and save data from UniFi alarms to influxdb and Loki.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.controllers.*.save_anomalies` {#opt-services.unpoller.unifi.controllers._.save_anomalies}

Collect and save data from UniFi anomalies to influxdb and Loki.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.controllers.*.save_dpi` {#opt-services.unpoller.unifi.controllers._.save_dpi}

Collect and save data from deep packet inspection.
Adds around 150 data points and impacts performance.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.controllers.*.save_events` {#opt-services.unpoller.unifi.controllers._.save_events}

Collect and save data from UniFi events to influxdb and Loki.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.controllers.*.save_ids` {#opt-services.unpoller.unifi.controllers._.save_ids}

Collect and save data from the intrusion detection system to influxdb and Loki.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.controllers.*.save_sites` {#opt-services.unpoller.unifi.controllers._.save_sites}

Collect and save site data.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.controllers.*.sites` {#opt-services.unpoller.unifi.controllers._.sites}

List of site names for which statistics should be exported.
Or the string "default" for the default site or the string "all" for all sites.

*Type:* one of "default", "all" or list of string

*Default:* `"all"`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.controllers.*.url` {#opt-services.unpoller.unifi.controllers._.url}

URL of the Unifi controller.

*Type:* string

*Default:* `"https://unifi:8443"`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.controllers.*.user` {#opt-services.unpoller.unifi.controllers._.user}

Unifi service user name.

*Type:* string

*Default:* `"unifi"`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.controllers.*.verify_ssl` {#opt-services.unpoller.unifi.controllers._.verify_ssl}

Verify the Unifi controller's certificate.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.defaults.hash_pii` {#opt-services.unpoller.unifi.defaults.hash_pii}

Hash, with md5, client names and MAC addresses. This attempts
to protect personally identifiable information.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.defaults.pass` {#opt-services.unpoller.unifi.defaults.pass}

Path of a file containing the password for the unifi service user.
This file needs to be readable by the unifi-poller user.

*Type:* absolute path

*Default:* `unpoller-unifi-default.password`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.defaults.save_alarms` {#opt-services.unpoller.unifi.defaults.save_alarms}

Collect and save data from UniFi alarms to influxdb and Loki.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.defaults.save_anomalies` {#opt-services.unpoller.unifi.defaults.save_anomalies}

Collect and save data from UniFi anomalies to influxdb and Loki.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.defaults.save_dpi` {#opt-services.unpoller.unifi.defaults.save_dpi}

Collect and save data from deep packet inspection.
Adds around 150 data points and impacts performance.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.defaults.save_events` {#opt-services.unpoller.unifi.defaults.save_events}

Collect and save data from UniFi events to influxdb and Loki.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.defaults.save_ids` {#opt-services.unpoller.unifi.defaults.save_ids}

Collect and save data from the intrusion detection system to influxdb and Loki.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.defaults.save_sites` {#opt-services.unpoller.unifi.defaults.save_sites}

Collect and save site data.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.defaults.sites` {#opt-services.unpoller.unifi.defaults.sites}

List of site names for which statistics should be exported.
Or the string "default" for the default site or the string "all" for all sites.

*Type:* one of "default", "all" or list of string

*Default:* `"all"`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.defaults.url` {#opt-services.unpoller.unifi.defaults.url}

URL of the Unifi controller.

*Type:* string

*Default:* `"https://unifi:8443"`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.defaults.user` {#opt-services.unpoller.unifi.defaults.user}

Unifi service user name.

*Type:* string

*Default:* `"unifi"`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.defaults.verify_ssl` {#opt-services.unpoller.unifi.defaults.verify_ssl}

Verify the Unifi controller's certificate.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.unpoller.unifi.dynamic` {#opt-services.unpoller.unifi.dynamic}

Let prometheus select which controller to poll when scraping.
Use with default credentials. See unifi-poller wiki for more.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/unpoller.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/unpoller.nix)

## `services.upki.enable` {#opt-services.upki.enable}

Whether to enable upki certificate infrastructure cache updates.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/upki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/upki.nix)

## `services.upki.interval` {#opt-services.upki.interval}

How often to update the upki cache.

*Type:* string

*Default:* `"2h"`

*Example:* `"1h"`

*Declared by:* [`nixos/modules/programs/upki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/upki.nix)

## `services.upki.package` {#opt-services.upki.package}

The upki package to use.

*Type:* package

*Default:* `pkgs.upki`

*Declared by:* [`nixos/modules/programs/upki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/upki.nix)

## `services.upki.settings` {#opt-services.upki.settings}

Settings written to the upki config file.

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  cache-dir = "/var/cache/upki";
  revocation.fetch-url = "https://upki.rustls.dev/revocation/";
}
```

*Declared by:* [`nixos/modules/programs/upki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/upki.nix)

## `services.upower.allowRiskyCriticalPowerAction` {#opt-services.upower.allowRiskyCriticalPowerAction}

Enable the risky critical power actions "Suspend" and "Ignore".

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/upower.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/upower.nix)

## `services.upower.criticalPowerAction` {#opt-services.upower.criticalPowerAction}

The action to take when `timeAction` or
`percentageAction` has been reached for the batteries
(UPS or laptop batteries) supplying the computer.

When set to `Suspend` or `Ignore`,
[`services.upower.allowRiskyCriticalPowerAction`](#opt-services.upower.allowRiskyCriticalPowerAction) must be set
to `true`.

*Type:* one of "PowerOff", "Hibernate", "HybridSleep", "Suspend", "Ignore"

*Default:* `"HybridSleep"`

*Declared by:* [`nixos/modules/services/hardware/upower.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/upower.nix)

## `services.upower.enable` {#opt-services.upower.enable}

Whether to enable Upower, a DBus service that provides power
management support to applications.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/upower.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/upower.nix)

## `services.upower.enableWattsUpPro` {#opt-services.upower.enableWattsUpPro}

Enable the Watts Up Pro device.

The Watts Up Pro contains a generic FTDI USB device without a specific
vendor and product ID. When we probe for WUP devices, we can cause
the user to get a perplexing "Device or resource busy" error when
attempting to use their non-WUP device.

The generic FTDI device is known to also be used on:

- Sparkfun FT232 breakout board
- Parallax Propeller

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/upower.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/upower.nix)

## `services.upower.ignoreLid` {#opt-services.upower.ignoreLid}

Do we ignore the lid state

Some laptops are broken. The lid state is either inverted, or stuck
on or off. We can't do much to fix these problems, but this is a way
for users to make the laptop panel vanish, a state that might be used
by a couple of user-space daemons. On Linux systems, see also
`logind.conf(5)`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/upower.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/upower.nix)

## `services.upower.noPollBatteries` {#opt-services.upower.noPollBatteries}

Don't poll the kernel for battery level changes.

Some hardware will send us battery level changes through
events, rather than us having to poll for it. This option
allows disabling polling for hardware that sends out events.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/upower.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/upower.nix)

## `services.upower.package` {#opt-services.upower.package}

The upower package to use.

*Type:* package

*Default:* `pkgs.upower`

*Declared by:* [`nixos/modules/services/hardware/upower.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/upower.nix)

## `services.upower.percentageAction` {#opt-services.upower.percentageAction}

When `usePercentageForPolicy` is
`true`, the levels at which UPower will take action
for the critical battery level.

This will also be used for batteries which don't have time information
such as that of peripherals.

If any value (of `percentageLow`,
`percentageCritical` and
`percentageAction`) is invalid, or not in descending
order, the defaults will be used.

*Type:* unsigned integer, meaning \>=0

*Default:* `2`

*Declared by:* [`nixos/modules/services/hardware/upower.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/upower.nix)

## `services.upower.percentageCritical` {#opt-services.upower.percentageCritical}

When `usePercentageForPolicy` is
`true`, the levels at which UPower will consider the
battery critical.

This will also be used for batteries which don't have time information
such as that of peripherals.

If any value (of `percentageLow`,
`percentageCritical` and
`percentageAction`) is invalid, or not in descending
order, the defaults will be used.

*Type:* unsigned integer, meaning \>=0

*Default:* `5`

*Declared by:* [`nixos/modules/services/hardware/upower.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/upower.nix)

## `services.upower.percentageLow` {#opt-services.upower.percentageLow}

When `usePercentageForPolicy` is
`true`, the levels at which UPower will consider the
battery low.

This will also be used for batteries which don't have time information
such as that of peripherals.

If any value (of `percentageLow`,
`percentageCritical` and
`percentageAction`) is invalid, or not in descending
order, the defaults will be used.

*Type:* unsigned integer, meaning \>=0

*Default:* `20`

*Declared by:* [`nixos/modules/services/hardware/upower.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/upower.nix)

## `services.upower.timeAction` {#opt-services.upower.timeAction}

When `usePercentageForPolicy` is
`false`, the time remaining in seconds at which
UPower will take action for the critical battery level.

If any value (of `timeLow`,
`timeCritical` and `timeAction`) is
invalid, or not in descending order, the defaults will be used.

*Type:* unsigned integer, meaning \>=0

*Default:* `120`

*Declared by:* [`nixos/modules/services/hardware/upower.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/upower.nix)

## `services.upower.timeCritical` {#opt-services.upower.timeCritical}

When `usePercentageForPolicy` is
`false`, the time remaining in seconds at which
UPower will consider the battery critical.

If any value (of `timeLow`,
`timeCritical` and `timeAction`) is
invalid, or not in descending order, the defaults will be used.

*Type:* unsigned integer, meaning \>=0

*Default:* `300`

*Declared by:* [`nixos/modules/services/hardware/upower.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/upower.nix)

## `services.upower.timeLow` {#opt-services.upower.timeLow}

When `usePercentageForPolicy` is
`false`, the time remaining in seconds at which
UPower will consider the battery low.

If any value (of `timeLow`,
`timeCritical` and `timeAction`) is
invalid, or not in descending order, the defaults will be used.

*Type:* unsigned integer, meaning \>=0

*Default:* `1200`

*Declared by:* [`nixos/modules/services/hardware/upower.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/upower.nix)

## `services.upower.usePercentageForPolicy` {#opt-services.upower.usePercentageForPolicy}

Policy for warnings and action based on battery levels

Whether battery percentage based policy should be used. The default
is to use the percentage, which
should work around broken firmwares. It is also more reliable than
the time left (frantically saving all your files is going to use more
battery than letting it rest for example).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/hardware/upower.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/upower.nix)

## `services.uptermd.enable` {#opt-services.uptermd.enable}

Whether to enable uptermd.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/uptermd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/uptermd.nix)

## `services.uptermd.extraFlags` {#opt-services.uptermd.extraFlags}

Extra flags passed to the uptermd command.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--debug"
]
```

*Declared by:* [`nixos/modules/services/networking/uptermd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/uptermd.nix)

## `services.uptermd.hostKey` {#opt-services.uptermd.hostKey}

Path to SSH host key. If not defined, an ed25519 keypair is generated automatically.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/upterm_host_ed25519_key"`

*Declared by:* [`nixos/modules/services/networking/uptermd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/uptermd.nix)

## `services.uptermd.listenAddress` {#opt-services.uptermd.listenAddress}

Address the server will listen on.

*Type:* string

*Default:* `"[::]"`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/uptermd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/uptermd.nix)

## `services.uptermd.openFirewall` {#opt-services.uptermd.openFirewall}

Whether to open the firewall for the port in [`services.uptermd.port`](#opt-services.uptermd.port).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/uptermd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/uptermd.nix)

## `services.uptermd.port` {#opt-services.uptermd.port}

Port the server will listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `2222`

*Declared by:* [`nixos/modules/services/networking/uptermd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/uptermd.nix)

## `services.uptime-kuma.appriseSupport` {#opt-services.uptime-kuma.appriseSupport}

Whether to enable apprise support for notifications.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/uptime-kuma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/uptime-kuma.nix)

## `services.uptime-kuma.enable` {#opt-services.uptime-kuma.enable}

Whether to enable Uptime Kuma, this assumes a reverse proxy to be set.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/uptime-kuma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/uptime-kuma.nix)

## `services.uptime-kuma.package` {#opt-services.uptime-kuma.package}

The uptime-kuma package to use.

*Type:* package

*Default:* `pkgs.uptime-kuma`

*Declared by:* [`nixos/modules/services/monitoring/uptime-kuma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/uptime-kuma.nix)

## `services.uptime-kuma.settings` {#opt-services.uptime-kuma.settings}

Additional configuration for Uptime Kuma, see
[https://github.com/louislam/uptime-kuma/wiki/Environment-Variables](https://github.com/louislam/uptime-kuma/wiki/Environment-Variables)
for supported values.

*Type:* open submodule of attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  NODE_EXTRA_CA_CERTS = {
    _type = "literalExpression";
    text = "config.security.pki.caBundle";
  };
  PORT = "4000";
  UPTIME_KUMA_DB_HOSTNAME = "localhost";
  UPTIME_KUMA_DB_NAME = "uptime-kuma";
  UPTIME_KUMA_DB_PASSWORD = "uptime-kuma";
  UPTIME_KUMA_DB_TYPE = "mariadb";
  UPTIME_KUMA_DB_USERNAME = "uptime-kuma";
}
```

*Declared by:* [`nixos/modules/services/monitoring/uptime-kuma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/uptime-kuma.nix)

## `services.uptimed.enable` {#opt-services.uptimed.enable}

Enable `uptimed`, allowing you to track
your highest uptimes.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/system/uptimed.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/uptimed.nix)

## `services.urserver.enable` {#opt-services.urserver.enable}

Whether to enable urserver.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/urserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/urserver.nix)

## `services.urxvtd.enable` {#opt-services.urxvtd.enable}

Enable urxvtd, the urxvt terminal daemon. To use urxvtd, run
"urxvtc".

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/x11/urxvtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/urxvtd.nix)

## `services.urxvtd.package` {#opt-services.urxvtd.package}

The rxvt-unicode package to use.

*Type:* package

*Default:* `pkgs.rxvt-unicode`

*Declared by:* [`nixos/modules/services/x11/urxvtd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/urxvtd.nix)

## `services.usbguard.IPCAllowedGroups` {#opt-services.usbguard.IPCAllowedGroups}

A list of groupnames that the daemon will accept IPC connections
from.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "wheel"
]
```

*Declared by:* [`nixos/modules/services/security/usbguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/usbguard.nix)

## `services.usbguard.IPCAllowedUsers` {#opt-services.usbguard.IPCAllowedUsers}

A list of usernames that the daemon will accept IPC connections from.

*Type:* list of string

*Default:*

``` nix
[
  "root"
]
```

*Example:*

``` nix
[
  "root"
  "yourusername"
]
```

*Declared by:* [`nixos/modules/services/security/usbguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/usbguard.nix)

## `services.usbguard.dbus.enable` {#opt-services.usbguard.dbus.enable}

Whether to enable USBGuard dbus daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/usbguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/usbguard.nix)

## `services.usbguard.deviceRulesWithPort` {#opt-services.usbguard.deviceRulesWithPort}

Generate device specific rules including the "via-port" attribute.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/usbguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/usbguard.nix)

## `services.usbguard.enable` {#opt-services.usbguard.enable}

Whether to enable USBGuard daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/usbguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/usbguard.nix)

## `services.usbguard.implicitPolicyTarget` {#opt-services.usbguard.implicitPolicyTarget}

How to treat USB devices that don't match any rule in the policy.
Target should be one of allow, block or reject (logically remove the
device node from the system).

*Type:* one of "allow", "block", "reject"

*Default:* `"block"`

*Declared by:* [`nixos/modules/services/security/usbguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/usbguard.nix)

## `services.usbguard.insertedDevicePolicy` {#opt-services.usbguard.insertedDevicePolicy}

How to treat USB devices that are already connected after the daemon
starts. One of block, reject, apply-policy.

*Type:* one of "block", "reject", "apply-policy"

*Default:* `"apply-policy"`

*Declared by:* [`nixos/modules/services/security/usbguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/usbguard.nix)

## `services.usbguard.package` {#opt-services.usbguard.package}

The usbguard package to use.

*Type:* package

*Default:* `pkgs.usbguard`

*Declared by:* [`nixos/modules/services/security/usbguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/usbguard.nix)

## `services.usbguard.presentControllerPolicy` {#opt-services.usbguard.presentControllerPolicy}

How to treat USB controller devices that are already connected when
the daemon starts. One of allow, block, reject, keep or apply-policy.

*Type:* one of "allow", "block", "reject", "keep", "apply-policy"

*Default:* `"keep"`

*Declared by:* [`nixos/modules/services/security/usbguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/usbguard.nix)

## `services.usbguard.presentDevicePolicy` {#opt-services.usbguard.presentDevicePolicy}

How to treat USB devices that are already connected when the daemon
starts. Policy should be one of allow, block, reject, keep (keep
whatever state the device is currently in) or apply-policy (evaluate
the rule set for every present device).

*Type:* one of "allow", "block", "reject", "keep", "apply-policy"

*Default:* `"apply-policy"`

*Declared by:* [`nixos/modules/services/security/usbguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/usbguard.nix)

## `services.usbguard.restoreControllerDeviceState` {#opt-services.usbguard.restoreControllerDeviceState}

The  USBGuard  daemon  modifies  some attributes of controller
devices like the default authorization state of new child device
instances. Using this setting, you can control whether the daemon
will try to restore the attribute values to the state before
modification on shutdown.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/usbguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/usbguard.nix)

## `services.usbguard.ruleFile` {#opt-services.usbguard.ruleFile}

This tells the USBGuard daemon which file to load as policy rule set.

The file can be changed manually or via the IPC interface assuming it has the right file permissions.

For more details see `usbguard-rules.conf(5)`.

*Type:* null or absolute path

*Default:* `"/var/lib/usbguard/rules.conf"`

*Example:* `"/run/secrets/usbguard-rules"`

*Declared by:* [`nixos/modules/services/security/usbguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/usbguard.nix)

## `services.usbguard.rules` {#opt-services.usbguard.rules}

The USBGuard daemon will load this as the policy rule set.
As these rules are NixOS managed they are immutable and can't
be changed by the IPC interface.

If you do not set this option, the USBGuard daemon will load
it's policy rule set from the option configured in `services.usbguard.ruleFile`.

Running `usbguard generate-policy` as root will
generate a config for your currently plugged in devices.

For more details see `usbguard-rules.conf(5)`.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Example:*

``` nix
''
  allow with-interface equals { 08:*:* }
''
```

*Declared by:* [`nixos/modules/services/security/usbguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/usbguard.nix)

## `services.usbmuxd.enable` {#opt-services.usbmuxd.enable}

Enable the usbmuxd ("USB multiplexing daemon") service. This daemon is
in charge of multiplexing connections over USB to an iOS device. This is
needed for transferring data from and to iOS devices (see ifuse). Also
this may enable plug-n-play tethering for iPhones.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/usbmuxd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/usbmuxd.nix)

## `services.usbmuxd.group` {#opt-services.usbmuxd.group}

The group usbmuxd should use to run after startup.

*Type:* string

*Default:* `"usbmux"`

*Declared by:* [`nixos/modules/services/hardware/usbmuxd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/usbmuxd.nix)

## `services.usbmuxd.package` {#opt-services.usbmuxd.package}

Which package to use for the usbmuxd daemon.

*Type:* package

*Default:* `pkgs.usbmuxd`

*Related packages:*

- [`pkgs.usbmuxd`](https://search.nixos.org/packages?show=usbmuxd&sort=relevance&query=usbmuxd)
- [`pkgs.usbmuxd2`](https://search.nixos.org/packages?show=usbmuxd2&sort=relevance&query=usbmuxd2)

*Declared by:* [`nixos/modules/services/hardware/usbmuxd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/usbmuxd.nix)

## `services.usbmuxd.user` {#opt-services.usbmuxd.user}

The user usbmuxd should use to run after startup.

*Type:* string

*Default:* `"usbmux"`

*Declared by:* [`nixos/modules/services/hardware/usbmuxd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/usbmuxd.nix)

## `services.usbrelayd.broker` {#opt-services.usbrelayd.broker}

Hostname or IP address of your MQTT Broker.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:*

``` nix
[
  "mqtt"
  "192.168.1.1"
]
```

*Declared by:* [`nixos/modules/services/hardware/usbrelayd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/usbrelayd.nix)

## `services.usbrelayd.clientName` {#opt-services.usbrelayd.clientName}

Name, your client connects as.

*Type:* string

*Default:* `"MyUSBRelay"`

*Declared by:* [`nixos/modules/services/hardware/usbrelayd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/usbrelayd.nix)

## `services.usbrelayd.enable` {#opt-services.usbrelayd.enable}

Whether to enable USB Relay MQTT daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/usbrelayd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/usbrelayd.nix)

## `services.userborn.enable` {#opt-services.userborn.enable}

Whether to enable userborn.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/system/userborn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/userborn.nix)

## `services.userborn.importLegacyState` {#opt-services.userborn.importLegacyState}

Whether to include one-shot migration services that import the state
left behind by the perl activation script (`update-users-groups.pl`),
so id and subid allocations survive the switch to userborn.

Disable this if you want to keep the migration tooling out of your
system closure.

*Type:* boolean

*Default:* `!config.services.userborn.static`

*Declared by:* [`nixos/modules/services/system/userborn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/userborn.nix)

## `services.userborn.package` {#opt-services.userborn.package}

The userborn package to use.

*Type:* package

*Default:* `pkgs.userborn`

*Declared by:* [`nixos/modules/services/system/userborn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/userborn.nix)

## `services.userborn.passwordFilesLocation` {#opt-services.userborn.passwordFilesLocation}

The location of the original password files.

If this is not `/etc`, the files are symlinked from this location to `/etc`.

The primary motivation for this is an immutable `/etc`, where we cannot
write the files directly to `/etc`.

However this can also serve other use cases, e.g. when `/etc` is on a `tmpfs`.

The subid files are an exception: `newuidmap` rejects symlinks, so
they are bind-mounted into `/etc` instead of being symlinked.

*Type:* string

*Default:* `if immutableEtc && !config.services.userborn.static then "/var/lib/nixos" else "/etc"`

*Declared by:* [`nixos/modules/services/system/userborn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/userborn.nix)

## `services.userborn.static` {#opt-services.userborn.static}

Whether to generate the password files at build time and store them directly
in the system closure, without requiring any services at boot time.

This is STRICTLY intended for embedded appliance images that only have system
users with manually managed static user IDs, and CANNOT be used with generation
updates.

WARNING: In this mode, you MUST statically manage user IDs yourself, carefully.
Beware, UID reuse is a serious security issue and it's your responsibility
to avoid it over the entire lifetime of the system.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/system/userborn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/userborn.nix)

## `services.userdbd.enable` {#opt-services.userdbd.enable}

Whether to enable the systemd JSON user/group record lookup service
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/userdbd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/userdbd.nix)

## `services.userdbd.enableSSHSupport` {#opt-services.userdbd.enableSSHSupport}

Whether to enable exposing OpenSSH public keys defined in userdb. Be aware that this
enables modifying public keys at runtime, either by users managed by
`services.homed`, or globally via drop-in files
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/userdbd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/userdbd.nix)

## `services.ustreamer.autoStart` {#opt-services.ustreamer.autoStart}

Wether to start µStreamer on boot. Disabling this will use socket
activation. The service will stop gracefully after some inactivity.
Disabling this will set `--exit-on-no-clients=300`

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/video/ustreamer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/ustreamer.nix)

## `services.ustreamer.device` {#opt-services.ustreamer.device}

The v4l2 device to stream.

*Type:* absolute path

*Default:* `"/dev/video0"`

*Example:* `"/dev/v4l/by-id/usb-0000_Dummy_abcdef-video-index0"`

*Declared by:* [`nixos/modules/services/video/ustreamer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/ustreamer.nix)

## `services.ustreamer.enable` {#opt-services.ustreamer.enable}

Whether to enable µStreamer, a lightweight MJPEG-HTTP streamer.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/video/ustreamer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/ustreamer.nix)

## `services.ustreamer.extraArgs` {#opt-services.ustreamer.extraArgs}

Extra arguments to pass to `ustreamer`. See `ustreamer(1)`

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--resolution=1920x1080"
]
```

*Declared by:* [`nixos/modules/services/video/ustreamer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/ustreamer.nix)

## `services.ustreamer.listenAddress` {#opt-services.ustreamer.listenAddress}

Address to expose the HTTP server. This accepts values for
ListenStream= defined in `systemd.socket(5)`

*Type:* string

*Default:* `"0.0.0.0:8080"`

*Example:* `"/run/ustreamer.sock"`

*Declared by:* [`nixos/modules/services/video/ustreamer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/ustreamer.nix)

## `services.ustreamer.package` {#opt-services.ustreamer.package}

The ustreamer package to use.

*Type:* package

*Default:* `pkgs.ustreamer`

*Declared by:* [`nixos/modules/services/video/ustreamer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/ustreamer.nix)

## `services.uvcvideo.dynctrl.enable` {#opt-services.uvcvideo.dynctrl.enable}

Whether to enable `uvcvideo` dynamic controls.

Note that enabling this brings the `uvcdynctrl` tool
into your environment and register all dynamic controls from
specified `packages` to the `uvcvideo` driver.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/video/uvcvideo/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/uvcvideo/default.nix)

## `services.uvcvideo.dynctrl.packages` {#opt-services.uvcvideo.dynctrl.packages}

List of packages containing `uvcvideo` dynamic controls
rules. All files found in
`«pkg»/share/uvcdynctrl/data`
will be included.

Note that these will serve as input to the `libwebcam`
package which through its own `udev` rule will register
the dynamic controls from specified packages to the `uvcvideo`
driver.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:* `[ pkgs.tiscamera ]`

*Declared by:* [`nixos/modules/hardware/video/uvcvideo/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/uvcvideo/default.nix)

## `services.uwsgi.capabilities` {#opt-services.uwsgi.capabilities}

Grant capabilities to the uWSGI instance. See the
`capabilities(7)` for available values.

::: note
uWSGI runs as an unprivileged user (even as Emperor) with the minimal
capabilities required. This option can be used to add fine-grained
permissions without running the service as root.

When in Emperor mode, any capability to be inherited by a vassal must
be specified again in the vassal configuration using `cap`.
See the uWSGI [docs](https://uwsgi-docs.readthedocs.io/en/latest/Capabilities.html)
for more information.
:::

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "CAP_NET_BIND_SERVICE" # bind on ports <1024
  "CAP_NET_RAW"          # open raw sockets
]
```

*Declared by:* [`nixos/modules/services/web-servers/uwsgi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/uwsgi.nix)

## `services.uwsgi.enable` {#opt-services.uwsgi.enable}

Enable uWSGI

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/uwsgi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/uwsgi.nix)

## `services.uwsgi.group` {#opt-services.uwsgi.group}

Group account under which uWSGI runs.

*Type:* string

*Default:* `"uwsgi"`

*Declared by:* [`nixos/modules/services/web-servers/uwsgi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/uwsgi.nix)

## `services.uwsgi.instance` {#opt-services.uwsgi.instance}

uWSGI configuration. It awaits an attribute `type` inside which can be either
`normal` or `emperor`.

For `normal` mode you can specify `pythonPackages` as a function
from libraries set into a list of libraries. `pythonpath` will be set accordingly.

For `emperor` mode, you should use `vassals` attribute
which should be either a set of names and configurations or a path to a directory.

Other attributes will be used in configuration file as-is. Notice that you can redefine
`plugins` setting here.

*Type:* Json value or lambda

*Default:*

``` nix
{
  type = "normal";
}
```

*Example:*

``` nix
{
  type = "emperor";
  vassals = {
    moin = {
      type = "normal";
      pythonPackages = self: with self; [ moinmoin ];
      socket = "${config.services.uwsgi.runDir}/uwsgi.sock";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/web-servers/uwsgi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/uwsgi.nix)

## `services.uwsgi.plugins` {#opt-services.uwsgi.plugins}

Plugins used with uWSGI

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-servers/uwsgi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/uwsgi.nix)

## `services.uwsgi.runDir` {#opt-services.uwsgi.runDir}

Where uWSGI communication sockets can live

*Type:* absolute path

*Default:* `"/run/uwsgi"`

*Declared by:* [`nixos/modules/services/web-servers/uwsgi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/uwsgi.nix)

## `services.uwsgi.user` {#opt-services.uwsgi.user}

User account under which uWSGI runs.

*Type:* string

*Default:* `"uwsgi"`

*Declared by:* [`nixos/modules/services/web-servers/uwsgi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/uwsgi.nix)
