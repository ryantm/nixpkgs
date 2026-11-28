# Jellystat {#module-services-jellystat}

[Jellystat](https://github.com/CyferShepard/Jellystat) is a free and open source statistics and analytics application for Jellyfin servers.

## Quickstart {#module-services-jellystat-quickstart}

``` nix
{
  services.jellystat = {
    enable = true;
    openFirewall = true;
    secretFiles.JWT_SECRET = "/run/secrets/jellystat-jwt";
  };
}
```

This configuration creates a local PostgreSQL database named `jellystat`. Jellystat connects to it over the Unix socket in `/run/postgresql` with peer authentication, so no database password is needed.

Open `http://<host>:3000` and create the first user, which becomes the administrator.

## Configuration {#module-services-jellystat-configuration}

[`services.jellystat.settings`](../../options/services-j/index.md#opt-services.jellystat.settings) maps directly onto the [environment variables](https://github.com/CyferShepard/Jellystat#environmental-variables) documented upstream.
The module defines the common variables with types and defaults. Any other variable can be added as a string, integer or boolean:

``` nix
{
  services.jellystat.settings = {
    TZ = "Australia/Brisbane";
    JS_BASE_URL = "/jellystat";
  };
}
```

## Secrets {#module-services-jellystat-secrets}

[`services.jellystat.secretFiles`](../../options/services-j/index.md#opt-services.jellystat.secretFiles) maps environment variable names to files.
The module passes each file to the service with systemd `LoadCredential=` and exports its contents at startup, so secrets never enter the Nix store.
This works with secret-management tools such as sops-nix or agenix.

[`services.jellystat.secretFiles.JWT_SECRET`](../../options/services-j/index.md#opt-services.jellystat.secretFiles.JWT_SECRET) is required. Add other secrets the same way:

``` nix
{
  services.jellystat = {
    settings.JS_GEOLITE_ACCOUNT_ID = "123456";
    secretFiles.JS_GEOLITE_LICENSE_KEY = "/run/secrets/geolite-license-key";
  };
}
```

## External PostgreSQL {#module-services-jellystat-external-database}

``` nix
{
  services.jellystat = {
    enable = true;
    database.createLocally = false;

    settings = {
      POSTGRES_IP = "db.example.com";
      POSTGRES_USER = "jellystat";
      POSTGRES_SSL_ENABLED = true;
    };

    secretFiles = {
      JWT_SECRET = "/run/secrets/jellystat-jwt";
      POSTGRES_PASSWORD = "/run/secrets/jellystat-db-password";
    };
  };
}
```

[`services.jellystat.secretFiles.POSTGRES_PASSWORD`](../../options/services-j/index.md#opt-services.jellystat.secretFiles.POSTGRES_PASSWORD) is required when [`services.jellystat.database.createLocally`](../../options/services-j/index.md#opt-services.jellystat.database.createLocally) is disabled.

## Directories {#module-services-jellystat-paths}

By default, Jellystat stores its state in `/var/lib/jellystat`:

- `/var/lib/jellystat/backups`, set as `JS_BACKUP_DIR`
- `/var/lib/jellystat/env`, set as `JS_ENV_DIR`

Change the location with [`services.jellystat.dataDir`](../../options/services-j/index.md#opt-services.jellystat.dataDir).
The module creates the directories automatically: through `StateDirectory=` below `/var/lib`, and through systemd-tmpfiles anywhere else.

## Troubleshooting {#module-services-jellystat-troubleshooting}

``` ShellSession
systemctl status jellystat.service
journalctl -u jellystat.service
```
