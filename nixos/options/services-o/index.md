# services (O) {#sec-options-services-o}

## `services.oauth2-proxy.approvalPrompt` {#opt-services.oauth2-proxy.approvalPrompt}

OAuth approval\_prompt.

*Type:* one of "force", "auto"

*Default:* `"force"`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.azure.resource` {#opt-services.oauth2-proxy.azure.resource}

The resource that is protected.

*Type:* string

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.azure.tenant` {#opt-services.oauth2-proxy.azure.tenant}

Go to a tenant-specific or common (tenant-independent) endpoint.

*Type:* string

*Default:* `"common"`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.basicAuthPassword` {#opt-services.oauth2-proxy.basicAuthPassword}

The password to set when passing the HTTP Basic Auth header.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.clientID` {#opt-services.oauth2-proxy.clientID}

The OAuth Client ID.

*Type:* null or string

*Default:* `null`

*Example:* `"123456.apps.googleusercontent.com"`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.clientSecretFile` {#opt-services.oauth2-proxy.clientSecretFile}

The path to a file containing the OAuth Client Secret.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/oauth2-client-secret"`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.cookie.domain` {#opt-services.oauth2-proxy.cookie.domain}

Optional cookie domains to force cookies to (ie: `.yourcompany.com`).
The longest domain matching the request's host will be used (or the shortest
cookie domain if there is no match).

*Type:* null or string

*Default:* `null`

*Example:* `".yourcompany.com"`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.cookie.expire` {#opt-services.oauth2-proxy.cookie.expire}

Expire timeframe for cookie.

*Type:* string

*Default:* `"168h0m0s"`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.cookie.httpOnly` {#opt-services.oauth2-proxy.cookie.httpOnly}

Set HttpOnly cookie flag.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.cookie.name` {#opt-services.oauth2-proxy.cookie.name}

The name of the cookie that the oauth\_proxy creates.

*Type:* string

*Default:* `"_oauth2_proxy"`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.cookie.refresh` {#opt-services.oauth2-proxy.cookie.refresh}

Refresh the cookie after this duration; 0 to disable.

*Type:* null or string

*Default:* `null`

*Example:* `"168h0m0s"`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.cookie.secretFile` {#opt-services.oauth2-proxy.cookie.secretFile}

The path to a file containing the seed string for secure cookies.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/oauth2-cookie-secret"`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.cookie.secure` {#opt-services.oauth2-proxy.cookie.secure}

Set secure (HTTPS) cookie flag.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.customTemplatesDir` {#opt-services.oauth2-proxy.customTemplatesDir}

Path to custom HTML templates.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.email.addresses` {#opt-services.oauth2-proxy.email.addresses}

Line-separated email addresses that are allowed to authenticate.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.email.domains` {#opt-services.oauth2-proxy.email.domains}

Authenticate emails with the specified domains. Use
`*` to authenticate any email.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.enable` {#opt-services.oauth2-proxy.enable}

Whether to enable oauth2-proxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.extraConfig` {#opt-services.oauth2-proxy.extraConfig}

Extra config to pass to oauth2-proxy.

*Type:* attribute set of anything

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.github.org` {#opt-services.oauth2-proxy.github.org}

Restrict logins to members of this organisation.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.github.team` {#opt-services.oauth2-proxy.github.team}

Restrict logins to members of this team.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.google.adminEmail` {#opt-services.oauth2-proxy.google.adminEmail}

The Google Admin to impersonate for API calls.

Only users with access to the Admin APIs can access the Admin SDK
Directory API, thus the service account needs to impersonate one of
those users to access the Admin SDK Directory API.

See [https://developers.google.com/admin-sdk/directory/v1/guides/delegation#delegate\_domain-wide\_authority\_to\_your\_service\_account](https://developers.google.com/admin-sdk/directory/v1/guides/delegation#delegate_domain-wide_authority_to_your_service_account).

*Type:* string

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.google.groups` {#opt-services.oauth2-proxy.google.groups}

Restrict logins to members of these Google groups.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.google.serviceAccountJSON` {#opt-services.oauth2-proxy.google.serviceAccountJSON}

The path to the service account JSON credentials.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.htpasswd.displayForm` {#opt-services.oauth2-proxy.htpasswd.displayForm}

Display username / password login form if an htpasswd file is provided.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.htpasswd.file` {#opt-services.oauth2-proxy.htpasswd.file}

Additionally authenticate against a htpasswd file. Entries must be
created with `htpasswd -s` for SHA encryption.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.httpAddress` {#opt-services.oauth2-proxy.httpAddress}

HTTPS listening address.  This module does not expose the port by
default. If you want this URL to be accessible to other machines, please
add the port to `networking.firewall.allowedTCPPorts`.

*Type:* string

*Default:* `"http://127.0.0.1:4180"`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.keyFile` {#opt-services.oauth2-proxy.keyFile}

oauth2-proxy allows passing sensitive configuration via environment variables.
Make a file that contains lines like
OAUTH2\_PROXY\_CLIENT\_SECRET=asdfasdfasdf.apps.googleuserscontent.com
and specify the path here.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/oauth2-proxy"`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.loginURL` {#opt-services.oauth2-proxy.loginURL}

Authentication endpoint.

You only need to set this if you are using a self-hosted provider (e.g.
Github Enterprise). If you're using a publicly hosted provider
(e.g github.com), then the default works.

*Type:* null or string

*Default:* `null`

*Example:* `"https://provider.example.com/oauth/authorize"`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.nginx.domain` {#opt-services.oauth2-proxy.nginx.domain}

The domain under which the oauth2-proxy will be accesible and the path of cookies are set to.
This setting must be set to ensure back-redirects are working properly
if oauth2-proxy is configured with [`services.oauth2-proxy.cookie.domain`](#opt-services.oauth2-proxy.cookie.domain)
or multiple [`services.oauth2-proxy.nginx.virtualHosts`](#opt-services.oauth2-proxy.nginx.virtualHosts) that are not on the same domain.

*Type:* string

*Declared by:* [`nixos/modules/services/security/oauth2-proxy-nginx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy-nginx.nix)

## `services.oauth2-proxy.nginx.proxy` {#opt-services.oauth2-proxy.nginx.proxy}

The address of the reverse proxy endpoint for oauth2-proxy

*Type:* string

*Default:* `config.services.oauth2-proxy.httpAddress`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy-nginx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy-nginx.nix)

## `services.oauth2-proxy.nginx.virtualHosts` {#opt-services.oauth2-proxy.nginx.virtualHosts}

Nginx virtual hosts to put behind the oauth2 proxy.
You can exclude specific locations by setting `auth_request off;` in the locations extraConfig setting.

*Type:* (attribute set of (submodule)) or (list of string) convertible to it

*Default:* `{ }`

*Example:*

``` nix
{
  "protected.foo.com" = {
    allowed_emails = [
      "boss@foo.com"
    ];
    allowed_groups = [
      "admins"
    ];
  };
}
```

*Declared by:* [`nixos/modules/services/security/oauth2-proxy-nginx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy-nginx.nix)

## `services.oauth2-proxy.nginx.virtualHosts.<name>.allowed_email_domains` {#opt-services.oauth2-proxy.nginx.virtualHosts._name_.allowed_email_domains}

List of email domains to allow access to this vhost, or null to allow all.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy-nginx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy-nginx.nix)

## `services.oauth2-proxy.nginx.virtualHosts.<name>.allowed_emails` {#opt-services.oauth2-proxy.nginx.virtualHosts._name_.allowed_emails}

List of emails to allow access to this vhost, or null to allow all.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy-nginx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy-nginx.nix)

## `services.oauth2-proxy.nginx.virtualHosts.<name>.allowed_groups` {#opt-services.oauth2-proxy.nginx.virtualHosts._name_.allowed_groups}

List of groups to allow access to this vhost, or null to allow all.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy-nginx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy-nginx.nix)

## `services.oauth2-proxy.oidcIssuerUrl` {#opt-services.oauth2-proxy.oidcIssuerUrl}

The OAuth issuer URL.

*Type:* null or string

*Default:* `null`

*Example:* `"https://login.microsoftonline.com/{TENANT_ID}/v2.0"`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.package` {#opt-services.oauth2-proxy.package}

The oauth2-proxy package to use.

*Type:* package

*Default:* `pkgs.oauth2-proxy`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.passAccessToken` {#opt-services.oauth2-proxy.passAccessToken}

Pass OAuth access\_token to upstream via X-Forwarded-Access-Token header.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.passBasicAuth` {#opt-services.oauth2-proxy.passBasicAuth}

Pass HTTP Basic Auth, X-Forwarded-User and X-Forwarded-Email information to upstream.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.passHostHeader` {#opt-services.oauth2-proxy.passHostHeader}

Pass the request Host Header to upstream.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.profileURL` {#opt-services.oauth2-proxy.profileURL}

Profile access endpoint.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.provider` {#opt-services.oauth2-proxy.provider}

OAuth provider.

*Type:* one of "adfs", "azure", "bitbucket", "digitalocean", "facebook", "github", "gitlab", "google", "keycloak", "keycloak-oidc", "linkedin", "login.gov", "nextcloud", "oidc"

*Default:* `"google"`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.proxyPrefix` {#opt-services.oauth2-proxy.proxyPrefix}

The url root path that this proxy should be nested under.

*Type:* string

*Default:* `"/oauth2"`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.redeemURL` {#opt-services.oauth2-proxy.redeemURL}

Token redemption endpoint.

You only need to set this if you are using a self-hosted provider (e.g.
Github Enterprise). If you're using a publicly hosted provider
(e.g github.com), then the default works.

*Type:* null or string

*Default:* `null`

*Example:* `"https://provider.example.com/oauth/token"`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.redirectURL` {#opt-services.oauth2-proxy.redirectURL}

The OAuth2 redirect URL.

*Type:* null or string

*Default:* `null`

*Example:* `"https://internalapp.yourcompany.com/oauth2/callback"`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.requestLogging` {#opt-services.oauth2-proxy.requestLogging}

Log requests to stdout.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.reverseProxy` {#opt-services.oauth2-proxy.reverseProxy}

In case when running behind a reverse proxy, controls whether headers
like `X-Real-Ip` are accepted. Usage behind a reverse
proxy will require this flag to be set to avoid logging the reverse
proxy IP address.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.scope` {#opt-services.oauth2-proxy.scope}

OAuth scope specification.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.setXauthrequest` {#opt-services.oauth2-proxy.setXauthrequest}

Set X-Auth-Request-User and X-Auth-Request-Email response headers (useful in Nginx auth\_request mode). Setting this to 'null' means using the upstream default (false).

*Type:* null or boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.signatureKey` {#opt-services.oauth2-proxy.signatureKey}

GAP-Signature request signature key.

*Type:* null or string

*Default:* `null`

*Example:* `"sha1:secret0"`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.skipAuthRegexes` {#opt-services.oauth2-proxy.skipAuthRegexes}

Skip authentication for requests matching any of these regular
expressions.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.tls.certificate` {#opt-services.oauth2-proxy.tls.certificate}

Path to certificate file.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.tls.enable` {#opt-services.oauth2-proxy.tls.enable}

Whether to serve over TLS.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.tls.httpsAddress` {#opt-services.oauth2-proxy.tls.httpsAddress}

`addr:port` to listen on for HTTPS clients.

Remember to add `port` to
`allowedTCPPorts` if you want other machines to be
able to connect to it.

*Type:* string

*Default:* `":443"`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.tls.key` {#opt-services.oauth2-proxy.tls.key}

Path to private key file.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.trustedProxyIP` {#opt-services.oauth2-proxy.trustedProxyIP}

List of IPs or CIDR ranges allowed to supply X-Forwarded-\* headers when reverseProxy is enabled.
If not set, OAuth2 Proxy preserves backwards compatibility by trusting all source IPs (0.0.0.0/0, ::/0) and logs a warning at startup.
Configure this to your reverse proxy addresses to prevent forwarded header spoofing.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.upstream` {#opt-services.oauth2-proxy.upstream}

The http url(s) of the upstream endpoint or `file://`
paths for static files. Routing is based on the path.

*Type:* (list of string) or string convertible to it

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.oauth2-proxy.validateURL` {#opt-services.oauth2-proxy.validateURL}

Access token validation endpoint.

You only need to set this if you are using a self-hosted provider (e.g.
Github Enterprise). If you're using a publicly hosted provider
(e.g github.com), then the default works.

*Type:* null or string

*Default:* `null`

*Example:* `"https://provider.example.com/user/emails"`

*Declared by:* [`nixos/modules/services/security/oauth2-proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/oauth2-proxy.nix)

## `services.ocis.address` {#opt-services.ocis.address}

Web interface address.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/ocis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ocis.nix)

## `services.ocis.configDir` {#opt-services.ocis.configDir}

Path to directory containing oCIS config file.

Example config can be generated by `ocis init --config-path fileName --admin-password "adminPass"`.
Add `--insecure true` if SSL certificates are generated and managed externally (e.g. using oCIS behind reverse proxy).

Note: This directory must contain at least a `ocis.yaml`. Ensure
[user](#opt-services.ocis.user) has read/write access to it. In some
circumstances you may need to add additional oCIS configuration files (e.g.,
`proxy.yaml`) to this directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/ocis/config"`

*Declared by:* [`nixos/modules/services/web-apps/ocis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ocis.nix)

## `services.ocis.enable` {#opt-services.ocis.enable}

Whether to enable ownCloud Infinite Scale.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/ocis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ocis.nix)

## `services.ocis.environment` {#opt-services.ocis.environment}

Extra config options.

See [the documentation](https://doc.owncloud.com/ocis/next/deployment/services/services.html) for available options.
See [notes for environment variables](https://doc.owncloud.com/ocis/next/deployment/services/env-var-note.html) for more information.

Note that all the attributes here will be copied to /nix/store/ and will be world readable. Options like \*\_PASSWORD or \*\_SECRET should be part of     [environmentFile](#opt-services.ocis.environmentFile) instead, and are only provided here for illustrative purpose.

Configuration here will override those from [environmentFile](#opt-services.ocis.environmentFile) and will have highest precedence, at the cost of security. Do NOT put security sensitive stuff here.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  CS3_ALLOW_INSECURE = "true";
  GATEWAY_STORAGE_USERS_MOUNT_ID = "123";
  GRAPH_APPLICATION_ID = "1234";
  IDM_IDPSVC_PASSWORD = "password";
  IDM_REVASVC_PASSWORD = "password";
  IDM_SVC_PASSWORD = "password";
  IDP_ISS = "https://localhost:9200";
  IDP_TLS = "false";
  OCIS_INSECURE = "false";
  OCIS_INSECURE_BACKENDS = "true";
  OCIS_JWT_SECRET = "super_secret";
  OCIS_LDAP_BIND_PASSWORD = "password";
  OCIS_LOG_LEVEL = "error";
  OCIS_MACHINE_AUTH_API_KEY = "foo";
  OCIS_MOUNT_ID = "123";
  OCIS_SERVICE_ACCOUNT_ID = "foo";
  OCIS_SERVICE_ACCOUNT_SECRET = "foo";
  OCIS_STORAGE_USERS_MOUNT_ID = "123";
  OCIS_SYSTEM_USER_API_KEY = "foo";
  OCIS_SYSTEM_USER_ID = "123";
  OCIS_TRANSFER_SECRET = "foo";
  STORAGE_USERS_MOUNT_ID = "123";
  TLS_INSECURE = "true";
  TLS_SKIP_VERIFY_CLIENT_CERT = "true";
  WEBDAV_ALLOW_INSECURE = "true";
}
```

*Declared by:* [`nixos/modules/services/web-apps/ocis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ocis.nix)

## `services.ocis.environmentFile` {#opt-services.ocis.environmentFile}

An environment file as defined in `systemd.exec(5)`.

Configuration provided in this file will override those from [configDir](#opt-services.ocis.configDir)/ocis.yaml.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/ocis.env"`

*Declared by:* [`nixos/modules/services/web-apps/ocis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ocis.nix)

## `services.ocis.group` {#opt-services.ocis.group}

The group to run oCIS under.
By default, a group named `ocis` will be created.

*Type:* string

*Default:* `"ocis"`

*Example:* `"yourGroup"`

*Declared by:* [`nixos/modules/services/web-apps/ocis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ocis.nix)

## `services.ocis.package` {#opt-services.ocis.package}

Which package to use for the ownCloud Infinite Scale instance.

*Type:* package

*Related packages:*

- [`pkgs.ocis_5-bin`](https://search.nixos.org/packages?show=ocis_5-bin&sort=relevance&query=ocis_5-bin)

*Declared by:* [`nixos/modules/services/web-apps/ocis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ocis.nix)

## `services.ocis.port` {#opt-services.ocis.port}

Web interface port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9200`

*Declared by:* [`nixos/modules/services/web-apps/ocis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ocis.nix)

## `services.ocis.stateDir` {#opt-services.ocis.stateDir}

ownCloud data directory.

*Type:* string

*Default:* `"/var/lib/ocis"`

*Declared by:* [`nixos/modules/services/web-apps/ocis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ocis.nix)

## `services.ocis.url` {#opt-services.ocis.url}

Web interface address.

*Type:* string

*Default:* `"https://localhost:9200"`

*Example:* `"https://some-hostname-or-ip:9200"`

*Declared by:* [`nixos/modules/services/web-apps/ocis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ocis.nix)

## `services.ocis.user` {#opt-services.ocis.user}

The user to run oCIS as.
By default, a user named `ocis` will be created whose home
directory is [stateDir](#opt-services.ocis.stateDir).

*Type:* string

*Default:* `"ocis"`

*Example:* `"yourUser"`

*Declared by:* [`nixos/modules/services/web-apps/ocis.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ocis.nix)

## `services.ocserv.config` {#opt-services.ocserv.config}

Configuration content to start an OCServ server.

For a full configuration reference,please refer to the online documentation
(https://ocserv.gitlab.io/www/manual.html), the openconnect
recipes (https://github.com/openconnect/recipes) or `man ocserv`.

*Type:* strings concatenated with "\\n"

*Example:*

``` nix
''
  # configuration examples from $out/doc without explanatory comments.
  # for a full reference please look at the installed man pages.
  auth = "plain[passwd=./sample.passwd]"
  tcp-port = 443
  udp-port = 443
  run-as-user = ocserv
  run-as-group = ocserv
  socket-file = /run/ocserv-socket
  server-cert = certs/server-cert.pem
  server-key = certs/server-key.pem
  keepalive = 32400
  dpd = 90
  mobile-dpd = 1800
  switch-to-tcp-timeout = 25
  try-mtu-discovery = false
  cert-user-oid = 0.9.2342.19200300.100.1.1
  tls-priorities = "NORMAL:%SERVER_PRECEDENCE:%COMPAT:-VERS-SSL3.0"
  auth-timeout = 240
  min-reauth-time = 300
  max-ban-score = 80
  ban-reset-time = 1200
  cookie-timeout = 300
  deny-roaming = false
  rekey-time = 172800
  rekey-method = ssl
  use-occtl = true
  pid-file = /run/ocserv.pid
  device = vpns
  predictable-ips = true
  default-domain = example.com
  ipv4-network = 192.168.1.0
  ipv4-netmask = 255.255.255.0
  dns = 192.168.1.2
  ping-leases = false
  route = 10.10.10.0/255.255.255.0
  route = 192.168.0.0/255.255.0.0
  no-route = 192.168.5.0/255.255.255.0
  cisco-client-compat = true
  dtls-legacy = true
  
  [vhost:www.example.com]
  auth = "certificate"
  ca-cert = certs/ca.pem
  server-cert = certs/server-cert-secp521r1.pem
  server-key = cersts/certs/server-key-secp521r1.pem
  ipv4-network = 192.168.2.0
  ipv4-netmask = 255.255.255.0
  cert-user-oid = 0.9.2342.19200300.100.1.1
''
```

*Declared by:* [`nixos/modules/services/networking/ocserv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ocserv.nix)

## `services.ocserv.enable` {#opt-services.ocserv.enable}

Whether to enable ocserv.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ocserv.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ocserv.nix)

## `services.ocsinventory-agent.enable` {#opt-services.ocsinventory-agent.enable}

Whether to enable OCS Inventory Agent.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/ocsinventory-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ocsinventory-agent.nix)

## `services.ocsinventory-agent.interval` {#opt-services.ocsinventory-agent.interval}

How often we run the ocsinventory-agent service. Runs by default every daily.

The format is described in
`systemd.time(7)`.

*Type:* string

*Default:* `"daily"`

*Example:* `"06:00"`

*Declared by:* [`nixos/modules/services/monitoring/ocsinventory-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ocsinventory-agent.nix)

## `services.ocsinventory-agent.package` {#opt-services.ocsinventory-agent.package}

The ocsinventory-agent package to use.

*Type:* package

*Default:* `pkgs.ocsinventory-agent`

*Declared by:* [`nixos/modules/services/monitoring/ocsinventory-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ocsinventory-agent.nix)

## `services.ocsinventory-agent.settings` {#opt-services.ocsinventory-agent.settings}

Configuration for /etc/ocsinventory-agent/ocsinventory-agent.cfg.

Refer to
`ocsinventory-agent(1)` for available options.

*Type:* open submodule of (atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  debug = true;
  server = "https://ocsinventory.localhost:8080/ocsinventory";
  tag = "01234567890123";
}
```

*Declared by:* [`nixos/modules/services/monitoring/ocsinventory-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ocsinventory-agent.nix)

## `services.ocsinventory-agent.settings.ca` {#opt-services.ocsinventory-agent.settings.ca}

Path to CA certificates file in PEM format, for server
SSL certificate validation.

*Type:* absolute path

*Default:* `config.security.pki.caBundle`

*Declared by:* [`nixos/modules/services/monitoring/ocsinventory-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ocsinventory-agent.nix)

## `services.ocsinventory-agent.settings.debug` {#opt-services.ocsinventory-agent.settings.debug}

Whether to enable debug mode.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/ocsinventory-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ocsinventory-agent.nix)

## `services.ocsinventory-agent.settings.local` {#opt-services.ocsinventory-agent.settings.local}

If specified, the OCS Inventory Agent will run in offline mode
and the resulting inventory file will be stored in the specified path.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/ocsinventory-agent/reports"`

*Declared by:* [`nixos/modules/services/monitoring/ocsinventory-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ocsinventory-agent.nix)

## `services.ocsinventory-agent.settings.server` {#opt-services.ocsinventory-agent.settings.server}

The URI of the OCS Inventory server where to send the inventory file.

This option is ignored if [`services.ocsinventory-agent.settings.local`](#opt-services.ocsinventory-agent.settings.local) is set.

*Type:* null or string

*Default:* `null`

*Example:* `"https://ocsinventory.localhost:8080/ocsinventory"`

*Declared by:* [`nixos/modules/services/monitoring/ocsinventory-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ocsinventory-agent.nix)

## `services.ocsinventory-agent.settings.tag` {#opt-services.ocsinventory-agent.settings.tag}

Tag for the generated inventory.

*Type:* null or string

*Default:* `null`

*Example:* `"01234567890123"`

*Declared by:* [`nixos/modules/services/monitoring/ocsinventory-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/ocsinventory-agent.nix)

## `services.octoprint.enable` {#opt-services.octoprint.enable}

Whether to enable OctoPrint, web interface for 3D printers.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/octoprint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/octoprint.nix)

## `services.octoprint.extraConfig` {#opt-services.octoprint.extraConfig}

Extra options which are added to OctoPrint's YAML configuration file.

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/octoprint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/octoprint.nix)

## `services.octoprint.group` {#opt-services.octoprint.group}

Group for the daemon.

*Type:* string

*Default:* `"octoprint"`

*Declared by:* [`nixos/modules/services/misc/octoprint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/octoprint.nix)

## `services.octoprint.host` {#opt-services.octoprint.host}

Host to bind OctoPrint to.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/octoprint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/octoprint.nix)

## `services.octoprint.openFirewall` {#opt-services.octoprint.openFirewall}

Open ports in the firewall for OctoPrint.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/octoprint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/octoprint.nix)

## `services.octoprint.package` {#opt-services.octoprint.package}

The octoprint package to use.

*Type:* package

*Default:* `pkgs.octoprint`

*Declared by:* [`nixos/modules/services/misc/octoprint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/octoprint.nix)

## `services.octoprint.plugins` {#opt-services.octoprint.plugins}

Additional plugins to be used. Available plugins are passed through the plugins input.

*Type:* function that evaluates to a(n) list of package

*Default:* `plugins: []`

*Example:* `plugins: with plugins; [ themeify stlviewer ]`

*Declared by:* [`nixos/modules/services/misc/octoprint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/octoprint.nix)

## `services.octoprint.port` {#opt-services.octoprint.port}

Port to bind OctoPrint to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5000`

*Declared by:* [`nixos/modules/services/misc/octoprint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/octoprint.nix)

## `services.octoprint.stateDir` {#opt-services.octoprint.stateDir}

State directory of the daemon.

*Type:* absolute path

*Default:* `"/var/lib/octoprint"`

*Declared by:* [`nixos/modules/services/misc/octoprint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/octoprint.nix)

## `services.octoprint.user` {#opt-services.octoprint.user}

User for the daemon.

*Type:* string

*Default:* `"octoprint"`

*Declared by:* [`nixos/modules/services/misc/octoprint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/octoprint.nix)

## `services.odhcpd.enable` {#opt-services.odhcpd.enable}

Whether to enable odhcpd, the OpenWrt DHCP, DHCPv6 and router advertisement server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/odhcpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/odhcpd.nix)

## `services.odhcpd.openFirewall` {#opt-services.odhcpd.openFirewall}

Whether to open UDP ports 67 (DHCPv4) and 547 (DHCPv6) in the firewall,
on the interfaces named by the `ifname` (or `networkid`) of each `dhcp` section.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/odhcpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/odhcpd.nix)

## `services.odhcpd.package` {#opt-services.odhcpd.package}

The odhcpd package to use.

*Type:* package

*Default:* `pkgs.odhcpd`

*Declared by:* [`nixos/modules/services/networking/odhcpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/odhcpd.nix)

## `services.odhcpd.settings` {#opt-services.odhcpd.settings}

odhcpd configuration, written to the `dhcp` file in UCI format.
See [https://github.com/openwrt/odhcpd#configuration](https://github.com/openwrt/odhcpd#configuration) for the available options.

*Type:* open submodule of UCI configuration (section type, then section name, then options)

*Default:* `{ }`

*Example:*

``` nix
{
  dhcp = {
    lan = {
      dhcpv4 = "disabled";
      dhcpv6 = "disabled";
      dns = [
        "fd00::53"
      ];
      ifname = "br0";
      ra = "server";
      ra_flags = [
        "none"
      ];
    };
  };
}
```

*Declared by:* [`nixos/modules/services/networking/odhcpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/odhcpd.nix)

## `services.odoo.addons` {#opt-services.odoo.addons}

Odoo addons.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.odoo_enterprise ]`

*Declared by:* [`nixos/modules/services/finance/odoo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/odoo.nix)

## `services.odoo.autoInit` {#opt-services.odoo.autoInit}

Whether to enable automatically initialize the DB.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/finance/odoo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/odoo.nix)

## `services.odoo.autoInitExtraFlags` {#opt-services.odoo.autoInitExtraFlags}

Extra flags passed to odoo when run for the first time by autoInit

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[ "--without-demo=all" ]
```

*Declared by:* [`nixos/modules/services/finance/odoo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/odoo.nix)

## `services.odoo.domain` {#opt-services.odoo.domain}

Domain to host Odoo with nginx

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/finance/odoo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/odoo.nix)

## `services.odoo.enable` {#opt-services.odoo.enable}

Whether to enable odoo, an open source ERP and CRM system.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/finance/odoo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/odoo.nix)

## `services.odoo.package` {#opt-services.odoo.package}

Which package to use for the Odoo instance.

*Type:* package

*Related packages:*

- [`pkgs.odoo17`](https://search.nixos.org/packages?show=odoo17&sort=relevance&query=odoo17)
- [`pkgs.odoo18`](https://search.nixos.org/packages?show=odoo18&sort=relevance&query=odoo18)
- [`pkgs.odoo19`](https://search.nixos.org/packages?show=odoo19&sort=relevance&query=odoo19)

*Declared by:* [`nixos/modules/services/finance/odoo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/odoo.nix)

## `services.odoo.settings` {#opt-services.odoo.settings}

Odoo configuration settings. For more details see [https://www.odoo.com/documentation/15.0/administration/install/deploy.html](https://www.odoo.com/documentation/15.0/administration/install/deploy.html)

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
options = {
  db_user = "odoo";
  db_password="odoo";
};
```

*Declared by:* [`nixos/modules/services/finance/odoo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/odoo.nix)

## `services.odoo.settings.options.proxy_mode` {#opt-services.odoo.settings.options.proxy_mode}

Enables the use of X-Forwarded-\* headers through Werkzeug’s proxy support. Must be enabled if reverse proxy is used.

*Type:* boolean

*Default:* `"services.odoo.domain != null"`

*Declared by:* [`nixos/modules/services/finance/odoo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/odoo.nix)

## `services.odoo.settings.options.workers` {#opt-services.odoo.settings.options.workers}

Values above 0 will enable the multi-processing HTTP server, this should be set for production setups. This needs to be set to \>0 for real-time connections in the discuss app. For configuration recommendations see [https://www.odoo.com/documentation/19.0/administration/on\_premise/deploy.html#builtin-server](https://www.odoo.com/documentation/19.0/administration/on_premise/deploy.html#builtin-server)

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Declared by:* [`nixos/modules/services/finance/odoo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/odoo.nix)

## `services.offlineimap.enable` {#opt-services.offlineimap.enable}

Whether to enable OfflineIMAP, a software to dispose your mailbox(es) as a local Maildir(s).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/offlineimap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/offlineimap.nix)

## `services.offlineimap.install` {#opt-services.offlineimap.install}

Whether to install a user service for Offlineimap. Once
the service is started, emails will be fetched automatically.

The service must be manually started for each user with
"systemctl --user start offlineimap" or globally through
`services.offlineimap.enable`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/mail/offlineimap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/offlineimap.nix)

## `services.offlineimap.onCalendar` {#opt-services.offlineimap.onCalendar}

How often is offlineimap started. Default is '\*:0/3' meaning every 3 minutes. See `systemd.time(7)` for more information about the format.

*Type:* string

*Default:* `"*:0/3"`

*Declared by:* [`nixos/modules/services/mail/offlineimap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/offlineimap.nix)

## `services.offlineimap.package` {#opt-services.offlineimap.package}

The offlineimap package to use.

*Type:* package

*Default:* `pkgs.offlineimap`

*Declared by:* [`nixos/modules/services/mail/offlineimap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/offlineimap.nix)

## `services.offlineimap.path` {#opt-services.offlineimap.path}

List of derivations to put in Offlineimap's path.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:* `[ pkgs.pass pkgs.bash pkgs.notmuch ]`

*Declared by:* [`nixos/modules/services/mail/offlineimap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/offlineimap.nix)

## `services.offlineimap.timeoutStartSec` {#opt-services.offlineimap.timeoutStartSec}

How long waiting for offlineimap before killing it. Default is '120sec' meaning every 2 minutes. See `systemd.time(7)` for more information about the format.

*Type:* string

*Default:* `"120sec"`

*Declared by:* [`nixos/modules/services/mail/offlineimap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/offlineimap.nix)

## `services.ofono.enable` {#opt-services.ofono.enable}

Whether to enable Ofono.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ofono.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ofono.nix)

## `services.ofono.plugins` {#opt-services.ofono.plugins}

The list of plugins to install.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.modem-manager-gui ]`

*Declared by:* [`nixos/modules/services/networking/ofono.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ofono.nix)

## `services.oidentd.enable` {#opt-services.oidentd.enable}

Whether to enable ‘oidentd’, an implementation of the Ident
protocol (RFC 1413).  It allows remote systems to identify the
name of the user associated with a TCP connection.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/oidentd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/oidentd.nix)

## `services.oink.apiKeyFile` {#opt-services.oink.apiKeyFile}

Path to a file containing the API key to use when modifying DNS records.

*Type:* absolute path

*Example:* `"/run/keys/oink-api-key"`

*Declared by:* [`nixos/modules/services/networking/oink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/oink.nix)

## `services.oink.domains` {#opt-services.oink.domains}

List of attribute sets containing configuration for each domain.

Each attribute set must have two attributes, one named *domain*
and another named *subdomain*. The domain attribute must specify
the root domain that you want to configure, and the subdomain
attribute must specify its subdomain if any. If you want to
configure the root domain rather than a subdomain, leave the
subdomain attribute as an empty string.

Additionally, you can use attributes from *services.oink.settings*
to override settings per-domain.

Every domain listed here *must* have API access enabled in
Porkbun's control panel.

*Type:* list of attribute set of anything

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    domain = "nixos.org";
    subdomain = "";
    ttl = 1200;
  }
  {
    domain = "nixos.org";
    subdomain = "hydra";
  }
]
```

*Declared by:* [`nixos/modules/services/networking/oink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/oink.nix)

## `services.oink.enable` {#opt-services.oink.enable}

Whether to enable Oink, a dynamic DNS client for Porkbun.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/oink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/oink.nix)

## `services.oink.package` {#opt-services.oink.package}

The oink package to use.

*Type:* package

*Default:* `pkgs.oink`

*Declared by:* [`nixos/modules/services/networking/oink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/oink.nix)

## `services.oink.secretApiKeyFile` {#opt-services.oink.secretApiKeyFile}

Path to a file containing the secret API key to use when modifying DNS records.

*Type:* absolute path

*Example:* `"/run/keys/oink-secret-api-key"`

*Declared by:* [`nixos/modules/services/networking/oink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/oink.nix)

## `services.oink.settings.interval` {#opt-services.oink.settings.interval}

Seconds to wait before sending another request.

*Type:* integer between 60 and 172800 (both inclusive)

*Default:* `900`

*Declared by:* [`nixos/modules/services/networking/oink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/oink.nix)

## `services.oink.settings.ttl` {#opt-services.oink.settings.ttl}

The TTL ("Time to Live") value to set for your DNS records.

The TTL controls how long in seconds your records will be cached
for. A smaller value will allow the record to update quicker.

*Type:* integer between 600 and 172800 (both inclusive)

*Default:* `600`

*Declared by:* [`nixos/modules/services/networking/oink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/oink.nix)

## `services.olivetin.enable` {#opt-services.olivetin.enable}

Whether to enable OliveTin.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/olivetin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/olivetin.nix)

## `services.olivetin.extraConfigFiles` {#opt-services.olivetin.extraConfigFiles}

Config files to merge into the settings defined in [services (O)](#opt-services.olivetin.settings).
This is useful to avoid putting secrets into the nix store.
See [https://docs.olivetin.app/config.html](https://docs.olivetin.app/config.html) for more information.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/run/secrets/olivetin.yaml"
]
```

*Declared by:* [`nixos/modules/services/web-apps/olivetin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/olivetin.nix)

## `services.olivetin.group` {#opt-services.olivetin.group}

The group under which OliveTin runs.

*Type:* string

*Default:* `"olivetin"`

*Declared by:* [`nixos/modules/services/web-apps/olivetin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/olivetin.nix)

## `services.olivetin.package` {#opt-services.olivetin.package}

The olivetin package to use.

*Type:* package

*Default:*

``` nix
if lib.versionAtLeast config.system.stateVersion "26.05"
then pkgs.olivetin-3k
else pkgs.olivetin
```

*Declared by:* [`nixos/modules/services/web-apps/olivetin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/olivetin.nix)

## `services.olivetin.path` {#opt-services.olivetin.path}

Packages added to the service's `PATH`.

*Type:* list of (package or string)

*Default:*

``` nix
with pkgs; [ bash ]
```

*Declared by:* [`nixos/modules/services/web-apps/olivetin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/olivetin.nix)

## `services.olivetin.settings` {#opt-services.olivetin.settings}

Configuration of OliveTin. See [https://docs.olivetin.app/config.html](https://docs.olivetin.app/config.html) for more information.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/olivetin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/olivetin.nix)

## `services.olivetin.settings.ListenAddressSingleHTTPFrontend` {#opt-services.olivetin.settings.ListenAddressSingleHTTPFrontend}

The address to listen on for the internal "microproxy" frontend.

*Type:* string

*Default:* `"127.0.0.1:8000"`

*Example:* `"0.0.0.0:8000"`

*Declared by:* [`nixos/modules/services/web-apps/olivetin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/olivetin.nix)

## `services.olivetin.user` {#opt-services.olivetin.user}

The user account under which OliveTin runs.

*Type:* string

*Default:* `"olivetin"`

*Declared by:* [`nixos/modules/services/web-apps/olivetin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/olivetin.nix)

## `services.ollama.enable` {#opt-services.ollama.enable}

Whether to enable ollama server for local large language models.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/ollama.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollama.nix)

## `services.ollama.environmentVariables` {#opt-services.ollama.environmentVariables}

Set arbitrary environment variables for the ollama service.

Be aware that these are only seen by the ollama server (systemd service),
not normal invocations like `ollama run`.
Since `ollama run` is mostly a shell around the ollama server, this is usually sufficient.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  HIP_VISIBLE_DEVICES = "0,1";
  OLLAMA_LLM_LIBRARY = "cpu";
}
```

*Declared by:* [`nixos/modules/services/misc/ollama.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollama.nix)

## `services.ollama.group` {#opt-services.ollama.group}

Group under which to run ollama. Only used when `services.ollama.user` is set.

The group will automatically be created, if this option is set to a non-null value.

*Type:* null or string

*Default:* `config.services.ollama.user`

*Example:* `"ollama"`

*Declared by:* [`nixos/modules/services/misc/ollama.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollama.nix)

## `services.ollama.home` {#opt-services.ollama.home}

The home directory that the ollama service is started in.

*Type:* string

*Default:* `"/var/lib/ollama"`

*Example:* `"/home/foo"`

*Declared by:* [`nixos/modules/services/misc/ollama.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollama.nix)

## `services.ollama.host` {#opt-services.ollama.host}

The host address which the ollama server HTTP interface listens to.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"[::]"`

*Declared by:* [`nixos/modules/services/misc/ollama.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollama.nix)

## `services.ollama.loadModels` {#opt-services.ollama.loadModels}

Download these models using `ollama pull` as soon as `ollama.service` has started.

This creates a systemd unit `ollama-model-loader.service`.
Use `services.ollama.syncModels` to automatically remove any models not currently declared here.

Search for models of your choice from: [https://ollama.com/library](https://ollama.com/library)

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "dolphin3"
  "gemma3"
  "gemma3:27b"
  "deepseek-r1:latest"
  "deepseek-r1:1.5b"
]
```

*Declared by:* [`nixos/modules/services/misc/ollama.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollama.nix)

## `services.ollama.modelsDir` {#opt-services.ollama.modelsDir}

The directory that the ollama service will read models from and download new models to.

*Type:* string

*Default:* `"\${config.services.ollama.home}/models"`

*Example:* `"/path/to/ollama/models"`

*Declared by:* [`nixos/modules/services/misc/ollama.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollama.nix)

## `services.ollama.openFirewall` {#opt-services.ollama.openFirewall}

Whether to open the firewall for ollama.

This adds `services.ollama.port` to `networking.firewall.allowedTCPPorts`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/ollama.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollama.nix)

## `services.ollama.package` {#opt-services.ollama.package}

The ollama package to use. Different packages use different hardware acceleration.

- `ollama`: default behavior; usually equivalent to `ollama-cpu`
  - if `nixpkgs.config.rocmSupport` is enabled, is equivalent to `ollama-rocm`
  - if `nixpkgs.config.cudaSupport` is enabled, is equivalent to `ollama-cuda`
  - otherwise defaults to `ollama-cpu`
- `ollama-cpu`: disable GPU; only use CPU
- `ollama-rocm`: supported by most modern AMD GPUs
  - may require overriding gpu type with `services.ollama.rocmOverrideGfx`
    if rocm doesn't detect your AMD gpu
- `ollama-cuda`: supported by most modern NVIDIA GPUs
- `ollama-vulkan`: supported by most GPUs

*Type:* package

*Default:* `pkgs.ollama`

*Example:* `pkgs.ollama-rocm`

*Declared by:* [`nixos/modules/services/misc/ollama.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollama.nix)

## `services.ollama.port` {#opt-services.ollama.port}

Which port the ollama server listens to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `11434`

*Example:* `11111`

*Declared by:* [`nixos/modules/services/misc/ollama.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollama.nix)

## `services.ollama.rocmOverrideGfx` {#opt-services.ollama.rocmOverrideGfx}

Override what rocm will detect your gpu model as.
For example, if you have an RX 5700 XT, try setting this to `"10.1.0"` (gfx 1010).

This sets the value of `HSA_OVERRIDE_GFX_VERSION`. See [ollama's docs](https://github.com/ollama/ollama/blob/main/docs/gpu.md#amd-radeon) for details.

*Type:* null or string

*Default:* `null`

*Example:* `"10.3.0"`

*Declared by:* [`nixos/modules/services/misc/ollama.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollama.nix)

## `services.ollama.syncModels` {#opt-services.ollama.syncModels}

Synchronize all currently installed models with those declared in `services.ollama.loadModels`,
removing any models that are installed but not currently declared there.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/ollama.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollama.nix)

## `services.ollama.user` {#opt-services.ollama.user}

User account under which to run ollama. Defaults to [`DynamicUser`](https://www.freedesktop.org/software/systemd/man/latest/systemd.exec.html#DynamicUser=)
when set to `null`.

The user will automatically be created, if this option is set to a non-null value.

*Type:* null or string

*Default:* `null`

*Example:* `"ollama"`

*Declared by:* [`nixos/modules/services/misc/ollama.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollama.nix)

## `services.ollaya.enable` {#opt-services.ollaya.enable}

Whether to enable ollaya server for local decision models.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/ollaya.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollaya.nix)

## `services.ollaya.group` {#opt-services.ollaya.group}

Group under which to run ollaya. Only used when `services.ollaya.user` is set.

*Type:* null or string

*Default:* `config.services.ollaya.user`

*Example:* `"ollaya"`

*Declared by:* [`nixos/modules/services/misc/ollaya.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollaya.nix)

## `services.ollaya.home` {#opt-services.ollaya.home}

The home directory that the ollaya service is started in.

*Type:* string

*Default:* `"/var/lib/ollaya"`

*Example:* `"/home/foo"`

*Declared by:* [`nixos/modules/services/misc/ollaya.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollaya.nix)

## `services.ollaya.host` {#opt-services.ollaya.host}

IP address on which the server listens.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/ollaya.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollaya.nix)

## `services.ollaya.loadModels` {#opt-services.ollaya.loadModels}

Models to download after the ollaya service starts. This creates a
separate `ollaya-model-loader.service`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "winnow:e4b"
]
```

*Declared by:* [`nixos/modules/services/misc/ollaya.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollaya.nix)

## `services.ollaya.modelsDir` {#opt-services.ollaya.modelsDir}

Directory where ollaya reads and stores downloaded models.

*Type:* string

*Default:* `${config.services.ollaya.home}/models`

*Example:* `"/path/to/ollaya/models"`

*Declared by:* [`nixos/modules/services/misc/ollaya.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollaya.nix)

## `services.ollaya.openFirewall` {#opt-services.ollaya.openFirewall}

Whether to open the firewall for ollaya. This adds
`services.ollaya.port` to `networking.firewall.allowedTCPPorts`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/ollaya.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollaya.nix)

## `services.ollaya.package` {#opt-services.ollaya.package}

The ollaya package to use.

*Type:* package

*Default:* `pkgs.ollaya`

*Declared by:* [`nixos/modules/services/misc/ollaya.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollaya.nix)

## `services.ollaya.port` {#opt-services.ollaya.port}

Port on which the server listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `11435`

*Example:* `11111`

*Declared by:* [`nixos/modules/services/misc/ollaya.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollaya.nix)

## `services.ollaya.settings` {#opt-services.ollaya.settings}

Environment variables passed to the ollaya server process.
See [https://ollaya.dev/docs/cli#ollaya-serve](https://ollaya.dev/docs/cli#ollaya-serve) for available variables.

*Type:* open submodule of attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  OLLAYA_DEVICE = "cuda";
  OLLAYA_KEEP_ALIVE = "30m";
}
```

*Declared by:* [`nixos/modules/services/misc/ollaya.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollaya.nix)

## `services.ollaya.user` {#opt-services.ollaya.user}

User account under which to run ollaya. Defaults to
[`DynamicUser`](https://www.freedesktop.org/software/systemd/man/latest/systemd.exec.html#DynamicUser=)
when set to `null`.

The user will automatically be created when this option is non-null.

*Type:* null or string

*Default:* `null`

*Example:* `"ollaya"`

*Declared by:* [`nixos/modules/services/misc/ollaya.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ollaya.nix)

## `services.omada.dataDir` {#opt-services.omada.dataDir}

The path where the Omada Software Controller stores all data. This path must
be in sync with the omada-software-controller package (where it is hardcoded
during the build in accordance with its own `dataDir` argument).

*Type:* absolute path

*Default:* `"/var/lib/omada"`

*Declared by:* [`nixos/modules/services/networking/omada.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/omada.nix)

## `services.omada.enable` {#opt-services.omada.enable}

Whether to enable Enable the Omada Software Controller service..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/omada.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/omada.nix)

## `services.omada.group` {#opt-services.omada.group}

Group under which the Omada Software Controller service runs.

*Type:* string

*Default:* `"omada"`

*Declared by:* [`nixos/modules/services/networking/omada.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/omada.nix)

## `services.omada.openFirewallDevicePorts` {#opt-services.omada.openFirewallDevicePorts}

Whether to open the firewall ports required for Omada devices to communicate
with the Omada Software Controller (discovery, adoption, management, etc.).
This includes the HTTPS ports 8043 and 8044 that adopted devices download
firmware images from; 8043 is also the web interface port.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/omada.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/omada.nix)

## `services.omada.openFirewallPortalPorts` {#opt-services.omada.openFirewallPortalPorts}

Whether to open the firewall ports of the captive portal (8088, 8843).
8088 is shared with the HTTP port of the web interface.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/omada.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/omada.nix)

## `services.omada.openFirewallWebPorts` {#opt-services.omada.openFirewallWebPorts}

Whether to open the firewall ports of the web interface (8043, 8088).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/omada.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/omada.nix)

## `services.omada.package` {#opt-services.omada.package}

The omada-software-controller package to use.

*Type:* package

*Default:* `pkgs.omada-software-controller`

*Declared by:* [`nixos/modules/services/networking/omada.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/omada.nix)

## `services.omada.user` {#opt-services.omada.user}

User under which the Omada Software Controller service runs.

*Type:* string

*Default:* `"omada"`

*Declared by:* [`nixos/modules/services/networking/omada.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/omada.nix)

## `services.ombi.dataDir` {#opt-services.ombi.dataDir}

The directory where Ombi stores its data files.

*Type:* string

*Default:* `"/var/lib/ombi"`

*Declared by:* [`nixos/modules/services/misc/ombi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ombi.nix)

## `services.ombi.enable` {#opt-services.ombi.enable}

Whether to enable Ombi, a web application that automatically gives your shared Plex or
Emby users the ability to request content by themselves!

Optionally see [https://docs.ombi.app/info/reverse-proxy](https://docs.ombi.app/info/reverse-proxy)
on how to set up a reverse proxy
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/ombi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ombi.nix)

## `services.ombi.group` {#opt-services.ombi.group}

Group under which Ombi runs.

*Type:* string

*Default:* `"ombi"`

*Declared by:* [`nixos/modules/services/misc/ombi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ombi.nix)

## `services.ombi.openFirewall` {#opt-services.ombi.openFirewall}

Open ports in the firewall for the Ombi web interface.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/ombi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ombi.nix)

## `services.ombi.package` {#opt-services.ombi.package}

The ombi package to use.

*Type:* package

*Default:* `pkgs.ombi`

*Declared by:* [`nixos/modules/services/misc/ombi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ombi.nix)

## `services.ombi.port` {#opt-services.ombi.port}

The port for the Ombi web interface.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5000`

*Declared by:* [`nixos/modules/services/misc/ombi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ombi.nix)

## `services.ombi.user` {#opt-services.ombi.user}

User account under which Ombi runs.

*Type:* string

*Default:* `"ombi"`

*Declared by:* [`nixos/modules/services/misc/ombi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/ombi.nix)

## `services.omniroute.enable` {#opt-services.omniroute.enable}

Whether to enable OmniRoute AI gateway.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/omniroute.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/omniroute.nix)

## `services.omniroute.environmentFiles` {#opt-services.omniroute.environmentFiles}

Additional files that are passed as environment variables.
Useful for secrets.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/omniroute.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/omniroute.nix)

## `services.omniroute.package` {#opt-services.omniroute.package}

The omniroute package to use.

*Type:* package

*Default:* `pkgs.omniroute`

*Declared by:* [`nixos/modules/services/web-apps/omniroute.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/omniroute.nix)

## `services.omniroute.settings` {#opt-services.omniroute.settings}

Freeform attribute where all environment variables that OmniRoute supports can be set.
A full list is found at [ENVIRONMENT.md](https://github.com/diegosouzapw/OmniRoute/blob/main/docs/reference/ENVIRONMENT.md)

*Type:* open submodule of attribute set of (null or ((string or absolute path or package) or (boolean or signed integer) convertible to it))

*Declared by:* [`nixos/modules/services/web-apps/omniroute.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/omniroute.nix)

## `services.omniroute.settings.OMNIROUTE_SHOW_LOG` {#opt-services.omniroute.settings.OMNIROUTE_SHOW_LOG}

Whether to expose the service logs to the system journal.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/omniroute.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/omniroute.nix)

## `services.omnom.dataDir` {#opt-services.omnom.dataDir}

The directory where Omnom stores its data files.

*Type:* absolute path

*Default:* `"/var/lib/omnom"`

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.enable` {#opt-services.omnom.enable}

Whether to enable Omnom, a webpage bookmarking and snapshotting service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.group` {#opt-services.omnom.group}

The Omnom service group.

*Type:* non-empty string

*Default:* `"omnom"`

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.openFirewall` {#opt-services.omnom.openFirewall}

Whether to open ports in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.package` {#opt-services.omnom.package}

The omnom package to use.

*Type:* package

*Default:* `pkgs.omnom`

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.passwordFile` {#opt-services.omnom.passwordFile}

File containing the password for the SMTP user.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.port` {#opt-services.omnom.port}

The Omnom service port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `7331`

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.settings` {#opt-services.omnom.settings}

Configuration options for the /etc/omnom/config.yml file.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.settings.activitypub.privkey` {#opt-services.omnom.settings.activitypub.privkey}

ActivityPub private key. Will be generated, by default.

*Type:* absolute path

*Default:*

``` nix
"${config.services.omnom.dataDir}/private.pem"
```

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.settings.activitypub.pubkey` {#opt-services.omnom.settings.activitypub.pubkey}

ActivityPub public key. Will be generated, by default.

*Type:* absolute path

*Default:*

``` nix
"${config.services.omnom.dataDir}/public.pem"
```

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.settings.app.debug` {#opt-services.omnom.settings.app.debug}

Whether to enable debug mode.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.settings.app.disable_signup` {#opt-services.omnom.settings.app.disable_signup}

Whether to enable restricting user creation.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.settings.app.results_per_page` {#opt-services.omnom.settings.app.results_per_page}

Number of results per page.

*Type:* signed integer

*Default:* `20`

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.settings.db.connection` {#opt-services.omnom.settings.db.connection}

Database connection URI.

*Type:* string

*Default:*

``` nix
"${config.services.omnom.dataDir}/db.sqlite3"
```

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.settings.db.type` {#opt-services.omnom.settings.db.type}

Database type.

*Type:* value "sqlite" (singular enum)

*Default:* `"sqlite"`

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.settings.server.address` {#opt-services.omnom.settings.server.address}

Server address.

*Type:* string

*Default:*

``` nix
"127.0.0.1:${config.services.omnom.port}"
```

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.settings.server.secure_cookie` {#opt-services.omnom.settings.server.secure_cookie}

Whether to limit cookies to a secure channel.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.settings.smtp.connection_timeout` {#opt-services.omnom.settings.smtp.connection_timeout}

Connection timeout duration in seconds.

*Type:* signed integer

*Default:* `5`

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.settings.smtp.host` {#opt-services.omnom.settings.smtp.host}

SMTP server hostname.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.settings.smtp.port` {#opt-services.omnom.settings.smtp.port}

SMTP server port address.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `25`

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.settings.smtp.send_timeout` {#opt-services.omnom.settings.smtp.send_timeout}

Send timeout duration in seconds.

*Type:* signed integer

*Default:* `10`

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.settings.smtp.sender` {#opt-services.omnom.settings.smtp.sender}

Omnom sender e-mail.

*Type:* string

*Default:* `"Omnom <omnom@127.0.0.1>"`

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.settings.smtp.tls` {#opt-services.omnom.settings.smtp.tls}

Whether to enable Whether TLS encryption should be used..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.settings.smtp.tls_allow_insecure` {#opt-services.omnom.settings.smtp.tls_allow_insecure}

Whether to enable Whether to allow insecure TLS..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.settings.storage.type` {#opt-services.omnom.settings.storage.type}

Storage type.

*Type:* string

*Default:* `"fs"`

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.omnom.user` {#opt-services.omnom.user}

The Omnom service user.

*Type:* non-empty string

*Default:* `"omnom"`

*Declared by:* [`nixos/modules/services/misc/omnom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/omnom.nix)

## `services.oncall.database.createLocally` {#opt-services.oncall.database.createLocally}

Whether to enable Create the database and database user locally..

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/oncall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/oncall.nix)

## `services.oncall.enable` {#opt-services.oncall.enable}

Whether to enable Oncall web app.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/oncall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/oncall.nix)

## `services.oncall.package` {#opt-services.oncall.package}

The oncall package to use.

*Type:* package

*Default:* `pkgs.oncall`

*Declared by:* [`nixos/modules/services/web-apps/oncall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/oncall.nix)

## `services.oncall.secretFile` {#opt-services.oncall.secretFile}

A YAML file containing secrets such as database or user passwords.
Some variables that can be considered secrets are:

- db.conn.kwargs.password:
  Password used to authenticate to the database.

- session.encrypt\_key:
  Key for encrypting/signing session cookies.
  Change to random long values in production.

- session.sign\_key:
  Key for encrypting/signing session cookies.
  Change to random long values in production.

*Type:* absolute path not in the Nix store

*Example:* `"/run/keys/oncall-dbpassword"`

*Declared by:* [`nixos/modules/services/web-apps/oncall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/oncall.nix)

## `services.oncall.settings` {#opt-services.oncall.settings}

Extra configuration options to append or override.
For available and default option values see
[upstream configuration file](https://github.com/linkedin/oncall/blob/master/configs/config.yaml)
and the administration part in the
[offical documentation](https://oncall.tools/docs/admin_guide.html).

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/oncall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/oncall.nix)

## `services.oncall.settings.db.conn.kwargs.database` {#opt-services.oncall.settings.db.conn.kwargs.database}

Database name.

*Type:* string

*Default:* `"oncall"`

*Declared by:* [`nixos/modules/services/web-apps/oncall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/oncall.nix)

## `services.oncall.settings.db.conn.kwargs.host` {#opt-services.oncall.settings.db.conn.kwargs.host}

Database host.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/oncall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/oncall.nix)

## `services.oncall.settings.db.conn.kwargs.user` {#opt-services.oncall.settings.db.conn.kwargs.user}

Database user.

*Type:* string

*Default:* `"oncall"`

*Declared by:* [`nixos/modules/services/web-apps/oncall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/oncall.nix)

## `services.oncall.settings.db.conn.require_auth` {#opt-services.oncall.settings.db.conn.require_auth}

Whether authentication is required to access the web app.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/oncall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/oncall.nix)

## `services.oncall.settings.db.conn.str` {#opt-services.oncall.settings.db.conn.str}

Database connection scheme. The default specifies the
connection through a local socket.

*Type:* string

*Default:* `"%(scheme)s://%(user)s@%(host)s:%(port)s/%(database)s?charset=%(charset)s&unix_socket=/run/mysqld/mysqld.sock"`

*Declared by:* [`nixos/modules/services/web-apps/oncall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/oncall.nix)

## `services.oncall.settings.oncall_host` {#opt-services.oncall.settings.oncall_host}

FQDN for the Oncall instance.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/oncall.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/oncall.nix)

## `services.onedrive.enable` {#opt-services.onedrive.enable}

Whether to enable OneDrive service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/onedrive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/onedrive.nix)

## `services.onedrive.package` {#opt-services.onedrive.package}

The onedrive package to use.

*Type:* package

*Default:* `pkgs.onedrive`

*Declared by:* [`nixos/modules/services/networking/onedrive.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/onedrive.nix)

## `services.onlyoffice.allowLocalConnections` {#opt-services.onlyoffice.allowLocalConnections}

Whether to allow the document server to download files from private IP addresses.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/onlyoffice.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/onlyoffice.nix)

## `services.onlyoffice.enable` {#opt-services.onlyoffice.enable}

Whether to enable OnlyOffice DocumentServer.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/onlyoffice.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/onlyoffice.nix)

## `services.onlyoffice.enableExampleServer` {#opt-services.onlyoffice.enableExampleServer}

Whether to enable OnlyOffice example server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/onlyoffice.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/onlyoffice.nix)

## `services.onlyoffice.examplePort` {#opt-services.onlyoffice.examplePort}

Port the OnlyOffice example server should listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/onlyoffice.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/onlyoffice.nix)

## `services.onlyoffice.hostname` {#opt-services.onlyoffice.hostname}

FQDN for the OnlyOffice instance.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/onlyoffice.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/onlyoffice.nix)

## `services.onlyoffice.jwtSecretFile` {#opt-services.onlyoffice.jwtSecretFile}

Path to a file that contains the secret to sign web requests using JSON Web Tokens.
If left at the default value null signing is disabled.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/onlyoffice.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/onlyoffice.nix)

## `services.onlyoffice.loglevel` {#opt-services.onlyoffice.loglevel}

Default loglevel to use for documentserver and converter

*Type:* string

*Default:* `"WARN"`

*Declared by:* [`nixos/modules/services/web-apps/onlyoffice.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/onlyoffice.nix)

## `services.onlyoffice.package` {#opt-services.onlyoffice.package}

The onlyoffice-documentserver package to use.

*Type:* package

*Default:* `pkgs.onlyoffice-documentserver`

*Declared by:* [`nixos/modules/services/web-apps/onlyoffice.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/onlyoffice.nix)

## `services.onlyoffice.port` {#opt-services.onlyoffice.port}

Port the OnlyOffice document server should listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8000`

*Declared by:* [`nixos/modules/services/web-apps/onlyoffice.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/onlyoffice.nix)

## `services.onlyoffice.postgresHost` {#opt-services.onlyoffice.postgresHost}

The Postgresql hostname or socket path OnlyOffice should connect to.

*Type:* string

*Default:* `"/run/postgresql"`

*Declared by:* [`nixos/modules/services/web-apps/onlyoffice.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/onlyoffice.nix)

## `services.onlyoffice.postgresName` {#opt-services.onlyoffice.postgresName}

The name of database OnlyOffice should use.

*Type:* string

*Default:* `"onlyoffice"`

*Declared by:* [`nixos/modules/services/web-apps/onlyoffice.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/onlyoffice.nix)

## `services.onlyoffice.postgresPasswordFile` {#opt-services.onlyoffice.postgresPasswordFile}

Path to a file that contains the password OnlyOffice should use to connect to Postgresql.
Unused when using socket authentication.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/onlyoffice.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/onlyoffice.nix)

## `services.onlyoffice.postgresUser` {#opt-services.onlyoffice.postgresUser}

The username OnlyOffice should use to connect to Postgresql.
Unused when using socket authentication.

*Type:* string

*Default:* `"onlyoffice"`

*Declared by:* [`nixos/modules/services/web-apps/onlyoffice.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/onlyoffice.nix)

## `services.onlyoffice.rabbitmqUrl` {#opt-services.onlyoffice.rabbitmqUrl}

The Rabbitmq in amqp URI style OnlyOffice should connect to.

*Type:* string

*Default:* `"amqp://guest:guest@localhost:5672"`

*Declared by:* [`nixos/modules/services/web-apps/onlyoffice.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/onlyoffice.nix)

## `services.onlyoffice.securityNonceFile` {#opt-services.onlyoffice.securityNonceFile}

File holding nginx configuration that sets the nonce used to create secret links.

Example:

```
set $secure_link_secret "changeme";
```

This file must be readable both by nginx and by the onlyoffice
documentserver. Since nginx is added to the onlyoffice group,
you may want to make the file readable to the onlyoffice group.

NOTE: The file must be a valid nginx configuration file. The secret must not contain `$` characters, as they will be interpreted as variables by nginx.

*Type:* string

*Example:* `"/run/keys/onlyoffice-nginx-nonce.conf"`

*Declared by:* [`nixos/modules/services/web-apps/onlyoffice.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/onlyoffice.nix)

## `services.onlyoffice.wopi` {#opt-services.onlyoffice.wopi}

Whether to enable Enable WOPI support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/onlyoffice.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/onlyoffice.nix)

## `services.onlyoffice.x2t` {#opt-services.onlyoffice.x2t}

The onlyoffice-documentserver.passthru.x2t package to use.

*Type:* package

*Default:* `pkgs."onlyoffice-documentserver.passthru.x2t"`

*Declared by:* [`nixos/modules/services/web-apps/onlyoffice.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/onlyoffice.nix)

## `services.oo7.enable` {#opt-services.oo7.enable}

Whether to enable oo7, a service providing the Secret Service D-Bus API
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/oo7.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/oo7.nix)

## `services.open-web-calendar.calendarSettings` {#opt-services.open-web-calendar.calendarSettings}

Configure the default calendar.

See the documentation options in [https://open-web-calendar.quelltext.eu/host/configure/#configuring-the-default-calendar](https://open-web-calendar.quelltext.eu/host/configure/#configuring-the-default-calendar) and [https://github.com/niccokunzmann/open-web-calendar/blob/master/open\_web\_calendar/default\_specification.yml](https://github.com/niccokunzmann/open-web-calendar/blob/master/open_web_calendar/default_specification.yml).

Individual calendar instances can be further configured outside this module, by specifying the `specification_url` parameter.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/open-web-calendar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/open-web-calendar.nix)

## `services.open-web-calendar.domain` {#opt-services.open-web-calendar.domain}

The domain under which open-web-calendar is made available

*Type:* string

*Example:* `"open-web-calendar.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/open-web-calendar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/open-web-calendar.nix)

## `services.open-web-calendar.enable` {#opt-services.open-web-calendar.enable}

Whether to enable OpenWebCalendar service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/open-web-calendar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/open-web-calendar.nix)

## `services.open-web-calendar.package` {#opt-services.open-web-calendar.package}

The open-web-calendar package to use.

*Type:* package

*Default:* `pkgs.open-web-calendar`

*Declared by:* [`nixos/modules/services/web-apps/open-web-calendar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/open-web-calendar.nix)

## `services.open-web-calendar.settings` {#opt-services.open-web-calendar.settings}

Configuration for the server. These are set as environment variables to the gunicorn/flask service.

See the documentation options in [https://open-web-calendar.quelltext.eu/host/configure/#configuring-the-server](https://open-web-calendar.quelltext.eu/host/configure/#configuring-the-server).

*Type:* open submodule of attribute set of (atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/open-web-calendar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/open-web-calendar.nix)

## `services.open-web-calendar.settings.ALLOWED_HOSTS` {#opt-services.open-web-calendar.settings.ALLOWED_HOSTS}

The hosts that the Open Web Calendar permits. This is required to
mitigate the Host Header Injection vulnerability.

We always set this to the empty list, as Nginx already checks the Host header.

*Type:* string

*Default:* `""`

*Read only*

*Declared by:* [`nixos/modules/services/web-apps/open-web-calendar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/open-web-calendar.nix)

## `services.open-webui.enable` {#opt-services.open-webui.enable}

Whether to enable Open-WebUI server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/open-webui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/open-webui.nix)

## `services.open-webui.environment` {#opt-services.open-webui.environment}

Extra environment variables for Open-WebUI.
For more details see [https://docs.openwebui.com/reference/env-configuration](https://docs.openwebui.com/reference/env-configuration)

*Type:* attribute set of string

*Default:*

``` nix
{
  ANONYMIZED_TELEMETRY = "False";
  DO_NOT_TRACK = "True";
  SCARF_NO_ANALYTICS = "True";
}
```

*Example:*

``` nix
''
  {
    OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";
    # Disable authentication
    WEBUI_AUTH = "False";
  }
''
```

*Declared by:* [`nixos/modules/services/misc/open-webui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/open-webui.nix)

## `services.open-webui.environmentFile` {#opt-services.open-webui.environmentFile}

Environment file to be passed to the systemd service.
Useful for passing secrets to the service to prevent them from being
world-readable in the Nix store.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/secrets/openWebuiSecrets"`

*Declared by:* [`nixos/modules/services/misc/open-webui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/open-webui.nix)

## `services.open-webui.host` {#opt-services.open-webui.host}

The host address which the Open-WebUI server HTTP interface listens to.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/open-webui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/open-webui.nix)

## `services.open-webui.openFirewall` {#opt-services.open-webui.openFirewall}

Whether to open the firewall for Open-WebUI.
This adds `services.open-webui.port` to `networking.firewall.allowedTCPPorts`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/open-webui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/open-webui.nix)

## `services.open-webui.package` {#opt-services.open-webui.package}

The open-webui package to use.

*Type:* package

*Default:* `pkgs.open-webui`

*Declared by:* [`nixos/modules/services/misc/open-webui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/open-webui.nix)

## `services.open-webui.port` {#opt-services.open-webui.port}

Which port the Open-WebUI server listens to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Example:* `11111`

*Declared by:* [`nixos/modules/services/misc/open-webui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/open-webui.nix)

## `services.open-webui.stateDir` {#opt-services.open-webui.stateDir}

State directory of Open-WebUI.

*Type:* absolute path

*Default:* `"/var/lib/open-webui"`

*Example:* `"/home/foo"`

*Declared by:* [`nixos/modules/services/misc/open-webui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/open-webui.nix)

## `services.openafsClient.afsdb` {#opt-services.openafsClient.afsdb}

Resolve cells via AFSDB DNS records.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/client.nix)

## `services.openafsClient.cache.blocks` {#opt-services.openafsClient.cache.blocks}

Cache size in 1KB blocks.

*Type:* signed integer

*Default:* `100000`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/client.nix)

## `services.openafsClient.cache.chunksize` {#opt-services.openafsClient.cache.chunksize}

Size of each cache chunk given in powers of
2. `0` resets the chunk size to its default
values (13 (8 KB) for memcache, 18-20 (256 KB to 1 MB) for
diskcache). Maximum value is 30. Important performance
parameter. Set to higher values when dealing with large files.

*Type:* integer between 0 and 30 (both inclusive)

*Default:* `0`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/client.nix)

## `services.openafsClient.cache.directory` {#opt-services.openafsClient.cache.directory}

Cache directory.

*Type:* string

*Default:* `"/var/cache/openafs"`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/client.nix)

## `services.openafsClient.cache.diskless` {#opt-services.openafsClient.cache.diskless}

Use in-memory cache for diskless machines. Has no real
performance benefit anymore.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/client.nix)

## `services.openafsClient.cellName` {#opt-services.openafsClient.cellName}

Cell name.

*Type:* string

*Default:* `""`

*Example:* `"grand.central.org"`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/client.nix)

## `services.openafsClient.cellServDB` {#opt-services.openafsClient.cellServDB}

This cell's database server records, added to the global
CellServDB. See `CellServDB(5)` man page for syntax. Ignored when
`afsdb` is set to `true`.

*Type:* (attribute set of list of (submodule)) or (list of anything) convertible to it

*Default:* `{ }`

*Example:*

``` nix
{
  "dns.fqdn.org" = [
    {
      dnsname = "first.afsdb.server.dns.fqdn.org";
      ip = "1.2.3.4";
    }
    {
      dnsname = "second.afsdb.server.dns.fqdn.org";
      ip = "2.3.4.5";
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/client.nix)

## `services.openafsClient.cellServDB.<name>.*.dnsname` {#opt-services.openafsClient.cellServDB._name_._.dnsname}

DNS full-qualified domain name of a database server

*Type:* string

*Default:* `""`

*Example:* `"afs.example.org"`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/client.nix)

## `services.openafsClient.cellServDB.<name>.*.ip` {#opt-services.openafsClient.cellServDB._name_._.ip}

IP Address of a database server

*Type:* string

*Default:* `""`

*Example:* `"1.2.3.4"`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/client.nix)

## `services.openafsClient.crypt` {#opt-services.openafsClient.crypt}

Whether to enable (weak) protocol encryption.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/client.nix)

## `services.openafsClient.daemons` {#opt-services.openafsClient.daemons}

Number of daemons to serve user requests. Numbers higher than 6
usually do no increase performance. Default is sufficient for up
to five concurrent users.

*Type:* signed integer

*Default:* `2`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/client.nix)

## `services.openafsClient.enable` {#opt-services.openafsClient.enable}

Whether to enable the OpenAFS client.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/client.nix)

## `services.openafsClient.fakestat` {#opt-services.openafsClient.fakestat}

Return fake data on stat() calls. If `true`,
always do so. If `false`, only do so for
cross-cell mounts (as these are potentially expensive).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/client.nix)

## `services.openafsClient.globalCellServDBFile` {#opt-services.openafsClient.globalCellServDBFile}

Global CellServDB file to be deployed. Set to `null` to only deploy the
cells in `cellServDB`. Any cells defined in `cellServDB` will override
cells in the global file.

*Type:* null or path in the Nix store

*Default:* `pkgs.openafs.cellservdb`

*Example:* `./CellServDB`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/client.nix)

## `services.openafsClient.inumcalc` {#opt-services.openafsClient.inumcalc}

Inode calculation method. `compat` is
computationally less expensive, but `md5` greatly
reduces the likelihood of inode collisions in larger scenarios
involving multiple cells mounted into one AFS space.

*Type:* string matching the pattern compat|md5

*Default:* `"compat"`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/client.nix)

## `services.openafsClient.mountPoint` {#opt-services.openafsClient.mountPoint}

Mountpoint of the AFS file tree, conventionally
`/afs`. When set to a different value, only
cross-cells that use the same value can be accessed.

*Type:* string

*Default:* `"/afs"`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/client.nix)

## `services.openafsClient.packages.module` {#opt-services.openafsClient.packages.module}

OpenAFS kernel module package. MUST match the userland package!

*Type:* package

*Default:* `config.boot.kernelPackages.openafs`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/client.nix)

## `services.openafsClient.packages.programs` {#opt-services.openafsClient.packages.programs}

OpenAFS programs package. MUST match the kernel module package!

*Type:* package

*Default:* `getBin pkgs.openafs`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/client.nix)

## `services.openafsClient.sparse` {#opt-services.openafsClient.sparse}

Minimal cell list in /afs.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/client.nix)

## `services.openafsClient.startDisconnected` {#opt-services.openafsClient.startDisconnected}

Start up in disconnected mode.  You need to execute
`fs disco online` (as root) to switch to
connected mode. Useful for roaming devices.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/client.nix)

## `services.openafsServer.advertisedAddresses` {#opt-services.openafsServer.advertisedAddresses}

List of IP addresses this server is advertised under. See `NetInfo(5)`

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.cellName` {#opt-services.openafsServer.cellName}

Cell name, this server will serve.

*Type:* string

*Default:* `""`

*Example:* `"grand.central.org"`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.cellServDB` {#opt-services.openafsServer.cellServDB}

Definition of all cell-local database server machines. If a single
list is provided, it will be used as the servers for `cellName`.

*Type:* (attribute set of list of (submodule)) or (list of anything) convertible to it

*Default:* `{ }`

*Example:*

``` nix
[
  {
    dnsname = "first.afsdb.server.dns.fqdn.org";
    ip = "1.2.3.4";
  }
  {
    dnsname = "second.afsdb.server.dns.fqdn.org";
    ip = "2.3.4.5";
  }
]
```

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.cellServDB.<name>.*.dnsname` {#opt-services.openafsServer.cellServDB._name_._.dnsname}

DNS full-qualified domain name of a database server

*Type:* string

*Default:* `""`

*Example:* `"afs.example.org"`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.cellServDB.<name>.*.ip` {#opt-services.openafsServer.cellServDB._name_._.ip}

IP Address of a database server

*Type:* string

*Default:* `""`

*Example:* `"1.2.3.4"`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.dottedPrincipals` {#opt-services.openafsServer.dottedPrincipals}

If enabled, allow principal names containing (.) dots. Enabling
this has security implications!

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.enable` {#opt-services.openafsServer.enable}

Whether to enable the OpenAFS server. An OpenAFS server needs a
complex setup. So, be aware that enabling this service and setting
some options does not give you a turn-key-ready solution. You need
at least a running Kerberos 5 setup, as OpenAFS relies on it for
authentication. See the Guide "QuickStartUnix" coming with
`pkgs.openafs.doc` for complete setup
instructions.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.package` {#opt-services.openafsServer.package}

The openafs package to use.

*Type:* package

*Default:* `pkgs.openafs`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.roles.backup.buserverArgs` {#opt-services.openafsServer.roles.backup.buserverArgs}

Arguments to the buserver process. See its man page.

*Type:* string

*Default:* `""`

*Example:* `"-p 8"`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.roles.backup.cellServDB` {#opt-services.openafsServer.roles.backup.cellServDB}

Definition of all cell-local backup database server machines.
Use this when your cell uses less backup database servers than
other database server machines.

*Type:* (attribute set of list of (submodule)) or (list of anything) convertible to it

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.roles.backup.cellServDB.<name>.*.dnsname` {#opt-services.openafsServer.roles.backup.cellServDB._name_._.dnsname}

DNS full-qualified domain name of a database server

*Type:* string

*Default:* `""`

*Example:* `"afs.example.org"`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.roles.backup.cellServDB.<name>.*.ip` {#opt-services.openafsServer.roles.backup.cellServDB._name_._.ip}

IP Address of a database server

*Type:* string

*Default:* `""`

*Example:* `"1.2.3.4"`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.roles.backup.enable` {#opt-services.openafsServer.roles.backup.enable}

Whether to enable the backup server role. When using OpenAFS built-in buserver, use in conjunction with the
`database` role to maintain the Backup
Database. Normally only used in conjunction with tape storage
or IBM's Tivoli Storage Manager.

For a modern backup server, enable this role and see
`enableFabs`
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.roles.backup.enableFabs` {#opt-services.openafsServer.roles.backup.enableFabs}

Whether to enable FABS, the flexible AFS backup system. It stores volumes as dump files, relying on other
pre-existing backup solutions for handling them
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.roles.backup.fabsArgs` {#opt-services.openafsServer.roles.backup.fabsArgs}

Arguments to the fabsys process. See
`fabsys_server(1)` and
`fabsys_config(1)`.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.roles.backup.fabsExtraConfig` {#opt-services.openafsServer.roles.backup.fabsExtraConfig}

Additional configuration parameters for the FABS backup server.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  afs.localauth = true;
  afs.keytab = config.sops.secrets.fabsKeytab.path;
}
```

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.roles.database.enable` {#opt-services.openafsServer.roles.database.enable}

Database server role, maintains the Volume Location Database,
Protection Database (and Backup Database, see
`backup` role). There can be multiple
servers in the database role for replication, which then need
reliable network connection to each other.

Servers in this role appear in AFSDB DNS records or the
CellServDB.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.roles.database.ptserverArgs` {#opt-services.openafsServer.roles.database.ptserverArgs}

Arguments to the ptserver process. See its man page.

*Type:* string

*Default:* `""`

*Example:* `"-restricted -default_access S---- S-M---"`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.roles.database.vlserverArgs` {#opt-services.openafsServer.roles.database.vlserverArgs}

Arguments to the vlserver process. See its man page.

*Type:* string

*Default:* `""`

*Example:* `"-rxbind"`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.roles.fileserver.enable` {#opt-services.openafsServer.roles.fileserver.enable}

Fileserver role, serves files and volumes from its local storage.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.roles.fileserver.fileserverArgs` {#opt-services.openafsServer.roles.fileserver.fileserverArgs}

Arguments to the dafileserver process. See its man page.

*Type:* string

*Default:* `"-vattachpar 128 -vhashsize 11 -L -rxpck 400 -cb 1000000"`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.roles.fileserver.salvagerArgs` {#opt-services.openafsServer.roles.fileserver.salvagerArgs}

Arguments to the dasalvager process. See its man page.

*Type:* string

*Default:* `""`

*Example:* `"-showlog -showmounts"`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.roles.fileserver.salvageserverArgs` {#opt-services.openafsServer.roles.fileserver.salvageserverArgs}

Arguments to the salvageserver process. See its man page.

*Type:* string

*Default:* `""`

*Example:* `"-showlog"`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.roles.fileserver.volserverArgs` {#opt-services.openafsServer.roles.fileserver.volserverArgs}

Arguments to the davolserver process. See its man page.

*Type:* string

*Default:* `""`

*Example:* `"-sync never"`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openafsServer.udpPacketSize` {#opt-services.openafsServer.udpPacketSize}

UDP packet size to use in Bytes. Higher values can speed up
communications. The default of 1 MB is a sufficient in most
cases. Make sure to increase the kernel's UDP buffer size
accordingly via `net.core(w|r|opt)mem_max`
sysctl.

*Type:* signed integer

*Default:* `1310720`

*Declared by:* [`nixos/modules/services/network-filesystems/openafs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/openafs/server.nix)

## `services.openarena.enable` {#opt-services.openarena.enable}

Whether to enable OpenArena game server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/games/openarena.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/openarena.nix)

## `services.openarena.extraFlags` {#opt-services.openarena.extraFlags}

Extra flags to pass to `oa_ded`

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "+set dedicated 2"
  "+set sv_hostname 'My NixOS OpenArena Server'"
  "+map oa_dm1"
]
```

*Declared by:* [`nixos/modules/services/games/openarena.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/openarena.nix)

## `services.openarena.openPorts` {#opt-services.openarena.openPorts}

Whether to open firewall ports for OpenArena

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/openarena.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/openarena.nix)

## `services.openarena.package` {#opt-services.openarena.package}

The openarena package to use.

*Type:* package

*Default:* `pkgs.openarena`

*Declared by:* [`nixos/modules/services/games/openarena.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/openarena.nix)

## `services.openbao-agent.instances` {#opt-services.openbao-agent.instances}

Attribute set of openbao-agent instances.
Creates independent `openbao-agent-${name}.service` systemd units for each instance defined here.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/vault-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault-agent.nix)

## `services.openbao-agent.instances.<name>.enable` {#opt-services.openbao-agent.instances._name_.enable}

Whether to enable this openbao-agent instance.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/vault-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault-agent.nix)

## `services.openbao-agent.instances.<name>.group` {#opt-services.openbao-agent.instances._name_.group}

Group under which this instance runs.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/security/vault-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault-agent.nix)

## `services.openbao-agent.instances.<name>.package` {#opt-services.openbao-agent.instances._name_.package}

The openbao package to use.

*Type:* package

*Default:* `pkgs.openbao`

*Declared by:* [`nixos/modules/services/security/vault-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault-agent.nix)

## `services.openbao-agent.instances.<name>.settings` {#opt-services.openbao-agent.instances._name_.settings}

Free-form settings written directly to the `config.json` file.
Refer to [https://openbao.org/docs/agent-and-proxy/agent/](https://openbao.org/docs/agent-and-proxy/agent/) for supported values.

::: note
Resulting format is JSON not HCL.
Refer to [https://www.hcl2json.com/](https://www.hcl2json.com/) if you are unsure how to convert HCL options to JSON.
:::

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/vault-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault-agent.nix)

## `services.openbao-agent.instances.<name>.settings.pid_file` {#opt-services.openbao-agent.instances._name_.settings.pid_file}

Path to use for the pid file.

*Type:* string

*Default:* `"/run/openbao-agent/‹name›.pid"`

*Declared by:* [`nixos/modules/services/security/vault-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault-agent.nix)

## `services.openbao-agent.instances.<name>.user` {#opt-services.openbao-agent.instances._name_.user}

User under which this instance runs.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/security/vault-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/vault-agent.nix)

## `services.openbao.enable` {#opt-services.openbao.enable}

Whether to enable OpenBao daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/openbao.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/openbao.nix)

## `services.openbao.extraArgs` {#opt-services.openbao.extraArgs}

Additional arguments given to OpenBao.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/openbao.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/openbao.nix)

## `services.openbao.package` {#opt-services.openbao.package}

The openbao package to use.

*Type:* package

*Default:* `pkgs.openbao`

*Example:* `pkgs.openbao.override { withUi = false; }`

*Declared by:* [`nixos/modules/services/security/openbao.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/openbao.nix)

## `services.openbao.plugins` {#opt-services.openbao.plugins}

Plugins to register with OpenBao on startup, such as those in
`pkgs.openbaoPlugins`.

Enable mounts with `-plugin-version=latest` so they follow plugin
updates. Otherwise a mount pins the version that was used when
it was enabled and has to be tuned after every update.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.openbaoPlugins.secrets-oauthapp ]`

*Declared by:* [`nixos/modules/services/security/openbao.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/openbao.nix)

## `services.openbao.settings` {#opt-services.openbao.settings}

Settings of OpenBao.

See [documentation](https://openbao.org/docs/configuration) for more details.

*Type:* open submodule of (JSON value)

*Example:*

``` nix
{
  ui = true;

  listener.default = {
    type = "tcp";
    tls_acme_email = config.security.acme.defaults.email;
    tls_acme_domains = [ "example.com" ];
    tls_acme_disable_http_challenge = true;
  };

  cluster_addr = "http://127.0.0.1:8201";
  api_addr = "https://example.com";

  storage.raft.path = "/var/lib/openbao";
}
```

*Declared by:* [`nixos/modules/services/security/openbao.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/openbao.nix)

## `services.openbao.settings.listener` {#opt-services.openbao.settings.listener}

Configure a listener for responding to requests.

*Type:* attribute set of (open submodule of (JSON value))

*Declared by:* [`nixos/modules/services/security/openbao.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/openbao.nix)

## `services.openbao.settings.listener.<name>.address` {#opt-services.openbao.settings.listener._name_.address}

The TCP address or UNIX socket path to listen on.

*Type:* string

*Default:* `if config.services.openbao.settings.listener.<name>.type == "unix" then "/run/openbao/openbao.sock" else "127.0.0.1:8200"`

*Declared by:* [`nixos/modules/services/security/openbao.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/openbao.nix)

## `services.openbao.settings.listener.<name>.type` {#opt-services.openbao.settings.listener._name_.type}

The listener type to enable.

*Type:* one of "tcp", "unix"

*Declared by:* [`nixos/modules/services/security/openbao.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/openbao.nix)

## `services.openbao.settings.ui` {#opt-services.openbao.settings.ui}

Whether to enable the OpenBao web UI.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/openbao.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/openbao.nix)

## `services.opencloud.address` {#opt-services.opencloud.address}

Web server bind address.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/opencloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/opencloud.nix)

## `services.opencloud.enable` {#opt-services.opencloud.enable}

Whether to enable OpenCloud.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/opencloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/opencloud.nix)

## `services.opencloud.environment` {#opt-services.opencloud.environment}

Extra environment variables to set for the service.

Use this to set configuration that may affect multiple microservices.

Set `OC_INSECURE = "false"` if you want OpenCloud to terminate TLS.

Configuration provided here will override `settings`.

*Type:* attribute set of string

*Default:*

``` nix
{
  OC_INSECURE = "true";
}
```

*Example:*

``` nix
{
  OC_INSECURE = "false";
  OC_LOG_LEVEL = "error";
}
```

*Declared by:* [`nixos/modules/services/web-apps/opencloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/opencloud.nix)

## `services.opencloud.environmentFile` {#opt-services.opencloud.environmentFile}

An environment file as defined in `systemd.exec(5)`.

Use this to inject secrets, e.g. database or auth credentials out of band.

Configuration provided here will override `settings` and `environment`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/opencloud.env"`

*Declared by:* [`nixos/modules/services/web-apps/opencloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/opencloud.nix)

## `services.opencloud.group` {#opt-services.opencloud.group}

The group to run OpenCloud under.
By default, a group named `opencloud` will be created.

*Type:* string

*Default:* `"opencloud"`

*Example:* `"mycloud"`

*Declared by:* [`nixos/modules/services/web-apps/opencloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/opencloud.nix)

## `services.opencloud.idpWebPackage` {#opt-services.opencloud.idpWebPackage}

The idp-web package to use.

*Type:* package

*Default:* `"config.services.opencloud.package.idp-web"`

*Declared by:* [`nixos/modules/services/web-apps/opencloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/opencloud.nix)

## `services.opencloud.package` {#opt-services.opencloud.package}

The opencloud package to use. OpenCloud has 2 release cycles, explained on https://docs.opencloud.eu/docs/admin/resources/lifecycle.

Use `pkgs.opencloud` package for the rolling release (every 3 weeks).
Use `pkgs.opencloud-production` package for the production release (about every 6 months).

OpenCloud does not support downgrading existing installations. Switching from `pkgs.opencloud` to `pkgs.opencloud-production` is considered a downgrade.

*Type:* package

*Declared by:* [`nixos/modules/services/web-apps/opencloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/opencloud.nix)

## `services.opencloud.port` {#opt-services.opencloud.port}

Web server port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9200`

*Declared by:* [`nixos/modules/services/web-apps/opencloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/opencloud.nix)

## `services.opencloud.settings` {#opt-services.opencloud.settings}

Additional YAML configuration for OpenCloud services.

Every item in this attrset will be mapped to a .yaml file in /etc/opencloud.

The possible config options are currently not well documented, see source code:
https://github.com/opencloud-eu/opencloud/blob/main/pkg/config/config.go

*Type:* attribute set of (YAML 1.1 value)

*Default:* `{ }`

*Example:*

``` nix
{
  proxy = {
    auto_provision_accounts = true;
    oidc = {
      rewrite_well_known = true;
    };
    role_assignment = {
      driver = "oidc";
      oidc_role_mapper = {
        role_claim = "opencloud_roles";
      };
    };
  };
  web = {
    web = {
      config = {
        oidc = {
          scope = "openid profile email opencloud_roles";
        };
      };
    };
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/opencloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/opencloud.nix)

## `services.opencloud.stateDir` {#opt-services.opencloud.stateDir}

OpenCloud data directory.

*Type:* string

*Default:* `"/var/lib/opencloud"`

*Declared by:* [`nixos/modules/services/web-apps/opencloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/opencloud.nix)

## `services.opencloud.url` {#opt-services.opencloud.url}

Web interface root public URL, including scheme and port (if non-default).

*Type:* string

*Default:* `"https://localhost:9200"`

*Example:* `"https://cloud.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/opencloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/opencloud.nix)

## `services.opencloud.user` {#opt-services.opencloud.user}

The user to run OpenCloud as.
By default, a user named `opencloud` will be created whose home
directory is [services (O)](#opt-services.opencloud.stateDir).

*Type:* string

*Default:* `"opencloud"`

*Example:* `"mycloud"`

*Declared by:* [`nixos/modules/services/web-apps/opencloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/opencloud.nix)

## `services.opencloud.webPackage` {#opt-services.opencloud.webPackage}

The web package to use.

*Type:* package

*Default:* `"config.services.opencloud.package.web"`

*Declared by:* [`nixos/modules/services/web-apps/opencloud.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/opencloud.nix)

## `services.opendkim.configFile` {#opt-services.opendkim.configFile}

Additional opendkim configuration as a file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/mail/opendkim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/opendkim.nix)

## `services.opendkim.domains` {#opt-services.opendkim.domains}

Local domains set (see `opendkim(8)` for more information on datasets).
Messages from them are signed, not verified.

*Type:* string

*Default:* `"csl:${config.networking.hostName}"`

*Example:* `"csl:example.com,mydomain.net"`

*Declared by:* [`nixos/modules/services/mail/opendkim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/opendkim.nix)

## `services.opendkim.enable` {#opt-services.opendkim.enable}

Whether to enable OpenDKIM sender authentication system.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/opendkim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/opendkim.nix)

## `services.opendkim.group` {#opt-services.opendkim.group}

Group for the daemon.

*Type:* string

*Default:* `"opendkim"`

*Declared by:* [`nixos/modules/services/mail/opendkim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/opendkim.nix)

## `services.opendkim.keyPath` {#opt-services.opendkim.keyPath}

The path that opendkim should put its generated private keys into.
The DNS settings will be found in this directory with the name selector.txt.

*Type:* absolute path

*Default:* `"/var/lib/opendkim/keys"`

*Declared by:* [`nixos/modules/services/mail/opendkim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/opendkim.nix)

## `services.opendkim.selector` {#opt-services.opendkim.selector}

Selector to use when signing.

*Type:* string

*Declared by:* [`nixos/modules/services/mail/opendkim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/opendkim.nix)

## `services.opendkim.settings` {#opt-services.opendkim.settings}

Additional opendkim configuration

*Type:* open submodule of attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/mail/opendkim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/opendkim.nix)

## `services.opendkim.socket` {#opt-services.opendkim.socket}

Socket which is used for communication with OpenDKIM.

*Type:* string

*Default:* `"local:/run/opendkim/opendkim.sock"`

*Declared by:* [`nixos/modules/services/mail/opendkim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/opendkim.nix)

## `services.opendkim.user` {#opt-services.opendkim.user}

User for the daemon.

*Type:* string

*Default:* `"opendkim"`

*Declared by:* [`nixos/modules/services/mail/opendkim.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/opendkim.nix)

## `services.openiscsi.discoverPortal` {#opt-services.openiscsi.discoverPortal}

Portal to discover targets on

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/iscsi/initiator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iscsi/initiator.nix)

## `services.openiscsi.discoverType` {#opt-services.openiscsi.discoverType}

Target discovery type.
Change this if you want to discover your targes via an iSNS server
or use the targets provided via firmware settings.
See `iscsiadm(8)`.

*Type:* one of "st", "sendtargets", "isns", "fw"

*Default:* `"sendtargets"`

*Example:* `"sendtargets"`

*Declared by:* [`nixos/modules/services/networking/iscsi/initiator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iscsi/initiator.nix)

## `services.openiscsi.enable` {#opt-services.openiscsi.enable}

Whether to enable the openiscsi iscsi daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/iscsi/initiator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iscsi/initiator.nix)

## `services.openiscsi.enableAutoLoginOut` {#opt-services.openiscsi.enableAutoLoginOut}

Whether to enable automatic login and logout of all automatic targets.
You probably do not want this
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/iscsi/initiator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iscsi/initiator.nix)

## `services.openiscsi.extraConfig` {#opt-services.openiscsi.extraConfig}

Lines to append to default iscsid.conf

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/iscsi/initiator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iscsi/initiator.nix)

## `services.openiscsi.extraConfigFile` {#opt-services.openiscsi.extraConfigFile}

Append an additional file's contents to /etc/iscsid.conf. Use a non-store path
and store passwords in this file.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/iscsi/initiator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iscsi/initiator.nix)

## `services.openiscsi.name` {#opt-services.openiscsi.name}

Name of this iscsi initiator

*Type:* string

*Example:* `"iqn.2020-08.org.linux-iscsi.initiatorhost:example"`

*Declared by:* [`nixos/modules/services/networking/iscsi/initiator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iscsi/initiator.nix)

## `services.openiscsi.package` {#opt-services.openiscsi.package}

The openiscsi package to use.

*Type:* package

*Default:* `pkgs.openiscsi`

*Declared by:* [`nixos/modules/services/networking/iscsi/initiator.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iscsi/initiator.nix)

## `services.openldap.configDir` {#opt-services.openldap.configDir}

Use this config directory instead of generating one from the
`settings` option. Overrides all NixOS settings.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/openldap/slapd.d"`

*Declared by:* [`nixos/modules/services/databases/openldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/openldap.nix)

## `services.openldap.declarativeContents` {#opt-services.openldap.declarativeContents}

Declarative contents for the LDAP database, in LDIF format by suffix.

All data will be erased when starting the LDAP server. Modifications
to the database are not prevented, they are just dropped on the next
reboot of the server. Performance-wise the database and indexes are
rebuilt on each server startup, so this will slow down server startup,
especially with large databases.

Note that the root of the DB must be defined in
`services.openldap.settings` and the
`olcDbDirectory` must begin with
`"/var/lib/openldap"`.

*Type:* attribute set of strings concatenated with "\\n"

*Default:* `{ }`

*Example:*

``` nix
{
  "dc=example,dc=org" = ''
    dn= dn: dc=example,dc=org
    objectClass: domain
    dc: example

    dn: ou=users,dc=example,dc=org
    objectClass = organizationalUnit
    ou: users

    # ...
  '';
}
```

*Declared by:* [`nixos/modules/services/databases/openldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/openldap.nix)

## `services.openldap.enable` {#opt-services.openldap.enable}

Whether to enable the ldap server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/openldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/openldap.nix)

## `services.openldap.group` {#opt-services.openldap.group}

Group account under which slapd runs.

*Type:* string

*Default:* `"openldap"`

*Declared by:* [`nixos/modules/services/databases/openldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/openldap.nix)

## `services.openldap.mutableConfig` {#opt-services.openldap.mutableConfig}

Whether to allow writable on-line configuration. If
`true`, the NixOS settings will only be used to
initialize the OpenLDAP configuration if it does not exist, and are
subsequently ignored.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/openldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/openldap.nix)

## `services.openldap.package` {#opt-services.openldap.package}

The openldap package to use. This can be used to, for example, set an OpenLDAP package
with custom overrides to enable modules or other
functionality.

*Type:* package

*Default:* `pkgs.openldap`

*Declared by:* [`nixos/modules/services/databases/openldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/openldap.nix)

## `services.openldap.settings` {#opt-services.openldap.settings}

Configuration for OpenLDAP, in OLC format

*Type:* submodule

*Example:*

``` nix
{
  attrs.olcLogLevel = [ "stats" ];
  children = {
    "cn=schema".includes = [
       "${pkgs.openldap}/etc/schema/core.ldif"
       "${pkgs.openldap}/etc/schema/cosine.ldif"
       "${pkgs.openldap}/etc/schema/inetorgperson.ldif"
    ];
    "olcDatabase={-1}frontend" = {
      attrs = {
        objectClass = "olcDatabaseConfig";
        olcDatabase = "{-1}frontend";
        olcAccess = [ "{0}to * by dn.exact=uidNumber=0+gidNumber=0,cn=peercred,cn=external,cn=auth manage stop by * none stop" ];
      };
    };
    "olcDatabase={0}config" = {
      attrs = {
        objectClass = "olcDatabaseConfig";
        olcDatabase = "{0}config";
        olcAccess = [ "{0}to * by * none break" ];
      };
    };
    "olcDatabase={1}mdb" = {
      attrs = {
        objectClass = [ "olcDatabaseConfig" "olcMdbConfig" ];
        olcDatabase = "{1}mdb";
        olcDbDirectory = "/var/lib/openldap/ldap";
        olcDbIndex = [
          "objectClass eq"
          "cn pres,eq"
          "uid pres,eq"
          "sn pres,eq,subany"
        ];
        olcSuffix = "dc=example,dc=com";
        olcAccess = [ "{0}to * by * read break" ];
      };
    };
  };
};
```

*Declared by:* [`nixos/modules/services/databases/openldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/openldap.nix)

## `services.openldap.settings.attrs` {#opt-services.openldap.settings.attrs}

Attributes of the parent entry.

*Type:* attribute set of ((LDAP value - either a string, or an attrset containing
`path` or `base64` for included
values or base-64 encoded values respectively.
) or list of (LDAP value - either a string, or an attrset containing
`path` or `base64` for included
values or base-64 encoded values respectively.
))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/databases/openldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/openldap.nix)

## `services.openldap.settings.children` {#opt-services.openldap.settings.children}

Child entries of the current entry, with recursively the same structure.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
    "cn=schema" = {
    # The attribute used in the DN must be defined
    attrs = { cn = "schema"; };
    children = {
        # This entry's DN is expanded to "cn=foo,cn=schema"
        "cn=foo" = { ... };
    };
    # These includes are inserted after "cn=schema", but before "cn=foo,cn=schema"
    includes = [ ... ];
    };
}
```

*Declared by:* [`nixos/modules/services/databases/openldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/openldap.nix)

## `services.openldap.settings.includes` {#opt-services.openldap.settings.includes}

LDIF files to include after the parent's attributes but before its children.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/databases/openldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/openldap.nix)

## `services.openldap.urlList` {#opt-services.openldap.urlList}

URL list slapd should listen on.

*Type:* list of string

*Default:*

``` nix
[
  "ldap:///"
]
```

*Example:*

``` nix
[
  "ldaps:///"
]
```

*Declared by:* [`nixos/modules/services/databases/openldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/openldap.nix)

## `services.openldap.user` {#opt-services.openldap.user}

User account under which slapd runs.

*Type:* string

*Default:* `"openldap"`

*Declared by:* [`nixos/modules/services/databases/openldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/openldap.nix)

## `services.openntpd.enable` {#opt-services.openntpd.enable}

Whether to enable OpenNTP time synchronization server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ntp/openntpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/openntpd.nix)

## `services.openntpd.extraConfig` {#opt-services.openntpd.extraConfig}

Additional text appended to `openntpd.conf`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  listen on 127.0.0.1
  listen on ::1
''
```

*Declared by:* [`nixos/modules/services/networking/ntp/openntpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/openntpd.nix)

## `services.openntpd.extraOptions` {#opt-services.openntpd.extraOptions}

Extra options used when launching openntpd.

*Type:* strings concatenated with " "

*Default:* `""`

*Example:* `"-s"`

*Declared by:* [`nixos/modules/services/networking/ntp/openntpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/openntpd.nix)

## `services.openntpd.servers` {#opt-services.openntpd.servers}

The set of NTP servers from which to synchronise.

*Type:* list of string

*Default:* `config.services.ntp.servers`

*Declared by:* [`nixos/modules/services/networking/ntp/openntpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ntp/openntpd.nix)

## `services.opensearch-dashboards.enable` {#opt-services.opensearch-dashboards.enable}

Whether to enable OpenSearch Dashboards.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/search/opensearch-dashboards.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/opensearch-dashboards.nix)

## `services.opensearch-dashboards.package` {#opt-services.opensearch-dashboards.package}

The OpenSearch Dashboards package to use.

*Type:* package

*Default:* `pkgs.opensearch-dashboards`

*Declared by:* [`nixos/modules/services/search/opensearch-dashboards.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/opensearch-dashboards.nix)

## `services.opensearch-dashboards.settings` {#opt-services.opensearch-dashboards.settings}

OpenSearch Dashboards settings.

Available settings can be found by looking at the
[opensearch\_dashboards.yml](https://github.com/opensearch-project/OpenSearch-Dashboards/blob/main/config/opensearch_dashboards.yml)
from the Opensearch Dashboards repo.

`config/nixos_site_settings.json` file,
attribute set containing the attribute
`_secret` - a string pointing to a file
containing the value the option should be set to. See the
example to get a better picture of this: in the resulting
`opensearch_dashboards.yml` file,
the `opensearch.password` key will
be set to the contents of the
`/run/keys/opensearch_password`
file.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Example:*

``` nix
{
  opensearch = {
    username = "foo";
    password._secret = "/run/keys/opensearch_password";
  };

  server = {
    name = "your-hostname";
    port = 5601;
    maxPayloadbytes = 104857;
  };
};
```

*Declared by:* [`nixos/modules/services/search/opensearch-dashboards.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/opensearch-dashboards.nix)

## `services.opensearch-dashboards.user` {#opt-services.opensearch-dashboards.user}

The user to run OpenSearch Dashboards under.

*Type:* string

*Default:* `"opensearch-dashboards"`

*Declared by:* [`nixos/modules/services/search/opensearch-dashboards.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/opensearch-dashboards.nix)

## `services.opensearch.dataDir` {#opt-services.opensearch.dataDir}

Data directory for OpenSearch. If you change this, you need to
manually create the directory. You also need to create the
`opensearch` user and group, or change
[services (O)](#opt-services.opensearch.user) and
[services (O)](#opt-services.opensearch.group) to existing ones with
access to the directory.

*Type:* absolute path

*Default:* `"/var/lib/opensearch"`

*Declared by:* [`nixos/modules/services/search/opensearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/opensearch.nix)

## `services.opensearch.enable` {#opt-services.opensearch.enable}

Whether to enable OpenSearch.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/search/opensearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/opensearch.nix)

## `services.opensearch.extraCmdLineOptions` {#opt-services.opensearch.extraCmdLineOptions}

Extra command line options for the OpenSearch launcher.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/search/opensearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/opensearch.nix)

## `services.opensearch.extraJavaOptions` {#opt-services.opensearch.extraJavaOptions}

Extra command line options for Java.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-Djava.net.preferIPv4Stack=true"
]
```

*Declared by:* [`nixos/modules/services/search/opensearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/opensearch.nix)

## `services.opensearch.group` {#opt-services.opensearch.group}

The group OpenSearch runs as. Should be left at default unless
you have very specific needs.

*Type:* string

*Default:* `"opensearch"`

*Declared by:* [`nixos/modules/services/search/opensearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/opensearch.nix)

## `services.opensearch.logging` {#opt-services.opensearch.logging}

opensearch logging configuration.

*Type:* string

*Default:*

``` nix
''
  logger.action.name = org.opensearch.action
  logger.action.level = info
  
  appender.console.type = Console
  appender.console.name = console
  appender.console.layout.type = PatternLayout
  appender.console.layout.pattern = [%d{ISO8601}][%-5p][%-25c{1.}] %marker%m%n
  
  rootLogger.level = info
  rootLogger.appenderRef.console.ref = console
''
```

*Declared by:* [`nixos/modules/services/search/opensearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/opensearch.nix)

## `services.opensearch.package` {#opt-services.opensearch.package}

The OpenSearch package to use.

*Type:* package

*Default:* `pkgs.opensearch`

*Declared by:* [`nixos/modules/services/search/opensearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/opensearch.nix)

## `services.opensearch.restartIfChanged` {#opt-services.opensearch.restartIfChanged}

Automatically restart the service on config change.
This can be set to false to defer restarts on a server or cluster.
Please consider the security implications of inadvertently running an older version,
and the possibility of unexpected behavior caused by inconsistent versions across a cluster when disabling this option.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/search/opensearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/opensearch.nix)

## `services.opensearch.settings` {#opt-services.opensearch.settings}

OpenSearch configuration.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/search/opensearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/opensearch.nix)

## `services.opensearch.settings."cluster.name"` {#opt-services.opensearch.settings._cluster.name_}

The name of the cluster.

*Type:* string

*Default:* `"opensearch"`

*Declared by:* [`nixos/modules/services/search/opensearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/opensearch.nix)

## `services.opensearch.settings."discovery.type"` {#opt-services.opensearch.settings._discovery.type_}

The type of discovery to use.

*Type:* string

*Default:* `"single-node"`

*Declared by:* [`nixos/modules/services/search/opensearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/opensearch.nix)

## `services.opensearch.settings."http.port"` {#opt-services.opensearch.settings._http.port_}

The port to listen on for HTTP traffic.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9200`

*Declared by:* [`nixos/modules/services/search/opensearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/opensearch.nix)

## `services.opensearch.settings."network.host"` {#opt-services.opensearch.settings._network.host_}

Which address this service should listen on.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/search/opensearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/opensearch.nix)

## `services.opensearch.settings."plugins.security.disabled"` {#opt-services.opensearch.settings._plugins.security.disabled_}

Whether to enable the security plugin,
`plugins.security.ssl.transport.keystore_filepath` or
`plugins.security.ssl.transport.server.pemcert_filepath` and
`plugins.security.ssl.transport.client.pemcert_filepath`
must be set for this plugin to be enabled.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/search/opensearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/opensearch.nix)

## `services.opensearch.settings."transport.port"` {#opt-services.opensearch.settings._transport.port_}

The port to listen on for transport traffic.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9300`

*Declared by:* [`nixos/modules/services/search/opensearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/opensearch.nix)

## `services.opensearch.user` {#opt-services.opensearch.user}

The user OpenSearch runs as. Should be left at default unless
you have very specific needs.

*Type:* string

*Default:* `"opensearch"`

*Declared by:* [`nixos/modules/services/search/opensearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/opensearch.nix)

## `services.opensmtpd.enable` {#opt-services.opensmtpd.enable}

Whether to enable the OpenSMTPD server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/mail/opensmtpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/opensmtpd.nix)

## `services.opensmtpd.extraServerArgs` {#opt-services.opensmtpd.extraServerArgs}

Extra command line arguments provided when the smtpd process
is started.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-v"
  "-P mta"
]
```

*Declared by:* [`nixos/modules/services/mail/opensmtpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/opensmtpd.nix)

## `services.opensmtpd.package` {#opt-services.opensmtpd.package}

The opensmtpd package to use.

*Type:* package

*Default:* `pkgs.opensmtpd`

*Declared by:* [`nixos/modules/services/mail/opensmtpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/opensmtpd.nix)

## `services.opensmtpd.procPackages` {#opt-services.opensmtpd.procPackages}

Packages to search for filters, tables, queues, and schedulers.

Add packages here if you want to use them as as such, for example
from the opensmtpd-table-\* packages.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/mail/opensmtpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/opensmtpd.nix)

## `services.opensmtpd.serverConfiguration` {#opt-services.opensmtpd.serverConfiguration}

The contents of the smtpd.conf configuration file. See the
OpenSMTPD documentation for syntax information.

*Type:* strings concatenated with "\\n"

*Example:*

``` nix
''
  listen on lo
  accept for any deliver to lmtp localhost:24
''
```

*Declared by:* [`nixos/modules/services/mail/opensmtpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/opensmtpd.nix)

## `services.opensmtpd.setSendmail` {#opt-services.opensmtpd.setSendmail}

Whether to set the system sendmail to OpenSMTPD's.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/mail/opensmtpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/opensmtpd.nix)

## `services.opensnitch.configFile` {#opt-services.opensnitch.configFile}

Path to JSON config file. See: [https://github.com/evilsocket/opensnitch/blob/master/daemon/data/default-config.json](https://github.com/evilsocket/opensnitch/blob/master/daemon/data/default-config.json)
If this option is set, it will override any configuration done in options.services.opensnitch.settings.

*Type:* absolute path

*Default:* JSON file generated from [`services.opensnitch.settings`](#opt-services.opensnitch.settings)

*Example:* `"/etc/opensnitchd/default-config.json"`

*Declared by:* [`nixos/modules/services/security/opensnitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/opensnitch.nix)

## `services.opensnitch.enable` {#opt-services.opensnitch.enable}

Whether to enable Opensnitch application firewall.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/opensnitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/opensnitch.nix)

## `services.opensnitch.package` {#opt-services.opensnitch.package}

The opensnitch package to use.

*Type:* package

*Default:* `pkgs.opensnitch`

*Declared by:* [`nixos/modules/services/security/opensnitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/opensnitch.nix)

## `services.opensnitch.rules` {#opt-services.opensnitch.rules}

Declarative configuration of firewall rules.
All rules will be stored in `/var/lib/opensnitch/rules` by default.
Rules path can be configured with `settings.Rules.Path`.
See [upstream documentation](https://github.com/evilsocket/opensnitch/wiki/Rules)
for available options.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Example:*

``` nix
{
  "tor" = {
    "name" = "tor";
    "enabled" = true;
    "action" = "allow";
    "duration" = "always";
    "operator" = {
      "type" ="simple";
      "sensitive" = false;
      "operand" = "process.path";
      "data" = "${lib.getBin pkgs.tor}/bin/tor";
    };
  };
};
```

*Declared by:* [`nixos/modules/services/security/opensnitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/opensnitch.nix)

## `services.opensnitch.settings` {#opt-services.opensnitch.settings}

opensnitchd configuration. Refer to [upstream documentation](https://github.com/evilsocket/opensnitch/wiki/Configurations)
for details on supported values.

*Type:* open submodule of (JSON value)

*Declared by:* [`nixos/modules/services/security/opensnitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/opensnitch.nix)

## `services.opensnitch.settings.Audit.AudispSocketPath` {#opt-services.opensnitch.settings.Audit.AudispSocketPath}

Configure audit socket path. Used when
`settings.ProcMonitorMethod` is set to `audit`.

*Type:* absolute path

*Default:* `"/run/audit/audispd_events"`

*Declared by:* [`nixos/modules/services/security/opensnitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/opensnitch.nix)

## `services.opensnitch.settings.Ebpf.ModulesPath` {#opt-services.opensnitch.settings.Ebpf.ModulesPath}

Configure eBPF modules path. Used when
`settings.ProcMonitorMethod` is set to `ebpf`.

*Type:* null or absolute path

*Default:*

``` nix
if cfg.settings.ProcMonitorMethod == "ebpf" then
  "${config.boot.kernelPackages.opensnitch-ebpf}/etc/opensnitchd"
else null;
```

*Declared by:* [`nixos/modules/services/security/opensnitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/opensnitch.nix)

## `services.opensnitch.settings.Firewall` {#opt-services.opensnitch.settings.Firewall}

Which firewall backend to use. `nftables` ruleset can be used for `iptables` firewall too, if `iptables` is built with nftables compatibility.

*Type:* one of "iptables", "nftables"

*Default:* `"nftables"`

*Declared by:* [`nixos/modules/services/security/opensnitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/opensnitch.nix)

## `services.opensnitch.settings.ProcMonitorMethod` {#opt-services.opensnitch.settings.ProcMonitorMethod}

Which process monitoring method to use.

*Type:* one of "ebpf", "proc", "ftrace", "audit"

*Default:* `"ebpf"`

*Declared by:* [`nixos/modules/services/security/opensnitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/opensnitch.nix)

## `services.opensnitch.settings.Rules.Path` {#opt-services.opensnitch.settings.Rules.Path}

Path to the directory where firewall rules can be found and will
get stored by the NixOS module.

*Type:* absolute path not in the Nix store

*Default:* `"/var/lib/opensnitch/rules"`

*Declared by:* [`nixos/modules/services/security/opensnitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/opensnitch.nix)

## `services.opensnitch.upstreamDefaults` {#opt-services.opensnitch.upstreamDefaults}

Whether to base the config declared in [`services.opensnitch.settings`](#opt-services.opensnitch.settings) on the upstream example config ([https://github.com/evilsocket/opensnitch/blob/master/daemon/data/default-config.json](https://github.com/evilsocket/opensnitch/blob/master/daemon/data/default-config.json))

Disable this if you want to declare your opensnitch config from scratch.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/opensnitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/opensnitch.nix)

## `services.openssh.allowSFTP` {#opt-services.openssh.allowSFTP}

Whether to enable the SFTP subsystem in the SSH daemon.  This
enables the use of commands such as `sftp` and
`sshfs`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.authorizedKeysCommand` {#opt-services.openssh.authorizedKeysCommand}

Specifies a program to be used to look up the user's public
keys. The program must be owned by root, not writable by group
or others and specified by an absolute path.

*Type:* string

*Default:* `"none"`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.authorizedKeysCommandUser` {#opt-services.openssh.authorizedKeysCommandUser}

Specifies the user under whose account the AuthorizedKeysCommand
is run. It is recommended to use a dedicated user that has no
other role on the host than running authorized keys commands.

*Type:* string

*Default:* `"nobody"`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.authorizedKeysFiles` {#opt-services.openssh.authorizedKeysFiles}

Specify the rules for which files to read on the host.

This is an advanced option. If you're looking to configure user
keys, you can generally use [users](../../options/users/index.md#opt-users.users._name_.openssh.authorizedKeys.keys)
or [users](../../options/users/index.md#opt-users.users._name_.openssh.authorizedKeys.keyFiles).

These are paths relative to the host root file system or home
directories and they are subject to certain token expansion rules.
See AuthorizedKeysFile in man sshd\_config for details.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.authorizedKeysInHomedir` {#opt-services.openssh.authorizedKeysInHomedir}

Enables the use of the `~/.ssh/authorized_keys` file.

Otherwise, the only files trusted by default are those in `/etc/ssh/authorized_keys.d`,
*i.e.* SSH keys from [users](../../options/users/index.md#opt-users.users._name_.openssh.authorizedKeys.keys).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.enable` {#opt-services.openssh.enable}

Whether to enable the OpenSSH secure shell daemon, which
allows secure remote logins.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.enableRecommendedAlgorithms` {#opt-services.openssh.enableRecommendedAlgorithms}

Use algorithms curated and recommended by NixOS.

Set to false to use upstream's default algorithms.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.extraConfig` {#opt-services.openssh.extraConfig}

Verbatim contents of `sshd_config`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.generateHostKeys` {#opt-services.openssh.generateHostKeys}

Whether to generate SSH host keys.

This can be enabled explicitly if you want to generate host keys but
don't want to enable the SSH daemon.

*Type:* boolean

*Default:* `services.openssh.enable`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.hostKeys` {#opt-services.openssh.hostKeys}

NixOS can automatically generate SSH host keys.  This option
specifies the path, type and size of each key.  See
`ssh-keygen(1)` for supported types
and sizes.

*Type:* list of (attribute set)

*Default:*

``` nix
[
  {
    bits = 4096;
    path = "/etc/ssh/ssh_host_rsa_key";
    type = "rsa";
  }
  {
    path = "/etc/ssh/ssh_host_ed25519_key";
    type = "ed25519";
  }
  {
    path = "/etc/ssh/ssh_host_mldsa44_ed25519_key";
    type = "mldsa44-ed25519";
  }
]
```

*Example:*

``` nix
[
  {
    bits = 4096;
    openSSHFormat = true;
    path = "/etc/ssh/ssh_host_rsa_key";
    type = "rsa";
  }
  {
    comment = "key comment";
    path = "/etc/ssh/ssh_host_ed25519_key";
    type = "ed25519";
  }
]
```

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.knownHosts` {#opt-services.openssh.knownHosts}

Alias of [`programs.ssh.knownHosts`](../../options/programs/index.md#opt-programs.ssh.knownHosts).

*Type:* attribute set of (submodule)

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.knownHosts.<name>.certAuthority` {#opt-services.openssh.knownHosts._name_.certAuthority}

This public key is an SSH certificate authority, rather than an
individual host's key.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `services.openssh.knownHosts.<name>.extraHostNames` {#opt-services.openssh.knownHosts._name_.extraHostNames}

A list of additional host names and/or IP numbers used for
accessing the host's ssh service. This list is ignored if
`hostNames` is set explicitly.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `services.openssh.knownHosts.<name>.hostNames` {#opt-services.openssh.knownHosts._name_.hostNames}

A list of host names and/or IP numbers used for accessing
the host's ssh service. This list includes the name of the
containing `knownHosts` attribute by default
for convenience. If you wish to configure multiple host keys
for the same host use multiple `knownHosts`
entries with different attribute names and the same
`hostNames` list.

*Type:* list of string

*Default:* `[ ‹name› ] ++ config.services.openssh.knownHosts.<name>.extraHostNames`

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `services.openssh.knownHosts.<name>.publicKey` {#opt-services.openssh.knownHosts._name_.publicKey}

The public key data for the host. You can fetch a public key
from a running SSH server with the `ssh-keyscan`
command. The public key should not include any host names, only
the key type and the key itself.

*Type:* null or string

*Default:* `null`

*Example:* `"ecdsa-sha2-nistp521 AAAAE2VjZHN...UEPg=="`

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `services.openssh.knownHosts.<name>.publicKeyFile` {#opt-services.openssh.knownHosts._name_.publicKeyFile}

The path to the public key file for the host. The public
key file is read at build time and saved in the Nix store.
You can fetch a public key file from a running SSH server
with the `ssh-keyscan` command. The content
of the file should follow the same format as described for
the `publicKey` option. Only a single key
is supported. If a host has multiple keys, use
[`programs.ssh.knownHostsFiles`](../../options/programs/index.md#opt-programs.ssh.knownHostsFiles) instead.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/programs/ssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/ssh.nix)

## `services.openssh.listenAddresses` {#opt-services.openssh.listenAddresses}

List of addresses and ports to listen on (ListenAddress directive
in config). If port is not specified for address sshd will listen
on all ports specified by `ports` option.
NOTE: this will override default listening on all local addresses and port 22.
NOTE: setting this option won't automatically enable given ports
in firewall configuration.
NOTE: If the IP address is not available at boot time, the following has
to be added to make sure sshd will wait for dhcp configuration:

``` nix
systemd.services.sshd = {
  wants = [ "network-online.target" ];
  after = [ "network-online.target" ];
};
```

See the following issue for details: [https://github.com/NixOS/nixpkgs/issues/105570](https://github.com/NixOS/nixpkgs/issues/105570)

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    addr = "192.168.3.1";
    port = 22;
  }
  {
    addr = "0.0.0.0";
    port = 64022;
  }
]
```

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.listenAddresses.*.addr` {#opt-services.openssh.listenAddresses._.addr}

Host, IPv4 or IPv6 address to listen to.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.listenAddresses.*.port` {#opt-services.openssh.listenAddresses._.port}

Port to listen to.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.openFirewall` {#opt-services.openssh.openFirewall}

Whether to automatically open the specified ports in the firewall.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.package` {#opt-services.openssh.package}

OpenSSH package to use for sshd.

*Type:* package

*Default:* `programs.ssh.package`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.ports` {#opt-services.openssh.ports}

Specifies on which ports the SSH daemon listens.

*Type:* list of 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
[
  22
]
```

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.settings` {#opt-services.openssh.settings}

Configuration for `sshd_config(5)`.

*Type:* open submodule of attribute set of (atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  UseDns = true;
  PasswordAuthentication = false;
}
```

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.settings.AcceptEnv` {#opt-services.openssh.settings.AcceptEnv}

Specifies what environment variables sent by the client will be copied into the session's
environment. The TERM environment variable is always accepted whenever the client requests
a pseudo-terminal as it is required by the protocol.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.settings.AllowGroups` {#opt-services.openssh.settings.AllowGroups}

If specified, login is allowed only for users part of the
listed groups.
See `sshd_config(5)` for details.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.settings.AllowUsers` {#opt-services.openssh.settings.AllowUsers}

If specified, login is allowed only for the listed users.
See `sshd_config(5)` for details.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.settings.AuthorizedPrincipalsFile` {#opt-services.openssh.settings.AuthorizedPrincipalsFile}

Specifies a file that lists principal names that are accepted for certificate authentication. The default
is `"none"`, i.e. not to use a principals file.

*Type:* null or string

*Default:* `"none"`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.settings.Banner` {#opt-services.openssh.settings.Banner}

The file whose contents are sent to the remote user before authentication.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/etc/ssh/banner"`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.settings.Ciphers` {#opt-services.openssh.settings.Ciphers}

Allowed ciphers

Defaults to a curated set of algorithms.
Set enableRecommendedAlgorithms to false to use upstream's defaults.

*Type:* null or (list of string)

*Default:*

``` nix
''
  if config.services.openssh.enableRecommendedAlgorithms then
    [
      "chacha20-poly1305@openssh.com"
      "aes256-gcm@openssh.com"
      "aes128-gcm@openssh.com"
      "aes256-ctr"
      "aes192-ctr"
      "aes128-ctr"
    ]
  else
    null;
''
```

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.settings.DenyGroups` {#opt-services.openssh.settings.DenyGroups}

If specified, login is denied for all users part of the listed
groups. Takes precedence over
[services (O)](#opt-services.openssh.settings.AllowGroups). See
`sshd_config(5)` for details.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.settings.DenyUsers` {#opt-services.openssh.settings.DenyUsers}

If specified, login is denied for all listed users. Takes
precedence over [services (O)](#opt-services.openssh.settings.AllowUsers).
See `sshd_config(5)` for details.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.settings.GatewayPorts` {#opt-services.openssh.settings.GatewayPorts}

Specifies whether remote hosts are allowed to connect to
ports forwarded for the client.  See
`sshd_config(5)`.

*Type:* null or string

*Default:* `"no"`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.settings.KbdInteractiveAuthentication` {#opt-services.openssh.settings.KbdInteractiveAuthentication}

Specifies whether keyboard-interactive authentication is allowed.

*Type:* null or boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.settings.KexAlgorithms` {#opt-services.openssh.settings.KexAlgorithms}

Allowed key exchange algorithms

Defaults to a curated set of algorithms.
Set enableRecommendedAlgorithms to false to use upstream's defaults.

*Type:* null or (list of string)

*Default:*

``` nix
''
  if config.services.openssh.enableRecommendedAlgorithms then
    [
      "mlkem768x25519-sha256"
      "sntrup761x25519-sha512"
      "sntrup761x25519-sha512@openssh.com"
      "curve25519-sha256"
      "curve25519-sha256@libssh.org"
      "diffie-hellman-group-exchange-sha256"
    ]
  else
    null;
''
```

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.settings.LogLevel` {#opt-services.openssh.settings.LogLevel}

Gives the verbosity level that is used when logging messages from `sshd(8)`. Logging with a DEBUG level
violates the privacy of users and is not recommended.

*Type:* null or one of "QUIET", "FATAL", "ERROR", "INFO", "VERBOSE", "DEBUG", "DEBUG1", "DEBUG2", "DEBUG3"

*Default:* `"INFO"`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.settings.Macs` {#opt-services.openssh.settings.Macs}

Allowed MACs

Defaults to a curated set of algorithms.
Set enableRecommendedAlgorithms to false to use upstream's defaults.

*Type:* null or (list of string)

*Default:*

``` nix
''
  if config.services.openssh.enableRecommendedAlgorithms then
    [
      "hmac-sha2-512-etm@openssh.com"
      "hmac-sha2-256-etm@openssh.com"
      "umac-128-etm@openssh.com"
    ]
  else
    null;
''
```

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.settings.ModuliFile` {#opt-services.openssh.settings.ModuliFile}

Specifies the `moduli(5)` file to use for Diffie-Hellman key exchange.

*Type:* absolute path

*Default:* `"${config.services.openssh.package}/etc/ssh/moduli"`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.settings.PasswordAuthentication` {#opt-services.openssh.settings.PasswordAuthentication}

Specifies whether password authentication is allowed.

*Type:* null or boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.settings.PermitRootLogin` {#opt-services.openssh.settings.PermitRootLogin}

Whether the root user can login using ssh.

*Type:* null or one of "yes", "without-password", "prohibit-password", "forced-commands-only", "no"

*Default:* `"prohibit-password"`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.settings.PrintMotd` {#opt-services.openssh.settings.PrintMotd}

Whether to enable printing /etc/motd when a user logs in interactively.

*Type:* null or boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.settings.StrictModes` {#opt-services.openssh.settings.StrictModes}

Whether sshd should check file modes and ownership of directories

*Type:* null or boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.settings.UseDns` {#opt-services.openssh.settings.UseDns}

Specifies whether `sshd(8)` should look up the remote host name, and to check that the resolved host name for
the remote IP address maps back to the very same IP address.
If this option is set to no (the default) then only addresses and not host names may be used in
~/.ssh/authorized\_keys from and sshd\_config Match Host directives.

*Type:* null or boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.settings.UsePAM` {#opt-services.openssh.settings.UsePAM}

Whether to enable PAM authentication.

*Type:* null or boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.settings.X11Forwarding` {#opt-services.openssh.settings.X11Forwarding}

Whether to allow X11 connections to be forwarded.

*Type:* null or boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.sftpFlags` {#opt-services.openssh.sftpFlags}

Commandline flags to add to sftp-server.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-f AUTHPRIV"
  "-l INFO"
]
```

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.sftpServerExecutable` {#opt-services.openssh.sftpServerExecutable}

The sftp server executable.  Can be a path or "internal-sftp" to use
the sftp server built into the sshd binary.

*Type:* string

*Example:* `"internal-sftp"`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.openssh.startWhenNeeded` {#opt-services.openssh.startWhenNeeded}

If set, `sshd` is socket-activated; that
is, instead of having it permanently running as a daemon,
systemd will start an instance for each incoming connection.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `services.opentelemetry-collector.configFile` {#opt-services.opentelemetry-collector.configFile}

Specify a path to a configuration file that Opentelemetry Collector should use.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/opentelemetry-collector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/opentelemetry-collector.nix)

## `services.opentelemetry-collector.enable` {#opt-services.opentelemetry-collector.enable}

Whether to enable Opentelemetry Collector.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/opentelemetry-collector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/opentelemetry-collector.nix)

## `services.opentelemetry-collector.package` {#opt-services.opentelemetry-collector.package}

The opentelemetry-collector package to use.

*Type:* package

*Default:* `pkgs.opentelemetry-collector`

*Declared by:* [`nixos/modules/services/monitoring/opentelemetry-collector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/opentelemetry-collector.nix)

## `services.opentelemetry-collector.settings` {#opt-services.opentelemetry-collector.settings}

Specify the configuration for Opentelemetry Collector in Nix.

See [https://opentelemetry.io/docs/collector/configuration/](https://opentelemetry.io/docs/collector/configuration/) for available options.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/opentelemetry-collector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/opentelemetry-collector.nix)

## `services.opentelemetry-collector.validateConfigFile` {#opt-services.opentelemetry-collector.validateConfigFile}

Whether to enable Validate configuration file.

*Type:* boolean

*Default:* `true` unless `configFile` is a path outside the store

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/opentelemetry-collector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/opentelemetry-collector.nix)

## `services.opentelemetry-collector.validateConfigOverrides` {#opt-services.opentelemetry-collector.validateConfigOverrides}

Property overrides passed to `otelcol validate` as `--set` arguments,
used only for validation and not for the configuration that is
deployed. Use this configuration option if you are relying on confmap
providers like `${file:/path}` and `${env:VAR}` in your setup.

Note: `::` separates path elements, because component names may
themselves contain `.` and `/`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "extensions::bearertokenauth::token=stub"
]
```

*Declared by:* [`nixos/modules/services/monitoring/opentelemetry-collector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/opentelemetry-collector.nix)

## `services.openthread-border-router.backboneInterfaces` {#opt-services.openthread-border-router.backboneInterfaces}

The network interfaces on which to advertise the thread ipv6 mesh prefix. Can be specified multiple times.

*Type:* list of string

*Default:*

``` nix
[
  "eth0"
]
```

*Declared by:* [`nixos/modules/services/home-automation/openthread-border-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/openthread-border-router.nix)

## `services.openthread-border-router.enable` {#opt-services.openthread-border-router.enable}

Whether to enable the OpenThread Border Router.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/openthread-border-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/openthread-border-router.nix)

## `services.openthread-border-router.extraArgs` {#opt-services.openthread-border-router.extraArgs}

Extra arguments to pass to the otbr-agent daemon.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--radio-version"
]
```

*Declared by:* [`nixos/modules/services/home-automation/openthread-border-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/openthread-border-router.nix)

## `services.openthread-border-router.interfaceName` {#opt-services.openthread-border-router.interfaceName}

The network interface to create for thread packets.

*Type:* string

*Default:* `"wpan0"`

*Declared by:* [`nixos/modules/services/home-automation/openthread-border-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/openthread-border-router.nix)

## `services.openthread-border-router.logLevel` {#opt-services.openthread-border-router.logLevel}

The level to use when logging messages.

*Type:* one of "alert", "crit", "debug", "emerg", "err", "info", "notice", "warning"

*Default:* `"err"`

*Declared by:* [`nixos/modules/services/home-automation/openthread-border-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/openthread-border-router.nix)

## `services.openthread-border-router.openFirewall` {#opt-services.openthread-border-router.openFirewall}

Whether to open the firewall for the REST API and web interface ports.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/home-automation/openthread-border-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/openthread-border-router.nix)

## `services.openthread-border-router.package` {#opt-services.openthread-border-router.package}

The openthread-border-router package to use.

*Type:* package

*Default:* `pkgs.openthread-border-router`

*Declared by:* [`nixos/modules/services/home-automation/openthread-border-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/openthread-border-router.nix)

## `services.openthread-border-router.radio.baudRate` {#opt-services.openthread-border-router.radio.baudRate}

The baud rate of the radio device.
Ignored if [`services.openthread-border-router.radio.url`](#opt-services.openthread-border-router.radio.url) is set.

*Type:* positive integer, meaning \>0

*Default:* `115200`

*Declared by:* [`nixos/modules/services/home-automation/openthread-border-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/openthread-border-router.nix)

## `services.openthread-border-router.radio.device` {#opt-services.openthread-border-router.radio.device}

The device name of the serial port of the radio device.
Ignored if [`services.openthread-border-router.radio.url`](#opt-services.openthread-border-router.radio.url) is set.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/home-automation/openthread-border-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/openthread-border-router.nix)

## `services.openthread-border-router.radio.extraDevices` {#opt-services.openthread-border-router.radio.extraDevices}

Extra devices to add to the radio device.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "trel://eth0"
]
```

*Declared by:* [`nixos/modules/services/home-automation/openthread-border-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/openthread-border-router.nix)

## `services.openthread-border-router.radio.flowControl` {#opt-services.openthread-border-router.radio.flowControl}

Enable hardware flow control.
Ignored if [`services.openthread-border-router.radio.url`](#opt-services.openthread-border-router.radio.url) is set.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/home-automation/openthread-border-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/openthread-border-router.nix)

## `services.openthread-border-router.radio.url` {#opt-services.openthread-border-router.radio.url}

The URL of the radio device to use.

*Type:* null or string

*Default:* `null`

*Example:* `"spinel+hdlc+uart:///dev/ttyUSB0?uart-baudrate=460800&uart-flow-control"`

*Declared by:* [`nixos/modules/services/home-automation/openthread-border-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/openthread-border-router.nix)

## `services.openthread-border-router.radio.urlQueryString` {#opt-services.openthread-border-router.radio.urlQueryString}

Extra URL query string parameters.
Ignored if [`services.openthread-border-router.radio.url`](#opt-services.openthread-border-router.radio.url) is set.

*Type:* string

*Default:* `""`

*Example:* `"bus-latency=100&region=ca"`

*Declared by:* [`nixos/modules/services/home-automation/openthread-border-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/openthread-border-router.nix)

## `services.openthread-border-router.rest.listenAddress` {#opt-services.openthread-border-router.rest.listenAddress}

The address on which to listen for REST API requests.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"::"`

*Declared by:* [`nixos/modules/services/home-automation/openthread-border-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/openthread-border-router.nix)

## `services.openthread-border-router.rest.listenPort` {#opt-services.openthread-border-router.rest.listenPort}

The port on which to listen for REST API requests. Warning: the web interface relies on this value being set to 8081.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8081`

*Declared by:* [`nixos/modules/services/home-automation/openthread-border-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/openthread-border-router.nix)

## `services.openthread-border-router.web.enable` {#opt-services.openthread-border-router.web.enable}

Whether to enable the web interface.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/openthread-border-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/openthread-border-router.nix)

## `services.openthread-border-router.web.listenAddress` {#opt-services.openthread-border-router.web.listenAddress}

The address on which the web interface should listen.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"::"`

*Declared by:* [`nixos/modules/services/home-automation/openthread-border-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/openthread-border-router.nix)

## `services.openthread-border-router.web.listenPort` {#opt-services.openthread-border-router.web.listenPort}

The port on which the web interface should listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8082`

*Declared by:* [`nixos/modules/services/home-automation/openthread-border-router.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/openthread-border-router.nix)

## `services.opentracker.enable` {#opt-services.opentracker.enable}

Whether to enable opentracker.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/torrent/opentracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/opentracker.nix)

## `services.opentracker.extraOptions` {#opt-services.opentracker.extraOptions}

Configuration Arguments for opentracker
See [https://erdgeist.org/arts/software/opentracker/](https://erdgeist.org/arts/software/opentracker/) for all params

*Type:* strings concatenated with " "

*Default:* `""`

*Declared by:* [`nixos/modules/services/torrent/opentracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/opentracker.nix)

## `services.opentracker.package` {#opt-services.opentracker.package}

The opentracker package to use.

*Type:* package

*Default:* `pkgs.opentracker`

*Declared by:* [`nixos/modules/services/torrent/opentracker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/opentracker.nix)

## `services.opentsdb.config` {#opt-services.opentsdb.config}

The contents of OpenTSDB's configuration file

*Type:* strings concatenated with "\\n"

*Default:*

``` nix
''
  tsd.core.auto_create_metrics = true
  tsd.http.request.enable_chunked  = true
''
```

*Declared by:* [`nixos/modules/services/databases/opentsdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/opentsdb.nix)

## `services.opentsdb.enable` {#opt-services.opentsdb.enable}

Whether to enable OpenTSDB.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/opentsdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/opentsdb.nix)

## `services.opentsdb.group` {#opt-services.opentsdb.group}

Group account under which OpenTSDB runs.

*Type:* string

*Default:* `"opentsdb"`

*Declared by:* [`nixos/modules/services/databases/opentsdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/opentsdb.nix)

## `services.opentsdb.package` {#opt-services.opentsdb.package}

The opentsdb package to use.

*Type:* package

*Default:* `pkgs.opentsdb`

*Declared by:* [`nixos/modules/services/databases/opentsdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/opentsdb.nix)

## `services.opentsdb.port` {#opt-services.opentsdb.port}

Which port OpenTSDB listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4242`

*Declared by:* [`nixos/modules/services/databases/opentsdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/opentsdb.nix)

## `services.opentsdb.user` {#opt-services.opentsdb.user}

User account under which OpenTSDB runs.

*Type:* string

*Default:* `"opentsdb"`

*Declared by:* [`nixos/modules/services/databases/opentsdb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/opentsdb.nix)

## `services.openvpn.package` {#opt-services.openvpn.package}

The openvpn package to use.

*Type:* package

*Default:* `pkgs.openvpn`

*Declared by:* [`nixos/modules/services/networking/openvpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/openvpn.nix)

## `services.openvpn.restartAfterSleep` {#opt-services.openvpn.restartAfterSleep}

Whether OpenVPN client should be restarted after sleep.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/openvpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/openvpn.nix)

## `services.openvpn.servers` {#opt-services.openvpn.servers}

Each attribute of this option defines a systemd service that
runs an OpenVPN instance.  These can be OpenVPN servers or
clients.  The name of each systemd service is
`openvpn-«name».service`,
where «name» is the corresponding
attribute name.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  server = {
    config = ''
      # Simplest server configuration: https://community.openvpn.net/openvpn/wiki/StaticKeyMiniHowto
      # server :
      dev tun
      ifconfig 10.8.0.1 10.8.0.2
      secret /root/static.key
    '';
    up = "ip route add ...";
    down = "ip route del ...";
  };

  client = {
    config = ''
      client
      remote vpn.example.org
      dev tun
      proto tcp-client
      port 8080
      ca /root/.vpn/ca.crt
      cert /root/.vpn/alice.crt
      key /root/.vpn/alice.key
    '';
    up = "echo nameserver $nameserver | ${pkgs.openresolv}/sbin/resolvconf -m 0 -a $dev";
    down = "${pkgs.openresolv}/sbin/resolvconf -d $dev";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/openvpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/openvpn.nix)

## `services.openvpn.servers.<name>.authUserPass` {#opt-services.openvpn.servers._name_.authUserPass}

This option can be used to store the username / password credentials
with the "auth-user-pass" authentication method.

You can either provide an attribute set of `username` and `password`,
or the path to a file containing the credentials on two lines.

WARNING: If you use an attribute set, this option will put the credentials WORLD-READABLE into the Nix store!

*Type:* null or (optionally newline-terminated) single-line string or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/openvpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/openvpn.nix)

## `services.openvpn.servers.<name>.autoStart` {#opt-services.openvpn.servers._name_.autoStart}

Whether this OpenVPN instance should be started automatically.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/openvpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/openvpn.nix)

## `services.openvpn.servers.<name>.config` {#opt-services.openvpn.servers._name_.config}

Configuration of this OpenVPN instance.  See
`openvpn(8)`
for details.

To import an external config file, use the following definition:
`config = "config /path/to/config.ovpn"`

*Type:* strings concatenated with "\\n"

*Declared by:* [`nixos/modules/services/networking/openvpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/openvpn.nix)

## `services.openvpn.servers.<name>.down` {#opt-services.openvpn.servers._name_.down}

Shell commands executed when the instance is shutting down.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/openvpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/openvpn.nix)

## `services.openvpn.servers.<name>.up` {#opt-services.openvpn.servers._name_.up}

Shell commands executed when the instance is starting.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/openvpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/openvpn.nix)

## `services.openvpn.servers.<name>.updateResolvConf` {#opt-services.openvpn.servers._name_.updateResolvConf}

Use the script from the update-resolv-conf package to automatically
update resolv.conf with the DNS information provided by openvpn. The
script will be run after the "up" commands and before the "down" commands.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/openvpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/openvpn.nix)

## `services.openvscode-server.connectionToken` {#opt-services.openvscode-server.connectionToken}

A secret that must be included with all requests.

*Type:* null or string

*Default:* `null`

*Example:* `"secret-token"`

*Declared by:* [`nixos/modules/services/web-apps/openvscode-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/openvscode-server.nix)

## `services.openvscode-server.connectionTokenFile` {#opt-services.openvscode-server.connectionTokenFile}

Path to a file that contains the connection token.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/openvscode-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/openvscode-server.nix)

## `services.openvscode-server.enable` {#opt-services.openvscode-server.enable}

Whether to enable openvscode-server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/openvscode-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/openvscode-server.nix)

## `services.openvscode-server.extensionsDir` {#opt-services.openvscode-server.extensionsDir}

Set the root path for extensions.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/openvscode-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/openvscode-server.nix)

## `services.openvscode-server.extraArguments` {#opt-services.openvscode-server.extraArguments}

Additional arguments to pass to openvscode-server.

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "--log=info" ]`

*Declared by:* [`nixos/modules/services/web-apps/openvscode-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/openvscode-server.nix)

## `services.openvscode-server.extraEnvironment` {#opt-services.openvscode-server.extraEnvironment}

Additional environment variables to pass to openvscode-server.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  PKG_CONFIG_PATH = "/run/current-system/sw/lib/pkgconfig";
}
```

*Declared by:* [`nixos/modules/services/web-apps/openvscode-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/openvscode-server.nix)

## `services.openvscode-server.extraGroups` {#opt-services.openvscode-server.extraGroups}

An array of additional groups for the `openvscode-server` user.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "docker"
]
```

*Declared by:* [`nixos/modules/services/web-apps/openvscode-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/openvscode-server.nix)

## `services.openvscode-server.extraPackages` {#opt-services.openvscode-server.extraPackages}

Additional packages to add to the openvscode-server `PATH`.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.go ]`

*Declared by:* [`nixos/modules/services/web-apps/openvscode-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/openvscode-server.nix)

## `services.openvscode-server.group` {#opt-services.openvscode-server.group}

The group to run openvscode-server under.
By default, a group named `openvscode-server` will be created.

*Type:* string

*Default:* `"openvscode-server"`

*Example:* `"yourGroup"`

*Declared by:* [`nixos/modules/services/web-apps/openvscode-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/openvscode-server.nix)

## `services.openvscode-server.host` {#opt-services.openvscode-server.host}

The host name or IP address the server should listen to.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/openvscode-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/openvscode-server.nix)

## `services.openvscode-server.package` {#opt-services.openvscode-server.package}

The openvscode-server package to use.

*Type:* package

*Default:* `pkgs.openvscode-server`

*Declared by:* [`nixos/modules/services/web-apps/openvscode-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/openvscode-server.nix)

## `services.openvscode-server.port` {#opt-services.openvscode-server.port}

The port the server should listen to. If 0 is passed a random free port is picked. If a range in the format num-num is passed, a free port from the range (end inclusive) is selected.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/web-apps/openvscode-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/openvscode-server.nix)

## `services.openvscode-server.serverDataDir` {#opt-services.openvscode-server.serverDataDir}

Specifies the directory that server data is kept in.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/openvscode-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/openvscode-server.nix)

## `services.openvscode-server.socketPath` {#opt-services.openvscode-server.socketPath}

The path to a socket file for the server to listen to.

*Type:* null or string

*Default:* `null`

*Example:* `"/run/openvscode/socket"`

*Declared by:* [`nixos/modules/services/web-apps/openvscode-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/openvscode-server.nix)

## `services.openvscode-server.telemetryLevel` {#opt-services.openvscode-server.telemetryLevel}

Sets the initial telemetry level. Valid levels are: 'off', 'crash', 'error' and 'all'.

*Type:* null or one of "off", "crash", "error", "all"

*Default:* `null`

*Example:* `"crash"`

*Declared by:* [`nixos/modules/services/web-apps/openvscode-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/openvscode-server.nix)

## `services.openvscode-server.user` {#opt-services.openvscode-server.user}

The user to run openvscode-server as.
By default, a user named `openvscode-server` will be created.

*Type:* string

*Default:* `"openvscode-server"`

*Example:* `"yourUser"`

*Declared by:* [`nixos/modules/services/web-apps/openvscode-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/openvscode-server.nix)

## `services.openvscode-server.userDataDir` {#opt-services.openvscode-server.userDataDir}

Specifies the directory that user data is kept in. Can be used to open multiple distinct instances of Code.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/openvscode-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/openvscode-server.nix)

## `services.openvscode-server.withoutConnectionToken` {#opt-services.openvscode-server.withoutConnectionToken}

Run without a connection token. Only use this if the connection is secured by other means.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/openvscode-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/openvscode-server.nix)

## `services.openwebrx.enable` {#opt-services.openwebrx.enable}

Whether to enable OpenWebRX Web interface for Software-Defined Radios on http://localhost:8073.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/openwebrx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/openwebrx.nix)

## `services.openwebrx.package` {#opt-services.openwebrx.package}

The openwebrx package to use.

*Type:* package

*Default:* `pkgs.openwebrx`

*Declared by:* [`nixos/modules/services/web-apps/openwebrx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/openwebrx.nix)

## `services.opkssh.authorizations` {#opt-services.opkssh.authorizations}

User authorization mappings

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
# This example refers to values in the providers example
# adjust your expressions as necessary
[
  {
    user = "alice";
    principal = "alice@gmail.com";
    inherit (config.services.opkssh.providers.google) issuer;
  }
  {
    user = "bob";
    principal = "repo:NixOs/nixpkgs:environment:production";
    inherit (config.services.opkssh.providers.github) issuer;
  }
];
```

*Declared by:* [`nixos/modules/services/networking/opkssh/opkssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/opkssh/opkssh.nix)

## `services.opkssh.authorizations.*.issuer` {#opt-services.opkssh.authorizations._.issuer}

Issuer URI

*Type:* string

*Declared by:* [`nixos/modules/services/networking/opkssh/opkssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/opkssh/opkssh.nix)

## `services.opkssh.authorizations.*.principal` {#opt-services.opkssh.authorizations._.principal}

Principal identifier (email, repo, etc.)

*Type:* string

*Declared by:* [`nixos/modules/services/networking/opkssh/opkssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/opkssh/opkssh.nix)

## `services.opkssh.authorizations.*.user` {#opt-services.opkssh.authorizations._.user}

Linux user to authorize

*Type:* string

*Declared by:* [`nixos/modules/services/networking/opkssh/opkssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/opkssh/opkssh.nix)

## `services.opkssh.enable` {#opt-services.opkssh.enable}

Whether to enable OpenID Connect SSH authentication.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/opkssh/opkssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/opkssh/opkssh.nix)

## `services.opkssh.group` {#opt-services.opkssh.group}

System group for opkssh

*Type:* string

*Default:* `"opksshuser"`

*Declared by:* [`nixos/modules/services/networking/opkssh/opkssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/opkssh/opkssh.nix)

## `services.opkssh.package` {#opt-services.opkssh.package}

The opkssh package to use.

*Type:* package

*Default:* `pkgs.opkssh`

*Declared by:* [`nixos/modules/services/networking/opkssh/opkssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/opkssh/opkssh.nix)

## `services.opkssh.providers` {#opt-services.opkssh.providers}

OpenID Connect providers configuration

*Type:* attribute set of (submodule)

*Default:*

``` nix
{
  github = {
    clientId = "github";
    issuer = "https://token.actions.githubusercontent.com";
    lifetime = "oidc";
  };
  google = {
    clientId = "206584157355-7cbe4s640tvm7naoludob4ut1emii7sf.apps.googleusercontent.com";
    issuer = "https://accounts.google.com";
    lifetime = "24h";
  };
  microsoft = {
    clientId = "096ce0a3-5e72-4da8-9c86-12924b294a01";
    issuer = "https://login.microsoftonline.com/9188040d-6c67-4c5b-b112-36a304b66dad/v2.0";
    lifetime = "24h";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/opkssh/opkssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/opkssh/opkssh.nix)

## `services.opkssh.providers.<name>.clientId` {#opt-services.opkssh.providers._name_.clientId}

OAuth client ID

*Type:* string

*Declared by:* [`nixos/modules/services/networking/opkssh/opkssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/opkssh/opkssh.nix)

## `services.opkssh.providers.<name>.issuer` {#opt-services.opkssh.providers._name_.issuer}

Issuer URI

*Type:* string

*Example:* `"https://accounts.google.com"`

*Declared by:* [`nixos/modules/services/networking/opkssh/opkssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/opkssh/opkssh.nix)

## `services.opkssh.providers.<name>.lifetime` {#opt-services.opkssh.providers._name_.lifetime}

Token lifetime

*Type:* one of "12h", "24h", "48h", "1week", "oidc", "oidc-refreshed"

*Default:* `"24h"`

*Declared by:* [`nixos/modules/services/networking/opkssh/opkssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/opkssh/opkssh.nix)

## `services.opkssh.user` {#opt-services.opkssh.user}

System user for running opkssh

*Type:* string

*Default:* `"opksshuser"`

*Declared by:* [`nixos/modules/services/networking/opkssh/opkssh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/opkssh/opkssh.nix)

## `services.orangefs.client.enable` {#opt-services.orangefs.client.enable}

Whether to enable OrangeFS client daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/orangefs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/orangefs/client.nix)

## `services.orangefs.client.extraOptions` {#opt-services.orangefs.client.extraOptions}

Extra command line options for pvfs2-client.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/network-filesystems/orangefs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/orangefs/client.nix)

## `services.orangefs.client.fileSystems` {#opt-services.orangefs.client.fileSystems}

The orangefs file systems to be mounted.
This option is preferred over using [`fileSystems`](../../options/other/index.md#opt-fileSystems) directly since
the pvfs client service needs to be running for it to be mounted.

*Type:* list of (submodule)

*Example:*

``` nix
[
  {
    mountPoint = "/orangefs";
    target = "tcp://server:3334/orangefs";
  }
]
```

*Declared by:* [`nixos/modules/services/network-filesystems/orangefs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/orangefs/client.nix)

## `services.orangefs.client.fileSystems.*.mountPoint` {#opt-services.orangefs.client.fileSystems._.mountPoint}

Mount point.

*Type:* string

*Default:* `"/orangefs"`

*Declared by:* [`nixos/modules/services/network-filesystems/orangefs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/orangefs/client.nix)

## `services.orangefs.client.fileSystems.*.options` {#opt-services.orangefs.client.fileSystems._.options}

Mount options

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/network-filesystems/orangefs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/orangefs/client.nix)

## `services.orangefs.client.fileSystems.*.target` {#opt-services.orangefs.client.fileSystems._.target}

Target URL

*Type:* string

*Example:* `"tcp://server:3334/orangefs"`

*Declared by:* [`nixos/modules/services/network-filesystems/orangefs/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/orangefs/client.nix)

## `services.orangefs.server.BMIModules` {#opt-services.orangefs.server.BMIModules}

List of BMI modules to load.

*Type:* list of string

*Default:*

``` nix
[
  "bmi_tcp"
]
```

*Example:*

``` nix
[
  "bmi_tcp"
  "bmi_ib"
]
```

*Declared by:* [`nixos/modules/services/network-filesystems/orangefs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/orangefs/server.nix)

## `services.orangefs.server.dataStorageSpace` {#opt-services.orangefs.server.dataStorageSpace}

Directory for data storage.

*Type:* null or string

*Default:* `null`

*Example:* `"/data/storage"`

*Declared by:* [`nixos/modules/services/network-filesystems/orangefs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/orangefs/server.nix)

## `services.orangefs.server.enable` {#opt-services.orangefs.server.enable}

Whether to enable OrangeFS server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/orangefs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/orangefs/server.nix)

## `services.orangefs.server.extraConfig` {#opt-services.orangefs.server.extraConfig}

Extra config for the global section.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/network-filesystems/orangefs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/orangefs/server.nix)

## `services.orangefs.server.extraDefaults` {#opt-services.orangefs.server.extraDefaults}

Extra config for `<Defaults>` section.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/network-filesystems/orangefs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/orangefs/server.nix)

## `services.orangefs.server.fileSystems` {#opt-services.orangefs.server.fileSystems}

These options will create the `<FileSystem>` sections of config file.

*Type:* attribute set of (submodule)

*Default:*

``` nix
{
  orangefs = { };
}
```

*Example:*

``` nix
{
  fs1 = {
    id = 101;
  };

  fs2 = {
    id = 102;
  };
}
```

*Declared by:* [`nixos/modules/services/network-filesystems/orangefs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/orangefs/server.nix)

## `services.orangefs.server.fileSystems.<name>.extraConfig` {#opt-services.orangefs.server.fileSystems._name_.extraConfig}

Extra config for `<FileSystem>` section.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/network-filesystems/orangefs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/orangefs/server.nix)

## `services.orangefs.server.fileSystems.<name>.extraStorageHints` {#opt-services.orangefs.server.fileSystems._name_.extraStorageHints}

Extra config for `<StorageHints>` section.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/network-filesystems/orangefs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/orangefs/server.nix)

## `services.orangefs.server.fileSystems.<name>.id` {#opt-services.orangefs.server.fileSystems._name_.id}

File system ID (must be unique within configuration).

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/network-filesystems/orangefs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/orangefs/server.nix)

## `services.orangefs.server.fileSystems.<name>.rootHandle` {#opt-services.orangefs.server.fileSystems._name_.rootHandle}

File system root ID.

*Type:* signed integer

*Default:* `3`

*Declared by:* [`nixos/modules/services/network-filesystems/orangefs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/orangefs/server.nix)

## `services.orangefs.server.fileSystems.<name>.troveSyncData` {#opt-services.orangefs.server.fileSystems._name_.troveSyncData}

Sync data.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/orangefs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/orangefs/server.nix)

## `services.orangefs.server.fileSystems.<name>.troveSyncMeta` {#opt-services.orangefs.server.fileSystems._name_.troveSyncMeta}

Sync meta data.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/orangefs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/orangefs/server.nix)

## `services.orangefs.server.logType` {#opt-services.orangefs.server.logType}

Destination for log messages.

*Type:* one of "file", "syslog"

*Default:* `"syslog"`

*Declared by:* [`nixos/modules/services/network-filesystems/orangefs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/orangefs/server.nix)

## `services.orangefs.server.metadataStorageSpace` {#opt-services.orangefs.server.metadataStorageSpace}

Directory for meta data storage.

*Type:* null or string

*Default:* `null`

*Example:* `"/data/meta"`

*Declared by:* [`nixos/modules/services/network-filesystems/orangefs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/orangefs/server.nix)

## `services.orangefs.server.servers` {#opt-services.orangefs.server.servers}

URLs for storage server including port. The attribute names define the server alias.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  node1 = "tcp://node1:3334";
  node2 = "tcp://node2:3334";
}
```

*Declared by:* [`nixos/modules/services/network-filesystems/orangefs/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/orangefs/server.nix)

## `services.orbit.debug` {#opt-services.orbit.debug}

Enable debug logging.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/orbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/orbit.nix)

## `services.orbit.desktop.alternativeBrowserHost` {#opt-services.orbit.desktop.alternativeBrowserHost}

Alternative host to use for Fleet Desktop browser URLs. This can be
required when Fleet uses TLS client authentication.

*Type:* null or string

*Default:* `null`

*Example:* `"fleet-browser.example.com"`

*Declared by:* [`nixos/modules/services/monitoring/orbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/orbit.nix)

## `services.orbit.desktop.enable` {#opt-services.orbit.desktop.enable}

Whether to enable Fleet Desktop tray application.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/orbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/orbit.nix)

## `services.orbit.desktop.package` {#opt-services.orbit.desktop.package}

The fleet-desktop package to use.

*Type:* package

*Default:* `pkgs.fleet-desktop`

*Declared by:* [`nixos/modules/services/monitoring/orbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/orbit.nix)

## `services.orbit.devMode` {#opt-services.orbit.devMode}

Run Orbit in development mode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/orbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/orbit.nix)

## `services.orbit.enable` {#opt-services.orbit.enable}

Enable the Fleet Orbit agent.

*Type:* boolean

*Default:* `false`

*Example:*

``` nix
# Use an enrollment secret from a plaintext file managed outside the Nix store.
{
  services.orbit = {
    enable = true;
    fleetUrl = "https://fleet.example.com";
    enrollSecretPath = "/etc/fleet/enroll-secret";

    desktop.enable = true;
  };
}

# Use an enrollment secret from sops-nix.
{ config, ... }:
{
  sops.secrets.fleet-orbit-enroll-secret = { };

  services.orbit = {
    enable = true;
    fleetUrl = "https://fleet.example.com";
    enrollSecretPath = config.sops.secrets.fleet-orbit-enroll-secret.path;

    desktop.enable = true;
  };
}
```

*Declared by:* [`nixos/modules/services/monitoring/orbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/orbit.nix)

## `services.orbit.enableScripts` {#opt-services.orbit.enableScripts}

Enable Fleet script execution.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/orbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/orbit.nix)

## `services.orbit.endUserEmail` {#opt-services.orbit.endUserEmail}

End-user email to pass to Orbit.

*Type:* null or string

*Default:* `null`

*Example:* `"user@example.com"`

*Declared by:* [`nixos/modules/services/monitoring/orbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/orbit.nix)

## `services.orbit.enrollSecretPath` {#opt-services.orbit.enrollSecretPath}

Path to a file containing the enroll secret for authenticating to the Fleet server.
This should point to a secret outside the Nix store, for example a sops-nix or agenix
secret path.

*Type:* absolute path

*Example:* `"/run/secrets/fleet-enroll-secret"`

*Declared by:* [`nixos/modules/services/monitoring/orbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/orbit.nix)

## `services.orbit.fleetCertificate` {#opt-services.orbit.fleetCertificate}

Path to the Fleet server certificate chain.

*Type:* absolute path

*Default:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/monitoring/orbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/orbit.nix)

## `services.orbit.fleetManagedHostIdentityCertificate` {#opt-services.orbit.fleetManagedHostIdentityCertificate}

Configure Orbit to use Fleet-managed host identity certificates.
This requires a Fleet Enterprise Edition subscription.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/orbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/orbit.nix)

## `services.orbit.fleetUrl` {#opt-services.orbit.fleetUrl}

The base URL of the Fleet server.

*Type:* string

*Example:* `"https://fleet.example.com"`

*Declared by:* [`nixos/modules/services/monitoring/orbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/orbit.nix)

## `services.orbit.hostIdentifier` {#opt-services.orbit.hostIdentifier}

Host identifier mode to use when Orbit and osquery enroll to Fleet.

*Type:* null or one of "uuid", "instance"

*Default:* `null`

*Example:* `"uuid"`

*Declared by:* [`nixos/modules/services/monitoring/orbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/orbit.nix)

## `services.orbit.insecure` {#opt-services.orbit.insecure}

Disable TLS certificate verification.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/orbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/orbit.nix)

## `services.orbit.orbitPackage` {#opt-services.orbit.orbitPackage}

The fleet-orbit package to use.

*Type:* package

*Default:* `pkgs.fleet-orbit`

*Declared by:* [`nixos/modules/services/monitoring/orbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/orbit.nix)

## `services.orbit.osqueryPackage` {#opt-services.orbit.osqueryPackage}

The osquery package to use.

*Type:* package

*Default:* `pkgs.osquery`

*Declared by:* [`nixos/modules/services/monitoring/orbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/orbit.nix)

## `services.orca.enable` {#opt-services.orca.enable}

Whether to enable Orca screen reader.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/accessibility/orca.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/accessibility/orca.nix)

## `services.orca.package` {#opt-services.orca.package}

The orca package to use.

*Type:* package

*Default:* `pkgs.orca`

*Declared by:* [`nixos/modules/services/accessibility/orca.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/accessibility/orca.nix)

## `services.orthanc.enable` {#opt-services.orthanc.enable}

Whether to enable Orthanc server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/orthanc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/orthanc.nix)

## `services.orthanc.environment` {#opt-services.orthanc.environment}

Extra environment variables
For more details see [https://orthanc.uclouvain.be/book/users/configuration.html](https://orthanc.uclouvain.be/book/users/configuration.html)

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
''
  {
    ORTHANC_NAME = "Orthanc server";
  }
''
```

*Declared by:* [`nixos/modules/services/misc/orthanc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/orthanc.nix)

## `services.orthanc.environmentFile` {#opt-services.orthanc.environmentFile}

Environment file to be passed to the systemd service.
Useful for passing secrets to the service to prevent them from being
world-readable in the Nix store.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/secrets/orthancSecrets"`

*Declared by:* [`nixos/modules/services/misc/orthanc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/orthanc.nix)

## `services.orthanc.openFirewall` {#opt-services.orthanc.openFirewall}

Whether to open the firewall for Orthanc.
This adds `services.orthanc.settings.HttpPort` to `networking.firewall.allowedTCPPorts`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/orthanc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/orthanc.nix)

## `services.orthanc.package` {#opt-services.orthanc.package}

The orthanc package to use.

*Type:* package

*Default:* `pkgs.orthanc`

*Declared by:* [`nixos/modules/services/misc/orthanc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/orthanc.nix)

## `services.orthanc.settings` {#opt-services.orthanc.settings}

Configuration written to a json file that is read by orthanc.
See [https://orthanc.uclouvain.be/book/index.html](https://orthanc.uclouvain.be/book/index.html) for more.

*Type:* open submodule of (JSON value)

*Default:*

``` nix
{
  HttpPort = {
    _type = "override";
    content = 8042;
    priority = 1000;
  };
  IndexDirectory = {
    _type = "override";
    content = "/var/lib/orthanc/";
    priority = 1000;
  };
  StorageDirectory = {
    _type = "override";
    content = "/var/lib/orthanc/";
    priority = 1000;
  };
}
```

*Example:*

``` nix
{
  HttpPort = 12345;
  Name = "My Orthanc Server";
}
```

*Declared by:* [`nixos/modules/services/misc/orthanc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/orthanc.nix)

## `services.orthanc.stateDir` {#opt-services.orthanc.stateDir}

State directory of Orthanc.

*Type:* absolute path

*Default:* `"/var/lib/orthanc"`

*Example:* `"/home/foo"`

*Declared by:* [`nixos/modules/services/misc/orthanc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/orthanc.nix)

## `services.osquery.enable` {#opt-services.osquery.enable}

Whether to enable osqueryd daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/osquery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/osquery.nix)

## `services.osquery.flags` {#opt-services.osquery.flags}

Attribute set of flag names and values to be written to the osqueryd flagfile.
For more information, refer to [https://osquery.readthedocs.io/en/stable/installation/cli-flags](https://osquery.readthedocs.io/en/stable/installation/cli-flags).

*Type:* open submodule of attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  config_refresh = "10";
}
```

*Declared by:* [`nixos/modules/services/monitoring/osquery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/osquery.nix)

## `services.osquery.flags.database_path` {#opt-services.osquery.flags.database_path}

Path used for the database file.

::: {.note}
If left as the default value, this directory will be automatically created before the
service starts, otherwise you are responsible for ensuring the directory exists with
the appropriate ownership and permissions.

*Type:* absolute path

*Default:* `"/var/lib/osquery/osquery.db"`

*Read only*

*Declared by:* [`nixos/modules/services/monitoring/osquery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/osquery.nix)

## `services.osquery.flags.logger_path` {#opt-services.osquery.flags.logger_path}

Base directory used for logging.

::: {.note}
If left as the default value, this directory will be automatically created before the
service starts, otherwise you are responsible for ensuring the directory exists with
the appropriate ownership and permissions.

*Type:* absolute path

*Default:* `"/var/log/osquery"`

*Read only*

*Declared by:* [`nixos/modules/services/monitoring/osquery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/osquery.nix)

## `services.osquery.flags.pidfile` {#opt-services.osquery.flags.pidfile}

Path used for pid file.

*Type:* absolute path

*Default:* `"/run/osquery/osqueryd.pid"`

*Read only*

*Declared by:* [`nixos/modules/services/monitoring/osquery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/osquery.nix)

## `services.osquery.package` {#opt-services.osquery.package}

The osquery package to use.

*Type:* package

*Default:* `pkgs.osquery`

*Declared by:* [`nixos/modules/services/monitoring/osquery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/osquery.nix)

## `services.osquery.settings` {#opt-services.osquery.settings}

Configuration to be written to the osqueryd JSON configuration file.
To understand the configuration format, refer to [https://osquery.readthedocs.io/en/stable/deployment/configuration/#configuration-components](https://osquery.readthedocs.io/en/stable/deployment/configuration/#configuration-components).

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  options = {
    utc = false;
  };
}
```

*Declared by:* [`nixos/modules/services/monitoring/osquery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/osquery.nix)

## `services.osrm.address` {#opt-services.osrm.address}

IP address on which the web server will listen.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/osrm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/osrm.nix)

## `services.osrm.algorithm` {#opt-services.osrm.algorithm}

Algorithm to use for the data. Must be one of CH, CoreCH, MLD

*Type:* one of "CH", "CoreCH", "MLD"

*Default:* `"MLD"`

*Declared by:* [`nixos/modules/services/misc/osrm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/osrm.nix)

## `services.osrm.dataFile` {#opt-services.osrm.dataFile}

Data file location

*Type:* absolute path

*Example:* `"/var/lib/osrm/berlin-latest.osrm"`

*Declared by:* [`nixos/modules/services/misc/osrm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/osrm.nix)

## `services.osrm.enable` {#opt-services.osrm.enable}

Enable the OSRM service.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/osrm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/osrm.nix)

## `services.osrm.extraFlags` {#opt-services.osrm.extraFlags}

Extra command line arguments passed to osrm-routed

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--max-table-size 1000"
  "--max-matching-size 1000"
]
```

*Declared by:* [`nixos/modules/services/misc/osrm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/osrm.nix)

## `services.osrm.port` {#opt-services.osrm.port}

Port on which the web server will run.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5000`

*Declared by:* [`nixos/modules/services/misc/osrm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/osrm.nix)

## `services.osrm.threads` {#opt-services.osrm.threads}

Number of threads to use.

*Type:* signed integer

*Default:* `4`

*Declared by:* [`nixos/modules/services/misc/osrm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/osrm.nix)

## `services.ostinato.enable` {#opt-services.ostinato.enable}

Whether to enable Ostinato agent-controller (Drone).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ostinato.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ostinato.nix)

## `services.ostinato.port` {#opt-services.ostinato.port}

Port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `7878`

*Declared by:* [`nixos/modules/services/networking/ostinato.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ostinato.nix)

## `services.ostinato.portList.exclude` {#opt-services.ostinato.portList.exclude}

A list of ports does not appear on the port list managed by drone.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "usbmon*"
  "eth0"
]
```

*Declared by:* [`nixos/modules/services/networking/ostinato.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ostinato.nix)

## `services.ostinato.portList.include` {#opt-services.ostinato.portList.include}

For a port to pass the filter and appear on the port list managed
by drone, it be allowed by this include list.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "eth*"
  "lo*"
]
```

*Declared by:* [`nixos/modules/services/networking/ostinato.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ostinato.nix)

