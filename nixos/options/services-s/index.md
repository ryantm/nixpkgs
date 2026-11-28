# services (S) {#sec-options-services-s}

## `services.SystemdJournal2Gelf.enable` {#opt-services.SystemdJournal2Gelf.enable}

Whether to enable SystemdJournal2Gelf.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/logging/SystemdJournal2Gelf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/SystemdJournal2Gelf.nix)

## `services.SystemdJournal2Gelf.extraOptions` {#opt-services.SystemdJournal2Gelf.extraOptions}

Any extra flags to pass to SystemdJournal2Gelf. Note that
these are basically `journalctl` flags.

*Type:* strings concatenated with " "

*Default:* `""`

*Declared by:* [`nixos/modules/services/logging/SystemdJournal2Gelf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/SystemdJournal2Gelf.nix)

## `services.SystemdJournal2Gelf.graylogServer` {#opt-services.SystemdJournal2Gelf.graylogServer}

Host and port of your graylog2 input. This should be a GELF
UDP input.

*Type:* string

*Example:* `"graylog2.example.com:11201"`

*Declared by:* [`nixos/modules/services/logging/SystemdJournal2Gelf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/SystemdJournal2Gelf.nix)

## `services.SystemdJournal2Gelf.package` {#opt-services.SystemdJournal2Gelf.package}

The systemd-journal2gelf package to use.

*Type:* package

*Default:* `pkgs.systemd-journal2gelf`

*Declared by:* [`nixos/modules/services/logging/SystemdJournal2Gelf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/SystemdJournal2Gelf.nix)

## `services.sabnzbd.allowConfigWrite` {#opt-services.sabnzbd.allowConfigWrite}

By default we create the sabnzbd configuration read-only,
which keeps the nixos configuration as the single source
of truth. If you want to enable configuration of
sabnzbd via the web interface or use options that require
a writeable configuration, such as quota tracking, enable
this option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.configFile` {#opt-services.sabnzbd.configFile}

Path to config file (deprecated, use `settings` instead and set this value to null)

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.enable` {#opt-services.sabnzbd.enable}

Whether to enable the sabnzbd server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.group` {#opt-services.sabnzbd.group}

Group to run the service as

*Type:* string

*Default:* `"sabnzbd"`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.openFirewall` {#opt-services.sabnzbd.openFirewall}

Open ports in the firewall for the sabnzbd web interface

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.package` {#opt-services.sabnzbd.package}

The sabnzbd package to use.

*Type:* package

*Default:* `pkgs.sabnzbd`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.secretFiles` {#opt-services.sabnzbd.secretFiles}

Path to a list of ini file containing confidential settings such as credentials.
Settings here will be merged with the rest of the configuration (with
the secret settings taking precedence in case of conflicts, and files
that occur later in this list taking precedence over those that
occur earlier).
Recommended settings:

- misc.api\_key, misc.nzb\_key, misc.username, misc.password
- misc.email\_account, misc.email\_pwd if email alerts are enabled
- servers.<name>.username, servers.<name>.password

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.secretValues` {#opt-services.sabnzbd.secretValues}

Attrset of patterns in the settings that should be replaced at
runtime, just before the service starts, with values read from the
given files. The files must be readable by the service user.

Compared to the secretFiles option, secretValues allows having the
full settings structure in Nix, and only externalizing the secret
values themselves.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
{
  "@my_server_password@" = "/run/secrets/my_server_password";
  "@my_server_username@" = "/run/secrets/my_server_username";
  "@sabnzbd_api_key@" = "/run/secrets/sabnzbd_api_key";
  "@sabnzbd_nzb_key@" = "/run/secrets/sabnzbd_nzb_key";
}
```

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings` {#opt-services.sabnzbd.settings}

The sabnzbd configuration (see also
[sabnzbd's wiki](https://sabnzbd.org/wiki/configuration/4.5/configure)
for extra documentation)

*Type:* open submodule of (ConfigObj mapping value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.misc.bandwidth_max` {#opt-services.sabnzbd.settings.misc.bandwidth_max}

Maximum bandwidth in bytes(!)/sec (supports prefixes). Use
in conjunction with `bandwidth_perc` to set a bandwidth
limit. Empty string disables limit.

*Type:* string

*Default:* `""`

*Example:* `"50MB/s"`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.misc.bandwidth_perc` {#opt-services.sabnzbd.settings.misc.bandwidth_perc}

Percentage of `bandwidth_max` that sabnzbd is allowed to use.
0 means no limit.

*Type:* signed integer

*Default:* `0`

*Example:* `50`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.misc.cache_limit` {#opt-services.sabnzbd.settings.misc.cache_limit}

Size of the RAM cache, in bytes (prefixes supported).
Sabnzbd recommends 25% of available RAM. Empty means
no cache.

*Type:* string

*Default:* `""`

*Example:* `"500M"`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.misc.email_endjob` {#opt-services.sabnzbd.settings.misc.email_endjob}

Whether to send emails on job completion. Values are:
0, 'never'    -- Never
1, 'always'   -- Always
2, 'on error' -- On error

*Type:* (one of 1, 0, 2) or (one of "always", "never", "on error") convertible to it

*Default:* `"if cfg.settings.misc.email_server != \"\" then \"on error\" else \"never\""`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.misc.email_from` {#opt-services.sabnzbd.settings.misc.email_from}

'From:' field for emails (needs to be an address)

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.misc.email_full` {#opt-services.sabnzbd.settings.misc.email_full}

Whether to send alerts for full disks

*Type:* boolean

*Default:* `"cfg.settings.misc.email_server != \"\""`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.misc.email_rss` {#opt-services.sabnzbd.settings.misc.email_rss}

Whether to send alerts for jobs added by RSS feeds

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.misc.email_server` {#opt-services.sabnzbd.settings.misc.email_server}

SMTP server for email alerts (server:host)

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.misc.email_to` {#opt-services.sabnzbd.settings.misc.email_to}

Receiving address for email alerts

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.misc.enable_https` {#opt-services.sabnzbd.settings.misc.enable_https}

Whether to enable HTTPS for the web UI

*Type:* boolean

*Default:* `"cfg.settings.misc.https_cert != null"`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.misc.host` {#opt-services.sabnzbd.settings.misc.host}

Address for the Web UI to listen on for incoming connections.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.misc.html_login` {#opt-services.sabnzbd.settings.misc.html_login}

Prompt for login with an html login mask if enabled,
otherwise prompt for basic auth (useful for SSO)

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.misc.https_cert` {#opt-services.sabnzbd.settings.misc.https_cert}

Path to the TLS certificate for the web UI. If not set
and https is enabled, a self-signed certificate will
be generated.

*Type:* null or absolute path

*Default:* `null`

*Example:* `${config.acme.certs.${domain}.directory}/fullchain.pem`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.misc.https_key` {#opt-services.sabnzbd.settings.misc.https_key}

Path to the TLS key for the web UI. If not set and
https is enabled, a self-signed certificate will be
generated

*Type:* null or absolute path

*Default:* `null`

*Example:* `${config.acme.certs.${domain}.directory}/key.pem`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.misc.inet_exposure` {#opt-services.sabnzbd.settings.misc.inet_exposure}

Restrictions for access from non-local IP addresses.
Values are:
0, 'none'                      -- no access
1, 'api (add nzbs)'            -- api access only, only add nzb files
2, 'api (no config)'           -- api access only, config changes not allowed
3, 'api (full)'                -- api access only, full api access
4, 'api+web (auth needed)'     -- api and web ui, login required always
5, 'api+web (locally no auth)' -- api and web ui, login required from non-local IPs only

*Type:* (one of 1, 3, 2, 4, 5, 0) or (one of "api (add nzbs)", "api (full)", "api (no config)", "api+web (auth needed)", "api+web (locally no auth)", "none") convertible to it

*Default:* `"none"`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.misc.port` {#opt-services.sabnzbd.settings.misc.port}

Port for the Web UI to listen on for incoming connections.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Example:* `12345`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.ntfosd` {#opt-services.sabnzbd.settings.ntfosd}

NotifyOSD settings

*Type:* open submodule of (ConfigObj mapping value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.ntfosd.ntfosd_enable` {#opt-services.sabnzbd.settings.ntfosd.ntfosd_enable}

Whether to enable NotifyOSD alerts. Does not really make sense
in a server environment, hence we default to false despite
upstream's default true.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.servers` {#opt-services.sabnzbd.settings.servers}

Usenet provider specification

*Type:* attribute set of (open submodule of (ConfigObj mapping value))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.servers.<name>.connections` {#opt-services.sabnzbd.settings.servers._name_.connections}

Number of parallel connections permitted by
the server.

*Type:* signed integer

*Default:* `8`

*Example:* `50`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.servers.<name>.displayname` {#opt-services.sabnzbd.settings.servers._name_.displayname}

Human-friendly description of the server

*Type:* string

*Example:* `"Example News Provider"`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.servers.<name>.enable` {#opt-services.sabnzbd.settings.servers._name_.enable}

Enable this server by default

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.servers.<name>.expire_date` {#opt-services.sabnzbd.settings.servers._name_.expire_date}

If Notifications are enabled and an expiry date is
set, warn 5 days before expiry. This setting
does not automatically disable the server.
Expected format: yyyy-mm-dd

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.servers.<name>.host` {#opt-services.sabnzbd.settings.servers._name_.host}

Hostname of the server

*Type:* string

*Example:* `"news.example.com"`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.servers.<name>.name` {#opt-services.sabnzbd.settings.servers._name_.name}

The name of the server

*Type:* string

*Example:* `"Example News Provider"`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.servers.<name>.optional` {#opt-services.sabnzbd.settings.servers._name_.optional}

In case of connection failures, temporarily
disable this server. (See sabnzbd's documentation
for usage guides).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.servers.<name>.port` {#opt-services.sabnzbd.settings.servers._name_.port}

Port of the server

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `563`

*Example:* `443`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.servers.<name>.priority` {#opt-services.sabnzbd.settings.servers._name_.priority}

Priority of this servers. Servers are queried in
order of priority, from highest (0) to lowest (100).

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.servers.<name>.required` {#opt-services.sabnzbd.settings.servers._name_.required}

In case of connection failures, wait for the
server to come back online instead of skipping
it.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.servers.<name>.ssl` {#opt-services.sabnzbd.settings.servers._name_.ssl}

Whether the server supports TLS

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.servers.<name>.ssl_verify` {#opt-services.sabnzbd.settings.servers._name_.ssl_verify}

Level of TLS verification. Supported values:
3, 'strict'          -- strict (normal) verification
2, 'allow injection' -- allow locally injected certificates
0, 'none'            -- no verification

*Type:* (one of 2, 0, 3) or (one of "allow injection", "none", "strict") convertible to it

*Default:* `"strict"`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.settings.servers.<name>.timeout` {#opt-services.sabnzbd.settings.servers._name_.timeout}

Time, in seconds, to wait for a response before
attempting error recovery.

*Type:* signed integer

*Default:* `60`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.stateDir` {#opt-services.sabnzbd.stateDir}

State directory of the service under /var/lib/

*Type:* string

*Default:* `"sabnzbd"`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.sabnzbd.user` {#opt-services.sabnzbd.user}

User to run the service as

*Type:* string

*Default:* `"sabnzbd"`

*Declared by:* [`nixos/modules/services/networking/sabnzbd`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sabnzbd)

## `services.safeeyes.enable` {#opt-services.safeeyes.enable}

Whether to enable the safeeyes OSGi service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/safeeyes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/safeeyes.nix)

## `services.salt.master.configuration` {#opt-services.salt.master.configuration}

Salt master configuration as Nix attribute set.

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/admin/salt/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/salt/master.nix)

## `services.salt.master.enable` {#opt-services.salt.master.enable}

Whether to enable Salt configuration management system master service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/admin/salt/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/salt/master.nix)

## `services.salt.minion.configuration` {#opt-services.salt.minion.configuration}

Salt minion configuration as Nix attribute set.
See [https://docs.saltstack.com/en/latest/ref/configuration/minion.html](https://docs.saltstack.com/en/latest/ref/configuration/minion.html)
for details.

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/admin/salt/minion.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/salt/minion.nix)

## `services.salt.minion.enable` {#opt-services.salt.minion.enable}

Whether to enable Salt configuration management system minion service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/admin/salt/minion.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/salt/minion.nix)

## `services.samba-wsdd.discovery` {#opt-services.samba-wsdd.discovery}

Enable discovery operation mode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/samba-wsdd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba-wsdd.nix)

## `services.samba-wsdd.domain` {#opt-services.samba-wsdd.domain}

Set domain name (disables workgroup).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/network-filesystems/samba-wsdd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba-wsdd.nix)

## `services.samba-wsdd.enable` {#opt-services.samba-wsdd.enable}

Whether to enable Web Services Dynamic Discovery host daemon. This enables (Samba) hosts, like your local NAS device,
to be found by Web Service Discovery Clients like Windows
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/samba-wsdd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba-wsdd.nix)

## `services.samba-wsdd.extraOptions` {#opt-services.samba-wsdd.extraOptions}

Additional wsdd options.

*Type:* list of string

*Default:*

``` nix
[
  "--shortlog"
]
```

*Example:*

``` nix
[
  "--verbose"
  "--no-http"
  "--ipv4only"
  "--no-host"
]
```

*Declared by:* [`nixos/modules/services/network-filesystems/samba-wsdd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba-wsdd.nix)

## `services.samba-wsdd.hoplimit` {#opt-services.samba-wsdd.hoplimit}

Hop limit for multicast packets (default = 1).

*Type:* null or signed integer

*Default:* `null`

*Example:* `2`

*Declared by:* [`nixos/modules/services/network-filesystems/samba-wsdd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba-wsdd.nix)

## `services.samba-wsdd.hostname` {#opt-services.samba-wsdd.hostname}

Override (NetBIOS) hostname to be used (default hostname).

*Type:* null or string

*Default:* `null`

*Example:* `"FILESERVER"`

*Declared by:* [`nixos/modules/services/network-filesystems/samba-wsdd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba-wsdd.nix)

## `services.samba-wsdd.interface` {#opt-services.samba-wsdd.interface}

Interface or address to use.

*Type:* null or string

*Default:* `null`

*Example:* `"eth0"`

*Declared by:* [`nixos/modules/services/network-filesystems/samba-wsdd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba-wsdd.nix)

## `services.samba-wsdd.listen` {#opt-services.samba-wsdd.listen}

Listen on path or localhost port in discovery mode.

*Type:* string

*Default:* `"/run/wsdd/wsdd.sock"`

*Declared by:* [`nixos/modules/services/network-filesystems/samba-wsdd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba-wsdd.nix)

## `services.samba-wsdd.openFirewall` {#opt-services.samba-wsdd.openFirewall}

Whether to open the required firewall ports in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/samba-wsdd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba-wsdd.nix)

## `services.samba-wsdd.workgroup` {#opt-services.samba-wsdd.workgroup}

Set workgroup name (default WORKGROUP).

*Type:* null or string

*Default:* `null`

*Example:* `"HOME"`

*Declared by:* [`nixos/modules/services/network-filesystems/samba-wsdd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba-wsdd.nix)

## `services.samba.enable` {#opt-services.samba.enable}

Whether to enable Samba, the SMB/CIFS protocol.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/samba.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba.nix)

## `services.samba.nmbd.enable` {#opt-services.samba.nmbd.enable}

Whether to enable Samba's nmbd, which replies to NetBIOS over IP name
service requests. It also participates in the browsing protocols
which make up the Windows "Network Neighborhood" view.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/samba.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba.nix)

## `services.samba.nmbd.extraArgs` {#opt-services.samba.nmbd.extraArgs}

Extra arguments to pass to the nmbd service.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/network-filesystems/samba.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba.nix)

## `services.samba.nsswins` {#opt-services.samba.nsswins}

Whether to enable WINS NSS (Name Service Switch) plug-in.

Enabling it allows applications to resolve WINS/NetBIOS names (a.k.a.
Windows machine names) by transparently querying the winbindd daemon
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/samba.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba.nix)

## `services.samba.openFirewall` {#opt-services.samba.openFirewall}

Whether to enable opening the default ports in the firewall for Samba.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/samba.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba.nix)

## `services.samba.package` {#opt-services.samba.package}

The samba package to use.

*Type:* package

*Default:* `pkgs.samba`

*Example:* `samba4Full`

*Declared by:* [`nixos/modules/services/network-filesystems/samba.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba.nix)

## `services.samba.settings` {#opt-services.samba.settings}

Configuration file for the Samba suite in ini format.
This file is located in /etc/samba/smb.conf

Refer to [https://www.samba.org/samba/docs/current/man-html/smb.conf.5.html](https://www.samba.org/samba/docs/current/man-html/smb.conf.5.html)
for all available options.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string) or a non-empty list of them)

*Default:*

``` nix
{
  global = {
    "invalid users" = [
      "root"
    ];
    "passwd program" = "/run/wrappers/bin/passwd %u";
    security = "user";
  };
}
```

*Example:*

``` nix
{
  global = {
    "invalid users" = [
      "root"
    ];
    "passwd program" = "/run/wrappers/bin/passwd %u";
    security = "user";
  };
  public = {
    browseable = "yes";
    comment = "Public samba share.";
    "guest ok" = "yes";
    path = "/srv/public";
    "read only" = "yes";
  };
}
```

*Declared by:* [`nixos/modules/services/network-filesystems/samba.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba.nix)

## `services.samba.settings.global."invalid users"` {#opt-services.samba.settings.global._invalid_users_}

List of users who are denied to login via Samba.

*Type:* list of string

*Default:*

``` nix
[
  "root"
]
```

*Declared by:* [`nixos/modules/services/network-filesystems/samba.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba.nix)

## `services.samba.settings.global."passwd program"` {#opt-services.samba.settings.global._passwd_program_}

Path to a program that can be used to set UNIX user passwords.

*Type:* string

*Default:* `"/run/wrappers/bin/passwd %u"`

*Declared by:* [`nixos/modules/services/network-filesystems/samba.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba.nix)

## `services.samba.settings.global.security` {#opt-services.samba.settings.global.security}

Samba security type.

*Type:* one of "auto", "user", "domain", "ads"

*Default:* `"user"`

*Declared by:* [`nixos/modules/services/network-filesystems/samba.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba.nix)

## `services.samba.smbd.enable` {#opt-services.samba.smbd.enable}

Whether to enable Samba's smbd daemon.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/samba.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba.nix)

## `services.samba.smbd.extraArgs` {#opt-services.samba.smbd.extraArgs}

Extra arguments to pass to the smbd service.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/network-filesystems/samba.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba.nix)

## `services.samba.usershares.enable` {#opt-services.samba.usershares.enable}

Whether to enable user-configurable Samba shares.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/samba.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba.nix)

## `services.samba.usershares.group` {#opt-services.samba.usershares.group}

Name of the group members of which will be allowed to create usershares.

The group will be created automatically.

*Type:* string

*Default:* `"samba"`

*Declared by:* [`nixos/modules/services/network-filesystems/samba.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba.nix)

## `services.samba.winbindd.enable` {#opt-services.samba.winbindd.enable}

Whether to enable Samba's winbindd, which provides a number of services
to the Name Service Switch capability found in most modern C libraries,
to arbitrary applications via PAM and ntlm\_auth and to Samba itself.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/samba.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba.nix)

## `services.samba.winbindd.extraArgs` {#opt-services.samba.winbindd.extraArgs}

Extra arguments to pass to the winbindd service.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/network-filesystems/samba.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/samba.nix)

## `services.saned.enable` {#opt-services.saned.enable}

Enable saned network daemon for remote connection to scanners.

saned would be run from `scanner` user; to allow
access to hardware that doesn't have `scanner` group
you should add needed groups to this user.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/sane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/sane.nix)

## `services.saned.extraConfig` {#opt-services.saned.extraConfig}

Extra saned configuration lines.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"192.168.0.0/24"`

*Declared by:* [`nixos/modules/services/hardware/sane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/sane.nix)

## `services.sanoid.datasets` {#opt-services.sanoid.datasets}

Datasets to snapshot.

*Type:* attribute set of (open submodule of dataset/template options)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.datasets.<name>.autoprune` {#opt-services.sanoid.datasets._name_.autoprune}

Whether to automatically prune old snapshots.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.datasets.<name>.autosnap` {#opt-services.sanoid.datasets._name_.autosnap}

Whether to automatically take snapshots.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.datasets.<name>.daily` {#opt-services.sanoid.datasets._name_.daily}

Number of daily snapshots.

*Type:* null or (unsigned integer, meaning \>=0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.datasets.<name>.force_post_snapshot_script` {#opt-services.sanoid.datasets._name_.force_post_snapshot_script}

Whether to run the post script if the pre script fails

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.datasets.<name>.hourly` {#opt-services.sanoid.datasets._name_.hourly}

Number of hourly snapshots.

*Type:* null or (unsigned integer, meaning \>=0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.datasets.<name>.monthly` {#opt-services.sanoid.datasets._name_.monthly}

Number of monthly snapshots.

*Type:* null or (unsigned integer, meaning \>=0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.datasets.<name>.no_inconsistent_snapshot` {#opt-services.sanoid.datasets._name_.no_inconsistent_snapshot}

Whether to take a snapshot if the pre script fails

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.datasets.<name>.post_snapshot_script` {#opt-services.sanoid.datasets._name_.post_snapshot_script}

Script to run after taking snapshot.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.datasets.<name>.pre_snapshot_script` {#opt-services.sanoid.datasets._name_.pre_snapshot_script}

Script to run before taking snapshot.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.datasets.<name>.processChildrenOnly` {#opt-services.sanoid.datasets._name_.processChildrenOnly}

Whether to only snapshot child datasets if recursing.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.datasets.<name>.process_children_only` {#opt-services.sanoid.datasets._name_.process_children_only}

Whether to only snapshot child datasets if recursing.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.datasets.<name>.pruning_script` {#opt-services.sanoid.datasets._name_.pruning_script}

Script to run after pruning snapshot.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.datasets.<name>.recursive` {#opt-services.sanoid.datasets._name_.recursive}

Whether to recursively snapshot dataset children.
You can also set this to `"zfs"` to handle datasets
recursively in an atomic way without the possibility to
override settings for child datasets.

*Type:* boolean or value "zfs" (singular enum)

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.datasets.<name>.script_timeout` {#opt-services.sanoid.datasets._name_.script_timeout}

Time limit for pre/post/pruning script execution time (\<=0 for infinite).

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.datasets.<name>.useTemplate` {#opt-services.sanoid.datasets._name_.useTemplate}

Names of the templates to use for this dataset.

*Type:* list of configured template name

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.datasets.<name>.use_template` {#opt-services.sanoid.datasets._name_.use_template}

Names of the templates to use for this dataset.

*Type:* list of configured template name

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.datasets.<name>.yearly` {#opt-services.sanoid.datasets._name_.yearly}

Number of yearly snapshots.

*Type:* null or (unsigned integer, meaning \>=0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.enable` {#opt-services.sanoid.enable}

Whether to enable Sanoid ZFS snapshotting service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.extraArgs` {#opt-services.sanoid.extraArgs}

Extra arguments to pass to sanoid. See
[https://github.com/jimsalterjrs/sanoid/#sanoid-command-line-options](https://github.com/jimsalterjrs/sanoid/#sanoid-command-line-options)
for allowed options.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--verbose"
  "--readonly"
  "--debug"
]
```

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.interval` {#opt-services.sanoid.interval}

Run sanoid at this interval. The default is to run hourly.

The format is described in
`systemd.time(7)`.

*Type:* string

*Default:* `"hourly"`

*Example:* `"daily"`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.package` {#opt-services.sanoid.package}

The sanoid package to use.

*Type:* package

*Default:* `pkgs.sanoid`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.settings` {#opt-services.sanoid.settings}

Free-form settings written directly to the config file. See
[https://github.com/jimsalterjrs/sanoid/blob/master/sanoid.defaults.conf](https://github.com/jimsalterjrs/sanoid/blob/master/sanoid.defaults.conf)
for allowed values.

*Type:* attribute set of dataset/template options

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.templates` {#opt-services.sanoid.templates}

Templates for datasets.

*Type:* attribute set of (open submodule of dataset/template options)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.templates.<name>.autoprune` {#opt-services.sanoid.templates._name_.autoprune}

Whether to automatically prune old snapshots.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.templates.<name>.autosnap` {#opt-services.sanoid.templates._name_.autosnap}

Whether to automatically take snapshots.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.templates.<name>.daily` {#opt-services.sanoid.templates._name_.daily}

Number of daily snapshots.

*Type:* null or (unsigned integer, meaning \>=0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.templates.<name>.force_post_snapshot_script` {#opt-services.sanoid.templates._name_.force_post_snapshot_script}

Whether to run the post script if the pre script fails

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.templates.<name>.hourly` {#opt-services.sanoid.templates._name_.hourly}

Number of hourly snapshots.

*Type:* null or (unsigned integer, meaning \>=0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.templates.<name>.monthly` {#opt-services.sanoid.templates._name_.monthly}

Number of monthly snapshots.

*Type:* null or (unsigned integer, meaning \>=0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.templates.<name>.no_inconsistent_snapshot` {#opt-services.sanoid.templates._name_.no_inconsistent_snapshot}

Whether to take a snapshot if the pre script fails

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.templates.<name>.post_snapshot_script` {#opt-services.sanoid.templates._name_.post_snapshot_script}

Script to run after taking snapshot.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.templates.<name>.pre_snapshot_script` {#opt-services.sanoid.templates._name_.pre_snapshot_script}

Script to run before taking snapshot.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.templates.<name>.pruning_script` {#opt-services.sanoid.templates._name_.pruning_script}

Script to run after pruning snapshot.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.templates.<name>.script_timeout` {#opt-services.sanoid.templates._name_.script_timeout}

Time limit for pre/post/pruning script execution time (\<=0 for infinite).

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.sanoid.templates.<name>.yearly` {#opt-services.sanoid.templates._name_.yearly}

Number of yearly snapshots.

*Type:* null or (unsigned integer, meaning \>=0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/sanoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/sanoid.nix)

## `services.saslauthd.config` {#opt-services.saslauthd.config}

Configuration to use for Cyrus SASL authentication daemon.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/system/saslauthd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/saslauthd.nix)

## `services.saslauthd.enable` {#opt-services.saslauthd.enable}

Whether to enable saslauthd, the Cyrus SASL authentication daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/system/saslauthd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/saslauthd.nix)

## `services.saslauthd.mechanism` {#opt-services.saslauthd.mechanism}

Auth mechanism to use

*Type:* string

*Default:* `"pam"`

*Declared by:* [`nixos/modules/services/system/saslauthd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/saslauthd.nix)

## `services.saslauthd.package` {#opt-services.saslauthd.package}

The bin package to use.

*Type:* package

*Default:* `pkgs.cyrus_sasl.bin`

*Declared by:* [`nixos/modules/services/system/saslauthd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/saslauthd.nix)

## `services.saunafs.chunkserver.enable` {#opt-services.saunafs.chunkserver.enable}

Whether to enable Saunafs chunkserver daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/saunafs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/saunafs.nix)

## `services.saunafs.chunkserver.hdds` {#opt-services.saunafs.chunkserver.hdds}

Mount points to be used by chunkserver for storage (see `sfshdd.cfg(5)`).

Note, that these mount points must writeable by the user defined by the saunafs user.

*Type:* list of string

*Default:* `null`

*Example:*

``` nix
[ "/mnt/hdd1" ];
```

*Declared by:* [`nixos/modules/services/network-filesystems/saunafs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/saunafs.nix)

## `services.saunafs.chunkserver.openFirewall` {#opt-services.saunafs.chunkserver.openFirewall}

Whether to automatically open the necessary ports in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/saunafs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/saunafs.nix)

## `services.saunafs.chunkserver.settings` {#opt-services.saunafs.chunkserver.settings}

Contents of chunkserver config file (see `sfschunkserver.cfg(5)`).

*Type:* open submodule of attribute set of (Flat key-value file)

*Declared by:* [`nixos/modules/services/network-filesystems/saunafs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/saunafs.nix)

## `services.saunafs.chunkserver.settings.DATA_PATH` {#opt-services.saunafs.chunkserver.settings.DATA_PATH}

Directory for chunck meta data

*Type:* string

*Default:* `"/var/lib/saunafs/chunkserver"`

*Declared by:* [`nixos/modules/services/network-filesystems/saunafs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/saunafs.nix)

## `services.saunafs.client.enable` {#opt-services.saunafs.client.enable}

Whether to enable Saunafs client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/saunafs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/saunafs.nix)

## `services.saunafs.master.enable` {#opt-services.saunafs.master.enable}

Enable Saunafs master daemon.

You need to run `sfsmaster-init` on a freshly installed master server to
initialize the `DATA_PATH` directory.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/saunafs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/saunafs.nix)

## `services.saunafs.master.exports` {#opt-services.saunafs.master.exports}

Paths to exports file (see `sfsexports.cfg(5)`).

*Type:* list of string

*Default:* `null`

*Example:*

``` nix
[ "* / rw,alldirs,admin,maproot=0:0" ];
```

*Declared by:* [`nixos/modules/services/network-filesystems/saunafs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/saunafs.nix)

## `services.saunafs.master.openFirewall` {#opt-services.saunafs.master.openFirewall}

Whether to automatically open the necessary ports in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/saunafs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/saunafs.nix)

## `services.saunafs.master.settings` {#opt-services.saunafs.master.settings}

Contents of config file (`sfsmaster.cfg(5)`).

*Type:* open submodule of attribute set of (Flat key-value file)

*Declared by:* [`nixos/modules/services/network-filesystems/saunafs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/saunafs.nix)

## `services.saunafs.master.settings.DATA_PATH` {#opt-services.saunafs.master.settings.DATA_PATH}

Data storage directory.

*Type:* string

*Default:* `"/var/lib/saunafs/master"`

*Declared by:* [`nixos/modules/services/network-filesystems/saunafs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/saunafs.nix)

## `services.saunafs.masterHost` {#opt-services.saunafs.masterHost}

IP or hostname name of master host.

*Type:* string

*Default:* `null`

*Declared by:* [`nixos/modules/services/network-filesystems/saunafs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/saunafs.nix)

## `services.saunafs.metalogger.enable` {#opt-services.saunafs.metalogger.enable}

Whether to enable Saunafs metalogger daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/saunafs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/saunafs.nix)

## `services.saunafs.metalogger.settings` {#opt-services.saunafs.metalogger.settings}

Contents of metalogger config file (see `sfsmetalogger.cfg(5)`).

*Type:* open submodule of attribute set of (Flat key-value file)

*Declared by:* [`nixos/modules/services/network-filesystems/saunafs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/saunafs.nix)

## `services.saunafs.metalogger.settings.DATA_PATH` {#opt-services.saunafs.metalogger.settings.DATA_PATH}

Data storage directory

*Type:* string

*Default:* `"/var/lib/saunafs/metalogger"`

*Declared by:* [`nixos/modules/services/network-filesystems/saunafs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/saunafs.nix)

## `services.saunafs.sfsUser` {#opt-services.saunafs.sfsUser}

Run daemons as user.

*Type:* string

*Default:* `"saunafs"`

*Declared by:* [`nixos/modules/services/network-filesystems/saunafs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/saunafs.nix)

## `services.scanservjs.enable` {#opt-services.scanservjs.enable}

Whether to enable scanservjs.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/scanservjs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/scanservjs.nix)

## `services.scanservjs.extraActions` {#opt-services.scanservjs.extraActions}

Actions to add to config.local.js's `actions`.

*Type:* list of strings concatenated with "\\n"

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/hardware/scanservjs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/scanservjs.nix)

## `services.scanservjs.extraConfig` {#opt-services.scanservjs.extraConfig}

Extra code to add to config.local.js's `afterConfig`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/hardware/scanservjs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/scanservjs.nix)

## `services.scanservjs.extraDevicesConfig` {#opt-services.scanservjs.extraDevicesConfig}

Extra code to add to config.local.js's `afterDevices`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/hardware/scanservjs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/scanservjs.nix)

## `services.scanservjs.runAfterScan` {#opt-services.scanservjs.runAfterScan}

Extra code to add to config.local.js's `afterScan`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/hardware/scanservjs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/scanservjs.nix)

## `services.scanservjs.settings` {#opt-services.scanservjs.settings}

Config to set in config.local.js's `afterConfig`.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/hardware/scanservjs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/scanservjs.nix)

## `services.scanservjs.settings.host` {#opt-services.scanservjs.settings.host}

The IP to listen on.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/hardware/scanservjs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/scanservjs.nix)

## `services.scanservjs.settings.port` {#opt-services.scanservjs.settings.port}

The port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/hardware/scanservjs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/scanservjs.nix)

## `services.scanservjs.stateDir` {#opt-services.scanservjs.stateDir}

State directory for scanservjs.

*Type:* string

*Default:* `"/var/lib/scanservjs"`

*Declared by:* [`nixos/modules/services/hardware/scanservjs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/scanservjs.nix)

## `services.schleuder.enable` {#opt-services.schleuder.enable}

Whether to enable Schleuder secure remailer.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/schleuder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/schleuder.nix)

## `services.schleuder.enablePostfix` {#opt-services.schleuder.enablePostfix}

Whether to enable automatic postfix integration.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/schleuder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/schleuder.nix)

## `services.schleuder.extraSettingsFile` {#opt-services.schleuder.extraSettingsFile}

YAML file to merge into the schleuder config at runtime. This can be used for secrets such as API keys.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/schleuder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/schleuder.nix)

## `services.schleuder.listDefaults` {#opt-services.schleuder.listDefaults}

Default settings for lists (list-defaults.yml).

Check the [example configuration](https://0xacab.org/schleuder/schleuder/-/blob/master/etc/list-defaults.yml) for possible values.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/mail/schleuder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/schleuder.nix)

## `services.schleuder.lists` {#opt-services.schleuder.lists}

List of list addresses that should be handled by Schleuder.

Note that this is only handled by the postfix integration, and
the setup of the lists, their members and their keys has to be
performed separately via schleuder's API, using a tool such as
schleuder-cli.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "widget-team@example.com"
  "security@example.com"
]
```

*Declared by:* [`nixos/modules/services/mail/schleuder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/schleuder.nix)

## `services.schleuder.settings` {#opt-services.schleuder.settings}

Settings for schleuder.yml.

Check the [example configuration](https://0xacab.org/schleuder/schleuder/blob/master/etc/schleuder.yml) for possible values.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/mail/schleuder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/schleuder.nix)

## `services.schleuder.settings.keyserver` {#opt-services.schleuder.settings.keyserver}

Key server from which to fetch and update keys.

Note that NixOS uses a different default from upstream, since the upstream default sks-keyservers.net is deprecated.

*Type:* string

*Default:* `"keys.openpgp.org"`

*Declared by:* [`nixos/modules/services/mail/schleuder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/schleuder.nix)

## `services.scion.bypassBootstrapWarning` {#opt-services.scion.bypassBootstrapWarning}

bypass Nix warning about SCION PKI bootstrapping

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/scion/scion.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/scion/scion.nix)

## `services.scion.enable` {#opt-services.scion.enable}

Whether to enable all of the scion components and services.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/scion/scion.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/scion/scion.nix)

## `services.scion.package` {#opt-services.scion.package}

The scion package to use.

*Type:* package

*Default:* `pkgs.scion`

*Declared by:* [`nixos/modules/services/networking/scion/scion.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/scion/scion.nix)

## `services.scion.scion-control.enable` {#opt-services.scion.scion-control.enable}

Whether to enable the scion-control service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/scion/scion-control.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/scion/scion-control.nix)

## `services.scion.scion-control.settings` {#opt-services.scion.scion-control.settings}

scion-control configuration. Refer to
[https://docs.scion.org/en/latest/manuals/common.html](https://docs.scion.org/en/latest/manuals/common.html)
for details on supported values.

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  path_db = {
    connection = "/run/scion-control/control.path.db";
  };
  log.console = {
    level = "info";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/scion/scion-control.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/scion/scion-control.nix)

## `services.scion.scion-daemon.enable` {#opt-services.scion.scion-daemon.enable}

Whether to enable the scion-daemon service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/scion/scion-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/scion/scion-daemon.nix)

## `services.scion.scion-daemon.settings` {#opt-services.scion.scion-daemon.settings}

scion-daemon configuration. Refer to
[https://docs.scion.org/en/latest/manuals/common.html](https://docs.scion.org/en/latest/manuals/common.html)
for details on supported values.

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  path_db = {
    connection = "/run/scion-daemon/sd.path.db";
  };
  log.console = {
    level = "info";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/scion/scion-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/scion/scion-daemon.nix)

## `services.scion.scion-dispatcher.enable` {#opt-services.scion.scion-dispatcher.enable}

Whether to enable the scion-dispatcher service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/scion/scion-dispatcher.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/scion/scion-dispatcher.nix)

## `services.scion.scion-dispatcher.settings` {#opt-services.scion.scion-dispatcher.settings}

scion-dispatcher configuration. Refer to
[https://docs.scion.org/en/latest/manuals/common.html](https://docs.scion.org/en/latest/manuals/common.html)
for details on supported values.

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  dispatcher = {
    id = "dispatcher";
    socket_file_mode = "0770";
    application_socket = "/dev/shm/dispatcher/default.sock";
  };
  log.console = {
    level = "info";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/scion/scion-dispatcher.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/scion/scion-dispatcher.nix)

## `services.scion.scion-ip-gateway.config` {#opt-services.scion.scion-ip-gateway.config}

scion-ip-gateway daemon configuration

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  tunnel = {
    src_ipv4 = "172.16.100.1";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/scion/scion-ip-gateway.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/scion/scion-ip-gateway.nix)

## `services.scion.scion-ip-gateway.enable` {#opt-services.scion.scion-ip-gateway.enable}

Whether to enable the scion-ip-gateway service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/scion/scion-ip-gateway.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/scion/scion-ip-gateway.nix)

## `services.scion.scion-ip-gateway.trafficConfig` {#opt-services.scion.scion-ip-gateway.trafficConfig}

scion-ip-gateway traffic configuration

*Type:* JSON value

*Default:* `{ }`

*Example:*

``` nix
{
  ASes = {
    "2-ffaa:0:b" = {
      Nets = [
          "172.16.1.0/24"
      ];
    };
  };
  ConfigVersion = 9001;
}
```

*Declared by:* [`nixos/modules/services/networking/scion/scion-ip-gateway.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/scion/scion-ip-gateway.nix)

## `services.scion.scion-router.enable` {#opt-services.scion.scion-router.enable}

Whether to enable the scion-router service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/scion/scion-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/scion/scion-router.nix)

## `services.scion.scion-router.settings` {#opt-services.scion.scion-router.settings}

scion-router configuration. Refer to
[https://docs.scion.org/en/latest/manuals/common.html](https://docs.scion.org/en/latest/manuals/common.html)
for details on supported values.

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  general.id = "br";
}
```

*Declared by:* [`nixos/modules/services/networking/scion/scion-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/scion/scion-router.nix)

## `services.scion.stateless` {#opt-services.scion.stateless}

Setting this value to false (stateful) can lead to improved caching and
performance.

This option decides whether to persist the SCION path sqlite databases
on disk or not. Persisting this data can lead to database corruption in
extreme cases such as power outage, meaning SCION fails to work on the
next boot. This is being investigated.

If true, /run/scion-\* is used for data
If false, use /var/lib/scion-\* is used for data

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/scion/scion.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/scion/scion.nix)

## `services.scollector.bosunHost` {#opt-services.scollector.bosunHost}

Host and port of the bosun server that will store the collected
data.

*Type:* string

*Default:* `"localhost:8070"`

*Declared by:* [`nixos/modules/services/monitoring/scollector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scollector.nix)

## `services.scollector.collectors` {#opt-services.scollector.collectors}

An attribute set mapping the frequency of collection to a list of
binaries that should be executed at that frequency. You can use "0"
to run a binary forever.

*Type:* attribute set of list of absolute path

*Default:* `{ }`

*Example:* `{ "0" = [ "${postgresStats}/bin/collect-stats" ]; }`

*Declared by:* [`nixos/modules/services/monitoring/scollector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scollector.nix)

## `services.scollector.enable` {#opt-services.scollector.enable}

Whether to run scollector.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/scollector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scollector.nix)

## `services.scollector.extraConfig` {#opt-services.scollector.extraConfig}

Extra scollector configuration added to the end of scollector.toml

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/scollector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scollector.nix)

## `services.scollector.extraOpts` {#opt-services.scollector.extraOpts}

Extra scollector command line options

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-d"
]
```

*Declared by:* [`nixos/modules/services/monitoring/scollector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scollector.nix)

## `services.scollector.group` {#opt-services.scollector.group}

Group account under which scollector runs.

*Type:* string

*Default:* `"scollector"`

*Declared by:* [`nixos/modules/services/monitoring/scollector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scollector.nix)

## `services.scollector.package` {#opt-services.scollector.package}

The scollector package to use.

*Type:* package

*Default:* `pkgs.scollector`

*Declared by:* [`nixos/modules/services/monitoring/scollector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scollector.nix)

## `services.scollector.user` {#opt-services.scollector.user}

User account under which scollector runs.

*Type:* string

*Default:* `"scollector"`

*Declared by:* [`nixos/modules/services/monitoring/scollector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scollector.nix)

## `services.screego.enable` {#opt-services.screego.enable}

Whether to enable screego screen-sharing server for developers.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/screego.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/screego.nix)

## `services.screego.environmentFile` {#opt-services.screego.environmentFile}

Environment file (see `systemd.exec(5)` "EnvironmentFile="
section for the syntax) passed to the service. This option can be
used to safely include secrets in the configuration.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/screego-envfile"`

*Declared by:* [`nixos/modules/services/web-apps/screego.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/screego.nix)

## `services.screego.openFirewall` {#opt-services.screego.openFirewall}

Open the firewall port(s).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/screego.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/screego.nix)

## `services.screego.settings` {#opt-services.screego.settings}

Screego settings passed as Nix attribute set, they will be merged with
the defaults. Settings will be passed as environment variables.

See [https://screego.net/#/config](https://screego.net/#/config) for possible values

*Type:* attribute set of string

*Default:*

``` nix
{
  SCREEGO_AUTH_MODE = "turn";
  SCREEGO_CLOSE_ROOM_WHEN_OWNER_LEAVES = "true";
  SCREEGO_LOG_LEVEL = "info";
  SCREEGO_SERVER_ADDRESS = "127.0.0.1:5050";
  SCREEGO_SESSION_TIMEOUT_SECONDS = "0";
  SCREEGO_TURN_ADDRESS = "0.0.0.0:3478";
  SCREEGO_TURN_PORT_RANGE = "50000:55000";
}
```

*Example:*

``` nix
{
  SCREEGO_EXTERNAL_IP = "dns:example.com";
}
```

*Declared by:* [`nixos/modules/services/web-apps/screego.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/screego.nix)

## `services.scrutiny.collector.enable` {#opt-services.scrutiny.collector.enable}

Whether to enable the Scrutiny metrics collector.

*Type:* boolean

*Default:* `config.services.scrutiny.enable`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/scrutiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scrutiny.nix)

## `services.scrutiny.collector.package` {#opt-services.scrutiny.collector.package}

The scrutiny-collector package to use.

*Type:* package

*Default:* `pkgs.scrutiny-collector`

*Declared by:* [`nixos/modules/services/monitoring/scrutiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scrutiny.nix)

## `services.scrutiny.collector.schedule` {#opt-services.scrutiny.collector.schedule}

How often to run the collector in systemd calendar format.

*Type:* string

*Default:* `"daily"`

*Declared by:* [`nixos/modules/services/monitoring/scrutiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scrutiny.nix)

## `services.scrutiny.collector.settings` {#opt-services.scrutiny.collector.settings}

Collector settings to be rendered into the collector configuration file.

See [https://github.com/AnalogJ/scrutiny/blob/master/example.collector.yaml](https://github.com/AnalogJ/scrutiny/blob/master/example.collector.yaml).

Options containing secret data should be set to an attribute set
containing the attribute `_secret`. This attribute should be a string
or structured JSON with `quote = false;`, pointing to a file that
contains the value the option should be set to.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/scrutiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scrutiny.nix)

## `services.scrutiny.collector.settings.api.endpoint` {#opt-services.scrutiny.collector.settings.api.endpoint}

Scrutiny app API endpoint for sending metrics to.

*Type:* string

*Default:* `"http://${config.services.scrutiny.settings.web.listen.host}:${config.services.scrutiny.settings.web.listen.port}${config.services.scrutiny.settings.web.listen.basepath}"`

*Declared by:* [`nixos/modules/services/monitoring/scrutiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scrutiny.nix)

## `services.scrutiny.collector.settings.host.id` {#opt-services.scrutiny.collector.settings.host.id}

Host ID for identifying/labelling groups of disks

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/scrutiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scrutiny.nix)

## `services.scrutiny.collector.settings.log.level` {#opt-services.scrutiny.collector.settings.log.level}

Log level for Scrutiny collector.

*Type:* one of "INFO", "DEBUG"

*Default:* `"INFO"`

*Declared by:* [`nixos/modules/services/monitoring/scrutiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scrutiny.nix)

## `services.scrutiny.enable` {#opt-services.scrutiny.enable}

Whether to enable Scrutiny, a web application for drive monitoring.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/scrutiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scrutiny.nix)

## `services.scrutiny.influxdb.enable` {#opt-services.scrutiny.influxdb.enable}

Enables InfluxDB on the host system using the `services.influxdb2` NixOS module
with default options.

If you already have InfluxDB configured, or wish to connect to an external InfluxDB
instance, disable this option.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/scrutiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scrutiny.nix)

## `services.scrutiny.openFirewall` {#opt-services.scrutiny.openFirewall}

Whether to enable opening the default ports in the firewall for Scrutiny.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/scrutiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scrutiny.nix)

## `services.scrutiny.package` {#opt-services.scrutiny.package}

The scrutiny package to use.

*Type:* package

*Default:* `pkgs.scrutiny`

*Declared by:* [`nixos/modules/services/monitoring/scrutiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scrutiny.nix)

## `services.scrutiny.settings` {#opt-services.scrutiny.settings}

Scrutiny settings to be rendered into the configuration file.

See [https://github.com/AnalogJ/scrutiny/blob/master/example.scrutiny.yaml](https://github.com/AnalogJ/scrutiny/blob/master/example.scrutiny.yaml).

Options containing secret data should be set to an attribute set
containing the attribute `_secret`. This attribute should be a string
or structured JSON with `quote = false;`, pointing to a file that
contains the value the option should be set to.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/scrutiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scrutiny.nix)

## `services.scrutiny.settings.log.level` {#opt-services.scrutiny.settings.log.level}

Log level for Scrutiny.

*Type:* one of "INFO", "DEBUG"

*Default:* `"INFO"`

*Declared by:* [`nixos/modules/services/monitoring/scrutiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scrutiny.nix)

## `services.scrutiny.settings.web.influxdb.bucket` {#opt-services.scrutiny.settings.web.influxdb.bucket}

InfluxDB bucket in which to store data.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/scrutiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scrutiny.nix)

## `services.scrutiny.settings.web.influxdb.host` {#opt-services.scrutiny.settings.web.influxdb.host}

IP or hostname of the InfluxDB instance.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/monitoring/scrutiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scrutiny.nix)

## `services.scrutiny.settings.web.influxdb.org` {#opt-services.scrutiny.settings.web.influxdb.org}

InfluxDB organisation under which to store data.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/scrutiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scrutiny.nix)

## `services.scrutiny.settings.web.influxdb.port` {#opt-services.scrutiny.settings.web.influxdb.port}

The port of the InfluxDB instance.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8086`

*Declared by:* [`nixos/modules/services/monitoring/scrutiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scrutiny.nix)

## `services.scrutiny.settings.web.influxdb.scheme` {#opt-services.scrutiny.settings.web.influxdb.scheme}

URL scheme to use when connecting to InfluxDB.

*Type:* string

*Default:* `"http"`

*Declared by:* [`nixos/modules/services/monitoring/scrutiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scrutiny.nix)

## `services.scrutiny.settings.web.influxdb.tls.insecure_skip_verify` {#opt-services.scrutiny.settings.web.influxdb.tls.insecure_skip_verify}

Whether to enable skipping TLS verification when connecting to InfluxDB.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/scrutiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scrutiny.nix)

## `services.scrutiny.settings.web.influxdb.token` {#opt-services.scrutiny.settings.web.influxdb.token}

Authentication token for connecting to InfluxDB.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/scrutiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scrutiny.nix)

## `services.scrutiny.settings.web.listen.basepath` {#opt-services.scrutiny.settings.web.listen.basepath}

If Scrutiny will be behind a path prefixed reverse proxy, you can override this
value to serve Scrutiny on a subpath.

*Type:* string

*Default:* `""`

*Example:* `"/scrutiny"`

*Declared by:* [`nixos/modules/services/monitoring/scrutiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scrutiny.nix)

## `services.scrutiny.settings.web.listen.host` {#opt-services.scrutiny.settings.web.listen.host}

Interface address for web application to bind to.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/monitoring/scrutiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scrutiny.nix)

## `services.scrutiny.settings.web.listen.port` {#opt-services.scrutiny.settings.web.listen.port}

Port for web application to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/monitoring/scrutiny.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/scrutiny.nix)

## `services.scx-loader.config` {#opt-services.scx-loader.config}

Configuration for `scx_loader`.

See [https://github.com/sched-ext/scx-loader/blob/main/crates/scx\_loader/configuration.md](https://github.com/sched-ext/scx-loader/blob/main/crates/scx_loader/configuration.md) for the full list of options.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/scheduling/scx-loader.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/scheduling/scx-loader.nix)

## `services.scx-loader.config.default_sched` {#opt-services.scx-loader.config.default_sched}

Default scheduler that will be started automatically when `scx_loader` starts.
If not set or set to an empty string, `scx_loader` will not automatically start any scheduler.

*Type:* null or string

*Default:* `null`

*Example:* `"scx_bpfland"`

*Declared by:* [`nixos/modules/services/scheduling/scx-loader.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/scheduling/scx-loader.nix)

## `services.scx-loader.enable` {#opt-services.scx-loader.enable}

Whether to enable SCX-Loader service, a daemon to run sched\_ext schedulers, with a D-Bus interface to manage them with `scxctl`.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/scheduling/scx-loader.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/scheduling/scx-loader.nix)

## `services.scx-loader.package` {#opt-services.scx-loader.package}

The scx-loader package to use.

*Type:* package

*Default:* `pkgs.scx-loader`

*Declared by:* [`nixos/modules/services/scheduling/scx-loader.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/scheduling/scx-loader.nix)

## `services.scx-loader.schedsPackages` {#opt-services.scx-loader.schedsPackages}

`scx` package to use. Defaults to `scx.rustscheds`, which includes all currently supported schedulers.

*Type:* list of package

*Default:* `[ pkgs.scx.rustscheds ]`

*Example:* `[ pkgs.scx.full ]`

*Declared by:* [`nixos/modules/services/scheduling/scx-loader.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/scheduling/scx-loader.nix)

## `services.sdrplayApi.enable` {#opt-services.sdrplayApi.enable}

Whether to enable the SDRplay API service and udev rules.

::: note
To enable integration with SoapySDR and GUI applications like gqrx create an overlay containing
`soapysdr-with-plugins = super.soapysdr.override { extraPackages = [ super.soapysdrplay ]; };`
:::

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/sdrplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/sdrplay.nix)

## `services.searx.configureNginx` {#opt-services.searx.configureNginx}

Whether to configure nginx as an frontend to uwsgi.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/searx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/searx.nix)

## `services.searx.configureUwsgi` {#opt-services.searx.configureUwsgi}

Whether to run searx in uWSGI as a "vassal", instead of using its
built-in HTTP server. This is the recommended mode for public or
large instances, but is unnecessary for LAN or local-only use.

::: warning
The built-in HTTP server logs all queries by default.
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/searx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/searx.nix)

## `services.searx.domain` {#opt-services.searx.domain}

The domain under which searxng will be served.
Right now this is only used with the configureNginx option.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/searx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/searx.nix)

## `services.searx.enable` {#opt-services.searx.enable}

Whether to enable Searx, the meta search engine.

*Type:* boolean

*Default:* `false`

*Related packages:*

- [`pkgs.searx`](https://search.nixos.org/packages?show=searx&sort=relevance&query=searx)

*Declared by:* [`nixos/modules/services/networking/searx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/searx.nix)

## `services.searx.environmentFile` {#opt-services.searx.environmentFile}

Environment file (see `systemd.exec(5)` "EnvironmentFile=" section for the syntax) to define variables for Searx.
This option can be used to safely include secret keys into the Searx configuration.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/searx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/searx.nix)

## `services.searx.faviconsSettings` {#opt-services.searx.faviconsSettings}

Favicons settings for SearXNG.

::: note
For available settings, see the SearXNG
[schema file](https://github.com/searxng/searxng/blob/master/searx/favicons/favicons.toml).
:::

*Type:* attribute set of (TOML value)

*Default:* `{ }`

*Example:*

``` nix
{
  favicons = {
    cfg_schema = 1;
    cache = {
      db_url = "/var/cache/searx/faviconcache.db";
      HOLD_TIME = 5184000;
      LIMIT_TOTAL_BYTES = 2147483648;
      BLOB_MAX_BYTES = 40960;
      MAINTENANCE_MODE = "auto";
      MAINTENANCE_PERIOD = 600;
    };
  };
}
```

*Declared by:* [`nixos/modules/services/networking/searx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/searx.nix)

## `services.searx.limiterSettings` {#opt-services.searx.limiterSettings}

Limiter settings for SearXNG.

::: note
For available settings, see the SearXNG [schema file](https://github.com/searxng/searxng/blob/master/searx/limiter.toml).
:::

*Type:* attribute set of (TOML value)

*Default:* `{ }`

*Example:*

``` nix
{
  botdetection = {
    ipv4_prefix = 32;
    ipv6_prefix = 56;

    trusted_proxies = [
      "127.0.0.0/8"
      "::1"
    ];

    ip_lists.block_ip = [
      # "93.184.216.34" # example.org
    ];
  };
}
```

*Declared by:* [`nixos/modules/services/networking/searx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/searx.nix)

## `services.searx.openFirewall` {#opt-services.searx.openFirewall}

Whether to open the port in the firewall.
Enabling this option adds the port specified in `services.settings.server.port` to [`networking.firewall.allowedTCPPorts`](../../options/networking/index.md#opt-networking.firewall.allowedTCPPorts).

::: note
When this option is set to true, `services.settings.server.port` must be set as well or an error will be thrown.
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/searx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/searx.nix)

## `services.searx.package` {#opt-services.searx.package}

The searxng package to use.

*Type:* package

*Default:* `pkgs.searxng`

*Declared by:* [`nixos/modules/services/networking/searx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/searx.nix)

## `services.searx.redisCreateLocally` {#opt-services.searx.redisCreateLocally}

Configure a local Redis server for SearXNG.
This is required if you want to enable the rate limiter and bot protection of SearXNG.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/searx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/searx.nix)

## `services.searx.settings` {#opt-services.searx.settings}

Searx settings.
These will be merged with (taking precedence over) the default configuration.
It's also possible to refer to environment variables (defined in [services (S)](#opt-services.searx.environmentFile)) using the syntax `$VARIABLE_NAME`.

::: note
For available settings, see the Searx [docs](https://docs.searxng.org/admin/settings/index.html).
:::

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Example:*

``` nix
{
  server.port = 8080;
  server.bind_address = "0.0.0.0";
  server.secret_key = "$SEARX_SECRET_KEY";

  engines = [ {
    name = "wolframalpha";
    shortcut = "wa";
    api_key = "$WOLFRAM_API_KEY";
    engine = "wolframalpha_api";
  } ];
}
```

*Declared by:* [`nixos/modules/services/networking/searx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/searx.nix)

## `services.searx.settingsPath` {#opt-services.searx.settingsPath}

The path of the SearXNG settings directory or the settings.yml file.
If no path is specified, a default one is used (default config file has debug mode enabled).

::: note
Setting this options overrides [services (S)](#opt-services.searx.settings).
:::

::: warning
This path, along with any secret keys it contains, will be copied into the world-readable Nix store.
:::

*Type:* absolute path

*Default:* `"/run/searx"`

*Declared by:* [`nixos/modules/services/networking/searx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/searx.nix)

## `services.searx.uwsgiConfig` {#opt-services.searx.uwsgiConfig}

Additional configuration of the uWSGI vassal running searx. It
should notably specify on which interfaces and ports the vassal
should listen.

*Type:* Json value or lambda

*Default:*

``` nix
{
  http = ":8080";
}
```

*Example:*

``` nix
{
  disable-logging = true;
  http = ":8080";                   # serve via HTTP...
  socket = "/run/searx/searx.sock"; # ...or UNIX socket
  chmod-socket = "660";             # allow the searx group to read/write to the socket
}
```

*Declared by:* [`nixos/modules/services/networking/searx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/searx.nix)

## `services.seatd.enable` {#opt-services.seatd.enable}

Whether to enable seatd.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/seatd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/seatd.nix)

## `services.seatd.group` {#opt-services.seatd.group}

Group to own the seatd socket

*Type:* string

*Default:* `"seat"`

*Declared by:* [`nixos/modules/services/desktops/seatd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/seatd.nix)

## `services.seatd.logLevel` {#opt-services.seatd.logLevel}

Logging verbosity

*Type:* one of "debug", "info", "error", "silent"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/desktops/seatd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/seatd.nix)

## `services.seatd.user` {#opt-services.seatd.user}

User to own the seatd socket

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/desktops/seatd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/seatd.nix)

## `services.seerr.configDir` {#opt-services.seerr.configDir}

Config data directory

*Type:* absolute path

*Default:* `/var/lib/seerr` (or `/var/lib/jellyseerr/config` if [`services.seerr.stateRevision`](#opt-services.seerr.stateRevision) \< 1)

*Declared by:* [`nixos/modules/services/misc/seerr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/seerr.nix)

## `services.seerr.enable` {#opt-services.seerr.enable}

Whether to enable Seerr, a requests manager for Jellyfin.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/seerr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/seerr.nix)

## `services.seerr.openFirewall` {#opt-services.seerr.openFirewall}

Open port in the firewall for the Seerr web interface.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/seerr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/seerr.nix)

## `services.seerr.package` {#opt-services.seerr.package}

The seerr package to use.

*Type:* package

*Default:* `pkgs.seerr`

*Declared by:* [`nixos/modules/services/misc/seerr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/seerr.nix)

## `services.seerr.port` {#opt-services.seerr.port}

The port which the Seerr web UI should listen to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5055`

*Declared by:* [`nixos/modules/services/misc/seerr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/seerr.nix)

## `services.seerr.stateRevision` {#opt-services.seerr.stateRevision}

This option versions the format of state persisted by
Seerr. Its default value depends on the value of
[`system.stateVersion`](../../options/system/index.md#opt-system.stateVersion).

Users who wish to increment this option will need to take manual
migration steps to preserve their data. **If you perform these
migrations, rolling back to an older generation will require also
reversing the migrations to the state expected by that generation.**
The migrations needed to advance to each value of this option are as
follows (perform all instructions after the row for the current
`stateRevision`, up to and including the row for the new
`stateRevision`):

0. (none)
1. Move `/var/lib/private/jellyseerr/config` to `/var/lib/private/seerr`, if you have not set [`services.seerr.configDir`](#opt-services.seerr.configDir). (If you have set [`services.seerr.configDir`](#opt-services.seerr.configDir), you should also have forced `systemd.services.seerr.serviceConfig.StateDirectory`, and in that case `stateRevision` does not affect your configuration.)

Note that you do **not** need to change [`system.stateVersion`](../../options/system/index.md#opt-system.stateVersion)
in order to update this option. [`system.stateVersion`](../../options/system/index.md#opt-system.stateVersion) only
determines the default value of this option. Most users should not
change [`system.stateVersion`](../../options/system/index.md#opt-system.stateVersion) at all.

*Type:* integer between 0 and 1 (both inclusive)

*Default:* If [`system.stateVersion`](../../options/system/index.md#opt-system.stateVersion) is:

- \<26.05: 0
- otherwise: 1

*Declared by:* [`nixos/modules/services/misc/seerr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/seerr.nix)

## `services.self-deploy.branch` {#opt-services.self-deploy.branch}

Branch to track

Technically speaking any ref can be specified here, as this is
passed directly to a `git fetch`, but for the use-case of
continuous deployment you're likely to want to specify a branch.

*Type:* string

*Default:* `"master"`

*Declared by:* [`nixos/modules/services/system/self-deploy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/self-deploy.nix)

## `services.self-deploy.enable` {#opt-services.self-deploy.enable}

Whether to enable self-deploy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/system/self-deploy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/self-deploy.nix)

## `services.self-deploy.nixArgs` {#opt-services.self-deploy.nixArgs}

Arguments to `nix-build` passed as `--argstr` or `--arg` depending on
the type.

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/system/self-deploy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/self-deploy.nix)

## `services.self-deploy.nixAttribute` {#opt-services.self-deploy.nixAttribute}

Attribute of `nixFile` that builds the current system.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/system/self-deploy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/self-deploy.nix)

## `services.self-deploy.nixFile` {#opt-services.self-deploy.nixFile}

Path to nix file in repository. Leading '/' refers to root of
git repository.

*Type:* absolute path

*Default:* `"/default.nix"`

*Declared by:* [`nixos/modules/services/system/self-deploy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/self-deploy.nix)

## `services.self-deploy.repository` {#opt-services.self-deploy.repository}

The repository to fetch from. Must be properly formatted for git.

If this value is set to a path (must begin with `/`) then it's
assumed that the repository is local and the resulting service
won't wait for the network to be up.

If the repository will be fetched over SSH, you must add an
entry to `programs.ssh.knownHosts` for the SSH host for the fetch
to be successful.

*Type:* absolute path or string

*Declared by:* [`nixos/modules/services/system/self-deploy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/self-deploy.nix)

## `services.self-deploy.sshKeyFile` {#opt-services.self-deploy.sshKeyFile}

Path to SSH private key used to fetch private repositories over
SSH.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/system/self-deploy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/self-deploy.nix)

## `services.self-deploy.startAt` {#opt-services.self-deploy.startAt}

The schedule on which to run the `self-deploy` service. Format
specified by `systemd.time 7`.

This value can also be a list of `systemd.time 7` formatted
strings, in which case the service will be started on multiple
schedules.

*Type:* string or list of string

*Default:* `"hourly"`

*Declared by:* [`nixos/modules/services/system/self-deploy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/self-deploy.nix)

## `services.self-deploy.switchCommand` {#opt-services.self-deploy.switchCommand}

The `switch-to-configuration` subcommand used.

*Type:* one of "boot", "switch", "dry-activate", "test"

*Default:* `"switch"`

*Declared by:* [`nixos/modules/services/system/self-deploy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/self-deploy.nix)

## `services.selfoss.enable` {#opt-services.selfoss.enable}

Whether to enable selfoss.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/selfoss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/selfoss.nix)

## `services.selfoss.nginx.enable` {#opt-services.selfoss.nginx.enable}

Whether to configure a Nginx virtual host to serve selfoss.

Further nginx configuration can be done by adapting `services.nginx.virtualHosts.${config.services.selfoss.nginx.virtualHost}`.
See [services (N)](../../options/services-n/index.md#opt-services.nginx.virtualHosts) for further information.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/selfoss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/selfoss.nix)

## `services.selfoss.nginx.virtualHost` {#opt-services.selfoss.nginx.virtualHost}

Name of the nginx virtualhost to use and set up. Only relevant when
[`services.selfoss.nginx.enable`](#opt-services.selfoss.nginx.enable) is `true`.

*Type:* string

*Default:* `"selfoss"`

*Declared by:* [`nixos/modules/services/web-apps/selfoss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/selfoss.nix)

## `services.selfoss.pool` {#opt-services.selfoss.pool}

Name of existing phpfpm pool that is used to run web-application.
If not specified a pool will be created automatically with
default values.

*Type:* string

*Default:* `"selfoss_pool"`

*Declared by:* [`nixos/modules/services/web-apps/selfoss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/selfoss.nix)

## `services.selfoss.settings` {#opt-services.selfoss.settings}

Configuration for selfoss, see
[https://selfoss.aditu.de/docs/administration/options/](https://selfoss.aditu.de/docs/administration/options/)
for supported values.

*Type:* open submodule of attribute set of (INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/selfoss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/selfoss.nix)

## `services.selfoss.settings.db_database` {#opt-services.selfoss.settings.db_database}

Name of the existing database (has no effect if type is "sqlite").

*Type:* string

*Default:* `"tt_rss"`

*Declared by:* [`nixos/modules/services/web-apps/selfoss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/selfoss.nix)

## `services.selfoss.settings.db_host` {#opt-services.selfoss.settings.db_host}

Host of the database (has no effect if type is "sqlite").

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/selfoss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/selfoss.nix)

## `services.selfoss.settings.db_password` {#opt-services.selfoss.settings.db_password}

The database user's password (has no effect if type is "sqlite").

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/selfoss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/selfoss.nix)

## `services.selfoss.settings.db_port` {#opt-services.selfoss.settings.db_port}

The database's port. If not set, the default ports will be
provided (5432 and 3306 for pgsql and mysql respectively)
(has no effect if type is "sqlite").

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/selfoss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/selfoss.nix)

## `services.selfoss.settings.db_type` {#opt-services.selfoss.settings.db_type}

Database to store feeds. Supported are sqlite, pgsql and mysql.

*Type:* one of "pgsql", "mysql", "sqlite"

*Default:* `"sqlite"`

*Declared by:* [`nixos/modules/services/web-apps/selfoss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/selfoss.nix)

## `services.selfoss.settings.db_user` {#opt-services.selfoss.settings.db_user}

The database user. The user must exist and has access to
the specified database (has no effect if type is "sqlite").

*Type:* string

*Default:* `"tt_rss"`

*Declared by:* [`nixos/modules/services/web-apps/selfoss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/selfoss.nix)

## `services.selfoss.user` {#opt-services.selfoss.user}

User account under which both the service and the web-application run.

*Type:* string

*Default:* `config.services.nginx.user`

*Declared by:* [`nixos/modules/services/web-apps/selfoss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/selfoss.nix)

## `services.send.baseUrl` {#opt-services.send.baseUrl}

Base URL for the Send service.
Leave it blank to automatically detect the base url.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/send.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/send.nix)

## `services.send.dataDir` {#opt-services.send.dataDir}

Directory for uploaded files.
Due to limitations in `systemd.services.send.serviceConfig.DynamicUser`, this item is read only.

*Type:* absolute path

*Default:* `"/var/lib/send"`

*Read only*

*Declared by:* [`nixos/modules/services/web-servers/send.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/send.nix)

## `services.send.enable` {#opt-services.send.enable}

Whether to enable Send, a file sharing web sevice for ffsend..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/send.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/send.nix)

## `services.send.environment` {#opt-services.send.environment}

All the available config options and their defaults can be found here: [https://github.com/timvisee/send/blob/master/server/config.js](https://github.com/timvisee/send/blob/master/server/config.js),
some descriptions can found here: [https://github.com/timvisee/send/blob/master/docs/docker.md#environment-variables](https://github.com/timvisee/send/blob/master/docs/docker.md#environment-variables)

Values under [`services.send.environment`](#opt-services.send.environment) will override the predefined values in the Send service.

- Time/duration should be in seconds
- Filesize values should be in bytes

*Type:* attribute set of (null or boolean or signed integer or string or list of signed integer)

*Default:* `{ }`

*Example:*

``` nix
{
  DEFAULT_DOWNLOADS = 1;
  DETECT_BASE_URL = true;
  EXPIRE_TIMES_SECONDS = [
    300
    3600
    86400
    604800
  ];
}
```

*Declared by:* [`nixos/modules/services/web-servers/send.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/send.nix)

## `services.send.environmentFile` {#opt-services.send.environmentFile}

Environment file (see `systemd.exec(5)` "EnvironmentFile="
section for the syntax) passed to the service. This option is the
recommended way to pass secrets to Send.

This is especially important for users using a cloud storage backend.

A list of environment variables recognized by Send can be found here:
[https://github.com/timvisee/send/blob/master/docs/docker.md](https://github.com/timvisee/send/blob/master/docs/docker.md)

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/send"`

*Declared by:* [`nixos/modules/services/web-servers/send.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/send.nix)

## `services.send.host` {#opt-services.send.host}

The hostname or IP address for Send to bind to.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-servers/send.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/send.nix)

## `services.send.openFirewall` {#opt-services.send.openFirewall}

Whether to open firewall ports for send

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/send.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/send.nix)

## `services.send.package` {#opt-services.send.package}

The send package to use.

*Type:* package

*Default:* `pkgs.send`

*Declared by:* [`nixos/modules/services/web-servers/send.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/send.nix)

## `services.send.port` {#opt-services.send.port}

Port the Send service listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1443`

*Declared by:* [`nixos/modules/services/web-servers/send.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/send.nix)

## `services.send.redis.createLocally` {#opt-services.send.redis.createLocally}

Whether to create a local redis automatically.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-servers/send.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/send.nix)

## `services.send.redis.host` {#opt-services.send.redis.host}

Redis server address.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-servers/send.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/send.nix)

## `services.send.redis.name` {#opt-services.send.redis.name}

Name of the redis server.
Only used if [`services.send.redis.createLocally`](#opt-services.send.redis.createLocally) is set to true.

*Type:* string

*Default:* `"send"`

*Declared by:* [`nixos/modules/services/web-servers/send.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/send.nix)

## `services.send.redis.passwordFile` {#opt-services.send.redis.passwordFile}

The path to the file containing the Redis password.

If [`services.send.redis.createLocally`](#opt-services.send.redis.createLocally) is set to true,
the content of this file will be used as the password for the locally created Redis instance.

Leave it blank if no password is required.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/agenix/send-redis-password"`

*Declared by:* [`nixos/modules/services/web-servers/send.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/send.nix)

## `services.send.redis.port` {#opt-services.send.redis.port}

Port of the redis server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6379`

*Declared by:* [`nixos/modules/services/web-servers/send.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/send.nix)

## `services.serviio.dataDir` {#opt-services.serviio.dataDir}

The directory where serviio stores its state, data, etc.

*Type:* absolute path

*Default:* `"/var/lib/serviio"`

*Declared by:* [`nixos/modules/services/misc/serviio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/serviio.nix)

## `services.serviio.enable` {#opt-services.serviio.enable}

Whether to enable the Serviio Media Server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/serviio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/serviio.nix)

## `services.serviio.openFirewall` {#opt-services.serviio.openFirewall}

Open ports in the firewall for the Serviio Media Server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/serviio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/serviio.nix)

## `services.sftpgo.dataDir` {#opt-services.sftpgo.dataDir}

The directory where SFTPGo stores its data files.

*Type:* absolute path

*Default:* `"/var/lib/sftpgo"`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.enable` {#opt-services.sftpgo.enable}

sftpgo

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.extraArgs` {#opt-services.sftpgo.extraArgs}

Additional command line arguments to pass to the sftpgo daemon.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--log-level"
  "info"
]
```

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.extraReadWriteDirs` {#opt-services.sftpgo.extraReadWriteDirs}

Extra directories where SFTPGo is allowed to write to.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.group` {#opt-services.sftpgo.group}

Group name under which SFTPGo runs.

*Type:* string

*Default:* `"sftpgo"`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.loadDataFile` {#opt-services.sftpgo.loadDataFile}

Path to a json file containing users and folders to load (or update) on startup.
Check the [documentation](https://sftpgo.github.io/latest/config-file/)
for the `--loaddata-from` command line argument for more info.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.package` {#opt-services.sftpgo.package}

The sftpgo package to use.

*Type:* package

*Default:* `pkgs.sftpgo`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.settings` {#opt-services.sftpgo.settings}

The primary sftpgo configuration. See the
[configuration reference](https://sftpgo.github.io/latest/config-file/)
for possible values.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.settings.ftpd.bindings` {#opt-services.sftpgo.settings.ftpd.bindings}

Configure listen addresses and ports for ftpd.

*Type:* list of (open submodule of (JSON value))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.settings.ftpd.bindings.*.address` {#opt-services.sftpgo.settings.ftpd.bindings._.address}

Network listen address. Leave blank to listen on all available network interfaces.
On \*NIX you can specify an absolute path to listen on a Unix-domain socket.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.settings.ftpd.bindings.*.port` {#opt-services.sftpgo.settings.ftpd.bindings._.port}

The port for serving FTP requests.

Setting the port to `0` disables listening on this interface binding.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `0`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.settings.httpd.bindings` {#opt-services.sftpgo.settings.httpd.bindings}

Configure listen addresses and ports for httpd.

*Type:* list of (open submodule of (JSON value))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.settings.httpd.bindings.*.address` {#opt-services.sftpgo.settings.httpd.bindings._.address}

Network listen address. Leave blank to listen on all available network interfaces.
On \*NIX you can specify an absolute path to listen on a Unix-domain socket.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.settings.httpd.bindings.*.enable_web_admin` {#opt-services.sftpgo.settings.httpd.bindings._.enable_web_admin}

Enable the built-in web admin for this interface binding.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.settings.httpd.bindings.*.enable_web_client` {#opt-services.sftpgo.settings.httpd.bindings._.enable_web_client}

Enable the built-in web client for this interface binding.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.settings.httpd.bindings.*.port` {#opt-services.sftpgo.settings.httpd.bindings._.port}

The port for serving HTTP(S) requests.

Setting the port to `0` disables listening on this interface binding.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.settings.sftpd.bindings` {#opt-services.sftpgo.settings.sftpd.bindings}

Configure listen addresses and ports for sftpd.

*Type:* list of (open submodule of (JSON value))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.settings.sftpd.bindings.*.address` {#opt-services.sftpgo.settings.sftpd.bindings._.address}

Network listen address. Leave blank to listen on all available network interfaces.
On \*NIX you can specify an absolute path to listen on a Unix-domain socket.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.settings.sftpd.bindings.*.port` {#opt-services.sftpgo.settings.sftpd.bindings._.port}

The port for serving SFTP requests.

Setting the port to `0` disables listening on this interface binding.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `0`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.settings.smtp` {#opt-services.sftpgo.settings.smtp}

SMTP configuration section.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.settings.smtp.auth_type` {#opt-services.sftpgo.settings.smtp.auth_type}

- `0`: Plain
- `1`: Login
- `2`: CRAM-MD5

*Type:* one of 0, 1, 2

*Default:* `0`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.settings.smtp.encryption` {#opt-services.sftpgo.settings.smtp.encryption}

Encryption scheme:

- `0`: No encryption
- `1`: TLS
- `2`: STARTTLS

*Type:* one of 0, 1, 2

*Default:* `1`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.settings.smtp.from` {#opt-services.sftpgo.settings.smtp.from}

From address.

*Type:* string

*Default:* `"SFTPGo <sftpgo@example.com>"`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.settings.smtp.host` {#opt-services.sftpgo.settings.smtp.host}

Location of SMTP email server. Leave empty to disable email sending capabilities.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.settings.smtp.port` {#opt-services.sftpgo.settings.smtp.port}

Port of the SMTP Server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `465`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.settings.smtp.user` {#opt-services.sftpgo.settings.smtp.user}

SMTP username.

*Type:* string

*Default:* `"sftpgo"`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.settings.webdavd.bindings` {#opt-services.sftpgo.settings.webdavd.bindings}

Configure listen addresses and ports for webdavd.

*Type:* list of (open submodule of (JSON value))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.settings.webdavd.bindings.*.address` {#opt-services.sftpgo.settings.webdavd.bindings._.address}

Network listen address. Leave blank to listen on all available network interfaces.
On \*NIX you can specify an absolute path to listen on a Unix-domain socket.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.settings.webdavd.bindings.*.port` {#opt-services.sftpgo.settings.webdavd.bindings._.port}

The port for serving WebDAV requests.

Setting the port to `0` disables listening on this interface binding.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `0`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.sftpgo.user` {#opt-services.sftpgo.user}

User account name under which SFTPGo runs.

*Type:* string

*Default:* `"sftpgo"`

*Declared by:* [`nixos/modules/services/web-apps/sftpgo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sftpgo.nix)

## `services.shadowsocks.enable` {#opt-services.shadowsocks.enable}

Whether to run shadowsocks-libev shadowsocks server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/shadowsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shadowsocks.nix)

## `services.shadowsocks.encryptionMethod` {#opt-services.shadowsocks.encryptionMethod}

Encryption method. See [https://github.com/shadowsocks/shadowsocks-org/wiki/AEAD-Ciphers](https://github.com/shadowsocks/shadowsocks-org/wiki/AEAD-Ciphers).

*Type:* string

*Default:* `"chacha20-ietf-poly1305"`

*Declared by:* [`nixos/modules/services/networking/shadowsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shadowsocks.nix)

## `services.shadowsocks.extraConfig` {#opt-services.shadowsocks.extraConfig}

Additional configuration for shadowsocks that is not covered by the
provided options. The provided attrset will be serialized to JSON and
has to contain valid shadowsocks options. Unfortunately most
additional options are undocumented but it's easy to find out what is
available by looking into the source code of
[https://github.com/shadowsocks/shadowsocks-libev/blob/master/src/jconf.c](https://github.com/shadowsocks/shadowsocks-libev/blob/master/src/jconf.c)

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  nameserver = "8.8.8.8";
}
```

*Declared by:* [`nixos/modules/services/networking/shadowsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shadowsocks.nix)

## `services.shadowsocks.fastOpen` {#opt-services.shadowsocks.fastOpen}

use TCP fast-open

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/shadowsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shadowsocks.nix)

## `services.shadowsocks.localAddress` {#opt-services.shadowsocks.localAddress}

Local addresses to which the server binds.
Note: shadowsocks-rust accepts only string parameter.

*Type:* string or list of string

*Default:*

``` nix
[
  "[::0]"
  "0.0.0.0"
]
```

*Declared by:* [`nixos/modules/services/networking/shadowsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shadowsocks.nix)

## `services.shadowsocks.mode` {#opt-services.shadowsocks.mode}

Relay protocols.

*Type:* one of "tcp\_only", "tcp\_and\_udp", "udp\_only"

*Default:* `"tcp_and_udp"`

*Declared by:* [`nixos/modules/services/networking/shadowsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shadowsocks.nix)

## `services.shadowsocks.package` {#opt-services.shadowsocks.package}

The Shadowsocks package to use.

*Type:* package

*Default:* `pkgs.shadowsocks-libev`

*Declared by:* [`nixos/modules/services/networking/shadowsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shadowsocks.nix)

## `services.shadowsocks.password` {#opt-services.shadowsocks.password}

Password for connecting clients.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/shadowsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shadowsocks.nix)

## `services.shadowsocks.passwordFile` {#opt-services.shadowsocks.passwordFile}

Password file with a password for connecting clients.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/shadowsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shadowsocks.nix)

## `services.shadowsocks.plugin` {#opt-services.shadowsocks.plugin}

SIP003 plugin for shadowsocks

*Type:* null or string

*Default:* `null`

*Example:* `"${pkgs.shadowsocks-v2ray-plugin}/bin/v2ray-plugin"`

*Declared by:* [`nixos/modules/services/networking/shadowsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shadowsocks.nix)

## `services.shadowsocks.pluginOpts` {#opt-services.shadowsocks.pluginOpts}

Options to pass to the plugin if one was specified

*Type:* string

*Default:* `""`

*Example:* `"server;host=example.com"`

*Declared by:* [`nixos/modules/services/networking/shadowsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shadowsocks.nix)

## `services.shadowsocks.port` {#opt-services.shadowsocks.port}

Port which the server uses.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8388`

*Declared by:* [`nixos/modules/services/networking/shadowsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shadowsocks.nix)

## `services.shairport-sync.arguments` {#opt-services.shairport-sync.arguments}

Arguments to pass to the daemon. Defaults to a local pulseaudio
server.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/shairport-sync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shairport-sync.nix)

## `services.shairport-sync.enable` {#opt-services.shairport-sync.enable}

Enable the shairport-sync daemon.

Running with a local system-wide or remote pulseaudio server
is recommended.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/shairport-sync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shairport-sync.nix)

## `services.shairport-sync.group` {#opt-services.shairport-sync.group}

Group account name under which to run shairport-sync. The account
will be created.

*Type:* string

*Default:* `"shairport"`

*Declared by:* [`nixos/modules/services/networking/shairport-sync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shairport-sync.nix)

## `services.shairport-sync.openFirewall` {#opt-services.shairport-sync.openFirewall}

Whether to automatically open ports in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/shairport-sync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shairport-sync.nix)

## `services.shairport-sync.package` {#opt-services.shairport-sync.package}

The shairport-sync package to use.

*Type:* package

*Default:* `pkgs.shairport-sync`

*Declared by:* [`nixos/modules/services/networking/shairport-sync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shairport-sync.nix)

## `services.shairport-sync.settings` {#opt-services.shairport-sync.settings}

Configuration options for Shairport-Sync.

See the example [shairport-sync.conf](https://github.com/mikebrady/shairport-sync/blob/master/scripts/shairport-sync.conf) for possible options.

*Type:* attribute set of (libconfig value)

*Default:*

``` nix
{
  diagnostics = {
    log_verbosity = 1;
  };
  general = {
    output_backend = "pulseaudio";
  };
}
```

*Example:*

``` nix
{
  general = {
    name = "NixOS Shairport";
    output_backend = "pipewire";
  };
  metadata = {
    cover_art_cache_directory = "/tmp/shairport-sync/.cache/coverart";
    enabled = "yes";
    include_cover_art = "yes";
    pipe_name = "/tmp/shairport-sync-metadata";
    pipe_timeout = 5000;
  };
  mqtt = {
    enabled = "yes";
    hostname = "mqtt.server.domain.example";
    port = 1883;
    publish_cover = "yes";
    publish_parsed = "yes";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/shairport-sync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shairport-sync.nix)

## `services.shairport-sync.user` {#opt-services.shairport-sync.user}

User account name under which to run shairport-sync. The account
will be created.

*Type:* string

*Default:* `"shairport"`

*Declared by:* [`nixos/modules/services/networking/shairport-sync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shairport-sync.nix)

## `services.shelfmark.enable` {#opt-services.shelfmark.enable}

Whether to enable Shelfmark, a self-hosted book and audiobook search and download interface.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/shelfmark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/shelfmark.nix)

## `services.shelfmark.environment` {#opt-services.shelfmark.environment}

Environment variables to pass to the Shelfmark service.
See [https://github.com/calibrain/shelfmark/blob/main/docs/environment-variables.md](https://github.com/calibrain/shelfmark/blob/main/docs/environment-variables.md)
for available options.

*Type:* open submodule of attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  LOG_LEVEL = "DEBUG";
  SEARCH_MODE = "universal";
}
```

*Declared by:* [`nixos/modules/services/misc/shelfmark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/shelfmark.nix)

## `services.shelfmark.environment.CONFIG_DIR` {#opt-services.shelfmark.environment.CONFIG_DIR}

Directory for Shelfmark configuration, database, and artwork cache.

*Type:* absolute path

*Default:* `"/var/lib/shelfmark"`

*Declared by:* [`nixos/modules/services/misc/shelfmark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/shelfmark.nix)

## `services.shelfmark.environment.ENABLE_LOGGING` {#opt-services.shelfmark.environment.ENABLE_LOGGING}

Whether to enable file logging. Disabled by default since systemd captures console output via journald.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/shelfmark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/shelfmark.nix)

## `services.shelfmark.environment.FLASK_HOST` {#opt-services.shelfmark.environment.FLASK_HOST}

The IP address to bind the Shelfmark server to.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/shelfmark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/shelfmark.nix)

## `services.shelfmark.environment.FLASK_PORT` {#opt-services.shelfmark.environment.FLASK_PORT}

TCP port for the Shelfmark web interface.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8084`

*Declared by:* [`nixos/modules/services/misc/shelfmark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/shelfmark.nix)

## `services.shelfmark.openFirewall` {#opt-services.shelfmark.openFirewall}

Open the appropriate ports in the firewall for Shelfmark.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/shelfmark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/shelfmark.nix)

## `services.shelfmark.package` {#opt-services.shelfmark.package}

The shelfmark package to use.

*Type:* package

*Default:* `pkgs.shelfmark`

*Declared by:* [`nixos/modules/services/misc/shelfmark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/shelfmark.nix)

## `services.shellhub-agent.enable` {#opt-services.shellhub-agent.enable}

Whether to enable ShellHub Agent daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/shellhub-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shellhub-agent.nix)

## `services.shellhub-agent.keepAliveInterval` {#opt-services.shellhub-agent.keepAliveInterval}

Determine the interval to send the keep alive message to
the server. This has a direct impact of the bandwidth
used by the device.

*Type:* signed integer

*Default:* `30`

*Declared by:* [`nixos/modules/services/networking/shellhub-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shellhub-agent.nix)

## `services.shellhub-agent.package` {#opt-services.shellhub-agent.package}

The shellhub-agent package to use.

*Type:* package

*Default:* `pkgs.shellhub-agent`

*Declared by:* [`nixos/modules/services/networking/shellhub-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shellhub-agent.nix)

## `services.shellhub-agent.preferredHostname` {#opt-services.shellhub-agent.preferredHostname}

Set the device preferred hostname. This provides a hint to
the server to use this as hostname if it is available.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/shellhub-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shellhub-agent.nix)

## `services.shellhub-agent.privateKey` {#opt-services.shellhub-agent.privateKey}

Location where to store the ShellHub Agent private
key.

*Type:* absolute path

*Default:* `"/var/lib/shellhub-agent/private.key"`

*Declared by:* [`nixos/modules/services/networking/shellhub-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shellhub-agent.nix)

## `services.shellhub-agent.server` {#opt-services.shellhub-agent.server}

Server address of ShellHub Gateway to connect.

*Type:* string

*Default:* `"https://cloud.shellhub.io"`

*Declared by:* [`nixos/modules/services/networking/shellhub-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shellhub-agent.nix)

## `services.shellhub-agent.tenantId` {#opt-services.shellhub-agent.tenantId}

The tenant ID to use when connecting to the ShellHub
Gateway.

*Type:* string

*Example:* `"ba0a880c-2ada-11eb-a35e-17266ef329d6"`

*Declared by:* [`nixos/modules/services/networking/shellhub-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shellhub-agent.nix)

## `services.shibboleth-sp.configFile` {#opt-services.shibboleth-sp.configFile}

Path to shibboleth config file

*Type:* absolute path

*Example:* `"${pkgs.shibboleth-sp}/etc/shibboleth/shibboleth2.xml"`

*Declared by:* [`nixos/modules/services/security/shibboleth-sp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/shibboleth-sp.nix)

## `services.shibboleth-sp.enable` {#opt-services.shibboleth-sp.enable}

Whether to enable the shibboleth service

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/shibboleth-sp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/shibboleth-sp.nix)

## `services.shibboleth-sp.fastcgi.enable` {#opt-services.shibboleth-sp.fastcgi.enable}

Whether to include the shibauthorizer and shibresponder FastCGI processes

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/shibboleth-sp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/shibboleth-sp.nix)

## `services.shibboleth-sp.fastcgi.shibAuthorizerPort` {#opt-services.shibboleth-sp.fastcgi.shibAuthorizerPort}

Port for shibauthorizer FastCGI process to bind to

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9100`

*Declared by:* [`nixos/modules/services/security/shibboleth-sp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/shibboleth-sp.nix)

## `services.shibboleth-sp.fastcgi.shibResponderPort` {#opt-services.shibboleth-sp.fastcgi.shibResponderPort}

Port for shibauthorizer FastCGI process to bind to

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9101`

*Declared by:* [`nixos/modules/services/security/shibboleth-sp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/shibboleth-sp.nix)

## `services.shiori.address` {#opt-services.shiori.address}

The IP address on which Shiori will listen.
If empty, listens on all interfaces.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/shiori.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/shiori.nix)

## `services.shiori.databaseUrl` {#opt-services.shiori.databaseUrl}

The connection URL to connect to MySQL or PostgreSQL

*Type:* null or string

*Default:* `null`

*Example:* `"postgres:///shiori?host=/run/postgresql"`

*Declared by:* [`nixos/modules/services/web-apps/shiori.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/shiori.nix)

## `services.shiori.enable` {#opt-services.shiori.enable}

Whether to enable Shiori simple bookmarks manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/shiori.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/shiori.nix)

## `services.shiori.environmentFile` {#opt-services.shiori.environmentFile}

Path to file containing environment variables.
Useful for passing down secrets.
[https://github.com/go-shiori/shiori/blob/master/docs/Configuration.md#overall-configuration](https://github.com/go-shiori/shiori/blob/master/docs/Configuration.md#overall-configuration)

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/path/to/environmentFile"`

*Declared by:* [`nixos/modules/services/web-apps/shiori.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/shiori.nix)

## `services.shiori.package` {#opt-services.shiori.package}

The shiori package to use.

*Type:* package

*Default:* `pkgs.shiori`

*Declared by:* [`nixos/modules/services/web-apps/shiori.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/shiori.nix)

## `services.shiori.port` {#opt-services.shiori.port}

The port of the Shiori web application

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/web-apps/shiori.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/shiori.nix)

## `services.shiori.webRoot` {#opt-services.shiori.webRoot}

The root of the Shiori web application

*Type:* string

*Default:* `"/"`

*Example:* `"/shiori"`

*Declared by:* [`nixos/modules/services/web-apps/shiori.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/shiori.nix)

## `services.shoko.enable` {#opt-services.shoko.enable}

Whether to enable Shoko.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/shoko.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/shoko.nix)

## `services.shoko.openFirewall` {#opt-services.shoko.openFirewall}

Open ports in the firewall for the ShokoAnime api and web interface.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/shoko.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/shoko.nix)

## `services.shoko.package` {#opt-services.shoko.package}

The shoko package to use.

*Type:* package

*Default:* `pkgs.shoko`

*Declared by:* [`nixos/modules/services/misc/shoko.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/shoko.nix)

## `services.shoko.plugins` {#opt-services.shoko.plugins}

The plugins to install.

Note that if there are plugins installed imperatively when this
option is used, they will be deleted.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/shoko.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/shoko.nix)

## `services.shoko.webui` {#opt-services.shoko.webui}

The shoko-webui package to use.

*Type:* null or package

*Default:* `pkgs.shoko-webui`

*Declared by:* [`nixos/modules/services/misc/shoko.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/shoko.nix)

## `services.shorewall.configs` {#opt-services.shorewall.configs}

This option defines the Shorewall configs.
The attribute name defines the name of the config,
and the attribute value defines the content of the config.

*Type:* attribute set of strings concatenated with "\\n"

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/shorewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shorewall.nix)

## `services.shorewall.enable` {#opt-services.shorewall.enable}

Whether to enable Shorewall IPv4 Firewall.

::: warning
Enabling this service WILL disable the existing NixOS
firewall! Default firewall rules provided by packages are not
considered at the moment.
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/shorewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shorewall.nix)

## `services.shorewall.package` {#opt-services.shorewall.package}

The shorewall package to use.

*Type:* package

*Default:* `pkgs.shorewall`

*Declared by:* [`nixos/modules/services/networking/shorewall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shorewall.nix)

## `services.shorewall6.configs` {#opt-services.shorewall6.configs}

This option defines the Shorewall configs.
The attribute name defines the name of the config,
and the attribute value defines the content of the config.

*Type:* attribute set of strings concatenated with "\\n"

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/shorewall6.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shorewall6.nix)

## `services.shorewall6.enable` {#opt-services.shorewall6.enable}

Whether to enable Shorewall IPv6 Firewall.

::: warning
Enabling this service WILL disable the existing NixOS
firewall! Default firewall rules provided by packages are not
considered at the moment.
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/shorewall6.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shorewall6.nix)

## `services.shorewall6.package` {#opt-services.shorewall6.package}

The shorewall package to use.

*Type:* package

*Default:* `pkgs.shorewall`

*Declared by:* [`nixos/modules/services/networking/shorewall6.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/shorewall6.nix)

## `services.sillytavern.configFile` {#opt-services.sillytavern.configFile}

Path to the SillyTavern configuration file.

*Type:* absolute path

*Default:* `${cfg.package}/lib/node_modules/sillytavern/config.yaml`

*Declared by:* [`nixos/modules/services/web-apps/sillytavern.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sillytavern.nix)

## `services.sillytavern.enable` {#opt-services.sillytavern.enable}

Whether to enable sillytavern.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/sillytavern.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sillytavern.nix)

## `services.sillytavern.group` {#opt-services.sillytavern.group}

Group account under which the web-application run.

*Type:* string

*Default:* `"sillytavern"`

*Declared by:* [`nixos/modules/services/web-apps/sillytavern.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sillytavern.nix)

## `services.sillytavern.listen` {#opt-services.sillytavern.listen}

Whether to listen on all network interfaces.

*Type:* null or boolean

*Default:* `null`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/sillytavern.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sillytavern.nix)

## `services.sillytavern.listenAddressIPv4` {#opt-services.sillytavern.listenAddressIPv4}

Specific IPv4 address to listen to.

*Type:* null or string

*Default:* `null`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/sillytavern.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sillytavern.nix)

## `services.sillytavern.listenAddressIPv6` {#opt-services.sillytavern.listenAddressIPv6}

Specific IPv6 address to listen to.

*Type:* null or string

*Default:* `null`

*Example:* `"::1"`

*Declared by:* [`nixos/modules/services/web-apps/sillytavern.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sillytavern.nix)

## `services.sillytavern.package` {#opt-services.sillytavern.package}

The sillytavern package to use.

*Type:* package

*Default:* `pkgs.sillytavern`

*Declared by:* [`nixos/modules/services/web-apps/sillytavern.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sillytavern.nix)

## `services.sillytavern.port` {#opt-services.sillytavern.port}

Port on which SillyTavern will listen.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Example:* `8045`

*Declared by:* [`nixos/modules/services/web-apps/sillytavern.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sillytavern.nix)

## `services.sillytavern.user` {#opt-services.sillytavern.user}

User account under which the web-application run.

*Type:* string

*Default:* `"sillytavern"`

*Declared by:* [`nixos/modules/services/web-apps/sillytavern.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sillytavern.nix)

## `services.sillytavern.whitelist` {#opt-services.sillytavern.whitelist}

Enables whitelist mode.

*Type:* null or boolean

*Default:* `null`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/sillytavern.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sillytavern.nix)

## `services.silverbullet.enable` {#opt-services.silverbullet.enable}

Whether to enable Silverbullet, an open-source, self-hosted, offline-capable Personal Knowledge Management (PKM) web application.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/silverbullet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/silverbullet.nix)

## `services.silverbullet.envFile` {#opt-services.silverbullet.envFile}

File containing extra environment variables. For example:

```
SB_USER=user:password
SB_AUTH_TOKEN=abcdefg12345
```

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/etc/silverbullet.env"`

*Declared by:* [`nixos/modules/services/web-apps/silverbullet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/silverbullet.nix)

## `services.silverbullet.extraArgs` {#opt-services.silverbullet.extraArgs}

Extra arguments passed to silverbullet.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--single"
]
```

*Declared by:* [`nixos/modules/services/web-apps/silverbullet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/silverbullet.nix)

## `services.silverbullet.group` {#opt-services.silverbullet.group}

The group to run Silverbullet under.
By default, a group named `silverbullet` will be created.

*Type:* string

*Default:* `"silverbullet"`

*Example:* `"yourGroup"`

*Declared by:* [`nixos/modules/services/web-apps/silverbullet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/silverbullet.nix)

## `services.silverbullet.listenAddress` {#opt-services.silverbullet.listenAddress}

Address or hostname to listen on. Defaults to 127.0.0.1.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/silverbullet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/silverbullet.nix)

## `services.silverbullet.listenPort` {#opt-services.silverbullet.listenPort}

Port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/web-apps/silverbullet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/silverbullet.nix)

## `services.silverbullet.openFirewall` {#opt-services.silverbullet.openFirewall}

Open port in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/silverbullet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/silverbullet.nix)

## `services.silverbullet.package` {#opt-services.silverbullet.package}

The silverbullet package to use.

*Type:* package

*Default:* `pkgs.silverbullet`

*Declared by:* [`nixos/modules/services/web-apps/silverbullet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/silverbullet.nix)

## `services.silverbullet.spaceDir` {#opt-services.silverbullet.spaceDir}

Folder to store Silverbullet's space/workspace.
By default it is located at `/var/lib/silverbullet`.

*Type:* absolute path

*Default:* `"/var/lib/silverbullet"`

*Example:* `"/home/yourUser/silverbullet"`

*Declared by:* [`nixos/modules/services/web-apps/silverbullet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/silverbullet.nix)

## `services.silverbullet.user` {#opt-services.silverbullet.user}

The user to run Silverbullet as.
By default, a user named `silverbullet` will be created whose space
directory is [spaceDir](#opt-services.silverbullet.spaceDir).

*Type:* string

*Default:* `"silverbullet"`

*Example:* `"yourUser"`

*Declared by:* [`nixos/modules/services/web-apps/silverbullet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/silverbullet.nix)

## `services.sing-box.enable` {#opt-services.sing-box.enable}

Whether to enable sing-box universal proxy platform.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/sing-box.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sing-box.nix)

## `services.sing-box.package` {#opt-services.sing-box.package}

The sing-box package to use.

*Type:* package

*Default:* `pkgs.sing-box`

*Declared by:* [`nixos/modules/services/networking/sing-box.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sing-box.nix)

## `services.sing-box.settings` {#opt-services.sing-box.settings}

The sing-box configuration, see [https://sing-box.sagernet.org/configuration/](https://sing-box.sagernet.org/configuration/) for documentation.

Options containing secret data should be set to an attribute set
containing the attribute `_secret` - a string pointing to a file
containing the value the option should be set to.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/sing-box.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sing-box.nix)

## `services.sitespeed-io.dataDir` {#opt-services.sitespeed-io.dataDir}

The base sitespeed-io data directory.

*Type:* string

*Default:* `"/var/lib/sitespeed-io"`

*Declared by:* [`nixos/modules/services/networking/sitespeed-io.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sitespeed-io.nix)

## `services.sitespeed-io.enable` {#opt-services.sitespeed-io.enable}

Whether to enable Sitespeed.io.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/sitespeed-io.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sitespeed-io.nix)

## `services.sitespeed-io.package` {#opt-services.sitespeed-io.package}

The sitespeed-io package to use.

*Type:* package

*Default:* `pkgs.sitespeed-io`

*Declared by:* [`nixos/modules/services/networking/sitespeed-io.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sitespeed-io.nix)

## `services.sitespeed-io.period` {#opt-services.sitespeed-io.period}

Systemd calendar expression when to run. See `systemd.time(7)`.

*Type:* string

*Default:* `"hourly"`

*Declared by:* [`nixos/modules/services/networking/sitespeed-io.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sitespeed-io.nix)

## `services.sitespeed-io.runs` {#opt-services.sitespeed-io.runs}

A list of run configurations. The service will call sitespeed-io once
for every run listed here. This lets you examine different websites
with different sitespeed-io settings.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/sitespeed-io.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sitespeed-io.nix)

## `services.sitespeed-io.runs.*.extraArgs` {#opt-services.sitespeed-io.runs._.extraArgs}

Extra command line arguments to pass to the program.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/sitespeed-io.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sitespeed-io.nix)

## `services.sitespeed-io.runs.*.settings` {#opt-services.sitespeed-io.runs._.settings}

Configuration for sitespeed-io, see
[https://www.sitespeed.io/documentation/sitespeed.io/configuration/](https://www.sitespeed.io/documentation/sitespeed.io/configuration/)
for available options. The value here will be directly transformed to
JSON and passed as `--config` to the program.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/sitespeed-io.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sitespeed-io.nix)

## `services.sitespeed-io.runs.*.urls` {#opt-services.sitespeed-io.runs._.urls}

URLs the service should monitor.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/sitespeed-io.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sitespeed-io.nix)

## `services.sitespeed-io.user` {#opt-services.sitespeed-io.user}

User account under which sitespeed-io runs.

*Type:* string

*Default:* `"sitespeed-io"`

*Declared by:* [`nixos/modules/services/networking/sitespeed-io.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sitespeed-io.nix)

## `services.sks.dataDir` {#opt-services.sks.dataDir}

Data directory (-basedir) for SKS, where the database and all
configuration files are located (e.g. KDB, PTree, membership and
sksconf).

*Type:* absolute path

*Default:* `"/var/db/sks"`

*Example:* `"/var/lib/sks"`

*Declared by:* [`nixos/modules/services/security/sks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/sks.nix)

## `services.sks.enable` {#opt-services.sks.enable}

Whether to enable SKS (synchronizing key server for OpenPGP) and start the database
server. You need to create "${dataDir}/dump/\*.gpg" for the initial
import.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/sks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/sks.nix)

## `services.sks.extraDbConfig` {#opt-services.sks.extraDbConfig}

Set contents of the files "KDB/DB\_CONFIG" and "PTree/DB\_CONFIG" within
the ${dataDir} directory. This is used to configure options for the
database for the sks key server.

Documentation of available options are available in the file named
"sampleConfig/DB\_CONFIG" in the following repository:
https://bitbucket.org/skskeyserver/sks-keyserver/src

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/security/sks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/sks.nix)

## `services.sks.hkpAddress` {#opt-services.sks.hkpAddress}

Domain names, IPv4 and/or IPv6 addresses to listen on for HKP
requests.

*Type:* list of string

*Default:*

``` nix
[
  "127.0.0.1"
  "::1"
]
```

*Declared by:* [`nixos/modules/services/security/sks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/sks.nix)

## `services.sks.hkpPort` {#opt-services.sks.hkpPort}

HKP port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `11371`

*Declared by:* [`nixos/modules/services/security/sks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/sks.nix)

## `services.sks.package` {#opt-services.sks.package}

The sks package to use.

*Type:* package

*Default:* `pkgs.sks`

*Declared by:* [`nixos/modules/services/security/sks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/sks.nix)

## `services.sks.webroot` {#opt-services.sks.webroot}

Source directory (will be symlinked, if not null) for the files the
built-in webserver should serve. SKS (${pkgs.sks.webSamples})
provides the following examples: "HTML5", "OpenPKG", and "XHTML+ES".
The index file can be named index.html, index.htm, index.xhtm, or
index.xhtml. Files with the extensions .css, .es, .js, .jpg, .jpeg,
.png, or .gif are supported. Subdirectories and filenames with
anything other than alphanumeric characters and the '.' character
will be ignored.

*Type:* null or absolute path

*Default:* `"${package.webSamples}/OpenPKG"`

*Declared by:* [`nixos/modules/services/security/sks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/sks.nix)

## `services.skydns.address` {#opt-services.skydns.address}

Skydns address to bind to.

*Type:* string

*Default:* `"0.0.0.0:53"`

*Declared by:* [`nixos/modules/services/networking/skydns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/skydns.nix)

## `services.skydns.domain` {#opt-services.skydns.domain}

Skydns default domain if not specified by etcd config.

*Type:* string

*Default:* `"skydns.local."`

*Declared by:* [`nixos/modules/services/networking/skydns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/skydns.nix)

## `services.skydns.enable` {#opt-services.skydns.enable}

Whether to enable skydns service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/skydns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/skydns.nix)

## `services.skydns.etcd.caCert` {#opt-services.skydns.etcd.caCert}

Skydns path of TLS certificate authority public key.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/skydns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/skydns.nix)

## `services.skydns.etcd.machines` {#opt-services.skydns.etcd.machines}

Skydns list of etcd endpoints to connect to.

*Type:* list of string

*Default:*

``` nix
[
  "http://127.0.0.1:2379"
]
```

*Declared by:* [`nixos/modules/services/networking/skydns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/skydns.nix)

## `services.skydns.etcd.tlsKey` {#opt-services.skydns.etcd.tlsKey}

Skydns path of TLS client certificate - private key.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/skydns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/skydns.nix)

## `services.skydns.etcd.tlsPem` {#opt-services.skydns.etcd.tlsPem}

Skydns path of TLS client certificate - public key.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/skydns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/skydns.nix)

## `services.skydns.extraConfig` {#opt-services.skydns.extraConfig}

Skydns attribute set of extra config options passed as environment variables.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/skydns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/skydns.nix)

## `services.skydns.nameservers` {#opt-services.skydns.nameservers}

Skydns list of nameservers to forward DNS requests to when not authoritative for a domain.

*Type:* list of string

*Default:* `map (n: n + ":53") config.networking.nameservers`

*Example:*

``` nix
[
  "8.8.8.8:53"
  "8.8.4.4:53"
]
```

*Declared by:* [`nixos/modules/services/networking/skydns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/skydns.nix)

## `services.skydns.package` {#opt-services.skydns.package}

The skydns package to use.

*Type:* package

*Default:* `pkgs.skydns`

*Declared by:* [`nixos/modules/services/networking/skydns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/skydns.nix)

## `services.slimserver.dataDir` {#opt-services.slimserver.dataDir}

The directory where slimserver stores its state, tag cache,
playlists etc.

*Type:* absolute path

*Default:* `"/var/lib/slimserver"`

*Declared by:* [`nixos/modules/services/audio/slimserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/slimserver.nix)

## `services.slimserver.enable` {#opt-services.slimserver.enable}

Whether to enable slimserver.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/audio/slimserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/slimserver.nix)

## `services.slimserver.package` {#opt-services.slimserver.package}

The slimserver package to use.

*Type:* package

*Default:* `pkgs.slimserver`

*Declared by:* [`nixos/modules/services/audio/slimserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/slimserver.nix)

## `services.slskd.domain` {#opt-services.slskd.domain}

If non-null, enables an nginx reverse proxy virtual host at this FQDN,
at the path configurated with `services.slskd.web.url_base`.

*Type:* null or string

*Default:* `null`

*Example:* `"slskd.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.enable` {#opt-services.slskd.enable}

Whether to enable slskd.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.environmentFile` {#opt-services.slskd.environmentFile}

Path to the environment file sourced on startup.
It must at least contain the variables `SLSKD_SLSK_USERNAME` and `SLSKD_SLSK_PASSWORD`.
Web interface credentials should also be set here in `SLSKD_USERNAME` and `SLSKD_PASSWORD`.
Other, optional credentials like SOCKS5 with `SLSKD_SLSK_PROXY_USERNAME` and `SLSKD_SLSK_PROXY_PASSWORD`
should all reside here instead of in the world-readable nix store.
Variables are documented at [https://github.com/slskd/slskd/blob/master/docs/config.md](https://github.com/slskd/slskd/blob/master/docs/config.md)

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.group` {#opt-services.slskd.group}

Group under which slskd runs.

*Type:* string

*Default:* `"slskd"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx` {#opt-services.slskd.nginx}

This option customizes the nginx virtual host set up for slskd.

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
{
  enableACME = true;
  forceSSL = true;
}
```

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.acmeFallbackHost` {#opt-services.slskd.nginx.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.acmeRoot` {#opt-services.slskd.nginx.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.addSSL` {#opt-services.slskd.nginx.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.basicAuth` {#opt-services.slskd.nginx.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.basicAuthFile` {#opt-services.slskd.nginx.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.default` {#opt-services.slskd.nginx.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.enableACME` {#opt-services.slskd.nginx.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.extraConfig` {#opt-services.slskd.nginx.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.forceSSL` {#opt-services.slskd.nginx.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.globalRedirect` {#opt-services.slskd.nginx.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.http2` {#opt-services.slskd.nginx.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.http3` {#opt-services.slskd.nginx.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.http3_hq` {#opt-services.slskd.nginx.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.kTLS` {#opt-services.slskd.nginx.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.listen` {#opt-services.slskd.nginx.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.listen.*.addr` {#opt-services.slskd.nginx.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.listen.*.extraParameters` {#opt-services.slskd.nginx.listen._.extraParameters}

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

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.listen.*.port` {#opt-services.slskd.nginx.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.listen.*.proxyProtocol` {#opt-services.slskd.nginx.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.listen.*.ssl` {#opt-services.slskd.nginx.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.listenAddresses` {#opt-services.slskd.nginx.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.locations` {#opt-services.slskd.nginx.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.locations.<name>.alias` {#opt-services.slskd.nginx.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.locations.<name>.basicAuth` {#opt-services.slskd.nginx.locations._name_.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.locations.<name>.basicAuthFile` {#opt-services.slskd.nginx.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.locations.<name>.extraConfig` {#opt-services.slskd.nginx.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.locations.<name>.fastcgiParams` {#opt-services.slskd.nginx.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.locations.<name>.index` {#opt-services.slskd.nginx.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.locations.<name>.priority` {#opt-services.slskd.nginx.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.locations.<name>.proxyPass` {#opt-services.slskd.nginx.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.locations.<name>.proxyWebsockets` {#opt-services.slskd.nginx.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.locations.<name>.recommendedProxySettings` {#opt-services.slskd.nginx.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.locations.<name>.recommendedUwsgiSettings` {#opt-services.slskd.nginx.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.locations.<name>.return` {#opt-services.slskd.nginx.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.locations.<name>.root` {#opt-services.slskd.nginx.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.locations.<name>.tryFiles` {#opt-services.slskd.nginx.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.locations.<name>.useGrpcErrorPages` {#opt-services.slskd.nginx.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.locations.<name>.uwsgiPass` {#opt-services.slskd.nginx.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.onlySSL` {#opt-services.slskd.nginx.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.quic` {#opt-services.slskd.nginx.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.redirectCode` {#opt-services.slskd.nginx.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.rejectSSL` {#opt-services.slskd.nginx.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.reuseport` {#opt-services.slskd.nginx.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.root` {#opt-services.slskd.nginx.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.serverAliases` {#opt-services.slskd.nginx.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.serverName` {#opt-services.slskd.nginx.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.sslCertificate` {#opt-services.slskd.nginx.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.sslCertificateKey` {#opt-services.slskd.nginx.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.sslTrustedCertificate` {#opt-services.slskd.nginx.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.nginx.useACMEHost` {#opt-services.slskd.nginx.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.openFirewall` {#opt-services.slskd.openFirewall}

Whether to open the firewall for the soulseek network listen port (not the web interface port).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.package` {#opt-services.slskd.package}

The slskd package to use.

*Type:* package

*Default:* `pkgs.slskd`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings` {#opt-services.slskd.settings}

Application configuration for slskd. See
[documentation](https://github.com/slskd/slskd/blob/master/docs/config.md).

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.directories.downloads` {#opt-services.slskd.settings.directories.downloads}

Directory where downloaded files are stored.

*Type:* null or absolute path

*Default:* `"/var/lib/slskd/downloads"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.directories.incomplete` {#opt-services.slskd.settings.directories.incomplete}

Directory where incomplete downloading files are stored.

*Type:* null or absolute path

*Default:* `"/var/lib/slskd/incomplete"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.filters.search.request` {#opt-services.slskd.settings.filters.search.request}

Incoming search requests which match this filter are ignored.

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "^.{1,2}$" ]`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.flags.force_share_scan` {#opt-services.slskd.settings.flags.force_share_scan}

Force a rescan of shares on every startup.

*Type:* boolean

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.remote_file_management` {#opt-services.slskd.settings.remote_file_management}

Whether to enable modification of share contents through the web ui.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.retention.files.complete` {#opt-services.slskd.settings.retention.files.complete}

Lifespan of completely downloaded files in minutes.

*Type:* unsigned integer, meaning \>=0

*Default:* `"(indefinite)"`

*Example:* `20160`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.retention.files.incomplete` {#opt-services.slskd.settings.retention.files.incomplete}

Lifespan of incomplete downloading files in minutes.

*Type:* unsigned integer, meaning \>=0

*Default:* `"(indefinite)"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.retention.transfers.download.cancelled` {#opt-services.slskd.settings.retention.transfers.download.cancelled}

Lifespan of cancelled download tasks.

*Type:* unsigned integer, meaning \>=0

*Default:* `"(indefinite)"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.retention.transfers.download.errored` {#opt-services.slskd.settings.retention.transfers.download.errored}

Lifespan of errored download tasks.

*Type:* unsigned integer, meaning \>=0

*Default:* `"(indefinite)"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.retention.transfers.download.succeeded` {#opt-services.slskd.settings.retention.transfers.download.succeeded}

Lifespan of succeeded download tasks.

*Type:* unsigned integer, meaning \>=0

*Default:* `"(indefinite)"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.retention.transfers.upload.cancelled` {#opt-services.slskd.settings.retention.transfers.upload.cancelled}

Lifespan of cancelled upload tasks.

*Type:* unsigned integer, meaning \>=0

*Default:* `"(indefinite)"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.retention.transfers.upload.errored` {#opt-services.slskd.settings.retention.transfers.upload.errored}

Lifespan of errored upload tasks.

*Type:* unsigned integer, meaning \>=0

*Default:* `"(indefinite)"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.retention.transfers.upload.succeeded` {#opt-services.slskd.settings.retention.transfers.upload.succeeded}

Lifespan of succeeded upload tasks.

*Type:* unsigned integer, meaning \>=0

*Default:* `"(indefinite)"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.rooms` {#opt-services.slskd.settings.rooms}

Chat rooms to join on startup.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.shares.directories` {#opt-services.slskd.settings.shares.directories}

Paths to shared directories. See
[documentation](https://github.com/slskd/slskd/blob/master/docs/config.md#directories)
for advanced usage.

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "/home/John/Music" "!/home/John/Music/Recordings" "[Music Drive]/mnt" ]`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.shares.filters` {#opt-services.slskd.settings.shares.filters}

Regular expressions of files to exclude from sharing.

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "\.ini$" "Thumbs.db$" "\.DS_Store$" ]`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.soulseek.description` {#opt-services.slskd.settings.soulseek.description}

The user description for the Soulseek network.

*Type:* string

*Default:* `"A slskd user. https://github.com/slskd/slskd"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.soulseek.listen_port` {#opt-services.slskd.settings.soulseek.listen_port}

The port on which to listen for incoming connections.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `50300`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.transfers.download.slots` {#opt-services.slskd.settings.transfers.download.slots}

Limit of the number of concurrent download slots.

*Type:* unsigned integer, meaning \>=0

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.transfers.download.speed_limit` {#opt-services.slskd.settings.transfers.download.speed_limit}

Total download speed limit in kibibytes per second.

*Type:* unsigned integer, meaning \>=0

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.transfers.upload.slots` {#opt-services.slskd.settings.transfers.upload.slots}

Limit of the number of concurrent upload slots.

*Type:* unsigned integer, meaning \>=0

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.transfers.upload.speed_limit` {#opt-services.slskd.settings.transfers.upload.speed_limit}

Total upload speed limit in kibibytes per second.

*Type:* unsigned integer, meaning \>=0

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.web.https.disabled` {#opt-services.slskd.settings.web.https.disabled}

Disable the built-in HTTPS server

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.web.port` {#opt-services.slskd.settings.web.port}

The HTTP listen port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5030`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.settings.web.url_base` {#opt-services.slskd.settings.web.url_base}

The base path in the url for web requests.

*Type:* absolute path

*Default:* `"/"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slskd.user` {#opt-services.slskd.user}

User account under which slskd runs.

*Type:* string

*Default:* `"slskd"`

*Declared by:* [`nixos/modules/services/web-apps/slskd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/slskd.nix)

## `services.slurm.client.enable` {#opt-services.slurm.client.enable}

Whether to enable slurm client daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.clusterName` {#opt-services.slurm.clusterName}

Necessary to distinguish accounting records in a multi-cluster environment.

*Type:* string

*Default:* `"default"`

*Example:* `"myCluster"`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.controlAddr` {#opt-services.slurm.controlAddr}

Name that ControlMachine should be referred to in establishing a
communications path.

*Type:* null or string

*Default:* `config.services.slurm.controlMachine`

*Example:* `null`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.controlMachine` {#opt-services.slurm.controlMachine}

The short hostname of the machine where SLURM control functions are
executed (i.e. the name returned by the command "hostname -s", use "tux001"
rather than "tux001.my.com").

*Type:* null or string

*Default:* `null`

*Example:* `null`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.dbdserver.dbdHost` {#opt-services.slurm.dbdserver.dbdHost}

Hostname of the machine where `slurmdbd`
is running (i.e. name returned by `hostname -s`).

*Type:* string

*Default:* `config.networking.hostName`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.dbdserver.enable` {#opt-services.slurm.dbdserver.enable}

Whether to enable SlurmDBD service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.dbdserver.extraConfig` {#opt-services.slurm.dbdserver.extraConfig}

Extra configuration for `slurmdbd.conf` See also:
`slurmdbd.conf(8)`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.dbdserver.storagePassFile` {#opt-services.slurm.dbdserver.storagePassFile}

Path to file with database password. The content of this will be used to
create the password for the `StoragePass` option.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.dbdserver.storageUser` {#opt-services.slurm.dbdserver.storageUser}

Database user name.

*Type:* string

*Default:* `config.services.slurm.user`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.enableSrunX11` {#opt-services.slurm.enableSrunX11}

If enabled srun will accept the option "--x11" to allow for X11 forwarding
from within an interactive session or a batch job. This activates the
slurm-spank-x11 module. Note that this option also enables
`services.openssh.forwardX11` on the client.

This option requires slurm to be compiled without native X11 support.
The default behavior is to re-compile the slurm package with native X11
support disabled if this option is set to true.

To use the native X11 support add `PrologFlags=X11` in `extraConfig`.
Note that this method will only work RSA SSH host keys.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.enableStools` {#opt-services.slurm.enableStools}

Whether to provide a `slurm.conf` file.
Enable this option if you do not run a slurm daemon on this host
(i.e. `server.enable` and `client.enable` are `false`)
but you still want to run slurm commands from this host.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.extraCgroupConfig` {#opt-services.slurm.extraCgroupConfig}

Extra configuration for `cgroup.conf`. This file is
used when `procTrackType=proctrack/cgroup`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.extraConfig` {#opt-services.slurm.extraConfig}

Extra configuration options that will be added verbatim at
the end of the slurm configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.extraConfigPaths` {#opt-services.slurm.extraConfigPaths}

Slurm expects config files for plugins in the same path
as `slurm.conf`. Add extra nix store
paths that should be merged into same directory as
`slurm.conf`.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.extraPlugstackConfig` {#opt-services.slurm.extraPlugstackConfig}

Extra configuration that will be added to the end of `plugstack.conf`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.mpi.PmixCliTmpDirBase` {#opt-services.slurm.mpi.PmixCliTmpDirBase}

Base path for PMIx temporary files.

*Type:* string

*Default:* `"/tmp/pmix"`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.mpi.extraMpiConfig` {#opt-services.slurm.mpi.extraMpiConfig}

Extra configuration for that will be added to `mpi.conf`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.nodeName` {#opt-services.slurm.nodeName}

Name that SLURM uses to refer to a node (or base partition for BlueGene
systems). Typically this would be the string that "/bin/hostname -s"
returns. Note that now you have to write node's parameters after the name.

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "linux[1-32] CPUs=1 State=UNKNOWN" ];`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.package` {#opt-services.slurm.package}

The slurm package to use.

*Type:* package

*Default:* `pkgs.slurm`

*Example:* `slurm-full`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.partitionName` {#opt-services.slurm.partitionName}

Name by which the partition may be referenced. Note that now you have
to write the partition's parameters after the name.

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "debug Nodes=linux[1-32] Default=YES MaxTime=INFINITE State=UP" ];`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.procTrackType` {#opt-services.slurm.procTrackType}

Plugin to be used for process tracking on a job step basis.
The slurmd daemon uses this mechanism to identify all processes
which are children of processes it spawns for a user job step.

*Type:* string

*Default:* `"proctrack/linuxproc"`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.rest.enable` {#opt-services.slurm.rest.enable}

Whether to enable slurm REST daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.rest.environment` {#opt-services.slurm.rest.environment}

Environment variables to set for the slurmrestd daemon, see slurmrestd(8).

*Type:* open submodule of attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.rest.environment.SLURMRESTD_DEBUG` {#opt-services.slurm.rest.environment.SLURMRESTD_DEBUG}

Set debug level explicitly. Valid values are 0-9, or the same
string values as the debug options such as SlurmctldDebug in
slurm.conf(5).

*Type:* string

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.rest.environment.SLURMRESTD_LISTEN` {#opt-services.slurm.rest.environment.SLURMRESTD_LISTEN}

Comma-delimited list of host:port pairs or unix sockets to listen on.

*Type:* string

*Default:* `":6820"`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.rest.environment.SLURM_JWT` {#opt-services.slurm.rest.environment.SLURM_JWT}

This variable must be set to use JWT token authentication.

*Type:* string

*Default:* `"daemon"`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.rest.options` {#opt-services.slurm.rest.options}

Extra command-line options to pass to slurmrestd.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.server.enable` {#opt-services.slurm.server.enable}

Whether to enable the slurm control daemon.
Note that the standard authentication method is "munge".
The "munge" service needs to be provided with a password file in order for
slurm to work properly (see `services.munge.password`).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.server.flags` {#opt-services.slurm.server.flags}

Flags passed to `slurmctld` daemon, see `slurmctld(8)`.
Special characters are properly escaped.

*Type:* attribute set of (string or boolean or floating point number or signed integer)

*Default:* `{ }`

*Example:*

``` nix
{
  L = "/var/log/file with space.log";
  i = true;
  n = 10;
  systemd = true;
}
```

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.stateSaveLocation` {#opt-services.slurm.stateSaveLocation}

Directory into which the Slurm controller, slurmctld, saves its state.

*Type:* string

*Default:* `"/var/spool/slurmctld"`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.slurm.user` {#opt-services.slurm.user}

Set this option when you want to run the slurmctld daemon
as something else than the default slurm user "slurm".
Note that the UID of this user needs to be the same
on all nodes.

*Type:* string

*Default:* `"slurm"`

*Declared by:* [`nixos/modules/services/computing/slurm/slurm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/slurm/slurm.nix)

## `services.smartd.autodetect` {#opt-services.smartd.autodetect}

Whenever smartd should monitor all devices connected to the
machine at the time it's being started (the default).

Set to false to monitor the devices listed in
[`services.smartd.devices`](#opt-services.smartd.devices) only.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/smartd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/smartd.nix)

## `services.smartd.defaults.autodetected` {#opt-services.smartd.defaults.autodetected}

Like [`services.smartd.defaults.monitored`](#opt-services.smartd.defaults.monitored), but for the
autodetected devices.

*Type:* strings concatenated with " "

*Default:* `config.services.smartd.defaults.monitored`

*Declared by:* [`nixos/modules/services/monitoring/smartd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/smartd.nix)

## `services.smartd.defaults.monitored` {#opt-services.smartd.defaults.monitored}

Common default options for explicitly monitored (listed in
[`services.smartd.devices`](#opt-services.smartd.devices)) devices.

The default value turns on monitoring of all the things (see
`man 5 smartd.conf`).

The example also turns on SMART Automatic Offline Testing on
startup, and schedules short self-tests daily, and long
self-tests weekly.

*Type:* strings concatenated with " "

*Default:* `"-a"`

*Example:* `"-a -o on -s (S/../.././02|L/../../7/04)"`

*Declared by:* [`nixos/modules/services/monitoring/smartd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/smartd.nix)

## `services.smartd.devices` {#opt-services.smartd.devices}

List of devices to monitor.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    device = "/dev/sda";
  }
  {
    device = "/dev/sdb";
    options = "-d sat";
  }
]
```

*Declared by:* [`nixos/modules/services/monitoring/smartd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/smartd.nix)

## `services.smartd.devices.*.device` {#opt-services.smartd.devices._.device}

Location of the device.

*Type:* string

*Example:* `"/dev/sda"`

*Declared by:* [`nixos/modules/services/monitoring/smartd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/smartd.nix)

## `services.smartd.devices.*.options` {#opt-services.smartd.devices._.options}

Options that determine how smartd monitors the device.

*Type:* strings concatenated with " "

*Default:* `""`

*Example:* `"-d sat"`

*Declared by:* [`nixos/modules/services/monitoring/smartd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/smartd.nix)

## `services.smartd.enable` {#opt-services.smartd.enable}

Whether to enable smartd daemon from `smartmontools` package.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/smartd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/smartd.nix)

## `services.smartd.extraOptions` {#opt-services.smartd.extraOptions}

Extra command-line options passed to the `smartd`
daemon on startup.

(See `man 8 smartd`.)

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-A /var/log/smartd/"
  "--interval=3600"
]
```

*Declared by:* [`nixos/modules/services/monitoring/smartd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/smartd.nix)

## `services.smartd.notifications.mail.enable` {#opt-services.smartd.notifications.mail.enable}

Whenever to send e-mail notifications.

*Type:* boolean

*Default:* `config.services.mail.sendmailSetuidWrapper != null`

*Declared by:* [`nixos/modules/services/monitoring/smartd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/smartd.nix)

## `services.smartd.notifications.mail.mailer` {#opt-services.smartd.notifications.mail.mailer}

Sendmail-compatible binary to be used to send the messages.

You should probably enable
`services.postfix` or some other MTA for
this to work.

*Type:* absolute path

*Default:* `"/run/wrappers/bin/sendmail"`

*Declared by:* [`nixos/modules/services/monitoring/smartd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/smartd.nix)

## `services.smartd.notifications.mail.recipient` {#opt-services.smartd.notifications.mail.recipient}

Recipient of the notification messages.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/monitoring/smartd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/smartd.nix)

## `services.smartd.notifications.mail.sender` {#opt-services.smartd.notifications.mail.sender}

Sender of the notification messages.
Acts as the value of `email` in the emails' `From: ...` field.

*Type:* string

*Default:* `"root"`

*Example:* `"example@domain.tld"`

*Declared by:* [`nixos/modules/services/monitoring/smartd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/smartd.nix)

## `services.smartd.notifications.systembus-notify.enable` {#opt-services.smartd.notifications.systembus-notify.enable}

Whenever to send systembus-notify notifications.

WARNING: enabling this option (while convenient) should *not* be done on a
machine where you do not trust the other users as it allows any other
local user to DoS your session by spamming notifications.

To actually see the notifications in your GUI session, you need to have
`systembus-notify` running as your user, which this
option handles by enabling `services.systembus-notify`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/smartd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/smartd.nix)

## `services.smartd.notifications.test` {#opt-services.smartd.notifications.test}

Whenever to send a test notification on startup.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/smartd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/smartd.nix)

## `services.smartd.notifications.wall.enable` {#opt-services.smartd.notifications.wall.enable}

Whenever to send wall notifications to all users.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/smartd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/smartd.nix)

## `services.smartd.notifications.x11.display` {#opt-services.smartd.notifications.x11.display}

DISPLAY to send X11 notifications to.

*Type:* string

*Default:* `":${toString config.services.xserver.display}"`

*Declared by:* [`nixos/modules/services/monitoring/smartd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/smartd.nix)

## `services.smartd.notifications.x11.enable` {#opt-services.smartd.notifications.x11.enable}

Whenever to send X11 xmessage notifications.

*Type:* boolean

*Default:* `config.services.xserver.enable`

*Declared by:* [`nixos/modules/services/monitoring/smartd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/smartd.nix)

## `services.smartdns.bindPort` {#opt-services.smartdns.bindPort}

DNS listening port number.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `53`

*Declared by:* [`nixos/modules/services/networking/smartdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smartdns.nix)

## `services.smartdns.enable` {#opt-services.smartdns.enable}

Whether to enable SmartDNS DNS server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/smartdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smartdns.nix)

## `services.smartdns.settings` {#opt-services.smartdns.settings}

A set that will be generated into configuration file, see the [SmartDNS README](https://github.com/pymumu/smartdns/blob/master/ReadMe_en.md#configuration-parameter) for details of configuration parameters.
You could override the options here like [`services.smartdns.bindPort`](#opt-services.smartdns.bindPort) by writing `settings.bind = ":5353 -no-rule -group example";`.

*Type:* attribute set of ((list of (string or signed integer or boolean)) or (string or signed integer or boolean) convertible to it)

*Default:* `{ }`

*Example:*

``` nix
{
  bind = ":5353 -no-rule -group example";
  cache-size = 4096;
  server-tls = [ "8.8.8.8:853" "1.1.1.1:853" ];
  server-https = "https://cloudflare-dns.com/dns-query -exclude-default-group";
  prefetch-domain = true;
  speed-check-mode = "ping,tcp:80";
};
```

*Declared by:* [`nixos/modules/services/networking/smartdns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smartdns.nix)

## `services.smokeping.alertConfig` {#opt-services.smokeping.alertConfig}

Configuration for alerts.

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  to = root@localhost
  from = smokeping@localhost
''
```

*Example:*

``` nix
''
  to = alertee@address.somewhere
  from = smokealert@company.xy
  
  +someloss
  type = loss
  # in percent
  pattern = >0%,*12*,>0%,*12*,>0%
  comment = loss 3 times  in a row;
''
```

*Declared by:* [`nixos/modules/services/networking/smokeping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smokeping.nix)

## `services.smokeping.cgiUrl` {#opt-services.smokeping.cgiUrl}

URL to the smokeping cgi.

*Type:* string

*Default:* `"http://${hostName}/smokeping.cgi"`

*Example:* `"https://somewhere.example.com/smokeping.cgi"`

*Declared by:* [`nixos/modules/services/networking/smokeping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smokeping.nix)

## `services.smokeping.config` {#opt-services.smokeping.config}

Full smokeping config supplied by the user. Overrides
and replaces any other configuration supplied.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/smokeping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smokeping.nix)

## `services.smokeping.databaseConfig` {#opt-services.smokeping.databaseConfig}

Configure the ping frequency and retention of the rrd files.
Once set, changing the interval will require deletion or migration of all
the collected data.

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  step     = 300
  pings    = 20
  # consfn mrhb steps total
  AVERAGE  0.5   1  1008
  AVERAGE  0.5  12  4320
      MIN  0.5  12  4320
      MAX  0.5  12  4320
  AVERAGE  0.5 144   720
      MAX  0.5 144   720
      MIN  0.5 144   720
  
''
```

*Example:*

``` nix
''
  # near constant pings.
  step     = 30
  pings    = 20
  # consfn mrhb steps total
  AVERAGE  0.5   1  10080
  AVERAGE  0.5  12  43200
      MIN  0.5  12  43200
      MAX  0.5  12  43200
  AVERAGE  0.5 144   7200
      MAX  0.5 144   7200
      MIN  0.5 144   7200
''
```

*Declared by:* [`nixos/modules/services/networking/smokeping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smokeping.nix)

## `services.smokeping.enable` {#opt-services.smokeping.enable}

Whether to enable smokeping service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/smokeping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smokeping.nix)

## `services.smokeping.extraConfig` {#opt-services.smokeping.extraConfig}

Any additional customization not already included.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/smokeping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smokeping.nix)

## `services.smokeping.host` {#opt-services.smokeping.host}

Host/IP to bind to for the web server.

Setting it to `null` skips passing the -h option to thttpd,
which makes it bind to all interfaces.

*Type:* null or string

*Default:* `"localhost"`

*Example:* `"192.0.2.1"`

*Declared by:* [`nixos/modules/services/networking/smokeping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smokeping.nix)

## `services.smokeping.hostName` {#opt-services.smokeping.hostName}

DNS name for the urls generated in the cgi.

*Type:* string

*Default:* `config.networking.fqdn`

*Example:* `"somewhere.example.com"`

*Declared by:* [`nixos/modules/services/networking/smokeping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smokeping.nix)

## `services.smokeping.imgUrl` {#opt-services.smokeping.imgUrl}

Base url for images generated in the cgi.

The default is a relative URL to ensure it works also when e.g. forwarding
the GUI port via SSH.

*Type:* string

*Default:* `"cache"`

*Example:* `"https://somewhere.example.com/cache"`

*Declared by:* [`nixos/modules/services/networking/smokeping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smokeping.nix)

## `services.smokeping.linkStyle` {#opt-services.smokeping.linkStyle}

DNS name for the urls generated in the cgi.

*Type:* one of "original", "absolute", "relative"

*Default:* `"relative"`

*Example:* `"absolute"`

*Declared by:* [`nixos/modules/services/networking/smokeping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smokeping.nix)

## `services.smokeping.mailHost` {#opt-services.smokeping.mailHost}

Use this SMTP server to send alerts

*Type:* string

*Default:* `""`

*Example:* `"localhost"`

*Declared by:* [`nixos/modules/services/networking/smokeping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smokeping.nix)

## `services.smokeping.owner` {#opt-services.smokeping.owner}

Real name of the owner of the instance

*Type:* string

*Default:* `"nobody"`

*Example:* `"Bob Foobawr"`

*Declared by:* [`nixos/modules/services/networking/smokeping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smokeping.nix)

## `services.smokeping.ownerEmail` {#opt-services.smokeping.ownerEmail}

Email contact for owner

*Type:* string

*Default:* `"no-reply@${hostName}"`

*Example:* `"no-reply@yourdomain.com"`

*Declared by:* [`nixos/modules/services/networking/smokeping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smokeping.nix)

## `services.smokeping.package` {#opt-services.smokeping.package}

The smokeping package to use.

*Type:* package

*Default:* `pkgs.smokeping`

*Declared by:* [`nixos/modules/services/networking/smokeping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smokeping.nix)

## `services.smokeping.presentationConfig` {#opt-services.smokeping.presentationConfig}

presentation graph style

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  + charts
  menu = Charts
  title = The most interesting destinations
  ++ stddev
  sorter = StdDev(entries=>4)
  title = Top Standard Deviation
  menu = Std Deviation
  format = Standard Deviation %f
  ++ max
  sorter = Max(entries=>5)
  title = Top Max Roundtrip Time
  menu = by Max
  format = Max Roundtrip Time %f seconds
  ++ loss
  sorter = Loss(entries=>5)
  title = Top Packet Loss
  menu = Loss
  format = Packets Lost %f
  ++ median
  sorter = Median(entries=>5)
  title = Top Median Roundtrip Time
  menu = by Median
  format = Median RTT %f seconds
  + overview
  width = 600
  height = 50
  range = 10h
  + detail
  width = 600
  height = 200
  unison_tolerance = 2
  "Last 3 Hours"    3h
  "Last 30 Hours"   30h
  "Last 10 Days"    10d
  "Last 360 Days"   360d
''
```

*Declared by:* [`nixos/modules/services/networking/smokeping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smokeping.nix)

## `services.smokeping.presentationTemplate` {#opt-services.smokeping.presentationTemplate}

Default page layout for the web UI.

*Type:* string

*Default:* `"${pkgs.smokeping}/etc/basepage.html.dist"`

*Declared by:* [`nixos/modules/services/networking/smokeping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smokeping.nix)

## `services.smokeping.probeConfig` {#opt-services.smokeping.probeConfig}

Probe configuration

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  + FPing
  binary = ${config.security.wrapperDir}/fping
''
```

*Declared by:* [`nixos/modules/services/networking/smokeping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smokeping.nix)

## `services.smokeping.sendmail` {#opt-services.smokeping.sendmail}

Use this sendmail compatible script to deliver alerts

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/wrappers/bin/sendmail"`

*Declared by:* [`nixos/modules/services/networking/smokeping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smokeping.nix)

## `services.smokeping.smokeMailTemplate` {#opt-services.smokeping.smokeMailTemplate}

Specify the smokemail template for alerts.

*Type:* string

*Default:* `"${package}/etc/smokemail.dist"`

*Declared by:* [`nixos/modules/services/networking/smokeping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smokeping.nix)

## `services.smokeping.targetConfig` {#opt-services.smokeping.targetConfig}

Target configuration

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  probe = FPing
  menu = Top
  title = Network Latency Grapher
  remark = Welcome to the SmokePing website of xxx Company. \
           Here you will learn all about the latency of our network.
  + Local
  menu = Local
  title = Local Network
  ++ LocalMachine
  menu = Local Machine
  title = This host
  host = localhost
''
```

*Declared by:* [`nixos/modules/services/networking/smokeping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smokeping.nix)

## `services.smokeping.user` {#opt-services.smokeping.user}

User that runs smokeping and (optionally) thttpd. A group of the same name will be created as well.

*Type:* string

*Default:* `"smokeping"`

*Declared by:* [`nixos/modules/services/networking/smokeping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smokeping.nix)

## `services.smokeping.webService` {#opt-services.smokeping.webService}

Enable a smokeping web interface

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/smokeping.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/smokeping.nix)

## `services.snapper.cleanupInterval` {#opt-services.snapper.cleanupInterval}

Cleanup interval.

The format is described in
`systemd.time(7)`.

*Type:* string

*Default:* `"1d"`

*Declared by:* [`nixos/modules/services/misc/snapper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/snapper.nix)

## `services.snapper.configs` {#opt-services.snapper.configs}

Subvolume configuration. Any option mentioned in man:snapper-configs(5)
is valid here, even if NixOS doesn't document it.

*Type:* attribute set of (open submodule of attribute set of ((list of (string without line breaks or quotes)) or boolean or string without line breaks or quotes or signed integer or floating point number))

*Default:* `{ }`

*Example:*

``` nix
{
  home = {
    SUBVOLUME = "/home";
    ALLOW_USERS = [ "alice" ];
    TIMELINE_CREATE = true;
    TIMELINE_CLEANUP = true;
  };
}
```

*Declared by:* [`nixos/modules/services/misc/snapper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/snapper.nix)

## `services.snapper.configs.<name>.ALLOW_GROUPS` {#opt-services.snapper.configs._name_.ALLOW_GROUPS}

List of groups allowed to operate with the config.

Also see the PERMISSIONS section in man:snapper(8).

*Type:* list of (string without line breaks or quotes)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/snapper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/snapper.nix)

## `services.snapper.configs.<name>.ALLOW_USERS` {#opt-services.snapper.configs._name_.ALLOW_USERS}

List of users allowed to operate with the config. "root" is always
implicitly included.

Also see the PERMISSIONS section in man:snapper(8).

*Type:* list of (string without line breaks or quotes)

*Default:* `[ ]`

*Example:*

``` nix
[
  "alice"
]
```

*Declared by:* [`nixos/modules/services/misc/snapper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/snapper.nix)

## `services.snapper.configs.<name>.FSTYPE` {#opt-services.snapper.configs._name_.FSTYPE}

Filesystem type. Only btrfs is stable and tested.

bcachefs support is experimental.

*Type:* one of "btrfs", "bcachefs"

*Default:* `"btrfs"`

*Declared by:* [`nixos/modules/services/misc/snapper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/snapper.nix)

## `services.snapper.configs.<name>.SUBVOLUME` {#opt-services.snapper.configs._name_.SUBVOLUME}

Path of the subvolume or mount point.
This path is a subvolume and has to contain a subvolume named
.snapshots.
See also man:snapper(8) section PERMISSIONS.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/misc/snapper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/snapper.nix)

## `services.snapper.configs.<name>.TIMELINE_CLEANUP` {#opt-services.snapper.configs._name_.TIMELINE_CLEANUP}

Defines whether the timeline cleanup algorithm should be run for the config.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/snapper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/snapper.nix)

## `services.snapper.configs.<name>.TIMELINE_CREATE` {#opt-services.snapper.configs._name_.TIMELINE_CREATE}

Defines whether hourly snapshots should be created.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/snapper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/snapper.nix)

## `services.snapper.configs.<name>.TIMELINE_LIMIT_DAILY` {#opt-services.snapper.configs._name_.TIMELINE_LIMIT_DAILY}

Limits for timeline cleanup.

*Type:* unsigned integer, meaning \>=0, or string containing either a number or a range

*Default:* `10`

*Declared by:* [`nixos/modules/services/misc/snapper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/snapper.nix)

## `services.snapper.configs.<name>.TIMELINE_LIMIT_HOURLY` {#opt-services.snapper.configs._name_.TIMELINE_LIMIT_HOURLY}

Limits for timeline cleanup.

*Type:* unsigned integer, meaning \>=0, or string containing either a number or a range

*Default:* `10`

*Declared by:* [`nixos/modules/services/misc/snapper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/snapper.nix)

## `services.snapper.configs.<name>.TIMELINE_LIMIT_MONTHLY` {#opt-services.snapper.configs._name_.TIMELINE_LIMIT_MONTHLY}

Limits for timeline cleanup.

*Type:* unsigned integer, meaning \>=0, or string containing either a number or a range

*Default:* `10`

*Declared by:* [`nixos/modules/services/misc/snapper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/snapper.nix)

## `services.snapper.configs.<name>.TIMELINE_LIMIT_QUARTERLY` {#opt-services.snapper.configs._name_.TIMELINE_LIMIT_QUARTERLY}

Limits for timeline cleanup.

*Type:* unsigned integer, meaning \>=0, or string containing either a number or a range

*Default:* `0`

*Declared by:* [`nixos/modules/services/misc/snapper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/snapper.nix)

## `services.snapper.configs.<name>.TIMELINE_LIMIT_WEEKLY` {#opt-services.snapper.configs._name_.TIMELINE_LIMIT_WEEKLY}

Limits for timeline cleanup.

*Type:* unsigned integer, meaning \>=0, or string containing either a number or a range

*Default:* `0`

*Declared by:* [`nixos/modules/services/misc/snapper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/snapper.nix)

## `services.snapper.configs.<name>.TIMELINE_LIMIT_YEARLY` {#opt-services.snapper.configs._name_.TIMELINE_LIMIT_YEARLY}

Limits for timeline cleanup.

*Type:* unsigned integer, meaning \>=0, or string containing either a number or a range

*Default:* `10`

*Declared by:* [`nixos/modules/services/misc/snapper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/snapper.nix)

## `services.snapper.filters` {#opt-services.snapper.filters}

Global display difference filter. See man:snapper(8) for more details.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/snapper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/snapper.nix)

## `services.snapper.persistentTimer` {#opt-services.snapper.persistentTimer}

Set the `Persistent` option for the
`systemd.timer(5)`
which triggers the snapshot immediately if the last trigger
was missed (e.g. if the system was powered down).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/snapper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/snapper.nix)

## `services.snapper.snapshotInterval` {#opt-services.snapper.snapshotInterval}

Snapshot interval.

The format is described in
`systemd.time(7)`.

*Type:* string

*Default:* `"hourly"`

*Declared by:* [`nixos/modules/services/misc/snapper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/snapper.nix)

## `services.snapper.snapshotRootOnBoot` {#opt-services.snapper.snapshotRootOnBoot}

Whether to snapshot root on boot

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/snapper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/snapper.nix)

## `services.snapraid.contentFiles` {#opt-services.snapraid.contentFiles}

SnapRAID content list files.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/var/snapraid.content"
  "/mnt/disk1/snapraid.content"
  "/mnt/disk2/snapraid.content"
]
```

*Declared by:* [`nixos/modules/services/backup/snapraid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/snapraid.nix)

## `services.snapraid.dataDisks` {#opt-services.snapraid.dataDisks}

SnapRAID data disks.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  d1 = "/mnt/disk1/";
  d2 = "/mnt/disk2/";
  d3 = "/mnt/disk3/";
}
```

*Declared by:* [`nixos/modules/services/backup/snapraid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/snapraid.nix)

## `services.snapraid.enable` {#opt-services.snapraid.enable}

Whether to enable SnapRAID.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/snapraid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/snapraid.nix)

## `services.snapraid.exclude` {#opt-services.snapraid.exclude}

SnapRAID exclude directives.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "*.unrecoverable"
  "/tmp/"
  "/lost+found/"
]
```

*Declared by:* [`nixos/modules/services/backup/snapraid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/snapraid.nix)

## `services.snapraid.extraConfig` {#opt-services.snapraid.extraConfig}

Extra config options for SnapRAID.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  nohidden
  blocksize 256
  hashsize 16
  autosave 500
  pool /pool
''
```

*Declared by:* [`nixos/modules/services/backup/snapraid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/snapraid.nix)

## `services.snapraid.parityFiles` {#opt-services.snapraid.parityFiles}

SnapRAID parity files.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/mnt/diskp/snapraid.parity"
  "/mnt/diskq/snapraid.2-parity"
  "/mnt/diskr/snapraid.3-parity"
  "/mnt/disks/snapraid.4-parity"
  "/mnt/diskt/snapraid.5-parity"
  "/mnt/disku/snapraid.6-parity"
]
```

*Declared by:* [`nixos/modules/services/backup/snapraid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/snapraid.nix)

## `services.snapraid.scrub.interval` {#opt-services.snapraid.scrub.interval}

How often to run `snapraid scrub`.

*Type:* string

*Default:* `"Mon *-*-* 02:00:00"`

*Example:* `"weekly"`

*Declared by:* [`nixos/modules/services/backup/snapraid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/snapraid.nix)

## `services.snapraid.scrub.olderThan` {#opt-services.snapraid.scrub.olderThan}

Number of days since data was last scrubbed before it can be scrubbed again.

*Type:* signed integer

*Default:* `10`

*Example:* `20`

*Declared by:* [`nixos/modules/services/backup/snapraid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/snapraid.nix)

## `services.snapraid.scrub.plan` {#opt-services.snapraid.scrub.plan}

Percent of the array that should be checked by `snapraid scrub`.

*Type:* signed integer

*Default:* `8`

*Example:* `5`

*Declared by:* [`nixos/modules/services/backup/snapraid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/snapraid.nix)

## `services.snapraid.sync.interval` {#opt-services.snapraid.sync.interval}

How often to run `snapraid sync`.

*Type:* string

*Default:* `"01:00"`

*Example:* `"daily"`

*Declared by:* [`nixos/modules/services/backup/snapraid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/snapraid.nix)

## `services.snapraid.touchBeforeSync` {#opt-services.snapraid.touchBeforeSync}

Whether `snapraid touch` should be run before `snapraid sync`.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/backup/snapraid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/snapraid.nix)

## `services.snapserver.enable` {#opt-services.snapserver.enable}

Whether to enable snapserver.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/snapserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/snapserver.nix)

## `services.snapserver.openFirewall` {#opt-services.snapserver.openFirewall}

Whether to automatically open the specified ports in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/audio/snapserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/snapserver.nix)

## `services.snapserver.package` {#opt-services.snapserver.package}

The snapcast package to use.

*Type:* package

*Default:* `pkgs.snapcast`

*Declared by:* [`nixos/modules/services/audio/snapserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/snapserver.nix)

## `services.snapserver.settings` {#opt-services.snapserver.settings}

Snapserver configuration.

Refer to the [example configuration](https://github.com/badaix/snapcast/blob/develop/server/etc/snapserver.conf) for possible options.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string) or a list of them for duplicate keys)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/audio/snapserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/snapserver.nix)

## `services.snapserver.settings.http.bind_to_address` {#opt-services.snapserver.settings.http.bind_to_address}

Address to listen on for snapclient connections.

*Type:* unspecified value

*Default:* `"::"`

*Declared by:* [`nixos/modules/services/audio/snapserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/snapserver.nix)

## `services.snapserver.settings.http.doc_root` {#opt-services.snapserver.settings.http.doc_root}

Path to serve from the HTTP servers root.

*Type:* null or absolute path

*Default:* `pkgs.snapweb`

*Declared by:* [`nixos/modules/services/audio/snapserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/snapserver.nix)

## `services.snapserver.settings.http.enabled` {#opt-services.snapserver.settings.http.enabled}

Whether to enable the HTTP JSON-RPC.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/snapserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/snapserver.nix)

## `services.snapserver.settings.http.port` {#opt-services.snapserver.settings.http.port}

Port to listen on for snapclient connections.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1780`

*Declared by:* [`nixos/modules/services/audio/snapserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/snapserver.nix)

## `services.snapserver.settings.stream.source` {#opt-services.snapserver.settings.stream.source}

One or multiple URIs to PCM input streams.

*Type:* string or list of string

*Example:* `"pipe:///tmp/snapfifo?name=default"`

*Declared by:* [`nixos/modules/services/audio/snapserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/snapserver.nix)

## `services.snapserver.settings.tcp-control.bind_to_address` {#opt-services.snapserver.settings.tcp-control.bind_to_address}

Address to listen on for snapclient connections.

*Type:* unspecified value

*Default:* `"::"`

*Declared by:* [`nixos/modules/services/audio/snapserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/snapserver.nix)

## `services.snapserver.settings.tcp-control.enabled` {#opt-services.snapserver.settings.tcp-control.enabled}

Whether to enable the TCP JSON-RPC.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/snapserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/snapserver.nix)

## `services.snapserver.settings.tcp-control.port` {#opt-services.snapserver.settings.tcp-control.port}

Port to listen on for snapclient connections.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1705`

*Declared by:* [`nixos/modules/services/audio/snapserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/snapserver.nix)

## `services.snapserver.settings.tcp-streaming.bind_to_address` {#opt-services.snapserver.settings.tcp-streaming.bind_to_address}

Address to listen on for snapclient connections.

*Type:* unspecified value

*Default:* `"::"`

*Declared by:* [`nixos/modules/services/audio/snapserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/snapserver.nix)

## `services.snapserver.settings.tcp-streaming.enabled` {#opt-services.snapserver.settings.tcp-streaming.enabled}

Whether to enable streaming via TCP.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/snapserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/snapserver.nix)

## `services.snapserver.settings.tcp-streaming.port` {#opt-services.snapserver.settings.tcp-streaming.port}

Port to listen on for snapclient connections.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1704`

*Declared by:* [`nixos/modules/services/audio/snapserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/snapserver.nix)

## `services.snipe-it.appKeyFile` {#opt-services.snipe-it.appKeyFile}

A file containing the Laravel APP\_KEY - a 32 character long,
base64 encoded key used for encryption where needed. Can be
generated with `head -c 32 /dev/urandom | base64`.

*Type:* absolute path

*Example:* `"/run/keys/snipe-it/appkey"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.appURL` {#opt-services.snipe-it.appURL}

The root URL that you want to host Snipe-IT on. All URLs in Snipe-IT will be generated using this value.
If you change this in the future you may need to run a command to update stored URLs in the database.
Command example: `snipe-it snipe-it:update-url https://old.example.com https://new.example.com`

*Type:* string

*Default:*

``` nix
''
  http''${lib.optionalString tlsEnabled "s"}://''${cfg.hostName}
''
```

*Example:* `"https://example.com"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.config` {#opt-services.snipe-it.config}

Snipe-IT configuration options to set in the
`.env` file.
Refer to [https://snipe-it.readme.io/docs/configuration](https://snipe-it.readme.io/docs/configuration)
for details on supported values.

Settings containing secret data should be set to an attribute
set containing the attribute `_secret` - a
string pointing to a file containing the value the option
should be set to. See the example to get a better picture of
this: in the resulting `.env` file, the
`OIDC_CLIENT_SECRET` key will be set to the
contents of the `/run/keys/oidc_secret`
file.

*Type:* attribute set of (null or boolean or signed integer or 16 bit unsigned integer; between 0 and 65535 (both inclusive) or absolute path or string or (submodule))

*Default:* `{ }`

*Example:*

``` nix
{
  ALLOWED_IFRAME_HOSTS = "https://example.com";
  WKHTMLTOPDF = "${pkgs.wkhtmltopdf}/bin/wkhtmltopdf";
  AUTH_METHOD = "oidc";
  OIDC_NAME = "MyLogin";
  OIDC_DISPLAY_NAME_CLAIMS = "name";
  OIDC_CLIENT_ID = "snipe-it";
  OIDC_CLIENT_SECRET = {_secret = "/run/keys/oidc_secret"};
  OIDC_ISSUER = "https://keycloak.example.com/auth/realms/My%20Realm";
  OIDC_ISSUER_DISCOVER = true;
}
```

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.dataDir` {#opt-services.snipe-it.dataDir}

snipe-it data directory

*Type:* absolute path

*Default:* `"/var/lib/snipe-it"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.database.createLocally` {#opt-services.snipe-it.database.createLocally}

Create the database and database user locally.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.database.host` {#opt-services.snipe-it.database.host}

Database host address.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.database.name` {#opt-services.snipe-it.database.name}

Database name.

*Type:* string

*Default:* `"snipeit"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.database.passwordFile` {#opt-services.snipe-it.database.passwordFile}

A file containing the password corresponding to
`database.user`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/snipe-it/dbpassword"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.database.port` {#opt-services.snipe-it.database.port}

Database host port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3306`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.database.user` {#opt-services.snipe-it.database.user}

Database username.

*Type:* string

*Default:* `user`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.enable` {#opt-services.snipe-it.enable}

Whether to enable snipe-it, a free open source IT asset/license management system.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.group` {#opt-services.snipe-it.group}

Group snipe-it runs as.

*Type:* string

*Default:* `"snipeit"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.hostName` {#opt-services.snipe-it.hostName}

The hostname to serve Snipe-IT on.

*Type:* string

*Default:* `config.networking.fqdnOrHostName`

*Example:* `"snipe-it.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.mail.backupNotificationAddress` {#opt-services.snipe-it.mail.backupNotificationAddress}

Email Address to send Backup Notifications to.

*Type:* string

*Default:* `"backup@example.com"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.mail.driver` {#opt-services.snipe-it.mail.driver}

Mail driver to use.

*Type:* one of "smtp", "sendmail"

*Default:* `"smtp"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.mail.encryption` {#opt-services.snipe-it.mail.encryption}

SMTP encryption mechanism to use.

*Type:* null or one of "tls", "ssl"

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.mail.from.address` {#opt-services.snipe-it.mail.from.address}

Mail "from" address.

*Type:* string

*Default:* `"mail@example.com"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.mail.from.name` {#opt-services.snipe-it.mail.from.name}

Mail "from" name.

*Type:* string

*Default:* `"Snipe-IT Asset Management"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.mail.host` {#opt-services.snipe-it.mail.host}

Mail host address.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.mail.passwordFile` {#opt-services.snipe-it.mail.passwordFile}

A file containing the password corresponding to
`mail.user`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/snipe-it/mailpassword"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.mail.port` {#opt-services.snipe-it.mail.port}

Mail host port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1025`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.mail.replyTo.address` {#opt-services.snipe-it.mail.replyTo.address}

Mail "reply-to" address.

*Type:* string

*Default:* `"mail@example.com"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.mail.replyTo.name` {#opt-services.snipe-it.mail.replyTo.name}

Mail "reply-to" name.

*Type:* string

*Default:* `"Snipe-IT Asset Management"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.mail.user` {#opt-services.snipe-it.mail.user}

Mail username.

*Type:* null or string

*Default:* `null`

*Example:* `"snipeit"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.maxUploadSize` {#opt-services.snipe-it.maxUploadSize}

The maximum size for uploads (e.g. images).

*Type:* string

*Default:* `"18M"`

*Example:* `"1G"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx` {#opt-services.snipe-it.nginx}

With this option, you can customize the nginx virtualHost settings.

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
{
  serverAliases = [
    "snipe-it.${config.networking.domain}"
  ];
  # To enable encryption and let let's encrypt take care of certificate
  forceSSL = true;
  enableACME = true;
}
```

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.acmeFallbackHost` {#opt-services.snipe-it.nginx.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.acmeRoot` {#opt-services.snipe-it.nginx.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.addSSL` {#opt-services.snipe-it.nginx.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.basicAuth` {#opt-services.snipe-it.nginx.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.basicAuthFile` {#opt-services.snipe-it.nginx.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.default` {#opt-services.snipe-it.nginx.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.enableACME` {#opt-services.snipe-it.nginx.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.extraConfig` {#opt-services.snipe-it.nginx.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.forceSSL` {#opt-services.snipe-it.nginx.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.globalRedirect` {#opt-services.snipe-it.nginx.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.http2` {#opt-services.snipe-it.nginx.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.http3` {#opt-services.snipe-it.nginx.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.http3_hq` {#opt-services.snipe-it.nginx.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.kTLS` {#opt-services.snipe-it.nginx.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.listen` {#opt-services.snipe-it.nginx.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.listen.*.addr` {#opt-services.snipe-it.nginx.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.listen.*.extraParameters` {#opt-services.snipe-it.nginx.listen._.extraParameters}

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

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.listen.*.port` {#opt-services.snipe-it.nginx.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.listen.*.proxyProtocol` {#opt-services.snipe-it.nginx.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.listen.*.ssl` {#opt-services.snipe-it.nginx.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.listenAddresses` {#opt-services.snipe-it.nginx.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.locations` {#opt-services.snipe-it.nginx.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.locations.<name>.alias` {#opt-services.snipe-it.nginx.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.locations.<name>.basicAuth` {#opt-services.snipe-it.nginx.locations._name_.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.locations.<name>.basicAuthFile` {#opt-services.snipe-it.nginx.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.locations.<name>.extraConfig` {#opt-services.snipe-it.nginx.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.locations.<name>.fastcgiParams` {#opt-services.snipe-it.nginx.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.locations.<name>.index` {#opt-services.snipe-it.nginx.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.locations.<name>.priority` {#opt-services.snipe-it.nginx.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.locations.<name>.proxyPass` {#opt-services.snipe-it.nginx.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.locations.<name>.proxyWebsockets` {#opt-services.snipe-it.nginx.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.locations.<name>.recommendedProxySettings` {#opt-services.snipe-it.nginx.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.locations.<name>.recommendedUwsgiSettings` {#opt-services.snipe-it.nginx.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.locations.<name>.return` {#opt-services.snipe-it.nginx.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.locations.<name>.root` {#opt-services.snipe-it.nginx.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.locations.<name>.tryFiles` {#opt-services.snipe-it.nginx.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.locations.<name>.useGrpcErrorPages` {#opt-services.snipe-it.nginx.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.locations.<name>.uwsgiPass` {#opt-services.snipe-it.nginx.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.onlySSL` {#opt-services.snipe-it.nginx.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.quic` {#opt-services.snipe-it.nginx.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.redirectCode` {#opt-services.snipe-it.nginx.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.rejectSSL` {#opt-services.snipe-it.nginx.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.reuseport` {#opt-services.snipe-it.nginx.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.root` {#opt-services.snipe-it.nginx.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.serverAliases` {#opt-services.snipe-it.nginx.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.serverName` {#opt-services.snipe-it.nginx.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.sslCertificate` {#opt-services.snipe-it.nginx.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.sslCertificateKey` {#opt-services.snipe-it.nginx.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.sslTrustedCertificate` {#opt-services.snipe-it.nginx.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.nginx.useACMEHost` {#opt-services.snipe-it.nginx.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.poolConfig` {#opt-services.snipe-it.poolConfig}

Options for the snipe-it PHP pool. See the documentation on `php-fpm.conf`
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

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.snipe-it.user` {#opt-services.snipe-it.user}

User snipe-it runs as.

*Type:* string

*Default:* `"snipeit"`

*Declared by:* [`nixos/modules/services/web-apps/snipe-it.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snipe-it.nix)

## `services.sniproxy.config` {#opt-services.sniproxy.config}

sniproxy.conf configuration excluding the daemon username and pid file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  error_log {
    filename /var/log/sniproxy/error.log
  }
  access_log {
    filename /var/log/sniproxy/access.log
  }
  listen 443 {
    proto tls
  }
  table {
    example.com 192.0.2.10
    example.net 192.0.2.20
  }
''
```

*Declared by:* [`nixos/modules/services/networking/sniproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sniproxy.nix)

## `services.sniproxy.enable` {#opt-services.sniproxy.enable}

Whether to enable sniproxy server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/sniproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sniproxy.nix)

## `services.sniproxy.group` {#opt-services.sniproxy.group}

Group under which sniproxy runs.

*Type:* string

*Default:* `"sniproxy"`

*Declared by:* [`nixos/modules/services/networking/sniproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sniproxy.nix)

## `services.sniproxy.user` {#opt-services.sniproxy.user}

User account under which sniproxy runs.

*Type:* string

*Default:* `"sniproxy"`

*Declared by:* [`nixos/modules/services/networking/sniproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sniproxy.nix)

## `services.snips-sh.enable` {#opt-services.snips-sh.enable}

Whether to enable snips.sh.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/snips-sh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snips-sh.nix)

## `services.snips-sh.environmentFile` {#opt-services.snips-sh.environmentFile}

Additional environment file as defined in `systemd.exec(5)`.

Sensitive secrets such as `SNIPS_SSH_HOSTKEYPATH` and `SNIPS_METRICS_STATSD`
may be passed to the service while avoiding potentially making them world-readable in the nix store or
to convert an existing non-nix installation with minimum hassle.

Note that this file needs to be available on the host on which
`snips-sh` is running.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/etc/snips-sh.env"`

*Declared by:* [`nixos/modules/services/web-apps/snips-sh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snips-sh.nix)

## `services.snips-sh.package` {#opt-services.snips-sh.package}

The snips-sh package to use.

*Type:* package

*Default:* `pkgs.snips-sh`

*Declared by:* [`nixos/modules/services/web-apps/snips-sh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snips-sh.nix)

## `services.snips-sh.settings` {#opt-services.snips-sh.settings}

The configuration of snips-sh is done through environment variables,
therefore you must use upper snake case (e.g. `SNIPS_HTTP_INTERNAL`).

Based on the attributes passed to this config option an environment file will be generated
that is passed to snips-sh's systemd service.

The available configuration options can be found in
[self-hosting guide](https://github.com/robherley/snips.sh/blob/main/docs/self-hosting.md#configuration) to
find about the environment variables you can use.

*Type:* open submodule of attribute set of (null or string or signed integer or boolean)

*Default:* `{ }`

*Example:*

``` nix
{
  SNIPS_HTTP_INTERNAL = "http://0.0.0.0:8080";
  SNIPS_SSH_INTERNAL = "ssh://0.0.0.0:2222";
}
```

*Declared by:* [`nixos/modules/services/web-apps/snips-sh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snips-sh.nix)

## `services.snips-sh.settings.SNIPS_HTTP_INTERNAL` {#opt-services.snips-sh.settings.SNIPS_HTTP_INTERNAL}

The internal HTTP address of the service

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/snips-sh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snips-sh.nix)

## `services.snips-sh.settings.SNIPS_SSH_INTERNAL` {#opt-services.snips-sh.settings.SNIPS_SSH_INTERNAL}

The internal SSH address of the service

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/snips-sh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snips-sh.nix)

## `services.snips-sh.stateDir` {#opt-services.snips-sh.stateDir}

The state directory of the service.

*Type:* absolute path

*Default:* `"/var/lib/snips-sh"`

*Declared by:* [`nixos/modules/services/web-apps/snips-sh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/snips-sh.nix)

## `services.snmpd.configFile` {#opt-services.snmpd.configFile}

Path to the snmpd.conf file. By default, if `configText` is set,
a config file will be automatically generated.

*Type:* absolute path

*Default:* The value of `configText`.

*Declared by:* [`nixos/modules/services/monitoring/snmpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/snmpd.nix)

## `services.snmpd.configText` {#opt-services.snmpd.configText}

The contents of the snmpd.conf. If the `configFile` option
is set, this value will be ignored.

Note that the contents of this option will be added to the Nix
store as world-readable plain text, `configFile` can be used in
addition to a secret management tool to protect sensitive data.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/snmpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/snmpd.nix)

## `services.snmpd.enable` {#opt-services.snmpd.enable}

Whether to enable snmpd.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/snmpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/snmpd.nix)

## `services.snmpd.listenAddress` {#opt-services.snmpd.listenAddress}

The address to listen on for SNMP and AgentX messages.

*Type:* string

*Default:* `"0.0.0.0"`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/monitoring/snmpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/snmpd.nix)

## `services.snmpd.openFirewall` {#opt-services.snmpd.openFirewall}

Open port in firewall for snmpd.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/snmpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/snmpd.nix)

## `services.snmpd.package` {#opt-services.snmpd.package}

The net-snmp package to use.

*Type:* package

*Default:* `pkgs.net-snmp`

*Declared by:* [`nixos/modules/services/monitoring/snmpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/snmpd.nix)

## `services.snmpd.port` {#opt-services.snmpd.port}

The port to listen on for SNMP and AgentX messages.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `161`

*Declared by:* [`nixos/modules/services/monitoring/snmpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/snmpd.nix)

## `services.snowflake-proxy.broker` {#opt-services.snowflake-proxy.broker}

Broker URL (default "https://snowflake-broker.torproject.net/")

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/snowflake-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/snowflake-proxy.nix)

## `services.snowflake-proxy.capacity` {#opt-services.snowflake-proxy.capacity}

Limits the amount of maximum concurrent clients allowed.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/snowflake-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/snowflake-proxy.nix)

## `services.snowflake-proxy.enable` {#opt-services.snowflake-proxy.enable}

Whether to enable snowflake-proxy, a system to defeat internet censorship.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/snowflake-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/snowflake-proxy.nix)

## `services.snowflake-proxy.extraFlags` {#opt-services.snowflake-proxy.extraFlags}

Extra flags to pass to snowflake-proxy

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-metrics"
]
```

*Declared by:* [`nixos/modules/services/networking/snowflake-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/snowflake-proxy.nix)

## `services.snowflake-proxy.relay` {#opt-services.snowflake-proxy.relay}

websocket relay URL (default "wss://snowflake.bamsoftware.com/")

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/snowflake-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/snowflake-proxy.nix)

## `services.snowflake-proxy.stun` {#opt-services.snowflake-proxy.stun}

STUN broker URL (default "stun:stun.stunprotocol.org:3478")

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/snowflake-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/snowflake-proxy.nix)

## `services.soft-serve.enable` {#opt-services.soft-serve.enable}

Whether to enable soft-serve.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/soft-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/soft-serve.nix)

## `services.soft-serve.package` {#opt-services.soft-serve.package}

The soft-serve package to use.

*Type:* package

*Default:* `pkgs.soft-serve`

*Declared by:* [`nixos/modules/services/misc/soft-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/soft-serve.nix)

## `services.soft-serve.settings` {#opt-services.soft-serve.settings}

The contents of the configuration file for soft-serve.

See [https://charm.sh/blog/self-hosted-soft-serve/](https://charm.sh/blog/self-hosted-soft-serve/).

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  name = "user's repos";
  log_format = "text";
  ssh = {
    listen_addr = ":23231";
    public_url = "ssh://localhost:23231";
    max_timeout = 30;
    idle_timeout = 120;
  };
  stats.listen_addr = ":23233";
}
```

*Declared by:* [`nixos/modules/services/misc/soft-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/soft-serve.nix)

## `services.softether.dataDir` {#opt-services.softether.dataDir}

Data directory for SoftEther VPN.

*Type:* absolute path

*Default:* `"/var/lib/softether"`

*Declared by:* [`nixos/modules/services/networking/softether.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/softether.nix)

## `services.softether.enable` {#opt-services.softether.enable}

Whether to enable SoftEther VPN services.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/softether.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/softether.nix)

## `services.softether.package` {#opt-services.softether.package}

The softether package to use.

*Type:* package

*Default:* `pkgs.softether`

*Declared by:* [`nixos/modules/services/networking/softether.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/softether.nix)

## `services.softether.vpnbridge.enable` {#opt-services.softether.vpnbridge.enable}

Whether to enable SoftEther VPN Bridge.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/softether.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/softether.nix)

## `services.softether.vpnclient.down` {#opt-services.softether.vpnclient.down}

Shell commands executed when the Virtual Network Adapter(s) is/are shutting down.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/softether.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/softether.nix)

## `services.softether.vpnclient.enable` {#opt-services.softether.vpnclient.enable}

Whether to enable SoftEther VPN Client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/softether.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/softether.nix)

## `services.softether.vpnclient.up` {#opt-services.softether.vpnclient.up}

Shell commands executed when the Virtual Network Adapter(s) is/are starting.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/softether.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/softether.nix)

## `services.softether.vpnserver.enable` {#opt-services.softether.vpnserver.enable}

Whether to enable SoftEther VPN Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/softether.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/softether.nix)

## `services.sogo.configReplaces` {#opt-services.sogo.configReplaces}

Replacement-filepath mapping for sogo.conf.
Every key is replaced with the contents of the file specified as value.

In the example, every occurrence of LDAP\_BINDPW will be replaced with the text of the
specified file.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  LDAP_BINDPW = "/var/lib/secrets/sogo/ldappw";
}
```

*Declared by:* [`nixos/modules/services/web-apps/sogo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sogo.nix)

## `services.sogo.ealarmsCredFile` {#opt-services.sogo.ealarmsCredFile}

Optional path to a credentials file for email alarms

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/sogo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sogo.nix)

## `services.sogo.enable` {#opt-services.sogo.enable}

Whether to enable SOGo groupware.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/sogo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sogo.nix)

## `services.sogo.extraConfig` {#opt-services.sogo.extraConfig}

Extra sogo.conf configuration lines

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/sogo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sogo.nix)

## `services.sogo.language` {#opt-services.sogo.language}

Language of SOGo

*Type:* string

*Default:* `"English"`

*Declared by:* [`nixos/modules/services/web-apps/sogo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sogo.nix)

## `services.sogo.timezone` {#opt-services.sogo.timezone}

Timezone of your SOGo instance

*Type:* string

*Example:* `"America/Montreal"`

*Declared by:* [`nixos/modules/services/web-apps/sogo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sogo.nix)

## `services.sogo.vhostName` {#opt-services.sogo.vhostName}

Name of the nginx vhost

*Type:* string

*Default:* `"sogo"`

*Declared by:* [`nixos/modules/services/web-apps/sogo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sogo.nix)

## `services.soju.acceptProxyIP` {#opt-services.soju.acceptProxyIP}

Allow the specified IPs to act as a proxy. Proxys have the ability to
overwrite the remote and local connection addresses (via the X-Forwarded-\*
HTTP header fields). The special name "localhost" accepts the loopback
addresses 127.0.0.0/8 and ::1/128. By default, all IPs are rejected.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/soju.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/soju.nix)

## `services.soju.adminSocket.enable` {#opt-services.soju.adminSocket.enable}

Listen for admin connections from sojuctl at /run/soju/admin.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/soju.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/soju.nix)

## `services.soju.configFile` {#opt-services.soju.configFile}

Path to config file. If this option is set, it will override any
configuration done using other options, including `extraConfig`.

*Type:* absolute path

*Default:* `"Config file generated from other options."`

*Example:* `./soju.conf`

*Declared by:* [`nixos/modules/services/networking/soju.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/soju.nix)

## `services.soju.enable` {#opt-services.soju.enable}

Whether to enable soju.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/soju.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/soju.nix)

## `services.soju.extraConfig` {#opt-services.soju.extraConfig}

Lines added verbatim to the generated configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/soju.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/soju.nix)

## `services.soju.hostName` {#opt-services.soju.hostName}

Server hostname.

*Type:* string

*Default:* `config.networking.hostName`

*Declared by:* [`nixos/modules/services/networking/soju.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/soju.nix)

## `services.soju.httpOrigins` {#opt-services.soju.httpOrigins}

List of allowed HTTP origins for WebSocket listeners. The parameters are
interpreted as shell patterns, see
`glob(7)`.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/soju.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/soju.nix)

## `services.soju.listen` {#opt-services.soju.listen}

Where soju should listen for incoming connections. See the
`listen` directive in
`soju(1)`.

*Type:* list of string

*Default:*

``` nix
[
  ":6697"
]
```

*Declared by:* [`nixos/modules/services/networking/soju.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/soju.nix)

## `services.soju.messageStoreDriver` {#opt-services.soju.messageStoreDriver}

Set the storage backend for IRC messages.

*Type:* one of "db", "fs", "memory"

*Default:* `"fs"`

*Declared by:* [`nixos/modules/services/networking/soju.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/soju.nix)

## `services.soju.package` {#opt-services.soju.package}

The soju package to use.

*Type:* package

*Default:* `pkgs.soju`

*Declared by:* [`nixos/modules/services/networking/soju.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/soju.nix)

## `services.soju.tlsCertificate` {#opt-services.soju.tlsCertificate}

Path to server TLS certificate.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/networking/soju.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/soju.nix)

## `services.soju.tlsCertificateKey` {#opt-services.soju.tlsCertificateKey}

Path to server TLS certificate key.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/networking/soju.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/soju.nix)

## `services.solanum.config` {#opt-services.solanum.config}

Solanum IRC daemon configuration file.
check [https://github.com/solanum-ircd/solanum/blob/main/doc/reference.conf](https://github.com/solanum-ircd/solanum/blob/main/doc/reference.conf) for all options.

*Type:* string

*Default:*

``` nix
''
  serverinfo {
    name = "irc.example.com";
    sid = "1ix";
    description = "irc!";
  
    vhost = "0.0.0.0";
    vhost6 = "::";
  };
  
  listen {
    host = "0.0.0.0";
    port = 6667;
  };
  
  class "users" {
    number_per_ip = 3;
  };
  
  auth {
    user = "*@*";
    class = "users";
    flags = exceed_limit;
  };
  channel {
    default_split_user_count = 0;
  };
''
```

*Declared by:* [`nixos/modules/services/networking/solanum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/solanum.nix)

## `services.solanum.enable` {#opt-services.solanum.enable}

Whether to enable Solanum IRC daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/solanum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/solanum.nix)

## `services.solanum.motd` {#opt-services.solanum.motd}

Solanum MOTD text.

Solanum will read its MOTD from `/etc/solanum/ircd.motd`.
If set, the value of this option will be written to this path.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/solanum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/solanum.nix)

## `services.solanum.openFilesLimit` {#opt-services.solanum.openFilesLimit}

Maximum number of open files. Limits the clients and server connections.

*Type:* signed integer

*Default:* `1024`

*Declared by:* [`nixos/modules/services/networking/solanum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/solanum.nix)

## `services.soloist.apiKeyFile` {#opt-services.soloist.apiKeyFile}

File containing the Spotify Soloist API key.

Generate one from the [Spotify for Developers dashboard](https://developer.spotify.com/dashboard/soloist).

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/soloist-api-key"`

*Declared by:* [`nixos/modules/services/audio/soloist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/soloist.nix)

## `services.soloist.cacheSize` {#opt-services.soloist.cacheSize}

Maximum playback cache size in MB. Use 0 for no limit (the default
when unset). Values must be 0 or at least 100.

*Type:* null or (unsigned integer, meaning \>=0)

*Default:* `null`

*Example:* `500`

*Declared by:* [`nixos/modules/services/audio/soloist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/soloist.nix)

## `services.soloist.deviceName` {#opt-services.soloist.deviceName}

Name advertised to Spotify Connect controllers on the local network.
Select this name in the Spotify app to start playback on this device.

*Type:* non-empty string

*Default:* `config.networking.hostName`

*Declared by:* [`nixos/modules/services/audio/soloist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/soloist.nix)

## `services.soloist.enable` {#opt-services.soloist.enable}

Whether to enable Spotify Soloist, a headless Spotify Connect client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/soloist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/soloist.nix)

## `services.soloist.extraArgs` {#opt-services.soloist.extraArgs}

Extra command-line arguments to pass to `soloist`.
See [https://developer.spotify.com/documentation/soloist/reference/command-line](https://developer.spotify.com/documentation/soloist/reference/command-line).

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--verbose"
]
```

*Declared by:* [`nixos/modules/services/audio/soloist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/soloist.nix)

## `services.soloist.initialVolume` {#opt-services.soloist.initialVolume}

Initial volume from 0 to 100.

*Type:* null or integer between 0 and 100 (both inclusive)

*Default:* `null`

*Example:* `40`

*Declared by:* [`nixos/modules/services/audio/soloist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/soloist.nix)

## `services.soloist.package` {#opt-services.soloist.package}

The soloist package to use.

*Type:* package

*Default:* `pkgs.soloist`

*Declared by:* [`nixos/modules/services/audio/soloist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/soloist.nix)

## `services.soloist.pipewireDevice` {#opt-services.soloist.pipewireDevice}

Route audio to a specific PipeWire node name or ID instead of the
system's default audio output.

*Type:* null or string

*Default:* `null`

*Example:* `"alsa_output.usb-foobar-00.analog-stereo"`

*Declared by:* [`nixos/modules/services/audio/soloist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/soloist.nix)

## `services.soloist.verbose` {#opt-services.soloist.verbose}

Enable verbose logging.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/audio/soloist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/soloist.nix)

## `services.soloist.websocketAddress` {#opt-services.soloist.websocketAddress}

Address and port (`ADDR:PORT`) to enable the local WebSocket API on.
Use port 0 to let the operating system choose a free port.
If unset, the WebSocket API stays disabled.

*Type:* null or string

*Default:* `null`

*Example:* `"127.0.0.1:0"`

*Declared by:* [`nixos/modules/services/audio/soloist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/soloist.nix)

## `services.sonarr.dataDir` {#opt-services.sonarr.dataDir}

The Sonarr home directory used to store all data. If left as the default value
this directory will automatically be created before the Sonarr server starts, otherwise
you are responsible for ensuring the directory exists with appropriate ownership
and permissions.

*Type:* string

*Default:* `"/var/lib/sonarr/.config/NzbDrone"`

*Declared by:* [`nixos/modules/services/misc/servarr/sonarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/sonarr.nix)

## `services.sonarr.enable` {#opt-services.sonarr.enable}

Whether to enable Sonarr.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/servarr/sonarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/sonarr.nix)

## `services.sonarr.environmentFiles` {#opt-services.sonarr.environmentFiles}

Environment file to pass secret configuration values.
Each line must follow the `SONARR__SECTION__KEY=value` pattern.
Please consult the documentation at the [wiki](https://wiki.servarr.com/useful-tools#using-environment-variables-for-config).

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/servarr/sonarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/sonarr.nix)

## `services.sonarr.group` {#opt-services.sonarr.group}

Group account under which Sonarr runs.

::: note
If left as the default value this group will automatically be created
on system activation, otherwise you are responsible for
ensuring the group exists before the Sonarr service starts.
:::

*Type:* string

*Default:* `"sonarr"`

*Declared by:* [`nixos/modules/services/misc/servarr/sonarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/sonarr.nix)

## `services.sonarr.openFirewall` {#opt-services.sonarr.openFirewall}

Open ports in the firewall for the Sonarr web interface

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/servarr/sonarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/sonarr.nix)

## `services.sonarr.package` {#opt-services.sonarr.package}

The sonarr package to use.

*Type:* package

*Default:* `pkgs.sonarr`

*Declared by:* [`nixos/modules/services/misc/servarr/sonarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/sonarr.nix)

## `services.sonarr.settings` {#opt-services.sonarr.settings}

Attribute set of arbitrary config options.
Please consult the documentation at the [wiki](https://wiki.servarr.com/useful-tools#using-environment-variables-for-config).

WARNING: this configuration is stored in the world-readable Nix store!
For secrets use [services (S)](#opt-services.sonarr.environmentFiles).

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  update.mechanism = "internal";
  server = {
    urlbase = "localhost";
    port = 8989;
    bindaddress = "*";
  };
}
```

*Declared by:* [`nixos/modules/services/misc/servarr/sonarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/sonarr.nix)

## `services.sonarr.settings.log.analyticsEnabled` {#opt-services.sonarr.settings.log.analyticsEnabled}

Send Anonymous Usage Data

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/servarr/sonarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/sonarr.nix)

## `services.sonarr.settings.server.port` {#opt-services.sonarr.settings.server.port}

Port Number

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8989`

*Declared by:* [`nixos/modules/services/misc/servarr/sonarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/sonarr.nix)

## `services.sonarr.settings.update.automatically` {#opt-services.sonarr.settings.update.automatically}

Automatically download and install updates.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/servarr/sonarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/sonarr.nix)

## `services.sonarr.settings.update.mechanism` {#opt-services.sonarr.settings.update.mechanism}

which update mechanism to use

*Type:* null or one of "external", "builtIn", "script"

*Default:* `"external"`

*Declared by:* [`nixos/modules/services/misc/servarr/sonarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/sonarr.nix)

## `services.sonarr.user` {#opt-services.sonarr.user}

User account under which Sonarr runs.";

::: note
If left as the default value this user will automatically be created
on system activation, otherwise you are responsible for
ensuring the user exists before the Sonarr service starts.
:::

*Type:* string

*Default:* `"sonarr"`

*Declared by:* [`nixos/modules/services/misc/servarr/sonarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/servarr/sonarr.nix)

## `services.sonic-server.enable` {#opt-services.sonic-server.enable}

Whether to enable Sonic Search Index.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/search/sonic-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/sonic-server.nix)

## `services.sonic-server.package` {#opt-services.sonic-server.package}

The sonic-server package to use.

*Type:* package

*Default:* `pkgs.sonic-server`

*Declared by:* [`nixos/modules/services/search/sonic-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/sonic-server.nix)

## `services.sonic-server.settings` {#opt-services.sonic-server.settings}

Sonic Server configuration options.

Refer to
[https://github.com/valeriansaliou/sonic/blob/master/CONFIGURATION.md](https://github.com/valeriansaliou/sonic/blob/master/CONFIGURATION.md)
for a full list of available options.

*Type:* open submodule of (TOML value)

*Default:*

``` nix
{
  store = {
    fst = {
      path = "/var/lib/sonic/fst";
    };
    kv = {
      path = "/var/lib/sonic/kv";
    };
  };
}
```

*Example:*

``` nix
{
  channel = {
    inet = "[::1]:1491";
  };
  server = {
    log_level = "debug";
  };
}
```

*Declared by:* [`nixos/modules/services/search/sonic-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/sonic-server.nix)

## `services.spacecookie.address` {#opt-services.spacecookie.address}

Address to listen on. Must be in the
`ListenStream=` syntax of
`systemd.socket(5)`.

*Type:* string

*Default:* `"[::]"`

*Declared by:* [`nixos/modules/services/networking/spacecookie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spacecookie.nix)

## `services.spacecookie.enable` {#opt-services.spacecookie.enable}

Whether to enable spacecookie.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/spacecookie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spacecookie.nix)

## `services.spacecookie.openFirewall` {#opt-services.spacecookie.openFirewall}

Whether to open the necessary port in the firewall for spacecookie.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/spacecookie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spacecookie.nix)

## `services.spacecookie.package` {#opt-services.spacecookie.package}

The spacecookie package to use.

*Type:* package

*Default:* `pkgs.spacecookie`

*Example:* `haskellPackages.spacecookie`

*Declared by:* [`nixos/modules/services/networking/spacecookie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spacecookie.nix)

## `services.spacecookie.port` {#opt-services.spacecookie.port}

Port the gopher service should be exposed on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `70`

*Declared by:* [`nixos/modules/services/networking/spacecookie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spacecookie.nix)

## `services.spacecookie.settings` {#opt-services.spacecookie.settings}

Settings for spacecookie. The settings set here are
directly translated to the spacecookie JSON config
file. See
[spacecookie.json(5)](https://sternenseemann.github.io/spacecookie/spacecookie.json.5.html)
for explanations of all options.

*Type:* open submodule of (JSON value)

*Declared by:* [`nixos/modules/services/networking/spacecookie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spacecookie.nix)

## `services.spacecookie.settings.hostname` {#opt-services.spacecookie.settings.hostname}

The hostname the service is reachable via. Clients
will use this hostname for further requests after
loading the initial gopher menu.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/networking/spacecookie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spacecookie.nix)

## `services.spacecookie.settings.log.enable` {#opt-services.spacecookie.settings.log.enable}

Whether to enable logging for spacecookie.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/networking/spacecookie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spacecookie.nix)

## `services.spacecookie.settings.log.hide-ips` {#opt-services.spacecookie.settings.log.hide-ips}

If enabled, spacecookie will hide personal
information of users like IP addresses from
log output.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/spacecookie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spacecookie.nix)

## `services.spacecookie.settings.log.hide-time` {#opt-services.spacecookie.settings.log.hide-time}

If enabled, spacecookie will not print timestamps
at the beginning of every log line.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/spacecookie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spacecookie.nix)

## `services.spacecookie.settings.log.level` {#opt-services.spacecookie.settings.log.level}

Log level for the spacecookie service.

*Type:* one of "info", "warn", "error"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/networking/spacecookie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spacecookie.nix)

## `services.spacecookie.settings.root` {#opt-services.spacecookie.settings.root}

The directory spacecookie should serve via gopher.
Files in there need to be world-readable since
the spacecookie service file sets
`DynamicUser=true`.

*Type:* absolute path

*Default:* `"/srv/gopher"`

*Declared by:* [`nixos/modules/services/networking/spacecookie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spacecookie.nix)

## `services.spamassassin.config` {#opt-services.spamassassin.config}

The SpamAssassin local.cf config

If you are using this configuration:

    add_header all Status _YESNO_, score=_SCORE_ required=_REQD_ tests=_TESTS_ autolearn=_AUTOLEARN_ version=_VERSION_

Then you can Use this sieve filter:

    require ["fileinto", "reject", "envelope"];

    if header :contains "X-Spam-Flag" "YES" {
      fileinto "spam";
    }

Or this procmail filter:

    :0:
    * ^X-Spam-Flag: YES
    /var/vpopmail/domains/lastlog.de/js/.maildir/.spam/new

To filter your messages based on the additional mail headers added by spamassassin.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  #rewrite_header Subject [***** SPAM _SCORE_ *****]
  required_score          5.0
  use_bayes               1
  bayes_auto_learn        1
  add_header all Status _YESNO_, score=_SCORE_ required=_REQD_ tests=_TESTS_ autolearn=_AUTOLEARN_ version=_VERSION_
''
```

*Declared by:* [`nixos/modules/services/mail/spamassassin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/spamassassin.nix)

## `services.spamassassin.debug` {#opt-services.spamassassin.debug}

Whether to run the SpamAssassin daemon in debug mode

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/mail/spamassassin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/spamassassin.nix)

## `services.spamassassin.enable` {#opt-services.spamassassin.enable}

Whether to enable the SpamAssassin daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/spamassassin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/spamassassin.nix)

## `services.spamassassin.initPreConf` {#opt-services.spamassassin.initPreConf}

The SpamAssassin init.pre config.

*Type:* string or absolute path

*Default:*

``` nix
''
  #
  # to update this list, run this command in the rules directory:
  # grep 'loadplugin.*Mail::SpamAssassin::Plugin::.*' -o -h * | sort | uniq
  #
  
  #loadplugin Mail::SpamAssassin::Plugin::AccessDB
  #loadplugin Mail::SpamAssassin::Plugin::AntiVirus
  loadplugin Mail::SpamAssassin::Plugin::AskDNS
  # loadplugin Mail::SpamAssassin::Plugin::ASN
  loadplugin Mail::SpamAssassin::Plugin::AutoLearnThreshold
  #loadplugin Mail::SpamAssassin::Plugin::AWL
  loadplugin Mail::SpamAssassin::Plugin::Bayes
  loadplugin Mail::SpamAssassin::Plugin::BodyEval
  loadplugin Mail::SpamAssassin::Plugin::Check
  #loadplugin Mail::SpamAssassin::Plugin::DCC
  loadplugin Mail::SpamAssassin::Plugin::DKIM
  loadplugin Mail::SpamAssassin::Plugin::DMARC
  loadplugin Mail::SpamAssassin::Plugin::DNSEval
  loadplugin Mail::SpamAssassin::Plugin::FreeMail
  loadplugin Mail::SpamAssassin::Plugin::HeaderEval
  loadplugin Mail::SpamAssassin::Plugin::HTMLEval
  loadplugin Mail::SpamAssassin::Plugin::HTTPSMismatch
  loadplugin Mail::SpamAssassin::Plugin::ImageInfo
  loadplugin Mail::SpamAssassin::Plugin::MIMEEval
  loadplugin Mail::SpamAssassin::Plugin::MIMEHeader
  # loadplugin Mail::SpamAssassin::Plugin::PDFInfo
  #loadplugin Mail::SpamAssassin::Plugin::PhishTag
  loadplugin Mail::SpamAssassin::Plugin::Pyzor
  loadplugin Mail::SpamAssassin::Plugin::Razor2
  # loadplugin Mail::SpamAssassin::Plugin::RelayCountry
  loadplugin Mail::SpamAssassin::Plugin::RelayEval
  loadplugin Mail::SpamAssassin::Plugin::ReplaceTags
  # loadplugin Mail::SpamAssassin::Plugin::Rule2XSBody
  # loadplugin Mail::SpamAssassin::Plugin::Shortcircuit
  loadplugin Mail::SpamAssassin::Plugin::SpamCop
  loadplugin Mail::SpamAssassin::Plugin::SPF
  loadplugin Mail::SpamAssassin::Plugin::TextCat
  # loadplugin Mail::SpamAssassin::Plugin::TxRep
  loadplugin Mail::SpamAssassin::Plugin::URIDetail
  loadplugin Mail::SpamAssassin::Plugin::URIDNSBL
  loadplugin Mail::SpamAssassin::Plugin::URIEval
  # loadplugin Mail::SpamAssassin::Plugin::URILocalBL
  loadplugin Mail::SpamAssassin::Plugin::VBounce
  loadplugin Mail::SpamAssassin::Plugin::WhiteListSubject
  loadplugin Mail::SpamAssassin::Plugin::WLBLEval
''
```

*Declared by:* [`nixos/modules/services/mail/spamassassin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/spamassassin.nix)

## `services.spark.confDir` {#opt-services.spark.confDir}

Spark configuration directory. Spark will use the configuration files (spark-defaults.conf, spark-env.sh, log4j.properties, etc) from this directory.

*Type:* absolute path

*Default:* `"${package}/conf"`

*Declared by:* [`nixos/modules/services/cluster/spark/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/spark/default.nix)

## `services.spark.logDir` {#opt-services.spark.logDir}

Spark log directory.

*Type:* absolute path

*Default:* `"/var/log/spark"`

*Declared by:* [`nixos/modules/services/cluster/spark/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/spark/default.nix)

## `services.spark.master.bind` {#opt-services.spark.master.bind}

Address the spark master binds to.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/cluster/spark/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/spark/default.nix)

## `services.spark.master.enable` {#opt-services.spark.master.enable}

Whether to enable Spark master service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/spark/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/spark/default.nix)

## `services.spark.master.extraEnvironment` {#opt-services.spark.master.extraEnvironment}

Extra environment variables to pass to spark master. See spark-standalone documentation.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  SPARK_MASTER_OPTS = "-Dspark.deploy.defaultCores=5";
  SPARK_MASTER_WEBUI_PORT = 8181;
}
```

*Declared by:* [`nixos/modules/services/cluster/spark/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/spark/default.nix)

## `services.spark.master.restartIfChanged` {#opt-services.spark.master.restartIfChanged}

Automatically restart master service on config change.
This can be set to false to defer restarts on clusters running critical applications.
Please consider the security implications of inadvertently running an older version,
and the possibility of unexpected behavior caused by inconsistent versions across a cluster when disabling this option.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/cluster/spark/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/spark/default.nix)

## `services.spark.package` {#opt-services.spark.package}

The spark package to use.

*Type:* package

*Default:* `pkgs.spark`

*Example:*

``` nix
spark.overrideAttrs (super: rec {
  pname = "spark";
  version = "2.4.4";

  src = pkgs.fetchzip {
    url    = "mirror://apache/spark/"${pname}-${version}/${pname}-${version}-bin-without-hadoop.tgz";
    sha256 = "1a9w5k0207fysgpxx6db3a00fs5hdc2ncx99x4ccy2s0v5ndc66g";
  };
})
```

*Declared by:* [`nixos/modules/services/cluster/spark/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/spark/default.nix)

## `services.spark.worker.enable` {#opt-services.spark.worker.enable}

Whether to enable Spark worker service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/spark/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/spark/default.nix)

## `services.spark.worker.extraEnvironment` {#opt-services.spark.worker.extraEnvironment}

Extra environment variables to pass to spark worker.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  SPARK_WORKER_CORES = 5;
  SPARK_WORKER_MEMORY = "2g";
}
```

*Declared by:* [`nixos/modules/services/cluster/spark/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/spark/default.nix)

## `services.spark.worker.master` {#opt-services.spark.worker.master}

Address of the spark master.

*Type:* string

*Default:* `"127.0.0.1:7077"`

*Declared by:* [`nixos/modules/services/cluster/spark/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/spark/default.nix)

## `services.spark.worker.restartIfChanged` {#opt-services.spark.worker.restartIfChanged}

Automatically restart worker service on config change.
This can be set to false to defer restarts on clusters running critical applications.
Please consider the security implications of inadvertently running an older version,
and the possibility of unexpected behavior caused by inconsistent versions across a cluster when disabling this option.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/cluster/spark/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/spark/default.nix)

## `services.spark.worker.workDir` {#opt-services.spark.worker.workDir}

Spark worker work dir.

*Type:* absolute path

*Default:* `"/var/lib/spark"`

*Declared by:* [`nixos/modules/services/cluster/spark/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/spark/default.nix)

## `services.speechd.clients` {#opt-services.speechd.clients}

Client specific configuration.

*Type:* open submodule of attribute set of strings concatenated with "\\n"

*Default:* `{ }`

*Example:*

``` nix
{
  emacs = ''
    BeginClient "emacs:*"
    # Example:
    #   DefaultPunctuationMode "some"
    EndClient
  '';
}
```

*Declared by:* [`nixos/modules/services/accessibility/speechd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/accessibility/speechd.nix)

## `services.speechd.config` {#opt-services.speechd.config}

System wide configuration file for Speech Dispatcher. This will be used if no user configuration file is found.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Example:*

``` nix
''
  AddModule "module_name" "module_binary" "module_config"
''
```

*Declared by:* [`nixos/modules/services/accessibility/speechd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/accessibility/speechd.nix)

## `services.speechd.enable` {#opt-services.speechd.enable}

Whether to enable speech-dispatcher speech synthesizer daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/accessibility/speechd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/accessibility/speechd.nix)

## `services.speechd.modules` {#opt-services.speechd.modules}

Configuration files of output modules.

*Type:* open submodule of attribute set of strings concatenated with "\\n"

*Default:* `{ }`

*Example:*

``` nix
{
  generic-epos = ''
    AddVoice        "cs"  "male1"   "kadlec"
    AddVoice        "sk"  "male1"   "bob"
  '';
}
```

*Declared by:* [`nixos/modules/services/accessibility/speechd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/accessibility/speechd.nix)

## `services.speechd.package` {#opt-services.speechd.package}

The speechd package to use.

*Type:* package

*Default:* `pkgs.speechd`

*Declared by:* [`nixos/modules/services/accessibility/speechd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/accessibility/speechd.nix)

## `services.speedify.enable` {#opt-services.speedify.enable}

This option enables Speedify daemon.
This sets [`networking.firewall.checkReversePath`](../../options/networking/index.md#opt-networking.firewall.checkReversePath) to "loose", which might be undesirable for security.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/speedify.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/speedify.nix)

## `services.speedify.package` {#opt-services.speedify.package}

The speedify package to use.

*Type:* package

*Default:* `pkgs.speedify`

*Declared by:* [`nixos/modules/services/networking/speedify.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/speedify.nix)

## `services.speedtest-tracker.dataDir` {#opt-services.speedtest-tracker.dataDir}

The place where Speedtest Tracker stores its state.

*Type:* absolute path

*Default:* `"/var/lib/speedtest-tracker"`

*Declared by:* [`nixos/modules/services/web-apps/speedtest-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/speedtest-tracker.nix)

## `services.speedtest-tracker.enable` {#opt-services.speedtest-tracker.enable}

Whether to enable Speedtest Tracker: A self-hosted internet performance tracking application.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/speedtest-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/speedtest-tracker.nix)

## `services.speedtest-tracker.enableNginx` {#opt-services.speedtest-tracker.enableNginx}

Whether to enable nginx or not. If enabled, an nginx virtual host will
be created for access to Speedtest Tracker. If not enabled, then you may use
`${config.services.speedtest-tracker.package}` as your document root in
whichever webserver you wish to setup.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/speedtest-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/speedtest-tracker.nix)

## `services.speedtest-tracker.group` {#opt-services.speedtest-tracker.group}

Group under which Speedtest Tracker runs. It is best to set this to the group
of whatever webserver is being used as the frontend.

*Type:* string

*Default:* ``"If `services.speedtest-tracker.enableNginx` is true then `nginx` else speedtest-tracker"``

*Declared by:* [`nixos/modules/services/web-apps/speedtest-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/speedtest-tracker.nix)

## `services.speedtest-tracker.package` {#opt-services.speedtest-tracker.package}

The speedtest-tracker package to use.

*Type:* package

*Default:* `pkgs.speedtest-tracker`

*Declared by:* [`nixos/modules/services/web-apps/speedtest-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/speedtest-tracker.nix)

## `services.speedtest-tracker.poolConfig` {#opt-services.speedtest-tracker.poolConfig}

Options for the Speedtest Tracker PHP pool. See the documentation on `php-fpm.conf`
for details on configuration directives.

*Type:* attribute set of (string or signed integer or boolean)

*Default:*

``` nix
''
  {
    "pm" = "dynamic";
    "pm.max_children" = 32;
    "pm.start_servers" = 2;
    "pm.min_spare_servers" = 2;
    "pm.max_spare_servers" = 4;
    "pm.max_requests" = 500;
  }
''
```

*Declared by:* [`nixos/modules/services/web-apps/speedtest-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/speedtest-tracker.nix)

## `services.speedtest-tracker.settings` {#opt-services.speedtest-tracker.settings}

Options for Speedtest Tracker configuration. Refer to
[https://github.com/alexjustesen/speedtest-tracker](https://github.com/alexjustesen/speedtest-tracker) for
details on supported values. All `_FILE` values are supported:
append `_FILE` to the setting name to provide a path to a file
containing the secret value.

*Type:* open submodule of attribute set of (string or signed integer or boolean)

*Default:* `{ }`

*Example:*

``` nix
{
  APP_KEY_FILE = "/var/secrets/speedtest-tracker-app-key.txt";
  DB_CONNECTION = "mysql";
  DB_HOST = "db";
  DB_PORT = 3306;
  DB_DATABASE = "speedtest-tracker";
  DB_USERNAME = "speedtest-tracker";
  DB_PASSWORD_FILE = "/var/secrets/speedtest-tracker-mysql-password.txt";
}
```

*Declared by:* [`nixos/modules/services/web-apps/speedtest-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/speedtest-tracker.nix)

## `services.speedtest-tracker.settings.APP_KEY_FILE` {#opt-services.speedtest-tracker.settings.APP_KEY_FILE}

The path to your appkey. The file should contain a 32 character
random app key. This may be set using `echo "base64:$(head -c 32 /dev/urandom | base64)" > /path/to/key-file`.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-apps/speedtest-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/speedtest-tracker.nix)

## `services.speedtest-tracker.settings.APP_URL` {#opt-services.speedtest-tracker.settings.APP_URL}

The APP\_URL used by Speedtest Tracker internally. Please make sure this
URL matches the external URL of your installation. It is used to
validate specific requests and to generate URLs in notifications.

*Type:* string

*Default:*

``` nix
''
  http(s)://''${config.services.speedtest-tracker.virtualHost}
''
```

*Declared by:* [`nixos/modules/services/web-apps/speedtest-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/speedtest-tracker.nix)

## `services.speedtest-tracker.settings.DB_CONNECTION` {#opt-services.speedtest-tracker.settings.DB_CONNECTION}

The type of database you wish to use. Can be one of "sqlite",
"mysql", "mariadb" or "pgsql".

*Type:* one of "sqlite", "mysql", "mariadb", "pgsql"

*Default:* `"sqlite"`

*Example:* `"pgsql"`

*Declared by:* [`nixos/modules/services/web-apps/speedtest-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/speedtest-tracker.nix)

## `services.speedtest-tracker.settings.DB_DATABASE` {#opt-services.speedtest-tracker.settings.DB_DATABASE}

The name of the database, or path to the sqlite file.

*Type:* string

*Default:*

``` nix
''
  "''${config.services.speedtest-tracker.dataDir}/storage/database/database.sqlite" if DB_CONNECTION is "sqlite", "speedtest-tracker" otherwise
''
```

*Declared by:* [`nixos/modules/services/web-apps/speedtest-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/speedtest-tracker.nix)

## `services.speedtest-tracker.settings.DB_HOST` {#opt-services.speedtest-tracker.settings.DB_HOST}

The IP or hostname which hosts your database.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/speedtest-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/speedtest-tracker.nix)

## `services.speedtest-tracker.settings.DB_PORT` {#opt-services.speedtest-tracker.settings.DB_PORT}

The port your database is listening at. sqlite does not require
this value to be filled.

*Type:* null or signed integer

*Default:*

``` nix
''
  `null` if DB_CONNECTION is "sqlite", `3306` if "mysql" or "mariadb", `5432` if "pgsql"
''
```

*Declared by:* [`nixos/modules/services/web-apps/speedtest-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/speedtest-tracker.nix)

## `services.speedtest-tracker.user` {#opt-services.speedtest-tracker.user}

User account under which Speedtest Tracker runs.

*Type:* string

*Default:* `"speedtest-tracker"`

*Declared by:* [`nixos/modules/services/web-apps/speedtest-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/speedtest-tracker.nix)

## `services.speedtest-tracker.virtualHost` {#opt-services.speedtest-tracker.virtualHost}

The hostname at which you wish Speedtest Tracker to be served. If you have
enabled nginx using `services.speedtest-tracker.enableNginx` then this will
be used.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/speedtest-tracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/speedtest-tracker.nix)

## `services.spice-autorandr.enable` {#opt-services.spice-autorandr.enable}

Whether to enable spice-autorandr service that will automatically resize display to match SPICE client window size.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/spice-autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/spice-autorandr.nix)

## `services.spice-autorandr.package` {#opt-services.spice-autorandr.package}

The spice-autorandr package to use.

*Type:* package

*Default:* `pkgs.spice-autorandr`

*Declared by:* [`nixos/modules/services/misc/spice-autorandr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/spice-autorandr.nix)

## `services.spice-vdagentd.enable` {#opt-services.spice-vdagentd.enable}

Whether to enable Spice guest vdagent daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/spice-vdagentd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/spice-vdagentd.nix)

## `services.spice-webdavd.enable` {#opt-services.spice-webdavd.enable}

Whether to enable the spice guest webdav proxy daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/spice-webdavd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/spice-webdavd.nix)

## `services.spice-webdavd.package` {#opt-services.spice-webdavd.package}

The phodav package to use.

*Type:* package

*Default:* `pkgs.phodav`

*Declared by:* [`nixos/modules/services/misc/spice-webdavd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/spice-webdavd.nix)

## `services.spiped.config` {#opt-services.spiped.config}

Configuration for a secure pipe daemon. The daemon can be
started, stopped, or examined using
`systemctl`, under the name
`spiped@foo`.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  pipe1 =
    { keyfile = "/var/lib/spiped/pipe1.key";
      encrypt = true;
      source  = "localhost:6000";
      target  = "endpoint.example.com:7000";
    };
  pipe2 =
    { keyfile = "/var/lib/spiped/pipe2.key";
      decrypt = true;
      source  = "0.0.0.0:7000";
      target  = "localhost:3000";
    };
}
```

*Declared by:* [`nixos/modules/services/networking/spiped.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spiped.nix)

## `services.spiped.config.<name>.decrypt` {#opt-services.spiped.config._name_.decrypt}

Take encrypted connections from the
`source` socket and send unencrypted
connections to the `target` socket.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/spiped.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spiped.nix)

## `services.spiped.config.<name>.disableKeepalives` {#opt-services.spiped.config._name_.disableKeepalives}

Disable transport layer keep-alives.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/spiped.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spiped.nix)

## `services.spiped.config.<name>.disableReresolution` {#opt-services.spiped.config._name_.disableReresolution}

Disable target address re-resolution.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/spiped.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spiped.nix)

## `services.spiped.config.<name>.encrypt` {#opt-services.spiped.config._name_.encrypt}

Take unencrypted connections from the
`source` socket and send encrypted
connections to the `target` socket.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/spiped.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spiped.nix)

## `services.spiped.config.<name>.keyfile` {#opt-services.spiped.config._name_.keyfile}

Name of a file containing the spiped key.
As the daemon runs as the `spiped` user,
the key file must be readable by that user.
To securely manage the file within your configuration
consider a tool such as agenix or sops-nix.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/networking/spiped.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spiped.nix)

## `services.spiped.config.<name>.maxConns` {#opt-services.spiped.config._name_.maxConns}

Limit on the number of simultaneous connections allowed.

*Type:* signed integer

*Default:* `100`

*Declared by:* [`nixos/modules/services/networking/spiped.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spiped.nix)

## `services.spiped.config.<name>.resolveRefresh` {#opt-services.spiped.config._name_.resolveRefresh}

Resolution refresh time for the target socket, in seconds.

*Type:* signed integer

*Default:* `60`

*Declared by:* [`nixos/modules/services/networking/spiped.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spiped.nix)

## `services.spiped.config.<name>.source` {#opt-services.spiped.config._name_.source}

Address on which spiped should listen for incoming
connections.  Must be in one of the following formats:
`/absolute/path/to/unix/socket`,
`host.name:port`,
`[ip.v4.ad.dr]:port` or
`[ipv6::addr]:port` - note that
hostnames are resolved when spiped is launched and are
not re-resolved later; thus if DNS entries change
spiped will continue to connect to the expired
address.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/spiped.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spiped.nix)

## `services.spiped.config.<name>.target` {#opt-services.spiped.config._name_.target}

Address to which spiped should connect.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/spiped.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spiped.nix)

## `services.spiped.config.<name>.timeout` {#opt-services.spiped.config._name_.timeout}

Timeout, in seconds, after which an attempt to connect to
the target or a protocol handshake will be aborted (and the
connection dropped) if not completed

*Type:* signed integer

*Default:* `5`

*Declared by:* [`nixos/modules/services/networking/spiped.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spiped.nix)

## `services.spiped.config.<name>.waitForDNS` {#opt-services.spiped.config._name_.waitForDNS}

Wait for DNS. Normally when `spiped` is
launched it resolves addresses and binds to its source
socket before the parent process returns; with this option
it will daemonize first and retry failed DNS lookups until
they succeed. This allows `spiped` to
launch even if DNS isn't set up yet, but at the expense of
losing the guarantee that once `spiped` has
finished launching it will be ready to create pipes.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/spiped.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spiped.nix)

## `services.spiped.config.<name>.weakHandshake` {#opt-services.spiped.config._name_.weakHandshake}

Use fast/weak handshaking: This reduces the CPU time spent
in the initial connection setup, at the expense of losing
perfect forward secrecy.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/spiped.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spiped.nix)

## `services.spiped.enable` {#opt-services.spiped.enable}

Enable the spiped service module.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/spiped.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/spiped.nix)

## `services.spire.agent.configFile` {#opt-services.spire.agent.configFile}

Path to the SPIRE agent configuration file. See [the documentation](https://spiffe.io/docs/latest/deploying/spire_agent/) for more information.

*Type:* absolute path

*Default:* `"Config file generated from services.spire.agent.settings"`

*Declared by:* [`nixos/modules/services/security/spire/agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/agent.nix)

## `services.spire.agent.enable` {#opt-services.spire.agent.enable}

Whether to enable SPIRE agent.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/spire/agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/agent.nix)

## `services.spire.agent.expandEnv` {#opt-services.spire.agent.expandEnv}

Expand environment $VARIABLES in the config file

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/spire/agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/agent.nix)

## `services.spire.agent.package` {#opt-services.spire.agent.package}

The spire package to use.

*Type:* package

*Default:* `pkgs.spire`

*Declared by:* [`nixos/modules/services/security/spire/agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/agent.nix)

## `services.spire.agent.settings` {#opt-services.spire.agent.settings}

SPIRE Agent configuration file options. See [the documentation](https://spiffe.io/docs/latest/deploying/spire_agent/) for all available options.

*Type:* open submodule of (JSON value)

*Declared by:*

- [`nixos/modules/services/security/spire/agent-tpm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/agent-tpm.nix)
- [`nixos/modules/services/security/spire/agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/agent.nix)

## `services.spire.agent.settings.agent.data_dir` {#opt-services.spire.agent.settings.agent.data_dir}

A directory the agent can use for its runtime data

*Type:* string

*Default:* `"$STATE_DIRECTORY"`

*Declared by:* [`nixos/modules/services/security/spire/agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/agent.nix)

## `services.spire.agent.settings.agent.join_token` {#opt-services.spire.agent.settings.agent.join_token}

An optional token which has been generated by the SPIRE server

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/spire/agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/agent.nix)

## `services.spire.agent.settings.agent.join_token_file` {#opt-services.spire.agent.settings.agent.join_token_file}

Path to a file containing an optional join token which has been generated by the SPIRE server

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/spire/agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/agent.nix)

## `services.spire.agent.settings.agent.server_address` {#opt-services.spire.agent.settings.agent.server_address}

DNS name or IP address of the SPIRE server

*Type:* string

*Example:* `"server.example.com"`

*Declared by:* [`nixos/modules/services/security/spire/agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/agent.nix)

## `services.spire.agent.settings.agent.server_port` {#opt-services.spire.agent.settings.agent.server_port}

Port number of the SPIRE server

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8081`

*Declared by:* [`nixos/modules/services/security/spire/agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/agent.nix)

## `services.spire.agent.settings.agent.socket_path` {#opt-services.spire.agent.settings.agent.socket_path}

Location to bind the SPIRE Agent API socket (Unix only)

*Type:* absolute path

*Default:* `"/run/spire/agent/public/api.sock"`

*Declared by:* [`nixos/modules/services/security/spire/agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/agent.nix)

## `services.spire.agent.settings.agent.trust_domain` {#opt-services.spire.agent.settings.agent.trust_domain}

The trust domain that this agent belongs to (should be no more than 255 characters)

*Type:* string

*Example:* `"example.com"`

*Declared by:* [`nixos/modules/services/security/spire/agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/agent.nix)

## `services.spire.agent.settings.plugins` {#opt-services.spire.agent.settings.plugins}

Built-in plugin types can be found at [the plugin types documentation](https://spiffe.io/docs/latest/deploying/spire_agent/#plugin-types).
See [plugin configuration](https://spiffe.io/docs/latest/deploying/spire_agent/#plugin-configuration) for options and how to configure external plugins.

*Type:* open submodule of (JSON value)

*Example:*

``` nix
{
  KeyManager = {
    memory = {
      plugin_data = { };
    };
  };
  NodeAttestor = {
    join_token = {
      plugin_data = { };
    };
  };
  WorkloadAttestor = {
    systemd = {
      plugin_data = { };
    };
    unix = {
      plugin_data = { };
    };
  };
}
```

*Declared by:*

- [`nixos/modules/services/security/spire/agent-tpm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/agent-tpm.nix)
- [`nixos/modules/services/security/spire/agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/agent.nix)

## `services.spire.agent.settings.plugins.NodeAttestor` {#opt-services.spire.agent.settings.plugins.NodeAttestor}

Gathers information used to attest the agent's identity to the server. Generally paired with a server plugin of the same type.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:*

- [`nixos/modules/services/security/spire/agent-tpm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/agent-tpm.nix)
- [`nixos/modules/services/security/spire/agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/agent.nix)

## `services.spire.agent.settings.plugins.NodeAttestor.join_token` {#opt-services.spire.agent.settings.plugins.NodeAttestor.join_token}

The `join_token` is responsible for attesting the agent's identity using a one-time-use pre-shared key.

Must be used in conjunction with the server-side `join_token` plugin.

*Type:* null or (open submodule of (JSON value))

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/spire/agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/agent.nix)

## `services.spire.agent.settings.plugins.NodeAttestor.join_token.plugin_data` {#opt-services.spire.agent.settings.plugins.NodeAttestor.join_token.plugin_data}

As a special case for node attestors, the join token itself is configured by a CLI flag (`-joinToken`)
or by configuring `join_token` in the agent's main config body.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/spire/agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/agent.nix)

## `services.spire.agent.settings.plugins.NodeAttestor.tpm` {#opt-services.spire.agent.settings.plugins.NodeAttestor.tpm}

TPM 2.0 node attestation plugin. When set, automatically enables security.tpm2 and grants the spire-agent user access to the TPM device.

*Type:* null or (open submodule of (JSON value))

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/spire/agent-tpm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/agent-tpm.nix)

## `services.spire.agent.settings.plugins.NodeAttestor.tpm.plugin_cmd` {#opt-services.spire.agent.settings.plugins.NodeAttestor.tpm.plugin_cmd}

Path to the TPM attestor agent plugin binary.

*Type:* string

*Default:* `lib.getExe' pkgs.spire-tpm-plugin "tpm_attestor_agent"`

*Declared by:* [`nixos/modules/services/security/spire/agent-tpm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/agent-tpm.nix)

## `services.spire.server.configFile` {#opt-services.spire.server.configFile}

Path to the SPIRE server configuration file. See [the documentation](https://spiffe.io/docs/latest/deploying/spire_server/) for more information.

*Type:* absolute path

*Default:* `"Config file generated from services.spire.server.settings"`

*Declared by:* [`nixos/modules/services/security/spire/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/server.nix)

## `services.spire.server.enable` {#opt-services.spire.server.enable}

Whether to enable SPIRE Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/spire/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/server.nix)

## `services.spire.server.expandEnv` {#opt-services.spire.server.expandEnv}

Expand environment variables in services.spire.server.settings and services.spire.server.configFile

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/spire/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/server.nix)

## `services.spire.server.openFirewall` {#opt-services.spire.server.openFirewall}

Whether to open firewall

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/spire/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/server.nix)

## `services.spire.server.package` {#opt-services.spire.server.package}

The spire package to use.

*Type:* package

*Default:* `pkgs.spire`

*Declared by:* [`nixos/modules/services/security/spire/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/server.nix)

## `services.spire.server.settings` {#opt-services.spire.server.settings}

SPIRE Server configuration file options. See [the documentation](https://spiffe.io/docs/latest/deploying/spire_server/) for all available options.

*Type:* open submodule of (JSON value)

*Declared by:*

- [`nixos/modules/services/security/spire/server-tpm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/server-tpm.nix)
- [`nixos/modules/services/security/spire/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/server.nix)

## `services.spire.server.settings.plugins` {#opt-services.spire.server.settings.plugins}

Built-in plugin types can be found at [the plugin types documentation](https://spiffe.io/docs/latest/deploying/spire_server/#plugin-types).
See [plugin configuration](https://spiffe.io/docs/latest/deploying/spire_server/#plugin-configuration) for options and how to configure external plugins.

*Type:* open submodule of (JSON value)

*Example:*

``` nix
{
  DataStore = {
    sql = {
      plugin_data = {
        connection_string = "$STATE_DIRECTORY/datastore.sqlite3";
        database_type = "sqlite3";
      };
    };
  };
  KeyManager = {
    memory = {
      plugin_data = { };
    };
  };
  NodeAttestor = {
    join_token = {
      plugin_data = { };
    };
  };
}
```

*Declared by:*

- [`nixos/modules/services/security/spire/server-tpm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/server-tpm.nix)
- [`nixos/modules/services/security/spire/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/server.nix)

## `services.spire.server.settings.plugins.NodeAttestor` {#opt-services.spire.server.settings.plugins.NodeAttestor}

NodeAttestor plugins implement validation logic for nodes attempting to assert their identity.
They are generally paired with an agent plugin of the same type.
See [the documentation](https://spiffe.io/docs/latest/deploying/spire_server/#nodeattestor)
for the list of built-in NodeAttestor plugins.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:*

- [`nixos/modules/services/security/spire/server-tpm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/server-tpm.nix)
- [`nixos/modules/services/security/spire/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/server.nix)

## `services.spire.server.settings.plugins.NodeAttestor.join_token` {#opt-services.spire.server.settings.plugins.NodeAttestor.join_token}

Join token based node attestation.

*Type:* null or (open submodule of (JSON value))

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/spire/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/server.nix)

## `services.spire.server.settings.plugins.NodeAttestor.join_token.plugin_data` {#opt-services.spire.server.settings.plugins.NodeAttestor.join_token.plugin_data}

Plugin data for the join\_token NodeAttestor.

*Type:* JSON value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/spire/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/server.nix)

## `services.spire.server.settings.plugins.NodeAttestor.tpm` {#opt-services.spire.server.settings.plugins.NodeAttestor.tpm}

TPM 2.0 node attestation plugin from
[spire-tpm-plugin](https://github.com/spiffe/spire-tpm-plugin).

*Type:* null or (open submodule of (JSON value))

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/spire/server-tpm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/server-tpm.nix)

## `services.spire.server.settings.plugins.NodeAttestor.tpm.plugin_cmd` {#opt-services.spire.server.settings.plugins.NodeAttestor.tpm.plugin_cmd}

Path to the TPM attestor server plugin binary.

*Type:* string

*Default:* `lib.getExe' pkgs.spire-tpm-plugin "tpm_attestor_server"`

*Declared by:* [`nixos/modules/services/security/spire/server-tpm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/server-tpm.nix)

## `services.spire.server.settings.plugins.NodeAttestor.tpm.plugin_data` {#opt-services.spire.server.settings.plugins.NodeAttestor.tpm.plugin_data}

Plugin data for the TPM NodeAttestor. Either `ca_path`,
`hash_path`, or both must be configured.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/spire/server-tpm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/server-tpm.nix)

## `services.spire.server.settings.plugins.NodeAttestor.tpm.plugin_data.ca_path` {#opt-services.spire.server.settings.plugins.NodeAttestor.tpm.plugin_data.ca_path}

The path to the CA directory. Contains the manufacturer CA
cert that signed the TPM's EK certificate in PEM or DER
format.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/spire/server-tpm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/server-tpm.nix)

## `services.spire.server.settings.plugins.NodeAttestor.tpm.plugin_data.hash_path` {#opt-services.spire.server.settings.plugins.NodeAttestor.tpm.plugin_data.hash_path}

The path to the Hash directory. Contains empty files named
after the EK public key hash.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/spire/server-tpm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/server-tpm.nix)

## `services.spire.server.settings.server.bind_address` {#opt-services.spire.server.settings.server.bind_address}

The address on which the SPIRE server is listening

*Type:* string

*Default:* `"[::]"`

*Declared by:* [`nixos/modules/services/security/spire/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/server.nix)

## `services.spire.server.settings.server.bind_port` {#opt-services.spire.server.settings.server.bind_port}

The port on which the SPIRE server is listening

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8081`

*Declared by:* [`nixos/modules/services/security/spire/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/server.nix)

## `services.spire.server.settings.server.data_dir` {#opt-services.spire.server.settings.server.data_dir}

The directory where SPIRE server stores its data

*Type:* string

*Default:* `"$STATE_DIRECTORY"`

*Declared by:* [`nixos/modules/services/security/spire/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/server.nix)

## `services.spire.server.settings.server.socket_path` {#opt-services.spire.server.settings.server.socket_path}

Path to bind the SPIRE Server API Socket to

*Type:* string

*Default:* `"/run/spire/server/private/api.sock"`

*Declared by:* [`nixos/modules/services/security/spire/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/server.nix)

## `services.spire.server.settings.server.trust_domain` {#opt-services.spire.server.settings.server.trust_domain}

The trust domain that this server belongs to

*Type:* string

*Example:* `"example.com"`

*Declared by:* [`nixos/modules/services/security/spire/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/spire/server.nix)

## `services.spoolman.enable` {#opt-services.spoolman.enable}

Whether to enable Spoolman, a filament spool inventory management system..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/spoolman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/spoolman.nix)

## `services.spoolman.environment` {#opt-services.spoolman.environment}

Environment variables to be passed to the spoolman service.
Refer to https://github.com/Donkie/Spoolman/blob/master/.env.example for details on supported variables.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  SPOOLMAN_AUTOMATIC_BACKUP = "TRUE";
  SPOOLMAN_BASE_PATH = "/spoolman";
  SPOOLMAN_CORS_ORIGIN = "https://source1.domain.com,http://source2.domain.com:8080";
  SPOOLMAN_DB_TYPE = "sqlite";
  SPOOLMAN_LOGGING_LEVEL = "DEBUG";
  SPOOLMAN_METRICS_ENABLED = "TRUE";
}
```

*Declared by:* [`nixos/modules/services/misc/spoolman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/spoolman.nix)

## `services.spoolman.listen` {#opt-services.spoolman.listen}

The IP address to bind the spoolman server to.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/spoolman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/spoolman.nix)

## `services.spoolman.openFirewall` {#opt-services.spoolman.openFirewall}

Open the appropriate ports in the firewall for spoolman.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/spoolman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/spoolman.nix)

## `services.spoolman.port` {#opt-services.spoolman.port}

TCP port where spoolman web-gui listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `7912`

*Declared by:* [`nixos/modules/services/misc/spoolman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/spoolman.nix)

## `services.spotifyd.config` {#opt-services.spotifyd.config}

(Deprecated) Configuration for Spotifyd. For syntax and directives, see
[https://docs.spotifyd.rs/configuration/index.html#config-file](https://docs.spotifyd.rs/configuration/index.html#config-file).

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/audio/spotifyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/spotifyd.nix)

## `services.spotifyd.enable` {#opt-services.spotifyd.enable}

Whether to enable spotifyd, a Spotify playing daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/spotifyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/spotifyd.nix)

## `services.spotifyd.package` {#opt-services.spotifyd.package}

The spotifyd package to use.

*Type:* package

*Default:* `pkgs.spotifyd`

*Declared by:* [`nixos/modules/services/audio/spotifyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/spotifyd.nix)

## `services.spotifyd.settings` {#opt-services.spotifyd.settings}

Configuration for Spotifyd. For syntax and directives, see
[https://docs.spotifyd.rs/configuration/index.html#config-file](https://docs.spotifyd.rs/configuration/index.html#config-file).

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  global = {
    bitrate = 320;
  };
}
```

*Declared by:* [`nixos/modules/services/audio/spotifyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/spotifyd.nix)

## `services.squeezelite.enable` {#opt-services.squeezelite.enable}

Whether to enable Squeezelite, a software Squeezebox emulator.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/squeezelite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/squeezelite.nix)

## `services.squeezelite.extraArgs` {#opt-services.squeezelite.extraArgs}

Additional command line arguments to pass to Squeezelite.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/audio/squeezelite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/squeezelite.nix)

## `services.squeezelite.mutableName` {#opt-services.squeezelite.mutableName}

store name in file, controllable by server

*Type:* boolean

*Default:* `config.services.squeezelite.name == null`

*Declared by:* [`nixos/modules/services/audio/squeezelite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/squeezelite.nix)

## `services.squeezelite.name` {#opt-services.squeezelite.name}

name to report to server

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/audio/squeezelite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/squeezelite.nix)

## `services.squeezelite.package` {#opt-services.squeezelite.package}

The squeezelite package to use.

*Type:* package

*Default:* `if config.services.squeezelite.pulseaudio.enable then pkgs.squeezelite-pulse else pkgs.squeezelite`

*Declared by:* [`nixos/modules/services/audio/squeezelite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/squeezelite.nix)

## `services.squeezelite.pulseaudio.enable` {#opt-services.squeezelite.pulseaudio.enable}

Whether to enable pulseaudio support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/squeezelite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/squeezelite.nix)

## `services.squeezelite.pulseaudio.group` {#opt-services.squeezelite.pulseaudio.group}

group for accessing to pulseaudio socket

*Type:* string

*Default:* `if config.services.pulseaudio.systemWide then "pulse-access" else "pipewire"`

*Declared by:* [`nixos/modules/services/audio/squeezelite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/squeezelite.nix)

## `services.squid.configText` {#opt-services.squid.configText}

Verbatim contents of squid.conf. If null (default), use the
autogenerated file from NixOS instead.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/squid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/squid.nix)

## `services.squid.enable` {#opt-services.squid.enable}

Whether to run squid web proxy.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/squid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/squid.nix)

## `services.squid.extraConfig` {#opt-services.squid.extraConfig}

Squid configuration. Contents will be added
verbatim to the configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/squid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/squid.nix)

## `services.squid.package` {#opt-services.squid.package}

The squid package to use.

*Type:* package

*Default:* `pkgs.squid`

*Declared by:* [`nixos/modules/services/networking/squid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/squid.nix)

## `services.squid.proxyAddress` {#opt-services.squid.proxyAddress}

IP address on which squid will listen.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/squid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/squid.nix)

## `services.squid.proxyPort` {#opt-services.squid.proxyPort}

TCP port on which squid will listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3128`

*Declared by:* [`nixos/modules/services/networking/squid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/squid.nix)

## `services.squid.validateConfig` {#opt-services.squid.validateConfig}

Validate config syntax.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/squid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/squid.nix)

## `services.ssh-agent-switcher.enable` {#opt-services.ssh-agent-switcher.enable}

Whether to enable ssh-agent-switcher, a daemon that proxies SSH agent
connections to forwarded agents. This allows tmux/screen sessions to
access SSH agents across reconnections.

This is a per-user service that automatically starts when you log in
via SSH and sets SSH\_AUTH\_SOCK to point to a stable socket location.

Note: This only activates for SSH sessions, not graphical or console logins.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/ssh-agent-switcher.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/ssh-agent-switcher.nix)

## `services.ssh-agent-switcher.package` {#opt-services.ssh-agent-switcher.package}

The ssh-agent-switcher package to use.

*Type:* package

*Default:* `pkgs.ssh-agent-switcher`

*Declared by:* [`nixos/modules/services/security/ssh-agent-switcher.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/ssh-agent-switcher.nix)

## `services.sshd.enable` {#opt-services.sshd.enable}

Alias of [`services.openssh.enable`](../../options/services-o/index.md#opt-services.openssh.enable).

*Type:* boolean

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.sshguard.attack_threshold` {#opt-services.sshguard.attack_threshold}

Block attackers when their cumulative attack score exceeds threshold. Most attacks have a score of 10.

*Type:* signed integer

*Default:* `30`

*Declared by:* [`nixos/modules/services/security/sshguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/sshguard.nix)

## `services.sshguard.blacklist_file` {#opt-services.sshguard.blacklist_file}

Blacklist an attacker when its score exceeds threshold. Blacklisted addresses are loaded from and added to blacklist-file.

*Type:* absolute path

*Default:* `"/var/lib/sshguard/blacklist.db"`

*Declared by:* [`nixos/modules/services/security/sshguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/sshguard.nix)

## `services.sshguard.blacklist_threshold` {#opt-services.sshguard.blacklist_threshold}

Blacklist an attacker when its score exceeds threshold. Blacklisted addresses are loaded from and added to blacklist-file.

*Type:* null or signed integer

*Default:* `null`

*Example:* `120`

*Declared by:* [`nixos/modules/services/security/sshguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/sshguard.nix)

## `services.sshguard.blocktime` {#opt-services.sshguard.blocktime}

Block attackers for initially blocktime seconds after exceeding threshold. Subsequent blocks increase by a factor of 1.5.

sshguard unblocks attacks at random intervals, so actual block times will be longer.

*Type:* signed integer

*Default:* `120`

*Declared by:* [`nixos/modules/services/security/sshguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/sshguard.nix)

## `services.sshguard.detection_time` {#opt-services.sshguard.detection_time}

Remember potential attackers for up to detection\_time seconds before resetting their score.

*Type:* signed integer

*Default:* `1800`

*Declared by:* [`nixos/modules/services/security/sshguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/sshguard.nix)

## `services.sshguard.enable` {#opt-services.sshguard.enable}

Whether to enable the sshguard service.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/sshguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/sshguard.nix)

## `services.sshguard.services` {#opt-services.sshguard.services}

Systemd services sshguard should receive logs of.

*Type:* list of string

*Default:*

``` nix
[
  "sshd"
]
```

*Example:*

``` nix
[
  "sshd"
  "exim"
]
```

*Declared by:* [`nixos/modules/services/security/sshguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/sshguard.nix)

## `services.sshguard.whitelist` {#opt-services.sshguard.whitelist}

Whitelist a list of addresses, hostnames, or address blocks.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "198.51.100.56"
  "198.51.100.2"
]
```

*Declared by:* [`nixos/modules/services/security/sshguard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/sshguard.nix)

## `services.sshwifty.enable` {#opt-services.sshwifty.enable}

Whether to enable Sshwifty.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/sshwifty.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sshwifty.nix)

## `services.sshwifty.package` {#opt-services.sshwifty.package}

The sshwifty package to use.

*Type:* package

*Default:* `pkgs.sshwifty`

*Declared by:* [`nixos/modules/services/web-apps/sshwifty.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sshwifty.nix)

## `services.sshwifty.settings` {#opt-services.sshwifty.settings}

Configuration for Sshwifty. See
[the Sshwifty documentation](https://github.com/nirui/sshwifty/tree/master?tab=readme-ov-file#configuration)
for possible options.

*Type:* JSON value

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/sshwifty.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sshwifty.nix)

## `services.sshwifty.sharedKeyFile` {#opt-services.sshwifty.sharedKeyFile}

Path to a file containing the shared key.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/sshwifty.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sshwifty.nix)

## `services.sshwifty.socks5PasswordFile` {#opt-services.sshwifty.socks5PasswordFile}

Path to a file containing the SOCKS5 password.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/sshwifty.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sshwifty.nix)

## `services.sslh.enable` {#opt-services.sslh.enable}

Whether to enable sslh, protocol demultiplexer.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/sslh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sslh.nix)

## `services.sslh.listenAddresses` {#opt-services.sslh.listenAddresses}

Listening addresses or hostnames.

*Type:* (list of string) or string convertible to it

*Default:*

``` nix
[
  "0.0.0.0"
  "[::]"
]
```

*Declared by:* [`nixos/modules/services/networking/sslh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sslh.nix)

## `services.sslh.method` {#opt-services.sslh.method}

The method to use for handling connections:

- `fork` forks a new process for each incoming connection. It is
  well-tested and very reliable, but incurs the overhead of many
  processes.

- `select` uses only one thread, which monitors all connections at once.
  It has lower overhead per connection, but if it stops, you'll lose all
  connections.

- `ev` is implemented using libev, it's similar to `select` but
  scales better to a large number of connections.

*Type:* one of "fork", "select", "ev"

*Default:* `"fork"`

*Declared by:* [`nixos/modules/services/networking/sslh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sslh.nix)

## `services.sslh.port` {#opt-services.sslh.port}

Listening port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `443`

*Declared by:* [`nixos/modules/services/networking/sslh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sslh.nix)

## `services.sslh.settings` {#opt-services.sslh.settings}

sslh configuration. See `sslh(8)` for available settings.

*Type:* open submodule of attribute set of (libconfig value)

*Declared by:* [`nixos/modules/services/networking/sslh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sslh.nix)

## `services.sslh.settings.numeric` {#opt-services.sslh.settings.numeric}

Whether to disable reverse DNS lookups, thus keeping IP
address literals in the log.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/sslh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sslh.nix)

## `services.sslh.settings.protocols` {#opt-services.sslh.settings.protocols}

List of protocols sslh will probe for and redirect.
Each protocol entry consists of:

- `name`: name of the probe.

- `service`: libwrap service name (see `hosts_access(5)`),

- `host`, `port`: where to connect when this probe succeeds,

- `log_level`: to log incoming connections,

- `transparent`: proxy this protocol transparently,

- etc.

See the documentation for all options, including probe-specific ones.

*Type:* list of attribute set of (libconfig value)

*Default:*

``` nix
[
  {
    host = "localhost";
    name = "ssh";
    port = "22";
    service = "ssh";
  }
  {
    host = "localhost";
    name = "openvpn";
    port = "1194";
  }
  {
    host = "localhost";
    name = "xmpp";
    port = "5222";
  }
  {
    host = "localhost";
    name = "http";
    port = "80";
  }
  {
    host = "localhost";
    name = "tls";
    port = "443";
  }
  {
    host = "localhost";
    name = "anyprot";
    port = "443";
  }
]
```

*Declared by:* [`nixos/modules/services/networking/sslh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sslh.nix)

## `services.sslh.settings.timeout` {#opt-services.sslh.settings.timeout}

Timeout in seconds.

*Type:* unsigned integer, meaning \>=0

*Default:* `2`

*Declared by:* [`nixos/modules/services/networking/sslh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sslh.nix)

## `services.sslh.settings.transparent` {#opt-services.sslh.settings.transparent}

Whether the services behind sslh (Apache, sshd and so on) will see the
external IP and ports as if the external world connected directly to
them.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/sslh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sslh.nix)

## `services.sslh.settings.verbose-connections` {#opt-services.sslh.settings.verbose-connections}

Where to log connections information. Possible values are:

0. don't log anything
1. write log to stdout
2. write log to syslog
3. write log to both stdout and syslog
4. write to a log file (`sslh.settings.logfile`)

*Type:* integer between 0 and 4 (both inclusive)

*Default:* `0`

*Declared by:* [`nixos/modules/services/networking/sslh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sslh.nix)

## `services.sslmate-agent.enable` {#opt-services.sslmate-agent.enable}

Whether to enable sslmate-agent, a daemon for managing SSL/TLS certificates on a server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/sslmate-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/sslmate-agent.nix)

## `services.sssd.config` {#opt-services.sssd.config}

Contents of `sssd.conf`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  [sssd]
  services = nss, pam
  domains = shadowutils
  
  [nss]
  
  [pam]
  
  [domain/shadowutils]
  id_provider = proxy
  proxy_lib_name = files
  auth_provider = proxy
  proxy_pam_target = sssd-shadowutils
  proxy_fast_alias = True
''
```

*Declared by:* [`nixos/modules/services/misc/sssd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/sssd.nix)

## `services.sssd.enable` {#opt-services.sssd.enable}

Whether to enable the System Security Services Daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/sssd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/sssd.nix)

## `services.sssd.environmentFile` {#opt-services.sssd.environmentFile}

Environment file as defined in `systemd.exec(5)`.

Secrets may be passed to the service without adding them to the world-readable
Nix store, by specifying placeholder variables as the option value in Nix and
setting these variables accordingly in the environment file.

```
  # snippet of sssd-related config
  [domain/LDAP]
  ldap_default_authtok = $SSSD_LDAP_DEFAULT_AUTHTOK
```

```
  # contents of the environment file
  SSSD_LDAP_DEFAULT_AUTHTOK=verysecretpassword
```

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/sssd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/sssd.nix)

## `services.sssd.kcm` {#opt-services.sssd.kcm}

Whether to use SSS as a Kerberos Cache Manager (KCM).
Kerberos will be configured to cache credentials in SSS.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/sssd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/sssd.nix)

## `services.sssd.settings` {#opt-services.sssd.settings}

Contents of `sssd.conf`.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  "domain/shadowutils" = {
    auth_provider = "proxy";
    id_provider = "proxy";
    proxy_fast_alias = true;
    proxy_lib_name = "files";
    proxy_pam_target = "sssd-shadowutils";
  };
  nss = { };
  pam = { };
  sssd = {
    domains = "shadowutils";
    services = "nss, pam";
  };
}
```

*Declared by:* [`nixos/modules/services/misc/sssd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/sssd.nix)

## `services.sssd.sshAuthorizedKeysIntegration` {#opt-services.sssd.sshAuthorizedKeysIntegration}

Whether to make sshd look up authorized keys from SSS.
For this to work, the `ssh` SSS service must be enabled in the sssd configuration.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/sssd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/sssd.nix)

## `services.sssd.subIDsIntegration` {#opt-services.sssd.subIDsIntegration}

Whether to use SSS as a source for subuid and subgid.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/sssd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/sssd.nix)

## `services.sstorytime.configDir` {#opt-services.sstorytime.configDir}

Directory that contains configuration files to be installed under
`/etc/sstorytime`.

*Type:* absolute path

*Default:* `"${config.services.sstorytime.package}/share/SSTconfig"`

*Declared by:* [`nixos/modules/services/web-apps/sstorytime.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sstorytime.nix)

## `services.sstorytime.database.createLocally` {#opt-services.sstorytime.database.createLocally}

Local PostgreSQL role/database `sstoryline` and default
`settings.POSTGRESQL_URI` using the Unix socket at
`/run/postgresql` (peer auth as user `sstoryline`).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/sstorytime.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sstorytime.nix)

## `services.sstorytime.enable` {#opt-services.sstorytime.enable}

Whether to enable SSTorytime, a unified graph process for mapping knowledge.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/sstorytime.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sstorytime.nix)

## `services.sstorytime.environmentFile` {#opt-services.sstorytime.environmentFile}

Optional EnvironmentFile (e.g. secrets for `POSTGRESQL_URI` via sops).
Used by the service and by `sstorytime-run`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/sstorytime.env"`

*Declared by:* [`nixos/modules/services/web-apps/sstorytime.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sstorytime.nix)

## `services.sstorytime.httpPort` {#opt-services.sstorytime.httpPort}

HTTP listen port (redirects to HTTPS).

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/web-apps/sstorytime.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sstorytime.nix)

## `services.sstorytime.httpsPort` {#opt-services.sstorytime.httpsPort}

HTTPS listen port for the web UI and API.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8443`

*Declared by:* [`nixos/modules/services/web-apps/sstorytime.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sstorytime.nix)

## `services.sstorytime.openFirewall` {#opt-services.sstorytime.openFirewall}

Whether to enable opening the SSTorytime ports in the firewall.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/sstorytime.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sstorytime.nix)

## `services.sstorytime.package` {#opt-services.sstorytime.package}

The sstorytime package to use.

*Type:* package

*Default:* `pkgs.sstorytime`

*Declared by:* [`nixos/modules/services/web-apps/sstorytime.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sstorytime.nix)

## `services.sstorytime.settings` {#opt-services.sstorytime.settings}

Environment for the service and `sstorytime-run`.
Null values are omitted. Extra freeform keys are passed through as
additional environment variables.

*Type:* open submodule of attribute set of (null or string)

*Default:* `{ }`

*Example:*

``` nix
{
  POSTGRESQL_URI = "postgresql://sstoryline@/sstoryline?host=/run/postgresql";
}
```

*Declared by:* [`nixos/modules/services/web-apps/sstorytime.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sstorytime.nix)

## `services.sstorytime.settings.POSTGRESQL_URI` {#opt-services.sstorytime.settings.POSTGRESQL_URI}

PostgreSQL connection URI. When
`database.createLocally` is true, defaults to a peer-auth
socket URI. For remote databases prefer
`environmentFile` if the URI contains secrets.

*Type:* null or string

*Default:* `null`

*Example:* `"postgresql://sstoryline@/sstoryline?host=/run/postgresql"`

*Declared by:* [`nixos/modules/services/web-apps/sstorytime.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sstorytime.nix)

## `services.sstorytime.settings.SST_CONFIG_PATH` {#opt-services.sstorytime.settings.SST_CONFIG_PATH}

Directory of SSTconfig ontology files (arrows, closures, …).
Defaults to `/etc/sstorytime` when the service is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"/etc/sstorytime"`

*Declared by:* [`nixos/modules/services/web-apps/sstorytime.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/sstorytime.nix)

## `services.stalwart.credentials` {#opt-services.stalwart.credentials}

Credentials envs used to configure Stalwart secrets.
These secrets can be accessed in configuration values with
the macros such as
`%{file:/run/credentials/stalwart.service/VAR_NAME}%`.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
{
  user_admin_password = "/run/keys/stalwart_admin_password";
}
```

*Declared by:* [`nixos/modules/services/mail/stalwart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/stalwart.nix)

## `services.stalwart.dataDir` {#opt-services.stalwart.dataDir}

Data directory for stalwart

*Type:* absolute path

*Default:* `/var/lib/${if lib.versionOlder config.services.stalwart.stateVersion "26.05" then "stalwart-mail" else "stalwart"}`

*Declared by:* [`nixos/modules/services/mail/stalwart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/stalwart.nix)

## `services.stalwart.enable` {#opt-services.stalwart.enable}

Whether to enable the all-in-one collaboration and mail server, Stalwart.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/stalwart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/stalwart.nix)

## `services.stalwart.group` {#opt-services.stalwart.group}

Group ownership of service

*Type:* string

*Default:* `if lib.versionOlder config.services.stalwart.stateVersion "26.05" then "stalwart-mail" else "stalwart"`

*Declared by:* [`nixos/modules/services/mail/stalwart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/stalwart.nix)

## `services.stalwart.openFirewall` {#opt-services.stalwart.openFirewall}

Whether to open TCP firewall ports, which are specified in
`services.stalwart.settings.server.listener` on all interfaces.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/mail/stalwart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/stalwart.nix)

## `services.stalwart.package` {#opt-services.stalwart.package}

The stalwart package to use.

*Type:* package

*Default:* `pkgs.stalwart`

*Declared by:* [`nixos/modules/services/mail/stalwart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/stalwart.nix)

## `services.stalwart.settings` {#opt-services.stalwart.settings}

Configuration options for the Stalwart server.
See [https://stalw.art/docs/configuration](https://stalw.art/docs/configuration) for available options.

By default, the module is configured to store everything locally.

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/mail/stalwart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/stalwart.nix)

## `services.stalwart.stateVersion` {#opt-services.stalwart.stateVersion}

The version of this module (=version of NixOS) when this module was first enabled on this particular machine, used to maintain compatibility with application data created on older versions of this module.

See [`system.stateVersion`](../../options/system/index.md#opt-system.stateVersion) for details on the NixOS-global equivalent to this option.

*Type:* string

*Declared by:* [`nixos/modules/services/mail/stalwart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/stalwart.nix)

## `services.stalwart.user` {#opt-services.stalwart.user}

User ownership of service

*Type:* string

*Default:* `if lib.versionOlder config.services.stalwart.stateVersion "26.05" then "stalwart-mail" else "stalwart"`

*Declared by:* [`nixos/modules/services/mail/stalwart.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/stalwart.nix)

## `services.stargazer.allowCgiUser` {#opt-services.stargazer.allowCgiUser}

When enabled, the stargazer process will be given `CAP_SETGID`
and `CAP_SETUID` so that it can run cgi processes as a different
user. This is required if the `cgi-user` option is used for a route.
Note that these capabilities could allow privilege escalation so be
careful. For that reason, this is disabled by default.

You will need to create the user mentioned `cgi-user` if it does not
already exist.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/stargazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/stargazer.nix)

## `services.stargazer.certLifetime` {#opt-services.stargazer.certLifetime}

How long certs generated by Stargazer should live for.
Certs live forever by default.

*Type:* string

*Default:* `""`

*Example:* `"1y"`

*Declared by:* [`nixos/modules/services/web-servers/stargazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/stargazer.nix)

## `services.stargazer.certOrg` {#opt-services.stargazer.certOrg}

The name of the organization responsible for the X.509
certificate's /O name.

*Type:* string

*Default:* `"stargazer"`

*Declared by:* [`nixos/modules/services/web-servers/stargazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/stargazer.nix)

## `services.stargazer.connectionLogging` {#opt-services.stargazer.connectionLogging}

Whether or not to log connections to stdout.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-servers/stargazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/stargazer.nix)

## `services.stargazer.debugMode` {#opt-services.stargazer.debugMode}

Run Stargazer in debug mode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/stargazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/stargazer.nix)

## `services.stargazer.enable` {#opt-services.stargazer.enable}

Whether to enable Stargazer Gemini server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/stargazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/stargazer.nix)

## `services.stargazer.genCerts` {#opt-services.stargazer.genCerts}

Set to false to disable automatic certificate generation.
Use if you want to provide your own certs.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-servers/stargazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/stargazer.nix)

## `services.stargazer.group` {#opt-services.stargazer.group}

Group account under which stargazer runs.

*Type:* string

*Default:* `"stargazer"`

*Declared by:* [`nixos/modules/services/web-servers/stargazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/stargazer.nix)

## `services.stargazer.ipLog` {#opt-services.stargazer.ipLog}

Log client IP addresses in the connection log.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/stargazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/stargazer.nix)

## `services.stargazer.ipLogPartial` {#opt-services.stargazer.ipLogPartial}

Log partial client IP addresses in the connection log.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/stargazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/stargazer.nix)

## `services.stargazer.listen` {#opt-services.stargazer.listen}

Address and port to listen on.

*Type:* list of string

*Default:* `[ "0.0.0.0" ] ++ lib.optional config.networking.enableIPv6 "[::0]"`

*Example:* `[ "10.0.0.12" "[2002:a00:1::]" ]`

*Declared by:* [`nixos/modules/services/web-servers/stargazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/stargazer.nix)

## `services.stargazer.regenCerts` {#opt-services.stargazer.regenCerts}

Set to false to turn off automatic regeneration of expired certificates.
Use if you want to provide your own certs.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-servers/stargazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/stargazer.nix)

## `services.stargazer.requestTimeout` {#opt-services.stargazer.requestTimeout}

Number of seconds to wait for the client to send a complete
request. Set to 0 to disable.

*Type:* unsigned integer, meaning \>=0

*Default:* `5`

*Declared by:* [`nixos/modules/services/web-servers/stargazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/stargazer.nix)

## `services.stargazer.responseTimeout` {#opt-services.stargazer.responseTimeout}

Number of seconds to wait for the client to send a complete
request and for stargazer to finish sending the response.
Set to 0 to disable.

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Declared by:* [`nixos/modules/services/web-servers/stargazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/stargazer.nix)

## `services.stargazer.routes` {#opt-services.stargazer.routes}

Routes that Stargazer should server.

Expressed as a list of attribute sets. Each set must have a key `route`
that becomes the section name for that route in the stargazer ini cofig.
The remaining keys and values become the parameters for that route.

[Refer to upstream docs for other params](https://git.sr.ht/~zethra/stargazer/tree/main/item/doc/stargazer.ini.5.txt)

*Type:* list of (open submodule of attribute set of (INI atom (null, bool, int, float or string)))

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    route = "example.com";
    root = "/srv/gemini/example.com"
  }
  {
    route = "example.com:/man";
    root = "/cgi-bin";
    cgi = true;
  }
  {
    route = "other.org~(.*)";
    redirect = "gemini://example.com";
    rewrite = "\1";
  }
]
```

*Declared by:* [`nixos/modules/services/web-servers/stargazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/stargazer.nix)

## `services.stargazer.routes.*.route` {#opt-services.stargazer.routes._.route}

Route section name

*Type:* string

*Declared by:* [`nixos/modules/services/web-servers/stargazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/stargazer.nix)

## `services.stargazer.store` {#opt-services.stargazer.store}

Path to the certificate store on disk. This should be a
persistent directory writable by Stargazer.

*Type:* absolute path

*Default:* `"/var/lib/gemini/certs"`

*Declared by:* [`nixos/modules/services/web-servers/stargazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/stargazer.nix)

## `services.stargazer.user` {#opt-services.stargazer.user}

User account under which stargazer runs.

*Type:* string

*Default:* `"stargazer"`

*Declared by:* [`nixos/modules/services/web-servers/stargazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/stargazer.nix)

## `services.stash-clipboard.arguments` {#opt-services.stash-clipboard.arguments}

A list of arguments which are passed to `stash`. For a list of available arguments, run `stash --help`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--max-items 10"
]
```

*Declared by:* [`nixos/modules/services/misc/stash-clipboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/stash-clipboard.nix)

## `services.stash-clipboard.enable` {#opt-services.stash-clipboard.enable}

Whether to enable stash, a Wayland clipboard manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/stash-clipboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/stash-clipboard.nix)

## `services.stash-clipboard.excludedApps` {#opt-services.stash-clipboard.excludedApps}

List of application classes to exclude from the database.
Entries from these apps are still copied to the clipboard, but it will never be put inside the database.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "Bitwarden"
]
```

*Declared by:* [`nixos/modules/services/misc/stash-clipboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/stash-clipboard.nix)

## `services.stash-clipboard.filterFile` {#opt-services.stash-clipboard.filterFile}

Stash can be configured to avoid storing clipboard entries that match a sensitive pattern, using a regular expression.
The file set here should contain your regex pattern (no quotes).

Example regex to block common password patterns:

- (password|secret|api\[\_-\]?key|token)\[=: \]+\[^\\s\]+

*Type:* string

*Default:* `""`

*Example:* `"/etc/stash/clipboard_filter"`

*Declared by:* [`nixos/modules/services/misc/stash-clipboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/stash-clipboard.nix)

## `services.stash-clipboard.package` {#opt-services.stash-clipboard.package}

The stash-clipboard package to use.

*Type:* package

*Default:* `pkgs.stash-clipboard`

*Declared by:* [`nixos/modules/services/misc/stash-clipboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/stash-clipboard.nix)

## `services.stash-clipboard.serviceArguments` {#opt-services.stash-clipboard.serviceArguments}

A list of arguments which are passed to `stash watch`. For a list of available arguments, run `stash watch --help`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--persist"
]
```

*Declared by:* [`nixos/modules/services/misc/stash-clipboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/stash-clipboard.nix)

## `services.stash.dataDir` {#opt-services.stash.dataDir}

The directory where Stash stores its files.

*Type:* absolute path

*Default:* `"/var/lib/stash"`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.enable` {#opt-services.stash.enable}

Whether to enable stash.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.group` {#opt-services.stash.group}

Group under which Stash runs.

*Type:* string

*Default:* `"stash"`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.jwtSecretKeyFile` {#opt-services.stash.jwtSecretKeyFile}

Path to file containing a secret used to sign JWT tokens.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.mutablePlugins` {#opt-services.stash.mutablePlugins}

Whether to enable Whether plugins/themes can be installed, updated, uninstalled manually..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.mutableScrapers` {#opt-services.stash.mutableScrapers}

Whether to enable Whether scrapers can be installed, updated, uninstalled manually..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.mutableSettings` {#opt-services.stash.mutableSettings}

Whether the Stash config.yml is writeable by Stash.

If `false`, Any config changes done from within Stash UI will be temporary and reset to those defined in [`services.stash.settings`](#opt-services.stash.settings) upon `Stash.service` restart.
If `true`, the [`services.stash.settings`](#opt-services.stash.settings) will only be used to initialize the Stash configuration if it does not exist, and are subsequently ignored.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.openFirewall` {#opt-services.stash.openFirewall}

Open ports in the firewall for the Stash web interface.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.package` {#opt-services.stash.package}

The stash package to use.

*Type:* package

*Default:* `pkgs.stash`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.passwordFile` {#opt-services.stash.passwordFile}

Path to file containing password for login.

::: {.warning}
This option takes precedence over `services.stash.settings.password`
::

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/path/to/password/file"`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.plugins` {#opt-services.stash.plugins}

The plugins Stash should be started with.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.scrapers` {#opt-services.stash.scrapers}

The scrapers Stash should be started with.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.sessionStoreKeyFile` {#opt-services.stash.sessionStoreKeyFile}

Path to file containing a secret for session store.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings` {#opt-services.stash.settings}

Stash configuration

*Type:* open submodule of (YAML 1.1 value)

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.blobs_path` {#opt-services.stash.settings.blobs_path}

Path to blobs

*Type:* absolute path

*Default:* `"/var/lib/stash/blobs"`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.blobs_storage` {#opt-services.stash.settings.blobs_storage}

Where to store blobs

*Type:* one of "FILESYSTEM", "DATABASE"

*Default:* `"FILESYSTEM"`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.cache` {#opt-services.stash.settings.cache}

Path to cache

*Type:* absolute path

*Default:* `"/var/lib/stash/cache"`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.calculate_md5` {#opt-services.stash.settings.calculate_md5}

Whether to calculate MD5 checksums for scene video files

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.create_image_clip_from_videos` {#opt-services.stash.settings.create_image_clip_from_videos}

Create Image Clips from Video extensions when Videos are disabled in Library

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.dangerous_allow_public_without_auth` {#opt-services.stash.settings.dangerous_allow_public_without_auth}

Learn more at [https://docs.stashapp.cc/networking/authentication-required-when-accessing-stash-from-the-internet/](https://docs.stashapp.cc/networking/authentication-required-when-accessing-stash-from-the-internet/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.database` {#opt-services.stash.settings.database}

Path to the SQLite database

*Type:* absolute path

*Default:* `"/var/lib/stash/go.sqlite"`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.gallery_cover_regex` {#opt-services.stash.settings.gallery_cover_regex}

Regex used to identify images as gallery covers

*Type:* string

*Default:* `"(poster|cover|folder|board)\\.[^.]+$"`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.generated` {#opt-services.stash.settings.generated}

Path to generated files

*Type:* absolute path

*Default:* `"/var/lib/stash/generated"`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.host` {#opt-services.stash.settings.host}

The ip address that Stash should bind to.

*Type:* string

*Default:* `"localhost"`

*Example:* `"::1"`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.no_proxy` {#opt-services.stash.settings.no_proxy}

A list of domains for which the proxy must not be used

*Type:* string

*Default:* `"localhost,127.0.0.1,192.168.0.0/16,10.0.0.0/8,172.16.0.0/12"`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.nobrowser` {#opt-services.stash.settings.nobrowser}

If we should not auto-open a browser window on startup

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.notifications_enabled` {#opt-services.stash.settings.notifications_enabled}

If we should send notifications to the desktop

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.parallel_tasks` {#opt-services.stash.settings.parallel_tasks}

Number of parallel tasks to start during scan/generate

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.plugins_path` {#opt-services.stash.settings.plugins_path}

Path to scrapers

*Type:* absolute path

*Default:* `"/var/lib/stash/plugins"`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.port` {#opt-services.stash.settings.port}

The port that Stash should listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9999`

*Example:* `1234`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.preview_audio` {#opt-services.stash.settings.preview_audio}

Include audio stream in previews

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.preview_exclude_end` {#opt-services.stash.settings.preview_exclude_end}

Duration of start of video to exclude when generating previews

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.preview_exclude_start` {#opt-services.stash.settings.preview_exclude_start}

Duration of end of video to exclude when generating previews

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.preview_segment_duration` {#opt-services.stash.settings.preview_segment_duration}

Preview segment duration, in seconds

*Type:* floating point number

*Default:* `0.75`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.preview_segments` {#opt-services.stash.settings.preview_segments}

Number of segments in a preview file

*Type:* signed integer

*Default:* `12`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.scrapers_path` {#opt-services.stash.settings.scrapers_path}

Path to scrapers

*Type:* absolute path

*Default:* `"/var/lib/stash/scrapers"`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.security_tripwire_accessed_from_public_internet` {#opt-services.stash.settings.security_tripwire_accessed_from_public_internet}

Learn more at [https://docs.stashapp.cc/networking/authentication-required-when-accessing-stash-from-the-internet/](https://docs.stashapp.cc/networking/authentication-required-when-accessing-stash-from-the-internet/)

*Type:* null or string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.sequential_scanning` {#opt-services.stash.settings.sequential_scanning}

Modifies behaviour of the scanning functionality to generate support files (previews/sprites/phash) at the same time as fingerprinting/screenshotting

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.show_one_time_moved_notification` {#opt-services.stash.settings.show_one_time_moved_notification}

Whether a small notification to inform the user that Stash will no longer show a terminal window, and instead will be available in the tray

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.sound_on_preview` {#opt-services.stash.settings.sound_on_preview}

Enable sound on mouseover previews

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.stash` {#opt-services.stash.settings.stash}

Add directories containing your adult videos and images.
Stash will use these directories to find videos and/or images during scanning.

*Type:* list of (submodule)

*Example:*

``` nix
{
  stash = [
    {
      Path = "/media/drive/videos";
      ExcludeImage = true;
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.stash.*.excludeimage` {#opt-services.stash.settings.stash._.excludeimage}

Whether to exclude image files from being scanned into Stash

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.stash.*.excludevideo` {#opt-services.stash.settings.stash._.excludevideo}

Whether to exclude video files from being scanned into Stash

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.stash.*.path` {#opt-services.stash.settings.stash._.path}

location of your media files

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.stash_boxes` {#opt-services.stash.settings.stash_boxes}

Stash-box facilitates automated tagging of scenes and performers based on fingerprints and filenames

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
{
  stash_boxes = [
    {
      name = "StashDB";
      endpoint = "https://stashdb.org/graphql";
      apikey = "aaaaaaaaaaaa.bbbbbbbbbbbbbbbbbbbbbbbb.cccccccccccccc";
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.stash_boxes.*.apikey` {#opt-services.stash.settings.stash_boxes._.apikey}

Stash Box API key

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.stash_boxes.*.endpoint` {#opt-services.stash.settings.stash_boxes._.endpoint}

URL to the Stash Box graphql api

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.stash_boxes.*.name` {#opt-services.stash.settings.stash_boxes._.name}

The name of the Stash Box

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.theme_color` {#opt-services.stash.settings.theme_color}

Sets the `theme-color` property in the UI

*Type:* string

*Default:* `"#202b33"`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.ui.frontPageContent` {#opt-services.stash.settings.ui.frontPageContent}

Search filters to display on the front page.

*Type:* (list of (attribute set)) or function that evaluates to a(n) list of (attribute set)

*Default:* `<function>`

*Example:*

``` nix
presets: [
  # To get the savedFilterId, you can query `{ findSavedFilters(mode: <FilterMode>) { id name } }` on localhost:9999/graphql
  {
    __typename = "SavedFilter";
    savedFilterId = 1;
  }
  # basic custom filter
  {
    __typename = "CustomFilter";
    title = "Random Scenes";
    mode = "SCENES";
    sortBy = "random";
    direction = "DESC";
  }
  presets.recentlyAddedImages
]
```

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.video_file_naming_algorithm` {#opt-services.stash.settings.video_file_naming_algorithm}

Hash algorithm to use for generated file naming

*Type:* one of "OSHASH", "MD5"

*Default:* `"OSHASH"`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.settings.write_image_thumbnails` {#opt-services.stash.settings.write_image_thumbnails}

Write image thumbnails to disk when generating on the fly

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.user` {#opt-services.stash.user}

User under which Stash runs.

*Type:* string

*Default:* `"stash"`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.stash.username` {#opt-services.stash.username}

Username for login.

::: {.warning}
This option takes precedence over `services.stash.settings.username`
::

*Type:* null or non-empty string

*Default:* `null`

*Example:* `"admin"`

*Declared by:* [`nixos/modules/services/web-apps/stash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stash.nix)

## `services.static-web-server.configuration` {#opt-services.static-web-server.configuration}

Configuration for Static Web Server. See
[https://static-web-server.net/configuration/config-file/](https://static-web-server.net/configuration/config-file/).
NOTE: Don't set "host", "port", or "root" here. They will be ignored.
Use the top-level "listen" and "root" options instead.

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  general = {
    directory-listing = true;
    log-level = "error";
  };
}
```

*Declared by:* [`nixos/modules/services/web-servers/static-web-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/static-web-server.nix)

## `services.static-web-server.enable` {#opt-services.static-web-server.enable}

Whether to enable Static Web Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/static-web-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/static-web-server.nix)

## `services.static-web-server.listen` {#opt-services.static-web-server.listen}

The `systemd.socket(5)` "ListenStream" used in static-web-server.socket.
This is equivalent to SWS's "host" and "port" options.
See here for specific syntax: [https://www.freedesktop.org/software/systemd/man/systemd.socket.html#ListenStream=](https://www.freedesktop.org/software/systemd/man/systemd.socket.html#ListenStream=)

*Type:* string

*Default:* `"[::]:8787"`

*Declared by:* [`nixos/modules/services/web-servers/static-web-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/static-web-server.nix)

## `services.static-web-server.root` {#opt-services.static-web-server.root}

The location of files for SWS to serve. Equivalent to SWS's "root" config value.
NOTE: This folder must exist before starting SWS.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-servers/static-web-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/static-web-server.nix)

## `services.step-ca.address` {#opt-services.step-ca.address}

The address (without port) the certificate authority should listen at.
This combined with [`services.step-ca.port`](#opt-services.step-ca.port) overrides `services.step-ca.settings.address`.

*Type:* string

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/security/step-ca.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/step-ca.nix)

## `services.step-ca.enable` {#opt-services.step-ca.enable}

Whether to enable the smallstep certificate authority server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/step-ca.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/step-ca.nix)

## `services.step-ca.extraArgs` {#opt-services.step-ca.extraArgs}

Ad-hoc command-line arguments passed to the service at startup.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--resolver=10.1.2.3:53"
  "--quiet"
]
```

*Declared by:* [`nixos/modules/services/security/step-ca.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/step-ca.nix)

## `services.step-ca.intermediatePasswordFile` {#opt-services.step-ca.intermediatePasswordFile}

Path to the file containing the password for the intermediate
certificate private key.

::: warning
Make sure to use a quoted absolute path instead of a path literal
to prevent it from being copied to the globally readable Nix
store.
:::

*Type:* null or absolute path not in the Nix store

*Default:* `null`

*Example:* `"/run/keys/smallstep-password"`

*Declared by:* [`nixos/modules/services/security/step-ca.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/step-ca.nix)

## `services.step-ca.openFirewall` {#opt-services.step-ca.openFirewall}

Whether to enable opening the certificate authority server port.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/step-ca.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/step-ca.nix)

## `services.step-ca.package` {#opt-services.step-ca.package}

The step-ca package to use.

*Type:* package

*Default:* `pkgs.step-ca`

*Declared by:* [`nixos/modules/services/security/step-ca.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/step-ca.nix)

## `services.step-ca.port` {#opt-services.step-ca.port}

The port the certificate authority should listen on.
This combined with [`services.step-ca.address`](#opt-services.step-ca.address) overrides `services.step-ca.settings.address`.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Example:* `8443`

*Declared by:* [`nixos/modules/services/security/step-ca.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/step-ca.nix)

## `services.step-ca.settings` {#opt-services.step-ca.settings}

Settings that go into `ca.json`. See
[the step-ca manual](https://smallstep.com/docs/step-ca/configuration)
for more information. The easiest way to
configure this module would be to run `step ca init`
to generate `ca.json` and then import it using
`builtins.fromJSON`.
[This article](https://smallstep.com/docs/step-cli/basic-crypto-operations#run-an-offline-x509-certificate-authority)
may also be useful if you want to customize certain aspects of
certificate generation for your CA.
You need to change the database storage path to `/var/lib/step-ca/db`.

::: warning
The `services.step-ca.settings.address` option
will be ignored and overwritten by
[`services.step-ca.address`](#opt-services.step-ca.address) and
[`services.step-ca.port`](#opt-services.step-ca.port).
:::

*Type:* attribute set of anything

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/step-ca.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/step-ca.nix)

## `services.stirling-pdf.enable` {#opt-services.stirling-pdf.enable}

Whether to enable the stirling-pdf service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/stirling-pdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stirling-pdf.nix)

## `services.stirling-pdf.environment` {#opt-services.stirling-pdf.environment}

Environment variables for the stirling-pdf app.
See [https://docs.stirlingpdf.com/Configuration/](https://docs.stirlingpdf.com/Configuration/) for available options.

*Type:* attribute set of (string or signed integer or boolean)

*Default:* `{ }`

*Example:*

``` nix
{
  INSTALL_BOOK_AND_ADVANCED_HTML_OPS = true;
  SERVER_PORT = 8080;
}
```

*Declared by:* [`nixos/modules/services/web-apps/stirling-pdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stirling-pdf.nix)

## `services.stirling-pdf.environmentFiles` {#opt-services.stirling-pdf.environmentFiles}

Files containing additional environment variables to pass to Stirling PDF.
Secrets should be added in environmentFiles instead of environment.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/stirling-pdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stirling-pdf.nix)

## `services.stirling-pdf.package` {#opt-services.stirling-pdf.package}

The stirling-pdf package to use.

*Type:* package

*Default:* `pkgs.stirling-pdf`

*Declared by:* [`nixos/modules/services/web-apps/stirling-pdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stirling-pdf.nix)

## `services.stratis.enable` {#opt-services.stratis.enable}

Whether to enable Stratis Storage - Easy to use local storage management for Linux.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/tasks/stratis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/stratis.nix)

## `services.strfry.enable` {#opt-services.strfry.enable}

Whether to enable strfry.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/strfry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strfry.nix)

## `services.strfry.package` {#opt-services.strfry.package}

The strfry package to use.

*Type:* package

*Default:* `pkgs.strfry`

*Declared by:* [`nixos/modules/services/web-apps/strfry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strfry.nix)

## `services.strfry.settings` {#opt-services.strfry.settings}

Configuration options to set for the Strfry service. See [https://github.com/hoytech/strfry](https://github.com/hoytech/strfry) for documentation.

*Type:* JSON value

*Default:*

``` nix
{
  db = "/var/lib/strfry";
  dbParams = {
    mapsize = 10995116277760;
    maxreaders = 256;
    noReadAhead = false;
  };
  events = {
    ephemeralEventsLifetimeSeconds = 300;
    maxEventSize = 65536;
    maxNumTags = 2000;
    maxTagValSize = 1024;
    rejectEphemeralEventsOlderThanSeconds = 60;
    rejectEventsNewerThanSeconds = 900;
    rejectEventsOlderThanSeconds = 94608000;
  };
  relay = {
    autoPingSeconds = 55;
    bind = "127.0.0.1";
    compression = {
      enabled = true;
      slidingWindow = true;
    };
    enableTcpKeepalive = false;
    info = {
      contact = "";
      description = "This is a strfry instance.";
      icon = "";
      name = "strfry default";
      nips = "";
      pubkey = "";
    };
    logging = {
      dbScanPerf = false;
      dumpInAll = false;
      dumpInEvents = false;
      dumpInReqs = false;
      invalidEvents = true;
    };
    maxFilterLimit = 500;
    maxReqFilterSize = 200;
    maxSubsPerConnection = 20;
    maxWebsocketPayloadSize = 131072;
    negentropy = {
      enabled = true;
      maxSyncEvents = 1000000;
    };
    nofiles = 1000000;
    numThreads = {
      ingester = 3;
      negentropy = 2;
      reqMonitor = 3;
      reqWorker = 3;
    };
    port = 7777;
    queryTimesliceBudgetMicroseconds = 10000;
    realIpHeader = "";
    writePolicy = {
      plugin = "";
    };
  };
}
```

*Example:*

``` nix
dbParams = {
  maxreaders = 256;
  mapsize = 10995116277760;
  noReadAhead = false;
};
```

*Declared by:* [`nixos/modules/services/web-apps/strfry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strfry.nix)

## `services.strichliste.domain` {#opt-services.strichliste.domain}

Domain name used to configure the webserver virtual host.

*Type:* string

*Example:* `"strichliste.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.enable` {#opt-services.strichliste.enable}

Whether to enable strichliste, a web based tally sheet..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.environment` {#opt-services.strichliste.environment}

Environment variables consumed by Symfony.

See [https://github.com/strichliste/strichliste-backend/blob/v2.1.0/.env.dist](https://github.com/strichliste/strichliste-backend/blob/v2.1.0/.env.dist) for possible options.

*Type:* open submodule of (attribute set)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.environment.APP_CACHE_DIR` {#opt-services.strichliste.environment.APP_CACHE_DIR}

Directory used for caching.

*Type:* absolute path

*Default:* `"/var/cache/strichliste"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.environment.APP_ENV` {#opt-services.strichliste.environment.APP_ENV}

The active environment.

*Type:* string

*Default:* `"prod"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.environment.APP_LOG_DIR` {#opt-services.strichliste.environment.APP_LOG_DIR}

Directory to write logs.

*Type:* absolute path

*Default:* `"/var/log/strichliste"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.environment.CORS_ALLOW_ORIGIN` {#opt-services.strichliste.environment.CORS_ALLOW_ORIGIN}

Regular expression defining the allowed CORS origins.

*Type:* string

*Default:* `^https?://$${config.services.strichliste.domain}(:[0-9]+)?$`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.environment.DATABASE_URL` {#opt-services.strichliste.environment.DATABASE_URL}

See [https://www.doctrine-project.org/projects/doctrine-dbal/en/3.9/reference/configuration.html#connecting-using-a-url](https://www.doctrine-project.org/projects/doctrine-dbal/en/3.9/reference/configuration.html#connecting-using-a-url)
for more URL examples.

*Type:* string

*Default:* `"sqlite:////var/lib/strichliste/db.sqlite"`

*Example:* `"postgresql://strichliste@localhost/strichliste?host=/run/postgresql"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.environmentFiles` {#opt-services.strichliste.environmentFiles}

Environment files to configure Symfony.

See [https://github.com/strichliste/strichliste-backend/blob/v2.1.0/.env.dist](https://github.com/strichliste/strichliste-backend/blob/v2.1.0/.env.dist) for possible options.

::: important
You should configure `APP_SECRET` here.
:::

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/run/keys/strichliste.env"
]
```

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.enable` {#opt-services.strichliste.nginx.enable}

Whether to enable and configure an nginx vhost to serve strichliste.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost` {#opt-services.strichliste.nginx.virtualHost}

Nginx virtual settings to allow direct customization of its settings.

*Type:* submodule

*Example:*

``` nix
{
  enableACME = true;
  forceSSL = true;
}
```

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.acmeFallbackHost` {#opt-services.strichliste.nginx.virtualHost.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.acmeRoot` {#opt-services.strichliste.nginx.virtualHost.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.addSSL` {#opt-services.strichliste.nginx.virtualHost.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.basicAuth` {#opt-services.strichliste.nginx.virtualHost.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.basicAuthFile` {#opt-services.strichliste.nginx.virtualHost.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.default` {#opt-services.strichliste.nginx.virtualHost.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.enableACME` {#opt-services.strichliste.nginx.virtualHost.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.extraConfig` {#opt-services.strichliste.nginx.virtualHost.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.forceSSL` {#opt-services.strichliste.nginx.virtualHost.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.globalRedirect` {#opt-services.strichliste.nginx.virtualHost.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.http2` {#opt-services.strichliste.nginx.virtualHost.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.http3` {#opt-services.strichliste.nginx.virtualHost.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.http3_hq` {#opt-services.strichliste.nginx.virtualHost.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.kTLS` {#opt-services.strichliste.nginx.virtualHost.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.listen` {#opt-services.strichliste.nginx.virtualHost.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.listen.*.addr` {#opt-services.strichliste.nginx.virtualHost.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.listen.*.extraParameters` {#opt-services.strichliste.nginx.virtualHost.listen._.extraParameters}

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

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.listen.*.port` {#opt-services.strichliste.nginx.virtualHost.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.listen.*.proxyProtocol` {#opt-services.strichliste.nginx.virtualHost.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.listen.*.ssl` {#opt-services.strichliste.nginx.virtualHost.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.listenAddresses` {#opt-services.strichliste.nginx.virtualHost.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.locations` {#opt-services.strichliste.nginx.virtualHost.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.locations.<name>.alias` {#opt-services.strichliste.nginx.virtualHost.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.locations.<name>.basicAuth` {#opt-services.strichliste.nginx.virtualHost.locations._name_.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.locations.<name>.basicAuthFile` {#opt-services.strichliste.nginx.virtualHost.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.locations.<name>.extraConfig` {#opt-services.strichliste.nginx.virtualHost.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.locations.<name>.fastcgiParams` {#opt-services.strichliste.nginx.virtualHost.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.locations.<name>.index` {#opt-services.strichliste.nginx.virtualHost.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.locations.<name>.priority` {#opt-services.strichliste.nginx.virtualHost.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.locations.<name>.proxyPass` {#opt-services.strichliste.nginx.virtualHost.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.locations.<name>.proxyWebsockets` {#opt-services.strichliste.nginx.virtualHost.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.locations.<name>.recommendedProxySettings` {#opt-services.strichliste.nginx.virtualHost.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.locations.<name>.recommendedUwsgiSettings` {#opt-services.strichliste.nginx.virtualHost.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.locations.<name>.return` {#opt-services.strichliste.nginx.virtualHost.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.locations.<name>.root` {#opt-services.strichliste.nginx.virtualHost.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.locations.<name>.tryFiles` {#opt-services.strichliste.nginx.virtualHost.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.locations.<name>.useGrpcErrorPages` {#opt-services.strichliste.nginx.virtualHost.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.locations.<name>.uwsgiPass` {#opt-services.strichliste.nginx.virtualHost.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.onlySSL` {#opt-services.strichliste.nginx.virtualHost.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.quic` {#opt-services.strichliste.nginx.virtualHost.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.redirectCode` {#opt-services.strichliste.nginx.virtualHost.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.rejectSSL` {#opt-services.strichliste.nginx.virtualHost.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.reuseport` {#opt-services.strichliste.nginx.virtualHost.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.root` {#opt-services.strichliste.nginx.virtualHost.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.serverAliases` {#opt-services.strichliste.nginx.virtualHost.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.serverName` {#opt-services.strichliste.nginx.virtualHost.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.sslCertificate` {#opt-services.strichliste.nginx.virtualHost.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.sslCertificateKey` {#opt-services.strichliste.nginx.virtualHost.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.sslTrustedCertificate` {#opt-services.strichliste.nginx.virtualHost.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.nginx.virtualHost.useACMEHost` {#opt-services.strichliste.nginx.virtualHost.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.packages.backend` {#opt-services.strichliste.packages.backend}

The strichliste package to use.

*Type:* package

*Default:* `pkgs.strichliste`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.packages.frontend` {#opt-services.strichliste.packages.frontend}

The strichliste-frontend package to use.

*Type:* package

*Default:* `<derivation strichliste-frontend-2.1.0>`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.settings` {#opt-services.strichliste.settings}

The `strichliste.yaml` configuration as a Nix attribute set.

See the [configuration reference](https://github.com/strichliste/strichliste-backend/blob/v2.1.0/docs/Config.md)
for possible options.

*Type:* open submodule of (YAML 1.1 value)

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.settings.account.boundary.lower` {#opt-services.strichliste.settings.account.boundary.lower}

The credit limit for user accounts.

*Type:* signed integer

*Default:* `-200000`

*Example:* `0`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.settings.account.boundary.upper` {#opt-services.strichliste.settings.account.boundary.upper}

The maximum balance on a user account.

*Type:* positive integer, meaning \>0

*Default:* `200000`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.settings.common.idleTimeout` {#opt-services.strichliste.settings.common.idleTimeout}

Time until the app returns to the start page.

*Type:* signed integer

*Default:* `30000`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.settings.i18n.currency.alpha3` {#opt-services.strichliste.settings.i18n.currency.alpha3}

[ISO 4217](https://en.wikipedia.org/wiki/ISO_4217#List_of_ISO_4217_currency_codes) alpha code representing the currency.

*Type:* string

*Example:* `"EUR"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.settings.i18n.currency.name` {#opt-services.strichliste.settings.i18n.currency.name}

Name of the currency.

*Type:* string

*Example:* `"Euro"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.settings.i18n.currency.symbol` {#opt-services.strichliste.settings.i18n.currency.symbol}

Symbol for the currency.

*Type:* string

*Example:* `"€"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.settings.i18n.language` {#opt-services.strichliste.settings.i18n.language}

Language used throughout the app.

*Type:* string

*Default:* `"en"`

*Example:* `"de"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.settings.i18n.timezone` {#opt-services.strichliste.settings.i18n.timezone}

Timezone used throughout the app, e.g. in the transaction log.

*Type:* string

*Default:* `config.time.timeZone`

*Example:* `"Europe/Berlin"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.settings.payment.boundary.lower` {#opt-services.strichliste.settings.payment.boundary.lower}

The lowest amount that can be used for payments.

*Type:* signed integer

*Default:* `-2000`

*Example:* `0`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.settings.payment.boundary.upper` {#opt-services.strichliste.settings.payment.boundary.upper}

The highest amount that can be used for payment.

*Type:* positive integer, meaning \>0

*Default:* `15000`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.settings.payment.deposit.custom` {#opt-services.strichliste.settings.payment.deposit.custom}

Whether to allow custom amounts for deposits.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.settings.payment.deposit.enabled` {#opt-services.strichliste.settings.payment.deposit.enabled}

Whether to allow money deposits.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.settings.payment.deposit.steps` {#opt-services.strichliste.settings.payment.deposit.steps}

List of selectable deposit amounts.

This should match your most common coins and banknotes.

*Type:* list of (signed integer or floating point number)

*Default:* `[ ]`

*Example:*

``` nix
[
  0.5
  1
  2
  5
  10
  20
]
```

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.settings.payment.dispense.custom` {#opt-services.strichliste.settings.payment.dispense.custom}

Whether to allow custom spending amounts.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.settings.payment.dispense.enabled` {#opt-services.strichliste.settings.payment.dispense.enabled}

Whether to allow spending money.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.settings.payment.dispense.steps` {#opt-services.strichliste.settings.payment.dispense.steps}

List of selectable spending amounts.

This should match your most common products.

*Type:* list of (signed integer or floating point number)

*Default:* `[ ]`

*Example:*

``` nix
[
  0.5
  1
  2
  5
  10
  20
]
```

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.settings.payment.splitInvoice.enabled` {#opt-services.strichliste.settings.payment.splitInvoice.enabled}

Whether to allow splitting invoices.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.settings.payment.transactions.enabled` {#opt-services.strichliste.settings.payment.transactions.enabled}

Whether to allow transactions between user accounts.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.settings.payment.undo.delete` {#opt-services.strichliste.settings.payment.undo.delete}

Whether to allow deleting within the [`services.strichliste.settings.payment.undo.timeout`](#opt-services.strichliste.settings.payment.undo.timeout) period.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.settings.payment.undo.enabled` {#opt-services.strichliste.settings.payment.undo.enabled}

Whether to allow undoing transactions withing the [`services.strichliste.settings.payment.undo.timeout`](#opt-services.strichliste.settings.payment.undo.timeout) period.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.settings.payment.undo.timeout` {#opt-services.strichliste.settings.payment.undo.timeout}

The time period after creating a transaction in which undoing/deleting remains possible.

The format used is documented in [https://www.php.net/manual/en/dateinterval.createfromdatestring.php](https://www.php.net/manual/en/dateinterval.createfromdatestring.php).

*Type:* string

*Default:* `"5 minute"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strichliste.settings.user.stalePeriod` {#opt-services.strichliste.settings.user.stalePeriod}

Duration after which users are listed as inactive.

The format used is documented in [https://www.php.net/manual/en/dateinterval.createfromdatestring.php](https://www.php.net/manual/en/dateinterval.createfromdatestring.php).

::: tip
This helps unclutter the user listing by prioritizing active users.
:::

*Type:* string

*Default:* `"10 day"`

*Example:* `"1 week"`

*Declared by:* [`nixos/modules/services/web-apps/strichliste.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/strichliste.nix)

## `services.strongswan-swanctl.enable` {#opt-services.strongswan-swanctl.enable}

Whether to enable strongswan-swanctl service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.includes` {#opt-services.strongswan-swanctl.includes}

Extra configuration files to include in the swanctl configuration. This can be used to provide secret values from outside the nix store.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.package` {#opt-services.strongswan-swanctl.package}

The strongswan package to use.

*Type:* package

*Default:* `pkgs.strongswan`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.strongswan.extraConfig` {#opt-services.strongswan-swanctl.strongswan.extraConfig}

Contents of the `strongswan.conf` file.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.authorities` {#opt-services.strongswan-swanctl.swanctl.authorities}

Section defining complementary attributes of certification authorities, each
in its own subsection with an arbitrary yet unique name

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.authorities.<name>.cacert` {#opt-services.strongswan-swanctl.swanctl.authorities._name_.cacert}

The certificates may use a relative path from the swanctl
`x509ca` directory or an absolute path.

Configure one of `cacert`,
`file`, or
`handle` per section.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.authorities.<name>.cert_uri_base` {#opt-services.strongswan-swanctl.swanctl.authorities._name_.cert_uri_base}

Defines the base URI for the Hash and URL feature supported by
IKEv2. Instead of exchanging complete certificates, IKEv2 allows one to
send an URI that resolves to the DER encoded certificate. The certificate
URIs are built by appending the SHA1 hash of the DER encoded certificates
to this base URI.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.authorities.<name>.crl_uris` {#opt-services.strongswan-swanctl.swanctl.authorities._name_.crl_uris}

List of CRL distribution points (ldap, http, or file URI).

StrongSwan default: `[]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.authorities.<name>.file` {#opt-services.strongswan-swanctl.swanctl.authorities._name_.file}

Absolute path to the certificate to load. Passed as-is to the daemon, so
it must be readable by it.

Configure either this or `handle`, but not both, in one section.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.authorities.<name>.handle` {#opt-services.strongswan-swanctl.swanctl.authorities._name_.handle}

Hex-encoded CKA\_ID or handle of the certificate on a token or TPM,
respectively.

Configure either this or `file`, but not both, in one section.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.authorities.<name>.module` {#opt-services.strongswan-swanctl.swanctl.authorities._name_.module}

Optional PKCS#11 module name.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.authorities.<name>.ocsp_uris` {#opt-services.strongswan-swanctl.swanctl.authorities._name_.ocsp_uris}

List of OCSP URIs.

StrongSwan default: `[]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.authorities.<name>.slot` {#opt-services.strongswan-swanctl.swanctl.authorities._name_.slot}

Optional slot number of the token that stores the certificate.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections` {#opt-services.strongswan-swanctl.swanctl.connections}

Section defining IKE connection configurations, each in its own subsection
with an arbitrary yet unique name

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.aggressive` {#opt-services.strongswan-swanctl.swanctl.connections._name_.aggressive}

Enables Aggressive Mode instead of Main Mode with Identity
Protection. Aggressive Mode is considered less secure, because the ID and
HASH payloads are exchanged unprotected. This allows a passive attacker to
snoop peer identities, and even worse, start dictionary attacks on the
Preshared Key.

StrongSwan default: `false`

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.childless` {#opt-services.strongswan-swanctl.swanctl.connections._name_.childless}

Use childless IKE\_SA initiation (*allow*, *prefer*, *force* or *never*).

Use childless IKE\_SA initiation (RFC 6023) for IKEv2, with the first
CHILD\_SA created with a separate CREATE\_CHILD\_SA exchange (e.g. to use an
independent key exchange for all CHILD\_SAs).  Acceptable values are *allow*
(the default), *prefer*, *force* and *never*. If set to *allow*, responders
will accept childless IKE\_SAs (as indicated via notify in the IKE\_SA\_INIT
response) while initiators continue to create regular IKE\_SAs with the first
CHILD\_SA created during IKE\_AUTH, unless the IKE\_SA is initiated explicitly
without any children (which will fail if the responder does not support or
has disabled this extension). The effect of *prefer* is the same as *allow*
on responders, but as initiator a childless IKE\_SA is initiated if the
responder supports it. If set to *force*, only childless initiation is
accepted in either role.  Finally, setting the option to *never* disables
support for childless IKE\_SAs as responder.

StrongSwan default: `"allow"`

*Type:* null or one of "allow", "prefer", "force", "never"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children}

CHILD\_SA configuration sub-section. Each connection definition may have
one or more sections in its `children` subsection. The
section name defines the name of the CHILD\_SA configuration, which must be
unique within the connection (denoted \<child\> below).

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.ah_proposals` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.ah_proposals}

AH proposals to offer for the CHILD\_SA. A proposal is a set of algorithms.
For AH, this includes an integrity algorithm and an optional key exchange
method. If a KE method is specified, CHILD\_SA/Quick Mode rekeying and
initial negotiation uses a separate key exchange using the negotiated method
(refer to *esp\_proposals* for details).

With peers that support multiple IKEv2 key exchanges (RFC 9370), up to seven
additional key exchanges may be negotiated. They can be configured by
prefixing the algorithm keyword with **keX\_** (where X is a number between
1 and 7).

For IKEv2, multiple algorithms of the same kind can be specified in a single
proposal, from which one gets selected. For IKEv1, only one algorithm per
kind is allowed per proposal, more algorithms get implicitly stripped. Use
multiple proposals to offer different algorithm combinations with IKEv1.

Algorithm keywords get separated using dashes. The special value *default*
forms a default proposal of supported algorithms considered safe, and is
usually a good choice for interoperability. By default no AH proposals
are included, instead ESP is proposed.

StrongSwan default: `[]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.close_action` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.close_action}

Action to perform after a CHILD\_SA gets closed by the peer.

- The default of `none` does not take any action,
- `trap` installs a trap policy for the CHILD\_SA.
- `start` tries to re-create the CHILD\_SA.

`close_action` does not provide any guarantee that the
CHILD\_SA is kept alive. It acts on explicit close messages only, but not
on negotiation failures. Use trap policies to reliably re-create failed
CHILD\_SAs.

StrongSwan default: `"none"`

*Type:* null or one of "none", "trap", "start"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.copy_df` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.copy_df}

Whether to copy the DF bit to the outer IPv4 header in tunnel mode. This
effectively disables Path MTU discovery (PMTUD). Controlling this
behavior is not supported by all kernel interfaces.

StrongSwan default: `true`

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.copy_dscp` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.copy_dscp}

Whether to copy the DSCP (Differentiated Services Field Codepoint)
header field to/from the outer IP header in tunnel mode. The value
`out` only copies the field from the inner to the outer
header, the value `in` does the opposite and only
copies the field from the outer to the inner header when decapsulating,
the value `yes` copies the field in both directions,
and the value `no` disables copying the field
altogether. Setting this to `yes` or
`in` could allow an attacker to adversely affect other
traffic at the receiver, which is why the default is
`out`. Controlling this behavior is not supported by
all kernel interfaces.

StrongSwan default: `"out"`

*Type:* null or one of "out", "in", "yes", "no"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.copy_ecn` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.copy_ecn}

Whether to copy the ECN (Explicit Congestion Notification) header field
to/from the outer IP header in tunnel mode. Controlling this behavior is
not supported by all kernel interfaces.

StrongSwan default: `true`

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.dpd_action` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.dpd_action}

Action to perform for this CHILD\_SA on DPD timeout. The default clear
closes the CHILD\_SA and does not take further action. trap installs a
trap policy, which will catch matching traffic and tries to re-negotiate
the tunnel on-demand. restart immediately tries to re-negotiate the
CHILD\_SA under a fresh IKE\_SA.

StrongSwan default: `"clear"`

*Type:* null or one of "clear", "trap", "restart"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.esp_proposals` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.esp_proposals}

ESP proposals to offer for the CHILD\_SA. A proposal is a set of algorithms.
For non-AEAD ESP proposals, this includes an integrity algorithm, an
encryption algorithm, an optional key exchange method and an optional
Extended Sequence Number Mode indicator. For AEAD proposals, a combined
mode algorithm is used instead of the separate encryption/integrity
algorithms.

If a key exchange method is specified, CHILD\_SA/Quick Mode rekeying and
initial negotiation use a separate key exchange using the specified method.
However, for IKEv2, the keys of the CHILD\_SA created implicitly with the
IKE\_SA will always be derived from the IKE\_SA's key material. So any key
exchange method specified here will only apply when the CHILD\_SA is later
rekeyed or is created with a separate CREATE\_CHILD\_SA exchange. A proposal
mismatch might, therefore, not immediately be noticed when the SA is
established, but may later cause rekeying to fail.

With peers that support multiple IKEv2 key exchanges (RFC 9370), up to seven
additional key exchanges may be negotiated. They can be configured by
prefixing the algorithm keyword with **keX\_** (where X is a number between
1 and 7).

Extended Sequence Number support may be indicated with the *esn* and *noesn*
values, both may be included to indicate support for both modes. If omitted,
*noesn* is assumed.

For IKEv2, multiple algorithms of the same kind can be specified in a single
proposal, from which one gets selected. For IKEv1, only one algorithm per
kind is allowed per proposal, more algorithms get implicitly stripped. Use
multiple proposals to offer different algorithm combinations with IKEv1.

Algorithm keywords get separated using dashes. The special value *default*
forms a default proposal of supported algorithms considered safe, and is
usually a good choice for interoperability. If no algorithms are specified
for AH nor ESP, the *default* set of algorithms for ESP is included.

StrongSwan default: `["default"]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.hostaccess` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.hostaccess}

Hostaccess variable to pass to `updown` script.

StrongSwan default: `false`

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.hw_offload` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.hw_offload}

Enable hardware offload for this CHILD\_SA, if supported by the IPsec
implementation. The values `crypto` or `packet` enforce crypto or full
packet offloading and the installation will fail if the selected mode is not
supported by either kernel or device. On Linux, `packet` also offloads
policies, including trap policies. The value `auto` enables full packet
or crypto offloading, if either is supported, but the installation does not
fail otherwise.

StrongSwan default: `"no"`

*Type:* null or one of "yes", "no", "auto", "crypto", "packet"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.icmp` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.icmp}

Whether to forward certain ICMP error messages even if their source IP
doesn't match the negotiated IPsec policies.

ICMP error messages, such as Destination Unreachable, Time Exceeded or
Fragmentation Needed, may be generated by a host whose IP address isn't
included in the negotiated traffic selectors and therefore doesn't match the
IPsec policies. If this option is enabled and the kernel supports it, such
packets may still be forwarded. As ICMP errors contain parts of the IP
packet that triggered them, the kernel will base its decision on a reverse
policy lookup using that IP header.

StrongSwan default: `false`

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.if_id_in` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.if_id_in}

XFRM interface ID set on inbound policies/SA. This allows installing
duplicate policies/SAs and associates them with an interface with the
same ID. The special value `%unique` sets a unique
interface ID on each CHILD\_SA instance, beyond that the value
`%unique-dir` assigns a different unique interface ID
for each CHILD\_SA direction (in/out).

StrongSwan default: `"0"`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.if_id_out` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.if_id_out}

XFRM interface ID set on outbound policies/SA. This allows installing
duplicate policies/SAs and associates them with an interface with the
same ID. The special value `%unique` sets a unique
interface ID on each CHILD\_SA instance, beyond that the value
`%unique-dir` assigns a different unique interface ID
for each CHILD\_SA direction (in/out).

The daemon will not install routes for CHILD\_SAs that have this option set.

StrongSwan default: `"0"`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.inactivity` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.inactivity}

Timeout before closing CHILD\_SA after inactivity. If no traffic has been
processed in either direction for the configured timeout, the CHILD\_SA
gets closed due to inactivity. The default value of 0 disables inactivity
checks.

StrongSwan default: `"0s"`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.interface` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.interface}

Optional interface name to restrict outbound IPsec policies.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.ipcomp` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.ipcomp}

Enable IPComp compression before encryption. If enabled, IKE tries to
negotiate IPComp compression to compress ESP payload data prior to
encryption.

StrongSwan default: `false`

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.life_bytes` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.life_bytes}

Maximum bytes processed before CHILD\_SA gets closed. Usually this hard
volume limit is never reached, because the CHILD\_SA gets rekeyed
before. If that fails for whatever reason, this limit closes the
CHILD\_SA.  The default is 10% more than `rekey_bytes`.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.life_packets` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.life_packets}

Maximum number of packets processed before CHILD\_SA gets closed. Usually
this hard packets limit is never reached, because the CHILD\_SA gets
rekeyed before. If that fails for whatever reason, this limit closes the
CHILD\_SA.

The default is 10% more than `rekey_bytes`.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.life_time` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.life_time}

Maximum lifetime before CHILD\_SA gets closed. Usually this hard lifetime
is never reached, because the CHILD\_SA gets rekeyed before. If that fails
for whatever reason, this limit closes the CHILD\_SA.  The default is 10%
more than the `rekey_time`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.local_ts` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.local_ts}

List of local traffic selectors to include in CHILD\_SA.
Each selector is a CIDR subnet definition, followed by an optional
proto/port selector. The special value *dynamic* may be used instead of a
subnet definition, which gets replaced by the tunnel outer address or the
virtual IP, if negotiated. This is the default.

A protocol/port selector is surrounded by opening and closing square
brackets. Between these brackets, a numeric or **getservent**(3) protocol
name may be specified. After the optional protocol restriction, an optional
port restriction may be specified, separated by a slash. The port
restriction may be numeric, a **getservent**(3) service name, or the special
value *opaque* for RFC 4301 OPAQUE selectors. Port ranges may be specified
as well, none of the kernel backends currently support port ranges, though.
If the protocol is *icmp* or *ipv6-icmp*, the port is interpreted as ICMP
message type if it is less than 256 or as type and code if it is greater or
equal to 256, with the type in the most significant 8 bits and the code in
the least significant 8 bits.

When IKEv1 is used only the first selector is interpreted, except if
the Cisco Unity extension plugin is used. This is due to a limitation of the
IKEv1 protocol, which only allows a single pair of selectors per CHILD\_SA.
So to tunnel traffic matched by several pairs of selectors when using IKEv1
several children (CHILD\_SAs) have to be defined that cover the selectors.

The IKE daemon uses traffic selector narrowing for IKEv1, the same way it is
standardized and implemented for IKEv2. However, this may lead to problems
with other implementations. To avoid that, configure identical selectors in
such scenarios.

StrongSwan default: `["dynamic"]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.mark_in` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.mark_in}

Netfilter mark and mask for input traffic. On Linux, Netfilter may
require marks on each packet to match an SA/policy having that option
set. This allows installing duplicate policies and enables Netfilter
rules to select specific SAs/policies for incoming traffic. Note that
inbound marks are only set on policies, by default, unless
`mark_in_sa` is enabled. The special value
`%unique` sets a unique mark on each CHILD\_SA instance,
beyond that the value `%unique-dir` assigns a different
unique mark for each

An additional mask may be appended to the mark, separated by
`/`. The default mask if omitted is
`0xffffffff`.

StrongSwan default: `"0/0x00000000"`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.mark_in_sa` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.mark_in_sa}

Whether to set `mark_in` on the inbound SA. By default,
the inbound mark is only set on the inbound policy. The tuple destination
address, protocol and SPI is unique and the mark is not required to find
the correct SA, allowing to mark traffic after decryption instead (where
more specific selectors may be used) to match different policies. Marking
packets before decryption is still possible, even if no mark is set on
the SA.

StrongSwan default: `false`

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.mark_out` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.mark_out}

Netfilter mark and mask for output traffic. On Linux, Netfilter may
require marks on each packet to match a policy/SA having that option
set. This allows installing duplicate policies and enables Netfilter
rules to select specific policies/SAs for outgoing traffic. The special
value `%unique` sets a unique mark on each CHILD\_SA
instance, beyond that the value `%unique-dir` assigns a
different unique mark for each CHILD\_SA direction (in/out).

An additional mask may be appended to the mark, separated by
`/`. The default mask if omitted is
`0xffffffff`.

StrongSwan default: `"0/0x00000000"`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.mode` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.mode}

IPsec Mode to establish CHILD\_SA with.

- `tunnel` negotiates the CHILD\_SA in IPsec Tunnel Mode,
- whereas `transport` uses IPsec Transport Mode.
- `transport_proxy` signifying the special Mobile IPv6
  Transport Proxy Mode.
- `beet` is the Bound End to End Tunnel mixture mode,
  working with fixed inner addresses without the need to include them in
  each packet.
- Both `transport` and `beet` modes are
  subject to mode negotiation; `tunnel` mode is
  negotiated if the preferred mode is not available.
- `pass` and `drop` are used to install
  shunt policies which explicitly bypass the defined traffic from IPsec
  processing or drop it, respectively.

StrongSwan default: `"tunnel"`

*Type:* null or one of "tunnel", "transport", "transport\_proxy", "beet", "pass", "drop"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.per_cpu_sas` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.per_cpu_sas}

Enable per-CPU CHILD\_SAs. Requires `trap` in `start_action`.
The value `encap` enables a special type of UDP encapsulation
(requires enabling `encap` for the connection if there is no NAT),
where a random source port is used for each outbound per-CPU SA
(the destination port for all of them remains 4500). This allows
using the port for RSS if the SPI can’t be used. Note that this type
of behavior is not standardized and not negotiated. So regardless
of whether the option is enabled, inbound per-CPU SAs
with UDP-encapsulation always have the source port set to 0
as the peer’s random port is unknown if it has this option enabled.

StrongSwan default: `"no"`

*Type:* null or one of "yes", "no", "encap"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.policies` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.policies}

Whether to install IPsec policies or not. Disabling this can be useful in
some scenarios e.g. MIPv6, where policies are not managed by the IKE
daemon. Since 5.3.3.

StrongSwan default: `true`

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.policies_fwd_out` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.policies_fwd_out}

Whether to install outbound FWD IPsec policies or not. Enabling this is
required in case there is a drop policy that would match and block
forwarded traffic for this CHILD\_SA. Since 5.5.1.

StrongSwan default: `false`

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.priority` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.priority}

Optional fixed priority for IPsec policies. This could be useful to
install high-priority drop policies. The default of 0 uses dynamically
calculated priorities based on the size of the traffic selectors.

StrongSwan default: `0`

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.rand_bytes` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.rand_bytes}

Byte range from which to choose a random value to subtract from
`rekey_bytes`. The default is the difference between
`life_bytes` and `rekey_bytes`.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.rand_packets` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.rand_packets}

Packet range from which to choose a random value to subtract from
`rekey_packets`. The default is the difference between
`life_packets` and `rekey_packets`.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.rand_time` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.rand_time}

Time range from which to choose a random value to subtract from
`rekey_time`. The default is the difference between
`life_time` and `rekey_time`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.rekey_bytes` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.rekey_bytes}

Number of bytes processed before initiating CHILD\_SA rekeying.

Number of bytes processed before initiating CHILD\_SA rekeying. CHILD\_SA
rekeying refreshes key material, optionally using a Diffie-Hellman exchange
if a group is specified in the proposal.

To avoid rekey collisions initiated by both ends simultaneously, a value
in the range of `rand_bytes` gets subtracted to form the effective soft
volume limit.

Volume based CHILD\_SA rekeying is disabled by default. If `life_bytes`
is explicitly configured, `rekey_bytes` defaults to 10% less than that.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.rekey_packets` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.rekey_packets}

Number of packets processed before initiating CHILD\_SA rekeying.

Number of packets processed before initiating CHILD\_SA rekeying. CHILD\_SA
rekeying refreshes key material, optionally using a Diffie-Hellman exchange
if a group is specified in the proposal.

To avoid rekey collisions initiated by both ends simultaneously, a value
in the range of `rand_packets` gets subtracted to form the effective soft
packet count limit.

Packet count based CHILD\_SA rekeying is disabled by default. If
`life_packets` is explicitly configured, `rekey_packets` defaults to
10% less than that.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.rekey_time` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.rekey_time}

Time to schedule CHILD\_SA rekeying. CHILD\_SA rekeying refreshes key
material, optionally using a Diffie-Hellman exchange if a group is
specified in the proposal.

To avoid rekey collisions initiated by both ends simultaneously, a value
in the range of `rand_time` gets subtracted to form the effective soft
lifetime.

If `life_time` is explicitly configured, `rekey_time` defaults to 10%
less than that, otherwise, CHILD\_SA rekeying is scheduled every hour, minus
`rand_time`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.remote_ts` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.remote_ts}

List of remote selectors to include in CHILD\_SA. See
`local_ts` for a description of the selector syntax.

StrongSwan default: `["dynamic"]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.replay_window` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.replay_window}

IPsec replay window to configure for this CHILD\_SA. Larger values than
the default of `32` are supported using the Netlink
backend only, a value of `0` disables IPsec replay
protection.

StrongSwan default: `32`

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.reqid` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.reqid}

Fixed reqid to use for this CHILD\_SA. This might be helpful in some
scenarios, but works only if each CHILD\_SA configuration is instantiated
not more than once. The default of 0 uses dynamic reqids, allocated
incrementally.

StrongSwan default: `0`

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.set_mark_in` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.set_mark_in}

Netfilter mark applied to packets after the inbound IPsec SA processed
them. This way it's not necessary to mark packets via Netfilter before
decryption or right afterwards to match policies or process them
differently (e.g. via policy routing).

An additional mask may be appended to the mark, separated by
`/`. The default mask if omitted is 0xffffffff. The
special value `%same` uses the value (but not the mask)
from `mark_in` as mark value, which can be fixed,
`%unique` or `%unique-dir`.

Setting marks in XFRM input requires Linux 4.19 or higher.

StrongSwan default: `"0/0x00000000"`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.set_mark_out` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.set_mark_out}

Netfilter mark applied to packets after the outbound IPsec SA processed
them. This allows processing ESP packets differently than the original
traffic (e.g. via policy routing).

An additional mask may be appended to the mark, separated by
`/`. The default mask if omitted is 0xffffffff. The
special value `%same` uses the value (but not the mask)
from `mark_out` as mark value, which can be fixed,
`%unique_` or `%unique-dir`.

Setting marks in XFRM output is supported since Linux 4.14. Setting a
mask requires at least Linux 4.19.

StrongSwan default: `"0/0x00000000"`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.sha256_96` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.sha256_96}

HMAC-SHA-256 is used with 128-bit truncation with IPsec. For
compatibility with implementations that incorrectly use 96-bit truncation
this option may be enabled to configure the shorter truncation length in
the kernel. This is not negotiated, so this only works with peers that
use the incorrect truncation length (or have this option enabled).

StrongSwan default: `false`

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.start_action` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.start_action}

Action to perform after loading the configuration.

- The default of `none` loads the connection only, which
  then can be manually initiated or used as a responder configuration.
- The value `trap` installs a trap policy, which triggers
  the tunnel as soon as matching traffic has been detected.
- The value `start` initiates the connection actively.
- Since version 5.9.6 two modes above can be combined with `trap|start`,
  to immediately initiate a connection for which trap policies have been installed.

When unloading or replacing a CHILD\_SA configuration having a
`start_action` different from `none`,
the inverse action is performed. Configurations with
`start` get closed, while such with
`trap` get uninstalled.

StrongSwan default: `"none"`

*Type:* null or one of "none", "trap", "start", "trap|start"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.tfc_padding` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.tfc_padding}

Pads ESP packets with additional data to have a consistent ESP packet
size for improved Traffic Flow Confidentiality. The padding defines the
minimum size of all ESP packets sent.  The default value of
`0` disables TFC padding, the special value
`mtu` adds TFC padding to create a packet size equal to
the Path Maximum Transfer Unit.

StrongSwan default: `0`

*Type:* null or signed integer or value "mtu" (singular enum)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.children.<name>.updown` {#opt-services.strongswan-swanctl.swanctl.connections._name_.children._name_.updown}

Updown script to invoke on CHILD\_SA up and down events.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.dpd_delay` {#opt-services.strongswan-swanctl.swanctl.connections._name_.dpd_delay}

Interval to check the liveness of a peer actively using IKEv2
INFORMATIONAL exchanges or IKEv1 R\_U\_THERE messages. Active DPD checking
is only enforced if no IKE or ESP/AH packet has been received for the
configured DPD delay.

StrongSwan default: `"0s"`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.dpd_timeout` {#opt-services.strongswan-swanctl.swanctl.connections._name_.dpd_timeout}

Charon by default uses the normal retransmission mechanism and timeouts to
check the liveness of a peer, as all messages are used for liveness
checking. For compatibility reasons, with IKEv1 a custom interval may be
specified; this option has no effect on connections using IKEv2.

StrongSwan default: `"0s"`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.dscp` {#opt-services.strongswan-swanctl.swanctl.connections._name_.dscp}

Differentiated Services Field Codepoint to set on outgoing IKE packets for
this connection. The value is a six digit binary encoded string specifying
the Codepoint to set, as defined in RFC 2474.

StrongSwan default: `"000000"`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.encap` {#opt-services.strongswan-swanctl.swanctl.connections._name_.encap}

To enforce UDP encapsulation of ESP packets, the IKE daemon can fake the
NAT detection payloads. This makes the peer believe that NAT takes place
on the path, forcing it to encapsulate ESP packets in UDP.

Usually this is not required, but it can help to work around connectivity
issues with too restrictive intermediary firewalls.

StrongSwan default: `false`

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.fragmentation` {#opt-services.strongswan-swanctl.swanctl.connections._name_.fragmentation}

Use IKE fragmentation (proprietary IKEv1 extension or RFC 7383 IKEv2
fragmentation). Acceptable values are `yes` (the default
since 5.5.1), `accept` (since versions:5.5.3),
`force` and `no`.

- If set to `yes`, and the peer
  supports it, oversized IKE messages will be sent in fragments.
- If set to
  `accept`, support for fragmentation is announced to the peer but the daemon
  does not send its own messages in fragments.
- If set to `force` (only
  supported for IKEv1) the initial IKE message will already be fragmented if
  required.
- Finally, setting the option to `no` will disable announcing
  support for this feature.

Note that fragmented IKE messages sent by a peer are always processed
irrespective of the value of this option (even when set to no).

StrongSwan default: `"yes"`

*Type:* null or one of "yes", "accept", "force", "no"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.if_id_in` {#opt-services.strongswan-swanctl.swanctl.connections._name_.if_id_in}

XFRM interface ID set on inbound policies/SA, can be overridden by child
config, see there for details.

The special value `%unique` allocates a unique interface ID per IKE\_SA,
which is inherited by all its CHILD\_SAs (unless overridden there), beyond
that the value `%unique-dir` assigns a different unique interface ID for
each direction (in/out).

StrongSwan default: `"0"`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.if_id_out` {#opt-services.strongswan-swanctl.swanctl.connections._name_.if_id_out}

XFRM interface ID set on outbound policies/SA, can be overridden by child
config, see there for details.

The special value `%unique` allocates a unique interface ID per IKE\_SA,
which is inherited by all its CHILD\_SAs (unless overridden there), beyond
that the value `%unique-dir` assigns a different unique interface ID for
each direction (in/out).

StrongSwan default: `"0"`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.keyingtries` {#opt-services.strongswan-swanctl.swanctl.connections._name_.keyingtries}

Number of retransmission sequences to perform during initial
connect. Instead of giving up initiation after the first retransmission
sequence with the default value of `1`, additional
sequences may be started according to the configured value. A value of
`0` initiates a new sequence until the connection
establishes or fails with a permanent error.

StrongSwan default: `1`

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.local` {#opt-services.strongswan-swanctl.swanctl.connections._name_.local}

Section for a local authentication round. A local authentication round
defines the rules how authentication is performed for the local
peer. Multiple rounds may be defined to use IKEv2 RFC 4739 Multiple
Authentication or IKEv1 XAuth.

Each round is defined in a section having `local` as
prefix, and an optional unique suffix. To define a single authentication
round, the suffix may be omitted.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.local.<name>.aaa_id` {#opt-services.strongswan-swanctl.swanctl.connections._name_.local._name_.aaa_id}

Server side EAP-Identity to expect in the EAP method. Some EAP methods,
such as EAP-TLS, use an identity for the server to perform mutual
authentication. This identity may differ from the IKE identity,
especially when EAP authentication is delegated from the IKE responder
to an AAA backend.

For EAP-(T)TLS, this defines the identity for which the server must
provide a certificate in the TLS exchange.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.local.<name>.auth` {#opt-services.strongswan-swanctl.swanctl.connections._name_.local._name_.auth}

Authentication to perform locally.

- The default `pubkey` uses public key authentication
  using a private key associated to a usable certificate.
- `psk` uses pre-shared key authentication.
- The IKEv1 specific `xauth` is used for XAuth or Hybrid
  authentication,
- while the IKEv2 specific `eap` keyword defines EAP
  authentication.
- For `xauth`, a specific backend name may be appended,
  separated by a dash. The appropriate `xauth` backend is
  selected to perform the XAuth exchange. For traditional XAuth, the
  `xauth` method is usually defined in the second
  authentication round following an initial `pubkey` (or
  `psk`) round. Using `xauth` in the
  first round performs Hybrid Mode client authentication.
- For `eap`, a specific EAP method name may be appended, separated by a
  dash. An EAP module implementing the appropriate method is selected to
  perform the EAP conversation.
- Since 5.4.0, if both peers support RFC 7427 ("Signature Authentication
  in IKEv2") specific hash algorithms to be used during IKEv2
  authentication may be configured. To do so use `ike:`
  followed by a trust chain signature scheme constraint (see description
  of the `remote` section's `auth`
  keyword). For example, with `ike:pubkey-sha384-sha256`
  a public key signature scheme with either SHA-384 or SHA-256 would get
  used for authentication, in that order and depending on the hash
  algorithms supported by the peer. If no specific hash algorithms are
  configured, the default is to prefer an algorithm that matches or
  exceeds the strength of the signature key. If no constraints with
  `ike:` prefix are configured any signature scheme
  constraint (without `ike:` prefix) will also apply to
  IKEv2 authentication, unless this is disabled in
  `strongswan.conf`. To use RSASSA-PSS signatures use
  `rsa/pss` instead of `pubkey` or
  `rsa` as in e.g.
  `ike:rsa/pss-sha256`. If `pubkey` or
  `rsa` constraints are configured RSASSA-PSS signatures
  will only be used if enabled in `strongswan.conf`(5).

StrongSwan default: `"pubkey"`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.local.<name>.cert` {#opt-services.strongswan-swanctl.swanctl.connections._name_.local._name_.cert}

Section for a certificate candidate to use for
authentication. Certificates in certs are transmitted as binary blobs,
these sections offer more flexibility.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.local.<name>.cert.<name>.file` {#opt-services.strongswan-swanctl.swanctl.connections._name_.local._name_.cert._name_.file}

Absolute path to the certificate to load. Passed as-is to the daemon, so
it must be readable by it.

Configure either this or `handle`, but not both, in one section.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.local.<name>.cert.<name>.handle` {#opt-services.strongswan-swanctl.swanctl.connections._name_.local._name_.cert._name_.handle}

Hex-encoded CKA\_ID or handle of the certificate on a token or TPM,
respectively.

Configure either this or `file`, but not both, in one section.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.local.<name>.cert.<name>.module` {#opt-services.strongswan-swanctl.swanctl.connections._name_.local._name_.cert._name_.module}

Optional PKCS#11 module name.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.local.<name>.cert.<name>.slot` {#opt-services.strongswan-swanctl.swanctl.connections._name_.local._name_.cert._name_.slot}

Optional slot number of the token that stores the certificate.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.local.<name>.certs` {#opt-services.strongswan-swanctl.swanctl.connections._name_.local._name_.certs}

List of certificate candidates to use for
authentication. The certificates may use a relative path from the
swanctl `x509` directory or an absolute path.

The certificate used for authentication is selected based on the
received certificate request payloads. If no appropriate CA can be
located, the first certificate is used.

StrongSwan default: `[]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.local.<name>.eap_id` {#opt-services.strongswan-swanctl.swanctl.connections._name_.local._name_.eap_id}

Client EAP-Identity to use in EAP-Identity exchange and the EAP method.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.local.<name>.id` {#opt-services.strongswan-swanctl.swanctl.connections._name_.local._name_.id}

IKE identity to use for authentication round. When using certificate
authentication, the IKE identity must be contained in the certificate,
either as subject or as subjectAltName.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.local.<name>.pubkeys` {#opt-services.strongswan-swanctl.swanctl.connections._name_.local._name_.pubkeys}

List of raw public key candidates to use for
authentication. The public keys may use a relative path from the swanctl
`pubkey` directory or an absolute path.

Even though multiple local public keys could be defined in principle,
only the first public key in the list is used for authentication.

StrongSwan default: `[]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.local.<name>.round` {#opt-services.strongswan-swanctl.swanctl.connections._name_.local._name_.round}

Optional numeric identifier by which authentication rounds are
sorted. If not specified rounds are ordered by their position in the
config file/vici message.

StrongSwan default: `0`

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.local.<name>.xauth_id` {#opt-services.strongswan-swanctl.swanctl.connections._name_.local._name_.xauth_id}

Client XAuth username used in the XAuth exchange.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.local_addrs` {#opt-services.strongswan-swanctl.swanctl.connections._name_.local_addrs}

Local address(es) to use for IKE communication. Takes
single IPv4/IPv6 addresses, DNS names, CIDR subnets or IP address ranges.

As initiator, the first non-range/non-subnet is used to initiate the
connection from. As responder, the local destination address must match at
least to one of the specified addresses, subnets or ranges.

If FQDNs are assigned they are resolved every time a configuration lookup
is done. If DNS resolution times out, the lookup is delayed for that time.

StrongSwan default: `[]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.local_port` {#opt-services.strongswan-swanctl.swanctl.connections._name_.local_port}

Local UDP port for IKE communication. By default the port of the socket
backend is used, which is usually `500`. If port
`500` is used, automatic IKE port floating to port
`4500` is used to work around NAT issues.

Using a non-default local IKE port requires support from the socket
backend in use (socket-dynamic).

StrongSwan default: `500`

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.mediated_by` {#opt-services.strongswan-swanctl.swanctl.connections._name_.mediated_by}

The name of the connection to mediate this connection through. If given,
the connection will be mediated through the named mediation
connection. The mediation connection must have mediation enabled.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.mediation` {#opt-services.strongswan-swanctl.swanctl.connections._name_.mediation}

Whether this connection is a mediation connection, that is, whether this
connection is used to mediate other connections using the IKEv2 Mediation
Extension. Mediation connections create no CHILD\_SA.

StrongSwan default: `false`

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.mediation_peer` {#opt-services.strongswan-swanctl.swanctl.connections._name_.mediation_peer}

Identity under which the peer is registered at the mediation server, that
is, the IKE identity the other end of this connection uses as its local
identity on its connection to the mediation server. This is the identity
we request the mediation server to mediate us with. Only relevant on
connections that set mediated\_by. If it is not given, the remote IKE
identity of the first authentication round of this connection will be
used.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.mobike` {#opt-services.strongswan-swanctl.swanctl.connections._name_.mobike}

Enables MOBIKE on IKEv2 connections. MOBIKE is enabled by default on IKEv2
connections, and allows mobility of clients and multi-homing on servers by
migrating active IPsec tunnels.

Usually keeping MOBIKE enabled is unproblematic, as it is not used if the
peer does not indicate support for it. However, due to the design of
MOBIKE, IKEv2 always floats to port 4500 starting from the second
exchange. Some implementations don't like this behavior, hence it can be
disabled.

StrongSwan default: `true`

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.over_time` {#opt-services.strongswan-swanctl.swanctl.connections._name_.over_time}

Hard IKE\_SA lifetime if rekey/reauth does not complete, as time. To avoid
having an IKE/ISAKMP kept alive if IKE reauthentication or rekeying fails
perpetually, a maximum hard lifetime may be specified. If the IKE\_SA fails
to rekey or reauthenticate within the specified time, the IKE\_SA gets
closed.

In contrast to CHILD\_SA rekeying, over\_time is relative in time to the
rekey\_time and reauth\_time values, as it applies to both.

The default is 10% of the longer of `rekey_time` and
`reauth_time`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.pools` {#opt-services.strongswan-swanctl.swanctl.connections._name_.pools}

List of named IP pools to allocate virtual IP addresses
and other configuration attributes from. Each name references a pool by
name from either the pools section or an external pool.

StrongSwan default: `[]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.ppk_id` {#opt-services.strongswan-swanctl.swanctl.connections._name_.ppk_id}

String identifying the Postquantum Preshared Key (PPK) to be used.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.ppk_required` {#opt-services.strongswan-swanctl.swanctl.connections._name_.ppk_required}

Whether a Postquantum Preshared Key (PPK) is required for this connection.

StrongSwan default: `false`

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.proposals` {#opt-services.strongswan-swanctl.swanctl.connections._name_.proposals}

A proposal is a set of algorithms. For non-AEAD IKE proposals, this includes
an encryption algorithm, an integrity algorithm, a pseudo-random function
and a key exchange method. For AEAD proposals, instead of encryption and
integrity algorithms, a combined mode algorithm is used.

With peers that support multiple IKEv2 key exchanges (RFC 9370), up to seven
additional key exchanges may be negotiated. They can be configured by
prefixing the algorithm keyword with **keX\_** (where X is a number between
1 and 7).

For IKEv2, multiple algorithms of the same kind can be specified in a single
proposal, from which one gets selected. For IKEv1, only one algorithm per
kind is allowed per proposal, more algorithms get implicitly stripped. Use
multiple proposals to offer different algorithm combinations with IKEv1.

Algorithm keywords get separated using dashes. The special value *default*
forms a default proposal of supported algorithms considered safe, and is
usually a good choice for interoperability.

StrongSwan default: `["default"]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.pull` {#opt-services.strongswan-swanctl.swanctl.connections._name_.pull}

If the default of yes is used, Mode Config works in pull mode, where the
initiator actively requests a virtual IP. With no, push mode is used,
where the responder pushes down a virtual IP to the initiating peer.

Push mode is currently supported for IKEv1, but not in IKEv2. It is used
by a few implementations only, pull mode is recommended.

StrongSwan default: `true`

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.rand_time` {#opt-services.strongswan-swanctl.swanctl.connections._name_.rand_time}

Time range from which to choose a random value to subtract from
rekey/reauth times. To avoid having both peers initiating the rekey/reauth
procedure simultaneously, a random time gets subtracted from the
rekey/reauth times.

The default is equal to the configured `over_time`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.reauth_time` {#opt-services.strongswan-swanctl.swanctl.connections._name_.reauth_time}

Time to schedule IKE reauthentication. IKE reauthentication recreates the
IKE/ISAKMP SA from scratch and re-evaluates the credentials. In asymmetric
configurations (with EAP or configuration payloads) it might not be
possible to actively reauthenticate as responder. The IKEv2
reauthentication lifetime negotiation can instruct the client to perform
reauthentication.

Reauthentication is disabled by default. Enabling it can usually result in
short connection interruptions, even when using make-before-break
reauthentication, which is now the default. However, they are significantly
shorter than when using the legacy break-before-make approach.

StrongSwan default: `"0s"`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.rekey_time` {#opt-services.strongswan-swanctl.swanctl.connections._name_.rekey_time}

IKE rekeying refreshes key material using a Diffie-Hellman exchange, but
does not re-check associated credentials. It is supported in IKEv2 only,
IKEv1 performs a reauthentication procedure instead.

With the default value IKE rekeying is scheduled every 4 hours, minus the
configured rand\_time. If a reauth\_time is configured, rekey\_time defaults
to zero, disabling rekeying; explicitly set both to enforce rekeying and
reauthentication.

StrongSwan default: `"4h"`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote}

Section for a remote authentication round. A remote authentication round
defines the constraints how the peers must authenticate to use this
connection. Multiple rounds may be defined to use IKEv2 RFC 4739 Multiple
Authentication or IKEv1 XAuth.

Each round is defined in a section having `remote` as
prefix, and an optional unique suffix. To define a single authentication
round, the suffix may be omitted.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote.<name>.auth` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote._name_.auth}

Authentication to expect from remote. See the `local`
section's `auth` keyword description about the details of
supported mechanisms.

Since 5.4.0, to require a trustchain public key strength for the remote
side, specify the key type followed by the minimum strength in bits (for
example `ecdsa-384` or
`rsa-2048-ecdsa-256`). To limit the acceptable set of
hashing algorithms for trustchain validation, append hash algorithms to
pubkey or a key strength definition (for example
`pubkey-sha256-sha512`,
`rsa-2048-sha256-sha384-sha512` or
`rsa-2048-sha256-ecdsa-256-sha256-sha384`).
Unless disabled in `strongswan.conf`, or explicit IKEv2
signature constraints are configured (refer to the description of the
`local` section's `auth` keyword for
details), such key types and hash algorithms are also applied as
constraints against IKEv2 signature authentication schemes used by the
remote side. To require RSASSA-PSS signatures use
`rsa/pss` instead of `pubkey` or
`rsa` as in e.g. `rsa/pss-sha256`. If
`pubkey` or `rsa` constraints are
configured RSASSA-PSS signatures will only be accepted if enabled in
`strongswan.conf`(5).

To specify trust chain constraints for EAP-(T)TLS, append a colon to the
EAP method, followed by the key type/size and hash algorithm as
discussed above (e.g. `eap-tls:ecdsa-384-sha384`).

StrongSwan default: `"pubkey"`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote.<name>.ca_id` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote._name_.ca_id}

Identity in CA certificate to accept for authentication. The specified
identity must be contained in one (intermediate) CA of the remote peer
trustchain, either as subject or as subjectAltName. This has the same
effect as specifying `cacerts` to force clients under
a CA to specific connections; it does not require the CA certificate
to be available locally, and can be received from the peer during the
IKE exchange.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote.<name>.cacert` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote._name_.cacert}

Section for a CA certificate to accept for authentication. Certificates
in cacerts are transmitted as binary blobs, these sections offer more
flexibility.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote.<name>.cacert.<name>.file` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote._name_.cacert._name_.file}

Absolute path to the certificate to load. Passed as-is to the daemon, so
it must be readable by it.

Configure either this or `handle`, but not both, in one section.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote.<name>.cacert.<name>.handle` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote._name_.cacert._name_.handle}

Hex-encoded CKA\_ID or handle of the certificate on a token or TPM,
respectively.

Configure either this or `file`, but not both, in one section.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote.<name>.cacert.<name>.module` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote._name_.cacert._name_.module}

Optional PKCS#11 module name.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote.<name>.cacert.<name>.slot` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote._name_.cacert._name_.slot}

Optional slot number of the token that stores the certificate.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote.<name>.cacerts` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote._name_.cacerts}

List of CA certificates to accept for
authentication. The certificates may use a relative path from the
swanctl `x509ca` directory or an absolute path.

StrongSwan default: `[]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote.<name>.cert` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote._name_.cert}

Section for a certificate candidate to use for
authentication. Certificates in certs are transmitted as binary blobs,
these sections offer more flexibility.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote.<name>.cert.<name>.file` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote._name_.cert._name_.file}

Absolute path to the certificate to load. Passed as-is to the daemon, so
it must be readable by it.

Configure either this or `handle`, but not both, in one section.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote.<name>.cert.<name>.handle` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote._name_.cert._name_.handle}

Hex-encoded CKA\_ID or handle of the certificate on a token or TPM,
respectively.

Configure either this or `file`, but not both, in one section.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote.<name>.cert.<name>.module` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote._name_.cert._name_.module}

Optional PKCS#11 module name.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote.<name>.cert.<name>.slot` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote._name_.cert._name_.slot}

Optional slot number of the token that stores the certificate.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote.<name>.cert_policy` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote._name_.cert_policy}

List of certificate policy OIDs the peer's certificate
must have. OIDs are specified using the numerical dotted representation.

StrongSwan default: `[]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote.<name>.certs` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote._name_.certs}

List of certificates to accept for authentication. The certificates may
use a relative path from the swanctl `x509` directory
or an absolute path.

StrongSwan default: `[]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote.<name>.eap_id` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote._name_.eap_id}

Identity to use as peer identity during EAP authentication. If set to
`%any` the EAP-Identity method will be used to ask the
client for an EAP identity.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote.<name>.groups` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote._name_.groups}

Authorization group memberships to require. The peer
must prove membership to at least one of the specified groups. Group
membership can be certified by different means, for example by
appropriate Attribute Certificates or by an AAA backend involved in the
authentication.

StrongSwan default: `[]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote.<name>.id` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote._name_.id}

IKE identity to expect for authentication round. When using certificate
authentication, the IKE identity must be contained in the certificate,
either as subject or as subjectAltName.

StrongSwan default: `"%any"`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote.<name>.pubkeys` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote._name_.pubkeys}

List of raw public keys to accept for
authentication. The public keys may use a relative path from the swanctl
`pubkey` directory or an absolute path.

StrongSwan default: `[]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote.<name>.revocation` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote._name_.revocation}

Certificate revocation policy for CRL or OCSP revocation.

- A `strict` revocation policy fails if no revocation information is
  available, i.e. the certificate is not known to be unrevoked.
- `ifuri` fails only if a CRL/OCSP URI is available, but certificate
  revocation checking fails, i.e. there should be revocation information
  available, but it could not be obtained.
- The default revocation policy `relaxed` fails only if a certificate is
  revoked, i.e. it is explicitly known that it is bad.

StrongSwan default: `"relaxed"`

*Type:* null or one of "strict", "ifuri", "relaxed"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote.<name>.round` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote._name_.round}

Optional numeric identifier by which authentication rounds are
sorted. If not specified rounds are ordered by their position in the
config file/vici message.

StrongSwan default: `0`

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote_addrs` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote_addrs}

Remote address(es) to use for IKE communication. Takes
single IPv4/IPv6 addresses, DNS names, CIDR subnets or IP address ranges.

As initiator, the first non-range/non-subnet is used to initiate the
connection to. As responder, the initiator source address must match at
least to one of the specified addresses, subnets or ranges.

If FQDNs are assigned they are resolved every time a configuration lookup
is done. If DNS resolution times out, the lookup is delayed for that time.
To initiate a connection, at least one specific address or DNS name must
be specified.

StrongSwan default: `[]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.remote_port` {#opt-services.strongswan-swanctl.swanctl.connections._name_.remote_port}

Remote UDP port for IKE communication. If the default of port
`500` is used, automatic IKE port floating to port
`4500` is used to work around NAT issues.

StrongSwan default: `500`

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.send_cert` {#opt-services.strongswan-swanctl.swanctl.connections._name_.send_cert}

Send certificate payloads when using certificate authentication.

- With the default of `ifasked` the daemon sends
  certificate payloads only if certificate requests have been received.
- `never` disables sending of certificate payloads
  altogether,
- `always` causes certificate payloads to be sent
  unconditionally whenever certificate authentication is used.

StrongSwan default: `"ifasked"`

*Type:* null or one of "always", "never", "ifasked"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.send_certreq` {#opt-services.strongswan-swanctl.swanctl.connections._name_.send_certreq}

Send certificate request payloads to offer trusted root CA certificates to
the peer. Certificate requests help the peer to choose an appropriate
certificate/private key for authentication and are enabled by default.
Disabling certificate requests can be useful if too many trusted root CA
certificates are installed, as each certificate request increases the size
of the initial IKE packets.

StrongSwan default: `true`

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.unique` {#opt-services.strongswan-swanctl.swanctl.connections._name_.unique}

Connection uniqueness policy to enforce. To avoid multiple connections
from the same user, a uniqueness policy can be enforced.

- The value `never` does never enforce such a policy, even
  if a peer included INITIAL\_CONTACT notification messages,
- whereas `no` replaces existing connections for the same
  identity if a new one has the INITIAL\_CONTACT notify.
- `keep` rejects new connection attempts if the same user
  already has an active connection,
- `replace` deletes any existing connection if a new one
  for the same user gets established.

To compare connections for uniqueness, the remote IKE identity is used. If
EAP or XAuth authentication is involved, the EAP-Identity or XAuth
username is used to enforce the uniqueness policy instead.

On initiators this setting specifies whether an INITIAL\_CONTACT notify is
sent during IKE\_AUTH if no existing connection is found with the remote
peer (determined by the identities of the first authentication
round). Unless set to `never` the client will send a notify.

StrongSwan default: `"no"`

*Type:* null or one of "no", "never", "keep", "replace"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.version` {#opt-services.strongswan-swanctl.swanctl.connections._name_.version}

IKE major version to use for connection.

- 1 uses IKEv1 aka ISAKMP,
- 2 uses IKEv2 (the default).
- A connection using 0 accepts both IKEv1 and IKEv2 as responder,
  and initiates the connection actively with IKEv2.

StrongSwan default: `2`

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.connections.<name>.vips` {#opt-services.strongswan-swanctl.swanctl.connections._name_.vips}

List of virtual IPs to request in IKEv2 configuration payloads or IKEv1
Mode Config. The wildcard addresses `0.0.0.0` and
`::` request an arbitrary address, specific addresses may
be defined. The responder may return a different address, though, or none
at all.

StrongSwan default: `[]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.pools` {#opt-services.strongswan-swanctl.swanctl.pools}

Section defining named pools. Named pools may be referenced by connections
with the pools option to assign virtual IPs and other configuration
attributes. Each pool must have a unique name (denoted \<name\> below).

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.pools.<name>.addrs` {#opt-services.strongswan-swanctl.swanctl.pools._name_.addrs}

Addresses allocated in pool.

Subnet or range defining addresses allocated in pool. Accepts a single CIDR
subnet defining the pool to allocate addresses from or an address range
(<from>-<to>). If the address in CIDR notation is not the network ID of the
subnet (e.g. 10.1.0.5/24 instead of 10.1.0.0/24), addresses below it won't
be allocated to clients (they could e.g. be assigned manually to internal
hosts like the VPN server itself). Pools must be unique and non-overlapping

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.pools.<name>.dhcp` {#opt-services.strongswan-swanctl.swanctl.pools._name_.dhcp}

Address or CIDR subnets

StrongSwan default: `[]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.pools.<name>.dns` {#opt-services.strongswan-swanctl.swanctl.pools._name_.dns}

Address or CIDR subnets

StrongSwan default: `[]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.pools.<name>.nbns` {#opt-services.strongswan-swanctl.swanctl.pools._name_.nbns}

Address or CIDR subnets

StrongSwan default: `[]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.pools.<name>.netmask` {#opt-services.strongswan-swanctl.swanctl.pools._name_.netmask}

Address or CIDR subnets

StrongSwan default: `[]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.pools.<name>.p_cscf` {#opt-services.strongswan-swanctl.swanctl.pools._name_.p_cscf}

Address or CIDR subnets

StrongSwan default: `[]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.pools.<name>.server` {#opt-services.strongswan-swanctl.swanctl.pools._name_.server}

Address or CIDR subnets

StrongSwan default: `[]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.pools.<name>.split_exclude` {#opt-services.strongswan-swanctl.swanctl.pools._name_.split_exclude}

Address or CIDR subnets

StrongSwan default: `[]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.pools.<name>.split_include` {#opt-services.strongswan-swanctl.swanctl.pools._name_.split_include}

Address or CIDR subnets

StrongSwan default: `[]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.pools.<name>.subnet` {#opt-services.strongswan-swanctl.swanctl.pools._name_.subnet}

Address or CIDR subnets

StrongSwan default: `[]`

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.eap` {#opt-services.strongswan-swanctl.swanctl.secrets.eap}

EAP secret section for a specific secret. Each EAP secret is defined in a
unique section having the `eap` prefix. EAP secrets are
used for XAuth authentication as well.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.eap.<name>.id` {#opt-services.strongswan-swanctl.swanctl.secrets.eap._name_.id}

Identity the EAP/XAuth secret belongs to. Multiple unique identities may
be specified, each having an `id` prefix, if a secret
is shared between multiple users.

*Type:* attribute set of (null or string)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.eap.<name>.secret` {#opt-services.strongswan-swanctl.swanctl.secrets.eap._name_.secret}

Value of the EAP/XAuth secret. It may either be an ASCII string, a hex
encoded string if it has a 0x prefix or a Base64 encoded string if it
has a 0s prefix in its value.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.ecdsa` {#opt-services.strongswan-swanctl.swanctl.secrets.ecdsa}

Private key decryption passphrase for a key in the
`ecdsa` folder.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.ecdsa.<name>.file` {#opt-services.strongswan-swanctl.swanctl.secrets.ecdsa._name_.file}

File name in the `ecdsa` folder for which this
passphrase should be used.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.ecdsa.<name>.secret` {#opt-services.strongswan-swanctl.swanctl.secrets.ecdsa._name_.secret}

Value of decryption passphrase for ECDSA key.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.ike` {#opt-services.strongswan-swanctl.swanctl.secrets.ike}

IKE preshared secret section for a specific secret. Each IKE PSK is
defined in a unique section having the `ike` prefix.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.ike.<name>.id` {#opt-services.strongswan-swanctl.swanctl.secrets.ike._name_.id}

IKE identity the IKE preshared secret belongs to. Multiple unique
identities may be specified, each having an `id`
prefix, if a secret is shared between multiple peers.

*Type:* attribute set of (null or string)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.ike.<name>.secret` {#opt-services.strongswan-swanctl.swanctl.secrets.ike._name_.secret}

Value of the IKE preshared secret. It may either be an ASCII string, a
hex encoded string if it has a 0x prefix or a Base64 encoded string if
it has a 0s prefix in its value.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.ntlm` {#opt-services.strongswan-swanctl.swanctl.secrets.ntlm}

NTLM secret section for a specific secret. Each NTLM secret is defined in
a unique section having the `ntlm` prefix. NTLM secrets
may only be used for EAP-MSCHAPv2 authentication.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.ntlm.<name>.id` {#opt-services.strongswan-swanctl.swanctl.secrets.ntlm._name_.id}

Identity the NTLM secret belongs to. Multiple unique identities may be
specified, each having an id prefix, if a secret is shared between
multiple users.

*Type:* attribute set of (null or string)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.ntlm.<name>.secret` {#opt-services.strongswan-swanctl.swanctl.secrets.ntlm._name_.secret}

Value of the NTLM secret, which is the NT Hash of the actual secret,
that is, MD4(UTF-16LE(secret)). The resulting 16-byte value may either
be given as a hex encoded string with a 0x prefix or as a Base64 encoded
string with a 0s prefix.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.pkcs12` {#opt-services.strongswan-swanctl.swanctl.secrets.pkcs12}

PKCS#12 decryption passphrase for a container in the
`pkcs12` folder.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.pkcs12.<name>.file` {#opt-services.strongswan-swanctl.swanctl.secrets.pkcs12._name_.file}

File name in the `pkcs12` folder for which this
passphrase should be used.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.pkcs12.<name>.secret` {#opt-services.strongswan-swanctl.swanctl.secrets.pkcs12._name_.secret}

Value of decryption passphrase for PKCS#12 container.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.pkcs8` {#opt-services.strongswan-swanctl.swanctl.secrets.pkcs8}

Private key decryption passphrase for a key in the
`pkcs8` folder.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.pkcs8.<name>.file` {#opt-services.strongswan-swanctl.swanctl.secrets.pkcs8._name_.file}

File name in the `pkcs8` folder for which this
passphrase should be used.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.pkcs8.<name>.secret` {#opt-services.strongswan-swanctl.swanctl.secrets.pkcs8._name_.secret}

Value of decryption passphrase for PKCS#8 key.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.ppk` {#opt-services.strongswan-swanctl.swanctl.secrets.ppk}

Postquantum Preshared Key (PPK) section for a specific secret. Each PPK is
defined in a unique section having the `ppk` prefix.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.ppk.<name>.id` {#opt-services.strongswan-swanctl.swanctl.secrets.ppk._name_.id}

PPK identity the PPK belongs to. Multiple unique identities may be
specified, each having an `id` prefix, if a secret is
shared between multiple peers.

*Type:* attribute set of (null or string)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.ppk.<name>.secret` {#opt-services.strongswan-swanctl.swanctl.secrets.ppk._name_.secret}

Value of the PPK. It may either be an ASCII string, a hex encoded string
if it has a `0x` prefix or a Base64 encoded string if
it has a `0s` prefix in its value. Should have at least
256 bits of entropy for 128-bit security.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.private` {#opt-services.strongswan-swanctl.swanctl.secrets.private}

Private key decryption passphrase for a key in the
`private` folder.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.private.<name>.file` {#opt-services.strongswan-swanctl.swanctl.secrets.private._name_.file}

File name in the private folder for which this passphrase should be used.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.private.<name>.secret` {#opt-services.strongswan-swanctl.swanctl.secrets.private._name_.secret}

Value of decryption passphrase for private key.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.rsa` {#opt-services.strongswan-swanctl.swanctl.secrets.rsa}

Private key decryption passphrase for a key in the `rsa`
folder.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.rsa.<name>.file` {#opt-services.strongswan-swanctl.swanctl.secrets.rsa._name_.file}

File name in the `rsa` folder for which this passphrase
should be used.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.rsa.<name>.secret` {#opt-services.strongswan-swanctl.swanctl.secrets.rsa._name_.secret}

Value of decryption passphrase for RSA key.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.token` {#opt-services.strongswan-swanctl.swanctl.secrets.token}

Definition for a private key that's stored on a token/smartcard/TPM.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.token.<name>.handle` {#opt-services.strongswan-swanctl.swanctl.secrets.token._name_.handle}

Hex-encoded CKA\_ID or handle of the private key on the token or TPM,
respectively.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.token.<name>.module` {#opt-services.strongswan-swanctl.swanctl.secrets.token._name_.module}

Optional PKCS#11 module name to access the token.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.token.<name>.pin` {#opt-services.strongswan-swanctl.swanctl.secrets.token._name_.pin}

Optional PIN required to access the key on the token. If none is
provided the user is prompted during an interactive
`--load-creds` call.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.token.<name>.slot` {#opt-services.strongswan-swanctl.swanctl.secrets.token._name_.slot}

Optional slot number to access the token.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.xauth` {#opt-services.strongswan-swanctl.swanctl.secrets.xauth}

EAP secret section for a specific secret. Each EAP secret is defined in a
unique section having the `eap` prefix. EAP secrets are
used for XAuth authentication as well.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.xauth.<name>.id` {#opt-services.strongswan-swanctl.swanctl.secrets.xauth._name_.id}

Identity the EAP/XAuth secret belongs to. Multiple unique identities may
be specified, each having an `id` prefix, if a secret
is shared between multiple users.

*Type:* attribute set of (null or string)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan-swanctl.swanctl.secrets.xauth.<name>.secret` {#opt-services.strongswan-swanctl.swanctl.secrets.xauth._name_.secret}

Value of the EAP/XAuth secret. It may either be an ASCII string, a hex
encoded string if it has a 0x prefix or a Base64 encoded string if it
has a 0s prefix in its value.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/strongswan-swanctl/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan-swanctl/module.nix)

## `services.strongswan.ca` {#opt-services.strongswan.ca}

A set of CAs (certification authorities) and their options for
the ‘ca xxx’ sections of the `ipsec.conf`
file.

*Type:* attribute set of attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  strongswan = {
    auto = "add";
    cacert = "/run/keys/strongswanCert.pem";
    crluri = "http://crl2.strongswan.org/strongswan.crl";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/strongswan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan.nix)

## `services.strongswan.connections` {#opt-services.strongswan.connections}

A set of connections and their options for the ‘conn xxx’
sections of the `ipsec.conf` file.

*Type:* attribute set of attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  "%default" = {
    keyexchange = "ikev2";
    keyingtries = "1";
  };
  roadwarrior = {
    auto       = "add";
    leftcert   = "/run/keys/moonCert.pem";
    leftid     = "@moon.strongswan.org";
    leftsubnet = "10.1.0.0/16";
    right      = "%any";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/strongswan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan.nix)

## `services.strongswan.enable` {#opt-services.strongswan.enable}

Whether to enable strongSwan.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/strongswan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan.nix)

## `services.strongswan.enabledPlugins` {#opt-services.strongswan.enabledPlugins}

A list of additional plugins to enable if
`managePlugins` is true.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/strongswan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan.nix)

## `services.strongswan.managePlugins` {#opt-services.strongswan.managePlugins}

If set to true, this option will disable automatic plugin loading and
then tell strongSwan to enable the plugins specified in the
`enabledPlugins` option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/strongswan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan.nix)

## `services.strongswan.secrets` {#opt-services.strongswan.secrets}

A list of paths to IPSec secret files. These
files will be included into the main ipsec.secrets file with
the `include` directive. It is safer if these
paths are absolute.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/run/keys/ipsec-foo.secret"
]
```

*Declared by:* [`nixos/modules/services/networking/strongswan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan.nix)

## `services.strongswan.setup` {#opt-services.strongswan.setup}

A set of options for the ‘config setup’ section of the
`ipsec.conf` file. Defines general
configuration parameters.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  cachecrls = "yes";
  strictcrlpolicy = "yes";
}
```

*Declared by:* [`nixos/modules/services/networking/strongswan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/strongswan.nix)

## `services.stubby.enable` {#opt-services.stubby.enable}

Whether to enable Stubby DNS resolver.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/stubby.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/stubby.nix)

## `services.stubby.logLevel` {#opt-services.stubby.logLevel}

Log verbosity (syslog keyword or level).

*Type:* null or one of "alert", "crit", "debug", "emerg", "error", "info", "notice", "warning", 1, 2, 7, 0, 3, 6, 5, 4

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/stubby.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/stubby.nix)

## `services.stubby.settings` {#opt-services.stubby.settings}

Content of the Stubby configuration file. All Stubby settings may be set or queried
here. The default settings are available at
`pkgs.stubby.passthru.settingsExample`. See
[https://dnsprivacy.org/wiki/display/DP/Configuring+Stubby](https://dnsprivacy.org/wiki/display/DP/Configuring+Stubby).
A list of the public recursive servers can be found here:
[https://dnsprivacy.org/wiki/display/DP/DNS+Privacy+Test+Servers](https://dnsprivacy.org/wiki/display/DP/DNS+Privacy+Test+Servers).

*Type:* attribute set of (YAML 1.1 value)

*Default:* `{ }`

*Example:*

``` nix
pkgs.stubby.passthru.settingsExample // {
  upstream_recursive_servers = [{
    address_data = "158.64.1.29";
    tls_auth_name = "kaitain.restena.lu";
    tls_pubkey_pinset = [{
      digest = "sha256";
      value = "7ftvIkA+UeN/ktVkovd/7rPZ6mbkhVI7/8HnFJIiLa4=";
    }];
  }];
};
```

*Declared by:* [`nixos/modules/services/networking/stubby.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/stubby.nix)

## `services.stump.configLocation` {#opt-services.stump.configLocation}

Directory used to store the database and configuration files. If it is not the default, the directory has to be created manually such that the stump user is able to read and write to it.

*Type:* absolute path

*Default:* `"/var/lib/stump"`

*Declared by:* [`nixos/modules/services/web-apps/stump.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stump.nix)

## `services.stump.enable` {#opt-services.stump.enable}

Whether to enable Stump.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/stump.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stump.nix)

## `services.stump.environment` {#opt-services.stump.environment}

Extra configuration environment variables. Refer to the [documentation](https://www.stumpapp.dev/docs/guides/configuration/server-config) for options.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  STUMP_VERBOSITY = "2";
}
```

*Declared by:* [`nixos/modules/services/web-apps/stump.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stump.nix)

## `services.stump.environmentFile` {#opt-services.stump.environmentFile}

Path of a file with extra environment variables to be loaded from disk.
This file is not added to the nix store, so it can be used to pass secrets to stump.
Refer to the [documentation](https://www.stumpapp.dev/docs/guides/configuration/server-config) for options.

*Type:* null or string

*Default:* `null`

*Example:* `"/run/secrets/stump"`

*Declared by:* [`nixos/modules/services/web-apps/stump.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stump.nix)

## `services.stump.group` {#opt-services.stump.group}

The group stump should run as.

*Type:* string

*Default:* `"stump"`

*Declared by:* [`nixos/modules/services/web-apps/stump.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stump.nix)

## `services.stump.ip` {#opt-services.stump.ip}

The IP address that Stump will listen on.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/stump.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stump.nix)

## `services.stump.openFirewall` {#opt-services.stump.openFirewall}

Whether to open the Stump port in the firewall

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/stump.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stump.nix)

## `services.stump.package` {#opt-services.stump.package}

The stump package to use.

*Type:* package

*Default:* `pkgs.stump`

*Declared by:* [`nixos/modules/services/web-apps/stump.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stump.nix)

## `services.stump.port` {#opt-services.stump.port}

The port that Stump will listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `10001`

*Declared by:* [`nixos/modules/services/web-apps/stump.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stump.nix)

## `services.stump.secretFiles` {#opt-services.stump.secretFiles}

Attribute set containing paths to files to add to the environment of stump.
The files are not added to the nix store, so they can be used to pass secrets to stump.
Refer to the [documentation](https://www.stumpapp.dev/docs/guides/configuration/server-config) for options.

*Type:* attribute set of (null or string)

*Default:* `{ }`

*Example:*

``` nix
{
  STUMP_OIDC_CLIENT_SECRET = "/run/secrets/stump_client_secret";
}
```

*Declared by:* [`nixos/modules/services/web-apps/stump.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stump.nix)

## `services.stump.user` {#opt-services.stump.user}

The user Stump should run as.

*Type:* string

*Default:* `"stump"`

*Declared by:* [`nixos/modules/services/web-apps/stump.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/stump.nix)

## `services.stunnel.clients` {#opt-services.stunnel.clients}

Define the client configurations.

By default, verifyChain and OCSPaia are enabled and CAFile is set to `security.pki.caBundle`.

See "SERVICE-LEVEL OPTIONS" in `stunnel(8)`.

*Type:* attribute set of attribute set of (null or boolean or signed integer or string)

*Default:* `{ }`

*Example:*

``` nix
{
  foobar = {
    accept = "0.0.0.0:8080";
    connect = "nixos.org:443";
    verifyChain = false;
  };
}
```

*Declared by:* [`nixos/modules/services/networking/stunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/stunnel.nix)

## `services.stunnel.enable` {#opt-services.stunnel.enable}

Whether to enable the stunnel TLS tunneling service.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/stunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/stunnel.nix)

## `services.stunnel.enableInsecureSSLv3` {#opt-services.stunnel.enableInsecureSSLv3}

Enable support for the insecure SSLv3 protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/stunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/stunnel.nix)

## `services.stunnel.fipsMode` {#opt-services.stunnel.fipsMode}

Enable FIPS 140-2 mode required for compliance.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/stunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/stunnel.nix)

## `services.stunnel.group` {#opt-services.stunnel.group}

The group under which stunnel runs.

*Type:* null or string

*Default:* `"nogroup"`

*Declared by:* [`nixos/modules/services/networking/stunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/stunnel.nix)

## `services.stunnel.logLevel` {#opt-services.stunnel.logLevel}

Verbosity of stunnel output.

*Type:* one of "emerg", "alert", "crit", "err", "warning", "notice", "info", "debug"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/networking/stunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/stunnel.nix)

## `services.stunnel.servers` {#opt-services.stunnel.servers}

Define the server configurations.

See "SERVICE-LEVEL OPTIONS" in `stunnel(8)`.

*Type:* attribute set of attribute set of (null or boolean or signed integer or string)

*Default:* `{ }`

*Example:*

``` nix
{
  fancyWebserver = {
    accept = 443;
    cert = "/path/to/pem/file";
    connect = 8080;
  };
}
```

*Declared by:* [`nixos/modules/services/networking/stunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/stunnel.nix)

## `services.stunnel.user` {#opt-services.stunnel.user}

The user under which stunnel runs.

*Type:* null or string

*Default:* `"nobody"`

*Declared by:* [`nixos/modules/services/networking/stunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/stunnel.nix)

## `services.subsonic.contextPath` {#opt-services.subsonic.contextPath}

The context path, i.e., the last part of the Subsonic
URL. Typically '/' or '/subsonic'. Default '/'

*Type:* absolute path

*Default:* `"/"`

*Declared by:* [`nixos/modules/services/misc/subsonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/subsonic.nix)

## `services.subsonic.defaultMusicFolder` {#opt-services.subsonic.defaultMusicFolder}

Configure Subsonic to use this folder for music.  This option
only has effect the first time Subsonic is started.

*Type:* absolute path

*Default:* `"/var/music"`

*Declared by:* [`nixos/modules/services/misc/subsonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/subsonic.nix)

## `services.subsonic.defaultPlaylistFolder` {#opt-services.subsonic.defaultPlaylistFolder}

Configure Subsonic to use this folder for playlists.  This option
only has effect the first time Subsonic is started.

*Type:* absolute path

*Default:* `"/var/playlists"`

*Declared by:* [`nixos/modules/services/misc/subsonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/subsonic.nix)

## `services.subsonic.defaultPodcastFolder` {#opt-services.subsonic.defaultPodcastFolder}

Configure Subsonic to use this folder for Podcasts.  This option
only has effect the first time Subsonic is started.

*Type:* absolute path

*Default:* `"/var/music/Podcast"`

*Declared by:* [`nixos/modules/services/misc/subsonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/subsonic.nix)

## `services.subsonic.enable` {#opt-services.subsonic.enable}

Whether to enable Subsonic daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/subsonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/subsonic.nix)

## `services.subsonic.home` {#opt-services.subsonic.home}

The directory where Subsonic will create files.
Make sure it is writable.

*Type:* absolute path

*Default:* `"/var/lib/subsonic"`

*Declared by:* [`nixos/modules/services/misc/subsonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/subsonic.nix)

## `services.subsonic.httpsPort` {#opt-services.subsonic.httpsPort}

The port on which Subsonic will listen for
incoming HTTPS traffic. Set to 0 to disable.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `0`

*Declared by:* [`nixos/modules/services/misc/subsonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/subsonic.nix)

## `services.subsonic.listenAddress` {#opt-services.subsonic.listenAddress}

The host name or IP address on which to bind Subsonic.
Only relevant if you have multiple network interfaces and want
to make Subsonic available on only one of them. The default value
will bind Subsonic to all available network interfaces.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/subsonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/subsonic.nix)

## `services.subsonic.maxMemory` {#opt-services.subsonic.maxMemory}

The memory limit (max Java heap size) in megabytes.
Default: 100

*Type:* signed integer

*Default:* `100`

*Declared by:* [`nixos/modules/services/misc/subsonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/subsonic.nix)

## `services.subsonic.port` {#opt-services.subsonic.port}

The port on which Subsonic will listen for
incoming HTTP traffic. Set to 0 to disable.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4040`

*Declared by:* [`nixos/modules/services/misc/subsonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/subsonic.nix)

## `services.subsonic.transcoders` {#opt-services.subsonic.transcoders}

List of paths to transcoder executables that should be accessible
from Subsonic. Symlinks will be created to each executable inside
${config.services.subsonic.home}/transcoders.

*Type:* list of absolute path

*Default:* `[ "${pkgs.ffmpeg.bin}/bin/ffmpeg" ]`

*Declared by:* [`nixos/modules/services/misc/subsonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/subsonic.nix)

## `services.sundtek.enable` {#opt-services.sundtek.enable}

Whether to enable Sundtek driver.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/sundtek.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/sundtek.nix)

## `services.sunshine.applications` {#opt-services.sunshine.applications}

Configuration for applications to be exposed to Moonlight. If this is set, no configuration is possible from the web UI, and must be by the `settings` option.

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
{
  env = {
    PATH = "$(PATH):$(HOME)/.local/bin";
  };
  apps = [
    {
      name = "1440p Desktop";
      prep-cmd = [
        {
          do = "${pkgs.kdePackages.libkscreen}/bin/kscreen-doctor output.DP-4.mode.2560x1440@144";
          undo = "${pkgs.kdePackages.libkscreen}/bin/kscreen-doctor output.DP-4.mode.3440x1440@144";
        }
      ];
      exclude-global-prep-cmd = "false";
      auto-detach = "true";
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/networking/sunshine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sunshine.nix)

## `services.sunshine.applications.apps` {#opt-services.sunshine.applications.apps}

Applications to be exposed to Moonlight.

*Type:* list of (attribute set)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/sunshine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sunshine.nix)

## `services.sunshine.applications.env` {#opt-services.sunshine.applications.env}

Environment variables to be set for the applications.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/sunshine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sunshine.nix)

## `services.sunshine.autoStart` {#opt-services.sunshine.autoStart}

Whether sunshine should be started automatically.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/sunshine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sunshine.nix)

## `services.sunshine.capSysAdmin` {#opt-services.sunshine.capSysAdmin}

Whether to give the Sunshine binary CAP\_SYS\_ADMIN, required for DRM/KMS screen capture.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/sunshine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sunshine.nix)

## `services.sunshine.enable` {#opt-services.sunshine.enable}

Whether to enable Sunshine, a self-hosted game stream host for Moonlight.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/sunshine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sunshine.nix)

## `services.sunshine.openFirewall` {#opt-services.sunshine.openFirewall}

Whether to automatically open ports in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/sunshine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sunshine.nix)

## `services.sunshine.package` {#opt-services.sunshine.package}

The sunshine package to use.

*Type:* package

*Default:* `pkgs.sunshine`

*Declared by:* [`nixos/modules/services/networking/sunshine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sunshine.nix)

## `services.sunshine.settings` {#opt-services.sunshine.settings}

Settings to be rendered into the configuration file. If this is set, no configuration is possible from the web UI.

See [https://docs.lizardbyte.dev/projects/sunshine/latest/md\_docs\_2configuration.html](https://docs.lizardbyte.dev/projects/sunshine/latest/md_docs_2configuration.html) for syntax.

*Type:* open submodule of attribute set of (atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  sunshine_name = "nixos";
}
```

*Declared by:* [`nixos/modules/services/networking/sunshine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sunshine.nix)

## `services.sunshine.settings.port` {#opt-services.sunshine.settings.port}

Base port -- others used are offset from this one, see [https://docs.lizardbyte.dev/projects/sunshine/latest/md\_docs\_2configuration.html#port](https://docs.lizardbyte.dev/projects/sunshine/latest/md_docs_2configuration.html#port) for details.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `47989`

*Declared by:* [`nixos/modules/services/networking/sunshine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/sunshine.nix)

## `services.supergfxd.enable` {#opt-services.supergfxd.enable}

Whether to enable the supergfxd service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/supergfxd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/supergfxd.nix)

## `services.supergfxd.settings` {#opt-services.supergfxd.settings}

The content of /etc/supergfxd.conf.
See [https://gitlab.com/asus-linux/supergfxctl/#config-options-etcsupergfxdconf](https://gitlab.com/asus-linux/supergfxctl/#config-options-etcsupergfxdconf).

*Type:* null or JSON value

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/supergfxd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/supergfxd.nix)

## `services.supybot.configFile` {#opt-services.supybot.configFile}

Path to initial supybot config file. This can be generated by
running supybot-wizard.

Note: all paths should include the full path to the stateDir
directory (backup conf data logs logs/plugins plugins tmp web).

*Type:* absolute path

*Declared by:* [`nixos/modules/services/networking/supybot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/supybot.nix)

## `services.supybot.enable` {#opt-services.supybot.enable}

Enable Supybot, an IRC bot (also known as Limnoria).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/supybot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/supybot.nix)

## `services.supybot.extraPackages` {#opt-services.supybot.extraPackages}

Extra Python packages available to supybot plugins. The
value must be a function which receives the attrset defined
in `python3Packages` as the sole argument.

*Type:* function that evaluates to a(n) list of package

*Default:* `p: []`

*Example:* `p: [ p.lxml p.requests ]`

*Declared by:* [`nixos/modules/services/networking/supybot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/supybot.nix)

## `services.supybot.plugins` {#opt-services.supybot.plugins}

Attribute set of additional plugins that will be symlinked to the
`plugin` subdirectory.

Please note that you still need to add the plugins to the config
file (or with `!load`) using their attribute name.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
let
  plugins = pkgs.fetchzip {
    url = "https://github.com/ProgVal/Supybot-plugins/archive/57c2450c.zip";
    sha256 = "077snf84ibnva3sbpzdfpfma6hcdw7dflwnhg6pw7mgnf0nd84qd";
  };
in
{
  Wikipedia = "${plugins}/Wikipedia";
  Decide = ./supy-decide;
}
```

*Declared by:* [`nixos/modules/services/networking/supybot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/supybot.nix)

## `services.supybot.stateDir` {#opt-services.supybot.stateDir}

The root directory, logs and plugins are stored here

*Type:* absolute path

*Default:* `/var/lib/supybot`

*Declared by:* [`nixos/modules/services/networking/supybot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/supybot.nix)

## `services.suricata.disabledRules` {#opt-services.suricata.disabledRules}

List of matchers specifying which rules should be disabled.
These can be raw SID numbers or something like "group:emerging-coinminer.rules".

*Type:* list of string

*Default:*

``` nix
[
  "2270000"
  "2270001"
  "2270002"
  "2270003"
  "2270004"
  "2270005"
  "2270006"
  "2270007"
]
```

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.dropRules` {#opt-services.suricata.dropRules}

List of matchers specifying which rules should be converted to drop rules.
These can be raw SID numbers or something like "group:emerging-coinminer.rules".

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[ "2274852" "4327876" "902244405" ]
```

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.enable` {#opt-services.suricata.enable}

Whether to enable Suricata.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.enabledSources` {#opt-services.suricata.enabledSources}

List of sources that should be enabled.
Currently sources which require a secret-code are not supported.

*Type:* list of string

*Default:*

``` nix
[
  "abuse.ch/sslbl-blacklist"
  "abuse.ch/sslbl-c2"
  "abuse.ch/sslbl-ja3"
  "et/open"
  "etnetera/aggressive"
  "stamus/lateral"
  "oisf/trafficid"
  "tgreen/hunting"
  "pawpatrules"
  "ptrules/open"
]
```

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.package` {#opt-services.suricata.package}

The suricata package to use.

*Type:* package

*Default:* `pkgs.suricata`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.reloadOnRulesetUpdate` {#opt-services.suricata.reloadOnRulesetUpdate}

Whether to reload Suricata if it is running after an automated ruleset update.
This is a blocking reload, and may take some time depending on the number of rules and computational power of the host.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings` {#opt-services.suricata.settings}

Suricata settings

*Type:* open submodule of (YAML 1.1 value)

*Example:*

``` nix
vars.address-groups.HOME_NET = "192.168.178.0/24";
outputs = [
  {
    fast = {
      enabled = true;
      filename = "fast.log";
      append = "yes";
    };
  }
  {
    eve-log = {
      enabled = true;
      filetype = "regular";
      filename = "eve.json";
      community-id = true;
      types = [
        {
          alert.tagged-packets = "yes";
        }
      ];
    };
  }
];
af-packet = [
  {
    interface = "eth0";
    cluster-id = "99";
    cluster-type = "cluster_flow";
    defrag = "yes";
  }
  {
    interface = "default";
  }
];
af-xdp = [
  {
    interface = "eth1";
  }
];
dpdk.interfaces = [
  {
    interface = "eth2";
  }
];
pcap = [
  {
    interface = "eth3";
  }
];
app-layer.protocols = {
  telnet.enabled = "yes";
  dnp3.enabled = "yes";
  modbus.enabled = "yes";
};
```

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.af-packet` {#opt-services.suricata.settings.af-packet}

Linux high speed capture support.

*Type:* null or (list of (open submodule of (YAML 1.1 value)))

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.af-packet.*.interface` {#opt-services.suricata.settings.af-packet._.interface}

af-packet capture interface, see [upstream docs reagrding tuning](https://docs.suricata.io/en/latest/performance/tuning-considerations.html#af-packet).

*Type:* string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.af-xdp` {#opt-services.suricata.settings.af-xdp}

Linux high speed af-xdp capture support, see
[docs/capture-hardware/af-xdp](https://docs.suricata.io/en/suricata-7.0.3/capture-hardware/af-xdp.html).

*Type:* null or (list of (open submodule of (YAML 1.1 value)))

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.af-xdp.*.interface` {#opt-services.suricata.settings.af-xdp._.interface}

af-xdp capture interface, see [upstream docs](https://docs.suricata.io/en/latest/capture-hardware/af-xdp.html).

*Type:* string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.app-layer` {#opt-services.suricata.settings.app-layer}

app-layer configuration, see [upstream docs](https://docs.suricata.io/en/latest/rules/app-layer.html).

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.app-layer.error-policy` {#opt-services.suricata.settings.app-layer.error-policy}

The error-policy setting applies to all app-layer parsers. Values can be
"drop-flow", "pass-flow", "bypass", "drop-packet", "pass-packet", "reject" or
"ignore" (the default).

*Type:* one of "drop-flow", "pass-flow", "bypass", "drop-packet", "pass-packet", "reject", "ignore"

*Default:* `"ignore"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.app-layer.protocols` {#opt-services.suricata.settings.app-layer.protocols}

app-layer protocols, see [upstream docs](https://docs.suricata.io/en/latest/rules/app-layer.html).

*Type:* null or (attribute set of (open submodule of (YAML 1.1 value)))

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.app-layer.protocols.<name>.enabled` {#opt-services.suricata.settings.app-layer.protocols._name_.enabled}

The option "enabled" takes 3 values - "yes", "no", "detection-only".
"yes" enables both detection and the parser, "no" disables both, and
"detection-only" enables protocol detection only (parser disabled).

*Type:* one of "yes", "no", "detection-only"

*Default:* `"no"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.classification-file` {#opt-services.suricata.settings.classification-file}

Suricata classification configuration file.

*Type:* string

*Default:* `"/var/lib/suricata/rules/classification.config"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.default-log-dir` {#opt-services.suricata.settings.default-log-dir}

The default logging directory. Any log or output file will be placed here if it's
not specified with a full path name. This can be overridden with the -l command
line parameter.

*Type:* string

*Default:* `"/var/log/suricata"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.default-rule-path` {#opt-services.suricata.settings.default-rule-path}

Path in which suricata-update managed rules are stored by default.

*Type:* absolute path

*Default:* `"/var/lib/suricata/rules"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.dpdk` {#opt-services.suricata.settings.dpdk}

Data Plane Development Kit is a framework for fast packet processing in data plane applications running on a wide variety of CPU architectures. DPDK's Environment Abstraction Layer (EAL) provides a generic interface to low-level resources. It is a unique way how DPDK libraries access NICs. EAL creates an API for an application to access NIC resources from the userspace level. In DPDK, packets are not retrieved via interrupt handling. Instead, the application polls the NIC for newly received packets.

DPDK allows the user space application to directly access memory where the NIC stores the packets. As a result, neither DPDK nor the application copies the packets for the inspection. The application directly processes packets via passed packet descriptors.
See [docs/capture-hardware/dpdk](https://docs.suricata.io/en/suricata-7.0.7/capture-hardware/dpdk.html) and [docs/configuration/suricata-yaml.html#data-plane-development-kit-dpdk](https://docs.suricata.io/en/suricata-7.0.7/configuration/suricata-yaml.html#data-plane-development-kit-dpdk).

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.dpdk.eal-params.proc-type` {#opt-services.suricata.settings.dpdk.eal-params.proc-type}

dpdk eal-params.proc-type, see [data plane development kit docs](https://doc.dpdk.org/guides/linux_gsg/linux_eal_parameters.html#multiprocessing-related-options).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.dpdk.interfaces` {#opt-services.suricata.settings.dpdk.interfaces}

See upstream docs: [docs/capture-hardware/dpdk](https://docs.suricata.io/en/suricata-7.0.7/capture-hardware/dpdk.html) and [docs/configuration/suricata-yaml.html#data-plane-development-kit-dpdk](https://docs.suricata.io/en/suricata-7.0.7/configuration/suricata-yaml.html#data-plane-development-kit-dpdk).

*Type:* null or (list of (open submodule of (YAML 1.1 value)))

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.dpdk.interfaces.*.interface` {#opt-services.suricata.settings.dpdk.interfaces._.interface}

See upstream docs: [docs/capture-hardware/dpdk](https://docs.suricata.io/en/suricata-7.0.7/capture-hardware/dpdk.html) and [docs/configuration/suricata-yaml.html#data-plane-development-kit-dpdk](https://docs.suricata.io/en/suricata-7.0.7/configuration/suricata-yaml.html#data-plane-development-kit-dpdk).

*Type:* string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.exception-policy` {#opt-services.suricata.settings.exception-policy}

Define a common behavior for all exception policies.
In IPS mode, the default is drop-flow. For cases when that's not possible, the
engine will fall to drop-packet. To fallback to old behavior (setting each of
them individually, or ignoring all), set this to ignore.
All values available for exception policies can be used, and there is one
extra option: auto - which means drop-flow or drop-packet (as explained above)
in IPS mode, and ignore in IDS mode. Exception policy values are: drop-packet,
drop-flow, reject, bypass, pass-packet, pass-flow, ignore (disable).

*Type:* one of "auto", "drop-packet", "drop-flow", "reject", "bypass", "pass-packet", "pass-flow", "ignore"

*Default:* `"auto"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.host-mode` {#opt-services.suricata.settings.host-mode}

If the Suricata box is a router for the sniffed networks, set it to 'router'. If
it is a pure sniffing setup, set it to 'sniffer-only'. If set to auto, the variable
is internally switched to 'router' in IPS mode and 'sniffer-only' in IDS mode.
This feature is currently only used by the reject\* keywords.

*Type:* one of "router", "sniffer-only", "auto"

*Default:* `"auto"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.includes` {#opt-services.suricata.settings.includes}

Files to include in the suricata configuration. See
[docs/configuration/suricata-yaml](https://docs.suricata.io/en/suricata-7.0.3/configuration/suricata-yaml.html)
for available options.

*Type:* null or (list of absolute path)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.logging.default-log-format` {#opt-services.suricata.settings.logging.default-log-format}

The default output format. Optional parameter, should default to
something reasonable if not provided. Can be overridden in an
output section.  You can leave this out to get the default.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.logging.default-log-level` {#opt-services.suricata.settings.logging.default-log-level}

The default log level: can be overridden in an output section.
Note that debug level logging will only be emitted if Suricata was
compiled with the --enable-debug configure option.

*Type:* one of "error", "warning", "notice", "info", "perf", "config", "debug"

*Default:* `"notice"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.logging.default-output-filter` {#opt-services.suricata.settings.logging.default-output-filter}

A regex to filter output.  Can be overridden in an output section.
Defaults to empty (no filter).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.logging.outputs.console.enable` {#opt-services.suricata.settings.logging.outputs.console.enable}

Whether to enable logging to console.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.logging.outputs.file.enable` {#opt-services.suricata.settings.logging.outputs.file.enable}

Whether to enable logging to file.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.logging.outputs.file.filename` {#opt-services.suricata.settings.logging.outputs.file.filename}

Filename of the logfile.

*Type:* string

*Default:* `"suricata.log"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.logging.outputs.file.format` {#opt-services.suricata.settings.logging.outputs.file.format}

Logformat for logs written to the logfile.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.logging.outputs.file.level` {#opt-services.suricata.settings.logging.outputs.file.level}

Loglevel for logs written to the logfile.

*Type:* one of "error", "warning", "notice", "info", "perf", "config", "debug"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.logging.outputs.file.type` {#opt-services.suricata.settings.logging.outputs.file.type}

Type of logfile.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.logging.outputs.syslog.enable` {#opt-services.suricata.settings.logging.outputs.syslog.enable}

Whether to enable logging to syslog.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.logging.outputs.syslog.facility` {#opt-services.suricata.settings.logging.outputs.syslog.facility}

Facility to log to.

*Type:* string

*Default:* `"local5"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.logging.outputs.syslog.format` {#opt-services.suricata.settings.logging.outputs.syslog.format}

Logformat for logs send to syslog.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.logging.outputs.syslog.type` {#opt-services.suricata.settings.logging.outputs.syslog.type}

Type of logs send to syslog.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.logging.stacktrace-on-signal` {#opt-services.suricata.settings.logging.stacktrace-on-signal}

Requires libunwind to be available when Suricata is configured and built.
If a signal unexpectedly terminates Suricata, displays a brief diagnostic
message with the offending stacktrace if enabled.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.outputs` {#opt-services.suricata.settings.outputs}

Configure the type of alert (and other) logging you would like.

Valid values for <NAME> are e. g. `fast`, `eve-log`, `syslog`, `file-store`, ...

- `fast`: a line based alerts log similar to Snort's fast.log
- `eve-log`: Extensible Event Format (nicknamed EVE) event log in JSON format

For more details regarding the configuration, checkout the shipped suricata.yaml

``` shell
nix-shell -p suricata yq coreutils-full --command 'yq < $(dirname $(which suricata))/../etc/suricata/suricata.yaml'
```

and the [suricata documentation](https://docs.suricata.io/en/latest/output/index.html).

*Type:* null or (list of attribute set of (open submodule of (YAML 1.1 value)))

*Default:* `null`

*Example:*

``` nix
[
  {
    fast = {
      enabled = "yes";
      filename = "fast.log";
      append = "yes";
    };
  }
  {
    eve-log = {
      enabled = "yes";
      filetype = "regular";
      filename = "eve.json";
      community-id = true;
      types = [
        {
          alert.tagged-packets = "yes";
        }
      ];
    };
  }
];
```

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.outputs.*.<name>.enabled` {#opt-services.suricata.settings.outputs._._name_.enabled}

Whether to enable <NAME>.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.pcap` {#opt-services.suricata.settings.pcap}

Cross platform libpcap capture support.

*Type:* null or (list of (open submodule of (YAML 1.1 value)))

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.pcap-file.checksum-checks` {#opt-services.suricata.settings.pcap-file.checksum-checks}

Possible values are:

- yes: checksum validation is forced
- no: checksum validation is disabled
- auto: Suricata uses a statistical approach to detect when
  checksum off-loading is used. (default)
  Warning: 'checksum-validation' must be set to yes to have checksum tested.

*Type:* one of "yes", "no", "auto"

*Default:* `"auto"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.pcap.*.interface` {#opt-services.suricata.settings.pcap._.interface}

pcap capture interface, see [upstream docs](https://docs.suricata.io/en/latest/manpages/suricata.html).

*Type:* string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.plugins` {#opt-services.suricata.settings.plugins}

Plugins -- Experimental -- specify the filename for each plugin shared object.

*Type:* null or (list of absolute path)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.reference-config-file` {#opt-services.suricata.settings.reference-config-file}

Suricata reference configuration file.

*Type:* string

*Default:* `"\${config.services.suricata.package}/etc/suricata/reference.config"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.rule-files` {#opt-services.suricata.settings.rule-files}

Files to load suricata-update managed rules, relative to 'default-rule-path'.

*Type:* list of string

*Default:*

``` nix
[
  "suricata.rules"
]
```

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.run-as.group` {#opt-services.suricata.settings.run-as.group}

Run Suricata with a specific group-id.

*Type:* string

*Default:* `"suricata"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.run-as.user` {#opt-services.suricata.settings.run-as.user}

Run Suricata with a specific user-id.

*Type:* string

*Default:* `"suricata"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.stats` {#opt-services.suricata.settings.stats}

Engine statistics such as packet counters, memory use counters and others can be logged in several ways. A separate text log 'stats.log' and an EVE record type 'stats' are enabled by default.

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.stats.decoder-events` {#opt-services.suricata.settings.stats.decoder-events}

Add decode events to stats

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.stats.decoder-events-prefix` {#opt-services.suricata.settings.stats.decoder-events-prefix}

Decoder event prefix in stats. Has been 'decoder' before, but that leads
to missing events in the eve.stats records.

*Type:* string

*Default:* `"decoder.event"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.stats.enable` {#opt-services.suricata.settings.stats.enable}

Whether to enable suricata global stats.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.stats.interval` {#opt-services.suricata.settings.stats.interval}

The interval field (in seconds) controls the interval at
which stats are updated in the log.

*Type:* string

*Default:* `"8"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.stats.stream-events` {#opt-services.suricata.settings.stats.stream-events}

Add stream events as stats.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.threshold-file` {#opt-services.suricata.settings.threshold-file}

Suricata threshold configuration file.

*Type:* string

*Default:* `"\${config.services.suricata.package}/etc/suricata/threshold.config"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.unix-command` {#opt-services.suricata.settings.unix-command}

Unix command socket that can be used to pass commands to Suricata.
An external tool can then connect to get information from Suricata
or trigger some modifications of the engine. Set enabled to yes
to activate the feature. In auto mode, the feature will only be
activated in live capture mode. You can use the filename variable to set
the file name of the socket.

*Type:* null or (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.unix-command.enabled` {#opt-services.suricata.settings.unix-command.enabled}

Enable unix-command socket.

*Type:* boolean or value "auto" (singular enum)

*Default:* `"auto"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.unix-command.filename` {#opt-services.suricata.settings.unix-command.filename}

Filename for unix-command socket.

*Type:* absolute path

*Default:* `"/run/suricata/suricata-command.socket"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.vars` {#opt-services.suricata.settings.vars}

Variables to be used within the suricata rules.

*Type:* null or (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.vars.address-groups` {#opt-services.suricata.settings.vars.address-groups}

The address group variables for suricata, if not defined the
default value of suricata (see example) will be used.
Your settings will extend the predefined values in example.

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
{
  AIM_SERVERS = "$EXTERNAL_NET";
  DC_SERVERS = "$HOME_NET";
  DNP3_CLIENT = "$HOME_NET";
  DNP3_SERVER = "$HOME_NET";
  DNS_SERVERS = "$HOME_NET";
  ENIP_CLIENT = "$HOME_NET";
  ENIP_SERVER = "$HOME_NET";
  EXTERNAL_NET = "!$HOME_NET";
  HOME_NET = "[192.168.0.0/16,10.0.0.0/8,172.16.0.0/12]";
  HTTP_SERVERS = "$HOME_NET";
  MODBUS_CLIENT = "$HOME_NET";
  MODBUS_SERVER = "$HOME_NET";
  SMTP_SERVERS = "$HOME_NET";
  SQL_SERVERS = "$HOME_NET";
  TELNET_SERVERS = "$HOME_NET";
}
```

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.vars.address-groups.AIM_SERVERS` {#opt-services.suricata.settings.vars.address-groups.AIM_SERVERS}

AIM\_SERVERS variable.

*Type:* unspecified value

*Default:* `"$EXTERNAL_NET"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.vars.address-groups.DC_SERVERS` {#opt-services.suricata.settings.vars.address-groups.DC_SERVERS}

DC\_SERVERS variable.

*Type:* unspecified value

*Default:* `"$HOME_NET"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.vars.address-groups.DNP3_CLIENT` {#opt-services.suricata.settings.vars.address-groups.DNP3_CLIENT}

DNP3\_CLIENT variable.

*Type:* unspecified value

*Default:* `"$HOME_NET"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.vars.address-groups.DNP3_SERVER` {#opt-services.suricata.settings.vars.address-groups.DNP3_SERVER}

DNP3\_SERVER variable.

*Type:* unspecified value

*Default:* `"$HOME_NET"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.vars.address-groups.DNS_SERVERS` {#opt-services.suricata.settings.vars.address-groups.DNS_SERVERS}

DNS\_SERVERS variable.

*Type:* unspecified value

*Default:* `"$HOME_NET"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.vars.address-groups.ENIP_CLIENT` {#opt-services.suricata.settings.vars.address-groups.ENIP_CLIENT}

ENIP\_CLIENT variable.

*Type:* unspecified value

*Default:* `"$HOME_NET"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.vars.address-groups.ENIP_SERVER` {#opt-services.suricata.settings.vars.address-groups.ENIP_SERVER}

ENIP\_SERVER variable.

*Type:* unspecified value

*Default:* `"$HOME_NET"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.vars.address-groups.EXTERNAL_NET` {#opt-services.suricata.settings.vars.address-groups.EXTERNAL_NET}

EXTERNAL\_NET variable.

*Type:* unspecified value

*Default:* `"!$HOME_NET"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.vars.address-groups.HOME_NET` {#opt-services.suricata.settings.vars.address-groups.HOME_NET}

HOME\_NET variable.

*Type:* unspecified value

*Default:* `"[192.168.0.0/16,10.0.0.0/8,172.16.0.0/12]"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.vars.address-groups.HTTP_SERVERS` {#opt-services.suricata.settings.vars.address-groups.HTTP_SERVERS}

HTTP\_SERVERS variable.

*Type:* unspecified value

*Default:* `"$HOME_NET"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.vars.address-groups.MODBUS_CLIENT` {#opt-services.suricata.settings.vars.address-groups.MODBUS_CLIENT}

MODBUS\_CLIENT variable

*Type:* unspecified value

*Default:* `"$HOME_NET"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.vars.address-groups.MODBUS_SERVER` {#opt-services.suricata.settings.vars.address-groups.MODBUS_SERVER}

MODBUS\_SERVER variable.

*Type:* unspecified value

*Default:* `"$HOME_NET"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.vars.address-groups.SMTP_SERVERS` {#opt-services.suricata.settings.vars.address-groups.SMTP_SERVERS}

SMTP\_SERVERS variable.

*Type:* unspecified value

*Default:* `"$HOME_NET"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.vars.address-groups.SQL_SERVERS` {#opt-services.suricata.settings.vars.address-groups.SQL_SERVERS}

SQL\_SERVERS variable.

*Type:* unspecified value

*Default:* `"$HOME_NET"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.vars.address-groups.TELNET_SERVERS` {#opt-services.suricata.settings.vars.address-groups.TELNET_SERVERS}

TELNET\_SERVERS variable.

*Type:* unspecified value

*Default:* `"$HOME_NET"`

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.suricata.settings.vars.port-groups` {#opt-services.suricata.settings.vars.port-groups}

The port group variables for suricata.

*Type:* null or (attribute set of string)

*Default:*

``` nix
{
  DNP3_PORTS = "20000";
  FILE_DATA_PORTS = "[$HTTP_PORTS,110,143]";
  FTP_PORTS = "21";
  GENEVE_PORTS = "6081";
  HTTP_PORTS = "80";
  MODBUS_PORTS = "502";
  ORACLE_PORTS = "1521";
  SHELLCODE_PORTS = "!80";
  SSH_PORTS = "22";
  TEREDO_PORTS = "3544";
  VXLAN_PORTS = "4789";
}
```

*Declared by:* [`nixos/modules/services/networking/suricata/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/suricata/default.nix)

## `services.surrealdb.dbPath` {#opt-services.surrealdb.dbPath}

The path that surrealdb will write data to. Use null for in-memory.
Can be one of "memory", "rocksdb://:path", "surrealkv://:path", "tikv://:addr", "fdb://:addr".

*Type:* string

*Default:* `"rocksdb:///var/lib/surrealdb/"`

*Example:* `"memory"`

*Declared by:* [`nixos/modules/services/databases/surrealdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/surrealdb.nix)

## `services.surrealdb.enable` {#opt-services.surrealdb.enable}

Whether to enable SurrealDB, a scalable, distributed, collaborative, document-graph database, for the realtime web.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/surrealdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/surrealdb.nix)

## `services.surrealdb.extraFlags` {#opt-services.surrealdb.extraFlags}

Specify a list of additional command line flags.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--allow-all"
  "--user"
  "root"
  "--pass"
  "root"
]
```

*Declared by:* [`nixos/modules/services/databases/surrealdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/surrealdb.nix)

## `services.surrealdb.host` {#opt-services.surrealdb.host}

The host that surrealdb will connect to.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/databases/surrealdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/surrealdb.nix)

## `services.surrealdb.package` {#opt-services.surrealdb.package}

The surrealdb package to use.

*Type:* package

*Default:* `pkgs.surrealdb`

*Declared by:* [`nixos/modules/services/databases/surrealdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/surrealdb.nix)

## `services.surrealdb.port` {#opt-services.surrealdb.port}

The port that surrealdb will connect to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8000`

*Example:* `8000`

*Declared by:* [`nixos/modules/services/databases/surrealdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/surrealdb.nix)

## `services.suwayomi-server.dataDir` {#opt-services.suwayomi-server.dataDir}

The path to the data directory in which Suwayomi-Server will download scans.

*Type:* absolute path

*Default:* `"/var/lib/suwayomi-server"`

*Example:* `"/var/data/mangas"`

*Declared by:* [`nixos/modules/services/web-apps/suwayomi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/suwayomi-server.nix)

## `services.suwayomi-server.enable` {#opt-services.suwayomi-server.enable}

Whether to enable Suwayomi, a free and open source manga reader server that runs extensions built for Tachiyomi.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/suwayomi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/suwayomi-server.nix)

## `services.suwayomi-server.group` {#opt-services.suwayomi-server.group}

Group under which Suwayomi-Server runs.

*Type:* string

*Default:* `"suwayomi"`

*Example:* `"medias"`

*Declared by:* [`nixos/modules/services/web-apps/suwayomi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/suwayomi-server.nix)

## `services.suwayomi-server.openFirewall` {#opt-services.suwayomi-server.openFirewall}

Whether to open the firewall for the port in [`services.suwayomi-server.settings.server.port`](#opt-services.suwayomi-server.settings.server.port).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/suwayomi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/suwayomi-server.nix)

## `services.suwayomi-server.package` {#opt-services.suwayomi-server.package}

The suwayomi-server package to use.

*Type:* package

*Default:* `pkgs.suwayomi-server`

*Declared by:* [`nixos/modules/services/web-apps/suwayomi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/suwayomi-server.nix)

## `services.suwayomi-server.settings` {#opt-services.suwayomi-server.settings}

Configuration to write to `server.conf`.
See [https://github.com/Suwayomi/Suwayomi-Server/wiki/Configuring-Suwayomi-Server](https://github.com/Suwayomi/Suwayomi-Server/wiki/Configuring-Suwayomi-Server) for more information.

*Type:* open submodule of (HOCON value)

*Default:* `{ }`

*Example:*

``` nix
{
  server = {
    socksProxyEnabled = true;
    socksProxyHost = "yourproxyhost.com";
    socksProxyPort = "8080";
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/suwayomi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/suwayomi-server.nix)

## `services.suwayomi-server.settings.server.basicAuthEnabled` {#opt-services.suwayomi-server.settings.server.basicAuthEnabled}

Whether to enable basic access authentication for Suwayomi-Server.
Enabling this option is useful when hosting on a public network/the Internet
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/suwayomi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/suwayomi-server.nix)

## `services.suwayomi-server.settings.server.basicAuthPasswordFile` {#opt-services.suwayomi-server.settings.server.basicAuthPasswordFile}

The password file containing the value that you have to provide when authenticating.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/secrets/suwayomi-server-password"`

*Declared by:* [`nixos/modules/services/web-apps/suwayomi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/suwayomi-server.nix)

## `services.suwayomi-server.settings.server.basicAuthUsername` {#opt-services.suwayomi-server.settings.server.basicAuthUsername}

The username value that you have to provide when authenticating.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/suwayomi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/suwayomi-server.nix)

## `services.suwayomi-server.settings.server.downloadAsCbz` {#opt-services.suwayomi-server.settings.server.downloadAsCbz}

Download chapters as `.cbz` files.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/suwayomi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/suwayomi-server.nix)

## `services.suwayomi-server.settings.server.extensionRepos` {#opt-services.suwayomi-server.settings.server.extensionRepos}

URL of repositories from which the extensions can be installed.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "https://raw.githubusercontent.com/MY_ACCOUNT/MY_REPO/repo/index.min.json"
]
```

*Declared by:* [`nixos/modules/services/web-apps/suwayomi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/suwayomi-server.nix)

## `services.suwayomi-server.settings.server.ip` {#opt-services.suwayomi-server.settings.server.ip}

The ip that Suwayomi will bind to.

*Type:* string

*Default:* `"0.0.0.0"`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/suwayomi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/suwayomi-server.nix)

## `services.suwayomi-server.settings.server.localSourcePath` {#opt-services.suwayomi-server.settings.server.localSourcePath}

Path to the local source folder.

*Type:* absolute path

*Default:* `suwayomi-server.dataDir`

*Example:* `"/var/data/local_mangas"`

*Declared by:* [`nixos/modules/services/web-apps/suwayomi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/suwayomi-server.nix)

## `services.suwayomi-server.settings.server.port` {#opt-services.suwayomi-server.settings.server.port}

The port that Suwayomi will listen to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Example:* `4567`

*Declared by:* [`nixos/modules/services/web-apps/suwayomi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/suwayomi-server.nix)

## `services.suwayomi-server.settings.server.systemTrayEnabled` {#opt-services.suwayomi-server.settings.server.systemTrayEnabled}

Whether to enable a system tray icon, if possible.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/suwayomi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/suwayomi-server.nix)

## `services.suwayomi-server.user` {#opt-services.suwayomi-server.user}

User account under which Suwayomi-Server runs.

*Type:* string

*Default:* `"suwayomi"`

*Example:* `"root"`

*Declared by:* [`nixos/modules/services/web-apps/suwayomi-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/suwayomi-server.nix)

## `services.svnserve.enable` {#opt-services.svnserve.enable}

Whether to enable svnserve to serve Subversion repositories through the SVN protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/svnserve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/svnserve.nix)

## `services.svnserve.svnBaseDir` {#opt-services.svnserve.svnBaseDir}

Base directory from which Subversion repositories are accessed.

*Type:* string

*Default:* `"/repos"`

*Declared by:* [`nixos/modules/services/misc/svnserve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/svnserve.nix)

## `services.swapspace.enable` {#opt-services.swapspace.enable}

Whether to enable Swapspace, a dynamic swap space manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/system/swapspace.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/swapspace.nix)

## `services.swapspace.extraArgs` {#opt-services.swapspace.extraArgs}

Any extra arguments to pass to swapspace

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-P"
  "-v"
]
```

*Declared by:* [`nixos/modules/services/system/swapspace.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/swapspace.nix)

## `services.swapspace.installWrapper` {#opt-services.swapspace.installWrapper}

This will add swapspace wrapped with the generated config, to environment.systemPackages

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/system/swapspace.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/swapspace.nix)

## `services.swapspace.package` {#opt-services.swapspace.package}

The swapspace package to use.

*Type:* package

*Default:* `pkgs.swapspace`

*Declared by:* [`nixos/modules/services/system/swapspace.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/swapspace.nix)

## `services.swapspace.settings` {#opt-services.swapspace.settings}

Config file for swapspace.
See the options here: [https://github.com/Tookmund/Swapspace/blob/master/swapspace.conf](https://github.com/Tookmund/Swapspace/blob/master/swapspace.conf)

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/system/swapspace.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/swapspace.nix)

## `services.swapspace.settings.buffer_elasticity` {#opt-services.swapspace.settings.buffer_elasticity}

Percentage of buffer space considered to be "free"

*Type:* integer between 0 and 100 (both inclusive)

*Default:* `30`

*Declared by:* [`nixos/modules/services/system/swapspace.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/swapspace.nix)

## `services.swapspace.settings.cache_elasticity` {#opt-services.swapspace.settings.cache_elasticity}

Percentage of cache space considered to be "free"

*Type:* integer between 0 and 100 (both inclusive)

*Default:* `80`

*Declared by:* [`nixos/modules/services/system/swapspace.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/swapspace.nix)

## `services.swapspace.settings.cooldown` {#opt-services.swapspace.settings.cooldown}

Duration (roughly in seconds) of the moratorium on swap allocation that is instated if disk space runs out, or the cooldown time after a new swapfile is successfully allocated before swapspace will consider deallocating swap space again.
The default cooldown period is about 10 minutes.

*Type:* unsigned integer, meaning \>=0

*Default:* `600`

*Declared by:* [`nixos/modules/services/system/swapspace.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/swapspace.nix)

## `services.swapspace.settings.freetarget` {#opt-services.swapspace.settings.freetarget}

Percentage of free space swapspace should aim for when adding swapspace.
This should fall somewhere between lower\_freelimit and upper\_freelimit.

*Type:* integer between 2 and 99 (both inclusive)

*Default:* `30`

*Declared by:* [`nixos/modules/services/system/swapspace.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/swapspace.nix)

## `services.swapspace.settings.lower_freelimit` {#opt-services.swapspace.settings.lower_freelimit}

Lower free-space threshold: if the percentage of free space drops below this number, additional swapspace is allocated

*Type:* integer between 0 and 99 (both inclusive)

*Default:* `20`

*Declared by:* [`nixos/modules/services/system/swapspace.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/swapspace.nix)

## `services.swapspace.settings.max_swapsize` {#opt-services.swapspace.settings.max_swapsize}

Greatest allowed size for individual swapfiles

*Type:* string

*Default:* `"2t"`

*Declared by:* [`nixos/modules/services/system/swapspace.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/swapspace.nix)

## `services.swapspace.settings.min_swapsize` {#opt-services.swapspace.settings.min_swapsize}

Smallest allowed size for individual swapfiles

*Type:* string

*Default:* `"4m"`

*Declared by:* [`nixos/modules/services/system/swapspace.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/swapspace.nix)

## `services.swapspace.settings.swappath` {#opt-services.swapspace.settings.swappath}

Location where swapspace may create and delete swapfiles

*Type:* string

*Default:* `"/var/lib/swapspace"`

*Declared by:* [`nixos/modules/services/system/swapspace.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/swapspace.nix)

## `services.swapspace.settings.upper_freelimit` {#opt-services.swapspace.settings.upper_freelimit}

Upper free-space threshold: if the percentage of free space exceeds this number, swapspace will attempt to free up swapspace

*Type:* integer between 0 and 100 (both inclusive)

*Default:* `60`

*Declared by:* [`nixos/modules/services/system/swapspace.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/swapspace.nix)

## `services.switcherooControl.enable` {#opt-services.switcherooControl.enable}

Whether to enable switcheroo-control, a D-Bus service to check the availability of dual-GPU.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/switcheroo-control.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/switcheroo-control.nix)

## `services.switcherooControl.package` {#opt-services.switcherooControl.package}

The switcheroo-control package to use.

*Type:* package

*Default:* `pkgs.switcheroo-control`

*Declared by:* [`nixos/modules/hardware/video/switcheroo-control.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/switcheroo-control.nix)

## `services.sympa.database.createLocally` {#opt-services.sympa.database.createLocally}

Whether to create a local database automatically.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.database.host` {#opt-services.sympa.database.host}

Database host address.

For MySQL, use `localhost` to connect using Unix domain socket.

For PostgreSQL, use path to directory (e.g. `/run/postgresql`)
to connect using Unix domain socket located in this directory.

Use `null` to fall back on Sympa default, or when using
[`services.sympa.database.createLocally`](#opt-services.sympa.database.createLocally).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.database.name` {#opt-services.sympa.database.name}

Database name. When using SQLite this must be an absolute
path to the database file.

*Type:* string

*Default:* `if database.type == "SQLite" then "/var/lib/sympa/sympa.sqlite" else "sympa"`

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.database.passwordFile` {#opt-services.sympa.database.passwordFile}

A file containing the password for [`services.sympa.database.name`](#opt-services.sympa.database.name).

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/sympa-dbpassword"`

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.database.port` {#opt-services.sympa.database.port}

Database port. Use `null` for default port.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.database.type` {#opt-services.sympa.database.type}

Database engine to use.

*Type:* one of "SQLite", "PostgreSQL", "MySQL"

*Default:* `"SQLite"`

*Example:* `"MySQL"`

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.database.user` {#opt-services.sympa.database.user}

Database user. The system user name is used as a default.

*Type:* null or string

*Default:* `"sympa"`

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.domains` {#opt-services.sympa.domains}

Email domains handled by this instance. There have
to be MX records for keys of this attribute set.

*Type:* attribute set of (submodule)

*Example:*

``` nix
{
  "lists.example.org" = {
    webHost = "lists.example.org";
    webLocation = "/";
  };
  "sympa.example.com" = {
    webHost = "example.com";
    webLocation = "/sympa";
  };
}
```

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.domains.<name>.settings` {#opt-services.sympa.domains._name_.settings}

The `robot.conf` configuration file as key value set.
See [https://sympa-community.github.io/gpldoc/man/sympa.conf.5.html](https://sympa-community.github.io/gpldoc/man/sympa.conf.5.html)
for list of configuration parameters.

*Type:* attribute set of (string or signed integer or boolean)

*Default:* `{ }`

*Example:*

``` nix
{
  default_max_list_members = 3;
}
```

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.domains.<name>.webHost` {#opt-services.sympa.domains._name_.webHost}

Domain part of the web interface URL (no web interface for this domain if `null`).
DNS record of type A (or AAAA or CNAME) has to exist with this value.

*Type:* null or string

*Default:* `null`

*Example:* `"archive.example.org"`

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.domains.<name>.webLocation` {#opt-services.sympa.domains._name_.webLocation}

URL path part of the web interface.

*Type:* string

*Default:* `"/"`

*Example:* `"/sympa"`

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.enable` {#opt-services.sympa.enable}

Whether to enable Sympa mailing list manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.lang` {#opt-services.sympa.lang}

Default Sympa language.
See [https://github.com/sympa-community/sympa/tree/sympa-6.2/po/sympa](https://github.com/sympa-community/sympa/tree/sympa-6.2/po/sympa)
for available options.

*Type:* string

*Default:* `"en_US"`

*Example:* `"cs"`

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.listMasters` {#opt-services.sympa.listMasters}

The list of the email addresses of the listmasters
(users authorized to perform global server commands).

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "postmaster@sympa.example.org"
]
```

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.mainDomain` {#opt-services.sympa.mainDomain}

Main domain to be used in `sympa.conf`.
If `null`, one of the [`services.sympa.domains`](#opt-services.sympa.domains) is chosen for you.

*Type:* null or string

*Default:* `null`

*Example:* `"lists.example.org"`

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.mta.type` {#opt-services.sympa.mta.type}

Mail transfer agent (MTA) integration. Use `none` if you want to configure it yourself.

The `postfix` integration sets up local Postfix instance that will pass incoming
messages from configured domains to Sympa. You still need to configure at least outgoing message
handling using e.g. `services.postfix.relayHost`.

*Type:* one of "postfix", "none"

*Default:* `"postfix"`

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.settings` {#opt-services.sympa.settings}

The `sympa.conf` configuration file as key value set.
See [https://sympa-community.github.io/gpldoc/man/sympa.conf.5.html](https://sympa-community.github.io/gpldoc/man/sympa.conf.5.html)
for list of configuration parameters.

*Type:* attribute set of (string or signed integer or boolean)

*Default:* `{ }`

*Example:*

``` nix
{
  default_home = "lists";
  viewlogs_page_size = 50;
}
```

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.settingsFile` {#opt-services.sympa.settingsFile}

Set of files to be linked in `/var/lib/sympa`.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "list_data/lists.example.org/help" = {
    text = "subject This list provides help to users";
  };
}
```

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.settingsFile.<name>.enable` {#opt-services.sympa.settingsFile._name_.enable}

Whether this file should be generated. This option allows specific files to be disabled.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.settingsFile.<name>.source` {#opt-services.sympa.settingsFile._name_.source}

Path of the source file.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.settingsFile.<name>.text` {#opt-services.sympa.settingsFile._name_.text}

Text of the file.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.web.enable` {#opt-services.sympa.web.enable}

Whether to enable Sympa web interface.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.web.fcgiProcs` {#opt-services.sympa.web.fcgiProcs}

Number of FastCGI processes to fork.

*Type:* positive integer, meaning \>0

*Default:* `2`

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.web.https` {#opt-services.sympa.web.https}

Whether to use HTTPS. When nginx integration is enabled, this option forces SSL and enables ACME.
Please note that Sympa web interface always uses https links even when this option is disabled.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.sympa.web.server` {#opt-services.sympa.web.server}

The webserver used for the Sympa web interface. Set it to `none` if you want to configure it yourself.
Further nginx configuration can be done by adapting
`services.nginx.virtualHosts.«name»`.

*Type:* one of "nginx", "none"

*Default:* `"nginx"`

*Declared by:* [`nixos/modules/services/mail/sympa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/sympa.nix)

## `services.synapse-auto-compressor.enable` {#opt-services.synapse-auto-compressor.enable}

Whether to enable synapse-auto-compressor.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/synapse-auto-compressor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse-auto-compressor.nix)

## `services.synapse-auto-compressor.package` {#opt-services.synapse-auto-compressor.package}

The rust-synapse-compress-state package to use.

*Type:* package

*Default:* `pkgs.rust-synapse-compress-state`

*Declared by:* [`nixos/modules/services/matrix/synapse-auto-compressor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse-auto-compressor.nix)

## `services.synapse-auto-compressor.postgresUrl` {#opt-services.synapse-auto-compressor.postgresUrl}

Connection string to postgresql in the
[rust `postgres` crate config format](https://docs.rs/postgres/latest/postgres/config/struct.Config.html).
The module will attempt to build a URL-style connection string out of the `services.matrix-synapse.settings.database.args`
if a local synapse is enabled.

*Type:* string

*Default:*

``` nix
let
  synapseConfig = config.services.matrix-synapse;
  args = synapseConfig.settings.database.args;
in
if synapseConfig.enable then
  ''postgresql://${args.user}${lib.optionalString (args ? password) (":" + args.password)}@${
    lib.escapeURL (if (args ? host) then args.host else "/run/postgresql")
  }${lib.optionalString (args ? port) (":" + args.port)}${args.database}''
else
  null;
```

*Example:* `"postgresql://username:password@mydomain.com:port/database"`

*Declared by:* [`nixos/modules/services/matrix/synapse-auto-compressor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse-auto-compressor.nix)

## `services.synapse-auto-compressor.settings.chunk_size` {#opt-services.synapse-auto-compressor.settings.chunk_size}

The number of state groups to work on at once. All of the entries from `state_groups_state` are requested
from the database for state groups that are worked on. Therefore small chunk sizes may be needed on
machines with low memory.

Note: if the compressor fails to find space savings on the chunk as a whole
(which may well happen in rooms with lots of backfill in) then the entire chunk is skipped.

*Type:* signed integer

*Default:* `500`

*Declared by:* [`nixos/modules/services/matrix/synapse-auto-compressor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse-auto-compressor.nix)

## `services.synapse-auto-compressor.settings.chunks_to_compress` {#opt-services.synapse-auto-compressor.settings.chunks_to_compress}

`chunks_to_compress` chunks of size `chunk_size` will be compressed. The higher this number is set to,
the longer the compressor will run for.

*Type:* signed integer

*Default:* `100`

*Declared by:* [`nixos/modules/services/matrix/synapse-auto-compressor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse-auto-compressor.nix)

## `services.synapse-auto-compressor.settings.levels` {#opt-services.synapse-auto-compressor.settings.levels}

Sizes of each new level in the compression algorithm, as a comma-separated list. The first entry in
the list is for the lowest, most granular level, with each subsequent entry being for the next highest
level. The number of entries in the list determines the number of levels that will be used. The sum of
the sizes of the levels affects the performance of fetching the state from the database, as the sum of
the sizes is the upper bound on the number of iterations needed to fetch a given set of state.

*Type:* list of signed integer

*Default:*

``` nix
[
  100
  50
  25
]
```

*Declared by:* [`nixos/modules/services/matrix/synapse-auto-compressor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse-auto-compressor.nix)

## `services.synapse-auto-compressor.startAt` {#opt-services.synapse-auto-compressor.startAt}

How often to run this service in systemd calendar syntax (see `systemd.time(7)`)

*Type:* string or list of string

*Default:* `"weekly"`

*Example:* `"daily"`

*Declared by:* [`nixos/modules/services/matrix/synapse-auto-compressor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse-auto-compressor.nix)

## `services.syncoid.commands` {#opt-services.syncoid.commands}

Syncoid commands to run.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "pool/test".target = "root@target:pool/test";
}
```

*Declared by:* [`nixos/modules/services/backup/syncoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/syncoid.nix)

## `services.syncoid.commands.<name>.extraArgs` {#opt-services.syncoid.commands._name_.extraArgs}

Extra syncoid arguments for this command.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--sshport 2222"
]
```

*Declared by:* [`nixos/modules/services/backup/syncoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/syncoid.nix)

## `services.syncoid.commands.<name>.localSourceAllow` {#opt-services.syncoid.commands._name_.localSourceAllow}

Permissions granted for the [`services.syncoid.user`](#opt-services.syncoid.user) user
for local source datasets. See
[https://openzfs.github.io/openzfs-docs/man/8/zfs-allow.8.html](https://openzfs.github.io/openzfs-docs/man/8/zfs-allow.8.html)
for available permissions.
Defaults to [`services.syncoid.localSourceAllow`](#opt-services.syncoid.localSourceAllow) option.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/backup/syncoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/syncoid.nix)

## `services.syncoid.commands.<name>.localTargetAllow` {#opt-services.syncoid.commands._name_.localTargetAllow}

Permissions granted for the [`services.syncoid.user`](#opt-services.syncoid.user) user
for local target datasets. See
[https://openzfs.github.io/openzfs-docs/man/8/zfs-allow.8.html](https://openzfs.github.io/openzfs-docs/man/8/zfs-allow.8.html)
for available permissions.
Make sure to include the `change-key` permission if you send raw encrypted datasets,
the `compression` permission if you send raw compressed datasets, and so on.
For remote target datasets you'll have to set your remote user permissions by yourself.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/backup/syncoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/syncoid.nix)

## `services.syncoid.commands.<name>.recursive` {#opt-services.syncoid.commands._name_.recursive}

Whether to enable the transfer of child datasets.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/syncoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/syncoid.nix)

## `services.syncoid.commands.<name>.recvOptions` {#opt-services.syncoid.commands._name_.recvOptions}

Advanced options to pass to zfs recv. Options are specified
without their leading dashes and separated by spaces.

*Type:* strings concatenated with " "

*Default:* `""`

*Example:* `"ux recordsize o compression=lz4"`

*Declared by:* [`nixos/modules/services/backup/syncoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/syncoid.nix)

## `services.syncoid.commands.<name>.sendOptions` {#opt-services.syncoid.commands._name_.sendOptions}

Advanced options to pass to zfs send. Options are specified
without their leading dashes and separated by spaces.

*Type:* strings concatenated with " "

*Default:* `""`

*Example:* `"Lc e"`

*Declared by:* [`nixos/modules/services/backup/syncoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/syncoid.nix)

## `services.syncoid.commands.<name>.service` {#opt-services.syncoid.commands._name_.service}

Systemd configuration specific to this syncoid service.

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/backup/syncoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/syncoid.nix)

## `services.syncoid.commands.<name>.source` {#opt-services.syncoid.commands._name_.source}

Source ZFS dataset. Can be either local or remote. Defaults to
the attribute name.

*Type:* string

*Example:* `"pool/dataset"`

*Declared by:* [`nixos/modules/services/backup/syncoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/syncoid.nix)

## `services.syncoid.commands.<name>.sshKey` {#opt-services.syncoid.commands._name_.sshKey}

SSH private key file to use to login to the remote system.
Defaults to [`services.syncoid.sshKey`](#opt-services.syncoid.sshKey) option.

*Type:* null or (string or absolute path convertible to it)

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/syncoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/syncoid.nix)

## `services.syncoid.commands.<name>.target` {#opt-services.syncoid.commands._name_.target}

Target ZFS dataset. Can be either local
(«pool/dataset») or remote
(«user@server:pool/dataset»).

*Type:* string

*Example:* `"user@server:pool/dataset"`

*Declared by:* [`nixos/modules/services/backup/syncoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/syncoid.nix)

## `services.syncoid.commands.<name>.useCommonArgs` {#opt-services.syncoid.commands._name_.useCommonArgs}

Whether to add the configured common arguments to this command.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/backup/syncoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/syncoid.nix)

## `services.syncoid.commonArgs` {#opt-services.syncoid.commonArgs}

Arguments to add to every syncoid command, unless disabled for that
command. See
[https://github.com/jimsalterjrs/sanoid/#syncoid-command-line-options](https://github.com/jimsalterjrs/sanoid/#syncoid-command-line-options)
for available options.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--no-sync-snap"
]
```

*Declared by:* [`nixos/modules/services/backup/syncoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/syncoid.nix)

## `services.syncoid.enable` {#opt-services.syncoid.enable}

Whether to enable Syncoid ZFS synchronization service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/syncoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/syncoid.nix)

## `services.syncoid.group` {#opt-services.syncoid.group}

The group for the service.

*Type:* string

*Default:* `"syncoid"`

*Example:* `"backup"`

*Declared by:* [`nixos/modules/services/backup/syncoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/syncoid.nix)

## `services.syncoid.interval` {#opt-services.syncoid.interval}

Run syncoid at this interval. The default is to run hourly.

Must be in the format described in `systemd.time(7)`.  This is
equivalent to adding a corresponding timer unit with
`OnCalendar` set to the value given here.

Set to an empty list to avoid starting syncoid automatically.

*Type:* string or list of string

*Default:* `"hourly"`

*Example:* `"*-*-* *:15:00"`

*Declared by:* [`nixos/modules/services/backup/syncoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/syncoid.nix)

## `services.syncoid.localSourceAllow` {#opt-services.syncoid.localSourceAllow}

Permissions granted for the [`services.syncoid.user`](#opt-services.syncoid.user) user
for local source datasets. See
[https://openzfs.github.io/openzfs-docs/man/8/zfs-allow.8.html](https://openzfs.github.io/openzfs-docs/man/8/zfs-allow.8.html)
for available permissions.

*Type:* list of string

*Default:*

``` nix
[
  "bookmark"
  "hold"
  "send"
  "snapshot"
  "destroy"
  "mount"
]
```

*Declared by:* [`nixos/modules/services/backup/syncoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/syncoid.nix)

## `services.syncoid.localTargetAllow` {#opt-services.syncoid.localTargetAllow}

Permissions granted for the [`services.syncoid.user`](#opt-services.syncoid.user) user
for local target datasets. See
[https://openzfs.github.io/openzfs-docs/man/8/zfs-allow.8.html](https://openzfs.github.io/openzfs-docs/man/8/zfs-allow.8.html)
for available permissions.
Make sure to include the `change-key` permission if you send raw encrypted datasets,
the `compression` permission if you send raw compressed datasets, and so on.
For remote target datasets you'll have to set your remote user permissions by yourself.

*Type:* list of string

*Default:*

``` nix
[
  "change-key"
  "compression"
  "create"
  "mount"
  "mountpoint"
  "receive"
  "rollback"
]
```

*Example:*

``` nix
[
  "create"
  "mount"
  "receive"
  "rollback"
]
```

*Declared by:* [`nixos/modules/services/backup/syncoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/syncoid.nix)

## `services.syncoid.package` {#opt-services.syncoid.package}

The sanoid package to use.

*Type:* package

*Default:* `pkgs.sanoid`

*Declared by:* [`nixos/modules/services/backup/syncoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/syncoid.nix)

## `services.syncoid.service` {#opt-services.syncoid.service}

Systemd configuration common to all syncoid services.

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/backup/syncoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/syncoid.nix)

## `services.syncoid.sshKey` {#opt-services.syncoid.sshKey}

SSH private key file to use to login to the remote system. Can be
overridden in individual commands.

*Type:* null or (string or absolute path convertible to it)

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/syncoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/syncoid.nix)

## `services.syncoid.user` {#opt-services.syncoid.user}

The user for the service. ZFS privilege delegation will be
automatically configured for any local pools used by syncoid if this
option is set to a user other than root. The user will be given the
"hold" and "send" privileges on any pool that has datasets being sent
and the "create", "mount", "receive", and "rollback" privileges on
any pool that has datasets being received.

*Type:* string

*Default:* `"syncoid"`

*Example:* `"backup"`

*Declared by:* [`nixos/modules/services/backup/syncoid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/syncoid.nix)

## `services.syncplay.certDir` {#opt-services.syncplay.certDir}

TLS certificates directory to use for encryption. See
[https://github.com/Syncplay/syncplay/wiki/TLS-support](https://github.com/Syncplay/syncplay/wiki/TLS-support).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncplay.chat` {#opt-services.syncplay.chat}

Chat with users in the same room.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncplay.enable` {#opt-services.syncplay.enable}

If enabled, start the Syncplay server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncplay.extraArgs` {#opt-services.syncplay.extraArgs}

Additional arguments to be passed to the service.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncplay.interfaceIpv4` {#opt-services.syncplay.interfaceIpv4}

The IP address to bind to for IPv4. Leaving it empty defaults to using all.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncplay.interfaceIpv6` {#opt-services.syncplay.interfaceIpv6}

The IP address to bind to for IPv6. Leaving it empty defaults to using all.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncplay.ipv4Only` {#opt-services.syncplay.ipv4Only}

Listen only on IPv4 when strting the server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncplay.ipv6Only` {#opt-services.syncplay.ipv6Only}

Listen only on IPv6 when strting the server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncplay.isolateRooms` {#opt-services.syncplay.isolateRooms}

Enable room isolation.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncplay.maxChatMessageLength` {#opt-services.syncplay.maxChatMessageLength}

Maximum number of characters in a chat message.

*Type:* unsigned integer, meaning \>=0

*Default:* `150`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncplay.maxUsernameLength` {#opt-services.syncplay.maxUsernameLength}

Maximum number of characters in a username.

*Type:* unsigned integer, meaning \>=0

*Default:* `16`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncplay.motd` {#opt-services.syncplay.motd}

Text to display when users join. The motd will be readable in the nix store
and the processlist.  If this is not intended use `motdFile` instead.
Will be overriden by [`services.syncplay.motdFile`](#opt-services.syncplay.motdFile).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncplay.motdFile` {#opt-services.syncplay.motdFile}

Path to text to display when users join.
Will override [`services.syncplay.motd`](#opt-services.syncplay.motd).

*Type:* null or string

*Default:* `if services.syncplay.motd != null then (builtins.toFile "motd" services.syncplay.motd) else null`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncplay.package` {#opt-services.syncplay.package}

The syncplay-nogui package to use.

*Type:* package

*Default:* `pkgs.syncplay-nogui`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncplay.passwordFile` {#opt-services.syncplay.passwordFile}

Path to the file that contains the server password. If
`null`, the server doesn't require a password.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncplay.permanentRooms` {#opt-services.syncplay.permanentRooms}

List of rooms that will be listed even if the room is empty.
Will be overriden by [`services.syncplay.permanentRoomsFile`](#opt-services.syncplay.permanentRoomsFile).

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncplay.permanentRoomsFile` {#opt-services.syncplay.permanentRoomsFile}

File with list of rooms that will be listed even if the room is empty,
newline delimited.
Will override [`services.syncplay.permanentRooms`](#opt-services.syncplay.permanentRooms).

*Type:* null or string

*Default:* `if services.syncplay.permanentRooms != [ ] then (builtins.toFile "perm" (builtins.concatStringsSep "\n" services.syncplay.permanentRooms)) else null`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncplay.port` {#opt-services.syncplay.port}

TCP port to bind to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8999`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncplay.ready` {#opt-services.syncplay.ready}

Check readiness of users.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncplay.roomsDBFile` {#opt-services.syncplay.roomsDBFile}

Path to SQLite database file to store room states.
Relative to the working directory provided by systemd.

*Type:* null or string

*Default:* `null`

*Example:* `"rooms.db"`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncplay.salt` {#opt-services.syncplay.salt}

Salt to allow room operator passwords generated by this server
instance to still work when the server is restarted.  The salt will be
readable in the nix store and the processlist.  If this is not
intended use `saltFile` instead.  Mutually exclusive with
[`services.syncplay.saltFile`](#opt-services.syncplay.saltFile).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncplay.saltFile` {#opt-services.syncplay.saltFile}

Path to the file that contains the server salt.  This allows room
operator passwords generated by this server instance to still work
when the server is restarted.  `null`, the server doesn't load the
salt from a file.  Mutually exclusive with
[`services.syncplay.salt`](#opt-services.syncplay.salt).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncplay.statsDBFile` {#opt-services.syncplay.statsDBFile}

Path to SQLite database file to store stats.
Relative to the working directory provided by systemd.

*Type:* null or string

*Default:* `null`

*Example:* `"stats.db"`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncplay.useACMEHost` {#opt-services.syncplay.useACMEHost}

If set, use NixOS-generated ACME certificate with the specified name for TLS.

Note that it requires `security.acme` to be setup, e.g., credentials provided if using DNS-01 validation.

*Type:* null or string

*Default:* `null`

*Example:* `"syncplay.example.com"`

*Declared by:* [`nixos/modules/services/networking/syncplay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncplay.nix)

## `services.syncthing.all_proxy` {#opt-services.syncthing.all_proxy}

Overwrites the all\_proxy environment variable for the Syncthing process to
the given value. This is normally used to let Syncthing connect
through a SOCKS5 proxy server.
See [https://docs.syncthing.net/users/proxying.html](https://docs.syncthing.net/users/proxying.html).

*Type:* null or string

*Default:* `null`

*Example:* `"socks5://address.com:1234"`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.cert` {#opt-services.syncthing.cert}

Path to the `cert.pem` file, which will be copied into Syncthing's
[configDir](#opt-services.syncthing.configDir).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.configDir` {#opt-services.syncthing.configDir}

The path where the settings and keys will exist.

*Type:* absolute path

*Default:* \* if `stateVersion >= 19.03`:

      config.services.syncthing.dataDir + "/.config/syncthing"

- otherwise:

      config.services.syncthing.dataDir

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.dataDir` {#opt-services.syncthing.dataDir}

The path where synchronised directories will exist.

*Type:* absolute path

*Default:* `"/var/lib/syncthing"`

*Example:* `"/home/yourUser"`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.databaseDir` {#opt-services.syncthing.databaseDir}

The directory containing the database and logs.

*Type:* absolute path

*Default:* `config.services.syncthing.configDir`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.enable` {#opt-services.syncthing.enable}

Whether to enable Syncthing, a self-hosted open-source alternative to Dropbox and Bittorrent Sync.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.extraFlags` {#opt-services.syncthing.extraFlags}

Extra flags passed to the syncthing command in the service definition.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--reset-deltas"
]
```

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.group` {#opt-services.syncthing.group}

The group to run Syncthing under.
By default, a group named `syncthing` will be created.

*Type:* string

*Default:* `"syncthing"`

*Example:* `"yourGroup"`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.guiAddress` {#opt-services.syncthing.guiAddress}

The address to serve the web interface at.

*Type:* string

*Default:* `"127.0.0.1:8384"`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.guiPasswordFile` {#opt-services.syncthing.guiPasswordFile}

Path to file containing the plaintext password for Syncthing's GUI.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.key` {#opt-services.syncthing.key}

Path to the `key.pem` file, which will be copied into Syncthing's
[configDir](#opt-services.syncthing.configDir).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.openDefaultPorts` {#opt-services.syncthing.openDefaultPorts}

Whether to open the default ports in the firewall: TCP/UDP 22000 for transfers
and UDP 21027 for discovery.

If multiple users are running Syncthing on this machine, you will need
to manually open a set of ports for each instance and leave this disabled.
Alternatively, if you are running only a single instance on this machine
using the default ports, enable this.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.overrideDevices` {#opt-services.syncthing.overrideDevices}

Whether to delete the devices which are not configured via the
[devices](#opt-services.syncthing.settings.devices) option.
If set to `false`, devices added via the web
interface will persist and will have to be deleted manually.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.overrideFolders` {#opt-services.syncthing.overrideFolders}

Whether to delete the folders which are not configured via the
[folders](#opt-services.syncthing.settings.folders) option.
If set to `false`, folders added via the web
interface will persist and will have to be deleted manually.

*Type:* boolean

*Default:* `true` unless any device has the
[autoAcceptFolders](#opt-services.syncthing.settings.devices._name_.autoAcceptFolders)
option set to `true`.

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.package` {#opt-services.syncthing.package}

The syncthing package to use.

*Type:* package

*Default:* `pkgs.syncthing`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.relay.cert` {#opt-services.syncthing.relay.cert}

Path to the `cert.pem` file, which will be copied into `dataDirectory`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/syncthing-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing-relay.nix)

## `services.syncthing.relay.enable` {#opt-services.syncthing.relay.enable}

Whether to enable Syncthing relay service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/syncthing-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing-relay.nix)

## `services.syncthing.relay.extraOptions` {#opt-services.syncthing.relay.extraOptions}

Extra command line arguments to pass to strelaysrv.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/syncthing-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing-relay.nix)

## `services.syncthing.relay.globalRateBps` {#opt-services.syncthing.relay.globalRateBps}

Global bandwidth rate limit in bytes per second.

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/syncthing-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing-relay.nix)

## `services.syncthing.relay.key` {#opt-services.syncthing.relay.key}

Path to the `key.pem` file, which will be copied into `dataDirectory`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/syncthing-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing-relay.nix)

## `services.syncthing.relay.listenAddress` {#opt-services.syncthing.relay.listenAddress}

Address to listen on for relay traffic.

*Type:* string

*Default:* `""`

*Example:* `"1.2.3.4"`

*Declared by:* [`nixos/modules/services/networking/syncthing-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing-relay.nix)

## `services.syncthing.relay.perSessionRateBps` {#opt-services.syncthing.relay.perSessionRateBps}

Per session bandwidth rate limit in bytes per second.

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/syncthing-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing-relay.nix)

## `services.syncthing.relay.pools` {#opt-services.syncthing.relay.pools}

Relay pools to join. If null, uses the default global pool.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/syncthing-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing-relay.nix)

## `services.syncthing.relay.port` {#opt-services.syncthing.relay.port}

Port to listen on for relay traffic. This port should be added to
[`networking.firewall.allowedTCPPorts`](../../options/networking/index.md#opt-networking.firewall.allowedTCPPorts).

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `22067`

*Declared by:* [`nixos/modules/services/networking/syncthing-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing-relay.nix)

## `services.syncthing.relay.providedBy` {#opt-services.syncthing.relay.providedBy}

Human-readable description of the provider of the relay (you).

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/syncthing-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing-relay.nix)

## `services.syncthing.relay.statusListenAddress` {#opt-services.syncthing.relay.statusListenAddress}

Address to listen on for serving the relay status API.

Set `statusPort` and `statusListenAddress` to `null`
to disable the status API.

*Type:* null or string

*Default:* `""`

*Example:* `"1.2.3.4"`

*Declared by:* [`nixos/modules/services/networking/syncthing-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing-relay.nix)

## `services.syncthing.relay.statusPort` {#opt-services.syncthing.relay.statusPort}

Port to listen on for serving the relay status API. This port should be
added to [`networking.firewall.allowedTCPPorts`](../../options/networking/index.md#opt-networking.firewall.allowedTCPPorts).

Set `statusPort` and `statusListenAddress` to `null`
to disable the status API.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `22070`

*Declared by:* [`nixos/modules/services/networking/syncthing-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing-relay.nix)

## `services.syncthing.relay.token` {#opt-services.syncthing.relay.token}

Path to the file containing the token. This can be used to run private
relays.

::: warning
Since syncthing-relay doesn't support passing the token through a
file, the token value will be exposed in clear text in the process
list.
:::

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/syncthing-relay.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing-relay.nix)

## `services.syncthing.settings` {#opt-services.syncthing.settings}

Extra configuration options for Syncthing.
See [https://docs.syncthing.net/users/config.html](https://docs.syncthing.net/users/config.html).
Note that this attribute set does not exactly match the documented
xml format. Instead, this is the format of the json rest api. There
are slight differences. For example, this xml:

``` xml
<options>
  <listenAddress>default</listenAddress>
  <minHomeDiskFree unit="%">1</minHomeDiskFree>
</options>
```

corresponds to the json:

``` json
{
  options: {
    listenAddresses = [
      "default"
    ];
    minHomeDiskFree = {
      unit = "%";
      value = 1;
    };
  };
}
```

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Example:*

``` nix
{
  gui = {
    theme = "black";
  };
  options = {
    localAnnounceEnabled = false;
  };
}
```

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.settings.devices` {#opt-services.syncthing.settings.devices}

Peers/devices which Syncthing should communicate with.

Note that you can still add devices manually, but those changes
will be reverted on restart if [overrideDevices](#opt-services.syncthing.overrideDevices)
is enabled.

*Type:* attribute set of (open submodule of (JSON value))

*Default:* `{ }`

*Example:*

``` nix
{
  bigbox = {
    addresses = [
      "tcp://192.168.0.10:51820"
    ];
    id = "7CFNTQM-IMTJBHJ-3UWRDIU-ZGQJFR6-VCXZ3NB-XUH3KZO-N52ITXR-LAIYUAU";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.settings.devices.<name>.autoAcceptFolders` {#opt-services.syncthing.settings.devices._name_.autoAcceptFolders}

Automatically create or share folders that this device advertises at the default path.
See [https://docs.syncthing.net/users/config.html?highlight=autoaccept#config-file-format](https://docs.syncthing.net/users/config.html?highlight=autoaccept#config-file-format).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.settings.devices.<name>.id` {#opt-services.syncthing.settings.devices._name_.id}

The device ID. See [https://docs.syncthing.net/dev/device-ids.html](https://docs.syncthing.net/dev/device-ids.html).

*Type:* string

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.settings.devices.<name>.name` {#opt-services.syncthing.settings.devices._name_.name}

The name of the device.

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.settings.folders` {#opt-services.syncthing.settings.folders}

Folders which should be shared by Syncthing.

Note that you can still add folders manually, but those changes
will be reverted on restart if [overrideFolders](#opt-services.syncthing.overrideFolders)
is enabled.

*Type:* attribute set of (open submodule of (JSON value))

*Default:* `{ }`

*Example:*

``` nix
{
  "/home/user/sync" = {
    id = "syncme";
    devices = [ "bigbox" ];
  };
}
```

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.settings.folders.<name>.copyOwnershipFromParent` {#opt-services.syncthing.settings.folders._name_.copyOwnershipFromParent}

On Unix systems, tries to copy file/folder ownership from the parent directory (the directory it’s located in).
Requires running Syncthing as a privileged user, or granting it additional capabilities (e.g. CAP\_CHOWN on Linux).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.settings.folders.<name>.devices` {#opt-services.syncthing.settings.folders._name_.devices}

The devices this folder should be shared with. Each device must
be defined in the [devices](#opt-services.syncthing.settings.devices) option.

A list of either strings or attribute sets, where values
are device names or device configurations.

*Type:* list of (string or (open submodule of (JSON value)))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.settings.folders.<name>.enable` {#opt-services.syncthing.settings.folders._name_.enable}

Whether to share this folder.
This option is useful when you want to define all folders
in one place, but not every machine should share all folders.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.settings.folders.<name>.id` {#opt-services.syncthing.settings.folders._name_.id}

The ID of the folder. Must be the same on all devices.

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.settings.folders.<name>.ignorePatterns` {#opt-services.syncthing.settings.folders._name_.ignorePatterns}

Syncthing can be configured to ignore certain files in a folder using ignore patterns.
Enter them as a list of strings, one string per line.
See the Syncthing documentation for syntax: [https://docs.syncthing.net/users/ignoring.html](https://docs.syncthing.net/users/ignoring.html)
Patterns set using the WebUI will be overridden if you define this option.
If you want to override the ignore patterns to be empty, use `ignorePatterns = []`.
Deleting the `ignorePatterns` option will not remove the patterns from Syncthing automatically
because patterns are only handled by the module if this option is defined. Either use
`ignorePatterns = []` before deleting the option or remove the patterns afterwards using the WebUI.

*Type:* null or (list of string)

*Default:* `null`

*Example:*

``` nix
[
  "// This is a comment"
  "*.part // Firefox downloads and other things"
  "*.crdownload // Chrom(ium|e) downloads"
]
```

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.settings.folders.<name>.label` {#opt-services.syncthing.settings.folders._name_.label}

The label of the folder.

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.settings.folders.<name>.path` {#opt-services.syncthing.settings.folders._name_.path}

The path to the folder which should be shared.
Only absolute paths (starting with `/`) and paths relative to
the [user](#opt-services.syncthing.user)'s home directory
(starting with `~/`) are allowed.

*Type:* string starting with / or ~/

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.settings.folders.<name>.type` {#opt-services.syncthing.settings.folders._name_.type}

Controls how the folder is handled by Syncthing.
See [https://docs.syncthing.net/users/config.html#config-option-folder.type](https://docs.syncthing.net/users/config.html#config-option-folder.type).

*Type:* one of "sendreceive", "sendonly", "receiveonly", "receiveencrypted"

*Default:* `"sendreceive"`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.settings.folders.<name>.versioning` {#opt-services.syncthing.settings.folders._name_.versioning}

How to keep changed/deleted files with Syncthing.
There are 4 different types of versioning with different parameters.
See [https://docs.syncthing.net/users/versioning.html](https://docs.syncthing.net/users/versioning.html).

*Type:* null or (open submodule of (JSON value))

*Default:* `null`

*Example:*

``` nix
[
  {
    versioning = {
      type = "simple";
      params.keep = "10";
    };
  }
  {
    versioning = {
      type = "trashcan";
      params.cleanoutDays = "1000";
    };
  }
  {
    versioning = {
      type = "staggered";
      fsPath = "/syncthing/backup";
      params = {
        cleanInterval = "3600";
        maxAge = "31536000";
      };
    };
  }
  {
    versioning = {
      type = "external";
      params.versionsPath = pkgs.writers.writeBash "backup" ''
        folderpath="$1"
        filepath="$2"
        rm -rf "$folderpath/$filepath"
      '';
    };
  }
]
```

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.settings.folders.<name>.versioning.type` {#opt-services.syncthing.settings.folders._name_.versioning.type}

The type of versioning.
See [https://docs.syncthing.net/users/versioning.html](https://docs.syncthing.net/users/versioning.html).

*Type:* one of "external", "simple", "staggered", "trashcan"

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.settings.options` {#opt-services.syncthing.settings.options}

The options element contains all other global configuration options

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.settings.options.limitBandwidthInLan` {#opt-services.syncthing.settings.options.limitBandwidthInLan}

Whether to apply bandwidth limits to devices in the same broadcast domain as the local device.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.settings.options.localAnnounceEnabled` {#opt-services.syncthing.settings.options.localAnnounceEnabled}

Whether to send announcements to the local LAN, also use such announcements to find other devices.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.settings.options.localAnnouncePort` {#opt-services.syncthing.settings.options.localAnnouncePort}

The port on which to listen and send IPv4 broadcast announcements to.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.settings.options.maxFolderConcurrency` {#opt-services.syncthing.settings.options.maxFolderConcurrency}

This option controls how many folders may concurrently be in I/O-intensive operations such as syncing or scanning.
The mechanism is described in detail in a [separate chapter](https://docs.syncthing.net/advanced/option-max-concurrency.html).

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.settings.options.relaysEnabled` {#opt-services.syncthing.settings.options.relaysEnabled}

When true, relays will be connected to and potentially used for device to device connections.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.settings.options.urAccepted` {#opt-services.syncthing.settings.options.urAccepted}

Whether the user has accepted to submit anonymous usage data.
The default, 0, mean the user has not made a choice, and Syncthing will ask at some point in the future.
"-1" means no, a number above zero means that that version of usage reporting has been accepted.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.systemService` {#opt-services.syncthing.systemService}

Whether to auto-launch Syncthing as a system service.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.syncthing.user` {#opt-services.syncthing.user}

The user to run Syncthing as.
By default, a user named `syncthing` will be created whose home
directory is [dataDir](#opt-services.syncthing.dataDir).

*Type:* string

*Default:* `"syncthing"`

*Example:* `"yourUser"`

*Declared by:* [`nixos/modules/services/networking/syncthing.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix)

## `services.synergy.client.autoStart` {#opt-services.synergy.client.autoStart}

Whether the Synergy client should be started automatically.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/synergy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/synergy.nix)

## `services.synergy.client.enable` {#opt-services.synergy.client.enable}

Whether to enable the Synergy client (receive keyboard and mouse events from a Synergy server).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/synergy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/synergy.nix)

## `services.synergy.client.screenName` {#opt-services.synergy.client.screenName}

Use the given name instead of the hostname to identify
ourselves to the server.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/synergy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/synergy.nix)

## `services.synergy.client.serverAddress` {#opt-services.synergy.client.serverAddress}

The server address is of the form: \[hostname\]\[:port\].  The
hostname must be the address or hostname of the server.  The
port overrides the default port, 24800.

*Type:* string

*Declared by:* [`nixos/modules/services/misc/synergy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/synergy.nix)

## `services.synergy.server.address` {#opt-services.synergy.server.address}

Address on which to listen for clients.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/synergy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/synergy.nix)

## `services.synergy.server.autoStart` {#opt-services.synergy.server.autoStart}

Whether the Synergy server should be started automatically.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/synergy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/synergy.nix)

## `services.synergy.server.configFile` {#opt-services.synergy.server.configFile}

The Synergy server configuration file.

*Type:* absolute path

*Default:* `"/etc/synergy-server.conf"`

*Declared by:* [`nixos/modules/services/misc/synergy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/synergy.nix)

## `services.synergy.server.enable` {#opt-services.synergy.server.enable}

Whether to enable the Synergy server (send keyboard and mouse events).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/synergy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/synergy.nix)

## `services.synergy.server.screenName` {#opt-services.synergy.server.screenName}

Use the given name instead of the hostname to identify
this screen in the configuration.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/synergy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/synergy.nix)

## `services.synergy.server.tls.cert` {#opt-services.synergy.server.tls.cert}

The TLS certificate to use for encryption.

*Type:* null or string

*Default:* `null`

*Example:* `"~/.synergy/SSL/Synergy.pem"`

*Declared by:* [`nixos/modules/services/misc/synergy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/synergy.nix)

## `services.synergy.server.tls.enable` {#opt-services.synergy.server.tls.enable}

Whether TLS encryption should be used.

Using this requires a TLS certificate that can be
generated by starting the Synergy GUI once and entering
a valid product key.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/synergy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/synergy.nix)

## `services.syslog-ng.configHeader` {#opt-services.syslog-ng.configHeader}

The very first lines of the configuration file. Should usually contain
the syslog-ng version header.

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  @version: 4.4
  @include "scl.conf"
''
```

*Declared by:* [`nixos/modules/services/logging/syslog-ng.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/syslog-ng.nix)

## `services.syslog-ng.enable` {#opt-services.syslog-ng.enable}

Whether to enable the syslog-ng daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/logging/syslog-ng.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/syslog-ng.nix)

## `services.syslog-ng.extraConfig` {#opt-services.syslog-ng.extraConfig}

Configuration added to the end of `syslog-ng.conf`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/logging/syslog-ng.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/syslog-ng.nix)

## `services.syslog-ng.extraModulePaths` {#opt-services.syslog-ng.extraModulePaths}

A list of paths that should be included in syslog-ng's
`--module-path` option. They should usually
end in `/lib/syslog-ng`

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/logging/syslog-ng.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/syslog-ng.nix)

## `services.syslog-ng.package` {#opt-services.syslog-ng.package}

The syslogng package to use.

*Type:* package

*Default:* `pkgs.syslogng`

*Declared by:* [`nixos/modules/services/logging/syslog-ng.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/syslog-ng.nix)

## `services.syslogd.defaultConfig` {#opt-services.syslogd.defaultConfig}

The default `syslog.conf` file configures a
fairly standard setup of log files, which can be extended by
means of `extraConfig`.

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  # Send emergency messages to all users.
  *.emerg                       *
  
  # "local1" is used for dhcpd messages.
  local1.*                     -/var/log/dhcpd
  
  mail.*                       -/var/log/mail
  
  *.=warning;*.=err            -/var/log/warn
  *.crit                        /var/log/warn
  
  *.*;mail.none;local1.none    -/var/log/messages
''
```

*Declared by:* [`nixos/modules/services/logging/syslogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/syslogd.nix)

## `services.syslogd.enable` {#opt-services.syslogd.enable}

Whether to enable syslogd.  Note that systemd also logs
syslog messages, so you normally don't need to run syslogd.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/logging/syslogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/syslogd.nix)

## `services.syslogd.enableNetworkInput` {#opt-services.syslogd.enableNetworkInput}

Accept logging through UDP. Option -r of `syslogd(8)`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/logging/syslogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/syslogd.nix)

## `services.syslogd.extraConfig` {#opt-services.syslogd.extraConfig}

Additional text appended to `syslog.conf`,
i.e. the contents of `defaultConfig`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"news.* -/var/log/news"`

*Declared by:* [`nixos/modules/services/logging/syslogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/syslogd.nix)

## `services.syslogd.extraParams` {#opt-services.syslogd.extraParams}

Additional parameters passed to `syslogd`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-m 0"
]
```

*Declared by:* [`nixos/modules/services/logging/syslogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/syslogd.nix)

## `services.syslogd.tty` {#opt-services.syslogd.tty}

The tty device on which syslogd will print important log
messages. Leave this option blank to disable tty logging.

*Type:* string

*Default:* `"tty10"`

*Declared by:* [`nixos/modules/services/logging/syslogd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/syslogd.nix)

## `services.sysprof.enable` {#opt-services.sysprof.enable}

Whether to enable sysprof profiling daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/sysprof.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/sysprof.nix)

## `services.sysstat.collect-args` {#opt-services.sysstat.collect-args}

Arguments to pass sa1 when collecting statistics

*Type:* string

*Default:* `"1 1"`

*Declared by:* [`nixos/modules/services/monitoring/sysstat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/sysstat.nix)

## `services.sysstat.collect-frequency` {#opt-services.sysstat.collect-frequency}

OnCalendar specification for sysstat-collect

*Type:* string

*Default:* `"*:00/10"`

*Declared by:* [`nixos/modules/services/monitoring/sysstat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/sysstat.nix)

## `services.sysstat.enable` {#opt-services.sysstat.enable}

Whether to enable sar system activity collection.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/sysstat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/sysstat.nix)

## `services.system-config-printer.enable` {#opt-services.system-config-printer.enable}

Whether to enable system-config-printer, a service for CUPS administration used by printing interfaces.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/system-config-printer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system-config-printer.nix)

## `services.system76-scheduler.assignments` {#opt-services.system76-scheduler.assignments}

Process profile assignments.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  nix-builds = {
    nice = 15;
    class = "batch";
    ioClass = "idle";
    matchers = [
      "nix-daemon"
    ];
  };
}
```

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.assignments.<name>.class` {#opt-services.system76-scheduler.assignments._name_.class}

CPU scheduler class.

*Type:* null or one of "idle", "batch", "other", "rr", "fifo"

*Default:* `null`

*Example:* `"batch"`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.assignments.<name>.ioClass` {#opt-services.system76-scheduler.assignments._name_.ioClass}

IO scheduler class.

*Type:* null or one of "idle", "best-effort", "realtime"

*Default:* `null`

*Example:* `"best-effort"`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.assignments.<name>.ioPrio` {#opt-services.system76-scheduler.assignments._name_.ioPrio}

IO scheduler priority.

*Type:* null or integer between 0 and 7 (both inclusive)

*Default:* `null`

*Example:* `4`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.assignments.<name>.matchers` {#opt-services.system76-scheduler.assignments._name_.matchers}

Process matchers.

*Type:* null or (list of string)

*Default:* `[ ]`

*Example:*

``` nix
[
  "include cgroup=\"/user.slice/*.service\" parent=\"systemd\""
  "emacs"
]
```

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.assignments.<name>.nice` {#opt-services.system76-scheduler.assignments._name_.nice}

Niceness.

*Type:* null or integer between -20 and 19 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.assignments.<name>.prio` {#opt-services.system76-scheduler.assignments._name_.prio}

CPU scheduler priority.

*Type:* null or integer between 1 and 99 (both inclusive)

*Default:* `null`

*Example:* `49`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.enable` {#opt-services.system76-scheduler.enable}

Whether to enable system76-scheduler.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.exceptions` {#opt-services.system76-scheduler.exceptions}

Processes that are left alone.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "include descends=\"schedtool\""
  "schedtool"
]
```

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.package` {#opt-services.system76-scheduler.package}

Which System76-Scheduler package to use.

*Type:* package

*Default:* `pkgs.system76-scheduler`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.cfsProfiles.default.bandwidth-size` {#opt-services.system76-scheduler.settings.cfsProfiles.default.bandwidth-size}

`sched_cfs_bandwidth_slice_us`.

*Type:* signed integer

*Default:* `5`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.cfsProfiles.default.latency` {#opt-services.system76-scheduler.settings.cfsProfiles.default.latency}

`sched_latency_ns`.

*Type:* signed integer

*Default:* `6`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.cfsProfiles.default.nr-latency` {#opt-services.system76-scheduler.settings.cfsProfiles.default.nr-latency}

`sched_nr_latency`.

*Type:* signed integer

*Default:* `8`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.cfsProfiles.default.preempt` {#opt-services.system76-scheduler.settings.cfsProfiles.default.preempt}

Preemption mode.

*Type:* one of "none", "voluntary", "full"

*Default:* `"voluntary"`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.cfsProfiles.default.wakeup-granularity` {#opt-services.system76-scheduler.settings.cfsProfiles.default.wakeup-granularity}

`sched_wakeup_granularity_ns`.

*Type:* floating point number

*Default:* `1.0`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.cfsProfiles.enable` {#opt-services.system76-scheduler.settings.cfsProfiles.enable}

Tweak CFS latency parameters when going on/off battery

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.cfsProfiles.responsive.bandwidth-size` {#opt-services.system76-scheduler.settings.cfsProfiles.responsive.bandwidth-size}

`sched_cfs_bandwidth_slice_us`.

*Type:* signed integer

*Default:* `3`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.cfsProfiles.responsive.latency` {#opt-services.system76-scheduler.settings.cfsProfiles.responsive.latency}

`sched_latency_ns`.

*Type:* signed integer

*Default:* `4`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.cfsProfiles.responsive.nr-latency` {#opt-services.system76-scheduler.settings.cfsProfiles.responsive.nr-latency}

`sched_nr_latency`.

*Type:* signed integer

*Default:* `10`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.cfsProfiles.responsive.preempt` {#opt-services.system76-scheduler.settings.cfsProfiles.responsive.preempt}

Preemption mode.

*Type:* one of "none", "voluntary", "full"

*Default:* `"full"`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.cfsProfiles.responsive.wakeup-granularity` {#opt-services.system76-scheduler.settings.cfsProfiles.responsive.wakeup-granularity}

`sched_wakeup_granularity_ns`.

*Type:* floating point number

*Default:* `0.5`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.processScheduler.enable` {#opt-services.system76-scheduler.settings.processScheduler.enable}

Tweak scheduling of individual processes in real time.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.processScheduler.foregroundBoost.background.class` {#opt-services.system76-scheduler.settings.processScheduler.foregroundBoost.background.class}

CPU scheduler class.

*Type:* null or one of "idle", "batch", "other", "rr", "fifo"

*Default:* `null`

*Example:* `"batch"`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.processScheduler.foregroundBoost.background.ioClass` {#opt-services.system76-scheduler.settings.processScheduler.foregroundBoost.background.ioClass}

IO scheduler class.

*Type:* null or one of "idle", "best-effort", "realtime"

*Default:* `"idle"`

*Example:* `"best-effort"`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.processScheduler.foregroundBoost.background.ioPrio` {#opt-services.system76-scheduler.settings.processScheduler.foregroundBoost.background.ioPrio}

IO scheduler priority.

*Type:* null or integer between 0 and 7 (both inclusive)

*Default:* `null`

*Example:* `4`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.processScheduler.foregroundBoost.background.matchers` {#opt-services.system76-scheduler.settings.processScheduler.foregroundBoost.background.matchers}

Process matchers.

*Type:* null or (list of string)

*Default:* `[ ]`

*Example:*

``` nix
[
  "include cgroup=\"/user.slice/*.service\" parent=\"systemd\""
  "emacs"
]
```

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.processScheduler.foregroundBoost.background.nice` {#opt-services.system76-scheduler.settings.processScheduler.foregroundBoost.background.nice}

Niceness.

*Type:* null or integer between -20 and 19 (both inclusive)

*Default:* `6`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.processScheduler.foregroundBoost.background.prio` {#opt-services.system76-scheduler.settings.processScheduler.foregroundBoost.background.prio}

CPU scheduler priority.

*Type:* null or integer between 1 and 99 (both inclusive)

*Default:* `null`

*Example:* `49`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.processScheduler.foregroundBoost.enable` {#opt-services.system76-scheduler.settings.processScheduler.foregroundBoost.enable}

Boost foreground process priorities.

(And de-boost background ones).  Note that this option needs cooperation
from the desktop environment to work.  On Gnome the client side is
implemented by the "System76 Scheduler" shell extension.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.processScheduler.foregroundBoost.foreground.class` {#opt-services.system76-scheduler.settings.processScheduler.foregroundBoost.foreground.class}

CPU scheduler class.

*Type:* null or one of "idle", "batch", "other", "rr", "fifo"

*Default:* `null`

*Example:* `"batch"`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.processScheduler.foregroundBoost.foreground.ioClass` {#opt-services.system76-scheduler.settings.processScheduler.foregroundBoost.foreground.ioClass}

IO scheduler class.

*Type:* null or one of "idle", "best-effort", "realtime"

*Default:* `"best-effort"`

*Example:* `"best-effort"`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.processScheduler.foregroundBoost.foreground.ioPrio` {#opt-services.system76-scheduler.settings.processScheduler.foregroundBoost.foreground.ioPrio}

IO scheduler priority.

*Type:* null or integer between 0 and 7 (both inclusive)

*Default:* `0`

*Example:* `4`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.processScheduler.foregroundBoost.foreground.matchers` {#opt-services.system76-scheduler.settings.processScheduler.foregroundBoost.foreground.matchers}

Process matchers.

*Type:* null or (list of string)

*Default:* `[ ]`

*Example:*

``` nix
[
  "include cgroup=\"/user.slice/*.service\" parent=\"systemd\""
  "emacs"
]
```

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.processScheduler.foregroundBoost.foreground.nice` {#opt-services.system76-scheduler.settings.processScheduler.foregroundBoost.foreground.nice}

Niceness.

*Type:* null or integer between -20 and 19 (both inclusive)

*Default:* `0`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.processScheduler.foregroundBoost.foreground.prio` {#opt-services.system76-scheduler.settings.processScheduler.foregroundBoost.foreground.prio}

CPU scheduler priority.

*Type:* null or integer between 1 and 99 (both inclusive)

*Default:* `null`

*Example:* `49`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.processScheduler.pipewireBoost.enable` {#opt-services.system76-scheduler.settings.processScheduler.pipewireBoost.enable}

Boost Pipewire client priorities.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.processScheduler.pipewireBoost.profile.class` {#opt-services.system76-scheduler.settings.processScheduler.pipewireBoost.profile.class}

CPU scheduler class.

*Type:* null or one of "idle", "batch", "other", "rr", "fifo"

*Default:* `null`

*Example:* `"batch"`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.processScheduler.pipewireBoost.profile.ioClass` {#opt-services.system76-scheduler.settings.processScheduler.pipewireBoost.profile.ioClass}

IO scheduler class.

*Type:* null or one of "idle", "best-effort", "realtime"

*Default:* `"best-effort"`

*Example:* `"best-effort"`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.processScheduler.pipewireBoost.profile.ioPrio` {#opt-services.system76-scheduler.settings.processScheduler.pipewireBoost.profile.ioPrio}

IO scheduler priority.

*Type:* null or integer between 0 and 7 (both inclusive)

*Default:* `0`

*Example:* `4`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.processScheduler.pipewireBoost.profile.matchers` {#opt-services.system76-scheduler.settings.processScheduler.pipewireBoost.profile.matchers}

Process matchers.

*Type:* null or (list of string)

*Default:* `[ ]`

*Example:*

``` nix
[
  "include cgroup=\"/user.slice/*.service\" parent=\"systemd\""
  "emacs"
]
```

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.processScheduler.pipewireBoost.profile.nice` {#opt-services.system76-scheduler.settings.processScheduler.pipewireBoost.profile.nice}

Niceness.

*Type:* null or integer between -20 and 19 (both inclusive)

*Default:* `-6`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.processScheduler.pipewireBoost.profile.prio` {#opt-services.system76-scheduler.settings.processScheduler.pipewireBoost.profile.prio}

CPU scheduler priority.

*Type:* null or integer between 1 and 99 (both inclusive)

*Default:* `null`

*Example:* `49`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.processScheduler.refreshInterval` {#opt-services.system76-scheduler.settings.processScheduler.refreshInterval}

Process list poll interval, in seconds

*Type:* signed integer

*Default:* `60`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.settings.processScheduler.useExecsnoop` {#opt-services.system76-scheduler.settings.processScheduler.useExecsnoop}

Use execsnoop (otherwise poll the precess list periodically).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.system76-scheduler.useStockConfig` {#opt-services.system76-scheduler.useStockConfig}

Use the (reasonable and featureful) stock configuration.

When this option is `true`, `services.system76-scheduler.settings`
are ignored.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/desktops/system76-scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/system76-scheduler.nix)

## `services.systembus-notify.enable` {#opt-services.systembus-notify.enable}

Whether to enable System bus notification support

WARNING: enabling this option (while convenient) should *not* be done on a
machine where you do not trust the other users as it allows any other
local user to DoS your session by spamming notifications
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/system/systembus-notify.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/systembus-notify.nix)

## `services.systemd-lock-handler.enable` {#opt-services.systemd-lock-handler.enable}

Whether to enable systemd-lock-handler.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/system/systemd-lock-handler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/systemd-lock-handler.nix)

## `services.systemd-lock-handler.package` {#opt-services.systemd-lock-handler.package}

The systemd-lock-handler package to use.

*Type:* package

*Default:* `pkgs.systemd-lock-handler`

*Declared by:* [`nixos/modules/services/system/systemd-lock-handler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/systemd-lock-handler.nix)

## `services.szurubooru.client.package` {#opt-services.szurubooru.client.package}

The client package to use.

*Type:* package

*Default:* `pkgs.szurubooru.client`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.dataDir` {#opt-services.szurubooru.dataDir}

The path to the data directory in which Szurubooru will store its data.

*Type:* absolute path

*Default:* `"/var/lib/szurubooru"`

*Example:* `"/var/lib/szuru"`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.database.host` {#opt-services.szurubooru.database.host}

Host on which the PostgreSQL database runs.

*Type:* string

*Default:* `"localhost"`

*Example:* `"192.168.1.2"`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.database.name` {#opt-services.szurubooru.database.name}

Name of the PostgreSQL database.

*Type:* string

*Default:* `szurubooru.database.name`

*Example:* `"szuru"`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.database.passwordFile` {#opt-services.szurubooru.database.passwordFile}

A file containing the password for the PostgreSQL user.

*Type:* absolute path

*Example:* `"/run/secrets/szurubooru-db-password"`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.database.port` {#opt-services.szurubooru.database.port}

The port under which PostgreSQL listens to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5432`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.database.user` {#opt-services.szurubooru.database.user}

PostgreSQL user.

*Type:* string

*Default:* `"szurubooru"`

*Example:* `"szuru"`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.enable` {#opt-services.szurubooru.enable}

Whether to enable Szurubooru, an image board engine dedicated for small and medium communities.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.group` {#opt-services.szurubooru.group}

Group under which Szurubooru runs.

*Type:* string

*Default:* `"szurubooru"`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.openFirewall` {#opt-services.szurubooru.openFirewall}

Whether to open the firewall for the port in [`services.szurubooru.server.port`](#opt-services.szurubooru.server.port).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.server.host` {#opt-services.szurubooru.server.host}

The host address for Szurubooru to bind to.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.server.package` {#opt-services.szurubooru.server.package}

The server package to use.

*Type:* package

*Default:* `pkgs.szurubooru.server`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.server.port` {#opt-services.szurubooru.server.port}

Port to expose HTTP service.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Example:* `9000`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.server.settings` {#opt-services.szurubooru.server.settings}

Configuration to write to `config.yaml`.
See [https://github.com/rr-/szurubooru/blob/master/server/config.yaml.dist](https://github.com/rr-/szurubooru/blob/master/server/config.yaml.dist) for more information.

*Type:* open submodule of (YAML 1.1 value)

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.server.settings.data_dir` {#opt-services.szurubooru.server.settings.data_dir}

Path to the static files.

*Type:* absolute path

*Default:* `"${services.szurubooru.dataDir}/data"`

*Example:* `"/srv/szurubooru/data"`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.server.settings.data_url` {#opt-services.szurubooru.server.settings.data_url}

Full URL to the data endpoint.

*Type:* string

*Default:* `"${services.szurubooru.server.settings.domain}/data/"`

*Example:* `"http://example.com/content/"`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.server.settings.debug` {#opt-services.szurubooru.server.settings.debug}

Whether to generate server logs.

*Type:* signed integer

*Default:* `0`

*Example:* `1`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.server.settings.delete_source_files` {#opt-services.szurubooru.server.settings.delete_source_files}

Whether to delete thumbnails and source files on post delete.

*Type:* one of "yes", "no"

*Default:* `"no"`

*Example:* `"yes"`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.server.settings.domain` {#opt-services.szurubooru.server.settings.domain}

Full URL to the homepage of this szurubooru site (with no trailing slash).

*Type:* string

*Example:* `"http://example.com"`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.server.settings.name` {#opt-services.szurubooru.server.settings.name}

Name shown in the website title and on the front page.

*Type:* string

*Default:* `"szurubooru"`

*Example:* `"Szuru"`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.server.settings.secretFile` {#opt-services.szurubooru.server.settings.secretFile}

File containing a secret used to salt the users' password hashes and generate filenames for static content.

*Type:* absolute path

*Example:* `"/run/secrets/szurubooru-server-secret"`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.server.settings.show_sql` {#opt-services.szurubooru.server.settings.show_sql}

Whether to show SQL in server logs.

*Type:* signed integer

*Default:* `0`

*Example:* `1`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.server.settings.smtp.host` {#opt-services.szurubooru.server.settings.smtp.host}

Host of the SMTP server used to send reset password.

*Type:* null or string

*Default:* `null`

*Example:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.server.settings.smtp.passFile` {#opt-services.szurubooru.server.settings.smtp.passFile}

File containing the password associated to the given user for the SMTP server.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/szurubooru-smtp-pass"`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.server.settings.smtp.port` {#opt-services.szurubooru.server.settings.smtp.port}

Port of the SMTP server.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Example:* `25`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.server.settings.smtp.user` {#opt-services.szurubooru.server.settings.smtp.user}

User to connect to the SMTP server.

*Type:* null or string

*Default:* `null`

*Example:* `"bot"`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.server.threads` {#opt-services.szurubooru.server.threads}

Number of waitress threads to start.

*Type:* signed integer

*Default:* `4`

*Example:* `6`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)

## `services.szurubooru.user` {#opt-services.szurubooru.user}

User account under which Szurubooru runs.

*Type:* string

*Default:* `"szurubooru"`

*Declared by:* [`nixos/modules/services/web-apps/szurubooru.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/szurubooru.nix)
