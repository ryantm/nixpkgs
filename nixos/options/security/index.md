# security {#sec-options-security}

## `security.account-utils.enable` {#opt-security.account-utils.enable}

Whether to enable the account-utils implementation of Unix user authentication and management.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/account-utils.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/account-utils.nix)

## `security.account-utils.extraArgs` {#opt-security.account-utils.extraArgs}

List of arguments to pass to the socket activated service executables.

::: note
This is passed to both pwupdd and pwaccessd, which support identical flags.
:::

*Type:* list of non-empty string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--debug"
  "-v"
]
```

*Declared by:* [`nixos/modules/security/account-utils.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/account-utils.nix)

## `security.account-utils.package` {#opt-security.account-utils.package}

The account-utils package to use.

*Type:* package

*Default:* `pkgs.account-utils`

*Declared by:* [`nixos/modules/security/account-utils.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/account-utils.nix)

## `security.account-utils.pwaccessd.settings` {#opt-security.account-utils.pwaccessd.settings}

Options for pwaccessd.
See `pwaccessd.conf(5)` for available options.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/security/account-utils.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/account-utils.nix)

## `security.acme.acceptTerms` {#opt-security.acme.acceptTerms}

Accept the CA's terms of service. The default provider is Let's Encrypt,
you can find their ToS at [https://letsencrypt.org/repository/](https://letsencrypt.org/repository/).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs` {#opt-security.acme.certs}

Attribute set of certificates to get signed and renewed. Creates
`acme-${cert}.{service,timer}` systemd units for
each certificate defined here. Other services can add dependencies
to those units if they rely on the certificates being present,
or trigger restarts of the service if certificates get renewed.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "example.com" = {
    webroot = "/var/lib/acme/acme-challenge/";
    email = "foo@example.com";
    extraDomainNames = [ "www.example.com" "foo.example.com" ];
  };
  "bar.example.com" = {
    webroot = "/var/lib/acme/acme-challenge/";
    email = "bar@example.com";
  };
}
```

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.credentialFiles` {#opt-security.acme.certs._name_.credentialFiles}

Environment variables suffixed by "\_FILE" or "\_PATH" to set for the
cert's service for your selected dnsProvider.
To find out what values you need to set, consult the documentation at
[https://go-acme.github.io/lego/dns/](https://go-acme.github.io/lego/dns/) for the corresponding dnsProvider.
This allows to securely pass credential files to lego by leveraging systemd
credentials.

*Type:* attribute set of absolute path

*Default:* `config.security.acme.defaults.credentialFiles`

*Example:*

``` nix
{
  "DNSUPDATE_TSIG_SECRET_FILE" = "/run/secrets/tsig-secret-example.org";
}
```

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.csr` {#opt-security.acme.certs._name_.csr}

Path to a certificate signing request to apply when fetching the certificate.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.csrKey` {#opt-security.acme.certs._name_.csrKey}

Path to the private key to the matching certificate signing request.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.directory` {#opt-security.acme.certs._name_.directory}

Directory where certificate and other state is stored.

*Type:* string

*Default:* `"/var/lib/acme/‹name›"`

*Read only*

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.dnsAuthoritativePropagationCheck` {#opt-security.acme.certs._name_.dnsAuthoritativePropagationCheck}

Toggles lego's authoritative DNS propagation check, which is used
alongside DNS-01 challenge to ensure the DNS entries required are
available.

*Type:* boolean

*Default:* `config.security.acme.defaults.dnsAuthoritativePropagationCheck`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.dnsProvider` {#opt-security.acme.certs._name_.dnsProvider}

DNS Challenge provider. For a list of supported providers, see the "code"
field of the DNS providers listed at [https://go-acme.github.io/lego/dns/](https://go-acme.github.io/lego/dns/).

*Type:* null or string

*Default:* `config.security.acme.defaults.dnsProvider`

*Example:* `"route53"`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.dnsRecursivePropagationCheck` {#opt-security.acme.certs._name_.dnsRecursivePropagationCheck}

Toggles lego's recursive DNS propagation check, which is used
alongside DNS-01 challenge to ensure the DNS entries required are
available.

::: warning
Recursive DNS queries can result in negative caching, which can
break the propagation check.
:::

*Type:* boolean

*Default:* `config.security.acme.defaults.dnsRecursivePropagationCheck`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.dnsResolver` {#opt-security.acme.certs._name_.dnsResolver}

Set the resolver to use for performing recursive DNS queries. Supported:
host:port. The default is to use the system resolvers, or Google's DNS
resolvers if the system's cannot be determined.

*Type:* null or string

*Default:* `config.security.acme.defaults.dnsResolver`

*Example:* `"1.1.1.1:53"`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.domain` {#opt-security.acme.certs._name_.domain}

Domain to fetch certificate for (defaults to the entry name).

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.email` {#opt-security.acme.certs._name_.email}

Email address for account creation and correspondence from the CA.
It is recommended to use the same email for all certs to avoid account
creation limits.

*Type:* null or string

*Default:* `config.security.acme.defaults.email`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.enableDebugLogs` {#opt-security.acme.certs._name_.enableDebugLogs}

Whether to enable debug logging for this certificate.

*Type:* boolean

*Default:* `config.security.acme.defaults.enableDebugLogs`

*Example:* `true`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.environmentFile` {#opt-security.acme.certs._name_.environmentFile}

Path to an EnvironmentFile for the cert's service containing any required and
optional environment variables for your selected dnsProvider.
To find out what values you need to set, consult the documentation at
[https://go-acme.github.io/lego/dns/](https://go-acme.github.io/lego/dns/) for the corresponding dnsProvider.

*Type:* null or absolute path

*Default:* `config.security.acme.defaults.environmentFile`

*Example:* `"/var/src/secrets/example.org-route53-api-token"`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.extraDomainNames` {#opt-security.acme.certs._name_.extraDomainNames}

A list of extra domain names, which are included in the one certificate to be issued.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "example.org"
  "mydomain.org"
]
```

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.extraLegoFlags` {#opt-security.acme.certs._name_.extraLegoFlags}

Additional flags to pass to both `lego run` invocations.

*Type:* list of string

*Default:* `config.security.acme.defaults.extraLegoFlags`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.extraLegoRenewFlags` {#opt-security.acme.certs._name_.extraLegoRenewFlags}

Additional flags to pass to the non-forced renewal `lego run` invocation.

*Type:* list of string

*Default:* `config.security.acme.defaults.extraLegoRenewFlags`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.extraLegoRunFlags` {#opt-security.acme.certs._name_.extraLegoRunFlags}

Additional flags to pass to the forced obtain/reissue `lego run` invocation.

*Type:* list of string

*Default:* `config.security.acme.defaults.extraLegoRunFlags`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.group` {#opt-security.acme.certs._name_.group}

Group running the ACME client.

*Type:* string

*Default:* `config.security.acme.defaults.group`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.inheritDefaults` {#opt-security.acme.certs._name_.inheritDefaults}

Whether to inherit values set in `security.acme.defaults` or not.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.keyType` {#opt-security.acme.certs._name_.keyType}

Key type to use for private keys.
For an up to date list of supported values check the --key-type option
at [https://go-acme.github.io/lego/references/ref-flags/index.html#options](https://go-acme.github.io/lego/references/ref-flags/index.html#options).

*Type:* string

*Default:* `config.security.acme.defaults.keyType`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.listenHTTP` {#opt-security.acme.certs._name_.listenHTTP}

Interface and port to listen on to solve HTTP challenges
in the form `[INTERFACE]:PORT`.
If you use a port other than 80, you must proxy port 80 to this port.

*Type:* null or string

*Default:* `config.security.acme.defaults.listenHTTP`

*Example:* `":1360"`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.ocspMustStaple` {#opt-security.acme.certs._name_.ocspMustStaple}

Turns on the OCSP Must-Staple TLS extension.
Make sure you know what you're doing!
OCSP Must-Staple can be considered a legacy feature, that is no longer superted by Let's Encrypt. See:

- [https://letsencrypt.org/2024/12/05/ending-ocsp](https://letsencrypt.org/2024/12/05/ending-ocsp)
- [https://blog.apnic.net/2019/01/15/is-the-web-ready-for-ocsp-must-staple/](https://blog.apnic.net/2019/01/15/is-the-web-ready-for-ocsp-must-staple/)
- [https://blog.hboeck.de/archives/886-The-Problem-with-OCSP-Stapling-and-Must-Staple-and-why-Certificate-Revocation-is-still-broken.html](https://blog.hboeck.de/archives/886-The-Problem-with-OCSP-Stapling-and-Must-Staple-and-why-Certificate-Revocation-is-still-broken.html)

*Type:* boolean

*Default:* `config.security.acme.defaults.ocspMustStaple`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.postRun` {#opt-security.acme.certs._name_.postRun}

Commands to run after new certificates go live. Note that
these commands run as the root user.

Executed in the same directory with the new certificate.

*Type:* strings concatenated with "\\n"

*Default:* `config.security.acme.defaults.postRun`

*Example:* `"cp full.pem backup.pem"`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.profile` {#opt-security.acme.certs._name_.profile}

The certificate profile to choose if the CA offers multiple profiles.

*Type:* null or string

*Default:* `config.security.acme.defaults.profile`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.reloadServices` {#opt-security.acme.certs._name_.reloadServices}

The list of systemd services to call `systemctl try-reload-or-restart`
on.

*Type:* list of string

*Default:* `config.security.acme.defaults.reloadServices`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.renewInterval` {#opt-security.acme.certs._name_.renewInterval}

Systemd calendar expression when to check for renewal. See
`systemd.time(7)`.

If you reduce this from daily you might also want to adapt [`security.acme.defaults.renewJitter`](#opt-security.acme.defaults.renewJitter).

*Type:* string

*Default:* `config.security.acme.defaults.renewInterval`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.renewIntervalFailed` {#opt-security.acme.certs._name_.renewIntervalFailed}

Systemd time-span value when to retry a renewal in case the service has failed.
See `systemd.time(7)`

Let's Encrypt Failed Validation Limit allows 5 retries per hour, per account, hostname and hour.
The default avoids eating them all up if something is misconfigured upon the first try.

*Type:* string

*Default:* `config.security.acme.defaults.renewIntervalFailed`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.renewJitter` {#opt-security.acme.certs._name_.renewJitter}

Maximum jitter applied to a timer to stretch its execution
intervals to prevent multiple timers from firing simultaneously. See
`RandomizedDelaySecs=` in `systemd.timer(5)`.

*Type:* string

*Default:* `config.security.acme.defaults.renewJitter`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.s3Bucket` {#opt-security.acme.certs._name_.s3Bucket}

S3 bucket name to use for HTTP-01 based challenges. Challenges will be written to the S3 bucket.

*Type:* null or string

*Default:* `null`

*Example:* `"acme"`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.server` {#opt-security.acme.certs._name_.server}

ACME Directory Resource URI.
Defaults to Let's Encrypt's production endpoint.
For testing Let's Encrypt's [staging endpoint](https://letsencrypt.org/docs/staging-environment/)
should be used to avoid the rather tight rate limit on the production endpoint.

*Type:* null or string

*Default:* `config.security.acme.defaults.server`

*Example:* `"https://acme-staging-v02.api.letsencrypt.org/directory"`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.validMinDays` {#opt-security.acme.certs._name_.validMinDays}

Minimum remaining validity before renewal in days.

If unset, the renewal time is calculated dynamically:

- for regular certificates, renewal occurs when less than one-third of the lifetime remains
- for short-lived certificates, renewal occurs when less than half of the lifetime remains

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.certs.<name>.webroot` {#opt-security.acme.certs._name_.webroot}

Where the webroot of the HTTP vhost is located.
`.well-known/acme-challenge/` directory
will be created below the webroot if it doesn't exist.
`http://example.org/.well-known/acme-challenge/` must also
be available (notice unencrypted HTTP).

*Type:* null or string

*Default:* `config.security.acme.defaults.webroot`

*Example:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults` {#opt-security.acme.defaults}

Default values inheritable by all configured certs. You can
use this to define options shared by all your certs. These defaults
can also be ignored on a per-cert basis using the
`security.acme.certs.${cert}.inheritDefaults` option.

*Type:* submodule

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.credentialFiles` {#opt-security.acme.defaults.credentialFiles}

Environment variables suffixed by "\_FILE" or "\_PATH" to set for the
cert's service for your selected dnsProvider.
To find out what values you need to set, consult the documentation at
[https://go-acme.github.io/lego/dns/](https://go-acme.github.io/lego/dns/) for the corresponding dnsProvider.
This allows to securely pass credential files to lego by leveraging systemd
credentials.

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
{
  "DNSUPDATE_TSIG_SECRET_FILE" = "/run/secrets/tsig-secret-example.org";
}
```

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.dnsAuthoritativePropagationCheck` {#opt-security.acme.defaults.dnsAuthoritativePropagationCheck}

Toggles lego's authoritative DNS propagation check, which is used
alongside DNS-01 challenge to ensure the DNS entries required are
available.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.dnsProvider` {#opt-security.acme.defaults.dnsProvider}

DNS Challenge provider. For a list of supported providers, see the "code"
field of the DNS providers listed at [https://go-acme.github.io/lego/dns/](https://go-acme.github.io/lego/dns/).

*Type:* null or string

*Default:* `null`

*Example:* `"route53"`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.dnsRecursivePropagationCheck` {#opt-security.acme.defaults.dnsRecursivePropagationCheck}

Toggles lego's recursive DNS propagation check, which is used
alongside DNS-01 challenge to ensure the DNS entries required are
available.

::: warning
Recursive DNS queries can result in negative caching, which can
break the propagation check.
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.dnsResolver` {#opt-security.acme.defaults.dnsResolver}

Set the resolver to use for performing recursive DNS queries. Supported:
host:port. The default is to use the system resolvers, or Google's DNS
resolvers if the system's cannot be determined.

*Type:* null or string

*Default:* `null`

*Example:* `"1.1.1.1:53"`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.email` {#opt-security.acme.defaults.email}

Email address for account creation and correspondence from the CA.
It is recommended to use the same email for all certs to avoid account
creation limits.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.enableDebugLogs` {#opt-security.acme.defaults.enableDebugLogs}

Whether to enable debug logging for this certificate.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.environmentFile` {#opt-security.acme.defaults.environmentFile}

Path to an EnvironmentFile for the cert's service containing any required and
optional environment variables for your selected dnsProvider.
To find out what values you need to set, consult the documentation at
[https://go-acme.github.io/lego/dns/](https://go-acme.github.io/lego/dns/) for the corresponding dnsProvider.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/src/secrets/example.org-route53-api-token"`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.extraLegoFlags` {#opt-security.acme.defaults.extraLegoFlags}

Additional flags to pass to both `lego run` invocations.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.extraLegoRenewFlags` {#opt-security.acme.defaults.extraLegoRenewFlags}

Additional flags to pass to the non-forced renewal `lego run` invocation.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.extraLegoRunFlags` {#opt-security.acme.defaults.extraLegoRunFlags}

Additional flags to pass to the forced obtain/reissue `lego run` invocation.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.group` {#opt-security.acme.defaults.group}

Group running the ACME client.

*Type:* string

*Default:* `"acme"`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.keyType` {#opt-security.acme.defaults.keyType}

Key type to use for private keys.
For an up to date list of supported values check the --key-type option
at [https://go-acme.github.io/lego/references/ref-flags/index.html#options](https://go-acme.github.io/lego/references/ref-flags/index.html#options).

*Type:* string

*Default:* `"ec256"`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.listenHTTP` {#opt-security.acme.defaults.listenHTTP}

Interface and port to listen on to solve HTTP challenges
in the form `[INTERFACE]:PORT`.
If you use a port other than 80, you must proxy port 80 to this port.

*Type:* null or string

*Default:* `null`

*Example:* `":1360"`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.ocspMustStaple` {#opt-security.acme.defaults.ocspMustStaple}

Turns on the OCSP Must-Staple TLS extension.
Make sure you know what you're doing!
OCSP Must-Staple can be considered a legacy feature, that is no longer superted by Let's Encrypt. See:

- [https://letsencrypt.org/2024/12/05/ending-ocsp](https://letsencrypt.org/2024/12/05/ending-ocsp)
- [https://blog.apnic.net/2019/01/15/is-the-web-ready-for-ocsp-must-staple/](https://blog.apnic.net/2019/01/15/is-the-web-ready-for-ocsp-must-staple/)
- [https://blog.hboeck.de/archives/886-The-Problem-with-OCSP-Stapling-and-Must-Staple-and-why-Certificate-Revocation-is-still-broken.html](https://blog.hboeck.de/archives/886-The-Problem-with-OCSP-Stapling-and-Must-Staple-and-why-Certificate-Revocation-is-still-broken.html)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.postRun` {#opt-security.acme.defaults.postRun}

Commands to run after new certificates go live. Note that
these commands run as the root user.

Executed in the same directory with the new certificate.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"cp full.pem backup.pem"`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.profile` {#opt-security.acme.defaults.profile}

The certificate profile to choose if the CA offers multiple profiles.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.reloadServices` {#opt-security.acme.defaults.reloadServices}

The list of systemd services to call `systemctl try-reload-or-restart`
on.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.renewInterval` {#opt-security.acme.defaults.renewInterval}

Systemd calendar expression when to check for renewal. See
`systemd.time(7)`.

If you reduce this from daily you might also want to adapt [`security.acme.defaults.renewJitter`](#opt-security.acme.defaults.renewJitter).

*Type:* string

*Default:* `"daily"`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.renewIntervalFailed` {#opt-security.acme.defaults.renewIntervalFailed}

Systemd time-span value when to retry a renewal in case the service has failed.
See `systemd.time(7)`

Let's Encrypt Failed Validation Limit allows 5 retries per hour, per account, hostname and hour.
The default avoids eating them all up if something is misconfigured upon the first try.

*Type:* string

*Default:* `"900"`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.renewJitter` {#opt-security.acme.defaults.renewJitter}

Maximum jitter applied to a timer to stretch its execution
intervals to prevent multiple timers from firing simultaneously. See
`RandomizedDelaySecs=` in `systemd.timer(5)`.

*Type:* string

*Default:* `"24h"`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.server` {#opt-security.acme.defaults.server}

ACME Directory Resource URI.
Defaults to Let's Encrypt's production endpoint.
For testing Let's Encrypt's [staging endpoint](https://letsencrypt.org/docs/staging-environment/)
should be used to avoid the rather tight rate limit on the production endpoint.

*Type:* null or string

*Default:* `"https://acme-v02.api.letsencrypt.org/directory"`

*Example:* `"https://acme-staging-v02.api.letsencrypt.org/directory"`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.validMinDays` {#opt-security.acme.defaults.validMinDays}

Minimum remaining validity before renewal in days.

If unset, the renewal time is calculated dynamically:

- for regular certificates, renewal occurs when less than one-third of the lifetime remains
- for short-lived certificates, renewal occurs when less than half of the lifetime remains

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.defaults.webroot` {#opt-security.acme.defaults.webroot}

Where the webroot of the HTTP vhost is located.
`.well-known/acme-challenge/` directory
will be created below the webroot if it doesn't exist.
`http://example.org/.well-known/acme-challenge/` must also
be available (notice unencrypted HTTP).

*Type:* null or string

*Default:* `null`

*Example:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.maxConcurrentRenewals` {#opt-security.acme.maxConcurrentRenewals}

Maximum number of concurrent certificate generation or renewal jobs. All other
jobs will queue and wait running jobs to finish. Reduces the system load of
certificate generation.

Set to `0` to allow unlimited number of concurrent job runs."

*Type:* signed integer

*Default:* `5`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.acme.useRoot` {#opt-security.acme.useRoot}

Whether to use the root user when generating certs. This is not recommended
for security + compatibility reasons. If a service requires root owned certificates
consider following the guide on "Using ACME with services demanding root
owned certificates" in the NixOS manual, and only using this as a fallback
or for testing.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/acme`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/acme)

## `security.agnos.enable` {#opt-security.agnos.enable}

Whether to enable agnos.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/agnos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/agnos.nix)

## `security.agnos.generateKeys.enable` {#opt-security.agnos.generateKeys.enable}

Enable automatic generation of account keys.

When this is `true`, a key will be generated for each account where
the file referred to by the `private_key` path does not exist yet.

Currently, only RSA keys can be generated.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/agnos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/agnos.nix)

## `security.agnos.generateKeys.keySize` {#opt-security.agnos.generateKeys.keySize}

Key size in bits to use when generating new keys.

*Type:* signed integer

*Default:* `4096`

*Declared by:* [`nixos/modules/security/agnos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/agnos.nix)

## `security.agnos.group` {#opt-security.agnos.group}

Group to run Agnos as. The acquired certificates will be owned by this group.

*Type:* string

*Default:* `"agnos"`

*Declared by:* [`nixos/modules/security/agnos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/agnos.nix)

## `security.agnos.persistent` {#opt-security.agnos.persistent}

When `true`, use a persistent systemd timer.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/agnos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/agnos.nix)

## `security.agnos.server` {#opt-security.agnos.server}

ACME Directory Resource URI. Defaults to Let's Encrypt's production endpoint,
`https://acme-v02.api.letsencrypt.org/directory`, if unset.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/security/agnos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/agnos.nix)

## `security.agnos.serverCa` {#opt-security.agnos.serverCa}

The root certificate (in PEM format) of the ACME server's HTTPS interface.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/security/agnos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/agnos.nix)

## `security.agnos.settings` {#opt-security.agnos.settings}

Settings

*Type:* open submodule of attribute set of (TOML value)

*Declared by:* [`nixos/modules/security/agnos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/agnos.nix)

## `security.agnos.settings.accounts` {#opt-security.agnos.settings.accounts}

A list of ACME accounts.
Each account is associated with an email address
and can be used to obtain an arbitrary amount of certificate
(subject to provider's rate limits,
see e.g. [Let's Encrypt Rate Limits](https://letsencrypt.org/docs/rate-limits/)).

*Type:* list of (open submodule of attribute set of (TOML value))

*Declared by:* [`nixos/modules/security/agnos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/agnos.nix)

## `security.agnos.settings.accounts.*.certificates` {#opt-security.agnos.settings.accounts._.certificates}

Certificates for agnos to issue or renew.

*Type:* list of (open submodule of attribute set of (TOML value))

*Declared by:* [`nixos/modules/security/agnos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/agnos.nix)

## `security.agnos.settings.accounts.*.certificates.*.domains` {#opt-security.agnos.settings.accounts._.certificates._.domains}

Domains the certificate represents

*Type:* list of string

*Default:* `[ ]`

*Example:* `["a.example.com", "b.example.com", "*b.example.com"]`

*Declared by:* [`nixos/modules/security/agnos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/agnos.nix)

## `security.agnos.settings.accounts.*.certificates.*.fullchain_output_file` {#opt-security.agnos.settings.accounts._.certificates._.fullchain_output_file}

Output path for the full chain including the acquired certificate.
If a relative path is specified, the file will be created in `/var/lib/agnos`.

*Type:* string

*Declared by:* [`nixos/modules/security/agnos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/agnos.nix)

## `security.agnos.settings.accounts.*.certificates.*.key_output_file` {#opt-security.agnos.settings.accounts._.certificates._.key_output_file}

Output path for the certificate private key.
If a relative path is specified, the file will be created in `/var/lib/agnos`.

*Type:* string

*Declared by:* [`nixos/modules/security/agnos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/agnos.nix)

## `security.agnos.settings.accounts.*.email` {#opt-security.agnos.settings.accounts._.email}

Email associated with this account.

*Type:* string

*Declared by:* [`nixos/modules/security/agnos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/agnos.nix)

## `security.agnos.settings.accounts.*.private_key_path` {#opt-security.agnos.settings.accounts._.private_key_path}

Path of the PEM-encoded private key for this account.
Currently, only RSA keys are supported.

If this path does not exist, then the behavior depends on `generateKeys.enable`.
When this option is `true`,
the key will be automatically generated and saved to this path.
When it is `false`, agnos will fail.

If a relative path is specified,
the key will be looked up (or generated and saved to) under `/var/lib/agnos`.

*Type:* string

*Declared by:* [`nixos/modules/security/agnos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/agnos.nix)

## `security.agnos.settings.dns_listen_addr` {#opt-security.agnos.settings.dns_listen_addr}

Address for agnos to listen on.
Note that this needs to be reachable by the outside world,
and 53 is required in most situations
since `NS` records do not allow specifying the port.

*Type:* string

*Default:* `"0.0.0.0:53"`

*Declared by:* [`nixos/modules/security/agnos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/agnos.nix)

## `security.agnos.startAt` {#opt-security.agnos.startAt}

How often or when to run agnos.

The format is described in
`systemd.time(7)`.

*Type:* string or list of string

*Default:* `"daily"`

*Example:* `"02:00"`

*Declared by:* [`nixos/modules/security/agnos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/agnos.nix)

## `security.agnos.temporarilyOpenFirewall` {#opt-security.agnos.temporarilyOpenFirewall}

When `true`, will open the port specified in `settings.dns_listen_addr`
before running the agnos service, and close it when agnos finishes running.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/agnos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/agnos.nix)

## `security.agnos.user` {#opt-security.agnos.user}

User to run Agnos as. The acquired certificates will be owned by this user.

*Type:* string

*Default:* `"agnos"`

*Declared by:* [`nixos/modules/security/agnos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/agnos.nix)

## `security.allowSimultaneousMultithreading` {#opt-security.allowSimultaneousMultithreading}

Whether to allow SMT/hyperthreading.  Disabling SMT means that only
physical CPU cores will be usable at runtime, potentially at
significant performance cost.

The primary motivation for disabling SMT is to mitigate the risk of
leaking data between threads running on the same CPU core (due to
e.g., shared caches).  This attack vector is unproven.

Disabling SMT is a supplement to the L1 data cache flushing mitigation
(see [security](#opt-security.virtualisation.flushL1DataCache))
versus malicious VM guests (SMT could "bring back" previously flushed
data).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/misc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/misc.nix)

## `security.allowUserNamespaces` {#opt-security.allowUserNamespaces}

Whether to allow creation of user namespaces.

The motivation for disabling user namespaces is the potential
presence of code paths where the kernel's permission checking
logic fails to account for namespacing, instead permitting a
namespaced process to act outside the namespace with the same
privileges as it would have inside it.  This is particularly
damaging in the common case of running as root within the namespace.

When user namespace creation is disallowed, attempting to create a
user namespace fails with "no space left on device" (ENOSPC).
root may re-enable user namespace creation at runtime.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/misc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/misc.nix)

## `security.apparmor.enable` {#opt-security.apparmor.enable}

Whether to enable the AppArmor Mandatory Access Control system.

If you're enabling this module on a running system,
note that a reboot will be required to activate AppArmor in the kernel.

Also, beware that enabling this module privileges stability over security
by not trying to kill unconfined but newly confinable running processes by default,
though it would be needed because AppArmor can only confine new
or already confined processes of an executable.
This killing would for instance be necessary when upgrading to a NixOS revision
introducing for the first time an AppArmor profile for the executable
of a running process.

Enable [security](#opt-security.apparmor.killUnconfinedConfinables)
if you want this service to do such killing
by sending a `SIGTERM` to those running processes.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/apparmor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/apparmor.nix)

## `security.apparmor.enableCache` {#opt-security.apparmor.enableCache}

Whether to enable caching of AppArmor policies
in `/var/cache/apparmor/`.

Beware that AppArmor policies almost always contain Nix store paths,
and thus produce at each change of these paths
a new cached version accumulating in the cache.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/apparmor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/apparmor.nix)

## `security.apparmor.includes` {#opt-security.apparmor.includes}

List of paths to be added to AppArmor's searched paths
when resolving `include` directives.

*Type:* attribute set of strings concatenated with "\\n"

*Default:* `{ }`

*Declared by:* [`nixos/modules/security/apparmor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/apparmor.nix)

## `security.apparmor.killUnconfinedConfinables` {#opt-security.apparmor.killUnconfinedConfinables}

Whether to enable killing of processes which have an AppArmor profile enabled
(in [security](#opt-security.apparmor.policies))
but are not confined (because AppArmor can only confine new processes).

This is only sending a gracious `SIGTERM` signal to the processes,
not a `SIGKILL`.

Beware that due to a current limitation of AppArmor,
only profiles with exact paths (and no name) can enable such kills.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/apparmor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/apparmor.nix)

## `security.apparmor.packages` {#opt-security.apparmor.packages}

List of packages to be added to AppArmor's include path

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/security/apparmor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/apparmor.nix)

## `security.apparmor.policies` {#opt-security.apparmor.policies}

AppArmor policies.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/security/apparmor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/apparmor.nix)

## `security.apparmor.policies.<name>.path` {#opt-security.apparmor.policies._name_.path}

A path of a profile file to include. Incompatible with profile.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/security/apparmor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/apparmor.nix)

## `security.apparmor.policies.<name>.profile` {#opt-security.apparmor.policies._name_.profile}

The profile file contents. Incompatible with path.

*Type:* strings concatenated with "\\n"

*Declared by:* [`nixos/modules/security/apparmor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/apparmor.nix)

## `security.apparmor.policies.<name>.state` {#opt-security.apparmor.policies._name_.state}

How strictly this policy should be enforced

*Type:* one of "disable", "complain", "enforce"

*Default:* `"enforce"`

*Declared by:* [`nixos/modules/security/apparmor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/apparmor.nix)

## `security.audit.backlogLimit` {#opt-security.audit.backlogLimit}

The maximum number of outstanding audit buffers allowed; exceeding this is
considered a failure and handled in a manner specified by failureMode.

*Type:* signed integer

*Default:* `1024`

*Declared by:* [`nixos/modules/security/audit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/audit.nix)

## `security.audit.enable` {#opt-security.audit.enable}

Whether to enable the Linux audit system. The special `lock` value can be used to
enable auditing and prevent disabling it until a restart. Be careful about locking
this, as it will prevent you from changing your audit configuration until you
restart. If possible, test your configuration using build-vm beforehand.

*Type:* one of false, true, "lock"

*Default:* `false`

*Declared by:* [`nixos/modules/security/audit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/audit.nix)

## `security.audit.failureMode` {#opt-security.audit.failureMode}

How to handle critical errors in the auditing system

*Type:* one of "silent", "printk", "panic"

*Default:* `"printk"`

*Declared by:* [`nixos/modules/security/audit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/audit.nix)

## `security.audit.package` {#opt-security.audit.package}

The audit package to use.

*Type:* package

*Default:* `pkgs.audit`

*Declared by:* [`nixos/modules/security/audit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/audit.nix)

## `security.audit.rateLimit` {#opt-security.audit.rateLimit}

The maximum messages per second permitted before triggering a failure as
specified by failureMode. Setting it to zero disables the limit.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/security/audit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/audit.nix)

## `security.audit.rules` {#opt-security.audit.rules}

The ordered audit rules, with each string appearing as one line of the audit.rules file.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-a exit,always -F arch=b64 -S execve"
]
```

*Declared by:* [`nixos/modules/security/audit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/audit.nix)

## `security.auditd.enable` {#opt-security.auditd.enable}

Whether to enable the Linux Audit daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/auditd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/auditd.nix)

## `security.auditd.package` {#opt-security.auditd.package}

The auditd package to use.

*Type:* package

*Default:* `pkgs.audit`

*Declared by:* [`nixos/modules/security/auditd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/auditd.nix)

## `security.auditd.plugins` {#opt-security.auditd.plugins}

Plugin definitions to register with auditd

*Type:* attribute set of (submodule)

*Default:*

``` nix
{
  af_unix = {
    path = lib.getExe' config.security.auditd.package "audisp-af_unix";
    args = [
      "0640"
      "/run/audit/audispd_events"
      "string"
    ];
  };
  remote = {
    path = lib.getExe' config.security.auditd.package "audisp-remote";
    settings = { };
  };
  filter = {
    path = lib.getExe' config.security.auditd.package "audisp-filter";
    args = [
      "allowlist"
      "/etc/audit/audisp-filter.conf"
      (lib.getExe' config.security.auditd.package "audisp-syslog")
      "LOG_USER"
      "LOG_INFO"
      "interpret"
    ];
    settings = { };
  };
  syslog = {
    path = lib.getExe' config.security.auditd.package "audisp-syslog";
    args = [ "LOG_INFO" ];
  };
}
```

*Declared by:* [`nixos/modules/security/auditd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/auditd.nix)

## `security.auditd.plugins.<name>.active` {#opt-security.auditd.plugins._name_.active}

Whether to enable this plugin.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/auditd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/auditd.nix)

## `security.auditd.plugins.<name>.args` {#opt-security.auditd.plugins._name_.args}

This allows you to pass arguments to the child program.
Generally plugins do not take arguments and have their own
config file that instructs them how they should be configured.

*Type:* null or (list of non-empty string)

*Default:* `null`

*Declared by:* [`nixos/modules/security/auditd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/auditd.nix)

## `security.auditd.plugins.<name>.direction` {#opt-security.auditd.plugins._name_.direction}

The option is dictated by the plugin. In or out are the only choices.
You cannot make a plugin operate in a way it wasn't  designed just by
changing this option. This option is to give a clue to the event dispatcher
about which direction events flow.

::: note
Inbound events are not supported yet.
:::

*Type:* one of "in", "out"

*Default:* `"out"`

*Declared by:* [`nixos/modules/security/auditd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/auditd.nix)

## `security.auditd.plugins.<name>.format` {#opt-security.auditd.plugins._name_.format}

Binary passes the data exactly as the audit event dispatcher gets it from
the audit daemon. The string option tells the dispatcher to completely change
the event into a string suitable for parsing with the audit parsing library.

*Type:* one of "binary", "string"

*Default:* `"string"`

*Declared by:* [`nixos/modules/security/auditd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/auditd.nix)

## `security.auditd.plugins.<name>.path` {#opt-security.auditd.plugins._name_.path}

This is the absolute path to the plugin executable.

*Type:* absolute path

*Declared by:* [`nixos/modules/security/auditd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/auditd.nix)

## `security.auditd.plugins.<name>.settings` {#opt-security.auditd.plugins._name_.settings}

Plugin-specific config file to link to /etc/audit/<plugin>.conf

*Type:* null or (open submodule of attribute set of (null or boolean or non-empty string or absolute path or signed integer))

*Default:* `null`

*Declared by:* [`nixos/modules/security/auditd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/auditd.nix)

## `security.auditd.plugins.<name>.type` {#opt-security.auditd.plugins._name_.type}

This tells the dispatcher how the plugin wants to be run. There is only
one valid option, `always`, which means the plugin is external and should
always be run. The default is `always` since there are no more builtin plugins.

*Type:* value "always" (singular enum)

*Default:* `"always"`

*Read only*

*Declared by:* [`nixos/modules/security/auditd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/auditd.nix)

## `security.auditd.settings` {#opt-security.auditd.settings}

auditd configuration file contents. See {auditd.conf} for supported values.

*Type:* open submodule of attribute set of (null or boolean or non-empty string or absolute path or signed integer)

*Default:* `{ }`

*Declared by:* [`nixos/modules/security/auditd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/auditd.nix)

## `security.auditd.settings.admin_space_left` {#opt-security.auditd.settings.admin_space_left}

This is a numeric value in mebibytes (MiB) that tells the audit daemon when to perform a configurable action because the system is running
low on disk space. This should be considered the last chance to do something before running out of disk space. The numeric value for
this parameter should be lower than the number for `space_left`. You may also append a percent sign (e.g. 1%) to the number to have
the audit daemon calculate the number based on the disk partition size.

*Type:* signed integer or string matching the pattern \[0-9\]+%

*Default:* `50`

*Declared by:* [`nixos/modules/security/auditd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/auditd.nix)

## `security.auditd.settings.space_left` {#opt-security.auditd.settings.space_left}

If the free space in the filesystem containing log\_file drops below this value, the audit daemon takes the action specified by
`space_left_action`. If the value of `space_left` is specified as a whole number, it is interpreted as an absolute size in mebibytes
(MiB). If the value is specified as a number between 1 and 99 followed by a percentage sign (e.g., 5%), the audit daemon calculates
the absolute size in megabytes based on the size of the filesystem containing `log_file`. (E.g., if the filesystem containing
`log_file` is 2 gibibytes in size, and `space_left` is set to 25%, then the audit daemon sets `space_left` to approximately 500 mebibytes.

::: note
This calculation is performed when the audit daemon starts, so if you resize the filesystem containing `log_file` while the
audit daemon is running, you should send the audit daemon SIGHUP to re-read the configuration file and recalculate the correct per‐
centage.
:::

*Type:* signed integer or string matching the pattern \[0-9\]+%

*Default:* `75`

*Declared by:* [`nixos/modules/security/auditd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/auditd.nix)

## `security.chromiumSuidSandbox.enable` {#opt-security.chromiumSuidSandbox.enable}

Whether to install the Chromium SUID sandbox which is an executable that
Chromium may use in order to achieve sandboxing.

If you get the error "The SUID sandbox helper binary was found, but is not
configured correctly.", turning this on might help.

Also, if the URL chrome://sandbox tells you that "You are not adequately
sandboxed!", turning this on might resolve the issue.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/chromium-suid-sandbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/chromium-suid-sandbox.nix)

## `security.doas.enable` {#opt-security.doas.enable}

Whether to enable the `doas` command, which allows
non-root users to execute commands as root.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/doas.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/doas.nix)

## `security.doas.extraConfig` {#opt-security.doas.extraConfig}

Extra configuration text appended to `doas.conf`. Be aware that
this option cannot be used to override the behaviour allowing
passwordless operation for root.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/security/doas.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/doas.nix)

## `security.doas.extraRules` {#opt-security.doas.extraRules}

Define specific rules to be set in the
`/etc/doas.conf` file. More specific rules should
come after more general ones in order to yield the expected behavior.
You can use `mkBefore` and/or `mkAfter` to ensure
this is the case when configuration options are merged. Be aware that
this option cannot be used to override the behaviour allowing
passwordless operation for root.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  # Allow execution of any command by any user in group doas, requiring
  # a password and keeping any previously-defined environment variables.
  { groups = [ "doas" ]; noPass = false; keepEnv = true; }

  # Allow execution of "/home/root/secret.sh" by user `backup` OR user
  # `database` OR any member of the group with GID `1006`, without a
  # password.
  { users = [ "backup" "database" ]; groups = [ 1006 ];
    cmd = "/home/root/secret.sh"; noPass = true; }

  # Allow any member of group `bar` to run `/home/baz/cmd1.sh` as user
  # `foo` with argument `hello-doas`.
  { groups = [ "bar" ]; runAs = "foo";
    cmd = "/home/baz/cmd1.sh"; args = [ "hello-doas" ]; }

  # Allow any member of group `bar` to run `/home/baz/cmd2.sh` as user
  # `foo` with no arguments.
  { groups = [ "bar" ]; runAs = "foo";
    cmd = "/home/baz/cmd2.sh"; args = [ ]; }

  # Allow user `abusers` to execute "nano" and unset the value of
  # SSH_AUTH_SOCK, override the value of ALPHA to 1, and inherit the
  # value of BETA from the current environment.
  { users = [ "abusers" ]; cmd = "nano";
    setEnv = [ "-SSH_AUTH_SOCK" "ALPHA=1" "BETA" ]; }
]
```

*Declared by:* [`nixos/modules/security/doas.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/doas.nix)

## `security.doas.extraRules.*.args` {#opt-security.doas.extraRules._.args}

Arguments that must be provided to the command. When set to
`[]`, the command must be run without any arguments.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/security/doas.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/doas.nix)

## `security.doas.extraRules.*.cmd` {#opt-security.doas.extraRules._.cmd}

The command the user is allowed to run. When set to
`null` (the default), all commands are allowed.

NOTE: It is best practice to specify absolute paths. If a
relative path is specified, only a restricted PATH will be
searched.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/security/doas.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/doas.nix)

## `security.doas.extraRules.*.groups` {#opt-security.doas.extraRules._.groups}

The groups / GIDs this rule should apply for.

*Type:* list of (string or signed integer)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/security/doas.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/doas.nix)

## `security.doas.extraRules.*.keepEnv` {#opt-security.doas.extraRules._.keepEnv}

If `true`, environment variables other than those
listed in
`doas(1)`
are kept when creating the environment for the new process.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/doas.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/doas.nix)

## `security.doas.extraRules.*.noLog` {#opt-security.doas.extraRules._.noLog}

If `true`, successful executions will not be logged
to
`syslogd(8)`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/doas.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/doas.nix)

## `security.doas.extraRules.*.noPass` {#opt-security.doas.extraRules._.noPass}

If `true`, the user is not required to enter a
password.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/doas.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/doas.nix)

## `security.doas.extraRules.*.persist` {#opt-security.doas.extraRules._.persist}

If `true`, do not ask for a password again for some
time after the user successfully authenticates.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/doas.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/doas.nix)

## `security.doas.extraRules.*.runAs` {#opt-security.doas.extraRules._.runAs}

Which user or group the specified command is allowed to run as.
When set to `null` (the default), all users are
allowed.

A user can be specified using just the username:
`"foo"`. It is also possible to only allow running as
a specific group with `":bar"`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/security/doas.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/doas.nix)

## `security.doas.extraRules.*.setEnv` {#opt-security.doas.extraRules._.setEnv}

Keep or set the specified variables. Variables may also be
removed with a leading '-' or set using
`variable=value`. If the first character of
`value` is a '$', the value to be set is taken from
the existing environment variable of the indicated name. This
option is processed after the default environment has been
created.

NOTE: All rules have `setenv { SSH_AUTH_SOCK }` by
default. To prevent `SSH_AUTH_SOCK` from being
inherited, add `"-SSH_AUTH_SOCK"` anywhere in this
list.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/security/doas.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/doas.nix)

## `security.doas.extraRules.*.users` {#opt-security.doas.extraRules._.users}

The usernames / UIDs this rule should apply for.

*Type:* list of (string or signed integer)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/security/doas.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/doas.nix)

## `security.doas.package` {#opt-security.doas.package}

The doas package to use.

*Type:* package

*Default:* `pkgs.doas`

*Declared by:* [`nixos/modules/security/doas.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/doas.nix)

## `security.doas.wheelNeedsPassword` {#opt-security.doas.wheelNeedsPassword}

Whether users of the `wheel` group must provide a password to
run commands as super user via `doas`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/doas.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/doas.nix)

## `security.duosec.acceptEnvFactor` {#opt-security.duosec.acceptEnvFactor}

Look for factor selection or passcode in the
`$DUO_PASSCODE` environment variable before
prompting the user for input.

When $DUO\_PASSCODE is non-empty, it will override
autopush. The SSH client will need SendEnv DUO\_PASSCODE in
its configuration, and the SSH server will similarly need
AcceptEnv DUO\_PASSCODE.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/duosec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/duosec.nix)

## `security.duosec.allowTcpForwarding` {#opt-security.duosec.allowTcpForwarding}

By default, when SSH forwarding, enabling Duo Security will
disable TCP forwarding. By enabling this, you potentially
undermine some of the SSH based login security. Note this is
not needed if you use PAM.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/duosec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/duosec.nix)

## `security.duosec.autopush` {#opt-security.duosec.autopush}

If `true`, Duo Unix will automatically send
a push login request to the user’s phone, falling back on a
phone call if push is unavailable. If
`false`, the user will be prompted to
choose an authentication method. When configured with
`autopush = yes`, we recommend setting
`prompts = 1`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/duosec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/duosec.nix)

## `security.duosec.failmode` {#opt-security.duosec.failmode}

On service or configuration errors that prevent Duo
authentication, fail "safe" (allow access) or "secure" (deny
access). The default is "safe".

*Type:* one of "safe", "secure"

*Default:* `"safe"`

*Declared by:* [`nixos/modules/security/duosec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/duosec.nix)

## `security.duosec.fallbackLocalIP` {#opt-security.duosec.fallbackLocalIP}

Duo Unix reports the IP address of the authorizing user, for
the purposes of authorization and whitelisting. If Duo Unix
cannot detect the IP address of the client, setting
`fallbackLocalIP = yes` will cause Duo Unix
to send the IP address of the server it is running on.

If you are using IP whitelisting, enabling this option could
cause unauthorized logins if the local IP is listed in the
whitelist.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/duosec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/duosec.nix)

## `security.duosec.groups` {#opt-security.duosec.groups}

If specified, Duo authentication is required only for users
whose primary group or supplementary group list matches one
of the space-separated pattern lists. Refer to
[https://duo.com/docs/duounix](https://duo.com/docs/duounix) for details.

*Type:* string

*Default:* `""`

*Example:* `"users,!wheel,!*admin guests"`

*Declared by:* [`nixos/modules/security/duosec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/duosec.nix)

## `security.duosec.host` {#opt-security.duosec.host}

Duo API hostname.

*Type:* string

*Declared by:* [`nixos/modules/security/duosec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/duosec.nix)

## `security.duosec.integrationKey` {#opt-security.duosec.integrationKey}

Integration key.

*Type:* string

*Declared by:* [`nixos/modules/security/duosec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/duosec.nix)

## `security.duosec.motd` {#opt-security.duosec.motd}

Print the contents of `/etc/motd` to screen
after a successful login.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/duosec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/duosec.nix)

## `security.duosec.pam.enable` {#opt-security.duosec.pam.enable}

If enabled, protect logins with Duo Security using PAM support.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/duosec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/duosec.nix)

## `security.duosec.prompts` {#opt-security.duosec.prompts}

If a user fails to authenticate with a second factor, Duo
Unix will prompt the user to authenticate again. This option
sets the maximum number of prompts that Duo Unix will
display before denying access. Must be 1, 2, or 3. Default
is 3.

For example, when `prompts = 1`, the user
will have to successfully authenticate on the first prompt,
whereas if `prompts = 2`, if the user
enters incorrect information at the initial prompt, he/she
will be prompted to authenticate again.

When configured with `autopush = true`, we
recommend setting `prompts = 1`.

*Type:* one of 1, 2, 3

*Default:* `3`

*Declared by:* [`nixos/modules/security/duosec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/duosec.nix)

## `security.duosec.pushinfo` {#opt-security.duosec.pushinfo}

Include information such as the command to be executed in
the Duo Push message.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/duosec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/duosec.nix)

## `security.duosec.secretKeyFile` {#opt-security.duosec.secretKeyFile}

A file containing your secret key. The security of your Duo application is tied to the security of your secret key.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/duo-skey"`

*Declared by:* [`nixos/modules/security/duosec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/duosec.nix)

## `security.duosec.ssh.enable` {#opt-security.duosec.ssh.enable}

If enabled, protect SSH logins with Duo Security.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/duosec.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/duosec.nix)

## `security.enableWrappers` {#opt-security.enableWrappers}

Whether to enable SUID/SGID wrappers.

::: warning
ONLY DISABLE THIS OPTION IF YOU KNOW WHAT YOU'RE DOING.
:::

A normal interactive NixOS system requires SUID/SGID wrappers (e.g. for
PAM and sudo). Disabling them, thus will lock you out from your system.

Disabling the SUID/SGID binaries is useful for non-interactive systems
(like a firewall appliance) to minimize the attack surface. In the
future, this might become available for interactive systems as well
(e.g. with systemd's [run0](https://www.freedesktop.org/software/systemd/man/latest/run0)).

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/security/wrappers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/wrappers/default.nix)

## `security.forcePageTableIsolation` {#opt-security.forcePageTableIsolation}

Whether to force-enable the Page Table Isolation (PTI) Linux kernel
feature even on CPU models that claim to be safe from Meltdown.

This hardening feature is most beneficial to systems that run untrusted
workloads that rely on address space isolation for security.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/misc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/misc.nix)

## `security.googleOsLogin.enable` {#opt-security.googleOsLogin.enable}

Whether to enable Google OS Login.

The OS Login package enables the following components:
AuthorizedKeysCommand to query valid SSH keys from the user's OS Login
profile during ssh authentication phase.
NSS Module to provide user and group information
PAM Module for the sshd service, providing authorization and
authentication support, allowing the system to use data stored in
Google Cloud IAM permissions to control both, the ability to log into
an instance, and to perform operations as root (sudo).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/google_oslogin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/google_oslogin.nix)

## `security.ipa.backupServers` {#opt-security.ipa.backupServers}

A list of backup servers for SSSD to resolve against in case
`security.ipa.server` is unavailable.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "ipa-backup.example.com"
]
```

*Declared by:* [`nixos/modules/security/ipa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/ipa.nix)

## `security.ipa.basedn` {#opt-security.ipa.basedn}

Base DN to use when performing LDAP operations.

*Type:* string

*Example:* `"dc=example,dc=com"`

*Declared by:* [`nixos/modules/security/ipa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/ipa.nix)

## `security.ipa.cacheCredentials` {#opt-security.ipa.cacheCredentials}

Whether to cache credentials.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/ipa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/ipa.nix)

## `security.ipa.certificate` {#opt-security.ipa.certificate}

IPA server CA certificate.

Use `nix-prefetch-url http://$server/ipa/config/ca.crt` to
obtain the file and the hash.

*Type:* package

*Example:*

``` nix
pkgs.fetchurl {
  url = "http://ipa.example.com/ipa/config/ca.crt";
  hash = lib.fakeHash;
};
```

*Declared by:* [`nixos/modules/security/ipa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/ipa.nix)

## `security.ipa.chromiumSupport` {#opt-security.ipa.chromiumSupport}

Whether to whitelist the FreeIPA domain in Chromium.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/ipa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/ipa.nix)

## `security.ipa.domain` {#opt-security.ipa.domain}

Domain of the IPA server.

*Type:* string

*Example:* `"example.com"`

*Declared by:* [`nixos/modules/security/ipa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/ipa.nix)

## `security.ipa.dyndns.enable` {#opt-security.ipa.dyndns.enable}

Whether to enable FreeIPA automatic hostname updates.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/ipa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/ipa.nix)

## `security.ipa.dyndns.interface` {#opt-security.ipa.dyndns.interface}

Network interface to perform hostname updates through.

*Type:* string

*Default:* `"*"`

*Example:* `"eth0"`

*Declared by:* [`nixos/modules/security/ipa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/ipa.nix)

## `security.ipa.enable` {#opt-security.ipa.enable}

Whether to enable FreeIPA domain integration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/ipa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/ipa.nix)

## `security.ipa.ifpAllowedUids` {#opt-security.ipa.ifpAllowedUids}

A list of users allowed to access the ifp dbus interface.

*Type:* list of string

*Default:*

``` nix
[
  "root"
]
```

*Declared by:* [`nixos/modules/security/ipa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/ipa.nix)

## `security.ipa.ipaHostname` {#opt-security.ipa.ipaHostname}

Fully-qualified hostname used to identify this host in the IPA domain.

*Type:* string

*Default:*

``` nix
if config.networking.domain != null then config.networking.fqdn
else "${networking.hostName}.${security.ipa.domain}"
```

*Example:* `"myworkstation.example.com"`

*Declared by:* [`nixos/modules/security/ipa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/ipa.nix)

## `security.ipa.offlinePasswords` {#opt-security.ipa.offlinePasswords}

Whether to store offline passwords when the server is down.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/ipa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/ipa.nix)

## `security.ipa.realm` {#opt-security.ipa.realm}

Kerberos realm.

*Type:* string

*Example:* `"EXAMPLE.COM"`

*Declared by:* [`nixos/modules/security/ipa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/ipa.nix)

## `security.ipa.server` {#opt-security.ipa.server}

IPA Server hostname.

*Type:* string

*Example:* `"ipa.example.com"`

*Declared by:* [`nixos/modules/security/ipa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/ipa.nix)

## `security.ipa.shells` {#opt-security.ipa.shells}

List of shells which binaries should be installed to /bin/<name>.

FreeIPA typicly configures somesthing like /bin/bash into the users shell attribute.

*Type:* list of package

*Default:*

``` nix
with pkgs; [ bash zsh ];
```

*Declared by:* [`nixos/modules/security/ipa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/ipa.nix)

## `security.ipa.useAsTimeserver` {#opt-security.ipa.useAsTimeserver}

Whether to add the IPA server to the timeserver.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/ipa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/ipa.nix)

## `security.isolate.boxRoot` {#opt-security.isolate.boxRoot}

All sandboxes are created under this directory.
To avoid symlink attacks, this directory and all its ancestors
must be writeable only by root.

*Type:* absolute path

*Default:* `"/var/lib/isolate/boxes"`

*Declared by:* [`nixos/modules/security/isolate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/isolate.nix)

## `security.isolate.cgRoot` {#opt-security.isolate.cgRoot}

Control group which subgroups are placed under.
Either an explicit path to a subdirectory in cgroupfs, or "auto:file" to read
the path from "file", where it is put by `isolate-cg-helper`.

*Type:* string

*Default:* `"auto:/run/isolate/cgroup"`

*Declared by:* [`nixos/modules/security/isolate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/isolate.nix)

## `security.isolate.enable` {#opt-security.isolate.enable}

Whether to enable Sandbox for securely executing untrusted programs
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/isolate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/isolate.nix)

## `security.isolate.extraConfig` {#opt-security.isolate.extraConfig}

Extra configuration to append to the configuration file.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/security/isolate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/isolate.nix)

## `security.isolate.firstGid` {#opt-security.isolate.firstGid}

Start of block of GIDs reserved for sandboxes.

*Type:* integer between 1000 and 65533 (both inclusive)

*Default:* `60000`

*Declared by:* [`nixos/modules/security/isolate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/isolate.nix)

## `security.isolate.firstUid` {#opt-security.isolate.firstUid}

Start of block of UIDs reserved for sandboxes.

*Type:* integer between 1000 and 65533 (both inclusive)

*Default:* `60000`

*Declared by:* [`nixos/modules/security/isolate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/isolate.nix)

## `security.isolate.lockRoot` {#opt-security.isolate.lockRoot}

Directory where lock files are created.

*Type:* absolute path

*Default:* `"/run/isolate/locks"`

*Declared by:* [`nixos/modules/security/isolate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/isolate.nix)

## `security.isolate.numBoxes` {#opt-security.isolate.numBoxes}

Number of UIDs and GIDs to reserve, starting from
`firstUid` and `firstGid`.

*Type:* integer between 1000 and 65533 (both inclusive)

*Default:* `1000`

*Declared by:* [`nixos/modules/security/isolate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/isolate.nix)

## `security.isolate.package` {#opt-security.isolate.package}

The isolate-unwrapped package to use.

*Type:* package

*Default:* `pkgs.isolate-unwrapped`

*Declared by:* [`nixos/modules/security/isolate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/isolate.nix)

## `security.isolate.restrictedInit` {#opt-security.isolate.restrictedInit}

If true, only root can create sandboxes.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/isolate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/isolate.nix)

## `security.krb5.enable` {#opt-security.krb5.enable}

Enable and configure Kerberos utilities

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/krb5`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/krb5)

## `security.krb5.package` {#opt-security.krb5.package}

The krb5 package to use.

*Type:* package

*Default:* `pkgs.krb5`

*Example:* `heimdal`

*Declared by:* [`nixos/modules/security/krb5`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/krb5)

## `security.krb5.settings` {#opt-security.krb5.settings}

Structured contents of the `krb5.conf` file. See
`krb5.conf(5)` for details about configuration.

*Type:* open submodule of attribute set of attribute set of ((list of attribute set of ((list of (signed integer or string or boolean)) or signed integer or string or boolean)) or attribute set of ((list of (signed integer or string or boolean)) or signed integer or string or boolean) or (list of (signed integer or string or boolean)) or signed integer or string or boolean)

*Default:* `{ }`

*Example:*

``` nix
{
  domain_realm = {
    "mit.edu" = "ATHENA.MIT.EDU";
  };
  include = [
    "/run/secrets/secret-krb5.conf"
  ];
  includedir = [
    "/run/secrets/secret-krb5.conf.d"
  ];
  libdefaults = {
    default_realm = "ATHENA.MIT.EDU";
  };
  logging = {
    admin_server = "SYSLOG:NOTICE";
    default = "SYSLOG:NOTICE";
    kdc = "SYSLOG:NOTICE";
  };
  realms = {
    "ATHENA.MIT.EDU" = {
      admin_server = "athena.mit.edu";
      kdc = [
        "athena01.mit.edu"
        "athena02.mit.edu"
      ];
    };
  };
}
```

*Declared by:* [`nixos/modules/security/krb5`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/krb5)

## `security.krb5.settings.include` {#opt-security.krb5.settings.include}

Files to include in the Kerberos configuration.

*Type:* (list of absolute path) or absolute path convertible to it

*Default:* `[ ]`

*Declared by:* [`nixos/modules/security/krb5`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/krb5)

## `security.krb5.settings.includedir` {#opt-security.krb5.settings.includedir}

Directories containing files to include in the Kerberos configuration.

*Type:* (list of absolute path) or absolute path convertible to it

*Default:* `[ ]`

*Declared by:* [`nixos/modules/security/krb5`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/krb5)

## `security.krb5.settings.module` {#opt-security.krb5.settings.module}

Modules to obtain Kerberos configuration from.

*Type:* (list of absolute path) or absolute path convertible to it

*Default:* `[ ]`

*Declared by:* [`nixos/modules/security/krb5`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/krb5)

## `security.lockKernelModules` {#opt-security.lockKernelModules}

Disable kernel module loading once the system is fully initialised.
Module loading is disabled until the next reboot. Problems caused
by delayed module loading can be fixed by adding the module(s) in
question to [`boot.kernelModules`](../../options/boot/index.md#opt-boot.kernelModules).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/lock-kernel-modules.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/lock-kernel-modules.nix)

## `security.loginDefs.chfnRestrict` {#opt-security.loginDefs.chfnRestrict}

Use chfn SUID to allow non-root users to change their account GECOS information.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/programs/shadow.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/shadow.nix)

## `security.loginDefs.package` {#opt-security.loginDefs.package}

The shadow package to use.

*Type:* package

*Default:* `pkgs.shadow`

*Declared by:* [`nixos/modules/programs/shadow.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/shadow.nix)

## `security.loginDefs.settings` {#opt-security.loginDefs.settings}

Config options for the /etc/login.defs file, that defines
the site-specific configuration for the shadow password suite.
See `login.defs(5)` man page for available options.

*Type:* open submodule of attribute set of (atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/programs/shadow.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/shadow.nix)

## `security.loginDefs.settings.DEFAULT_HOME` {#opt-security.loginDefs.settings.DEFAULT_HOME}

Indicate if login is allowed if we can't cd to the home directory.

*Type:* one of "yes", "no"

*Default:* `"yes"`

*Declared by:* [`nixos/modules/programs/shadow.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/shadow.nix)

## `security.loginDefs.settings.ENCRYPT_METHOD` {#opt-security.loginDefs.settings.ENCRYPT_METHOD}

This defines the system default encryption algorithm for encrypting passwords.

*Type:* one of "YESCRYPT", "SHA512", "SHA256", "MD5", "DES"

*Default:* `"YESCRYPT"`

*Declared by:* [`nixos/modules/programs/shadow.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/shadow.nix)

## `security.loginDefs.settings.GID_MAX` {#opt-security.loginDefs.settings.GID_MAX}

Range of group IDs used for the creation of regular groups by useradd, groupadd, or newusers.

*Type:* 32 bit unsigned integer; between 0 and 4294967295 (both inclusive)

*Default:* `29999`

*Declared by:* [`nixos/modules/programs/shadow.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/shadow.nix)

## `security.loginDefs.settings.GID_MIN` {#opt-security.loginDefs.settings.GID_MIN}

Range of group IDs used for the creation of regular groups by useradd, groupadd, or newusers.

*Type:* 32 bit unsigned integer; between 0 and 4294967295 (both inclusive)

*Default:* `1000`

*Declared by:* [`nixos/modules/programs/shadow.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/shadow.nix)

## `security.loginDefs.settings.SYS_GID_MAX` {#opt-security.loginDefs.settings.SYS_GID_MAX}

Range of group IDs used for the creation of system groups by useradd, groupadd, or newusers

*Type:* 32 bit unsigned integer; between 0 and 4294967295 (both inclusive)

*Default:* `999`

*Declared by:* [`nixos/modules/programs/shadow.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/shadow.nix)

## `security.loginDefs.settings.SYS_GID_MIN` {#opt-security.loginDefs.settings.SYS_GID_MIN}

Range of group IDs used for the creation of system groups by useradd, groupadd, or newusers

*Type:* 32 bit unsigned integer; between 0 and 4294967295 (both inclusive)

*Default:* `400`

*Declared by:* [`nixos/modules/programs/shadow.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/shadow.nix)

## `security.loginDefs.settings.SYS_UID_MAX` {#opt-security.loginDefs.settings.SYS_UID_MAX}

Range of user IDs used for the creation of system users by useradd or newusers.

*Type:* 32 bit unsigned integer; between 0 and 4294967295 (both inclusive)

*Default:* `999`

*Declared by:* [`nixos/modules/programs/shadow.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/shadow.nix)

## `security.loginDefs.settings.SYS_UID_MIN` {#opt-security.loginDefs.settings.SYS_UID_MIN}

Range of user IDs used for the creation of system users by useradd or newusers.

*Type:* 32 bit unsigned integer; between 0 and 4294967295 (both inclusive)

*Default:* `400`

*Declared by:* [`nixos/modules/programs/shadow.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/shadow.nix)

## `security.loginDefs.settings.TTYGROUP` {#opt-security.loginDefs.settings.TTYGROUP}

The terminal permissions: the login tty will be owned by the TTYGROUP group,
and the permissions will be set to TTYPERM

*Type:* string

*Default:* `"tty"`

*Declared by:* [`nixos/modules/programs/shadow.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/shadow.nix)

## `security.loginDefs.settings.TTYPERM` {#opt-security.loginDefs.settings.TTYPERM}

The terminal permissions: the login tty will be owned by the TTYGROUP group,
and the permissions will be set to TTYPERM

*Type:* string

*Default:* `"0620"`

*Declared by:* [`nixos/modules/programs/shadow.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/shadow.nix)

## `security.loginDefs.settings.UID_MAX` {#opt-security.loginDefs.settings.UID_MAX}

Range of user IDs used for the creation of regular users by useradd or newusers.

*Type:* 32 bit unsigned integer; between 0 and 4294967295 (both inclusive)

*Default:* `29999`

*Declared by:* [`nixos/modules/programs/shadow.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/shadow.nix)

## `security.loginDefs.settings.UID_MIN` {#opt-security.loginDefs.settings.UID_MIN}

Range of user IDs used for the creation of regular users by useradd or newusers.

*Type:* 32 bit unsigned integer; between 0 and 4294967295 (both inclusive)

*Default:* `1000`

*Declared by:* [`nixos/modules/programs/shadow.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/shadow.nix)

## `security.loginDefs.settings.UMASK` {#opt-security.loginDefs.settings.UMASK}

The file mode creation mask is initialized to this value.

*Type:* string

*Default:* `"077"`

*Declared by:* [`nixos/modules/programs/shadow.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/shadow.nix)

## `security.lsm` {#opt-security.lsm}

A list of the LSMs to initialize in order.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/security/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/default.nix)

## `security.pam.dp9ik.authserver` {#opt-security.pam.dp9ik.authserver}

This controls the hostname for the 9front authentication server
that users will be authenticated against.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.dp9ik.control` {#opt-security.pam.dp9ik.control}

This option sets the pam "control" used for this module.

*Type:* string

*Default:* `"sufficient"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.dp9ik.enable` {#opt-security.pam.dp9ik.enable}

Whether to enable the dp9ik pam module provided by tlsclient.

If set, users can be authenticated against the 9front
authentication server given in [`security.pam.dp9ik.authserver`](#opt-security.pam.dp9ik.authserver)
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.enable` {#opt-security.pam.enable}

Whether to enable PAM, or entirely disable it.

Unless you're building a container image, you probably don't want to disable PAM.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.enableFscrypt` {#opt-security.pam.enableFscrypt}

Whether to enable fscrypt, to automatically unlock directories with the user's login password.

This also enables a service at security.pam.services.fscrypt which is used by
fscrypt to verify the user's password when setting up a new protector. If you
use something other than pam\_unix to verify user passwords, please remember to
adjust this PAM service
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.enableLegacySettings` {#opt-security.pam.enableLegacySettings}

Alternative implementations of pam\_unix may not support all legacy arguments.
This option will disable all known legacy settings.

::: note
Setting this option to false will omit arguments, such as `yescrypt`.
Doing so is only safe if the defaults used by pam\_unix are sensible.
:::

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.enableOTPW` {#opt-security.pam.enableOTPW}

Whether to enable the OTPW (one-time password) PAM module.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.enableUMask` {#opt-security.pam.enableUMask}

Whether to enable the umask PAM module.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.howdy.control` {#opt-security.pam.howdy.control}

This option sets the PAM "control" used for this module.

*Type:* string

*Default:* `config.services.howdy.control`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.howdy.enable` {#opt-security.pam.howdy.enable}

Whether to enable the Howdy PAM module.

If set, users can be authenticated using Howdy, the Windows
Hello™-style facial authentication service.

*Type:* boolean

*Default:* `config.services.howdy.enable`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.krb5.enable` {#opt-security.pam.krb5.enable}

Enables Kerberos PAM modules (`pam-krb5`,
`pam-ccreds`).

If set, users can authenticate with their Kerberos password.
This requires a valid Kerberos configuration
(`security.krb5.enable` should be set to `true`).

Note that the Kerberos PAM modules are not necessary when using SSS
to handle Kerberos authentication.

*Type:* boolean

*Default:* `config.security.krb5.enable`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.loginLimits` {#opt-security.pam.loginLimits}

Define resource limits that should apply to users or groups.
Each item in the list should be an attribute set with a
`domain`, `type`,
`item`, and `value`
attribute.  The syntax and semantics of these attributes
must be that described in `limits.conf(5)`.

Note that these limits do not apply to systemd services,
whose limits can be changed via [`systemd.settings.Manager`](../../options/systemd/index.md#opt-systemd.settings.Manager)
instead.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    domain = "ftp";
    item = "nproc";
    type = "hard";
    value = "0";
  }
  {
    domain = "@student";
    item = "maxlogins";
    type = "-";
    value = "4";
  }
]
```

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.loginLimits.*.domain` {#opt-security.pam.loginLimits._.domain}

Username, groupname, or wildcard this limit applies to

*Type:* string

*Example:* `"@wheel"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.loginLimits.*.item` {#opt-security.pam.loginLimits._.item}

Item this limit applies to

*Type:* one of "core", "data", "fsize", "memlock", "nofile", "rss", "stack", "cpu", "nproc", "as", "maxlogins", "maxsyslogins", "priority", "locks", "sigpending", "msgqueue", "nice", "rtprio"

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.loginLimits.*.type` {#opt-security.pam.loginLimits._.type}

Type of this limit

*Type:* one of "-", "hard", "soft"

*Default:* `"-"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.loginLimits.*.value` {#opt-security.pam.loginLimits._.value}

Value of this limit

*Type:* string or signed integer

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.makeHomeDir.skelDirectory` {#opt-security.pam.makeHomeDir.skelDirectory}

Path to skeleton directory whose contents are copied to home
directories newly created by `pam_mkhomedir`.

*Type:* string

*Default:* `"/var/empty"`

*Example:* `"/etc/skel"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.makeHomeDir.umask` {#opt-security.pam.makeHomeDir.umask}

The user file mode creation mask to use on home directories
newly created by `pam_mkhomedir`.

*Type:* string

*Default:* `"0077"`

*Example:* `"0022"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.mount.additionalSearchPaths` {#opt-security.pam.mount.additionalSearchPaths}

Additional programs to include in the search path of pam\_mount.
Useful for example if you want to use some FUSE filesystems like bindfs.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.bindfs ]`

*Declared by:* [`nixos/modules/security/pam_mount.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam_mount.nix)

## `security.pam.mount.createMountPoints` {#opt-security.pam.mount.createMountPoints}

Create mountpoints for volumes if they do not exist.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/pam_mount.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam_mount.nix)

## `security.pam.mount.cryptMountOptions` {#opt-security.pam.mount.cryptMountOptions}

Global mount options that apply to every crypt volume.
You can define volume-specific options in the volume definitions.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[ "allow_discard" ]
```

*Declared by:* [`nixos/modules/security/pam_mount.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam_mount.nix)

## `security.pam.mount.debugLevel` {#opt-security.pam.mount.debugLevel}

Sets the Debug-Level. 0 disables debugging, 1 enables pam\_mount tracing,
and 2 additionally enables tracing in mount.crypt. The default is 0.
For more information, visit [https://pam-mount.sourceforge.net/pam\_mount.conf.5.html](https://pam-mount.sourceforge.net/pam_mount.conf.5.html).

*Type:* signed integer

*Default:* `0`

*Example:* `1`

*Declared by:* [`nixos/modules/security/pam_mount.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam_mount.nix)

## `security.pam.mount.enable` {#opt-security.pam.mount.enable}

Enable PAM mount system to mount filesystems on user login.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam_mount.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam_mount.nix)

## `security.pam.mount.extraVolumes` {#opt-security.pam.mount.extraVolumes}

List of volume definitions for pam\_mount.
For more information, visit [https://pam-mount.sourceforge.net/pam\_mount.conf.5.html](https://pam-mount.sourceforge.net/pam_mount.conf.5.html).

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/security/pam_mount.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam_mount.nix)

## `security.pam.mount.fuseMountOptions` {#opt-security.pam.mount.fuseMountOptions}

Global mount options that apply to every FUSE volume.
You can define volume-specific options in the volume definitions.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[ "nodev" "nosuid" "force-user=%(USER)" "gid=%(USERGID)" "perms=0700" "chmod-deny" "chown-deny" "chgrp-deny" ]
```

*Declared by:* [`nixos/modules/security/pam_mount.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam_mount.nix)

## `security.pam.mount.logoutHup` {#opt-security.pam.mount.logoutHup}

Kill remaining processes after logout by sending a SIGHUP.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam_mount.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam_mount.nix)

## `security.pam.mount.logoutKill` {#opt-security.pam.mount.logoutKill}

Kill remaining processes after logout by sending a SIGKILL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam_mount.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam_mount.nix)

## `security.pam.mount.logoutTerm` {#opt-security.pam.mount.logoutTerm}

Kill remaining processes after logout by sending a SIGTERM.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam_mount.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam_mount.nix)

## `security.pam.mount.logoutWait` {#opt-security.pam.mount.logoutWait}

Amount of microseconds to wait until killing remaining processes after
final logout.
For more information, visit [https://pam-mount.sourceforge.net/pam\_mount.conf.5.html](https://pam-mount.sourceforge.net/pam_mount.conf.5.html).

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/security/pam_mount.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam_mount.nix)

## `security.pam.mount.removeCreatedMountPoints` {#opt-security.pam.mount.removeCreatedMountPoints}

Remove mountpoints created by pam\_mount after logout. This
only affects mountpoints that have been created by pam\_mount
in the same session.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/pam_mount.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam_mount.nix)

## `security.pam.oath.digits` {#opt-security.pam.oath.digits}

Specify the lib.length of the one-time password in number of
digits.

*Type:* one of 6, 7, 8

*Default:* `6`

*Declared by:* [`nixos/modules/security/oath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/oath.nix)

## `security.pam.oath.enable` {#opt-security.pam.oath.enable}

Enable the OATH (one-time password) PAM module.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/oath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/oath.nix)

## `security.pam.oath.usersFile` {#opt-security.pam.oath.usersFile}

Set the path to file where the user's credentials are
stored. This file must not be world readable!

*Type:* absolute path

*Default:* `"/etc/users.oath"`

*Declared by:* [`nixos/modules/security/oath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/oath.nix)

## `security.pam.oath.window` {#opt-security.pam.oath.window}

Specify the number of one-time passwords to check in order
to accommodate for situations where the system and the
client are slightly out of sync (iteration for HOTP or time
steps for TOTP).

*Type:* signed integer

*Default:* `5`

*Declared by:* [`nixos/modules/security/oath.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/oath.nix)

## `security.pam.p11.control` {#opt-security.pam.p11.control}

This option sets pam "control".
If you want to have multi factor authentication, use "required".
If you want to use the PKCS#11 device instead of the regular password,
use "sufficient".

Read
`pam.conf(5)`
for better understanding of this option.

*Type:* one of "required", "requisite", "sufficient", "optional"

*Default:* `"sufficient"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.p11.enable` {#opt-security.pam.p11.enable}

Enables P11 PAM (`pam_p11`) module.

If set, users can log in with SSH keys and PKCS#11 tokens.

More information can be found [here](https://github.com/OpenSC/pam_p11).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.package` {#opt-security.pam.package}

The pam package to use.

*Type:* package

*Default:* `pkgs.pam`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.rssh.enable` {#opt-security.pam.rssh.enable}

Whether to enable authenticating using a signature performed by the ssh-agent.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.rssh.settings` {#opt-security.pam.rssh.settings}

Options to pass to the pam\_rssh module. Refer to
[https://github.com/z4yx/pam\_rssh/blob/main/README.md#optional-arguments](https://github.com/z4yx/pam_rssh/blob/main/README.md#optional-arguments)
for supported values.

Boolean values render just the key if true, and nothing if false.
Null values are ignored.
All other values are rendered as key-value pairs.

*Type:* open submodule of attribute set of (null or boolean or string or signed integer or path in the Nix store)

*Default:* `{ }`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.rssh.settings.auth_key_file` {#opt-security.pam.rssh.settings.auth_key_file}

Path to file with trusted public keys in OpenSSH's `authorized_keys` format. The following
variables are expanded to the respective PAM items:

- `service`: `PAM_SERVICE`, the service name,
- `user`: `PAM_USER`, the username of the entity under whose identity service will be given,
- `tty`: `PAM_TTY`, the terminal name,
- `rhost`: `PAM_RHOST`, the requesting hostname, and
- `ruser`: `PAM_RUSER`, the requesting entity.

These PAM items are explained in `pam_get_item(3)`.

Variables may be specified as `$var`, `$`or`${var:defaultValue}`.

::: {.note}
Specifying user-writeable files here results in an insecure configuration: a malicious process
can then edit such an `authorized_keys` file and bypass the ssh-agent-based authentication.

This option is ignored if `security.pam.rssh.settings.authorized_keys_command` is set.

If both this option and `security.pam.rssh.settings.authorized_keys_command` are unset,
the keys will be read from `${HOME}/.ssh/authorized_keys`, which should be considered
insecure.

*Type:* null or non-empty string

*Default:* `"/etc/ssh/authorized_keys.d/$ruser"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services` {#opt-security.pam.services}

This option defines the PAM services.  A service typically
corresponds to a program that uses PAM,
e.g. `login` or `passwd`.
Each attribute of this set defines a PAM service, with the attribute name
defining the name of the service.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.allowNullPassword` {#opt-security.pam.services._name_.allowNullPassword}

Whether to allow logging into accounts that have no password
set (i.e., have an empty password field in
`/etc/passwd` or
`/etc/group`).  This does not enable
logging into disabled accounts (i.e., that have the password
field set to `!`).  Note that regardless of
what the pam\_unix documentation says, accounts with hashed
empty passwords are always allowed to log in.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.duoSecurity.enable` {#opt-security.pam.services._name_.duoSecurity.enable}

If set, use the Duo Security pam module
`pam_duo` for authentication.  Requires
configuration of `security.duosec` options.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.enable` {#opt-security.pam.services._name_.enable}

Whether to enable this PAM service.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.enableAppArmor` {#opt-security.pam.services._name_.enableAppArmor}

Enable support for attaching AppArmor profiles at the
user/group level, e.g., as part of a role based access
control scheme.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.enableGnomeKeyring` {#opt-security.pam.services._name_.enableGnomeKeyring}

If enabled, pam\_gnome\_keyring will attempt to automatically unlock the
user's default Gnome keyring upon login. If the user login password does
not match their keyring password, Gnome Keyring will prompt separately
after login.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.enableUMask` {#opt-security.pam.services._name_.enableUMask}

If enabled, the pam\_umask module will be loaded.

*Type:* boolean

*Default:* `config.security.pam.enableUMask`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.failDelay.delay` {#opt-security.pam.services._name_.failDelay.delay}

The delay time (in microseconds) on failure.

*Type:* signed integer

*Default:* `3000000`

*Example:* `1000000`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.failDelay.enable` {#opt-security.pam.services._name_.failDelay.enable}

If enabled, this will replace the `FAIL_DELAY` setting from `login.defs`.
Change the delay on failure per-application.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.forwardXAuth` {#opt-security.pam.services._name_.forwardXAuth}

Whether X authentication keys should be passed from the
calling user to the target user (e.g. for
`su`)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.fprintAuth` {#opt-security.pam.services._name_.fprintAuth}

If set, fingerprint reader will be used (if exists and
your fingerprints are enrolled).

::: note
This setting should only be enabled for clients that can ensure
user attention, such as lockscreens.
See https://github.com/NixOS/nixpkgs/issues/442117
:::

*Type:* boolean

*Default:* `config.services.fprintd.enablePam`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.gnupg.enable` {#opt-security.pam.services._name_.gnupg.enable}

If enabled, pam\_gnupg will attempt to automatically unlock the
user's GPG keys with the login password via
`gpg-agent`. The keygrips of all keys to be
unlocked should be written to `~/.pam-gnupg`,
and can be queried with `gpg -K --with-keygrip`.
Presetting passphrases must be enabled by adding
`allow-preset-passphrase` in
`~/.gnupg/gpg-agent.conf`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.gnupg.noAutostart` {#opt-security.pam.services._name_.gnupg.noAutostart}

Don't start `gpg-agent` if it is not running.
Useful in conjunction with starting `gpg-agent` as
a systemd user service.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.gnupg.storeOnly` {#opt-security.pam.services._name_.gnupg.storeOnly}

Don't send the password immediately after login, but store for PAM
`session`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.googleAuthenticator.allowNullOTP` {#opt-security.pam.services._name_.googleAuthenticator.allowNullOTP}

Whether to allow login for accounts that have no OTP set
(i.e., accounts with no OTP configured or no existing
`~/.google_authenticator`).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.googleAuthenticator.enable` {#opt-security.pam.services._name_.googleAuthenticator.enable}

If set, users with enabled Google Authenticator (created
`~/.google_authenticator`) will be required
to provide Google Authenticator token to log in.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.googleAuthenticator.forwardPass` {#opt-security.pam.services._name_.googleAuthenticator.forwardPass}

The authentication provides a single field requiring
the user's password followed by the one-time password (OTP).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.googleOsLoginAccountVerification` {#opt-security.pam.services._name_.googleOsLoginAccountVerification}

If set, will use the Google OS Login PAM modules
(`pam_oslogin_login`,
`pam_oslogin_admin`) to verify possible OS Login
users and set sudoers configuration accordingly.
This only makes sense to enable for the `sshd` PAM
service.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.googleOsLoginAuthentication` {#opt-security.pam.services._name_.googleOsLoginAuthentication}

If set, will use the `pam_oslogin_login`'s user
authentication methods to authenticate users using 2FA.
This only makes sense to enable for the `sshd` PAM
service.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.howdy.control` {#opt-security.pam.services._name_.howdy.control}

This option sets the PAM "control" used for this module.

*Type:* string

*Default:* `config.security.pam.howdy.control`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.howdy.enable` {#opt-security.pam.services._name_.howdy.enable}

Whether to enable the Howdy PAM module.

If set, users can be authenticated using Howdy, the Windows
Hello™-style facial authentication service.

*Type:* boolean

*Default:* `config.security.pam.howdy.enable`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.kwallet.enable` {#opt-security.pam.services._name_.kwallet.enable}

If enabled, pam\_wallet will attempt to automatically unlock the
user's default KDE wallet upon login. If the user has no wallet named
"kdewallet", or the login password does not match their wallet
password, KDE will prompt separately after login.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.kwallet.forceRun` {#opt-security.pam.services._name_.kwallet.forceRun}

The `force_run` option is used to tell the PAM module for KWallet
to forcefully run even if no graphical session (such as a GUI
display manager) is detected. This is useful for when you are
starting an X Session or a Wayland Session from a TTY. If you
intend to log-in from a TTY, it is recommended that you enable
this option **and** ensure that `plasma-kwallet-pam.service` is
started by `graphical-session.target`.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.kwallet.package` {#opt-security.pam.services._name_.kwallet.package}

The kwallet-pam package to use.

*Type:* package

*Default:* `pkgs.kdePackages.kwallet-pam`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.lastlog.enable` {#opt-security.pam.services._name_.lastlog.enable}

Whether to update `/var/log/wtmp`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.lastlog.silent` {#opt-security.pam.services._name_.lastlog.silent}

Whether to suppress the message showing the last login date.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.limits` {#opt-security.pam.services._name_.limits}

Attribute set describing resource limits.  Defaults to the
value of [`security.pam.loginLimits`](#opt-security.pam.loginLimits).
The meaning of the values is explained in `limits.conf(5)`.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.limits.*.domain` {#opt-security.pam.services._name_.limits._.domain}

Username, groupname, or wildcard this limit applies to

*Type:* string

*Example:* `"@wheel"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.limits.*.item` {#opt-security.pam.services._name_.limits._.item}

Item this limit applies to

*Type:* one of "core", "data", "fsize", "memlock", "nofile", "rss", "stack", "cpu", "nproc", "as", "maxlogins", "maxsyslogins", "priority", "locks", "sigpending", "msgqueue", "nice", "rtprio"

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.limits.*.type` {#opt-security.pam.services._name_.limits._.type}

Type of this limit

*Type:* one of "-", "hard", "soft"

*Default:* `"-"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.limits.*.value` {#opt-security.pam.services._name_.limits._.value}

Value of this limit

*Type:* string or signed integer

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.logFailures` {#opt-security.pam.services._name_.logFailures}

Whether to log authentication failures in `/var/log/faillog`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.makeHomeDir` {#opt-security.pam.services._name_.makeHomeDir}

Whether to try to create home directories for users
with `$HOME`s pointing to nonexistent
locations on session login.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.mysqlAuth` {#opt-security.pam.services._name_.mysqlAuth}

If set, the `pam_mysql` module will be used to
authenticate users against a MySQL/MariaDB database.

*Type:* boolean

*Default:* `config.users.mysql.enable`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.name` {#opt-security.pam.services._name_.name}

Name of the PAM service.

*Type:* string

*Example:* `"sshd"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.nodelay` {#opt-security.pam.services._name_.nodelay}

Whether the delay after typing a wrong password should be disabled.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.oathAuth` {#opt-security.pam.services._name_.oathAuth}

If set, the OATH Toolkit will be used.

*Type:* boolean

*Default:* `config.security.pam.oath.enable`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.oo7.enable` {#opt-security.pam.services._name_.oo7.enable}

Whether to enable automatically unlock the user's default Session Keyring using pam\_oo7.
If the user's login password does not match their keyring password,
oo7 will prompt separately after login.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.otpwAuth` {#opt-security.pam.services._name_.otpwAuth}

If set, the OTPW system will be used (if
`~/.otpw` exists).

*Type:* boolean

*Default:* `config.security.pam.enableOTPW`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.p11Auth` {#opt-security.pam.services._name_.p11Auth}

If set, keys listed in
`~/.ssh/authorized_keys` and
`~/.eid/authorized_certificates`
can be used to log in with the associated PKCS#11 tokens.

*Type:* boolean

*Default:* `config.security.pam.p11.enable`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.pamMount` {#opt-security.pam.services._name_.pamMount}

Enable PAM mount (pam\_mount) system to mount filesystems on user login.

*Type:* boolean

*Default:* `config.security.pam.mount.enable`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.requireWheel` {#opt-security.pam.services._name_.requireWheel}

Whether to permit root access only to members of group wheel.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.rootOK` {#opt-security.pam.services._name_.rootOK}

If set, root doesn't need to authenticate (e.g. for the
`useradd` service).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.rosec.enable` {#opt-security.pam.services._name_.rosec.enable}

If enabled, pam\_rosec will attempt to automatically unlock the
user's rosec vault upon login. If the user login password does not
match their vault password, rosec will prompt separately after login.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.rssh` {#opt-security.pam.services._name_.rssh}

If set, the calling user's SSH agent is used to authenticate
against the configured keys. This module works in a manner
similar to pam\_ssh\_agent\_auth, but supports a wider range
of SSH key types, including those protected by security
keys (FIDO2).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.setEnvironment` {#opt-security.pam.services._name_.setEnvironment}

Whether the service should set the environment variables
listed in [`environment.sessionVariables`](../../options/environment/index.md#opt-environment.sessionVariables)
using `pam_env.so`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.setLoginUid` {#opt-security.pam.services._name_.setLoginUid}

Set the login uid of the process
(`/proc/self/loginuid`) for auditing
purposes.  The login uid is only set by ‘entry points’ like
`login` and `sshd`, not by
commands like `sudo`.

*Type:* boolean

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.showMotd` {#opt-security.pam.services._name_.showMotd}

Whether to show the message of the day.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.slurm.adopt.enable` {#opt-security.pam.services._name_.slurm.adopt.enable}

If set, it prevents users from logging into nodes if they have no jobs
in the node. It also tracks any other spawned processes for accounting
and ensures complete job cleanup when a job is completed for any
successful connection. Spawned processes get "adopted" as external
steps into the current job. As such, those steps get integrated with
Slurm accounting and control group facilities.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.slurm.adopt.settings` {#opt-security.pam.services._name_.slurm.adopt.settings}

Slurm Adopt Settings. More information is available at:

- https://slurm.schedmd.com/pam\_slurm\_adopt.html

*Type:* open submodule of attribute set of (null or boolean or string or signed integer or path in the Nix store)

*Default:*

``` nix
{
  service = "‹name›";
}
```

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.slurm.adopt.settings.action_adopt_failure` {#opt-security.pam.services._name_.slurm.adopt.settings.action_adopt_failure}

What to do if the process is unable to be adopted into a job.
`allow` matches the upstream default which is only really
suitable for testing; production systems will want `deny`
as a default.

*Type:* one of "allow", "deny"

*Default:* `"deny"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.slurm.adopt.settings.action_generic_failure` {#opt-security.pam.services._name_.slurm.adopt.settings.action_generic_failure}

Catch all for failures related to kernel issues or slurmd
access. Ignore falls through to the next PAM module, allowing
the connection to go through without adoption.

*Type:* one of "ignore", "allow", "deny"

*Default:* `"ignore"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.slurm.adopt.settings.action_no_jobs` {#opt-security.pam.services._name_.slurm.adopt.settings.action_no_jobs}

What to do if no jobs from the user are found, deny or ignore
(pass along to next PAM module).

*Type:* one of "ignore", "deny"

*Default:* `"deny"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.slurm.adopt.settings.action_unknown` {#opt-security.pam.services._name_.slurm.adopt.settings.action_unknown}

If the user has jobs, attach them to the newest job. Allow
the connection through without adoption.

*Type:* one of "newest", "allow", "deny"

*Default:* `"newest"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.slurm.adopt.settings.disable_x11` {#opt-security.pam.services._name_.slurm.adopt.settings.disable_x11}

Disable or enable x11 sessions. '0' means the adopted connection
has Slurm X11 forwarding with DISPLAY overwritten using X11
tunnel endpoint details.

*Type:* one of "0", "1"

*Default:* `"0"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.slurm.adopt.settings.join_container` {#opt-security.pam.services._name_.slurm.adopt.settings.join_container}

Attach to a container created by job\_container/tmpfs

*Type:* one of "true", "false"

*Default:* `"true"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.slurm.adopt.settings.nodename` {#opt-security.pam.services._name_.slurm.adopt.settings.nodename}

Set this only when the Slurm `NodeName` for this machine
differs from `hostname -s`. If unset, `pam_slurm_adopt`
uses the host short name.

*Type:* null or non-empty string

*Default:* `null`

*Example:* `"compute-a-01"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.slurm.enable` {#opt-security.pam.services._name_.slurm.enable}

If set, ONLY prevents users from logging into nodes if they have no
jobs in the node. This module is a legacy implementation with
functionality limited to login restrictions.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.sshAgentAuth` {#opt-security.pam.services._name_.sshAgentAuth}

If set, the calling user's SSH agent is used to authenticate
against the keys in the calling user's
`~/.ssh/authorized_keys`.  This is useful
for `sudo` on password-less remote systems.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.sssdStrictAccess` {#opt-security.pam.services._name_.sssdStrictAccess}

enforce sssd access control

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.startSession` {#opt-security.pam.services._name_.startSession}

If set, the service will register a new session with
systemd's login manager.  For local sessions, this will give
the user access to audio devices, CD-ROM drives.  In the
default PolicyKit configuration, it also allows the user to
reboot the system.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.text` {#opt-security.pam.services._name_.text}

Contents of the PAM service file.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.ttyAudit.disablePattern` {#opt-security.pam.services._name_.ttyAudit.disablePattern}

For each user matching one of comma-separated
glob patterns, disable TTY auditing

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.ttyAudit.enable` {#opt-security.pam.services._name_.ttyAudit.enable}

Enable or disable TTY auditing for specified users

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.ttyAudit.enablePattern` {#opt-security.pam.services._name_.ttyAudit.enablePattern}

For each user matching one of comma-separated
glob patterns, enable TTY auditing

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.ttyAudit.openOnly` {#opt-security.pam.services._name_.ttyAudit.openOnly}

Set the TTY audit flag when opening the session,
but do not restore it when closing the session.
Using this option is necessary for some services
that don't fork() to run the authenticated session,
such as sudo.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.u2f.control` {#opt-security.pam.services._name_.u2f.control}

This option sets pam "control".
If you want to have multi factor authentication, use "required".
If you want to use U2F device instead of regular password, use "sufficient".

Read
`pam.conf(5)`
for better understanding of this option.

*Type:* one of "required", "requisite", "sufficient", "optional"

*Default:* `config.security.pam.u2f.control`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.u2f.enable` {#opt-security.pam.services._name_.u2f.enable}

If set, users listed in
`$XDG_CONFIG_HOME/Yubico/u2f_keys` (or
`$HOME/.config/Yubico/u2f_keys` if XDG variable is
not set) are able to log in with the associated U2F key. Path can be
changed using `security.pam.u2f.authFile` option.

*Type:* boolean

*Default:* `config.security.pam.u2f.enable`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.unixAuth` {#opt-security.pam.services._name_.unixAuth}

Whether users can log in with passwords defined in
`/etc/shadow`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.usshAuth` {#opt-security.pam.services._name_.usshAuth}

If set, users with an SSH certificate containing an authorized principal
in their SSH agent are able to log in. Specific options are controlled
using the `security.pam.ussh` options.

Note that the  [`security.pam.ussh.enable`](#opt-security.pam.ussh.enable) must also be
set for this option to take effect.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.yubicoAuth` {#opt-security.pam.services._name_.yubicoAuth}

If set, users listed in
`~/.yubico/authorized_yubikeys`
are able to log in with the associated Yubikey tokens.

*Type:* boolean

*Default:* `config.security.pam.yubico.enable`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.services.<name>.zfs` {#opt-security.pam.services._name_.zfs}

Enable unlocking and mounting of encrypted ZFS home dataset at login.

*Type:* boolean

*Default:* `config.security.pam.zfs.enable`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.sshAgentAuth.authorizedKeysFiles` {#opt-security.pam.sshAgentAuth.authorizedKeysFiles}

A list of paths to files in OpenSSH's `authorized_keys` format, containing
the keys that will be trusted by the `pam_ssh_agent_auth` module.

The following patterns are expanded when interpreting the path:

- `%f` and `%H` respectively expand to the fully-qualified and short hostname ;
- `%u` expands to the username ;
- `~` or `%h` expands to the user's home directory.

::: note
Specifying user-writeable files here result in an insecure configuration:  a malicious process
can then edit such an authorized\_keys file and bypass the ssh-agent-based authentication.

See [issue #31611](https://github.com/NixOS/nixpkgs/issues/31611)
:::

*Type:* list of string

*Default:*

``` nix
[
  "/etc/ssh/authorized_keys.d/%u"
]
```

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.sshAgentAuth.enable` {#opt-security.pam.sshAgentAuth.enable}

Whether to enable authenticating using a signature performed by the ssh-agent.
This allows using SSH keys exclusively, instead of passwords, for instance on remote machines
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.u2f.control` {#opt-security.pam.u2f.control}

This option sets pam "control".
If you want to have multi factor authentication, use "required".
If you want to use U2F device instead of regular password, use "sufficient".

Read
`pam.conf(5)`
for better understanding of this option.

*Type:* one of "required", "requisite", "sufficient", "optional"

*Default:* `"sufficient"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.u2f.enable` {#opt-security.pam.u2f.enable}

Enables U2F PAM (`pam-u2f`) module.

If set, users listed in
`$XDG_CONFIG_HOME/Yubico/u2f_keys` (or
`$HOME/.config/Yubico/u2f_keys` if XDG variable is
not set) are able to log in with the associated U2F key. The path can
be changed using `security.pam.u2f.authFile` option.

File format is:

```
<username1>:<KeyHandle1>,<UserKey1>,<CoseType1>,<Options1>:<KeyHandle2>,<UserKey2>,<CoseType2>,<Options2>:...
<username2>:<KeyHandle1>,<UserKey1>,<CoseType1>,<Options1>:<KeyHandle2>,<UserKey2>,<CoseType2>,<Options2>:...
```

This file can be generated using `pamu2fcfg` command.

More information can be found [here](https://developers.yubico.com/pam-u2f/).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.u2f.settings` {#opt-security.pam.u2f.settings}

Options to pass to the PAM module.

Boolean values render just the key if true, and nothing if false.
Null values are ignored.
All other values are rendered as key-value pairs.

*Type:* open submodule of attribute set of (null or boolean or string or signed integer or path in the Nix store)

*Default:* `{ }`

*Example:*

``` nix
{
  authfile = "/etc/u2f_keys";
  authpending_file = "";
  pinverification = 1;
  userpresence = 0;
}
```

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.u2f.settings.appid` {#opt-security.pam.u2f.settings.appid}

By default `pam-u2f` module sets the application
ID to `pam://$HOSTNAME`.

When using `pamu2fcfg`, you can specify your
application ID with the `-i` flag.

More information can be found [here](https://developers.yubico.com/pam-u2f/Manuals/pam_u2f.8.html)

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.u2f.settings.authfile` {#opt-security.pam.u2f.settings.authfile}

By default `pam-u2f` module reads the keys from
`$XDG_CONFIG_HOME/Yubico/u2f_keys` (or
`$HOME/.config/Yubico/u2f_keys` if XDG variable is
not set).

If you want to change auth file locations or centralize database (for
example use `/etc/u2f-mappings`) you can set this
option.

File format is:
`username:first_keyHandle,first_public_key: second_keyHandle,second_public_key`
This file can be generated using `pamu2fcfg` command.

More information can be found [here](https://developers.yubico.com/pam-u2f/).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.u2f.settings.cue` {#opt-security.pam.u2f.settings.cue}

By default `pam-u2f` module does not inform user
that he needs to use the u2f device, it just waits without a prompt.

If you set this option to `true`,
`cue` option is added to `pam-u2f`
module and reminder message will be displayed.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.u2f.settings.cue_prompt` {#opt-security.pam.u2f.settings.cue_prompt}

Set individual prompt message for cue mode.
By setting this option, you can set a message to be shown by the
[`security.pam.u2f.settings.cue`](#opt-security.pam.u2f.settings.cue) option.

Requires [`security.pam.u2f.settings.cue`](#opt-security.pam.u2f.settings.cue) to be set to `true`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.u2f.settings.debug` {#opt-security.pam.u2f.settings.debug}

Debug output to stderr.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.u2f.settings.interactive` {#opt-security.pam.u2f.settings.interactive}

Set to prompt a message and wait before testing the presence of a U2F device.
Recommended if your device doesn’t have a tactile trigger.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.u2f.settings.origin` {#opt-security.pam.u2f.settings.origin}

By default `pam-u2f` module sets the origin
to `pam://$HOSTNAME`.
Setting origin to an host independent value will allow you to
reuse credentials across machines

When using `pamu2fcfg`, you can specify the origin
with the `-o` flag.

More information can be found [here](https://developers.yubico.com/pam-u2f/Manuals/pam_u2f.8.html)

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.u2f.settings.prompt` {#opt-security.pam.u2f.settings.prompt}

Set individual prompt message for interactive mode.
By setting this option, you can set a message to be shown by the
[`security.pam.u2f.settings.interactive`](#opt-security.pam.u2f.settings.interactive) option.

Requires [`security.pam.u2f.settings.interactive`](#opt-security.pam.u2f.settings.interactive) to be set to `true`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.ussh.authorizedPrincipals` {#opt-security.pam.ussh.authorizedPrincipals}

Comma-separated list of authorized principals to permit; if the user
presents a certificate with one of these principals, then they will be
authorized.

Note that `pam-ussh` also requires that the certificate
contain a principal matching the user's username. The principals from
this list are in addition to those principals.

Mutually exclusive with `authorizedPrincipalsFile`.

*Type:* null or strings concatenated with ","

*Default:* `null`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.ussh.authorizedPrincipalsFile` {#opt-security.pam.ussh.authorizedPrincipalsFile}

Path to a list of principals; if the user presents a certificate with
one of these principals, then they will be authorized.

Note that `pam-ussh` also requires that the certificate
contain a principal matching the user's username. The principals from
this file are in addition to those principals.

Mutually exclusive with `authorizedPrincipals`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.ussh.caFile` {#opt-security.pam.ussh.caFile}

By default `pam-ussh` reads the trusted user CA keys
from `/etc/ssh/trusted_user_ca`.

This should be set the same as your `TrustedUserCAKeys`
option for sshd.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.ussh.control` {#opt-security.pam.ussh.control}

This option sets pam "control".
If you want to have multi factor authentication, use "required".
If you want to use the SSH certificate instead of the regular password,
use "sufficient".

Read
`pam.conf(5)`
for better understanding of this option.

*Type:* one of "required", "requisite", "sufficient", "optional"

*Default:* `"sufficient"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.ussh.enable` {#opt-security.pam.ussh.enable}

Enables Uber's USSH PAM (`pam-ussh`) module.

This is similar to `pam-ssh-agent`, except that
the presence of a CA-signed SSH key with a valid principal is checked
instead.

Note that this module must both be enabled using this option and on a
per-PAM-service level as well (using `usshAuth`).

More information can be found [here](https://github.com/uber/pam-ussh).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.ussh.group` {#opt-security.pam.ussh.group}

If set, then the authenticating user must be a member of this group
to use this module.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.yubico.challengeResponsePath` {#opt-security.pam.yubico.challengeResponsePath}

If not null, set the path used by yubico pam module where the challenge expected response is stored.

More information can be found [here](https://developers.yubico.com/yubico-pam/Authentication_Using_Challenge-Response.html).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.yubico.control` {#opt-security.pam.yubico.control}

This option sets pam "control".
If you want to have multi factor authentication, use "required".
If you want to use Yubikey instead of regular password, use "sufficient".

Read
`pam.conf(5)`
for better understanding of this option.

*Type:* one of "required", "requisite", "sufficient", "optional"

*Default:* `"sufficient"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.yubico.debug` {#opt-security.pam.yubico.debug}

Debug output to stderr.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.yubico.enable` {#opt-security.pam.yubico.enable}

Enables Yubico PAM (`yubico-pam`) module.

If set, users listed in
`~/.yubico/authorized_yubikeys`
are able to log in with the associated Yubikey tokens.

The file must have only one line:
`username:yubikey_token_id1:yubikey_token_id2`
More information can be found [here](https://developers.yubico.com/yubico-pam/).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.yubico.id` {#opt-security.pam.yubico.id}

client id

*Type:* string

*Example:* `"42"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.yubico.mode` {#opt-security.pam.yubico.mode}

Mode of operation.

Use "client" for online validation with a YubiKey validation service such as
the YubiCloud.

Use "challenge-response" for offline validation using YubiKeys with HMAC-SHA-1
Challenge-Response configurations. See the man-page `ykpamcfg(1)` for further
details on how to configure offline Challenge-Response validation.

More information can be found [here](https://developers.yubico.com/yubico-pam/Authentication_Using_Challenge-Response.html).

*Type:* one of "client", "challenge-response"

*Default:* `"client"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.zfs.enable` {#opt-security.pam.zfs.enable}

Enable unlocking and mounting of encrypted ZFS home dataset at login.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.zfs.homes` {#opt-security.pam.zfs.homes}

Prefix of home datasets. This value will be concatenated with
`"/" + <username>` in order to determine the home dataset to unlock.

*Type:* string

*Default:* `"rpool/home"`

*Example:* `"rpool/home"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.zfs.mountRecursively` {#opt-security.pam.zfs.mountRecursively}

Mount child datasets of home dataset.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pam.zfs.noUnmount` {#opt-security.pam.zfs.noUnmount}

Do not unmount home dataset on logout.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `security.pki.caBundle` {#opt-security.pki.caBundle}

(Read-only) the path to the final bundle of certificate authorities as a single file.

*Type:* absolute path

*Read only*

*Declared by:* [`nixos/modules/security/ca.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/ca.nix)

## `security.pki.caCertificateBlacklist` {#opt-security.pki.caCertificateBlacklist}

A list of blacklisted CA certificate names that won't be imported from
the Mozilla Trust Store into
`/etc/ssl/certs/ca-certificates.crt`. Use the
names from that file.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "WoSign"
  "WoSign China"
  "CA WoSign ECC Root"
  "Certification Authority of WoSign G2"
]
```

*Declared by:* [`nixos/modules/security/ca.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/ca.nix)

## `security.pki.certificateFiles` {#opt-security.pki.certificateFiles}

A list of files containing trusted root certificates in PEM
format. These are concatenated to form
`/etc/ssl/certs/ca-certificates.crt`, which is
used by many programs that use OpenSSL, such as
`curl` and `git`.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:* `[ "${pkgs.dn42-cacert}/etc/ssl/certs/dn42-ca.crt" ]`

*Declared by:* [`nixos/modules/security/ca.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/ca.nix)

## `security.pki.certificates` {#opt-security.pki.certificates}

A list of trusted root certificates in PEM format.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[ ''
    NixOS.org
    =========
    -----BEGIN CERTIFICATE-----
    MIIGUDCCBTigAwIBAgIDD8KWMA0GCSqGSIb3DQEBBQUAMIGMMQswCQYDVQQGEwJJ
    TDEWMBQGA1UEChMNU3RhcnRDb20gTHRkLjErMCkGA1UECxMiU2VjdXJlIERpZ2l0
    ...
    -----END CERTIFICATE-----
  ''
]
```

*Declared by:* [`nixos/modules/security/ca.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/ca.nix)

## `security.pki.useCompatibleBundle` {#opt-security.pki.useCompatibleBundle}

Whether to enable usage of a compatibility bundle.

Such a bundle consists exclusively of `BEGIN CERTIFICATE` and no `BEGIN TRUSTED CERTIFICATE`,
which is an OpenSSL specific PEM format.

It is known to be incompatible with certain software stacks.

Nevertheless, enabling this will strip all additional trust rules provided by the
certificates themselves. This can have security consequences depending on your usecases
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/ca.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/ca.nix)

## `security.please.enable` {#opt-security.please.enable}

Whether to enable please, a Sudo clone which allows a users to execute a command or edit a
file as another user
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/please.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/please.nix)

## `security.please.package` {#opt-security.please.package}

The please package to use.

*Type:* package

*Default:* `pkgs.please`

*Declared by:* [`nixos/modules/security/please.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/please.nix)

## `security.please.settings` {#opt-security.please.settings}

Please configuration. Refer to
[https://github.com/edneville/please/blob/master/please.ini.md](https://github.com/edneville/please/blob/master/please.ini.md) for
details.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  jim_edit_etc_hosts_as_root = {
    editmode = 644;
    name = "jim";
    require_pass = true;
    rule = "/etc/hosts";
    target = "root";
    type = "edit";
  };
  jim_run_any_as_root = {
    name = "jim";
    require_pass = false;
    rule = ".*";
    target = "root";
    type = "run";
  };
}
```

*Declared by:* [`nixos/modules/security/please.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/please.nix)

## `security.please.wheelNeedsPassword` {#opt-security.please.wheelNeedsPassword}

Whether users of the `wheel` group must provide a password to run
commands or edit files with `please` and
`pleaseedit` respectively.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/please.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/please.nix)

## `security.polkit.adminIdentities` {#opt-security.polkit.adminIdentities}

Specifies which users are considered “administrators”, for those
actions that require the user to authenticate as an
administrator (i.e. have an `auth_admin`
value).  By default, this is all users in the `wheel` group.

*Type:* list of string

*Default:*

``` nix
[
  "unix-group:wheel"
]
```

*Example:*

``` nix
[
  "unix-user:alice"
  "unix-group:admin"
]
```

*Declared by:* [`nixos/modules/security/polkit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/polkit.nix)

## `security.polkit.enable` {#opt-security.polkit.enable}

Whether to enable polkit.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/polkit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/polkit.nix)

## `security.polkit.enablePkexecWrapper` {#opt-security.polkit.enablePkexecWrapper}

Whether to enable the setuid pkexec wrapper.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/polkit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/polkit.nix)

## `security.polkit.extraArgs` {#opt-security.polkit.extraArgs}

List of arguments to pass to the polkitd executable.

::: note
To see debug logs you need to negate the default `--no-debug` setting.
:::

*Type:* list of string

*Default:*

``` nix
[
  "--no-debug"
  "--log-level=notice"
]
```

*Declared by:* [`nixos/modules/security/polkit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/polkit.nix)

## `security.polkit.extraConfig` {#opt-security.polkit.extraConfig}

Any polkit rules to be added to config (in JavaScript ;-). See:
[https://www.freedesktop.org/software/polkit/docs/latest/polkit.8.html#polkit-rules](https://www.freedesktop.org/software/polkit/docs/latest/polkit.8.html#polkit-rules)

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  /* Log authorization checks. */
  polkit.addRule(function(action, subject) {
    // Make sure to negate --no-debug in services.polkit.extraArgs: { security.polkit.extraArgs = [ "--log-level=notice" ]; }
    polkit.log("user " +  subject.user + " is attempting action " + action.id + " from PID " + subject.pid);
  });
  
  /* Allow any local user to do anything (dangerous!). */
  polkit.addRule(function(action, subject) {
    if (subject.local) return "yes";
  });
''
```

*Declared by:* [`nixos/modules/security/polkit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/polkit.nix)

## `security.polkit.package` {#opt-security.polkit.package}

The polkit package to use.

*Type:* package

*Default:* `pkgs.polkit`

*Declared by:* [`nixos/modules/security/polkit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/polkit.nix)

## `security.polkit.settings` {#opt-security.polkit.settings}

Options for polkitd.
See `polkitd.conf(5)` for available options.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Declared by:* [`nixos/modules/security/polkit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/polkit.nix)

## `security.polkit.settings.Polkitd.ExpirationSeconds` {#opt-security.polkit.settings.Polkitd.ExpirationSeconds}

Expiration timeout of authenticated sessions.

*Type:* positive integer, meaning \>0

*Default:* `300`

*Declared by:* [`nixos/modules/security/polkit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/polkit.nix)

## `security.protectKernelImage` {#opt-security.protectKernelImage}

Whether to prevent replacing the running kernel image.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/misc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/misc.nix)

## `security.rtkit.args` {#opt-security.rtkit.args}

Command-line options for `rtkit-daemon`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--our-realtime-priority=29"
  "--max-realtime-priority=28"
]
```

*Declared by:* [`nixos/modules/security/rtkit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/rtkit.nix)

## `security.rtkit.enable` {#opt-security.rtkit.enable}

Whether to enable the RealtimeKit system service, which hands
out realtime scheduling priority to user processes on
demand. For example, PulseAudio and PipeWire use this to
acquire realtime priority.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/rtkit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/rtkit.nix)

## `security.rtkit.package` {#opt-security.rtkit.package}

The rtkit package to use.

*Type:* package

*Default:* `pkgs.rtkit`

*Declared by:* [`nixos/modules/security/rtkit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/rtkit.nix)

## `security.run0.enable` {#opt-security.run0.enable}

Whether to enable support for run0.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/run0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/run0.nix)

## `security.run0.enableSudoAlias` {#opt-security.run0.enableSudoAlias}

Alias of [`security.run0.sudo-shim.enable`](#opt-security.run0.sudo-shim.enable).

*Type:* boolean

*Declared by:* [`nixos/modules/security/run0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/run0.nix)

## `security.run0.persistentAuth.enable` {#opt-security.run0.persistentAuth.enable}

Whether to enable persistent authentication for sessions.
Timeout configurable via [`security.polkit.settings.Polkitd.ExpirationSeconds`](#opt-security.polkit.settings.Polkitd.ExpirationSeconds)
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/run0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/run0.nix)

## `security.run0.persistentAuth.enableRemote` {#opt-security.run0.persistentAuth.enableRemote}

Whether to enable persistent authentication for remote sessions.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/run0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/run0.nix)

## `security.run0.sudo-shim.enable` {#opt-security.run0.sudo-shim.enable}

Whether to enable make `sudo` an alias to `run0`..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/run0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/run0.nix)

## `security.run0.sudo-shim.package` {#opt-security.run0.sudo-shim.package}

The run0-sudo-shim package to use.

*Type:* package

*Default:* `pkgs.run0-sudo-shim`

*Declared by:* [`nixos/modules/security/run0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/run0.nix)

## `security.run0.wheelNeedsPassword` {#opt-security.run0.wheelNeedsPassword}

Whether users of the `wheel` group must
provide a password to run commands as super user via `run0`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/run0.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/run0.nix)

## `security.shadow.enable` {#opt-security.shadow.enable}

Enable the shadow authentication suite, which provides critical programs such as su, login, passwd.

Note: This is currently experimental. Only disable this if you're
confident that you can recover your system if it breaks.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/shadow.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/shadow.nix)

## `security.shadow.su.package` {#opt-security.shadow.su.package}

The su package to use. This can be overridden by other modules (e.g. sudo-rs) to provide
an alternative `su` implementation.

*Type:* package

*Default:* `pkgs.shadow.su`

*Declared by:* [`nixos/modules/programs/shadow.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/shadow.nix)

## `security.soteria.enable` {#opt-security.soteria.enable}

Whether to enable Soteria, a Polkit authentication agent
for any desktop environment.

::: note
You should only enable this if you are on a Desktop Environment that
does not provide a graphical polkit authentication agent, or you are on
a standalone window manager or Wayland compositor.
:::

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/soteria.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/soteria.nix)

## `security.soteria.package` {#opt-security.soteria.package}

The soteria package to use.

*Type:* package

*Default:* `pkgs.soteria`

*Declared by:* [`nixos/modules/security/soteria.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/soteria.nix)

## `security.sudo-rs.configFile` {#opt-security.sudo-rs.configFile}

This string contains the contents of the
`sudoers` file.

*Type:* strings concatenated with "\\n"

*Declared by:* [`nixos/modules/security/sudo-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo-rs.nix)

## `security.sudo-rs.defaultOptions` {#opt-security.sudo-rs.defaultOptions}

Options used for the default rules, granting `root` and the
`wheel` group permission to run any command as any user.

*Type:* list of string

*Default:*

``` nix
[
  "SETENV"
]
```

*Declared by:* [`nixos/modules/security/sudo-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo-rs.nix)

## `security.sudo-rs.enable` {#opt-security.sudo-rs.enable}

Whether to enable a memory-safe implementation of the `sudo` command,
which allows non-root users to execute commands as root
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/sudo-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo-rs.nix)

## `security.sudo-rs.execWheelOnly` {#opt-security.sudo-rs.execWheelOnly}

Only allow members of the `wheel` group to execute sudo by
setting the executable's permissions accordingly.
This prevents users that are not members of `wheel` from
exploiting vulnerabilities in sudo such as CVE-2021-3156.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/sudo-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo-rs.nix)

## `security.sudo-rs.extraConfig` {#opt-security.sudo-rs.extraConfig}

Extra configuration text appended to `sudoers`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/security/sudo-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo-rs.nix)

## `security.sudo-rs.extraRules` {#opt-security.sudo-rs.extraRules}

Define specific rules to be in the `sudoers` file.
More specific rules should come after more general ones in order to
yield the expected behavior. You can use `lib.mkBefore`/`lib.mkAfter` to ensure
this is the case when configuration options are merged.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  # Allow execution of any command by all users in group sudo,
  # requiring a password.
  { groups = [ "sudo" ]; commands = [ "ALL" ]; }

  # Allow execution of "/home/root/secret.sh" by user `backup`, `database`
  # and the group with GID `1006` without a password.
  { users = [ "backup" "database" ]; groups = [ 1006 ];
    commands = [ { command = "/home/root/secret.sh"; options = [ "SETENV" "NOPASSWD" ]; } ]; }

  # Allow all users of group `bar` to run two executables as user `foo`
  # with arguments being pre-set.
  { groups = [ "bar" ]; runAs = "foo";
    commands =
      [ "/home/baz/cmd1.sh hello-sudo"
          { command = ''/home/baz/cmd2.sh ""''; options = [ "SETENV" ]; } ]; }
]
```

*Declared by:* [`nixos/modules/security/sudo-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo-rs.nix)

## `security.sudo-rs.extraRules.*.commands` {#opt-security.sudo-rs.extraRules._.commands}

The commands for which the rule should apply.

*Type:* list of (string or (submodule))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/security/sudo-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo-rs.nix)

## `security.sudo-rs.extraRules.*.groups` {#opt-security.sudo-rs.extraRules._.groups}

The groups / GIDs this rule should apply for.

*Type:* list of (string or signed integer)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/security/sudo-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo-rs.nix)

## `security.sudo-rs.extraRules.*.host` {#opt-security.sudo-rs.extraRules._.host}

For what host this rule should apply.

*Type:* string

*Default:* `"ALL"`

*Declared by:* [`nixos/modules/security/sudo-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo-rs.nix)

## `security.sudo-rs.extraRules.*.runAs` {#opt-security.sudo-rs.extraRules._.runAs}

Under which user/group the specified command is allowed to run.

A user can be specified using just the username: `"foo"`.
It is also possible to specify a user/group combination using `"foo:bar"`
or to only allow running as a specific group with `":bar"`.

*Type:* string

*Default:* `"ALL:ALL"`

*Declared by:* [`nixos/modules/security/sudo-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo-rs.nix)

## `security.sudo-rs.extraRules.*.users` {#opt-security.sudo-rs.extraRules._.users}

The usernames / UIDs this rule should apply for.

*Type:* list of (string or signed integer)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/security/sudo-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo-rs.nix)

## `security.sudo-rs.package` {#opt-security.sudo-rs.package}

The sudo-rs package to use.

*Type:* package

*Default:* `pkgs.sudo-rs`

*Declared by:* [`nixos/modules/security/sudo-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo-rs.nix)

## `security.sudo-rs.wheelNeedsPassword` {#opt-security.sudo-rs.wheelNeedsPassword}

Whether users of the `wheel` group must
provide a password to run commands as super user via `sudo`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/sudo-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo-rs.nix)

## `security.sudo.configFile` {#opt-security.sudo.configFile}

This string contains the contents of the
`sudoers` file.

*Type:* strings concatenated with "\\n"

*Declared by:* [`nixos/modules/security/sudo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo.nix)

## `security.sudo.defaultOptions` {#opt-security.sudo.defaultOptions}

Options used for the default rules, granting `root` and the
`wheel` group permission to run any command as any user.

*Type:* list of string

*Default:*

``` nix
[
  "SETENV"
]
```

*Declared by:* [`nixos/modules/security/sudo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo.nix)

## `security.sudo.enable` {#opt-security.sudo.enable}

Whether to enable the `sudo` command, which
allows non-root users to execute commands as root.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/sudo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo.nix)

## `security.sudo.execWheelOnly` {#opt-security.sudo.execWheelOnly}

Only allow members of the `wheel` group to execute sudo by
setting the executable's permissions accordingly.
This prevents users that are not members of `wheel` from
exploiting vulnerabilities in sudo such as CVE-2021-3156.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/sudo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo.nix)

## `security.sudo.extraConfig` {#opt-security.sudo.extraConfig}

Extra configuration text appended to `sudoers`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/security/sudo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo.nix)

## `security.sudo.extraRules` {#opt-security.sudo.extraRules}

Define specific rules to be in the `sudoers` file.
More specific rules should come after more general ones in order to
yield the expected behavior. You can use mkBefore/mkAfter to ensure
this is the case when configuration options are merged.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  # Allow execution of any command by all users in group sudo,
  # requiring a password.
  { groups = [ "sudo" ]; commands = [ "ALL" ]; }

  # Allow execution of "/home/root/secret.sh" by user `backup`, `database`
  # and the group with GID `1006` without a password.
  { users = [ "backup" "database" ]; groups = [ 1006 ];
    commands = [ { command = "/home/root/secret.sh"; options = [ "SETENV" "NOPASSWD" ]; } ]; }

  # Allow all users of group `bar` to run two executables as user `foo`
  # with arguments being pre-set.
  { groups = [ "bar" ]; runAs = "foo";
    commands =
      [ "/home/baz/cmd1.sh hello-sudo"
          { command = ''/home/baz/cmd2.sh ""''; options = [ "SETENV" ]; } ]; }
]
```

*Declared by:* [`nixos/modules/security/sudo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo.nix)

## `security.sudo.extraRules.*.commands` {#opt-security.sudo.extraRules._.commands}

The commands for which the rule should apply.

*Type:* list of (string or (submodule))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/security/sudo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo.nix)

## `security.sudo.extraRules.*.groups` {#opt-security.sudo.extraRules._.groups}

The groups / GIDs this rule should apply for.

*Type:* list of (string or signed integer)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/security/sudo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo.nix)

## `security.sudo.extraRules.*.host` {#opt-security.sudo.extraRules._.host}

For what host this rule should apply.

*Type:* string

*Default:* `"ALL"`

*Declared by:* [`nixos/modules/security/sudo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo.nix)

## `security.sudo.extraRules.*.runAs` {#opt-security.sudo.extraRules._.runAs}

Under which user/group the specified command is allowed to run.

A user can be specified using just the username: `"foo"`.
It is also possible to specify a user/group combination using `"foo:bar"`
or to only allow running as a specific group with `":bar"`.

*Type:* string

*Default:* `"ALL:ALL"`

*Declared by:* [`nixos/modules/security/sudo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo.nix)

## `security.sudo.extraRules.*.users` {#opt-security.sudo.extraRules._.users}

The usernames / UIDs this rule should apply for.

*Type:* list of (string or signed integer)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/security/sudo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo.nix)

## `security.sudo.keepTerminfo` {#opt-security.sudo.keepTerminfo}

Whether to preserve the `TERMINFO` and `TERMINFO_DIRS`
environment variables, for `root` and the `wheel` group.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/terminfo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/terminfo.nix)

## `security.sudo.package` {#opt-security.sudo.package}

The sudo package to use.

*Type:* package

*Default:* `pkgs.sudo`

*Declared by:* [`nixos/modules/security/sudo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo.nix)

## `security.sudo.wheelNeedsPassword` {#opt-security.sudo.wheelNeedsPassword}

Whether users of the `wheel` group must
provide a password to run commands as super user via `sudo`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/sudo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/sudo.nix)

## `security.tpm2.abrmd.enable` {#opt-security.tpm2.abrmd.enable}

Whether to enable Trusted Platform 2 userspace resource manager daemon
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/tpm2.nix)

## `security.tpm2.abrmd.package` {#opt-security.tpm2.abrmd.package}

The tpm2-abrmd package to use.

*Type:* package

*Default:* `pkgs.tpm2-abrmd`

*Declared by:* [`nixos/modules/security/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/tpm2.nix)

## `security.tpm2.applyUdevRules` {#opt-security.tpm2.applyUdevRules}

Whether to make the /dev/tpm\[0-9\] devices accessible by the tssUser, or
the /dev/tpmrm\[0-9\] by tssGroup respectively

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/tpm2.nix)

## `security.tpm2.enable` {#opt-security.tpm2.enable}

Whether to enable Trusted Platform Module 2 support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/tpm2.nix)

## `security.tpm2.fapi.ekCertLess` {#opt-security.tpm2.fapi.ekCertLess}

A switch to disable Endorsement Key (EK) certificate verification.

A value of null indicates that the generated fapi config file does not
contain a ek\_cert\_less key. The effect of not having that key at all is
the same as setting its value to false.

A value of false means that the tss2 cli will not work if there is no
EK Cert installed, or if the installed EK Cert can't be validated.

A value of true means that the tss2 cli will work even if there's no EK
cert installed.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/security/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/tpm2.nix)

## `security.tpm2.fapi.ekFingerprint` {#opt-security.tpm2.fapi.ekFingerprint}

The fingerprint of the endorsement key.

A value of null means that you have chosen not to specify the expected
fingerprint of the EK. You can still have an endorsement key, it just
won't get checked to see if it's fingerprint matches a particular value
before being used.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/security/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/tpm2.nix)

## `security.tpm2.fapi.firmwareLogFile` {#opt-security.tpm2.fapi.firmwareLogFile}

The binary bios measurements.

*Type:* string

*Default:* `"/sys/kernel/security/tpm0/binary_bios_measurements"`

*Declared by:* [`nixos/modules/security/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/tpm2.nix)

## `security.tpm2.fapi.imaLogFile` {#opt-security.tpm2.fapi.imaLogFile}

The binary IMA measurements (Integrity Measurement Architecture).

*Type:* string

*Default:* `"/sys/kernel/security/ima/binary_runtime_measurements"`

*Declared by:* [`nixos/modules/security/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/tpm2.nix)

## `security.tpm2.fapi.logDir` {#opt-security.tpm2.fapi.logDir}

The directory for the event log.

*Type:* string

*Default:* `"/var/log/tpm2-tss/eventlog/"`

*Declared by:* [`nixos/modules/security/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/tpm2.nix)

## `security.tpm2.fapi.profileDir` {#opt-security.tpm2.fapi.profileDir}

Directory that contains all cryptographic profiles known to FAPI.

*Type:* string

*Default:* `${pkgs.tpm2-tss}/etc/fapi-profiles/`

*Declared by:* [`nixos/modules/security/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/tpm2.nix)

## `security.tpm2.fapi.profileName` {#opt-security.tpm2.fapi.profileName}

Name of the default cryptographic profile chosen from the profile\_dir directory.

*Type:* string

*Default:* `"P_ECCP256SHA256"`

*Declared by:* [`nixos/modules/security/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/tpm2.nix)

## `security.tpm2.fapi.systemDir` {#opt-security.tpm2.fapi.systemDir}

The directory where system objects, policies, and imported objects are stored.

*Type:* string

*Default:* `"/var/lib/tpm2-tss/keystore"`

*Declared by:* [`nixos/modules/security/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/tpm2.nix)

## `security.tpm2.fapi.systemPcrs` {#opt-security.tpm2.fapi.systemPcrs}

The PCR registers which are used by the system.

*Type:* list of signed integer

*Default:* `[ ]`

*Declared by:* [`nixos/modules/security/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/tpm2.nix)

## `security.tpm2.fapi.tcti` {#opt-security.tpm2.fapi.tcti}

The TCTI which will be used.

An empty string indicates no TCTI is specified by the FAPI config.

If not specified in the FAPI config it can be specified by environment
variable (TPM2TOOLS\_TCTI, TPM2\_PKCS11\_TCTI, etc) or a TCTI will be chosen
by the FAPI library by searching for tabrmd, device, and mssim TCTIs in
that order.

*Type:* string

*Default:* `""`

*Example:* `"device:/dev/tpmrm0"`

*Declared by:* [`nixos/modules/security/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/tpm2.nix)

## `security.tpm2.fapi.userDir` {#opt-security.tpm2.fapi.userDir}

The directory where user objects are stored.

*Type:* string

*Default:* `"~/.local/share/tpm2-tss/user/keystore/"`

*Declared by:* [`nixos/modules/security/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/tpm2.nix)

## `security.tpm2.pkcs11.enable` {#opt-security.tpm2.pkcs11.enable}

Whether to enable TPM2 PKCS#11 tool and shared library in system path
(`/run/current-system/sw/lib/libtpm2_pkcs11.so`)
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/security/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/tpm2.nix)

## `security.tpm2.pkcs11.package` {#opt-security.tpm2.pkcs11.package}

tpm2-pkcs11 package to use

*Type:* package

*Default:* `if config.security.tpm2.abrmd.enable then pkgs.tpm2-pkcs11.abrmd else pkgs.tpm2-pkcs11`

*Declared by:* [`nixos/modules/security/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/tpm2.nix)

## `security.tpm2.tctiEnvironment.deviceConf` {#opt-security.tpm2.tctiEnvironment.deviceConf}

Configuration part of the device TCTI, e.g. the path to the TPM device.
Applies if interface is set to "device".
The format is specified in the
[
tpm2-tools repository](https://github.com/tpm2-software/tpm2-tools/blob/master/man/common/tcti.md#tcti-options).

*Type:* string

*Default:* `"/dev/tpmrm0"`

*Declared by:* [`nixos/modules/security/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/tpm2.nix)

## `security.tpm2.tctiEnvironment.enable` {#opt-security.tpm2.tctiEnvironment.enable}

Set common TCTI environment variables to the specified value.
The variables are

- `TPM2TOOLS_TCTI`
- `TPM2_PKCS11_TCTI`

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/tpm2.nix)

## `security.tpm2.tctiEnvironment.interface` {#opt-security.tpm2.tctiEnvironment.interface}

The name of the TPM command transmission interface (TCTI) library to
use.

*Type:* one of "tabrmd", "device"

*Default:* `"device"`

*Declared by:* [`nixos/modules/security/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/tpm2.nix)

## `security.tpm2.tctiEnvironment.tabrmdConf` {#opt-security.tpm2.tctiEnvironment.tabrmdConf}

Configuration part of the tabrmd TCTI, like the D-Bus bus name.
Applies if interface is set to "tabrmd".
The format is specified in the
[
tpm2-tools repository](https://github.com/tpm2-software/tpm2-tools/blob/master/man/common/tcti.md#tcti-options).

*Type:* string

*Default:* `"bus_name=com.intel.tss2.Tabrmd"`

*Declared by:* [`nixos/modules/security/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/tpm2.nix)

## `security.tpm2.tssGroup` {#opt-security.tpm2.tssGroup}

Group of the tpm kernel resource manager (tpmrm) device-group, set if
applyUdevRules is set.

*Type:* null or string

*Default:* `"tss"`

*Declared by:* [`nixos/modules/security/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/tpm2.nix)

## `security.tpm2.tssUser` {#opt-security.tpm2.tssUser}

Name of the tpm device-owner and service user, set if applyUdevRules is
set.

*Type:* null or string

*Default:* `if config.security.tpm2.abrmd.enable then "tss" else "root"`

*Declared by:* [`nixos/modules/security/tpm2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/tpm2.nix)

## `security.virtualisation.flushL1DataCache` {#opt-security.virtualisation.flushL1DataCache}

Whether the hypervisor should flush the L1 data cache before
entering guests.
See also [security](#opt-security.allowSimultaneousMultithreading).

- `null`: uses the kernel default
- `"never"`: disables L1 data cache flushing entirely.
  May be appropriate if all guests are trusted.
- `"cond"`: flushes L1 data cache only for pre-determined
  code paths.  May leak information about the host address space
  layout.
- `"always"`: flushes L1 data cache every time the hypervisor
  enters the guest.  May incur significant performance cost.

*Type:* null or one of "never", "cond", "always"

*Default:* `null`

*Declared by:* [`nixos/modules/security/misc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/misc.nix)

## `security.wrapperDirSize` {#opt-security.wrapperDirSize}

Size limit for the /run/wrappers tmpfs. Look at `mount(8)`, tmpfs size option,
for the accepted syntax. WARNING: don't set to less than 64MB.

*Type:* string

*Default:* `"50%"`

*Example:* `"10G"`

*Declared by:* [`nixos/modules/security/wrappers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/wrappers/default.nix)

## `security.wrappers` {#opt-security.wrappers}

This option effectively allows adding setuid/setgid bits, capabilities,
changing file ownership and permissions of a program without directly
modifying it. This works by creating a wrapper program in a directory
(not configurable), which is then added to the shell `PATH`. Source
programs are required to be ELF executables.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  # a setuid root program
  doas =
    { setuid = true;
      owner = "root";
      group = "root";
      source = "${pkgs.doas}/bin/doas";
    };

  # a setgid program
  locate =
    { setgid = true;
      owner = "root";
      group = "mlocate";
      source = "${pkgs.locate}/bin/locate";
    };

  # a program with the CAP_NET_RAW capability
  ping =
    { owner = "root";
      group = "root";
      capabilities = "cap_net_raw+ep";
      source = "${pkgs.iputils.out}/bin/ping";
    };
}
```

*Declared by:* [`nixos/modules/security/wrappers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/wrappers/default.nix)

## `security.wrappers.<name>.capabilities` {#opt-security.wrappers._name_.capabilities}

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

## `security.wrappers.<name>.enable` {#opt-security.wrappers._name_.enable}

Whether to enable the wrapper.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/security/wrappers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/wrappers/default.nix)

## `security.wrappers.<name>.group` {#opt-security.wrappers._name_.group}

The group of the wrapper program.

*Type:* string

*Declared by:* [`nixos/modules/security/wrappers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/wrappers/default.nix)

## `security.wrappers.<name>.owner` {#opt-security.wrappers._name_.owner}

The owner of the wrapper program.

*Type:* string

*Declared by:* [`nixos/modules/security/wrappers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/wrappers/default.nix)

## `security.wrappers.<name>.permissions` {#opt-security.wrappers._name_.permissions}

The permissions of the wrapper program. The format is that of a
symbolic or numeric file mode understood by `chmod`.

*Type:* file mode string

*Default:* `"u+rx,g+x,o+x"`

*Example:* `"a+rx"`

*Declared by:* [`nixos/modules/security/wrappers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/wrappers/default.nix)

## `security.wrappers.<name>.program` {#opt-security.wrappers._name_.program}

The name of the wrapper program. Defaults to the attribute name.

*Type:* null or string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/security/wrappers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/wrappers/default.nix)

## `security.wrappers.<name>.setgid` {#opt-security.wrappers._name_.setgid}

Whether to add the setgid bit the wrapper program.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/wrappers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/wrappers/default.nix)

## `security.wrappers.<name>.setuid` {#opt-security.wrappers._name_.setuid}

Whether to add the setuid bit the wrapper program.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/security/wrappers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/wrappers/default.nix)

## `security.wrappers.<name>.source` {#opt-security.wrappers._name_.source}

The absolute path to the program to be wrapped.
This must be an ELF executable.

*Type:* absolute path

*Declared by:* [`nixos/modules/security/wrappers/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/wrappers/default.nix)