## `services.ostinato.rateAccuracy` {#opt-services.ostinato.rateAccuracy}

To ensure that the actual transmit rate is as close as possible to
the configured transmit rate, Drone runs a busy-wait loop.
While this provides the maximum accuracy possible, the CPU
utilization is 100% while the transmit is on. You can however,
sacrifice the accuracy to reduce the CPU load.

*Type:* one of "High", "Low"

*Default:* `"High"`

*Declared by:* [`nixos/modules/services/networking/ostinato.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ostinato.nix)

## `services.ostinato.rpcServer.address` {#opt-services.ostinato.rpcServer.address}

By default, the Drone RPC server will listen on all interfaces and
local IPv4 addresses for incoming connections from clients.  Specify
a single IPv4 or IPv6 address if you want to restrict that.
To listen on any IPv6 address, use ::

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/networking/ostinato.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ostinato.nix)

## `services.outline.azureAuthentication` {#opt-services.outline.azureAuthentication}

To configure Microsoft/Azure auth, you'll need to create an OAuth
Client. See
[the guide](https://wiki.generaloutline.com/share/dfa77e56-d4d2-4b51-8ff8-84ea6608faa4)
for details on setting up your Azure App.

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.azureAuthentication.clientId` {#opt-services.outline.azureAuthentication.clientId}

Authentication client identifier.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.azureAuthentication.clientSecretFile` {#opt-services.outline.azureAuthentication.clientSecretFile}

File path containing the authentication secret.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.azureAuthentication.resourceAppId` {#opt-services.outline.azureAuthentication.resourceAppId}

Authentication application resource ID.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.cdnUrl` {#opt-services.outline.cdnUrl}

If using a Cloudfront/Cloudflare distribution or similar it can be set
using this option. This will cause paths to JavaScript files,
stylesheets and images to be updated to the hostname defined here. In
your CDN configuration the origin server should be set to public URL.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.concurrency` {#opt-services.outline.concurrency}

How many processes should be spawned. For a rough estimate, divide your
server's available memory by 512.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.databaseUrl` {#opt-services.outline.databaseUrl}

URI to use for the main PostgreSQL database. If this needs to include
credentials that shouldn't be world-readable in the Nix store, set an
environment file on the systemd service and override the
`DATABASE_URL` entry. Pass the string
`local` to setup a database on the local server.

*Type:* string

*Default:* `"local"`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.debugOutput` {#opt-services.outline.debugOutput}

Set this to `http` log HTTP requests.

*Type:* null or value "http" (singular enum)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.defaultLanguage` {#opt-services.outline.defaultLanguage}

The default interface language. See
[translate.getoutline.com](https://translate.getoutline.com/)
for a list of available language codes and their rough percentage
translated.

*Type:* one of "da\_DK", "de\_DE", "en\_US", "es\_ES", "fa\_IR", "fr\_FR", "it\_IT", "ja\_JP", "ko\_KR", "nl\_NL", "pl\_PL", "pt\_BR", "pt\_PT", "ru\_RU", "sv\_SE", "th\_TH", "vi\_VN", "zh\_CN", "zh\_TW"

*Default:* `"en_US"`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.discordAuthentication` {#opt-services.outline.discordAuthentication}

To configure Discord auth, you'll need to create an application at
[https://discord.com/developers/applications/](https://discord.com/developers/applications/)

See [https://docs.getoutline.com/s/hosting/doc/discord-g4JdWFFub6](https://docs.getoutline.com/s/hosting/doc/discord-g4JdWFFub6)
for details on setting up your Discord app.

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.discordAuthentication.clientId` {#opt-services.outline.discordAuthentication.clientId}

Authentication client identifier.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.discordAuthentication.clientSecretFile` {#opt-services.outline.discordAuthentication.clientSecretFile}

File path containing the authentication secret.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.discordAuthentication.serverId` {#opt-services.outline.discordAuthentication.serverId}

Restrict logins to a specific server (optional, but recommended).
You can find a Discord server's ID by right-clicking the server icon,
and select “Copy Server ID”.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.discordAuthentication.serverRoles` {#opt-services.outline.discordAuthentication.serverRoles}

Optionally restrict logins to a comma-separated list of role IDs

*Type:* strings concatenated with ","

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.enable` {#opt-services.outline.enable}

Whether to enable outline.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.enableUpdateCheck` {#opt-services.outline.enableUpdateCheck}

Have the installation check for updates by sending anonymized statistics
to the maintainers.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.forceHttps` {#opt-services.outline.forceHttps}

Auto-redirect to HTTPS in production. The default is
`true` but you may set this to `false`
if you can be sure that SSL is terminated at an external loadbalancer.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.googleAnalyticsId` {#opt-services.outline.googleAnalyticsId}

Optionally enable Google Analytics to track page views in the knowledge
base.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.googleAuthentication` {#opt-services.outline.googleAuthentication}

To configure Google auth, you'll need to create an OAuth Client ID at
[https://console.cloud.google.com/apis/credentials](https://console.cloud.google.com/apis/credentials)

When configuring the Client ID, add an Authorized redirect URI to
`https://[publicUrl]/auth/google.callback`.

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.googleAuthentication.clientId` {#opt-services.outline.googleAuthentication.clientId}

Authentication client identifier.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.googleAuthentication.clientSecretFile` {#opt-services.outline.googleAuthentication.clientSecretFile}

File path containing the authentication secret.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.group` {#opt-services.outline.group}

Group under which the service should run. If this is the default value,
the group will be created.

*Type:* string

*Default:* `"outline"`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.logo` {#opt-services.outline.logo}

Custom logo displayed on the authentication screen. This will be scaled
to a height of 60px.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.maximumImportSize` {#opt-services.outline.maximumImportSize}

The maximum size of document imports. Overriding this could be required
if you have especially large Word documents with embedded imagery.

*Type:* signed integer

*Default:* `5120000`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.oidcAuthentication` {#opt-services.outline.oidcAuthentication}

To configure generic OIDC auth, you'll need some kind of identity
provider. See the documentation for whichever IdP you use to fill out
all the fields. The redirect URL is
`https://[publicUrl]/auth/oidc.callback`.

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.oidcAuthentication.authUrl` {#opt-services.outline.oidcAuthentication.authUrl}

OIDC authentication URL endpoint.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.oidcAuthentication.clientId` {#opt-services.outline.oidcAuthentication.clientId}

Authentication client identifier.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.oidcAuthentication.clientSecretFile` {#opt-services.outline.oidcAuthentication.clientSecretFile}

File path containing the authentication secret.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.oidcAuthentication.displayName` {#opt-services.outline.oidcAuthentication.displayName}

Display name for OIDC authentication.

*Type:* string

*Default:* `"OpenID"`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.oidcAuthentication.scopes` {#opt-services.outline.oidcAuthentication.scopes}

OpenID authentication scopes.

*Type:* list of string

*Default:*

``` nix
[
  "openid"
  "profile"
  "email"
]
```

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.oidcAuthentication.tokenUrl` {#opt-services.outline.oidcAuthentication.tokenUrl}

OIDC token URL endpoint.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.oidcAuthentication.userinfoUrl` {#opt-services.outline.oidcAuthentication.userinfoUrl}

OIDC userinfo URL endpoint.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.oidcAuthentication.usernameClaim` {#opt-services.outline.oidcAuthentication.usernameClaim}

Specify which claims to derive user information from. Supports any
valid JSON path with the JWT payload

*Type:* string

*Default:* `"preferred_username"`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.package` {#opt-services.outline.package}

Outline package to use.

*Type:* package

*Default:* `pkgs.outline`

*Example:*

``` nix
pkgs.outline.overrideAttrs (super: {
  # Ignore the domain part in emails that come from OIDC. This is might
  # be helpful if you want multiple users with different email providers
  # to still land in the same team. Note that this effectively makes
  # Outline a single-team instance.
  patchPhase = ''
    sed -i 's/const domain = parts\.length && parts\[1\];/const domain = "example.com";/g' plugins/oidc/server/auth/oidc.ts
  '';
})
```

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.port` {#opt-services.outline.port}

Listening port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.publicUrl` {#opt-services.outline.publicUrl}

The fully qualified, publicly accessible URL

*Type:* string

*Default:* `"http://localhost:3000"`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.rateLimiter.durationWindow` {#opt-services.outline.rateLimiter.durationWindow}

Length of a throttling window.

*Type:* signed integer

*Default:* `60`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.rateLimiter.enable` {#opt-services.outline.rateLimiter.enable}

Whether to enable rate limiter for the application web server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.rateLimiter.requests` {#opt-services.outline.rateLimiter.requests}

Maximum number of requests in a throttling window.

*Type:* signed integer

*Default:* `5000`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.redisUrl` {#opt-services.outline.redisUrl}

Connection to a redis server. If this needs to include credentials
that shouldn't be world-readable in the Nix store, set an environment
file on the systemd service and override the
`REDIS_URL` entry. Pass the string
`local` to setup a local Redis database.

*Type:* string

*Default:* `"local"`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.secretKeyFile` {#opt-services.outline.secretKeyFile}

File path that contains the application secret key. It must be 32
bytes long and hex-encoded. If the file does not exist, a new key will
be generated and saved here.

*Type:* string

*Default:* `"/var/lib/outline/secret_key"`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.sentryDsn` {#opt-services.outline.sentryDsn}

Optionally enable [Sentry](https://sentry.io/) to
track errors and performance.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.sentryTunnel` {#opt-services.outline.sentryTunnel}

Optionally add a
[Sentry proxy tunnel](https://docs.sentry.io/platforms/javascript/troubleshooting/#using-the-tunnel-option)
for bypassing ad blockers in the UI.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.slackAuthentication` {#opt-services.outline.slackAuthentication}

To configure Slack auth, you'll need to create an Application at
[https://api.slack.com/apps](https://api.slack.com/apps)

When configuring the Client ID, add a redirect URL under "OAuth & Permissions"
to `https://[publicUrl]/auth/slack.callback`.

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.slackAuthentication.clientId` {#opt-services.outline.slackAuthentication.clientId}

Authentication key.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.slackAuthentication.secretFile` {#opt-services.outline.slackAuthentication.secretFile}

File path containing the authentication secret.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.slackIntegration` {#opt-services.outline.slackIntegration}

For a complete Slack integration with search and posting to channels
this configuration is also needed. See here for details:
[https://wiki.generaloutline.com/share/be25efd1-b3ef-4450-b8e5-c4a4fc11e02a](https://wiki.generaloutline.com/share/be25efd1-b3ef-4450-b8e5-c4a4fc11e02a)

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.slackIntegration.appId` {#opt-services.outline.slackIntegration.appId}

Application ID.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.slackIntegration.messageActions` {#opt-services.outline.slackIntegration.messageActions}

Whether to enable message actions.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.slackIntegration.verificationTokenFile` {#opt-services.outline.slackIntegration.verificationTokenFile}

File path containing the verification token.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.smtp` {#opt-services.outline.smtp}

To support sending outgoing transactional emails such as
"document updated" or "you've been invited" you'll need to provide
authentication for an SMTP server.

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.smtp.fromEmail` {#opt-services.outline.smtp.fromEmail}

Sender email in outgoing mail.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.smtp.host` {#opt-services.outline.smtp.host}

Host name or IP address of the SMTP server.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.smtp.passwordFile` {#opt-services.outline.smtp.passwordFile}

File path containing the password to authenticate with.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.smtp.port` {#opt-services.outline.smtp.port}

TCP port of the SMTP server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.smtp.replyEmail` {#opt-services.outline.smtp.replyEmail}

Reply address in outgoing mail.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.smtp.secure` {#opt-services.outline.smtp.secure}

Use a secure SMTP connection.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.smtp.tlsCiphers` {#opt-services.outline.smtp.tlsCiphers}

Override SMTP cipher configuration.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.smtp.username` {#opt-services.outline.smtp.username}

Username to authenticate with.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.sslCertFile` {#opt-services.outline.sslCertFile}

File path that contains the Base64-encoded certificate for HTTPS
termination. This is only required if you do not use an external reverse
proxy. See
[the documentation](https://wiki.generaloutline.com/share/dfa77e56-d4d2-4b51-8ff8-84ea6608faa4).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.sslKeyFile` {#opt-services.outline.sslKeyFile}

File path that contains the Base64-encoded private key for HTTPS
termination. This is only required if you do not use an external reverse
proxy. See
[the documentation](https://wiki.generaloutline.com/share/dfa77e56-d4d2-4b51-8ff8-84ea6608faa4).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.storage` {#opt-services.outline.storage}

To support uploading of images for avatars and document attachments an
s3-compatible storage can be provided. AWS S3 is recommended for
redundancy however if you want to keep all file storage local an
alternative such as [garage](https://garagehq.deuxfleurs.fr/)
can be used.
Local filesystem storage can also be used.

A more detailed guide on setting up storage is available
[here](https://docs.getoutline.com/s/hosting/doc/file-storage-N4M0T6Ypu7).

*Type:* submodule

*Example:*

``` nix
{
  accessKey = "...";
  secretKeyFile = "/somewhere";
  uploadBucketUrl = "https://garage.example.com";
  uploadBucketName = "outline";
  region = "us-east-1";
}
```

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.storage.accelerateUrl` {#opt-services.outline.storage.accelerateUrl}

URL for AWS S3 [transfer acceleration](https://docs.aws.amazon.com/AmazonS3/latest/userguide/transfer-acceleration.html).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.storage.accessKey` {#opt-services.outline.storage.accessKey}

S3 access key.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.storage.acl` {#opt-services.outline.storage.acl}

ACL setting.

*Type:* string

*Default:* `"private"`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.storage.forcePathStyle` {#opt-services.outline.storage.forcePathStyle}

Force S3 path style.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.storage.localRootDir` {#opt-services.outline.storage.localRootDir}

If `storageType` is `local`, this sets the parent directory
under which all attachments/images go.

*Type:* string

*Default:* `"/var/lib/outline/data"`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.storage.region` {#opt-services.outline.storage.region}

AWS S3 region name.

*Type:* string

*Default:* `"xx-xxxx-x"`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.storage.secretKeyFile` {#opt-services.outline.storage.secretKeyFile}

File path that contains the S3 secret key.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.storage.storageType` {#opt-services.outline.storage.storageType}

File storage type, it can be local or s3.

*Type:* one of "local", "s3"

*Default:* `"s3"`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.storage.uploadBucketName` {#opt-services.outline.storage.uploadBucketName}

Name of the bucket where uploads should be stored.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.storage.uploadBucketUrl` {#opt-services.outline.storage.uploadBucketUrl}

URL endpoint of an S3-compatible API where uploads should be
stored.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.storage.uploadMaxSize` {#opt-services.outline.storage.uploadMaxSize}

Maxmium file size for uploads.

*Type:* signed integer

*Default:* `26214400`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.user` {#opt-services.outline.user}

User under which the service should run. If this is the default value,
the user will be created, with the specified group as the primary
group.

*Type:* string

*Default:* `"outline"`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.outline.utilsSecretFile` {#opt-services.outline.utilsSecretFile}

File path that contains the utility secret key. If the file does not
exist, a new key will be generated and saved here.

*Type:* string

*Default:* `"/var/lib/outline/utils_secret"`

*Declared by:* [`nixos/modules/services/web-apps/outline.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/outline.nix)

## `services.owamp.enable` {#opt-services.owamp.enable}

Whether to enable OWAMP server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/owamp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/owamp.nix)

## `services.owncast.dataDir` {#opt-services.owncast.dataDir}

The directory where owncast stores its data files. If left as the default value this directory will automatically be created before the owncast server starts, otherwise the sysadmin is responsible for ensuring the directory exists with appropriate ownership and permissions.

*Type:* string

*Default:* `"/var/lib/owncast"`

*Declared by:* [`nixos/modules/services/misc/owncast.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/owncast.nix)

## `services.owncast.enable` {#opt-services.owncast.enable}

Whether to enable owncast, a video live streaming solution.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/owncast.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/owncast.nix)

## `services.owncast.group` {#opt-services.owncast.group}

Group under which owncast runs.

*Type:* string

*Default:* `"owncast"`

*Declared by:* [`nixos/modules/services/misc/owncast.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/owncast.nix)

## `services.owncast.listen` {#opt-services.owncast.listen}

The IP address to bind the owncast web server to.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/owncast.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/owncast.nix)

## `services.owncast.openFirewall` {#opt-services.owncast.openFirewall}

Open the appropriate ports in the firewall for owncast.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/owncast.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/owncast.nix)

## `services.owncast.port` {#opt-services.owncast.port}

TCP port where owncast web-gui listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/misc/owncast.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/owncast.nix)

## `services.owncast.rtmp-port` {#opt-services.owncast.rtmp-port}

TCP port where owncast rtmp service listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1935`

*Declared by:* [`nixos/modules/services/misc/owncast.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/owncast.nix)

## `services.owncast.user` {#opt-services.owncast.user}

User account under which owncast runs.

*Type:* string

*Default:* `"owncast"`

*Declared by:* [`nixos/modules/services/misc/owncast.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/owncast.nix)

## `services.oxidized.configFile` {#opt-services.oxidized.configFile}

Path to the system-wide oxidized configuration file.

This file will be symlinked to `/etc/oxidized/config`.

This option is mutually exclusive with [`services.oxidized.settings`](#opt-services.oxidized.settings).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/admin/oxidized.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/oxidized.nix)

## `services.oxidized.dataDir` {#opt-services.oxidized.dataDir}

State directory for the oxidized service.

*Type:* absolute path

*Default:* `"/var/lib/oxidized"`

*Declared by:* [`nixos/modules/services/admin/oxidized.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/oxidized.nix)

## `services.oxidized.enable` {#opt-services.oxidized.enable}

Whether to enable the oxidized configuration backup service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/admin/oxidized.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/oxidized.nix)

## `services.oxidized.group` {#opt-services.oxidized.group}

Group under which the oxidized service runs.

*Type:* string

*Default:* `"oxidized"`

*Declared by:* [`nixos/modules/services/admin/oxidized.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/oxidized.nix)

## `services.oxidized.package` {#opt-services.oxidized.package}

The oxidized package to use.

*Type:* package

*Default:* `pkgs.oxidized`

*Declared by:* [`nixos/modules/services/admin/oxidized.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/oxidized.nix)

## `services.oxidized.routerDB` {#opt-services.oxidized.routerDB}

Path to the file/database which contains the targets for oxidized.

*Type:* null or absolute path

*Default:* `null`

*Example:*

``` nix
pkgs.writeText "oxidized-router.db" ''
  hostname-sw1:powerconnect:username1:password2
  hostname-sw2:procurve:username2:password2
  # ... additional hosts
''
```

*Declared by:* [`nixos/modules/services/admin/oxidized.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/oxidized.nix)

## `services.oxidized.settings` {#opt-services.oxidized.settings}

[Oxidized configuration](https://github.com/ytti/oxidized/blob/master/docs/Configuration.md) as a Nix attribute set installed at
`/etc/oxidized/config`.

The resulting configuration file resides in the `/nix/store`. Pass
secret values via [`services.oxidized.userConfigFile`](#opt-services.oxidized.userConfigFile) instead.

This option is mutually exclusive with `services.oxidied.configFile`.

::: note
Ruby-specific YAML tags can be passed as a quoted string. The config
renderer will unquote tags starting with `!ruby/` in both keys and values.
:::

*Type:* null or YAML 1.1 value

*Default:* `null`

*Example:*

``` nix
{
  debug = true;
  extensions = {
    oxidized-web = {
      listen = "127.0.0.1";
      load = true;
      port = 8888;
      vhosts = [
        "localhost"
        "127.0.0.1"
        "oxidized.example.com"
      ];
    };
  };
  input = {
    default = "ssh";
    ssh = {
      secure = true;
    };
  };
  interval = 3600;
  model_map = {
    cisco = "ios";
    dell = "powerconnect";
    hp = "procurve";
    juniper = "junos";
  };
  pid = "/var/lib/oxidized/.config/oxidized/pid";
  retries = 3;
  source = {
    csv = {
      delimiter = "!ruby/regexp /:/";
      file = "/var/lib/oxidized/.config/oxidized/router.db";
      map = {
        model = 1;
        name = 0;
        password = 3;
        username = 2;
      };
    };
    default = "csv";
  };
  use_syslog = true;
}
```

*Declared by:* [`nixos/modules/services/admin/oxidized.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/oxidized.nix)

## `services.oxidized.user` {#opt-services.oxidized.user}

User under which the oxidized service runs.

*Type:* string

*Default:* `"oxidized"`

*Declared by:* [`nixos/modules/services/admin/oxidized.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/oxidized.nix)

## `services.oxidized.userConfigFile` {#opt-services.oxidized.userConfigFile}

Path to the per-user oxidized configuration file.

This file will be symlinked to `/var/lib/oxidized/.config/oxidized/config`.

This config file is merged on top of the system-wide configuration file.
which makes it suitable for passing secrets.

*Type:* null or path not in the Nix store

*Default:* `null`

*Example:* `"/run/keys/oxidized"`

*Declared by:* [`nixos/modules/services/admin/oxidized.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/oxidized.nix)
