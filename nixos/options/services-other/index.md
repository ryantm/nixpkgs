# services (other) {#sec-options-services-other}

## `services._3proxy.confFile` {#opt-services._3proxy.confFile}

Ignore all other 3proxy options and load configuration from this file.

*Type:* absolute path

*Example:* `"/var/lib/3proxy/3proxy.conf"`

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.denyPrivate` {#opt-services._3proxy.denyPrivate}

Whether to deny access to private IP ranges including loopback.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.enable` {#opt-services._3proxy.enable}

Whether to enable 3proxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.extraConfig` {#opt-services._3proxy.extraConfig}

Extra configuration, appended to the 3proxy configuration file.
Consult [documentation](https://github.com/z3APA3A/3proxy/wiki/3proxy.cfg) for available options.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.privateRanges` {#opt-services._3proxy.privateRanges}

What IP ranges to deny access when denyPrivate is set tu true.

*Type:* list of string

*Default:*

``` nix
[
  "0.0.0.0/8"
  "127.0.0.0/8"
  "10.0.0.0/8"
  "100.64.0.0/10"
  "172.16.0.0/12"
  "192.168.0.0/16"
  "::"
  "::1"
  "fc00::/7"
]
```

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.resolution` {#opt-services._3proxy.resolution}

Use this option to configure name resolution and DNS caching.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.resolution.nscache` {#opt-services._3proxy.resolution.nscache}

Set name cache size for IPv4.

*Type:* signed integer

*Default:* `65535`

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.resolution.nscache6` {#opt-services._3proxy.resolution.nscache6}

Set name cache size for IPv6.

*Type:* signed integer

*Default:* `65535`

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.resolution.nserver` {#opt-services._3proxy.resolution.nserver}

List of nameservers to use.

Up to 5 nservers may be specified. If no nserver is configured,
default system name resolution functions are used.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "127.0.0.53"
  "192.168.1.3:5353/tcp"
]
```

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.resolution.nsrecord` {#opt-services._3proxy.resolution.nsrecord}

Adds static nsrecords.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  "files.local" = "192.168.1.12";
  "site.local" = "192.168.1.43";
}
```

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.services` {#opt-services._3proxy.services}

Use this option to define 3proxy services.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    type = "proxy";
    bindAddress = "192.168.1.24";
    bindPort = 3128;
    auth = [ "none" ];
  }
  {
    type = "proxy";
    bindAddress = "10.10.1.20";
    bindPort = 3128;
    auth = [ "iponly" ];
  }
  {
    type = "socks";
    bindAddress = "172.17.0.1";
    bindPort = 1080;
    auth = [ "strong" ];
  }
]
```

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.services.*.acl` {#opt-services._3proxy.services._.acl}

Use this option to limit user access to resources.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    rule = "allow";
    users = [ "user1" ];
  }
  {
    rule = "allow";
    sources = [ "192.168.1.0/24" ];
  }
  {
    rule = "deny";
  }
]
```

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.services.*.acl.*.rule` {#opt-services._3proxy.services._.acl._.rule}

ACL rule. The following values are valid:

- `"allow"`: connections allowed.
- `"deny"`: connections not allowed.

*Type:* one of "allow", "deny"

*Example:* `"allow"`

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.services.*.acl.*.sources` {#opt-services._3proxy.services._.acl._.sources}

List of source IP range, use empty list for any.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "127.0.0.1"
  "192.168.1.0/24"
]
```

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.services.*.acl.*.targetPorts` {#opt-services._3proxy.services._.acl._.targetPorts}

List of target ports, use empty list for any.

*Type:* list of 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `[ ]`

*Example:*

``` nix
[
  80
  443
]
```

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.services.*.acl.*.targets` {#opt-services._3proxy.services._.acl._.targets}

List of target IP ranges, use empty list for any.
May also contain host names instead of addresses.
It's possible to use wildmask in the beginning and in the the end of hostname, e.g. `*badsite.com` or `*badcontent*`.
Hostname is only checked if hostname presents in request.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "127.0.0.1"
  "192.168.1.0/24"
]
```

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.services.*.acl.*.users` {#opt-services._3proxy.services._.acl._.users}

List of users, use empty list for any.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "user1"
  "user2"
  "user3"
]
```

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.services.*.auth` {#opt-services._3proxy.services._.auth}

Authentication type. The following values are valid:

- `"none"`: disables both authentication and authorization. You can not use ACLs.
- `"iponly"`: specifies no authentication. ACLs authorization is used.
- `"strong"`: authentication by username/password. If user is not registered their access is denied regardless of ACLs.

Double authentication is possible, e.g.

```
  {
    auth = [ "iponly" "strong" ];
    acl = [
      {
        rule = "allow";
        targets = [ "192.168.0.0/16" ];
      }
      {
        rule = "allow"
        users = [ "user1" "user2" ];
      }
    ];
  }
```

In this example strong username authentication is not required to access 192.168.0.0/16.

*Type:* list of (one of "none", "iponly", "strong")

*Default:* `[ ]`

*Example:*

``` nix
[
  "iponly"
  "strong"
]
```

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.services.*.bindAddress` {#opt-services._3proxy.services._.bindAddress}

Address used for service.

*Type:* string

*Default:* `"[::]"`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.services.*.bindPort` {#opt-services._3proxy.services._.bindPort}

Override default port used for service.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Example:* `3128`

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.services.*.extraArguments` {#opt-services._3proxy.services._.extraArguments}

Extra arguments for service.
Consult "Options" section in [documentation](https://github.com/z3APA3A/3proxy/wiki/3proxy.cfg) for available arguments.

*Type:* null or string

*Default:* `null`

*Example:* `"-46"`

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.services.*.extraConfig` {#opt-services._3proxy.services._.extraConfig}

Extra configuration for service. Use this to configure things like bandwidth limiter or ACL-based redirection.
Consult [documentation](https://github.com/z3APA3A/3proxy/wiki/3proxy.cfg) for available options.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.services.*.maxConnections` {#opt-services._3proxy.services._.maxConnections}

Maximum number of simulationeous connections to this service.

*Type:* signed integer

*Default:* `100`

*Example:* `1000`

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.services.*.type` {#opt-services._3proxy.services._.type}

Service type. The following values are valid:

- `"proxy"`: HTTP/HTTPS proxy (default port 3128).
- `"socks"`: SOCKS 4/4.5/5 proxy (default port 1080).
- `"pop3p"`: POP3 proxy (default port 110).
- `"ftppr"`: FTP proxy (default port 21).
- `"admin"`: Web interface (default port 80).
- `"dnspr"`: Caching DNS proxy (default port 53).
- `"tcppm"`: TCP portmapper.
- `"udppm"`: UDP portmapper.
- `"auto"`: Proxy with protocol autoselection between proxy / socks / tlspr.

*Type:* one of "proxy", "socks", "pop3p", "ftppr", "admin", "dnspr", "tcppm", "udppm", "auto"

*Example:* `"proxy"`

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)

## `services._3proxy.usersFile` {#opt-services._3proxy.usersFile}

Load users and passwords from this file.

Example users file with plain-text passwords:

```
  test1:CL:password1
  test2:CL:password2
```

Example users file with md5-crypted passwords:

```
  test1:CR:$1$tFkisVd2$1GA8JXkRmTXdLDytM/i3a1
  test2:CR:$1$rkpibm5J$Aq1.9VtYAn0JrqZ8M.1ME.
```

You can generate md5-crypted passwords via [https://unix4lyfe.org/crypt/](https://unix4lyfe.org/crypt/)
Note that htpasswd tool generates incompatible md5-crypted passwords.
Consult [documentation](https://github.com/z3APA3A/3proxy/wiki/How-To-%28incomplete%29#USERS) for more information.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/3proxy/3proxy.passwd"`

*Declared by:* [`nixos/modules/services/networking/3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/3proxy.nix)
