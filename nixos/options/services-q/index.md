# services (Q) {#sec-options-services-q}

## `services.qbit-manage.commands` {#opt-services.qbit-manage.commands}

The commands that you want qbm to execute.
See [https://github.com/StuffAnThings/qbit\_manage/wiki/Commands](https://github.com/StuffAnThings/qbit_manage/wiki/Commands) for more information.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.commands.catUpdate` {#opt-services.qbit-manage.commands.catUpdate}

Whether to update your categories.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.commands.recheck` {#opt-services.qbit-manage.commands.recheck}

Whether to recheck paused torrents sorted by lowest size. Resume if Completed.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.commands.remOrphaned` {#opt-services.qbit-manage.commands.remOrphaned}

Whether to remove orphaned files from your 'root\_dir' directory that are not referenced by any torrents.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.commands.remUnregistered` {#opt-services.qbit-manage.commands.remUnregistered}

Whether to remove unregistered torrents.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.commands.schedule` {#opt-services.qbit-manage.commands.schedule}

Schedule to run every x minutes. If not set it will only run once then exit.

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.commands.shareLimits` {#opt-services.qbit-manage.commands.shareLimits}

Whether to control how torrent share limits are set depending on the priority of your grouping.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.commands.skipCleanup` {#opt-services.qbit-manage.commands.skipCleanup}

Whether to skip emptying the recycle Bin folder and Orphaned directory.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.commands.startupDelay` {#opt-services.qbit-manage.commands.startupDelay}

Set delay in seconds on the first run of a schedule

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.commands.tagNoHardLinks` {#opt-services.qbit-manage.commands.tagNoHardLinks}

Whether to tag torrents where the largest file does not have any hardlinks associated with any of the files outside of your qbit-manage root directory.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.commands.tagTrackerError` {#opt-services.qbit-manage.commands.tagTrackerError}

Whether to tag torrents that do not have a working tracker.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.commands.tagUpdate` {#opt-services.qbit-manage.commands.tagUpdate}

Whether to update your tags and/or set seed goals/limit upload speed by tag.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.enable` {#opt-services.qbit-manage.enable}

Whether to enable qbit-manage.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.environmentFile` {#opt-services.qbit-manage.environmentFile}

Path to an environment file to load environment variables from.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.extraArgs` {#opt-services.qbit-manage.extraArgs}

Extra command line arguments to pass to qbit-manage.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.group` {#opt-services.qbit-manage.group}

Group under which qbit-manage runs.

*Type:* string

*Default:* `"qbit-manage"`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.package` {#opt-services.qbit-manage.package}

The qbit-manage package to use.

*Type:* package

*Default:* `pkgs.qbit-manage`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.settings` {#opt-services.qbit-manage.settings}

qbit-manage configuration. Will be translated into YAML.
For environment variable support, use '!ENV VAR\_NAME' as the value.
See [https://github.com/StuffAnThings/qbit\_manage/wiki/Config-Setup](https://github.com/StuffAnThings/qbit_manage/wiki/Config-Setup) for more information.

Leave unset to configure without nix.

*Type:* null or (open submodule of (YAML 1.1 value))

*Default:* `null`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.settings.cat` {#opt-services.qbit-manage.settings.cat}

A mapping of categories and their associated paths.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  sonarr = "/downloads/completed/sonarr";
  radaarr = "/downloads/completed/radaarr";
}
```

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.settings.directory` {#opt-services.qbit-manage.settings.directory}

This section defines the directories that qbit-manage will be looking into for various parts of the script.

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.settings.directory.orphaned_dir` {#opt-services.qbit-manage.settings.directory.orphaned_dir}

Path of the Orphaned Directory folder.
All files in this folder will be cleaned up based on your orphaned data settings.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.settings.directory.recycle_bin` {#opt-services.qbit-manage.settings.directory.recycle_bin}

Path of the RecycleBin folder.
All files in this folder will be cleaned up based on your recycle bin settings.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.settings.directory.root_dir` {#opt-services.qbit-manage.settings.directory.root_dir}

Root downloads directory where you place all your downloads.
Used to check for orphaned files, hard links, and unregistered torrents.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.settings.directory.torrents_dir` {#opt-services.qbit-manage.settings.directory.torrents_dir}

Path of the qBittorrent BT\_backup directory.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.settings.qbt` {#opt-services.qbit-manage.settings.qbt}

This section defines your qBittorrent instance

*Type:* submodule

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.settings.qbt.host` {#opt-services.qbit-manage.settings.qbt.host}

IP address of your qBittorrent installation.

*Type:* string

*Default:* `"localhost:\${config.services.qbittorrent.webuiPort}"`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.settings.qbt.pass` {#opt-services.qbit-manage.settings.qbt.pass}

The password of your qBbittorrent webUI.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.settings.qbt.user` {#opt-services.qbit-manage.settings.qbt.user}

The user name of your qBittorrent webUI.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.settings.tracker` {#opt-services.qbit-manage.settings.tracker}

Tags based upon the tracker's URL.

*Type:* attribute set of (submodule)

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.settings.tracker.<name>.cat` {#opt-services.qbit-manage.settings.tracker._name_.cat}

Set the category based on tracker URL.
This category option takes priority over the category defined in cat.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.settings.tracker.<name>.notifiarr` {#opt-services.qbit-manage.settings.tracker._name_.notifiarr}

Set this to the notifiarr react name.
This is used to add indexer reactions to the notifications sent by Notifiarr.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.settings.tracker.<name>.tag` {#opt-services.qbit-manage.settings.tracker._name_.tag}

The tracker tag or additional list of tags.

*Type:* string or list of string

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.user` {#opt-services.qbit-manage.user}

User account under which qbit-manage runs.

*Type:* string

*Default:* `"qbit-manage"`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.webServer` {#opt-services.qbit-manage.webServer}

Web server configuration.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.webServer.baseURL` {#opt-services.qbit-manage.webServer.baseURL}

Base URL path for the web UI (e.g., '/qbit-manage').

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.webServer.enable` {#opt-services.qbit-manage.webServer.enable}

Whether to enable Enable the web server..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.webServer.host` {#opt-services.qbit-manage.webServer.host}

Hostname for the web server.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.webServer.openFirewall` {#opt-services.qbit-manage.webServer.openFirewall}

Whether to enable Open the firewall for webUI..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbit-manage.webServer.port` {#opt-services.qbit-manage.webServer.port}

Port number for the web server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8181`

*Declared by:* [`nixos/modules/services/torrent/qbit-manage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbit-manage.nix)

## `services.qbittorrent.configFile` {#opt-services.qbittorrent.configFile}

Path to a `qBittorrent.conf` file to use instead of the one generated from the [`services.qbittorrent.serverConfig`](#opt-services.qbittorrent.serverConfig) option.
Note that this configuration file cannot be strictly enforced, since it needs to be writable by qBittorrent.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/torrent/qbittorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbittorrent.nix)

## `services.qbittorrent.enable` {#opt-services.qbittorrent.enable}

Whether to enable qbittorrent, BitTorrent client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/torrent/qbittorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbittorrent.nix)

## `services.qbittorrent.extraArgs` {#opt-services.qbittorrent.extraArgs}

Extra arguments passed to qbittorrent. See `qbittorrent -h`, or the [source code](https://github.com/qbittorrent/qBittorrent/blob/master/src/app/cmdoptions.cpp), for the available arguments.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--confirm-legal-notice"
]
```

*Declared by:* [`nixos/modules/services/torrent/qbittorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbittorrent.nix)

## `services.qbittorrent.group` {#opt-services.qbittorrent.group}

Group under which qbittorrent runs.

*Type:* string

*Default:* `"qbittorrent"`

*Declared by:* [`nixos/modules/services/torrent/qbittorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbittorrent.nix)

## `services.qbittorrent.openFirewall` {#opt-services.qbittorrent.openFirewall}

Whether to enable opening both the webuiPort and torrentPort over TCP in the firewall.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/torrent/qbittorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbittorrent.nix)

## `services.qbittorrent.package` {#opt-services.qbittorrent.package}

The qbittorrent-nox package to use.

*Type:* package

*Default:* `pkgs.qbittorrent-nox`

*Declared by:* [`nixos/modules/services/torrent/qbittorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbittorrent.nix)

## `services.qbittorrent.profileDir` {#opt-services.qbittorrent.profileDir}

The path passed to qbittorrent via --profile.
Please note that the resulting systemd service will be run with some very strict security controls,
such as `ProtectHome=yes`, `PrivateUsers=true`, and `ProtectSystem=full` among others, so you cannot specify
a profileDir in your home directory. See [this bug report](https://github.com/NixOS/nixpkgs/issues/514206) for further info.

*Type:* absolute path

*Default:* `"/var/lib/qBittorrent"`

*Declared by:* [`nixos/modules/services/torrent/qbittorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbittorrent.nix)

## `services.qbittorrent.serverConfig` {#opt-services.qbittorrent.serverConfig}

Free-form settings mapped to the `qBittorrent.conf` file in the profile.
Refer to [Explanation-of-Options-in-qBittorrent](https://github.com/qbittorrent/qBittorrent/wiki/Explanation-of-Options-in-qBittorrent).
The Password\_PBKDF2 format is oddly unique, you will likely want to use [this tool](https://codeberg.org/feathecutie/qbittorrent_password) to generate the format.
Alternatively you can run qBittorrent independently first and use its webUI to generate the format.

Optionally an alternative webUI can be easily set. VueTorrent for example:

``` nix
{
  Preferences = {
    WebUI = {
      AlternativeUIEnabled = true;
      RootFolder = "${pkgs.vuetorrent}/share/vuetorrent";
    };
  };
}
];
```

*Type:* open submodule of attribute set of attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  LegalNotice.Accepted = true;
  Preferences = {
    WebUI = {
      Username = "user";
      Password_PBKDF2 = "generated ByteArray.";
    };
    General.Locale = "en";
  };
}
```

*Declared by:* [`nixos/modules/services/torrent/qbittorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbittorrent.nix)

## `services.qbittorrent.torrentingPort` {#opt-services.qbittorrent.torrentingPort}

the port passed to qbittorrent via `--torrenting-port`

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/torrent/qbittorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbittorrent.nix)

## `services.qbittorrent.user` {#opt-services.qbittorrent.user}

User account under which qbittorrent runs.

*Type:* string

*Default:* `"qbittorrent"`

*Declared by:* [`nixos/modules/services/torrent/qbittorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbittorrent.nix)

## `services.qbittorrent.webuiPort` {#opt-services.qbittorrent.webuiPort}

the port passed to qbittorrent via `--webui-port`

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/torrent/qbittorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qbittorrent.nix)

## `services.qdrant.enable` {#opt-services.qdrant.enable}

Whether to enable Vector Search Engine for the next generation of AI applications.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/search/qdrant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/qdrant.nix)

## `services.qdrant.package` {#opt-services.qdrant.package}

The qdrant package to use.

*Type:* package

*Default:* `pkgs.qdrant`

*Declared by:* [`nixos/modules/services/search/qdrant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/qdrant.nix)

## `services.qdrant.settings` {#opt-services.qdrant.settings}

Configuration for Qdrant
Refer to [https://github.com/qdrant/qdrant/blob/master/config/config.yaml](https://github.com/qdrant/qdrant/blob/master/config/config.yaml) for details on supported values.

*Type:* YAML 1.1 value

*Default:*

``` nix
{
  storage = {
    storage_path = "/var/lib/qdrant/storage";
    snapshots_path = "/var/lib/qdrant/snapshots";
  };
  hsnw_index = {
    on_disk = true;
  };
  service = {
    host = "127.0.0.1";
    http_port = 6333;
    grpc_port = 6334;
  };
  telemetry_disabled = true;
}
```

*Example:*

``` nix
{
  hsnw_index = {
    on_disk = true;
  };
  service = {
    grpc_port = 6334;
    host = "127.0.0.1";
    http_port = 6333;
  };
  storage = {
    snapshots_path = "/var/lib/qdrant/snapshots";
    storage_path = "/var/lib/qdrant/storage";
  };
  telemetry_disabled = true;
}
```

*Declared by:* [`nixos/modules/services/search/qdrant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/qdrant.nix)

## `services.qdrant.webUIPackage` {#opt-services.qdrant.webUIPackage}

The qdrant-web-ui package to use.

*Type:* package

*Default:* `pkgs.qdrant-web-ui`

*Declared by:* [`nixos/modules/services/search/qdrant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/qdrant.nix)

## `services.qemuGuest.enable` {#opt-services.qemuGuest.enable}

Whether to enable the qemu guest agent.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/qemu-guest-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-guest-agent.nix)

## `services.qemuGuest.package` {#opt-services.qemuGuest.package}

The ga package to use.

*Type:* package

*Default:* `pkgs.qemu_kvm.ga`

*Declared by:* [`nixos/modules/virtualisation/qemu-guest-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-guest-agent.nix)

## `services.quake3-server.baseq3` {#opt-services.quake3-server.baseq3}

Path to the baseq3 files (pak\*.pk3). If this is on the nix store (type = package) all .pk3 files should be saved
in the top-level directory. If this is on another filesystem (e.g /var/lib/baseq3) the .pk3 files are searched in
$baseq3/.q3a/baseq3/

*Type:* package or absolute path

*Default:* Manually downloaded Quake 3 installation directory.

*Example:* `"/var/lib/q3ds"`

*Declared by:* [`nixos/modules/services/games/quake3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/quake3-server.nix)

## `services.quake3-server.enable` {#opt-services.quake3-server.enable}

Whether to enable Quake 3 dedicated server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/games/quake3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/quake3-server.nix)

## `services.quake3-server.extraConfig` {#opt-services.quake3-server.extraConfig}

Extra configuration lines appended after `settings`, for anything
that isn't a plain persisted cvar: map-rotation scripts, `exec`,
`vstr`, aliases, or cvars that need `set`/`sets`/`sett`/`setu`
instead of `seta`. Note that options changed via RCON will not be
persisted. To list all possible options, use "cvarlist 1" via RCON.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  // map rotation and other things that don't map onto plain cvars
  set d1 "map q3dm1 ; set nextmap vstr d2"
  set d2 "map q3dm7 ; set nextmap vstr d1"
  vstr d1
  
  // rarely needed: cvars with a non-seta flag
  sets sv_privatePassword "hidden"
''
```

*Declared by:* [`nixos/modules/services/games/quake3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/quake3-server.nix)

## `services.quake3-server.openFirewall` {#opt-services.quake3-server.openFirewall}

Open the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/quake3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/quake3-server.nix)

## `services.quake3-server.package` {#opt-services.quake3-server.package}

The ioquake3 package to use.

*Type:* package

*Default:* `pkgs.ioquake3`

*Declared by:* [`nixos/modules/services/games/quake3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/quake3-server.nix)

## `services.quake3-server.settings` {#opt-services.quake3-server.settings}

Quake 3 cvars set via `seta` on server start (i.e. persisted,
archive-flagged cvars – the vast majority of server settings).
Note that options changed via RCON will not be persisted. To list
all possible options, use "cvarlist 1" via RCON.

*Type:* open submodule of attribute set of (null or string or boolean or signed integer or floating point number or 16 bit unsigned integer; between 0 and 65535 (both inclusive))

*Default:* `{ }`

*Example:*

``` nix
{
  g_gametype = 0;
  sv_hostname = "My Quake 3 server";
  sv_pure = true;
}
```

*Declared by:* [`nixos/modules/services/games/quake3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/quake3-server.nix)

## `services.quake3-server.settings.net_port` {#opt-services.quake3-server.settings.net_port}

UDP port for the dedicated server to bind to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `27960`

*Declared by:* [`nixos/modules/services/games/quake3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/quake3-server.nix)

## `services.quassel.certificateFile` {#opt-services.quassel.certificateFile}

Path to the certificate used for SSL connections with clients.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/quassel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/quassel.nix)

## `services.quassel.dataDir` {#opt-services.quassel.dataDir}

The directory holding configuration files, the SQlite database and the SSL Cert.

*Type:* string

*Default:*

``` nix
"/home/${config.services.quassel.user}/.config/quassel-irc.org"
```

*Declared by:* [`nixos/modules/services/networking/quassel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/quassel.nix)

## `services.quassel.enable` {#opt-services.quassel.enable}

Whether to enable the Quassel IRC client daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/quassel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/quassel.nix)

## `services.quassel.interfaces` {#opt-services.quassel.interfaces}

The interfaces the Quassel daemon will be listening to.  If `[ 127.0.0.1 ]`,
only clients on the local host can connect to it; if `[ 0.0.0.0 ]`, clients
can access it from any network interface.

*Type:* list of string

*Default:*

``` nix
[
  "127.0.0.1"
]
```

*Declared by:* [`nixos/modules/services/networking/quassel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/quassel.nix)

## `services.quassel.package` {#opt-services.quassel.package}

The quasselDaemon package to use.

*Type:* package

*Default:* `pkgs.quasselDaemon`

*Declared by:* [`nixos/modules/services/networking/quassel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/quassel.nix)

## `services.quassel.portNumber` {#opt-services.quassel.portNumber}

The port number the Quassel daemon will be listening to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4242`

*Declared by:* [`nixos/modules/services/networking/quassel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/quassel.nix)

## `services.quassel.requireSSL` {#opt-services.quassel.requireSSL}

Require SSL for connections from clients.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/quassel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/quassel.nix)

## `services.quassel.user` {#opt-services.quassel.user}

The existing user the Quassel daemon should run as. If left empty, a default "quassel" user will be created.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/quassel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/quassel.nix)

## `services.qui.enable` {#opt-services.qui.enable}

Whether to enable qui.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/torrent/qui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qui.nix)

## `services.qui.group` {#opt-services.qui.group}

Group to run qui as.

*Type:* string

*Default:* `"qui"`

*Example:* `"torrents"`

*Declared by:* [`nixos/modules/services/torrent/qui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qui.nix)

## `services.qui.openFirewall` {#opt-services.qui.openFirewall}

Whether or not to open ports in the firewall for qui.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/torrent/qui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qui.nix)

## `services.qui.package` {#opt-services.qui.package}

The qui package to use.

*Type:* package

*Default:* `pkgs.qui`

*Declared by:* [`nixos/modules/services/torrent/qui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qui.nix)

## `services.qui.secretFile` {#opt-services.qui.secretFile}

Path to a file that contains the session secret. The session secret
can be generated with `openssl rand -hex 32`.

*Type:* absolute path

*Example:* `"/run/secrets/qui-session.txt"`

*Declared by:* [`nixos/modules/services/torrent/qui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qui.nix)

## `services.qui.settings` {#opt-services.qui.settings}

qui configuration options.

Refer to the [template config](https://github.com/autobrr/qui/blob/main/internal/config/config.go)
in the source code for the available options.
The documentation contains the available [environment variables](https://getqui.com/docs/configuration/environment/),
this can be used to get an overview.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Example:*

``` nix
{
  logLevel = "DEBUG";
  metricsEnabled = true;
  port = 7777;
}
```

*Declared by:* [`nixos/modules/services/torrent/qui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qui.nix)

## `services.qui.settings.host` {#opt-services.qui.settings.host}

The host address qui listens on.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/torrent/qui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qui.nix)

## `services.qui.settings.port` {#opt-services.qui.settings.port}

The port qui listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `7476`

*Declared by:* [`nixos/modules/services/torrent/qui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qui.nix)

## `services.qui.user` {#opt-services.qui.user}

User to run qui as.

*Type:* string

*Default:* `"qui"`

*Declared by:* [`nixos/modules/services/torrent/qui.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/qui.nix)

## `services.quicktun` {#opt-services.quicktun}

QuickTun tunnels.

See [http://wiki.ucis.nl/QuickTun](http://wiki.ucis.nl/QuickTun) for more information about available options.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/quicktun.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/quicktun.nix)

## `services.quicktun.<name>.localAddress` {#opt-services.quicktun._name_.localAddress}

IP address or hostname of the local end.

*Type:* null or string

*Default:* `null`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/networking/quicktun.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/quicktun.nix)

## `services.quicktun.<name>.localPort` {#opt-services.quicktun._name_.localPort}

Local UDP port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `2998`

*Declared by:* [`nixos/modules/services/networking/quicktun.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/quicktun.nix)

## `services.quicktun.<name>.privateKey` {#opt-services.quicktun._name_.privateKey}

Local secret key in hexadecimal form.

::: warning
This option is deprecated. Please use `services.quicktun.<name>.privateKeyFile` instead.
:::

::: note
Not needed when `services.quicktun.<name>.protocol` is set to `raw`.
:::

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/quicktun.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/quicktun.nix)

## `services.quicktun.<name>.privateKeyFile` {#opt-services.quicktun._name_.privateKeyFile}

Path to file containing local secret key in binary or hexadecimal form.

::: note
Not needed when `services.quicktun.<name>.protocol` is set to `raw`.
:::

*Type:* null or absolute path

*Default:* `"null"`

*Declared by:* [`nixos/modules/services/networking/quicktun.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/quicktun.nix)

## `services.quicktun.<name>.protocol` {#opt-services.quicktun._name_.protocol}

Which protocol to use.

*Type:* one of "raw", "nacl0", "nacltai", "salty"

*Default:* `"nacltai"`

*Declared by:* [`nixos/modules/services/networking/quicktun.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/quicktun.nix)

## `services.quicktun.<name>.publicKey` {#opt-services.quicktun._name_.publicKey}

Remote public key in hexadecimal form.

::: note
Not needed when `services.quicktun.<name>.protocol` is set to `raw`.
:::

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/quicktun.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/quicktun.nix)

## `services.quicktun.<name>.remoteAddress` {#opt-services.quicktun._name_.remoteAddress}

IP address or hostname of the remote end (use `0.0.0.0` for a floating/dynamic remote endpoint).

*Type:* string

*Default:* `"0.0.0.0"`

*Example:* `"tunnel.example.com"`

*Declared by:* [`nixos/modules/services/networking/quicktun.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/quicktun.nix)

## `services.quicktun.<name>.remoteFloat` {#opt-services.quicktun._name_.remoteFloat}

Whether to allow the remote address and port to change when properly encrypted packets are received.

*Type:* integer between 0 and 1 (both inclusive) or boolean convertible to it

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/quicktun.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/quicktun.nix)

## `services.quicktun.<name>.remotePort` {#opt-services.quicktun._name_.remotePort}

Remote UDP port

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `config.services.quicktun.<name>.localPort`

*Declared by:* [`nixos/modules/services/networking/quicktun.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/quicktun.nix)

## `services.quicktun.<name>.timeWindow` {#opt-services.quicktun._name_.timeWindow}

Allowed time window for first received packet in seconds (positive number allows packets from history)

*Type:* unsigned integer, meaning \>=0

*Default:* `5`

*Declared by:* [`nixos/modules/services/networking/quicktun.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/quicktun.nix)

## `services.quicktun.<name>.tunMode` {#opt-services.quicktun._name_.tunMode}

Whether to operate in tun (IP) or tap (Ethernet) mode.

*Type:* integer between 0 and 1 (both inclusive) or boolean convertible to it

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/quicktun.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/quicktun.nix)

## `services.quicktun.<name>.upScript` {#opt-services.quicktun._name_.upScript}

Run specified command or script after the tunnel device has been opened.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/quicktun.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/quicktun.nix)

## `services.quickwit.dataDir` {#opt-services.quickwit.dataDir}

Data directory for Quickwit. If you change this, you need to
manually create the directory. You also need to create the
`quickwit` user and group, or change
[services (Q)](#opt-services.quickwit.user) and
[services (Q)](#opt-services.quickwit.group) to existing ones with
access to the directory.

*Type:* absolute path

*Default:* `"/var/lib/quickwit"`

*Declared by:* [`nixos/modules/services/search/quickwit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/quickwit.nix)

## `services.quickwit.enable` {#opt-services.quickwit.enable}

Whether to enable Quickwit.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/search/quickwit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/quickwit.nix)

## `services.quickwit.extraFlags` {#opt-services.quickwit.extraFlags}

Extra command line options to pass to Quickwit.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/search/quickwit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/quickwit.nix)

## `services.quickwit.group` {#opt-services.quickwit.group}

The group quickwit runs as. Should be left at default unless
you have very specific needs.

*Type:* string

*Default:* `"quickwit"`

*Declared by:* [`nixos/modules/services/search/quickwit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/quickwit.nix)

## `services.quickwit.package` {#opt-services.quickwit.package}

The Quickwit package to use.

*Type:* package

*Default:* `pkgs.quickwit`

*Declared by:* [`nixos/modules/services/search/quickwit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/quickwit.nix)

## `services.quickwit.restartIfChanged` {#opt-services.quickwit.restartIfChanged}

Automatically restart the service on config change.
This can be set to false to defer restarts on a server or cluster.
Please consider the security implications of inadvertently running an older version,
and the possibility of unexpected behavior caused by inconsistent versions across a cluster when disabling this option.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/search/quickwit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/quickwit.nix)

## `services.quickwit.settings` {#opt-services.quickwit.settings}

Quickwit configuration.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/search/quickwit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/quickwit.nix)

## `services.quickwit.settings.grpc_listen_port` {#opt-services.quickwit.settings.grpc_listen_port}

The port to listen on for gRPC traffic.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `7281`

*Declared by:* [`nixos/modules/services/search/quickwit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/quickwit.nix)

## `services.quickwit.settings.listen_address` {#opt-services.quickwit.settings.listen_address}

Listen address of Quickwit.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/search/quickwit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/quickwit.nix)

## `services.quickwit.settings.rest` {#opt-services.quickwit.settings.rest}

Rest server configuration for Quickwit

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/search/quickwit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/quickwit.nix)

## `services.quickwit.settings.rest.listen_port` {#opt-services.quickwit.settings.rest.listen_port}

The port to listen on for HTTP REST traffic.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `7280`

*Declared by:* [`nixos/modules/services/search/quickwit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/quickwit.nix)

## `services.quickwit.settings.version` {#opt-services.quickwit.settings.version}

Configuration file version.

*Type:* floating point number

*Default:* `0.7`

*Declared by:* [`nixos/modules/services/search/quickwit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/quickwit.nix)

## `services.quickwit.user` {#opt-services.quickwit.user}

The user Quickwit runs as. Should be left at default unless
you have very specific needs.

*Type:* string

*Default:* `"quickwit"`

*Declared by:* [`nixos/modules/services/search/quickwit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/quickwit.nix)
