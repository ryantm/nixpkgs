# services (M) {#sec-options-services-m}

## `services.mackerel-agent.apiKeyFile` {#opt-services.mackerel-agent.apiKeyFile}

Path to file containing the Mackerel API key. The file should contain a
single line of the following form:

`apikey = "EXAMPLE_API_KEY"`

*Type:* absolute path

*Example:* `"/run/keys/mackerel-api-key"`

*Declared by:* [`nixos/modules/services/monitoring/mackerel-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/mackerel-agent.nix)

## `services.mackerel-agent.autoRetirement` {#opt-services.mackerel-agent.autoRetirement}

Whether to enable retiring the host upon OS shutdown
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/mackerel-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/mackerel-agent.nix)

## `services.mackerel-agent.enable` {#opt-services.mackerel-agent.enable}

Whether to enable mackerel.io agent.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/mackerel-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/mackerel-agent.nix)

## `services.mackerel-agent.runAsRoot` {#opt-services.mackerel-agent.runAsRoot}

Whether to enable running as root.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/mackerel-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/mackerel-agent.nix)

## `services.mackerel-agent.settings` {#opt-services.mackerel-agent.settings}

Options for mackerel-agent.conf.

Documentation:
[https://mackerel.io/docs/entry/spec/agent](https://mackerel.io/docs/entry/spec/agent)

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Example:*

``` nix
{
  silent = false;
  verbose = false;
}
```

*Declared by:* [`nixos/modules/services/monitoring/mackerel-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/mackerel-agent.nix)

## `services.mackerel-agent.settings.diagnostic` {#opt-services.mackerel-agent.settings.diagnostic}

Whether to enable collecting memory usage for the agent itself.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/mackerel-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/mackerel-agent.nix)

## `services.mackerel-agent.settings.host_status.on_start` {#opt-services.mackerel-agent.settings.host_status.on_start}

Host status after agent startup.

*Type:* one of "working", "standby", "maintenance", "poweroff"

*Default:* `"working"`

*Declared by:* [`nixos/modules/services/monitoring/mackerel-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/mackerel-agent.nix)

## `services.mackerel-agent.settings.host_status.on_stop` {#opt-services.mackerel-agent.settings.host_status.on_stop}

Host status after agent shutdown.

*Type:* one of "working", "standby", "maintenance", "poweroff"

*Default:* `"poweroff"`

*Declared by:* [`nixos/modules/services/monitoring/mackerel-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/mackerel-agent.nix)

## `services.maddy.config` {#opt-services.maddy.config}

Server configuration, see
[https://maddy.email](https://maddy.email) for
more information. The default configuration of this module will setup
minimal Maddy instance for mail transfer without TLS encryption.

::: note
This should not be used in a production environment.
:::

*Type:* null or strings concatenated with "\\n"

*Default:*

``` nix
''
  # Minimal configuration with TLS disabled, adapted from upstream example
  # configuration here https://github.com/foxcpp/maddy/blob/master/maddy.conf
  # Do not use this in production!
  
  auth.pass_table local_authdb {
    table sql_table {
      driver sqlite3
      dsn credentials.db
      table_name passwords
    }
  }
  
  storage.imapsql local_mailboxes {
    driver sqlite3
    dsn imapsql.db
  }
  
  table.chain local_rewrites {
    optional_step regexp "(.+)\+(.+)@(.+)" "$1@$3"
    optional_step static {
      entry postmaster postmaster@$(primary_domain)
    }
    optional_step file /etc/maddy/aliases
  }
  
  msgpipeline local_routing {
    destination postmaster $(local_domains) {
      modify {
        replace_rcpt &local_rewrites
      }
      deliver_to &local_mailboxes
    }
    default_destination {
      reject 550 5.1.1 "User doesn't exist"
    }
  }
  
  smtp tcp://0.0.0.0:25 {
    limits {
      all rate 20 1s
      all concurrency 10
    }
    dmarc yes
    check {
      require_mx_record
      dkim
      spf
    }
    source $(local_domains) {
      reject 501 5.1.8 "Use Submission for outgoing SMTP"
    }
    default_source {
      destination postmaster $(local_domains) {
        deliver_to &local_routing
      }
      default_destination {
        reject 550 5.1.1 "User doesn't exist"
      }
    }
  }
  
  submission tcp://0.0.0.0:587 {
    limits {
      all rate 50 1s
    }
    auth &local_authdb
    source $(local_domains) {
      check {
          authorize_sender {
              prepare_email &local_rewrites
              user_to_email identity
          }
      }
      destination postmaster $(local_domains) {
          deliver_to &local_routing
      }
      default_destination {
          modify {
              dkim $(primary_domain) $(local_domains) default
          }
          deliver_to &remote_queue
      }
    }
    default_source {
      reject 501 5.1.8 "Non-local sender domain"
    }
  }
  
  target.remote outbound_delivery {
    limits {
      destination rate 20 1s
      destination concurrency 10
    }
    mx_auth {
      dane
      mtasts {
        cache fs
        fs_dir mtasts_cache/
      }
      local_policy {
          min_tls_level encrypted
          min_mx_level none
      }
    }
  }
  
  target.queue remote_queue {
    target &outbound_delivery
    autogenerated_msg_domain $(primary_domain)
    bounce {
      destination postmaster $(local_domains) {
        deliver_to &local_routing
      }
      default_destination {
          reject 550 5.0.0 "Refusing to send DSNs to non-local addresses"
      }
    }
  }
  
  imap tcp://0.0.0.0:143 {
    auth &local_authdb
    storage &local_mailboxes
  }
''
```

*Declared by:* [`nixos/modules/services/mail/maddy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/maddy.nix)

## `services.maddy.enable` {#opt-services.maddy.enable}

Whether to enable Maddy, a free an open source mail server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/maddy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/maddy.nix)

## `services.maddy.ensureAccounts` {#opt-services.maddy.ensureAccounts}

List of IMAP accounts which get automatically created. Note that for
a complete setup, user credentials for these accounts are required
and can be created using the `ensureCredentials` option.
This option does not delete accounts which are not (anymore) listed.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "user1@localhost"
  "user2@localhost"
]
```

*Declared by:* [`nixos/modules/services/mail/maddy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/maddy.nix)

## `services.maddy.ensureCredentials` {#opt-services.maddy.ensureCredentials}

List of user accounts which get automatically created if they don't
exist yet. Note that for a complete setup, corresponding mail boxes
have to get created using the `ensureAccounts` option.
This option does not delete accounts which are not (anymore) listed.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "user1@localhost" = {
    passwordFile = "/secrets/user1-localhost";
  };
  "user2@localhost" = {
    passwordFile = "/secrets/user2-localhost";
  };
}
```

*Declared by:* [`nixos/modules/services/mail/maddy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/maddy.nix)

## `services.maddy.ensureCredentials.<name>.passwordFile` {#opt-services.maddy.ensureCredentials._name_.passwordFile}

Specifies the path to a file containing the
clear text password for the user.

*Type:* absolute path

*Default:* `null`

*Example:* `"/path/to/file"`

*Declared by:* [`nixos/modules/services/mail/maddy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/maddy.nix)

## `services.maddy.group` {#opt-services.maddy.group}

Group account under which maddy runs.

::: note
If left as the default value this group will automatically be created
on system activation, otherwise the sysadmin is responsible for
ensuring the group exists before the maddy service starts.
:::

*Type:* string

*Default:* `"maddy"`

*Declared by:* [`nixos/modules/services/mail/maddy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/maddy.nix)

## `services.maddy.hostname` {#opt-services.maddy.hostname}

Hostname to use. It should be FQDN.

*Type:* string

*Default:* `"localhost"`

*Example:* `"example.com"`

*Declared by:* [`nixos/modules/services/mail/maddy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/maddy.nix)

## `services.maddy.localDomains` {#opt-services.maddy.localDomains}

Define list of allowed domains.

*Type:* list of string

*Default:*

``` nix
[
  "$(primary_domain)"
]
```

*Example:*

``` nix
[
  "$(primary_domain)"
  "example.com"
  "other.example.com"
]
```

*Declared by:* [`nixos/modules/services/mail/maddy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/maddy.nix)

## `services.maddy.openFirewall` {#opt-services.maddy.openFirewall}

Open the configured incoming and outgoing mail server ports.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/mail/maddy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/maddy.nix)

## `services.maddy.package` {#opt-services.maddy.package}

The maddy package to use.

*Type:* package

*Default:* `pkgs.maddy`

*Declared by:* [`nixos/modules/services/mail/maddy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/maddy.nix)

## `services.maddy.primaryDomain` {#opt-services.maddy.primaryDomain}

Primary MX domain to use. It should be FQDN.

*Type:* string

*Default:* `"localhost"`

*Example:* `"mail.example.com"`

*Declared by:* [`nixos/modules/services/mail/maddy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/maddy.nix)

## `services.maddy.secrets` {#opt-services.maddy.secrets}

A list of files containing the various secrets. Should be in the format
expected by systemd's `EnvironmentFile` directory. Secrets can be
referenced in the format `{env:VAR}`.

Paths can be prefixed with `-` to ignore errors if the file does not exist.

*Type:* list of (string or absolute path)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/mail/maddy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/maddy.nix)

## `services.maddy.tls.certificates` {#opt-services.maddy.tls.certificates}

A list of attribute sets containing paths to TLS certificates and
keys. Maddy will use SNI if multiple pairs are selected.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[{
  keyPath = "/etc/ssl/mx1.example.org.key";
  certPath = "/etc/ssl/mx1.example.org.crt";
}]
```

*Declared by:* [`nixos/modules/services/mail/maddy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/maddy.nix)

## `services.maddy.tls.certificates.*.certPath` {#opt-services.maddy.tls.certificates._.certPath}

Path to the certificate used for TLS.

*Type:* absolute path

*Example:* `"/etc/ssl/mx1.example.org.crt"`

*Declared by:* [`nixos/modules/services/mail/maddy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/maddy.nix)

## `services.maddy.tls.certificates.*.keyPath` {#opt-services.maddy.tls.certificates._.keyPath}

Path to the private key used for TLS.

*Type:* absolute path

*Example:* `"/etc/ssl/mx1.example.org.key"`

*Declared by:* [`nixos/modules/services/mail/maddy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/maddy.nix)

## `services.maddy.tls.extraConfig` {#opt-services.maddy.tls.extraConfig}

Arguments for the specified certificate loader.

In case the `tls` loader is set, the defaults are considered secure
and there is no need to change anything in most cases.
For available options see [upstream manual](https://maddy.email/reference/tls/).

For ACME configuration, see [following page](https://maddy.email/reference/tls-acme).

*Type:* null or strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/mail/maddy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/maddy.nix)

## `services.maddy.tls.loader` {#opt-services.maddy.tls.loader}

TLS certificates are obtained by modules called "certificate
loaders".

The `file` loader module reads certificates from files specified by
the `certificates` option.

Alternatively the `acme` module can be used to automatically obtain
certificates using the ACME protocol.

Module configuration is done via the `tls.extraConfig` option.

Secrets such as API keys or passwords should not be supplied in
plaintext. Instead the `secrets` option can be used to read secrets
at runtime as environment variables. Secrets can be referenced with
`{env:VAR}`.

*Type:* null or one of "off", "file", "acme"

*Default:* `"off"`

*Declared by:* [`nixos/modules/services/mail/maddy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/maddy.nix)

## `services.maddy.user` {#opt-services.maddy.user}

User account under which maddy runs.

::: note
If left as the default value this user will automatically be created
on system activation, otherwise the sysadmin is responsible for
ensuring the user exists before the maddy service starts.
:::

*Type:* string

*Default:* `"maddy"`

*Declared by:* [`nixos/modules/services/mail/maddy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/maddy.nix)

## `services.magic-wormhole-mailbox-server.enable` {#opt-services.magic-wormhole-mailbox-server.enable}

Whether to enable Magic Wormhole Mailbox Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/magic-wormhole-mailbox-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/magic-wormhole-mailbox-server.nix)

## `services.magnetico.crawler.address` {#opt-services.magnetico.crawler.address}

Address to be used for indexing DHT nodes.

*Type:* string

*Default:* `"0.0.0.0"`

*Example:* `"1.2.3.4"`

*Declared by:* [`nixos/modules/services/torrent/magnetico.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/magnetico.nix)

## `services.magnetico.crawler.extraOptions` {#opt-services.magnetico.crawler.extraOptions}

Extra command line arguments to pass to magneticod.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/torrent/magnetico.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/magnetico.nix)

## `services.magnetico.crawler.maxLeeches` {#opt-services.magnetico.crawler.maxLeeches}

Maximum number of simultaneous leeches.

*Type:* positive integer, meaning \>0

*Default:* `200`

*Declared by:* [`nixos/modules/services/torrent/magnetico.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/magnetico.nix)

## `services.magnetico.crawler.maxNeighbors` {#opt-services.magnetico.crawler.maxNeighbors}

Maximum number of simultaneous neighbors of an indexer.
Be careful changing this number: high values can very
easily cause your network to be congested or even crash
your router.

*Type:* positive integer, meaning \>0

*Default:* `1000`

*Declared by:* [`nixos/modules/services/torrent/magnetico.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/magnetico.nix)

## `services.magnetico.crawler.port` {#opt-services.magnetico.crawler.port}

Port to be used for indexing DHT nodes.
This port should be added to
[`networking.firewall.allowedTCPPorts`](../../options/networking/index.md#opt-networking.firewall.allowedTCPPorts).

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `0`

*Declared by:* [`nixos/modules/services/torrent/magnetico.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/magnetico.nix)

## `services.magnetico.enable` {#opt-services.magnetico.enable}

Whether to enable Magnetico, Bittorrent DHT crawler.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/torrent/magnetico.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/magnetico.nix)

## `services.magnetico.web.address` {#opt-services.magnetico.web.address}

Address the web interface will listen to.

*Type:* string

*Default:* `"localhost"`

*Example:* `"1.2.3.4"`

*Declared by:* [`nixos/modules/services/torrent/magnetico.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/magnetico.nix)

## `services.magnetico.web.credentials` {#opt-services.magnetico.web.credentials}

The credentials to access the web interface, in case authentication is
enabled, in the format `username:hash`. If unset no
authentication will be required.

Usernames must start with a lowercase (\[a-z\]) ASCII character, might
contain non-consecutive underscores except at the end, and consists of
small-case a-z characters and digits 0-9.  The
`htpasswd` tool from the `apacheHttpd`
package may be used to generate the hash:
`htpasswd -bnBC 12 username password`

::: warning
The hashes will be stored world-readable in the nix store.
Consider using the `credentialsFile` option if you
don't want this.
:::

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  myuser = "$2y$12$YE01LZ8jrbQbx6c0s2hdZO71dSjn2p/O9XsYJpz.5968yCysUgiaG";
}
```

*Declared by:* [`nixos/modules/services/torrent/magnetico.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/magnetico.nix)

## `services.magnetico.web.credentialsFile` {#opt-services.magnetico.web.credentialsFile}

The path to the file holding the credentials to access the web
interface. If unset no authentication will be required.

The file must contain user names and password hashes in the format
`username:hash`, one for each line.  Usernames must
start with a lowecase (\[a-z\]) ASCII character, might contain
non-consecutive underscores except at the end, and consists of
small-case a-z characters and digits 0-9.
The `htpasswd` tool from the `apacheHttpd`
package may be used to generate the hash:
`htpasswd -bnBC 12 username password`

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/torrent/magnetico.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/magnetico.nix)

## `services.magnetico.web.extraOptions` {#opt-services.magnetico.web.extraOptions}

Extra command line arguments to pass to magneticow.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/torrent/magnetico.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/magnetico.nix)

## `services.magnetico.web.port` {#opt-services.magnetico.web.port}

Port the web interface will listen to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/torrent/magnetico.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/magnetico.nix)

## `services.mail.sendmailSetuidWrapper.capabilities` {#opt-services.mail.sendmailSetuidWrapper.capabilities}

A comma-separated list of capability clauses to be given to the
wrapper program. The format for capability clauses is described in the
“TEXTUAL REPRESENTATION” section of the `cap_from_text(3)`
manual page. For a list of capabilities supported by the system, check
the `capabilities(7)` manual page.

::: note
`cap_setpcap`, which is required for the wrapper
program to be able to raise caps into the Ambient set is NOT raised
to the Ambient set so that the real program cannot modify its own
capabilities!! This may be too restrictive for cases in which the
real program needs cap\_setpcap but it at least leans on the side
security paranoid vs. too relaxed.
:::

*Type:* strings concatenated with ","

*Default:* `""`

*Declared by:* [`nixos/modules/security/wrappers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/wrappers/default.nix)

## `services.mail.sendmailSetuidWrapper.enable` {#opt-services.mail.sendmailSetuidWrapper.enable}

Whether to enable the wrapper.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/wrappers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/wrappers/default.nix)

## `services.mail.sendmailSetuidWrapper.group` {#opt-services.mail.sendmailSetuidWrapper.group}

The group of the wrapper program.

*Type:* string

*Declared by:* [`nixos/modules/security/wrappers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/wrappers/default.nix)

## `services.mail.sendmailSetuidWrapper.owner` {#opt-services.mail.sendmailSetuidWrapper.owner}

The owner of the wrapper program.

*Type:* string

*Declared by:* [`nixos/modules/security/wrappers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/wrappers/default.nix)

## `services.mail.sendmailSetuidWrapper.permissions` {#opt-services.mail.sendmailSetuidWrapper.permissions}

The permissions of the wrapper program. The format is that of a
symbolic or numeric file mode understood by `chmod`.

*Type:* file mode string

*Default:* `"u+rx,g+x,o+x"`

*Example:* `"a+rx"`

*Declared by:* [`nixos/modules/security/wrappers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/wrappers/default.nix)

## `services.mail.sendmailSetuidWrapper.program` {#opt-services.mail.sendmailSetuidWrapper.program}

The name of the wrapper program. Defaults to the attribute name.

*Type:* null or string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/security/wrappers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/wrappers/default.nix)

## `services.mail.sendmailSetuidWrapper.setgid` {#opt-services.mail.sendmailSetuidWrapper.setgid}

Whether to add the setgid bit the wrapper program.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/wrappers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/wrappers/default.nix)

## `services.mail.sendmailSetuidWrapper.setuid` {#opt-services.mail.sendmailSetuidWrapper.setuid}

Whether to add the setuid bit the wrapper program.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/wrappers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/wrappers/default.nix)

## `services.mail.sendmailSetuidWrapper.source` {#opt-services.mail.sendmailSetuidWrapper.source}

The absolute path to the program to be wrapped.
This must be an ELF executable.

*Type:* absolute path

*Declared by:* [`nixos/modules/security/wrappers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/wrappers/default.nix)

## `services.mailcatcher.enable` {#opt-services.mailcatcher.enable}

Whether to enable MailCatcher, an SMTP server and web interface to locally test outbound emails.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/mailcatcher.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailcatcher.nix)

## `services.mailcatcher.http.ip` {#opt-services.mailcatcher.http.ip}

The ip address of the http server.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/mail/mailcatcher.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailcatcher.nix)

## `services.mailcatcher.http.path` {#opt-services.mailcatcher.http.path}

Prefix to all HTTP paths.

*Type:* null or string

*Default:* `null`

*Example:* `"/mailcatcher"`

*Declared by:* [`nixos/modules/services/mail/mailcatcher.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailcatcher.nix)

## `services.mailcatcher.http.port` {#opt-services.mailcatcher.http.port}

The port address of the http server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1080`

*Declared by:* [`nixos/modules/services/mail/mailcatcher.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailcatcher.nix)

## `services.mailcatcher.smtp.ip` {#opt-services.mailcatcher.smtp.ip}

The ip address of the smtp server.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/mail/mailcatcher.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailcatcher.nix)

## `services.mailcatcher.smtp.port` {#opt-services.mailcatcher.smtp.port}

The port address of the smtp server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1025`

*Declared by:* [`nixos/modules/services/mail/mailcatcher.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailcatcher.nix)

## `services.mailhog.apiPort` {#opt-services.mailhog.apiPort}

Port on which the API endpoint will listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8025`

*Declared by:* [`nixos/modules/services/mail/mailhog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailhog.nix)

## `services.mailhog.enable` {#opt-services.mailhog.enable}

Whether to enable MailHog, web and API based SMTP testing.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/mailhog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailhog.nix)

## `services.mailhog.extraArgs` {#opt-services.mailhog.extraArgs}

List of additional arguments to pass to the MailHog process.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/mail/mailhog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailhog.nix)

## `services.mailhog.setSendmail` {#opt-services.mailhog.setSendmail}

Whether to enable set the system sendmail to mailhogs's.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/mailhog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailhog.nix)

## `services.mailhog.smtpPort` {#opt-services.mailhog.smtpPort}

Port on which the SMTP endpoint will listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1025`

*Declared by:* [`nixos/modules/services/mail/mailhog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailhog.nix)

## `services.mailhog.storage` {#opt-services.mailhog.storage}

Store mails on disk or in memory.

*Type:* one of "maildir", "memory"

*Default:* `"memory"`

*Declared by:* [`nixos/modules/services/mail/mailhog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailhog.nix)

## `services.mailhog.uiPort` {#opt-services.mailhog.uiPort}

Port on which the HTTP UI will listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8025`

*Declared by:* [`nixos/modules/services/mail/mailhog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailhog.nix)

## `services.mailman.enable` {#opt-services.mailman.enable}

Enable Mailman on this host. Requires an active MTA on the host (e.g. Postfix).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.enablePostfix` {#opt-services.mailman.enablePostfix}

Enable Postfix integration. Requires an active Postfix installation.

If you want to use another MTA, set this option to false and configure
settings in services.mailman.settings.mta.

Refer to the Mailman manual for more info.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.hyperkitty.baseUrl` {#opt-services.mailman.hyperkitty.baseUrl}

Where can Mailman connect to Hyperkitty's internal API, preferably on
localhost?

*Type:* string

*Default:* `"http://localhost:18507/archives/"`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.hyperkitty.enable` {#opt-services.mailman.hyperkitty.enable}

Whether to enable the Hyperkitty archiver for Mailman.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.ldap.attrMap.email` {#opt-services.mailman.ldap.attrMap.email}

LDAP-attribute that corresponds to the `email`-attribute in mailman.

*Type:* string

*Default:* `"mail"`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.ldap.attrMap.firstName` {#opt-services.mailman.ldap.attrMap.firstName}

LDAP-attribute that corresponds to the `firstName`-attribute in mailman.

*Type:* string

*Default:* `"givenName"`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.ldap.attrMap.lastName` {#opt-services.mailman.ldap.attrMap.lastName}

LDAP-attribute that corresponds to the `lastName`-attribute in mailman.

*Type:* string

*Default:* `"sn"`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.ldap.attrMap.username` {#opt-services.mailman.ldap.attrMap.username}

LDAP-attribute that corresponds to the `username`-attribute in mailman.

*Type:* string

*Default:* `"uid"`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.ldap.bindDn` {#opt-services.mailman.ldap.bindDn}

Service account to bind against.

*Type:* string

*Example:* `"cn=root,dc=nixos,dc=org"`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.ldap.bindPasswordFile` {#opt-services.mailman.ldap.bindPasswordFile}

Path to the file containing the bind password of the service account
defined by [services (M)](#opt-services.mailman.ldap.bindDn).

*Type:* string

*Example:* `"/run/secrets/ldap-bind"`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.ldap.enable` {#opt-services.mailman.ldap.enable}

Whether to enable LDAP auth.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.ldap.groupSearch.ou` {#opt-services.mailman.ldap.groupSearch.ou}

Organizational unit to look up a group.

*Type:* string

*Example:* `"ou=groups,dc=nixos,dc=org"`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.ldap.groupSearch.query` {#opt-services.mailman.ldap.groupSearch.query}

Query to find a group associated to a user in the LDAP database.

*Type:* string

*Example:* `"(objectClass=groupOfNames)"`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.ldap.groupSearch.type` {#opt-services.mailman.ldap.groupSearch.type}

Type of group to perform a group search against.

*Type:* one of "posixGroup", "groupOfNames", "memberDNGroup", "nestedMemberDNGroup", "nestedGroupOfNames", "groupOfUniqueNames", "nestedGroupOfUniqueNames", "activeDirectoryGroup", "nestedActiveDirectoryGroup", "organizationalRoleGroup", "nestedOrganizationalRoleGroup"

*Default:* `"posixGroup"`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.ldap.serverUri` {#opt-services.mailman.ldap.serverUri}

LDAP host to connect against.

*Type:* string

*Example:* `"ldaps://ldap.host"`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.ldap.superUserGroup` {#opt-services.mailman.ldap.superUserGroup}

Group where a user must be a member of to gain superuser rights.

*Type:* null or string

*Default:* `null`

*Example:* `"cn=admin,ou=groups,dc=nixos,dc=org"`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.ldap.userSearch.ou` {#opt-services.mailman.ldap.userSearch.ou}

Organizational unit to look up a user.

*Type:* string

*Example:* `"ou=users,dc=nixos,dc=org"`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.ldap.userSearch.query` {#opt-services.mailman.ldap.userSearch.query}

Query to find a user in the LDAP database.

*Type:* string

*Example:* `"(&(objectClass=inetOrgPerson)(|(uid=%(user)s)(mail=%(user)s)))"`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.packageSet` {#opt-services.mailman.packageSet}

The mailmanPackages package to use.

*Type:* attribute set

*Default:* `pkgs.mailmanPackages`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.restApiPassFile` {#opt-services.mailman.restApiPassFile}

Path to the file containing the value for `MAILMAN_REST_API_PASS`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.serve.enable` {#opt-services.mailman.serve.enable}

Whether to enable automatic nginx and uwsgi setup for mailman-web.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.serve.uwsgiSettings` {#opt-services.mailman.serve.uwsgiSettings}

Extra configuration to merge into uwsgi config.

*Type:* JSON value

*Default:* `{ }`

*Example:*

``` nix
{
  uwsgi = {
    buffer-size = 8192;
  };
}
```

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.serve.virtualRoot` {#opt-services.mailman.serve.virtualRoot}

Path to mount the mailman-web django application on.

*Type:* string

*Default:* `"/"`

*Example:* `/lists`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.settings` {#opt-services.mailman.settings}

Settings for mailman.cfg

*Type:* attribute set of attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.siteOwner` {#opt-services.mailman.siteOwner}

Certain messages that must be delivered to a human, but which can't
be delivered to a list owner (e.g. a bounce from a list owner), will
be sent to this address. It should point to a human.

*Type:* string

*Example:* `"postmaster@example.org"`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.webHosts` {#opt-services.mailman.webHosts}

The list of hostnames and/or IP addresses from which the Mailman Web
UI will accept requests. By default, "localhost" and "127.0.0.1" are
enabled. All additional names under which your web server accepts
requests for the UI must be listed here or incoming requests will be
rejected.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.webSettings` {#opt-services.mailman.webSettings}

Overrides for the default mailman-web Django settings.

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailman.webUser` {#opt-services.mailman.webUser}

User to run mailman-web as

*Type:* string

*Default:* `"mailman-web"`

*Declared by:* [`nixos/modules/services/mail/mailman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailman.nix)

## `services.mailpit.instances` {#opt-services.mailpit.instances}

Configure mailpit instances. The attribute-set values are
CLI flags passed to the `mailpit` CLI.

See [upstream docs](https://mailpit.axllent.org/docs/configuration/runtime-options/)
for all available options.

*Type:* attribute set of (open submodule of attribute set of (string or signed integer or boolean))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/mail/mailpit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailpit.nix)

## `services.mailpit.instances.<name>.database` {#opt-services.mailpit.instances._name_.database}

Specify the local database filename to store persistent data.
If `null`, a temporary file will be created that will be removed when the application stops.
It's recommended to specify a relative path. The database will be written into the service's
state directory then.

*Type:* null or string

*Default:* `null`

*Example:* `"mailpit.db"`

*Declared by:* [`nixos/modules/services/mail/mailpit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailpit.nix)

## `services.mailpit.instances.<name>.listen` {#opt-services.mailpit.instances._name_.listen}

HTTP bind interface and port for UI.

*Type:* string

*Default:* `"127.0.0.1:8025"`

*Declared by:* [`nixos/modules/services/mail/mailpit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailpit.nix)

## `services.mailpit.instances.<name>.max` {#opt-services.mailpit.instances._name_.max}

Maximum number of emails to keep. If the number is exceeded, old emails
will be deleted.

Set to `0` to never prune old emails.

*Type:* unsigned integer, meaning \>=0

*Default:* `500`

*Declared by:* [`nixos/modules/services/mail/mailpit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailpit.nix)

## `services.mailpit.instances.<name>.smtp` {#opt-services.mailpit.instances._name_.smtp}

SMTP bind interface and port.

*Type:* string

*Default:* `"127.0.0.1:1025"`

*Declared by:* [`nixos/modules/services/mail/mailpit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mailpit.nix)

## `services.mainsail.enable` {#opt-services.mainsail.enable}

Whether to enable a modern and responsive user interface for Klipper.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.hostName` {#opt-services.mainsail.hostName}

Hostname to serve mainsail on

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx` {#opt-services.mainsail.nginx}

Extra configuration for the nginx virtual host of mainsail.

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
{
  serverAliases = [ "mainsail.${config.networking.domain}" ];
}
```

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.acmeFallbackHost` {#opt-services.mainsail.nginx.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.acmeRoot` {#opt-services.mainsail.nginx.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.addSSL` {#opt-services.mainsail.nginx.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.basicAuth` {#opt-services.mainsail.nginx.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.basicAuthFile` {#opt-services.mainsail.nginx.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.default` {#opt-services.mainsail.nginx.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.enableACME` {#opt-services.mainsail.nginx.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.extraConfig` {#opt-services.mainsail.nginx.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.forceSSL` {#opt-services.mainsail.nginx.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.globalRedirect` {#opt-services.mainsail.nginx.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.http2` {#opt-services.mainsail.nginx.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.http3` {#opt-services.mainsail.nginx.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.http3_hq` {#opt-services.mainsail.nginx.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.kTLS` {#opt-services.mainsail.nginx.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.listen` {#opt-services.mainsail.nginx.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.listen.*.addr` {#opt-services.mainsail.nginx.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.listen.*.extraParameters` {#opt-services.mainsail.nginx.listen._.extraParameters}

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

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.listen.*.port` {#opt-services.mainsail.nginx.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.listen.*.proxyProtocol` {#opt-services.mainsail.nginx.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.listen.*.ssl` {#opt-services.mainsail.nginx.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.listenAddresses` {#opt-services.mainsail.nginx.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.locations` {#opt-services.mainsail.nginx.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.locations.<name>.alias` {#opt-services.mainsail.nginx.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.locations.<name>.basicAuth` {#opt-services.mainsail.nginx.locations._name_.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.locations.<name>.basicAuthFile` {#opt-services.mainsail.nginx.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.locations.<name>.extraConfig` {#opt-services.mainsail.nginx.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.locations.<name>.fastcgiParams` {#opt-services.mainsail.nginx.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.locations.<name>.index` {#opt-services.mainsail.nginx.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.locations.<name>.priority` {#opt-services.mainsail.nginx.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.locations.<name>.proxyPass` {#opt-services.mainsail.nginx.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.locations.<name>.proxyWebsockets` {#opt-services.mainsail.nginx.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.locations.<name>.recommendedProxySettings` {#opt-services.mainsail.nginx.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.locations.<name>.recommendedUwsgiSettings` {#opt-services.mainsail.nginx.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.locations.<name>.return` {#opt-services.mainsail.nginx.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.locations.<name>.root` {#opt-services.mainsail.nginx.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.locations.<name>.tryFiles` {#opt-services.mainsail.nginx.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.locations.<name>.useGrpcErrorPages` {#opt-services.mainsail.nginx.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.locations.<name>.uwsgiPass` {#opt-services.mainsail.nginx.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.onlySSL` {#opt-services.mainsail.nginx.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.quic` {#opt-services.mainsail.nginx.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.redirectCode` {#opt-services.mainsail.nginx.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.rejectSSL` {#opt-services.mainsail.nginx.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.reuseport` {#opt-services.mainsail.nginx.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.root` {#opt-services.mainsail.nginx.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.serverAliases` {#opt-services.mainsail.nginx.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.serverName` {#opt-services.mainsail.nginx.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.sslCertificate` {#opt-services.mainsail.nginx.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.sslCertificateKey` {#opt-services.mainsail.nginx.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.sslTrustedCertificate` {#opt-services.mainsail.nginx.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.nginx.useACMEHost` {#opt-services.mainsail.nginx.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.mainsail.package` {#opt-services.mainsail.package}

The mainsail package to use.

*Type:* package

*Default:* `pkgs.mainsail`

*Declared by:* [`nixos/modules/services/web-apps/mainsail.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mainsail.nix)

## `services.malcontent.enable` {#opt-services.malcontent.enable}

Whether to enable Malcontent, parental control support for applications.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/malcontent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/malcontent.nix)

## `services.mame.emuAddr` {#opt-services.mame.emuAddr}

IP address of the guest system. The same you set inside guest OS under
MAME. Should be on the same subnet as [`services.mame.hostAddr`](#opt-services.mame.hostAddr).

*Type:* string

*Example:* `"192.168.31.155"`

*Declared by:* [`nixos/modules/services/misc/mame.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mame.nix)

## `services.mame.enable` {#opt-services.mame.enable}

Whether to setup TUN/TAP Ethernet interface for MAME emulator.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/mame.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mame.nix)

## `services.mame.hostAddr` {#opt-services.mame.hostAddr}

IP address of the host system. Usually an address of the main network
adapter or the adapter through which you get an internet connection.

*Type:* string

*Example:* `"192.168.31.156"`

*Declared by:* [`nixos/modules/services/misc/mame.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mame.nix)

## `services.mame.user` {#opt-services.mame.user}

User from which you run MAME binary.

*Type:* string

*Declared by:* [`nixos/modules/services/misc/mame.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mame.nix)

## `services.manticore.enable` {#opt-services.manticore.enable}

Whether to enable Manticoresearch.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/search/manticore.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/manticore.nix)

## `services.manticore.package` {#opt-services.manticore.package}

The manticoresearch package to use.

*Type:* package

*Default:* `pkgs.manticoresearch`

*Declared by:* [`nixos/modules/services/search/manticore.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/manticore.nix)

## `services.manticore.settings` {#opt-services.manticore.settings}

Configuration for Manticoresearch. See
[https://manual.manticoresearch.com/Server%20settings](https://manual.manticoresearch.com/Server%20settings)
for more information.

*Type:* open submodule of (JSON value)

*Default:*

``` nix
{
  searchd = {
    data_dir = "/var/lib/manticore";
    listen = [
      "127.0.0.1:9312"
      "127.0.0.1:9306:mysql"
      "127.0.0.1:9308:http"
    ];
    log = "/var/log/manticore/searchd.log";
    pid_file = "/run/manticore/searchd.pid";
    query_log = "/var/log/manticore/query.log";
  };
}
```

*Example:*

``` nix
{
  searchd = {
      listen = [
        "127.0.0.1:9312"
        "127.0.0.1:9306:mysql"
        "127.0.0.1:9308:http"
      ];
      log = "/var/log/manticore/searchd.log";
      query_log = "/var/log/manticore/query.log";
      pid_file = "/run/manticore/searchd.pid";
      data_dir = "/var/lib/manticore";
  };
}
```

*Declared by:* [`nixos/modules/services/search/manticore.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/manticore.nix)

## `services.marytts.basePath` {#opt-services.marytts.basePath}

The base path in which MaryTTS runs.

*Type:* absolute path

*Default:* `"/var/lib/marytts"`

*Declared by:* [`nixos/modules/services/audio/marytts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/marytts.nix)

## `services.marytts.enable` {#opt-services.marytts.enable}

Whether to enable MaryTTS.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/marytts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/marytts.nix)

## `services.marytts.openFirewall` {#opt-services.marytts.openFirewall}

Whether to open the port in the firewall for MaryTTS.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/marytts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/marytts.nix)

## `services.marytts.package` {#opt-services.marytts.package}

The marytts package to use.

*Type:* package

*Default:* `pkgs.marytts`

*Declared by:* [`nixos/modules/services/audio/marytts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/marytts.nix)

## `services.marytts.port` {#opt-services.marytts.port}

Port to bind the MaryTTS server to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `59125`

*Declared by:* [`nixos/modules/services/audio/marytts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/marytts.nix)

## `services.marytts.settings` {#opt-services.marytts.settings}

Settings for MaryTTS.

See the [default settings](https://github.com/marytts/marytts/blob/master/marytts-runtime/conf/marybase.config)
for a list of possible keys.

*Type:* open submodule of attribute set of (string, package, bool, int or float)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/audio/marytts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/marytts.nix)

## `services.marytts.userDictionaries` {#opt-services.marytts.userDictionaries}

Paths to the user dictionary files for MaryTTS.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  (pkgs.writeTextFile {
    name = "userdict-en_US";
    destination = "/userdict-en_US.txt";
    text = ''
      Nixpkgs | n I k s - ' p { - k @ - dZ @ s
    '';
  })
]
```

*Declared by:* [`nixos/modules/services/audio/marytts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/marytts.nix)

## `services.marytts.voices` {#opt-services.marytts.voices}

Paths to the JAR files that contain additional voices for MaryTTS.

Voices are automatically detected by MaryTTS, so there is no need to alter
your config to make use of new voices.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  (pkgs.fetchzip {
    url = "https://github.com/marytts/voice-bits1-hsmm/releases/download/v5.2/voice-bits1-hsmm-5.2.zip";
    hash = "sha256-1nK+qZxjumMev7z5lgKr660NCKH5FDwvZ9sw/YYYeaA=";
  })
]
```

*Declared by:* [`nixos/modules/services/audio/marytts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/marytts.nix)

## `services.mastodon.activeRecordEncryptionDeterministicKeyFile` {#opt-services.mastodon.activeRecordEncryptionDeterministicKeyFile}

This key must be set to enable the Active Record Encryption feature within
Rails that Mastodon uses to encrypt and decrypt some database attributes.
A new Active Record keys can be generated by running:

`nix build -f '<nixpkgs>' mastodon; cd result; RAILS_ENV=production ./bin/rails db:encryption:init`

If this file does not exist, it will be created with a new Active Record
keys.

*Type:* string

*Default:* `"/var/lib/mastodon/secrets/active-record-encryption-deterministic-key"`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.activeRecordEncryptionKeyDerivationSaltFile` {#opt-services.mastodon.activeRecordEncryptionKeyDerivationSaltFile}

This key must be set to enable the Active Record Encryption feature within
Rails that Mastodon uses to encrypt and decrypt some database attributes.
A new Active Record keys can be generated by running:

`nix build -f '<nixpkgs>' mastodon; cd result; RAILS_ENV=production ./bin/rails db:encryption:init`

If this file does not exist, it will be created with a new Active Record
keys.

*Type:* string

*Default:* `"/var/lib/mastodon/secrets/active-record-encryption-key-derivation-salt"`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.activeRecordEncryptionPrimaryKeyFile` {#opt-services.mastodon.activeRecordEncryptionPrimaryKeyFile}

This key must be set to enable the Active Record Encryption feature within
Rails that Mastodon uses to encrypt and decrypt some database attributes.
A new Active Record keys can be generated by running:

`nix build -f '<nixpkgs>' mastodon; cd result; RAILS_ENV=production ./bin/rails db:encryption:init`

If this file does not exist, it will be created with a new Active Record
keys.

*Type:* string

*Default:* `"/var/lib/mastodon/secrets/active-record-encryption-primary-key"`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.automaticMigrations` {#opt-services.mastodon.automaticMigrations}

Do automatic database migrations.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.configureNginx` {#opt-services.mastodon.configureNginx}

Configure nginx as a reverse proxy for mastodon.
Note that this makes some assumptions on your setup, and sets settings that will
affect other virtualHosts running on your nginx instance, if any.
Alternatively you can configure a reverse-proxy of your choice to serve these paths:

`/ -> ${pkgs.mastodon}/public`

`/ -> 127.0.0.1:{{ webPort }} `(If there was no file in the directory above.)

`/system/ -> /var/lib/mastodon/public-system/`

`/api/v1/streaming/ -> 127.0.0.1:{{ streamingPort }}`

Make sure that websockets are forwarded properly. You might want to set up caching
of some requests. Take a look at mastodon's provided nginx configuration at
`https://github.com/mastodon/mastodon/blob/master/dist/nginx.conf`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.database.createLocally` {#opt-services.mastodon.database.createLocally}

Configure local PostgreSQL database server for Mastodon.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.database.host` {#opt-services.mastodon.database.host}

Database host address or unix socket.

*Type:* string

*Default:* `"/run/postgresql"`

*Example:* `"192.168.23.42"`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.database.name` {#opt-services.mastodon.database.name}

Database name.

*Type:* string

*Default:* `"mastodon"`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.database.passwordFile` {#opt-services.mastodon.database.passwordFile}

A file containing the password corresponding to
`database.user`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/mastodon/secrets/db-password"`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.database.port` {#opt-services.mastodon.database.port}

Database host port.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
if config.services.mastodon.database.createLocally
then null
else 5432
```

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.database.user` {#opt-services.mastodon.database.user}

Database user.

*Type:* string

*Default:* `"mastodon"`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.elasticsearch.host` {#opt-services.mastodon.elasticsearch.host}

Elasticsearch host.
If it is not null, Elasticsearch full text search will be enabled.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.elasticsearch.passwordFile` {#opt-services.mastodon.elasticsearch.passwordFile}

Path to file containing password for optionally authenticating with Elasticsearch.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/mastodon/secrets/elasticsearch-password"`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.elasticsearch.port` {#opt-services.mastodon.elasticsearch.port}

Elasticsearch port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9200`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.elasticsearch.prefix` {#opt-services.mastodon.elasticsearch.prefix}

If provided, adds a prefix to indexes in Elasticsearch. This allows to use the same
Elasticsearch cluster between different projects or Mastodon servers.

*Type:* null or string

*Default:* `null`

*Example:* `"mastodon"`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.elasticsearch.preset` {#opt-services.mastodon.elasticsearch.preset}

It controls the ElasticSearch indices configuration (number of shards and replica).

*Type:* one of "single\_node\_cluster", "small\_cluster", "large\_cluster"

*Default:* `"single_node_cluster"`

*Example:* `"large_cluster"`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.elasticsearch.user` {#opt-services.mastodon.elasticsearch.user}

Used for optionally authenticating with Elasticsearch.

*Type:* null or string

*Default:* `null`

*Example:* `"elasticsearch-mastodon"`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.enable` {#opt-services.mastodon.enable}

Whether to enable Mastodon, a federated social network server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.enableUnixSocket` {#opt-services.mastodon.enableUnixSocket}

Instead of binding to an IP address like 127.0.0.1, you may bind to a Unix socket. This variable
is process-specific, e.g. you need different values for every process, and it works for both web (Puma)
processes and streaming API (Node.js) processes.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.extraConfig` {#opt-services.mastodon.extraConfig}

Extra environment variables to pass to all mastodon services.

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.extraEnvFiles` {#opt-services.mastodon.extraEnvFiles}

Extra environment files to pass to all mastodon services. Useful for passing down environmental secrets.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/etc/mastodon/s3config.env"
]
```

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.group` {#opt-services.mastodon.group}

Group under which mastodon runs.

*Type:* string

*Default:* `"mastodon"`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.localDomain` {#opt-services.mastodon.localDomain}

The domain serving your Mastodon instance.

*Type:* string

*Example:* `"social.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.mediaAutoRemove.enable` {#opt-services.mastodon.mediaAutoRemove.enable}

Automatically remove remote media attachments and preview cards older than the configured amount of days.

Recommended in [https://docs.joinmastodon.org/admin/setup/](https://docs.joinmastodon.org/admin/setup/).

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.mediaAutoRemove.olderThanDays` {#opt-services.mastodon.mediaAutoRemove.olderThanDays}

How old remote media needs to be in order to be removed.

*Type:* signed integer

*Default:* `30`

*Example:* `14`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.mediaAutoRemove.startAt` {#opt-services.mastodon.mediaAutoRemove.startAt}

How often to remove remote media.

The format is described in `systemd.time(7)`.

*Type:* string

*Default:* `"daily"`

*Example:* `"hourly"`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.package` {#opt-services.mastodon.package}

The mastodon package to use.

*Type:* package

*Default:* `pkgs.mastodon`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.redis.createLocally` {#opt-services.mastodon.redis.createLocally}

Configure local Redis server for Mastodon.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.redis.enableUnixSocket` {#opt-services.mastodon.redis.enableUnixSocket}

Use Unix socket

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.redis.host` {#opt-services.mastodon.redis.host}

Redis host.

*Type:* null or string

*Default:*

``` nix
if config.services.mastodon.redis.createLocally && !config.services.mastodon.redis.enableUnixSocket then "127.0.0.1" else null
```

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.redis.passwordFile` {#opt-services.mastodon.redis.passwordFile}

A file containing the password for Redis database.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/mastodon-redis-password"`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.redis.port` {#opt-services.mastodon.redis.port}

Redis port.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
if config.services.mastodon.redis.createLocally && !config.services.mastodon.redis.enableUnixSocket then 31637 else null
```

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.secretKeyBaseFile` {#opt-services.mastodon.secretKeyBaseFile}

Path to file containing the secret key base.
A new secret key base can be generated by running:

`nix build -f '<nixpkgs>' mastodon; cd result; bin/bundle exec rails secret`

If this file does not exist, it will be created with a new secret key base.

*Type:* string

*Default:* `"/var/lib/mastodon/secrets/secret-key-base"`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.sidekiqPort` {#opt-services.mastodon.sidekiqPort}

TCP port used by the mastodon-sidekiq service.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `55002`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.sidekiqProcesses` {#opt-services.mastodon.sidekiqProcesses}

How many Sidekiq processes should be used to handle background jobs, and which job classes they handle. *Read the [upstream documentation](https://docs.joinmastodon.org/admin/scaling/#sidekiq) before configuring this!*

*Type:* attribute set of (submodule)

*Default:*

``` nix
{
  all = {
    jobClasses = [ ];
    threads = null;
  };
}
```

*Example:*

``` nix
{
  all = {
    jobClasses = [ ];
    threads = null;
  };
  default = {
    jobClasses = [
      "default"
    ];
    threads = 10;
  };
  ingress = {
    jobClasses = [
      "ingress"
    ];
    threads = 5;
  };
  push-pull = {
    jobClasses = [
      "push"
      "pull"
    ];
    threads = 5;
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.sidekiqProcesses.<name>.jobClasses` {#opt-services.mastodon.sidekiqProcesses._name_.jobClasses}

If not empty, which job classes should be executed by this process. *Only one process should handle the 'scheduler' class. If left empty, this process will handle the 'scheduler' class.*

*Type:* list of (one of "default", "fasp", "push", "pull", "mailers", "scheduler", "ingress")

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.sidekiqProcesses.<name>.threads` {#opt-services.mastodon.sidekiqProcesses._name_.threads}

Number of threads this process should use for executing jobs. If null, the configured `sidekiqThreads` are used.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.sidekiqThreads` {#opt-services.mastodon.sidekiqThreads}

Worker threads used by the mastodon-sidekiq-all service. If `sidekiqProcesses` is configured and any processes specify null `threads`, this value is used.

*Type:* signed integer

*Default:* `25`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.smtp.authenticate` {#opt-services.mastodon.smtp.authenticate}

Authenticate with the SMTP server using username and password.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.smtp.createLocally` {#opt-services.mastodon.smtp.createLocally}

Configure local Postfix SMTP server for Mastodon.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.smtp.fromAddress` {#opt-services.mastodon.smtp.fromAddress}

"From" address used when sending Emails to users.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.smtp.host` {#opt-services.mastodon.smtp.host}

SMTP host used when sending emails to users.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.smtp.passwordFile` {#opt-services.mastodon.smtp.passwordFile}

Path to file containing the SMTP password.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/mastodon/secrets/smtp-password"`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.smtp.port` {#opt-services.mastodon.smtp.port}

SMTP port used when sending emails to users.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `25`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.smtp.user` {#opt-services.mastodon.smtp.user}

SMTP login name.

*Type:* null or string

*Default:* `null`

*Example:* `"mastodon@example.com"`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.streamingProcesses` {#opt-services.mastodon.streamingProcesses}

Number of processes used by the mastodon-streaming service.
Please define this explicitly, recommended is the amount of your CPU cores minus one.

*Type:* positive integer, meaning \>0

*Example:* `3`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.trustedProxy` {#opt-services.mastodon.trustedProxy}

You need to set it to the IP from which your reverse proxy sends requests to Mastodon's web process,
otherwise Mastodon will record the reverse proxy's own IP as the IP of all requests, which would be
bad because IP addresses are used for important rate limits and security functions.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.user` {#opt-services.mastodon.user}

User under which mastodon runs. If it is set to "mastodon",
that user will be created, otherwise it should be set to the
name of a user created elsewhere.
In both cases, the `mastodon` package will be added to the user's package set
and a tootctl wrapper to system packages that switches to the configured account
and load the right environment.

*Type:* string

*Default:* `"mastodon"`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.vapidPrivateKeyFile` {#opt-services.mastodon.vapidPrivateKeyFile}

Path to file containing the private key used for Web Push
Voluntary Application Server Identification.  A new keypair can
be generated by running:

`nix build -f '<nixpkgs>' mastodon; cd result; bin/rake webpush:generate_keys`

If this file does not exist, it will be created with a new
private key.

*Type:* string

*Default:* `"/var/lib/mastodon/secrets/vapid-private-key"`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.vapidPublicKeyFile` {#opt-services.mastodon.vapidPublicKeyFile}

Path to file containing the public key used for Web Push
Voluntary Application Server Identification.  A new keypair can
be generated by running:

`nix build -f '<nixpkgs>' mastodon; cd result; RAILS_ENV=production bin/rake webpush:generate_keys`

If `mastodon.vapidPrivateKeyFile`does not
exist, it and this file will be created with a new keypair.

*Type:* string

*Default:* `"/var/lib/mastodon/secrets/vapid-public-key"`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.webPort` {#opt-services.mastodon.webPort}

TCP port used by the mastodon-web service.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `55001`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.webProcesses` {#opt-services.mastodon.webProcesses}

Processes used by the mastodon-web service.

*Type:* signed integer

*Default:* `2`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.mastodon.webThreads` {#opt-services.mastodon.webThreads}

Threads per process used by the mastodon-web service.

*Type:* signed integer

*Default:* `5`

*Declared by:* [`nixos/modules/services/web-apps/mastodon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mastodon.nix)

## `services.matomo.enable` {#opt-services.matomo.enable}

Enable Matomo web analytics with php-fpm backend.
Either the nginx option or the webServerUser option is mandatory.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.hostname` {#opt-services.matomo.hostname}

URL of the host, without https prefix. You may want to change it if you
run Matomo on a different URL than matomo.yourdomain.

*Type:* string

*Default:*

``` nix
"matomo.${config.networking.fqdnOrHostName}"
```

*Example:* `"matomo.yourdomain.org"`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx` {#opt-services.matomo.nginx}

With this option, you can customize an nginx virtualHost which already has sensible defaults for Matomo.
Either this option or the webServerUser option is mandatory.
Set this to {} to just enable the virtualHost if you don't need any customization.
If enabled, then by default, the `serverName` is
`${user}.${config.networking.hostName}.${config.networking.domain}`,
SSL is active, and certificates are acquired via ACME.
If this is set to null (the default), no nginx virtualHost will be configured.

*Type:* null or (submodule)

*Default:* `null`

*Example:*

``` nix
{
  serverAliases = [
    "matomo.${config.networking.domain}"
    "stats.${config.networking.domain}"
  ];
  enableACME = false;
}
```

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.acmeFallbackHost` {#opt-services.matomo.nginx.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.acmeRoot` {#opt-services.matomo.nginx.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.addSSL` {#opt-services.matomo.nginx.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.basicAuth` {#opt-services.matomo.nginx.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.basicAuthFile` {#opt-services.matomo.nginx.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.default` {#opt-services.matomo.nginx.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.enableACME` {#opt-services.matomo.nginx.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.extraConfig` {#opt-services.matomo.nginx.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.forceSSL` {#opt-services.matomo.nginx.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.globalRedirect` {#opt-services.matomo.nginx.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.http2` {#opt-services.matomo.nginx.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.http3` {#opt-services.matomo.nginx.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.http3_hq` {#opt-services.matomo.nginx.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.kTLS` {#opt-services.matomo.nginx.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.listen` {#opt-services.matomo.nginx.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.listen.*.addr` {#opt-services.matomo.nginx.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.listen.*.extraParameters` {#opt-services.matomo.nginx.listen._.extraParameters}

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

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.listen.*.port` {#opt-services.matomo.nginx.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.listen.*.proxyProtocol` {#opt-services.matomo.nginx.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.listen.*.ssl` {#opt-services.matomo.nginx.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.listenAddresses` {#opt-services.matomo.nginx.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.locations` {#opt-services.matomo.nginx.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.locations.<name>.alias` {#opt-services.matomo.nginx.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.locations.<name>.basicAuth` {#opt-services.matomo.nginx.locations._name_.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.locations.<name>.basicAuthFile` {#opt-services.matomo.nginx.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.locations.<name>.extraConfig` {#opt-services.matomo.nginx.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.locations.<name>.fastcgiParams` {#opt-services.matomo.nginx.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.locations.<name>.index` {#opt-services.matomo.nginx.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.locations.<name>.priority` {#opt-services.matomo.nginx.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.locations.<name>.proxyPass` {#opt-services.matomo.nginx.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.locations.<name>.proxyWebsockets` {#opt-services.matomo.nginx.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.locations.<name>.recommendedProxySettings` {#opt-services.matomo.nginx.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.locations.<name>.recommendedUwsgiSettings` {#opt-services.matomo.nginx.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.locations.<name>.return` {#opt-services.matomo.nginx.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.locations.<name>.root` {#opt-services.matomo.nginx.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.locations.<name>.tryFiles` {#opt-services.matomo.nginx.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.locations.<name>.useGrpcErrorPages` {#opt-services.matomo.nginx.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.locations.<name>.uwsgiPass` {#opt-services.matomo.nginx.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.onlySSL` {#opt-services.matomo.nginx.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.quic` {#opt-services.matomo.nginx.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.redirectCode` {#opt-services.matomo.nginx.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.rejectSSL` {#opt-services.matomo.nginx.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.reuseport` {#opt-services.matomo.nginx.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.root` {#opt-services.matomo.nginx.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.serverAliases` {#opt-services.matomo.nginx.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.serverName` {#opt-services.matomo.nginx.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.sslCertificate` {#opt-services.matomo.nginx.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.sslCertificateKey` {#opt-services.matomo.nginx.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.sslTrustedCertificate` {#opt-services.matomo.nginx.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.nginx.useACMEHost` {#opt-services.matomo.nginx.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.package` {#opt-services.matomo.package}

The matomo package to use.

*Type:* package

*Default:* `pkgs.matomo`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.periodicArchiveProcessing` {#opt-services.matomo.periodicArchiveProcessing}

Enable periodic archive processing, which generates aggregated reports from the visits.

This means that you can safely disable browser triggers for Matomo archiving,
and safely enable to delete old visitor logs.
Before deleting visitor logs,
make sure though that you run `systemctl start matomo-archive-processing.service`
at least once without errors if you have already collected data before.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matomo.webServerUser` {#opt-services.matomo.webServerUser}

Name of the web server user that forwards requests to [`services.phpfpm.pools.<name>.socket`](../../options/services-p/index.md#opt-services.phpfpm.pools._name_.socket) the fastcgi socket for Matomo if the nginx
option is not used. Either this option or the nginx option is mandatory.
If you want to use another webserver than nginx, you need to set this to that server's user
and pass fastcgi requests to `index.php`, `matomo.php` and `piwik.php` (legacy name) to this socket.

*Type:* null or string

*Default:* `null`

*Example:* `"lighttpd"`

*Declared by:* [`nixos/modules/services/web-apps/matomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/matomo.nix)

## `services.matrix-alertmanager.enable` {#opt-services.matrix-alertmanager.enable}

Whether to enable matrix-alertmanager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/matrix-alertmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-alertmanager.nix)

## `services.matrix-alertmanager.homeserverUrl` {#opt-services.matrix-alertmanager.homeserverUrl}

URL of the Matrix homeserver to use.

*Type:* string

*Example:* `"https://matrix.example.com"`

*Declared by:* [`nixos/modules/services/matrix/matrix-alertmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-alertmanager.nix)

## `services.matrix-alertmanager.matrixRooms` {#opt-services.matrix-alertmanager.matrixRooms}

Combination of Alertmanager receiver(s) and rooms for the bot to join.
Each Alertmanager receiver can be mapped to post to a matrix room.

Note, you must use a room ID and not a room alias/name. Room IDs start
with a "!".

*Type:* list of (submodule)

*Example:*

``` nix
[
  {
    receivers = [
      "receiver1"
      "receiver2"
    ];
    roomId = "!roomid@example.com";
  }
  {
    receivers = [
      "receiver3"
    ];
    roomId = "!differentroomid@example.com";
  }
]
```

*Declared by:* [`nixos/modules/services/matrix/matrix-alertmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-alertmanager.nix)

## `services.matrix-alertmanager.matrixRooms.*.receivers` {#opt-services.matrix-alertmanager.matrixRooms._.receivers}

List of receivers for this room

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/matrix/matrix-alertmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-alertmanager.nix)

## `services.matrix-alertmanager.matrixRooms.*.roomId` {#opt-services.matrix-alertmanager.matrixRooms._.roomId}

Matrix room ID

*Type:* string

*Declared by:* [`nixos/modules/services/matrix/matrix-alertmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-alertmanager.nix)

## `services.matrix-alertmanager.matrixUser` {#opt-services.matrix-alertmanager.matrixUser}

Matrix user to use for the bot.

*Type:* string

*Example:* `"@alertmanageruser:example.com"`

*Declared by:* [`nixos/modules/services/matrix/matrix-alertmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-alertmanager.nix)

## `services.matrix-alertmanager.mention` {#opt-services.matrix-alertmanager.mention}

Makes the bot mention @room when posting an alert

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/matrix/matrix-alertmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-alertmanager.nix)

## `services.matrix-alertmanager.package` {#opt-services.matrix-alertmanager.package}

The matrix-alertmanager package to use.

*Type:* package

*Default:* `pkgs.matrix-alertmanager`

*Declared by:* [`nixos/modules/services/matrix/matrix-alertmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-alertmanager.nix)

## `services.matrix-alertmanager.port` {#opt-services.matrix-alertmanager.port}

Port that matrix-alertmanager listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/matrix/matrix-alertmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-alertmanager.nix)

## `services.matrix-alertmanager.secretFile` {#opt-services.matrix-alertmanager.secretFile}

File that contains a secret for the Alertmanager webhook.

*Type:* absolute path not in the Nix store

*Declared by:* [`nixos/modules/services/matrix/matrix-alertmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-alertmanager.nix)

## `services.matrix-alertmanager.tokenFile` {#opt-services.matrix-alertmanager.tokenFile}

File that contains a valid Matrix token for the Matrix user.

*Type:* absolute path not in the Nix store

*Declared by:* [`nixos/modules/services/matrix/matrix-alertmanager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-alertmanager.nix)

## `services.matrix-appservice-irc.enable` {#opt-services.matrix-appservice-irc.enable}

Whether to enable the Matrix/IRC bridge.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/appservice-irc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/appservice-irc.nix)

## `services.matrix-appservice-irc.localpart` {#opt-services.matrix-appservice-irc.localpart}

The user\_id localpart to assign to the appservice

*Type:* string

*Default:* `"appservice-irc"`

*Declared by:* [`nixos/modules/services/matrix/appservice-irc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/appservice-irc.nix)

## `services.matrix-appservice-irc.needBindingCap` {#opt-services.matrix-appservice-irc.needBindingCap}

Whether the daemon needs to bind to ports below 1024 (e.g. for the ident service)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/matrix/appservice-irc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/appservice-irc.nix)

## `services.matrix-appservice-irc.passwordEncryptionKeyLength` {#opt-services.matrix-appservice-irc.passwordEncryptionKeyLength}

Length of the key to encrypt IRC passwords with

*Type:* unsigned integer, meaning \>=0

*Default:* `4096`

*Example:* `8192`

*Declared by:* [`nixos/modules/services/matrix/appservice-irc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/appservice-irc.nix)

## `services.matrix-appservice-irc.port` {#opt-services.matrix-appservice-irc.port}

The port to listen on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8009`

*Declared by:* [`nixos/modules/services/matrix/appservice-irc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/appservice-irc.nix)

## `services.matrix-appservice-irc.registrationUrl` {#opt-services.matrix-appservice-irc.registrationUrl}

The URL where the application service is listening for homeserver requests,
from the Matrix homeserver perspective.

*Type:* string

*Example:* `"http://localhost:8009"`

*Declared by:* [`nixos/modules/services/matrix/appservice-irc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/appservice-irc.nix)

## `services.matrix-appservice-irc.settings` {#opt-services.matrix-appservice-irc.settings}

Configuration for the appservice, see
[https://github.com/matrix-org/matrix-appservice-irc/blob/4.0.1/config.sample.yaml](https://github.com/matrix-org/matrix-appservice-irc/blob/4.0.1/config.sample.yaml)
for supported values

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/matrix/appservice-irc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/appservice-irc.nix)

## `services.matrix-appservice-irc.settings.database` {#opt-services.matrix-appservice-irc.settings.database}

Configuration for the database

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/matrix/appservice-irc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/appservice-irc.nix)

## `services.matrix-appservice-irc.settings.database.connectionString` {#opt-services.matrix-appservice-irc.settings.database.connectionString}

The database connection string

*Type:* string

*Default:* `"nedb://var/lib/matrix-appservice-irc/data"`

*Example:* `"postgres://username:password@host:port/databasename"`

*Declared by:* [`nixos/modules/services/matrix/appservice-irc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/appservice-irc.nix)

## `services.matrix-appservice-irc.settings.database.engine` {#opt-services.matrix-appservice-irc.settings.database.engine}

Which database engine to use

*Type:* string

*Default:* `"nedb"`

*Example:* `"postgres"`

*Declared by:* [`nixos/modules/services/matrix/appservice-irc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/appservice-irc.nix)

## `services.matrix-appservice-irc.settings.homeserver` {#opt-services.matrix-appservice-irc.settings.homeserver}

Homeserver configuration

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/matrix/appservice-irc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/appservice-irc.nix)

## `services.matrix-appservice-irc.settings.homeserver.domain` {#opt-services.matrix-appservice-irc.settings.homeserver.domain}

The 'domain' part for user IDs on this home server. Usually
(but not always) is the "domain name" part of the homeserver URL.

*Type:* string

*Declared by:* [`nixos/modules/services/matrix/appservice-irc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/appservice-irc.nix)

## `services.matrix-appservice-irc.settings.homeserver.url` {#opt-services.matrix-appservice-irc.settings.homeserver.url}

The URL to the home server for client-server API calls

*Type:* string

*Declared by:* [`nixos/modules/services/matrix/appservice-irc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/appservice-irc.nix)

## `services.matrix-appservice-irc.settings.ircService` {#opt-services.matrix-appservice-irc.settings.ircService}

IRC bridge configuration

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/matrix/appservice-irc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/appservice-irc.nix)

## `services.matrix-appservice-irc.settings.ircService.mediaProxy.bindPort` {#opt-services.matrix-appservice-irc.settings.ircService.mediaProxy.bindPort}

Port that the media proxy binds to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `11111`

*Declared by:* [`nixos/modules/services/matrix/appservice-irc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/appservice-irc.nix)

## `services.matrix-appservice-irc.settings.ircService.mediaProxy.publicUrl` {#opt-services.matrix-appservice-irc.settings.ircService.mediaProxy.publicUrl}

URL under which the media proxy is publicly acccessible.

*Type:* string

*Example:* `"https://matrix.example.com/media"`

*Declared by:* [`nixos/modules/services/matrix/appservice-irc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/appservice-irc.nix)

## `services.matrix-appservice-irc.settings.ircService.mediaProxy.signingKeyPath` {#opt-services.matrix-appservice-irc.settings.ircService.mediaProxy.signingKeyPath}

Path to the signing key file for authenticated media.

*Type:* absolute path

*Default:* `"/var/lib/matrix-appservice-irc/media-signingkey.jwk"`

*Declared by:* [`nixos/modules/services/matrix/appservice-irc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/appservice-irc.nix)

## `services.matrix-appservice-irc.settings.ircService.mediaProxy.ttlSeconds` {#opt-services.matrix-appservice-irc.settings.ircService.mediaProxy.ttlSeconds}

Lifetime in seconds, that generated URLs stay valid.

Set the lifetime to 0 to prevent URLs from becoming invalid.

*Type:* unsigned integer, meaning \>=0

*Default:* `3600`

*Example:* `0`

*Declared by:* [`nixos/modules/services/matrix/appservice-irc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/appservice-irc.nix)

## `services.matrix-appservice-irc.settings.ircService.passwordEncryptionKeyPath` {#opt-services.matrix-appservice-irc.settings.ircService.passwordEncryptionKeyPath}

Location of the key with which IRC passwords are encrypted
for storage. Will be generated on first run if not present.

*Type:* string

*Default:* `"/var/lib/matrix-appservice-irc/passkey.pem"`

*Declared by:* [`nixos/modules/services/matrix/appservice-irc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/appservice-irc.nix)

## `services.matrix-appservice-irc.settings.ircService.servers` {#opt-services.matrix-appservice-irc.settings.ircService.servers}

IRC servers to connect to

*Type:* open submodule of (JSON value)

*Declared by:* [`nixos/modules/services/matrix/appservice-irc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/appservice-irc.nix)

## `services.matrix-authentication-service.createDatabase` {#opt-services.matrix-authentication-service.createDatabase}

Whether to enable and configure `services.postgresql` to ensure that the database user `matrix-authentication-service`
and the database `matrix-authentication-service` exist.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.credentials` {#opt-services.matrix-authentication-service.credentials}

Mapping of credential name to  source file-path. Exposed to the unit via LoadCredential and
readable inside the service at `${CREDENTIALS_DIRECTORY}/<name>`.

For example:

```
services.matrix-authentication-service.credentials."synapse-secret" = "/run/agenix/synapse-shared";
services.matrix-authentication-service.settings.matrix.secret_file =
  "\${CREDENTIALS_DIRECTORY}/synapse-secret";
```

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.enable` {#opt-services.matrix-authentication-service.enable}

Whether to enable Matrix Authentication Service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.extraConfigFiles` {#opt-services.matrix-authentication-service.extraConfigFiles}

Extra config files to include.

The configuration files will be included based on the command line
argument --config. This allows to configure secrets without
having to go through the Nix store, e.g. based on deployment keys if
NixOps is in use.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.package` {#opt-services.matrix-authentication-service.package}

The matrix-authentication-service package to use.

*Type:* package

*Default:* `pkgs.matrix-authentication-service`

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.serviceDependencies` {#opt-services.matrix-authentication-service.serviceDependencies}

List of Systemd services to require and wait for when starting the application service,
such as the Matrix homeserver if it's running on the same host.

*Type:* list of string

*Default:*

``` nix
lib.optional config.services.matrix-synapse.enable config.services.matrix-synapse.serviceUnit
```

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings` {#opt-services.matrix-authentication-service.settings}

The primary mas configuration. See the
[configuration reference](https://element-hq.github.io/matrix-authentication-service/usage/configuration.html)
for possible values.

Secrets should be passed in by using the `extraConfigFiles` option.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.database.connect_timeout` {#opt-services.matrix-authentication-service.settings.database.connect_timeout}

Connection timeout for the connection pool.

*Type:* unsigned integer, meaning \>=0

*Default:* `30`

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.database.idle_timeout` {#opt-services.matrix-authentication-service.settings.database.idle_timeout}

Idle timeout for the connection pool.

*Type:* unsigned integer, meaning \>=0

*Default:* `600`

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.database.max_connections` {#opt-services.matrix-authentication-service.settings.database.max_connections}

Maximum number of connections for the connection pool.

*Type:* unsigned integer, meaning \>=0

*Default:* `10`

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.database.max_lifetime` {#opt-services.matrix-authentication-service.settings.database.max_lifetime}

Maximum lifetime for the connection pool.

*Type:* unsigned integer, meaning \>=0

*Default:* `1800`

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.database.min_connections` {#opt-services.matrix-authentication-service.settings.database.min_connections}

Minimum number of connections for the connection pool.

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.database.uri` {#opt-services.matrix-authentication-service.settings.database.uri}

The postgres connection string.
Refer to [https://www.postgresql.org/docs/current/libpq-connect.html#LIBPQ-CONNSTRING](https://www.postgresql.org/docs/current/libpq-connect.html#LIBPQ-CONNSTRING).
If you need to put secrets in the uri, please use the `extraConfigFiles` option.

*Type:* string

*Default:* `"postgresql:///matrix-authentication-service?host=/run/postgresql"`

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.http.listeners` {#opt-services.matrix-authentication-service.settings.http.listeners}

Each listener can serve multiple resources, and listen on multiple TCP ports or UNIX sockets.

*Type:* list of (open submodule of (YAML 1.1 value))

*Default:*

``` nix
[
  {
    binds = [
      {
        host = "0.0.0.0";
        port = 8080;
      }
    ];
    name = "web";
    proxy_protocol = false;
    resources = [
      {
        name = "discovery";
      }
      {
        name = "human";
      }
      {
        name = "oauth";
      }
      {
        name = "compat";
      }
      {
        name = "graphql";
      }
      {
        name = "assets";
      }
    ];
  }
  {
    binds = [
      {
        host = "0.0.0.0";
        port = 8081;
      }
    ];
    name = "internal";
    proxy_protocol = false;
    resources = [
      {
        name = "health";
      }
    ];
  }
]
```

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.http.listeners.*.binds` {#opt-services.matrix-authentication-service.settings.http.listeners._.binds}

List of addresses and ports to listen to.

*Type:* list of (open submodule of (YAML 1.1 value))

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.http.listeners.*.binds.*.host` {#opt-services.matrix-authentication-service.settings.http.listeners._.binds._.host}

Listen on the given host.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.http.listeners.*.binds.*.port` {#opt-services.matrix-authentication-service.settings.http.listeners._.binds._.port}

Listen on the given port.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.http.listeners.*.name` {#opt-services.matrix-authentication-service.settings.http.listeners._.name}

The name of the listener, used in logs and metrics.

*Type:* string

*Example:* `"web"`

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.http.listeners.*.proxy_protocol` {#opt-services.matrix-authentication-service.settings.http.listeners._.proxy_protocol}

Whether to enable the PROXY protocol on the listener.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.http.listeners.*.resources` {#opt-services.matrix-authentication-service.settings.http.listeners._.resources}

List of resources to serve.

*Type:* list of (open submodule of (YAML 1.1 value))

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.http.listeners.*.resources.*.name` {#opt-services.matrix-authentication-service.settings.http.listeners._.resources._.name}

Serve the given resource.

*Type:* string

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.http.public_base` {#opt-services.matrix-authentication-service.settings.http.public_base}

Public URL base used when building absolute public URLs.

*Type:* string

*Default:* `"http://[::]:8080/"`

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.http.trusted_proxies` {#opt-services.matrix-authentication-service.settings.http.trusted_proxies}

MAS can infer the client IP address from the X-Forwarded-For header. It will trust the value for this header only if the request comes from a trusted reverse proxy listed here.

*Type:* list of string

*Default:*

``` nix
[
  "127.0.0.1/8"
  "::1/128"
]
```

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.matrix.endpoint` {#opt-services.matrix-authentication-service.settings.matrix.endpoint}

The URL to which the homeserver is accessible from the service.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.matrix.homeserver` {#opt-services.matrix-authentication-service.settings.matrix.homeserver}

Corresponds to the server\_name in the Synapse configuration file.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.passwords.enabled` {#opt-services.matrix-authentication-service.settings.passwords.enabled}

Whether to enable the password database. If disabled, users will only be able to log in using upstream OIDC providers.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.passwords.minimum_complexity` {#opt-services.matrix-authentication-service.settings.passwords.minimum_complexity}

Minimum complexity required for passwords, estimated by the zxcvbn algorithm.
Must be between 0 and 4, default is 3. See [https://github.com/dropbox/zxcvbn#usage](https://github.com/dropbox/zxcvbn#usage) for more information.

*Type:* one of 0, 1, 2, 3, 4

*Default:* `3`

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.passwords.schemes` {#opt-services.matrix-authentication-service.settings.passwords.schemes}

List of password hashing schemes being used. Only change this if you know what you're doing.

*Type:* list of (open submodule of (YAML 1.1 value))

*Default:*

``` nix
[
  {
    algorithm = "argon2id";
    version = 1;
  }
]
```

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.passwords.schemes.*.algorithm` {#opt-services.matrix-authentication-service.settings.passwords.schemes._.algorithm}

Password scheme algorithm.

*Type:* string

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.passwords.schemes.*.version` {#opt-services.matrix-authentication-service.settings.passwords.schemes._.version}

Password scheme version.

*Type:* unsigned integer, meaning \>=0

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.upstream_oauth2.providers` {#opt-services.matrix-authentication-service.settings.upstream_oauth2.providers}

Configuration of upstream providers

*Type:* null or (list of (open submodule of (YAML 1.1 value)))

*Default:* `null`

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-authentication-service.settings.upstream_oauth2.providers.*.id` {#opt-services.matrix-authentication-service.settings.upstream_oauth2.providers._.id}

Unique id for the provider, must be a ULID, and can be generated using online tools like [https://www.ulidtools.com](https://www.ulidtools.com).

*Type:* null or string

*Default:* `null`

*Example:* `"01H8PKNWKKRPCBW4YGH1RWV279"`

*Declared by:* [`nixos/modules/services/matrix/matrix-authentication-service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/matrix-authentication-service.nix)

## `services.matrix-conduit.enable` {#opt-services.matrix-conduit.enable}

Whether to enable matrix-conduit.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/conduit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/conduit.nix)

## `services.matrix-conduit.extraEnvironment` {#opt-services.matrix-conduit.extraEnvironment}

Extra Environment variables to pass to the conduit server.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  RUST_BACKTRACE = "yes";
}
```

*Declared by:* [`nixos/modules/services/matrix/conduit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/conduit.nix)

## `services.matrix-conduit.package` {#opt-services.matrix-conduit.package}

The matrix-conduit package to use.

*Type:* package

*Default:* `pkgs.matrix-conduit`

*Declared by:* [`nixos/modules/services/matrix/conduit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/conduit.nix)

## `services.matrix-conduit.secretFile` {#opt-services.matrix-conduit.secretFile}

Path to a file containing sensitive environment as described in {manpage}\`systemd.exec(5).
Some variables that can be considered secrets are:

- CONDUIT\_JWT\_SECRET:
  The secret used to enable JWT login. Without it a 400 error will be returned.

- CONDUIT\_TURN\_SECRET:
  The TURN secret

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/matrix-conduit.env"`

*Declared by:* [`nixos/modules/services/matrix/conduit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/conduit.nix)

## `services.matrix-conduit.settings` {#opt-services.matrix-conduit.settings}

Generates the conduit.toml configuration file. Refer to
[https://docs.conduit.rs/configuration.html](https://docs.conduit.rs/configuration.html)
for details on supported values.
Note that database\_path can not be edited because the service's reliance on systemd StateDir.
For secrets use the `secretFile` option instead.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/matrix/conduit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/conduit.nix)

## `services.matrix-conduit.settings.global.address` {#opt-services.matrix-conduit.settings.global.address}

Address to listen on for connections by the reverse proxy/tls terminator.

*Type:* string

*Default:* `"::1"`

*Declared by:* [`nixos/modules/services/matrix/conduit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/conduit.nix)

## `services.matrix-conduit.settings.global.allow_check_for_updates` {#opt-services.matrix-conduit.settings.global.allow_check_for_updates}

Whether to allow Conduit to automatically contact
[https://conduit.rs](https://conduit.rs) hourly to check for important Conduit news.

Disabled by default because nixpkgs handles updates.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/matrix/conduit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/conduit.nix)

## `services.matrix-conduit.settings.global.allow_encryption` {#opt-services.matrix-conduit.settings.global.allow_encryption}

Whether new encrypted rooms can be created. Note: existing rooms will continue to work.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/matrix/conduit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/conduit.nix)

## `services.matrix-conduit.settings.global.allow_federation` {#opt-services.matrix-conduit.settings.global.allow_federation}

Whether this server federates with other servers.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/matrix/conduit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/conduit.nix)

## `services.matrix-conduit.settings.global.allow_registration` {#opt-services.matrix-conduit.settings.global.allow_registration}

Whether new users can register on this server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/matrix/conduit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/conduit.nix)

## `services.matrix-conduit.settings.global.database_backend` {#opt-services.matrix-conduit.settings.global.database_backend}

The database backend for the service. Switching it on an existing
instance will require manual migration of data.

*Type:* one of "sqlite", "rocksdb"

*Default:* `"sqlite"`

*Example:* `"rocksdb"`

*Declared by:* [`nixos/modules/services/matrix/conduit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/conduit.nix)

## `services.matrix-conduit.settings.global.database_path` {#opt-services.matrix-conduit.settings.global.database_path}

Path to the conduit database, the directory where conduit will save its data.
Note that due to using the DynamicUser feature of systemd, this value should not be changed
and is set to be read only.

*Type:* string

*Default:* `"/var/lib/matrix-conduit/"`

*Read only*

*Declared by:* [`nixos/modules/services/matrix/conduit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/conduit.nix)

## `services.matrix-conduit.settings.global.max_request_size` {#opt-services.matrix-conduit.settings.global.max_request_size}

Max request size in bytes. Don't forget to also change it in the proxy.

*Type:* positive integer, meaning \>0

*Default:* `20000000`

*Declared by:* [`nixos/modules/services/matrix/conduit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/conduit.nix)

## `services.matrix-conduit.settings.global.port` {#opt-services.matrix-conduit.settings.global.port}

The port Conduit will be running on. You need to set up a reverse proxy in your web server (e.g. apache or nginx), so all requests to /\_matrix on port 443 and 8448 will be forwarded to the Conduit instance running on this port

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6167`

*Declared by:* [`nixos/modules/services/matrix/conduit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/conduit.nix)

## `services.matrix-conduit.settings.global.server_name` {#opt-services.matrix-conduit.settings.global.server_name}

The server\_name is the name of this server. It is used as a suffix for user # and room ids.

*Type:* string

*Example:* `"example.com"`

*Declared by:* [`nixos/modules/services/matrix/conduit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/conduit.nix)

## `services.matrix-conduit.settings.global.trusted_servers` {#opt-services.matrix-conduit.settings.global.trusted_servers}

Servers trusted with signing server keys.

*Type:* list of string

*Default:*

``` nix
[
  "matrix.org"
]
```

*Declared by:* [`nixos/modules/services/matrix/conduit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/conduit.nix)

## `services.matrix-continuwuity.admin.enable` {#opt-services.matrix-continuwuity.admin.enable}

Add conduwuit command to PATH for administration

*Type:* boolean

*Default:* `config.services.matrix-continuwuity.enable`

*Declared by:* [`nixos/modules/services/matrix/continuwuity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/continuwuity.nix)

## `services.matrix-continuwuity.enable` {#opt-services.matrix-continuwuity.enable}

Whether to enable continuwuity.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/continuwuity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/continuwuity.nix)

## `services.matrix-continuwuity.extraEnvironment` {#opt-services.matrix-continuwuity.extraEnvironment}

Extra Environment variables to pass to the continuwuity server.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  RUST_BACKTRACE = "yes";
}
```

*Declared by:* [`nixos/modules/services/matrix/continuwuity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/continuwuity.nix)

## `services.matrix-continuwuity.group` {#opt-services.matrix-continuwuity.group}

The group `continuwuity` is run as.

*Type:* non-empty string

*Default:* `"continuwuity"`

*Declared by:* [`nixos/modules/services/matrix/continuwuity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/continuwuity.nix)

## `services.matrix-continuwuity.package` {#opt-services.matrix-continuwuity.package}

The matrix-continuwuity package to use.

*Type:* package

*Default:* `pkgs.matrix-continuwuity`

*Declared by:* [`nixos/modules/services/matrix/continuwuity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/continuwuity.nix)

## `services.matrix-continuwuity.settings` {#opt-services.matrix-continuwuity.settings}

Generates the continuwuity.toml configuration file. Refer to
[https://continuwuity.org/configuration.html](https://continuwuity.org/configuration.html)
for details on supported values.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/matrix/continuwuity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/continuwuity.nix)

## `services.matrix-continuwuity.settings.global.address` {#opt-services.matrix-continuwuity.settings.global.address}

Addresses (IPv4 or IPv6) to listen on for connections by the reverse proxy/tls terminator.
If set to `null`, continuwuity will listen on IPv4 and IPv6 localhost.
Must be `null` if `unix_socket_path` is set.

*Type:* null or (list of non-empty string)

*Default:* `null`

*Example:*

``` nix
[
  "127.0.0.1"
  "::1"
]
```

*Declared by:* [`nixos/modules/services/matrix/continuwuity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/continuwuity.nix)

## `services.matrix-continuwuity.settings.global.allow_announcements_check` {#opt-services.matrix-continuwuity.settings.global.allow_announcements_check}

If enabled, continuwuity will send a simple GET request periodically to
[https://continuwuity.org/.well-known/continuwuity/announcements](https://continuwuity.org/.well-known/continuwuity/announcements) for any new announcements made.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/matrix/continuwuity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/continuwuity.nix)

## `services.matrix-continuwuity.settings.global.allow_encryption` {#opt-services.matrix-continuwuity.settings.global.allow_encryption}

Whether new encrypted rooms can be created. Note: existing rooms will continue to work.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/matrix/continuwuity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/continuwuity.nix)

## `services.matrix-continuwuity.settings.global.allow_federation` {#opt-services.matrix-continuwuity.settings.global.allow_federation}

Whether this server federates with other servers.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/matrix/continuwuity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/continuwuity.nix)

## `services.matrix-continuwuity.settings.global.allow_registration` {#opt-services.matrix-continuwuity.settings.global.allow_registration}

Whether new users can register on this server.

Registration with token requires `registration_token` or `registration_token_file` to be set.

If set to true without a token configured, and
`yes_i_am_very_very_sure_i_want_an_open_registration_server_prone_to_abuse`
is set to true, users can freely register.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/matrix/continuwuity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/continuwuity.nix)

## `services.matrix-continuwuity.settings.global.database_path` {#opt-services.matrix-continuwuity.settings.global.database_path}

Path to the continuwuity database, the directory where continuwuity will save its data.
Note that database\_path cannot be edited because of the service's reliance on systemd StateDir.

*Type:* absolute path

*Default:* `"/var/lib/continuwuity/"`

*Read only*

*Declared by:* [`nixos/modules/services/matrix/continuwuity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/continuwuity.nix)

## `services.matrix-continuwuity.settings.global.max_request_size` {#opt-services.matrix-continuwuity.settings.global.max_request_size}

Max request size in bytes. Don't forget to also change it in the proxy.

*Type:* positive integer, meaning \>0

*Default:* `20000000`

*Declared by:* [`nixos/modules/services/matrix/continuwuity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/continuwuity.nix)

## `services.matrix-continuwuity.settings.global.port` {#opt-services.matrix-continuwuity.settings.global.port}

The port(s) continuwuity will be running on.
You need to set up a reverse proxy in your web server (e.g. apache or nginx),
so all requests to /\_matrix on port 443 and 8448 will be forwarded to the continuwuity
instance running on this port.

*Type:* list of 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
[
  6167
]
```

*Declared by:* [`nixos/modules/services/matrix/continuwuity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/continuwuity.nix)

## `services.matrix-continuwuity.settings.global.server_name` {#opt-services.matrix-continuwuity.settings.global.server_name}

The server\_name is the name of this server. It is used as a suffix for user and room ids.

*Type:* non-empty string

*Example:* `"example.com"`

*Declared by:* [`nixos/modules/services/matrix/continuwuity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/continuwuity.nix)

## `services.matrix-continuwuity.settings.global.trusted_servers` {#opt-services.matrix-continuwuity.settings.global.trusted_servers}

Servers listed here will be used to gather public keys of other servers
(notary trusted key servers).

Currently, continuwuity doesn't support inbound batched key requests, so
this list should only contain other Synapse servers.

Example: `[ "matrix.org" "constellatory.net" "tchncs.de" ]`

*Type:* list of non-empty string

*Default:*

``` nix
[
  "matrix.org"
]
```

*Declared by:* [`nixos/modules/services/matrix/continuwuity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/continuwuity.nix)

## `services.matrix-continuwuity.settings.global.unix_socket_path` {#opt-services.matrix-continuwuity.settings.global.unix_socket_path}

Listen on a UNIX socket at the specified path. If listening on a UNIX socket,
listening on an address will be disabled. The `address` option must be set to
`null` (the default value). The option `services.continuwuity.group` must
be set to a group your reverse proxy is part of.

This will automatically add a system user "continuwuity" to your system if
`services.continuwuity.user` is left at the default, and a "continuwuity"
group if `services.continuwuity.group` is left at the default.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/matrix/continuwuity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/continuwuity.nix)

## `services.matrix-continuwuity.settings.global.unix_socket_perms` {#opt-services.matrix-continuwuity.settings.global.unix_socket_perms}

The default permissions (in octal) to create the UNIX socket with.

*Type:* positive integer, meaning \>0

*Default:* `660`

*Declared by:* [`nixos/modules/services/matrix/continuwuity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/continuwuity.nix)

## `services.matrix-continuwuity.user` {#opt-services.matrix-continuwuity.user}

The user `continuwuity` is run as.

*Type:* non-empty string

*Default:* `"continuwuity"`

*Declared by:* [`nixos/modules/services/matrix/continuwuity.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/continuwuity.nix)

## `services.matrix-hookshot.enable` {#opt-services.matrix-hookshot.enable}

Whether to enable matrix-hookshot, a bridge between Matrix and project management services.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/hookshot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/hookshot.nix)

## `services.matrix-hookshot.package` {#opt-services.matrix-hookshot.package}

The matrix-hookshot package to use.

*Type:* package

*Default:* `pkgs.matrix-hookshot`

*Declared by:* [`nixos/modules/services/matrix/hookshot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/hookshot.nix)

## `services.matrix-hookshot.registrationFile` {#opt-services.matrix-hookshot.registrationFile}

Appservice registration file.
As it contains secret tokens, you may not want to add this to the publicly readable Nix store.

*Type:* absolute path

*Example:*

``` nix
pkgs.writeText "matrix-hookshot-registration" \'\'
  id: matrix-hookshot
  as_token: aaaaaaaaaa
  hs_token: aaaaaaaaaa
  namespaces:
    rooms: []
    users:
      - regex: "@_webhooks_.*:foobar"
        exclusive: true

  sender_localpart: hookshot
  url: "http://localhost:9993"
  rate_limited: false
  \'\'
```

*Declared by:* [`nixos/modules/services/matrix/hookshot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/hookshot.nix)

## `services.matrix-hookshot.serviceDependencies` {#opt-services.matrix-hookshot.serviceDependencies}

List of Systemd services to require and wait for when starting the application service,
such as the Matrix homeserver if it's running on the same host.

*Type:* list of string

*Default:*

``` nix
lib.optional config.services.matrix-synapse.enable config.services.matrix-synapse.serviceUnit
```

*Declared by:* [`nixos/modules/services/matrix/hookshot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/hookshot.nix)

## `services.matrix-hookshot.settings` {#opt-services.matrix-hookshot.settings}

`config.yml` configuration as a Nix attribute set.

For details please see the [documentation](https://matrix-org.github.io/matrix-hookshot/latest/setup/sample-configuration.html).

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Example:*

``` nix
{
  bridge = {
    bindAddress = "127.0.0.1";
    domain = "example.com";
    mediaUrl = "https://example.com";
    port = 9993;
    url = "http://localhost:8008";
  };
  listeners = [
    {
      bindAddress = "0.0.0.0";
      port = 9000;
      resources = [
        "webhooks"
      ];
    }
    {
      bindAddress = "localhost";
      port = 9001;
      resources = [
        "metrics"
        "provisioning"
      ];
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/matrix/hookshot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/hookshot.nix)

## `services.matrix-hookshot.settings.passFile` {#opt-services.matrix-hookshot.settings.passFile}

A passkey used to encrypt tokens stored inside the bridge.
File will be generated if not found.

*Type:* absolute path

*Default:* `"/var/lib/matrix-hookshot/passkey.pem"`

*Declared by:* [`nixos/modules/services/matrix/hookshot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/hookshot.nix)

## `services.matrix-synapse.configFile` {#opt-services.matrix-synapse.configFile}

Path to the configuration file on the target system. Useful to configure e.g. workers
that also need this.

*Type:* absolute path

*Read only*

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.configureRedisLocally` {#opt-services.matrix-synapse.configureRedisLocally}

Whether to automatically configure a local redis server for matrix-synapse.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.dataDir` {#opt-services.matrix-synapse.dataDir}

The directory where matrix-synapse stores its stateful data such as
certificates, media and uploads.

*Type:* string

*Default:* `"/var/lib/matrix-synapse"`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.enable` {#opt-services.matrix-synapse.enable}

Whether to enable matrix.org synapse, the reference homeserver.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.enableRegistrationScript` {#opt-services.matrix-synapse.enableRegistrationScript}

Whether to install the `register_new_matrix_user` script, that
allows account creation on the terminal.

::: note
This script does not work when the client listener uses UNIX domain sockets
:::

*Type:* boolean

*Default:*

``` nix
''
  Enabled if the client listener uses TCP sockets
''
```

*Example:* `false`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.extraArgs` {#opt-services.matrix-synapse.extraArgs}

Extra command lines argument that are passed to synapse and workers.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--no-secrets-in-config"
]
```

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.extraConfigFiles` {#opt-services.matrix-synapse.extraConfigFiles}

Extra config files to include.

The configuration files will be included based on the command line
argument --config-path. This allows to configure secrets without
having to go through the Nix store, e.g. based on deployment keys if
NixOps is in use.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.extras` {#opt-services.matrix-synapse.extras}

Explicitly install extras provided by matrix-synapse. Most
will require some additional configuration.

Extras will automatically be enabled, when the relevant
configuration sections are present.

Please note that this option is additive: i.e. when adding a new item
to this list, the defaults are still kept. To override the defaults as well,
use `lib.mkForce`.

*Type:* list of (one of "cache-memory", "jwt", "oidc", "postgres", "redis", "saml2", "sentry", "systemd", "url-preview")

*Default:*

``` nix
[
  "systemd"
  "postgres"
  "url-preview"
]
```

*Example:*

``` nix
[
  "cache-memory" # Provide statistics about caching memory consumption
  "jwt"          # JSON Web Token authentication
  "oidc"         # OpenID Connect authentication
  "postgres"     # PostgreSQL database backend
  "redis"        # Redis support for the replication stream between worker processes
  "saml2"        # SAML2 authentication
  "sentry"       # Error tracking and performance metrics
  "systemd"      # Provide the JournalHandler used in the default log_config
  "url-preview"  # Support for oEmbed URL previews
]
```

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.log` {#opt-services.matrix-synapse.log}

Default configuration for the loggers used by `matrix-synapse` and its workers.
The defaults are added with the default priority which means that
these will be merged with additional declarations. These additional
declarations also take precedence over the defaults when declared
with at least normal priority. For instance
the log-level for synapse and its workers can be changed like this:

``` nix
{ lib, ... }: {
  services.matrix-synapse.log.root.level = "WARNING";
}
```

And another field can be added like this:

``` nix
{
  services.matrix-synapse.log = {
    loggers."synapse.http.matrixfederationclient".level = "DEBUG";
  };
}
```

Additionally, the field `handlers.journal.SYSLOG_IDENTIFIER` will be added to
each log config, i.e.

- `synapse` for `matrix-synapse.service`
- `synapse-<worker name>` for `matrix-synapse-worker-<worker name>.service`

This is only done if this option has a `handlers.journal` field declared.

To discard all settings declared by this option for each worker and synapse,
`lib.mkForce` can be used.

To discard all settings declared by this option for a single worker or synapse only,
[services (M)](#opt-services.matrix-synapse.workers._name_.worker_log_config) or
[services (M)](#opt-services.matrix-synapse.settings.log_config) can be used.

*Type:* attribute set of (YAML 1.1 value)

*Default:*

``` nix
{
  disable_existing_loggers = false;
  formatters = {
    journal_fmt = {
      format = "%(name)s: [%(request)s] %(message)s";
    };
  };
  handlers = {
    journal = {
      class = "systemd.journal.JournalHandler";
      formatter = "journal_fmt";
    };
  };
  root = {
    handlers = [
      "journal"
    ];
    level = "INFO";
  };
  version = 1;
}
```

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.package` {#opt-services.matrix-synapse.package}

Reference to the `matrix-synapse` wrapper with all extras
(e.g. for `oidc` or `saml2`) added to the `PYTHONPATH` of all executables.

This option is useful to reference the "final" `matrix-synapse` package that's
actually used by `matrix-synapse.service`. For instance, when using
workers, it's possible to run
`${config.services.matrix-synapse.package}/bin/synapse_worker` and
no additional PYTHONPATH needs to be specified for extras or plugins configured
via `services.matrix-synapse`.

However, this means that this option is supposed to be only declared
by the `services.matrix-synapse` module itself and is thus read-only.
In order to modify `matrix-synapse` itself, use an overlay to override
`pkgs.matrix-synapse-unwrapped`.

*Type:* package

*Read only*

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.plugins` {#opt-services.matrix-synapse.plugins}

List of additional Matrix plugins to make available.

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
with config.services.matrix-synapse.package.plugins; [
  matrix-synapse-ldap3
  matrix-synapse-pam
];
```

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.serviceUnit` {#opt-services.matrix-synapse.serviceUnit}

The systemd unit (a service or a target) for other services to depend on if they
need to be started after matrix-synapse.

This option is useful as the actual parent unit for all matrix-synapse processes
changes when configuring workers.

*Type:* string

*Read only*

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings` {#opt-services.matrix-synapse.settings}

The primary synapse configuration. See the
[sample configuration](https://github.com/element-hq/synapse/blob/v1.165.0/docs/sample_config.yaml)
for possible values.

Secrets should be passed in by using the `extraConfigFiles` option.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.app_service_config_files` {#opt-services.matrix-synapse.settings.app_service_config_files}

A list of application service config file to use

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.database.args.database` {#opt-services.matrix-synapse.settings.database.args.database}

Name of the database when using the psycopg2 backend,
path to the database location when using sqlite3.

*Type:* string

*Default:*

``` nix
{
  sqlite3 = "${services.matrix-synapse.dataDir}/homeserver.db";
  psycopg2 = "matrix-synapse";
}.${services.matrix-synapse.settings.database.name};
```

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.database.args.user` {#opt-services.matrix-synapse.settings.database.args.user}

Username to connect with psycopg2, set to null
when using sqlite3.

*Type:* null or string

*Default:*

``` nix
{
  sqlite3 = null;
  psycopg2 = "matrix-synapse";
}.${cfg.settings.database.name};
```

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.database.name` {#opt-services.matrix-synapse.settings.database.name}

The database engine name. Can be sqlite3 or psycopg2.

*Type:* one of "sqlite3", "psycopg2"

*Default:*

``` nix
if versionAtLeast config.system.stateVersion "18.03"
then "psycopg2"
else "sqlite3"
```

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.dynamic_thumbnails` {#opt-services.matrix-synapse.settings.dynamic_thumbnails}

Whether to generate new thumbnails on the fly to precisely match
the resolution requested by the client. If true then whenever
a new resolution is requested by the client the server will
generate a new thumbnail. If false the server will pick a thumbnail
from a precalculated list.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.enable_metrics` {#opt-services.matrix-synapse.settings.enable_metrics}

Enable collection and rendering of performance metrics

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.enable_registration` {#opt-services.matrix-synapse.settings.enable_registration}

Enable registration for new users.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.listeners` {#opt-services.matrix-synapse.settings.listeners}

List of ports that Synapse should listen on, their purpose and their configuration.

By default, synapse will be configured for client and federation traffic on port 8008, and
use a UNIX domain socket for worker replication. See [`services.matrix-synapse.workers`](#opt-services.matrix-synapse.workers)
for more details.

*Type:* list of (submodule)

*Default:*

``` nix
[
  {
    bind_addresses = [
      "127.0.0.1"
    ];
    port = 8008;
    resources = [
      {
        compress = true;
        names = [
          "client"
        ];
      }
      {
        compress = false;
        names = [
          "federation"
        ];
      }
    ];
    tls = false;
    type = "http";
    x_forwarded = true;
  }
]
```

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.listeners.*.bind_addresses` {#opt-services.matrix-synapse.settings.listeners._.bind_addresses}

IP addresses to bind the listener to.

*Type:* null or (list of string)

*Default:*

``` nix
if path != null then
  null
else
  [
    "::1"
    "127.0.0.1"
  ]
```

*Example:*

``` nix
[
  "::"
  "0.0.0.0"
]
```

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.listeners.*.mode` {#opt-services.matrix-synapse.settings.listeners._.mode}

File permissions on the UNIX domain socket.

*Type:* null or string matching the pattern ^\[0,2-7\]{3,4}$

*Default:*

``` nix
if path != null then
  "660"
else
  null
```

*Example:* `"660"`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.listeners.*.path` {#opt-services.matrix-synapse.settings.listeners._.path}

Unix domain socket path to bind this listener to.

::: note
This option is incompatible with `bind_addresses`, `port`, `tls`
and also does not support the `metrics` and `manhole` listener `type`.
:::

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.listeners.*.port` {#opt-services.matrix-synapse.settings.listeners._.port}

The port to listen for HTTP(S) requests on.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Example:* `8448`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.listeners.*.resources` {#opt-services.matrix-synapse.settings.listeners._.resources}

List of HTTP resources to serve on this listener.

*Type:* list of (submodule)

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.listeners.*.resources.*.compress` {#opt-services.matrix-synapse.settings.listeners._.resources._.compress}

Whether synapse should compress HTTP responses to clients that support it.
This should be disabled if running synapse behind a load balancer
that can do automatic compression.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.listeners.*.resources.*.names` {#opt-services.matrix-synapse.settings.listeners._.resources._.names}

List of resources to host on this listener.

*Type:* list of (one of "client", "consent", "federation", "health", "keys", "media", "metrics", "openid", "replication", "static")

*Default:* `[ ]`

*Example:*

``` nix
[
  "client"
]
```

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.listeners.*.tls` {#opt-services.matrix-synapse.settings.listeners._.tls}

Whether to enable TLS on the listener socket.

::: note
This option will be ignored for UNIX domain sockets.
:::

*Type:* null or boolean

*Default:*

``` nix
''
  Enabled for the main instance listener, unless it is configured with a UNIX domain socket path.
''
```

*Example:* `false`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.listeners.*.type` {#opt-services.matrix-synapse.settings.listeners._.type}

The type of the listener, usually http.

*Type:* one of "http", "manhole", "metrics", "replication"

*Default:* `"http"`

*Example:* `"metrics"`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.listeners.*.x_forwarded` {#opt-services.matrix-synapse.settings.listeners._.x_forwarded}

Use the X-Forwarded-For (XFF) header as the client IP and not the
actual client IP.

*Type:* boolean

*Default:*

``` nix
''
  Enabled if the listener is configured with a UNIX domain socket path
''
```

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.log_config` {#opt-services.matrix-synapse.settings.log_config}

The file that holds the logging configuration.

*Type:* absolute path

*Default:* Path to a yaml file generated from this Nix expression:

```
{
  disable_existing_loggers = false;
  formatters = {
    journal_fmt = {
      format = "%(name)s: [%(request)s] %(message)s";
    };
  };
  handlers = {
    journal = {
      SYSLOG_IDENTIFIER = "synapse";
      class = "systemd.journal.JournalHandler";
      formatter = "journal_fmt";
    };
  };
  root = {
    handlers = [
      "journal"
    ];
    level = "INFO";
  };
  version = 1;
}
```

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.macaroon_secret_key` {#opt-services.matrix-synapse.settings.macaroon_secret_key}

Secret key for authentication tokens. If none is specified,
the registration\_shared\_secret is used, if one is given; otherwise,
a secret key is derived from the signing key.

Secrets should be passed in via `extraConfigFiles`!

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.max_image_pixels` {#opt-services.matrix-synapse.settings.max_image_pixels}

Maximum number of pixels that will be thumbnailed

*Type:* string

*Default:* `"32M"`

*Example:* `"64M"`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.max_upload_size` {#opt-services.matrix-synapse.settings.max_upload_size}

The largest allowed upload size in bytes

*Type:* string

*Default:* `"50M"`

*Example:* `"100M"`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.media_store_path` {#opt-services.matrix-synapse.settings.media_store_path}

Directory where uploaded images and attachments are stored.

*Type:* absolute path

*Default:* `"/var/lib/matrix-synapse/media_store for when system.stateVersion is at least 22.05, /var/lib/matrix-synapse/media when lower than 22.05"`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.pid_file` {#opt-services.matrix-synapse.settings.pid_file}

The file to store the PID in.

*Type:* absolute path

*Default:* `"/run/matrix-synapse.pid"`

*Read only*

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.presence.enabled` {#opt-services.matrix-synapse.settings.presence.enabled}

Whether to enable presence tracking.

Presence tracking allows users to see the state (e.g online/offline)
of other local and remote users.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.public_baseurl` {#opt-services.matrix-synapse.settings.public_baseurl}

The public-facing base URL for the client API (not including \_matrix/...)

*Type:* null or string

*Default:* `null`

*Example:* `"https://example.com:8448/"`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.redis` {#opt-services.matrix-synapse.settings.redis}

Redis configuration for synapse.

See the
[upstream documentation](https://github.com/element-hq/synapse/blob/v1.165.0/docs/usage/configuration/config_documentation.md#redis)
for available options.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.redis.enabled` {#opt-services.matrix-synapse.settings.redis.enabled}

Whether to use redis support

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.registration_shared_secret` {#opt-services.matrix-synapse.settings.registration_shared_secret}

If set, allows registration by anyone who also has the shared
secret, even if registration is otherwise disabled.

Secrets should be passed in via `extraConfigFiles`!

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.report_stats` {#opt-services.matrix-synapse.settings.report_stats}

Whether or not to report anonymized homeserver usage statistics.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.server_name` {#opt-services.matrix-synapse.settings.server_name}

The domain name of the server, with optional explicit port.
This is used by remote servers to look up the server address.
This is also the last part of your UserID.

The server\_name cannot be changed later so it is important to configure this correctly before you start Synapse.

*Type:* string

*Default:* `config.networking.hostName`

*Example:* `"example.com"`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.signing_key_path` {#opt-services.matrix-synapse.settings.signing_key_path}

Path to the signing key to sign messages with.

*Type:* absolute path

*Default:* `"/var/lib/matrix-synapse/homeserver.signing.key"`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.tls_certificate_path` {#opt-services.matrix-synapse.settings.tls_certificate_path}

PEM encoded X509 certificate for TLS.
You can replace the self-signed certificate that synapse
autogenerates on launch with your own SSL certificate + key pair
if you like.  Any required intermediary certificates can be
appended after the primary certificate in hierarchical order.

*Type:* null or string

*Default:* `null`

*Example:* `"/var/lib/acme/example.com/fullchain.pem"`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.tls_private_key_path` {#opt-services.matrix-synapse.settings.tls_private_key_path}

PEM encoded private key for TLS. Specify null if synapse is not
speaking TLS directly.

*Type:* null or string

*Default:* `null`

*Example:* `"/var/lib/acme/example.com/key.pem"`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.trusted_key_servers` {#opt-services.matrix-synapse.settings.trusted_key_servers}

The trusted servers to download signing keys from.

*Type:* list of (open submodule of (YAML 1.1 value))

*Default:*

``` nix
[
  {
    server_name = "matrix.org";
  }
  {
    server_name = "nixos.org";
  }
]
```

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.trusted_key_servers.*.server_name` {#opt-services.matrix-synapse.settings.trusted_key_servers._.server_name}

Hostname of the trusted server.

*Type:* string

*Example:* `"matrix.org"`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.turn_shared_secret` {#opt-services.matrix-synapse.settings.turn_shared_secret}

The shared secret used to compute passwords for the TURN server.

Secrets should be passed in via `extraConfigFiles`!

*Type:* string

*Default:* `""`

*Example:*

``` nix
config.services.coturn.static-auth-secret
```

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.turn_uris` {#opt-services.matrix-synapse.settings.turn_uris}

The public URIs of the TURN server to give to clients

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "turn:turn.example.com:3487?transport=udp"
  "turn:turn.example.com:3487?transport=tcp"
  "turns:turn.example.com:5349?transport=udp"
  "turns:turn.example.com:5349?transport=tcp"
]
```

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.url_preview_enabled` {#opt-services.matrix-synapse.settings.url_preview_enabled}

Is the preview URL API enabled?  If enabled, you *must* specify an
explicit url\_preview\_ip\_range\_blacklist of IPs that the spider is
denied from accessing.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.url_preview_ip_range_blacklist` {#opt-services.matrix-synapse.settings.url_preview_ip_range_blacklist}

List of IP address CIDR ranges that the URL preview spider is denied
from accessing.

*Type:* list of string

*Default:*

``` nix
[
  "10.0.0.0/8"
  "100.64.0.0/10"
  "127.0.0.0/8"
  "169.254.0.0/16"
  "172.16.0.0/12"
  "192.0.0.0/24"
  "192.0.2.0/24"
  "192.168.0.0/16"
  "192.88.99.0/24"
  "198.18.0.0/15"
  "198.51.100.0/24"
  "2001:db8::/32"
  "203.0.113.0/24"
  "224.0.0.0/4"
  "::1/128"
  "fc00::/7"
  "fe80::/10"
  "fec0::/10"
  "ff00::/8"
]
```

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.url_preview_ip_range_whitelist` {#opt-services.matrix-synapse.settings.url_preview_ip_range_whitelist}

List of IP address CIDR ranges that the URL preview spider is allowed
to access even if they are specified in url\_preview\_ip\_range\_blacklist.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.settings.url_preview_url_blacklist` {#opt-services.matrix-synapse.settings.url_preview_url_blacklist}

Optional list of URL matches that the URL preview spider is
denied from accessing.

*Type:* list of ((attribute set of string) or string convertible to it)

*Default:* `[ ]`

*Example:*

``` nix
[
  { scheme = "http"; } # no http previews
  { netloc = "www.acme.com"; path = "/foo"; } # block http(s)://www.acme.com/foo
]
```

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.withJemalloc` {#opt-services.matrix-synapse.withJemalloc}

Whether to preload jemalloc to reduce memory fragmentation and overall usage.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.workers` {#opt-services.matrix-synapse.workers}

Options for configuring workers. Worker support will be enabled if at least one worker is configured here.

See the [worker documention](https://element-hq.github.io/synapse/latest/workers.html#worker-configuration)
for possible options for each worker. Worker-specific options overriding the shared homeserver configuration can be
specified here for each worker.

::: note
Worker support will add a replication listener on port 9093 to the main synapse process using the default
value of [`services.matrix-synapse.settings.listeners`](#opt-services.matrix-synapse.settings.listeners) and configure that
listener as `services.matrix-synapse.settings.instance_map.main`.
If you set either of those options, make sure to configure a replication listener yourself.

A redis server is required for running workers. A local one can be enabled
using [`services.matrix-synapse.configureRedisLocally`](#opt-services.matrix-synapse.configureRedisLocally).

Workers also require a proper reverse proxy setup to direct incoming requests to the appropriate process. See
the [reverse proxy documentation](https://element-hq.github.io/synapse/latest/reverse_proxy.html) for a
general reverse proxying setup and
the [worker documentation](https://element-hq.github.io/synapse/latest/workers.html#available-worker-applications)
for the available endpoints per worker application.
:::

*Type:* attribute set of (open submodule of (YAML 1.1 value))

*Default:* `{ }`

*Example:*

``` nix
{
  "federation_sender" = { };
  "federation_receiver" = {
    worker_listeners = [
      {
        type = "http";
        port = 8009;
        bind_addresses = [ "127.0.0.1" ];
        tls = false;
        x_forwarded = true;
        resources = [{
          names = [ "federation" ];
        }];
      }
    ];
  };
}
```

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.workers.<name>.worker_app` {#opt-services.matrix-synapse.workers._name_.worker_app}

Type of this worker

*Type:* one of "synapse.app.generic\_worker", "synapse.app.media\_repository"

*Default:* `"synapse.app.generic_worker"`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.workers.<name>.worker_listeners` {#opt-services.matrix-synapse.workers._name_.worker_listeners}

List of ports that this worker should listen on, their purpose and their configuration.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.workers.<name>.worker_listeners.*.bind_addresses` {#opt-services.matrix-synapse.workers._name_.worker_listeners._.bind_addresses}

IP addresses to bind the listener to.

*Type:* null or (list of string)

*Default:*

``` nix
if path != null then
  null
else
  [
    "::1"
    "127.0.0.1"
  ]
```

*Example:*

``` nix
[
  "::"
  "0.0.0.0"
]
```

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.workers.<name>.worker_listeners.*.mode` {#opt-services.matrix-synapse.workers._name_.worker_listeners._.mode}

File permissions on the UNIX domain socket.

*Type:* null or string matching the pattern ^\[0,2-7\]{3,4}$

*Default:*

``` nix
if path != null then
  "660"
else
  null
```

*Example:* `"660"`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.workers.<name>.worker_listeners.*.path` {#opt-services.matrix-synapse.workers._name_.worker_listeners._.path}

Unix domain socket path to bind this listener to.

::: note
This option is incompatible with `bind_addresses`, `port`, `tls`
and also does not support the `metrics` and `manhole` listener `type`.
:::

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.workers.<name>.worker_listeners.*.port` {#opt-services.matrix-synapse.workers._name_.worker_listeners._.port}

The port to listen for HTTP(S) requests on.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Example:* `8448`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.workers.<name>.worker_listeners.*.resources` {#opt-services.matrix-synapse.workers._name_.worker_listeners._.resources}

List of HTTP resources to serve on this listener.

*Type:* list of (submodule)

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.workers.<name>.worker_listeners.*.resources.*.compress` {#opt-services.matrix-synapse.workers._name_.worker_listeners._.resources._.compress}

Whether synapse should compress HTTP responses to clients that support it.
This should be disabled if running synapse behind a load balancer
that can do automatic compression.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.workers.<name>.worker_listeners.*.resources.*.names` {#opt-services.matrix-synapse.workers._name_.worker_listeners._.resources._.names}

List of resources to host on this listener.

*Type:* list of (one of "client", "consent", "federation", "health", "keys", "media", "metrics", "openid", "replication", "static")

*Default:* `[ ]`

*Example:*

``` nix
[
  "client"
]
```

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.workers.<name>.worker_listeners.*.tls` {#opt-services.matrix-synapse.workers._name_.worker_listeners._.tls}

Whether to enable TLS on the listener socket.

::: note
This option will be ignored for UNIX domain sockets.
:::

*Type:* null or boolean

*Default:*

``` nix
''
  Enabled for the main instance listener, unless it is configured with a UNIX domain socket path.
''
```

*Example:* `false`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.workers.<name>.worker_listeners.*.type` {#opt-services.matrix-synapse.workers._name_.worker_listeners._.type}

The type of the listener, usually http.

*Type:* one of "http", "manhole", "metrics", "replication"

*Default:* `"http"`

*Example:* `"metrics"`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.workers.<name>.worker_listeners.*.x_forwarded` {#opt-services.matrix-synapse.workers._name_.worker_listeners._.x_forwarded}

Use the X-Forwarded-For (XFF) header as the client IP and not the
actual client IP.

*Type:* boolean

*Default:*

``` nix
''
  Enabled if the listener is configured with a UNIX domain socket path
''
```

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-synapse.workers.<name>.worker_log_config` {#opt-services.matrix-synapse.workers._name_.worker_log_config}

The file for log configuration.

See the [python documentation](https://docs.python.org/3/library/logging.config.html#configuration-dictionary-schema)
for the schema and the [upstream repository](https://github.com/element-hq/synapse/blob/v1.165.0/docs/sample_log_config.yaml)
for an example.

*Type:* absolute path

*Default:* Path to a yaml file generated from this Nix expression:

```
{
  disable_existing_loggers = false;
  formatters = {
    journal_fmt = {
      format = "%(name)s: [%(request)s] %(message)s";
    };
  };
  handlers = {
    journal = {
      SYSLOG_IDENTIFIER = "synapse-‹name›";
      class = "systemd.journal.JournalHandler";
      formatter = "journal_fmt";
    };
  };
  root = {
    handlers = [
      "journal"
    ];
    level = "INFO";
  };
  version = 1;
}
```

*Declared by:* [`nixos/modules/services/matrix/synapse.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/synapse.nix)

## `services.matrix-tuwunel.enable` {#opt-services.matrix-tuwunel.enable}

Whether to enable tuwunel.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/tuwunel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/tuwunel.nix)

## `services.matrix-tuwunel.environmentFile` {#opt-services.matrix-tuwunel.environmentFile}

Path to a file containing sensitive environment variables as described in {manpage}\`systemd.exec(5).

Refer to
[https://matrix-construct.github.io/tuwunel/configuration.html#environment-variables](https://matrix-construct.github.io/tuwunel/configuration.html#environment-variables)
for specifying options as environment variables.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/matrix-tuwunel.env"`

*Declared by:* [`nixos/modules/services/matrix/tuwunel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/tuwunel.nix)

## `services.matrix-tuwunel.extraEnvironment` {#opt-services.matrix-tuwunel.extraEnvironment}

Extra Environment variables to pass to the tuwunel server.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  RUST_BACKTRACE = "yes";
}
```

*Declared by:* [`nixos/modules/services/matrix/tuwunel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/tuwunel.nix)

## `services.matrix-tuwunel.group` {#opt-services.matrix-tuwunel.group}

The group `tuwunel` is run as.  If left as the default, the group will
automatically be created by the service.

*Type:* non-empty string

*Default:* `"tuwunel"`

*Example:* `"conduit"`

*Declared by:* [`nixos/modules/services/matrix/tuwunel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/tuwunel.nix)

## `services.matrix-tuwunel.package` {#opt-services.matrix-tuwunel.package}

The matrix-tuwunel package to use.

*Type:* package

*Default:* `pkgs.matrix-tuwunel`

*Declared by:* [`nixos/modules/services/matrix/tuwunel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/tuwunel.nix)

## `services.matrix-tuwunel.settings` {#opt-services.matrix-tuwunel.settings}

Generates the tuwunel.toml configuration file. Refer to
[https://matrix-construct.github.io/tuwunel/configuration.html](https://matrix-construct.github.io/tuwunel/configuration.html)
for details on supported values.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/matrix/tuwunel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/tuwunel.nix)

## `services.matrix-tuwunel.settings.global.address` {#opt-services.matrix-tuwunel.settings.global.address}

Addresses (IPv4 or IPv6) to listen on for connections by the reverse proxy/tls terminator.
If set to `null`, tuwunel will listen on IPv4 and IPv6 localhost.

*Type:* null or (list of non-empty string)

*Default:* `null`

*Example:*

``` nix
[
  "127.0.0.1"
  "::1"
]
```

*Declared by:* [`nixos/modules/services/matrix/tuwunel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/tuwunel.nix)

## `services.matrix-tuwunel.settings.global.allow_encryption` {#opt-services.matrix-tuwunel.settings.global.allow_encryption}

Whether new encrypted rooms can be created. Note: existing rooms will continue to work.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/matrix/tuwunel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/tuwunel.nix)

## `services.matrix-tuwunel.settings.global.allow_federation` {#opt-services.matrix-tuwunel.settings.global.allow_federation}

Whether this server federates with other servers.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/matrix/tuwunel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/tuwunel.nix)

## `services.matrix-tuwunel.settings.global.allow_registration` {#opt-services.matrix-tuwunel.settings.global.allow_registration}

Whether new users can register on this server.

Registration with token requires `registration_token` or `registration_token_file` to be set.

If set to true without a token configured, and
`yes_i_am_very_very_sure_i_want_an_open_registration_server_prone_to_abuse`
is set to true, users can freely register.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/matrix/tuwunel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/tuwunel.nix)

## `services.matrix-tuwunel.settings.global.max_request_size` {#opt-services.matrix-tuwunel.settings.global.max_request_size}

Max request size in bytes. Don't forget to also change it in the proxy.

*Type:* positive integer, meaning \>0

*Default:* `20000000`

*Declared by:* [`nixos/modules/services/matrix/tuwunel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/tuwunel.nix)

## `services.matrix-tuwunel.settings.global.port` {#opt-services.matrix-tuwunel.settings.global.port}

The port(s) tuwunel will be running on.
You need to set up a reverse proxy in your web server (e.g. apache or nginx),
so all requests to /\_matrix on port 443 and 8448 will be forwarded to the tuwunel
instance running on this port.

*Type:* list of 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
[
  6167
]
```

*Declared by:* [`nixos/modules/services/matrix/tuwunel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/tuwunel.nix)

## `services.matrix-tuwunel.settings.global.server_name` {#opt-services.matrix-tuwunel.settings.global.server_name}

The server\_name is the name of this server. It is used as a suffix for user and room ids.

*Type:* non-empty string

*Example:* `"example.com"`

*Declared by:* [`nixos/modules/services/matrix/tuwunel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/tuwunel.nix)

## `services.matrix-tuwunel.settings.global.trusted_servers` {#opt-services.matrix-tuwunel.settings.global.trusted_servers}

Servers listed here will be used to gather public keys of other servers
(notary trusted key servers).

Currently, tuwunel doesn't support inbound batched key requests, so
this list should only contain other Synapse servers.

Example: `[ "matrix.org" "constellatory.net" "tchncs.de" ]`

*Type:* list of non-empty string

*Default:*

``` nix
[
  "matrix.org"
]
```

*Declared by:* [`nixos/modules/services/matrix/tuwunel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/tuwunel.nix)

## `services.matrix-tuwunel.settings.global.unix_socket_path` {#opt-services.matrix-tuwunel.settings.global.unix_socket_path}

Listen on a UNIX socket at the specified path. If listening on a UNIX socket,
listening on an address will be disabled. The `address` option must be set to
`null` (the default value). The option `services.tuwunel.group` must
be set to a group your reverse proxy is part of.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/matrix/tuwunel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/tuwunel.nix)

## `services.matrix-tuwunel.settings.global.unix_socket_perms` {#opt-services.matrix-tuwunel.settings.global.unix_socket_perms}

The default permissions (in octal) to create the UNIX socket with.

*Type:* positive integer, meaning \>0

*Default:* `660`

*Declared by:* [`nixos/modules/services/matrix/tuwunel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/tuwunel.nix)

## `services.matrix-tuwunel.stateDirectory` {#opt-services.matrix-tuwunel.stateDirectory}

The name of the directory under /var/lib/ where the database will be stored.

Note that `stateDirectory` cannot be changed once created because of the service's reliance on
systemd `StateDirectory`.

*Type:* non-empty string

*Default:* `"tuwunel"`

*Example:* `"matrix-conduit"`

*Declared by:* [`nixos/modules/services/matrix/tuwunel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/tuwunel.nix)

## `services.matrix-tuwunel.user` {#opt-services.matrix-tuwunel.user}

The user `tuwunel` is run as.  If left as the default, the user will
automatically be created by the service.

*Type:* non-empty string

*Default:* `"tuwunel"`

*Example:* `"conduit"`

*Declared by:* [`nixos/modules/services/matrix/tuwunel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/tuwunel.nix)

## `services.matter-server.enable` {#opt-services.matter-server.enable}

Whether to enable Matter-server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/matter-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/matter-server.nix)

## `services.matter-server.extraArgs` {#opt-services.matter-server.extraArgs}

Attribute set of extra arguments to pass to the matter-server executable.
See [https://github.com/home-assistant-libs/python-matter-server?tab=readme-ov-file#running-the-development-server](https://github.com/home-assistant-libs/python-matter-server?tab=readme-ov-file#running-the-development-server) for options.

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/home-automation/matter-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/matter-server.nix)

## `services.matter-server.logLevel` {#opt-services.matter-server.logLevel}

Verbosity of logs from the matter-server

*Type:* one of "critical", "error", "warning", "info", "debug"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/home-automation/matter-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/matter-server.nix)

## `services.matter-server.openFirewall` {#opt-services.matter-server.openFirewall}

Whether to open the port in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/home-automation/matter-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/matter-server.nix)

## `services.matter-server.package` {#opt-services.matter-server.package}

The python-matter-server package to use.

*Type:* package

*Default:* `pkgs.python-matter-server`

*Declared by:* [`nixos/modules/services/home-automation/matter-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/matter-server.nix)

## `services.matter-server.port` {#opt-services.matter-server.port}

Port to expose the matter-server service on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5580`

*Declared by:* [`nixos/modules/services/home-automation/matter-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/matter-server.nix)

## `services.matterbridge.configFile` {#opt-services.matterbridge.configFile}

WARNING: THIS IS INSECURE, as your password will end up in
`/nix/store`, thus publicly readable. Use
`services.matterbridge.configPath` instead.

The matterbridge configuration file in the TOML file format.

*Type:* string

*Example:*

``` nix
''
  # WARNING: as this file contains credentials, do not use this option!
  # It is kept only for backwards compatibility, and would cause your
  # credentials to be in the nix-store, thus with the world-readable
  # permission bits.
  # Use services.matterbridge.configPath instead.
  
  [irc]
      [irc.libera]
      Server="irc.libera.chat:6667"
      Nick="matterbot"
  
  [mattermost]
      [mattermost.work]
       # Do not prefix it with http:// or https://
       Server="yourmattermostserver.domain"
       Team="yourteam"
       Login="yourlogin"
       Password="yourpass"
       PrefixMessagesWithNick=true
  
  [[gateway]]
  name="gateway1"
  enable=true
      [[gateway.inout]]
      account="irc.libera"
      channel="#testing"
  
      [[gateway.inout]]
      account="mattermost.work"
      channel="off-topic"
''
```

*Declared by:* [`nixos/modules/services/networking/matterbridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/matterbridge.nix)

## `services.matterbridge.configPath` {#opt-services.matterbridge.configPath}

The path to the matterbridge configuration file.

*Type:* null or string

*Default:* `null`

*Example:* `"/etc/nixos/matterbridge.toml"`

*Declared by:* [`nixos/modules/services/networking/matterbridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/matterbridge.nix)

## `services.matterbridge.enable` {#opt-services.matterbridge.enable}

Whether to enable Matterbridge chat platform bridge.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/matterbridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/matterbridge.nix)

## `services.matterbridge.group` {#opt-services.matterbridge.group}

Group which runs the matterbridge service.

*Type:* string

*Default:* `"matterbridge"`

*Declared by:* [`nixos/modules/services/networking/matterbridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/matterbridge.nix)

## `services.matterbridge.package` {#opt-services.matterbridge.package}

The matterbridge package to use.

*Type:* package

*Default:* `pkgs.matterbridge`

*Declared by:* [`nixos/modules/services/networking/matterbridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/matterbridge.nix)

## `services.matterbridge.user` {#opt-services.matterbridge.user}

User which runs the matterbridge service.

*Type:* string

*Default:* `"matterbridge"`

*Declared by:* [`nixos/modules/services/networking/matterbridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/matterbridge.nix)

## `services.matterjs-server.bluetoothSupport` {#opt-services.matterjs-server.bluetoothSupport}

Whether to enable BLE (Bluetooth Low Energy) commissioning support. Select an adapter with
`--bluetooth-adapter=<id>` in
[`services.matterjs-server.extraArgs`](#opt-services.matterjs-server.extraArgs)
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/matterjs-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/matterjs-server.nix)

## `services.matterjs-server.enable` {#opt-services.matterjs-server.enable}

Whether to enable matterjs-server, a Matter Controller WebSocket server based on Matter.js.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/matterjs-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/matterjs-server.nix)

## `services.matterjs-server.extraArgs` {#opt-services.matterjs-server.extraArgs}

Additional command-line arguments passed to `matterjs-server`. See
`matterjs-server --help` for the full list of options.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--primary-interface=enp11s0"
  "--log-level=debug"
]
```

*Declared by:* [`nixos/modules/services/home-automation/matterjs-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/matterjs-server.nix)

## `services.matterjs-server.listenAddress` {#opt-services.matterjs-server.listenAddress}

IP address the WebSocket API binds to.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/home-automation/matterjs-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/matterjs-server.nix)

## `services.matterjs-server.openFirewall` {#opt-services.matterjs-server.openFirewall}

Whether to open the WebSocket API port in the firewall.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/matterjs-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/matterjs-server.nix)

## `services.matterjs-server.package` {#opt-services.matterjs-server.package}

The matterjs-server package to use.

*Type:* package

*Default:* `pkgs.matterjs-server`

*Declared by:* [`nixos/modules/services/home-automation/matterjs-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/matterjs-server.nix)

## `services.matterjs-server.port` {#opt-services.matterjs-server.port}

TCP port the WebSocket API listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5580`

*Declared by:* [`nixos/modules/services/home-automation/matterjs-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/matterjs-server.nix)

## `services.mattermost.configDir` {#opt-services.mattermost.configDir}

Mattermost config directory.

*Type:* absolute path

*Default:*

``` nix
''
  if versionAtLeast config.system.stateVersion "25.05" then
    "/etc/mattermost"
  else
    "''${config.services.mattermost.dataDir}/config";
''
```

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.dataDir` {#opt-services.mattermost.dataDir}

Mattermost working directory.

*Type:* absolute path

*Default:* `"/var/lib/mattermost"`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.database.create` {#opt-services.mattermost.database.create}

Create a local PostgreSQL database for Mattermost automatically.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.database.extraConnectionOptions` {#opt-services.mattermost.database.extraConnectionOptions}

Extra options that are placed in the connection URI's query parameters.

*Type:* attribute set of (signed integer or string)

*Default:*

``` nix
''
  {
    sslmode = "disable";
    connect_timeout = 60;
  }
''
```

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.database.fromEnvironment` {#opt-services.mattermost.database.fromEnvironment}

Use services.mattermost.environmentFile to configure the database instead of writing the database URI
to the Nix store. Useful if you use password authentication with peerAuth set to false.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.database.host` {#opt-services.mattermost.database.host}

Host to use for the database. Can also be set to a path if you'd like to connect
to a socket using a username and password.

*Type:* string

*Default:* `"localhost"`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.database.name` {#opt-services.mattermost.database.name}

Local Mattermost database name.

*Type:* string

*Default:* `"mattermost"`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.database.password` {#opt-services.mattermost.database.password}

Password for local Mattermost database user. If set and peerAuth is not true,
will cause a warning nagging you to use environmentFile instead since it will
end up in the Nix store.

*Type:* string

*Default:* `"mmpgsecret"`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.database.peerAuth` {#opt-services.mattermost.database.peerAuth}

If set, will use peer auth instead of connecting to a Postgres server.
Use services.mattermost.database.socketPath to configure the socket path.

*Type:* boolean

*Default:*

``` nix
''
  versionAtLeast config.system.stateVersion "25.05" && config.services.mattermost.database.host == "localhost"
''
```

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.database.port` {#opt-services.mattermost.database.port}

Port to use for the database.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5432`

*Example:* `1234`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.database.socketPath` {#opt-services.mattermost.database.socketPath}

The database socket path.

*Type:* absolute path

*Default:* `"/run/postgresql"`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.database.user` {#opt-services.mattermost.database.user}

Local Mattermost database username.

*Type:* string

*Default:* `"mattermost"`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.enable` {#opt-services.mattermost.enable}

Whether to enable Mattermost chat server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.environment` {#opt-services.mattermost.environment}

Extra environment variables to export to the Mattermost process
from the systemd unit configuration.

*Type:* attribute set of (signed integer or string)

*Default:* `{ }`

*Example:*

``` nix
{
  MM_SERVICESETTINGS_SITEURL = "http://example.com";
}
```

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.environmentFile` {#opt-services.mattermost.environmentFile}

Environment file (see `systemd.exec(5)`
"EnvironmentFile=" section for the syntax) which sets config options
for mattermost (see [the Mattermost documentation](https://docs.mattermost.com/configure/configuration-settings.html#environment-variables)).

Settings defined in the environment file will overwrite settings
set via Nix or via the `services.mattermost.extraConfig`
option.

Useful for setting config options without their value ending up in the
(world-readable) Nix store, e.g. for a database password.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.group` {#opt-services.mattermost.group}

Group which runs the Mattermost service.

*Type:* string

*Default:* `"mattermost"`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.host` {#opt-services.mattermost.host}

Host or address that this Mattermost instance listens on.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.logDir` {#opt-services.mattermost.logDir}

Mattermost log directory.

*Type:* absolute path

*Default:*

``` nix
''
  if versionAtLeast config.system.stateVersion "25.05" then "/var/log/mattermost"
  else "''${config.services.mattermost.dataDir}/logs";
''
```

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.matterircd.enable` {#opt-services.mattermost.matterircd.enable}

Whether to enable Mattermost IRC bridge.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.matterircd.package` {#opt-services.mattermost.matterircd.package}

The matterircd package to use.

*Type:* package

*Default:* `pkgs.matterircd`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.matterircd.parameters` {#opt-services.mattermost.matterircd.parameters}

Set commandline parameters to pass to matterircd. See
[https://github.com/42wim/matterircd#usage](https://github.com/42wim/matterircd#usage) for more information.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-mmserver chat.example.com"
  "-bind [::]:6667"
]
```

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.mutableConfig` {#opt-services.mattermost.mutableConfig}

Whether the Mattermost config.json is writeable by Mattermost.

Most of the settings can be edited in the system console of
Mattermost if this option is enabled. A template config using
the options specified in services.mattermost will be generated
but won't be overwritten on changes or rebuilds.

If this option is disabled, persistent changes in the system
console won't be possible (the default). If a config.json is
present, it will be overwritten at service start!

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.package` {#opt-services.mattermost.package}

The mattermost package to use.

*Type:* package

*Default:* `pkgs.mattermost`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.plugins` {#opt-services.mattermost.plugins}

Plugins to add to the configuration. Overrides any installed if non-null.
This is a list of paths to .tar.gz files or derivations evaluating to
.tar.gz files. You can use `mattermost.buildPlugin` to build plugins;
see the NixOS documentation for more details.

*Type:* list of (absolute path or package)

*Default:* `[ ]`

*Example:* `"[ ./com.github.moussetc.mattermost.plugin.giphy-2.0.0.tar.gz ]"`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.pluginsBundle` {#opt-services.mattermost.pluginsBundle}

Derivation building to a directory of plugin tarballs.
This overrides [`services.mattermost.plugins`](#opt-services.mattermost.plugins) if provided.

*Type:* null or package

*Default:*

``` nix
''
  All entries in {config}`services.mattermost.plugins`, repacked
''
```

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.port` {#opt-services.mattermost.port}

Port for Mattermost server to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8065`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.preferNixConfig` {#opt-services.mattermost.preferNixConfig}

If both mutableConfig and this option are set, the Nix configuration
will take precedence over any settings configured in the server
console.

*Type:* boolean

*Default:*

``` nix
''
  versionAtLeast config.system.stateVersion "25.05";
''
```

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.settings` {#opt-services.mattermost.settings}

Additional configuration options as Nix attribute set in config.json schema.

*Type:* JSON value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.siteName` {#opt-services.mattermost.siteName}

Name of this Mattermost site.

*Type:* string

*Default:* `"Mattermost"`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.siteUrl` {#opt-services.mattermost.siteUrl}

URL this Mattermost instance is reachable under, without trailing slash.

*Type:* string

*Example:* `"https://chat.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.socket.enable` {#opt-services.mattermost.socket.enable}

Whether to enable Mattermost control socket.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.socket.export` {#opt-services.mattermost.socket.export}

Whether to enable Export socket control to system environment variables.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.socket.path` {#opt-services.mattermost.socket.path}

Default location for the Mattermost control socket used by `mmctl`.

*Type:* absolute path

*Default:* `"\${config.mattermost.dataDir}/mattermost.sock"`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.telemetry.enableDiagnostics` {#opt-services.mattermost.telemetry.enableDiagnostics}

True if we should enable sending diagnostic data. This reaches out to Mattermost's servers:
https://docs.mattermost.com/manage/telemetry.html#error-and-diagnostics-reporting-feature

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.telemetry.enableSecurityAlerts` {#opt-services.mattermost.telemetry.enableSecurityAlerts}

True if we should enable security update checking. This reaches out to Mattermost's servers:
https://docs.mattermost.com/manage/telemetry.html#security-update-check-feature

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.mattermost.user` {#opt-services.mattermost.user}

User which runs the Mattermost service.

*Type:* string

*Default:* `"mattermost"`

*Declared by:* [`nixos/modules/services/web-apps/mattermost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mattermost.nix)

## `services.maubot.configMutable` {#opt-services.maubot.configMutable}

Whether maubot should write updated config into `extraConfigFile`. **This will make your Nix module settings have no effect besides the initial config, as extraConfigFile takes precedence over NixOS settings!**

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.dataDir` {#opt-services.maubot.dataDir}

The directory where maubot stores its stateful data.

*Type:* string

*Default:* `"/var/lib/maubot"`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.enable` {#opt-services.maubot.enable}

Whether to enable maubot.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.extraConfigFile` {#opt-services.maubot.extraConfigFile}

A file for storing secrets. You can pass homeserver registration keys here.
If it already exists, **it must contain `server.unshared_secret`** which is used for signing API keys.
If `configMutable` is not set to true, **maubot user must have write access to this file**.

*Type:* string

*Default:* `"${config.services.maubot.dataDir}/config.yaml"`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.package` {#opt-services.maubot.package}

The maubot package to use.

*Type:* package

*Default:* `pkgs.maubot`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.plugins` {#opt-services.maubot.plugins}

List of additional maubot plugins to make available.

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
with config.services.maubot.package.plugins; [
  xyz.maubot.reactbot
  xyz.maubot.rss
];
```

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.pythonPackages` {#opt-services.maubot.pythonPackages}

List of additional Python packages to make available for maubot.

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
with pkgs.python3Packages; [
  aiohttp
];
```

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings` {#opt-services.maubot.settings}

YAML settings for maubot. See the
[example configuration](https://github.com/maubot/maubot/blob/master/maubot/example-config.yaml)
for more info.

Secrets should be passed in by using `extraConfigFile`.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.admins` {#opt-services.maubot.settings.admins}

List of administrator users. Plaintext passwords will be bcrypted on startup. Set empty password
to prevent normal login. Root is a special user that can't have a password and will always exist.

*Type:* attribute set of string

*Default:*

``` nix
{
  root = "";
}
```

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.api_features` {#opt-services.maubot.settings.api_features}

API feature switches.

*Type:* attribute set of boolean

*Default:*

``` nix
{
  client = true;
  client_auth = true;
  client_proxy = true;
  dev_open = true;
  instance = true;
  instance_database = true;
  log = true;
  login = true;
  plugin = true;
  plugin_upload = true;
}
```

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.crypto_database` {#opt-services.maubot.settings.crypto_database}

Separate database URL for the crypto database. By default, the regular database is also used for crypto.

*Type:* string

*Default:* `"default"`

*Example:* `"postgresql://username:password@hostname/dbname"`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.database` {#opt-services.maubot.settings.database}

The full URI to the database. SQLite and Postgres are fully supported.
Other DBMSes supported by SQLAlchemy may or may not work.

*Type:* string

*Default:* `"sqlite:maubot.db"`

*Example:* `"postgresql://username:password@hostname/dbname"`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.database_opts` {#opt-services.maubot.settings.database_opts}

Additional arguments for asyncpg.create\_pool() or sqlite3.connect()

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.homeservers` {#opt-services.maubot.settings.homeservers}

Known homeservers. This is required for the `mbc auth` command and also allows more convenient access from the management UI.
If you want to specify registration secrets, pass this via extraConfigFile instead.

*Type:* attribute set of (submodule)

*Default:*

``` nix
{
  "matrix.org" = {
    url = "https://matrix-client.matrix.org";
  };
}
```

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.homeservers.<name>.url` {#opt-services.maubot.settings.homeservers._name_.url}

Client-server API URL

*Type:* string

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.logging` {#opt-services.maubot.settings.logging}

Python logging configuration. See [section 16.7.2 of the Python
documentation](https://docs.python.org/3.6/library/logging.config.html#configuration-dictionary-schema)
for more info.

*Type:* attribute set

*Default:*

``` nix
{
  formatters = {
    colored = {
      "()" = "maubot.lib.color_log.ColorFormatter";
      format = "[%(asctime)s] [%(levelname)s@%(name)s] %(message)s";
    };
    normal = {
      format = "[%(asctime)s] [%(levelname)s@%(name)s] %(message)s";
    };
  };
  handlers = {
    console = {
      class = "logging.StreamHandler";
      formatter = "colored";
    };
    file = {
      backupCount = 10;
      class = "logging.handlers.RotatingFileHandler";
      filename = "./maubot.log";
      formatter = "normal";
      maxBytes = 10485760;
    };
  };
  loggers = {
    aiohttp = {
      level = "INFO";
    };
    mau = {
      level = "DEBUG";
    };
    maubot = {
      level = "DEBUG";
    };
  };
  root = {
    handlers = [
      "file"
      "console"
    ];
    level = "DEBUG";
  };
  version = 1;
}
```

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.plugin_databases` {#opt-services.maubot.settings.plugin_databases}

Plugin database settings

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.plugin_databases.postgres` {#opt-services.maubot.settings.plugin_databases.postgres}

The connection URL for plugin database. See [example config](https://github.com/maubot/maubot/blob/master/maubot/example-config.yaml) for exact format.

*Type:* null or string

*Default:* `if isPostgresql config.services.maubot.settings.database then "default" else null`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.plugin_databases.postgres_max_conns_per_plugin` {#opt-services.maubot.settings.plugin_databases.postgres_max_conns_per_plugin}

Maximum number of connections per plugin instance.

*Type:* null or signed integer

*Default:* `3`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.plugin_databases.postgres_opts` {#opt-services.maubot.settings.plugin_databases.postgres_opts}

Overrides for the default database\_opts when using a non-default postgres connection URL.

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.plugin_databases.sqlite` {#opt-services.maubot.settings.plugin_databases.sqlite}

The directory where SQLite plugin databases should be stored.

*Type:* string

*Default:* `"${config.services.maubot.dataDir}/plugins"`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.plugin_directories` {#opt-services.maubot.settings.plugin_directories}

Plugin directory paths

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.plugin_directories.load` {#opt-services.maubot.settings.plugin_directories.load}

The directories from which plugins should be loaded. Duplicate plugin IDs will be moved to the trash.

*Type:* list of string

*Default:* `[ "${config.services.maubot.dataDir}/plugins" ]`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.plugin_directories.trash` {#opt-services.maubot.settings.plugin_directories.trash}

The directory where old plugin versions and conflicting plugins should be moved. Set to null to delete files immediately.

*Type:* null or string

*Default:* `"${config.services.maubot.dataDir}/trash"`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.plugin_directories.upload` {#opt-services.maubot.settings.plugin_directories.upload}

The directory where uploaded new plugins should be stored.

*Type:* string

*Default:* `"${config.services.maubot.dataDir}/plugins"`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.server` {#opt-services.maubot.settings.server}

Listener config

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.server.hostname` {#opt-services.maubot.settings.server.hostname}

The IP to listen on

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.server.override_resource_path` {#opt-services.maubot.settings.server.override_resource_path}

Override path from where to load UI resources.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.server.plugin_base_path` {#opt-services.maubot.settings.server.plugin_base_path}

The base path for plugin endpoints. The instance ID will be appended directly.

*Type:* string

*Default:*

``` nix
"${config.services.maubot.settings.server.ui_base_path}/plugin/"
```

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.server.port` {#opt-services.maubot.settings.server.port}

The port to listen on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `29316`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.server.public_url` {#opt-services.maubot.settings.server.public_url}

Public base URL where the server is visible.

*Type:* string

*Default:* `"http://${config.services.maubot.settings.server.hostname}:${toString config.services.maubot.settings.server.port}"`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.maubot.settings.server.ui_base_path` {#opt-services.maubot.settings.server.ui_base_path}

The base path for the UI.

*Type:* string

*Default:* `"/_matrix/maubot"`

*Declared by:* [`nixos/modules/services/matrix/maubot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/maubot.nix)

## `services.mautrix-discord.dataDir` {#opt-services.mautrix-discord.dataDir}

Directory to store the bridge's data.

*Type:* absolute path

*Default:* `"/var/lib/mautrix-discord"`

*Declared by:* [`nixos/modules/services/matrix/mautrix-discord.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-discord.nix)

## `services.mautrix-discord.enable` {#opt-services.mautrix-discord.enable}

Whether to enable Mautrix-Discord, a Matrix-Discord puppeting/relay-bot bridge.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/mautrix-discord.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-discord.nix)

## `services.mautrix-discord.environmentFile` {#opt-services.mautrix-discord.environmentFile}

File containing environment variables for secret substitution.
Variables in the config like `$VARIABLE` will be replaced.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/matrix/mautrix-discord.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-discord.nix)

## `services.mautrix-discord.package` {#opt-services.mautrix-discord.package}

The mautrix-discord package to use.

*Type:* package

*Default:* `pkgs.mautrix-discord`

*Declared by:* [`nixos/modules/services/matrix/mautrix-discord.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-discord.nix)

## `services.mautrix-discord.registerToSynapse` {#opt-services.mautrix-discord.registerToSynapse}

Whether to add the bridge's app service registration file to
`services.matrix-synapse.settings.app_service_config_files`.

*Type:* boolean

*Default:* `config.services.matrix-synapse.enable`

*Declared by:* [`nixos/modules/services/matrix/mautrix-discord.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-discord.nix)

## `services.mautrix-discord.settings` {#opt-services.mautrix-discord.settings}

`config.yaml` configuration as a Nix attribute set.

Configuration options should match those described in
[example-config.yaml](https://github.com/mautrix/discord/blob/main/example-config.yaml).

Secret tokens should be specified using `environmentFile`
instead of this world-readable attribute set.

*Type:* YAML 1.1 value

*Default:*

``` nix
{
  appservice = {
    address = "http://localhost:29334";
    as_token = "This value is generated when generating the registration";
    bot = {
      avatar = "mxc://maunium.net/nIdEykemnwdisvHbpxflpDlC";
      displayname = "Discord bridge bot";
      username = "discordbot";
    };
    database = {
      type = "sqlite3";
      uri = "file:/var/lib/mautrix-discord/mautrix-discord.db?_txlock=immediate";
    };
    hostname = "0.0.0.0";
    hs_token = "This value is generated when generating the registration";
    id = "discord";
    port = 29334;
  };
  bridge = {
    permissions = {
      "*" = "relay";
    };
  };
  homeserver = {
    address = "";
    domain = "";
  };
  logging = {
    min_level = "info";
    writers = [
      {
        format = "pretty-colored";
        time_format = " ";
        type = "stdout";
      }
    ];
  };
}
```

*Example:*

``` nix
{
  homeserver = {
    address = "http://localhost:8008";
    domain = "example.com";
  };

  bridge.permissions = {
    "example.com" = "user";
    "@admin:example.com" = "admin";
  };
}
```

*Declared by:* [`nixos/modules/services/matrix/mautrix-discord.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-discord.nix)

## `services.mautrix-meta.instances` {#opt-services.mautrix-meta.instances}

Configuration of multiple `mautrix-meta` instances.
`services.mautrix-meta.instances.facebook` and `services.mautrix-meta.instances.instagram`
come preconfigured with network.mode, appservice.id, bot username, display name and avatar.

*Type:* attribute set of (submodule)

*Example:*

``` nix
''
  {
    facebook = {
      enable = true;
      settings = {
        homeserver.domain = "example.com";
      };
    };
  
    instagram = {
      enable = true;
      settings = {
        homeserver.domain = "example.com";
      };
    };
  
    messenger = {
      enable = true;
      settings = {
        network.mode = "messenger";
        homeserver.domain = "example.com";
        appservice = {
          id = "messenger";
          bot = {
            username = "messengerbot";
            displayname = "Messenger bridge bot";
            avatar = "mxc://maunium.net/ygtkteZsXnGJLJHRchUwYWak";
          };
        };
      };
    };
  }
''
```

*Declared by:* [`nixos/modules/services/matrix/mautrix-meta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-meta.nix)

## `services.mautrix-meta.instances.<name>.dataDir` {#opt-services.mautrix-meta.instances._name_.dataDir}

Path to the directory with database, registration, and other data for the bridge service.
This path is relative to `/var/lib`, it cannot start with `../` (it cannot be outside of `/var/lib`).

*Type:* string

*Default:* `"mautrix-meta-‹name›"`

*Declared by:* [`nixos/modules/services/matrix/mautrix-meta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-meta.nix)

## `services.mautrix-meta.instances.<name>.enable` {#opt-services.mautrix-meta.instances._name_.enable}

Whether to enable Mautrix-Meta, a Matrix \<-\> Facebook and Matrix \<-\> Instagram hybrid puppeting/relaybot bridge.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/mautrix-meta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-meta.nix)

## `services.mautrix-meta.instances.<name>.environmentFile` {#opt-services.mautrix-meta.instances._name_.environmentFile}

File containing environment variables to substitute when copying the configuration
out of Nix store to the `services.mautrix-meta.dataDir`.

Can be used for storing the secrets without making them available in the Nix store.

For example, you can set `services.mautrix-meta.settings.appservice.as_token = "$MAUTRIX_META_APPSERVICE_AS_TOKEN"`
and then specify `MAUTRIX_META_APPSERVICE_AS_TOKEN="{token}"` in the environment file.
This value will get substituted into the configuration file as as token.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/matrix/mautrix-meta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-meta.nix)

## `services.mautrix-meta.instances.<name>.registerToSynapse` {#opt-services.mautrix-meta.instances._name_.registerToSynapse}

Whether to add registration file to `services.matrix-synapse.settings.app_service_config_files` and
make Synapse wait for registration service.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/matrix/mautrix-meta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-meta.nix)

## `services.mautrix-meta.instances.<name>.registrationFile` {#opt-services.mautrix-meta.instances._name_.registrationFile}

Path to the yaml registration file of the appservice.

*Type:* absolute path

*Read only*

*Declared by:* [`nixos/modules/services/matrix/mautrix-meta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-meta.nix)

## `services.mautrix-meta.instances.<name>.registrationServiceUnit` {#opt-services.mautrix-meta.instances._name_.registrationServiceUnit}

The registration service that generates the registration file.

Systemd unit (a service or a target) for other services to depend on if they
need to be started after mautrix-meta registration service.

This option is useful as the actual parent unit for all matrix-synapse processes
changes when configuring workers.

*Type:* string

*Read only*

*Declared by:* [`nixos/modules/services/matrix/mautrix-meta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-meta.nix)

## `services.mautrix-meta.instances.<name>.serviceDependencies` {#opt-services.mautrix-meta.instances._name_.serviceDependencies}

List of Systemd services to require and wait for when starting the application service.

*Type:* list of string

*Default:*

``` nix
''
  [ config.registrationServiceUnit ] ++
  (lib.lists.optional upperConfig.services.matrix-synapse.enable upperConfig.services.matrix-synapse.serviceUnit) ++
  (lib.lists.optional upperConfig.services.matrix-conduit.enable "matrix-conduit.service") ++
  (lib.lists.optional upperConfig.services.dendrite.enable "dendrite.service");
''
```

*Declared by:* [`nixos/modules/services/matrix/mautrix-meta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-meta.nix)

## `services.mautrix-meta.instances.<name>.serviceUnit` {#opt-services.mautrix-meta.instances._name_.serviceUnit}

The systemd unit (a service or a target) for other services to depend on if they
need to be started after matrix-synapse.

This option is useful as the actual parent unit for all matrix-synapse processes
changes when configuring workers.

*Type:* string

*Read only*

*Declared by:* [`nixos/modules/services/matrix/mautrix-meta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-meta.nix)

## `services.mautrix-meta.instances.<name>.settings` {#opt-services.mautrix-meta.instances._name_.settings}

`config.yaml` configuration as a Nix attribute set.
Configuration options should match those described in the example configuration.
Get an example configuration by executing one of those commands

- `mautrix-meta -c example.yaml --generate-example-config`
- `mautrix-instagram -c example.yaml --generate-example-config`

Secret tokens should be specified using `environmentFile`
instead

*Type:* YAML 1.1 value

*Default:*

``` nix
''
  {
    homeserver = {
      software = "standard";
      address = "https://''${config.settings.homeserver.domain}";
    };
  
    appservice = {
      database = {
        type = "sqlite3-fk-wal";
        uri = "file:''${fullDataDir config}/mautrix-meta.db?_txlock=immediate";
      };
  
      hostname = "localhost";
      port = 29319;
      address = "http://''${config.settings.appservice.hostname}:''${toString config.settings.appservice.port}";
    };
  
    bridge = {
      # Require encryption by default to make the bridge more secure
      encryption = {
        allow = true;
        default = true;
        require = true;
  
        # Recommended options from mautrix documentation
        # for optimal security.
        delete_keys = {
          dont_store_outbound = true;
          ratchet_on_decrypt = true;
          delete_fully_used_on_decrypt = true;
          delete_prev_on_new_session = true;
          delete_on_device_delete = true;
          periodically_delete_expired = true;
          delete_outdated_inbound = true;
        };
  
        verification_levels = {
          receive = "cross-signed-tofu";
          send = "cross-signed-tofu";
          share = "cross-signed-tofu";
        };
      };
    };
  
    logging = {
      min_level = "info";
      writers = lib.singleton {
        type = "stdout";
        format = "pretty-colored";
        time_format = " ";
      };
    };
  };
''
```

*Declared by:* [`nixos/modules/services/matrix/mautrix-meta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-meta.nix)

## `services.mautrix-meta.package` {#opt-services.mautrix-meta.package}

The mautrix-meta package to use.

*Type:* package

*Default:* `pkgs.mautrix-meta`

*Declared by:* [`nixos/modules/services/matrix/mautrix-meta.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-meta.nix)

## `services.mautrix-signal.enable` {#opt-services.mautrix-signal.enable}

Whether to enable mautrix-signal, a Matrix-Signal puppeting bridge.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/mautrix-signal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-signal.nix)

## `services.mautrix-signal.environmentFile` {#opt-services.mautrix-signal.environmentFile}

File containing environment variables to be passed to the mautrix-signal service.
If an environment variable `MAUTRIX_SIGNAL_BRIDGE_LOGIN_SHARED_SECRET` is set,
then its value will be used in the configuration file for the option
`double_puppet.secrets` without leaking it to the store, using the configured
`homeserver.domain` as key.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/matrix/mautrix-signal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-signal.nix)

## `services.mautrix-signal.package` {#opt-services.mautrix-signal.package}

The mautrix-signal package to use.

*Type:* package

*Default:* `pkgs.mautrix-signal`

*Declared by:* [`nixos/modules/services/matrix/mautrix-signal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-signal.nix)

## `services.mautrix-signal.registerToSynapse` {#opt-services.mautrix-signal.registerToSynapse}

Whether to add the bridge's app service registration file to
`services.matrix-synapse.settings.app_service_config_files`.

*Type:* boolean

*Default:*

``` nix
config.services.matrix-synapse.enable
```

*Declared by:* [`nixos/modules/services/matrix/mautrix-signal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-signal.nix)

## `services.mautrix-signal.serviceDependencies` {#opt-services.mautrix-signal.serviceDependencies}

List of systemd units to require and wait for when starting the application service.

*Type:* list of string

*Default:*

``` nix
(optional config.services.matrix-synapse.enable config.services.matrix-synapse.serviceUnit)
++ (optional config.services.matrix-conduit.enable "conduit.service")
```

*Declared by:* [`nixos/modules/services/matrix/mautrix-signal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-signal.nix)

## `services.mautrix-signal.settings` {#opt-services.mautrix-signal.settings}

`config.yaml` configuration as a Nix attribute set.
Configuration options should match those described in the example configuration.
Get an example configuration by executing `mautrix-signal -c example.yaml --generate-example-config`
Secret tokens should be specified using `environmentFile`
instead of this world-readable attribute set.

*Type:* JSON value

*Default:*

``` nix
{
  appservice = {
    as_token = "";
    bot = {
      displayname = "Signal Bridge Bot";
      username = "signalbot";
    };
    hostname = "[::]";
    hs_token = "";
    id = "signal";
    port = 29328;
    username_template = "signal_{{.}}";
  };
  bridge = {
    command_prefix = "!signal";
    permissions = {
      "*" = "relay";
    };
    relay = {
      enabled = true;
    };
  };
  database = {
    type = "sqlite3";
    uri = "file:/var/lib/mautrix-signal/mautrix-signal.db?_txlock=immediate";
  };
  direct_media = {
    server_key = "";
  };
  double_puppet = {
    secrets = { };
    servers = { };
  };
  encryption = {
    pickle_key = "";
  };
  homeserver = {
    address = "http://localhost:8448";
  };
  logging = {
    min_level = "info";
    writers = [
      {
        format = "pretty-colored";
        time_format = " ";
        type = "stdout";
      }
    ];
  };
  network = {
    displayname_template = "{{or .ProfileName .PhoneNumber \"Unknown user\"}}";
  };
  provisioning = {
    shared_secret = "";
  };
  public_media = {
    signing_key = "";
  };
}
```

*Example:*

``` nix
{
  appservice = {
    ephemeral_events = false;
    id = "signal";
  };
  backfill = {
    enabled = true;
  };
  bridge = {
    mute_only_on_create = false;
    permissions = {
      "example.com" = "user";
    };
    private_chat_portal_meta = true;
  };
  database = {
    type = "postgres";
    uri = "postgresql:///mautrix_signal?host=/run/postgresql";
  };
  encryption = {
    allow = true;
    default = true;
    pickle_key = "$ENCRYPTION_PICKLE_KEY";
    require = true;
  };
  homeserver = {
    address = "http://[::1]:8008";
    domain = "my-domain.tld";
  };
  matrix = {
    message_status_events = true;
  };
  provisioning = {
    shared_secret = "disable";
  };
}
```

*Declared by:* [`nixos/modules/services/matrix/mautrix-signal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-signal.nix)

## `services.mautrix-telegram.enable` {#opt-services.mautrix-telegram.enable}

Whether to enable Mautrix-Telegram, a Matrix-Telegram hybrid puppeting/relaybot bridge.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/mautrix-telegram.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-telegram.nix)

## `services.mautrix-telegram.environmentFile` {#opt-services.mautrix-telegram.environmentFile}

File containing environment variables to be passed to the mautrix-telegram service,
in which secret tokens can be specified securely by defining values for e.g.
`MAUTRIX_TELEGRAM_APPSERVICE_AS_TOKEN`,
`MAUTRIX_TELEGRAM_APPSERVICE_HS_TOKEN`,
`MAUTRIX_TELEGRAM_TELEGRAM_API_ID`,
`MAUTRIX_TELEGRAM_TELEGRAM_API_HASH` and optionally
`MAUTRIX_TELEGRAM_TELEGRAM_BOT_TOKEN`.

These environment variables can also be used to set other options by
replacing hierarchy levels by `.`, converting the name to uppercase
and prepending `MAUTRIX_TELEGRAM_`.
For example, the first value above maps to
`settings.appservice.as_token`.

The environment variable values can be prefixed with `json::` to have
them be parsed as JSON. For example, `login_shared_secret_map` can be
set as follows:
`MAUTRIX_TELEGRAM_BRIDGE_LOGIN_SHARED_SECRET_MAP=json::{"example.com":"secret"}`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/matrix/mautrix-telegram.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-telegram.nix)

## `services.mautrix-telegram.package` {#opt-services.mautrix-telegram.package}

The mautrix-telegram package to use.

*Type:* package

*Default:* `pkgs.mautrix-telegram`

*Declared by:* [`nixos/modules/services/matrix/mautrix-telegram.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-telegram.nix)

## `services.mautrix-telegram.registerToSynapse` {#opt-services.mautrix-telegram.registerToSynapse}

Whether to add the bridge's app service registration file to
`services.matrix-synapse.settings.app_service_config_files`.

*Type:* boolean

*Default:* `config.services.matrix-synapse.enable`

*Declared by:* [`nixos/modules/services/matrix/mautrix-telegram.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-telegram.nix)

## `services.mautrix-telegram.serviceDependencies` {#opt-services.mautrix-telegram.serviceDependencies}

List of Systemd services to require and wait for when starting the application service.

*Type:* list of string

*Default:*

``` nix
lib.optional config.services.matrix-synapse.enable config.services.matrix-synapse.serviceUnit
```

*Declared by:* [`nixos/modules/services/matrix/mautrix-telegram.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-telegram.nix)

## `services.mautrix-telegram.settings` {#opt-services.mautrix-telegram.settings}

`config.yaml` configuration as a Nix attribute set.
Configuration options should match those described in
[example-config.yaml](https://github.com/mautrix/telegram/blob/master/mautrix_telegram/example-config.yaml).

Secret tokens should be specified using `environmentFile`
instead of this world-readable attribute set.

*Type:* JSON value

*Default:*

``` nix
{
  appservice = {
    address = "http://localhost:8080";
    database = "sqlite:////var/lib/mautrix-telegram/mautrix-telegram.db";
    database_opts = { };
    hostname = "0.0.0.0";
    port = 8080;
  };
  bridge = {
    double_puppet_server_map = { };
    login_shared_secret_map = { };
    permissions = {
      "*" = "relaybot";
    };
    relaybot = {
      whitelist = [ ];
    };
  };
  homeserver = {
    software = "standard";
  };
  logging = {
    formatters = {
      precise = {
        format = "[%(levelname)s@%(name)s] %(message)s";
      };
    };
    handlers = {
      console = {
        class = "logging.StreamHandler";
        formatter = "precise";
      };
    };
    loggers = {
      aiohttp = {
        level = "WARNING";
      };
      mau = {
        level = "INFO";
      };
      telethon = {
        level = "INFO";
      };
    };
    root = {
      handlers = [
        "console"
      ];
      level = "INFO";
    };
    version = 1;
  };
}
```

*Example:*

``` nix
{
  homeserver = {
    address = "http://localhost:8008";
    domain = "public-domain.tld";
  };

  appservice.public = {
    prefix = "/public";
    external = "https://public-appservice-address/public";
  };

  bridge.permissions = {
    "example.com" = "full";
    "@admin:example.com" = "admin";
  };
  telegram = {
    connection.use_ipv6 = true;
  };
}
```

*Declared by:* [`nixos/modules/services/matrix/mautrix-telegram.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-telegram.nix)

## `services.mautrix-whatsapp.enable` {#opt-services.mautrix-whatsapp.enable}

Whether to enable mautrix-whatsapp, a Matrix-WhatsApp puppeting bridge.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/mautrix-whatsapp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-whatsapp.nix)

## `services.mautrix-whatsapp.environmentFile` {#opt-services.mautrix-whatsapp.environmentFile}

File containing environment variables to be passed to the mautrix-whatsapp service.
If an environment variable `MAUTRIX_WHATSAPP_BRIDGE_LOGIN_SHARED_SECRET` is set,
then its value will be used in the configuration file for the option
`double_puppet.secrets` without leaking it to the store, using the configured
`homeserver.domain` as key.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/matrix/mautrix-whatsapp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-whatsapp.nix)

## `services.mautrix-whatsapp.package` {#opt-services.mautrix-whatsapp.package}

The mautrix-whatsapp package to use.

*Type:* package

*Default:* `pkgs.mautrix-whatsapp`

*Declared by:* [`nixos/modules/services/matrix/mautrix-whatsapp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-whatsapp.nix)

## `services.mautrix-whatsapp.registerToSynapse` {#opt-services.mautrix-whatsapp.registerToSynapse}

Whether to add the bridge's app service registration file to
`services.matrix-synapse.settings.app_service_config_files`.

*Type:* boolean

*Default:* `config.services.matrix-synapse.enable`

*Declared by:* [`nixos/modules/services/matrix/mautrix-whatsapp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-whatsapp.nix)

## `services.mautrix-whatsapp.serviceDependencies` {#opt-services.mautrix-whatsapp.serviceDependencies}

List of systemd units to require and wait for when starting the application service.

*Type:* list of string

*Default:*

``` nix
optional config.services.matrix-synapse.enable config.services.matrix-synapse.serviceUnit
++ optional config.services.matrix-conduit.enable "conduit.service"
```

*Declared by:* [`nixos/modules/services/matrix/mautrix-whatsapp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-whatsapp.nix)

## `services.mautrix-whatsapp.settings` {#opt-services.mautrix-whatsapp.settings}

`config.yaml` configuration as a Nix attribute set.
Configuration options should match those described in the example configuration.
Get an example configuration by executing `mautrix-whatsapp -c example.yaml --generate-example-config`
Secret tokens should be specified using `environmentFile`
instead of this world-readable attribute set.

*Type:* JSON value

*Default:*

``` nix
{
  appservice = {
    as_token = "";
    bot = {
      displayname = "WhatsApp Bridge Bot";
      username = "whatsappbot";
    };
    hostname = "[::]";
    hs_token = "";
    id = "whatsapp";
    port = 29318;
    username_template = "whatsapp_{{.}}";
  };
  bridge = {
    command_prefix = "!wa";
    permissions = {
      "*" = "relay";
    };
    relay = {
      enabled = true;
    };
  };
  database = {
    type = "sqlite3-fk-wal";
    uri = "file:/var/lib/mautrix-whatsapp/mautrix-whatsapp.db?_txlock=immediate";
  };
  direct_media = {
    server_key = "";
  };
  double_puppet = {
    secrets = { };
    servers = { };
  };
  encryption = {
    pickle_key = "";
  };
  homeserver = {
    address = "http://localhost:8448";
  };
  logging = {
    min_level = "info";
    writers = [
      {
        format = "pretty-colored";
        time_format = " ";
        type = "stdout";
      }
    ];
  };
  network = {
    displayname_template = "{{or .BusinessName .PushName .Phone}} (WA)";
    history_sync = {
      request_full_sync = true;
    };
    identity_change_notices = true;
  };
  provisioning = {
    shared_secret = "";
  };
  public_media = {
    signing_key = "";
  };
}
```

*Example:*

``` nix
{
  appservice = {
    ephemeral_events = false;
    id = "whatsapp";
  };
  backfill = {
    enabled = true;
  };
  bridge = {
    mute_only_on_create = false;
    permissions = {
      "example.com" = "user";
    };
    private_chat_portal_meta = true;
  };
  database = {
    type = "postgres";
    uri = "postgresql:///mautrix_whatsapp?host=/run/postgresql";
  };
  encryption = {
    allow = true;
    default = true;
    pickle_key = "$ENCRYPTION_PICKLE_KEY";
    require = true;
  };
  homeserver = {
    address = "http://[::1]:8008";
    domain = "my-domain.tld";
  };
  matrix = {
    message_status_events = true;
  };
  provisioning = {
    shared_secret = "disable";
  };
}
```

*Declared by:* [`nixos/modules/services/matrix/mautrix-whatsapp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mautrix-whatsapp.nix)

## `services.mbpfan.aggressive` {#opt-services.mbpfan.aggressive}

If true, favors higher default fan speeds.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/mbpfan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mbpfan.nix)

## `services.mbpfan.enable` {#opt-services.mbpfan.enable}

Whether to enable mbpfan, fan controller daemon for Apple Macs and MacBooks.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/mbpfan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mbpfan.nix)

## `services.mbpfan.package` {#opt-services.mbpfan.package}

The mbpfan package to use.

*Type:* package

*Default:* `pkgs.mbpfan`

*Declared by:* [`nixos/modules/services/misc/mbpfan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mbpfan.nix)

## `services.mbpfan.settings` {#opt-services.mbpfan.settings}

INI configuration for Mbpfan.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/mbpfan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mbpfan.nix)

## `services.mbpfan.settings.general.high_temp` {#opt-services.mbpfan.settings.general.high_temp}

If temperature is above this, fan speed will gradually increase.

*Type:* signed integer

*Default:* `58`

*Declared by:* [`nixos/modules/services/misc/mbpfan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mbpfan.nix)

## `services.mbpfan.settings.general.low_temp` {#opt-services.mbpfan.settings.general.low_temp}

If temperature is below this, fans will run at minimum speed.

*Type:* signed integer

*Default:* `55`

*Declared by:* [`nixos/modules/services/misc/mbpfan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mbpfan.nix)

## `services.mbpfan.settings.general.max_temp` {#opt-services.mbpfan.settings.general.max_temp}

If temperature is above this, fans will run at maximum speed.

*Type:* signed integer

*Default:* `78`

*Declared by:* [`nixos/modules/services/misc/mbpfan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mbpfan.nix)

## `services.mbpfan.settings.general.polling_interval` {#opt-services.mbpfan.settings.general.polling_interval}

The polling interval.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/misc/mbpfan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mbpfan.nix)

## `services.mbpfan.verbose` {#opt-services.mbpfan.verbose}

If true, sets the log level to verbose.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/mbpfan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mbpfan.nix)

## `services.mchprs.dataDir` {#opt-services.mchprs.dataDir}

Directory to store MCHPRS database and other state/data files.

*Type:* absolute path

*Default:* `"/var/lib/mchprs"`

*Declared by:* [`nixos/modules/services/games/mchprs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/mchprs.nix)

## `services.mchprs.declarativeSettings` {#opt-services.mchprs.declarativeSettings}

Whether to use a declarative configuration for MCHPRS.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/mchprs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/mchprs.nix)

## `services.mchprs.declarativeWhitelist` {#opt-services.mchprs.declarativeWhitelist}

Whether to use a declarative whitelist.
The options [`services.mchprs.whitelist.list`](#opt-services.mchprs.whitelist.list)
will be applied if and only if set to `true`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/mchprs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/mchprs.nix)

## `services.mchprs.enable` {#opt-services.mchprs.enable}

Whether to enable MCHPRS, a Minecraft server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/games/mchprs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/mchprs.nix)

## `services.mchprs.maxRuntime` {#opt-services.mchprs.maxRuntime}

Automatically restart the server after
[`services.mchprs.maxRuntime`](#opt-services.mchprs.maxRuntime).
The `systemd.time(7)` time span format is described here:
[https://www.freedesktop.org/software/systemd/man/systemd.time.html#Parsing%20Time%20Spans](https://www.freedesktop.org/software/systemd/man/systemd.time.html#Parsing%20Time%20Spans).
If `null`, then the server is not restarted automatically.

*Type:* string

*Default:* `"infinity"`

*Example:* `"7d"`

*Declared by:* [`nixos/modules/services/games/mchprs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/mchprs.nix)

## `services.mchprs.openFirewall` {#opt-services.mchprs.openFirewall}

Whether to open ports in the firewall for the server.
Only has effect when
[`services.mchprs.declarativeSettings`](#opt-services.mchprs.declarativeSettings) is `true`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/mchprs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/mchprs.nix)

## `services.mchprs.package` {#opt-services.mchprs.package}

The mchprs package to use.

*Type:* package

*Default:* `pkgs.mchprs`

*Declared by:* [`nixos/modules/services/games/mchprs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/mchprs.nix)

## `services.mchprs.settings` {#opt-services.mchprs.settings}

Configuration for MCHPRS via `Config.toml`.
See [https://github.com/MCHPR/MCHPRS/blob/master/README.md](https://github.com/MCHPR/MCHPRS/blob/master/README.md) for documentation.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/games/mchprs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/mchprs.nix)

## `services.mchprs.settings.address` {#opt-services.mchprs.settings.address}

Address for the server.
Please use enclosing square brackets when using ipv6.
Only has effect when
[`services.mchprs.declarativeSettings`](#opt-services.mchprs.declarativeSettings) is `true`.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/games/mchprs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/mchprs.nix)

## `services.mchprs.settings.auto_redpiler` {#opt-services.mchprs.settings.auto_redpiler}

Use redpiler automatically.
Only has effect when
[`services.mchprs.declarativeSettings`](#opt-services.mchprs.declarativeSettings) is `true`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/games/mchprs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/mchprs.nix)

## `services.mchprs.settings.block_in_hitbox` {#opt-services.mchprs.settings.block_in_hitbox}

Allow placing blocks inside of players
(hitbox logic is simplified).
Only has effect when
[`services.mchprs.declarativeSettings`](#opt-services.mchprs.declarativeSettings) is `true`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/games/mchprs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/mchprs.nix)

## `services.mchprs.settings.bungeecord` {#opt-services.mchprs.settings.bungeecord}

Enable compatibility with
[BungeeCord](https://github.com/SpigotMC/BungeeCord).
Only has effect when
[`services.mchprs.declarativeSettings`](#opt-services.mchprs.declarativeSettings) is `true`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/mchprs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/mchprs.nix)

## `services.mchprs.settings.chat_format` {#opt-services.mchprs.settings.chat_format}

How to format chat message interpolating `username`
and `message` with curly braces.
Only has effect when
[`services.mchprs.declarativeSettings`](#opt-services.mchprs.declarativeSettings) is `true`.

*Type:* string

*Default:* `"<{username}> {message}"`

*Declared by:* [`nixos/modules/services/games/mchprs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/mchprs.nix)

## `services.mchprs.settings.max_players` {#opt-services.mchprs.settings.max_players}

Maximum number of simultaneous players.
Only has effect when
[`services.mchprs.declarativeSettings`](#opt-services.mchprs.declarativeSettings) is `true`.

*Type:* positive integer, meaning \>0

*Default:* `99999`

*Declared by:* [`nixos/modules/services/games/mchprs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/mchprs.nix)

## `services.mchprs.settings.motd` {#opt-services.mchprs.settings.motd}

Message of the day.
Only has effect when
[`services.mchprs.declarativeSettings`](#opt-services.mchprs.declarativeSettings) is `true`.

*Type:* string

*Default:* `"Minecraft High Performance Redstone Server"`

*Declared by:* [`nixos/modules/services/games/mchprs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/mchprs.nix)

## `services.mchprs.settings.port` {#opt-services.mchprs.settings.port}

Port for the server.
Only has effect when
[`services.mchprs.declarativeSettings`](#opt-services.mchprs.declarativeSettings) is `true`.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `25565`

*Declared by:* [`nixos/modules/services/games/mchprs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/mchprs.nix)

## `services.mchprs.settings.schemati` {#opt-services.mchprs.settings.schemati}

Mimic the verification and directory layout used by the
Open Redstone Engineers
[Schemati plugin](https://github.com/OpenRedstoneEngineers/Schemati).
Only has effect when
[`services.mchprs.declarativeSettings`](#opt-services.mchprs.declarativeSettings) is `true`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/mchprs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/mchprs.nix)

## `services.mchprs.settings.view_distance` {#opt-services.mchprs.settings.view_distance}

Maximal distance (in chunks) between players and loaded chunks.
Only has effect when
[`services.mchprs.declarativeSettings`](#opt-services.mchprs.declarativeSettings) is `true`.

*Type:* positive integer, meaning \>0

*Default:* `8`

*Declared by:* [`nixos/modules/services/games/mchprs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/mchprs.nix)

## `services.mchprs.whitelist.enable` {#opt-services.mchprs.whitelist.enable}

Whether or not the whitelist (in `whitelist.json`) shoud be enabled.
Only has effect when [`services.mchprs.declarativeSettings`](#opt-services.mchprs.declarativeSettings) is `true`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/mchprs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/mchprs.nix)

## `services.mchprs.whitelist.list` {#opt-services.mchprs.whitelist.list}

Whitelisted players, only has an effect when
[`services.mchprs.declarativeWhitelist`](#opt-services.mchprs.declarativeWhitelist) is
`true` and the whitelist is enabled
via [`services.mchprs.whitelist.enable`](#opt-services.mchprs.whitelist.enable).
This is a mapping from Minecraft usernames to UUIDs.
You can use [https://mcuuid.net/](https://mcuuid.net/) to get a
Minecraft UUID for a username.

*Type:* attribute set of Minecraft UUID

*Default:* `{ }`

*Example:*

``` nix
{
  username1 = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx";
  username2 = "yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy";
};
```

*Declared by:* [`nixos/modules/services/games/mchprs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/mchprs.nix)

## `services.mealie.credentialsFile` {#opt-services.mealie.credentialsFile}

File containing credentials used in mealie such as `POSTGRES_PASSWORD`
or sensitive LDAP options.

Expects the format of an `EnvironmentFile=`, as described by `systemd.exec(5)`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/mealie-credentials.env"`

*Declared by:* [`nixos/modules/services/web-apps/mealie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mealie.nix)

## `services.mealie.database.createLocally` {#opt-services.mealie.database.createLocally}

Configure local PostgreSQL database server for Mealie.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mealie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mealie.nix)

## `services.mealie.enable` {#opt-services.mealie.enable}

Whether to enable Mealie, a recipe manager and meal planner.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mealie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mealie.nix)

## `services.mealie.listenAddress` {#opt-services.mealie.listenAddress}

Address on which the service should listen.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/web-apps/mealie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mealie.nix)

## `services.mealie.openFirewall` {#opt-services.mealie.openFirewall}

Whether to open the port in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mealie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mealie.nix)

## `services.mealie.package` {#opt-services.mealie.package}

The mealie package to use.

*Type:* package

*Default:* `pkgs.mealie`

*Declared by:* [`nixos/modules/services/web-apps/mealie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mealie.nix)

## `services.mealie.port` {#opt-services.mealie.port}

Port on which to serve the Mealie service.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9000`

*Declared by:* [`nixos/modules/services/web-apps/mealie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mealie.nix)

## `services.mealie.settings` {#opt-services.mealie.settings}

Configuration of the Mealie service.

See [the mealie documentation](https://nightly.mealie.io/documentation/getting-started/installation/backend-config/) for available options and default values.

*Type:* attribute set of (null or ((string or absolute path or package) or (boolean or signed integer) convertible to it))

*Default:* `{ }`

*Example:*

``` nix
{
  ALLOW_SIGNUP = "false";
}
```

*Declared by:* [`nixos/modules/services/web-apps/mealie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mealie.nix)

## `services.mediagoblin.createDatabaseLocally` {#opt-services.mediagoblin.createDatabaseLocally}

Whether to configure a local postgres database and connect to it.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mediagoblin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediagoblin.nix)

## `services.mediagoblin.domain` {#opt-services.mediagoblin.domain}

Domain under which mediagoblin will be served.

*Type:* string

*Example:* `"mediagoblin.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/mediagoblin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediagoblin.nix)

## `services.mediagoblin.enable` {#opt-services.mediagoblin.enable}

Whether to enable MediaGoblin.

After the initial deployment, make sure to add an admin account:

```
mediagoblin-gmg adduser --username admin --email admin@example.com
mediagoblin-gmg makeadmin admin
```

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mediagoblin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediagoblin.nix)

## `services.mediagoblin.package` {#opt-services.mediagoblin.package}

The mediagoblin package to use.

*Type:* package

*Default:* `pkgs.mediagoblin`

*Declared by:* [`nixos/modules/services/web-apps/mediagoblin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediagoblin.nix)

## `services.mediagoblin.paste.port` {#opt-services.mediagoblin.paste.port}

Port under which paste will listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6543`

*Declared by:* [`nixos/modules/services/web-apps/mediagoblin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediagoblin.nix)

## `services.mediagoblin.paste.settings` {#opt-services.mediagoblin.paste.settings}

Settings which are written into `paste.ini`.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/mediagoblin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediagoblin.nix)

## `services.mediagoblin.pluginPackages` {#opt-services.mediagoblin.pluginPackages}

Plugins to add to the environment of MediaGoblin. They still need to be enabled in the config.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/mediagoblin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediagoblin.nix)

## `services.mediagoblin.settings` {#opt-services.mediagoblin.settings}

Settings which are written into `mediagoblin.ini`.

*Type:* open submodule of anything

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/mediagoblin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediagoblin.nix)

## `services.mediagoblin.settings.mediagoblin.allow_registration` {#opt-services.mediagoblin.settings.mediagoblin.allow_registration}

Whether to enable user self registration. This is generally not recommend due to spammers.
See [upstream FAQ](https://docs.mediagoblin.org/en/stable/siteadmin/production-deployments.html#should-i-keep-open-registration-enabled).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mediagoblin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediagoblin.nix)

## `services.mediagoblin.settings.mediagoblin.email_debug_mode` {#opt-services.mediagoblin.settings.mediagoblin.email_debug_mode}

Disable email debug mode to start sending outgoing mails.
This requires configuring SMTP settings,
see the [upstream docs](https://docs.mediagoblin.org/en/stable/siteadmin/configuration.html#enabling-email-notifications)
for details.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mediagoblin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediagoblin.nix)

## `services.mediagoblin.settings.mediagoblin.email_sender_address` {#opt-services.mediagoblin.settings.mediagoblin.email_sender_address}

Email address which notices are sent from.

*Type:* string

*Example:* `"noreply@example.org"`

*Declared by:* [`nixos/modules/services/web-apps/mediagoblin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediagoblin.nix)

## `services.mediagoblin.settings.mediagoblin.plugins` {#opt-services.mediagoblin.settings.mediagoblin.plugins}

Plugins to enable. See [upstream docs](https://docs.mediagoblin.org/en/stable/siteadmin/plugins.html) for details.
Extra dependencies are automatically enabled.

*Type:* unspecified value

*Default:*

``` nix
''
  {
    "mediagoblin.plugins.geolocation" = { };
    "mediagoblin.plugins.processing_info" = { };
    "mediagoblin.plugins.basic_auth" = { };
    "mediagoblin.media_types.image" = { };
  }
''
```

*Declared by:* [`nixos/modules/services/web-apps/mediagoblin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediagoblin.nix)

## `services.mediagoblin.settings.mediagoblin.sql_engine` {#opt-services.mediagoblin.settings.mediagoblin.sql_engine}

Database to use.

*Type:* string

*Default:* `"sqlite:///var/lib/mediagoblin/mediagoblin.db"`

*Example:* `"postgresql:///mediagoblin"`

*Declared by:* [`nixos/modules/services/web-apps/mediagoblin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediagoblin.nix)

## `services.mediamtx.allowVideoAccess` {#opt-services.mediamtx.allowVideoAccess}

Whether to enable access to video devices like cameras on the system
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/video/mediamtx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/mediamtx.nix)

## `services.mediamtx.enable` {#opt-services.mediamtx.enable}

Whether to enable MediaMTX.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/video/mediamtx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/mediamtx.nix)

## `services.mediamtx.env` {#opt-services.mediamtx.env}

Extra environment variables for MediaMTX

*Type:* attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  MTX_CONFKEY = "mykey";
}
```

*Declared by:* [`nixos/modules/services/video/mediamtx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/mediamtx.nix)

## `services.mediamtx.package` {#opt-services.mediamtx.package}

The mediamtx package to use.

*Type:* package

*Default:* `pkgs.mediamtx`

*Declared by:* [`nixos/modules/services/video/mediamtx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/mediamtx.nix)

## `services.mediamtx.settings` {#opt-services.mediamtx.settings}

Settings for MediaMTX. Refer to the defaults at
[https://github.com/bluenviron/mediamtx/blob/main/mediamtx.yml](https://github.com/bluenviron/mediamtx/blob/main/mediamtx.yml).

*Type:* YAML 1.2 value

*Default:* `{ }`

*Example:*

``` nix
{
  paths = {
    cam = {
      runOnInit = "\${lib.getExe pkgs.ffmpeg} -f v4l2 -i /dev/video0 -f rtsp rtsp://localhost:$RTSP_PORT/$RTSP_PATH";
      runOnInitRestart = true;
    };
  };
}
```

*Declared by:* [`nixos/modules/services/video/mediamtx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/mediamtx.nix)

## `services.mediatomb.customCfg` {#opt-services.mediatomb.customCfg}

Allow the service to create and use its own config file inside the `dataDir` as
configured by [`services.mediatomb.dataDir`](#opt-services.mediatomb.dataDir).
Deactivated by default, the service then runs with the configuration generated from this module.
Otherwise, when enabled, no service configuration is generated. Gerbera/Mediatomb then starts using
config.xml within the configured `dataDir`. It's up to the user to make a correct
configuration file.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/mediatomb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mediatomb.nix)

## `services.mediatomb.dataDir` {#opt-services.mediatomb.dataDir}

The directory where Gerbera/Mediatomb stores its state, data, etc.

*Type:* absolute path

*Default:* `"/var/lib/${config.services.mediatomb.package.pname}"`

*Declared by:* [`nixos/modules/services/misc/mediatomb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mediatomb.nix)

## `services.mediatomb.dsmSupport` {#opt-services.mediatomb.dsmSupport}

Whether to enable D-Link DSM 320 specific tweaks.
WARNING: incompatible with ps3 support.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/mediatomb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mediatomb.nix)

## `services.mediatomb.enable` {#opt-services.mediatomb.enable}

Whether to enable the Gerbera/Mediatomb DLNA server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/mediatomb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mediatomb.nix)

## `services.mediatomb.group` {#opt-services.mediatomb.group}

Group account under which the service runs.

*Type:* string

*Default:* `"mediatomb"`

*Declared by:* [`nixos/modules/services/misc/mediatomb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mediatomb.nix)

## `services.mediatomb.interface` {#opt-services.mediatomb.interface}

A specific interface to bind to.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/mediatomb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mediatomb.nix)

## `services.mediatomb.mediaDirectories` {#opt-services.mediatomb.mediaDirectories}

Declare media directories to index.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    hidden-files = false;
    path = "/data/pictures";
    recursive = false;
  }
  {
    hidden-files = false;
    path = "/data/audio";
    recursive = true;
  }
]
```

*Declared by:* [`nixos/modules/services/misc/mediatomb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mediatomb.nix)

## `services.mediatomb.mediaDirectories.*.hidden-files` {#opt-services.mediatomb.mediaDirectories._.hidden-files}

Whether to index the hidden files or not.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/mediatomb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mediatomb.nix)

## `services.mediatomb.mediaDirectories.*.path` {#opt-services.mediatomb.mediaDirectories._.path}

Absolute directory path to the media directory to index.

*Type:* string

*Declared by:* [`nixos/modules/services/misc/mediatomb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mediatomb.nix)

## `services.mediatomb.mediaDirectories.*.recursive` {#opt-services.mediatomb.mediaDirectories._.recursive}

Whether the indexation must take place recursively or not.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/mediatomb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mediatomb.nix)

## `services.mediatomb.openFirewall` {#opt-services.mediatomb.openFirewall}

If false (the default), this is up to the user to declare the firewall rules.
If true, this opens port 1900 (tcp and udp) and the port specified by
`sercvices.mediatomb.port`.

If the option [`services.mediatomb.interface`](#opt-services.mediatomb.interface) is set,
the firewall rules opened are dedicated to that interface. Otherwise,
those rules are opened globally.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/mediatomb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mediatomb.nix)

## `services.mediatomb.package` {#opt-services.mediatomb.package}

The gerbera package to use.

*Type:* package

*Default:* `pkgs.gerbera`

*Declared by:* [`nixos/modules/services/misc/mediatomb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mediatomb.nix)

## `services.mediatomb.pcDirectoryHide` {#opt-services.mediatomb.pcDirectoryHide}

Whether to list the top-level directory or not (from upnp client standpoint).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/mediatomb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mediatomb.nix)

## `services.mediatomb.port` {#opt-services.mediatomb.port}

The network port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `49152`

*Declared by:* [`nixos/modules/services/misc/mediatomb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mediatomb.nix)

## `services.mediatomb.ps3Support` {#opt-services.mediatomb.ps3Support}

Whether to enable ps3 specific tweaks.
WARNING: incompatible with DSM 320 support.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/mediatomb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mediatomb.nix)

## `services.mediatomb.serverName` {#opt-services.mediatomb.serverName}

How to identify the server on the network.

*Type:* string

*Default:* `"Gerbera (Mediatomb)"`

*Declared by:* [`nixos/modules/services/misc/mediatomb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mediatomb.nix)

## `services.mediatomb.tg100Support` {#opt-services.mediatomb.tg100Support}

Whether to enable Telegent TG100 specific tweaks.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/mediatomb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mediatomb.nix)

## `services.mediatomb.transcoding` {#opt-services.mediatomb.transcoding}

Whether to enable transcoding.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/mediatomb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mediatomb.nix)

## `services.mediatomb.user` {#opt-services.mediatomb.user}

User account under which the service runs.

*Type:* string

*Default:* `"mediatomb"`

*Declared by:* [`nixos/modules/services/misc/mediatomb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mediatomb.nix)

## `services.mediatomb.uuid` {#opt-services.mediatomb.uuid}

A unique (on your network) to identify the server by.

*Type:* string

*Default:* `"fdfc8a4e-a3ad-4c1d-b43d-a2eedb03a687"`

*Declared by:* [`nixos/modules/services/misc/mediatomb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mediatomb.nix)

## `services.mediawiki.database.createLocally` {#opt-services.mediawiki.database.createLocally}

Create the database and database user locally.
This currently only applies if database type "mysql" or "postgres" is selected.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.database.host` {#opt-services.mediawiki.database.host}

Database host address. Used only if database type is not SQLite.

*Type:* null or string

*Default:* `"\"localhost\""`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.database.name` {#opt-services.mediawiki.database.name}

Database name.

*Type:* string

*Default:* `"mediawiki"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.database.passwordFile` {#opt-services.mediawiki.database.passwordFile}

A file containing the password corresponding to
`database.user`. Used only if database type is not SQLite.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/mediawiki-dbpassword"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.database.path` {#opt-services.mediawiki.database.path}

Path to store the MediaWiki database in if using SQLite.

*Type:* null or absolute path

*Default:* `"/var/lib/mediawiki/data"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.database.port` {#opt-services.mediawiki.database.port}

Database host port. Used only if database type is not SQLite.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3306`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.database.socket` {#opt-services.mediawiki.database.socket}

Path to the unix socket file to use for authentication. Used only if database type is not SQLite.

*Type:* null or absolute path

*Default:* `/run/mysqld/mysqld.sock`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.database.tablePrefix` {#opt-services.mediawiki.database.tablePrefix}

If you only have access to a single database and wish to install more than
one version of MediaWiki, or have other applications that also use the
database, you can give the table names a unique prefix to stop any naming
conflicts or confusion. Only used if database type is MySQL.
See [https://www.mediawiki.org/wiki/Manual:$wgDBprefix](https://www.mediawiki.org/wiki/Manual:$wgDBprefix).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.database.type` {#opt-services.mediawiki.database.type}

Database engine to use. MySQL/MariaDB is the database of choice by MediaWiki developers.

*Type:* one of "mysql", "postgres", "mssql", "oracle", "sqlite"

*Default:* `"mysql"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.database.user` {#opt-services.mediawiki.database.user}

Database user. Used only if database type is not SQLite.

*Type:* null or string

*Default:* `"mediawiki"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.enable` {#opt-services.mediawiki.enable}

Whether to enable MediaWiki.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.extensions` {#opt-services.mediawiki.extensions}

Attribute set of paths whose content is copied to the `extensions`
subdirectory of the MediaWiki installation and enabled in configuration.

Use `null` instead of path to enable extensions that are part of MediaWiki.

*Type:* attribute set of (null or absolute path)

*Default:* `{ }`

*Example:*

``` nix
{
  Matomo = pkgs.fetchzip {
    url = "https://github.com/DaSchTour/matomo-mediawiki-extension/archive/v4.0.1.tar.gz";
    sha256 = "0g5rd3zp0avwlmqagc59cg9bbkn3r7wx7p6yr80s644mj6dlvs1b";
  };
  ParserFunctions = null;
}
```

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.extraConfig` {#opt-services.mediawiki.extraConfig}

Any additional text to be appended to MediaWiki's
LocalSettings.php configuration file. For configuration
settings, see [https://www.mediawiki.org/wiki/Manual:Configuration\_settings](https://www.mediawiki.org/wiki/Manual:Configuration_settings).

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  $wgEnableEmail = false;
''
```

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.finalPackage` {#opt-services.mediawiki.finalPackage}

The final package used by the module. This is the package that will have extensions and skins installed.

*Type:* package

*Default:* `pkg`

*Read only*

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost` {#opt-services.mediawiki.httpd.virtualHost}

Apache configuration can be done by adapting [`services.httpd.virtualHosts`](../../options/services-h/index.md#opt-services.httpd.virtualHosts).
See [services (H)](../../options/services-h/index.md#opt-services.httpd.virtualHosts) for further information.

*Type:* submodule

*Example:*

``` nix
{
  hostName = "mediawiki.example.org";
  adminAddr = "webmaster@example.org";
  forceSSL = true;
  enableACME = true;
}
```

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.acmeRoot` {#opt-services.mediawiki.httpd.virtualHost.acmeRoot}

Directory for the acme challenge which is PUBLIC, don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.addSSL` {#opt-services.mediawiki.httpd.virtualHost.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.adminAddr` {#opt-services.mediawiki.httpd.virtualHost.adminAddr}

E-mail address of the server administrator.

*Type:* null or string

*Default:* `null`

*Example:* `"admin@example.org"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.documentRoot` {#opt-services.mediawiki.httpd.virtualHost.documentRoot}

The path of Apache's document root directory.  If left undefined,
an empty directory in the Nix store will be used as root.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.enableACME` {#opt-services.mediawiki.httpd.virtualHost.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.enableUserDir` {#opt-services.mediawiki.httpd.virtualHost.enableUserDir}

Whether to enable serving `~/public_html` as
`/~«username»`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.extraConfig` {#opt-services.mediawiki.httpd.virtualHost.extraConfig}

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

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.forceSSL` {#opt-services.mediawiki.httpd.virtualHost.forceSSL}

Whether to add a separate nginx server block that permanently redirects (301)
all plain HTTP traffic to HTTPS. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443), where the non-SSL listens are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.globalRedirect` {#opt-services.mediawiki.httpd.virtualHost.globalRedirect}

If set, all requests for this host are redirected permanently to
the given URL.

*Type:* null or string

*Default:* `null`

*Example:* `"http://newserver.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.hostName` {#opt-services.mediawiki.httpd.virtualHost.hostName}

Canonical hostname for the server.

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.http2` {#opt-services.mediawiki.httpd.virtualHost.http2}

Whether to enable HTTP 2. HTTP/2 is supported in all multi-processing modules that come with httpd. *However, if you use the prefork mpm, there will
be severe restrictions.* Refer to [https://httpd.apache.org/docs/2.4/howto/http2.html#mpm-config](https://httpd.apache.org/docs/2.4/howto/http2.html#mpm-config) for details.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.listen` {#opt-services.mediawiki.httpd.virtualHost.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.listen.*.ip` {#opt-services.mediawiki.httpd.virtualHost.listen._.ip}

IP to listen on. 0.0.0.0 for IPv4 only, \* for all.

*Type:* string

*Default:* `"*"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.listen.*.port` {#opt-services.mediawiki.httpd.virtualHost.listen._.port}

Port to listen on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.listen.*.ssl` {#opt-services.mediawiki.httpd.virtualHost.listen._.ssl}

Whether to enable SSL (https) support.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.listenAddresses` {#opt-services.mediawiki.httpd.virtualHost.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.locations` {#opt-services.mediawiki.httpd.virtualHost.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.locations.<name>.alias` {#opt-services.mediawiki.httpd.virtualHost.locations._name_.alias}

Alias directory for requests. See [https://httpd.apache.org/docs/2.4/mod/mod\_alias.html#alias](https://httpd.apache.org/docs/2.4/mod/mod_alias.html#alias).

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.locations.<name>.extraConfig` {#opt-services.mediawiki.httpd.virtualHost.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.locations.<name>.index` {#opt-services.mediawiki.httpd.virtualHost.locations._name_.index}

Adds DirectoryIndex directive. See [https://httpd.apache.org/docs/2.4/mod/mod\_dir.html#directoryindex](https://httpd.apache.org/docs/2.4/mod/mod_dir.html#directoryindex).

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.locations.<name>.priority` {#opt-services.mediawiki.httpd.virtualHost.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.locations.<name>.proxyPass` {#opt-services.mediawiki.httpd.virtualHost.locations._name_.proxyPass}

Sets up a simple reverse proxy as described by [https://httpd.apache.org/docs/2.4/howto/reverse\_proxy.html#simple](https://httpd.apache.org/docs/2.4/howto/reverse_proxy.html#simple).

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.logFormat` {#opt-services.mediawiki.httpd.virtualHost.logFormat}

Log format for Apache's log files. Possible values are: combined, common, referer, agent.

*Type:* string

*Default:* `"common"`

*Example:* `"combined"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.onlySSL` {#opt-services.mediawiki.httpd.virtualHost.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.robotsEntries` {#opt-services.mediawiki.httpd.virtualHost.robotsEntries}

Specification of pages to be ignored by web crawlers. See [http://www.robotstxt.org/](http://www.robotstxt.org/) for details.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"Disallow: /foo/"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.servedDirs` {#opt-services.mediawiki.httpd.virtualHost.servedDirs}

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

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.servedFiles` {#opt-services.mediawiki.httpd.virtualHost.servedFiles}

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

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.serverAliases` {#opt-services.mediawiki.httpd.virtualHost.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.sslServerCert` {#opt-services.mediawiki.httpd.virtualHost.sslServerCert}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.sslServerChain` {#opt-services.mediawiki.httpd.virtualHost.sslServerChain}

Path to server SSL chain file.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/ca.pem"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.sslServerKey` {#opt-services.mediawiki.httpd.virtualHost.sslServerKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.httpd.virtualHost.useACMEHost` {#opt-services.mediawiki.httpd.virtualHost.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.name` {#opt-services.mediawiki.name}

Name of the wiki.

*Type:* string

*Default:* `"MediaWiki"`

*Example:* `"Foobar Wiki"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.nginx.hostName` {#opt-services.mediawiki.nginx.hostName}

The hostname to use for the nginx virtual host.
This is used to generate the nginx configuration.

*Type:* string

*Default:* `"localhost"`

*Example:* `wiki.example.com`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.package` {#opt-services.mediawiki.package}

The mediawiki package to use.

*Type:* package

*Default:* `pkgs.mediawiki`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.passwordFile` {#opt-services.mediawiki.passwordFile}

A file containing the initial password for the administrator account "admin".

*Type:* absolute path

*Example:* `"/run/keys/mediawiki-password"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.passwordSender` {#opt-services.mediawiki.passwordSender}

Contact address for password reset.

*Type:* string

*Default:*

``` nix
if cfg.webserver == "apache" then
  if cfg.httpd.virtualHost.adminAddr != null then
    cfg.httpd.virtualHost.adminAddr
  else
    config.services.httpd.adminAddr else "root@localhost"
```

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.path` {#opt-services.mediawiki.path}

Extra packages to add to the PATH of phpfpm-pool.

*Type:* list of package

*Default:* `with pkgs; [ diffutils imagemagick ]`

*Example:* `with pkgs; [ librsvg ]`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.phpPackage` {#opt-services.mediawiki.phpPackage}

The php package to use.

*Type:* package

*Default:* `pkgs.php`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.poolConfig` {#opt-services.mediawiki.poolConfig}

Options for the MediaWiki PHP pool. See the documentation on `php-fpm.conf`
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

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.skins` {#opt-services.mediawiki.skins}

Attribute set of paths whose content is copied to the `skins`
subdirectory of the MediaWiki installation in addition to the default skins.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.uploadsDir` {#opt-services.mediawiki.uploadsDir}

This directory is used for uploads of pictures. The directory passed here is automatically
created and permissions adjusted as required.

*Type:* null or absolute path

*Default:* `"/var/lib/mediawiki/uploads"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.url` {#opt-services.mediawiki.url}

URL of the wiki.

*Type:* string

*Default:*

``` nix
''
  if "mediawiki uses ssl" then "{"https" else "http"}://''${cfg.hostName}" else "http://localhost";
''
```

*Example:* `"https://wiki.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.mediawiki.webserver` {#opt-services.mediawiki.webserver}

Webserver to use.

*Type:* one of "apache", "none", "nginx"

*Default:* `"apache"`

*Declared by:* [`nixos/modules/services/web-apps/mediawiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mediawiki.nix)

## `services.meilisearch.enable` {#opt-services.meilisearch.enable}

Whether to enable Meilisearch - a RESTful search API.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/search/meilisearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/meilisearch.nix)

## `services.meilisearch.listenAddress` {#opt-services.meilisearch.listenAddress}

The IP address that Meilisearch will listen on.

It can also be a hostname like "localhost". If it resolves to an IPv4 and IPv6 address, Meilisearch will listen on both.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/search/meilisearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/meilisearch.nix)

## `services.meilisearch.listenPort` {#opt-services.meilisearch.listenPort}

The port that Meilisearch will listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `7700`

*Declared by:* [`nixos/modules/services/search/meilisearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/meilisearch.nix)

## `services.meilisearch.masterKeyFile` {#opt-services.meilisearch.masterKeyFile}

Path to file which contains the master key.
By doing so, all routes will be protected and will require a key to be accessed.
If no master key is provided, all routes can be accessed without requiring any key.

You can generate a master key by running `openssl rand -base64 36`.
Alternatively, you can start Meilisearch without a master key and use the pre-generated key from the service's logs that can be obtained by `journalctl -u meilisearch | grep -- --master-key`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/search/meilisearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/meilisearch.nix)

## `services.meilisearch.package` {#opt-services.meilisearch.package}

The meilisearch package to use. Use this if you require specific features to be enabled. The default package has no features.

*Type:* package

*Default:* `pkgs.meilisearch`

*Declared by:* [`nixos/modules/services/search/meilisearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/meilisearch.nix)

## `services.meilisearch.settings` {#opt-services.meilisearch.settings}

Configuration settings for Meilisearch.
Look at the documentation for available options:
https://github.com/meilisearch/meilisearch/blob/main/config.toml
https://www.meilisearch.com/docs/learn/self\_hosted/configure\_meilisearch\_at\_launch#all-instance-options

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/search/meilisearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/meilisearch.nix)

## `services.memcached.enable` {#opt-services.memcached.enable}

Whether to enable Memcached.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/memcached.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/memcached.nix)

## `services.memcached.enableUnixSocket` {#opt-services.memcached.enableUnixSocket}

Whether to enable Unix Domain Socket at /run/memcached/memcached.sock instead of listening on an IP address and port. The `listen` and `port` options are ignored.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/memcached.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/memcached.nix)

## `services.memcached.extraOptions` {#opt-services.memcached.extraOptions}

A list of extra options that will be added as a suffix when running memcached.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/databases/memcached.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/memcached.nix)

## `services.memcached.listen` {#opt-services.memcached.listen}

The IP address to bind to.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/databases/memcached.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/memcached.nix)

## `services.memcached.maxConnections` {#opt-services.memcached.maxConnections}

The maximum number of simultaneous connections.

*Type:* unsigned integer, meaning \>=0

*Default:* `1024`

*Declared by:* [`nixos/modules/services/databases/memcached.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/memcached.nix)

## `services.memcached.maxMemory` {#opt-services.memcached.maxMemory}

The maximum amount of memory to use for storage, in MiB (1024×1024 bytes).

*Type:* unsigned integer, meaning \>=0

*Default:* `64`

*Declared by:* [`nixos/modules/services/databases/memcached.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/memcached.nix)

## `services.memcached.port` {#opt-services.memcached.port}

The port to bind to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `11211`

*Declared by:* [`nixos/modules/services/databases/memcached.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/memcached.nix)

## `services.memcached.user` {#opt-services.memcached.user}

The user to run Memcached as

*Type:* string

*Default:* `"memcached"`

*Declared by:* [`nixos/modules/services/databases/memcached.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/memcached.nix)

## `services.meme-bingo-web.address` {#opt-services.meme-bingo-web.address}

The address the webserver will bind to.

*Type:* string

*Default:* `"localhost"`

*Example:* `"::"`

*Declared by:* [`nixos/modules/services/web-apps/meme-bingo-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/meme-bingo-web.nix)

## `services.meme-bingo-web.baseUrl` {#opt-services.meme-bingo-web.baseUrl}

URL to be used for the HTML \<base\> element on all HTML routes.

*Type:* string

*Default:* `"http://localhost:41678/"`

*Example:* `"https://bingo.example.com/"`

*Declared by:* [`nixos/modules/services/web-apps/meme-bingo-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/meme-bingo-web.nix)

## `services.meme-bingo-web.enable` {#opt-services.meme-bingo-web.enable}

Whether to enable a web app for the meme bingo, rendered entirely on the web server and made interactive with forms.

Note: The application's author suppose to run meme-bingo-web behind a reverse proxy for SSL and HTTP/3
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/meme-bingo-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/meme-bingo-web.nix)

## `services.meme-bingo-web.openFirewall` {#opt-services.meme-bingo-web.openFirewall}

Whether to enable Opens the specified port in the firewall.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/meme-bingo-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/meme-bingo-web.nix)

## `services.meme-bingo-web.package` {#opt-services.meme-bingo-web.package}

The meme-bingo-web package to use.

*Type:* package

*Default:* `pkgs.meme-bingo-web`

*Declared by:* [`nixos/modules/services/web-apps/meme-bingo-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/meme-bingo-web.nix)

## `services.meme-bingo-web.port` {#opt-services.meme-bingo-web.port}

Port to be used for the web server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `41678`

*Example:* `21035`

*Declared by:* [`nixos/modules/services/web-apps/meme-bingo-web.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/meme-bingo-web.nix)

## `services.memgraph.enable` {#opt-services.memgraph.enable}

Whether to enable High-performance open-source in-memory graph database.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/memgraph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/memgraph.nix)

## `services.memgraph.environmentFile` {#opt-services.memgraph.environmentFile}

Path to environment file containing secrets like MEMGRAPH\_USER or MEMGRAPH\_PASSWORD.
[`services.memgraph.settings`](#opt-services.memgraph.settings) take precedence over these

See [https://memgraph.com/docs/database-management/configuration#environment-variables](https://memgraph.com/docs/database-management/configuration#environment-variables)

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/memgraph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/memgraph.nix)

## `services.memgraph.openFirewall` {#opt-services.memgraph.openFirewall}

Whether to open the ports configured in [`services.memgraph.settings`](#opt-services.memgraph.settings) on the firewall.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/memgraph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/memgraph.nix)

## `services.memgraph.package` {#opt-services.memgraph.package}

The memgraph package to use.

*Type:* package

*Default:* `pkgs.memgraph`

*Declared by:* [`nixos/modules/services/databases/memgraph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/memgraph.nix)

## `services.memgraph.settings` {#opt-services.memgraph.settings}

See [https://memgraph.com/docs/database-management/configuration#list-of-configuration-flags](https://memgraph.com/docs/database-management/configuration#list-of-configuration-flags)

*Type:* open submodule of attribute set of (string or signed integer or absolute path or boolean)

*Default:* `{ }`

*Example:*

``` nix
{
  telemetry-enabled = false;
  init-file = ./create_users.cypherl;
}
```

*Declared by:* [`nixos/modules/services/databases/memgraph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/memgraph.nix)

## `services.memgraph.settings.bolt-address` {#opt-services.memgraph.settings.bolt-address}

IP address on which the Bolt server should listen

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/databases/memgraph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/memgraph.nix)

## `services.memgraph.settings.bolt-port` {#opt-services.memgraph.settings.bolt-port}

Port on which the Bolt server should listen

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `7687`

*Declared by:* [`nixos/modules/services/databases/memgraph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/memgraph.nix)

## `services.memgraph.settings.data-directory` {#opt-services.memgraph.settings.data-directory}

Path to directory in which to save all permanent data

*Type:* absolute path

*Default:* `"/var/lib/memgraph"`

*Read only*

*Declared by:* [`nixos/modules/services/databases/memgraph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/memgraph.nix)

## `services.memgraph.settings.metrics-address` {#opt-services.memgraph.settings.metrics-address}

Host for HTTP server for exposing metrics

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/databases/memgraph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/memgraph.nix)

## `services.memgraph.settings.metrics-port` {#opt-services.memgraph.settings.metrics-port}

Port for HTTP server for exposing metrics

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9091`

*Declared by:* [`nixos/modules/services/databases/memgraph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/memgraph.nix)

## `services.memgraph.settings.monitoring-address` {#opt-services.memgraph.settings.monitoring-address}

IP address where the Memgraph's monitoring WebSocket server should listen

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/databases/memgraph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/memgraph.nix)

## `services.memgraph.settings.monitoring-port` {#opt-services.memgraph.settings.monitoring-port}

Port on which the Memgraph's monitoring WebSocket server should listen

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `7444`

*Declared by:* [`nixos/modules/services/databases/memgraph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/memgraph.nix)

## `services.memos.dataDir` {#opt-services.memos.dataDir}

Specifies the directory where Memos will store its data.

::: note
It will be automatically created with the permissions of \[[`services.memos.user`](#opt-services.memos.user)\](#opt-services.memos.user) and \[[`services.memos.group`](#opt-services.memos.group)\](#opt-services.memos.group).
:::

*Type:* absolute path

*Default:* `"/var/lib/memos/"`

*Declared by:* [`nixos/modules/services/misc/memos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/memos.nix)

## `services.memos.enable` {#opt-services.memos.enable}

Whether to enable Memos note-taking.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/memos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/memos.nix)

## `services.memos.environmentFile` {#opt-services.memos.environmentFile}

The environment file to use when starting Memos.

::: note
By default, generated from [](../../opt-services.memos.settings).
:::

*Type:* absolute path

*Default:* generated from [`services.memos.settings`](#opt-services.memos.settings)

*Example:* `"/var/lib/memos/memos.env"`

*Declared by:* [`nixos/modules/services/misc/memos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/memos.nix)

## `services.memos.group` {#opt-services.memos.group}

The group to run Memos as.

::: note
If changing the default value, **you** are responsible of creating the corresponding group with \[[`users.groups`](../../options/users/index.md#opt-users.groups)\](#opt-users.groups).
:::

*Type:* string

*Default:* `"memos"`

*Declared by:* [`nixos/modules/services/misc/memos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/memos.nix)

## `services.memos.openFirewall` {#opt-services.memos.openFirewall}

Whether to enable opening the ports in the firewall.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/memos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/memos.nix)

## `services.memos.package` {#opt-services.memos.package}

The Memos package to use.

*Type:* package

*Default:* `pkgs.memos`

*Declared by:* [`nixos/modules/services/misc/memos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/memos.nix)

## `services.memos.settings` {#opt-services.memos.settings}

The environment variables to configure Memos.

::: note
At time of writing, there is no clear documentation about possible values.
It's possible to convert CLI flags into these variables.
Example : CLI flag "--unix-sock" converts to `MEMOS_UNIX_SOCK`.
:::

*Type:* attribute set of (atom (null, bool, int, float or string))

*Default:*

``` nix
{
  MEMOS_MODE = "prod";
  MEMOS_ADDR = "127.0.0.1";
  MEMOS_PORT = "5230";
  MEMOS_DATA = config.services.memos.dataDir;
  MEMOS_DRIVER = "sqlite";
  MEMOS_INSTANCE_URL = "http://localhost:5230";
}
```

*Declared by:* [`nixos/modules/services/misc/memos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/memos.nix)

## `services.memos.user` {#opt-services.memos.user}

The user to run Memos as.

::: note
If changing the default value, **you** are responsible of creating the corresponding user with \[[`users.users`](../../options/users/index.md#opt-users.users)\](#opt-users.users).
:::

*Type:* string

*Default:* `"memos"`

*Declared by:* [`nixos/modules/services/misc/memos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/memos.nix)

## `services.merecat.enable` {#opt-services.merecat.enable}

Whether to enable Merecat HTTP server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/merecat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/merecat.nix)

## `services.merecat.settings` {#opt-services.merecat.settings}

Merecat configuration. Refer to `merecat(8)` for details on supported values.

*Type:* attribute set of (atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  directory = "/srv/www";
  hostname = "localhost";
  port = 8080;
  virtual-host = true;
}
```

*Declared by:* [`nixos/modules/services/web-servers/merecat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/merecat.nix)

## `services.mesh-llm.allowRuntimeDownloads` {#opt-services.mesh-llm.allowRuntimeDownloads}

Whether MeshLLM may download prebuilt native runtimes at startup when
the package's runtime does not fit the host. Off, it uses only the
runtime built by Nix and doesn't fetch its runtime catalog from GitHub.
On, MeshLLM's own `runtime.native_runtime.download` setting decides,
which defaults to downloading.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/mesh-llm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mesh-llm.nix)

## `services.mesh-llm.enable` {#opt-services.mesh-llm.enable}

Whether to enable a MeshLLM node.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/mesh-llm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mesh-llm.nix)

## `services.mesh-llm.environmentFiles` {#opt-services.mesh-llm.environmentFiles}

Environment files for secrets, such as `HF_TOKEN` for gated models.

*Type:* list of absolute path not in the Nix store

*Default:* `[ ]`

*Example:*

``` nix
[
  "/run/secrets/mesh-llm.env"
]
```

*Declared by:* [`nixos/modules/services/misc/mesh-llm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mesh-llm.nix)

## `services.mesh-llm.extraArgs` {#opt-services.mesh-llm.extraArgs}

Extra arguments for `mesh-llm serve`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--auto"
  "--publish"
]
```

*Declared by:* [`nixos/modules/services/misc/mesh-llm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mesh-llm.nix)

## `services.mesh-llm.joinTokenFile` {#opt-services.mesh-llm.joinTokenFile}

Invite token of a private mesh to join. The service reads it as a
systemd credential, so the file can stay readable only by root. To
change the token, replace the file and restart `mesh-llm.service`.

*Type:* null or absolute path not in the Nix store

*Default:* `null`

*Example:* `"/run/secrets/mesh-llm-invite-token"`

*Declared by:* [`nixos/modules/services/misc/mesh-llm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mesh-llm.nix)

## `services.mesh-llm.meshPort` {#opt-services.mesh-llm.meshPort}

UDP port for the mesh's QUIC traffic between nodes. `null` lets
MeshLLM pick a random port, which works behind NAT but can't be opened
in a firewall.

*Type:* null or integer between 1 and 65535 (both inclusive)

*Default:* `null`

*Example:* `7842`

*Declared by:* [`nixos/modules/services/misc/mesh-llm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mesh-llm.nix)

## `services.mesh-llm.openFirewall` {#opt-services.mesh-llm.openFirewall}

Whether to open [services (M)](#opt-services.mesh-llm.meshPort) (UDP) for other nodes.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/mesh-llm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mesh-llm.nix)

## `services.mesh-llm.ownerKeyFile` {#opt-services.mesh-llm.ownerKeyFile}

Owner keystore created with `mesh-llm auth init`. It attests that this
node belongs to its owner, for meshes that admit only owned nodes
(`--trust-policy` in [services (M)](#opt-services.mesh-llm.extraArgs)), and lets
the console save configuration. The service reads it as a systemd
credential and doesn't start if it can't load it. Put the passphrase
of an encrypted keystore in `MESH_LLM_OWNER_PASSPHRASE` in
[services (M)](#opt-services.mesh-llm.environmentFiles).

*Type:* null or absolute path not in the Nix store

*Default:* `null`

*Example:* `"/run/secrets/mesh-llm-owner-keystore.json"`

*Declared by:* [`nixos/modules/services/misc/mesh-llm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mesh-llm.nix)

## `services.mesh-llm.package` {#opt-services.mesh-llm.package}

The mesh-llm package to use. The native runtime it bundles decides the GPU backend the node can use.

*Type:* package

*Default:* `pkgs.mesh-llm`

*Example:* `pkgs.mesh-llm.override { skippy-native-runtime = pkgs.skippy-native-runtime.override { vulkanSupport = true; }; }`

*Declared by:* [`nixos/modules/services/misc/mesh-llm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mesh-llm.nix)

## `services.mesh-llm.settings` {#opt-services.mesh-llm.settings}

MeshLLM configuration (`~/.mesh-llm/config.toml`), such as the models
to serve. When set, it replaces the file at every start, so changes
made in the console are lost. When empty, MeshLLM manages the file.
It ends up in the Nix store; put secrets in
[services (M)](#opt-services.mesh-llm.environmentFiles) instead.

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  models = [
    {
      model = "Qwen3-8B-Q4_K_M";
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/misc/mesh-llm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mesh-llm.nix)

## `services.meshcentral.enable` {#opt-services.meshcentral.enable}

Whether to enable MeshCentral computer management server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/admin/meshcentral.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/meshcentral.nix)

## `services.meshcentral.package` {#opt-services.meshcentral.package}

The meshcentral package to use.

*Type:* package

*Default:* `pkgs.meshcentral`

*Declared by:* [`nixos/modules/services/admin/meshcentral.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/meshcentral.nix)

## `services.meshcentral.settings` {#opt-services.meshcentral.settings}

Settings for MeshCentral. Refer to upstream documentation for details:

- [JSON Schema definition](https://github.com/Ylianst/MeshCentral/blob/master/meshcentral-config-schema.json)
- [simple sample configuration](https://github.com/Ylianst/MeshCentral/blob/master/sample-config.json)
- [complex sample configuration](https://github.com/Ylianst/MeshCentral/blob/master/sample-config-advanced.json)
- [Old homepage with documentation link](https://www.meshcommander.com/meshcentral2)

*Type:* open submodule of attribute set of (JSON value)

*Example:*

``` nix
{
  domains = {
    "" = {
      certUrl = "https://meshcentral.example.com/";
    };
  };
  settings = {
    Cert = "meshcentral.example.com";
    Port = 4430;
    TlsOffload = "10.0.0.2,fd42::2";
    WANonly = true;
  };
}
```

*Declared by:* [`nixos/modules/services/admin/meshcentral.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/meshcentral.nix)

## `services.meshtasticd.dataDir` {#opt-services.meshtasticd.dataDir}

The data directory.

*Type:* absolute path

*Default:* `"/var/lib/meshtasticd"`

*Declared by:* [`nixos/modules/services/networking/meshtasticd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/meshtasticd.nix)

## `services.meshtasticd.enable` {#opt-services.meshtasticd.enable}

Whether to enable Meshtastic daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/meshtasticd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/meshtasticd.nix)

## `services.meshtasticd.group` {#opt-services.meshtasticd.group}

Group meshtasticd runs as.

*Type:* string

*Default:* `"meshtasticd"`

*Declared by:* [`nixos/modules/services/networking/meshtasticd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/meshtasticd.nix)

## `services.meshtasticd.package` {#opt-services.meshtasticd.package}

The meshtasticd package to use.

*Type:* package

*Default:* `pkgs.meshtasticd`

*Declared by:* [`nixos/modules/services/networking/meshtasticd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/meshtasticd.nix)

## `services.meshtasticd.port` {#opt-services.meshtasticd.port}

Port to listen on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4403`

*Declared by:* [`nixos/modules/services/networking/meshtasticd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/meshtasticd.nix)

## `services.meshtasticd.settings` {#opt-services.meshtasticd.settings}

The Meshtastic configuration file.

An example of configuration can be found at [https://github.com/meshtastic/firmware/blob/develop/bin/config-dist.yaml](https://github.com/meshtastic/firmware/blob/develop/bin/config-dist.yaml)

*Type:* YAML 1.1 value

*Default:* `null`

*Example:*

``` nix
Lora = {
  Module = "auto";
};
Webserver = {
  Port = 9443;
  RootPath = pkgs.meshtastic-web;
};
General = {
  MaxNodes = 200;
  MaxMessageQueue = 100;
  MACAddressSource = "eth0";
};
```

*Declared by:* [`nixos/modules/services/networking/meshtasticd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/meshtasticd.nix)

## `services.meshtasticd.user` {#opt-services.meshtasticd.user}

User meshtasticd runs as.

*Type:* string

*Default:* `"meshtasticd"`

*Declared by:* [`nixos/modules/services/networking/meshtasticd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/meshtasticd.nix)

## `services.metabase.enable` {#opt-services.metabase.enable}

Whether to enable Metabase service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/metabase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/metabase.nix)

## `services.metabase.listen.ip` {#opt-services.metabase.listen.ip}

IP address that Metabase should listen on.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/metabase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/metabase.nix)

## `services.metabase.listen.port` {#opt-services.metabase.listen.port}

Listen port for Metabase.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/misc/metabase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/metabase.nix)

## `services.metabase.openFirewall` {#opt-services.metabase.openFirewall}

Open ports in the firewall for Metabase.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/metabase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/metabase.nix)

## `services.metabase.package` {#opt-services.metabase.package}

The metabase package to use.

*Type:* package

*Default:* `pkgs.metabase`

*Declared by:* [`nixos/modules/services/misc/metabase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/metabase.nix)

## `services.metabase.ssl.enable` {#opt-services.metabase.ssl.enable}

Whether to enable SSL (https) support.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/metabase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/metabase.nix)

## `services.metabase.ssl.keystore` {#opt-services.metabase.ssl.keystore}

[Java KeyStore](https://www.digitalocean.com/community/tutorials/java-keytool-essentials-working-with-java-keystores) file containing the certificates.

*Type:* null or absolute path

*Default:* `"/var/lib/metabase/metabase.jks"`

*Example:* `"/etc/secrets/keystore.jks"`

*Declared by:* [`nixos/modules/services/misc/metabase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/metabase.nix)

## `services.metabase.ssl.port` {#opt-services.metabase.ssl.port}

Listen port over SSL (https) for Metabase.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8443`

*Declared by:* [`nixos/modules/services/misc/metabase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/metabase.nix)

## `services.metricbeat.enable` {#opt-services.metricbeat.enable}

Whether to enable metricbeat.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/metricbeat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/metricbeat.nix)

## `services.metricbeat.modules` {#opt-services.metricbeat.modules}

Metricbeat modules are responsible for reading metrics from the various sources.

This is like `services.metricbeat.settings.metricbeat.modules`,
but structured as an attribute set. This has the benefit that multiple
NixOS modules can contribute settings to a single metricbeat module.

A module can be specified multiple times by choosing a different `<name>`
for each, but setting [services (M)](#opt-services.metricbeat.modules._name_.module) to the same value.

See [https://www.elastic.co/guide/en/beats/metricbeat/current/metricbeat-modules.html](https://www.elastic.co/guide/en/beats/metricbeat/current/metricbeat-modules.html).

*Type:* attribute set of (open submodule of (YAML 1.1 value))

*Default:* `{ }`

*Example:*

``` nix
{
  system = {
    core = {
      metrics = [
        "percentages"
      ];
    };
    cpu = {
      metrics = [
        "percentages"
        "normalized_percentages"
      ];
    };
    enabled = true;
    metricsets = [
      "cpu"
      "load"
      "memory"
      "network"
      "process"
      "process_summary"
      "uptime"
      "socket_summary"
    ];
    period = "10s";
    processes = [
      ".*"
    ];
  };
}
```

*Declared by:* [`nixos/modules/services/monitoring/metricbeat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/metricbeat.nix)

## `services.metricbeat.modules.<name>.module` {#opt-services.metricbeat.modules._name_.module}

The name of the module.

Look for the value after `module:` on the individual
module pages linked from [https://www.elastic.co/guide/en/beats/metricbeat/current/metricbeat-modules.html](https://www.elastic.co/guide/en/beats/metricbeat/current/metricbeat-modules.html).

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/monitoring/metricbeat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/metricbeat.nix)

## `services.metricbeat.package` {#opt-services.metricbeat.package}

The metricbeat package to use.

*Type:* package

*Default:* `pkgs.metricbeat`

*Example:* `metricbeat7`

*Declared by:* [`nixos/modules/services/monitoring/metricbeat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/metricbeat.nix)

## `services.metricbeat.settings` {#opt-services.metricbeat.settings}

Configuration for metricbeat. See [https://www.elastic.co/guide/en/beats/metricbeat/current/configuring-howto-metricbeat.html](https://www.elastic.co/guide/en/beats/metricbeat/current/configuring-howto-metricbeat.html) for supported values.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/metricbeat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/metricbeat.nix)

## `services.metricbeat.settings.name` {#opt-services.metricbeat.settings.name}

Name of the beat. Defaults to the hostname.
See [https://www.elastic.co/guide/en/beats/metricbeat/current/configuration-general-options.html#\_name](https://www.elastic.co/guide/en/beats/metricbeat/current/configuration-general-options.html#_name).

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/metricbeat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/metricbeat.nix)

## `services.metricbeat.settings.tags` {#opt-services.metricbeat.settings.tags}

Tags to place on the shipped metrics.
See [https://www.elastic.co/guide/en/beats/metricbeat/current/configuration-general-options.html#\_tags\_2](https://www.elastic.co/guide/en/beats/metricbeat/current/configuration-general-options.html#_tags_2).

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/metricbeat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/metricbeat.nix)

## `services.microbin.dataDir` {#opt-services.microbin.dataDir}

Default data folder for MicroBin.

*Type:* string

*Default:* `"/var/lib/microbin"`

*Declared by:* [`nixos/modules/services/web-apps/microbin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/microbin.nix)

## `services.microbin.enable` {#opt-services.microbin.enable}

Whether to enable MicroBin is a super tiny, feature rich, configurable paste bin web application.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/microbin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/microbin.nix)

## `services.microbin.package` {#opt-services.microbin.package}

The microbin package to use.

*Type:* package

*Default:* `pkgs.microbin`

*Declared by:* [`nixos/modules/services/web-apps/microbin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/microbin.nix)

## `services.microbin.passwordFile` {#opt-services.microbin.passwordFile}

Path to file containing environment variables.
Useful for passing down secrets.
Variables that can be considered secrets are:

- MICROBIN\_BASIC\_AUTH\_USERNAME
- MICROBIN\_BASIC\_AUTH\_PASSWORD
- MICROBIN\_ADMIN\_USERNAME
- MICROBIN\_ADMIN\_PASSWORD
- MICROBIN\_UPLOADER\_PASSWORD

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/microbin.env"`

*Declared by:* [`nixos/modules/services/web-apps/microbin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/microbin.nix)

## `services.microbin.settings` {#opt-services.microbin.settings}

Additional configuration for MicroBin, see
[https://microbin.eu/docs/installation-and-configuration/configuration/](https://microbin.eu/docs/installation-and-configuration/configuration/)
for supported values.

For secrets use passwordFile option instead.

*Type:* open submodule of attribute set of (boolean or signed integer or string)

*Default:* `{ }`

*Example:*

``` nix
{
  MICROBIN_HIDE_LOGO = false;
  MICROBIN_PORT = 8080;
}
```

*Declared by:* [`nixos/modules/services/web-apps/microbin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/microbin.nix)

## `services.microsocks.authOnce` {#opt-services.microsocks.authOnce}

If true, once a specific ip address authed successfully with user/pass,
it is added to a whitelist and may use the proxy without auth.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/microsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/microsocks.nix)

## `services.microsocks.authPasswordFile` {#opt-services.microsocks.authPasswordFile}

Path to a file containing the password for authentication.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/microsocks-password"`

*Declared by:* [`nixos/modules/services/networking/microsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/microsocks.nix)

## `services.microsocks.authUsername` {#opt-services.microsocks.authUsername}

Optional username to use for authentication.

*Type:* null or string

*Default:* `null`

*Example:* `"alice"`

*Declared by:* [`nixos/modules/services/networking/microsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/microsocks.nix)

## `services.microsocks.disableLogging` {#opt-services.microsocks.disableLogging}

If true, microsocks will not log any messages to stdout/stderr.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/microsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/microsocks.nix)

## `services.microsocks.enable` {#opt-services.microsocks.enable}

Whether to enable Tiny, portable SOCKS5 server with very moderate resource usage.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/microsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/microsocks.nix)

## `services.microsocks.execWrapper` {#opt-services.microsocks.execWrapper}

An optional command to prepend to the microsocks command (such as proxychains, or a VPN exclude command).

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
''
  ''${pkgs.mullvad-vpn}/bin/mullvad-exclude
''
```

*Declared by:* [`nixos/modules/services/networking/microsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/microsocks.nix)

## `services.microsocks.group` {#opt-services.microsocks.group}

Group microsocks runs as.

*Type:* string

*Default:* `"microsocks"`

*Declared by:* [`nixos/modules/services/networking/microsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/microsocks.nix)

## `services.microsocks.ip` {#opt-services.microsocks.ip}

IP on which microsocks should listen. Defaults to 127.0.0.1 for
security reasons.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/microsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/microsocks.nix)

## `services.microsocks.outgoingBindIp` {#opt-services.microsocks.outgoingBindIp}

Specifies which ip outgoing connections are bound to

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/microsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/microsocks.nix)

## `services.microsocks.package` {#opt-services.microsocks.package}

The microsocks package to use.

*Type:* package

*Default:* `pkgs.microsocks`

*Declared by:* [`nixos/modules/services/networking/microsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/microsocks.nix)

## `services.microsocks.port` {#opt-services.microsocks.port}

Port on which microsocks should listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1080`

*Declared by:* [`nixos/modules/services/networking/microsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/microsocks.nix)

## `services.microsocks.user` {#opt-services.microsocks.user}

User microsocks runs as.

*Type:* string

*Default:* `"microsocks"`

*Declared by:* [`nixos/modules/services/networking/microsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/microsocks.nix)

## `services.mighttpd2.config` {#opt-services.mighttpd2.config}

Verbatim config file to use
(see [https://kazu-yamamoto.github.io/mighttpd2/config.html](https://kazu-yamamoto.github.io/mighttpd2/config.html))

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  # Example configuration for Mighttpd 2
  Port: 80
  # IP address or "*"
  Host: *
  Debug_Mode: Yes # Yes or No
  User: mighttpd2
  Group: mighttpd2
  Pid_File: /run/mighty.pid
  Logging: Yes # Yes or No
  Log_File: /var/log/mighty # The directory must be writable by User:
  Log_File_Size: 16777216 # bytes
  Log_Backup_Number: 10
  Index_File: index.html
  Index_Cgi: index.cgi
  Status_File_Dir: /usr/local/share/mighty/status
  Connection_Timeout: 30 # seconds
  Fd_Cache_Duration: 10 # seconds
  # Server_Name: Mighttpd/3.x.y
  Tls_Port: 443
  Tls_Cert_File: cert.pem # should change this with an absolute path
  # should change this with comma-separated absolute paths
  Tls_Chain_Files: chain.pem
  # Currently, Tls_Key_File must not be encrypted.
  Tls_Key_File: privkey.pem # should change this with an absolute path
  Service: 0 # 0 is HTTP only, 1 is HTTPS only, 2 is both
''
```

*Declared by:* [`nixos/modules/services/web-servers/mighttpd2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/mighttpd2.nix)

## `services.mighttpd2.cores` {#opt-services.mighttpd2.cores}

How many cores to use.
If null it will be determined automatically

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/mighttpd2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/mighttpd2.nix)

## `services.mighttpd2.enable` {#opt-services.mighttpd2.enable}

Whether to enable Mighttpd2 web server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/mighttpd2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/mighttpd2.nix)

## `services.mighttpd2.routing` {#opt-services.mighttpd2.routing}

Verbatim routing file to use
(see [https://kazu-yamamoto.github.io/mighttpd2/config.html](https://kazu-yamamoto.github.io/mighttpd2/config.html))

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  # Example routing for Mighttpd 2
  
  # Domain lists
  [localhost www.example.com]
  
  # Entries are looked up in the specified order
  # All paths must end with "/"
  
  # A path to CGI scripts should be specified with "=>"
  /~alice/cgi-bin/ => /home/alice/public_html/cgi-bin/
  
  # A path to static files should be specified with "->"
  /~alice/         -> /home/alice/public_html/
  /cgi-bin/        => /export/cgi-bin/
  
  # Reverse proxy rules should be specified with ">>"
  # /path >> host:port/path2
  # Either "host" or ":port" can be committed, but not both.
  /app/cal/        >> example.net/calendar/
  # Yesod app in the same server
  /app/wiki/       >> 127.0.0.1:3000/
  
  /                -> /export/www/
''
```

*Declared by:* [`nixos/modules/services/web-servers/mighttpd2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/mighttpd2.nix)

## `services.mihomo.configFile` {#opt-services.mihomo.configFile}

Configuration file to use.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/networking/mihomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mihomo.nix)

## `services.mihomo.enable` {#opt-services.mihomo.enable}

Whether to enable Mihomo, A rule-based proxy in Go.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/mihomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mihomo.nix)

## `services.mihomo.extraOpts` {#opt-services.mihomo.extraOpts}

Extra command line options to use.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/mihomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mihomo.nix)

## `services.mihomo.package` {#opt-services.mihomo.package}

The mihomo package to use.

*Type:* package

*Default:* `pkgs.mihomo`

*Declared by:* [`nixos/modules/services/networking/mihomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mihomo.nix)

## `services.mihomo.processesInfo` {#opt-services.mihomo.processesInfo}

Whether to enable necessary capabilities for rules about process information such as `process-name`
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/mihomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mihomo.nix)

## `services.mihomo.tunMode` {#opt-services.mihomo.tunMode}

Whether to enable necessary capabilities for Mihomo's systemd service for TUN mode to function properly.

Keep in mind, that you still need to enable TUN mode manually in Mihomo's configuration
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/mihomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mihomo.nix)

## `services.mihomo.webui` {#opt-services.mihomo.webui}

Local web interface to use.

You can also use the following website:

- metacubexd:
  - [https://d.metacubex.one](https://d.metacubex.one)
  - [https://metacubex.github.io/metacubexd](https://metacubex.github.io/metacubexd)
  - [https://metacubexd.pages.dev](https://metacubexd.pages.dev)
- yacd:
  - [https://yacd.haishan.me](https://yacd.haishan.me)
- clash-dashboard:
  - [https://clash.razord.top](https://clash.razord.top)

*Type:* null or absolute path

*Default:* `null`

*Example:* `pkgs.metacubexd`

*Declared by:* [`nixos/modules/services/networking/mihomo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mihomo.nix)

## `services.mimir.configFile` {#opt-services.mimir.configFile}

Specify a configuration file that Mimir should use.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/mimir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/mimir.nix)

## `services.mimir.configuration` {#opt-services.mimir.configuration}

Specify the configuration for Mimir in Nix.

*Type:* JSON value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/mimir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/mimir.nix)

## `services.mimir.enable` {#opt-services.mimir.enable}

Whether to enable mimir.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/mimir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/mimir.nix)

## `services.mimir.extraFlags` {#opt-services.mimir.extraFlags}

Specify a list of additional command line flags,
which get escaped and are then passed to Mimir.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--config.expand-env=true"
]
```

*Declared by:* [`nixos/modules/services/monitoring/mimir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/mimir.nix)

## `services.mimir.package` {#opt-services.mimir.package}

The mimir package to use.

*Type:* package

*Default:* `pkgs.mimir`

*Declared by:* [`nixos/modules/services/monitoring/mimir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/mimir.nix)

## `services.minecraft-server.dataDir` {#opt-services.minecraft-server.dataDir}

Directory to store Minecraft database and other state/data files.

*Type:* absolute path

*Default:* `"/var/lib/minecraft"`

*Declared by:* [`nixos/modules/services/games/minecraft-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/minecraft-server.nix)

## `services.minecraft-server.declarative` {#opt-services.minecraft-server.declarative}

Whether to use a declarative Minecraft server configuration.
Only if set to `true`, the options
[`services.minecraft-server.whitelist`](#opt-services.minecraft-server.whitelist) and
[`services.minecraft-server.serverProperties`](#opt-services.minecraft-server.serverProperties) will be
applied.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/minecraft-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/minecraft-server.nix)

## `services.minecraft-server.enable` {#opt-services.minecraft-server.enable}

If enabled, start a Minecraft Server. The server
data will be loaded from and saved to
[`services.minecraft-server.dataDir`](#opt-services.minecraft-server.dataDir).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/minecraft-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/minecraft-server.nix)

## `services.minecraft-server.eula` {#opt-services.minecraft-server.eula}

Whether you agree to [Mojangs EULA](https://www.minecraft.net/eula).
This option must be set to `true` to run Minecraft server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/minecraft-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/minecraft-server.nix)

## `services.minecraft-server.jvmOpts` {#opt-services.minecraft-server.jvmOpts}

JVM options for the Minecraft server.

*Type:* strings concatenated with " "

*Default:* `"-Xmx2048M -Xms2048M"`

*Example:* `"-Xms4092M -Xmx4092M -XX:+UseG1GC -XX:+CMSIncrementalPacing -XX:+CMSClassUnloadingEnabled -XX:ParallelGCThreads=2 -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10"`

*Declared by:* [`nixos/modules/services/games/minecraft-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/minecraft-server.nix)

## `services.minecraft-server.openFirewall` {#opt-services.minecraft-server.openFirewall}

Whether to open ports in the firewall for the server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/minecraft-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/minecraft-server.nix)

## `services.minecraft-server.package` {#opt-services.minecraft-server.package}

The minecraft-server package to use.

*Type:* package

*Default:* `pkgs.minecraft-server`

*Example:* `pkgs.minecraft-server_1_12_2`

*Declared by:* [`nixos/modules/services/games/minecraft-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/minecraft-server.nix)

## `services.minecraft-server.serverProperties` {#opt-services.minecraft-server.serverProperties}

Minecraft server properties for the server.properties file. Only has
an effect when [`services.minecraft-server.declarative`](#opt-services.minecraft-server.declarative)
is set to `true`. See
[https://minecraft.wiki/w/Server.properties#Java\_Edition](https://minecraft.wiki/w/Server.properties#Java_Edition)
for documentation on these values.

*Type:* attribute set of (boolean or signed integer or string)

*Default:* `{ }`

*Example:*

``` nix
{
  server-port = 43000;
  difficulty = 3;
  gamemode = 1;
  max-players = 5;
  motd = "NixOS Minecraft server!";
  white-list = true;
  enable-rcon = true;
  "rcon.password" = "hunter2";
}
```

*Declared by:* [`nixos/modules/services/games/minecraft-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/minecraft-server.nix)

## `services.minecraft-server.whitelist` {#opt-services.minecraft-server.whitelist}

Whitelisted players, only has an effect when
[`services.minecraft-server.declarative`](#opt-services.minecraft-server.declarative) is
`true` and the whitelist is enabled
via [`services.minecraft-server.serverProperties`](#opt-services.minecraft-server.serverProperties) by
setting `white-list` to `true`.
This is a mapping from Minecraft usernames to UUIDs.
You can use [https://mcuuid.net/](https://mcuuid.net/) to get a
Minecraft UUID for a username.

*Type:* attribute set of Minecraft UUID

*Default:* `{ }`

*Example:*

``` nix
{
  username1 = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx";
  username2 = "yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy";
};
```

*Declared by:* [`nixos/modules/services/games/minecraft-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/minecraft-server.nix)

## `services.minetest-server.config` {#opt-services.minetest-server.config}

Settings to add to the minetest config file.

This option is ignored if `configPath` is set.

*Type:* attribute set of anything

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/games/minetest-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/minetest-server.nix)

## `services.minetest-server.configPath` {#opt-services.minetest-server.configPath}

Path to the config to use.

If set to null, the config of the running user will be used:
`~/.minetest/minetest.conf`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/games/minetest-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/minetest-server.nix)

## `services.minetest-server.enable` {#opt-services.minetest-server.enable}

If enabled, starts a Minetest Server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/minetest-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/minetest-server.nix)

## `services.minetest-server.extraArgs` {#opt-services.minetest-server.extraArgs}

Additional command line flags to pass to the minetest executable.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/games/minetest-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/minetest-server.nix)

## `services.minetest-server.gameId` {#opt-services.minetest-server.gameId}

Id of the game to use. To list available games run
`minetestserver --gameid list`.

If only one game exists, this option can be null.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/games/minetest-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/minetest-server.nix)

## `services.minetest-server.logPath` {#opt-services.minetest-server.logPath}

Path to logfile for logging.

If set to null, logging will be output to stdout which means
all output will be caught by systemd.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/games/minetest-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/minetest-server.nix)

## `services.minetest-server.port` {#opt-services.minetest-server.port}

Port number to bind to.

If set to null, the default 30000 will be used.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/games/minetest-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/minetest-server.nix)

## `services.minetest-server.world` {#opt-services.minetest-server.world}

Name of the world to use. To list available worlds run
`minetestserver --world list`.

If only one world exists, this option can be null.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/games/minetest-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/minetest-server.nix)

## `services.minidlna.enable` {#opt-services.minidlna.enable}

Whether to enable MiniDLNA, a simple DLNA server. Consider adding `openFirewall = true` into your config.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/minidlna.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/minidlna.nix)

## `services.minidlna.openFirewall` {#opt-services.minidlna.openFirewall}

Whether to enable opening HTTP (TCP) and SSDP (UDP) ports in the firewall.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/minidlna.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/minidlna.nix)

## `services.minidlna.package` {#opt-services.minidlna.package}

The minidlna package to use.

*Type:* package

*Default:* `pkgs.minidlna`

*Declared by:* [`nixos/modules/services/networking/minidlna.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/minidlna.nix)

## `services.minidlna.settings` {#opt-services.minidlna.settings}

Configuration for `minidlna.conf(5)`.

*Type:* open submodule of attribute set of (atom (null, bool, int, float or string) or a list of them for duplicate keys)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/minidlna.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/minidlna.nix)

## `services.minidlna.settings.db_dir` {#opt-services.minidlna.settings.db_dir}

Specify the directory to store database and album art cache.

*Type:* absolute path

*Default:* `"/var/cache/minidlna"`

*Example:* `"/tmp/minidlna"`

*Declared by:* [`nixos/modules/services/networking/minidlna.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/minidlna.nix)

## `services.minidlna.settings.enable_subtitles` {#opt-services.minidlna.settings.enable_subtitles}

Enable subtitle support on unknown clients.

*Type:* one of "yes", "no"

*Default:* `"yes"`

*Declared by:* [`nixos/modules/services/networking/minidlna.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/minidlna.nix)

## `services.minidlna.settings.enable_tivo` {#opt-services.minidlna.settings.enable_tivo}

Support for streaming .jpg and .mp3 files to a TiVo supporting HMO.

*Type:* one of "yes", "no"

*Default:* `"no"`

*Declared by:* [`nixos/modules/services/networking/minidlna.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/minidlna.nix)

## `services.minidlna.settings.friendly_name` {#opt-services.minidlna.settings.friendly_name}

Name that the server presents to clients.

*Type:* string

*Default:* `config.networking.hostName`

*Example:* `"rpi3"`

*Declared by:* [`nixos/modules/services/networking/minidlna.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/minidlna.nix)

## `services.minidlna.settings.inotify` {#opt-services.minidlna.settings.inotify}

Whether to enable inotify monitoring to automatically discover new files.

*Type:* one of "yes", "no"

*Default:* `"no"`

*Declared by:* [`nixos/modules/services/networking/minidlna.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/minidlna.nix)

## `services.minidlna.settings.log_level` {#opt-services.minidlna.settings.log_level}

Defines the type of messages that should be logged and down to which level of importance.

*Type:* string

*Default:* `"warn"`

*Example:* `"general,artwork,database,inotify,scanner,metadata,http,ssdp,tivo=warn"`

*Declared by:* [`nixos/modules/services/networking/minidlna.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/minidlna.nix)

## `services.minidlna.settings.media_dir` {#opt-services.minidlna.settings.media_dir}

Directories to be scanned for media files.
The `A,` `V,` `P,` prefixes restrict a directory to audio, video or image files.
The directories must be accessible to the `minidlna` user account.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/data/media"
  "V,/home/alice/video"
]
```

*Declared by:* [`nixos/modules/services/networking/minidlna.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/minidlna.nix)

## `services.minidlna.settings.notify_interval` {#opt-services.minidlna.settings.notify_interval}

The interval between announces (in seconds).
Instead of waiting for announces, you should set `openFirewall` option to use SSDP discovery.
Lower values (e.g. 30 seconds) should be used if your network is blocking the SSDP multicast.
Some relevant information can be found [here](https://sourceforge.net/p/minidlna/discussion/879957/thread/1389d197/).

*Type:* signed integer

*Default:* `90000`

*Declared by:* [`nixos/modules/services/networking/minidlna.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/minidlna.nix)

## `services.minidlna.settings.port` {#opt-services.minidlna.settings.port}

Port number for HTTP traffic (descriptions, SOAP, media transfer).

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8200`

*Declared by:* [`nixos/modules/services/networking/minidlna.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/minidlna.nix)

## `services.minidlna.settings.root_container` {#opt-services.minidlna.settings.root_container}

Use a different container as the root of the directory tree presented to clients.

*Type:* string

*Default:* `"B"`

*Example:* `"."`

*Declared by:* [`nixos/modules/services/networking/minidlna.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/minidlna.nix)

## `services.minidlna.settings.wide_links` {#opt-services.minidlna.settings.wide_links}

Set this to yes to allow symlinks that point outside user-defined `media_dir`.

*Type:* one of "yes", "no"

*Default:* `"no"`

*Declared by:* [`nixos/modules/services/networking/minidlna.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/minidlna.nix)

## `services.miniflux.adminCredentialsFile` {#opt-services.miniflux.adminCredentialsFile}

File containing the ADMIN\_USERNAME and
ADMIN\_PASSWORD (length \>= 6) in the format of
an EnvironmentFile=, as described by `systemd.exec(5)`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/etc/nixos/miniflux-admin-credentials"`

*Declared by:* [`nixos/modules/services/web-apps/miniflux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/miniflux.nix)

## `services.miniflux.config` {#opt-services.miniflux.config}

Configuration for Miniflux, refer to
[https://miniflux.app/docs/configuration.html](https://miniflux.app/docs/configuration.html)
for documentation on the supported values.

*Type:* open submodule of attribute set of (string or signed integer)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/miniflux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/miniflux.nix)

## `services.miniflux.config.CREATE_ADMIN` {#opt-services.miniflux.config.CREATE_ADMIN}

Create an admin user from environment variables.

*Type:* signed integer or boolean convertible to it

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/miniflux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/miniflux.nix)

## `services.miniflux.config.DATABASE_URL` {#opt-services.miniflux.config.DATABASE_URL}

Postgresql connection parameters.
See [lib/pq](https://pkg.go.dev/github.com/lib/pq#hdr-Connection_String_Parameters) for more details.

*Type:* null or string

*Default:*

``` nix
if createDatabaseLocally then "user=miniflux host=/run/postgresql dbname=miniflux" else null
```

*Declared by:* [`nixos/modules/services/web-apps/miniflux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/miniflux.nix)

## `services.miniflux.config.LISTEN_ADDR` {#opt-services.miniflux.config.LISTEN_ADDR}

Address to listen on. Use absolute path for a Unix socket.
Multiple addresses can be specified, separated by commas.

*Type:* string

*Default:* `"localhost:8080"`

*Example:* `"127.0.0.1:8080, 127.0.0.1:8081"`

*Declared by:* [`nixos/modules/services/web-apps/miniflux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/miniflux.nix)

## `services.miniflux.config.RUN_MIGRATIONS` {#opt-services.miniflux.config.RUN_MIGRATIONS}

Run database migrations.

*Type:* signed integer or boolean convertible to it

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/miniflux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/miniflux.nix)

## `services.miniflux.config.WATCHDOG` {#opt-services.miniflux.config.WATCHDOG}

Enable or disable Systemd watchdog.

*Type:* signed integer or boolean convertible to it

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/miniflux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/miniflux.nix)

## `services.miniflux.createDatabaseLocally` {#opt-services.miniflux.createDatabaseLocally}

Whether a PostgreSQL database should be automatically created and
configured on the local host. If set to `false`, you need provision a
database yourself.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/miniflux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/miniflux.nix)

## `services.miniflux.enable` {#opt-services.miniflux.enable}

Whether to enable miniflux.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/miniflux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/miniflux.nix)

## `services.miniflux.package` {#opt-services.miniflux.package}

The miniflux package to use.

*Type:* package

*Default:* `pkgs.miniflux`

*Declared by:* [`nixos/modules/services/web-apps/miniflux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/miniflux.nix)

## `services.miniupnpd.appendConfig` {#opt-services.miniupnpd.appendConfig}

Configuration lines appended to the MiniUPnP config.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/miniupnpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/miniupnpd.nix)

## `services.miniupnpd.enable` {#opt-services.miniupnpd.enable}

Whether to enable MiniUPnP daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/miniupnpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/miniupnpd.nix)

## `services.miniupnpd.externalInterface` {#opt-services.miniupnpd.externalInterface}

Name of the external interface.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/miniupnpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/miniupnpd.nix)

## `services.miniupnpd.internalIPs` {#opt-services.miniupnpd.internalIPs}

The IP address ranges to listen on.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "192.168.1.1/24"
  "enp1s0"
]
```

*Declared by:* [`nixos/modules/services/networking/miniupnpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/miniupnpd.nix)

## `services.miniupnpd.natpmp` {#opt-services.miniupnpd.natpmp}

Whether to enable NAT-PMP support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/miniupnpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/miniupnpd.nix)

## `services.miniupnpd.upnp` {#opt-services.miniupnpd.upnp}

Whether to enable UPNP support.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/miniupnpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/miniupnpd.nix)

## `services.minuspod.baseUrl` {#opt-services.minuspod.baseUrl}

Public URL for generated feed links (`BASE_URL`).
Should match the externally reachable address.

*Type:* string

*Default:* `"http://localhost:8000"`

*Example:* `"https://podcasts.example.com"`

*Declared by:* [`nixos/modules/services/misc/minuspod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/minuspod.nix)

## `services.minuspod.dataDir` {#opt-services.minuspod.dataDir}

Path to MinusPod data (SQLite DB, downloads, cache) inside of /var/lib.

*Type:* string

*Default:* `"minuspod"`

*Declared by:* [`nixos/modules/services/misc/minuspod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/minuspod.nix)

## `services.minuspod.enable` {#opt-services.minuspod.enable}

Whether to enable MinusPod, self-hosted podcast ad-removal server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/minuspod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/minuspod.nix)

## `services.minuspod.environment` {#opt-services.minuspod.environment}

Extra environment variables for MinusPod.
Secrets should use `environmentFile`.
See [https://github.com/ttlequals0/MinusPod/blob/main/docs/environment-variables.md](https://github.com/ttlequals0/MinusPod/blob/main/docs/environment-variables.md)
and `.env.example` for all options (`LLM_PROVIDER`,
`ANTHROPIC_API_KEY`, `OPENROUTER_API_KEY`, `OPENAI_BASE_URL`,
`OPENAI_MODEL`, `WHISPER_MODEL`, `WHISPER_BACKEND`, ...).

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  LLM_PROVIDER = "ollama";
  OPENAI_BASE_URL = "http://127.0.0.1:11434/v1";
  OPENAI_MODEL = "qwen3:14b";
  WHISPER_API_BASE_URL = "https://api.groq.com/openai/v1";
  WHISPER_BACKEND = "openai-api";
}
```

*Declared by:* [`nixos/modules/services/misc/minuspod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/minuspod.nix)

## `services.minuspod.environmentFile` {#opt-services.minuspod.environmentFile}

Environment file with secrets (e.g. `ANTHROPIC_API_KEY`,
`OPENROUTER_API_KEY`, `MINUSPOD_MASTER_PASSPHRASE`,
`MINUSPOD_SETUP_TOKEN`), passed to systemd via `EnvironmentFile`.
Useful to prevent secrets from being world-readable in the Nix store.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/secrets/minuspod.env"`

*Declared by:* [`nixos/modules/services/misc/minuspod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/minuspod.nix)

## `services.minuspod.group` {#opt-services.minuspod.group}

Group under which MinusPod runs.

*Type:* string

*Default:* `"minuspod"`

*Declared by:* [`nixos/modules/services/misc/minuspod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/minuspod.nix)

## `services.minuspod.host` {#opt-services.minuspod.host}

Host address which MinusPod listens on.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/minuspod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/minuspod.nix)

## `services.minuspod.openFirewall` {#opt-services.minuspod.openFirewall}

Open ports in the firewall for the MinusPod web interface and feeds.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/minuspod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/minuspod.nix)

## `services.minuspod.package` {#opt-services.minuspod.package}

The minuspod package to use.

*Type:* package

*Default:* `pkgs.minuspod`

*Declared by:* [`nixos/modules/services/misc/minuspod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/minuspod.nix)

## `services.minuspod.port` {#opt-services.minuspod.port}

TCP port MinusPod listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8000`

*Declared by:* [`nixos/modules/services/misc/minuspod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/minuspod.nix)

## `services.minuspod.user` {#opt-services.minuspod.user}

User account under which MinusPod runs.

*Type:* string

*Default:* `"minuspod"`

*Declared by:* [`nixos/modules/services/misc/minuspod.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/minuspod.nix)

## `services.mirakurun.allowSmartCardAccess` {#opt-services.mirakurun.allowSmartCardAccess}

Install polkit rules to allow Mirakurun to access smart card readers
which is commonly used along with tuner devices.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/video/mirakurun.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/mirakurun.nix)

## `services.mirakurun.channelSettings` {#opt-services.mirakurun.channelSettings}

Options which are added to channels.yml. If none is specified, it
will automatically be generated at runtime.

Documentation:
[https://github.com/Chinachu/Mirakurun/blob/master/doc/Configuration.md](https://github.com/Chinachu/Mirakurun/blob/master/doc/Configuration.md)

*Type:* null or YAML 1.1 value

*Default:* `null`

*Example:*

``` nix
[
  {
    name = "channel";
    types = "GR";
    channel = "0";
  }
];
```

*Declared by:* [`nixos/modules/services/video/mirakurun.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/mirakurun.nix)

## `services.mirakurun.enable` {#opt-services.mirakurun.enable}

Whether to enable the Mirakurun DVR Tuner Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/video/mirakurun.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/mirakurun.nix)

## `services.mirakurun.openFirewall` {#opt-services.mirakurun.openFirewall}

Open ports in the firewall for Mirakurun.

::: warning
Exposing Mirakurun to the open internet is generally advised
against. Only use it inside a trusted local network, or
consider putting it behind a VPN if you want remote access.
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/video/mirakurun.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/mirakurun.nix)

## `services.mirakurun.port` {#opt-services.mirakurun.port}

Port to listen on. If `null`, it won't listen on
any port.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `40772`

*Declared by:* [`nixos/modules/services/video/mirakurun.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/mirakurun.nix)

## `services.mirakurun.serverSettings` {#opt-services.mirakurun.serverSettings}

Options for server.yml.

Documentation:
[https://github.com/Chinachu/Mirakurun/blob/master/doc/Configuration.md](https://github.com/Chinachu/Mirakurun/blob/master/doc/Configuration.md)

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  highWaterMark = 25165824;
  overflowTimeLimit = 30000;
};
```

*Declared by:* [`nixos/modules/services/video/mirakurun.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/mirakurun.nix)

## `services.mirakurun.tunerSettings` {#opt-services.mirakurun.tunerSettings}

Options which are added to tuners.yml. If none is specified, it will
automatically be generated at runtime.

Documentation:
[https://github.com/Chinachu/Mirakurun/blob/master/doc/Configuration.md](https://github.com/Chinachu/Mirakurun/blob/master/doc/Configuration.md)

*Type:* null or YAML 1.1 value

*Default:* `null`

*Example:*

``` nix
[
  {
    name = "tuner-name";
    types = [ "GR" "BS" "CS" "SKY" ];
    dvbDevicePath = "/dev/dvb/adapterX/dvrX";
  }
];
```

*Declared by:* [`nixos/modules/services/video/mirakurun.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/mirakurun.nix)

## `services.mirakurun.unixSocket` {#opt-services.mirakurun.unixSocket}

Path to unix socket to listen on. If `null`, it
won't listen on any unix sockets.

*Type:* null or absolute path

*Default:* `"/var/run/mirakurun/mirakurun.sock"`

*Declared by:* [`nixos/modules/services/video/mirakurun.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/mirakurun.nix)

## `services.miredo.bindAddress` {#opt-services.miredo.bindAddress}

Depending on the local firewall/NAT rules, you might need to force
Miredo to use a fixed UDP port and or IPv4 address.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/miredo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/miredo.nix)

## `services.miredo.bindPort` {#opt-services.miredo.bindPort}

Depending on the local firewall/NAT rules, you might need to force
Miredo to use a fixed UDP port and or IPv4 address.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/miredo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/miredo.nix)

## `services.miredo.enable` {#opt-services.miredo.enable}

Whether to enable the Miredo IPv6 tunneling service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/miredo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/miredo.nix)

## `services.miredo.interfaceName` {#opt-services.miredo.interfaceName}

Name of the network tunneling interface.

*Type:* string

*Default:* `"teredo"`

*Declared by:* [`nixos/modules/services/networking/miredo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/miredo.nix)

## `services.miredo.package` {#opt-services.miredo.package}

The miredo package to use.

*Type:* package

*Default:* `pkgs.miredo`

*Declared by:* [`nixos/modules/services/networking/miredo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/miredo.nix)

## `services.miredo.serverAddress` {#opt-services.miredo.serverAddress}

The hostname or primary IPv4 address of the Teredo server.
This setting is required if Miredo runs as a Teredo client.
"teredo.remlab.net" is an experimental service for testing only.
Please use another server for production and/or large scale deployments.

*Type:* string

*Default:* `"teredo.remlab.net"`

*Declared by:* [`nixos/modules/services/networking/miredo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/miredo.nix)

## `services.misskey.database.createLocally` {#opt-services.misskey.database.createLocally}

Create the PostgreSQL database locally. Sets `services.misskey.settings.db.{db,host,port,user,pass}`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.database.passwordFile` {#opt-services.misskey.database.passwordFile}

The path to a file containing the database password. Sets `services.misskey.settings.db.pass`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.enable` {#opt-services.misskey.enable}

Whether to enable misskey.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.meilisearch.createLocally` {#opt-services.misskey.meilisearch.createLocally}

Create and use a local Meilisearch instance. Sets `services.misskey.settings.meilisearch.{host,port,ssl}`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.meilisearch.keyFile` {#opt-services.misskey.meilisearch.keyFile}

The path to a file containing the Meilisearch API key. Sets `services.misskey.settings.meilisearch.apiKey`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.package` {#opt-services.misskey.package}

The misskey package to use.

*Type:* package

*Default:* `pkgs.misskey`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.redis.createLocally` {#opt-services.misskey.redis.createLocally}

Create and use a local Redis instance. Sets `services.misskey.settings.redis.host`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.redis.passwordFile` {#opt-services.misskey.redis.passwordFile}

The path to a file containing the Redis password. Sets `services.misskey.settings.redis.pass`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.reverseProxy.enable` {#opt-services.misskey.reverseProxy.enable}

Whether to enable a HTTP reverse proxy for Misskey.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.reverseProxy.host` {#opt-services.misskey.reverseProxy.host}

The fully qualified domain name to bind to. Sets `services.misskey.settings.url`.

This is required when using `services.misskey.reverseProxy.enable = true`.

*Type:* null or string

*Default:* `null`

*Example:* `"misskey.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.reverseProxy.ssl` {#opt-services.misskey.reverseProxy.ssl}

Whether to enable SSL for the reverse proxy. Sets `services.misskey.settings.url`.

This is required when using `services.misskey.reverseProxy.enable = true`.

*Type:* null or boolean

*Default:* `null`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.reverseProxy.webserver` {#opt-services.misskey.reverseProxy.webserver}

The webserver to use as the reverse proxy.

*Type:* attribute-tagged union with choices: caddy, nginx

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.reverseProxy.webserver.caddy` {#opt-services.misskey.reverseProxy.webserver.caddy}

Extra configuration for the caddy virtual host of Misskey.
Set to `{ }` to use the default configuration.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.reverseProxy.webserver.caddy.extraConfig` {#opt-services.misskey.reverseProxy.webserver.caddy.extraConfig}

Additional lines of configuration appended to this virtual host in the
automatically generated `Caddyfile`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-servers/caddy/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.caddy.hostName` {#opt-services.misskey.reverseProxy.webserver.caddy.hostName}

Canonical hostname for the server.

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/web-servers/caddy/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.caddy.listenAddresses` {#opt-services.misskey.reverseProxy.webserver.caddy.listenAddresses}

A list of host interfaces to bind to for this virtual host.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "127.0.0.1"
  "::1"
]
```

*Declared by:* [`nixos/modules/services/web-servers/caddy/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.caddy.logFormat` {#opt-services.misskey.reverseProxy.webserver.caddy.logFormat}

Configuration for HTTP request logging (also known as access logs). See
[https://caddyserver.com/docs/caddyfile/directives/log#log](https://caddyserver.com/docs/caddyfile/directives/log#log)
for details.

*Type:* null or strings concatenated with "\\n"

*Default:*

``` nix
''
  output file ''${config.services.caddy.logDir}/access-''${hostName}.log
''
```

*Example:*

``` nix
mkForce ''
  output discard
'';
```

*Declared by:* [`nixos/modules/services/web-servers/caddy/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.caddy.serverAliases` {#opt-services.misskey.reverseProxy.webserver.caddy.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-servers/caddy/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.caddy.useACMEHost` {#opt-services.misskey.reverseProxy.webserver.caddy.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is mostly useful if you use DNS challenges but Caddy does not
currently support your provider.

*Note that this option does not create any certificates, nor
does it add subdomains to existing ones – you will need to create them
manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/caddy/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/caddy/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx` {#opt-services.misskey.reverseProxy.webserver.nginx}

Extra configuration for the nginx virtual host of Misskey.
Set to `{ }` to use the default configuration.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.reverseProxy.webserver.nginx.acmeFallbackHost` {#opt-services.misskey.reverseProxy.webserver.nginx.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.acmeRoot` {#opt-services.misskey.reverseProxy.webserver.nginx.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.addSSL` {#opt-services.misskey.reverseProxy.webserver.nginx.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.basicAuth` {#opt-services.misskey.reverseProxy.webserver.nginx.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.basicAuthFile` {#opt-services.misskey.reverseProxy.webserver.nginx.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.default` {#opt-services.misskey.reverseProxy.webserver.nginx.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.enableACME` {#opt-services.misskey.reverseProxy.webserver.nginx.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.extraConfig` {#opt-services.misskey.reverseProxy.webserver.nginx.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.forceSSL` {#opt-services.misskey.reverseProxy.webserver.nginx.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.globalRedirect` {#opt-services.misskey.reverseProxy.webserver.nginx.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.http2` {#opt-services.misskey.reverseProxy.webserver.nginx.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.http3` {#opt-services.misskey.reverseProxy.webserver.nginx.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.http3_hq` {#opt-services.misskey.reverseProxy.webserver.nginx.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.kTLS` {#opt-services.misskey.reverseProxy.webserver.nginx.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.listen` {#opt-services.misskey.reverseProxy.webserver.nginx.listen}

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

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.listen.*.addr` {#opt-services.misskey.reverseProxy.webserver.nginx.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.listen.*.extraParameters` {#opt-services.misskey.reverseProxy.webserver.nginx.listen._.extraParameters}

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

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.listen.*.port` {#opt-services.misskey.reverseProxy.webserver.nginx.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.listen.*.proxyProtocol` {#opt-services.misskey.reverseProxy.webserver.nginx.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.listen.*.ssl` {#opt-services.misskey.reverseProxy.webserver.nginx.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.listenAddresses` {#opt-services.misskey.reverseProxy.webserver.nginx.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.locations` {#opt-services.misskey.reverseProxy.webserver.nginx.locations}

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

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.locations.<name>.alias` {#opt-services.misskey.reverseProxy.webserver.nginx.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.locations.<name>.basicAuth` {#opt-services.misskey.reverseProxy.webserver.nginx.locations._name_.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.locations.<name>.basicAuthFile` {#opt-services.misskey.reverseProxy.webserver.nginx.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.locations.<name>.extraConfig` {#opt-services.misskey.reverseProxy.webserver.nginx.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.locations.<name>.fastcgiParams` {#opt-services.misskey.reverseProxy.webserver.nginx.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.locations.<name>.index` {#opt-services.misskey.reverseProxy.webserver.nginx.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.locations.<name>.priority` {#opt-services.misskey.reverseProxy.webserver.nginx.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.locations.<name>.proxyPass` {#opt-services.misskey.reverseProxy.webserver.nginx.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.locations.<name>.proxyWebsockets` {#opt-services.misskey.reverseProxy.webserver.nginx.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.locations.<name>.recommendedProxySettings` {#opt-services.misskey.reverseProxy.webserver.nginx.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.locations.<name>.recommendedUwsgiSettings` {#opt-services.misskey.reverseProxy.webserver.nginx.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.locations.<name>.return` {#opt-services.misskey.reverseProxy.webserver.nginx.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.locations.<name>.root` {#opt-services.misskey.reverseProxy.webserver.nginx.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.locations.<name>.tryFiles` {#opt-services.misskey.reverseProxy.webserver.nginx.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.locations.<name>.useGrpcErrorPages` {#opt-services.misskey.reverseProxy.webserver.nginx.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.locations.<name>.uwsgiPass` {#opt-services.misskey.reverseProxy.webserver.nginx.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.onlySSL` {#opt-services.misskey.reverseProxy.webserver.nginx.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.quic` {#opt-services.misskey.reverseProxy.webserver.nginx.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.redirectCode` {#opt-services.misskey.reverseProxy.webserver.nginx.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.rejectSSL` {#opt-services.misskey.reverseProxy.webserver.nginx.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.reuseport` {#opt-services.misskey.reverseProxy.webserver.nginx.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.root` {#opt-services.misskey.reverseProxy.webserver.nginx.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.serverAliases` {#opt-services.misskey.reverseProxy.webserver.nginx.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.serverName` {#opt-services.misskey.reverseProxy.webserver.nginx.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.sslCertificate` {#opt-services.misskey.reverseProxy.webserver.nginx.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.sslCertificateKey` {#opt-services.misskey.reverseProxy.webserver.nginx.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.sslTrustedCertificate` {#opt-services.misskey.reverseProxy.webserver.nginx.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.reverseProxy.webserver.nginx.useACMEHost` {#opt-services.misskey.reverseProxy.webserver.nginx.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/nginx/vhost-options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix)

## `services.misskey.settings` {#opt-services.misskey.settings}

Configuration for Misskey, see
[`example.yml`](https://github.com/misskey-dev/misskey/blob/develop/.config/example.yml)
for all supported options.

*Type:* open submodule of attribute set of (YAML 1.1 value)

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.chmodSocket` {#opt-services.misskey.settings.chmodSocket}

The file access mode of the UNIX socket.

*Type:* null or string

*Default:* `null`

*Example:* `"777"`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.db` {#opt-services.misskey.settings.db}

Database settings.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.db.db` {#opt-services.misskey.settings.db.db}

The database name.

*Type:* string

*Default:* `"misskey"`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.db.disableCache` {#opt-services.misskey.settings.db.disableCache}

Whether to disable caching queries.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.db.extra` {#opt-services.misskey.settings.db.extra}

Extra connection options.

*Type:* null or (attribute set of (YAML 1.1 value))

*Default:* `null`

*Example:*

``` nix
{
  ssl = true;
}
```

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.db.host` {#opt-services.misskey.settings.db.host}

The PostgreSQL host.

*Type:* string

*Default:* `"/var/run/postgresql"`

*Example:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.db.pass` {#opt-services.misskey.settings.db.pass}

The password used for database authentication.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.db.port` {#opt-services.misskey.settings.db.port}

The PostgreSQL port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5432`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.db.user` {#opt-services.misskey.settings.db.user}

The user used for database authentication.

*Type:* string

*Default:* `"misskey"`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.id` {#opt-services.misskey.settings.id}

The ID generation method to use. Do not change after starting Misskey for the first time.

*Type:* one of "aid", "aidx", "meid", "ulid", "objectid"

*Default:* `"aidx"`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.meilisearch` {#opt-services.misskey.settings.meilisearch}

Meilisearch connection options.

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.meilisearch.apiKey` {#opt-services.misskey.settings.meilisearch.apiKey}

The Meilisearch API key.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.meilisearch.host` {#opt-services.misskey.settings.meilisearch.host}

The Meilisearch host.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.meilisearch.index` {#opt-services.misskey.settings.meilisearch.index}

Meilisearch index to use.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.meilisearch.port` {#opt-services.misskey.settings.meilisearch.port}

The Meilisearch port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `7700`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.meilisearch.scope` {#opt-services.misskey.settings.meilisearch.scope}

The search scope.

*Type:* one of "local", "global"

*Default:* `"local"`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.meilisearch.ssl` {#opt-services.misskey.settings.meilisearch.ssl}

Whether to connect via SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.port` {#opt-services.misskey.settings.port}

The port your Misskey server should listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.redis` {#opt-services.misskey.settings.redis}

`ioredis` options. See [`README`](https://github.com/redis/ioredis?tab=readme-ov-file#connect-to-redis) for reference.

*Type:* open submodule of attribute set of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.redis.host` {#opt-services.misskey.settings.redis.host}

The Redis host.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.redis.port` {#opt-services.misskey.settings.redis.port}

The Redis port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6379`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.redisForJobQueue` {#opt-services.misskey.settings.redisForJobQueue}

`ioredis` options for the job queue. See [`README`](https://github.com/redis/ioredis?tab=readme-ov-file#connect-to-redis) for reference.

*Type:* null or (open submodule of attribute set of (YAML 1.1 value))

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.redisForJobQueue.host` {#opt-services.misskey.settings.redisForJobQueue.host}

The Redis host.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.redisForJobQueue.port` {#opt-services.misskey.settings.redisForJobQueue.port}

The Redis port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6379`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.redisForPubsub` {#opt-services.misskey.settings.redisForPubsub}

`ioredis` options for pubsub. See [`README`](https://github.com/redis/ioredis?tab=readme-ov-file#connect-to-redis) for reference.

*Type:* null or (open submodule of attribute set of (YAML 1.1 value))

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.redisForPubsub.host` {#opt-services.misskey.settings.redisForPubsub.host}

The Redis host.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.redisForPubsub.port` {#opt-services.misskey.settings.redisForPubsub.port}

The Redis port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6379`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.redisForTimelines` {#opt-services.misskey.settings.redisForTimelines}

`ioredis` options for timelines. See [`README`](https://github.com/redis/ioredis?tab=readme-ov-file#connect-to-redis) for reference.

*Type:* null or (open submodule of attribute set of (YAML 1.1 value))

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.redisForTimelines.host` {#opt-services.misskey.settings.redisForTimelines.host}

The Redis host.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.redisForTimelines.port` {#opt-services.misskey.settings.redisForTimelines.port}

The Redis port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6379`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.socket` {#opt-services.misskey.settings.socket}

The UNIX socket your Misskey server should listen on.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/path/to/misskey.sock"`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.misskey.settings.url` {#opt-services.misskey.settings.url}

The final user-facing URL. Do not change after running Misskey for the first time.

This needs to match up with the configured reverse proxy and is automatically configured when using `services.misskey.reverseProxy`.

*Type:* string

*Example:* `"https://example.tld/"`

*Declared by:* [`nixos/modules/services/web-apps/misskey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/misskey.nix)

## `services.mjolnir.accessTokenFile` {#opt-services.mjolnir.accessTokenFile}

File containing the matrix access token for the `mjolnir` user.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/matrix/mjolnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mjolnir.nix)

## `services.mjolnir.dataPath` {#opt-services.mjolnir.dataPath}

The directory the bot should store various bits of information in.

*Type:* absolute path

*Default:* `"/var/lib/mjolnir"`

*Declared by:* [`nixos/modules/services/matrix/mjolnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mjolnir.nix)

## `services.mjolnir.enable` {#opt-services.mjolnir.enable}

Whether to enable Mjolnir, a moderation tool for Matrix.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/mjolnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mjolnir.nix)

## `services.mjolnir.encryption.passwordFile` {#opt-services.mjolnir.encryption.passwordFile}

File containing the matrix password for the `mjolnir` user.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/matrix/mjolnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mjolnir.nix)

## `services.mjolnir.homeserverUrl` {#opt-services.mjolnir.homeserverUrl}

Where the homeserver is located (client-server URL).

If `pantalaimon.enable` is `true`, this option will become the homeserver to which `pantalaimon` connects.
The listen address of `pantalaimon` will then become the `homeserverUrl` of `mjolnir`.

*Type:* string

*Default:* `"https://matrix.org"`

*Declared by:* [`nixos/modules/services/matrix/mjolnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mjolnir.nix)

## `services.mjolnir.managementRoom` {#opt-services.mjolnir.managementRoom}

The room ID where people can use the bot. The bot has no access controls, so
anyone in this room can use the bot - secure your room!
This should be a room alias or room ID - not a matrix.to URL.
Note: `mjolnir` is fairly verbose - expect a lot of messages from it.

*Type:* string

*Default:* `"#moderators:example.org"`

*Declared by:* [`nixos/modules/services/matrix/mjolnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mjolnir.nix)

## `services.mjolnir.pantalaimon` {#opt-services.mjolnir.pantalaimon}

`pantalaimon` options (enables E2E Encryption support).

This will create a `pantalaimon` instance with the name "mjolnir".

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/matrix/mjolnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mjolnir.nix)

## `services.mjolnir.pantalaimon.enable` {#opt-services.mjolnir.pantalaimon.enable}

Whether to enable ignoring the accessToken. If true, accessToken is ignored and the username/password below will be
used instead. The access token of the bot will be stored in the dataPath
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/matrix/mjolnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mjolnir.nix)

## `services.mjolnir.pantalaimon.options` {#opt-services.mjolnir.pantalaimon.options}

passthrough additional options to the `pantalaimon` service.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/matrix/mjolnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mjolnir.nix)

## `services.mjolnir.pantalaimon.options.dataPath` {#opt-services.mjolnir.pantalaimon.options.dataPath}

The directory where `pantalaimon` should store its state such as the database file.

*Type:* absolute path

*Default:* `"/var/lib/pantalaimon-‹name›"`

*Declared by:* [`nixos/modules/services/matrix/mjolnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mjolnir.nix)

## `services.mjolnir.pantalaimon.options.extraSettings` {#opt-services.mjolnir.pantalaimon.options.extraSettings}

Extra configuration options. See
[pantalaimon(5)](https://github.com/matrix-org/pantalaimon/blob/master/docs/man/pantalaimon.5.md)
for available options.

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/matrix/mjolnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mjolnir.nix)

## `services.mjolnir.pantalaimon.options.homeserver` {#opt-services.mjolnir.pantalaimon.options.homeserver}

The URI of the homeserver that the `pantalaimon` proxy should
forward requests to, without the matrix API path but including
the http(s) schema.

*Type:* string

*Example:* `"https://matrix.org"`

*Declared by:* [`nixos/modules/services/matrix/mjolnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mjolnir.nix)

## `services.mjolnir.pantalaimon.options.listenAddress` {#opt-services.mjolnir.pantalaimon.options.listenAddress}

The address where the daemon will listen to client connections
for this homeserver.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/matrix/mjolnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mjolnir.nix)

## `services.mjolnir.pantalaimon.options.listenPort` {#opt-services.mjolnir.pantalaimon.options.listenPort}

The port where the daemon will listen to client connections for
this homeserver. Note that the listen address/port combination
needs to be lib.unique between different homeservers.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8009`

*Declared by:* [`nixos/modules/services/matrix/mjolnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mjolnir.nix)

## `services.mjolnir.pantalaimon.options.logLevel` {#opt-services.mjolnir.pantalaimon.options.logLevel}

Set the log level of the daemon.

*Type:* one of "info", "warning", "error", "debug"

*Default:* `"warning"`

*Declared by:* [`nixos/modules/services/matrix/mjolnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mjolnir.nix)

## `services.mjolnir.pantalaimon.options.ssl` {#opt-services.mjolnir.pantalaimon.options.ssl}

Whether or not SSL verification should be enabled for outgoing
connections to the homeserver.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/matrix/mjolnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mjolnir.nix)

## `services.mjolnir.pantalaimon.passwordFile` {#opt-services.mjolnir.pantalaimon.passwordFile}

File containing the matrix password for the `mjolnir` user.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/matrix/mjolnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mjolnir.nix)

## `services.mjolnir.pantalaimon.username` {#opt-services.mjolnir.pantalaimon.username}

The username to login with.

*Type:* string

*Declared by:* [`nixos/modules/services/matrix/mjolnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mjolnir.nix)

## `services.mjolnir.protectedRooms` {#opt-services.mjolnir.protectedRooms}

A list of rooms to protect (matrix.to URLs).

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "https://matrix.to/#/#yourroom:example.org"
  "https://matrix.to/#/#anotherroom:example.org"
]
```

*Declared by:* [`nixos/modules/services/matrix/mjolnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mjolnir.nix)

## `services.mjolnir.settings` {#opt-services.mjolnir.settings}

Additional settings (see [mjolnir default config](https://github.com/matrix-org/mjolnir/blob/main/config/default.yaml) for available settings). These settings will override settings made by the module config.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  autojoinOnlyIfManager = true;
  automaticallyRedactForReasons = [ "spam" "advertising" ];
}
```

*Declared by:* [`nixos/modules/services/matrix/mjolnir.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/matrix/mjolnir.nix)

## `services.mjpg-streamer.enable` {#opt-services.mjpg-streamer.enable}

Whether to enable mjpg-streamer webcam streamer.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/mjpg-streamer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mjpg-streamer.nix)

## `services.mjpg-streamer.group` {#opt-services.mjpg-streamer.group}

mjpg-streamer group name.

*Type:* string

*Default:* `"video"`

*Declared by:* [`nixos/modules/services/networking/mjpg-streamer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mjpg-streamer.nix)

## `services.mjpg-streamer.inputPlugin` {#opt-services.mjpg-streamer.inputPlugin}

Input plugin. See plugins documentation for more information.

*Type:* string

*Default:* `"input_uvc.so"`

*Declared by:* [`nixos/modules/services/networking/mjpg-streamer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mjpg-streamer.nix)

## `services.mjpg-streamer.outputPlugin` {#opt-services.mjpg-streamer.outputPlugin}

Output plugin. `@www@` is substituted for default mjpg-streamer www directory.
See plugins documentation for more information.

*Type:* string

*Default:* `"output_http.so -w @www@ -n -p 5050"`

*Declared by:* [`nixos/modules/services/networking/mjpg-streamer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mjpg-streamer.nix)

## `services.mjpg-streamer.package` {#opt-services.mjpg-streamer.package}

The mjpg-streamer package to use.

*Type:* package

*Default:* `pkgs.mjpg-streamer`

*Declared by:* [`nixos/modules/services/networking/mjpg-streamer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mjpg-streamer.nix)

## `services.mjpg-streamer.user` {#opt-services.mjpg-streamer.user}

mjpg-streamer user name.

*Type:* string

*Default:* `"mjpg-streamer"`

*Declared by:* [`nixos/modules/services/networking/mjpg-streamer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mjpg-streamer.nix)

## `services.mlmmj.enable` {#opt-services.mlmmj.enable}

Enable mlmmj

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/mail/mlmmj.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mlmmj.nix)

## `services.mlmmj.group` {#opt-services.mlmmj.group}

mailinglist local group

*Type:* string

*Default:* `"mlmmj"`

*Declared by:* [`nixos/modules/services/mail/mlmmj.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mlmmj.nix)

## `services.mlmmj.listDomain` {#opt-services.mlmmj.listDomain}

Set the mailing list domain

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/mail/mlmmj.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mlmmj.nix)

## `services.mlmmj.mailLists` {#opt-services.mlmmj.mailLists}

The collection of hosted maillists

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/mail/mlmmj.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mlmmj.nix)

## `services.mlmmj.maintInterval` {#opt-services.mlmmj.maintInterval}

Time interval between mlmmj-maintd runs, see
`systemd.time(7)` for format information.

*Type:* string

*Default:* `"20min"`

*Declared by:* [`nixos/modules/services/mail/mlmmj.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mlmmj.nix)

## `services.mlmmj.user` {#opt-services.mlmmj.user}

mailinglist local user

*Type:* string

*Default:* `"mlmmj"`

*Declared by:* [`nixos/modules/services/mail/mlmmj.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/mlmmj.nix)

## `services.mmsd.enable` {#opt-services.mmsd.enable}

Whether to enable Multimedia Messaging Service Daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/mmsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mmsd.nix)

## `services.mmsd.extraArgs` {#opt-services.mmsd.extraArgs}

Extra arguments passed to `mmsd-tng`

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--debug"
]
```

*Declared by:* [`nixos/modules/services/networking/mmsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mmsd.nix)

## `services.mobilizon.enable` {#opt-services.mobilizon.enable}

Whether to enable Mobilizon federated organization and mobilization platform.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mobilizon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mobilizon.nix)

## `services.mobilizon.nginx.enable` {#opt-services.mobilizon.nginx.enable}

Whether an Nginx virtual host should be
set up to serve Mobilizon.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mobilizon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mobilizon.nix)

## `services.mobilizon.package` {#opt-services.mobilizon.package}

The mobilizon package to use.

*Type:* package

*Default:* `pkgs.mobilizon`

*Declared by:* [`nixos/modules/services/web-apps/mobilizon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mobilizon.nix)

## `services.mobilizon.settings` {#opt-services.mobilizon.settings}

Mobilizon Elixir documentation, see
[https://docs.joinmobilizon.org/administration/configure/reference/](https://docs.joinmobilizon.org/administration/configure/reference/)
for supported values.

*Type:* open submodule of attribute set of attribute set of (Elixir value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/mobilizon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mobilizon.nix)

## `services.mobilizon.settings.":mobilizon".":instance".email_from` {#opt-services.mobilizon.settings.__mobilizon_.__instance_.email_from}

The email for the From: header in emails

*Type:* string or (raw elixir)

*Default:*

``` nix
noreply@${settings.":mobilizon".":instance".hostname}
```

*Declared by:* [`nixos/modules/services/web-apps/mobilizon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mobilizon.nix)

## `services.mobilizon.settings.":mobilizon".":instance".email_reply_to` {#opt-services.mobilizon.settings.__mobilizon_.__instance_.email_reply_to}

The email for the Reply-To: header in emails

*Type:* string or (raw elixir)

*Default:*

``` nix
${email_from}
```

*Declared by:* [`nixos/modules/services/web-apps/mobilizon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mobilizon.nix)

## `services.mobilizon.settings.":mobilizon".":instance".hostname` {#opt-services.mobilizon.settings.__mobilizon_.__instance_.hostname}

Your instance's hostname

*Type:* string or (raw elixir)

*Declared by:* [`nixos/modules/services/web-apps/mobilizon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mobilizon.nix)

## `services.mobilizon.settings.":mobilizon".":instance".name` {#opt-services.mobilizon.settings.__mobilizon_.__instance_.name}

The fallback instance name if not configured into the admin UI

*Type:* string or (raw elixir)

*Declared by:* [`nixos/modules/services/web-apps/mobilizon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mobilizon.nix)

## `services.mobilizon.settings.":mobilizon"."Mobilizon.Storage.Repo".database` {#opt-services.mobilizon.settings.__mobilizon_._Mobilizon.Storage.Repo_.database}

Name of the database

*Type:* null or string or (raw elixir)

*Default:* `"mobilizon_prod"`

*Declared by:* [`nixos/modules/services/web-apps/mobilizon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mobilizon.nix)

## `services.mobilizon.settings.":mobilizon"."Mobilizon.Storage.Repo".socket_dir` {#opt-services.mobilizon.settings.__mobilizon_._Mobilizon.Storage.Repo_.socket_dir}

Path to the postgres socket directory.

Set this to null if you want to connect to a remote database.

If non-null, the local PostgreSQL server will be configured with
the configured database, permissions, and required extensions.

If connecting to a remote database, please follow the
instructions on how to setup your database:
[https://docs.joinmobilizon.org/administration/install/release/#database-setup](https://docs.joinmobilizon.org/administration/install/release/#database-setup)

*Type:* null or string or (raw elixir)

*Default:* `"/run/postgresql"`

*Declared by:* [`nixos/modules/services/web-apps/mobilizon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mobilizon.nix)

## `services.mobilizon.settings.":mobilizon"."Mobilizon.Storage.Repo".username` {#opt-services.mobilizon.settings.__mobilizon_._Mobilizon.Storage.Repo_.username}

User used to connect to the database

*Type:* null or string or (raw elixir)

*Default:* `"mobilizon"`

*Declared by:* [`nixos/modules/services/web-apps/mobilizon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mobilizon.nix)

## `services.mobilizon.settings.":mobilizon"."Mobilizon.Web.Endpoint".has_reverse_proxy` {#opt-services.mobilizon.settings.__mobilizon_._Mobilizon.Web.Endpoint_.has_reverse_proxy}

Whether you use a reverse proxy

*Type:* boolean or (raw elixir)

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/mobilizon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mobilizon.nix)

## `services.mobilizon.settings.":mobilizon"."Mobilizon.Web.Endpoint".http.ip` {#opt-services.mobilizon.settings.__mobilizon_._Mobilizon.Web.Endpoint_.http.ip}

The IP address to listen on. Defaults to \[::1\] notated as a byte tuple.

*Type:* (elixir tuple) or (raw elixir)

*Default:*

``` nix
{
  _elixirType = "tuple";
  value = [
    0
    0
    0
    0
    0
    0
    0
    1
  ];
}
```

*Declared by:* [`nixos/modules/services/web-apps/mobilizon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mobilizon.nix)

## `services.mobilizon.settings.":mobilizon"."Mobilizon.Web.Endpoint".http.port` {#opt-services.mobilizon.settings.__mobilizon_._Mobilizon.Web.Endpoint_.http.port}

The port to run the server

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive) or (raw elixir)

*Default:* `4000`

*Declared by:* [`nixos/modules/services/web-apps/mobilizon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mobilizon.nix)

## `services.mobilizon.settings.":mobilizon"."Mobilizon.Web.Endpoint".url.host` {#opt-services.mobilizon.settings.__mobilizon_._Mobilizon.Web.Endpoint_.url.host}

Your instance's hostname for generating URLs throughout the app

*Type:* string or (raw elixir)

*Default:* ${settings.":mobilizon".":instance".hostname}

*Declared by:* [`nixos/modules/services/web-apps/mobilizon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/mobilizon.nix)

## `services.molly-brown.certPath` {#opt-services.molly-brown.certPath}

Path to TLS certificate. An ACME certificate and key may be
shared with an HTTP server, but only if molly-brown has
permissions allowing it to read such keys.

As an example:

```
systemd.services.molly-brown.serviceConfig.SupplementaryGroups =
  [ config.security.acme.certs."example.com".group ];
```

*Type:* absolute path

*Example:* `"/var/lib/acme/example.com/cert.pem"`

*Declared by:* [`nixos/modules/services/web-servers/molly-brown.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/molly-brown.nix)

## `services.molly-brown.docBase` {#opt-services.molly-brown.docBase}

Base directory for Gemini content.

*Type:* absolute path

*Example:* `"/var/lib/molly-brown"`

*Declared by:* [`nixos/modules/services/web-servers/molly-brown.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/molly-brown.nix)

## `services.molly-brown.enable` {#opt-services.molly-brown.enable}

Whether to enable Molly-Brown Gemini server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/molly-brown.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/molly-brown.nix)

## `services.molly-brown.hostName` {#opt-services.molly-brown.hostName}

The hostname to respond to requests for. Requests for URLs with
other hosts will result in a status 53 (PROXY REQUEST REFUSED)
response.

*Type:* string

*Default:* `config.networking.hostName`

*Declared by:* [`nixos/modules/services/web-servers/molly-brown.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/molly-brown.nix)

## `services.molly-brown.keyPath` {#opt-services.molly-brown.keyPath}

Path to TLS key. See `CertPath`.

*Type:* absolute path

*Example:* `"/var/lib/acme/example.com/key.pem"`

*Declared by:* [`nixos/modules/services/web-servers/molly-brown.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/molly-brown.nix)

## `services.molly-brown.port` {#opt-services.molly-brown.port}

TCP port for molly-brown to bind to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1965`

*Declared by:* [`nixos/modules/services/web-servers/molly-brown.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/molly-brown.nix)

## `services.molly-brown.settings` {#opt-services.molly-brown.settings}

molly-brown configuration. Refer to
[https://tildegit.org/solderpunk/molly-brown/src/branch/master/example.conf](https://tildegit.org/solderpunk/molly-brown/src/branch/master/example.conf)
for details on supported values.

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-servers/molly-brown.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/molly-brown.nix)

## `services.mollysocket.enable` {#opt-services.mollysocket.enable}

Whether to enable [MollySocket](https://github.com/mollyim/mollysocket) for getting Signal
notifications via UnifiedPush
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/mollysocket.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mollysocket.nix)

## `services.mollysocket.environmentFile` {#opt-services.mollysocket.environmentFile}

Environment file (see `systemd.exec(5)` "EnvironmentFile="
section for the syntax) passed to the service. This option can be
used to safely include secrets in the configuration.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/mollysocket"`

*Declared by:* [`nixos/modules/services/misc/mollysocket.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mollysocket.nix)

## `services.mollysocket.logLevel` {#opt-services.mollysocket.logLevel}

Set the `RUST_LOG` environment variable

*Type:* string

*Default:* `"info"`

*Example:* `"debug"`

*Declared by:* [`nixos/modules/services/misc/mollysocket.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mollysocket.nix)

## `services.mollysocket.settings` {#opt-services.mollysocket.settings}

Configuration for MollySocket. Available options are listed
[here](https://github.com/mollyim/mollysocket#configuration).

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/mollysocket.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mollysocket.nix)

## `services.mollysocket.settings.allowed_endpoints` {#opt-services.mollysocket.settings.allowed_endpoints}

List of UnifiedPush servers

*Type:* list of string

*Default:*

``` nix
[
  "*"
]
```

*Example:*

``` nix
[
  "https://ntfy.sh"
]
```

*Declared by:* [`nixos/modules/services/misc/mollysocket.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mollysocket.nix)

## `services.mollysocket.settings.allowed_uuids` {#opt-services.mollysocket.settings.allowed_uuids}

UUIDs of Signal accounts that may use this server

*Type:* list of string

*Default:*

``` nix
[
  "*"
]
```

*Example:*

``` nix
[
  "abcdef-12345-tuxyz-67890"
]
```

*Declared by:* [`nixos/modules/services/misc/mollysocket.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mollysocket.nix)

## `services.mollysocket.settings.host` {#opt-services.mollysocket.settings.host}

Listening address of the web server

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/misc/mollysocket.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mollysocket.nix)

## `services.mollysocket.settings.port` {#opt-services.mollysocket.settings.port}

Listening port of the web server

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8020`

*Declared by:* [`nixos/modules/services/misc/mollysocket.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mollysocket.nix)

## `services.monado.defaultRuntime` {#opt-services.monado.defaultRuntime}

Whether to enable Monado as the default OpenXR runtime on the system.

Note that applications can bypass this option by setting an active
runtime in a writable XDG\_CONFIG\_DIRS location like `~/.config`.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/monado.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/monado.nix)

## `services.monado.enable` {#opt-services.monado.enable}

Whether to enable Monado user service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/monado.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/monado.nix)

## `services.monado.forceDefaultRuntime` {#opt-services.monado.forceDefaultRuntime}

Whether to ensure that Monado is the active runtime set for the current
user.

This replaces the file `XDG_CONFIG_HOME/openxr/1/active_runtime.json`
when starting the service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/monado.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/monado.nix)

## `services.monado.highPriority` {#opt-services.monado.highPriority}

Whether to enable high priority capability for monado-service.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/monado.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/monado.nix)

## `services.monado.package` {#opt-services.monado.package}

The monado package to use.

*Type:* package

*Default:* `pkgs.monado`

*Declared by:* [`nixos/modules/services/hardware/monado.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/monado.nix)

## `services.monero.banlist` {#opt-services.monero.banlist}

Path to a text file containing IPs to block.
Useful to prevent DDoS/deanonymization attacks.

[https://github.com/monero-project/meta/issues/1124](https://github.com/monero-project/meta/issues/1124)

*Type:* null or absolute path

*Default:* `null`

*Example:*

``` nix
builtins.fetchurl {
  url = "https://raw.githubusercontent.com/rblaine95/monero-banlist/c6eb9413ddc777e7072d822f49923df0b2a94d88/block.txt";
  hash = "";
};
```

*Declared by:* [`nixos/modules/services/networking/monero.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/monero.nix)

## `services.monero.dataDir` {#opt-services.monero.dataDir}

The directory where Monero stores its data files.

*Type:* string

*Default:* `"/var/lib/monero"`

*Declared by:* [`nixos/modules/services/networking/monero.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/monero.nix)

## `services.monero.enable` {#opt-services.monero.enable}

Whether to enable Monero node daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/monero.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/monero.nix)

## `services.monero.environmentFile` {#opt-services.monero.environmentFile}

Path to an EnvironmentFile for the monero service as defined in `systemd.exec(5)`.

Secrets may be passed to the service by specifying placeholder variables in the Nix config
and setting values in the environment file.

Example:

```
# In environment file:
MINING_ADDRESS=888tNkZrPN6JsEgekjMnABU4TBzc2Dt29EPAvkRxbANsAnjyPbb3iQ1YBRk1UXcdRsiKc9dhwMVgN5S9cQUiyoogDavup3H
MONERO_RPC_PASSWORD=correct-horse-battery-staple
```

```
# Service config
services.monero.mining.address = "$MINING_ADDRESS";
services.monero.rpc.password = "$MONERO_RPC_PASSWORD";
```

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/monero/monerod.env"`

*Declared by:* [`nixos/modules/services/networking/monero.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/monero.nix)

## `services.monero.exclusiveNodes` {#opt-services.monero.exclusiveNodes}

List of peer IP addresses to connect to *only*.
If given the other peer options will be ignored.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/monero.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/monero.nix)

## `services.monero.extraConfig` {#opt-services.monero.extraConfig}

Extra lines to be added verbatim to monerod configuration.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/monero.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/monero.nix)

## `services.monero.extraNodes` {#opt-services.monero.extraNodes}

List of additional peer IP addresses to add to the local list.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/monero.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/monero.nix)

## `services.monero.limits.download` {#opt-services.monero.limits.download}

Limit of the download rate in kB/s.
Set to `-1` to leave unlimited.

*Type:* signed integer

*Default:* `-1`

*Declared by:* [`nixos/modules/services/networking/monero.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/monero.nix)

## `services.monero.limits.syncSize` {#opt-services.monero.limits.syncSize}

Maximum number of blocks to sync at once.
Set to `0` for adaptive.

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Declared by:* [`nixos/modules/services/networking/monero.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/monero.nix)

## `services.monero.limits.threads` {#opt-services.monero.limits.threads}

Maximum number of threads used for a parallel job.
Set to `0` to leave unlimited.

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Declared by:* [`nixos/modules/services/networking/monero.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/monero.nix)

## `services.monero.limits.upload` {#opt-services.monero.limits.upload}

Limit of the upload rate in kB/s.
Set to `-1` to leave unlimited.

*Type:* signed integer

*Default:* `-1`

*Declared by:* [`nixos/modules/services/networking/monero.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/monero.nix)

## `services.monero.mining.address` {#opt-services.monero.mining.address}

Monero address where to send mining rewards.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/monero.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/monero.nix)

## `services.monero.mining.enable` {#opt-services.monero.mining.enable}

Whether to mine monero.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/monero.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/monero.nix)

## `services.monero.mining.threads` {#opt-services.monero.mining.threads}

Number of threads used for mining.
Set to `0` to use all available.

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Declared by:* [`nixos/modules/services/networking/monero.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/monero.nix)

## `services.monero.priorityNodes` {#opt-services.monero.priorityNodes}

List of peer IP addresses to connect to and
attempt to keep the connection open.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/monero.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/monero.nix)

## `services.monero.prune` {#opt-services.monero.prune}

Whether to prune the blockchain.
[https://www.getmonero.org/resources/moneropedia/pruning.html](https://www.getmonero.org/resources/moneropedia/pruning.html)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/monero.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/monero.nix)

## `services.monero.rpc.address` {#opt-services.monero.rpc.address}

IP address the RPC server will bind to.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/monero.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/monero.nix)

## `services.monero.rpc.password` {#opt-services.monero.rpc.password}

Password for RPC connections.

::: warning
A literal value is written to `monero.conf` in the Nix store, which is
world-readable. To keep the password out of the store, set this to a
placeholder such as `"$MONERO_RPC_PASSWORD"` and provide the value
through [`services.monero.environmentFile`](#opt-services.monero.environmentFile).
:::

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/monero.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/monero.nix)

## `services.monero.rpc.port` {#opt-services.monero.rpc.port}

Port the RPC server will bind to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `18081`

*Declared by:* [`nixos/modules/services/networking/monero.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/monero.nix)

## `services.monero.rpc.restricted` {#opt-services.monero.rpc.restricted}

Whether to restrict RPC to view only commands.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/monero.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/monero.nix)

## `services.monero.rpc.user` {#opt-services.monero.rpc.user}

User name for RPC connections.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/monero.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/monero.nix)

## `services.monetdb.dataDir` {#opt-services.monetdb.dataDir}

Data directory for the dbfarm.

*Type:* absolute path

*Default:* `"/var/lib/monetdb"`

*Declared by:* [`nixos/modules/services/databases/monetdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/monetdb.nix)

## `services.monetdb.enable` {#opt-services.monetdb.enable}

Whether to enable the MonetDB database server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/monetdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/monetdb.nix)

## `services.monetdb.group` {#opt-services.monetdb.group}

Group under which MonetDB runs.

*Type:* string

*Default:* `"monetdb"`

*Declared by:* [`nixos/modules/services/databases/monetdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/monetdb.nix)

## `services.monetdb.listenAddress` {#opt-services.monetdb.listenAddress}

Address to listen on.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/databases/monetdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/monetdb.nix)

## `services.monetdb.package` {#opt-services.monetdb.package}

The monetdb package to use.

*Type:* package

*Default:* `pkgs.monetdb`

*Declared by:* [`nixos/modules/services/databases/monetdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/monetdb.nix)

## `services.monetdb.port` {#opt-services.monetdb.port}

Port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `50000`

*Declared by:* [`nixos/modules/services/databases/monetdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/monetdb.nix)

## `services.monetdb.user` {#opt-services.monetdb.user}

User account under which MonetDB runs.

*Type:* string

*Default:* `"monetdb"`

*Declared by:* [`nixos/modules/services/databases/monetdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/monetdb.nix)

## `services.mongodb.bind_ip` {#opt-services.mongodb.bind_ip}

IP to bind to

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/databases/mongodb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mongodb.nix)

## `services.mongodb.dbpath` {#opt-services.mongodb.dbpath}

Location where MongoDB stores its files

*Type:* string

*Default:* `"/var/db/mongodb"`

*Declared by:* [`nixos/modules/services/databases/mongodb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mongodb.nix)

## `services.mongodb.enable` {#opt-services.mongodb.enable}

Whether to enable the MongoDB server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/mongodb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mongodb.nix)

## `services.mongodb.enableAuth` {#opt-services.mongodb.enableAuth}

Enable client authentication. Creates a default superuser with username root!

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/mongodb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mongodb.nix)

## `services.mongodb.extraConfig` {#opt-services.mongodb.extraConfig}

MongoDB extra configuration in YAML format

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  storage.journal.enabled: false
''
```

*Declared by:* [`nixos/modules/services/databases/mongodb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mongodb.nix)

## `services.mongodb.initialRootPasswordFile` {#opt-services.mongodb.initialRootPasswordFile}

Path to the file containing the password for the root user if auth is enabled.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/mongodb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mongodb.nix)

## `services.mongodb.initialScript` {#opt-services.mongodb.initialScript}

A file containing MongoDB statements to execute on first startup.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/mongodb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mongodb.nix)

## `services.mongodb.mongoshPackage` {#opt-services.mongodb.mongoshPackage}

The mongosh package to use.

*Type:* package

*Default:* `pkgs.mongosh`

*Declared by:* [`nixos/modules/services/databases/mongodb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mongodb.nix)

## `services.mongodb.package` {#opt-services.mongodb.package}

The mongodb package to use.

*Type:* package

*Default:* `pkgs.mongodb`

*Example:* `pkgs.mongodb-ce`

*Declared by:* [`nixos/modules/services/databases/mongodb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mongodb.nix)

## `services.mongodb.pidFile` {#opt-services.mongodb.pidFile}

Location of MongoDB pid file

*Type:* string

*Default:* `"/run/mongodb.pid"`

*Declared by:* [`nixos/modules/services/databases/mongodb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mongodb.nix)

## `services.mongodb.quiet` {#opt-services.mongodb.quiet}

quieter output

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/mongodb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mongodb.nix)

## `services.mongodb.replSetName` {#opt-services.mongodb.replSetName}

If this instance is part of a replica set, set its name here.
Otherwise, leave empty to run as single node.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/databases/mongodb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mongodb.nix)

## `services.mongodb.user` {#opt-services.mongodb.user}

User account under which MongoDB runs

*Type:* string

*Default:* `"mongodb"`

*Declared by:* [`nixos/modules/services/databases/mongodb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mongodb.nix)

## `services.monica.appKeyFile` {#opt-services.monica.appKeyFile}

A file containing the Laravel APP\_KEY - a 32 character long,
base64 encoded key used for encryption where needed. Can be
generated with <code>head -c 32 /dev/urandom | base64</code>.

*Type:* absolute path

*Example:* `"/run/keys/monica-appkey"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.appURL` {#opt-services.monica.appURL}

The root URL that you want to host monica on. All URLs in monica will be generated using this value.
If you change this in the future you may need to run a command to update stored URLs in the database.
Command example: <code>php artisan monica:update-url https://old.example.com https://new.example.com</code>

*Type:* string

*Default:* `"http\${lib.optionalString tlsEnabled \"s\"}://\${cfg.hostname}"`

*Example:* `"https://example.com"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.config` {#opt-services.monica.config}

monica configuration options to set in the
<filename>.env</filename> file.

Refer to [https://github.com/monicahq/monica](https://github.com/monicahq/monica)
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
    WKHTMLTOPDF = "/home/user/bins/wkhtmltopdf";
    AUTH_METHOD = "oidc";
    OIDC_NAME = "MyLogin";
    OIDC_DISPLAY_NAME_CLAIMS = "name";
    OIDC_CLIENT_ID = "monica";
    OIDC_CLIENT_SECRET = {_secret = "/run/keys/oidc_secret"};
    OIDC_ISSUER = "https://keycloak.example.com/auth/realms/My%20Realm";
    OIDC_ISSUER_DISCOVER = true;
  }
''
```

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.dataDir` {#opt-services.monica.dataDir}

monica data directory

*Type:* absolute path

*Default:* `"/var/lib/monica"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.database.createLocally` {#opt-services.monica.database.createLocally}

Create the database and database user locally.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.database.host` {#opt-services.monica.database.host}

Database host address.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.database.name` {#opt-services.monica.database.name}

Database name.

*Type:* string

*Default:* `"monica"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.database.passwordFile` {#opt-services.monica.database.passwordFile}

A file containing the password corresponding to

<option>database.user</option>.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/monica-dbpassword"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.database.port` {#opt-services.monica.database.port}

Database host port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3306`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.database.user` {#opt-services.monica.database.user}

Database username.

*Type:* string

*Default:* `user`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.enable` {#opt-services.monica.enable}

Whether to enable monica.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.group` {#opt-services.monica.group}

Group monica runs as.

*Type:* string

*Default:* `"monica"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.hostname` {#opt-services.monica.hostname}

The hostname to serve monica on.

*Type:* string

*Default:* `config.networking.fqdn`

*Example:* `"monica.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.mail.driver` {#opt-services.monica.mail.driver}

Mail driver to use.

*Type:* one of "smtp", "sendmail"

*Default:* `"smtp"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.mail.encryption` {#opt-services.monica.mail.encryption}

SMTP encryption mechanism to use.

*Type:* null or value "tls" (singular enum)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.mail.from` {#opt-services.monica.mail.from}

Mail "from" email.

*Type:* string

*Default:* `"mail@monica.com"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.mail.fromName` {#opt-services.monica.mail.fromName}

Mail "from" name.

*Type:* string

*Default:* `"monica"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.mail.host` {#opt-services.monica.mail.host}

Mail host address.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.mail.passwordFile` {#opt-services.monica.mail.passwordFile}

A file containing the password corresponding to

<option>mail.user</option>.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/monica-mailpassword"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.mail.port` {#opt-services.monica.mail.port}

Mail host port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1025`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.mail.user` {#opt-services.monica.mail.user}

Mail username.

*Type:* null or string

*Default:* `null`

*Example:* `"monica"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.maxUploadSize` {#opt-services.monica.maxUploadSize}

The maximum size for uploads (e.g. images).

*Type:* string

*Default:* `"18M"`

*Example:* `"1G"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx` {#opt-services.monica.nginx}

With this option, you can customize the nginx virtualHost settings.

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
''
  {
    serverAliases = [
      "monica.''${config.networking.domain}"
    ];
    # To enable encryption and let let's encrypt take care of certificate
    forceSSL = true;
    enableACME = true;
  }
''
```

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.acmeFallbackHost` {#opt-services.monica.nginx.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.acmeRoot` {#opt-services.monica.nginx.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.addSSL` {#opt-services.monica.nginx.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.basicAuth` {#opt-services.monica.nginx.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.basicAuthFile` {#opt-services.monica.nginx.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.default` {#opt-services.monica.nginx.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.enableACME` {#opt-services.monica.nginx.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.extraConfig` {#opt-services.monica.nginx.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.forceSSL` {#opt-services.monica.nginx.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.globalRedirect` {#opt-services.monica.nginx.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.http2` {#opt-services.monica.nginx.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.http3` {#opt-services.monica.nginx.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.http3_hq` {#opt-services.monica.nginx.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.kTLS` {#opt-services.monica.nginx.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.listen` {#opt-services.monica.nginx.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.listen.*.addr` {#opt-services.monica.nginx.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.listen.*.extraParameters` {#opt-services.monica.nginx.listen._.extraParameters}

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

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.listen.*.port` {#opt-services.monica.nginx.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.listen.*.proxyProtocol` {#opt-services.monica.nginx.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.listen.*.ssl` {#opt-services.monica.nginx.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.listenAddresses` {#opt-services.monica.nginx.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.locations` {#opt-services.monica.nginx.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.locations.<name>.alias` {#opt-services.monica.nginx.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.locations.<name>.basicAuth` {#opt-services.monica.nginx.locations._name_.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.locations.<name>.basicAuthFile` {#opt-services.monica.nginx.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.locations.<name>.extraConfig` {#opt-services.monica.nginx.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.locations.<name>.fastcgiParams` {#opt-services.monica.nginx.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.locations.<name>.index` {#opt-services.monica.nginx.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.locations.<name>.priority` {#opt-services.monica.nginx.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.locations.<name>.proxyPass` {#opt-services.monica.nginx.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.locations.<name>.proxyWebsockets` {#opt-services.monica.nginx.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.locations.<name>.recommendedProxySettings` {#opt-services.monica.nginx.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.locations.<name>.recommendedUwsgiSettings` {#opt-services.monica.nginx.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.locations.<name>.return` {#opt-services.monica.nginx.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.locations.<name>.root` {#opt-services.monica.nginx.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.locations.<name>.tryFiles` {#opt-services.monica.nginx.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.locations.<name>.useGrpcErrorPages` {#opt-services.monica.nginx.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.locations.<name>.uwsgiPass` {#opt-services.monica.nginx.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.onlySSL` {#opt-services.monica.nginx.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.quic` {#opt-services.monica.nginx.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.redirectCode` {#opt-services.monica.nginx.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.rejectSSL` {#opt-services.monica.nginx.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.reuseport` {#opt-services.monica.nginx.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.root` {#opt-services.monica.nginx.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.serverAliases` {#opt-services.monica.nginx.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.serverName` {#opt-services.monica.nginx.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.sslCertificate` {#opt-services.monica.nginx.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.sslCertificateKey` {#opt-services.monica.nginx.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.sslTrustedCertificate` {#opt-services.monica.nginx.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.nginx.useACMEHost` {#opt-services.monica.nginx.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.phpPackage` {#opt-services.monica.phpPackage}

The php83 package to use.

*Type:* package

*Default:* `pkgs.php83`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.poolConfig` {#opt-services.monica.poolConfig}

Options for the monica PHP pool. See the documentation on <literal>php-fpm.conf</literal>
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

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monica.user` {#opt-services.monica.user}

User monica runs as.

*Type:* string

*Default:* `"monica"`

*Declared by:* [`nixos/modules/services/web-apps/monica.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/monica.nix)

## `services.monit.config` {#opt-services.monit.config}

monitrc content

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/monit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/monit.nix)

## `services.monit.enable` {#opt-services.monit.enable}

Whether to enable Monit.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/monit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/monit.nix)

## `services.moodle.database.createLocally` {#opt-services.moodle.database.createLocally}

Create the database and database user locally.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.database.host` {#opt-services.moodle.database.host}

Database host address.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.database.name` {#opt-services.moodle.database.name}

Database name.

*Type:* string

*Default:* `"moodle"`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.database.passwordFile` {#opt-services.moodle.database.passwordFile}

A file containing the password corresponding to
`database.user`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/moodle-dbpassword"`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.database.port` {#opt-services.moodle.database.port}

Database host port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3306`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.database.socket` {#opt-services.moodle.database.socket}

Path to the unix socket file to use for authentication.

*Type:* null or absolute path

*Default:* `/run/mysqld/mysqld.sock`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.database.type` {#opt-services.moodle.database.type}

Database engine to use.

*Type:* one of "mysql", "pgsql"

*Default:* `"mysql"`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.database.user` {#opt-services.moodle.database.user}

Database user.

*Type:* string

*Default:* `"moodle"`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.enable` {#opt-services.moodle.enable}

Whether to enable Moodle web application.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.extraConfig` {#opt-services.moodle.extraConfig}

Any additional text to be appended to the config.php
configuration file. This is a PHP script. For configuration
details, see [https://docs.moodle.org/37/en/Configuration\_file](https://docs.moodle.org/37/en/Configuration_file).

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  $CFG->disableupdatenotifications = true;
''
```

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.initialPassword` {#opt-services.moodle.initialPassword}

Specifies the initial password for the admin, i.e. the password assigned if the user does not already exist.
The password specified here is world-readable in the Nix store, so it should be changed promptly.

*Type:* string

*Example:* `"correcthorsebatterystaple"`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.package` {#opt-services.moodle.package}

The moodle package to use.

*Type:* package

*Default:* `pkgs.moodle`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.poolConfig` {#opt-services.moodle.poolConfig}

Options for the Moodle PHP pool. See the documentation on `php-fpm.conf`
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

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost` {#opt-services.moodle.virtualHost}

Apache configuration can be done by adapting [`services.httpd.virtualHosts`](../../options/services-h/index.md#opt-services.httpd.virtualHosts).
See [services (H)](../../options/services-h/index.md#opt-services.httpd.virtualHosts) for further information.

*Type:* submodule

*Example:*

``` nix
{
  hostName = "moodle.example.org";
  adminAddr = "webmaster@example.org";
  forceSSL = true;
  enableACME = true;
}
```

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.acmeRoot` {#opt-services.moodle.virtualHost.acmeRoot}

Directory for the acme challenge which is PUBLIC, don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.addSSL` {#opt-services.moodle.virtualHost.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.adminAddr` {#opt-services.moodle.virtualHost.adminAddr}

E-mail address of the server administrator.

*Type:* null or string

*Default:* `null`

*Example:* `"admin@example.org"`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.documentRoot` {#opt-services.moodle.virtualHost.documentRoot}

The path of Apache's document root directory.  If left undefined,
an empty directory in the Nix store will be used as root.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.enableACME` {#opt-services.moodle.virtualHost.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.enableUserDir` {#opt-services.moodle.virtualHost.enableUserDir}

Whether to enable serving `~/public_html` as
`/~«username»`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.extraConfig` {#opt-services.moodle.virtualHost.extraConfig}

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

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.forceSSL` {#opt-services.moodle.virtualHost.forceSSL}

Whether to add a separate nginx server block that permanently redirects (301)
all plain HTTP traffic to HTTPS. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443), where the non-SSL listens are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.globalRedirect` {#opt-services.moodle.virtualHost.globalRedirect}

If set, all requests for this host are redirected permanently to
the given URL.

*Type:* null or string

*Default:* `null`

*Example:* `"http://newserver.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.hostName` {#opt-services.moodle.virtualHost.hostName}

Canonical hostname for the server.

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.http2` {#opt-services.moodle.virtualHost.http2}

Whether to enable HTTP 2. HTTP/2 is supported in all multi-processing modules that come with httpd. *However, if you use the prefork mpm, there will
be severe restrictions.* Refer to [https://httpd.apache.org/docs/2.4/howto/http2.html#mpm-config](https://httpd.apache.org/docs/2.4/howto/http2.html#mpm-config) for details.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.listen` {#opt-services.moodle.virtualHost.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.listen.*.ip` {#opt-services.moodle.virtualHost.listen._.ip}

IP to listen on. 0.0.0.0 for IPv4 only, \* for all.

*Type:* string

*Default:* `"*"`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.listen.*.port` {#opt-services.moodle.virtualHost.listen._.port}

Port to listen on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.listen.*.ssl` {#opt-services.moodle.virtualHost.listen._.ssl}

Whether to enable SSL (https) support.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.listenAddresses` {#opt-services.moodle.virtualHost.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.locations` {#opt-services.moodle.virtualHost.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.locations.<name>.alias` {#opt-services.moodle.virtualHost.locations._name_.alias}

Alias directory for requests. See [https://httpd.apache.org/docs/2.4/mod/mod\_alias.html#alias](https://httpd.apache.org/docs/2.4/mod/mod_alias.html#alias).

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.locations.<name>.extraConfig` {#opt-services.moodle.virtualHost.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.locations.<name>.index` {#opt-services.moodle.virtualHost.locations._name_.index}

Adds DirectoryIndex directive. See [https://httpd.apache.org/docs/2.4/mod/mod\_dir.html#directoryindex](https://httpd.apache.org/docs/2.4/mod/mod_dir.html#directoryindex).

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.locations.<name>.priority` {#opt-services.moodle.virtualHost.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.locations.<name>.proxyPass` {#opt-services.moodle.virtualHost.locations._name_.proxyPass}

Sets up a simple reverse proxy as described by [https://httpd.apache.org/docs/2.4/howto/reverse\_proxy.html#simple](https://httpd.apache.org/docs/2.4/howto/reverse_proxy.html#simple).

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.logFormat` {#opt-services.moodle.virtualHost.logFormat}

Log format for Apache's log files. Possible values are: combined, common, referer, agent.

*Type:* string

*Default:* `"common"`

*Example:* `"combined"`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.onlySSL` {#opt-services.moodle.virtualHost.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.robotsEntries` {#opt-services.moodle.virtualHost.robotsEntries}

Specification of pages to be ignored by web crawlers. See [http://www.robotstxt.org/](http://www.robotstxt.org/) for details.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"Disallow: /foo/"`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.servedDirs` {#opt-services.moodle.virtualHost.servedDirs}

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

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.servedFiles` {#opt-services.moodle.virtualHost.servedFiles}

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

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.serverAliases` {#opt-services.moodle.virtualHost.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.sslServerCert` {#opt-services.moodle.virtualHost.sslServerCert}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.sslServerChain` {#opt-services.moodle.virtualHost.sslServerChain}

Path to server SSL chain file.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/ca.pem"`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.sslServerKey` {#opt-services.moodle.virtualHost.sslServerKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moodle.virtualHost.useACMEHost` {#opt-services.moodle.virtualHost.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/moodle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/moodle.nix)

## `services.moonraker.address` {#opt-services.moonraker.address}

The IP or host to listen on.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/moonraker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/moonraker.nix)

## `services.moonraker.allowSystemControl` {#opt-services.moonraker.allowSystemControl}

Whether to allow Moonraker to perform system-level operations.

Moonraker exposes APIs to perform system-level operations, such as
reboot, shutdown, and management of systemd units. See the
[documentation](https://moonraker.readthedocs.io/en/latest/web_api/#machine-commands)
for details on what clients are able to do.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/moonraker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/moonraker.nix)

## `services.moonraker.analysis.enable` {#opt-services.moonraker.analysis.enable}

Whether to enable Runtime analysis with klipper-estimator.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/moonraker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/moonraker.nix)

## `services.moonraker.configDir` {#opt-services.moonraker.configDir}

Deprecated directory containing client-writable configuration files.

Clients will be able to edit files in this directory via the API. This directory must be writable.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/moonraker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/moonraker.nix)

## `services.moonraker.enable` {#opt-services.moonraker.enable}

Whether to enable Moonraker, an API web server for Klipper.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/moonraker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/moonraker.nix)

## `services.moonraker.group` {#opt-services.moonraker.group}

Group account under which Moonraker runs.

*Type:* string

*Default:* `"moonraker"`

*Declared by:* [`nixos/modules/services/misc/moonraker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/moonraker.nix)

## `services.moonraker.klipperSocket` {#opt-services.moonraker.klipperSocket}

Path to Klipper's API socket.

*Type:* absolute path

*Default:* `config.services.klipper.apiSocket`

*Declared by:* [`nixos/modules/services/misc/moonraker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/moonraker.nix)

## `services.moonraker.package` {#opt-services.moonraker.package}

The moonraker package to use.

*Type:* null or package

*Default:* `pkgs.moonraker`

*Example:* `moonraker.override { useGpiod = true; }`

*Declared by:* [`nixos/modules/services/misc/moonraker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/moonraker.nix)

## `services.moonraker.port` {#opt-services.moonraker.port}

The port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `7125`

*Declared by:* [`nixos/modules/services/misc/moonraker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/moonraker.nix)

## `services.moonraker.settings` {#opt-services.moonraker.settings}

Configuration for Moonraker. See the [documentation](https://moonraker.readthedocs.io/en/latest/configuration/)
for supported values.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string) or a non-empty list of them)

*Default:* `{ }`

*Example:*

``` nix
{
  authorization = {
    cors_domains = [
      "https://app.fluidd.xyz"
      "https://my.mainsail.xyz"
    ];
    trusted_clients = [
      "10.0.0.0/24"
    ];
  };
}
```

*Declared by:* [`nixos/modules/services/misc/moonraker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/moonraker.nix)

## `services.moonraker.stateDir` {#opt-services.moonraker.stateDir}

The directory containing the Moonraker databases.

*Type:* absolute path

*Default:* `"/var/lib/moonraker"`

*Declared by:* [`nixos/modules/services/misc/moonraker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/moonraker.nix)

## `services.moonraker.user` {#opt-services.moonraker.user}

User account under which Moonraker runs.

*Type:* string

*Default:* `"moonraker"`

*Declared by:* [`nixos/modules/services/misc/moonraker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/moonraker.nix)

## `services.moonshine.enable` {#opt-services.moonshine.enable}

Whether to enable Moonshine, a headless game streaming server for Moonlight clients.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/moonshine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/moonshine.nix)

## `services.moonshine.environment` {#opt-services.moonshine.environment}

Environment variables set for Moonshine.

::: note
Those are not inherited by launched applications.
:::

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  MESA_VK_DEVICE_SELECT = "10de:25a2!";
}
```

*Declared by:* [`nixos/modules/services/networking/moonshine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/moonshine.nix)

## `services.moonshine.extraPackages` {#opt-services.moonshine.extraPackages}

Packages added to the service's `PATH` for applications launched
by Moonshine.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.steam ]`

*Declared by:* [`nixos/modules/services/networking/moonshine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/moonshine.nix)

## `services.moonshine.firewallInterfaces` {#opt-services.moonshine.firewallInterfaces}

Network interfaces on which to open the Moonlight/GameStream ports.
The ports are not opened when this list is empty.
Moonshine is not designed for use on public networks. Do not expose Moonshine ports directly to the internet. See https://github.com/hgaiser/moonshine#security

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "tailscale0"
  "wg0"
]
```

*Declared by:* [`nixos/modules/services/networking/moonshine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/moonshine.nix)

## `services.moonshine.package` {#opt-services.moonshine.package}

The moonshine package to use.

*Type:* package

*Default:* `pkgs.moonshine`

*Declared by:* [`nixos/modules/services/networking/moonshine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/moonshine.nix)

## `services.moonshine.settings` {#opt-services.moonshine.settings}

Moonshine configuration, generated as a TOML file in the Nix store.
See [https://github.com/hgaiser/moonshine/blob/main/moonshine-core/src/config.rs](https://github.com/hgaiser/moonshine/blob/main/moonshine-core/src/config.rs)
for the available settings and [https://github.com/hgaiser/moonshine#configuration](https://github.com/hgaiser/moonshine#configuration) for some examples.

Do not leave this option empty: Moonshine's upstream defaults configure
Steam at `/usr/bin/steam`, which does not exist on NixOS. Define
at least `application` with an executable in the Nix store, as shown in
the example. Setting `application` explicitly is sufficient;
`application_scanners` may be omitted.

Moonshine stores `cert.pem` and `key.pem` in
`~/.config/moonshine/`, and paired-client state in
`~/.local/share/moonshine/state.toml` for the configured user.

Since the service runs without a desktop session, its notification
action cannot reliably open the pairing page. Pair clients by visiting
`http://<host>:47989/pin` in a browser instead.

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  name = "my-desktop";
  address = "0.0.0.0";
  application = [
    {
      title = "Steam";
      command = [ "steam" "steam://open/bigpicture" ];
    }
  ];
  application_scanner = [
    {
      type = "steam";
      library = "$HOME/.local/share/Steam";
      command = [ "steam" "-bigpicture" "steam://rungameid/{game_id}" ];
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/networking/moonshine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/moonshine.nix)

## `services.moonshine.user` {#opt-services.moonshine.user}

User under which to run Moonshine. The user must be declared separately
in [`users.users`](../../options/users/index.md#opt-users.users). Lingering is enabled automatically so the
server can run without an active login session.

*Type:* non-empty string

*Example:* `"alice"`

*Declared by:* [`nixos/modules/services/networking/moonshine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/moonshine.nix)

## `services.moosefs.cgiserver.enable` {#opt-services.moosefs.cgiserver.enable}

Whether to enable MooseFS GUI server (mfsgui) for web interface.
Warning: The GUI server interface should be properly secured from unauthorized access,
as it provides full control over your MooseFS installation.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/moosefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/moosefs.nix)

## `services.moosefs.cgiserver.openFirewall` {#opt-services.moosefs.cgiserver.openFirewall}

Whether to automatically open the web interface port.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/moosefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/moosefs.nix)

## `services.moosefs.cgiserver.settings` {#opt-services.moosefs.cgiserver.settings}

GUI server configuration options.

*Type:* open submodule of attribute set of (Flat key-value file)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/network-filesystems/moosefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/moosefs.nix)

## `services.moosefs.cgiserver.settings.DATA_PATH` {#opt-services.moosefs.cgiserver.settings.DATA_PATH}

Directory for lock files.

*Type:* string

*Default:* `"/var/lib/mfs"`

*Declared by:* [`nixos/modules/services/network-filesystems/moosefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/moosefs.nix)

## `services.moosefs.cgiserver.settings.GUISERV_LISTEN_HOST` {#opt-services.moosefs.cgiserver.settings.GUISERV_LISTEN_HOST}

IP address to bind GUI server to (\* means any).

*Type:* string

*Default:* `"*"`

*Declared by:* [`nixos/modules/services/network-filesystems/moosefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/moosefs.nix)

## `services.moosefs.cgiserver.settings.GUISERV_LISTEN_PORT` {#opt-services.moosefs.cgiserver.settings.GUISERV_LISTEN_PORT}

Port for GUI server to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9425`

*Declared by:* [`nixos/modules/services/network-filesystems/moosefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/moosefs.nix)

## `services.moosefs.chunkserver.enable` {#opt-services.moosefs.chunkserver.enable}

Whether to enable MooseFS chunkserver daemon that stores file data.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/moosefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/moosefs.nix)

## `services.moosefs.chunkserver.hdds` {#opt-services.moosefs.chunkserver.hdds}

Mount points used by chunkserver for data storage (see mfshdd.cfg).

*Type:* list of string

*Default:* `null`

*Example:*

``` nix
[
  "/mnt/hdd1"
  "/mnt/hdd2"
]
```

*Declared by:* [`nixos/modules/services/network-filesystems/moosefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/moosefs.nix)

## `services.moosefs.chunkserver.openFirewall` {#opt-services.moosefs.chunkserver.openFirewall}

Whether to automatically open required firewall ports for chunkserver service.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/moosefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/moosefs.nix)

## `services.moosefs.chunkserver.settings` {#opt-services.moosefs.chunkserver.settings}

Chunkserver configuration options (mfschunkserver.cfg).

*Type:* open submodule of attribute set of (Flat key-value file)

*Declared by:* [`nixos/modules/services/network-filesystems/moosefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/moosefs.nix)

## `services.moosefs.chunkserver.settings.DATA_PATH` {#opt-services.moosefs.chunkserver.settings.DATA_PATH}

Directory for lock files and other runtime data.

*Type:* string

*Default:* `"/var/lib/mfs"`

*Declared by:* [`nixos/modules/services/network-filesystems/moosefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/moosefs.nix)

## `services.moosefs.client.enable` {#opt-services.moosefs.client.enable}

Whether to enable MooseFS client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/moosefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/moosefs.nix)

## `services.moosefs.master.autoInit` {#opt-services.moosefs.master.autoInit}

Whether to automatically initialize the master's metadata directory on first run. Use with caution.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/moosefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/moosefs.nix)

## `services.moosefs.master.enable` {#opt-services.moosefs.master.enable}

Enable MooseFS master daemon.
The master server coordinates all MooseFS operations and stores metadata.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/moosefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/moosefs.nix)

## `services.moosefs.master.exports` {#opt-services.moosefs.master.exports}

Export definitions for MooseFS (see mfsexports.cfg).

*Type:* list of string

*Default:* `null`

*Example:*

``` nix
[
  "* / rw,alldirs,admin,maproot=0:0"
  "* . rw"
]
```

*Declared by:* [`nixos/modules/services/network-filesystems/moosefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/moosefs.nix)

## `services.moosefs.master.openFirewall` {#opt-services.moosefs.master.openFirewall}

Whether to automatically open required firewall ports for master service.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/moosefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/moosefs.nix)

## `services.moosefs.master.settings` {#opt-services.moosefs.master.settings}

Master configuration options (mfsmaster.cfg).

*Type:* open submodule of attribute set of (Flat key-value file)

*Declared by:* [`nixos/modules/services/network-filesystems/moosefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/moosefs.nix)

## `services.moosefs.master.settings.DATA_PATH` {#opt-services.moosefs.master.settings.DATA_PATH}

Directory for storing master metadata.

*Type:* string

*Default:* `"/var/lib/mfs"`

*Declared by:* [`nixos/modules/services/network-filesystems/moosefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/moosefs.nix)

## `services.moosefs.masterHost` {#opt-services.moosefs.masterHost}

IP or DNS name of the MooseFS master server.

*Type:* string

*Default:* `null`

*Declared by:* [`nixos/modules/services/network-filesystems/moosefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/moosefs.nix)

## `services.moosefs.metalogger.enable` {#opt-services.moosefs.metalogger.enable}

Whether to enable MooseFS metalogger daemon that maintains a backup copy of the master's metadata.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/moosefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/moosefs.nix)

## `services.moosefs.metalogger.settings` {#opt-services.moosefs.metalogger.settings}

Metalogger configuration options (mfsmetalogger.cfg).

*Type:* open submodule of attribute set of (Flat key-value file)

*Declared by:* [`nixos/modules/services/network-filesystems/moosefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/moosefs.nix)

## `services.moosefs.metalogger.settings.DATA_PATH` {#opt-services.moosefs.metalogger.settings.DATA_PATH}

Directory for storing metalogger data.

*Type:* string

*Default:* `"/var/lib/mfs"`

*Declared by:* [`nixos/modules/services/network-filesystems/moosefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/moosefs.nix)

## `services.moosefs.runAsUser` {#opt-services.moosefs.runAsUser}

Run daemons as moosefs user instead of root for better security.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/moosefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/moosefs.nix)

## `services.mopidy.dataDir` {#opt-services.mopidy.dataDir}

The directory where Mopidy stores its state.

*Type:* string

*Default:* `"/var/lib/mopidy"`

*Declared by:* [`nixos/modules/services/audio/mopidy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mopidy.nix)

## `services.mopidy.enable` {#opt-services.mopidy.enable}

Whether to enable Mopidy, a music player daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/mopidy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mopidy.nix)

## `services.mopidy.extensionPackages` {#opt-services.mopidy.extensionPackages}

Mopidy extensions that should be loaded by the service.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.mopidy-spotify ]`

*Declared by:* [`nixos/modules/services/audio/mopidy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mopidy.nix)

## `services.mopidy.extraConfigFiles` {#opt-services.mopidy.extraConfigFiles}

Extra config file read by Mopidy when the service starts.
Later files in the list overrides earlier configuration.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/audio/mopidy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mopidy.nix)

## `services.mopidy.settings` {#opt-services.mopidy.settings}

The configuration that Mopidy should use.
See the upstream documentation [https://docs.mopidy.com/stable/config/](https://docs.mopidy.com/stable/config/) for details.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  mpd = {
    enabled = true;
    hostname = "::";
  };
}
```

*Declared by:* [`nixos/modules/services/audio/mopidy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mopidy.nix)

## `services.mosquitto.bridges` {#opt-services.mosquitto.bridges}

Bridges to build to other MQTT brokers.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.bridges.<name>.addresses` {#opt-services.mosquitto.bridges._name_.addresses}

Remote endpoints for the bridge.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.bridges.<name>.addresses.*.address` {#opt-services.mosquitto.bridges._name_.addresses._.address}

Address of the remote MQTT broker.

*Type:* single-line string

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.bridges.<name>.addresses.*.port` {#opt-services.mosquitto.bridges._name_.addresses._.port}

Port of the remote MQTT broker.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1883`

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.bridges.<name>.settings` {#opt-services.mosquitto.bridges._name_.settings}

Additional settings for this bridge.

*Type:* open submodule of attribute set of (string, path, bool, or integer)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.bridges.<name>.topics` {#opt-services.mosquitto.bridges._name_.topics}

Topic patterns to be shared between the two brokers.
Refer to the [
mosquitto.conf documentation](https://mosquitto.org/man/mosquitto-conf-5.html) for details on the format.

*Type:* list of single-line string

*Default:* `[ ]`

*Example:*

``` nix
[
  "# both 2 local/topic/ remote/topic/"
]
```

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.dataDir` {#opt-services.mosquitto.dataDir}

The data directory.

*Type:* absolute path

*Default:* `"/var/lib/mosquitto"`

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.enable` {#opt-services.mosquitto.enable}

Whether to enable the MQTT Mosquitto broker.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.includeDirs` {#opt-services.mosquitto.includeDirs}

Directories to be scanned for further config files to include.
Directories will processed in the order given,
`*.conf` files in the directory will be
read in case-sensitive alphabetical order.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.listeners` {#opt-services.mosquitto.listeners}

Listeners to configure on this broker.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.listeners.*.acl` {#opt-services.mosquitto.listeners._.acl}

Additional ACL items to prepend to the generated ACL file.

*Type:* list of single-line string

*Default:* `[ ]`

*Example:*

``` nix
[
  "pattern read #"
  "topic readwrite anon/report/#"
]
```

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.listeners.*.address` {#opt-services.mosquitto.listeners._.address}

Address to listen on. Listen on `0.0.0.0`/`::`
when unset.

*Type:* null or single-line string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.listeners.*.authPlugins` {#opt-services.mosquitto.listeners._.authPlugins}

Authentication plugin to attach to this listener.
Refer to the [mosquitto.conf documentation](https://mosquitto.org/man/mosquitto-conf-5.html)
for details on authentication plugins.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.listeners.*.authPlugins.*.denySpecialChars` {#opt-services.mosquitto.listeners._.authPlugins._.denySpecialChars}

Automatically disallow all clients using `#`
or `+` in their name/id.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.listeners.*.authPlugins.*.options` {#opt-services.mosquitto.listeners._.authPlugins._.options}

Options for the plugin. Each key turns into a `plugin_opt_*`
line in the config.

*Type:* attribute set of (string, path, bool, or integer)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.listeners.*.authPlugins.*.plugin` {#opt-services.mosquitto.listeners._.authPlugins._.plugin}

Plugin path to load, should be a `.so` file.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.listeners.*.omitPasswordAuth` {#opt-services.mosquitto.listeners._.omitPasswordAuth}

Omits password checking, allowing anyone to log in with any user name unless
other mandatory authentication methods (eg TLS client certificates) are configured.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.listeners.*.port` {#opt-services.mosquitto.listeners._.port}

Port to listen on. Must be set to 0 to listen on a unix domain socket.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1883`

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.listeners.*.settings` {#opt-services.mosquitto.listeners._.settings}

Additional settings for this listener.

*Type:* open submodule of attribute set of (string, path, bool, or integer)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.listeners.*.users` {#opt-services.mosquitto.listeners._.users}

A set of users and their passwords and ACLs.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  john = {
    acl = [
      "readwrite john/#"
    ];
    password = "123456";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.listeners.*.users.<name>.acl` {#opt-services.mosquitto.listeners._.users._name_.acl}

Control client access to topics on the broker.

*Type:* list of single-line string

*Default:* `[ ]`

*Example:*

``` nix
[
  "read A/B"
  "readwrite A/#"
]
```

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.listeners.*.users.<name>.hashedPassword` {#opt-services.mosquitto.listeners._.users._name_.hashedPassword}

Specifies the hashed password for the MQTT User.
To generate hashed password install the `mosquitto`
package and use `mosquitto_passwd`, then extract
the second field (after the `:`) from the generated
file.

*Type:* null or single-line string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.listeners.*.users.<name>.hashedPasswordFile` {#opt-services.mosquitto.listeners._.users._name_.hashedPasswordFile}

Specifies the path to a file containing the
hashed password for the MQTT user.
To generate hashed password install the `mosquitto`
package and use `mosquitto_passwd`, then remove the
`username:` prefix from the generated file.
The file is securely passed to mosquitto by
leveraging systemd credentials. No special
permissions need to be set on this file.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/path/to/file"`

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.listeners.*.users.<name>.password` {#opt-services.mosquitto.listeners._.users._name_.password}

Specifies the (clear text) password for the MQTT User.

*Type:* null or single-line string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.listeners.*.users.<name>.passwordFile` {#opt-services.mosquitto.listeners._.users._name_.passwordFile}

Specifies the path to a file containing the
clear text password for the MQTT user.
The file is securely passed to mosquitto by
leveraging systemd credentials. No special
permissions need to be set on this file.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/path/to/file"`

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.logDest` {#opt-services.mosquitto.logDest}

Destinations to send log messages to.

*Type:* list of (absolute path or one of "stdout", "stderr", "syslog", "topic", "dlt")

*Default:*

``` nix
[
  "stderr"
]
```

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.logType` {#opt-services.mosquitto.logType}

Types of messages to log.

*Type:* list of (one of "debug", "error", "warning", "notice", "information", "subscribe", "unsubscribe", "websockets", "none", "all")

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.package` {#opt-services.mosquitto.package}

The mosquitto package to use.

*Type:* package

*Default:* `pkgs.mosquitto`

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.persistence` {#opt-services.mosquitto.persistence}

Enable persistent storage of subscriptions and messages.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.mosquitto.settings` {#opt-services.mosquitto.settings}

Global configuration options for the mosquitto broker.

*Type:* open submodule of attribute set of (string, path, bool, or integer)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/mosquitto.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mosquitto.nix)

## `services.motioneye.enable` {#opt-services.motioneye.enable}

Whether to enable motionEye.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/video/motioneye.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/motioneye.nix)

## `services.motioneye.group` {#opt-services.motioneye.group}

Group to run motionEye under.

*Type:* string

*Default:* `"motioneye"`

*Declared by:* [`nixos/modules/services/video/motioneye.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/motioneye.nix)

## `services.motioneye.packages.ffmpeg` {#opt-services.motioneye.packages.ffmpeg}

The ffmpeg-headless package to use.

*Type:* package

*Default:* `pkgs.ffmpeg-headless`

*Declared by:* [`nixos/modules/services/video/motioneye.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/motioneye.nix)

## `services.motioneye.packages.motion` {#opt-services.motioneye.packages.motion}

The motion package to use.

*Type:* package

*Default:* `pkgs.motion`

*Declared by:* [`nixos/modules/services/video/motioneye.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/motioneye.nix)

## `services.motioneye.packages.motioneye` {#opt-services.motioneye.packages.motioneye}

The motioneye package to use.

*Type:* package

*Default:* `pkgs.motioneye`

*Declared by:* [`nixos/modules/services/video/motioneye.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/motioneye.nix)

## `services.motioneye.settings` {#opt-services.motioneye.settings}

Configuration to put in motioneye.conf.
See [https://github.com/motioneye-project/motioneye/wiki/Configuration-File](https://github.com/motioneye-project/motioneye/wiki/Configuration-File)  for more details.

*Type:* attribute set of string

*Default:*

``` nix
{
  conf_path = lib.mkDefault "/var/lib/motioneye/conf";
  run_path = lib.mkDefault "/run/motioneye";
  log_path = lib.mkDefault "/var/log/motioneye";
  media_path = lib.mkDefault "/var/lib/motioneye/media";
}
```

*Declared by:* [`nixos/modules/services/video/motioneye.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/motioneye.nix)

## `services.motioneye.user` {#opt-services.motioneye.user}

User to run motionEye under.

*Type:* string

*Default:* `"motioneye"`

*Declared by:* [`nixos/modules/services/video/motioneye.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/motioneye.nix)

## `services.movim.dataDir` {#opt-services.movim.dataDir}

State directory of the `movim` user which holds the application’s state & data.

*Type:* absolute path

*Default:* `"/var/lib/movim"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.database.createLocally` {#opt-services.movim.database.createLocally}

local database using UNIX socket authentication

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.database.name` {#opt-services.movim.database.name}

Database name.

*Type:* non-empty string

*Default:* `"movim"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.database.type` {#opt-services.movim.database.type}

Database engine to use.

*Type:* one of "mariadb", "postgresql"

*Default:* `"postgresql"`

*Example:* `"mariadb"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.database.user` {#opt-services.movim.database.user}

Database username.

*Type:* non-empty string

*Default:* `"movim"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.debug` {#opt-services.movim.debug}

Debugging logs.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.domain` {#opt-services.movim.domain}

Fully-qualified domain name (FQDN) for the Movim instance.

*Type:* non-empty string

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.enable` {#opt-services.movim.enable}

Whether to enable a Movim instance.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.group` {#opt-services.movim.group}

Group running Movim service

*Type:* non-empty string

*Default:* `"movim"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.h2o` {#opt-services.movim.h2o}

With this option, you can customize an H2O virtual host which already
has sensible defaults for Movim. Set to `{ }` if you do not need any
customization to the virtual host. If enabled, then by default, the
`serverName` is `$`, If this is set to`null` (the
default), no H2O `hosts` will be configured.

*Type:* null or (submodule)

*Default:* `null`

*Example:*

``` nix
{
  serverAliases = [
    "pics.${config.movim.domain}"
  ];
  acme.enable = true;
  tls.policy = "force";
}
```

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.h2o.acme` {#opt-services.movim.h2o.acme}

ACME options for virtual host.

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.h2o.acme.enable` {#opt-services.movim.h2o.acme.enable}

Whether to ask Let’s Encrypt to sign a certificate for this
virtual host. Alternatively, an existing host can be used thru
`acme.useHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.h2o.acme.root` {#opt-services.movim.h2o.acme.root}

Directory for the ACME challenge, which is **public**. Don’t put
certs or keys in here. Set to `null` to inherit from
config.security.acme.

*Type:* null or absolute path

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.h2o.acme.useHost` {#opt-services.movim.h2o.acme.useHost}

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

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.h2o.host` {#opt-services.movim.h2o.host}

Set the host address for this virtual host. If unset, the default is to
listen on all network interfaces.

*Type:* null or non-empty string

*Default:* `null`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.h2o.http` {#opt-services.movim.h2o.http}

HTTP options for virtual host

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.h2o.http.port` {#opt-services.movim.h2o.http.port}

Override the default HTTP port for this virtual host.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
config.services.h2o.defaultHTTPListenPort
```

*Example:* `8080`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.h2o.serverAliases` {#opt-services.movim.h2o.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.h2o.serverName` {#opt-services.movim.h2o.serverName}

Server name to be used for this virtual host. Defaults to attribute
name in hosts.

*Type:* null or non-empty string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.h2o.settings` {#opt-services.movim.h2o.settings}

Attrset to be transformed into YAML for host config. Note that the HTTP
/ TLS configurations will override these config values. See
[https://h2o.examp1e.net/configure/base\_directives.html#hosts](https://h2o.examp1e.net/configure/base_directives.html#hosts).

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.h2o.tls` {#opt-services.movim.h2o.tls}

TLS options for virtual host

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.h2o.tls.extraSettings` {#opt-services.movim.h2o.tls.extraSettings}

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

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.h2o.tls.identity` {#opt-services.movim.h2o.tls.identity}

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

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.h2o.tls.identity.*.certificate-file` {#opt-services.movim.h2o.tls.identity._.certificate-file}

Path to certificate file. See
[https://h2o.examp1e.net/configure/base\_directives.html#certificate-file](https://h2o.examp1e.net/configure/base_directives.html#certificate-file).

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.h2o.tls.identity.*.key-file` {#opt-services.movim.h2o.tls.identity._.key-file}

Path to key file. See
[https://h2o.examp1e.net/configure/base\_directives.html#key-file](https://h2o.examp1e.net/configure/base_directives.html#key-file).

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.h2o.tls.policy` {#opt-services.movim.h2o.tls.policy}

`add` will additionally listen for TLS connections. `only` will
disable   TLS connections. `force` will redirect non-TLS traffic
to the TLS connection.

*Type:* one of "add", "only", "force"

*Example:* `"force"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.h2o.tls.port` {#opt-services.movim.h2o.tls.port}

Override the default TLS port for this virtual host.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
config.services.h2o.defaultTLSListenPort
```

*Example:* `8443`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.h2o.tls.quic` {#opt-services.movim.h2o.tls.quic}

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

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.h2o.tls.recommendations` {#opt-services.movim.h2o.tls.recommendations}

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

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.h2o.tls.redirectCode` {#opt-services.movim.h2o.tls.redirectCode}

HTTP status used by `globalRedirect` & `forceSSL`. Possible
usecases include temporary (302, 307) redirects, keeping the
request method & body (307, 308), or explicitly resetting the
method to GET (303). See
[https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.logDir` {#opt-services.movim.logDir}

Log directory of the `movim` user which holds the application’s logs.

*Type:* absolute path

*Default:* `"/var/log/movim"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.minifyStaticFiles` {#opt-services.movim.minifyStaticFiles}

Do minification on public static files which reduces the size of
assets — saving data for the server & users as well as offering a
performance improvement. This adds typing for the `minifyStaticFiles`
attribute for the Movim package which *will* override any existing
override value. The default `true` will enable minification for all
supported asset types with sane defaults.

*Type:* boolean or (submodule)

*Default:* `true`

*Example:*

``` nix
{
  script.enable = false;
  style = {
    enable = true;
    target = "> 0.5%, last 2 versions, Firefox ESR, not dead";
  };
  svg.enable = true;
}
```

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx` {#opt-services.movim.nginx}

With this option, you can customize an Nginx virtual host which
already has sensible defaults for Movim. Set to `{ }` if you do not
need any customization to the virtual host. If enabled, then by
default, the `serverName` is `$`, If this is set to`null` (the default), no Nginx `virtualHost` will be configured.

*Type:* null or (submodule)

*Default:* `null`

*Example:*

``` nix
{
  serverAliases = [
    "pics.${config.movim.domain}"
  ];
  enableACME = true;
  forceHttps = true;
}
```

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.acmeFallbackHost` {#opt-services.movim.nginx.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.acmeRoot` {#opt-services.movim.nginx.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.addSSL` {#opt-services.movim.nginx.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.basicAuth` {#opt-services.movim.nginx.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.basicAuthFile` {#opt-services.movim.nginx.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.default` {#opt-services.movim.nginx.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.enableACME` {#opt-services.movim.nginx.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.extraConfig` {#opt-services.movim.nginx.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.forceSSL` {#opt-services.movim.nginx.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.globalRedirect` {#opt-services.movim.nginx.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.http2` {#opt-services.movim.nginx.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.http3` {#opt-services.movim.nginx.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.http3_hq` {#opt-services.movim.nginx.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.kTLS` {#opt-services.movim.nginx.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.listen` {#opt-services.movim.nginx.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.listen.*.addr` {#opt-services.movim.nginx.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.listen.*.extraParameters` {#opt-services.movim.nginx.listen._.extraParameters}

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

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.listen.*.port` {#opt-services.movim.nginx.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.listen.*.proxyProtocol` {#opt-services.movim.nginx.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.listen.*.ssl` {#opt-services.movim.nginx.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.listenAddresses` {#opt-services.movim.nginx.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.locations` {#opt-services.movim.nginx.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.locations.<name>.alias` {#opt-services.movim.nginx.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.locations.<name>.basicAuth` {#opt-services.movim.nginx.locations._name_.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.locations.<name>.basicAuthFile` {#opt-services.movim.nginx.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.locations.<name>.extraConfig` {#opt-services.movim.nginx.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.locations.<name>.fastcgiParams` {#opt-services.movim.nginx.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.locations.<name>.index` {#opt-services.movim.nginx.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.locations.<name>.priority` {#opt-services.movim.nginx.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.locations.<name>.proxyPass` {#opt-services.movim.nginx.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.locations.<name>.proxyWebsockets` {#opt-services.movim.nginx.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.locations.<name>.recommendedProxySettings` {#opt-services.movim.nginx.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.locations.<name>.recommendedUwsgiSettings` {#opt-services.movim.nginx.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.locations.<name>.return` {#opt-services.movim.nginx.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.locations.<name>.root` {#opt-services.movim.nginx.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.locations.<name>.tryFiles` {#opt-services.movim.nginx.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.locations.<name>.useGrpcErrorPages` {#opt-services.movim.nginx.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.locations.<name>.uwsgiPass` {#opt-services.movim.nginx.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.onlySSL` {#opt-services.movim.nginx.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.quic` {#opt-services.movim.nginx.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.redirectCode` {#opt-services.movim.nginx.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.rejectSSL` {#opt-services.movim.nginx.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.reuseport` {#opt-services.movim.nginx.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.root` {#opt-services.movim.nginx.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.serverAliases` {#opt-services.movim.nginx.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.serverName` {#opt-services.movim.nginx.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.sslCertificate` {#opt-services.movim.nginx.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.sslCertificateKey` {#opt-services.movim.nginx.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.sslTrustedCertificate` {#opt-services.movim.nginx.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.nginx.useACMEHost` {#opt-services.movim.nginx.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.package` {#opt-services.movim.package}

The movim package to use.

*Type:* package

*Default:* `pkgs.movim`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.phpCfg` {#opt-services.movim.phpCfg}

Extra PHP INI options such as `memory_limit`, `max_execution_time`, etc.

*Type:* attribute set of (signed integer or string or boolean)

*Default:*

``` nix
{
  error_reporting = "E_ALL & ~E_DEPRECATED & ~E_STRICT";
  "opcache.enable_cli" = 1;
  "opcache.fast_shutdown" = 1;
  "opcache.interned_strings_buffer" = 8;
  "opcache.max_accelerated_files" = 6144;
  "opcache.memory_consumption" = 128;
  "opcache.revalidate_freq" = 2;
  output_buffering = 0;
}
```

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.phpPackage` {#opt-services.movim.phpPackage}

The php package to use.

*Type:* package

*Default:* `pkgs.php`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.podConfig` {#opt-services.movim.podConfig}

Pod configuration (values from `php daemon.php config --help`).
Note that these values will now be disabled in the admin panel.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.podConfig.chatonly` {#opt-services.movim.podConfig.chatonly}

Disable all the social feature (Communities, Blog…) and keep only the chat ones

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.podConfig.description` {#opt-services.movim.podConfig.description}

General description of the instance

*Type:* null or non-empty string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.podConfig.disableregistration` {#opt-services.movim.podConfig.disableregistration}

Remove the XMPP registration flow and buttons from the interface

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.podConfig.info` {#opt-services.movim.podConfig.info}

Content of the info box on the login page

*Type:* null or non-empty string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.podConfig.locale` {#opt-services.movim.podConfig.locale}

The server main locale

*Type:* null or non-empty string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.podConfig.loglevel` {#opt-services.movim.podConfig.loglevel}

The server loglevel

*Type:* null or integer between 0 and 3 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.podConfig.restrictsuggestions` {#opt-services.movim.podConfig.restrictsuggestions}

Only suggest chatrooms, Communities and other contents that are available on the user XMPP server and related services

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.podConfig.timezone` {#opt-services.movim.podConfig.timezone}

The server timezone

*Type:* null or non-empty string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.podConfig.xmppdescription` {#opt-services.movim.podConfig.xmppdescription}

The default XMPP server description

*Type:* null or non-empty string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.podConfig.xmppdomain` {#opt-services.movim.podConfig.xmppdomain}

The default XMPP server domain

*Type:* null or non-empty string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.podConfig.xmppwhitelist` {#opt-services.movim.podConfig.xmppwhitelist}

The allowlisted XMPP servers

*Type:* null or non-empty string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.poolConfig` {#opt-services.movim.poolConfig}

Options for Movim’s PHP-FPM pool.

*Type:* attribute set of (signed integer or string or boolean)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.port` {#opt-services.movim.port}

Movim daemon port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.precompressStaticFiles` {#opt-services.movim.precompressStaticFiles}

Aggressively precompress static files

*Type:* submodule

*Default:*

``` nix
{
  brotli = {
    enable = true;
  };
  gzip = {
    enable = false;
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.precompressStaticFiles.brotli.compressionLevel` {#opt-services.movim.precompressStaticFiles.brotli.compressionLevel}

Brotli compression level

*Type:* integer between 0 and 11 (both inclusive)

*Default:* `11`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.precompressStaticFiles.brotli.enable` {#opt-services.movim.precompressStaticFiles.brotli.enable}

Whether to enable Brotli precompression.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.precompressStaticFiles.brotli.package` {#opt-services.movim.precompressStaticFiles.brotli.package}

The brotli package to use.

*Type:* package

*Default:* `pkgs.brotli`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.precompressStaticFiles.gzip.compressionLevel` {#opt-services.movim.precompressStaticFiles.gzip.compressionLevel}

Gzip compression level

*Type:* integer between 1 and 9 (both inclusive)

*Default:* `9`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.precompressStaticFiles.gzip.enable` {#opt-services.movim.precompressStaticFiles.gzip.enable}

Whether to enable Gzip precompression.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.precompressStaticFiles.gzip.package` {#opt-services.movim.precompressStaticFiles.gzip.package}

The gzip package to use.

*Type:* package

*Default:* `pkgs.gzip`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.runtimeDir` {#opt-services.movim.runtimeDir}

Runtime directory of the `movim` user which holds the application’s caches & temporary files.

*Type:* absolute path

*Default:* `"/run/movim"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.secretFile` {#opt-services.movim.secretFile}

The secret file to be sourced for the .env settings.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.settings` {#opt-services.movim.settings}

.env settings for Movim. Secrets should use `secretFile` option instead. `null`s will be culled.

*Type:* attribute set of (null or signed integer or string or boolean)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.user` {#opt-services.movim.user}

User running Movim service

*Type:* non-empty string

*Default:* `"movim"`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.movim.verbose` {#opt-services.movim.verbose}

Verbose logs.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/movim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/movim.nix)

## `services.mozillavpn.enable` {#opt-services.mozillavpn.enable}

Whether to enable Mozilla VPN daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/mozillavpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mozillavpn.nix)

## `services.mpd.credentials` {#opt-services.mpd.credentials}

Credentials and permissions for accessing the mpd server.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    passwordFile = "/var/lib/secrets/mpd_readonly_password";
    permissions = [
      "read"
    ];
  }
  {
    passwordFile = "/var/lib/secrets/mpd_admin_password";
    permissions = [
      "read"
      "add"
      "player"
      "control"
      "admin"
    ];
  }
]
```

*Declared by:* [`nixos/modules/services/audio/mpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpd.nix)

## `services.mpd.credentials.*.passwordFile` {#opt-services.mpd.credentials._.passwordFile}

Path to file containing the password.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/audio/mpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpd.nix)

## `services.mpd.credentials.*.permissions` {#opt-services.mpd.credentials._.permissions}

List of permissions that are granted with this password.
Permissions can be "read", "add", "player", "control", "admin".

*Type:* list of (one of "read", "add", "player", "control", "admin")

*Default:*

``` nix
[
  "read"
]
```

*Declared by:* [`nixos/modules/services/audio/mpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpd.nix)

## `services.mpd.dataDir` {#opt-services.mpd.dataDir}

The directory where MPD stores its state, tag cache, playlists etc. If
left as the default value this directory will automatically be created
before the MPD server starts, otherwise the sysadmin is responsible for
ensuring the directory exists with appropriate ownership and permissions.

*Type:* absolute path

*Default:* `"/var/lib/mpd"`

*Declared by:* [`nixos/modules/services/audio/mpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpd.nix)

## `services.mpd.enable` {#opt-services.mpd.enable}

Whether to enable MPD, the music player daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/audio/mpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpd.nix)

## `services.mpd.fluidsynth` {#opt-services.mpd.fluidsynth}

If set, add fluidsynth soundfont `decoder` block.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/audio/mpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpd.nix)

## `services.mpd.group` {#opt-services.mpd.group}

Group account under which MPD runs.

*Type:* string

*Default:* `"mpd"`

*Declared by:* [`nixos/modules/services/audio/mpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpd.nix)

## `services.mpd.openFirewall` {#opt-services.mpd.openFirewall}

Open ports in the firewall for mpd. If `null` (default), you might
get a warning asking you to set it explicitly to `true` or `false`,
depending upon the value of `services.mpd.settings.bind_to_address`.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/audio/mpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpd.nix)

## `services.mpd.settings` {#opt-services.mpd.settings}

Configuration for MPD. MPD supports key-value like blocks for settings
like `audio_output` and `neighbor`. Some of these blocks can be
specified multiple times, so the following configuration:

``` txt
audio_output {
    device "iec958:CARD=Intel,DEV=0"
    mixer_control "PCM"
    name "My specific ALSA output"
    type "alsa"
}
audio_output {
    mixer_type "null"
    name "ALSA Null"
    type "alsa"
}
audio_output {
    name "The Pulse"
    type "pulse"
}
```

Can be inserted with:

``` nix
audio_output = [
  {
    type = "alsa";
    name = "My specific ALSA output";
    device = "iec958:CARD=Intel,DEV=0";
    mixer_control = "PCM";
  }
  {
    type = "alsa";
    name = "ALSA Null";
    mixer_type = "null";
  }
  {
    type = "pulse";
    name = "The Pulse";
  }
];
```

*Type:* open submodule of attribute set of (string or signed integer or boolean or absolute path or list of attribute set of (string or signed integer or boolean or absolute path))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/audio/mpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpd.nix)

## `services.mpd.settings.bind_to_address` {#opt-services.mpd.settings.bind_to_address}

The address for the daemon to listen on.
Use `any` to listen on all addresses.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"any"`

*Declared by:* [`nixos/modules/services/audio/mpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpd.nix)

## `services.mpd.settings.db_file` {#opt-services.mpd.settings.db_file}

The path to MPD's database.

*Type:* null or absolute path

*Default:* `"${dataDir}/tag_cache"`

*Declared by:* [`nixos/modules/services/audio/mpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpd.nix)

## `services.mpd.settings.music_directory` {#opt-services.mpd.settings.music_directory}

The directory or URI where MPD reads music from. If left
as the default value this directory will automatically be created before
the MPD server starts, otherwise the sysadmin is responsible for ensuring
the directory exists with appropriate ownership and permissions.

*Type:* absolute path or string matching the pattern (\[a-z\]+)://.+

*Default:* `"${dataDir}/music"`

*Declared by:* [`nixos/modules/services/audio/mpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpd.nix)

## `services.mpd.settings.playlist_directory` {#opt-services.mpd.settings.playlist_directory}

The directory where MPD stores playlists. If left as the default value
this directory will automatically be created before the MPD server starts,
otherwise the sysadmin is responsible for ensuring the directory exists
with appropriate ownership and permissions.

*Type:* absolute path

*Default:* `"${dataDir}/playlists"`

*Declared by:* [`nixos/modules/services/audio/mpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpd.nix)

## `services.mpd.settings.port` {#opt-services.mpd.settings.port}

This setting is the TCP port that is desired for the daemon to get assigned
to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6600`

*Declared by:* [`nixos/modules/services/audio/mpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpd.nix)

## `services.mpd.startWhenNeeded` {#opt-services.mpd.startWhenNeeded}

If set, `mpd` is socket-activated; that
is, instead of having it permanently running as a daemon,
systemd will start it on the first incoming connection.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/audio/mpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpd.nix)

## `services.mpd.user` {#opt-services.mpd.user}

User account under which MPD runs.

*Type:* string

*Default:* `"mpd"`

*Declared by:* [`nixos/modules/services/audio/mpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpd.nix)

## `services.mpdscribble.enable` {#opt-services.mpdscribble.enable}

Whether to enable mpdscribble, an MPD client which submits info about tracks being played to Last.fm (formerly AudioScrobbler).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/mpdscribble.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpdscribble.nix)

## `services.mpdscribble.endpoints` {#opt-services.mpdscribble.endpoints}

Endpoints to scrobble to.
If the endpoint is one of "jamendo", "last.fm", "libre.fm", "listenbrainz" the url is set automatically.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "last.fm" = {
    passwordFile = "/run/secrets/lastfm_password";
    username = "foo";
  };
}
```

*Declared by:* [`nixos/modules/services/audio/mpdscribble.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpdscribble.nix)

## `services.mpdscribble.endpoints.<name>.passwordFile` {#opt-services.mpdscribble.endpoints._name_.passwordFile}

File containing the password, either as MD5SUM or cleartext.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/audio/mpdscribble.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpdscribble.nix)

## `services.mpdscribble.endpoints.<name>.url` {#opt-services.mpdscribble.endpoints._name_.url}

The url endpoint where the scrobble API is listening.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/audio/mpdscribble.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpdscribble.nix)

## `services.mpdscribble.endpoints.<name>.username` {#opt-services.mpdscribble.endpoints._name_.username}

Username for the scrobble service.

*Type:* string

*Declared by:* [`nixos/modules/services/audio/mpdscribble.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpdscribble.nix)

## `services.mpdscribble.host` {#opt-services.mpdscribble.host}

Host for the mpdscribble daemon to search for a mpd daemon on.

*Type:* string

*Default:*

``` nix
if config.services.mpd.settings.bind_to_address != "any"
then config.services.mpd.settings.bind_to_address
else "localhost"
```

*Declared by:* [`nixos/modules/services/audio/mpdscribble.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpdscribble.nix)

## `services.mpdscribble.journalInterval` {#opt-services.mpdscribble.journalInterval}

How often should mpdscribble save the journal file? \[seconds\]

*Type:* signed integer

*Default:* `600`

*Example:* `60`

*Declared by:* [`nixos/modules/services/audio/mpdscribble.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpdscribble.nix)

## `services.mpdscribble.passwordFile` {#opt-services.mpdscribble.passwordFile}

File containing the password for the mpd daemon.
If there is a local mpd configured using [`services.mpd.credentials`](#opt-services.mpd.credentials)
the default is automatically set to a matching passwordFile of the local mpd.

*Type:* null or string

*Default:* The first password file with read access configured for MPD when using a local instance,
otherwise `null`.

*Declared by:* [`nixos/modules/services/audio/mpdscribble.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpdscribble.nix)

## `services.mpdscribble.port` {#opt-services.mpdscribble.port}

Port for the mpdscribble daemon to search for a mpd daemon on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `config.services.mpd.settings.port`

*Declared by:* [`nixos/modules/services/audio/mpdscribble.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpdscribble.nix)

## `services.mpdscribble.proxy` {#opt-services.mpdscribble.proxy}

HTTP proxy URL.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/audio/mpdscribble.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpdscribble.nix)

## `services.mpdscribble.verbose` {#opt-services.mpdscribble.verbose}

Log level for the mpdscribble daemon.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/audio/mpdscribble.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mpdscribble.nix)

## `services.mptcpd.enable` {#opt-services.mptcpd.enable}

Whether to enable the Multipath TCP path management daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/mptcpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mptcpd.nix)

## `services.mptcpd.package` {#opt-services.mptcpd.package}

The mptcpd package to use.

*Type:* package

*Default:* `pkgs.mptcpd`

*Declared by:* [`nixos/modules/services/networking/mptcpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mptcpd.nix)

## `services.mptcpd.settings` {#opt-services.mptcpd.settings}

mptcpd configuration written to `/etc/mptcpd/mptcpd.conf`.

See `mptcpd(8)` for details about available options and syntax.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  core = {
    "addr-flags" = "subflow";
    "notify-flags" = "existing,skip_link_local,skip_loopback,check_route";
    "load-plugins" = "addr_adv,sspi";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/mptcpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mptcpd.nix)

## `services.mqtt2influxdb.enable` {#opt-services.mqtt2influxdb.enable}

Whether to enable BigClown MQTT to InfluxDB bridge.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mqtt2influxdb.environmentFiles` {#opt-services.mqtt2influxdb.environmentFiles}

File to load as environment file. Environment variables from this file
will be interpolated into the config file using envsubst with this
syntax: `$ENVIRONMENT` or `${VARIABLE}`.
This is useful to avoid putting secrets into the nix store.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/run/keys/mqtt2influxdb.env"
]
```

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mqtt2influxdb.influxdb.database` {#opt-services.mqtt2influxdb.influxdb.database}

Name of the InfluxDB database.

*Type:* string

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mqtt2influxdb.influxdb.host` {#opt-services.mqtt2influxdb.influxdb.host}

Host where InfluxDB server is running.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mqtt2influxdb.influxdb.password` {#opt-services.mqtt2influxdb.influxdb.password}

Password for InfluxDB login.

It is highly suggested to use here replacement through
environmentFiles as otherwise the password is put world readable to
the store.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mqtt2influxdb.influxdb.port` {#opt-services.mqtt2influxdb.influxdb.port}

InfluxDB server port

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8086`

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mqtt2influxdb.influxdb.ssl` {#opt-services.mqtt2influxdb.influxdb.ssl}

Use SSL to connect to the InfluxDB server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mqtt2influxdb.influxdb.username` {#opt-services.mqtt2influxdb.influxdb.username}

Username for InfluxDB login.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mqtt2influxdb.influxdb.verify_ssl` {#opt-services.mqtt2influxdb.influxdb.verify_ssl}

Verify SSL certificate when connecting to the InfluxDB server.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mqtt2influxdb.mqtt.cafile` {#opt-services.mqtt2influxdb.mqtt.cafile}

Certification Authority file for MQTT

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mqtt2influxdb.mqtt.certfile` {#opt-services.mqtt2influxdb.mqtt.certfile}

Certificate file for MQTT

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mqtt2influxdb.mqtt.host` {#opt-services.mqtt2influxdb.mqtt.host}

Host where MQTT server is running.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mqtt2influxdb.mqtt.keyfile` {#opt-services.mqtt2influxdb.mqtt.keyfile}

Key file for MQTT

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mqtt2influxdb.mqtt.password` {#opt-services.mqtt2influxdb.mqtt.password}

MQTT password.

It is highly suggested to use here replacement through
environmentFiles as otherwise the password is put world readable to
the store.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mqtt2influxdb.mqtt.port` {#opt-services.mqtt2influxdb.mqtt.port}

MQTT server port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1883`

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mqtt2influxdb.mqtt.username` {#opt-services.mqtt2influxdb.mqtt.username}

Username used to connect to the MQTT server.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mqtt2influxdb.package` {#opt-services.mqtt2influxdb.package}

The mqtt2influxdb package to use.

*Type:* package

*Default:* `pkgs.python3Packages.mqtt2influxdb`

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mqtt2influxdb.points` {#opt-services.mqtt2influxdb.points}

Points to bridge from MQTT to InfluxDB.

*Type:* list of (submodule)

*Default:*

``` nix
[
  {
    fields = {
      value = "$.payload";
    };
    measurement = "temperature";
    tags = {
      channel = "$.topic[3]";
      id = "$.topic[1]";
    };
    topic = "node/+/thermometer/+/temperature";
  }
  {
    fields = {
      value = "$.payload";
    };
    measurement = "relative-humidity";
    tags = {
      channel = "$.topic[3]";
      id = "$.topic[1]";
    };
    topic = "node/+/hygrometer/+/relative-humidity";
  }
  {
    fields = {
      value = "$.payload";
    };
    measurement = "illuminance";
    tags = {
      id = "$.topic[1]";
    };
    topic = "node/+/lux-meter/0:0/illuminance";
  }
  {
    fields = {
      value = "$.payload";
    };
    measurement = "pressure";
    tags = {
      id = "$.topic[1]";
    };
    topic = "node/+/barometer/0:0/pressure";
  }
  {
    fields = {
      value = "$.payload";
    };
    measurement = "co2";
    tags = {
      id = "$.topic[1]";
    };
    topic = "node/+/co2-meter/-/concentration";
  }
  {
    fields = {
      value = "$.payload";
    };
    measurement = "voltage";
    tags = {
      id = "$.topic[1]";
    };
    topic = "node/+/battery/+/voltage";
  }
  {
    fields = {
      value = "$.payload";
    };
    measurement = "button";
    tags = {
      channel = "$.topic[3]";
      id = "$.topic[1]";
    };
    topic = "node/+/push-button/+/event-count";
  }
  {
    fields = {
      value = "$.payload";
    };
    measurement = "tvoc";
    tags = {
      id = "$.topic[1]";
    };
    topic = "node/+/voc-lp-sensor/0:0/tvoc";
  }
]
```

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mqtt2influxdb.points.*.fields` {#opt-services.mqtt2influxdb.points._.fields}

Field selector.

*Type:* submodule

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mqtt2influxdb.points.*.fields.type` {#opt-services.mqtt2influxdb.points._.fields.type}

Type to be picked up

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mqtt2influxdb.points.*.fields.value` {#opt-services.mqtt2influxdb.points._.fields.value}

Value to be picked up

*Type:* string

*Default:* `"$.payload"`

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mqtt2influxdb.points.*.measurement` {#opt-services.mqtt2influxdb.points._.measurement}

Name of the measurement

*Type:* string

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mqtt2influxdb.points.*.tags` {#opt-services.mqtt2influxdb.points._.tags}

Tags applied

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mqtt2influxdb.points.*.topic` {#opt-services.mqtt2influxdb.points._.topic}

MQTT topic to subscribe to.

*Type:* string

*Declared by:* [`nixos/modules/services/misc/mqtt2influxdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/mqtt2influxdb.nix)

## `services.mstpd.enable` {#opt-services.mstpd.enable}

Whether to enable the multiple spanning tree protocol daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/mstpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mstpd.nix)

## `services.mtprotoproxy.enable` {#opt-services.mtprotoproxy.enable}

Whether to enable mtprotoproxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/mtprotoproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mtprotoproxy.nix)

## `services.mtprotoproxy.settings` {#opt-services.mtprotoproxy.settings}

Python variables to set for the service.

Refer to [https://github.com/alexbers/mtprotoproxy/blob/master/config.py](https://github.com/alexbers/mtprotoproxy/blob/master/config.py) for a example config.

*Type:* open submodule of attribute set of (Python value)

*Declared by:* [`nixos/modules/services/networking/mtprotoproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mtprotoproxy.nix)

## `services.mtprotoproxy.settings.AD_TAG` {#opt-services.mtprotoproxy.settings.AD_TAG}

Tag for advertising that can be obtained from @MTProxybot.

*Type:* string

*Default:* `""`

*Example:* `"3c09c680b76ee91a4c25ad51f742267d"`

*Declared by:* [`nixos/modules/services/networking/mtprotoproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mtprotoproxy.nix)

## `services.mtprotoproxy.settings.PORT` {#opt-services.mtprotoproxy.settings.PORT}

TCP port to accept mtproto connections on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3256`

*Declared by:* [`nixos/modules/services/networking/mtprotoproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mtprotoproxy.nix)

## `services.mtprotoproxy.settings.SECURE_ONLY` {#opt-services.mtprotoproxy.settings.SECURE_ONLY}

Don't allow users to connect in non-secure mode (without random padding).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/mtprotoproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mtprotoproxy.nix)

## `services.mtprotoproxy.settings.USERS` {#opt-services.mtprotoproxy.settings.USERS}

Allowed users and their secrets. A secret is a 32 characters long hex string.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  tg = "00000000000000000000000000000000";
  tg2 = "0123456789abcdef0123456789abcdef";
}
```

*Declared by:* [`nixos/modules/services/networking/mtprotoproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mtprotoproxy.nix)

## `services.mtr-exporter.address` {#opt-services.mtr-exporter.address}

Listen address for MTR exporter.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/mtr-exporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mtr-exporter.nix)

## `services.mtr-exporter.enable` {#opt-services.mtr-exporter.enable}

Whether to enable a Prometheus exporter for MTR.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/mtr-exporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mtr-exporter.nix)

## `services.mtr-exporter.extraFlags` {#opt-services.mtr-exporter.extraFlags}

Extra command line options to pass to MTR exporter.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-flag.deprecatedMetrics"
]
```

*Declared by:* [`nixos/modules/services/networking/mtr-exporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mtr-exporter.nix)

## `services.mtr-exporter.jobs` {#opt-services.mtr-exporter.jobs}

List of MTR jobs. Will be added to /etc/mtr-exporter.conf

*Type:* non-empty (list of (submodule))

*Declared by:* [`nixos/modules/services/networking/mtr-exporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mtr-exporter.nix)

## `services.mtr-exporter.jobs.*.address` {#opt-services.mtr-exporter.jobs._.address}

Target address for MTR client.

*Type:* string

*Example:* `"host.example.org:1234"`

*Declared by:* [`nixos/modules/services/networking/mtr-exporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mtr-exporter.nix)

## `services.mtr-exporter.jobs.*.flags` {#opt-services.mtr-exporter.jobs._.flags}

Additional flags to pass to MTR.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-G1"
]
```

*Declared by:* [`nixos/modules/services/networking/mtr-exporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mtr-exporter.nix)

## `services.mtr-exporter.jobs.*.name` {#opt-services.mtr-exporter.jobs._.name}

Name of ICMP pinging job.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/mtr-exporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mtr-exporter.nix)

## `services.mtr-exporter.jobs.*.schedule` {#opt-services.mtr-exporter.jobs._.schedule}

Schedule of MTR checks. Also accepts Cron format.

*Type:* string

*Default:* `"@every 60s"`

*Example:* `"@hourly"`

*Declared by:* [`nixos/modules/services/networking/mtr-exporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mtr-exporter.nix)

## `services.mtr-exporter.mtrPackage` {#opt-services.mtr-exporter.mtrPackage}

The mtr package to use.

*Type:* package

*Default:* `pkgs.mtr`

*Declared by:* [`nixos/modules/services/networking/mtr-exporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mtr-exporter.nix)

## `services.mtr-exporter.package` {#opt-services.mtr-exporter.package}

The mtr-exporter package to use.

*Type:* package

*Default:* `pkgs.mtr-exporter`

*Declared by:* [`nixos/modules/services/networking/mtr-exporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mtr-exporter.nix)

## `services.mtr-exporter.port` {#opt-services.mtr-exporter.port}

Listen port for MTR exporter.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/networking/mtr-exporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mtr-exporter.nix)

## `services.mullvad-vpn.enable` {#opt-services.mullvad-vpn.enable}

Whether to enable the Mullvad VPN service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/mullvad-vpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mullvad-vpn.nix)

## `services.mullvad-vpn.enableEarlyBootBlocking` {#opt-services.mullvad-vpn.enableEarlyBootBlocking}

Whether to enable an additional systemd service that ensures that the Mullvad VPN daemon will block all traffic early in the boot process, as opposed to blocking traffic after the network has been set up. Enabling this option matches what upstream Mullvad distributes for their supported distros, but is disabled by default in NixOS as it may conflict with non-Mullvad network configurations. If you do not have a custom network configuration, it is recommended to enable this option in order to prevent network leaks during the boot process.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/mullvad-vpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mullvad-vpn.nix)

## `services.mullvad-vpn.enableExcludeWrapper` {#opt-services.mullvad-vpn.enableExcludeWrapper}

Whether to enable the security wrapper the allows the use of `mullvad-exclude`, a command that tunnels a single command directly to the clearnet, bypassing the system-wide VPN. It is recommended to disable this option for security models where privileged (`setuid`) binaries are a concern.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/mullvad-vpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mullvad-vpn.nix)

## `services.mullvad-vpn.gui.enable` {#opt-services.mullvad-vpn.gui.enable}

Whether to enable the Mullvad VPN graphical user interface.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/mullvad-vpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mullvad-vpn.nix)

## `services.mullvad-vpn.gui.package` {#opt-services.mullvad-vpn.gui.package}

The mullvad-vpn package to use.

*Type:* package

*Default:* `pkgs.mullvad-vpn`

*Declared by:* [`nixos/modules/services/networking/mullvad-vpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mullvad-vpn.nix)

## `services.mullvad-vpn.package` {#opt-services.mullvad-vpn.package}

The mullvad package to use.

*Type:* package

*Default:* `pkgs.mullvad`

*Declared by:* [`nixos/modules/services/networking/mullvad-vpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mullvad-vpn.nix)

## `services.multipath.blacklist` {#opt-services.multipath.blacklist}

This section defines which devices should be excluded from the
multipath topology discovery.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.blacklist_exceptions` {#opt-services.multipath.blacklist_exceptions}

This section defines which devices should be included in the
multipath topology discovery, despite being listed in the
blacklist section.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.defaults` {#opt-services.multipath.defaults}

This section defines default values for attributes which are used
whenever no values are given in the appropriate device or multipath
sections.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices` {#opt-services.multipath.devices}

This option allows you to define arrays for use in multipath
groups.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    vendor = "\"COMPELNT\"";
    product = "\"Compellent Vol\"";
    path_checker = "tur";
    no_path_retry = "queue";
    max_sectors_kb = 256;
  }, ...
]
```

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.alias_prefix` {#opt-services.multipath.devices._.alias_prefix}

The user\_friendly\_names prefix to use for this device type, instead of the default mpath

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.all_tg_pt` {#opt-services.multipath.devices._.all_tg_pt}

Set the 'all targets ports' flag when registering keys with mpathpersist

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.deferred_remove` {#opt-services.multipath.devices._.deferred_remove}

If set to "yes", multipathd will do a deferred remove instead of a
regular remove when the last path device has been deleted. This means
that if the multipath device is still in use, it will be freed when
the last user closes it. If path is added to the multipath device
before the last user closes it, the deferred remove will be canceled.

*Type:* null or one of "yes", "no"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.delay_wait_checks` {#opt-services.multipath.devices._.delay_wait_checks}

This option is deprecated, and mapped to san\_path\_err\_recovery\_time

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.delay_watch_checks` {#opt-services.multipath.devices._.delay_watch_checks}

This option is deprecated, and mapped to san\_path\_err\_forget\_rate

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.detect_checker` {#opt-services.multipath.devices._.detect_checker}

If set to "yes", multipath will try to detect if the device supports
SCSI-3 ALUA. If so, the device will automatically use the tur checker.
If set to "no", the checker will be selected as usual.

*Type:* null or one of "yes", "no"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.detect_prio` {#opt-services.multipath.devices._.detect_prio}

If set to "yes", multipath will try to detect if the device supports
SCSI-3 ALUA. If so, the device will automatically use the sysfs
prioritizer if the required sysf attributes access\_state and
preferred\_path are supported, or the alua prioritizer if not. If set
to "no", the prioritizer will be selected as usual.

*Type:* null or one of "yes", "no"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.dev_loss_tmo` {#opt-services.multipath.devices._.dev_loss_tmo}

Specify the number of seconds the SCSI layer will wait after a problem has
been detected on a FC remote port before removing it from the system. This
can be set to "infinity" which sets it to the max value of 2147483647
seconds, or 68 years. It will be automatically adjusted to the overall
retry interval no\_path\_retry \* polling\_interval
if a number of retries is given with no\_path\_retry and the
overall retry interval is longer than the specified dev\_loss\_tmo value.
The Linux kernel will cap this value to 600 if fast\_io\_fail\_tmo
is not set.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.failback` {#opt-services.multipath.devices._.failback}

Tell multipathd how to manage path group failback. Quote integers as strings

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.fast_io_fail_tmo` {#opt-services.multipath.devices._.fast_io_fail_tmo}

Specify the number of seconds the SCSI layer will wait after a problem has been
detected on a FC remote port before failing I/O to devices on that remote port.
This should be smaller than dev\_loss\_tmo. Setting this to "off" will disable
the timeout. Quote integers as strings.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.features` {#opt-services.multipath.devices._.features}

Specify any device-mapper features to be used

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.flush_on_last_del` {#opt-services.multipath.devices._.flush_on_last_del}

If set to "yes" multipathd will disable queueing when the last path to a
device has been deleted.

*Type:* null or one of "yes", "no"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.getuid_callout` {#opt-services.multipath.devices._.getuid_callout}

(Superseded by uid\_attribute) The default program and args to callout
to obtain a unique path identifier. Should be specified with an absolute path.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.ghost_delay` {#opt-services.multipath.devices._.ghost_delay}

Sets the number of seconds that multipath will wait after creating a device with only ghost paths before marking it ready for use in systemd

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.hardware_handler` {#opt-services.multipath.devices._.hardware_handler}

The hardware handler to use for this device type

*Type:* null or one of "emc", "rdac", "hp\_sw", "alua", "ana"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.marginal_path_double_failed_time` {#opt-services.multipath.devices._.marginal_path_double_failed_time}

One of the four parameters of supporting path check based on accounting IO error such as intermittent error

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.marginal_path_err_rate_threshold` {#opt-services.multipath.devices._.marginal_path_err_rate_threshold}

The error rate threshold as a permillage (1/1000)

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.marginal_path_err_recheck_gap_time` {#opt-services.multipath.devices._.marginal_path_err_recheck_gap_time}

One of the four parameters of supporting path check based on accounting IO error such as intermittent error

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.marginal_path_err_sample_time` {#opt-services.multipath.devices._.marginal_path_err_sample_time}

One of the four parameters of supporting path check based on accounting IO error such as intermittent error

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.max_sectors_kb` {#opt-services.multipath.devices._.max_sectors_kb}

Sets the max\_sectors\_kb device parameter on all path devices and the multipath device to the specified value

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.no_path_retry` {#opt-services.multipath.devices._.no_path_retry}

Specify what to do when all paths are down. Quote integers as strings

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.path_checker` {#opt-services.multipath.devices._.path_checker}

The default method used to determine the paths state

*Type:* one of "readsector0", "tur", "emc\_clariion", "hp\_sw", "rdac", "directio", "cciss\_tur", "none"

*Default:* `"tur"`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.path_grouping_policy` {#opt-services.multipath.devices._.path_grouping_policy}

The default path grouping policy to apply to unspecified multipaths

*Type:* null or one of "failover", "multibus", "group\_by\_serial", "group\_by\_prio", "group\_by\_node\_name"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.path_selector` {#opt-services.multipath.devices._.path_selector}

The default path selector algorithm to use; they are offered by the kernel multipath target

*Type:* null or one of ""round-robin 0"", ""queue-length 0"", ""service-time 0"", ""historical-service-time 0""

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.prio` {#opt-services.multipath.devices._.prio}

The name of the path priority routine

*Type:* null or one of "none", "const", "sysfs", "emc", "alua", "ontap", "rdac", "hp\_sw", "hds", "random", "weightedpath", "path\_latency", "ana", "datacore", "iet"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.prio_args` {#opt-services.multipath.devices._.prio_args}

Arguments to pass to to the prio function

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.product` {#opt-services.multipath.devices._.product}

Regular expression to match the product name

*Type:* string

*Example:* `"Compellent Vol"`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.product_blacklist` {#opt-services.multipath.devices._.product_blacklist}

Products with the given vendor matching this string are blacklisted

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.revision` {#opt-services.multipath.devices._.revision}

Regular expression to match the product revision

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.rr_min_io` {#opt-services.multipath.devices._.rr_min_io}

Number of I/O requests to route to a path before switching to the next in the
same path group. This is only for Block I/O (BIO) based multipath and
only apply to round-robin path\_selector.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.rr_min_io_rq` {#opt-services.multipath.devices._.rr_min_io_rq}

Number of I/O requests to route to a path before switching to the next in the
same path group. This is only for Request based multipath and
only apply to round-robin path\_selector.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.rr_weight` {#opt-services.multipath.devices._.rr_weight}

If set to priorities the multipath configurator will assign path weights
as "path prio \* rr\_min\_io".

*Type:* null or one of "priorities", "uniform"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.san_path_err_forget_rate` {#opt-services.multipath.devices._.san_path_err_forget_rate}

If set to a value greater than 0, multipathd will check whether the path
failures has exceeded the san\_path\_err\_threshold within this many checks
i.e san\_path\_err\_forget\_rate. If so we will not reinstante the path till
san\_path\_err\_recovery\_time.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.san_path_err_recovery_time` {#opt-services.multipath.devices._.san_path_err_recovery_time}

If set to a value greater than 0, multipathd will make sure that when
path failures has exceeded the san\_path\_err\_threshold within
san\_path\_err\_forget\_rate then the path will be placed in failed state
for san\_path\_err\_recovery\_time duration. Once san\_path\_err\_recovery\_time
has timeout we will reinstante the failed path. san\_path\_err\_recovery\_time
value should be in secs.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.san_path_err_threshold` {#opt-services.multipath.devices._.san_path_err_threshold}

If set to a value greater than 0, multipathd will watch paths and check
how many times a path has been failed due to errors.If the number of
failures on a particular path is greater then the san\_path\_err\_threshold,
then the path will not reinstate till san\_path\_err\_recovery\_time. These
path failures should occur within a san\_path\_err\_forget\_rate checks, if
not we will consider the path is good enough to reinstantate.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.skip_kpartx` {#opt-services.multipath.devices._.skip_kpartx}

If set to yes, kpartx will not automatically create partitions on the device

*Type:* null or one of "yes", "no"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.uid_attribute` {#opt-services.multipath.devices._.uid_attribute}

The udev attribute providing a unique path identifier (WWID)

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.user_friendly_names` {#opt-services.multipath.devices._.user_friendly_names}

If set to "yes", using the bindings file /etc/multipath/bindings
to assign a persistent and unique alias to the multipath, in the
form of mpath. If set to "no" use the WWID as the alias. In either
case this be will be overridden by any specific aliases in the
multipaths section.

*Type:* null or one of "yes", "no"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.vendor` {#opt-services.multipath.devices._.vendor}

Regular expression to match the vendor name

*Type:* string

*Example:* `"COMPELNT"`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.devices.*.vpd_vendor` {#opt-services.multipath.devices._.vpd_vendor}

The vendor specific vpd page information, using the vpd page abbreviation

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.enable` {#opt-services.multipath.enable}

Whether to enable the device mapper multipath (DM-MP) daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.extraConfig` {#opt-services.multipath.extraConfig}

Lines to append to default multipath.conf

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.extraConfigFile` {#opt-services.multipath.extraConfigFile}

Append an additional file's contents to /etc/multipath.conf

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.overrides` {#opt-services.multipath.overrides}

This section defines values for attributes that should override the
device-specific settings for all devices.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.package` {#opt-services.multipath.package}

The multipath-tools package to use.

*Type:* package

*Default:* `pkgs.multipath-tools`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.pathGroups` {#opt-services.multipath.pathGroups}

This option allows you to define multipath groups as described
in http://christophe.varoqui.free.fr/usage.html.

*Type:* list of (submodule)

*Example:*

``` nix
[
  {
    wwid = "360080e500043b35c0123456789abcdef";
    alias = 10001234;
    array = "bigarray.example.com";
    fsType = "zfs"; # optional
    options = "ro"; # optional
  }, ...
]
```

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.pathGroups.*.alias` {#opt-services.multipath.pathGroups._.alias}

The name of the multipath device

*Type:* signed integer

*Example:* `1001234`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.pathGroups.*.array` {#opt-services.multipath.pathGroups._.array}

The DNS name of the storage array

*Type:* string

*Default:* `null`

*Example:* `"bigarray.example.com"`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.pathGroups.*.fsType` {#opt-services.multipath.pathGroups._.fsType}

Type of the filesystem

*Type:* null or string

*Default:* `null`

*Example:* `"zfs"`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.pathGroups.*.options` {#opt-services.multipath.pathGroups._.options}

Options used to mount the file system

*Type:* null or string

*Default:* `null`

*Example:* `"ro"`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.multipath.pathGroups.*.wwid` {#opt-services.multipath.pathGroups._.wwid}

The identifier for the multipath device

*Type:* string (with check: hexadecimal string)

*Example:* `"360080e500043b35c0123456789abcdef"`

*Declared by:* [`nixos/modules/services/networking/multipath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/multipath.nix)

## `services.munge.enable` {#opt-services.munge.enable}

Whether to enable munge service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/munge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/munge.nix)

## `services.munge.password` {#opt-services.munge.password}

The path to a daemon's secret key.

*Type:* absolute path

*Default:* `"/etc/munge/munge.key"`

*Declared by:* [`nixos/modules/services/security/munge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/munge.nix)

## `services.munin-cron.enable` {#opt-services.munin-cron.enable}

Enable munin-cron. Takes care of all heavy lifting to collect data from
nodes and draws graphs to html. Runs munin-update, munin-limits,
munin-graphs and munin-html in that order.

HTML output is in `/var/www/munin/`, configure your
favourite webserver to serve static files.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/munin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/munin.nix)

## `services.munin-cron.extraCSS` {#opt-services.munin-cron.extraCSS}

Custom styling for the HTML that munin-cron generates. This will be
appended to the CSS files used by munin-cron and will thus take
precedence over the builtin styles.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  /* A simple dark theme. */
  html, body { background: #222222; }
  #header, #footer { background: #333333; }
  img.i, img.iwarn, img.icrit, img.iunkn {
    filter: invert(100%) hue-rotate(-30deg);
  }
''
```

*Declared by:* [`nixos/modules/services/monitoring/munin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/munin.nix)

## `services.munin-cron.extraGlobalConfig` {#opt-services.munin-cron.extraGlobalConfig}

`munin.conf` extra global configuration.
See [https://guide.munin-monitoring.org/en/latest/reference/munin.conf.html](https://guide.munin-monitoring.org/en/latest/reference/munin.conf.html).
Useful to setup notifications, see
[https://guide.munin-monitoring.org/en/latest/tutorial/alert.html](https://guide.munin-monitoring.org/en/latest/tutorial/alert.html)

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  contact.email.command mail -s "Munin notification for ''${var:host}" someone@example.com
''
```

*Declared by:* [`nixos/modules/services/monitoring/munin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/munin.nix)

## `services.munin-cron.hosts` {#opt-services.munin-cron.hosts}

Definitions of hosts of nodes to collect data from. Needs at least one
host for cron to succeed. See
[https://guide.munin-monitoring.org/en/latest/reference/munin.conf.html](https://guide.munin-monitoring.org/en/latest/reference/munin.conf.html)

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  [${config.networking.hostName}]
  address localhost
''
```

*Declared by:* [`nixos/modules/services/monitoring/munin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/munin.nix)

## `services.munin-node.disabledPlugins` {#opt-services.munin-node.disabledPlugins}

Munin plugins to disable, even if
`munin-node-configure --suggest` tries to enable
them. To disable a wildcard plugin, use an actual wildcard, as in
the example.

munin\_stats is disabled by default as it tries to read
`/var/log/munin/munin-update.log` for timing
information, and the NixOS build of Munin does not write this file.

*Type:* list of string

*Default:*

``` nix
[
  "munin_stats"
]
```

*Example:*

``` nix
[
  "diskstats"
  "zfs_usage_*"
]
```

*Declared by:* [`nixos/modules/services/monitoring/munin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/munin.nix)

## `services.munin-node.enable` {#opt-services.munin-node.enable}

Enable Munin Node agent. Munin node listens on 0.0.0.0 and
by default accepts connections only from 127.0.0.1 for security reasons.

See [https://guide.munin-monitoring.org/en/latest/architecture/index.html](https://guide.munin-monitoring.org/en/latest/architecture/index.html).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/munin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/munin.nix)

## `services.munin-node.extraAutoPlugins` {#opt-services.munin-node.extraAutoPlugins}

Additional Munin plugins to autoconfigure, using
`munin-node-configure --suggest`. These should be
the actual paths to the plugin files (or directories containing them),
not just their names.

If you want to manually enable individual plugins instead, use
[`services.munin-node.extraPlugins`](#opt-services.munin-node.extraPlugins).

Note that only plugins that have the 'autoconfig' capability will do
anything if listed here, since plugins that cannot autoconfigure
won't be automatically enabled by
`munin-node-configure`.

Plugins will be copied into the Nix store, and it will attempt to
modify them to run properly by fixing hardcoded references to
`/bin`, `/usr/bin`,
`/sbin`, and `/usr/sbin`.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  /src/munin-contrib/plugins/zfs
  /src/munin-contrib/plugins/ssh
];
```

*Declared by:* [`nixos/modules/services/monitoring/munin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/munin.nix)

## `services.munin-node.extraConfig` {#opt-services.munin-node.extraConfig}

`munin-node.conf` extra configuration. See
[https://guide.munin-monitoring.org/en/latest/reference/munin-node.conf.html](https://guide.munin-monitoring.org/en/latest/reference/munin-node.conf.html)

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/munin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/munin.nix)

## `services.munin-node.extraPluginConfig` {#opt-services.munin-node.extraPluginConfig}

`plugin-conf.d` extra plugin configuration. See
[https://guide.munin-monitoring.org/en/latest/plugin/use.html](https://guide.munin-monitoring.org/en/latest/plugin/use.html)

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  [fail2ban_*]
  user root
''
```

*Declared by:* [`nixos/modules/services/monitoring/munin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/munin.nix)

## `services.munin-node.extraPlugins` {#opt-services.munin-node.extraPlugins}

Additional Munin plugins to activate. Keys are the name of the plugin
symlink, values are the path to the underlying plugin script. You
can use the same plugin script multiple times (e.g. for wildcard
plugins).

Note that these plugins do not participate in autoconfiguration. If
you want to autoconfigure additional plugins, use
[`services.munin-node.extraAutoPlugins`](#opt-services.munin-node.extraAutoPlugins).

Plugins enabled in this manner take precedence over autoconfigured
plugins.

Plugins will be copied into the Nix store, and it will attempt to
modify them to run properly by fixing hardcoded references to
`/bin`, `/usr/bin`,
`/sbin`, and `/usr/sbin`.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
{
  zfs_usage_bigpool = /src/munin-contrib/plugins/zfs/zfs_usage_;
  zfs_usage_smallpool = /src/munin-contrib/plugins/zfs/zfs_usage_;
  zfs_list = /src/munin-contrib/plugins/zfs/zfs_list;
};
```

*Declared by:* [`nixos/modules/services/monitoring/munin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/munin.nix)

## `services.murmur.allowHtml` {#opt-services.murmur.allowHtml}

Allow HTML in client messages, comments, and channel
descriptions.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.autobanAttempts` {#opt-services.murmur.autobanAttempts}

Number of attempts a client is allowed to make in
`autobanTimeframe` seconds, before being
banned for `autobanTime`.

*Type:* unsigned integer, meaning \>=0

*Default:* `10`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.autobanTime` {#opt-services.murmur.autobanTime}

The amount of time an IP ban lasts (in seconds).

*Type:* unsigned integer, meaning \>=0

*Default:* `300`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.autobanTimeframe` {#opt-services.murmur.autobanTimeframe}

Timeframe in which a client can connect without being banned
for repeated attempts (in seconds).

*Type:* unsigned integer, meaning \>=0

*Default:* `120`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.bandwidth` {#opt-services.murmur.bandwidth}

Maximum bandwidth (in bits per second) that clients may send
speech at.

*Type:* unsigned integer, meaning \>=0

*Default:* `72000`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.bonjour` {#opt-services.murmur.bonjour}

Whether to enable Bonjour auto-discovery, which allows clients over your LAN to automatically discover Mumble servers.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.clientCertRequired` {#opt-services.murmur.clientCertRequired}

Whether to enable requiring clients to authenticate via certificates.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.dbus` {#opt-services.murmur.dbus}

Enable D-Bus remote control. Set to the bus you want Murmur to connect to.

*Type:* one of <null>, "session", "system"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.enable` {#opt-services.murmur.enable}

Whether to enable Mumble server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.environmentFile` {#opt-services.murmur.environmentFile}

Environment file as defined in `systemd.exec(5)`.

Secrets may be passed to the service without adding them to the world-readable
Nix store, by specifying placeholder variables as the option value in Nix and
setting these variables accordingly in the environment file.

```
  # snippet of murmur-related config
  services.murmur.password = "$MURMURD_PASSWORD";
```

```
  # content of the environment file
  MURMURD_PASSWORD=verysecretpassword
```

Note that this file needs to be available on the host on which
`murmur` is running.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${config.services.murmur.stateDir}/murmurd.env"`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.extraConfig` {#opt-services.murmur.extraConfig}

Extra configuration to put into murmur.ini.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.group` {#opt-services.murmur.group}

The name of an existing group to use to run the service.
If not specified, the default group will be created.

*Type:* string

*Default:* `"murmur"`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.hostName` {#opt-services.murmur.hostName}

Host to bind to. Defaults binding on all addresses.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.imgMsgLength` {#opt-services.murmur.imgMsgLength}

Max length of image messages. Set 0 for no limit.

*Type:* unsigned integer, meaning \>=0

*Default:* `131072`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.logDays` {#opt-services.murmur.logDays}

How long to store RPC logs for in the database. Set 0 to
keep logs forever, or -1 to disable DB logging.

*Type:* signed integer

*Default:* `31`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.logToFile` {#opt-services.murmur.logToFile}

Whether to enable logging to a file instead of journald, which is stored in /var/log/murmur.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.openFirewall` {#opt-services.murmur.openFirewall}

Whether to enable opening ports in the firewall for the Mumble server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.package` {#opt-services.murmur.package}

The murmur package to use.

*Type:* package

*Default:* `pkgs.murmur`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.password` {#opt-services.murmur.password}

Required password to join server, if specified.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.port` {#opt-services.murmur.port}

Ports to bind to (UDP and TCP).

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `64738`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.registerHostname` {#opt-services.murmur.registerHostname}

DNS hostname where your server can be reached. This is only
needed if you want your server to be accessed by its
hostname and not IP - but the name *must* resolve on the
internet properly.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.registerName` {#opt-services.murmur.registerName}

Public server registration name, and also the name of the
Root channel. Even if you don't publicly register your
server, you probably still want to set this.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.registerPassword` {#opt-services.murmur.registerPassword}

Public server registry password, used authenticate your
server to the registry to prevent impersonation; required for
subsequent registry updates.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.registerUrl` {#opt-services.murmur.registerUrl}

URL website for your server.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.sendVersion` {#opt-services.murmur.sendVersion}

Send Murmur version in UDP response.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.stateDir` {#opt-services.murmur.stateDir}

Directory to store data for the server.

*Type:* absolute path

*Default:* `"/var/lib/murmur"`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.textMsgLength` {#opt-services.murmur.textMsgLength}

Max length of text messages. Set 0 for no limit.

*Type:* unsigned integer, meaning \>=0

*Default:* `5000`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.tls.caPath` {#opt-services.murmur.tls.caPath}

Path to your TLS CA certificate.

*Type:* null or absolute path

*Default:* If [`services.murmur.tls.useACMEHost`](#opt-services.murmur.tls.useACMEHost) is set, defaults to what's provided by the ACME module.

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.tls.certPath` {#opt-services.murmur.tls.certPath}

Path to your TLS certificate.

*Type:* null or absolute path

*Default:* If [`services.murmur.tls.useACMEHost`](#opt-services.murmur.tls.useACMEHost) is set, defaults to what's provided by the ACME module.

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.tls.keyPath` {#opt-services.murmur.tls.keyPath}

Path to your TLS key.

*Type:* null or absolute path

*Default:* If [`services.murmur.tls.useACMEHost`](#opt-services.murmur.tls.useACMEHost) is set, defaults to what's provided by the ACME module.

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.tls.useACMEHost` {#opt-services.murmur.tls.useACMEHost}

Host of an existing Let's Encrypt certificate to use for TLS.
Make sure that the certificate directory is readable by the
`murmur` user or group. *Note that this option does not
create any certificates and it doesn't add subdomains to
existing ones – you will need to create them manually using
[`security.acme.certs`](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Example:* `"mumble.example.com"`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.user` {#opt-services.murmur.user}

The name of an existing user to use to run the service.
If not specified, the default user will be created.

*Type:* string

*Default:* `"murmur"`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.users` {#opt-services.murmur.users}

Maximum number of concurrent clients allowed.

*Type:* unsigned integer, meaning \>=0

*Default:* `100`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.murmur.welcometext` {#opt-services.murmur.welcometext}

Welcome message for connected clients.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/murmur.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/murmur.nix)

## `services.music-assistant.enable` {#opt-services.music-assistant.enable}

Whether to enable Music Assistant.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/music-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/music-assistant.nix)

## `services.music-assistant.extraOptions` {#opt-services.music-assistant.extraOptions}

List of extra options to pass to the music-assistant executable.

*Type:* list of string

*Default:*

``` nix
[
  "--config"
  "/var/lib/music-assistant"
]
```

*Example:*

``` nix
[
  "--log-level"
  "DEBUG"
]
```

*Declared by:* [`nixos/modules/services/audio/music-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/music-assistant.nix)

## `services.music-assistant.openFirewall` {#opt-services.music-assistant.openFirewall}

Whether to open required ports for the configured providers.
Currently AirPlay, AirPlay Receiver, AriaCast Receiver, Sendspin, Snapcast, Squeezelite and Spotify Connect need port(s) to be opened to properly function.

::: note
AirPlay and Spotify Connect must open all random high UDP or TCP ports respectively to function.
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/audio/music-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/music-assistant.nix)

## `services.music-assistant.package` {#opt-services.music-assistant.package}

The music-assistant package to use.

*Type:* package

*Default:* `pkgs.music-assistant`

*Declared by:* [`nixos/modules/services/audio/music-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/music-assistant.nix)

## `services.music-assistant.providers` {#opt-services.music-assistant.providers}

List of provider names for which dependencies will be installed.

Providers that need shared service credentials (`spotify`, `qobuz`, `apple_music`,
`theaudiodb`, `fanarttv`) do not work out of the box. Register your own credentials
with the service and pass them to Music Assistant through the matching `MASS_APP_VAR_*`
environment variable:

``` nix
services.music-assistant.providers = [ "spotify" ];

systemd.services.music-assistant.environment = {
  MASS_APP_VAR_SPOTIFY_CLIENT_ID = "your-client-id";
};
```

To pass multiple values at once, point Music Assistant at a JSON map of app variables
with the `MASS_APP_VARS_FILE` environment variable. The upstream
[app\_vars.py](https://github.com/music-assistant/server/blob/dev/music_assistant/helpers/app_vars.py)
file lists the supported variables and the provider documentation (for example
[https://www.music-assistant.io/music-providers/spotify/](https://www.music-assistant.io/music-providers/spotify/)) describes the setup steps.
Qobuz and Tidal cannot be configured this way, and Spotify restricts apps registered
by third parties.

Nixpkgs does not ship these credentials: they are bundled only in the official Music
Assistant release builds, are not covered by the Apache-2.0 license of the source code
and may not be redistributed (see the upstream
[NOTICE file](https://github.com/music-assistant/server/blob/dev/NOTICE)).

*Type:* list of (one of "abc\_radio\_network", "acoustid\_lookup", "ai\_radio", "airplay", "airplay\_receiver", "alexa", "ambient\_sounds", "amplipi", "apple\_music", "ard\_audiothek", "ariacast\_receiver", "audible", "audiobookshelf", "bandcamp", "bbc\_sounds", "bluesound", "bose\_soundtouch", "builtin", "chromecast", "coverartarchive", "deezer", "digitally\_incorporated", "dlna", "emby", "fanarttv", "fastmcp\_server", "filesystem\_google\_drive", "filesystem\_local", "filesystem\_nfs", "filesystem\_onedrive", "filesystem\_smb", "fully\_kiosk", "genius\_lyrics", "gpodder", "hass", "hass\_players", "heos", "hue\_entertainment", "ibroadcast", "internet\_archive", "itunes\_artwork", "itunes\_podcasts", "jellyfin", "kion\_music", "lastfm\_recommendations", "lastfm\_scrobble", "listenbrainz\_scrobble", "local\_audio", "loudness\_analysis", "lrclib", "mammamiradio", "milkdrop\_visualizer", "mpd", "msx\_bridge", "music\_quiz", "musicbrainz", "musiccast", "musicme", "neteasecloudmusic", "nicovideo", "nts", "nugs", "openai\_compatible", "openai\_tts", "opensubsonic", "orf\_radiothek", "overcast", "pandora", "party", "phishin", "playlist\_metadata", "plex", "plex\_connect", "pocketcasts", "podcast\_index", "podcastfeed", "profiler", "qobuz", "qqmusic", "radio\_playlist", "radiobrowser", "radioparadise", "rain\_mood", "recommendations", "roku\_media\_assistant", "samsung\_wam", "sendspin", "sendspin\_source", "siriusxm", "smart\_fades", "smart\_playlist", "snapcast", "somafm", "sonic\_analysis", "sonic\_similarity", "sonos", "sonos\_s1", "soundcloud", "spotify", "spotify\_connect", "squeezelite", "storytel", "subsonic\_scrobble", "sverigesradio", "sync\_group", "teddycloud", "test", "theaudiodb", "tidal", "tunein", "universal\_group", "universal\_player", "vban\_receiver", "webdav", "wiim", "wikipedia", "yandex\_music", "yandex\_smarthome", "yandex\_station", "yandex\_ynison", "yousee", "ytmusic", "zvuk\_music")

*Default:* `[ ]`

*Example:*

``` nix
[
  "opensubsonic"
  "snapcast"
]
```

*Declared by:* [`nixos/modules/services/audio/music-assistant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/music-assistant.nix)

## `services.mycelium.addHostedPublicNodes` {#opt-services.mycelium.addHostedPublicNodes}

Adds the hosted peers from [https://github.com/threefoldtech/mycelium#hosted-public-nodes](https://github.com/threefoldtech/mycelium#hosted-public-nodes).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/mycelium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mycelium.nix)

## `services.mycelium.enable` {#opt-services.mycelium.enable}

Whether to enable mycelium network.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/mycelium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mycelium.nix)

## `services.mycelium.extraArgs` {#opt-services.mycelium.extraArgs}

Extra command-line arguments to pass to mycelium.

See `mycelium --help` for all available options.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/mycelium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mycelium.nix)

## `services.mycelium.keyFile` {#opt-services.mycelium.keyFile}

Optional path to a file containing the mycelium key material.
If unset, the location `/var/lib/mycelium/key.bin` will be used.
If no key exist at this location, it will be generated on startup.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/mycelium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mycelium.nix)

## `services.mycelium.openFirewall` {#opt-services.mycelium.openFirewall}

Open the firewall for mycelium

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/mycelium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mycelium.nix)

## `services.mycelium.package` {#opt-services.mycelium.package}

The mycelium package to use.

*Type:* package

*Default:* `pkgs.mycelium`

*Declared by:* [`nixos/modules/services/networking/mycelium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mycelium.nix)

## `services.mycelium.peers` {#opt-services.mycelium.peers}

List of peers to connect to, in the formats:

- `quic://[2001:0db8::1]:9651`
- `quic://192.0.2.1:9651`
- `tcp://[2001:0db8::1]:9651`
- `tcp://192.0.2.1:9651`

If addHostedPublicNodes is set to true, the hosted public nodes will also be added.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/mycelium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/mycelium.nix)

## `services.mympd.enable` {#opt-services.mympd.enable}

Whether to enable MyMPD server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/mympd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mympd.nix)

## `services.mympd.extraGroups` {#opt-services.mympd.extraGroups}

Additional groups for the systemd service.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "music"
]
```

*Declared by:* [`nixos/modules/services/audio/mympd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mympd.nix)

## `services.mympd.openFirewall` {#opt-services.mympd.openFirewall}

Open ports needed for the functionality of the program.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/audio/mympd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mympd.nix)

## `services.mympd.package` {#opt-services.mympd.package}

The mympd package to use.

*Type:* package

*Default:* `pkgs.mympd`

*Declared by:* [`nixos/modules/services/audio/mympd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mympd.nix)

## `services.mympd.settings` {#opt-services.mympd.settings}

Manages the configuration files declaratively. For all the configuration
options, see [https://jcorporation.github.io/myMPD/020-configuration/configuration-files](https://jcorporation.github.io/myMPD/020-configuration/configuration-files).

Each key represents the "File" column from the upstream configuration table, and the
value is the content of that file.

*Type:* open submodule of attribute set of (null or string or boolean or signed integer)

*Declared by:* [`nixos/modules/services/audio/mympd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mympd.nix)

## `services.mympd.settings.http_port` {#opt-services.mympd.settings.http_port}

The HTTP port where mympd's web interface will be available.

The HTTPS/SSL port can be configured via `config`.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Example:* `"8080"`

*Declared by:* [`nixos/modules/services/audio/mympd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mympd.nix)

## `services.mympd.settings.ssl` {#opt-services.mympd.settings.ssl}

Whether to enable listening on the SSL port.

Refer to [https://jcorporation.github.io/myMPD/020-configuration/configuration-files#ssl-options](https://jcorporation.github.io/myMPD/020-configuration/configuration-files#ssl-options)
for more information.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/audio/mympd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/mympd.nix)

## `services.mysql.configFile` {#opt-services.mysql.configFile}

Override the configuration file used by MySQL. By default,
NixOS generates one automatically from [`services.mysql.settings`](#opt-services.mysql.settings).

*Type:* absolute path

*Default:*

``` nix
''
  A configuration file automatically generated by NixOS.
''
```

*Example:*

``` nix
pkgs.writeText "my.cnf" ''
  [mysqld]
  datadir = /var/lib/mysql
  bind-address = 127.0.0.1
  port = 3336

  !includedir /etc/mysql/conf.d/
'';
```

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.dataDir` {#opt-services.mysql.dataDir}

The data directory for MySQL.

::: note
If left as the default value of `/var/lib/mysql` this directory will automatically be created before the MySQL
server starts, otherwise you are responsible for ensuring the directory exists with appropriate ownership and permissions.
:::

*Type:* absolute path

*Default:* `"/var/lib/mysql"`

*Example:* `"/var/lib/mysql"`

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.enable` {#opt-services.mysql.enable}

Whether to enable MySQL server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.ensureDatabases` {#opt-services.mysql.ensureDatabases}

Ensures that the specified databases exist.
This option will never delete existing databases, especially not when the value of this
option is changed. This means that databases created once through this option or
otherwise have to be removed manually.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "nextcloud"
  "matomo"
]
```

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.ensureUsers` {#opt-services.mysql.ensureUsers}

Ensures that the specified users exist and have at least the ensured permissions.
The MySQL users will be identified using Unix socket authentication. This authenticates the Unix user with the
same name only, and that without the need for a password.
This option will never delete existing users or remove permissions, especially not when the value of this
option is changed. This means that users created and permissions assigned once through this option or
otherwise have to be removed manually.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    name = "nextcloud";
    ensurePermissions = {
      "nextcloud.*" = "ALL PRIVILEGES";
    };
  }
  {
    name = "backup";
    ensurePermissions = {
      "*.*" = "SELECT, LOCK TABLES";
    };
  }
]
```

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.ensureUsers.*.ensurePermissions` {#opt-services.mysql.ensureUsers._.ensurePermissions}

Permissions to ensure for the user, specified as attribute set.
The attribute names specify the database and tables to grant the permissions for,
separated by a dot. You may use wildcards here.
The attribute values specfiy the permissions to grant.
You may specify one or multiple comma-separated SQL privileges here.

For more information on how to specify the target
and on which privileges exist, see the
[GRANT syntax](https://mariadb.com/kb/en/library/grant/).
The attributes are used as `GRANT ${attrName} ON ${attrValue}`.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  "database.*" = "ALL PRIVILEGES";
  "*.*" = "SELECT, LOCK TABLES";
}
```

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.ensureUsers.*.name` {#opt-services.mysql.ensureUsers._.name}

Name of the user to ensure.

*Type:* string

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.galeraCluster.clusterAddress` {#opt-services.mysql.galeraCluster.clusterAddress}

Full Galera cluster connection string. If nodeAddresses is set, this will be auto-generated, but you can override it with a custom value. Format is typically 'gcomm://node1,node2,node3' with optional parameters.

*Type:* string

*Default:*

``` nix
if (config.services.mysql.galeraCluster.nodeAddresses == [ ]) then
  ""
else
  "gcomm://${builtins.concatStringsSep \",\" config.services.mysql.galeraCluster.nodeAddresses}"
  + lib.optionalString (config.services.mysql.galeraCluster.clusterPassword != "")
    "?gmcast.seg=1:${config.services.mysql.galeraCluster.clusterPassword}"
```

*Example:* `"gcomm://10.0.0.10,10.0.0.20,10.0.0.30?gmcast.seg=1:SomePassword"`

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.galeraCluster.clusterPassword` {#opt-services.mysql.galeraCluster.clusterPassword}

Optional password for securing cluster communications. If provided, it will be used in the clusterAddress for authentication between nodes.

*Type:* string

*Default:* `""`

*Example:* `"SomePassword"`

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.galeraCluster.enable` {#opt-services.mysql.galeraCluster.enable}

Whether to enable MariaDB Galera Cluster.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.galeraCluster.localAddress` {#opt-services.mysql.galeraCluster.localAddress}

IP address or hostname of this node that will be used for cluster communication. Must be reachable by all other nodes.

*Type:* string

*Default:* `config.services.mysql.galeraCluster.localName`

*Example:* `"1.2.3.4"`

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.galeraCluster.localName` {#opt-services.mysql.galeraCluster.localName}

The unique name that identifies this particular node within the cluster. Each node must have a different name.

*Type:* string

*Example:* `"node1"`

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.galeraCluster.name` {#opt-services.mysql.galeraCluster.name}

The logical name of the Galera cluster. All nodes in the same cluster must use the same name.

*Type:* string

*Default:* `"galera"`

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.galeraCluster.nodeAddresses` {#opt-services.mysql.galeraCluster.nodeAddresses}

IP addresses or hostnames of all nodes in the cluster, including this node. This is used to construct the default clusterAddress connection string.

*Type:* list of string

*Default:* `[ ]`

*Example:* `["10.0.0.10" "10.0.0.20" "10.0.0.30"]`

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.galeraCluster.package` {#opt-services.mysql.galeraCluster.package}

The MariaDB Galera package that provides the shared library 'libgalera\_smm.so' required for cluster functionality.

*Type:* package

*Default:* `pkgs.mariadb-galera`

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.galeraCluster.sstMethod` {#opt-services.mysql.galeraCluster.sstMethod}

Method for the initial state transfer (wsrep\_sst\_method) when a node joins the cluster. Be aware that rsync needs SSH keys to be generated and authorized on all nodes!

*Type:* one of "rsync", "mariabackup"

*Default:* `"rsync"`

*Example:* `"mariabackup"`

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.group` {#opt-services.mysql.group}

Group account under which MySQL runs.

::: note
If left as the default value this group will automatically be created
on system activation, otherwise you are responsible for
ensuring the user exists before the MySQL service starts.
:::

*Type:* string

*Default:* `"mysql"`

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.initialDatabases` {#opt-services.mysql.initialDatabases}

List of database names and their initial schemas that should be used to create databases on the first startup
of MySQL. The schema attribute is optional: If not specified, an empty database is created.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  { name = "foodatabase"; schema = ./foodatabase.sql; }
  { name = "bardatabase"; }
]
```

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.initialDatabases.*.name` {#opt-services.mysql.initialDatabases._.name}

The name of the database to create.

*Type:* string

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.initialDatabases.*.schema` {#opt-services.mysql.initialDatabases._.schema}

The initial schema of the database; if null (the default),
an empty database is created.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.initialScript` {#opt-services.mysql.initialScript}

A file containing SQL statements to be executed on the first startup. Can be used for granting certain permissions on the database. Run as superuser.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.package` {#opt-services.mysql.package}

Which MySQL derivation to use. MariaDB packages are supported too.

*Type:* package

*Example:* `pkgs.mariadb`

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.replication.masterHost` {#opt-services.mysql.replication.masterHost}

Hostname of the MySQL master server.

*Type:* string

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.replication.masterPassword` {#opt-services.mysql.replication.masterPassword}

Password of the MySQL replication user.

*Type:* string

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.replication.masterPort` {#opt-services.mysql.replication.masterPort}

Port number on which the MySQL master server runs.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3306`

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.replication.masterUser` {#opt-services.mysql.replication.masterUser}

Username of the MySQL replication user.

*Type:* string

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.replication.role` {#opt-services.mysql.replication.role}

Role of the MySQL server instance.

*Type:* one of "master", "slave", "none"

*Default:* `"none"`

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.replication.serverId` {#opt-services.mysql.replication.serverId}

Id of the MySQL server instance. This number must be unique for each instance.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.replication.slaveHost` {#opt-services.mysql.replication.slaveHost}

Hostname of the MySQL slave server.

*Type:* string

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.secureSuperUserByDefault` {#opt-services.mysql.secureSuperUserByDefault}

Whether to automatically secure the root@localhost user with auth\_socket authentication.

::: note
When enabled (default), the module will ensure root@localhost uses socket authentication,
preventing any local user from connecting as root without proper credentials.
:::

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.settings` {#opt-services.mysql.settings}

MySQL configuration. Refer to
[https://dev.mysql.com/doc/refman/5.7/en/server-system-variables.html](https://dev.mysql.com/doc/refman/5.7/en/server-system-variables.html),
[https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html](https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html),
and [https://mariadb.com/kb/en/server-system-variables/](https://mariadb.com/kb/en/server-system-variables/)
for details on supported values.

::: note
MySQL configuration options such as `--quick` should be treated as
boolean options and provided values such as `true`, `false`,
`1`, or `0`. See the provided example below.
:::

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string) or a list of them for duplicate keys)

*Default:* `{ }`

*Example:*

``` nix
{
  mysqld = {
    key_buffer_size = "6G";
    table_cache = 1600;
    log-error = "/var/log/mysql_err.log";
    plugin-load-add = [ "server_audit" "ed25519=auth_ed25519" ];
  };
  mysqldump = {
    quick = true;
    max_allowed_packet = "16M";
  };
}
```

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysql.user` {#opt-services.mysql.user}

User account under which MySQL runs.

::: note
If left as the default value this user will automatically be created
on system activation, otherwise you are responsible for
ensuring the user exists before the MySQL service starts.
:::

*Type:* string

*Default:* `"mysql"`

*Declared by:* [`nixos/modules/services/databases/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/mysql.nix)

## `services.mysqlBackup.calendar` {#opt-services.mysqlBackup.calendar}

Configured when to run the backup service systemd unit (DayOfWeek Year-Month-Day Hour:Minute:Second).

*Type:* string

*Default:* `"01:15:00"`

*Declared by:* [`nixos/modules/services/backup/mysql-backup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/mysql-backup.nix)

## `services.mysqlBackup.compressionAlg` {#opt-services.mysqlBackup.compressionAlg}

Compression algorithm to use for database dumps.

*Type:* one of "gzip", "xz", "zstd"

*Default:* `"gzip"`

*Declared by:* [`nixos/modules/services/backup/mysql-backup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/mysql-backup.nix)

## `services.mysqlBackup.compressionLevel` {#opt-services.mysqlBackup.compressionLevel}

Compression level to use for gzip, xz or zstd.

- For gzip: 1-9
- For xz: 0-9
- For zstd: 1-19

::: note
If compression level is also specified in gzipOptions, the gzipOptions value will be overwritten
:::

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/mysql-backup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/mysql-backup.nix)

## `services.mysqlBackup.databases` {#opt-services.mysqlBackup.databases}

List of database names to dump.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/backup/mysql-backup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/mysql-backup.nix)

## `services.mysqlBackup.enable` {#opt-services.mysqlBackup.enable}

Whether to enable MySQL backups.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/mysql-backup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/mysql-backup.nix)

## `services.mysqlBackup.gzipOptions` {#opt-services.mysqlBackup.gzipOptions}

Command line options to use when invoking `gzip`.
Only used when compression is set to "gzip".
If compression level is specified both here and in compressionLevel, the compressionLevel value will take precedence.

*Type:* string

*Default:* `"--no-name --rsyncable"`

*Declared by:* [`nixos/modules/services/backup/mysql-backup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/mysql-backup.nix)

## `services.mysqlBackup.location` {#opt-services.mysqlBackup.location}

Location to put the compressed MySQL database dumps.

*Type:* absolute path

*Default:* `"/var/backup/mysql"`

*Declared by:* [`nixos/modules/services/backup/mysql-backup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/mysql-backup.nix)

## `services.mysqlBackup.singleTransaction` {#opt-services.mysqlBackup.singleTransaction}

Whether to create database dump in a single transaction.
Can be either a boolean for all databases or a list of database names.

*Type:* boolean or list of string

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/mysql-backup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/mysql-backup.nix)

## `services.mysqlBackup.user` {#opt-services.mysqlBackup.user}

User to be used to perform backup.

*Type:* string

*Default:* `"mysqlbackup"`

*Declared by:* [`nixos/modules/services/backup/mysql-backup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/mysql-backup.nix)
