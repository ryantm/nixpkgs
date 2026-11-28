# services (I) {#sec-options-services-i}

## `services.i2p.enable` {#opt-services.i2p.enable}

Whether to enable I2P router.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/i2p.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2p.nix)

## `services.i2pd.autoRestart` {#opt-services.i2pd.autoRestart}

If true, i2pd will be restarted on failure (does not affect clean exit)

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.checkConfig` {#opt-services.i2pd.checkConfig}

Whether to check the configuration at build time by starting i2pd.

i2pd has no parse-only mode, so this check can fail when configured
listen addresses are unavailable in the build environment.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.clientTunnels` {#opt-services.i2pd.clientTunnels}

Free-form "client" tunnels. Options are passed to `tunnels.conf`.
Mnemonic: we connect to someone as a client.
See [https://i2pd.readthedocs.io/en/latest/user-guide/tunnels/#client-tunnels](https://i2pd.readthedocs.io/en/latest/user-guide/tunnels/#client-tunnels)

*Type:* attribute set of (open submodule of nested (bool, int, string or list of bool, int or string))

*Default:* `{ }`

*Example:*

``` nix
{
  "irc-ilita" = {
    address = "127.0.0.1";
    port = 6668;
    destination = "irc.ilita.i2p";
    destinationport = 6667;
    keys = "irc-keys.dat";
    i2p.streaming.profile = "interactive";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.clientTunnels.<name>.destination` {#opt-services.i2pd.clientTunnels._name_.destination}

Remote endpoint, I2P hostname or b32.i2p address

*Type:* string or (attribute set)

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.clientTunnels.<name>.i2cp.leaseSetAuthType` {#opt-services.i2pd.clientTunnels._name_.i2cp.leaseSetAuthType}

Authentication type for encrypted LeaseSet

*Type:* null or (signed integer or (one of "DH", "PSK", "none") convertible to it)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.clientTunnels.<name>.i2cp.leaseSetEncType` {#opt-services.i2pd.clientTunnels._name_.i2cp.leaseSetEncType}

List of LeaseSet encryption types

*Type:* null or (signed integer or (one of "ECIES\_MLKEM1024\_X25519\_AEAD", "ECIES\_MLKEM512\_X25519\_AEAD", "ECIES\_MLKEM768\_X25519\_AEAD", "ECIES\_P256\_SHA256\_AES256CBC", "ECIES\_X25519\_AEAD", "ELGAMAL") convertible to it)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.clientTunnels.<name>.i2cp.leaseSetType` {#opt-services.i2pd.clientTunnels._name_.i2cp.leaseSetType}

Type of LeaseSet to be sent

*Type:* null or (signed integer or (one of "encrypted", "standard") convertible to it)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.clientTunnels.<name>.i2p.streaming.profile` {#opt-services.i2pd.clientTunnels._name_.i2p.streaming.profile}

Bandwidth usage profile

*Type:* null or (signed integer or (one of "bulk", "interactive") convertible to it)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.clientTunnels.<name>.port` {#opt-services.i2pd.clientTunnels._name_.port}

Port of client tunnel (on this port i2pd will receive data)

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.clientTunnels.<name>.signaturetype` {#opt-services.i2pd.clientTunnels._name_.signaturetype}

Signature type for new keys.
`ED25519-SHA512` is default.
`RED25519-SHA512` is recommended for encrypted leaseset.

*Type:* null or (signed integer or (one of "ECDSA-P256", "ECDSA-P384", "ECDSA-P521", "ED25519-SHA512", "GOSTR3410-A-GOSTR3411-256", "GOSTR3410-TC26-A-GOSTR3411-512", "ML-DSA-44", "RED25519-SHA512") convertible to it)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.clientTunnels.<name>.type` {#opt-services.i2pd.clientTunnels._name_.type}

Type of client tunnel.
See [https://docs.i2pd.website/en/latest/user-guide/tunnels/#tunnel-types](https://docs.i2pd.website/en/latest/user-guide/tunnels/#tunnel-types).

*Type:* string

*Default:* `"client"`

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.enable` {#opt-services.i2pd.enable}

Whether to enable `i2pd` (I2P network router).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.gracefulShutdown` {#opt-services.i2pd.gracefulShutdown}

If true, i2pd will wait for transit connections to close.
Enabling this option **may delay system shutdown/reboot/rebuild-switch up to 10 minutes!**

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.mkSecret` {#opt-services.i2pd.mkSecret}

Deprecated. Use `{ _secret = <path>; }` directly

*Type:* anything

*Default:* `<function>`

*Read only*

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.package` {#opt-services.i2pd.package}

The i2pd package to use.

*Type:* package

*Default:* `pkgs.i2pd`

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.serverTunnels` {#opt-services.i2pd.serverTunnels}

Free-form "server" tunnels. Options are passed to `tunnels.conf`.
Mnemonic: we serving some service to others.
See [https://i2pd.readthedocs.io/en/latest/user-guide/tunnels/#servergeneric-tunnels](https://i2pd.readthedocs.io/en/latest/user-guide/tunnels/#servergeneric-tunnels)

*Type:* attribute set of (open submodule of nested (bool, int, string or list of bool, int or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.serverTunnels.<name>.host` {#opt-services.i2pd.serverTunnels._name_.host}

IP address of server (on this address i2pd will send data from I2P)

*Type:* string or (attribute set)

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.serverTunnels.<name>.i2cp.leaseSetAuthType` {#opt-services.i2pd.serverTunnels._name_.i2cp.leaseSetAuthType}

Authentication type for encrypted LeaseSet

*Type:* null or (signed integer or (one of "DH", "PSK", "none") convertible to it)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.serverTunnels.<name>.i2cp.leaseSetEncType` {#opt-services.i2pd.serverTunnels._name_.i2cp.leaseSetEncType}

List of LeaseSet encryption types

*Type:* null or (signed integer or (one of "ECIES\_MLKEM1024\_X25519\_AEAD", "ECIES\_MLKEM512\_X25519\_AEAD", "ECIES\_MLKEM768\_X25519\_AEAD", "ECIES\_P256\_SHA256\_AES256CBC", "ECIES\_X25519\_AEAD", "ELGAMAL") convertible to it)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.serverTunnels.<name>.i2cp.leaseSetType` {#opt-services.i2pd.serverTunnels._name_.i2cp.leaseSetType}

Type of LeaseSet to be sent

*Type:* null or (signed integer or (one of "encrypted", "standard") convertible to it)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.serverTunnels.<name>.i2p.streaming.profile` {#opt-services.i2pd.serverTunnels._name_.i2p.streaming.profile}

Bandwidth usage profile

*Type:* null or (signed integer or (one of "bulk", "interactive") convertible to it)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.serverTunnels.<name>.port` {#opt-services.i2pd.serverTunnels._name_.port}

Port of server tunnel (on this port i2pd will send data from I2P)

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.serverTunnels.<name>.signaturetype` {#opt-services.i2pd.serverTunnels._name_.signaturetype}

Signature type for new keys.
`ED25519-SHA512` is default.
`RED25519-SHA512` is recommended for encrypted leaseset.

*Type:* null or (signed integer or (one of "ECDSA-P256", "ECDSA-P384", "ECDSA-P521", "ED25519-SHA512", "GOSTR3410-A-GOSTR3411-256", "GOSTR3410-TC26-A-GOSTR3411-512", "ML-DSA-44", "RED25519-SHA512") convertible to it)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.serverTunnels.<name>.type` {#opt-services.i2pd.serverTunnels._name_.type}

Type of server tunnel.
See [https://docs.i2pd.website/en/latest/user-guide/tunnels/#tunnel-types](https://docs.i2pd.website/en/latest/user-guide/tunnels/#tunnel-types).

*Type:* string

*Default:* `"server"`

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.settings` {#opt-services.i2pd.settings}

Free-form main i2pd configuration. Options are passed to `i2pd.conf`.
See [https://i2pd.readthedocs.io/en/latest/user-guide/configuration/](https://i2pd.readthedocs.io/en/latest/user-guide/configuration/)

Any free-formed option value can be substituted with contents of a
provided file by setting it to `{ _secret = <path>; }`. The
file is read **at runtime** before i2pd service starts, file
permissions are ignored.

*Type:* open submodule of nested (bool, int, string or list of bool, int or string)

*Default:* `{ }`

*Example:*

``` nix
{
  meshnets.yggdrasil = true; # Enable yggdrasil network support

  port = {
    _secret = "/run/secrets/i2pd-port";
    _secretPlaceholder = 0; # An optional placeholder value used when checking configuration
  };
}
```

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.settings.bandwidth` {#opt-services.i2pd.settings.bandwidth}

Set a router bandwidth limit: integer in KBps or alias.
Note that integer bandwidth will be rounded.
If not set, i2pd defaults to `32KBps`.

*Type:* null or ((positive integer, meaning \>0, or one of "L", "O", "P", "X") or (one of "2048KBps", "256KBps", "32KBps", "UNLIMITED") convertible to it)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.i2pd.settings.loglevel` {#opt-services.i2pd.settings.loglevel}

The log level

*Type:* one of "debug", "info", "warn", "error", "critical", "none"

*Default:* `"error"`

*Declared by:* [`nixos/modules/services/networking/i2pd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/i2pd.nix)

## `services.icecast.admin.password` {#opt-services.icecast.admin.password}

Password used for all administration functions.

*Type:* string

*Declared by:* [`nixos/modules/services/audio/icecast.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/icecast.nix)

## `services.icecast.admin.user` {#opt-services.icecast.admin.user}

Username used for all administration functions.

*Type:* string

*Default:* `"admin"`

*Declared by:* [`nixos/modules/services/audio/icecast.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/icecast.nix)

## `services.icecast.enable` {#opt-services.icecast.enable}

Whether to enable Icecast server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/icecast.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/icecast.nix)

## `services.icecast.extraConfig` {#opt-services.icecast.extraConfig}

Extra configuration added to `icecast.xml` inside the `<icecast>` element.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/audio/icecast.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/icecast.nix)

## `services.icecast.hostname` {#opt-services.icecast.hostname}

DNS name or IP address that will be used for the stream directory lookups or possibly the playlist generation if a Host header is not provided.

*Type:* null or string

*Default:* `config.networking.domain`

*Declared by:* [`nixos/modules/services/audio/icecast.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/icecast.nix)

## `services.icecast.listen.address` {#opt-services.icecast.listen.address}

Address Icecast will listen on.

*Type:* string

*Default:* `"::"`

*Declared by:* [`nixos/modules/services/audio/icecast.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/icecast.nix)

## `services.icecast.listen.port` {#opt-services.icecast.listen.port}

TCP port that will be used to accept client connections.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8000`

*Declared by:* [`nixos/modules/services/audio/icecast.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/icecast.nix)

## `services.icecream.daemon.cacheLimit` {#opt-services.icecream.daemon.cacheLimit}

Maximum size in Megabytes of cache used to store compile environments of compile clients.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `256`

*Declared by:* [`nixos/modules/services/networking/icecream/daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/icecream/daemon.nix)

## `services.icecream.daemon.enable` {#opt-services.icecream.daemon.enable}

Whether to enable Icecream Daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/icecream/daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/icecream/daemon.nix)

## `services.icecream.daemon.extraArgs` {#opt-services.icecream.daemon.extraArgs}

Additional command line parameters.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-v"
]
```

*Declared by:* [`nixos/modules/services/networking/icecream/daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/icecream/daemon.nix)

## `services.icecream.daemon.hostname` {#opt-services.icecream.daemon.hostname}

Hostname of the daemon in the icecream infrastructure.

Uses the hostname retrieved via uname if set to null.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/icecream/daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/icecream/daemon.nix)

## `services.icecream.daemon.maxProcesses` {#opt-services.icecream.daemon.maxProcesses}

Maximum number of compile jobs started in parallel for this daemon.

Uses the number of CPUs if set to null.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/icecream/daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/icecream/daemon.nix)

## `services.icecream.daemon.netName` {#opt-services.icecream.daemon.netName}

Network name to connect to. A scheduler with the same name needs to be running.

*Type:* string

*Default:* `"ICECREAM"`

*Declared by:* [`nixos/modules/services/networking/icecream/daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/icecream/daemon.nix)

## `services.icecream.daemon.nice` {#opt-services.icecream.daemon.nice}

The level of niceness to use.

*Type:* integer between -20 and 19 (both inclusive)

*Default:* `5`

*Declared by:* [`nixos/modules/services/networking/icecream/daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/icecream/daemon.nix)

## `services.icecream.daemon.noRemote` {#opt-services.icecream.daemon.noRemote}

Prevent jobs from other nodes being scheduled on this daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/icecream/daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/icecream/daemon.nix)

## `services.icecream.daemon.openBroadcast` {#opt-services.icecream.daemon.openBroadcast}

Whether to automatically open the firewall for scheduler discovery.

*Type:* boolean

*Declared by:* [`nixos/modules/services/networking/icecream/daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/icecream/daemon.nix)

## `services.icecream.daemon.openFirewall` {#opt-services.icecream.daemon.openFirewall}

Whether to automatically open receive port in the firewall.

*Type:* boolean

*Declared by:* [`nixos/modules/services/networking/icecream/daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/icecream/daemon.nix)

## `services.icecream.daemon.package` {#opt-services.icecream.daemon.package}

The icecream package to use.

*Type:* package

*Default:* `pkgs.icecream`

*Declared by:* [`nixos/modules/services/networking/icecream/daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/icecream/daemon.nix)

## `services.icecream.daemon.schedulerHost` {#opt-services.icecream.daemon.schedulerHost}

Explicit scheduler hostname, useful in firewalled environments.

Uses scheduler autodiscovery via broadcast if set to null.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/icecream/daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/icecream/daemon.nix)

## `services.icecream.daemon.user` {#opt-services.icecream.daemon.user}

User to run the icecream daemon as. Set to root to enable receive of
remote compile environments.

*Type:* string

*Default:* `"icecc"`

*Declared by:* [`nixos/modules/services/networking/icecream/daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/icecream/daemon.nix)

## `services.icecream.scheduler.enable` {#opt-services.icecream.scheduler.enable}

Whether to enable Icecream Scheduler.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/icecream/scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/icecream/scheduler.nix)

## `services.icecream.scheduler.extraArgs` {#opt-services.icecream.scheduler.extraArgs}

Additional command line parameters

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-v"
]
```

*Declared by:* [`nixos/modules/services/networking/icecream/scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/icecream/scheduler.nix)

## `services.icecream.scheduler.netName` {#opt-services.icecream.scheduler.netName}

Network name for the icecream scheduler.

Uses the default ICECREAM if null.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/icecream/scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/icecream/scheduler.nix)

## `services.icecream.scheduler.openFirewall` {#opt-services.icecream.scheduler.openFirewall}

Whether to automatically open the daemon port in the firewall.

*Type:* boolean

*Declared by:* [`nixos/modules/services/networking/icecream/scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/icecream/scheduler.nix)

## `services.icecream.scheduler.openTelnet` {#opt-services.icecream.scheduler.openTelnet}

Whether to open the telnet TCP port on 8766.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/icecream/scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/icecream/scheduler.nix)

## `services.icecream.scheduler.package` {#opt-services.icecream.scheduler.package}

The icecream package to use.

*Type:* package

*Default:* `pkgs.icecream`

*Declared by:* [`nixos/modules/services/networking/icecream/scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/icecream/scheduler.nix)

## `services.icecream.scheduler.persistentClientConnection` {#opt-services.icecream.scheduler.persistentClientConnection}

Whether to prevent clients from connecting to a better scheduler.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/icecream/scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/icecream/scheduler.nix)

## `services.icecream.scheduler.port` {#opt-services.icecream.scheduler.port}

Server port to listen for icecream daemon requests.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8765`

*Declared by:* [`nixos/modules/services/networking/icecream/scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/icecream/scheduler.nix)

## `services.icingaweb2.authentications` {#opt-services.icingaweb2.authentications}

authentication.ini contents.
Will automatically be converted to a .ini file.

If the value is null, no authentication.ini is created and you can
modify it manually (e.g. via the web interface).

*Type:* null or (attribute set)

*Default:* `null`

*Example:*

``` nix
{
  icingaweb = {
    backend = "db";
    resource = "icingaweb_db";
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix)

## `services.icingaweb2.enable` {#opt-services.icingaweb2.enable}

Whether to enable the icingaweb2 web interface.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix)

## `services.icingaweb2.generalConfig` {#opt-services.icingaweb2.generalConfig}

config.ini contents.
Will automatically be converted to a .ini file.
If you don't set global.module\_path, the module will take care of it.

If the value is null, no config.ini is created and you can
modify it manually (e.g. via the web interface).
Note that you need to update module\_path manually.

*Type:* null or (attribute set)

*Default:* `null`

*Example:*

``` nix
{
  general = {
    config_resource = "icingaweb_db";
    showStacktraces = 1;
  };
  logging = {
    level = "CRITICAL";
    log = "syslog";
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix)

## `services.icingaweb2.groupBackends` {#opt-services.icingaweb2.groupBackends}

groups.ini contents.
Will automatically be converted to a .ini file.

If the value is null, no groups.ini is created and you can
modify it manually (e.g. via the web interface).

*Type:* null or (attribute set)

*Default:* `null`

*Example:*

``` nix
{
  icingaweb = {
    backend = "db";
    resource = "icingaweb_db";
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix)

## `services.icingaweb2.libraryPaths` {#opt-services.icingaweb2.libraryPaths}

Libraries to add to the Icingaweb2 library path.
The name of the attribute is the name of the library, the value
is the package to add.

*Type:* attribute set of package

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix)

## `services.icingaweb2.modulePackages` {#opt-services.icingaweb2.modulePackages}

Name-package attrset of Icingaweb 2 modules packages to enable.

If you enable modules manually (e.g. via the web ui), they will not be touched.

*Type:* attribute set of package

*Default:* `{ }`

*Example:*

``` nix
{
  "snow" = icingaweb2Modules.theme-snow;
}
```

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix)

## `services.icingaweb2.modules.doc.enable` {#opt-services.icingaweb2.modules.doc.enable}

Whether to enable the icingaweb2 doc module.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix)

## `services.icingaweb2.modules.migrate.enable` {#opt-services.icingaweb2.modules.migrate.enable}

Whether to enable the icingaweb2 migrate module.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix)

## `services.icingaweb2.modules.monitoring.backends` {#opt-services.icingaweb2.modules.monitoring.backends}

Monitoring backends to define

*Type:* attribute set of (submodule)

*Default:*

``` nix
{
  icinga = {
    resource = "icinga_ido";
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix)

## `services.icingaweb2.modules.monitoring.backends.<name>.disabled` {#opt-services.icingaweb2.modules.monitoring.backends._name_.disabled}

Disable this backend

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix)

## `services.icingaweb2.modules.monitoring.backends.<name>.resource` {#opt-services.icingaweb2.modules.monitoring.backends._name_.resource}

Name of the IDO resource

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix)

## `services.icingaweb2.modules.monitoring.enable` {#opt-services.icingaweb2.modules.monitoring.enable}

Whether to enable the icingaweb2 monitoring module.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix)

## `services.icingaweb2.modules.monitoring.generalConfig.mutable` {#opt-services.icingaweb2.modules.monitoring.generalConfig.mutable}

Make config.ini of the monitoring module mutable (e.g. via the web interface).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix)

## `services.icingaweb2.modules.monitoring.generalConfig.protectedVars` {#opt-services.icingaweb2.modules.monitoring.generalConfig.protectedVars}

List of string patterns for custom variables which should be excluded from user’s view.

*Type:* list of string

*Default:*

``` nix
[
  "*pw*"
  "*pass*"
  "community"
]
```

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix)

## `services.icingaweb2.modules.monitoring.mutableBackends` {#opt-services.icingaweb2.modules.monitoring.mutableBackends}

Make backends.ini of the monitoring module mutable (e.g. via the web interface).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix)

## `services.icingaweb2.modules.monitoring.mutableTransports` {#opt-services.icingaweb2.modules.monitoring.mutableTransports}

Make commandtransports.ini of the monitoring module mutable (e.g. via the web interface).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix)

## `services.icingaweb2.modules.monitoring.transports` {#opt-services.icingaweb2.modules.monitoring.transports}

Command transports to define

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix)

## `services.icingaweb2.modules.monitoring.transports.<name>.host` {#opt-services.icingaweb2.modules.monitoring.transports._name_.host}

Host for the api or remote transport

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix)

## `services.icingaweb2.modules.monitoring.transports.<name>.instance` {#opt-services.icingaweb2.modules.monitoring.transports._name_.instance}

Assign a icinga instance to this transport

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix)

## `services.icingaweb2.modules.monitoring.transports.<name>.password` {#opt-services.icingaweb2.modules.monitoring.transports._name_.password}

Password for the api transport

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix)

## `services.icingaweb2.modules.monitoring.transports.<name>.path` {#opt-services.icingaweb2.modules.monitoring.transports._name_.path}

Path to the socket for local or remote transports

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix)

## `services.icingaweb2.modules.monitoring.transports.<name>.port` {#opt-services.icingaweb2.modules.monitoring.transports._name_.port}

Port to connect to for the api or remote transport

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix)

## `services.icingaweb2.modules.monitoring.transports.<name>.resource` {#opt-services.icingaweb2.modules.monitoring.transports._name_.resource}

SSH identity resource for the remote transport

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix)

## `services.icingaweb2.modules.monitoring.transports.<name>.type` {#opt-services.icingaweb2.modules.monitoring.transports._name_.type}

Type of  this transport

*Type:* one of "api", "local", "remote"

*Default:* `"api"`

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix)

## `services.icingaweb2.modules.monitoring.transports.<name>.username` {#opt-services.icingaweb2.modules.monitoring.transports._name_.username}

Username for the api or remote transport

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/module-monitoring.nix)

## `services.icingaweb2.modules.setup.enable` {#opt-services.icingaweb2.modules.setup.enable}

Whether to enable the icingaweb2 setup module.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix)

## `services.icingaweb2.modules.test.enable` {#opt-services.icingaweb2.modules.test.enable}

Whether to enable the icingaweb2 test module.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix)

## `services.icingaweb2.modules.translation.enable` {#opt-services.icingaweb2.modules.translation.enable}

Whether to enable the icingaweb2 translation module.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix)

## `services.icingaweb2.pool` {#opt-services.icingaweb2.pool}

Name of existing PHP-FPM pool that is used to run Icingaweb2.
If not specified, a pool will automatically created with default values.

*Type:* string

*Default:* `"icingaweb2"`

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix)

## `services.icingaweb2.resources` {#opt-services.icingaweb2.resources}

resources.ini contents.
Will automatically be converted to a .ini file.

If the value is null, no resources.ini is created and you can
modify it manually (e.g. via the web interface).
Note that if you set passwords here, they will go into the nix store.

*Type:* null or (attribute set)

*Default:* `null`

*Example:*

``` nix
{
  icingaweb_db = {
    db = "mysql";
    dbname = "icingaweb2";
    host = "localhost";
    password = "icingaweb2";
    type = "db";
    username = "icingaweb2";
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix)

## `services.icingaweb2.roles` {#opt-services.icingaweb2.roles}

roles.ini contents.
Will automatically be converted to a .ini file.

If the value is null, no roles.ini is created and you can
modify it manually (e.g. via the web interface).

*Type:* null or (attribute set)

*Default:* `null`

*Example:*

``` nix
{
  Administrators = {
    permissions = "*";
    users = "admin";
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix)

## `services.icingaweb2.timezone` {#opt-services.icingaweb2.timezone}

PHP-compliant timezone specification

*Type:* string

*Default:* `"UTC"`

*Example:* `"Europe/Berlin"`

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix)

## `services.icingaweb2.virtualHost` {#opt-services.icingaweb2.virtualHost}

Name of the nginx virtualhost to use and setup. If null, no virtualhost is set up.

*Type:* null or string

*Default:* `"icingaweb2"`

*Declared by:* [`nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/icingaweb2/icingaweb2.nix)

## `services.ifm.dataDir` {#opt-services.ifm.dataDir}

Directory to serve throught the file managing service

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/ifm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ifm.nix)

## `services.ifm.enable` {#opt-services.ifm.enable}

Whether to enable Improved file manager, a single-file web-based filemanager

Lightweight and minimal, served using PHP's built-in server
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/ifm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ifm.nix)

## `services.ifm.listenAddress` {#opt-services.ifm.listenAddress}

Address on which the service is listening

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/web-apps/ifm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ifm.nix)

## `services.ifm.port` {#opt-services.ifm.port}

Port on which to serve the IFM service

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9090`

*Declared by:* [`nixos/modules/services/web-apps/ifm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ifm.nix)

## `services.ifm.settings` {#opt-services.ifm.settings}

Configuration of the IFM service.

See [the documentation](https://github.com/misterunknown/ifm/wiki/Configuration)
for available options and default values.

*Type:* attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  IFM_GUI_SHOWPATH = 0;
}
```

*Declared by:* [`nixos/modules/services/web-apps/ifm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ifm.nix)

## `services.ihaskell.enable` {#opt-services.ihaskell.enable}

Autostart an IHaskell notebook service.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/ihaskell.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ihaskell.nix)

## `services.ihaskell.extraPackages` {#opt-services.ihaskell.extraPackages}

Extra packages available to ghc when running ihaskell. The
value must be a function which receives the attrset defined
in `haskellPackages` as the sole argument.

*Type:* function that evaluates to a(n) list of package

*Default:* `haskellPackages: []`

*Example:*

``` nix
haskellPackages: [
  haskellPackages.wreq
  haskellPackages.lens
]
```

*Declared by:* [`nixos/modules/services/misc/ihaskell.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ihaskell.nix)

## `services.iio-niri.enable` {#opt-services.iio-niri.enable}

Whether to enable IIO-Niri.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/iio-niri.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/iio-niri.nix)

## `services.iio-niri.extraArgs` {#opt-services.iio-niri.extraArgs}

Extra arguments to pass to `iio-niri listen`.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/iio-niri.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/iio-niri.nix)

## `services.iio-niri.niriUnit` {#opt-services.iio-niri.niriUnit}

The Niri **user** service unit to bind IIO-Niri's **user** service unit to.

*Type:* non-empty string

*Default:* `"niri.service"`

*Declared by:* [`nixos/modules/services/misc/iio-niri.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/iio-niri.nix)

## `services.iio-niri.package` {#opt-services.iio-niri.package}

The iio-niri package to use.

*Type:* package

*Default:* `pkgs.iio-niri`

*Declared by:* [`nixos/modules/services/misc/iio-niri.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/iio-niri.nix)

## `services.illum.enable` {#opt-services.illum.enable}

Enable illum, a daemon for controlling screen brightness with brightness buttons.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/illum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/illum.nix)

## `services.imaginary.address` {#opt-services.imaginary.address}

Bind address. Corresponds to the `-a` flag.
Set to `""` to bind to all addresses.

*Type:* string

*Default:* `"localhost"`

*Example:* `"[::1]"`

*Declared by:* [`nixos/modules/services/networking/imaginary.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/imaginary.nix)

## `services.imaginary.enable` {#opt-services.imaginary.enable}

Whether to enable imaginary image processing microservice.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/imaginary.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/imaginary.nix)

## `services.imaginary.port` {#opt-services.imaginary.port}

Bind port. Corresponds to the `-p` flag.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8088`

*Declared by:* [`nixos/modules/services/networking/imaginary.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/imaginary.nix)

## `services.imaginary.settings` {#opt-services.imaginary.settings}

Command line arguments passed to the imaginary executable, stripped of
the prefix `-`. See upstream's
[README](https://github.com/h2non/imaginary#command-line-usage) for all
options.

*Type:* open submodule of attribute set of (boolean or signed integer or non-empty (list of string) or string)

*Declared by:* [`nixos/modules/services/networking/imaginary.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/imaginary.nix)

## `services.imaginary.settings.return-size` {#opt-services.imaginary.settings.return-size}

Return the image size in the HTTP headers.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/imaginary.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/imaginary.nix)

## `services.immich-kiosk.enable` {#opt-services.immich-kiosk.enable}

Whether to enable Immich Kiosk slideshow service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/immich-kiosk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich-kiosk.nix)

## `services.immich-kiosk.openFirewall` {#opt-services.immich-kiosk.openFirewall}

Whether to open the firewall for the immich-kiosk port.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/immich-kiosk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich-kiosk.nix)

## `services.immich-kiosk.package` {#opt-services.immich-kiosk.package}

The immich-kiosk package to use.

*Type:* package

*Default:* `pkgs.immich-kiosk`

*Declared by:* [`nixos/modules/services/web-apps/immich-kiosk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich-kiosk.nix)

## `services.immich-kiosk.settings` {#opt-services.immich-kiosk.settings}

Configuration for immich-kiosk. See
[https://docs.immichkiosk.app/configuration/](https://docs.immichkiosk.app/configuration/)
for available options. Secret values can be loaded from files using
`._secret = "/path/to/secret";`.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Example:*

``` nix
{
  immich_url = "https://immich.example.com";
  immich_api_key._secret = "/run/secrets/immich-kiosk-api-key";
  albums = [
    "4fa933cf-051f-4621-9ac7-8d06776c261c"
    "6466548c-4995-4fb5-ab1f-f63cc9ff3e5f"
  ];
  duration = 30;
  layout = "splitview";
  disable_ui = true;
}
```

*Declared by:* [`nixos/modules/services/web-apps/immich-kiosk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich-kiosk.nix)

## `services.immich-kiosk.settings.immich_url` {#opt-services.immich-kiosk.settings.immich_url}

URL of the immich instance.

*Type:* string

*Default:* `config.services.immich.settings.server.externalDomain`

*Declared by:* [`nixos/modules/services/web-apps/immich-kiosk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich-kiosk.nix)

## `services.immich-kiosk.settings.kiosk.port` {#opt-services.immich-kiosk.settings.kiosk.port}

Port on which immich-kiosk will listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/web-apps/immich-kiosk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich-kiosk.nix)

## `services.immich-public-proxy.enable` {#opt-services.immich-public-proxy.enable}

Whether to enable Immich Public Proxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/immich-public-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich-public-proxy.nix)

## `services.immich-public-proxy.immichUrl` {#opt-services.immich-public-proxy.immichUrl}

URL of the Immich instance

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/immich-public-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich-public-proxy.nix)

## `services.immich-public-proxy.openFirewall` {#opt-services.immich-public-proxy.openFirewall}

Whether to open the IPP port in the firewall

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/immich-public-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich-public-proxy.nix)

## `services.immich-public-proxy.package` {#opt-services.immich-public-proxy.package}

The immich-public-proxy package to use.

*Type:* package

*Default:* `pkgs.immich-public-proxy`

*Declared by:* [`nixos/modules/services/web-apps/immich-public-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich-public-proxy.nix)

## `services.immich-public-proxy.port` {#opt-services.immich-public-proxy.port}

The port that IPP will listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/web-apps/immich-public-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich-public-proxy.nix)

## `services.immich-public-proxy.publicBaseUrl` {#opt-services.immich-public-proxy.publicBaseUrl}

The public URL of IPP, used to generate absolute URLs such as the `og:image` preview metadata.
If unset, IPP derives it from the host header of each request, which is what you want when serving
the same instance under multiple domains.

*Type:* null or string

*Default:* `null`

*Example:* `"https://photos.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/immich-public-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich-public-proxy.nix)

## `services.immich-public-proxy.settings` {#opt-services.immich-public-proxy.settings}

Configuration for IPP. See [https://github.com/alangrainger/immich-public-proxy/blob/main/README.md#additional-configuration](https://github.com/alangrainger/immich-public-proxy/blob/main/README.md#additional-configuration) for options and defaults.

The upload service uses the same configuration, and reads only the `ipp.upload` options
(see [https://docs.ipp.nz/config/upload-service](https://docs.ipp.nz/config/upload-service)) and a few shared ones.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/immich-public-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich-public-proxy.nix)

## `services.immich-public-proxy.upload.enable` {#opt-services.immich-public-proxy.upload.enable}

Whether to enable the IPP upload service, which lets visitors of a shared link send photos and videos into it.

The upload service must be reachable from the browser either under `/upload` on the same
hostname as IPP, or on a hostname of its own, in which case `settings.ipp.uploadUrl` must be set.
See [https://docs.ipp.nz/visitor-uploads](https://docs.ipp.nz/visitor-uploads)
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/immich-public-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich-public-proxy.nix)

## `services.immich-public-proxy.upload.openFirewall` {#opt-services.immich-public-proxy.upload.openFirewall}

Whether to open the upload service port in the firewall

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/immich-public-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich-public-proxy.nix)

## `services.immich-public-proxy.upload.port` {#opt-services.immich-public-proxy.upload.port}

The port that the upload service will listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3001`

*Declared by:* [`nixos/modules/services/web-apps/immich-public-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich-public-proxy.nix)

## `services.immich.accelerationDevices` {#opt-services.immich.accelerationDevices}

A list of device paths to hardware acceleration devices that immich should
have access to. This is useful when transcoding media files.
The special value `[ ]` will disallow all devices using `PrivateDevices`. `null` will give access to all devices.

*Type:* null or (list of string)

*Default:* `[ ]`

*Example:*

``` nix
[
  "/dev/dri/renderD128"
]
```

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.database.createDB` {#opt-services.immich.database.createDB}

Whether to enable the automatic creation of the database for immich.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.database.enable` {#opt-services.immich.database.enable}

Whether to enable the postgresql database for use with immich. See `services.postgresql`.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.database.host` {#opt-services.immich.database.host}

Hostname or address of the postgresql server. If an absolute path is given here, it will be interpreted as a unix socket path.

*Type:* string

*Default:* `"/run/postgresql"`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.database.name` {#opt-services.immich.database.name}

The name of the immich database.

*Type:* string

*Default:* `"immich"`

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.database.package` {#opt-services.immich.database.package}

The postgresql package providing the client programs that immich uses,
most notably the `pg_dumpall` of its database backup job.

These programs refuse to talk to a server that is newer than
themselves, so this must not be older than the server reachable at
[`services.immich.database.host`](#opt-services.immich.database.host). It is derived from
[`services.postgresql.package`](../../options/services-p/index.md#opt-services.postgresql.package) whenever the postgresql module
is enabled on this host; set it explicitly when the database lives on
another machine.

*Type:* package

*Default:*

``` nix
if config.services.postgresql.enable then
  config.services.postgresql.package
else
  pkgs.postgresql
```

*Example:* `pkgs.postgresql_18`

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.database.port` {#opt-services.immich.database.port}

Port of the postgresql server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5432`

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.database.setupSQL` {#opt-services.immich.database.setupSQL}

Path to the SQL script that installs and updates the PostgreSQL
extensions required by immich and reindexes VectorChord after
upgrades.

*Type:* absolute path

*Default:* the generated immich PostgreSQL setup SQL

*Read only*

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.database.user` {#opt-services.immich.database.user}

The database user for immich.

*Type:* string

*Default:* `"immich"`

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.enable` {#opt-services.immich.enable}

Whether to enable Immich.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.environment` {#opt-services.immich.environment}

Extra configuration environment variables. Refer to the [documentation](https://immich.app/docs/install/environment-variables) for options tagged with 'server', 'api' or 'microservices'.

*Type:* open submodule of attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  IMMICH_LOG_LEVEL = "verbose";
}
```

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.group` {#opt-services.immich.group}

The group immich should run as.

*Type:* string

*Default:* `"immich"`

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.host` {#opt-services.immich.host}

The host that immich will listen on.
Set to an empty string (`""`) to listen on all interfaces.

*Type:* string

*Default:* `"localhost"`

*Example:* `""`

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.machine-learning.enable` {#opt-services.immich.machine-learning.enable}

Whether to enable immich's machine-learning functionality to detect faces and search for objects.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.machine-learning.environment` {#opt-services.immich.machine-learning.environment}

Extra configuration environment variables. Refer to the [documentation](https://immich.app/docs/install/environment-variables) for options tagged with 'machine-learning'.

*Type:* open submodule of attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  MACHINE_LEARNING_MODEL_TTL = "600";
}
```

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.mediaLocation` {#opt-services.immich.mediaLocation}

Directory used to store media files. If it is not the default, the directory has to be created manually such that the immich user is able to read and write to it.

*Type:* absolute path

*Default:* `"/var/lib/immich"`

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.openFirewall` {#opt-services.immich.openFirewall}

Whether to open the immich port in the firewall

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.package` {#opt-services.immich.package}

The immich package to use.

*Type:* package

*Default:* `pkgs.immich`

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.port` {#opt-services.immich.port}

The port that immich will listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `2283`

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.redis.enable` {#opt-services.immich.redis.enable}

Whether to enable a redis cache for use with immich.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.redis.host` {#opt-services.immich.redis.host}

The host that redis will listen on.

*Type:* string

*Default:* `config.services.redis.servers.immich.unixSocket`

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.redis.port` {#opt-services.immich.redis.port}

The port that redis will listen on. Set to zero to disable TCP.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `0`

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.secretsFile` {#opt-services.immich.secretsFile}

Path of a file with extra environment variables to be loaded from disk. This file is not added to the nix store, so it can be used to pass secrets to immich. Refer to the [documentation](https://immich.app/docs/install/environment-variables) for options.

To set a database password set this to a file containing:

```
DB_PASSWORD=<pass>
```

*Type:* null or string

*Default:* `null`

*Example:* `"/run/secrets/immich"`

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.settings` {#opt-services.immich.settings}

Configuration for Immich.
See [https://immich.app/docs/install/config-file/](https://immich.app/docs/install/config-file/) or navigate to
[https://my.immich.app/admin/system-settings](https://my.immich.app/admin/system-settings) for
options and defaults.
Setting it to `null` allows configuring Immich in the web interface.
You can load secret values from a file in this configuration by setting `somevalue._secret = "/path/to/file"` instead of setting `somevalue` directly.

*Type:* null or (open submodule of (JSON value))

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.settings.newVersionCheck.enabled` {#opt-services.immich.settings.newVersionCheck.enabled}

Check for new versions.
This feature relies on periodic communication with github.com.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.settings.server.externalDomain` {#opt-services.immich.settings.server.externalDomain}

Domain for publicly shared links, including `http(s)://`.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immich.user` {#opt-services.immich.user}

The user immich should run as.

*Type:* string

*Default:* `"immich"`

*Declared by:* [`nixos/modules/services/web-apps/immich.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immich.nix)

## `services.immichframe.configSource` {#opt-services.immichframe.configSource}

Whether a config file or the database is the source of truth for ImmichFrame's configuration.

The default ("file") allows for purely declarative management of ImmichFrame,
but disables the admin UI.

"database" enables the admin UI, but means the values you set in
`config.services.immichframe.settings`  will only be read the first time ImmichFrame starts.
After that, changes must be made through the admin UI.

*Type:* one of "file", "database"

*Default:* `"file"`

*Declared by:* [`nixos/modules/services/web-apps/immichframe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immichframe.nix)

## `services.immichframe.enable` {#opt-services.immichframe.enable}

Whether to enable ImmichFrame.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/immichframe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immichframe.nix)

## `services.immichframe.package` {#opt-services.immichframe.package}

The immichframe package to use.

*Type:* package

*Default:* `pkgs.immichframe`

*Declared by:* [`nixos/modules/services/web-apps/immichframe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immichframe.nix)

## `services.immichframe.port` {#opt-services.immichframe.port}

The port that ImmichFrame will listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/web-apps/immichframe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immichframe.nix)

## `services.immichframe.settings` {#opt-services.immichframe.settings}

Configuration for ImmichFrame. See
[https://immichframe.online/docs/getting-started/configuration](https://immichframe.online/docs/getting-started/configuration) for
options and defaults.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/immichframe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immichframe.nix)

## `services.immichframe.settings.Accounts` {#opt-services.immichframe.settings.Accounts}

Accounts configuration, multiple are permitted. See
[https://immichframe.online/docs/getting-started/configuration](https://immichframe.online/docs/getting-started/configuration).

*Type:* list of (open submodule of (JSON value))

*Declared by:* [`nixos/modules/services/web-apps/immichframe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immichframe.nix)

## `services.immichframe.settings.Accounts.*.ApiKey` {#opt-services.immichframe.settings.Accounts._.ApiKey}

API key to talk to the Immich server.
Warning: it will be world-readable in /nix/store.
Consider using `ApiKeyFile` instead.

See
[https://immichframe.online/docs/getting-started/configuration#api-key-permissions](https://immichframe.online/docs/getting-started/configuration#api-key-permissions)
for details on what permissions this key needs.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/immichframe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immichframe.nix)

## `services.immichframe.settings.Accounts.*.ApiKeyFile` {#opt-services.immichframe.settings.Accounts._.ApiKeyFile}

File containing an API key to talk to the Immich server.

See
[https://immichframe.online/docs/getting-started/configuration#api-key-permissions](https://immichframe.online/docs/getting-started/configuration#api-key-permissions)
for details on what permissions this key needs.

*Type:* null or absolute path not in the Nix store

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/immichframe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immichframe.nix)

## `services.immichframe.settings.Accounts.*.ImmichServerUrl` {#opt-services.immichframe.settings.Accounts._.ImmichServerUrl}

The URL of your Immich server.

*Type:* string

*Example:* `"http://photos.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/immichframe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/immichframe.nix)

## `services.inadyn.configFile` {#opt-services.inadyn.configFile}

Configuration file for inadyn.

Setting this will override all other configuration options.

Passed to the inadyn service using LoadCredential.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/inadyn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inadyn.nix)

## `services.inadyn.enable` {#opt-services.inadyn.enable}

Whether to enable synchronise your machine's IP address with a dynamic DNS provider using inadyn
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/inadyn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inadyn.nix)

## `services.inadyn.group` {#opt-services.inadyn.group}

Group account under which inadyn runs.

::: note
If left as the default value this user will automatically be created
on system activation, otherwise you are responsible for
ensuring the user exists before the inadyn service starts.
:::

*Type:* string

*Default:* `"inadyn"`

*Declared by:* [`nixos/modules/services/networking/inadyn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inadyn.nix)

## `services.inadyn.interval` {#opt-services.inadyn.interval}

How often to check the current IP.
Uses the format described in `systemd.time(7)`";

*Type:* string

*Default:* `"*-*-* *:*:00"`

*Declared by:* [`nixos/modules/services/networking/inadyn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inadyn.nix)

## `services.inadyn.logLevel` {#opt-services.inadyn.logLevel}

Set inadyn's log level.

*Type:* one of "none", "err", "warning", "info", "notice", "debug"

*Default:* `"notice"`

*Declared by:* [`nixos/modules/services/networking/inadyn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inadyn.nix)

## `services.inadyn.settings` {#opt-services.inadyn.settings}

See `inadyn.conf (5)`

*Type:* open submodule of (attribute set)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/inadyn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inadyn.nix)

## `services.inadyn.settings.allow-ipv6` {#opt-services.inadyn.settings.allow-ipv6}

Whether to get IPv6 addresses from interfaces.

*Type:* boolean

*Default:* `config.networking.enableIPv6`

*Declared by:* [`nixos/modules/services/networking/inadyn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inadyn.nix)

## `services.inadyn.settings.custom` {#opt-services.inadyn.settings.custom}

Settings for custom DNS providers.

*Type:* attribute set of (open submodule of (attribute set))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/inadyn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inadyn.nix)

## `services.inadyn.settings.custom.<name>.ddns-path` {#opt-services.inadyn.settings.custom._name_.ddns-path}

DDNS server path.

See `inadnyn.conf (5)` for a list for format specifiers that can be used.

*Type:* string

*Example:* `"/update?user=%u&password=%p&domain=%h&myip=%i"`

*Declared by:* [`nixos/modules/services/networking/inadyn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inadyn.nix)

## `services.inadyn.settings.custom.<name>.ddns-server` {#opt-services.inadyn.settings.custom._name_.ddns-server}

DDNS server name.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/inadyn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inadyn.nix)

## `services.inadyn.settings.custom.<name>.hostname` {#opt-services.inadyn.settings.custom._name_.hostname}

Hostname alias(es).

*Type:* string or list of string

*Default:* `"*"`

*Example:* `"your.cool-domain.com"`

*Declared by:* [`nixos/modules/services/networking/inadyn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inadyn.nix)

## `services.inadyn.settings.custom.<name>.include` {#opt-services.inadyn.settings.custom._name_.include}

File to include additional settings for this provider from.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/inadyn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inadyn.nix)

## `services.inadyn.settings.custom.<name>.password` {#opt-services.inadyn.settings.custom._name_.password}

Password for this DDNS provider.

WARNING: This will be world-readable in the nix store.
To store credentials securely, use the `include` or `configFile` options.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/inadyn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inadyn.nix)

## `services.inadyn.settings.custom.<name>.ssl` {#opt-services.inadyn.settings.custom._name_.ssl}

Whether to use HTTPS for this DDNS provider.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/inadyn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inadyn.nix)

## `services.inadyn.settings.custom.<name>.username` {#opt-services.inadyn.settings.custom._name_.username}

Username for this DDNS provider.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/inadyn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inadyn.nix)

## `services.inadyn.settings.forced-update` {#opt-services.inadyn.settings.forced-update}

Duration (in seconds) after which an update is forced.

*Type:* positive integer, meaning \>0

*Default:* `2592000`

*Declared by:* [`nixos/modules/services/networking/inadyn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inadyn.nix)

## `services.inadyn.settings.provider` {#opt-services.inadyn.settings.provider}

Settings for DDNS providers built-in to inadyn.

For a list of built-in providers, see `inadyn.conf (5)`.

*Type:* attribute set of (open submodule of (attribute set))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/inadyn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inadyn.nix)

## `services.inadyn.settings.provider.<name>.hostname` {#opt-services.inadyn.settings.provider._name_.hostname}

Hostname alias(es).

*Type:* string or list of string

*Default:* `"*"`

*Example:* `"your.cool-domain.com"`

*Declared by:* [`nixos/modules/services/networking/inadyn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inadyn.nix)

## `services.inadyn.settings.provider.<name>.include` {#opt-services.inadyn.settings.provider._name_.include}

File to include additional settings for this provider from.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/inadyn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inadyn.nix)

## `services.inadyn.settings.provider.<name>.password` {#opt-services.inadyn.settings.provider._name_.password}

Password for this DDNS provider.

WARNING: This will be world-readable in the nix store.
To store credentials securely, use the `include` or `configFile` options.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/inadyn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inadyn.nix)

## `services.inadyn.settings.provider.<name>.ssl` {#opt-services.inadyn.settings.provider._name_.ssl}

Whether to use HTTPS for this DDNS provider.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/inadyn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inadyn.nix)

## `services.inadyn.settings.provider.<name>.username` {#opt-services.inadyn.settings.provider._name_.username}

Username for this DDNS provider.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/inadyn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inadyn.nix)

## `services.inadyn.user` {#opt-services.inadyn.user}

User account under which inadyn runs.

::: note
If left as the default value this user will automatically be created
on system activation, otherwise you are responsible for
ensuring the user exists before the inadyn service starts.
:::

*Type:* string

*Default:* `"inadyn"`

*Declared by:* [`nixos/modules/services/networking/inadyn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inadyn.nix)

## `services.incron.allow` {#opt-services.incron.allow}

Users allowed to use incrontab.

If empty then no user will be allowed to have their own incrontab.
If `null` then will defer to `deny`.
If both `allow` and `deny` are null
then all users will be allowed to have their own incrontab.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/incron.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/incron.nix)

## `services.incron.deny` {#opt-services.incron.deny}

Users forbidden from using incrontab.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/incron.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/incron.nix)

## `services.incron.enable` {#opt-services.incron.enable}

Whether to enable the incron daemon.

Note that commands run under incrontab only support common Nix profiles for the `PATH` provided variable.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/incron.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/incron.nix)

## `services.incron.extraPackages` {#opt-services.incron.extraPackages}

Extra packages available to the system incrontab.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.rsync ]`

*Declared by:* [`nixos/modules/services/monitoring/incron.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/incron.nix)

## `services.incron.systab` {#opt-services.incron.systab}

The system incrontab contents.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  /var/mail IN_CLOSE_WRITE abc $@/$#
  /tmp IN_ALL_EVENTS efg $@/$# $&
''
```

*Declared by:* [`nixos/modules/services/monitoring/incron.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/incron.nix)

## `services.infinoted.certificateChain` {#opt-services.infinoted.certificateChain}

Chain of CA-certificates to which our `certificateFile` is relative.
Optional for TLS.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/editors/infinoted.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/editors/infinoted.nix)

## `services.infinoted.certificateFile` {#opt-services.infinoted.certificateFile}

Server certificate to use for TLS

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/editors/infinoted.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/editors/infinoted.nix)

## `services.infinoted.enable` {#opt-services.infinoted.enable}

Whether to enable infinoted.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/editors/infinoted.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/editors/infinoted.nix)

## `services.infinoted.extraConfig` {#opt-services.infinoted.extraConfig}

Additional configuration to append to infinoted.conf

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  [autosave]
  interval=10
''
```

*Declared by:* [`nixos/modules/services/editors/infinoted.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/editors/infinoted.nix)

## `services.infinoted.group` {#opt-services.infinoted.group}

What to call the primary group of the dedicated user under which infinoted is run

*Type:* string

*Default:* `"infinoted"`

*Declared by:* [`nixos/modules/services/editors/infinoted.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/editors/infinoted.nix)

## `services.infinoted.keyFile` {#opt-services.infinoted.keyFile}

Private key to use for TLS

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/editors/infinoted.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/editors/infinoted.nix)

## `services.infinoted.package` {#opt-services.infinoted.package}

The libinfinity package to use.

*Type:* package

*Default:* `pkgs.libinfinity`

*Declared by:* [`nixos/modules/services/editors/infinoted.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/editors/infinoted.nix)

## `services.infinoted.passwordFile` {#opt-services.infinoted.passwordFile}

File to read server-wide password from

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/editors/infinoted.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/editors/infinoted.nix)

## `services.infinoted.plugins` {#opt-services.infinoted.plugins}

Plugins to enable

*Type:* list of string

*Default:*

``` nix
[
  "note-text"
  "note-chat"
  "logging"
  "autosave"
]
```

*Declared by:* [`nixos/modules/services/editors/infinoted.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/editors/infinoted.nix)

## `services.infinoted.port` {#opt-services.infinoted.port}

Port to listen on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6523`

*Declared by:* [`nixos/modules/services/editors/infinoted.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/editors/infinoted.nix)

## `services.infinoted.rootDirectory` {#opt-services.infinoted.rootDirectory}

Root of the directory structure to serve

*Type:* absolute path

*Default:* `"/var/lib/infinoted/documents/"`

*Declared by:* [`nixos/modules/services/editors/infinoted.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/editors/infinoted.nix)

## `services.infinoted.securityPolicy` {#opt-services.infinoted.securityPolicy}

How strictly to enforce clients connection with TLS.

*Type:* one of "no-tls", "allow-tls", "require-tls"

*Default:* `"require-tls"`

*Declared by:* [`nixos/modules/services/editors/infinoted.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/editors/infinoted.nix)

## `services.infinoted.user` {#opt-services.infinoted.user}

What to call the dedicated user under which infinoted is run

*Type:* string

*Default:* `"infinoted"`

*Declared by:* [`nixos/modules/services/editors/infinoted.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/editors/infinoted.nix)

## `services.influxdb.dataDir` {#opt-services.influxdb.dataDir}

Data directory for influxd data files.

*Type:* absolute path

*Default:* `"/var/db/influxdb"`

*Declared by:* [`nixos/modules/services/databases/influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb.nix)

## `services.influxdb.enable` {#opt-services.influxdb.enable}

Whether to enable the influxdb server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb.nix)

## `services.influxdb.group` {#opt-services.influxdb.group}

Group under which influxdb runs

*Type:* string

*Default:* `"influxdb"`

*Declared by:* [`nixos/modules/services/databases/influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb.nix)

## `services.influxdb.package` {#opt-services.influxdb.package}

The influxdb package to use.

*Type:* package

*Default:* `pkgs.influxdb`

*Declared by:* [`nixos/modules/services/databases/influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb.nix)

## `services.influxdb.settings` {#opt-services.influxdb.settings}

Extra configuration options for influxdb

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/databases/influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb.nix)

## `services.influxdb.user` {#opt-services.influxdb.user}

User account under which influxdb runs

*Type:* string

*Default:* `"influxdb"`

*Declared by:* [`nixos/modules/services/databases/influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb.nix)

## `services.influxdb2.enable` {#opt-services.influxdb2.enable}

Whether to enable the influxdb2 server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.package` {#opt-services.influxdb2.package}

The influxdb2 package to use.

*Type:* package

*Default:* `pkgs.influxdb2`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.enable` {#opt-services.influxdb2.provision.enable}

Whether to enable initial database setup and provisioning.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.initialSetup.bucket` {#opt-services.influxdb2.provision.initialSetup.bucket}

Primary bucket name

*Type:* string

*Example:* `"example"`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.initialSetup.organization` {#opt-services.influxdb2.provision.initialSetup.organization}

Primary organization name

*Type:* string

*Example:* `"main"`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.initialSetup.passwordFile` {#opt-services.influxdb2.provision.initialSetup.passwordFile}

Password for primary user. Don't use a file from the nix store!

*Type:* absolute path

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.initialSetup.retention` {#opt-services.influxdb2.provision.initialSetup.retention}

The duration in seconds for which the bucket will retain data (0 is infinite).

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.initialSetup.tokenFile` {#opt-services.influxdb2.provision.initialSetup.tokenFile}

API Token to set for the admin user. Don't use a file from the nix store!

*Type:* absolute path

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.initialSetup.username` {#opt-services.influxdb2.provision.initialSetup.username}

Primary username

*Type:* string

*Default:* `"admin"`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.organizations` {#opt-services.influxdb2.provision.organizations}

Organizations to provision.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  myorg = {
    description = "My organization";
    buckets.mybucket = {
      description = "My bucket";
      retention = 31536000; # 1 year
    };
    auths.mytoken = {
      readBuckets = ["mybucket"];
      tokenFile = "/run/secrets/mytoken";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.organizations.<name>.auths` {#opt-services.influxdb2.provision.organizations._name_.auths}

API tokens to provision for the user in this organization.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.organizations.<name>.auths.<name>.allAccess` {#opt-services.influxdb2.provision.organizations._name_.auths._name_.allAccess}

Grants all permissions in the associated organization.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.organizations.<name>.auths.<name>.description` {#opt-services.influxdb2.provision.organizations._name_.auths._name_.description}

Optional description for the API token.
Note that the actual token will always be created with a descriptionregardless
of whether this is given or not. The name is always added plus a unique suffix
to later identify the token to track whether it has already been created.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.organizations.<name>.auths.<name>.id` {#opt-services.influxdb2.provision.organizations._name_.auths._name_.id}

A unique identifier for this authentication token. Since influx doesn't store names for tokens, this will be hashed and appended to the description to identify the token.

*Type:* string

*Default:* `"<a hash derived from org and name>"`

*Read only*

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.organizations.<name>.auths.<name>.operator` {#opt-services.influxdb2.provision.organizations._name_.auths._name_.operator}

Grants all permissions in all organizations.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.organizations.<name>.auths.<name>.present` {#opt-services.influxdb2.provision.organizations._name_.auths._name_.present}

Whether to ensure that this user is present or absent.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.organizations.<name>.auths.<name>.readBuckets` {#opt-services.influxdb2.provision.organizations._name_.auths._name_.readBuckets}

The organization's buckets which should be allowed to be read

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.organizations.<name>.auths.<name>.readPermissions` {#opt-services.influxdb2.provision.organizations._name_.auths._name_.readPermissions}

The read permissions to include for this token. Access is usually granted only
for resources in the associated organization.

Available permissions are `authorizations`, `buckets`, `dashboards`,
`orgs`, `tasks`, `telegrafs`, `users`, `variables`, `secrets`, `labels`, `views`,
`documents`, `notificationRules`, `notificationEndpoints`, `checks`, `dbrp`,
`annotations`, `sources`, `scrapers`, `notebooks`, `remotes`, `replications`.

Refer to `influx auth create --help` for a full list with descriptions.

`buckets` grants read access to all associated buckets. Use `readBuckets` to define
more granular access permissions.

*Type:* list of (one of "authorizations", "buckets", "dashboards", "orgs", "tasks", "telegrafs", "users", "variables", "secrets", "labels", "views", "documents", "notificationRules", "notificationEndpoints", "checks", "dbrp", "annotations", "sources", "scrapers", "notebooks", "remotes", "replications")

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.organizations.<name>.auths.<name>.tokenFile` {#opt-services.influxdb2.provision.organizations._name_.auths._name_.tokenFile}

The token value. If not given, influx will automatically generate one.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.organizations.<name>.auths.<name>.writeBuckets` {#opt-services.influxdb2.provision.organizations._name_.auths._name_.writeBuckets}

The organization's buckets which should be allowed to be written

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.organizations.<name>.auths.<name>.writePermissions` {#opt-services.influxdb2.provision.organizations._name_.auths._name_.writePermissions}

The read permissions to include for this token. Access is usually granted only
for resources in the associated organization.

Available permissions are `authorizations`, `buckets`, `dashboards`,
`orgs`, `tasks`, `telegrafs`, `users`, `variables`, `secrets`, `labels`, `views`,
`documents`, `notificationRules`, `notificationEndpoints`, `checks`, `dbrp`,
`annotations`, `sources`, `scrapers`, `notebooks`, `remotes`, `replications`.

Refer to `influx auth create --help` for a full list with descriptions.

`buckets` grants write access to all associated buckets. Use `writeBuckets` to define
more granular access permissions.

*Type:* list of (one of "authorizations", "buckets", "dashboards", "orgs", "tasks", "telegrafs", "users", "variables", "secrets", "labels", "views", "documents", "notificationRules", "notificationEndpoints", "checks", "dbrp", "annotations", "sources", "scrapers", "notebooks", "remotes", "replications")

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.organizations.<name>.buckets` {#opt-services.influxdb2.provision.organizations._name_.buckets}

Buckets to provision in this organization.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.organizations.<name>.buckets.<name>.description` {#opt-services.influxdb2.provision.organizations._name_.buckets._name_.description}

Optional description for the bucket.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.organizations.<name>.buckets.<name>.present` {#opt-services.influxdb2.provision.organizations._name_.buckets._name_.present}

Whether to ensure that this bucket is present or absent.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.organizations.<name>.buckets.<name>.retention` {#opt-services.influxdb2.provision.organizations._name_.buckets._name_.retention}

The duration in seconds for which the bucket will retain data (0 is infinite).

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.organizations.<name>.description` {#opt-services.influxdb2.provision.organizations._name_.description}

Optional description for the organization.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.organizations.<name>.present` {#opt-services.influxdb2.provision.organizations._name_.present}

Whether to ensure that this organization is present or absent.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.users` {#opt-services.influxdb2.provision.users}

Users to provision.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  # admin = {}; /* The initialSetup.username will automatically be added. */
  myuser.passwordFile = "/run/secrets/myuser_password";
}
```

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.users.<name>.passwordFile` {#opt-services.influxdb2.provision.users._name_.passwordFile}

Password for the user. If unset, the user will not be able to log in until a password is set by an operator! Don't use a file from the nix store!

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.provision.users.<name>.present` {#opt-services.influxdb2.provision.users._name_.present}

Whether to ensure that this user is present or absent.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.influxdb2.settings` {#opt-services.influxdb2.settings}

configuration options for influxdb2, see [https://docs.influxdata.com/influxdb/v2.0/reference/config-options](https://docs.influxdata.com/influxdb/v2.0/reference/config-options) for details.

*Type:* JSON value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/databases/influxdb2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/influxdb2.nix)

## `services.infnoise.enable` {#opt-services.infnoise.enable}

Whether to enable the Infinite Noise TRNG driver.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/infnoise.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/infnoise.nix)

## `services.infnoise.fillDevRandom` {#opt-services.infnoise.fillDevRandom}

Whether to run the infnoise driver as a daemon to refill /dev/random.

If disabled, you can use the `infnoise` command-line tool to
manually obtain randomness.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/infnoise.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/infnoise.nix)

## `services.input-remapper.enable` {#opt-services.input-remapper.enable}

Whether to enable input-remapper, an easy to use tool to change the mapping of your input device buttons.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/input-remapper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/input-remapper.nix)

## `services.input-remapper.enableUdevRules` {#opt-services.input-remapper.enableUdevRules}

Whether to enable udev rules added by input-remapper to handle hotplugged devices. Currently disabled by default due to [https://github.com/sezanzeb/input-remapper/issues/140](https://github.com/sezanzeb/input-remapper/issues/140).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/input-remapper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/input-remapper.nix)

## `services.input-remapper.package` {#opt-services.input-remapper.package}

The input-remapper package to use.

*Type:* package

*Default:* `pkgs.input-remapper`

*Declared by:* [`nixos/modules/services/misc/input-remapper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/input-remapper.nix)

## `services.input-remapper.serviceWantedBy` {#opt-services.input-remapper.serviceWantedBy}

Specifies the WantedBy setting for the input-remapper service.

*Type:* list of string

*Default:*

``` nix
[
  "graphical.target"
]
```

*Example:*

``` nix
[
  "multi-user.target"
]
```

*Declared by:* [`nixos/modules/services/misc/input-remapper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/input-remapper.nix)

## `services.inputplumber.enable` {#opt-services.inputplumber.enable}

Whether to enable InputPlumber.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/inputplumber.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/inputplumber.nix)

## `services.inputplumber.package` {#opt-services.inputplumber.package}

The inputplumber package to use.

*Type:* package

*Default:* `pkgs.inputplumber`

*Declared by:* [`nixos/modules/services/hardware/inputplumber.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/inputplumber.nix)

## `services.inspircd.config` {#opt-services.inspircd.config}

Verbatim `inspircd.conf` file.
For a list of options, consult the
[InspIRCd documentation](https://docs.inspircd.org/3/configuration/), the
[Module documentation](https://docs.inspircd.org/3/modules/)
and the example configuration files distributed
with `pkgs.inspircd.doc`

*Type:* strings concatenated with "\\n"

*Declared by:* [`nixos/modules/services/networking/inspircd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inspircd.nix)

## `services.inspircd.enable` {#opt-services.inspircd.enable}

Whether to enable InspIRCd.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/inspircd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inspircd.nix)

## `services.inspircd.package` {#opt-services.inspircd.package}

The InspIRCd package to use. This is mainly useful
to specify an overridden version of the
`pkgs.inspircd` dervivation, for
example if you want to use a more minimal InspIRCd
distribution with less modules enabled or with
modules enabled which can't be distributed in binary
form due to licensing issues.

*Type:* package

*Default:* `pkgs.inspircd`

*Example:* `pkgs.inspircdMinimal`

*Declared by:* [`nixos/modules/services/networking/inspircd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/inspircd.nix)

## `services.intel-lpmd.configFile` {#opt-services.intel-lpmd.configFile}

XML configuration file passed to the daemon with `--config`.
It takes precedence over the platform configuration files in `/etc/intel_lpmd`.
Process classification rules still load from `/etc/intel_lpmd`.

The module links the shipped configuration files into `/etc/intel_lpmd`.
Use [`environment.etc`](../../options/environment/index.md#opt-environment.etc) to replace or disable individual files.

*Type:* null or absolute path

*Default:* `null`

*Example:* `./intel_lpmd_config.xml`

*Declared by:* [`nixos/modules/services/hardware/intel-lpmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/intel-lpmd.nix)

## `services.intel-lpmd.configOverrides` {#opt-services.intel-lpmd.configOverrides}

Top-level elements to set in every shipped platform configuration file,
`intel_lpmd_config*.xml`. Elements missing from a file are added to it.
The daemon refuses to start if an element is unknown or has an invalid value.

See `intel_lpmd_config.xml(5)` and the
[shipped configuration files](https://github.com/intel/intel-lpmd/tree/main/data)
for available elements.
Use [`services.intel-lpmd.configFile`](#opt-services.intel-lpmd.configFile) to change nested elements such as `States`.

*Type:* attribute set of (signed integer or string)

*Default:* `{ }`

*Example:*

``` nix
{
  BalancedDef = 0;
  PowersaverDef = 0;
}
```

*Declared by:* [`nixos/modules/services/hardware/intel-lpmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/intel-lpmd.nix)

## `services.intel-lpmd.enable` {#opt-services.intel-lpmd.enable}

Whether to enable Intel's low power mode daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/intel-lpmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/intel-lpmd.nix)

## `services.intel-lpmd.package` {#opt-services.intel-lpmd.package}

The intel-lpmd package to use.

*Type:* package

*Default:* `pkgs.intel-lpmd`

*Declared by:* [`nixos/modules/services/hardware/intel-lpmd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/intel-lpmd.nix)

## `services.interception-tools.enable` {#opt-services.interception-tools.enable}

Whether to enable the interception tools service.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/interception-tools.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/interception-tools.nix)

## `services.interception-tools.plugins` {#opt-services.interception-tools.plugins}

A list of interception tools plugins that will be made available to use
inside the udevmon configuration.

*Type:* list of package

*Default:* `[ pkgs.interception-tools-plugins.caps2esc ]`

*Declared by:* [`nixos/modules/services/hardware/interception-tools.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/interception-tools.nix)

## `services.interception-tools.udevmonConfig` {#opt-services.interception-tools.udevmonConfig}

String of udevmon YAML configuration, or path to a udevmon YAML
configuration file.

*Type:* string or absolute path

*Default:*

``` nix
''
  - JOB: "intercept -g $DEVNODE | caps2esc | uinput -d $DEVNODE"
    DEVICE:
      EVENTS:
        EV_KEY: [KEY_CAPSLOCK, KEY_ESC]
''
```

*Example:*

``` nix
''
  - JOB: "intercept -g $DEVNODE | y2z | x2y | uinput -d $DEVNODE"
    DEVICE:
      EVENTS:
        EV_KEY: [KEY_X, KEY_Y]
''
```

*Declared by:* [`nixos/modules/services/hardware/interception-tools.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/interception-tools.nix)

## `services.intune.enable` {#opt-services.intune.enable}

Whether to enable Microsoft Intune.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/intune.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/intune.nix)

## `services.inventree.adminPasswordFile` {#opt-services.inventree.adminPasswordFile}

Path to a file containing admin password

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/inventree-password"`

*Declared by:* [`nixos/modules/services/misc/inventree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/inventree.nix)

## `services.inventree.dataDir` {#opt-services.inventree.dataDir}

Inventree's data storage path.  Will be `/var/lib/inventree` by default.

*Type:* string

*Default:* `"/var/lib/inventree"`

*Declared by:* [`nixos/modules/services/misc/inventree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/inventree.nix)

## `services.inventree.database.createLocally` {#opt-services.inventree.database.createLocally}

Create the database and database user locally.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/inventree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/inventree.nix)

## `services.inventree.database.dbhost` {#opt-services.inventree.database.dbhost}

Database host or socket path.

*Type:* null or string

*Default:* `null`

*Example:* `"localhost"`

*Declared by:* [`nixos/modules/services/misc/inventree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/inventree.nix)

## `services.inventree.database.dbname` {#opt-services.inventree.database.dbname}

Database name.

*Type:* string

*Default:* `"inventree"`

*Declared by:* [`nixos/modules/services/misc/inventree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/inventree.nix)

## `services.inventree.database.dbport` {#opt-services.inventree.database.dbport}

Database host port.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Example:* `5432`

*Declared by:* [`nixos/modules/services/misc/inventree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/inventree.nix)

## `services.inventree.database.dbtype` {#opt-services.inventree.database.dbtype}

Database type.

*Type:* null or one of "postgresql", "mysql"

*Default:* `"postgresql"`

*Declared by:* [`nixos/modules/services/misc/inventree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/inventree.nix)

## `services.inventree.database.dbuser` {#opt-services.inventree.database.dbuser}

Database username.

*Type:* string

*Default:* `"inventree"`

*Declared by:* [`nixos/modules/services/misc/inventree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/inventree.nix)

## `services.inventree.database.passwordFile` {#opt-services.inventree.database.passwordFile}

A file containing the password corresponding to

<option>database.dbuser</option>.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/inventree-dbpassword"`

*Declared by:* [`nixos/modules/services/misc/inventree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/inventree.nix)

## `services.inventree.domain` {#opt-services.inventree.domain}

The INVENTREE\_SITE\_URL option defines the base URL for the
InvenTree server. This is a critical setting, and it is required
for correct operation of the server. If not specified, the
server will attempt to determine the site URL automatically -
but this may not always be correct!

The site URL is the URL that users will use to access the
InvenTree server. For example, if the server is accessible at
`https://inventree.example.com`, the site URL should be set to
`https://inventree.example.com`. Note that this is not
necessarily the same as the internal URL that the server is
running on - the internal URL will depend entirely on your
server configuration and may be obscured by a reverse proxy or
other such setup.

*Type:* string

*Default:* `"localhost"`

*Example:* `"inventree.example.com"`

*Declared by:* [`nixos/modules/services/misc/inventree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/inventree.nix)

## `services.inventree.enable` {#opt-services.inventree.enable}

Whether to enable inventree.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/inventree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/inventree.nix)

## `services.inventree.group` {#opt-services.inventree.group}

Group under which InvenTree runs.

*Type:* string

*Default:* `"inventree"`

*Declared by:* [`nixos/modules/services/misc/inventree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/inventree.nix)

## `services.inventree.package` {#opt-services.inventree.package}

Which package to use for the InvenTree instance.

*Type:* package

*Default:* `pkgs.inventree`

*Declared by:* [`nixos/modules/services/misc/inventree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/inventree.nix)

## `services.inventree.secretKeyFile` {#opt-services.inventree.secretKeyFile}

Path to a file containing the secret key

*Type:* absolute path

*Default:* `"${cfg.dataDir}/secret_key.txt"`

*Example:* `"/run/keys/inventree-secret-key"`

*Declared by:* [`nixos/modules/services/misc/inventree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/inventree.nix)

## `services.inventree.settings` {#opt-services.inventree.settings}

InvenTree config options.

See [the documentation](https://docs.inventree.org/en/stable/start/config/) for available options.

*Type:* attribute set of (null or absolute path or string)

*Default:* `{ }`

*Example:*

``` nix
{
  INVENTREE_CACHE_ENABLED = true;
  INVENTREE_CACHE_HOST = "localhost";
  INVENTREE_EMAIL_HOST = "smtp.example.com";
  INVENTREE_EMAIL_PORT = 25;
}
```

*Declared by:* [`nixos/modules/services/misc/inventree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/inventree.nix)

## `services.inventree.user` {#opt-services.inventree.user}

User under which InvenTree runs.

*Type:* string

*Default:* `"inventree"`

*Declared by:* [`nixos/modules/services/misc/inventree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/inventree.nix)

## `services.invidious-router.address` {#opt-services.invidious-router.address}

Address on which invidious-router should listen on.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/misc/invidious-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/invidious-router.nix)

## `services.invidious-router.enable` {#opt-services.invidious-router.enable}

Whether to enable the invidious-router service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/invidious-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/invidious-router.nix)

## `services.invidious-router.nginx.domain` {#opt-services.invidious-router.nginx.domain}

The domain on which invidious-router should be served.

*Type:* string

*Example:* `"invidious-router.example.com"`

*Declared by:* [`nixos/modules/services/misc/invidious-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/invidious-router.nix)

## `services.invidious-router.nginx.enable` {#opt-services.invidious-router.nginx.enable}

Whether to enable Automatic nginx proxy configuration
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/invidious-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/invidious-router.nix)

## `services.invidious-router.nginx.extraDomains` {#opt-services.invidious-router.nginx.extraDomains}

Additional domains to serve invidious-router on.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/invidious-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/invidious-router.nix)

## `services.invidious-router.package` {#opt-services.invidious-router.package}

The invidious-router package to use.

*Type:* package

*Default:* `pkgs.invidious-router`

*Declared by:* [`nixos/modules/services/misc/invidious-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/invidious-router.nix)

## `services.invidious-router.port` {#opt-services.invidious-router.port}

Port to bind to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8050`

*Declared by:* [`nixos/modules/services/misc/invidious-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/invidious-router.nix)

## `services.invidious-router.settings` {#opt-services.invidious-router.settings}

Configuration for invidious-router.
Check [https://gitlab.com/gaincoder/invidious-router#configuration](https://gitlab.com/gaincoder/invidious-router#configuration)
for configuration options.

*Type:* open submodule of (YAML 1.1 value)

*Default:*

``` nix
{
  api = {
    allowed_regions = [
      "AT"
      "DE"
      "CH"
    ];
    enabled = true;
    filter_regions = true;
    url = "https://api.invidious.io/instances.json";
  };
  app = {
    enable_youtube_fallback = false;
    listen = "127.0.0.1:8050";
    reload_instance_list_interval = "60s";
  };
  healthcheck = {
    allowed_status_codes = [
      200
    ];
    filter_by_response_time = {
      enabled = true;
      qty_of_top_results = 3;
    };
    interval = "10s";
    minimum_ratio = 0.2;
    path = "/";
    remove_no_ratio = true;
    text_not_present = "YouTube is currently trying to block Invidious instances";
    timeout = "1s";
  };
}
```

*Declared by:* [`nixos/modules/services/misc/invidious-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/invidious-router.nix)

## `services.invidious.address` {#opt-services.invidious.address}

The IP address Invidious should bind to.

*Type:* string

*Default:* `if config.services.invidious.nginx.enable then "127.0.0.1" else "0.0.0.0"`

*Declared by:* [`nixos/modules/services/web-apps/invidious.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invidious.nix)

## `services.invidious.database.createLocally` {#opt-services.invidious.database.createLocally}

Whether to create a local database with PostgreSQL.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/invidious.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invidious.nix)

## `services.invidious.database.host` {#opt-services.invidious.database.host}

The database host Invidious should use.

If `null`, the local unix socket is used. Otherwise
TCP is used.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/invidious.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invidious.nix)

## `services.invidious.database.passwordFile` {#opt-services.invidious.database.passwordFile}

Path to file containing the database password.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/invidious.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invidious.nix)

## `services.invidious.database.port` {#opt-services.invidious.database.port}

The port of the database Invidious should use.

Defaults to the the default postgresql port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `config.services.postgresql.settings.port`

*Declared by:* [`nixos/modules/services/web-apps/invidious.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invidious.nix)

## `services.invidious.domain` {#opt-services.invidious.domain}

The FQDN Invidious is reachable on.

This is used to configure nginx and for building absolute URLs.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/invidious.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invidious.nix)

## `services.invidious.enable` {#opt-services.invidious.enable}

Whether to enable Invidious.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/invidious.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invidious.nix)

## `services.invidious.extraSettingsFile` {#opt-services.invidious.extraSettingsFile}

A file including Invidious settings.

It gets merged with the settings specified in [`services.invidious.settings`](#opt-services.invidious.settings)
and can be used to store secrets like `hmac_key` outside of the nix store.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/invidious.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invidious.nix)

## `services.invidious.hmacKeyFile` {#opt-services.invidious.hmacKeyFile}

A path to a file containing the `hmac_key`. If `null`, a key will be generated automatically on first
start.

If non-`null`, this option overrides any `hmac_key` specified in [`services.invidious.settings`](#opt-services.invidious.settings) or
via [`services.invidious.extraSettingsFile`](#opt-services.invidious.extraSettingsFile).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/invidious.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invidious.nix)

## `services.invidious.http3-ytproxy.enable` {#opt-services.invidious.http3-ytproxy.enable}

Whether to enable http3-ytproxy for faster loading of images and video playback.

If [`services.invidious.nginx.enable`](#opt-services.invidious.nginx.enable) is used, nginx will be configured automatically. If not, you
need to configure a reverse proxy yourself according to
[https://docs.invidious.io/improve-public-instance/#3-speed-up-video-playback-with-http3-ytproxy](https://docs.invidious.io/improve-public-instance/#3-speed-up-video-playback-with-http3-ytproxy).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/invidious.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invidious.nix)

## `services.invidious.http3-ytproxy.package` {#opt-services.invidious.http3-ytproxy.package}

The http3-ytproxy package to use.

*Type:* package

*Default:* `pkgs.http3-ytproxy`

*Declared by:* [`nixos/modules/services/web-apps/invidious.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invidious.nix)

## `services.invidious.nginx.enable` {#opt-services.invidious.nginx.enable}

Whether to configure nginx as a reverse proxy for Invidious.

It serves it under the domain specified in `services.invidious.settings.domain` with enabled TLS and ACME.
Further configuration can be done through `services.nginx.virtualHosts.${config.services.invidious.settings.domain}.*`,
which can also be used to disable AMCE and TLS.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/invidious.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invidious.nix)

## `services.invidious.package` {#opt-services.invidious.package}

The invidious package to use.

*Type:* package

*Default:* `pkgs.invidious`

*Declared by:* [`nixos/modules/services/web-apps/invidious.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invidious.nix)

## `services.invidious.port` {#opt-services.invidious.port}

The port Invidious should listen on.

To allow access from outside,
you can use either `services.invidious.nginx`
or add `config.services.invidious.port` to [`networking.firewall.allowedTCPPorts`](../../options/networking/index.md#opt-networking.firewall.allowedTCPPorts).

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/web-apps/invidious.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invidious.nix)

## `services.invidious.serviceScale` {#opt-services.invidious.serviceScale}

How many invidious instances to run.

See [https://docs.invidious.io/improve-public-instance/#2-multiple-invidious-processes](https://docs.invidious.io/improve-public-instance/#2-multiple-invidious-processes) for more details
on how this is intended to work. All instances beyond the first one have the options `channel_threads`
and `feed_threads` set to 0 to avoid conflicts with multiple instances refreshing subscriptions. Instances
will be configured to bind to consecutive ports starting with [`services.invidious.port`](#opt-services.invidious.port) for the
first instance.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/web-apps/invidious.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invidious.nix)

## `services.invidious.settings` {#opt-services.invidious.settings}

The settings Invidious should use.

See [config.example.yml](https://github.com/iv-org/invidious/blob/master/config/config.example.yml) for a list of all possible options.

*Type:* JSON value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/invidious.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invidious.nix)

## `services.invidious.sig-helper.enable` {#opt-services.invidious.sig-helper.enable}

Whether to enable and configure inv-sig-helper to emulate the youtube client's javascript. This is required
to make certain videos playable.

This will download and run completely untrusted javascript from youtube! While this service is sandboxed,
this may still be an issue!

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/invidious.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invidious.nix)

## `services.invidious.sig-helper.listenAddress` {#opt-services.invidious.sig-helper.listenAddress}

The IP address/port where inv-sig-helper should listen.

*Type:* string

*Default:* `"127.0.0.1:2999"`

*Declared by:* [`nixos/modules/services/web-apps/invidious.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invidious.nix)

## `services.invidious.sig-helper.package` {#opt-services.invidious.sig-helper.package}

The inv-sig-helper package to use.

*Type:* package

*Default:* `pkgs.inv-sig-helper`

*Declared by:* [`nixos/modules/services/web-apps/invidious.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invidious.nix)

## `services.invoiceplane` {#opt-services.invoiceplane}

InvoicePlane configuration.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/invoiceplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invoiceplane.nix)

## `services.invoiceplane.sites` {#opt-services.invoiceplane.sites}

Specification of one or more InvoicePlane sites to serve

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/invoiceplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invoiceplane.nix)

## `services.invoiceplane.sites.<name>.cron.enable` {#opt-services.invoiceplane.sites._name_.cron.enable}

Enable cron service which periodically runs Invoiceplane tasks.
Requires key taken from the administration page. Refer to
[https://wiki.invoiceplane.com/en/1.0/modules/recurring-invoices](https://wiki.invoiceplane.com/en/1.0/modules/recurring-invoices)
on how to configure it.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/invoiceplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invoiceplane.nix)

## `services.invoiceplane.sites.<name>.cron.key` {#opt-services.invoiceplane.sites._name_.cron.key}

Cron key taken from the administration page.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/invoiceplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invoiceplane.nix)

## `services.invoiceplane.sites.<name>.database.createLocally` {#opt-services.invoiceplane.sites._name_.database.createLocally}

Create the database and database user locally.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/invoiceplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invoiceplane.nix)

## `services.invoiceplane.sites.<name>.database.host` {#opt-services.invoiceplane.sites._name_.database.host}

Database host address.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/invoiceplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invoiceplane.nix)

## `services.invoiceplane.sites.<name>.database.name` {#opt-services.invoiceplane.sites._name_.database.name}

Database name.

*Type:* string

*Default:* `"invoiceplane"`

*Declared by:* [`nixos/modules/services/web-apps/invoiceplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invoiceplane.nix)

## `services.invoiceplane.sites.<name>.database.passwordFile` {#opt-services.invoiceplane.sites._name_.database.passwordFile}

A file containing the password corresponding to
`database.user`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/invoiceplane-dbpassword"`

*Declared by:* [`nixos/modules/services/web-apps/invoiceplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invoiceplane.nix)

## `services.invoiceplane.sites.<name>.database.port` {#opt-services.invoiceplane.sites._name_.database.port}

Database host port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3306`

*Declared by:* [`nixos/modules/services/web-apps/invoiceplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invoiceplane.nix)

## `services.invoiceplane.sites.<name>.database.user` {#opt-services.invoiceplane.sites._name_.database.user}

Database user.

*Type:* string

*Default:* `"invoiceplane"`

*Declared by:* [`nixos/modules/services/web-apps/invoiceplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invoiceplane.nix)

## `services.invoiceplane.sites.<name>.enable` {#opt-services.invoiceplane.sites._name_.enable}

Whether to enable InvoicePlane web application.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/invoiceplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invoiceplane.nix)

## `services.invoiceplane.sites.<name>.invoiceTemplates` {#opt-services.invoiceplane.sites._name_.invoiceTemplates}

List of path(s) to respective template(s) which are copied from the 'invoice\_templates/pdf' directory.

::: note
These templates need to be packaged before use, see example.
:::

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
let
  # Let's package an example template
  template-vtdirektmarketing = pkgs.stdenv.mkDerivation {
    name = "vtdirektmarketing";
    # Download the template from a public repository
    src = pkgs.fetchgit {
      url = "https://git.project-insanity.org/onny/invoiceplane-vtdirektmarketing.git";
      sha256 = "1hh0q7wzsh8v8x03i82p6qrgbxr4v5fb05xylyrpp975l8axyg2z";
    };
    sourceRoot = ".";
    # Installing simply means copying template php file to the output directory
    installPhase = ""
      mkdir -p $out
      cp invoiceplane-vtdirektmarketing/vtdirektmarketing.php $out/
    "";
  };
# And then pass this package to the template list like this:
in [ template-vtdirektmarketing ]
```

*Declared by:* [`nixos/modules/services/web-apps/invoiceplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invoiceplane.nix)

## `services.invoiceplane.sites.<name>.poolConfig` {#opt-services.invoiceplane.sites._name_.poolConfig}

Options for the InvoicePlane PHP pool. See the documentation on `php-fpm.conf`
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

*Declared by:* [`nixos/modules/services/web-apps/invoiceplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invoiceplane.nix)

## `services.invoiceplane.sites.<name>.quoteTemplates` {#opt-services.invoiceplane.sites._name_.quoteTemplates}

List of path(s) to respective template(s) which are copied from the 'quote\_templates/pdf' directory.

::: note
These templates need to be packaged before use, see example.
:::

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
let
  # Let's package an example template
  template-vtdirektmarketing = pkgs.stdenv.mkDerivation {
    name = "vtdirektmarketing";
    # Download the template from a public repository
    src = pkgs.fetchgit {
      url = "https://git.project-insanity.org/onny/invoiceplane-vtdirektmarketing.git";
      sha256 = "1hh0q7wzsh8v8x03i82p6qrgbxr4v5fb05xylyrpp975l8axyg2z";
    };
    sourceRoot = ".";
    # Installing simply means copying template php file to the output directory
    installPhase = ""
      mkdir -p $out
      cp invoiceplane-vtdirektmarketing/vtdirektmarketing.php $out/
    "";
  };
# And then pass this package to the template list like this:
in [ template-vtdirektmarketing ]
```

*Declared by:* [`nixos/modules/services/web-apps/invoiceplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invoiceplane.nix)

## `services.invoiceplane.sites.<name>.settings` {#opt-services.invoiceplane.sites._name_.settings}

Structural InvoicePlane configuration. Refer to
[https://github.com/InvoicePlane/InvoicePlane/blob/master/ipconfig.php.example](https://github.com/InvoicePlane/InvoicePlane/blob/master/ipconfig.php.example)
for details and supported values.

*Type:* attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  SETUP_COMPLETED = true;
  DISABLE_SETUP = true;
  IP_URL = "https://invoice.example.com";
}
```

*Declared by:* [`nixos/modules/services/web-apps/invoiceplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invoiceplane.nix)

## `services.invoiceplane.sites.<name>.stateDir` {#opt-services.invoiceplane.sites._name_.stateDir}

This directory is used for uploads of attachments and cache.
The directory passed here is automatically created and permissions
adjusted as required.

*Type:* absolute path

*Default:* `"/var/lib/invoiceplane/‹name›"`

*Declared by:* [`nixos/modules/services/web-apps/invoiceplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invoiceplane.nix)

## `services.invoiceplane.webserver` {#opt-services.invoiceplane.webserver}

Which webserver to use for virtual host management.

*Type:* one of "caddy", "nginx"

*Default:* `"caddy"`

*Example:* `"nginx"`

*Declared by:* [`nixos/modules/services/web-apps/invoiceplane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/invoiceplane.nix)

## `services.iocaine.enable` {#opt-services.iocaine.enable}

Whether to enable iocaine, the deadliest poison known to AI.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/iocaine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iocaine.nix)

## `services.iocaine.environment` {#opt-services.iocaine.environment}

Environment variables for iocaine.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  RUST_LOG = "info";
  RUST_BACKTRACE = "1";
}
```

*Declared by:* [`nixos/modules/services/networking/iocaine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iocaine.nix)

## `services.iocaine.extraSettingsPaths` {#opt-services.iocaine.extraSettingsPaths}

Configuration paths to run iocaine with. Useful for secrets

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/etc/iocaine/iocaine.json"
  ./iocaine.json
]
```

*Declared by:* [`nixos/modules/services/networking/iocaine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iocaine.nix)

## `services.iocaine.package` {#opt-services.iocaine.package}

The iocaine package to use.

*Type:* package

*Default:* `pkgs.iocaine`

*Declared by:* [`nixos/modules/services/networking/iocaine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iocaine.nix)

## `services.iocaine.settings` {#opt-services.iocaine.settings}

The configuration for iocaine.
See [the configuration reference](https://iocaine.madhouse-project.org/documentation/3/configuration/)
for full documentation on the fields.

*Type:* null or (open submodule of (JSON value))

*Default:* `null`

*Example:*

``` nix
{
  server.default = {
    bind = "localhost:2137";
    mode = "http";
    use.handler-from = "default";
  };

  handler.default = {
    settings = {
      "ai-robots-txt-path" = "/etc/iocaine/data/ai.robots.txt-robots.json";
      sources = {
        training-corpus = [
          "/data/corpus/1984.txt"
          "/data/corpus/brave-new-world.txt"
        ];
        wordlists = [ "/data/corpus/words.txt" ];
      };
    };
  };
}
```

*Declared by:* [`nixos/modules/services/networking/iocaine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iocaine.nix)

## `services.iocaine.settings.firewall.enable` {#opt-services.iocaine.settings.firewall.enable}

Enables the firewall

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/iocaine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iocaine.nix)

## `services.iodine.clients` {#opt-services.iodine.clients}

Each attribute of this option defines a systemd service that
runs iodine. Many or none may be defined.
The name of each service is
`iodine-«name»`
where «name» is the name of the
corresponding attribute name.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  foo = {
    server = "tunnel.mdomain.com";
    relay = "8.8.8.8";
    extraConfig = "-v";
  }
}
```

*Declared by:* [`nixos/modules/services/networking/iodine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iodine.nix)

## `services.iodine.clients.<name>.extraConfig` {#opt-services.iodine.clients._name_.extraConfig}

Additional command line parameters

*Type:* string

*Default:* `""`

*Example:* `"-l 192.168.1.10 -p 23"`

*Declared by:* [`nixos/modules/services/networking/iodine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iodine.nix)

## `services.iodine.clients.<name>.passwordFile` {#opt-services.iodine.clients._name_.passwordFile}

Path to a file containing the password.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/iodine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iodine.nix)

## `services.iodine.clients.<name>.relay` {#opt-services.iodine.clients._name_.relay}

DNS server to use as an intermediate relay to the iodined server

*Type:* string

*Default:* `""`

*Example:* `"8.8.8.8"`

*Declared by:* [`nixos/modules/services/networking/iodine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iodine.nix)

## `services.iodine.clients.<name>.server` {#opt-services.iodine.clients._name_.server}

Hostname of server running iodined

*Type:* string

*Default:* `""`

*Example:* `"tunnel.mydomain.com"`

*Declared by:* [`nixos/modules/services/networking/iodine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iodine.nix)

## `services.iodine.server.domain` {#opt-services.iodine.server.domain}

Domain or subdomain of which nameservers point to us

*Type:* string

*Default:* `""`

*Example:* `"tunnel.mydomain.com"`

*Declared by:* [`nixos/modules/services/networking/iodine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iodine.nix)

## `services.iodine.server.enable` {#opt-services.iodine.server.enable}

enable iodined server

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/iodine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iodine.nix)

## `services.iodine.server.extraConfig` {#opt-services.iodine.server.extraConfig}

Additional command line parameters

*Type:* string

*Default:* `""`

*Example:* `"-l 192.168.1.10 -p 23"`

*Declared by:* [`nixos/modules/services/networking/iodine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iodine.nix)

## `services.iodine.server.ip` {#opt-services.iodine.server.ip}

The assigned ip address or ip range

*Type:* string

*Default:* `""`

*Example:* `"172.16.10.1/24"`

*Declared by:* [`nixos/modules/services/networking/iodine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iodine.nix)

## `services.iodine.server.passwordFile` {#opt-services.iodine.server.passwordFile}

File that contains password

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/iodine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iodine.nix)

## `services.iperf3.affinity` {#opt-services.iperf3.affinity}

CPU affinity for the process.

*Type:* null or (unsigned integer, meaning \>=0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/iperf3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iperf3.nix)

## `services.iperf3.authorizedUsersFile` {#opt-services.iperf3.authorizedUsersFile}

Path to the configuration file containing authorized users credentials to run iperf tests.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/iperf3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iperf3.nix)

## `services.iperf3.bind` {#opt-services.iperf3.bind}

Bind to the specific interface associated with the given address.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/iperf3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iperf3.nix)

## `services.iperf3.debug` {#opt-services.iperf3.debug}

Emit debugging output.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/iperf3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iperf3.nix)

## `services.iperf3.enable` {#opt-services.iperf3.enable}

Whether to enable iperf3 network throughput testing server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/iperf3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iperf3.nix)

## `services.iperf3.extraFlags` {#opt-services.iperf3.extraFlags}

Extra flags to pass to iperf3(1).

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/iperf3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iperf3.nix)

## `services.iperf3.forceFlush` {#opt-services.iperf3.forceFlush}

Force flushing output at every interval.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/iperf3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iperf3.nix)

## `services.iperf3.openFirewall` {#opt-services.iperf3.openFirewall}

Open ports in the firewall for iperf3.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/iperf3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iperf3.nix)

## `services.iperf3.package` {#opt-services.iperf3.package}

The iperf3 package to use.

*Type:* package

*Default:* `pkgs.iperf3`

*Declared by:* [`nixos/modules/services/networking/iperf3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iperf3.nix)

## `services.iperf3.port` {#opt-services.iperf3.port}

Server port to listen on for iperf3 client requests.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5201`

*Declared by:* [`nixos/modules/services/networking/iperf3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iperf3.nix)

## `services.iperf3.rsaPrivateKey` {#opt-services.iperf3.rsaPrivateKey}

Path to the RSA private key (not password-protected) used to decrypt authentication credentials from the client.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/iperf3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iperf3.nix)

## `services.iperf3.verbose` {#opt-services.iperf3.verbose}

Give more detailed output.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/iperf3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iperf3.nix)

## `services.ipfs-cluster.consensus` {#opt-services.ipfs-cluster.consensus}

Consensus protocol - 'raft' or 'crdt'. [https://cluster.ipfs.io/documentation/guides/consensus/](https://cluster.ipfs.io/documentation/guides/consensus/)

*Type:* one of "raft", "crdt"

*Declared by:* [`nixos/modules/services/network-filesystems/ipfs-cluster.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ipfs-cluster.nix)

## `services.ipfs-cluster.dataDir` {#opt-services.ipfs-cluster.dataDir}

The data dir for ipfs-cluster.

*Type:* string

*Default:* `"/var/lib/ipfs-cluster"`

*Declared by:* [`nixos/modules/services/network-filesystems/ipfs-cluster.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ipfs-cluster.nix)

## `services.ipfs-cluster.enable` {#opt-services.ipfs-cluster.enable}

Whether to enable Pinset orchestration for IPFS - requires ipfs daemon to be useful.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/ipfs-cluster.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ipfs-cluster.nix)

## `services.ipfs-cluster.initPeers` {#opt-services.ipfs-cluster.initPeers}

Peer addresses to initialize with on first run.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/network-filesystems/ipfs-cluster.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ipfs-cluster.nix)

## `services.ipfs-cluster.openSwarmPort` {#opt-services.ipfs-cluster.openSwarmPort}

Open swarm port, secured by the cluster secret. This does not expose the API or proxy. [https://cluster.ipfs.io/documentation/guides/security/](https://cluster.ipfs.io/documentation/guides/security/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/ipfs-cluster.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ipfs-cluster.nix)

## `services.ipfs-cluster.secretFile` {#opt-services.ipfs-cluster.secretFile}

File containing the cluster secret in the format of EnvironmentFile as described by
`systemd.exec(5)`. For example:
<programlisting>
CLUSTER\_SECRET=<replaceable>...</replaceable>
</programlisting>

If null, a new secret will be generated on first run and stored in the data directory.
A secret in the correct format can also be generated by: `openssl rand -hex 32`

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/network-filesystems/ipfs-cluster.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ipfs-cluster.nix)

## `services.ipp-usb.enable` {#opt-services.ipp-usb.enable}

Whether to enable ipp-usb, a daemon to turn an USB printer/scanner supporting IPP everywhere (aka AirPrint, WSD, AirScan) into a locally accessible network printer/scanner.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/printing/ipp-usb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/printing/ipp-usb.nix)

## `services.iptsd.config` {#opt-services.iptsd.config}

Configuration for IPTSD. See the
[reference configuration](https://github.com/linux-surface/iptsd/blob/master/etc/iptsd.conf)
for available options and defaults.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/hardware/iptsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/iptsd.nix)

## `services.iptsd.config.Stylus.Disable` {#opt-services.iptsd.config.Stylus.Disable}

Disables the stylus. No stylus data will be processed.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/iptsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/iptsd.nix)

## `services.iptsd.config.Touchscreen.DisableOnPalm` {#opt-services.iptsd.config.Touchscreen.DisableOnPalm}

Ignore all touchscreen inputs if a palm was registered on the display.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/iptsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/iptsd.nix)

## `services.iptsd.config.Touchscreen.DisableOnStylus` {#opt-services.iptsd.config.Touchscreen.DisableOnStylus}

Ignore all touchscreen inputs if a stylus is in proximity.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/iptsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/iptsd.nix)

## `services.iptsd.enable` {#opt-services.iptsd.enable}

Whether to enable the userspace daemon for Intel Precise Touch & Stylus.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/iptsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/iptsd.nix)

## `services.ircdHybrid.adminEmail` {#opt-services.ircdHybrid.adminEmail}

IRCD server administrator e-mail.

*Type:* string

*Default:* `"<bit-bucket@example.com>"`

*Example:* `"<name@domain.tld>"`

*Declared by:* [`nixos/modules/services/networking/ircd-hybrid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ircd-hybrid/default.nix)

## `services.ircdHybrid.certificate` {#opt-services.ircdHybrid.certificate}

IRCD server SSL certificate. There are some limitations - read manual.

*Type:* null or absolute path

*Default:* `null`

*Example:* `/root/certificates/irc.pem`

*Declared by:* [`nixos/modules/services/networking/ircd-hybrid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ircd-hybrid/default.nix)

## `services.ircdHybrid.description` {#opt-services.ircdHybrid.description}

IRCD server description.

*Type:* string

*Default:* `"Hybrid-7 IRC server."`

*Declared by:* [`nixos/modules/services/networking/ircd-hybrid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ircd-hybrid/default.nix)

## `services.ircdHybrid.enable` {#opt-services.ircdHybrid.enable}

Whether to enable IRCD.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ircd-hybrid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ircd-hybrid/default.nix)

## `services.ircdHybrid.extraIPs` {#opt-services.ircdHybrid.extraIPs}

Extra IP's to bind.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "127.0.0.1"
]
```

*Declared by:* [`nixos/modules/services/networking/ircd-hybrid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ircd-hybrid/default.nix)

## `services.ircdHybrid.extraPort` {#opt-services.ircdHybrid.extraPort}

Extra port to avoid filtering.

*Type:* string

*Default:* `"7117"`

*Declared by:* [`nixos/modules/services/networking/ircd-hybrid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ircd-hybrid/default.nix)

## `services.ircdHybrid.rsaKey` {#opt-services.ircdHybrid.rsaKey}

IRCD server RSA key.

*Type:* null or absolute path

*Default:* `null`

*Example:* `/root/certificates/irc.key`

*Declared by:* [`nixos/modules/services/networking/ircd-hybrid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ircd-hybrid/default.nix)

## `services.ircdHybrid.serverName` {#opt-services.ircdHybrid.serverName}

IRCD server name.

*Type:* string

*Default:* `"hades.arpa"`

*Declared by:* [`nixos/modules/services/networking/ircd-hybrid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ircd-hybrid/default.nix)

## `services.ircdHybrid.sid` {#opt-services.ircdHybrid.sid}

IRCD server unique ID in a net of servers.

*Type:* string

*Default:* `"0NL"`

*Declared by:* [`nixos/modules/services/networking/ircd-hybrid/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ircd-hybrid/default.nix)

## `services.irkerd.enable` {#opt-services.irkerd.enable}

Whether to enable irker, an IRC notification daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/irkerd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/irkerd.nix)

## `services.irkerd.listenAddress` {#opt-services.irkerd.listenAddress}

Specifies the bind address on which the irker daemon listens.
The default is localhost.

Irker authors strongly warn about the risks of running this on
a publicly accessible interface, so change this with caution.

*Type:* string

*Default:* `"localhost"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/irkerd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/irkerd.nix)

## `services.irkerd.nick` {#opt-services.irkerd.nick}

Nick to use for irker

*Type:* string

*Default:* `"irker"`

*Declared by:* [`nixos/modules/services/misc/irkerd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/irkerd.nix)

## `services.irkerd.openPorts` {#opt-services.irkerd.openPorts}

Open ports in the firewall for irkerd

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/irkerd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/irkerd.nix)

## `services.irqbalance.enable` {#opt-services.irqbalance.enable}

Whether to enable irqbalance daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/irqbalance.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/irqbalance.nix)

## `services.irqbalance.package` {#opt-services.irqbalance.package}

The irqbalance package to use.

*Type:* package

*Default:* `pkgs.irqbalance`

*Declared by:* [`nixos/modules/services/hardware/irqbalance.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/irqbalance.nix)

## `services.isso.enable` {#opt-services.isso.enable}

Whether to enable isso, a commenting server similar to Disqus.

Note: The application's author suppose to run isso behind a reverse proxy.
The embedded solution offered by NixOS is also only suitable for small installations
below 20 requests per second
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/isso.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/isso.nix)

## `services.isso.secretFile` {#opt-services.isso.secretFile}

A file containing secrets as environment variables that will be used in the configuration.
See [the documentation](https://isso-comments.de/docs/reference/server-config/#environment-variables) for details.

*Type:* null or string

*Default:* `null`

*Example:* `"/run/secrets/isso.env"`

*Declared by:* [`nixos/modules/services/web-apps/isso.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/isso.nix)

## `services.isso.settings` {#opt-services.isso.settings}

Configuration for `isso`.

See [Isso Server Configuration](https://posativ.org/isso/docs/configuration/server/)
for supported values.
You can set secrets using the secretFile option with environment variables following
[the documentation](https://isso-comments.de/docs/reference/server-config/#environment-variables).

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Example:*

``` nix
{
  general = {
    host = "http://localhost";
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/isso.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/isso.nix)

## `services.ivpn.enable` {#opt-services.ivpn.enable}

This option enables iVPN daemon.
This sets [`networking.firewall.checkReversePath`](../../options/networking/index.md#opt-networking.firewall.checkReversePath) to "loose", which might be undesirable for security.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ivpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ivpn.nix)
